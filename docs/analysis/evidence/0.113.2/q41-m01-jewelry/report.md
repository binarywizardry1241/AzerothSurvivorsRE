# Q41-M01 — jewelry increment cap table

Target **0.113.2**, EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This bounded classification belongs to #41 and the existing jewelry mechanic
under #34. [CURRENT-STATE](../../../../CURRENT-STATE.md) owns overall status;
the [proof](proof.json) binds the selected candidate, installed bytes, source,
fresh REA/Ghidra observations and noncompiling instruction checks.

## Exact selection and recovery

`Q41-M01-jewelry-cap-14583fa56` selects the exact `candidate_tables[]` record
whose `site` is `0x14583fa56` in the current guarded-table producer output
`runtime/execheck-0.113.2/proofs/guarded-jump-tables.json`. It is one of the
**205 rejected candidates**. The original rejection is retained: four case
destinations lacked an independent instruction boundary. It is not a conflicting
instruction decode or evidence that the table is invalid.

The producer is the AS jewelry increment leaf
`[0x14583f9c0,0x145840035)` (1,653 bytes, file offset `0x583edc0`).
[increment.asm](increment.asm) is the single canonical selected native decode.
The leaf reads the definition's tag byte at `+0x44`, its base amount at `+0x40`,
rarity from RDX, and the optional prior value/pick count through R8. The prior
value shape is a presence byte at `+0`, f32 at `+4` and u32 at `+8`.

The cap dispatch compares the zero-extended tag in R9D with nineteen at
`0x14583fa3f`; unsigned `JA` at `0x14583fa43` bypasses the table for larger
values. `MOV ECX,R9D` preserves the guarded selector, followed by a signed-i32
load, base addition and computed jump. Table `0x147014f3c` has twenty entries
(80 bytes, file offset `0x701393c`) and five distinct destinations:

| Raw native tag | Destination | Produced cap |
| --- | --- | --- |
| 0–6, 8 | `0x14583fa58` | positive infinity |
| 7, 15, 18 | `0x14583fa62` | `base * 3` |
| 9 | `0x14583fff8` | constant f32 `0.6` |
| 19 | `0x14583fa6c` | `base * 4` |
| 10–14, 16–17; out-of-range default | `0x14583fa74` | `base * 5` |

Raw tag sixteen is Soulstone: its earlier entry branch returns one or two
lives according to `rarity >= 3` before this table. The stored lane sixteen is
decoded and retained, but is **not reached from this entry**. Other computed
incoming contexts remain unproved. A separate thirteen-entry table at
`0x147014f8c`, behind the unsigned `(tag - 7) <= 12` guard, supplies the finite
cap multiplier used later by the proportional lanes. Its exact bytes and all
destinations are retained and verified against the same leaf boundaries.

Fresh full-PE REA/Ghidra byte queries match both tables and the entire leaf.
The exact seeded profile decodes every selected target, including the four
previously unproved boundaries. FunctionManager still owns only these inclusive
ranges for the leaf: `[14583f9c0,14583fa57]`, `[14583fa74,14583ffed]` and
`[145840028,145840034]`. The four cap labels remain code-only observations
outside that body. Their decoded status does not silently establish missing
computed incoming edges or revise global ownership. Original rejected-candidate,
guarded-table, census and queue counts remain unchanged.

## Source and consumer connection

The current source in
[`loot_rewards.rs`](../../../../../crates/azeroth-survivors-re/src/loot_rewards.rs)
already matches the recovered cap and increment contract. Stable source tags
remain intentionally distinct: native six is source nineteen (Mystaria), while
native seven through nineteen map to source six through eighteen. Its
`value_cap` and `increment` preserve the native families, first-pick multiplier,
rarity clamp, diminishing pick denominator, sixteen-step health growth and
Soulstone exception. No source defect is established.

The complete retained current reference stream has one incoming reference to
the leaf: `CALL` at `0x1402afbed`. The following instructions pass its XMM0
result as XMM2 to description builder `0x145840040` at `0x1402afc00`. The proof
binds that exact caller interval and all incoming reference records; this
does not exclude inlining or unseen aliases/callers.

The reconstructed visible offer path already calls `definition.increment` in
[`native_overlay_payload.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs)
before `jewelry_description`. Acceptance in
[`mechanics/treasure.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/mechanics/treasure.rs)
calls `apply_jewelry`, which consumes the same increment and updates value/picks.
The normal effect refresh in
[`mechanics/effects.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs)
consumes the accumulated value. These source traces establish connected
consumers; this selected cap-table recovery does not revalidate the complete
native offer, acceptance, resource lifetime or presentation lifecycle.
The historical jewelry catalog/report retains its actual 0.112.0 provenance:
synthetic descriptors here do not certify all current catalog records.

## Static checks and remaining limits

`scripts/check-q41-m01-jewelry-0.113.2.py` verifies the exact original candidate,
table hashes, guard/selector bytes, all target boundaries, the fresh Ghidra
observations and reviewed source commitments. It executes **256 original-entry
dispatch cases**, one for every tag byte, checking table admission, actual
destination, default and early Soulstone bypass. It additionally executes
**1,120 complete original-instruction increment cases**, covering all twenty
typed native tags, rarities zero through five and usize maximum, absent/present
prior values, zero/large/beyond-cap totals and u32-maximum pick count.

The fixture supplies synthetic descriptor/Option and stack memory; the native
leaf makes no calls, so no callee behavior is replaced. Expected results use
the retained translation of the live source formula with f32 rounding. This
executes the current EXE instructions, not reconstructed Rust. Malformed/NaN
descriptor payloads, every resource alias and all caller lifetime invariants
are outside the matrix. No build, compiling test, game, rendering, actual
filesystem operation or original/rebuilt comparison ran. Parent #34/#41 and
global semantic/alias inventory requirements remain open.

Use the existing Capstone/Unicorn Python library paths to run the checker.
For fresh REA reproduction, the proof retains the exact seed rows, operation
parameters, disabled analyzers, profile and original runtime plan commitment.
Run `scripts/rea-batch.py` against `installed-game/AzerothSurvivors.exe` with a
new project-local output directory. Preserve the resulting Evidence identities;
do not overwrite or relabel this probe.
