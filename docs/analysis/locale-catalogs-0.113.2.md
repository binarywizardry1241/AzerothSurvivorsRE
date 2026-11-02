# Locale records and language index — 0.113.2

Target SHA-256 `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The [proof](evidence/0.113.2/q41-language/proof.json) resolves
`Q41-P01-language-14004fa5f` under #17/#41. Overall status remains in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

Fresh REA/Ghidra connects the language screen's call at `0x14004fa5f` to
`0x1458971e0`. The complete getter reads the persistent u64 index at
`0x1481ed0e0`, clamps it unsigned to thirteen and returns an immutable
56-byte record from `0x1472ffef0`. The caller immediately copies the record's
code pointer/length into the real language-list constructor `0x140301380`.
That constructor compares the code against the fourteen rows when constructing
selected and ordinary choices. The record itself is static, rather than a
temporary allocation returned across this call.

The index producer `0x145895970` is outside the declared unwind extents. It
accepts exact case-sensitive two-byte codes in the source's existing order,
stores their indices and selects English for every other value/length. The
complement inventory recovers its writes independently of the declared-only
reader inventory. This bounded producer/getter contract establishes neither
arbitrary mutable-alias closure nor the complete virtual UI resource lifetime.

Each record contains code and autonym pointer/length pairs, an embedded JSON
pointer/length pair, and a trailing word. The latter is one for zh/ja/ko and
zero otherwise; its role is not inferred from that correlation. All fourteen
native catalogs contain **2,923 identical keys / 40,922 values**. The retained
0.112.0 catalogs omitted 81 keys each; all 2,842 previously retained values per
language still match. Source now includes the full exact current payloads,
normalizing only CRLF to LF. The existing `CATALOGS` → `catalogs::load` → active
`Localization`/menu consumers use them. Existing UI-only co-op labels can now
resolve through the ordinary lookup before its retained compatibility fallback.
Recovered co-op text introduces no multiplayer behavior.

`python3 -B scripts/recover-locale-catalogs.py` checks the selected EXE,
descriptor mapping, code/autonym order, every payload hash and exact source
bytes. It executes **65,800 original-instruction cases** in Unicorn: every
two-byte value (65,536), five invalid lengths with an unreadable string pointer,
and 259 getter indices including u64 boundaries. Neither leaf calls an external
function. The selected [producer](evidence/0.113.2/q41-language/index-producer.asm)
and [getter](evidence/0.113.2/q41-language/record-getter.asm) have canonical extracts;
complete REA responses remain in ignored project-local runtime storage.
`--write --stage` reproduces source payloads and stages proof for review.

The Rust catalog regression expects the new key count but remains uncompiled
and unrun. This is current data/index-interface evidence only. The
[historical loader/parser/startup/persistence contracts](localization-0.109.0.md)
retain their actual target. No application compilation, Rust execution,
file/environment operation, input/layout/font/GPU check, game launch or
original/rebuilt parity comparison occurred. Native/source discovery and
unresolved aliases elsewhere remain open under #41.
