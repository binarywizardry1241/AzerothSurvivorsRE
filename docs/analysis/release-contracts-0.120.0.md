# Race unlocks, permanent account ownership and faction forms — 0.120.0

Installed read-only target: **0.120.0**, 145,447,424 bytes, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
The [curated proof](evidence/0.120.0/race-unlocks/manifest.json) binds twelve
exact native ranges, 674 independently decoded instructions, four native literal
records, eighteen completed durable Ghidra queries and eleven actual source
receipts. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own the permanent findings;
each of the five supplied release entries has its own finding.

## Summary and Rewards purchase — #187/#188

The independent summary entry **#187** promises account-wide race access for
100 achievement points. **#188** owns the separate bullet's concrete Rewards,
eligibility and racial/passive connections. Current native evidence establishes:

| Boundary | Selected native behavior |
| --- | --- |
| Rewards sidebar `140323e70..140325a60` | Five explicit tab constructors select 0–4; the current label helper `145b386b0..145b38736` resolves Perks, Companions, Tabards, **Races**, Appearances. Races is tab 3; Appearances moves to 4. |
| Races pane `14019f0e0..14019f784` | Uses the exact purchase-description literal at `1461a133d`; iterates the existing `0x58` race descriptors, admitting IDs 1–8 through `145b49850`, then calls card `1401a1620`. This reuses race records rather than inventing another catalog. |
| Card `1401a1620..1401a1ec7` | Reads permanent ownership from account `+140/+148` and pending ownership from plan `+38/+40`. Previously bought and planned entries have separate captions/states. An unowned/unplanned card admits purchase only when the supplied remaining points exceed 99. |
| Spending `145b35460..145b35657` | Adds **100 times the planned race-vector length** to existing perk/tabard spending (`145b3563e..145b35646`). This is executable cost evidence independent of the descriptive text. |
| Validator `145b35660..145b360bf` | Checks each proposed race ID is 1–8 (`145b35ccb..145b35ce2`), requires the proposal to retain every already owned race (`145b35ce4..145b35d54`), then includes race spending in the existing earned-point comparison. Existing perk/tabard requirements remain separate branches. |
| Accepted update `145b36190..145b36634` | Normalizes/deduplicates proposed scalar vectors, calls that validator and, on acceptance, assigns the third vector to account `+138/+140/+148`. Confirm `14019ffa0..1401a02ad` carries the three-vector plan through the existing command 17. |
| Account/class eligibility `145a97aa0..145a97c00` | Copies the ordered base class slice, then visits the account race vector and appends only races absent from the accumulated list. Base order is retained, followed by purchased extras in their existing order. |

The [source repair](race-rewards-0.120.0.md) connects the actual Rewards
purchase, validation, spending and command17 race vector. Races is tab3,
Appearances moves to4; pending ownership participates in Confirm/Undo/navigation
and baseline reconciliation. Bought races remain permanent. The
[account repair](race-account-0.120.0.md) connects typed ownership, ordered
base-plus-purchased eligibility, class changes, saved Hero/Pick and backend
selection. The [locale repair](race-locales-0.120.0.md) restores all eight
current race-feature labels across fourteen catalogs.

The [run-carry proof](race-run-carry-0.120.0.md) independently checks eight
current race records,66 starter descriptors,72 native/source outfits and288
racial-stat prefixes/3,456 exact scalar values. Existing run entry selects the
racial instance and passives from the actual selected race independently of
class. Current remote Hero admission145aa97a0 validates class and race1–8
without consulting the host account; the co-op sanitizer now preserves those
combinations. No substitute race/outfit/modifier is added. The separate #190
faction-form repair and #191 hover owner retain their own claim identities.
No further selected #187/#188 source omission was identified. Compilation,
actual purchase/save/menu/co-op/gameplay and original/rebuilt parity remain open.

## Purchases survive save and perk reset — #189

Current serializer `145a93b90..145a96525`, specifically
`145a95c14..145a95cb4`, reads the same account race vector at `+140/+148`, maps
its byte elements to decimal strings, joins them with the current comma
separator and formats the exact `races|` record through the encoded descriptor
at `146f85f57`. The retained literal and original instructions establish a
real serialization consumer, beyond the presence of a save-key string.

Reset owner `145b4a010..145b4a08e` requires reset count below two and a nonempty
perk vector, clears only perk length `+118`, releases its string rows and
increments reset count `+1f8`. It does not clear or replace the race vector.
The Rewards input calls that helper and queues command 18 only on success;
the current sidebar explicitly states that tabards and races are kept.

The [current loader proof](evidence/0.120.0/race-account/manifest.json) completes
that parser frontier: every trimmed `races|` prefix row contributes its full
comma suffix; decimal `u8` tokens admit optional `+`/leading zeroes but skip
malformed, overflowing and internally whitespace-padded tokens. IDs 1–8 are
combined across rows, globally sorted and deduplicated. Extra pipe characters
invalidate only the affected token. Typed parsing is separate from later
account-aware picker eligibility.

The coordinated #187/#188 source changes now connect `Save::purchased_races`,
the schema's `races` family, `Progress` and command17 `RewardPlan` through the
existing ordinary-write/export/import/load/backup consumers. Backend Reset
still replaces only perks/reset count; optimistic Reset carries the owned race
vector through `write_rewards`. Both retain permanent race spending. The
[#189 persistence report](race-persistence-0.120.0.md) records 80 original
reset-instruction cases, current source guards and seven authored/unrun Rust
integration regressions. No further missing #189 source connection was found;
compilation, actual file/reset/reload/UI effects and original/rebuilt parity
remain unverified.

## Horde and Alliance Druid forms — #190

Current player-descriptor owner `145b7b820..145b7bf14` reads the actual race byte
from game `+33d`, then the composed 64-byte effect rows at `+848/+850`.
Its exact branch `145b7ba98..145b7baa5` selects the Horde form family for race
IDs **2, 5, 6 and 8** using the guarded mask `0x164`. Within that family,
permanent tag 25 / spell 9634 (Dire Bear) selects display **2289** and spell
768 (Cat) selects **8571**. The other family selects **2281 / 892**. It retains
the first recognized permanent form in source order; unknown/non-form rows are
skipped. Field **131** receives the current form, while field **132** retains
its independently selected ordinary body.

The [historical form recovery](permanent-forms-0.105.0.md) and its source repair
remain valid historical knowledge. The concrete current change is the faction
predicate: the [#190 source repair](faction-forms-0.120.0.md) replaces the former
`race == 6` test with IDs2/5/6/8 through the existing solo and cooperative display
publication consumers, retaining first-match/field separation. It passes 14,336
native display-field cases and 3,584 source policy projections. Actual MPQ
model loading, animation, attachments, movement/camera consequences and
original/rebuilt rendering are separately unverified.

## Restricted race hover hint — #191

The [completed source/static repair](race-hover-0.120.0.md) connects the native
account/class union, race membership flag, two-byte race-row component and both
hover query-storage paths to RaceTip. Source now shares `Save::allowed_races`
with the picker. A locked race retains the translated class restriction, then
adds the exact 55-byte Rewards/Races guidance through the existing localized
text consumer at 12px with the recovered muted color. Base-eligible and bought
races omit both footer lines; state/catalog changes invalidate the tooltip.

The original restriction slice retains its original evidence, while the
[canonical producer](evidence/0.120.0/race-picker/manifest.json) and
[consumer/footer additions](evidence/0.120.0/race-hover/contract.json) bind the
missing caller proof and publication. The check passes 1,016 synthetic native
cases, 309 exact original instructions, two durable queries and all fourteen
hint translations against their native payloads. Compilation, actual hover,
input, layout/fonts/rendering and original/rebuilt parity remain unverified.

## Static verification and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs python3 -B docs/analysis/evidence/0.120.0/race-unlocks/check.py --queries
```

This passes all twelve original-byte/assembly/instruction-boundary checks,
four literal checks, eleven committed pre-repair source receipts and eighteen durable result/journal
commitments. It runs no original instruction emulator or reconstructed code.
The raw eligibility/reset helpers retain generic ABI and missing PE context;
their full-PE callers and independent original instructions establish only the
bounded interfaces described above. Full-PE Ghidra sometimes follows an
unbounded switch into adjacent code; those expanded bodies do not define source
ownership, function extents or recovered behavior. Immutable query labels are
routing history: four preliminary candidates were reclassified in the manifest
and do not support their initial labels.

Only the direct current Rewards, Armory and Save interfaces support bounded
module registration here. The form descriptor has an actual recovered AS
interface and source counterparts, but its diagnostic module attribution is
not established by this proof. The account validator contains a `nav.rs`
Location assertion seam; that diagnostic association does not make the Rewards
validator a recovered navigation contract. Neither shared source references
nor that assertion can register broader Game/Nav module coverage.

The existing benilla source provenance and `ChrRaces`/model/UI consumers were
inspected before expansion. Generic engine parsing, allocation and rendering
internals stop at those existing boundaries; available source does not prove
the native compiled revision. The original audit changed no gameplay source; the linked repairs describe current implementation. No compilation,
compiling tests, game/client/network/server operation, installed save mutation
or controlled original-versus-rebuilt comparison occurred. Recovery, source
implementation, static checks, runtime validation and parity remain separate.
