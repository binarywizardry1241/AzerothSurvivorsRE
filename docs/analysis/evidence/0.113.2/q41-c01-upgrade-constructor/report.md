# Q41-C01: ordinary upgrade choice index diagnostic

Target **0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This bounded classification resolves the meaning of selected diagnostic site
`0x14596b868`; it does not classify all C01 sites or recover the entire choice
constructor. Current implementation status belongs to
[CURRENT-STATE](../../../../CURRENT-STATE.md).

The selected site is the **ordinary upgrade choice constructor's learned-ability
index bounds failure**. Its Rust Location record at `0x14730e150` identifies
`crates\wenilla-rogue\src\game\upgrades.rs:348:47`. This is an AS choice-input
contract, rather than a general engine subsystem. No source defect is established
for this contract.

## Recovered input and consumer

The current weighted candidate writer reads the learned-instance Vec from
`Game+0x330/+0x338`, using an **88-byte** instance stride. Its indexed read at
`0x1459657c5..0x1459657e4` has an unsigned length check. The candidate's upgrade
byte Vec header is **1**, and its fourth word stores the learned-instance index
from R13 (`0x1459659de..0x145965a06`). Publication copies that word to weighted
record `+0x20`, following the weight and three-word Vec. These are current byte
observations; the candidate-bound, index and publication extracts retain them
once each.

The choice cursor at `0x145999200` copies all **32 bytes** into preserved stack
memory and advances by 32. At `0x1459994ad..0x1459994db`, the preserved sum is
copied into the constructor argument memory; the call supplies Game in RDX,
the copied sum in R8, and selected rarity in R9. Intervening rarity/eligibility
work is not replayed or claimed complete by this classification.

Constructor `0x145969bf0` normalizes a nonnegative first word to selector **1**;
negative words XOR the high bit. Its relative table at `0x14730ed74` sends the
admitted selector 1 to `0x14596a412`. That branch reads the learned-instance
index from input `+0x18` and length from `Game+0x338`. The unsigned comparison
at `0x14596a424` branches to `0x14596b861` when `index >= length`.

For a valid index, the branch computes
`Game[+0x330] + index*0x58`. It captures the instance, its descriptor's permitted
upgrade-byte slice at `+0x30/+0x38`, the stats address `Game+0x480`, and rarity
into the iterator state passed to collector `0x1459808c0`. The index is retained
at stack `+0x220`. Recovery stops at that collector interface; the collector,
shuffle, prose, allocation and final display publication do not execute in this
proof.

For an invalid index, the diagnostic branch sets its cleanup flag and supplies
**index in RCX**, **length in RDX**, and **Location `0x14730e150` in R8** to
`0x145e9c123`. The [Armory proof](../q41-c01/report.md) already owns the identical
current shared bounds-diagnostic helper and its format bytes. The checker
revalidates those bytes through that canonical contract; no duplicate helper
extract is retained.

## Source correspondence

The live source counterpart is
[`gameplay/mechanics/choices.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs):
`generate_level_choices` obtains `Candidate::Upgrade(index)` from
`self.abilities.iter().enumerate()`. Its constructor branch reads
`&self.abilities[index]`, collects permitted upgrade kinds, and carries the
instance's key into `RunChoice`. This is the same valid-index selection and
out-of-range indexing contract, with semantic source structures rather than a
native memory overlay. The
[`native_overlay_payload.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs)
consumer finds that key in the learned instances and passes the instance and
selected kinds to `upgrade_lines`. The checker retains hashes of these exact
source projections. It does not execute reconstructed Rust or prove every
mutable alias, stale-choice state or arbitrary-run pointer ancestry.

## Evidence and limits

The [contract](contract.json) independently reproduces the entire canonical
57-row C01 selector and its committed output digest, then selects this exact
site. Existing whole-image ownerless counts remain unchanged.
[Ghidra observations](ghidra.json) bind the fresh probe's Evidence IDs, profile,
seed digest, actual body, direct predecessor and diagnostic call. The constructor's
actual body remains only **177 bytes**, `[0x145969bf0,0x145969ca0]` inclusive,
ending at its computed dispatch. FunctionManager reports no containing procedure
at the selected site. The direct branch and coherent table lane establish this
bounded contract without turning a declared unwind extent or code seed into a
function-body ownership claim. Reference analyzers are disabled; the fresh
empty caller query cannot establish that callers are absent.

`check-q41-c01-upgrade-constructor-0.113.2.py` passes **105 original-instruction
cases**: 25 valid index captures and 80 exact bounds failures. Cases cover lengths
0/1/2/6, first/last valid indices, exact length and larger indices, high-bit and
maximum-u64 indices, and five selector-1 header encodings. One header is a
synthetic negative selector-1 value; testing its decoded behavior does not admit
it as a live producer value. The candidate, Game, pointers and stack are synthetic.
Producer/publication/cursor extracts are statically traced rather than replayed
by these cases. No compiler, application, game, save/configuration access,
rendering or original/rebuilt comparison ran.

Reproduce the static checker from this checkout:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-q41-c01-upgrade-constructor-0.113.2.py
```

The retained [probe plan](probe-plan.json) and [seeds](probe-seeds.tsv) reproduce
the bounded Ghidra queries through `scripts/rea-batch.py`. Their portable curated
paths differ from the original runtime seed path, so a replay produces a new
profile digest and Evidence IDs. Preserve the original commitments. Native
function/alias ownership, the other C01 sites, full choice behavior and gameplay/
presentation parity remain open under their existing findings.
