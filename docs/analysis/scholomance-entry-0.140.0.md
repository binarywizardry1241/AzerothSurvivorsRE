# Scholomance entry and save progress in 0.140.0

The installed EXE SHA-256 is
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
[Entry evidence](evidence/0.140.0/scholomance-entry.json) binds the new source
data to its exact PE ranges. The [zone discovery](scholomance-0.140.0.md#zone-entry-resources-and-unlocks)
records the independently recovered DBC, WDT, ADT and loading-screen members.
All twelve installed archives match the registered hashes.

The 240-byte record at `0x1473b6420` is zero-based ordinal 10, after Blackrock
Mountain and before Ahn'Qiraj. It supplies map 289, area 2057, spawn
`(128, 167, 94.1f32)`, facing zero, radius 46, midnight, and no weather.
The indoor field at +0xec is 1, as in Scarlet Monastery and Naxxramas. The
+0x58 slice supplies a thirteen-point boundary. The source shares these
values across menu/startup, local and guest world entry, terrain recovery,
boundary sampling and addon metadata. The existing engine resolves map 289
through Map.dbc into the SchoolofNecromancy WDT/ADTs and screen 102. The menu
card independently uses the same recovered Scholomance loading artwork.

The ordinary spawn and Guardian catalogs share the ten 80-byte enemy rows,
including four keyed Guardian indices and positions. The five 104-byte boss
headers retain the authored time, actor fields and yells. The cache owner
projects its XP, death budget and flag from those same enemy rows. The
encounter scripts and the Guardian move consumers are separate work under
[#313](../CURRENT-STATE.md#gap-313) and [#89](../CURRENT-STATE.md#gap-89).

The native save parser's eleven-byte compare at `0x145e0a2e5` selects
one-based ordinal 11 at `0x145e0a344`. The save selection consumer at
`0x145e068cc` clamps to thirteen and multiplies the zero-based index by
`0xf0`. Source preserves keyed `open`, `beat` and `hbeat` entries and
resolves legacy numeric unlocks through their original nine keys. Clearing
Blackrock Mountain opens Scholomance; a retained Ahn'Qiraj or Naxxramas unlock
continues to include that zone. The co-op profile uses the same thirteen
ordinals for its open count and per-zone Heroic ranks. Retained reward,
star-cap and achievement descriptors resolve current indices by key so the
insertion cannot address a neighboring historical table row. Tier 0.5 loot
and new achievements remain under #314 and #315.

Static checks compared all thirteen keys, the entry fields, ten enemy rows,
five boss headers and thirteen vertices against the verified image, and
checked the native save query receipt. Rust regressions describe keyed
unlock/clear preservation and old fixture correspondence. The current
native co-op profile normalization and retroactive inferred clear cases
need additional correspondence. Compilation, MPQ rendering and actual
solo/co-op entry and save outcomes remain unverified.
