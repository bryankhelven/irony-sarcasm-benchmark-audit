#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export ARTIFACT_ROOT="$ROOT"
MODE="${1:-quick}"
echo "ERCEMAPI 2026 research artifact | mode=$MODE | root=$ROOT"
case "$MODE" in
quick)
  python "$ROOT/scripts/artifact_doctor.py"
  python "$ROOT/scripts/check_typography.py" "$ROOT"
  python "$ROOT/scripts/verify_predictions.py"
  ;;
sparse)
  python "$ROOT/scripts/fetch_internal_data.py"
  TRAIN="$ROOT/data/raw/kaggle_tweets_sarcasm_irony/3b278d7767d6/train.csv"
  TEST="$ROOT/data/raw/kaggle_tweets_sarcasm_irony/3b278d7767d6/test.csv"
  if [[ ! -f "$TRAIN" || ! -f "$TEST" ]]; then
    echo "ERROR: pinned dataset files unavailable" >&2; exit 1
  fi
  python "$ROOT/src/h03_reproduce_tcc.py" --project "$ROOT"
  python "$ROOT/src/h04_forensic_audit.py" --project "$ROOT"
  python "$ROOT/src/h05_build_grouped_clean.py"
  python "$ROOT/src/h06_sparse_baselines.py"
  ;;
neural) python "$ROOT/src/h07_bertweet.py" ;;
stats) python "$ROOT/src/h08_stats_error.py" ;;
external)
  python "$ROOT/src/h10_prepare_external.py"
  python "$ROOT/src/h10_eval_sparse.py"
  python "$ROOT/src/h10_eval_bertweet.py"
  python "$ROOT/src/h10_analyze.py"
  ;;
all)
  bash "$0" sparse
  bash "$0" neural
  bash "$0" stats
  bash "$0" external
  ;;
*) echo "ERROR: unknown mode $MODE. Use quick|sparse|neural|stats|external|all" >&2; exit 2 ;;
esac
echo "STAGE PASS: $MODE"
