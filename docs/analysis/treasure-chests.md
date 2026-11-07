# Treasure-chest spawning — native 0.92.0 recovery

Research checkpoint: **2026-10-18**. That task recovered chest spawning and the lifecycle
that changes the number of unopened chests. **At that checkpoint, no gameplay implementation,
build, test, original/rebuilt game launch, MPQ inspection, or push was performed.**
The menu reconstruction remains paused and its parity goal remains incomplete.

The subsequent
[source follow-up](treasure-chests-source.md) records the compiled Rust component,
30 bounded native-instruction fixture cases, 18 passing focused tests and remaining
engine-integration gaps. The static findings below remain the **0.92 component's**
specification. The repository now targets [0.97.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.97.2.md); these rules,
addresses and nine-zone/drop tables have not been revalidated against that build.

## Target and evidence boundary

The independently inspected target is the project-local
`AzerothSurvivors/AzerothSurvivors.exe`, embedded version **0.92.0**, 130,888,192
bytes, SHA-256:

```text
47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2
```

Preferred image base is `0x140000000`. Addresses below are **VAs**, unless a
column explicitly says RVA; subtract the image base to convert. Offsets such as
`Game+0x91c` are object fields, not executable addresses.

A separate Windows static report identifies
`AzerothSurvivors/AzerothSurvivors.exe`, SHA-256
`2149da82c8e6e1096cdd7d600c60a2b7d763a6969bae425323db9ebbe6e56a4e`.
Its two-starting-chests / 60-second-first-attempt / 70-second-interval /
three-and-five limits were useful hypotheses. Those rules were independently
recovered in the local target. The Windows file and its referenced disassemblies
were **not** available or inspected in this checkout; this report does not
authenticate its version or establish byte identity between builds. One concrete
layout difference is local state byte `Game+0x94e`, versus the supplied report's
`+0x94f`.

Owning evidence:

- [Manifest](evidence/0.92/treasure-chests/manifest.json): original function-byte
  hashes, exact VA/RVA/file offsets, 20 bounded disassemblies, constants, all
  nine zones, and the 27 chest-dropping enemy definitions.
- [REA provenance](evidence/0.92/treasure-chests/rea-provenance.json): Ghidra
  Evidence IDs, raw-slice identities, analysis profiles, limitations and curated
  pseudocode. REA was run through `./scripts/rea` using Ghidra 12.1.4.
- [Extractor](../../scripts/recover-treasure-chests.py): reproducible original
  PE reads and disassembly, guarded by the complete target SHA-256.
- [Embedded addon interface](evidence/0.92/official-addon-api.lua): consumer
  schema, corroborated here by the native producer and iterator.

## Recovered normal-run rules

| Question | Recovered behavior | Native anchor |
| --- | --- | --- |
| Starting chests | Two, each independently placed | Initialization `0x145488c20..0x145488c72` |
| First timed attempt | At run clock 60.0 seconds | Constructor `0x145473169..0x145473173` |
| Later attempts | Due tick sets next attempt to **current run time + 70.0**, even if creation is skipped | Tick `0x1454800ec..0x145480102` |
| Timer population gate | Create one if the shared pickup list contains fewer than three kind-2 records | Tick `0x14548010b..0x145480219` |
| What counts | Every existing kind-2 chest, regardless of source, distance or affordability | Same list/count loop |
| Enemy source | An eligible dead enemy with nonzero definition byte `+0x4c` creates one chest | Death `0x145499f23..0x145499f87` |
| Shared creation limit | At five or more existing chests, remove one oldest chest, then append the new one | Creation `0x14549d44f..0x14549e399` |
| Opening after skipped attempt | Leaves the next attempt unchanged; no immediate refill | Purchase/removal contain no timer update |
| Pausing | Stops this clock and the active tick body | State gate `0x145474237..0x145474253`; pause/resume below |
| Timed expiration | None found in the traced direct removal paths | Bounded coverage described below |

With negligible frame delay, attempts occur around **1:00, 2:10, 3:20, 4:30,
5:40, 6:50**, and so on. This is an attempt schedule, not a guarantee of a new
chest. It is also not an absolute `60 + n*70` schedule: scheduling from the
actual due tick permits small accumulated frame delays. A large clock step
causes one attempt in this tick; this branch contains no catch-up loop.

The two limits have different purposes. The periodic source stops adding at
three; enemy drops can take that same population to four or five. A sixth
creation replaces an old chest rather than refusing the new one. The creation
routine removes **one** record when count is at least five; it does not loop to
repair an already-corrupt population above five.

## Object layout and initialization

The constructor `0x145472810..0x145473b3d` assembles a `0x950`-byte Game value
at `rbp+0x28`, then copies it to the result. This stack/object correspondence
binds the initial values to their consumers:

| Game offset | Recovered role / default |
| --- | --- |
| `+0x3e8,+0x3ec,+0x3f0` | Player x/y/z |
| `+0x408` | Current gold |
| `+0x520,+0x528,+0x530` | Pickup Vec capacity/pointer/length; initially empty |
| `+0x670` | Number of caches bought |
| `+0x868` | Terrain/navigation resource pointer |
| `+0x870..+0x888` | Shared four-word gameplay RNG state |
| `+0x8d4` | Float run clock; initially zero |
| `+0x8e0` | Pending cache choices |
| `+0x91c` | Float next chest attempt; initially 60.0 |
| `+0x920` | Unsigned shared cache price; initially 20 |
| `+0x92c` | Last insufficient-gold message time |
| `+0x930` | Next conditional pickup-batch time |
| `+0x944,+0x945` | Click-only cache setting / already-shown hint flag |
| `+0x946` | Deferred start request, cleared when consumed |
| `+0x947` | Default-zero extra-pickup mode flag; identity unresolved |
| `+0x94e` | State: initialization writes 1; pause writes 3; resume writes 1 |

Constructor `0x145473169` loads `0x0000001442700000`; the low dword is
`60.0f` and the high dword is integer `20`. The subsequent shared purchase
consumer independently identifies the latter field as the price.

Tick starts the run when state is zero and the deferred-start flag is set,
then enters active behavior only for state 1. At
`0x145474246..0x145474253`, it adds its supplied delta to the run clock.
Pause `0x145487100` changes 1 to 3 and emits `paused`; resume
`0x14548ce70` changes 3 to 1 and emits `unpaused`. Neither resets the chest
deadline. These are run-clock semantics; wall-clock elapsed time is not the
chest timer input.

Pickup records are `0x48` (72) bytes:

| Record offset | Native use |
| --- | --- |
| `+0,+8,+0x10` | Auxiliary-entity Vec capacity/pointer/length |
| `+0x18` | Pickup/movement state; new chest zero |
| `+0x20` | Kind discriminator; chest **2** |
| `+0x24` | Caller value; chest quantity is not used for population counting |
| `+0x28` | Primary entity identifier |
| `+0x30` | Chest object entry **9005** (`0x232d`) |
| `+0x34,+0x38,+0x3c` | World x/y/z |
| `+0x40` | Float creation run time |

The chest branch uses model identifier **259** (`0x103`) and scale **1.0**.
These are recovered creation parameters, not independent proof of the rendered
asset's appearance. Kind 2 is proved by the producer, creation switch and
`AZSCHESTS` iterator, not inferred from the label-array index.

## Exact placement flow

Both startup calls and the periodic call use helper
`0x145497d00..0x145498151` with minimum **18.0** and maximum **50.0**.

1. Draw an angle in `[0, 2π)` from the Game's RNG and a radius in `[18, 50)`.
   The range helper `0x1454d71c0` computes the latter with float arithmetic as
   `min + U * (max-min)`, rejecting an upper-bound result. This is uniform in
   radius rather than uniform in disk area; it shares the Game RNG with other
   behavior, rather than using a private chest RNG.
2. Add `radius * (cos(angle), sin(angle))` to player XY.
3. Project an outside candidate onto the selected zone's circle at its full
   radius.
4. When the resource's grid is present and this candidate maps to an in-range
   cell, reject a nonzero cell. A missing grid, negative/outside coordinate or
   out-of-grid index takes the terrain-height path. Calling this a blocked-cell
   mask describes its observed use; its full construction was not recovered.
5. Require a successful terrain-height result and
   `abs(height - player_z) < 25.0` for a regular candidate.
6. Try up to **12 candidates**. If all fail, draw one additional angle/radius
   around the player, query height, and use the resource's fallback Z if there
   is no height. This fallback skips the regular grid/height-difference checks
   and the helper's full-radius projection.
7. The shared creator **always** applies its own final planar clamp to
   `max(zone_radius - 2.0, 1.0)`. It then obtains terrain height again, using
   fallback Z if absent, before creating the entity.

Consequently, 18–50 is the requested sampling radius. The final chest can be
closer to the player after boundary projection, particularly in the small arena.
The routine does not search existing pickups to enforce a minimum distance from
another chest. The fallback also means that this static algorithm does not
guarantee every final position is walkable. Actual MPQ-backed terrain results
and original-runtime accessibility were not tested.

| Zone | Center X | Center Y | Stored radius | Final creation radius |
| --- | ---: | ---: | ---: | ---: |
| Elwynn Forest | -9396 | -633 | 120 | 118 |
| Duskwood | -10540 | 180 | 120 | 118 |
| Warsong Gulch | 1230 | 1450 | 120 | 118 |
| Arathi Basin | 975 | 1030 | 127.5 | 125.5 |
| Feralas | -4680 | 1300 | 120 | 118 |
| Gurubashi Arena | -13204 | 274 | 32 | 30 |
| Alterac Valley | -230 | -290 | 135 | 133 |
| Blackrock Mountain | -7760 | -1800 | 120 | 118 |
| Gates of Ahn'Qiraj | -7800 | 1500 | 120 | 118 |

The shared lookup uses selected-zone key fields `Game+0x210/+0x218`; table stride
is 184. Native table base `0x1466d2a08` is eight bytes before the key-first record
layout used in the manifest. Thus native center/radius fields `+0x98/+0xa8`
correspond to key-first `+0x90/+0xa0`.

## Enemy chest source

Death handler `0x145498160..0x14549b60c` reaches a chest branch when its enemy
definition exists and byte `+0x4c` is nonzero. At
`0x145499f23..0x145499f87`, the branch performs no chest-probability draw: it
adds **(2, -1)** to the dead enemy's XY, obtains terrain Z or fallback Z, and
calls the shared creator with kind 2. The shared boundary clamp and five-chest
eviction still apply. It does not consult or update the 70-second timer or its
fewer-than-three gate.

The table partition is now explicit: every zone has 12 enemy definitions;
indices 0–8 have flag zero and indices 9–11 have flag one. These 27 entries
are the elite-like chest-dropping partition. The original source field's exact
name has not been recovered; the addresses/bytes and branch behavior are the
authority, rather than the inferred label "elite".

| Zone | Flagged definitions, in table order |
| --- | --- |
| Elwynn | Kobold Taskmaster; Gruff Swiftbite; Bellygrub |
| Duskwood | Worgen Alpha; Carrion Recluse; Flesh Eating Abomination |
| Warsong Gulch | Felguard Elite; Infernal; Doomguard |
| Arathi Basin | Crypt Fiend; Bone Golem; Death Knight Captain |
| Feralas | Gordunni Brute; Warpwood Treant; Ironbark Protector |
| Gurubashi Arena | Gurubashi Berserker; Zulian Crocolisk; Gurubashi Champion |
| Alterac Valley | Alterac Yeti Lord; Mountain Giant; Winterax Warlord |
| Blackrock Mountain | Core Hound; Black Drake; Molten Giant |
| Ahn'Qiraj | Qiraji Champion; Anubisath Sentinel; Obsidian Destroyer |

The manifest retains each name, original record, flag and byte hash. Separate
boss/guardian reward paths are not equivalent to this kind-2 field-chest branch.
Jewelry reward weights and guardian/boss scheduling were outside this request.

## Capacity, eviction and removal

The shared creation switch table at `0x146ab13a4` maps kind 2 to
`0x14549d44f`. It counts all kind-2 records and compares with five at
`0x14549d556`. At capacity it selects the smallest `+0x40` float timestamp
using the compiled float total-order transform. Equal timestamps keep the
first encountered record, so equal-time startup chests retain vector order.

It calls removal at `0x14549e168`, then appends the new record with
`+0x40 = Game.run_clock`. Removal `0x1454a5d50` shifts later records left by
72 bytes, decrements length, queues removal of the primary and auxiliary entity
IDs and frees the auxiliary vector. Eviction itself does not count as a purchase
or increase the price.

All five direct call sites of this removal helper were inspected: walking
purchase, explicit click purchase, capacity eviction, companion collection and
reward-completion XP collection. The latter two select other kinds and exclude
chest 2. **No chest age-expiration was found within these paths.** This is a
bounded negative result, not proof against unrelated world teardown or every
possible indirect call. The creation timestamp is positively identified as the
eviction-order key.

## Opening behavior that affects spawning population

Walking purchase uses fixed planar range **3.0**, rather than the ordinary XP
pickup radius. With click-only setting `Game+0x944` nonzero, walking does not buy;
it emits `Right-click a cache to buy it.` once using hint byte `+0x945`.
The native option is `cacheOnClick`; the constructor initializes its backing
byte to zero. The existing [Options descriptor evidence](evidence/0.92/options-definitions.json)
independently binds the setting name and help text.

Explicit purchase handler `0x145495820` requires active state 1, matches the
entity ID and kind 2, and permits planar distance **at most 10.0**. It does not
require click-only mode to be enabled. The event-dispatch tail route and the
embedded option text identify this as the cache-click path; input and distance
behavior were not exercised in the original runtime.

Both paths use `0x1454a81a0`:

- If gold is insufficient, leave the chest, gold, price and purchase count
  unchanged. The message `This cache needs {n} gold.` is throttled by a strict
  `now - last_message > 4.0` test.
- Otherwise subtract the shared price, set the next shared price to
  `saturating_u32(trunc(f32(old_price) * 1.3f + 5.0f))`, and increment caches
  bought and pending cache choices. Multiply/add are separate float operations.
- Remove the chest and queue the native interaction command. When still active,
  a pending choice exists and flag `+0x947` is zero, invoke the cache-choice UI.

The initial prices are **20, 31, 45, 63, 86, ...** gold. This is one run-wide
price, including enemy-dropped chests; it is not a per-chest spawn-time price.
Neither purchase nor removal changes `Game+0x91c`, explaining why opening a
chest after a missed attempt produces no immediate replacement.

## Positioned addon export

Native producer `0x145461740` walks the same pickup vector using iterator
`0x1454dc230`. The iterator filters `record+0x20 == 2`, reads entity ID and
world XYZ, and formats world/minimap positions. Dispatcher `0x1453e5b70`
pairs that payload with exact message name `AZSCHESTS`. The embedded Lua parses
`id,x,y,z,mx,my` and timestamps reception.

This is a current-field inventory, not a list of future spawn locations. The
outer dispatcher compares payloads with cached payloads before queuing changes;
a precise end-to-end delivery cadence was not measured. Minimap conversion
resource construction was not part of chest spawn-rule recovery.

## Default-disabled extra source

The active tick has a separate branch gated by `Game+0x947`, initialized zero.
When enabled, it restores player health, prepares a ring of enemies and creates
several pickup kinds, including one chest at `0x14547445e`. It reschedules its
own `Game+0x930` to current run time plus **12.0**. That chest also enters the
shared creator and its five limit.

This resembles a testing mode, but its exact name, enable route and intended
user availability remain **unresolved**. It must not be counted in normal-run
chest frequency. A different generic creator caller `0x145496850` explicitly
uses kind 6 and therefore is not another chest source. Direct E8 caller scanning
was followed by instruction checks; it does not prove absence of indirect callers.

## Behavioral model recovered from the instructions

This is explanatory pseudocode, not a gameplay implementation. Placement and
creation use the exact boundary/fallback rules above.

```text
construct:
    clock = 0
    next_chest_attempt = 60
    cache_price = 20
    pickups = []

start_run:
    state = Running
    repeat twice:
        create_chest(sample_near_player(18, 50))

active_tick(delta):
    if state != Running: skip active body
    clock += delta
    ... other active game systems ...
    if clock >= next_chest_attempt:
        next_chest_attempt = clock + 70
        if count(pickups where kind == 2) < 3:
            create_chest(sample_near_player(18, 50))

eligible_enemy_death(enemy):
    if enemy.definition.flag_4c != 0:
        create_chest(enemy.xy + (2, -1))

create_chest(requested_position):
    position = final_zone_clamp_and_height(requested_position)
    if count(chests) >= 5:
        remove(first chest having minimum creation_time)
    append(kind=2, position=position, creation_time=clock)

successful_cache_purchase:
    pay_shared_price_and_increment_choice_count()
    remove(chest)
    // no write to next_chest_attempt
```

## Validation, coverage and remaining uncertainty

| Research question | Status |
| --- | --- |
| Selected target identity and exact function bytes | Answered; full SHA and PE spans checked |
| Startup count, timer, skip/reschedule, clock/pause | Answered statically |
| Random placement, retry/fallback, boundary and height checks | Answered at the caller/helper level; actual terrain content untested |
| Enemy-drop predicate and all current flagged definitions | Answered statically; exact original field name inferred |
| Five-chest eviction, ties and shared population | Answered statically |
| Purchases/removal and effect on next spawn | Answered statically |
| Chest TTL | No TTL in all traced direct removal callers; bounded negative |
| Native positioned export | Producer/filter/schema recovered; delivery cadence unmeasured |
| Default-disabled pickup-batch mode | Gate/default/12-second behavior recovered; enable route/name unresolved |
| Live behavior / reconstructed parity | Not run, not established |

Ghidra analyzed unmodified function slices mapped at original VAs. It used a
generic GCC compiler specification for raw x64 bytes; Windows argument registers
and constants were verified against original PE disassembly. External switch
tables are absent from raw slices: the shared creation entry's jump-table warning
was resolved for chest kind 2 by original table bytes plus a separately analyzed
branch interval. That interval is not claimed as an independent original function.
Large tick/init/death/dispatcher dossiers exceeded the MCP response budget; their
complete retained Evidence was exported and read without repeating analysis.
These were transport limits, not incomplete analysis or failed game execution.

The static extraction was run successfully: **15 full-function hashes, 20
bounded disassemblies, 14 constant spans, nine zones and 27 flagged enemy
definitions**. Curated REA slices were checked against the original byte spans.
No game, build, test suite, emulator, HTTP adapter or installed-save operation
was started at the initial research checkpoint. The source follow-up separately
records its build/tests and bounded instruction emulation. No original EXE, generated binary, DLL or MPQ is
part of the intended commit. GitHub delivery remains suspended until menu parity.

Reproduce the byte/data evidence from this checkout:

```sh
python3 scripts/recover-treasure-chests.py
```

To repeat an individual Ghidra scope, use the existing exact-slice extractor and
batch runner described in [REA.md](../REA.md), selecting the function VAs in the
manifest. Keep newly generated slices, REA plans, logs and full bundles under
`runtime/`. The manifest and curated textual evidence remain tracked here.
