# Star/set core

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the bounded core recovery and source under **#242/#245**;
[verification-needed](../verification-needed.md) owns overall implementation status.
The [manifest](evidence/sets-core/manifest.json) binds original code/data,
five durable Ghidra query receipts, source/asset hashes and exact limits.

## Recovered boundary

| Native owner | Contract |
| --- | --- |
| `145ac4160` | Receives pointers to nineteen `u32` equipment IDs and nineteen parallel `u8` star ranks. Before catalog lookup, valid compact IDs with PvP rarity digit6 normalize to digit5. Only metadata with nonzero class and armor slot below8 contributes. The function counts six tiers and takes each tier's minimum star. The first tier with count at least8 and minimum at least3 activates; minimum at least5 empowers. No match returns tier6/discriminant2. No additional selected-class filter exists in this consumer. |
| `145ac19f0` | Queries the original item ID. Armor metadata yields set ID `0xa000 + (class << 4) + tier`; a valid Horde PvP digit6 ID uses low nibble15 instead. Missing metadata, zero class or nonarmor returns0. |
| `145ac0f90` | Accepts selected class plus the equipment/star arrays, calls the activation owner, rejects its absent discriminant, and passes class/tier plus multiplier1.0 or1.5 to the descriptor constructor. Exact floats are at `1461981a0`/`146198988`. |
| `145ac1b40` | Constructs all54 class/tier descriptors for classes1/2/3/4/5/7/8/9/11 and tiers0–5. Each supplies a spell key, exact description, two displayed values and owned 64-byte effect records. Unsupported classes/tiers return the absent variant. |
| `145ac1180` | The observed tooltip-record builder decodes the `0xa000` set-ID family and uses the same descriptor constructor. This query supplies navigation and descriptor correspondence; full SetTip registration and UI execution remain separately owned. |

The catalog consumer reads tier at metadata `+0x30`, armor slot at `+0x48`
and class at `+0x69`. The current getter `145b01970..145b02c35` independently
computes compact-ID class/slot/rarity from thousands/hundreds/tens digits,
requires a valid multiple-of-ten/range/rarity domain and normalizes rarity6 to5.
Its exact final stores publish those same metadata fields. The actual prefix
is exercised with a synthetic class-catalog-presence seam; complete later
item-membership, localized names and effect construction are not inferred.
The isolated activation/identity checks additionally supply explicit metadata
tuples to cover their consumer boundaries independently of those other fields.

`145ac1180`'s tooltip-ID prefix is also exercised. It accepts IDs at least
`0xa000` whose low class byte is supported and tier nibble is0–5 or15. Nibble15
selects tier5 plus the Horde PvP identity. The source preserves its observed
high-prefix behavior rather than introducing an extra prefix-equality guard.

The current SetTip selector also establishes the canonical four-piece descriptor
rows. Relative-pointer table `14730daa8` and count table `14730dac0` select
`(tag9,.25)+(tag8,.30)`, `(tag13,.015)`, `(tag11,integer1)`, `(tag12,.06)`,
`(tag4,.30)` and `(tag14,.12)` for tiers0–5. Six original prefix cases capture
those exact pointer/count and payload values at the existing clone boundary.
`four_piece_effects` supplies that one canonical lookup to stats and tooltip
consumers. This table lookup alone does not establish when worn/star state
activates the bonus or name tags13/14’s actual gameplay consumers.

## Source and asset

[`sets.rs`](../../crates/azeroth-survivors-re/src/sets.rs) supplies the exact
identity/normalization/activation helpers and static descriptor lookup. Its
catalog boundary accepts the existing gear catalog's typed `Piece` projection;
it does not infer a set from an item's name. The
[pointer-free asset](../../crates/azeroth-survivors-re/assets/sets-0.121.0.json)
contains108 ordinary/empowered descriptor variants generated from the current
constructor with its actual1.0/1.5 inputs. No reference EXE is needed to build
or load that source-owned asset.

Native effect tags and field-offset string keys are preserved. Native37/38
have to enter their proved current numeric/spell consumers explicitly. Native24
is a moving-ground effect and must never enter the older source24 extra-cast
path. Unwritten native padding is represented as zero without assigning it
meaning. Only the constructor variants’ proved string fields and raw7/selector2’s
KeyList at offset32 are normalized. The Rogue tier4 list is exactly
`sinister_strike`, `backstab`; its outer pointer/count becomes owned list data.
Every remaining byte-aligned eight-byte payload window was checked against the
current PE mappings, with no remaining mapped pointers. Owned strings/lists
retain their exact field offsets. Descriptions and raw records are evidence for constructor output,
not proof that each gameplay effect executes.

The integration interfaces are `active`, `item_set_id`, `descriptor` and
`equipped_descriptor`, `decode_set_id` and `four_piece_effects`. `Descriptor::effects` exposes typed native payloads so
the gameplay integration can translate the current tag domain deliberately.
The live four-piece activation/stat producer, gear/star/save inputs, tag/ability consumers,
SetTip/FrameXML publication and presentation remain independently traced source
connections; this bounded core alone does not close all of #242.

## Selected locale consumers

The existing item-set producer localizes each descriptor's English description
and the two SetTip format templates through `MenuCatalog::label`. All 14 source
catalogs lacked the 54 descriptions and two exact format lookup keys, so
non-English tooltips fell back to the English input. The current four-piece
formatter additionally requires `bonus.calm_regen` and `bonus.crowd_armor`. The source catalogs now append only the 54 descriptor keys,
two format keys and the two proved four-piece numeric labels, preserving every pre-existing entry. All 812 values are copied
from the current hash-bound native catalogs; no translation is invented.

The [selected-key receipt](evidence/sets-core/localization.json) records
only these 58 keys/values and the fourteen existing native payload descriptors.
Whole native catalogs are not extracted. The bounded check also verifies the
already present Heroic rank/twist/Difficulty labels, spell display-name keys and
set title keys against their current native values; those entries require no
additional mutation. Internal spell IDs remain identifiers, not bare locale keys.

```sh
python3 -B scripts/check-set-localization.py
```

This establishes source catalog data and the inspected localization consumers.
Actual FrameXML/Lua lookup, line layout, input and original/rebuilt presentation
remain unverified.

## Static evidence and limits

The [static result](evidence/sets-core/static-check.json) records **2,661
isolated cases /201,324 original instruction steps**:273 constructor-domain cases
and2,388 activation, set-ID, PvP normalization, live multiplier-input, tooltip-ID
decoder, actual compact-gear prefix and four-piece table-selector cases.
Actual1.0/1.5 variants are source data; scalar2.0 is only an additional fixture
input. Native code/data spans and all five Ghidra raw-subject receipts were
verified against the installed full-image hash. The new Rust module syntax
parses with the existing pinned formatter; no Rust code was compiled or run.

Reproduce the bounded instruction/asset recovery with the existing dependencies:

```sh
PYTHONPATH=runtime/tests/query-python-deps:runtime/tool-state/python/armory/python-libs python3 -B scripts/recover-sets-core.py --write --asset
```

Allocation, roundf, catalog return tuples, class-catalog presence, the skipped
SetTip name builder and deallocation are explicit synthetic
seams. The Windows CRT, allocator, complete actual gear names/effects/membership producer, ECS/gameplay loop,
network, saves, UI/VM, rendering and rebuilt source are not executed. Compiler,
application/game/network/server operation and original/rebuilt parity remain
unverified. The installed inputs were read in place and were not modified.
