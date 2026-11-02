# Fixed gameplay definition tables

> Historical analysis of **0.91.4**, preserved as `AzerothSurvivors/AzerothSurvivors-0.91.4.exe` (SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`). The current target is **0.97.2**; this report remains bound to 0.91.4 and has not been revalidated against the new target. See [current target provenance](target-refresh-0.97.2.json) and the [historical 0.92 refresh](target-refresh-0.92.json).

A bounded pointer walk recovered actual fixed definition records beyond the English text: **111 abilities, 22 rings/trinkets, 17 general amulets, 27 talent trees and 353 talents**. This is data needed to reconstruct the selected 0.91.4 game. It does not yet decode all runtime formulas or effect variants.

- Target SHA-256: `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`.
- [Structured tables](evidence/mechanics-tables.json) retain exact record bytes, file offsets, preferred-image VAs, lengths and SHA-256, plus all referenced names/descriptions and raw effect payloads.
- [Extractor](../../scripts/extract-mechanics-tables.py): `python3 scripts/extract-mechanics-tables.py`.
- Every ability name, jewelry/amulet name and talent name/description is checked against the exact embedded English catalog. Talent prerequisite keys resolve within their own tree. The extraction reads only the EXE and retained local evidence; it does not execute the target or inspect MPQs.

## Record layouts observed through pointer relationships

| Table | File offset / preferred VA | Count | Stride | Observed structure |
| --- | --- | ---: | ---: | --- |
| Abilities | `0x66c9730` / `0x1466cab30` | 111 | 120 | Rust string pairs at +0 key, +16 name, +32 icon; opaque byte-slice pair at +48; numeric and packed payload from +64 |
| Rings/trinkets | `0x66cf140` / `0x1466d0540` | 22 | 72 | String pairs at +0 key, +16 name, +32 icon, +48 description; float +64 and four packed bytes +68 |
| General amulets | `0x66d03d8` / `0x1466d17d8` | 17 | 80 | String pairs +0/+16/+32; effect slice +48; two raw 64-bit words +64/+72 |
| Talent class index | `0x68a56d8` / `0x1468a6ad8` | 9 | 200 | Three 64-byte tree descriptors, then class ID at +192 |
| Talent descriptors | Each tree's pointed-to slice | 353 total | 104 | Key/name/icon string pairs +0/+16/+32; effect slice +48; description +64; optional prerequisite key +80; packed bytes +96 |

Each tree descriptor contains name, background and icon string pairs, followed by its talent slice pointer/count at +48. Class IDs are `1,2,3,4,5,7,8,9,11`. Every tree has 13 talents except Warrior Protection and Paladin Protection, which each have 14. Packed talent bytes +96/+97/+98 fit row/column/maximum rank: rows0–6, columns0–2 and ranks1/2/3/5. All 353 records have zero in bytes99–103. Native consumers must confirm those meanings and prerequisite rank requirements.

The effect slices use 64-byte entries; 308 talents reference one effect,34 reference two,9 reference three and2 reference four. These are variant payloads: interpreting every leading word as the same enum tag or every +4 word as a float magnitude would be wrong. The evidence preserves raw bytes; its `u32_at_0` and `f32_at_4` are typed views of bytes, not universal effect semantics.

## Ability parameter candidates

Numeric columns are identified by exact offsets. Candidate meanings are +64 spell ID, +68 base effect magnitude, +72 cooldown seconds, +76 target range, +80 area radius, +84 target count and +88 duration. These assignments are provisional until native consumers confirm how each spell uses them, especially proc, healing and shield spells.

| Ability | +64 u32 | +68 float | +72 float | +76 float | +80 float | +84 u32 | +88 float |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Cleave | 845 | 47 | 1.5 | 7 | 0 | 3 | 0 |
| Whirlwind | 1680 | 48 | 4.5 | 0 | 8 | 0 | 0 |
| Consecration | 26573 | 96 | 8 | 0 | 8 | 0 | 8 |
| Judgement | 20271 | 200 | 6 | 12 | 0 | 1 | 0 |
| Divine Shield | 642 | 0 | 32 | 0 | 0 | 0 | 4 |
| Auto Shot | 75 | 34.5 | 1.1 | 32 | 0 | 2 | 0 |
| Chain Lightning | 421 | 39.5 | 2.4 | 28 | 12 | 5 | 0 |
| Fireball | 133 | 50.5 | 1.3 | 30 | 0 | 1 | 0 |
| Faerie Fire | 770 | 200 | 1 | 30 | 8 | 1 | 0 |

The table covers every one of the111 named ability IDs in the English catalog, including101 class-pool entries, eight racials, Penance and Arcane Power. Its values are base definitions, not final damage/cooldown after ranks, class factors, talents, jewelry or runtime conditions.

The +48 slice contains bytes, **not school text**. For example Cleave has `00,01,02`, Whirlwind `00,01,03`, and Battle Shout `01,04`. These correlate with available upgrade dimensions (possibly magnitude/cooldown/targets/area/duration), but the evidence intentionally names the field `opaque_byte_slice_at_48` until upgrade consumers confirm the mapping.

The rings/trinkets table holds nine rings then13 trinkets. At +69 the first nine store0 and the next13 store1, consistent with a slot discriminator. Examples of +64 raw floats are Band of Accuria0.17, Quick Strike Ring0.09, Seal of the Damned0.10, Hand of Justice0.06 and Major Soulstone1.0. Rarity, growth/caps, conditional offerings and effect application require code. The17 general amulets do not enumerate the generated spell-specific legendary necklaces.

## Focused native entry leads

A targeted RIP-relative LEA byte-pattern scan found references to the exact table bases in the following exception-directory function ranges. These are leads, not disassembler-verified function identities. REA/Ghidra should establish instruction boundaries and consumers before assigning original function names.

| Table | Candidate function range, end exclusive | Reference instruction |
| --- | --- | --- |
| Abilities | `0x1453e37e0`–`0x1453e3877` | `0x1453e37fc` |
| Abilities | `0x1453ec000`–`0x1453ec1b0` | `0x1453ec038` |
| Abilities | `0x1453ec1f0`–`0x1453ec508` | `0x1453ec26e`, `0x1453ec3b3` |
| Talent class index | `0x145440330`–`0x1454406cd` | `0x14544036b`, `0x145440392`, `0x1454404a0`, `0x1454405a0` |
| Rings/trinkets and amulets | `0x1454b1840`–`0x1454b2d10` | Jewelry `0x1454b1bad`; amulets `0x1454b25fe`, `0x1454b298a` |

The next useful step for these definitions is native decoding of effect variants and upgrade/stat consumers, not a wider string inventory. This pass establishes recoverable data layouts and exact binary provenance without asserting full behavioral parity.
