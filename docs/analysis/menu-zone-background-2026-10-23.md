# Zone-specific animated main-menu backgrounds

[verification-needed](../verification-needed.md) owns **#60**. A reported case indicates that each
selected zone has a moving world background in the original EXE, absent in RE.
The source repair below removes a camera/composition ordering defect. Its
causality in the reported run and displayed parity remain unverified.

## Selected-target contracts

Installed **0.112.5**, SHA-256
`445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`,
is the specification. The [manifest](evidence/0.112.5/menu-zone-background/manifest.json)
binds five fresh native ranges, canonical assembly and selected Ghidra
pseudocode to that identity. These are static observations, not target execution.

- Publisher `1400f4090` calls profile selector `1458d0ed0`. All twelve current
  zone identities in the 240-byte records at `146c08760` and all 144 selected profile floats match
  the retained [profile asset](../../crates/azeroth-survivors-re/assets/menu-background-0.97.2.json).
  Its filename/provenance remains historical; its current values are revalidated.
  The native request carries map, zone, eye, target and clearance. Native request
  arithmetic is replayed for every zone at four elapsed times, including negative
  time. Continuous motion changes the pose, not the stabilization identity.
- Stabilizer `14085d590` activates after three unchanged frames and can latch
  readiness from frame eighteen. It requires real focus/scene residency and zero
  collider, merge and GX pending counts. Placements pending is not a separate
  gate. Readiness survives later dirty loader fields until map/zone/admission
  changes; the frame counter saturates. All these lanes are replayed.
- Camera owner `14085cea0` consumes the same request, lifts only the eye for
  terrain clearance and smooths lift with `min(2*delta,1)`. Its active/mask bytes
  are shared with camera gate `140881470`. The latter now inlines the menu
  predicate: a menu camera is admitted when active and unmasked. Replay checks
  all combinations with ordinary client/loading-cover admission and covered
  frame counts 0–4; this does not execute the ECS camera iteration.
- Publisher readiness drives the 1.4-second reveal and 0.35-second conceal fade.
  Native arithmetic retains `1 - f*f*(3 - 2*f)` for the cover, while disabled
  mode clears picture alpha. The replay covers both directions, zero/partial/full
  fades, enabled/disabled image state and several frame deltas.

The [desktop source](../../crates/azeroth-survivors-re/src/background.rs)
retains `menuScene`/`WOW_MENU_SCENE`, known-zone/speed overrides, previous-zone
retention until conceal finishes, Black mode and the separate picture/ember
layers. The native gate/report from [0.109.0](menu-fidelity-0.109.0.md) retains
its historical provenance; no mobile/browser default is certified here.

## Source defect and repair

The actual menu world is rendered through the shared client compositor:
[MenuCompositorPlugin](../../crates/azeroth-survivors-re/src/menu_compositor.rs)
sets `WorldCamera.Camera.is_active` after both the ordinary client's camera
gate and the scene's `Ready` stage in `Update`.
[claim_backdrop](../../crates/benilla-app/src/world_backdrop.rs) selects an
active world camera for `PlayerUiCamera.FfxBackdrop.source`. Previously it was
in an unrelated `Update` chain, with no edge after the menu's final gate.

A permitted repeated order was ordinary gate (inactive), backdrop claim
(`None`), then menu gate (active). The world camera could render while the UI
had no world source, even after the real-ready cover faded. Missing schedule
ordering is demonstrated in source; the reported run's actual executor order
was not captured.

The backdrop claim now runs in **PostUpdate**, after all Update camera gates and
before render extraction. Render-size tracking and camera retargeting remain in
their Update chain. The source still uses the real MPQ world, existing camera
motion and native readiness/fade contract. The authored ECS regression uses the
registered shared plugin, forces the formerly permitted claim-before-final-gate
Update ordering, and checks admission, steady activity, masking, return and
removal in the same frame. It has not been compiled or run.

## Connected path and remaining limits

Source tracing follows picker selection/time → moving request → stable map/zone
identity → retained menu world admission/combined WorldLive → camera focus and
real terrain-stream progress → readiness → final camera gate → PostUpdate UI
claim → render-world FFX backdrop → cover alpha. The camera pose is published
before the shared pose pass; changing time alone cannot reset readiness.
Same-map zone changes reset the identity, and page masking preserves residency
and the ready latch. The custom run-return path clears the local client/player
before the menu's three-frame activation. No additional concrete #60 source
failure was found in these routes. A retained player/roster can override menu
focus in the general client publisher, but normal custom run return resets it;
that conditional concern is not established as a failure of this path.

`python3 -B scripts/check-menu-zone-background.py` passes **247 bounded
native cases**, verifies the five owner ranges and checks the connected source
composition phase. The changed Rust source parses with project rustfmt; the
Python checker parses with ast. Neither check compiles source. `--prepare-rea` reproduces scoped project-local extraction
plans; `scripts/rea-batch.py` uses the project REA/Ghidra wrapper. Instruction
replay uses declared sinf/cosf seams and controlled mutex/panic state, not a
running original or rebuilt game. Coverage accounting passes with open work.

**#60 remains open for validation/comparison:** compilation, the authored ECS
regression, real world streaming/GPU composition, all-zone cold and warm loads,
sustained motion, same-map switches, secondary-page return, run-to-picker and
Black mode require runtime evidence. Effective overrides and exact appearance
in the reported case were not captured. No compilation, compiling test, game
launch or original/rebuilt visual comparison was performed. Parent menu/world
parity remains #17/#39; zone-entry loading presentation is separately #61.
