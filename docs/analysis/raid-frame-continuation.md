# Admitted frame continuation

Authority is the configured installed EXE, version **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [manifest](evidence/0.112.0/raid-frame-continuation/manifest.json) binds
current instructions, visited paths, source guards and explicit fixture seams.
[Current Ghidra provenance](evidence/0.112.0/raid-frame-continuation/rea-provenance.json)
binds the independently located XP owner and its retained final-gate excerpt.
This extends the [guardian provider recovery](raid-guardian-lifecycle.md)
at the live frame and stored-level boundaries. It does not establish whole-frame
or original/rebuilt runtime parity.

## Current admission model

The active-tick owner is `1458fb890..145908680`. Its entry gate admits mode 1
before the clock advances; other entry modes skip the active body. Once that
body is admitted, individual later stages have independent gates:

| Stage or callback | Current native gate | Live source |
| --- | --- | --- |
| Continue after hostile hit | `145900736` continues to raid stage `145901952` and actor call `1459028dc` | `Mechanics::tick` |
| Actor walk | `145945710..14594ac38` contains no direct `Game+adf` reads | `tick_actor_frame` and its existing queue consumers |
| Post-actor pickups | `1459028e1..1459035f4` continues after a mode change | Existing `collect_pickup`/XP/gold consumers |
| Loot companions | `1459035f4` requires mode 1 | `active_run_state()` |
| World schedule | `145904118` tests independent `Game+adb` suppression | Continue the admitted frame; ordinary fresh-game suppression is 0 |
| Completion / guardian strength | `145907826`, `145907959` independently require mode 1 | Active completion gate and `StrengthPort` |
| Player damage | `1458ec44d..1458ec46a` requires mode 1 and no `+ad8` suppression | `incoming.rs::damage_player` |
| Delayed native36 Pull | `145916843..145916858` requires mode 1 after queue removal and live-source lookup | `BossCombat::raid_pull` |
| Aggregate hazard knockback | `14591ae9d..14591aeb8` requires mode 1 and queued launch | `resolve_boss_effects` |

The scheduling suppression default and aggregate-copy mapping belong to the
guardian provider proof. `Game+adb` is distinct from player death; there is no
replacement dead flag in that gate. Current lethal player damage checks
remaining lives at `1458ed493`; its unrescued branch at
`1458ed6fc..1458ed723` writes HP0, mode 4, terminal-state discriminator 1 and
the terminal timestamp before movement freezing. It returns to the admitted
frame. Completion and strength then reject mode 4, while already admitted
actor/pickup/world work can still proceed.

Complete current PE owners are decoded separately for direct mode reads:
the raid resolver `1459164c0..14591bb02` has exactly the Pull and knockback
gates listed above; the actor owner and cache purchase owner
`14594fc80..14594ff24` have none. This records direct operands, not a claim
that their arbitrary nested callbacks lack admission checks.

The source previously returned immediately after hostile or actor-stage death.
It now completes the admitted frame, retains the initial dead/completed/choice
entry return, and applies the recovered local gates. The shared active-run
predicate uses actual open choices, death and completion. The completion gate
prevents a stale, independently stored `CompletionState.run_state=1` from
turning a frame-dead or choice-paused run into victory. No completion algorithm
or primary-boss construction rule changes.

The delayed Pull port captures active admission when its synchronous pending
stage begins, before that stage's deferred player damage is committed. Native
pending removal and live-source lookup still occur first. The later aggregate
knockback reevaluates active admission after damage. Player damage now rejects
choice-paused calls before armor, absorption, meters, reactive effects or
lethal protection. Actor movements, cast/melee publications, aura updates and
other existing queues retain their separate owners and order.

That captured Pull admission is bounded to the reachable current graph. All
493 current nodes map to semantic tags `{1,2,5,6,8..18}`; legacy immediate
GroundImpact0, AreaStrike3 and Charge4 are absent. The current delayed-line
loop precedes aggregate hazard damage (`1459165e4` versus `14591ae97`), and
the source resolver retains delayed lines → timed hazards → impacts order.
This is not a guarantee for arbitrary public effect fixtures or an invented
future synchronous callback inserted into that stage.

## Stored levels and synchronous offers

The current XP owner is `145911e80..145912976`. Its final automatic-offer gate
at `1459128da..145912914` requires a nonzero pending-level count at `+a60`,
mode 1, no `+ad8` suppression, and either `storeLevels(+ad4)!=1` or
`spendLevels(+ad5)!=0`. Stored levels alone therefore leave the run active.

The XP caller passes **EDX=0**, **R8B=1** to the shared choice provider. Zero
here is the choice request kind; it does not set the run mode to 0. The builder's
publication at `14595d970..14595d995` sets actual mode 2 only when its pause
argument is nonzero, then calls the pause publisher. The fixture separately
executes that publication rather than treating a request argument as a mode
transition.

The old live `StrengthPort` incorrectly treated every positive
`pending_levels` count as mode 2. It now uses the shared active predicate, so
stored levels can coexist with guardian strength awards. Actual level and
cache offers populate the same `Mechanics::choices` vector; cache generation
also retains its typed `treasure_state.offers`. Existing source generation is
synchronous. An actual open offer pauses companions, completion, player
damage and delayed player movement; an unopened stored level does not.

## Static checks and boundaries

Run `python3 -B scripts/check-raid-frame-continuation.py`; `--stage`
writes a candidate under ignored
`runtime/analysis/staging/native-evidence/0.112.0/raid-frame-continuation`.

**272 native profiles** pass:

- 192 automatic-offer gates, including zero/max pending levels, actual modes,
  suppression, storage and spending bytes; 8 synchronous mode publications.
- 12 player-damage admission cases, 4 lethal-state writes and 8 launch gates.
- 12 nonempty native36 pending queues across active/paused/dead/completed
  modes and live/dead/missing sources. Records are removed before admission.
- 24 continuations with mode changes during the actor callback and independent
  scheduling suppression.
- 8 nonempty matured XP/gold pickup profiles, including mode 4 and an XP callback
  opening a choice within the frame. Gold still updates in mode 4; the later
  companion gate observes the final mode.
- 4 complete current actor walks with a native-constructed sleeping guardian.
  Modes1/2/4/5 produce identical actor bytes in that profile. The complete
  current owner is also decoded for direct mode reads; this does not prove
  arbitrary nested callbacks have no gates.

The checker rejects unlisted calls and instruction excursions. It imports
the current provider fixture's memory/CPU harness and constructor setup;
previously owned instruction rows reference their explicit canonical extracts.
Only new visited rows are retained here. Whole-owner hashes, a Ghidra import
and an absence of direct mode reads are distinct from executed-path coverage.
Source guards check the shared predicate, actual cache-offer mirroring,
stored-level separation, removed mid-frame returns and all recovered local
guards. The Rust implementation is not executed by these checks.

Typed seams include allocation/reserve, memcpy/memmove, roundf, unit-field
publication, pickup removal, XP and choice callbacks, an empty reservation
collector and empty aura rows. The main continuation profiles intercept the
raid and actor stage callbacks; separate profiles execute nonempty Pull
admission, the player-damage gate, mode publication and the complete sleeping
guardian actor walk. Complex attack/cast states, healing, periodic effects,
hazard arithmetic, primary bosses and wards retain their current owning
proofs; this report does not claim to replay an entire populated run.
The follow-on [AS pickup consumer recovery](raid-pickup-collection.md)
executes current reservation, removal and attraction helpers with nonempty
XP/Gold/Magnet sets and binds the live post-actor collection order. This
report's original continuation profiles and seams remain unchanged.

Rustfmt parsed the four changed source files without rewriting them. No
compiler, Rust test, build, game process, real MPQ terrain, audible/client/UI
comparison or original/rebuilt parity comparison ran. Manual pause and engine
session admission remain outside this local mechanics predicate's scope.
