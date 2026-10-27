#!/usr/bin/env python3
"""Export the original H08 case text to a LOCAL blind human-review sheet."""
import csv
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "reports/h08_stats_error/ERROR_PILOT_BLIND.tsv"
TARGET = ROOT / "reports/human_review/HUMAN_REVIEW_BLIND.tsv"
FIELDS = ("case_id", "text_clean", "interpretability", "best_label",
          "alternate_label", "label_confidence", "primary_mechanism",
          "challenge_tags", "rationale", "reviewer_notes")

def main():
    if not SOURCE.is_file():
        raise SystemExit("ERROR: first reconstruct H08 locally; the blind queue is missing.")
    with SOURCE.open(encoding="utf-8", newline="") as stream:
        rows = list(csv.DictReader(stream, delimiter="\t"))
    if len(rows) != 64 or len({row.get("case_id") for row in rows}) != 64:
        raise SystemExit("ERROR: expected exactly 64 unique H08 cases.")
    if any(not row.get("text_clean", "").strip() for row in rows):
        raise SystemExit("ERROR: missing text in the H08 queue.")
    TARGET.parent.mkdir(parents=True, exist_ok=True)
    with TARGET.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        for row in rows:
            writer.writerow({"case_id": row["case_id"], "text_clean": row["text_clean"]})
    print(f"PASS: {len(rows)} blind cases exported to {TARGET}")
    print("The file excludes the corpus gold labels and model predictions; keep it private.")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
