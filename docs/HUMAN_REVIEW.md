# Independent human review of 64 difficult cases

The H08 error-enriched pilot comprises **64 preselected cases**. The historical automated pilot used two replicate Claude Haiku passes, **not two independent human annotators**. No human review is yet claimed.

## Independent blind procedure

1. Reconstruct the pinned source dataset and generate the H08 error queue locally.
2. Run `python scripts/export_human_review.py` to generate `reports/human_review/HUMAN_REVIEW_BLIND.tsv`.
3. Give each human reviewer a private independent copy with `case_id` and `text_clean`; keep gold labels, predictions, source model, error stratum and automatic assessments hidden.
4. For every case annotate `interpretability`, `best_label`, `alternate_label`, `label_confidence`, `primary_mechanism`, `challenge_tags` and a single text-grounded rationale of at most 30 words.
5. Archive completed blind decisions **before** unblinding. Report inter-rater agreement when more than one human performs independent annotation.
6. Adjudicate disagreements transparently and retain the original 64 case IDs and model outputs.

## Codebook

Interpretability: `CLEAR_FROM_TEXT` (tweet suffices), `CONTEXT_DEPENDENT` (external knowledge/conversation needed), `OPAQUE_FRAGMENT` (fragmentary or uninterpretable).

Preferred label: `IRONY` (incongruity, situational/self-directed reversal), `SARCASM` (salient mocking or derisive target), `REGULAR` (no clear figurative reading), `UNCERTAIN` (insufficient evidence).

Alternate: `IRONY`, `SARCASM`, `REGULAR`, `NONE`. Confidence: `HIGH`, `MEDIUM`, `LOW`.

Primary mechanism: `REVERSAL_MOCK_PRAISE`, `INCONGRUITY_CONTRADICTION`, `RHETORICAL_QUESTION`, `HYPERBOLE_UNDERSTATEMENT`, `ECHOIC_QUOTED_STANCE`, `SELF_DIRECTED`, `WORDPLAY_HUMOR`, `LITERAL_NO_CLEAR_FIGURATIVE_CUE`, `OPAQUE_OTHER`.

Optional challenge tags: `CONTEXT_WORLD_KNOWLEDGE`, `IRONY_SARCASM_BOUNDARY`, `FIGURATIVE_REGULAR_BOUNDARY`, `QUOTATION_ATTRIBUTION`, `HASHTAG_META_CUE`, `URL_USER_RT_NOISE`, `EVENT_TOPIC_DEPENDENCY`, `FRAGMENT_OR_CORRUPTION`.

## Interpretation and data access

The sample is intentionally enriched for model errors, so annotation frequencies are **not estimates of corpus-wide label noise**. Human annotation does not automatically replace the frozen gold labels or original benchmark metrics.

The text-bearing sheet stays **local/private**, outside the public Git repository. Only research code, numerical predictions, reproducibility evidence, protocols and hashes are publicly committed.
