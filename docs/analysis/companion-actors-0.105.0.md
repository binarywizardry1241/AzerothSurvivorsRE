# Sapphiron and the shared loot-companion actor — 0.105.0

Selected EXE SHA-256:
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
Permanent gaps **#27** and its required shared collector **#14** now have live
source consumers. These are account loot companions, distinct from ordinary
combat pets, special demons and temporary effect companions.

## Recovered contracts

Static Ghidra analysis of immutable current function slices, checked against
original Win64 instructions, identifies:

| Owner | Contract |
| --- | --- |
| `1458c95f0`, `145994110` | Saved slots, unlock fallback, companion/second count and ordered Gold/Wisp/Rune instincts. Locked/unknown appearances fall back to Squirrel. |
| `145917cc0`, `145918950..14591983c` | Actual Unit creation and initial state. Each slot starts 2 units away at facing plus `(slot*.35+1.15)*PI`, rests 1 second, and uses the shared creature serial. |
| `14592f1a0` | Interpolate the current pose, resolve terrain, reject moves shorter than 0.3, publish movement and retain its actual endpoints/deadline. |
| `14592f7a0` | Exclude active reservations/in-flight pickups; admit items beyond the hero radius and within radius+25+10*leash. Choose instinct priority, then distance from the current companion, keeping the first tie. |
| `14592f560`, `1459a3e50` | Sweep idle eligible pickups within `max(radius*.25,4)`; Wisp-herder doubles that range for XP. Rune-hound also admits kinds 3–5. Caches/magnets are excluded. |
| `14590cbbe..14590d698` | Idle/fetch/return state machine, repeated targets, carried rewards, 15-second trip limit, 2.5-unit delivery range, follow offset 2.2 and 3.5-unit movement threshold. |

The thirteen gameplay look descriptors at `1471b49f8` match the current Rewards
records. Sapphiron is **entry 9613 / display 16033 / scale 0.07**, gated by `feat:nou`.
Its behavior uses the shared collector. The native Unit has health/max-health 1,
level 1, faction 35, flags `0x02000002`, radii 0.3/0.5 and its actual model/scale.
Initial speeds are 2.5/run/4.5/4.72222185/2.5/PI. Run speed is
`max(hero_speed,1) * ((paws*.2+1)*14)` in that float32 operation order. When more
than 60 units from the hero, follow uses triple speed toward the same offset.
Rest intervals are 2/1.6/1.3/1 seconds. Gold-sniffer uses a shared fractional
1.1× bank before the normal gold multiplier/rounding and purse/run counters.

## Connected source

`run_effects/loot_companions.rs` owns definitions, configuration, selection,
motion and the collector state machine. Its canonical
[native vectors and ranges](evidence/0.105.0/companions/native-vectors.json)
retain relevant startup/helper/tick instructions. Larger Ghidra raw responses
remain disposable project-local analysis output. Generic raw-import ABI/callee/
data limitations are resolved only for these reviewed contracts; they do not
establish complete native frame ordering.

`progression::account_loot_companions` uses the existing saved perk/appearance
reader, preserving both slots and checking independent achievement gates.
Normal run entry supplies this configuration; showcase does not create these
actors. `gameplay/mechanics/loot_companions.rs` creates each actor once, publishes
its native Unit fields/speeds through the real client event path, and drives
actual world pickups. Hero proximity collection leaves reserved targets to their
collector. Pickup removal includes auxiliary objects before carrying rewards.
XP uses the live level/choice owner; gold updates both counters and coinage;
Rune-hound calls the existing selected-target rune owner on delivery. Shared
movement packets carry current terrain-resolved endpoints and the shared serial.

The embedding's exact unit-name registry supplies localized companion names to
the real client name cache and clears them on teardown. Actual display fields,
normal object creation and monster-move packets leave M2 loading, rig, gait and
spell effects with the existing MPQ client. No replacement renderer is added.

## Checks and limits

`python3 scripts/recover-loot-companions.py --check` verifies the whole
EXE hash, all thirteen live look records, instinct order, constants and retained
assembly. **130 unchanged native instruction cases pass:** 20 selection,
84 sweep admission, 24 float32 speed and 2 slot-angle cases. Synthetic memory,
the reservation-list collector/deallocation and one bounded 32-byte output
allocation are explicit replay seams; no game/OS behavior is executed.

Eleven changed Rust modules parse. Six authored Rust regressions consume native
vectors and cover trips, deadlines/catch-up, gates/slots, live actor creation and
fractional gold delivery. They were **not compiled or run**. Compilation, actual
engine/name/load/packet integration, terrain/animation/input and original/rebuilt
gameplay/presentation comparison remain unverified. Both whole gaps retain
validation/comparison work in the source/verification registers.
