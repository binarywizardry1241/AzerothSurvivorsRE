# Grouped soak towers

This bounded **#42/#43** repair uses installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/raid-towers/manifest.json) binds all five current
native12 records and all nine retained summon phase records, their indices/thresholds/yells, warning literals, locale JSON
spans and selected producer/RNG/group-consumer instructions. Source connection
and static native instruction checks do not establish original/rebuilt parity.

## Producer, current records and phases

The current dispatcher jump table sends native12 to `1459588ca`. Its six-word
payload is spell, count, radius, spread, windup and damage factor. There are
two recurring slots and three phase slots; no current guardian uses this tag.
Semantic source tag13 carries a stable index into `bosses/raid_towers.rs`,
leaving word6 available for the owning recurring scheduler's cooldown.

| Boss | Native slot | Radius / spread / windup / factor | Spell |
| --- | --- | --- | --- |
| 1594 | phase0, health <50% | 4.5 / 12 / 4 / 5 | 1449 |
| 994 | move5, repeat24s | 4 / 12 / 4.5 / 5 | 24324 |
| 1493 | move3, repeat24s | 4 / 12 / 5 / 6 | 28524 |
| 1493 | phase0, health <50% | 4 / 12 / 5 / 6 | 28524 |
| 1494 | phase2, health <25% | 4 / 12 / 4.5 / 5 | 27819 |

Each current record creates three towers. The constructor admits at least one
for a zero count. It increments the independent wrapping Game+`0xa3c` group
serial and draws one base angle even when spread is nonpositive. Positive
spread adds a separate 23-bit native RNG draw in `[0.7,1)` per tower; evenly
spaced angles are measured around the current player's fixed XY position.
The native zone clamp uses radius minus4 and a 0.01 distance gate. Primary,
secondary and fallback height queries then choose Z. No ray clip is requested.

The producer uses the recovered cast deadline/SpellStart path without a
movement hold, creates kind1 circles in the shared hazard vector, and uses
the shared wrapping marker serial Game+`0xa38`. Damage is effective source
damage times the payload factor. Towers keep their fixed positions and
survive caster disappearance. Positive spread emits `Get in a tower!`;
nonpositive spread emits `Stand still!`, through the
[raw localized RAID_BOSS_EMOTE route](raid-warnings.md).
Both literal keys are absent from all14 current native locale catalogs, so
their English fallback is preserved. All three phase-yell keys match the
existing translated source values in those catalogs.

`PhaseState::take_actions` shares original phase latch bits between summons
and current raid actions, sorts crossed thresholds by complete native phase
index, and queues them before recurring moves. Strict threshold comparison
prevents firing at exactly50%/25%. A blocking tower phase suppresses recurring
blocking admission for the tick; nonblocking summons retain the exact native
admission mask. The existing phase-emote path retains the original phase index
for its localized key. The [complete current graph](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-native-0.109.0.md)
owns the remaining recovered phase/move variants and their source consumers.

## Group resolution and marker consumer

The shared hazard stage publishes active towers as circular `kind:"tower"`
markers and places occupied IDs in `hzt.in`. A due row queues its group once.
Native `1459c2f40` selects **every** tower with that group ID, without another
deadline, caster or publication filter. `145951a11` succeeds if the current
player is inside or on the boundary of any group circle. If outside every
member, it adds the first member's damage exactly once and selects that
member's source. Its optional spell visual targets the current player's XY
and primary-height result, falling back to the current player Z.

The entire group is removed on either success or failure. Published IDs
receive end messages through the shared reverse-removal stage; resolving
before first publication creates no transient create/end pair. Group damage
joins the existing single hazard hit aggregate, including its last-source
rule and final run multiplier. Shared `raid_markers.rs` consumes the tower
kind and occupancy messages; the existing renderer's historical recovery is
documented [separately](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-markers-0.108.0.md). Current renderer parity has
not been demonstrated by connecting this producer.

## Checks and limits

`python3 -B scripts/check-raid-towers.py` passes **84 original native
producer/RNG/placement/height/warning cases**, **28 original group-filter,
inclusive-membership, failure-aggregation and removal cases**, **144 current
boss phase-gate boundary/latch cases** and **2 f32 sequential accumulation
cases**. These include
center/edge positions, positive/zero/negative spread, zero count, terrain
fallbacks, wrapping counters, two groups and a future-deadline member sharing
an admitted group. The script also checks source payloads, exact current
dispatcher target, all five native12 records, all nine shared minion phase
records and all14 embedded locale maps. Tower failures add directly into the
shared scalar in group order, preserving native f32 rounding. Removal keeps
original vector indices before the shared reverse end-message stage.
Ghidra raw imports recovered the current producer owner and group filter;
their evidence IDs are retained in the manifest.

Unicorn executes original instructions with explicit synthetic CRT math,
terrain, zone selection, allocation and packet/localization seams. It does
not execute the EXE process or reconstructed Rust. Source regressions for
phase order/latches and blocked overdue timers are authored but unrun.
No compiler, compiling tests or game was run. Native22 actor wards have a
[separate source and lifecycle owner](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-wards-0.109.0.md). The
[presentation report](raid-markers.md) retains the unestablished boss
cast-display claim. Shared/global engine ownership, actual encounter behavior
and original/rebuilt presentation parity remain open.
