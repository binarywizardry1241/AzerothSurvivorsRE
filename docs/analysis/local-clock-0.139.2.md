# Device local clock in 0.139.2

The [range and query manifest](evidence/0.139.2/local-clock.json) binds this
targeted #302 repair to installed EXE SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [0.139.1 clock descriptor](native-interface-correspondence-0.139.1.md)
retains its narrower historical scope. Full 0.139.2 coverage registration
remains under [#41](../CURRENT-STATE.md#gap-41).

## Provider and Lua interface

The descriptor at `0x1402112c0` constructs the 19-byte name
`AZS_NativeLocalTime` and callback `0x1402117f0`. Its callback calls
`kernel32!GetLocalTime` via IAT slot `0x1464f48e0` and reads the hour and
minute fields of `SYSTEMTIME`. The AS language getter at `0x145eb9d10`
selects 12-hour time only for the two-byte language code `en`. The English
branch takes hour modulo 12, substitutes 12 for zero, pads minutes, and uses
`AM` before noon or `PM` from noon. The other branch pads both 24-hour fields.
The returned tuple carries the formatted text, unmodified 0–23 hour and
minute, and the Boolean 24-hour flag. There is no widget, run, or minimap
input to the time provider.

The exact 307-byte `AZS_GetLocalTime` wrapper matches the retained 0.139.1
Lua at the 0.139.2 file offset `0x76b47b7`. It reads the native callback under
`pcall`, returns nil on an absent callback, failed call, or absent text, and
otherwise creates a new `{text, hour, minute, is24Hour}` table. The bootstrap
adds that wrapper and the canonical camel-case `localClock` key to the
existing API. The local-client initializer seats the callback in each
FrameXML/addon VM before addon loading, including replacement on ReloadUI.
Each call reads the shared platform clock at the call site. The widget and
Lua callback use the same AS language selection and text formatter.
Windows uses the existing `GetLocalTime` implementation. Unix reuses the
engine's `localtime_r` path and its conversion-failure fallback.

## Setting and widget

The Interface checkbox is the 152-byte descriptor at `0x14653d7b8`, between
`hudMeter` and `discordPresence`. Page 2, storage 0 and control 5 give a
regular CVar checkbox. The HUD registry at `0x14020e2dd` defaults
`hudLocalClock` to `1`. Its reader at `0x14020e775` trims the value and
hides only for the single byte `0`; the result reaches the clock geometry
system through the `HudParts` byte at offset `0x0a`. The Options row and
`AZS_SetHudShown("localClock", ...)` share this saved registry key. The two
localized fields match the native locale payloads for all fourteen languages.

The construction body `0x1402261c0` creates one hidden clock root and a
centered, non-pickable text child. The typed root tuple includes `Zoomed`,
`Node`, `GlobalZIndex`, `Pickable`, and `Visibility`. The root layer is 3990.
The font loader at `0x14025cec0` puts `Fonts/FRIZQT__.ttf` in the first
menu-art handle, which the constructor clones. The label uses size 12, warm sRGB
`(0.949, 0.902, 0.788)`, and black shadow at alpha 0.85 with offset
`(0, 1.5)`.

The geometry body `0x14020c4c0` requires the active run screen, no loading
cover, a valid rendered minimap rectangle wider than one logical pixel, the
clock's HUD bit, and an existing clock label. It sets left to
`min.x / scale`, top to
`(max.y + 4) / scale`, and width to `(max.x - min.x) / scale`. The rebuilt
widget uses the existing rendered-minimap snapshot and the shared HUD scale.
The `0x1402268e0` text system reads the same time provider initially and
then at one-second real-time intervals. It writes the text only when changed.
The time read remains independent of widget visibility.

## Static validation

Six original PE ranges were queried through the shared Ghidra queue. The
manifest records their raw-range, profile, and result digests. The raw imports
omit external dependencies, so original Windows-x64 instructions and directly
read data govern their interpretation. The callback was replayed for all
1,440 minute values in English and Polish plus four nonmatching English-code
variants, totaling 2,884 cases. The replay supplied the OS time and locale
and intercepted the Rust formatter, verifying its descriptor, arguments,
period and output tuple independently of the external implementations.

The existing Lua harness passed against the exact wrapper and the composed
application bootstrap using a stub host. Checks cover nil/error handling,
fresh tables, both format flags, and the independent visibility key. The
descriptor and 28 locale strings were matched against the installed bytes.
Compilation, actual VM and platform behavior, rendering and original/rebuilt
parity remain [unverified](../verification-needed.md#gap-302).
