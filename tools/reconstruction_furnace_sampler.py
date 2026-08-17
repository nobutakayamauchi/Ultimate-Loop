#!/usr/bin/env python3
"""Deterministically select blind SWE-bench-Live/MultiLang tasks.

This program deliberately strips historical-answer fields before writing any
solver-facing manifest. The official evaluator remains responsible for scoring.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import random
from pathlib import Path
from typing import Any

from datasets import load_dataset

DATASET = "SWE-bench-Live/MultiLang"
DEFAULT_SPLITS = ["c", "cpp", "go", "rust", "java", "ts", "js", "cs"]
DEFAULT_DENY = {"cilium__tetragon-4069"}
FORCED_FIRST = "rsyslog__rsyslog-6047"

# Never serialize these to a solver-facing artifact.
FORBIDDEN_OUTPUT_FIELDS = {
    "patch",
    "test_patch",
    "pull_number",
    "commit_url",
    "commit_urls",
    "hints_text",
    "all_hints_text",
    "FAIL_TO_PASS",
    "PASS_TO_PASS",
}

SAFE_FIELDS = (
    "instance_id",
    "repo",
    "issue_numbers",
    "base_commit",
    "problem_statement",
    "docker_image",
    "rebuild_cmds",
    "test_cmds",
    "print_cmds",
    "log_parser",
    "created_at",
)


def safe_row(row: dict[str, Any], split: str) -> dict[str, Any]:
    out = {"language_split": split}
    for key in SAFE_FIELDS:
        if key in row:
            out[key] = row[key]
    leaked = FORBIDDEN_OUTPUT_FIELDS.intersection(out)
    if leaked:
        raise RuntimeError(f"blind-boundary violation: {sorted(leaked)}")
    return out


def stable_rank(seed: str, instance_id: str) -> str:
    return hashlib.sha256(f"{seed}\0{instance_id}".encode()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--count", type=int, default=10)
    parser.add_argument("--seed", default="UL-RF-0001-A")
    parser.add_argument("--output", default="batch_a_blind_manifest.json")
    parser.add_argument("--deny", action="append", default=[])
    parser.add_argument("--no-forced-first", action="store_true")
    args = parser.parse_args()

    if args.count < 1:
        raise SystemExit("--count must be positive")

    deny = DEFAULT_DENY.union(args.deny)
    split_rows: dict[str, list[dict[str, Any]]] = {}
    fingerprints: dict[str, str | None] = {}

    for split in DEFAULT_SPLITS:
        ds = load_dataset(DATASET, split=split)
        fingerprints[split] = getattr(ds, "_fingerprint", None)
        rows = []
        for row in ds:
            iid = row.get("instance_id")
            if not iid or iid in deny:
                continue
            rows.append(row)
        rows.sort(key=lambda r: stable_rank(args.seed, r["instance_id"]))
        split_rows[split] = rows

    selected: list[tuple[str, dict[str, Any]]] = []
    used_ids: set[str] = set()
    used_repos: set[str] = set()

    if not args.no_forced_first:
        for split, rows in split_rows.items():
            hit = next((r for r in rows if r["instance_id"] == FORCED_FIRST), None)
            if hit is not None:
                selected.append((split, hit))
                used_ids.add(hit["instance_id"])
                used_repos.add(hit.get("repo", ""))
                break

    # First pass: language coverage, preferring distinct repositories.
    for split in DEFAULT_SPLITS:
        if len(selected) >= args.count:
            break
        for row in split_rows[split]:
            iid = row["instance_id"]
            repo = row.get("repo", "")
            if iid in used_ids or repo in used_repos:
                continue
            selected.append((split, row))
            used_ids.add(iid)
            used_repos.add(repo)
            break

    # Second pass: fill remaining slots deterministically across all splits.
    pool: list[tuple[str, dict[str, Any]]] = []
    for split, rows in split_rows.items():
        for row in rows:
            if row["instance_id"] not in used_ids:
                pool.append((split, row))
    pool.sort(key=lambda item: stable_rank(args.seed + ":fill", item[1]["instance_id"]))

    for split, row in pool:
        if len(selected) >= args.count:
            break
        repo = row.get("repo", "")
        if repo in used_repos:
            continue
        selected.append((split, row))
        used_ids.add(row["instance_id"])
        used_repos.add(repo)

    # If the dataset cannot provide enough distinct repos, relax only that rule.
    if len(selected) < args.count:
        for split, row in pool:
            if len(selected) >= args.count:
                break
            if row["instance_id"] in used_ids:
                continue
            selected.append((split, row))
            used_ids.add(row["instance_id"])

    if len(selected) != args.count:
        raise RuntimeError(f"selected {len(selected)} tasks, expected {args.count}")

    manifest = {
        "experiment": "Ultimate Loop Reconstruction Furnace",
        "run_id": "UL-RF-0001",
        "batch": "A",
        "dataset": DATASET,
        "seed": args.seed,
        "count": args.count,
        "denylist": sorted(deny),
        "dataset_fingerprints": fingerprints,
        "blind_contract": {
            "gold_patch_visible": False,
            "test_patch_visible": False,
            "solution_pr_visible": False,
            "solution_commit_visible": False,
        },
        "tasks": [safe_row(row, split) for split, row in selected],
    }

    raw = json.dumps(manifest, ensure_ascii=False, indent=2, default=str)
    for field in FORBIDDEN_OUTPUT_FIELDS:
        # Structural guard: forbidden field names must not occur as JSON keys.
        if f'"{field}"' in raw:
            raise RuntimeError(f"forbidden solver-facing field serialized: {field}")

    output = Path(args.output)
    output.write_text(raw + "\n", encoding="utf-8")
    print(f"wrote {len(selected)} blind tasks to {output}")
    for index, task in enumerate(manifest["tasks"], 1):
        print(f"{index:02d} {task['language_split']:>4} {task['instance_id']}")


if __name__ == "__main__":
    main()
