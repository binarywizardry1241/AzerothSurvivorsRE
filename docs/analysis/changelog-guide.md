# Historical changelog guide for native recovery

> Historical analysis of **0.91.4**, preserved as `AzerothSurvivors/AzerothSurvivors-0.91.4.exe` (SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`). The current target is **0.97.2**; this report remains bound to 0.91.4 and has not been revalidated against the new target. See [current target provenance](target-refresh-0.97.2.json) and the [historical 0.92 refresh](target-refresh-0.92.json).

The supplied EXE embeds the game version **0.91.4**. The supplied changelog continues through **0.92.0**, so its latest entry describes changes that must not be attributed to this executable without new evidence.

This historical pass targets **the supplied 0.91.4 EXE's behavior**. Later fixes and balance changes were comparison evidence rather than that pass's requirements. The next baseline was **0.97.2**; this old analysis remains version-bound. Historical descriptions guide investigation, and native evidence resolves disagreements with the descriptions.

## Sources and version boundary

- [Single readable changelog](../CHANGELOG.md) combines this historical export with the nine later releases supplied on October 18, through 0.97.2. The index and observations below still describe the original 0.91.4 comparison; they were not regenerated against the new target.
- Original: [changelog_2026-10-15_1.json](../../changelog_2026-10-15_1.json), preserved without editing. SHA-256: `4dac00d8739524db791199e8f78a53e9ba1abbc17e1c041b5eefb3da8dd17e56`.
- The file has 140 messages, including commentary and messages containing several releases. The [normalized index](evidence/changelog-index.json) retains 138 version sections, exact section text, bullet claims, original message IDs, timestamps and one-based message ordinals. These are historical release claims, not observations of native behavior.
- First message: v0.19.0, 2026-10-08 19:31:39 UTC. Last: 0.92.0, 2026-10-15 18:41:02 UTC. Dates here preserve the source timestamps.
- [Reproduction helper](../../scripts/index-changelog.py): `python3 scripts/index-changelog.py`. It does not execute the target.

The EXE SHA-256 is `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`. The exact ASCII version `0.91.4` occurs three times:

| File offset | Preferred-image VA | Static context |
| --- | --- | --- |
| `0x589e973` | `0x14589fd73` | Immediately before updater messages including `this is v` |
| `0x58a0189` | `0x1458a1589` | Beside new-version UI strings |
| `0x58cac08` | `0x1458cc008` | Beside `097de76e`, a string descriptor of length six, and the picker's `v… (…)` formatting bytes |

The index retains exact context bytes and hashes for those hits. An all-file exact ASCII search finds zero `0.92.0` occurrences. This is direct evidence of the embedded game version, although no running process or rendered version label was inspected. The separate `v0.2.0-434-g097de76e` build string belongs to a different version namespace; it should not replace the game's 0.91.4 identity.

The PE timestamp is 2026-10-15 17:25:03 UTC, after the supplied 0.91.4 message at 17:19:23 and before 0.92.0 at 18:41:02. This is consistent supporting chronology only: a mutable PE header timestamp is not authenticated build provenance.

## Addon API: 0.87 groundwork, 0.88 internal meters, 0.92 expansion

| Changelog entry | Historical claim | Evidence in this EXE |
| --- | --- | --- |
| 0.87.0, message 127, ID `1560018192443777095` | Hide each HUD section; export run/zone/boss/schedule/guardian/target/build/buffs, damage meter and damage taken | [Extracted embedded Lua](evidence/official-addon-api.lua) contains these public tables, parsers, getters and prefixes. |
| 0.88.0, message 128, ID `1560042226644549794` | Native HUD adds Healing Done and Boss Damage views; healing excludes overhealing; simultaneous bosses form one fight | English catalog contains `Healing Done`, `Boss Damage` and meter-related fields. This release does **not** claim those views are yet public addon API. Native calculations and reset behavior require tracing. |
| 0.92.0, message 140, ID `1560361879396683798` | Addons gain healing/boss meters and positioned caches/guardian lairs | The extracted 0.91.4 Lua has no such table/message branches, coordinate fields or getters. This is a version boundary, not evidence of a defect in the 0.87 API extraction. |

The extracted Lua has 13 functions: parsers `AZS_Fields` and `AZS_List`; getters `AZS_GetRunTime`, `AZS_GetPhase`, `AZS_GetRunLength`, `AZS_GetBosses`, `AZS_GetGuardians`, `AZS_GetUpcomingBosses` and `AZS_GetMeter`; HUD controls `AZS_SetHudShown`/`AZS_IsHudShown`; `AZS_UnitKind`; and `AZS_ApiOnEvent`.

Its addon-message branches are `AZSRUN`, `AZSZONE`, `AZSBOSSES`, `AZSUNITS`, `AZSTGT`, `AZSSPELLS`, `AZSBUFFS`, `AZSMETER`, `AZSTAKEN` and legacy `AZS`. `AZSUNITS` parses only `kind,id,name,hp,hpm,state`; guardian results contain `id,name,hp,hpm,awake`. No map position is in that embedded schema. This is a complete reading of this Lua block, not a proof that no other native export exists anywhere in the EXE.

## Recovery priorities mapped to historical rules

Use each entry as a hypothesis/test case for native tracing, resolving superseded releases before implementing a rule. Exact message text and IDs are searchable by version in the normalized index.

| Priority / subsystem | Relevant releases and historical rules | Native evidence to recover |
| --- | --- | --- |
| 1 — Run loop and horde | 0.34: kill-rate response up to 3×, immediate refill and clock-growing population. 0.91: spawn just out of view, favor direction of travel, spawn outside boundary, return distant enemies ahead, stampede/wall/pack waves, arena-specific gates. | `game/enemy.rs`, `game/mod.rs`, `nav.rs`: timers, view/spawn geometry, caps, population feedback, recycle criteria, wave state and deterministic ordering. Existing warning strings include all three new wave types. |
| 1 — Schedules and endless | 0.39: finals at 16/18/20 minutes by zone group. 0.64: endless boss every five minutes, random member of the zone's bosses, re-killing a final does not reset endless difficulty. | The nine linked zone tables and 45 boss records in [embedded evidence](evidence/embedded-game-data.json); native due comparison confirms `clock / 60 >= boss[64]`, with a five-entry cursor. The configured minute schedules match 0.39. End/victory transitions, bypasses and endless selection remain to trace. |
| 1 — Difficulty/scaling | 0.30/0.34/0.53/0.57 repeatedly alter horde health curves; 0.59.1 removes new horde scaling from elites; 0.61 reduces health late and for bosses arriving at ≥16 minutes; 0.75.1 endless damage growth becomes 9.6%/minute instead of 12%. | Base-table versus effective HP/damage, time exponents, each enemy kind's curve, zone/run multipliers, late-boss adjustment and endless application order. Avoid multiplying every historical percentage together. |
| 1 — Automatic casting and damage | 0.33 free talent casts inherit ranks; 0.56 flat level damage rises 3%, not 6%; 0.57 adds nine triggered/proc spells; 0.61.1 prevents useless cooldown upgrades; 0.64.1 spells cast automatically and action-button use does nothing. | `game/abilities.rs`, `game/procs.rs`, `game/talents.rs`: cast triggers, charge/cooldown floors, proc rate limits, rank inheritance, level formulas and damage-school interactions. |
| 1 — Targeting and status | 0.29.1 hold chain ≤3 sec then 2 sec immunity; 0.61.4 Execute/Eviscerate/Backstab prioritize bosses/elites, then wounded <30%; 0.62.1 Aimed Shot prioritizes Hunter's Mark; 0.72.4 marks switch to bosses/elites; 0.77.6 DoTs pick fresh/unhurt nearest enemies; 0.89 pets/bolts/auto-attacks prioritize bosses/elites. | Target scoring and exclusions per spell, DoT fill order, range and line-of-sight gates, fear/pathfinding, status duration/cooldown. 0.92's guardian-on-kill and feared-wall fixes are beyond this EXE's embedded version. |
| 2 — Cards, jewelry and economy | 0.21 rarity-dependent amulet growth; 0.27 caps/refills and no capped offers; 0.30 cache starts at 20 gold, offensive versus defensive growth diverges; 0.47 three free rerolls then 100×3ⁿ gold; 0.61.1 upgrade-floor exclusions; 0.79 optional click-only caches. | `game/upgrades.rs`, `jewelry.rs`, `gear.rs`: slot limits, weighting, unlock predicates, diminishing growth, affordability, reroll state, cache price and gold fallback. |
| 2 — Persistent progression | 0.43 portable export/import; 0.68 achievements/lifetime counters; 0.69 account perks, companions, tabards and two reward resets; 0.76 per-class hero/race/features. | `save.rs`, `driver.rs`, `achievements.rs`, `appearance.rs`, `talents.rs`: exact serialization, integrity/sealing, migrations, payout/threshold formulas and account/class/hero ownership. |
| 2 — Talents and survival | 0.33 general overhaul; 0.54 Paladin Retribution; 0.63/0.66 Warrior Protection; 0.67 Paladin Protection; 0.74 Mage starter overrides; 0.86 Arcane/Shadow/Lightwell revisions and one-second immunity after picks. | Tree row/prerequisite/max-rank tables, refunded talent migrations, shield accumulation/burst accounting, resurrection cooldowns, free-cast limits and starter overrides. |
| 2 — Guardians and companions | 0.27 guardian death adds 25% health/5% damage to later guardians, lair refills after three minutes; 0.71.1 fetch reach begins beyond player pickup radius; 0.83.1 companions run twice hero speed; 0.88.1 guardian leash grows from 65 to ≈98 yd and totem strike rate stops slowing with duration. | `game/guardians.rs`, `game/companions.rs`, `game/abilities.rs`: lair initial state, return/refill gates, kill-count/time scaling, fetch reservation and return, pet timing. |
| 3 — Presentation and compatibility | 0.72.2 pause freezes airborne state/cooldowns; 0.85 navigation/multiple boss bars; 0.87 HUD switches; 0.88 meter modes; 0.90 German; 0.91.3 GPU weather; 0.91.4 font fix. | Preserve game-affecting pause and navigation semantics first; inventory UI bindings and presentation contracts while native gameplay recovery proceeds. |

## Supersession rules that matter

- **DoT stacks:** 0.52's Seal of the Damned adds stacks. **0.57 replaces this:** innate extra stacks at levels 15, 30 and 45; the ring instead adds up to 40% tick haste. 0.77.6 changes normal target selection again. Implementing 0.52 directly would reconstruct an older game.
- **Area:** 0.57 halves damage and area. **0.59 restores full area**, introduces a 70-yd soft cap (twice that nominal area reaches about 91 yd), and **0.61 raises affected damage 20%**. Native formulas decide exact units/composition.
- **Density rewards:** 0.35.1 makes 500% density worth 1.2× reward; 0.35.3 divides per-kill XP/gold by density; 0.38.2 removes density's reward multiplier; **0.39.3 restores the 1.2× contribution** while keeping diluted per-kill earnings. The broader Run Options reward cap is described as 2×.
- **Jewelry caps:** 0.27 caps rings/trinkets and amulets; 0.30 changes offensive/defensive approach to the cap. The current English text about three-times amulets is not a complete formula.
- **Talent trees:** 0.33 is only the first overhaul in this export. Warrior, Paladin, Mage and Priest have later structural changes; early milestone names/numbers may be obsolete.
- **Metrics:** native Healing Done/Boss Damage introduced 0.88 and addon export added 0.92 are separate milestones. Internal availability does not imply public 0.91.4 addon access.

## The 0.92-only change list

Retain these as later-version comparison targets rather than current 0.91.4 reconstruction requirements: nineteen legendary-necklace power changes; `No Spell Effects`; full-blow thorns reflection before armor/shields; guardian kills triggering on-kill procs correctly; fear respecting walls; Anathema/Benediction models; and healing/boss-meter plus positioned cache/lair addon exports. Exact ASCII searches for `No Spell Effects` and `noSpellEffects` are negative in this target, a bounded supporting check rather than universal proof of feature absence.

In particular, the later descriptions of guardian on-kill and fear fixes identify regression probes for 0.91.4. They do not authorize repairing those behaviors in the reconstruction before establishing what the selected EXE actually does.

No target execution, MPQ inspection, runtime tests or remote changelog retrieval was performed for this guide. Native code remains the authority for the version represented by the supplied EXE; the changelog supplies author intent, regression examples and a map of what to recover next.
