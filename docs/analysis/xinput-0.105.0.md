# Windows XInput acquisition — 0.105.0

This is bounded native/source ownership for **#41**, separate from the input
consumers and deferred device/parity requirements in [input](input-0.105.0.md).
Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.

The [manifest](evidence/0.105.0/xinput/manifest.json) preserves the existing
audit's canonical `controller-poll` extent and newly reviewed full Ghidra body,
plus its axis-publication helper. These are x86-64 raw imports with generic ABI
and external/global gaps. Original Windows PE instructions establish the actual
calling convention, literals, event layouts and numeric conversions.

## Producer and event contracts

`140092ab0..140093741`, the sole current diagnostic owner for
`crates/wenilla-rogue-app/src/screens/xinput.rs`, reads a GetState function pointer
from its resource. It visits four fixed slots in ascending order. Connected
slots are polled each pass. Disconnected slots are admitted when the shared
probe deadline is due: `now >= next_probe`; that pass advances the deadline to
`now + 2.0` seconds. Between probes, disconnected slots are skipped while later
connected slots remain eligible. The equality boundary is admitted.

An unsuccessful GetState for an already disconnected slot emits nothing. A new
connection creates a slot-backed Bevy entity/name and publishes its connection
event through both the aggregate and typed message lanes. A failed poll of a
connected slot clears the connection marker and publishes disconnection through
the same two lanes. Successful state acquisition updates the saved raw state;
unchanged buttons, triggers and signed-stick words emit no repeated value event.
The XInput packet number alone does not drive an input-value update.

Fourteen native button-mask entries map physical bit masks to Bevy button tags.
The manifest retains the exact ordered mask/tag pairs, including the final two
inline literal entries; triggers publish separate analog button tags 7 and 9.
Native initial connection publishes the initial button and axis state, including
zero values, by treating the prior sample as uninitialized. Each later button
value is 0 or 1 according to its mask. Each trigger byte maps to `f32(byte)/255`.

`140078230..140078367` publishes changed stick words (or the first sample) to
both event lanes. Each signed word maps to
`clamp(f32(i16)/32767, -1, 1)`. The four calls use axis tags 0, 1, 3 and 4;
these are the downstream left/right stick axes. No gameplay radial deadzone,
camera speed or action request is implemented in this acquisition producer;
those are the separate native pad consumers already owned by the input report.

## Source boundary

The reconstruction's `main.rs` installs Bevy `DefaultPlugins`, which owns
platform device acquisition. `native_input::pad` consumes at most four connected
`Gamepad` components; first-pad left/right sticks, aggregated buttons/zoom,
current radial threshold and existing focus/control handlers reach
`LocalDeviceInput`. The ordinary controller and Bindings.xml/Lua remain the
actual movement/camera/action consumers. Native gamepad semantics are therefore
source-connected downstream of the acquisition boundary.

The current source does not implement this specific DLL-backed polling owner,
its two-second empty-slot probe schedule or a raw-XInput-slot-to-entity registry.
The selected code does not establish that the supplied Bevy platform backend is
identical at those boundaries. Device hotplug, platform normalization/filtering,
raw slot identity and source backend ordering remain explicit native/shared
engine questions under #41, alongside the existing device/runtime requirements.
No parallel polling service or platform behavior has been invented from a
matching diagnostic filename or an API name.

## Static checks

[check-xinput.py historical recipe](../SCRIPTS.md#historical-execution-sources) passes **65,984 bounded native
instruction cases**: the entire 65,536-value signed-stick domain, all 256 trigger
bytes and 192 slot-admission combinations (four starting slots, sixteen
connection masks and before/equal/after deadline). It verifies the newest full
EXE hash, both retained function/text hashes, ordered button masks/tags and the
existing source consumer boundary. The conversion and admission vectors run
unchanged original instructions only; they never call GetState, native helpers,
ECS allocation or operating-system services.

This completes bounded decoding and consumer ownership for the observed owner;
it does not certify the whole custom input system or the platform backend.
Compilation, actual hardware input, application execution and original/rebuilt
comparisons were not run.
