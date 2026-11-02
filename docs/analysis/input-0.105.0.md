# Gamepad and desktop touch input — 0.105.0

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns permanent gaps #22/#23. This report
establishes selected native contracts and initial source integration; it does
not establish compilation, device operation or original/rebuilt parity.

## Recovered contracts

The [manifest](evidence/0.105.0/input/manifest.json) binds eleven canonical
instruction extracts to original PE byte ranges and REA/Ghidra identities.
The [vectors](evidence/0.105.0/input/vectors.json) retain **112 bounded native
instruction cases** and **five typed UI constructor snapshots**.

| Native owner | Selected contract |
| --- | --- |
| `1400b7900` | First-controller sticks retain their magnitude outside a radial dead zone; equality is admitted. Axes are not independently clipped by that test. |
| `1400c2540` | `padInvertX/Y` default 0; look/zoom speeds default 1 and reject negative effective values; `padDeadZone` defaults to 0.25 and clamps to 0–0.9. These are live CVar consumers. |
| `1400bf8f0` | Camera-relative movement angle, 2.6/1.5 look rates, 9-yard zoom rate and per-side maximum shoulder/trigger values. A held after a UI confirmation stays blocked until release. North/Y requests stored levels, Select opens the character pane and Start opens pause. |
| `1400bf210` | Pad activity retains its mode. Keyboard/mouse presses or more than 12 pixels of accumulated cursor travel return ownership to the mouse. A generated keyboard event has its own handoff-suppression latch. |
| `1400c03f0` | Visible control bounds, nearest initial selection, no directional wrap, stick threshold ±0.6, forward admission above 4 pixels and score `forward + 2 × lateral`. Repeat delay is 0.38 seconds, then 0.11 seconds. Accept presses the focused control; Back, reroll and horizontal slider adjustment retain separate routes. |
| `140022df0` | Persistent movement-touch ID; initial left region is 45% of logical width (576 fallback); floating base follows beyond 64 pixels; normalized movement threshold is strictly above 0.22. One camera finger pans at 0.009/0.006 radians per pixel; two use distance change divided by 36 for zoom. UI/pause/loading admission and released IDs clear movement. |
| `140021bd0`, `1400225b0`, `1401d67d0` | 128-pixel stick base, 54-pixel knob, 46-pixel pause button; two-pixel circular borders, exact linear colors/opacities and layer values. Pause contains two 6×18 bars with one-pixel corners and six-pixel separation. Actual minimap bounds anchor the button; fallback is `(width−63, 17)`. |

Only selected portions of the owners are instruction-replayed. State meanings
also require source tracing and the retained caller/serializer contracts; the
vectors do not run a whole native input system. The earlier audit's
[XInput poll](evidence/0.105.0/game-mode-audit/native-manifest.json) remains the
canonical four-slot polling evidence. This repair uses Bevy's existing device
backend; it does not introduce another Windows polling service.

The audit's disabled-Gilrs observation applied to the generic
`benilla_world::boot::tuned_default_plugins` helper. The reconstruction's actual
`main` already installs `DefaultPlugins`, including its device backend. The
missing game consumers were the material source gap.

## Connected source

[`NativeInputPlugin`](../../crates/azeroth-survivors-re/src/native_input/mod.rs)
now registers the five current pad CVars with the real client registry and reads
their live values. Its device pass precedes custom menu input and the ordinary
FrameXML input/binding pass. It samples up to four controllers, applies the
radial threshold before movement/look, aggregates shoulder/trigger zoom and
maintains the release/handoff state. It connects Y to the existing stored-level
CVar owner. The separate [keyboard binding repair](stored-level-bindings-0.105.0.md)
now connects configurable/default Y through the ordinary client binding table;
its compilation and actual input/parity requirements remain under #21.

[`focus`](../../crates/azeroth-survivors-re/src/native_input/focus.rs) uses the
actual laid-out/clipped Bevy control bounds, visibility, disabled flags and
frontmost custom layer. Focus supplies normal Interaction and relative-cursor
state, so existing selection, tooltip and transaction owners run. It connects
cards, picker/Armory, pause/results, read-only talent cells and Options. Options
slider steps call the same descriptor/value/callback/save path as pointer drags.
Mouse-only admission in Armory, talents, Options and language selection now
also accepts a device activation. Existing transaction and opening gates remain
in their owning handlers.

[`LocalDeviceInput`](../../crates/benilla-app/src/local_client/device.rs) carries
semantic direction, orbit and distance deltas to the
[existing controller](../../crates/benilla-app/src/player/controller.rs).
Root/death/stun, ordinary speeds, terrain/capsule collision, movement reports,
model pose and camera seating remain in that controller. A edges and character
commands execute through the actual Bindings.xml/Lua body and its hardware-event
call host. The device pass clears transient output every frame. Generated Back
uses one keyboard-message route, avoiding a duplicate raw-key edge; its marker
prevents that generated event from switching back to keyboard mode.

[`TouchState`](../../crates/azeroth-survivors-re/src/native_input/policy.rs)
retains movement ID/base and the previous camera pair. Lift/cancel and admission
loss clear state; changed camera-finger identities/counts establish a new
baseline. The projection converts native input coordinates into the existing
controller's yaw/pitch convention.
[`touch_view`](../../crates/azeroth-survivors-re/src/native_input/touch_view.rs)
creates the recovered custom stick/knob/pause nodes, including the native pause
bars and live minimap placement, and routes pause through FrameXML's Escape
owner. Ordinary custom controls continue to receive Bevy touch Interaction.

Touches over actual FrameXML controls are separated from movement/camera
ownership using the real VM's hit test. The
[existing pointer feed](../../crates/benilla-app/src/ui_script/input.rs) then
runs its ordinary hover/down/up handlers at the touch position. Lift delivers
up; cancellation/lost admission disarms the pointer instead of clicking it.
This is an integration adapter, not a new claim that the complete native client
input implementation has been recovered. A simultaneous physical mouse and
multiple UI touches, hotplug/reconnection, DPI changes and every layout/focus
transition remain runtime comparison work.

## Reproduction and limits

`python3 scripts/recover-input.py --check` verifies the full selected
EXE hash, every retained instruction-range/assembly digest, 112 unchanged native
arithmetic/state cases and five typed native UI constructor snapshots. It uses
the existing project-local Unicorn installation and shared Node384 decoder.
The source build has no dependency on the reference EXE, Ghidra or Unicorn.

REA/Ghidra used bounded raw slices and an address-preserving sparse code/data
map. Only selected original ranges populate that map; zero-filled holes are
not original memory. Raw import uses a generic GCC ABI; the checks explicitly
supply original Windows registers/stack values. Typed UI spawn submissions,
command spawners and byte-copy helpers are declared seams. No ECS query, device
driver, Lua VM, text shaping or GPU executes in those instruction checks.

Fifteen changed Rust modules passed syntax parsing with the installed rustfmt.
Five Rust regression functions cover radial/focus boundaries, repeat/release,
touch cancellation/floating-base and binding command edges/order; they were
**not compiled or run**. Source tracing also checked UI press consumers,
ordering, registry reads, paused/loading admission and the keyboard-message
handoff. No builds, `cargo check`, compiling tests, application launches,
hardware-input checks or original/rebuilt interaction/rendered comparisons ran.
Desktop touch evidence does not establish browser/mobile support. Gaps #22/#23
retain their compilation, actual input and presentation/parity requirements.
