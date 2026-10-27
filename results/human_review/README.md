# Human qualitative review of the 64 H08 cases

The public file [H08_HUMAN_ANNOTATIONS_PUBLIC.tsv](H08_HUMAN_ANNOTATIONS_PUBLIC.tsv) records the completed **single-reviewer human assessment** of the deterministic H08 error-enriched sample, identified as cases E001--E064. It was transcribed from the completed local workbook `ERCEMAPI_H08_64_casos_revisada(2).xlsx`.

## Public fields
- `case_id`: stable E001--E064 case identifier for joining to the local H08 case key.
- `interpretability`: CLEAR_FROM_TEXT, CONTEXT_DEPENDENT, or OPAQUE_FRAGMENT.
- `preferred_label`: IRONY, SARCASM, REGULAR, or UNCERTAIN.
- `alternative_label`: optional second reading or NONE.
- `confidence`: HIGH, MEDIUM, or LOW.
- `primary_mechanism`: main assigned linguistic/pragmatic mechanism.
- `challenge_tags`: zero or more semicolon-separated tags.

There are **64 unique cases**. Preferred labels: **22 UNCERTAIN, 17 SARCASM, 13 REGULAR, 12 IRONY**. Interpretability: **40 CLEAR_FROM_TEXT, 21 CONTEXT_DEPENDENT, 3 OPAQUE_FRAGMENT**. Label and interpretability are different annotation dimensions; their counts are not mutually exclusive across dimensions.

## Provenance and reproducibility
The selection procedure is frozen in [H08_STATS_ERROR_SPEC_v1.0.md](../../protocols/H08_STATS_ERROR_SPEC_v1.0.md), and implemented in [h08_stats_error.py](../../src/h08_stats_error.py). Cases were sampled deterministically (seed 20260902) from misclassifications by S2 A-C and BERTweet A-C seed 42, with up to eight cases per model for each of four confusion directions, followed by ID deduplication. The [local blind review export script](../../scripts/export_human_review.py) produces a text-bearing sheet **without original gold labels or model predictions**. The complete human review uses one reviewer; it is not an inter-annotator agreement study, and frequencies from this error-enriched sample do not estimate corpus-wide label noise.

## Redistribution boundary
The **public TSV intentionally excludes tweet texts**, original dataset labels, prediction labels, source tweet identifiers, and free-text rationales that quote or closely reproduce posts. The private source workbook and local H08 artifacts retain the text and explanatory notes for authorized local verification. The public case ID alone is not a Twitter/X post ID and cannot rehydrate a post. No original tweets are redistributed in this repository.
