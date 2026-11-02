# In-run party mechanics — 0.115.0

The selected installed EXE is **0.115.0**, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
`crates/wenilla-rogue/src/game/party.rs` has 42 diagnostic references across
21 native owners. Those locations lead to per-hero context operations; their
count does not measure recovered gameplay. The connected source implementation
is [game_party.rs](../../crates/azeroth-survivors-re/src/coop/game_party.rs), with
the shared-world adapter in
[mechanics/coop.rs](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs).
Current overall delivery and outstanding gaps belong to
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The [manifest](evidence/0.115.0/coop-game-party/manifest.json) binds exact function
bytes, selected assembly, Ghidra pseudocode, constants and durable query results.
Ghidra analyzed exact function ranges through `./scripts/rea query`; external
bodies/data are absent from those raw imports. Original PE instructions and
checked data supply the Windows calling conventions and numeric constants.
Pseudocode is decompiler output, not original Rust.

## Recovered contracts

| Native owner | Recovered source contract |
| --- | --- |
| `0x1458e8b60`, repeated context operations | Native slot zero selects the local hero; one-based remote slots select the corresponding remote state. Remote execution removes the selected row, changes the active hero, executes its ordinary owner, restores local context and reinserts the row at the same index. The reconstructed party uses explicit slots and does not equate names or damage rank with identity. |
| `0x145920ed0` | The complete 4,905-byte swap moves player/class/ability/vitals, personal meters and counters, choice state, mover sequence, tracking state and other hero fields. It preserves the enemy vector, shared hazard queues, RNG, world movement sequence (`Game+bcc`), clock, party vector and active index. The adapter swaps personal source owners around one actor world; it does not tick separate solo worlds. |
| `0x145900890` | Cooperative mode is enabled only after successfully inserting an actual remote hero. Admission requires at most three existing remote rows and phase zero (reads local phase while noncooperative, shared phase after admission). Listening or accepting a TCP peer alone does not create cooperative gameplay. |
| `0x1458ff450` and `0x1458f74f0` | Target snapshots retain per-hero position and exact active predicate. Enemy targeting uses native state `1`; revive helper snapshots accept states `1` and `2`. |
| `0x1458f75b5..0x1458f788f` | Choose the nearest active hero in XY, retaining the first equal-distance row. Retain an eligible existing target unless the new squared distance is strictly less than the old squared distance multiplied by `0.7` twice. Invalid current targets are replaced immediately; with no eligible hero the existing target remains. The source caller retains the normal enemy motion/terrain owners. |
| `0x1459cc920`, `0x1458f8886..0x1458f8b65` | A downed, unfinished hero (`state == 4`, finish flag clear) receives help from other eligible heroes at XY squared distance **at most 25**. Z is ignored. Progress increases by delta once while at least one helper exists; otherwise it decays by delta to a floor of zero. Every helper contributes an interaction row, but extra helpers do not increase revival speed. |
| `0x1459001c0` | At **6 seconds**, clear revival progress, set hero state to `1`, restore **50%** maximum health and refresh effect/spell **1020** until run clock plus **2 seconds**. The source returns a typed completion event for the ordinary health/effect consumers; it does not invent its network encoding or reproduce the surrounding unreviewed presentation constructors. |
| `0x1458fa9b4..0x1458fa9ed` | Party meter rows are captured only when cooperative mode is enabled and run clock minus the previous capture is at least one second. Before the first capture the meter is empty. The getter still recomputes rates from cached damage using the current run clock. |
| `0x1458f48a0`, `0x1459e5520` | Party meter sorts per-hero cumulative damage descending, keeps native spell rows in their established order and uses the first spell row. Seven columns are name, lowercase class, rounded damage, DPS (one decimal), raw damage fraction (four decimals), localized top-spell name and top-spell DPS (one decimal). Run seconds are `max(f32 clock, 1)`; total raw damage has a floor of one. No rows are invented from lobby membership. |
| `0x1458f5310`, `0x1459c2890` | Revive output is empty outside a cooperative run. During native running state `1`, an unfinished downed hero emits `down=1;share=…;by=…`; share is elapsed/6 clamped to 0–1 with two decimals and `by` is the first helper name. Other admitted party contexts emit `down=0`. Eligible helpers append the downed target name and interaction share with two decimals; the greatest share wins, with the later row winning ties. |
| `0x145949400`, `0x145976180`, `0x145920470`, `0x1458daa10` and the global update | XP/gold collection queues the collector index and raw amount. The collector receives its immediate rounded grant; each other non-down hero receives the combined wrapping raw sum, using its own multiplier. Cooperative factor is `1 / (1 + (non-down heroes - 1) * zone_coefficient * 0.6)`, with coefficient `0.7` for the first three native zones and `1` otherwise. A zero live count is clamped to one. |
| `0x1458f90b2..0x1458f917f` | World scheduling rotates to the next state-1 hero, wrapping in native slot order. The one shared scheduler uses that hero's actual position, velocity and level. It skips scheduling when every hero is choosing/down/terminal. |
| `0x145923166..0x1459231df`, `0x145923e75..0x145923eba` | Before removing a delayed action or mutating a shared hazard, resolve the source enemy's current target index and process it only in that hero's context. Missing sources select index zero. Predicate-filtered shared queues preserve this rule without repeating RNG, actor creation or world effects. |
| `0x1458fa56c..0x1458fa9b4`, `0x14594b8f0` | Shared guardian strength reaches every non-down hero. Each boss's equipment transfer reaches the other heroes unless they deliberately abandoned; their own class, equipment chance and the shared RNG determine their real equipment rolls. World pickups are created once. |
| `0x1459202c0`, `0x1458f9b71..0x1458f9c24` | A non-endless active hero completes when the shared final-boss latch is set. Shared state remains running while any hero is state 1 or 2; otherwise any state 5 wins, and all other combinations lose. On shared victory, downed hero contexts become victory contexts. A local down does not end or save the whole run. |
| `0x1458feff0`, `0x145903b80` | Shared victory continuation visits every hero in native order. Positive/unordered-health heroes use phase-5 continuation, enable endless and set the shared deadline to click time plus 300 seconds; zero/negative-health heroes return to state 4. Shared state becomes 1. |
| `0x14590f0f0`, `0x145983f40` | Private HUD JSON carries actual hero scalars and typed ability, jewelry, buff, recurring-timer, damage/healing/boss-meter, boss, revival and party-meter arrays. Ability cooldown uses the final reciprocal stat, ordinary Hellfire has the 0.5 floor, and unsupported passive cooldowns serialize zero. Meter totals round through the native CRT `round`. |
| `0x14594df00`, `0x14594bc00`, `0x145983510`, `0x1459011a0` | Actual living-hero count selects HP factors `1 + ((count-1) * zoneCoefficient) * 0.9` for ordinary actors and `* 1.3` for bosses/guardians. The coefficient is 0.7 in the first three zones, 1 elsewhere. Initial HP applies the factor last, after HP options. Disconnect rescales positive-HP actors by new/old factors, preserving proportion with a 1 HP floor and publishing ceiled maximum/current fields in actor allocation order. Wards have neither native special-membership option; their constructor copies supplied parent-derived HP without another spawn factor and disconnect uses the ordinary ratio. |
| `0x14591a310` | Pause accepts state 1 only while `Game+c41 == 0`. After cooperative admission it returns without changing any phase. Opening a local pause UI must therefore leave the cooperative simulation running. |

The numeric class mapping is the target's class table: `2=paladin`, `3=hunter`,
`4=rogue`, `5=priest`, `7=shaman`, `8=mage`, `9=warlock`, `11=druid`, and the
native fallback is `warrior`. Names are display data. The current sanitizer
replaces tab, comma, semicolon and equals with spaces before addon serialization.

`Party` is a simulation snapshot, separate from the lobby roster. Actual
sanitized hero admission enables it. Current server disconnect owner
`145896390` calls `1459011a0`, which abandons and reinserts the selected hero
without compacting the world vector. Disconnected bodies, world indices and
queued reward owners remain until teardown; the transport assignment is removed.
The four-remote world cap therefore counts retained abandoned rows, even when
a replacement TCP peer can be accepted. The same disconnect owner refreshes the
actual non-down count and rescales surviving world actors once; unchanged
factors within the native `0.0001f` tolerance emit no health updates. Dead or
unordered-HP rows remain untouched. Ordinary, elite, guardian, boss, summoned
minion and hatch creation use their recovered initial HP factor; guardian
engagement refreshes use the same health helper. Source `remove_party_hero` is limited
to rollback before world admission commits. The adapter retains
native slot order, caches damage only at the one-second boundary, localizes and
combines actual meter identities, and applies revives through the existing
health/effect owners. Actual GUIDs flow through casts, healing, incoming damage,
periodic attribution, summon ownership and packet intents. Travel and facing
both retain the ordinary actor dispatcher's real shared movement serial.

The host runs all personal cast/aura/pet/loot/choice owners against the same
actors, pickups, RNG and clock. Actor AI, world scheduling and shared creation
run once, with source-target filtering for the relevant hero. The adapter keeps
world aura/appearance bookkeeping and lair placement separate from the solo
source structures that previously bundled them with personal state.

The exact control switch and guardian tracking setter are bound by
[co-op bootstrap evidence](evidence/0.115.0/coop-bootstrap/manifest.json).
Controls select/reroll/banish/skip, deliberately abandon, spend stored levels,
set cache-click/store-level options and toggle existing guardian POI tracking.
Subtype four does nothing. POI selection, visibility and the 300-second latch
remain personal; turning tracking off does not remove guardians or their AI.

Guest replicas consume validated native run metadata and ordered kill/damage
histories, plus actual engine self-object vitals. Copper is converted through
the established 10,000-copper run-gold unit. Replica application performs no
stat recalculation, actor creation or authoritative simulation. A downed guest
waits for the native shared-terminal flag before terminal account delivery.
Guest talent-XP and feat accounting use the two validated host multipliers and
bare-gear flag directly, preserving the native component arithmetic without
inventing four menu option percentages.

`coop_hud` serializes the current private JSON schema from real perhero state.
Its arrays retain actual ranks, cooldowns, item effects, active auras, timer
deadlines, localized meter identities and breakdowns. The distinct HUD amulet
text joins effects with comma-space; choice-card paragraphs keep their own
newline contract. The [overlay evidence](evidence/0.115.0/coop-overlay/manifest.json)
owns that text join and passive cooldown helpers. Party-meter class colors
come from the current native descriptor table; the one-second gameplay cache
remains the producer. Guest HUD application retains the full JSON for source
presentation consumers, copies only transmitted vitals/progression, and never
ticks the replica or rebuilds its stats.


Guest custom HUD boss bars, build icons and recurring countdowns now read those
received arrays through the existing renderer and layout. Boss-row ordinals are
presentation keys, distinct from actor GUIDs. The meter consumes received
damage/healing/boss rows, totals, breakdowns and segment timing through the same
reset/history/rendering owner; its display strings are owned, so localized
remote names and icons require no leaked static combat descriptors. A focused
Rust regression covers received meter identity and breakdown ownership; it is
unrun under the compilation restriction.

## Validation and remaining boundaries

`python3 -B scripts/check-coop-game-party.py` verifies selected-target
function/data hashes and retained extract hashes, then replays **1392 cases**
using the original x64 instructions:

- 18 helper-collection cases cover self exclusion, active flags, exact radius,
  outside-radius rejection, multiple helpers and ignored height.
- 72 target-selection cases cover eligibility, missing/invalid previous slots,
  distance ties, strict hysteresis, and no active heroes.
- 30 revive-clock cases cover progress, decay, lower floor, multiple helpers
  and the completion threshold.
- Eight sanitizer cases exercise all ASCII bytes, Unicode and the four replaced
  delimiters; eight damage-sort cases verify descending total order and equal-row
  stability, including signed zero, NaN and infinity.
- 72 remote-hero admission cases cover capacity, local/shared phase selection and
  pre-start restriction; 16 party-meter capture cases cover the cooperative flag
  and exact one-second threshold.
- 16 complete state-swap cases verify involution and preservation of the actual
  shared world ranges, plus exact personal phase/vitals/revive field movement.
- 258 scheduling cases cover every active mask and prior index for one to five
  heroes; 100 hazard cases cover source existence, source target and active slot.
- 108 reward cases verify raw collector queues and rounded grants across zone
  groups, party sizes and recipient multipliers. The zone resolver and CRT
  rounding are explicit fixture seams; ordinary coinage publication is not run.
- 12 pause cases reject cooperative pause for every local phase; 258 terminal
  folds cover all phase combinations for one, two and three heroes.
- 120 initial-HP factor cases cover ordinary, boss and guardian producers in
  solo/cooperative mode across zone groups and one to five non-down heroes.
  100 disconnect-factor cases cover every old/new party size; 14 epsilon cases
  include both threshold sides and unordered input. 160 actor-health cases
  verify both native membership options, positive-HP admission, preserved
  proportion, maximum clamp and the one-HP floor.
- 22 endless cases cover shared admission, health branches (including unordered
  native comparison), phase-5 admission and the click-time deadline. Class color
  table bytes and projected literals are checked independently.

The collector's allocation and initialization barrier are explicit fixture seams.
The check also guards source constants and key consumers. These are native
instruction and static source checks; they do not execute the Rust implementation.
Five library Rust regressions cover state transitions and exact payload examples.
Ten simulation regressions cover shared actor ownership, private GUID/event
identity, raw reward transfer/rounding, actual remote melee health and guest
shared-terminal/history consumption, allhero endless continuation and real
HUD array/vital consumption, retained disconnect indices/capacity, the real
incoming-damage immunity consumer after revival, and spawn/disconnect health
through actual shared actor creation and ordered field publication. The native raw immunity
tag12 maps to the retained source semantic tag11; the adapter does not pass
a current ABI discriminant into the older semantic enum. Revival publishes
ceiled current/max health fields and the existing player aura producer.
A guest endless death follows transmitted phase4 while retaining the won latch. A separate library regression covers guest XP
components from host factors. The existing movement regression now
checks the real travel intent and serial as well as facing. All Rust tests remain
**unrun** because compilation is not authorized. Rust formatter parsing checks
syntax only, not types, linking or execution.

This remains source/static reconstruction, not verified playable multiplayer or
complete native parity. The native update interleaves more personal substages
than the existing solo tick exposes; the adapter preserves the recovered main
ownership boundaries, but its complete cross-hero callback order still requires
further comparison. Ordinary pickup-flight ownership, every mixed personal/world
timer and all indirect proc interactions are not exhaustively revalidated by
these bounded vectors. Packet/bootstrap/UI integration has its own reports and
must be assessed together with this adapter. No compiler, original or rebuilt
game, live multiplayer session, renderer or controlled parity comparison was run.
