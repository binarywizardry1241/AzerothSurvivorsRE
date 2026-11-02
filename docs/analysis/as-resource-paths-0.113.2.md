# AS resource URI producers — 0.113.2

EXE SHA-256 `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This [bounded proof](evidence/0.113.2/as-resource-paths.json) classifies the
original `Q41-D03:resource_path:0..5` candidates under #41 / `Q41-R01`.
It does not close the other resource, decoder, alias or rendering questions.

## Recovered producers and source consumers

The six original candidate strings begin at the `//` within complete `mpq://`
URIs. Their original literal offsets/hashes, basename-only classification and
all303 original candidate records remain unchanged. A missing exact archive
match for the partial literal is therefore not a missing-asset finding.

| Original selector | Complete URI suffix after `mpq://` | Current native/source connection |
| --- | --- | --- |
| resource_path:0 | `interface/paperdollinfoframe/ui-character-skills-bar.blp` | `0x14019a5e0` copies the complete62-byte URI into the asset interface; `progression::load_art` supplies the handle used by `bar_flow`. |
| resource_path:1 | `interface/glues/charactercreate/ui-charactercreate-races.blp` | Existing current [race-atlas proof](race-portraits-0.113.2.md), #51, owns the SIMD URI copy, image construction and real race-button source consumer. |
| resource_path:2 | `interface/glues/common/glue-rightarrow-button-up.blp` | `0x140305380` selects one of two16-byte pointer/length records at `0x145eff7c8`; existing Armory feature-arrow load/action consumers use both exact paths. |
| resource_path:3 | `interface/buttons/ui-rotationright-button-up.blp` | `0x1402c9640` selects one of two16-byte records at `0x145eff878`; existing Armory turn-arrow load/action consumers use both exact paths. |
| resource_path:4 | `interface/dialogframe/ui-dialogbox-gold-dragon.blp` | `0x140289270` copies the complete56-byte URI; `progression::load_art` supplies the handle consumed by `achievements_sidebar::draw`. |
| resource_path:5 | `interface/minimap/minimap-trackingborder.blp` | Existing current [meter proof](meter-minimap-0.113.2.md), #56, owns the border URI and actual meter-button source consumer. |

The two arrow tables additionally supply the matching `glue-leftarrow-button-up`
and `ui-rotationleft-button-up` URIs. All eight complete paths have an available
BLP2 member in the installed MPQ chain, with full content hashes and header
dimensions retained in the proof. No member is copied into a deliverable.

The new replay executes six original URI-producing slices (bar, dragon and both
arrows in both tables) and observes two rotation-index bounds cases. It stops
at the first asset interface, `0x140159a10`. Original SIMD/immediate stores,
pointer/length selection and URI publication execute; allocation and memcpy
are explicit seams. Rotation's unsigned bound rejects2 and u64max before the
interface. Feature fixtures use only0/1; no arbitrary-index safety is claimed.
Eight fresh Ghidra observations independently identify the four current owners.
The race/meter proofs are reused by hash without another native extract.

## Validation and limits

`python3 -B scripts/check-as-resource-paths.py` verifies the six original
selectors, eight native control cases, all nine archive identities and eight
complete asset payload/header identities. Source tracing connects load keys to
the existing handle consumers and benilla MPQ reader. No new source omission is
demonstrated for these paths, so no substitute art or loader is introduced.

This does not execute native asset loading, texture codecs/pixels, the source
renderer, actions/layout, mount/locale replacement, or arbitrary dynamic aliases.
Availability and exact URI bytes do not certify displayed colors, crops, filtering,
geometry or parity. Other297 original candidates retain their existing evidence
and producer questions. Generic engine reconstruction remains outside scope.
No compilation, Rust/client/game execution, binary asset export or controlled
original/rebuilt comparison ran. Original census/selector populations are unchanged.
