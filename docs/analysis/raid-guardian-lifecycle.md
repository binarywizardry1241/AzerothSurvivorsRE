# Guardian lifecycle providers

Authority is the configured installed Windows EXE, version **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The current [manifest](evidence/raid-guardian-lifecycle/manifest.json),
[catalog bindings](evidence/raid-guardian-lifecycle/catalog.json) and
[Ghidra provenance](evidence/raid-guardian-lifecycle/rea-provenance.json)
belong to this target. Historical 0.97.2 constants, fixtures and reports retain
their original provenance. Current implementation status belongs to
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

This recovery connects the current providers used by
[`guardians`](../../crates/azeroth-survivors-re/src/guardians/mod.rs) and its
[`live adapter`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs).
The current graph and signature schedules remain owned by
[raid inputs](raid-inputs.md); selected guardian identities are checked
against all 37 current graph identities rather than inferred from an old RVA.

## Current owners and inputs

| Provider | Current native owner / selected route | Connected source |
| --- | --- | --- |
| Begin and initial lairs | PE owner `14590d7a0..145910cfa`; lair branch `14590f612`, append `145910180..1459101b7` | `Guardians::initialize`, `placement.rs` |
| Due construction | Active-tick owner `1458fb890..145908680`; `145906a63..1459073b2` | `spawn_due_with_signatures`, `spawn_due_guardians` |
| Health and damage | `14596a3e0..14596a740`, `14596a7e0..14596a96f` | `scaling.rs`, spawn and engagement adapters |
| Awake and home | Actor owner `145945710..14594ac38`; caller `1459470b5`, helper `1459b7f00..1459b82a6` | `ai.rs`, `tick_guardian` |
| Death and respawn | Shared hit/death owner `14593ec90..145942543`; guardian branch `14594045e..14594062a` | `guardian_died`, `emit_guardian_death` |
| Notice, magnet, strength | `14598c610..14598c752`, `14593d3f0..14593d4f6`, `145907959..145907a7c` | `rewards.rs`, live death/strength ports |

The current 240-byte zone table is `146bf2630`; enemy rows are 80 bytes. All
148 rows match both source catalogs, including each name, ID, model, scalar,
raw cast input and flag. Current candidate filtering executes
`1459d2440..1459d25c5`: flag `+4c` must equal **1**, and `+48` must be finite.
Zones 0–10 select indices 9/10/11; Naxx uses its explicit 12/13/14/15 list.
This is 37 distinct definitions. Current zone lookup
`145898dc0..145898ee9` and health-knot collector
`1459cdd20..1459cde5e` execute as actual instructions in the fixtures.

Begin's separate `Game+ad8` suppression gate bypasses lair construction.
Otherwise it constructs four 40-byte records in `Game+668/+670/+678`:
inactive discriminant, selected enemy index, home XYZ and initial deadline
**20.0 seconds**. Definition choice wraps through the actual candidate list.
Explicit points override procedural positions. Procedural placement retains
the optional guardian radius, zone center/angle, successive fractions
0.70/0.62/0.54/0.46/0.38, the 5×5 blocked-grid neighborhood, strict height
difference `<30`, and the final half-radius fallback without repeating the
blocked/steep tests. Terrain answers are explicit fixture inputs.

Inactive lairs spawn when the clock is ordered `>= deadline`; active lairs
and NaN comparisons skip. Construction uses scale `definition.scale*1.35`,
the ordinary shared wrapping creature counter, guardian metadata and the
same four RNG words as other run consumers. Facing is drawn before signature
variant selection; selected lists are current graph lists. Movement starts
at home with zero duration and next movement deadline equal to the clock.
The announcement gate is strictly `clock>21`, including its unordered skip.

Health/damage use the current clock, difficulty, zone scale, guardian kills,
HP/damage percentages, endless flag/phase/start, five current boss rows and
selected enemy base scalars. The fixtures preserve each f32 arithmetic step,
interpolation/extrapolation, wrapping counters and current `powf` arguments
1.22/1.096. Power results are injected, so host/Windows CRT bit parity is
not established. The current engagement callers refetch these same providers;
ratio-preserving actor vital updates remain owned by the separate current
raid lifecycle proof.

Sleeping guardians wake after damage, or within 3 units of home and 20 of the
player. Awake guardians reset when the player is farther than 97.5 from home.
The helper uses scalar/SIMD squared norms and square roots. Invalid lair
indices in its caller substitute the current actor position. Reset clears
the current phase/timers, periodic list, slow and shield fields; the existing
input proof owns the canonical helper extract.

## Rewards and live repairs

For a valid dead lair index, the death branch clears its active record and
sets deadline to `clock+180`. An invalid index still increments the shared
guardian kill count. The current callback order is death emote, sound
**8174**, guardian notice, wrapped gold `(postincrement kills*5)+25`, lazy
scheduled magnet attempt, then strength increment. The gold request remains
present even at a wrapping zero amount. Notice production executes the current
helper and captures kind `guardian`, localized name and the current template
`{name} is slain! Its hoard and a level.`

The live death port previously retained sound only in a diagnostic vector,
which has no playback consumer. It now also forwards `RunEvent::PlaySound`
at that exact position. The existing client handler forwards this to
`SessionEvent::PlaySound`. The diagnostic vector is preserved; actual audible
playback and client parity have not been tested.

The guardian magnet helper examines only the schedule head. It draws the
shared 24-bit unit RNG only for a due head, retains that head when the draw
is `>=0.5`, otherwise removes it and requests kind6 at death position
`(-2,+1.5,0)`. Empty/future heads, exact/adjacent 0.5 draws and a due second
record behind a future first record are checked.

Strength handling captures and clears the pending count only in run mode 1.
Every captured award runs even if an XP callback changes the mode; each
iteration rereads live level/XP, increments pending jewelry with wrapping,
and calls the shared XP provider. The final jewelry request independently
requires nonzero jewelry, mode 1 and no `+ad8` suppression. Current request kind 2
forwards parameter 0.25 and pause 1 to the shared choice provider; this proof
executes its prefix and stops before the separately owned general builder.

The normal-frame adapter order is repaired to match the current native tail:

1. Ordinary/pattern/elite spawning and due primary bosses.
2. Rune timer (`145906574`), chest timer (`1459067a5`), forced magnet head
   (`1459068e6`). Native intervals are 45/70 seconds; sampler arguments are
   15–40, 18–50 and 25–50 respectively.
3. Due guardians (`145906a63`), then native lair marker work.
4. Completion (`145907826`), then strength (`145907959`).

Previously the live adapter awarded strength before all these constructions
and put guardians before the three pickup producers. This changed shared RNG,
allocation identity and unit level. The current UNIT helper's separately
owned prefix reads `Game+4e0`, adds `3*offset` with u32 wrapping and caps at63;
the guardian constructor passes offset 1 before strength can award a level.
No rune/chest algorithm is changed by the ordering repair.

## Terminal-frame boundary

The whole active body is admitted by mode 1 at `1458fb937`. Other entry modes
jump directly to strength, whose own mode 1 gate rejects their awards.
The scheduling byte at `Game+adb` is a distinct suppression input; it is
not a dead flag. The current fresh-Game constructor assembles its aggregate
at `RBP+28`, writes dword `ff000000` at `RBP+b02`, then copies `ae0` bytes
to the output. This initializes `+adb=0`; the guardian `+ad8` suppression is
independently initialized 0 by the zero store at `RBP+afe`.

Lethal player damage writes HP0 and mode 4 at `1458ed6fc..1458ed71a` and
returns normally after movement freezing. Current continuation routes after
hostile damage and actor processing can still reach scheduled-world work in
that admitted frame; companions require mode 1, as do completion and strength.
The live adapter's mid-frame admission and stored-level gates are repaired in
the separate [frame continuation recovery](raid-frame-continuation.md).
The normal ordering and sound checks here do not establish terminal-frame
parity. Fresh dead/completed/paused ticks remain barred at entry in both designs.

## Static validation

Run `python3 -B scripts/check-raid-guardian-lifecycle.py` against the
reviewed evidence, or `--stage` to produce a fresh candidate under ignored
`runtime/analysis/staging/native-evidence/0.112.0/raid-guardian-lifecycle`.

The checker hash-verifies the installed target, current graph, PE exception
owners and direct caller edges. It runs current native instructions in
synthetic CPU/memory fixtures and rejects every unlisted call or instruction
excursion. It checks 444 HP/damage pairs, 123 placement profiles, 100 awake/home
profiles, 80 due/death profiles, 111 complete constructors, 31 reward/choice
profiles, 30 magnet profiles, 24 candidate boundaries, 58 stage admission/order
profiles, 38 presentation/announcement boundaries and one packed-default/copy
profile: **1,140 profiles** in total, counting each HP/damage pair once. Source guards verify
the live provider calls, shared RNG handoff, ordered rewards and sound/client
forwarding. These checks do not execute the Rust implementation.

Visited rows have one canonical owner: current input helper/selector rows,
the current ward UNIT prefix and an already owned lifecycle row are referenced
directly; other executed rows
are in this proof's `selected-native.asm`. Whole owner hashes and Ghidra raw
imports do not imply execution of unvisited branches. Three current Ghidra
operation records bind the imported bytes and curated pseudocode, including
an explicitly identified Begin excerpt. Raw imports have generic signatures
and unresolved external data/calls; concrete operands come from the installed
PE and the instruction fixtures.

Heap allocation, primary/secondary terrain height, CRT trigonometry/rounding,
injected powers, packet/format/localization publication, generic pickup
creation, XP and general choice generation remain explicit boundaries. The
timer-order profiles additionally intercept the nearby pickup sampler and
completion callbacks. Actual MPQ terrain/pathing, renderer/object lifetime,
general notification/audio consumers, full UI presentation and original/
rebuilt runtime parity require their owning evidence and comparisons. No
compiler, Rust test, build or game process was run.
