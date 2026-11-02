# Custom diagnostic-site roles and marker lookup — 0.113.2

Target SHA-256 `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The [compact proof](evidence/0.113.2/q41-custom-diagnostics.json) selects
**all 57 C01 sites across thirteen custom paths**, reproducing the canonical
selector digest before classification. Fresh REA/Ghidra queries verify each
instruction; all remain outside actual FunctionManager bodies, including after
explicit code seeds. Declared extents remain provenance, never asserted owners.

| Observed local role | Sites | Meaning and remaining boundary |
| --- | ---: | --- |
| Bounds-failure interface | 30 | Local flow reaches the existing native bounds-failure call. Successful index producers and containing gameplay contracts retain their owning proofs and alias limits. |
| Formatted failure interface | 21 | Location and formatting arguments reach the native failure interface. This does not establish the complete successful resource or content lookup. |
| Missing-key failure | 1 | The marker renderer looks up generated mask key 4; the empty-map and exhausted-probe edges share the selected diagnostic. |
| Option failure | 1 | Local flow reaches the native Option-failure interface; successful ability dispatch remains independently owned. |
| Ordinary stable-vector removals | 2 | Locations are forwarded to shared helpers rather than initiating a failure. Fresh Ghidra recovers 8-byte and 120-byte stable removal, bounds gates, shifting, length decrement and returned value. |
| Adjacent literal context | 2 | The instructions address five-byte `spell`, immediately preceding the 38-byte `auras.rs` filename. Their formatting records explicitly use length five; neither consumes the filename. |

This classifies site roles without assigning 57 complete AS behaviors. The two
literal relationships remain in every original inventory and count. Their
source ownership cannot be inferred from the adjacent filename. Shared
bounds/formatting/panic implementation is supporting engine context, where this
branch stops. The two ordinary vector interfaces pass 109 original-instruction
cases across empty/eight-row vectors, valid indices, end and u64-max rejection.
The fixture supplies owned vector memory and a bounded memmove seam. Its
zero-leading-word case verifies that the 120-byte helper shifts/decrements
before failing. Caller index/value meaning, ownership/drop behavior and complete
live consumers remain separate contracts.

`Q41-C01-markers-14017c9a2` now has a bounded answer: native predecessor edges
`0x14017b83a` and `0x14017b930` reach `0x14017c99b`, which supplies the literal
“no entry found for key” and the exact `markers.rs:282:15` Location. The actual
query key is four. Its successful branch returns a generated-mask entry from
the eight-key startup texture map. The existing source's `MASK_SIZES` enumeration
creates all eight masks before `renderer.masks[group.mask]` is consumed, with
matching key4 membership. No additional missing AS source operation is established.
The owning renderer remains [#43](raid-markers-0.109.0.md), with historical
provenance outside this explicitly current lookup boundary.

The checker executes **6,145 native marker cases**: an empty map, and all 128
hash fingerprints × sixteen starting buckets for missing, direct-hit and
collision-hit maps. The hasher is intercepted with a declared result; key
publication, the actual map/probe instructions and successful entry address
are checked. This does not execute the hash algorithm, texture producer,
resource handles, geometry projection, ECS or GPU.

`python3 -B scripts/check-q41-custom-diagnostics.py` independently checks
the installed target, selector inputs, all nineteen declared byte ranges,
retained Ghidra responses and native fixture results. `--stage` writes proposed
proof under ignored runtime storage. No duplicate full-owner assembly is curated.
No compilation, source-language/game execution, real resource/input/rendering or
original/rebuilt comparison ran. The global source/semantic/alias inventory and
other unknown queue members remain open under #41; counts are unchanged.
