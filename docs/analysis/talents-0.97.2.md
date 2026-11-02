# 0.97.2 menu talents: current data and allocation behavior

Recovered 2026-10-18 from `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`,
SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This is a **static recovery and source implementation**, not compiled or runtime
parity. No builds, compiler checks, tests, emulation or application launches were
run for this work, for this source-recovery checkpoint.

The historical [0.92 report](talents-0.92-recovery.md) remains version-bound.
Its old addresses and UI geometry are not evidence of current behavior. The
current owning evidence is [talent definitions](evidence/0.97.2/talents.json)
and [native consumers](evidence/0.97.2/talents-native.json).

## Current definitions

`scripts/recover-talents.py` reads the exact supplied PE after verifying
its SHA-256. The nine class records start at `0x1469a60f8`, stride 200 bytes.
Each contains three 64-byte tree descriptors and a class ID at +192. Each tree
points to 104-byte talent definitions; their fields remain key/name/icon,
effects, description, optional prerequisite, then row/column/maximum rank at
+96/+97/+98. Effects are 64 bytes and have a **one-byte discriminant**. Bytes
1–3 can contain variant data and must not be interpreted as part of the tag.

The current asset contains **354 talents, 27 trees, nine classes**. Warrior
Protection, Paladin Protection and Druid Feral contain 14 nodes; the other
trees contain 13. Every definition and effects block has its original address,
file offset and byte hash in the evidence. Descriptions, names, icon keys,
prerequisites and row/column positions are direct reads of current records.
The generated asset is sufficient for building the source without the EXE.

The Feral tree starts at `0x1469a4f68`. Its current records include:

| Key | Current menu data |
| --- | --- |
| `ferocity_druid` | Swipe **and Shred** damage, 10/20/30/40/50%. |
| `feral_aggression` | Maximum-health regeneration, displayed per-rank values 0.2/0.3/0.4/0.6/0.8%. |
| `feral_instinct` | Maximum health, 5/10/15%. |
| `brutal_impact` | Name **Enrage**, icon `Ability_Druid_Enrage`; melee-hit free-Swipe chance 10/20/30/40/50%. The saved key remains unchanged. |
| `rake` | Milestone describing 20% maximum health, 8% less damage, Swipe and Shred starters, and 100% bleed damage over six seconds. Five raw effects. |
| `predatory_strikes` | Swipe cooldown reduction, 10/20/30%. |
| `thick_hide` | Damage reduction, 2.5/5/7.5%. |
| `savage_fury` | Shred damage, 15/30/45%. |
| `heart_of_wild` | Damage, 3.5/7/10.5/14/17.5%. |
| `primal_fury` | Damage converted to healing, displayed 0.5/1%. |
| `leader_of_pack` | Name **Dire Bear Form**, icon `Ability_Racial_BearForm`, row 6 column 0, prerequisite `blood_frenzy`, one rank. |
| `cat_form` | New **Cat Form**, icon `Ability_Druid_CatForm`, row 6 column 2, prerequisite `blood_frenzy`, one rank. |

`leader_of_pack` at `0x1469a5448` and `cat_form` at `0x1469a54b0` each have
six effects. Their literal current descriptions state their form bonuses,
Shred instead of Wrath, and that the other form cannot also be learned. The
asset retains all native effect bytes. This report establishes their menu
definitions and allocation rules; it does not claim those effects execute in
a rebuilt run. Other current literals include the explicit replacement
wording for Shadow Word: Pain instead of Smite and Frostbolt instead of Fireball.

## Recovered native rules and source changes

| Consumer | Current native address | Implemented behavior |
| --- | --- | --- |
| Earned point budget | `0x14541df40` | Next point costs `80 + 15 * earned`, maximum 51. This entire 129-byte current leaf also matches the historical leaf byte for byte. |
| Previous rows | `0x145473c50` | Count only allocated nodes in the selected tree with a strictly lower row; a row requires `row * 5` points. |
| Can learn | `0x145473a80` | Known current class talent, unused earned points, rank below maximum, previous-row gate, exclusive-capstone gate, prerequisite at its **own** maximum rank. |
| Exclusive capstone | `0x1454733c0` | Only for a row-6 target, return the first other allocated row-6 talent in the **same tree**. The current data activates this rule for the Feral pair. |
| Normalize | `0x145473ea0` | Resolve candidates to this class, clamp requested ranks, sort, start with an empty allocation, then attempt every requested point through the learning gates. |
| Resolve/clamp collector | `0x14552c950` | Keep only resolved definitions, their tree index, and requested rank capped at the definition maximum. |
| Normalization comparator | `0x1454f4fc0` | Sort ascending by `(row, tree index, column)`. Row is primary, followed by tree, then column. |
| Refund | `0x145473600` | Clone and decrement, remove zero rank, normalize with `u32::MAX` budget, refuse if normalization removes any additional point. |

`talents.rs` now uses current definitions and these gates when displaying,
counting and editing an allocation. Normalization is applied to the allocation
read by this module before use, including the available-points badge. It does
not write the save merely because the page is displayed. Learning, refunding
and Reset use the existing menu save path. Whole-save import/migration and
duplicate record semantics are separate fidelity work.

The capstone rule is generic to row 6 within a tree; it is not a special case
matching two Druid names. If an imported allocation requests both Feral forms,
normalization processes column 0 (Dire Bear Form) before column 2 (Cat Form),
so only the first can remain. Refunding that form allows the other to be
learned. The UI displays the native localized `You already chose {name}`
warning, naming the allocated blocking talent.

Current details constructor `0x1400cf1b0` calls the exclusive helper at
`0x1400cfa5a`, localizes the blocked talent name, and emits the warning at
13px in sRGB `(1.0, 0.353, 0.235)`. Its literal and exact color bytes are
retained in the native evidence.

## Current description values and cell states

Formatter `0x1454725f0`, rank-scaling helper `0x145474780`, and current
23-entry branch tables at `0x1469a9fbc` and `0x1469aa074` are recovered again
from this target. The script asserts their destinations and derives all
per-rank `{v}` values with native f32 multiplication, percentage conversion,
one decimal place and removal of trailing `.0`. Scaling selects a particular
field per effect variant. Variant 8 with selector `0xffffffff` scales the float
at +12, which fixes previously constant per-rank values such as Improved
Demoralizing Shout and Judgement of the Crusader in the old extracted asset.
These corrections are to the recovered asset; no claim is made that those
two original-game talents changed between versions.

Milestone predicate `0x145472be0` checks for an effect variant at most 29,
maximum rank one, and a nonzero even row. Both current Feral capstones satisfy
it. This predicate is reapplied to the current data rather than carrying old
milestone flags forward.

Current cell constructor `0x1400ce700` makes a second can-learn call with
`u32::MAX` when a talent is unlearned and unavailable. This distinguishes an
empty point budget from a structural lock. Source now implements:

| State | Icon brightness | Native border |
| --- | --- | --- |
| Selected | According to allocation/gates below | sRGB `(1, .914, .659)` |
| Maximum rank | 1.0 | sRGB `(.973, .824, .416)` |
| Learned or currently learnable | 1.0 | sRGB `(.302, 1, .416)` |
| Learnable with unlimited points only | .55 | Locked milestone or ordinary border below |
| Blocked by row, prerequisite or other capstone | .22 | Locked milestone or ordinary border below |
| Locked milestone | As above | sRGBA `(.64, .21, .93, .6)` |
| Ordinary locked node | As above | sRGB `(.169, .129, .071)` |

The same constructor confirms `(column + .5) * 90 - 23` and
`(row + .5) * 74.285713 - 23` cell positions, and 10px/5px milestone/ordinary
radii. Existing source uses the corresponding layout calculations.

## Current prerequisite connectors

Tree body `0x14026f710` calls current connector constructor `0x1400d20d0`
at `0x14027051c`, after the tree art and before the cells. That constructor
resolves each prerequisite, reads **both** definitions' row/column fields,
and constructs a rotated vertical bar. The source's old vertical-only links
have been replaced by this current behavior, including the branches from
center-column Blood Frenzy to Dire Bear Form in column 0 and Cat Form in
column 2.

For parent and child center points `a` and `b`, recovered current fields are:

- Centers: `x = (column + .5) * 90`, `y = (row + .5) * 74.285713`.
- Bar width: 4px. Height: `max(length(b - a) - 46, 0)`.
- Left: `(a.x + b.x) / 2 - 2`. Top:
  `(a.y + b.y) / 2 - height / 2`.
- UI rotation: `atan2(-direction.x, direction.y)` where direction is the
  normalized `b - a`; invalid reciprocal length falls back to angle `-0.0`.
- Node border: 2px all sides; corner radius: 2px all corners.
- Prerequisite at its maximum rank: gold fill sRGB `(.973, .824, .416)` and
  a gold shadow with alpha .6. Otherwise: brown fill sRGB `(.35, .30, .22)`
  and a black shadow with alpha .85. Both shadows use 0px x/y offsets,
  0px spread, 6px blur.

The native link does **not** populate an explicit BorderColor component.
The generic spawn `0x1401e6cd0` copies exactly `0x1d8` bytes from the bundle
at this call: Entity 8, Node 384, UiTransform 32, BackgroundColor 20,
BoxShadow 24 and alignment padding. The source preserves the required
BorderColor default. The gold/black alpha block feeds color conversion
`0x144c79aa0` and shadow constructor `0x14264cf40`, rather than a border
color constructor. The current shadow helper and exact native constants,
math import names and field stores are retained in the evidence.

## Starter label on the home screen

The current class pane `0x140241ed0` loads the ClassDef starter key pointer
and length at +0x40/+0x48 (`0x1402430e4`/`0x1402430e8`), resolves it through
`0x14540eb90`, and obtains its localized ability name through `0x14540e2e0`.
The definition layout is owned by [the current catalog recovery](menu-catalog-0.97.2.md).
This path uses the base class starter rather than selecting a replacement
from talent effects. The source home-screen label remains based on ClassDef;
the Feral descriptions are not used to invent a Shred home-screen substitution.

## Validation boundary and remaining work

- The current SHA-guarded extractor ran as static PE/data recovery and wrote
  the 354 definitions plus byte provenance. REA/Ghidra analyzed the current
  consumer slices; original-PE instruction operands corroborated argument
  registers and referenced data. Native target execution: **not run**.
- The added Rust tests cover current catalog counts/capstone records,
  capstone exclusivity/refund, and normalization ordering/budget. Tests,
  compilation and compiler checks: **not run**, under the source-only mode.
- Overall talent page geometry, art cropping, pane wrapping and selection/input
  transitions retain historical reconstruction until separately recovered
  and compared to 0.97.2. Current prerequisite connectors, cell positions,
  gating tint/color states and exclusive warning were recovered and updated
  in this pass; none has current runtime or pixel parity verification.
- Menu allocation and display are implemented source, not verified behavior.
  Whole-save migration/import, duplicate records, serialization byte parity,
  malformed XP overflow behavior and runtime persistence are not established
  by this work. Gameplay talent application remains excluded.
