# Explosive Orb query source — 0.121.0

Finding **#247** is source-corrected for installed EXE SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [query identity proof](explosive-orb-query-0.121.0.md) supplies the entry
selector, descriptor and null-only localization fallback. The separate
[source/constructor proof](evidence/0.121.0/orb-source.json) adds the actual
fourteen locale payloads and metadata packet constructor. Combat and actor
model selection remain separate under #224/#248.

## Source and packet connection

`gameplay/client/creature_queries.rs::SPECIALS` now publishes entry **9612** as
raw **Explosive Orb**, key **`object.9612.name`**, empty subname, creature type
**10**, rank **0** and display **16111**. It replaces that entry's earlier valid
empty-name/type8/display10990 template without changing other query cases.
All fourteen source catalogs receive only this exact current key/value. The
existing lookup preserves a non-null empty override; a missing key uses the
raw name. No translation was invented.

Current locale descriptors begin at `0x14765af88`, fourteen 56-byte records.
Each receipt binds its descriptor and pointer/length-bounded UTF-8 JSON payload
to exact file ranges and hashes. The constructor `0x145b85c20..0x145b861e4`
contains **1,476 bytes / 363 independently decoded instructions**. It writes
opcode **0x61** and the following body:

1. Little-endian u32 entry; name bytes plus NUL; three empty alternate names;
   subname bytes plus NUL.
2. Seven little-endian u32 fields: zero type flags, creature type, zero pet
   family, rank, zero unknown field, zero pet spell list, display ID.
3. Zero civilian and racial-leader bytes.

This matches the existing `coop::engine_packets::encode` CreatureName branch,
the `gameplay/client/query_packets.rs` route and the engine's existing
`SMSG_CREATURE_QUERY_RESPONSE` parser. The repair reaches the actual query
producer and serializer/parser boundary rather than creating a second metadata
cache or changing renderer state. Descriptor scale0.9 remains outside the
query contract.

## Static verification and limits

```sh
python3 -B scripts/check-explosive-orb-source.py
```

The checker verifies current target/range hashes, all fourteen locale values,
the journaled Ghidra raw-subject mapping and live source boundaries. **Nineteen
original-constructor cases / 4,992 original instruction steps** cover every
locale, missing-key fallback, a valid empty name, UTF-8 override, a long name
and embedded NUL bytes. Allocation, reserve and memcpy are explicit synthetic
library seams; the original instructions produce the packet bytes before any
client delivery. These vectors retain their exact name-to-packet results.

The authored Rust regression checks the actual source producer and encoder
against the current vectors; it is **uncompiled and unrun**. Its historical
0.113.2 sweep skips the now-superseded entry9612 row, retaining all other
historical cases. The original query proof's pre-repair source-omission check
remains historical; the source checker above owns the repaired route.

No application compilation, compiling tests, rebuilt Rust execution, actual
client/server/network delivery, world model loading/rendering, combat or
original/rebuilt comparison occurred. Those are distinct from the completed
query-metadata source repair.
