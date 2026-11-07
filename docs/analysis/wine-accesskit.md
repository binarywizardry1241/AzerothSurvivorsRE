# Windows AccessKit teardown on window creation

[Finding #311](../verification-needed.md#gap-311) tracks the 0.139.1 Wine and
Proton alt-tab release claim. The [evidence manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.139.2/wine-accesskit.json)
binds the current recovery to 0.139.2, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

## Original client

The retained 0.139.0 and 0.139.1 census references both show AccessKit's
window-procedure restoration and property removal. The 0.139.1 census also
shows two Bevy system wrappers calling `0x140d8a1e0`, which calls the
AccessKit teardown at `0x14318ce20`. The 0.139.0 census has four observed
direct teardown call sites, all in the platform code region. The added path in
0.139.1 moves adapter removal into a message-reading application system.
The comparison is bounded to decoded references in those saved inventories.

In 0.139.2, setup at `0x140992294` initializes the message resource on a miss
and calls the registration helper at `0x1410cb110`. That helper constructs
the system using descriptor `0x146600ad8`. Its run slots route through
`0x1409b0fa0` and `0x1417d30b0` to the same consumer at `0x140fcf4b0`.
The schedule label's formatter returns `First`. The system's reader
initialization and message registration share the same 16-byte type key as
the winit creation parameters. This matches the published Bevy 0.18.1
`create_windows` path, which emits `WindowCreated` with the new window
entity after creating the native window. [Bevy 0.18.1 source](https://github.com/bevyengine/bevy/blob/v0.18.1/crates/bevy_winit/src/system.rs)

The consumer walks unread message records and removes the matching entity
from the thread-local adapter map. A found live adapter reaches the teardown
call at `0x140fcf686`. AccessKit 0.29.2 initially installs its own window
procedure with `SetWindowLongPtrW`, preserves the previous procedure and
publishes the `AccessKitAdapter` window property. Its subclass can return a
UI Automation provider through `UiaReturnRawElementProvider`. On drop, the
destroyed-window flag bypasses teardown for an already destroyed handle.
Otherwise, `0x1431a9de8` restores the saved procedure using `GWLP_WNDPROC`
and `0x1431a9dfd` removes the property. A zero restore result or a reported
property-removal error goes to the library's failure path. The original EXE
retains the ordinary AccessKit import and installation machinery.
[AccessKit 0.29.2 Windows source](https://docs.rs/crate/accesskit_windows/0.29.2/source/src/subclass.rs)

## Reconstructed source and verification

The AS [entry point](../../crates/azeroth-survivors-re/src/main.rs) installs
`LocalClientPlugin`, whose [game plugin group](../../crates/benilla-app/src/game_plugins.rs)
installs [`VideoPlugin`](../../crates/benilla-app/src/video.rs). The Windows
branch registers `drop_accessibility_adapter` in `First`. Its
`MessageReader<WindowCreated>` and `NonSendMarker` let it remove the matching
adapter on the window thread through Bevy's existing `ACCESS_KIT_ADAPTERS`.
The benilla 0.3.0 import already supplies this path. The locked Bevy and
AccessKit versions match the inspected native interfaces.

The source comment attributes the workaround to Wine's `tabtip.exe` UI
Automation queries and describes an `rpcrt4` fault followed by heap damage.
Static evidence establishes where the original client detaches the provider
and where the rebuilt source does the same. The crash and heap-failure
mechanism require runtime evidence.

Six journaled Ghidra operations cover registration, message consumption and
teardown. Independent PE instruction and import checks establish the Win64
arguments and the calls outside the raw slices. Compilation, Windows
execution, focus and alt-tab behavior, and original/rebuilt parity remain
open in #311.
