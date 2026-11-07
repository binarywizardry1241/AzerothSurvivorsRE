# Installed MPQ member and source map

EXE SHA-256 `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The [proof](evidence/mpq-member-coverage-comparison-2.json) resolves the previously
unproduced member/override inventory portion of `Q41-R01` under #41. The nine
installed archives are read directly and their complete hashes rechecked.
No archive or member is copied into the project deliverables.

| Archive | Active hash slots / named blocks |
| --- | ---: |
| patch.MPQ | 27,587 |
| patch-2.MPQ | 120 |
| patch-3.MPQ | 10 |
| patch-4.MPQ | 19 |
| patch-5.MPQ | 1,855 |
| patch-6.MPQ | 4 |
| patch-7.MPQ | 6 |
| patch-8.MPQ | 23 |
| patch-9.MPQ | 56 |
| Total | 29,680 |

All nine listfiles decode with the existing read-only parser. Every active hash
slot has a listed name, every listed name passes the archive's probe-chain
lookup, and every active block has an active hash reference. There are **zero
opaque active slots and zero unreferenced active blocks**. The union contains
29,672 distinct normalized names. Only `(listfile)` occurs in multiple supplied
archives; no other listed name is overridden in this particular chain.

The complete ignored `members.jsonl` records archive/slot/hash-pair, locale,
platform, block index, offset, packed/unpacked lengths, flags and candidate
names. `source-overrides.jsonl` records each normalized name, all archive
occurrences and the winning archive under the existing source chain's later-
archive rule. The proof commits the exact path, row count and digest of each
output. It also binds the reused source chain and parser. Source mount order is
not independently certified as the selected native target's complete mount,
locale or dynamic replacement contract.

The EXE's original 303 `resource_path` candidates all remain in
`resource-leads.jsonl`, with their original ordinal/offset/hash. **79** are exact
member names. **186** have basename candidates that need a native path producer;
**38** have no exact member-name match or basename candidate. Concatenated
literals and partial/URI paths are retained without guessed splitting,
prefix insertion or stripping. These are text-classification results, not 224
missing resources or source defects.

The [current AS URI proof](as-resource-paths.md) classifies the first six
original candidates as partial matches within complete `mpq://` strings, connects
their current producers/source consumers and verifies eight exact BLP2 members
including the paired left arrows. The original text-classification rows/counts
remain unchanged; other producer/resource questions remain open.

The [current race-atlas proof](race-portraits.md) separately establishes
one AS resource consumer through native recovery, installed MPQ decoding and
`armory/race_portraits.rs`. It is reused at that exact bound. Other archive
members, resource IDs, DBC fields, overriding behavior and source consumers are
not promoted to that proof. Standard engine world/model/audio/UI resources
remain supporting inputs to the existing benilla/wenilla implementation;
this inventory does not authorize generic engine reconstruction.

`python3 -B scripts/inventory-mpq-members.py` verifies the proof and
reproduces all full inventories in memory. `--stage` writes proposed outputs and
proof beneath ignored `runtime/coverage/<EXE hash>/mpq-members/` for review.
Only listfile payloads are decoded. Asset content hashes, all codec/encryption
paths, resource semantics and actual loading/rendering are outside this table
inventory. No compilation, Rust/game execution or original/rebuilt comparison
ran. The broader R01/D03 semantic/producer questions and #41 stay open.
