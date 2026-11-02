# Enemy and zone catalog — selected 0.97.2

Date: 2026-10-18. This is static source recovery for the supplied Windows x64 EXE, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`. The game was not executed. The generated source is independent of the pre-existing guardian component and needs no reference EXE at build time.

Recovered: **148 unique enemy definitions in all 12 zone records**, including 108 ordinary records, 36 finite-time elite records, and the four Naxxramas Horsemen whose ordinary eligibility field is positive infinity. There are 124 tag-0 attack records and 24 tag-1 spell-attack records. The source preserves all original model IDs, names, scales, base HP/damage, attack metadata, interval/speed inputs, raw remaining fields and float bit patterns. Boss schedules are separate records and are outside this catalog's count.

Source: [catalog.rs](../../crates/azeroth-survivors-re/src/enemies/catalog.rs). Byte provenance: [catalog.json](evidence/0.97.2/enemies/catalog.json). Generator: [recover-enemy-catalog.py](../../scripts/recover-enemy-catalog.py). Spawn-selection behavior is recovered separately in [the spawning report](enemy-spawning-0.97.2.md); this roster does not substitute a fixed per-enemy spawn schedule for that algorithm.

## Table and native evidence

The zone source table begins at VA `0x146716438`, has 12 records with stride `0xf0`, and stores each zone's enemy slice at `+0x78/+0x80`. Each enemy record has stride `0x50`. The exact original bytes, source file offsets, SHA-256 spans, Rust string bytes and every 32-bit word are retained in the catalog evidence. All offsets are gated by the full selected EXE's SHA-256 before recovery.

The selected target's zone-address helper `0x14540e950` was analyzed through `./scripts/rea` with Ghidra 12.1.4 using the unchanged PE `RUNTIME_FUNCTION` bytes mapped at their original VA. REA Evidence `ev_2a6918f53d7e381c0390b6ff62a0269662c0df43fd423be729979aca2d0c5246` recovers `zone_index * 0xf0 + 0x146716438`; the function slice SHA-256 is `665e9b58b8aec5ce28e3daa5d95e9503a3c1c9ae8b49259304aa9c51f5ae783b`. [Full retained Evidence](evidence/0.97.2/enemies/catalog-native.json). The raw import omits called code/data and uses a generic compiler specification, so original Win64 instructions govern argument interpretation. No relation absence is inferred from the scoped slice.

Source lookup `ZoneDefinition::by_key` returns an `Option` to let a caller reject an unknown key; this is an explicit source API, not a recovered claim that the original resolver rejects unknown strings. The original resolver `0x14540e820` returns zone index 0 for unknown keys. That fallback must be preserved where the native resolver's behavior is required.

| Enemy offset | Recovered source interpretation |
| --- | --- |
| `+0x00..+0x10` | Four exact attack words. Tag 1 is spell ID, range float bits, cast-duration float bits; other words remain available unchanged. |
| `+0x10/+0x18` | Native Rust name pointer/length, decoded as UTF-8. |
| `+0x20/+0x24/+0x28` | Enemy ID, model ID, scale. |
| `+0x2c` | Exact raw integer retained; full semantic ownership is unresolved here. |
| `+0x30/+0x34` | Base HP and damage inputs. Active scaling is a separate component. |
| `+0x38/+0x3c` | Attack interval and baseline movement-speed input; creation applies active modifiers. |
| `+0x40` | Exact integer retained. |
| `+0x44` | Spawn-budget cost / inverse selection-weight divisor. |
| `+0x48` | Earliest eligible elapsed run minute, with class-dependent selection paths. |
| `+0x4c` | Original flag byte: zero ordinary pool, nonzero elite path. Other consumers retain the entire original byte. |

The helpers `spell_attack`, `attack_interval`, `movement_speed`, `spawn_minute` and `spawn_cost` expose only these recovered meanings. Full raw source values remain public, including nonfinite eligibility values. Spell IDs identify native cast requests; catalog recovery does not implement the spell effects.

## Zone rosters and eligibility times

Times below are elapsed **minutes**, formatted for readability; exact IEEE754 bits are in the source/evidence. A threshold means the entry is eligible for its native spawn-selection path at that time. Random selection, spawn budget, concurrent population, map placement, elite cadence, pause/phase gates and special creation paths determine the actual spawn. It is not a promise that an actor appears at the threshold. “Elite” labels `flag_4c = 1` and does not rename an entry to a guardian. The Horsemen's infinity threshold prevents finite-time ordinary eligibility and does not imply they never appear through a separate special path.

### Elwynn Forest (`elwynn`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 600 | Kobold Vermin | 0 | Ordinary (0) | Melee |
| 601 | Young Wolf | 0.5 | Ordinary (0) | Melee |
| 602 | Murloc Streamrunner | 1.2 | Ordinary (0) | Melee |
| 603 | Kobold Geomancer | 2 | Ordinary (0) | Spell 133, range 18, cast 1.8 s |
| 604 | Defias Thug | 3 | Ordinary (0) | Melee |
| 605 | Riverpaw Brute | 4.5 | Ordinary (0) | Melee |
| 606 | Prowler | 6 | Ordinary (0) | Melee |
| 607 | Defias Rogue Wizard | 7.5 | Ordinary (0) | Spell 116, range 18, cast 1.6 s |
| 608 | Defias Enforcer | 9 | Ordinary (0) | Melee |
| 609 | Kobold Taskmaster | 3.5 | Elite (1) | Melee |
| 610 | Gruff Swiftbite | 8 | Elite (1) | Melee |
| 611 | Bellygrub | 13 | Elite (1) | Melee |

### Duskwood (`duskwood`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 700 | Skeletal Raider | 0 | Ordinary (0) | Melee |
| 701 | Plague Spreader | 0.4 | Ordinary (0) | Melee |
| 702 | Black Widow Hatchling | 1 | Ordinary (0) | Melee |
| 703 | Nightbane Shadow Weaver | 2 | Ordinary (0) | Spell 686, range 18, cast 1.8 s |
| 704 | Rotting Horror | 3 | Ordinary (0) | Melee |
| 705 | Nightbane Dark Runner | 4 | Ordinary (0) | Melee |
| 706 | Fleshripper | 5.5 | Ordinary (0) | Melee |
| 707 | Restless Shade | 7 | Ordinary (0) | Spell 116, range 18, cast 1.6 s |
| 708 | Bone Chewer | 9 | Ordinary (0) | Melee |
| 709 | Nightbane Worgen Alpha | 4 | Elite (1) | Melee |
| 710 | Carrion Recluse | 8.5 | Elite (1) | Melee |
| 711 | Flesh Eating Abomination | 13 | Elite (1) | Melee |

### Warsong Gulch (`wsg`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 100 | Burning Imp | 0 | Ordinary (0) | Melee |
| 101 | Felhound | 0.7 | Ordinary (0) | Melee |
| 108 | Fel Bat | 1.2 | Ordinary (0) | Melee |
| 103 | Satyr Shadowcaster | 2 | Ordinary (0) | Spell 686, range 18, cast 1.6 s |
| 102 | Satyr Trickster | 3 | Ordinary (0) | Melee |
| 104 | Voidwalker | 4.5 | Ordinary (0) | Melee |
| 105 | Succubus | 6 | Ordinary (0) | Melee |
| 109 | Fire Imp | 7.5 | Ordinary (0) | Spell 133, range 18, cast 1.6 s |
| 110 | Mana Fiend | 9 | Ordinary (0) | Melee |
| 106 | Felguard Elite | 4 | Elite (1) | Melee |
| 107 | Infernal | 8.5 | Elite (1) | Melee |
| 111 | Doomguard | 13 | Elite (1) | Melee |

### Un'Goro Crater (`ungoro`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 1200 | Ravasaur Runner | 0 | Ordinary (0) | Melee |
| 1201 | Young Ravasaur | 0.6 | Ordinary (0) | Melee |
| 1202 | Fledgling Pterrordax | 1.2 | Ordinary (0) | Melee |
| 1203 | Gorishi Stinger | 2 | Ordinary (0) | Spell 6917, range 18, cast 1.6 s |
| 1204 | Bloodpetal Lasher | 3 | Ordinary (0) | Melee |
| 1205 | Un'Goro Stomper | 4.5 | Ordinary (0) | Melee |
| 1206 | Venomhide Ravasaur | 6 | Ordinary (0) | Melee |
| 1207 | Frenzied Pterrordax | 7.5 | Ordinary (0) | Spell 6917, range 18, cast 1.6 s |
| 1208 | Elder Diemetradon | 9 | Ordinary (0) | Melee |
| 1209 | Ravasaur Hunter | 4 | Elite (1) | Melee |
| 1210 | Un'Goro Thunderer | 8.5 | Elite (1) | Melee |
| 1211 | Devilsaur | 13 | Elite (1) | Melee |

### Arathi Basin (`ab`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 1500 | Witherbark Troll | 0 | Ordinary (0) | Melee |
| 1501 | Plains Creeper | 0.5 | Ordinary (0) | Melee |
| 1502 | Mesa Buzzard | 1 | Ordinary (0) | Melee |
| 1503 | Witherbark Shadowcaster | 2 | Ordinary (0) | Spell 686, range 18, cast 1.8 s |
| 1504 | Syndicate Mercenary | 3 | Ordinary (0) | Melee |
| 1505 | Boulderfist Ogre | 4.5 | Ordinary (0) | Melee |
| 1506 | Feral Mountain Lion | 6 | Ordinary (0) | Melee |
| 1507 | Boulderfist Magus | 7.5 | Ordinary (0) | Spell 133, range 18, cast 1.6 s |
| 1508 | Boulderfist Brute | 9 | Ordinary (0) | Melee |
| 1509 | Witherbark Headhunter | 4 | Elite (1) | Melee |
| 1510 | Rumbling Exile | 8.5 | Elite (1) | Melee |
| 1511 | Boulderfist Enforcer | 13 | Elite (1) | Melee |

### Feralas (`feralas`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 800 | Woodpaw Mongrel | 0 | Ordinary (0) | Melee |
| 801 | Longtooth Runner | 0.6 | Ordinary (0) | Melee |
| 802 | Sprite Darter | 1.2 | Ordinary (0) | Melee |
| 803 | Woodpaw Mystic | 2 | Ordinary (0) | Spell 403, range 18, cast 1.8 s |
| 804 | Gordunni Ogre | 3 | Ordinary (0) | Melee |
| 805 | Wildspawn Satyr | 4 | Ordinary (0) | Melee |
| 806 | Ironfur Bear | 5.5 | Ordinary (0) | Melee |
| 807 | Gordunni Ogre-Mage | 7 | Ordinary (0) | Spell 133, range 18, cast 1.8 s |
| 808 | Feral Scar Yeti | 9 | Ordinary (0) | Melee |
| 809 | Gordunni Brute | 4 | Elite (1) | Melee |
| 810 | Warpwood Treant | 8.5 | Elite (1) | Melee |
| 811 | Ironbark Protector | 13 | Elite (1) | Melee |

### Gurubashi Arena (`arena`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 900 | Gurubashi Scout | 0 | Ordinary (0) | Melee |
| 901 | Razzashi Raptor | 0.5 | Ordinary (0) | Melee |
| 902 | Bloodseeker Bat | 1.2 | Ordinary (0) | Melee |
| 903 | Hakkari Shadowcaster | 2 | Ordinary (0) | Spell 686, range 18, cast 1.8 s |
| 904 | Gurubashi Axe Thrower | 3 | Ordinary (0) | Melee |
| 905 | Zulian Tiger | 4 | Ordinary (0) | Melee |
| 906 | Razzashi Serpent | 5.5 | Ordinary (0) | Melee |
| 907 | Hakkari Witch Doctor | 7 | Ordinary (0) | Spell 403, range 18, cast 1.6 s |
| 908 | Son of Hakkar | 9 | Ordinary (0) | Melee |
| 909 | Gurubashi Berserker | 4 | Elite (1) | Melee |
| 910 | Zulian Crocolisk | 8.5 | Elite (1) | Melee |
| 911 | Gurubashi Champion | 13 | Elite (1) | Melee |

### Scarlet Monastery (`sm`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 1300 | Scarlet Monk | 0 | Ordinary (0) | Melee |
| 1301 | Scarlet Tracking Hound | 0.5 | Ordinary (0) | Melee |
| 1302 | Scarlet Scout | 1.2 | Ordinary (0) | Melee |
| 1303 | Scarlet Adept | 2 | Ordinary (0) | Spell 585, range 18, cast 1.8 s |
| 1304 | Scarlet Centurion | 3 | Ordinary (0) | Melee |
| 1305 | Scarlet Defender | 4.5 | Ordinary (0) | Melee |
| 1306 | Scarlet Gallant | 6 | Ordinary (0) | Melee |
| 1307 | Scarlet Wizard | 7 | Ordinary (0) | Spell 133, range 18, cast 1.6 s |
| 1308 | Scarlet Protector | 9 | Ordinary (0) | Melee |
| 1309 | Scarlet Myrmidon | 4 | Elite (1) | Melee |
| 1310 | Scarlet Champion | 8.5 | Elite (1) | Melee |
| 1311 | Scarlet Abbot | 13 | Elite (1) | Melee |

### Alterac Valley (`av`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 300 | Trogg Tunneler | 0 | Ordinary (0) | Melee |
| 301 | Starving Frostwolf | 0.6 | Ordinary (0) | Melee |
| 308 | Winterax Axe Thrower | 1.2 | Ordinary (0) | Melee |
| 303 | Crushridge Ogre Mage | 2 | Ordinary (0) | Spell 116, range 18, cast 1.8 s |
| 302 | Snowfall Wendigo | 3 | Ordinary (0) | Melee |
| 304 | Crushridge Brute | 4.5 | Ordinary (0) | Melee |
| 305 | Ice Revenant | 6 | Ordinary (0) | Melee |
| 309 | Winterax Shadow Hunter | 7.5 | Ordinary (0) | Spell 116, range 18, cast 1.6 s |
| 310 | Frostwolf Packleader | 9 | Ordinary (0) | Melee |
| 306 | Alterac Yeti Lord | 4 | Elite (1) | Melee |
| 307 | Mountain Giant | 8.5 | Elite (1) | Melee |
| 311 | Winterax Warlord | 13 | Elite (1) | Melee |

### Blackrock Mountain (`brm`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 1000 | Dark Iron Slaver | 0 | Ordinary (0) | Melee |
| 1001 | Black Broodling | 0.5 | Ordinary (0) | Melee |
| 1002 | Blackrock Grunt | 1.2 | Ordinary (0) | Melee |
| 1003 | Dark Iron Geomancer | 2 | Ordinary (0) | Spell 133, range 18, cast 1.8 s |
| 1004 | Anvilrage Guardsman | 3 | Ordinary (0) | Melee |
| 1005 | Blazing Elemental | 4 | Ordinary (0) | Melee |
| 1006 | Firegut Ogre | 5.5 | Ordinary (0) | Melee |
| 1007 | Black Wyrmkin | 7 | Ordinary (0) | Spell 11366, range 18, cast 2.2 s |
| 1008 | Fireguard Destroyer | 9 | Ordinary (0) | Melee |
| 1009 | Core Hound | 4 | Elite (1) | Melee |
| 1010 | Black Drake | 8.5 | Elite (1) | Melee |
| 1011 | Molten Giant | 13 | Elite (1) | Melee |

### Gates of Ahn'Qiraj (`aq`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 1100 | Silithid Swarmer | 0 | Ordinary (0) | Melee |
| 1101 | Silithid Creeper | 0.5 | Ordinary (0) | Melee |
| 1102 | Hive'Zara Stinger | 1.2 | Ordinary (0) | Melee |
| 1103 | Twilight Geolord | 2 | Ordinary (0) | Spell 403, range 18, cast 1.8 s |
| 1104 | Qiraji Gladiator | 3 | Ordinary (0) | Melee |
| 1105 | Stonelash Scorpid | 4 | Ordinary (0) | Melee |
| 1106 | Silithid Ravager | 5.5 | Ordinary (0) | Melee |
| 1107 | Qiraji Mindslayer | 7 | Ordinary (0) | Spell 8092, range 18, cast 1.6 s |
| 1108 | Dust Stormer | 9 | Ordinary (0) | Melee |
| 1109 | Qiraji Champion | 4 | Elite (1) | Melee |
| 1110 | Anubisath Sentinel | 8.5 | Elite (1) | Melee |
| 1111 | Obsidian Destroyer | 13 | Elite (1) | Melee |

### Naxxramas (`naxx`)

| ID | Enemy | Eligible minute | Pool flag | Attack input |
| --- | --- | ---: | --- | --- |
| 1400 | Plagued Ghoul | 0 | Ordinary (0) | Melee |
| 1401 | Dread Creeper | 0.5 | Ordinary (0) | Melee |
| 1402 | Soldier of the Frozen Wastes | 1.2 | Ordinary (0) | Melee |
| 1403 | Naxxramas Cultist | 2 | Ordinary (0) | Spell 686, range 18, cast 1.8 s |
| 1404 | Carrion Spinner | 3 | Ordinary (0) | Melee |
| 1405 | Bile Retcher | 5.5 | Ordinary (0) | Melee |
| 1406 | Stoneskin Gargoyle | 4 | Ordinary (0) | Melee |
| 1407 | Naxxramas Acolyte | 7 | Ordinary (0) | Spell 116, range 18, cast 1.6 s |
| 1408 | Living Monstrosity | 9 | Ordinary (0) | Melee |
| 1409 | Soul Weaver | 4 | Elite (1) | Melee |
| 1410 | Unstoppable Abomination | 8.5 | Elite (1) | Melee |
| 1411 | Guardian of Icecrown | 13 | Elite (1) | Melee |
| 1412 | Highlord Mograine | +∞ (special only) | Elite (1) | Melee |
| 1413 | Thane Korth'azz | +∞ (special only) | Elite (1) | Melee |
| 1414 | Lady Blaumeux | +∞ (special only) | Elite (1) | Melee |
| 1415 | Sir Zeliek | +∞ (special only) | Elite (1) | Melee |

## Validation and remaining work

- Passed: full-reference SHA-256 identity, checked PE strings/slices, 12 zone keys, 148 unique IDs, per-zone row counts, and deterministic source/evidence regeneration with `python3 scripts/recover-enemy-catalog.py --check`.
- Passed: static REA/Ghidra zone-address helper analysis, original PE byte/digest cross-check, evidence export and session close.
- Authored: portable Rust checks for every stored semantic field against the retained native record bytes, exact float bits, the Naxxramas four infinity values, spell/melee interpretation and catalog lookup. **Not run**: compilation, compiler checks, compile-based tests, original game or rebuilt application. Current source-only work mode explicitly excludes those operations.
- Remaining: runtime parity, terrain/render/model loading, native spell effect ownership, complete gameplay integration and any unresolved raw-field semantics. A recovered catalog, source implementation or static fixture is not proof of those behaviors.

Reproduction within the project checkout:

```sh
python3 scripts/recover-enemy-catalog.py --check
python3 scripts/recover-enemy-catalog.py --prepare-native
python3 scripts/rea-batch.py runtime/enemies-catalog-0.97.2/plan-14540e950.json
python3 scripts/recover-enemy-catalog.py --collect-native
```

The batch output path must be new for a rerun; use the runner's `--output` override and adjust collection deliberately rather than overwriting an existing analysis session. The generated source is checked in; end users do not need to run recovery or supply the reference EXE to build it.
