# Options recovery and implementation

Reviewed 2026-10-16. Target EXE SHA-256:
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
Gameplay is outside this task. This report owns the options-specific evidence;
the [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) record integrated validation.
The [0.105.0 Options report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/options-0.105.0.md) supersedes descriptor/default
provenance and the CVar delivery limitation below. Geometry, captures and other
runtime claims in this historical report remain bound to 0.92.0.

## Version-specific evidence

The executable contains a contiguous **94-row options table**, file offset
`0x58ebee8`, preferred-image VA `0x1458ed6e8`, with 152-byte records. Its end
is VA `0x1458f0eb8`. The native action consumer independently confirms index
bound 94 at `0x1401937db`, stride 152 at `0x1401937e5`, table base at
`0x1401937ec`, and checkbox control kind 5 at `0x1401937f3`.

[Retained definitions and provenance](evidence/0.92/options-definitions.json)
include every record's address, raw bytes/hash, keys, tooltip source, storage
and control discriminants, ranges, choice values, linked writes, page and
native default candidates. The source asset
[`options.json`](../../crates/azeroth-survivors-re/assets/options.json) is the
smaller, build-time-independent representation. The extraction helper remains
disposable at `runtime/menu-options-recovery/recover.py`; building the launcher
requires neither that helper nor the reference EXE.

| Page | Table rows |
| --- | ---: |
| Controls | 17 |
| Gamepad | 5 |
| Interface | 20 |
| Action Bars | 2 |
| Combat | 17 |
| Chat | 6 |
| Key Bindings | Separate native construction |
| Nameplates | 6 |
| Graphics | 10 |
| Audio | 10 |
| AddOns | 1, plus separate management UI |
| Saves | Separate native construction |

The native Options canvas is **1060×700**, with maximum scale **1.4**.
Constructor `0x140217e60` loads both Node dimensions and the Canvas design
size, then stores maximum scale at `0x1402180d1`. The shared screen systems
`0x14006c640` and `0x14006d9e0` divide physical window size by DPI and fit it as
`max(0.1, min(width / 1060, height / 700, 1.4))`; offsets center that canvas.
There is no recovered 85%-of-window constraint. Earlier screenshot-normalized
990×653 estimates are superseded by these stores.

[Curated layout evidence](evidence/0.92/options-layout.json) retains native
store addresses, literal bytes and independently measured Bevy 0.18.1 Node
field offsets. The content uses 28px horizontal/18px vertical padding, 12px
section gaps, 190px navigation and 20px column gaps. The scroll viewport has
16×10px padding and 4px row gaps. Regular rows have 36px minimum height,
320px label width and 12px spacing; sliders are 240×12px, checkboxes 24×24px,
and indented rows add 28px left padding. The external scrollbar is 8px wide.
The 40px title uses Morpheus. The shared panel helper sets a 10px radius,
1px border, dark brown gradient and a 14px-down/40px-blur shadow.

The original Controls and Key Bindings screens were also captured separately
under `runtime/analysis/history/native-recovery/reference-captures/1415f0451c23/options*.png`. Geometry recovery and runtime
captures are evidence of the target; source rendering still needs comparison.

Useful native functions:

- Panel construction: `0x14021bc80`–`0x14021d3b8`.
- Value/UI synchronization: `0x14018d5f0`–`0x14018ff6d`.
- Pointer sliders: `0x14018c530`–`0x14018cec6`; normalized pointer position
  is quantized to the recorded step relative to the minimum, then clamped.
- Numeric adjustment: `0x14016e230`–`0x14016e3e7`; adds delta times the
  recorded step and clamps to the recorded minimum and maximum.
- Value formatting: `0x1401830d0`–`0x14018351b`; control 0 is raw value ×100%,
  1 an integer, 2 value ×15 yards, 3 a percentage normalized over its range,
  and 4 the selected stop label.
- Setting writes: `0x140182450`–`0x1401829b8`; linked Mouse Look Speed writes
  pitch speed at half its value, and Pet Damage also writes PetSpellDamage.
- Gamepad initialization: `0x140043480`–`0x140043940`; defaults are
  `padInvertX=0`, `padInvertY=0`, `padLookSpeed=1`, `padZoomSpeed=1`,
  `padDeadZone=0.25`.

Checkbox records carry an inversion flag: Sticky Targeting, Disable Spam
Filter and Load out of date AddOns display the inverse of their stored CVar.
Display mode maps `gxWindow=0` to Windowed (Fullscreen), and `1` to Windowed.
Brightness displays `1 - gamma` over -0.5 to +0.5, normalized to 0–100%.

## Implemented source behavior

[`options.rs`](../../crates/azeroth-survivors-re/src/options.rs) supplies the
overlay, twelve-page navigation, recovered table rows, checkbox toggles,
inline choice buttons, draggable sliders, scrolling, hover tooltips, page
defaults, Done and Escape. Its sizing follows the recovered native Canvas
and Node values. Build14 rendered direct Text+Node row labels and the native
left-aligned navigation; the labels now align with their checkbox/slider rows.
This observed correction does not establish every page or control state.

The native CVar configuration is `$BENILLA_HOME/config.toml`, under `[cvars]`.
The recovered writer keeps unknown CVar entries and their spelling, writes only
applied values that differ from their registered default, and removes overrides
restored to defaults. Its native header, one quiet second, exit flush, and
`with_extension("tmp")` → write → sync → rename sequence are now implemented.
It does not use the former PID temporary name or backup/rollback sequence.
Unknown top-level sections are not serialized by the native CVar structure.
See [hash-bound writer/timer evidence](evidence/0.92/options-config-native.json).
Build20/21 compile, and the three focused config cases pass. Build21 runs the
CVar timer independently in Last and removes the extra Done/Escape flush.
Build24 adds the native whole-document typed reader and warning/default fallback,
retains the raw map, rejects invalid numeric menu overrides and allows a later
change to save after malformed startup input. Build25 uses warning-only CVar write
failure and checks the DateTime adapter edge. Six config fixtures pass; see
[startup/typed-load recovery](options-config-load.md).

The task launcher pins BENILLA_HOME inside this checkout; WOW_CAPTURE disables
persistence. The rebuild still keeps Lua/global-only state in provisional
`menu-options.json` while the addon VM is absent. Full native registry/session
ownership, complete callback/event loading and addon VM/complete binding lifecycle
remain incomplete. These are open parity defects.

Display mode and VSync apply to the actual Bevy window. Camera, world render,
HUD, audio, gamepad and stock UI settings are persisted for their native engine
owners; those owners are not activated by this menu-only launcher. In
particular, uiScale does not resize the custom picker canvas, and audio volume still awaits its menu audio owner. The new gamma shader bridge consumes the actual gamma CVar; the integrated picker and Options rendered through that bridge without shader errors.

Key Bindings loads the actual MPQ `Bindings.xml`, `DefaultBindings.wtf` and
`GlobalStrings.lua` through the existing engine parsers and instruction-bounded
Lua sandbox. Binding command bodies are parsed as data. It renders native
headers/labels and two key slots, captures keyboard/modifier/mouse/wheel input,
unbinds on right-click, cancels capture on Escape and restores native defaults.
Changes persist in the engine's `bindings/account.txt` diff format. Build22 saves in the input frame, consuming each request once and logging write failure without reverting live keys; the directory-shaped write-failure fixture passes. Native serializer/snapshot order and the complete character-specific binding lifecycle remain incomplete. See [writer/consumer evidence](evidence/0.92/keybindings-native-persistence.json). Headers toggle independently; the observed initial Movement group is expanded, with the other eight collapsed. The original
runtime independently confirmed `W / UpArrow → G / UpArrow`, Escape preserving
those slots, and Defaults immediately restoring them. Native binding rows use
30px minimum height, 24px left padding, 10px spacing, 300px labels, 200px key
slots and 14px key text. Binding capture behavior has runtime proof for the
reference; the reconstructed UI then captured G, cancelled a further capture with Escape
while leaving Options open, and restored the empty diff with Defaults in build15.
The native header helper uses separate16px ASCII +/- and17px label text; these
and the direct300px Text+Node row label are corrected for build16.

The desktop AddOns page now inventories `$BENILLA_HOME/AddOns`, parses its TOC
metadata and account overrides, opens the directory, toggles account enablement
and displays TOC notes in the footer. Two isolated manifest-only fixtures were
compared with the original. Native status priority is missing dependency, then
outdated (when version checking is enabled), then load-on-demand. Enabled
blocked titles are red, ordinary enabled titles gold and disabled titles muted.
The rebuilt checkbox wrote the observed `ParityFixture: disabled` line and
dimmed its title; the rebuilt footer displayed the fixture's TOC note in build14.
No Lua addon code was executed. Native desktop captures contain no install-ZIP
or remove controls, so catalog labels alone do not authorize inventing them.
The native header/list/row functions are bound in
[AddOns slice provenance](evidence/0.92/options-addons-slices-provenance.json).

The native footer Defaults tag15 passes the current page byte through the
`0x140192f10 → 0x140193e50` dispatch. The command consumer is now bound through table`0x1458f2820` case1 to
`0x14018e235`: page6 resets bindings separately, while other pages scan94
records and write defaults only for matching page bytes.
[Curated dispatch/instruction proof](evidence/0.92/options-defaults-native.json)
records the original PE switch table omitted by raw-slice Ghidra analysis.
The nine previously unresolved UI defaults were subsequently observed after
explicit native page Defaults: seven HUD visibility values are1, and both
nameplate globals are0. See [isolated runtime proof](evidence/0.92/options-runtime-defaults.json).
Their engine/VM owners and persistence lifecycle remain separate obligations.

## Remaining gaps and validation limits

- All94 menu defaults now have native code or isolated Defaults/runtime evidence.
  Dynamic HUD registration code and the two nameplate VM-global storage/lifecycle
  still require owner-level parity; observed default values do not implement
  the absent gameplay/VM systems.
- AddOn inventory and account enablement are implemented and exercised. Actual
  addon loading belongs to the absent client VM. Non-US keyboard layout mapping
  and reconstructed binding capture round trips remain unverified.
- The Saves page now lists `.sav` files by modification time, exports the active menu save with the native UTC filename, opens the folder, and imports after the native replacement confirmation. Rebuilt UI export and import were exercised with a project-local synthetic fixture: the imported Orc Warrior `Changed` was restored. Import uses the observed `characters.before-import.txt` backup path. Ordinary writer operations and full normalization/migrations remain incomplete. No installed player save was used.
- Defaults currently restores known defaults for the selected page. Selected-page scope and the separate binding reset are instruction-proved;
  disabled/indented row behavior and keyboard/gamepad navigation still require
  comparison. Drag quantization and indent geometry are recovered.
- The panel gradient and external scrollbar are implemented. Button state
  gradients, exact text sizing and source-render comparison remain open;
  recovered geometry is not proof of a matching rendered result.
- Per-page runtime verification, settings reload/round-trip checks and Windows
  behavior are not established by the static recovery. Consult the current
  snapshot for checks actually completed after integration.
