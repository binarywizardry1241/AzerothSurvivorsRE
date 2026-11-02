# Q41-P01 — current aura alias and remaining-call routing

The installed **0.113.2** EXE, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
owns this bounded recovery under permanent gap **#41**. The
[manifest](manifest.json) commits the original selected-call inventory, exact
native ranges, fresh REA/Ghidra observations, source consumers and static cases.
Overall implementation status remains in
[CURRENT-STATE](../../../../CURRENT-STATE.md).

## Inventory and selected AS contract

The original selected-owner profile reports **245 unresolved-call records**.
Its [previous XInput classification](../q41-p01/report.md) owns the one computed
call with no static target. The remaining **244 records name 21 distinct static
targets**. The manifest retains every target and its complete selected-owner
path/count partition, reconstructed from all original procedure artifacts.
The [subsequent interface proof](../../../p01-call-interfaces-0.113.2.md) classifies ten more original records at their bounded Pad/color, shared bigint, storage-release and configuration tag/method ABI boundaries; concrete runtime identities remain unclassified. These are observations from a reduced analysis profile; the original counts do
not become unresolved computed-flow counts or certify semantic completeness.

| Remaining records | Routing established here |
|---:|---|
| 73 | Six exact PE import thunks: memcpy54, memcmp10, memmove6, memset1, roundf1, powf1. These identify an external boundary, not every caller's AS meaning or the loaded DLL implementation. |
| 150 | Allocation/deallocation trampoline candidates and the `RET` leaf. Shared runtime context; surrounding allocator semantics are outside this selection. |
| 7 | Three legacy-configuration supporting targets. Existing [legacy-config recovery](../../../legacy-config-0.113.2.md) supplies the context; the dynamic-drop trait type remains unclassified. |
| 2 | **Selected aura alias**, recovered below. |
| 6 | Other AS/shared-interface routes: language record, pad supporting trampoline, equipment-art predicate, image node constructor and mode-name parser. These are routing leads or separately owned evidence; no whole-contract recovery is inferred here. |
| 4 | Realmd local authentication/roster supporting targets under #9/#41. Their semantics remain unclassified; no backend recovery or implementation is selected here. |
| 2 | Excluded cooperative party-state target context. Shared import/allocator targets retain every caller context in the manifest; realmd callers are local-auth context, not automatically excluded co-op. |

The selected original sites `0x1458f365b` and `0x1458f369f` call
`0x14580b380` from actual owner `0x1458f2e90`, the AS aura descriptor/tooltip
assembler. This callee determines a spell identity from an effect's original
provenance name and its aura kind. It is a concrete AS contract rather than an
engine-completeness task.

## Native producer, lookup and consumers

Fresh REA/Ghidra Evidence
`ev_fd5096bfb3fad8979bec947c4bb495a9b66239ffc3f9208bee0ff686bd4d6367`
observes the lookup's actual contiguous **718-byte body / 37 blocks** at
`[0x14580b380,0x14580b64e)`. The canonical [instruction extract](alias.asm)
and manifest bind those exact installed bytes. A guarded table at
`0x147003d78` subtracts six from the unsigned name length and admits only
indices0..13; its fourteen signed relative entries select ten destinations.
The body compares exact name bytes, including the overlapping SSE comparisons
for the nineteen-byte `Divine Intervention` name. Case, length and kind must
all match.

| Kind | Exact provenance name | Spell ID |
|---:|---|---:|
| 0 | Fortified; Shield Mastery | 871 |
| 0 | Last Stand | 2565 |
| 0 | Soul Link | 19028 |
| 0 | Ardent Defender; Blessed Life | 27778 |
| 1 | Flurry | 16280 |
| 2 | Last Stand | 12975 |
| 2 | Divine Intervention | 19753 |
| 2 | Cheat Death | 5384 |
| 2 | Reincarnation | 20608 |

The three default IDs, read from `0x1470035a8`, are respectively
**27779 / 26635 / 25771** for kinds0/1/2. Empty names reach this table without
dereferencing the name pointer; the observed callers use dangling pointer1
with length0. Kinds outside0..2 are not a valid-AS contract: the native default
path has no clamp before indexing this three-element table.

The original selected descriptor calls choose either that empty-name fallback
or the indexed provenance record's pointer/length at offsets8/16 with a
40-byte stride. They preserve the result in the descriptor assembly state.
Their complete tooltip construction and localization are not certified by this
lookup classification.

A bounded direct-call search additionally finds the decoded call
`0x1458f5bda` in the current field publisher `0x1458f5a00`. Fresh Ghidra
Evidence `ev_f18b3af7f2abc9bce1c2b58f1444c9059d915c2f7041cb8971d6dc08d8bc4e75`
records its actual disjoint **4,477-byte body**, separately from its
4,571-byte span. It uses the same indexed40-byte record or empty fallback,
passes the kind byte, and preserves the returned ID in R12D before the aura
row's spell-ID writes. This ties the recovered lookup to a live player-field
consumer as well as the selected descriptor calls.

The shared index producer `0x1458e9520` has an actual disjoint **346-byte
body**, recorded by Evidence
`ev_20573383526dc47fdb56cae1325fd1a0650e9deb8a66c0e344cffac6e5db014a`.
It emits the first shield row with native generic tag18/20/31 as kind0,
the first rescue row with tag19 as kind2, then every tag15 temporary row as
kind1. Order and repeated temporary rows are retained. This establishes the
valid kind domain at the actual AS producer.

## Existing live source and static checks

The current
[`player_aura_alias`](../../../../../crates/azeroth-survivors-re/src/run_effects/player_auras.rs)
already matches all eleven named name/kind combinations and the three defaults.
Its slot projection consumes the first shield/rescue and ordered temporary
effect indices. The live
[`effects.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs)
builds provenance from definition names, aligns it with composed generic rows,
and passes it into `PlayerAuraInputs`; the resulting field changes reach
[`client/events.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/client/events.rs)
and the existing object-value publication path. This inspection establishes
no missing implementation for the selected alias boundary. It does not
establish the whole descriptor or publisher's equivalence.

`python3 -B scripts/check-q41-p01-aura-0.113.2.py` passes against the configured
installed hash and checks:

- All245 original records and the244-to21 target/count partition, including
  exact import slots and all supporting/excluded caller contexts.
- **1,035** admitted native alias cases against the inspected Rust match:
  all named kinds, every single-byte near miss, truncated/case/space variants,
  UTF-8, embedded NUL, empty input and lengths0..64.
- **12** native field-publisher argument/return cases: present/missing
  provenance, exact bounds and all three kinds, including R12D preservation.
- **49** native index-producer cases for all native tags0..35, tag255,
  empty/mixed vectors and repeated shield/rescue/temporary rows. The sole
  fixture seam supplies vector capacity/storage at reserve call
  `0x145cfa1c0`; it does not select indices, kinds or spell IDs.
- Exact selected native ranges/tables, actual Ghidra bodies/profiles and
  reviewed live source anchors/hashes.

Unicorn runs only the admitted instructions in synthetic memory. The checks
neither compile nor execute Rust, start a game, load a Windows DLL, render a
tooltip or compare original/rebuilt gameplay. Complete producer composition,
descriptor assembly, publication and runtime/parity remain open. Other static
targets' AS meanings remain separate from this completed lookup recovery;
**#41 remains open**.

The two successful probe plans, seed lists, responses and Evidence bundles
remain under ignored `runtime/q41-p01-aura-0.113.2/`. Reproduce their recorded
operation/parameter pairs through `scripts/rea-batch.py` against
`installed-game/AzerothSurvivors.exe`, with the manifest's seeded function/code
addresses, reduced analyzer profile and a fresh project-local output path.
New profile/output commitments produce fresh Evidence IDs; they are not the
original observations.
