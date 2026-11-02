# Game-specific data recovered from the EXE

> Historical analysis of **0.91.4**, preserved as `AzerothSurvivors/AzerothSurvivors-0.91.4.exe` (SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`). The current target is **0.97.2**; this report remains bound to 0.91.4 and has not been revalidated against the new target. See [current target provenance](target-refresh-0.97.2.json) and the [historical 0.92 refresh](target-refresh-0.92.json).

The executable itself contains substantial Azeroth Survivors content. A static extraction recovered nine class definitions with 101 spell-pool entries, nine zone definitions linked to 108 enemy definitions and 45 boss definitions, and a complete English text catalog with 2,491 entries. None of this required opening an MPQ or running the game.

This report supports the REA investigation with exact bytes and addresses. Table membership, names, IDs, pointer relationships, text and stored numbers are observed. Subsequent native consumer analysis confirms the boss schedule threshold at record +64 and supports record +68 as a base health input, as described below. Other numeric meanings remain hypotheses until their consumers are traced. Display text describes intended behavior; it does not establish runtime behavior or exact formulas.

## Reproducible evidence

- Target: `AzerothSurvivors/AzerothSurvivors.exe`, 130,840,064 bytes.
- SHA-256: `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`.
- Preferred image base: `0x140000000`. Virtual addresses below are image addresses, not observed ASLR addresses.
- [Extraction helper](../../scripts/extract-embedded-game-data.py): `python3 scripts/extract-embedded-game-data.py`.
- [Structured evidence](evidence/embedded-game-data.json) includes every recovered record's original bytes, file offset, VA, SHA-256, names, raw numeric fields and the extraction pass's explicit field hypotheses. Later native confirmation is recorded below and in the [native inventory](executable-inventory.md), preserving the original extraction record.
- [Exact extracted English JSON](evidence/embedded-english.json): file offset `0x66d7692`, VA `0x1466d8a92`, 163,380 bytes. The extraction round-trips the entire raw JSON byte sequence and checks record names against this catalog.

The EXE also contains the contiguous build strings `v0.2.0-434-g097de76e`, `097de76ead35e82402e80e908a9f35e866dd61f4` and `2026-10-15release` around file offset `0x589d250`. These are embedded build metadata. They do not independently identify a public upstream commit or establish a running process's version. Subsequent targeted byte inspection identified the separate embedded **game version 0.91.4** in three updater/picker contexts; see [the changelog guide](changelog-guide.md) for exact offsets and the boundary before 0.92.0.

## Classes and spell pools

The contiguous class table starts at file offset `0x66c8468`, VA `0x1466c9868`; nine records are 144 bytes each. Each record directly links a class key/name, a list of spell keys and a single spell key consistent with its default spell. The table also stores color, icon and class blurb strings. The English catalog contains 111 named ability IDs: the 101 class-pool entries, eight racial abilities, `penance` and `arcane_power`.

| Class | Default spell candidate | Pool size | Float at record +128, candidate base health |
| --- | --- | ---: | ---: |
| Warrior | Cleave | 11 | 230 |
| Paladin | Consecration | 11 | 245 |
| Hunter | Auto Shot | 11 | 240 |
| Rogue | Sinister Strike | 11 | 190 |
| Priest | Smite | 11 | 170 |
| Shaman | Lightning Bolt | 11 | 195 |
| Mage | Fireball | 13 | 215 |
| Warlock | Shadow Bolt | 11 | 165 |
| Druid | Wrath | 11 | 205 |

All spell keys, with addresses, are retained in the structured evidence. For example, the warrior pool is Cleave, Whirlwind, Thunder Clap, Mortal Strike, Execute, Demoralizing Shout, Battle Shout, Bloodthirst, Rend, Shield Slam and Bloodrage. These are game-specific pools, not the base client's complete spell database.

The text template `{blurb} Starts with {spell}; every level offers three of its spells. {hp} health.` supports interpreting the default-spell and health fields. Native use still needs confirmation, including how talents override defaults or modify health. Another text describes a perk which makes the first level-up offer four cards. Maximum equipped spell slots are substituted through `{max}`; this extraction does not determine that limit.

## Zones, enemies and native boss schedules

The contiguous zone table starts at file offset `0x66c6620`, VA `0x1466c7a20`; nine records are 184 bytes each. Record offsets +64 and +80 hold enemy and boss slice pointers/counts. Every zone directly links 12 enemy records of 80 bytes and five boss records of 88 bytes. This establishes zone membership without relying on narrative similarity.

Each boss record has name and yell strings, numeric ID at +48, five floats at +56/+64/+68/+72/+76 and a last-record flag at +84. Bounded native disassembly confirms that +64 is the scheduled arrival threshold: the core update compares its accumulated clock divided by 60 with that field, advances a cursor bounded below five and passes the due 88-byte row to the spawn helper. The +84 flag is zero for the first four bosses and one for the last boss in every zone; its proposed final-boss role still needs a native flag consumer.

| Zone | Five linked bosses, in stored order | Configured arrival minutes, record +64 |
| --- | --- | --- |
| Elwynn Forest | Hogger; Mother Fang; Rhahk'Zor; Mr. Smite; Edwin VanCleef | 3, 6, 9, 12, 16 |
| Duskwood | Naraxis; Mor'Ladim; Stitches; Lupos; Morbent Fel | 3, 6, 9, 12, 16 |
| Warsong Gulch | Doomguard Commander; Mannoroth's Herald; Varimathras; Lord Hel'nurath; Lord Kazzak | 3, 6, 9, 12, 16 |
| Arathi Basin | Patchwerk; Lord Blackwood; Baron Rivendare; Anub'Rekhan; Kel'Thuzad | 4, 7, 11, 14, 18 |
| Feralas | Zevrim Thornhoof; Alzzin the Wildshaper; Tendris Warpwood; Immol'thar; King Gordok | 4, 7, 11, 14, 18 |
| Gurubashi Arena | High Priestess Jeklik; High Priest Venoxis; Bloodlord Mandokir; Jin'do the Hexxer; Hakkar the Soulflayer | 4, 7, 11, 14, 18 |
| Alterac Valley | Korrak the Bloodrager; Ivus the Forest Lord; Lokholar the Ice Lord; Glacius the Frozen Titan; Azuregos | 4, 8, 12, 16, 20 |
| Blackrock Mountain | General Angerforge; Warchief Rend Blackhand; Emperor Dagran Thaurissan; Majordomo Executus; Nefarian | 4, 8, 12, 16, 20 |
| Gates of Ahn'Qiraj | Kurinnaxx; General Rajaxx; Princess Huhuran; Ossirian the Unscarred; C'Thun | 4, 8, 12, 16, 20 |

The native schedule evidence is at `0x145479689`–`0x14547969b` (clock divided by 60) and `0x14547a239` onward (five-entry cursor, zone boss-slice selection, threshold comparison and due spawn). Exact excerpts and hashes are retained in [the boss assembly manifest](evidence/boss-assembly-manifest.json); [the native inventory](executable-inventory.md#native-boss-scheduling-and-health-initialization) explains the dataflow. The picker text `{subtitle} — {boss} awaits at {minute}:00` is independent supporting display evidence. Pause/tick contracts, scheduler bypasses, victory transitions and alternate spawn paths remain unresolved.

Native spawn helper `0x14548f900` reads boss record +68, multiplies it by `5.75`, a configuration factor at zone-record +168, state factors and a conditional `powf(1.22, extra_minutes)`, then stores the same result into a new actor's +`0xf0` and +`0xf4` fields. Separate ratio-preserving rescale code supports identifying these as current and maximum health. Thus +68 is a **base health input**, not the final spawned health. The exact scalar chain and unnamed state offsets are documented in the native inventory; mode/modifier meanings are still under analysis.

As concrete records, Hogger's +64/+68/+72/+76 fields are `3 / 3600 / 22 / 5.6`; Edwin VanCleef's are `16 / 52500 / 54 / 6.6`. The first two now have native-supported roles: arrival threshold in minutes and base health input. Contact damage at +72 and movement speed at +76 remain hypotheses. Native code separately scales +72 with a square-root factor and `powf(1.096, extra_minutes)`, but an attack consumer has not yet confirmed its role.

English text describes class-specific zone unlocking by defeating the previous zone's boss, moving to begin a run, a victory choice to continue in endless mode, and guardians whose deaths yield jewelry and strength while making other guardians stronger. An achievement text asks for four guardian kills before 8:00. Exact unlock links, guardian identity/count at runtime, endless scaling and spawn formulas are not established here.

## Gameplay rules expressed by embedded text

The following are recovered specifications from the embedded English catalog, not tested mechanics:

- **Progression:** boss gear is permanent and class-specific; only worn pieces add bonuses, while appearance choices are separate. A save carries heroes, each class's opened zones, gear, talents and codex progress. Import replaces progress.
- **Talents:** every run pays class talent experience for survival time, kills, bosses and a win, with more in harder zones; respecs are described as free. Talent points are spent between runs. Maximum points, thresholds, payouts and dependency checks require native code.
- **Account rewards:** achievements fund account-wide perks and tabards. Described perks add one/two/three free rerolls, one/two/three card banishes per run, or a fourth card at the first level-up. Banishing removes a card for the rest of that run and redeals the hand.
- **Jewelry:** rings, trinkets and most amulets are offered to every class; legendary amulets remake particular spells and belong to specific classes. Caches, elites and guardians offer jewelry. Repeated worn jewelry grows toward three times its original numbers; a life-granting repeat refills lives. Exact slot caps, rates and growth calculations are not recovered from text.
- **Caps and targeting:** ordinary damage reduction is described as capped at 60%, with a warrior capstone raising it to 70%. A life bonus text says at most two returns at half health. Execution bonuses use enemies below 30% health. Roots/stuns last a quarter as long on bosses; fear excludes bosses. Polymorph excludes bosses and guardians. These may be overridden or specialized by talents.
- **Run Options:** enemy health, damage, speed and density can be modified; density means more enemies with less value per kill. Rewards improve talent experience and boss loot chance only up to a substituted maximum, beyond which difficulty continues increasing. The maximum and formulas are not present in the wording.
- **Companions:** an account-wide companion fetches coins and experience wisps 25 yd beyond the pickup radius every 2 sec, excluding magnets and caches. Upgrades describe 35/45/55 yd, fetch intervals 1.6/1.3/1 sec and a second companion. Instincts prioritize gold, experience or runes; gold instinct adds 10%, experience instinct carries three wisps. Native selection and timing need confirmation.

Eight race descriptions contain concrete intended bonuses:

| Race | Embedded descriptions |
| --- | --- |
| Human | Every 30 sec, +15% damage for 10 sec; +10% experience; +20% gold |
| Orc | Every 40 sec, +35% damage for 12 sec; +10% maximum health |
| Dwarf | Every 45 sec, a shield equal to 30% maximum health; +6% damage; +30% pickup range |
| Night Elf | Near death: 3 sec immunity, 75 sec cooldown; +8% movement; +5% damage reduction |
| Undead | Near death: 4 sec immunity, 60 sec cooldown; heal 1 per kill; +4% damage reduction |
| Tauren | Every 15 sec, stun nearby enemies for 2 sec; +15% maximum health |
| Gnome | Every 20 sec, root nearby enemies for 2 sec; -8% cooldowns; +20% luck |
| Troll | Every 35 sec, cooldown recovery +30% for 10 sec; +1.5 health/sec; +3% critical chance |

## Save contract leads

At file offset `0x688d5a7`, the EXE contains adjacent `WOW_ROGUE_SAVE`, `APPDATA`, `wenilla-rogue` and `characters.txt` literals. At `0x66d1328` it contains the source path `crates\wenilla-rogue\src\save.rs`. Related literals identify unreadable/legacy/before-import backup names, import damage errors and a fallback warning about writing an unsealed save.

The bounded raw span in the evidence preserves formatted records with pipe separators and newline fragments: `unlock|`, `items|`, `talent|`, `seen|`, `ach|`, `achat|`, `stat|`, `perk|`, `tabard|`, `pets|`, `resets|`, `hero|`, `beat|` and `pick|`. It also includes `equip` and `look` near save diagnostics. These establish save-format investigation entry points; they do not recover the complete schema, argument order/types, cryptographic seal, migration behavior or load precedence. No live save file was opened.

## Remaining work

Follow native references to the recovered class/zone/boss tables and save literals. Extend the confirmed boss schedule/base-health chain into complete spawn transitions, and resolve the remaining field layouts, damage and XP calculations, automatic spell casting, target selection, card weighting, jewelry growth, talent effects, run modifiers, persistent progress and save integrity. Embedded text is useful reconstruction material, but the selected 0.91.4 executable's actual state transitions and formulas are the required authority for native fidelity.
