# AS template-query wire boundary

Installed target SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
141,932,032 bytes. Permanent finding **#65**, under **#41**, covers the local
Creature/GameObject response bridge bypassing the ordinary packet decoder.
Creature request delivery itself remains **#64**; ground-cache lifetime is **#49**.
[verification-needed](../verification-needed.md) owns current status. Source/static repair is
complete for this boundary; compilation, source/client execution and parity are
unverified.

The [current lifetime correction](local-request-lifetimes.md), #70,
uses local-channel activation for these metadata responses rather than requiring
an optional Game. The wire format and ordinary client decoder are unchanged.

## Current AS producer and source correction

Current incoming handler `0x1458646d0` consumes opcode0x5e's first four entry bytes,
zero-fills a truncated entry and ignores the trailing GUID. Name getter
`[0x145809000,0x1458091f6)` constructs the exact `object.*` lookup key and retains
a raw-name fallback. Serializer `[0x1458d58f0,0x1458d6748)` emits opcode0x5f:
entry, type and display, five C strings (name plus four empty strings), then
24 zero i32 data words. There is no size float. The entry is echoed unchanged,
including bit31. This revalidates the ordinary GameObject producer previously
supported only by 0.100.1 evidence.

| Entry | Type / display | Name key and raw fallback |
| --- | --- | --- |
| 9001–9003 | 5 /2614 | `object.xp` / Experience |
| 9004 | 5 /2614 | `object.gold` / Gold |
| 9005 | 3 /259 | `object.cache` / Battleground Cache |
| 9006 | 5 /5931 | `object.rune_speed` / Speed Rune |
| 9007 | 5 /5995 | `object.rune_berserk` / Berserker Rune |
| 9008 | 5 /5991 | `object.rune_restore` / Restoration Rune |
| 9009–9011 | 5 /342,3271,2232 | `object.magnet` / Magnet |
| 9012 | 5 /6671 | `object.lightwell` / Lightwell |
| 9013 | 5 /4831 | `object.edge` / Edge of the Battlefield |
| Other entries | 5 /2614 | `object.object` / Object |

The [Creature producer proof](creature-queries.md) already binds all 246
creature templates and opcode0x61 hit/miss serializers. Both local query adapters
previously constructed their final typed events directly. That bypassed the
reused client's actual wire rules: bit31 denotes an unknown template and is
removed from the decoded entry; names/subnames are NUL-terminated; empty Creature
names remain distinct from misses; empty subnames become `None`.

The AS adapter now serializes the recovered response fields and passes the bytes
through the existing `benilla_protocol::messages::parse_server` and
`benilla_protocol::decode`. Successful events use the existing presentation queue
and cache handlers. A refused packet supplies no event. The package explicitly
depends on the already locked workspace protocol crate; no new package/version
or application build is introduced. The protocol implementation is reused
without engine changes.

This preserves embedded NUL bytes from language overrides until the C-string
reader handles them. For example, a GameObject override `Cache\0tail` produces
the native byte sequence, whose decoded name is `Cache`. More embedded NULs can
shift the remaining names/data; the adapter follows the existing parser rather
than defining another normalization policy. There is no evidence that ordinary
AS gameplay generates high-bit GameObject entries; this is request-boundary
handling. The GameObject adapter also retains the exact raw fallback when a key
is unavailable. The embedded catalogs normally supply those keys.

## Evidence and checks

The [GameObject proof](evidence/0.113.2/object-queries.json) retains current native
range hashes, fresh REA/Ghidra Evidence IDs, all name/type/display classes and
full-output commitments. [Wire fixtures](evidence/0.113.2/template-query-wire.json)
retain 21 exact original response bodies and the inspected decoder's expected
field projections. No second complete incoming-handler extract is added.
The fresh Ghidra plans/responses remain under ignored
`runtime/analysis/history/findings/q41-object-query/bf123ebeeebd/`.

`python3 -B scripts/check-template-queries.py` passes:

- All 65,536 u16 GameObject entries, comparing every original response byte with
  source-derived selectors/names and zero data.
- 270 representative language/raw-fallback cases across all fourteen catalogs
  and a missing-key map, plus four u32 boundaries.
- Eighty payload lengths 0–15 across ordinary/default/cache templates, including
  ignored nonzero GUID bytes.
- Twenty-one Creature/GameObject byte fixtures covering ordinary, boss, missing,
  valid empty-name, high-bit, Unicode, empty override and embedded-NUL responses.
  The authored Rust regression compares serializer bytes and every decoded field
  with these fixtures using the actual reused parser. It remains unrun.

The checker executes original AS instructions with synthetic host/packet buffers
and explicit allocation, growth, memory, key-formatting and locale lookup seams.
Delivery is intercepted; no socket opens. Its Python decoder projection follows
inspected current source; it does **not** execute Rust or certify the native
client parser's complete behavior. The original current Creature proof remains
valid for its recorded raw producer fields; the wire fixtures add these byte
boundary cases.

Source guards, manifest/lock parsing and Rust syntax parsing pass. No compiler,
compiled tests, real client/cache/FrameXML, application, OS/network operation or
original/rebuilt comparison ran. Native client-parser equivalence, actual
scheduling/presentation and global protocol/alias closure remain unverified.
All original #41 census/selector counts are unchanged.
