# Creature queries

Creature queries resolve finite AS template metadata and deliver it through the
engine's existing `CreatureName` response, `NameCache` and Lua/tooltip consumers.
The local request bridge forwards `ClientCommand::CreatureQuery` into the active
AS session. The [request lifetime contract](local-request-lifetimes.md) keeps
responses available without an optional Game while the local channel is active
and drains them on disconnect. Co-op uses the requesting member's locale.

The latest complete finite-table proof covers **252 templates** across **148
ordinary enemies, 60 bosses and 44 special templates**. It resolves the thirteen
CreatureQuery dispatch questions under #41. The [verification register](../verification-needed.md#gap-64)
owns remaining cache, FrameXML, network and parity work. The
[template wire report](template-query-wire.md) owns packet prefix, GUID and
decoder behavior, including the separate short co-op entry correction.

The [finite proof manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.120.2/creature-query-tables/manifest.json)
binds eight journaled Ghidra results, native byte ranges, table cells and source
consumers to the [instruction replay](evidence/creature-query-tables/native-check.json).
Native addresses and counts below apply to that proof's target.

## Entry, fields and consumers

The recorded shared command owner is `145b01eb0..145b04a8a`. Its normal opcode
`0x60` path reads the little-endian entry prefix and dispatches these thirteen
tables. Other opcodes, other interior entry contexts and surrounding engine
behavior are outside this contract.

| Existing template population | Current native producer | Connected source |
| --- | --- | --- |
| Ordinary enemies | Name getter `145a7e610`; zone-subtitle getter `145a7e980`; selected native type/rank/display fields | Shared `ZONES` enemy records; `enemy.<entry>` and `zone.<key>.subtitle` with raw fallbacks |
| Bosses | Name getter `145a7e790`; selected type/display and rank 3 | Shared `ZONES` boss records; `boss.<entry>.name` with raw fallback; empty subname |
| Named special objects | Name getter `145a7dc80` and exact special branches | Existing `SPECIALS` object keys, literal defaults, type/rank/display records |
| Companions | Selected native descriptors, name lookup and `Companion` subname | Existing thirteen ordinary pet records plus White Devilsaur 9530/9531 |
| Valid empty-name templates | Current leaf `145bff050..145bff06c` bounds its descriptor lookup to 9601..9626; earlier named-object branches take precedence | Existing 9612..9626 empty-name mechanical rows, type 8/rank 0 and their exact displays |

The query still distinguishes a valid empty name from a miss. Hit serializer
`145c47150..145c47714` emits opcode `0x61`, the entry, name plus three empty
alternate names, subname, seven u32 words and two bytes. Type flags, pet family,
the unused word, pet-spell list, civilian and racial-leader values are zero in
these records. Miss serializer `145c42d30..145c42d90` emits only
`entry | 0x80000000`. The five extra u32 boundary checks retain the decoder's
high-bit treatment; they are samples beyond the exhaustive u16 request domain.

Source `client/creature_queries.rs` uses the shared enemy/boss catalogs and
`SPECIALS`, then passes the typed result through `query_packets`. The shared
encoder supplies the packet and the existing `parse_server` / event decoder
preserves the miss bit, empty-name and empty-subname distinctions. Local
requests use the ordinary presentation queue. `NameCache::on_creature_name` supplies the
existing held-unit `UNIT_NAME_UPDATE` and `UNIT_CLASSIFICATION_CHANGED` notices.
These live source paths are inspected and hash-bound; they were not executed.

## Thirteen stable table questions

Every row retains selector
`Q41-F01:correspondence:retained-table-<historical dispatch>`. These dispatches share one metadata contract.

| Historical dispatch identity | Current dispatch | Stored cells | Cells selected by normal u16 requests |
| --- | --- | ---: | ---: |
| `145afa2a7` | `145b02b87` | 112 | 112 |
| `145afb3fb` | `145b03cc2` | 94 | 94 |
| `145afb49a` | `145b03d61` | 22 | 22 |
| `145afb64e` | `145b03f15` | 101 | 101 |
| `145afb798` | `145b0405f` | 95 | 95 |
| `145afb7c1` | `145b04088` | 95 | 95 |
| `145afb7ed` | `145b040b4` | 12 | 12 |
| `145afbad2` | `145b043af` | 195 | 195 |
| `145afbb29` | `145b043d7` | 95 | 95 |
| `145afbb66` | `145b04414` | 10 | 10 |
| `145afbb92` | `145b04440` | 5 | 5 |
| `145afbe39` | `145b046e7` | 495 | 461 |
| `145afbed3` | `145b04781` | 89 | 87 |

All **1,420** immutable cells match their current byte commitments. Original
execution records the index before each indexed load and its computed
destination. All **1,384** selected cells agree with the stored target, and
every distinct stored destination is reached as an actual instruction.

The 36 unselected cells add no unseen successor. The 495-cell table subtracts
1000; its skipped indices are 200..211, 290..294, 300..311 and 390..394.
Entries 1200..1211, 1290..1294, 1300..1311 and 1390..1394 take earlier template
branches. The 89-cell table subtracts 306; indices 2/3 correspond to entries
308/309, also handled earlier. All 36 stored cells point to the already
executed miss block `145b0478f`. This establishes the normal interface's table
meaning without claiming arbitrary forged register/interior-entry contexts.

## Static checks and limits

The native probe executes the current command owner, four name getters, the
descriptor leaf and both serializers. It intercepts sender `145b24400` and uses
synthetic host/packet buffers. Allocation, growth, memory operations, Rust key
formatting and locale lookup are explicit seams; unreviewed external calls fail.
The manifest binds the imported probe/PE/coverage/loading scripts, checker hashes
and **Unicorn 2.1.4 / Capstone 5.0.7** versions.

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs \
  python3 -B scripts/check-creature-query-tables.py
```

The retained replay passes **65,536 u16 requests: 252 hits / 65,284 misses**,
**3,780** template cases across fourteen locale maps plus missing-key raw
fallback, and five additional u32 miss boundaries. It executes **10,601,873
original instructions / 1,390 distinct sites**. The separately owned prefix
proof retains its length/GUID cases; this check does not duplicate them.

The source connection and output fields match within this finite contract.
The seven helper queries and the containing-owner query do not establish
complete semantics for other command cases, the localization subsystem,
arbitrary aliases or the reused engine. No compiler, client, game, socket,
server or controlled original/rebuilt comparison ran. Existing Rust tests
remain uncompiled and unrun.

The [earlier proof](evidence/creature-queries.json) recorded 246
templates and 80 truncated-length and GUID cases. It also binds the
[branch transcription](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.113.2/creature-query-branches.asm) for the
empty-name leaf outside the unwind inventory. Its exact source and findings
remain historical inputs for the broader wire proof.
