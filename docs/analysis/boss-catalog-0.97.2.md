# Primary boss catalog — selected 0.97.2

Historical evidence; current boss catalog and source status are owned by [the 0.105.0 report](boss-catalog-0.105.0.md).

Date: 2026-10-18. Target: supplied Windows x64 EXE, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`. Static recovery; no game, compiler or Rust test was run.

The selected target contains **60 primary boss definitions in 12 zones**, with **191 ability records** and **10 fixed boss-placement points**. Each zone has five scheduled records. The canonical source remains [the shared guardian catalog](../../crates/azeroth-survivors-re/src/guardians/catalog.rs); [boss catalog.rs](../../crates/azeroth-survivors-re/src/bosses/catalog.rs) reexports those definitions and adds independently recovered point coordinates, avoiding competing copies of boss definitions or ability words. Normal builds never require the reference EXE.

The independent [boss byte inventory](evidence/0.97.2/bosses/catalog.json) re-reads every zone string, 88-byte boss row, seven-word/28-byte ability record, exact float bit pattern, yell and spawn point from the full hash-checked PE. The zone table is `0x146716438`, stride `0xf0`; boss slices are `zone+0x88/+0x90`, fixed-point slices `zone+0x68/+0x70`. All source offsets and span SHA-256 values are retained. [Recovery script](../../scripts/recover-boss-point-data.py). Original field names and Rust ABI layouts were not recovered, so raw fields retain native offsets.

## Ability legend

Every summary below includes the native repeat interval in square brackets. Initial ability timers are **0.6 × repeat interval**; enraged repeat timers use **0.7 × interval**. Units are seconds, distances are native world units, and damage factors multiply the native actor damage. Spell numbers identify actual native requests/visuals; they do not establish conventional WoW status effects or DBC behavior. For example, an area strike carrying spell 20549 does not inherently imply a stun.

| Native tag | Decoded inputs |
| --- | --- |
| 0 Ground area | Visual spell V, impact spell I, radius r, delay, damage multiplier. |
| 1 Missile volley | Spell ID and missile count. |
| 2 Summon | Minion count; the effect owner selects native enemy definitions. |
| 3 Area strike | Spell ID, radius r and damage multiplier. |
| 4 Charge | Spell ID; source movement/damage comes from the recovered effect owner. |

All 191 records fit these five recovered variants: 29 ground areas, 27 missile volleys, 60 summons, 44 area strikes and 31 charges. See [ability source](../../crates/azeroth-survivors-re/src/bosses/abilities.rs), [boss AI source](../../crates/azeroth-survivors-re/src/bosses/ai.rs) and [the complete boss report](bosses-0.97.2.md) for dispatch, enrage and effect ownership. Full native words remain available alongside the typed decoder.

## Per-zone roster

Times are elapsed run **minutes**, with an inclusive threshold. They describe schedule eligibility, not a requirement that the previous boss be dead. The tick creates at most one scheduled boss per admitted active tick; suppression, pause and frame timing affect actual appearance. The fifth record is flagged final. [Schedule and placement details](boss-spawning-0.97.2.md).

### Elwynn Forest (`elwynn`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 3 | 690 | Hogger | 0 | Charge 100 [7s]; Summon ×5 [14s] |
| 6 | 691 | Mother Fang | 0 | Area strike 339, r8, dmg×1.2 [7s]; Summon ×7 [14s] |
| 9 | 692 | Rhahk'Zor | 0 | Area strike 20549, r9, dmg×1.8 [7s]; Charge 100 [9s]; Summon ×8 [14s] |
| 12 | 693 | Mr. Smite | 0 | Charge 100 [8s]; Area strike 6343, r9, dmg×1.8 [6s]; Summon ×10 [13s] |
| 16 | 694 | Edwin VanCleef | 1 | Charge 100 [6s]; Area strike 1680, r8, dmg×2 [7s]; Ground area V5740/I13812, r9, delay1.5, dmg×2.6 [5s]; Summon ×12 [11s] |

### Duskwood (`duskwood`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 3 | 790 | Naraxis | 0 | Area strike 339, r8, dmg×1.2 [7s]; Summon ×5 [14s] |
| 6 | 791 | Mor'Ladim | 0 | Charge 100 [8s]; Area strike 1680, r8, dmg×1.6 [7s]; Summon ×7 [14s] |
| 9 | 792 | Stitches | 0 | Area strike 6343, r9, dmg×1.8 [6s]; Charge 100 [10s]; Summon ×8 [13s] |
| 12 | 793 | Lupos | 0 | Charge 100 [7s]; Area strike 8122, r10, dmg×1.6 [8s]; Summon ×10 [12s] |
| 16 | 794 | Morbent Fel | 1 | Missile volley 686 ×7 [4s]; Ground area V10/I122, r10, delay1.4, dmg×3 [5s]; Area strike 1949, r10, dmg×2 [9s]; Summon ×12 [12s] |

### Warsong Gulch (`wsg`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 3 | 190 | Doomguard Commander | 0 | Ground area V5740/I2120, r8, delay1.6, dmg×2.5 [6s]; Summon ×6 [14s] |
| 6 | 191 | Mannoroth's Herald | 0 | Missile volley 686 ×5 [5s]; Area strike 1949, r9, dmg×1.5 [8s]; Summon ×8 [15s] |
| 9 | 192 | Varimathras | 0 | Ground area V5740/I2120, r9, delay1.4, dmg×2.5 [4s]; Charge 100 [9s]; Summon ×10 [14s] |
| 12 | 194 | Lord Hel'nurath | 0 | Missile volley 686 ×6 [4.5s]; Area strike 8122, r10, dmg×1.6 [8s]; Charge 100 [10s]; Summon ×10 [13s] |
| 16 | 193 | Lord Kazzak | 1 | Missile volley 686 ×7 [4s]; Ground area V5740/I2120, r10, delay1.4, dmg×3 [5s]; Area strike 1949, r10, dmg×2 [9s]; Summon ×12 [12s] |

### Un'Goro Crater (`ungoro`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 3 | 1290 | Ravasaur Matriarch | 0 | Charge 100 [7s]; Summon ×6 [14s] |
| 6 | 1291 | Uhk'loc | 0 | Area strike 8078, r9, dmg×1.6 [7s]; Charge 100 [9s]; Summon ×8 [14s] |
| 9 | 1292 | Lar'korwi | 0 | Missile volley 6917 ×5 [5s]; Charge 100 [8s]; Summon ×10 [14s] |
| 12 | 1293 | Tyrant Devilsaur | 0 | Charge 100 [7s]; Area strike 20549, r10, dmg×1.8 [8s]; Summon ×10 [13s] |
| 16 | 1294 | King Mosh | 1 | Charge 100 [6s]; Area strike 20549, r11, dmg×2.2 [7s]; Ground area V16914/I8078, r10, delay1.5, dmg×2.8 [5s]; Summon ×12 [11s] |

### Arathi Basin (`ab`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 1590 | Kovork | 0 | Area strike 20549, r8, dmg×1.6 [6s]; Summon ×6 [14s] |
| 7 | 1591 | Nimar the Slayer | 0 | Charge 100 [7s]; Area strike 1680, r8, dmg×1.8 [6s]; Summon ×8 [14s] |
| 11 | 1592 | Marez Cowl | 0 | Missile volley 116 ×5 [4.5s]; Ground area V10/I122, r9, delay1.6, dmg×2.5 [7s]; Summon ×10 [13s] |
| 14 | 1593 | Lord Falconcrest | 0 | Charge 100 [7s]; Area strike 1680, r10, dmg×2 [7s]; Summon ×12 [11s] |
| 18 | 1594 | Lord Aliden Perenolde | 1 | Charge 100 [6s]; Missile volley 686 ×7 [4s]; Ground area V5740/I2120, r10, delay1.4, dmg×3 [5s]; Summon ×12 [12s] |

### Feralas (`feralas`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 890 | Zevrim Thornhoof | 0 | Missile volley 686 ×5 [5s]; Summon ×6 [14s] |
| 7 | 891 | Alzzin the Wildshaper | 0 | Ground area V16914/I339, r9, delay1.6, dmg×2.2 [6s]; Missile volley 5176 ×5 [5s]; Summon ×8 [14s] |
| 11 | 892 | Tendris Warpwood | 0 | Area strike 20549, r10, dmg×2 [6s]; Ground area V16914/I339, r10, delay1.5, dmg×2.2 [8s]; Summon ×10 [13s] |
| 14 | 893 | Immol'thar | 0 | Missile volley 686 ×6 [4.5s]; Area strike 1449, r10, dmg×1.8 [7s]; Charge 100 [10s]; Summon ×10 [12s] |
| 18 | 894 | King Gordok | 1 | Charge 100 [6s]; Area strike 20549, r11, dmg×2.2 [7s]; Missile volley 133 ×6 [5s]; Summon ×12 [12s] |

### Gurubashi Arena (`arena`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 990 | High Priestess Jeklik | 0 | Missile volley 133 ×5 [5s]; Ground area V5740/I2120, r8, delay1.6, dmg×2.5 [7s]; Summon ×6 [14s] |
| 7 | 991 | High Priest Venoxis | 0 | Missile volley 403 ×5 [5s]; Area strike 2812, r9, dmg×1.8 [7s]; Summon ×8 [14s] |
| 11 | 992 | Bloodlord Mandokir | 0 | Charge 100 [7s]; Area strike 1680, r9, dmg×2.2 [6s]; Summon ×10 [13s] |
| 14 | 993 | Jin'do the Hexxer | 0 | Missile volley 686 ×6 [4.5s]; Ground area V26573/I1449, r10, delay1.4, dmg×2.8 [6s]; Summon ×10 [12s] |
| 18 | 994 | Hakkar the Soulflayer | 1 | Missile volley 686 ×8 [4s]; Ground area V16914/I1449, r11, delay1.4, dmg×3 [5s]; Area strike 8122, r11, dmg×2 [8s]; Summon ×12 [11s] |

### Scarlet Monastery (`sm`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 1390 | Houndmaster Loksey | 0 | Charge 100 [7s]; Summon ×7 [12s] |
| 7 | 1391 | Arcanist Doan | 0 | Missile volley 133 ×5 [5s]; Area strike 1449, r10, dmg×1.8 [7s]; Summon ×8 [14s] |
| 11 | 1392 | Herod | 0 | Area strike 1680, r10, dmg×2.2 [6s]; Charge 100 [8s]; Summon ×10 [13s] |
| 14 | 1393 | Scarlet Commander Mograine | 0 | Charge 100 [7s]; Ground area V26573/I1449, r10, delay1.4, dmg×2.8 [6s]; Area strike 20549, r9, dmg×2 [8s]; Summon ×10 [12s] |
| 18 | 1394 | High Inquisitor Whitemane | 1 | Missile volley 7269 ×8 [4s]; Ground area V26573/I1449, r11, delay1.4, dmg×3 [5s]; Area strike 1449, r11, dmg×2 [8s]; Summon ×12 [11s] |

### Alterac Valley (`av`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 390 | Korrak the Bloodrager | 0 | Charge 100 [6s]; Summon ×6 [14s] |
| 8 | 391 | Ivus the Forest Lord | 0 | Ground area V16914/I339, r9, delay1.6, dmg×2.2 [6s]; Missile volley 5176 ×5 [5s]; Summon ×8 [14s] |
| 12 | 392 | Lokholar the Ice Lord | 0 | Ground area V10/I122, r10, delay1.5, dmg×2.5 [5s]; Area strike 122, r10, dmg×1.8 [8s]; Summon ×10 [13s] |
| 16 | 394 | Glacius the Frozen Titan | 0 | Area strike 20549, r11, dmg×2.2 [6s]; Ground area V10/I120, r10, delay1.5, dmg×2.4 [7s]; Summon ×10 [12s] |
| 20 | 393 | Azuregos | 1 | Missile volley 116 ×7 [4s]; Ground area V10/I120, r11, delay1.4, dmg×3 [5s]; Area strike 122, r11, dmg×2 [8s]; Summon ×12 [12s] |

### Blackrock Mountain (`brm`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 1090 | General Angerforge | 0 | Charge 100 [7s]; Area strike 1680, r8, dmg×1.8 [6s]; Summon ×6 [14s] |
| 8 | 1091 | Warchief Rend Blackhand | 0 | Charge 100 [7s]; Area strike 1680, r9, dmg×2 [6s]; Ground area V5740/I2120, r9, delay1.5, dmg×2.5 [8s]; Summon ×8 [13s] |
| 12 | 1092 | Emperor Dagran Thaurissan | 0 | Missile volley 133 ×6 [4.5s]; Ground area V5740/I2120, r10, delay1.4, dmg×2.8 [5s]; Area strike 11113, r9, dmg×1.8 [8s]; Summon ×10 [13s] |
| 16 | 1093 | Majordomo Executus | 0 | Missile volley 133 ×7 [4s]; Area strike 1535, r10, dmg×2 [7s]; Ground area V5740/I2120, r10, delay1.4, dmg×3 [6s]; Summon ×12 [12s] |
| 20 | 1094 | Nefarian | 1 | Missile volley 686 ×8 [4s]; Ground area V5740/I2120, r12, delay1.4, dmg×3.2 [5s]; Area strike 8122, r11, dmg×2 [9s]; Summon ×14 [11s] |

### Gates of Ahn'Qiraj (`aq`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 1190 | Kurinnaxx | 0 | Ground area V16914/I20549, r8, delay1.6, dmg×2.2 [6s]; Charge 100 [9s]; Summon ×6 [14s] |
| 8 | 1191 | General Rajaxx | 0 | Area strike 6343, r9, dmg×2 [6s]; Charge 100 [8s]; Summon ×8 [12s] |
| 12 | 1192 | Princess Huhuran | 0 | Missile volley 5176 ×6 [4.5s]; Area strike 6343, r9, dmg×2 [7s]; Summon ×10 [12s] |
| 16 | 1193 | Ossirian the Unscarred | 0 | Ground area V16914/I20549, r10, delay1.4, dmg×2.8 [5s]; Area strike 20549, r10, dmg×2.2 [7s]; Charge 100 [9s]; Summon ×12 [12s] |
| 20 | 1194 | C'Thun | 1 | Missile volley 686 ×9 [3.5s]; Ground area V16914/I8122, r12, delay1.3, dmg×3.2 [5s]; Area strike 8122, r12, dmg×2.2 [8s]; Summon ×12 [10s] |

### Naxxramas (`naxx`)

| Minute | ID | Boss | Final flag | Native abilities and repeat intervals |
| ---: | ---: | --- | ---: | --- |
| 4 | 1490 | Anub'Rekhan | 0 | Area strike 1680, r10, dmg×1.8 [7s]; Charge 100 [9s]; Summon ×6 [13s] |
| 8 | 1491 | Noth the Plaguebringer | 0 | Missile volley 686 ×6 [4.5s]; Ground area V10/I122, r9, delay1.5, dmg×2.5 [7s]; Summon ×8 [12s] |
| 12 | 1492 | Patchwerk | 0 | Area strike 1680, r9, dmg×2.2 [6s]; Charge 100 [8s]; Summon ×10 [12s] |
| 16 | 1493 | Sapphiron | 0 | Ground area V10/I120, r11, delay1.5, dmg×2.8 [5s]; Area strike 122, r11, dmg×2 [8s]; Missile volley 116 ×7 [4.5s]; Summon ×12 [12s] |
| 20 | 1494 | Kel'Thuzad | 1 | Missile volley 116 ×9 [3.5s]; Ground area V10/I122, r12, delay1.3, dmg×3.2 [5s]; Area strike 122, r12, dmg×2.2 [8s]; Summon ×14 [10s] |

## Validation and limits

- Passed: full target SHA-256, independent 12-zone/60-row/191-ability/10-point extraction and deterministic revalidation with `python3 scripts/recover-boss-point-data.py --check`. The same read-only check inspects canonical Rust literals and confirms every boss field, name/yell and ability word against the independently recovered bytes; it invokes no compiler.
- Authored: [portable canonical-catalog checks](../../crates/azeroth-survivors-re/tests/boss_catalog.rs) compare every semantic field, ability word and fixed-point float bit to retained original bytes. Compilation and those Rust checks are **not run**, at this source-recovery checkpoint.
- Missing/unverified: full runtime integration, real model/terrain/packet adapters and runtime/rendered parity. A recovered roster does not establish a playable world or that conventional WoW behavior is implemented.
