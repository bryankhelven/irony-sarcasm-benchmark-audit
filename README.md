# When the Label Is in the Text

**Dataset Artifacts and Robust Evaluation of Irony and Sarcasm Classification**

Public research artifact accompanying the paper **accepted at ERCEMAPI 2026** (XIV Escola Regional de Computacao do Ceara, Maranhao e Piaui).

**Authors**
- **Itagiba de Albuquerque Neto:** ICMC, University of Sao Paulo (USP); Federal University of Campina Grande (UFCG). itagiba.net@gmail.com
- **Bryan K. S. Barbosa:** ICMC/USP; Interinstitutional Center for Computational Linguistics (NILC); Instituto Atlantico. bryankhelven@ieee.org

The final proceedings DOI and published bibliographic record are pending. Software citation metadata are in [CITATION.cff](CITATION.cff).

## Scope and provenance

The study audits the **Kaggle redistribution** `nikhiljohnk/tweets-with-sarcasm-and-irony` of English tweets. Its relationship to the original Ling and Klinger (2016) resource cannot be reconstructed item by item because the distributed files lack source tweet IDs. The marker-leakage findings refer to **this Kaggle snapshot**, not the original authors' feature extraction pipeline.

The protocol evaluates explicit collection markers, residual structural cues, sparse versus contextual representations, group-purged near-duplicate sensitivity, and transfer to TweetEval without adaptation.

| Finding | Macro-F1 |
|---|---:|
| Direct marker rule and four-bit marker classifier | 1.000 |
| Structural-only diagnostic after marker removal | 0.594 |
| TF-IDF / LinearSVC, audited clean | 0.826 |
| BERTweet, audited clean, 3 seeds | 0.884 +/- 0.002 |
| Same leaky-trained BERTweet, markers removed at test | 0.201 |
| External TweetEval, LinearSVC | 0.297 |
| External TweetEval, BERTweet, 3 seeds | 0.298 +/- 0.005 |

The external evaluation jointly changes corpus, annotation policy, class distribution and label ontology. It is a **stress test**, not a causal decomposition of these changes.

## Verify (CPU, no raw tweets required)

Use a Python 3.11 environment with the pinned core dependencies, then run:

```bash
pip install -r environment/requirements-core.txt
bash scripts/run.sh quick
```

The verification commands return a nonzero exit code if any check fails. Prediction evidence is in `results/predictions/`; frozen method specifications are in `protocols/`; implementation code is in `src/`.

## Reproduce and inspect

- [REPRODUCE.md](REPRODUCE.md): commands for sparse, neural, statistical and external stages.
- [RESULTS.md](RESULTS.md): result anchors and condition glossary.
- [ARTIFACT_MAP.md](ARTIFACT_MAP.md): locations and purposes of artifact components.
- [manifests/SOURCES.md](manifests/SOURCES.md): pinned dataset, model and source hashes.
- [docs/HUMAN_REVIEW.md](docs/HUMAN_REVIEW.md): independent human reassessment protocol for the original 64-case error pilot.

The original pilot involved **two replicate runs of one language model**, not independent human raters. No human adjudication has been claimed. The 64 tweets are retrieved locally from the source data and are **not republished in this repository**.

## Terms and citation

Code is under [MIT](LICENSE). Data access and tweet-text reuse follow the terms of their original sources. Cite the corresponding paper when its publication record becomes available and link to this repository for the code, protocols, predictions and checksums.

Use GitHub Issues for reproducibility questions, reporting the command and environment without disclosing credentials or private source text.
