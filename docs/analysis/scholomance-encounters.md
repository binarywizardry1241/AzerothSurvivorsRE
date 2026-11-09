# Scholomance encounter dispatch

The [evidence manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.140.0/scholomance-encounters.json) binds these observations to the installed `0.140.0` EXE, SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`. It records the original PE ranges and the result digests for the bounded Ghidra queries. Raw imports omit external code and jump tables. The original instructions govern the call arguments and branches. [Finding #313](../verification-needed.md#gap-313).

## Scheduled bosses and their placement

The tick at `0x145f5ca39` reads the primary cursor at Game `+0xf98`. While the cursor is below five, it chooses a 104-byte row through Zone `+0x88`. Ordinal 10 and an exact `scholomance` key match enter a scan of the shared 552-byte actor rows. A row with byte `+0xd0` equal to zero and a boss definition at `+0x30` other than `-1` blocks the scheduled spawn. Ordinary enemies, Guardians and corpses do not block it. The scan considers every living primary boss. The original ordered `clock_minutes >= boss+0x50` test then admits one row and advances the cursor before creation. A due Heroic V final row can create its Council companion in the same tick. The endless branch follows the five scheduled entries and has its own deadline and draw.

The creator at `0x145f57c2e` takes the zone's fixed-point slice at `+0x68/+0x70`. Scholomance's five points are `(120, 145)`, `(147, 146)`, `(160, 170)`, `(128, 188)` and `(101, 160)`. The constructor uses the existing inclusive 20-unit distance filter and shared RNG draw. With no admitted point, ordinal 10 shares the fixed-point fallback at `0x145f5863d`: take the greatest total-ordered distance, with the later point winning ties. Terrain height resolution follows selection.

The scheduler checks the live primary-boss rows through its spawn port and the placement owner consumes the recovered point table. The historical boss fixtures resolve their original ordinals through their retained zone keys. The unchanged schedule instructions passed 840 cases with boss creation stubbed. The cases covered three zone ordinals, five scheduled rows, seven actor pools, two ranks and four deadline values. [Schedule source](../../crates/azeroth-survivors-re/src/bosses/spawning.rs), [placement source](../../crates/azeroth-survivors-re/src/bosses/placement.rs).

## Script registration and Kirtonos forms

The creator dispatch at `0x145f58547` selects a script header by creature entry. The script state stores its source GUID, a phase latch and one absolute deadline per 32-byte action. The dispatcher at `0x145f743e0` joins the state to its living actor, computes new threshold bits from `health / max(maximum_health, 1)`, invokes phase and update callbacks, and then admits recurring actions by phase mask, deadline and active attack state. The action selector at `0x14605e250` compares the priority byte and action ID among admitted rows. The dispatcher resets a successful recurring action to the run clock plus its repeat interval. For Heroic II and higher, it multiplies the interval by `0.8`, or `0.6` for an enraged primary boss, unless the action ID appears in the header's fixed-repeat list. Ras's list contains only tag 3, the Frozen Checkmate action.

Kirtonos initially equips item 21341 through the appearance descriptor at `0x1473a9430`. The phase callback at `0x145eeb730` gives the 30% bit precedence when a single hit crosses both thresholds. The 65% branch changes to display 7534 at scale 1.6 with empty weapons and retires the first two ordinary action timers. The 30% branch retires all four ordinary timers, restores the humanoid appearance and starts a fixed loop. The update callback at `0x145eea8c0` consumes one due beat per update. The 42-second loop calls actions at offsets 5, 12, 25 and 32 seconds and changes appearance at offsets 20 and 40. The `0x145ee90e0` form helper also applies a two-second hold and sends the start and go events for spell 16467. The form state, appearance, hold and cast events are connected to the source boss-effects stage. In co-op the host advances shared form state once. The 16 native callback cases stubbed the form application and checked both threshold bits, their ordering, timer retirement and cycle start. [Form state and descriptors](../../crates/azeroth-survivors-re/src/bosses/raid_transforms.rs), [live adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs).

## Scripted-hit armor

The hit consumer at `0x145fcf93a` reads the attack row's damage, source GUID and spell. It obtains the recipient's armor, including the native active Lightning Shield modifier, and caps the value at `0.95` for this calculation. Above `0.4`, the softened value is `0.4 + (capped - 0.4) * 0.5`. The producer multiplies the rank-scaled hit by `(1 - softened) / (1 - capped)` at `0x145fcfb57` and passes that amount and the scripted attack descriptor to `0x145f9a2b0`. The common damage owner still applies party scaling, ordinary armor, crowd reduction and absorbs. The compensation is connected to the source incoming adapter for mechanic events from the five primary boss definitions. Native instruction emulation passed 96 armor, rank and endless cases, including the adjacent threshold values and unordered armor. [Incoming adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/incoming.rs).

## Scripted warning transport and the checkerboard

The attack constructor `0x145fcc5e0` adds the attack to the active vector and queues the JSON from `0x145fc7ce0`. An `atk` message carries `id`, `t0`, `lock`, `impact`, `end`, `locked` and `parts`. The parts support circle, rectangle, cone, capsule, donut, sweep, rotor, grid, polygon and field variants with individual times, appearance, tracking and safe-area fields. The app routes these messages at `0x14004fe20`. The client decoder at `0x1400b29a0` maintains separate scripted rows. The `atku`, `atkl`, `atka` and `atkx` branches enter at `0x1400b3489`, `0x1400b5a57`, `0x1400b2ae2` and `0x1400b3310`. The rebuilt client handles the Gandling field, rectangle and circle parts in their own stream alongside the earlier `hz`, `hzt` and `hzend` rows.

The client draw owner `0x1400b8130` calls the contour helper `0x1400b0d90` at `0x1400bba46` and polygon geometry owner `0x1400acdd0` at `0x1400bbacc` and `0x1400bd72b`. The geometry owner computes the point bounds, then passes the centered contour and vertical projection extent into `0x14002f390` and `0x1400aba70`. These are the next boundaries for matching the decoder's part variants to the existing terrain decal stream. The bounded raw pseudocode leaves jump-table arms and external material, geometry and paint bodies separate. Their branch and value correspondence remains open.

Frozen Checkmate at `0x145ee6300` uses one shared RNG draw and sends its high bit to the grid builder at `0x145ee4340`. The builder uses the zone polygon and a six-unit pitch. For Scholomance it starts at `(96, 138)` and produces 9 rows by 12 columns. It admits a tile if any of the nine inset samples falls in the polygon and sets danger on the selected `(row + column) & 1` parity. Both outputs passed bounded emulation of the original builder with the zone lookup, allocation and rounding calls stubbed. The manifest records both danger masks and the shared valid mask.

The Checkmate constructor creates one part with zero offsets relative to the attack impact and a `0.3`-second tail. The common initializer at `0x145fcc5e0` sets its impact to the run clock plus `1.75` seconds. It uses `1.75 × 0.85` when the ranked flag is set. The constructor applies the same hold to Ras.

The solo and co-op hit ticks both enter `0x145fcefb0`. The co-op host also calls it through `0x145e736e0` for each swapped hero. The hit sampler at `0x145ed9480` uses the part's absolute timing and checks per-recipient hit history. Its geometry switch at `0x145ee1e90` takes the grid branch to `0x145ee2a90`. That function rotates the recipient into grid space and tests the danger bit of the containing cell. If the bit is clear, it also accepts any danger cell whose nearest point is strictly closer than the recipient radius minus `0.05`, with a minimum effective radius of zero. The part's danger mask already excludes invalid cells. Both Scholomance masks passed 364 native instruction cases with the floor and hypotenuse calls stubbed. [Retained geometry pseudocode binding](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.140.0/bounded-native-frontier.json).

The client grid draw branch at `0x1400ba420` requires both the valid and danger bits before projecting each tile. It uses half the grid pitch for the tile bounds and projects from eight units below to eight units above the tile origin at `0x1400ba6eb`. The tile batch uses mask key 3 and paint style 6. The adjacent tile checks construct a boundary batch using mask key 4 and paint style 1. The constructor's appearance byte 2 serializes as `"c":"blue"` at `0x145fc8198`. The decoder's blue branch at `0x1400b3e15` loads RGB `(0.3, 0.6, 1)`.

The final paint owner at `0x1400c1090` walks the scripted rows and submits the body, current geometry and outline batches in that order through `0x1400a7170`. The tile branch of that paint helper mixes the base tint 25% toward white and uses ordinary alpha `0.6 × progress` with no additive pass. The outline branch mixes 20% toward white and computes a separate additive gain. When a row enters its ending state, the paint owner clamps `4 × (fade deadline − render clock)` between zero and one and uses brightness factor `1.6`. The client still needs a decoded scripted-row lifecycle and a grid connection to its terrain projection stream.

The host dispatcher at `0x145f74bd0` admits recurring actions only after checking the script hold and pending callbacks. It vetoes selection if an active record belongs to the same script and its `+0xd0` deadline is still ahead of the run clock. It also checks the pending scripted queue for held rows and matching live attack records. Ras has a 1.5-second Frostbolt Volley deadline and a 7.5-second Chill Nova deadline alongside the 4.5-second Checkmate deadline. The 60% phase publishes Frost Armor through the same attack constructor. An isolated Checkmate schedule would miss the active records and queue entries created by those actions.

## Gandling's scripted attacks and Straight A's

The [native receipt](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.140.0/scholomance-straight-as.json) binds the Gandling producers, part geometry, recipient hit sampler, expiry, death callback and achievement inputs to the installed 0.140.0 image. The script starts its Office, Dismissed and Quiz deadlines at spawn plus 1.5, 5.25 and 15 seconds. Their priorities are 30, 20 and 10 and their successful repeat delays are 21, 24 and 28 seconds before rank and enrage scaling. A live blocking attack or pending follow-up holds the scheduler.

| Attack | Recovered source behavior |
| --- | --- |
| Headmaster's Office | Publish an empty warning row for 2.75 seconds. After that row retires, start the scaled 2.5-second field over the arena contour. The safe square runs from (122,159) to (138,175), inset on both axes by the effective player radius. |
| Class Dismissed | Four horizontal strips use the recovered band widths and a scaled 1.75-second impact. The attack owns six temporary Risen Guard units, removed when it retires. |
| Pop Quiz | Track the farthest eligible hero, with the lower GUID winning a distance tie. Lock 1.2 seconds before the scaled 2.5-second impact. The second radius-five part pulses at impact plus 0.5, 1.5 and 2.5 seconds. |
| The Last Examination | At 35 percent HP or below, cancel the prior attacks and begin a 3.75-second harmless line. Its removal and each later strip removal advance the sequence. Each damaging half has a scaled 1.75-second windup and a quarter-second tail. After the second half, shift the ordinary deadlines by the elapsed phase time and floor them at current time plus two seconds. |

The hit stage uses the accepted positions on both sides of the impact time and the movement-report projection offset. Both sampled points must hit the part. Append the victim and part ID before damage, so armor and absorbs cannot erase a recorded hit. Solo and party simulation sample after player abilities and retire attacks after sampling all recipients. Gandling's death callback reads only the still-present Office and Examination rows for that boss GUID, then retires his attacks. Hits from a row already retired do not affect the feat.

The [script adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/gandling.rs) sends the native warning lifecycle through the existing marker stream. The [client](../../crates/azeroth-survivors-re/src/gameplay/raid_markers/scripted.rs) decodes these parts separately from legacy hazards and projects the field, strips and circles onto terrain. The [account path](scholomance.md#graduation-and-straight-as-combat-records) delivers the resulting bit to each admitted recipient, including the cached State15 path. Native replay covered 1,458 hit geometry cases, 528 hit sampler cases and 2,560 bit-exact square mask alpha cases. Compilation, rendered output, network delivery and original/rebuilt parity remain open.

## Scripted spell launches

The [0.143.0 PE ranges and Ghidra receipts](evidence/scholomance-launches.json)
are bound to SHA-256
`f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`.
The [Heroic 3 capture](gameplay-log-evidence.md#scholomance-scripted-cast-packets)
identifies the boss GUIDs and spell IDs that led to this trace.

The shared constructor at `0x145fdc470` reads definition spell `+0x78`,
start flag `+0x90` and launch flag `+0x91` separately. It sets part
`+0x98` to impact plus the part's offset and `+0x9c` to that result plus
duration. At `0x145f8b670..0x145f8b6bd`, the frame selects parts with
repeat interval `+0x84` at or below zero and
`now - frame_delta < part_end <= now`. It deduplicates their `+0xa0`
part IDs in order within each attack. Each launch uses the first live
shape with that ID and resolves Z from ADT, then WMO, then the map fallback.
The Office field's shape case 9 uses the arena polygon's first vertex.

The `atka` marker and recipient damage stage precede the launch queue.
At `0x145f8bbf7` the shared path calls `0x145f1b250` with the boss
GUID, spell, empty hit slice and a ground target. The serializer writes
opcode `0x132`, both caster GUIDs, flags `0x100`, zero hits and misses,
mask `0x40` and XYZ. Damage and launch use separate paths, so a cast still
launches when its geometry hits nobody.

| Encounter | Connected producers |
| --- | --- |
| Kirtonos | Shadow Bolt Volley, Blood Offering, Vampiric Swoop and Wing Flap. All Offering circles share one part ID, as do the Volley lanes. The form change keeps its dedicated no-target send. |
| Ras | Frostbolt Volley 8398 and Chill Nova 18099. Chill Nova's radius-11 circle also supplies its existing knockback. Frozen Checkmate and the Frost Armor rune markers carry spell zero. Frost Armor 18100 keeps its dedicated no-target send. |
| Krastinov | Both Twin Cleaver rows use the shared launch. Surgical Rush, Hook and Bladestorm publish through their dedicated callbacks with the shared launch flag cleared. |
| Barov | Every Death Knell ring, both Shadow Verdict shapes, Immolate's initial hit and Veil of Shadow's nonperiodic group. Death Knell and Shadow Verdict follow-up rows also start their own windups. |
| Gandling | The damaging Office field, Class Dismissed, Pop Quiz's initial hit and both damaging Examination strips. The pre-Office warning, harmless Examination line and Quiz's periodic part do not launch. |

The [shared attack state](../../crates/azeroth-survivors-re/src/gameplay/mechanics/gandling.rs)
publishes launches after the final recipient's damage sampling and before
attack retirement. The [packet adapter](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs)
uses the same serializer shape for the local client and the existing co-op
broadcast route. The retained 0.141.0 mechanic traces for
[Kirtonos](scholomance-kirtonos.md), [Ras](scholomance-ras.md),
[Krastinov](scholomance-krastinov.md) and [Barov](scholomance-barov.md)
describe their own target's schedules and geometry.

`python3 -B scripts/check-raid-cast.py --scripted-launch` verified 40
hash-bound PE ranges. Compilation, the authored Rust regression,
runtime packet/visual behavior and original/rebuilt parity remain open.
