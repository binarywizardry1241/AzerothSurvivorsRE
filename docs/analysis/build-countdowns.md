# Build countdowns

Target SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This owns the recurring-summon build-icon presentation shared by gaps **#17/#24**.
[verification-needed](../verification-needed.md) retains the parent gaps and runtime limits.
The [manifest](evidence/0.112.0/build-countdowns/manifest.json) binds current
owner extents, selected code/data bytes and focused Ghidra records. Raw imports
have inferred types/ABI and bounded external-reference coverage.

## Producer and state

Current HUD serialization owner `1458f40b0..1458f7396` emits three build vectors:
`abilities`, `jewelry` and `timers`. Its timer projection
`1458f52db..1458f55fd` walks every equipped 64-byte effect row at `Game+828`
(count `+830`) in native order, selecting raw tag **34**. A matching 40-byte
provenance row at `Game+840` (count `+848`) supplies its key and icon. An absent
metadata row suppresses the timer. No live summon expiry is read here.

For the selected effect index:

- The activity vector at `Game+88` (count `+90`) gates countdown calculation.
  Missing/zero activity still emits the icon with `left = 0`.
- Active activity reads its timestamp from `Game+70` (count `+78`), defaulting
  to zero if that timestamp slot is absent.
- The deadline is `timestamp + max(effect.f32(8) * global_cooldown,
  effect.f32(12))`, using the current global multiplier at `Game+488`.
- The serialized `left` is `max(deadline - Game.clock(+a4c), 0)` with native
  single-precision operation order. Both capstones therefore share the live
  recurring-summon scheduler; the displayed timer is not the remaining life of
  any particular Felguard or Pit Lord.

The special-demon gameplay owner supplies the live scheduler/provenance
projection as `Mechanics::hud_build_timers`. Current scheduler recovery and
remaining gameplay contracts are owned by the corresponding #24 report.

## Consumer and presentation

Current HUD updater `1400cef80..1400d213a` parses the three icon vectors and
updates timer labels by their index in `timers`. Icon-vector changes rebuild
children while retaining the movable build root. Changing `left` updates only
text, preserving dragging/layout state.

Constructor `14025a730..14025b8c1` retains the two ordinary icon rows and adds a
third horizontal row when timers are present. Timers use the same 28×28-pixel
icons, one-pixel black borders, three-pixel radii and three-pixel column gap.
Each timer icon centers a **13px gold** label, Srgba
`(.973,.824,.416,1)`, with black `.85` shadow offset `(0,1.5)`.
The timer row uses the existing Show Build visibility, UI scale and persisted
build-root position. Timer icons add no rank label or custom interaction.

The label updater `1400d1d52..1400d1e3f` reads `timers[index].left`, rounds
numeric values upward using the Windows CRT **ceil** import and displays the
result. Missing/non-numeric values clear the label. Zero remains visible.
The custom number writer `145989330` widens `f32` to `f64`; formatter
`14598f8c0` writes literal `0` for nonfinite values before frontend parsing.
This differs from an assumed generic JSON serializer that might emit null.

Live source is `gameplay/run_hud/view.rs`. Its third row consumes the scheduler
projection on every presentation update, uses timer icon strings in its build
signature and updates countdown text independently. `TalentArt::icon` shares the talent images already loaded
from the current talent catalog through the existing MPQ texture path, avoiding
a second image loader/allocation for the build. Empty icons use the retained
question-mark image.
These files do not create player auras. Current no-player-buff publication
belongs to the shared aura producer reviewed with #12/#24.

## Static checks and limits

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs \
  python3 -B scripts/check-build-countdowns.py --verify
```

The check verifies the registered installed hash, current owner bounds,
retained code/data hashes, ceil IAT mapping and connected source routes.
**432 original-instruction admission cases** include non-34 effects, absent
activity/timestamps, inactive/active counters, cooldown clamping and exact
clock boundaries. Their 144 admitted cases check remaining seconds bit for bit.
A further **18 remaining-clamp cases** cover negative, unordered and infinite
inputs; **11 number-classification cases** verify the custom serializer's
finite/nonfinite branch. The [compact cases](evidence/0.112.0/build-countdowns/native-cases.json)
bind the full admitted-vector digest and representative boundaries.

Inputs and state vectors are synthetic replay seams. These checks execute
selected current Windows instructions in Unicorn; they do not compile or
execute Rust, the original game, allocators, complete ECS, Windows formatting,
text shaping, MPQ loading or rendering. Native recovery and source integration
do not establish actual countdown appearance, scheduler/gameplay timing,
platform input/persistence or original/rebuilt parity. Those comparisons remain
open under the parent findings.
