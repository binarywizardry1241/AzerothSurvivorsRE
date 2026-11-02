# Current main-menu Enter, hover and scroll input

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

Static recovery on 2026-10-18 uses the supplied 133,231,104-byte 0.97.2 EXE,
SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
The active source-only instruction was honored: no builds, compiler checks,
compile-based tests, emulated fixtures, or original/rebuilt game launches ran.

[catalog-menu-input-native.json](evidence/0.97.2/catalog-menu-input-native.json)
retains unchanged current PE spans and hashes, full REA/Ghidra records,
original PE disassembly, type/call bindings and exact constants. Recovered
behavior, implemented source and verified execution are distinct below.

## Enter action and keyboard

The footer stores action byte3 at `0x140249822`. Its dispatcher jump-table
destination `0x14009a6d6` sets a local request flag. After iterating actions,
`0x14009a9cc..0x14009ab61` handles that flag:

1. Validate the live name using `0x145428330`; replace it through the native
   name generator `0x14008e4e0` when invalid.
2. Construct the complete Pick, normalize it through `0x145427b30`, and clamp
   its zone through `0x14541d7f0` against the current Save.
3. Append command tag11, the current full-Pick command, through
   `0x14004adf0` at `0x14009ab2d`.
4. Clear state byte `+15` at `0x14009ab41`, set its first DWORD to1 at
   `0x14009ab54`, and set its float `+4` to current `Time.elapsed_secs`
   at `0x14009ab5b`.

This state is **the same resource** used by the footer to select
`picker.entering` instead of `picker.enter`. Its TypeId bytes are
`949eb60ff3eb1a6b9b2e0295a04c528f` at `0x1458f9a88`. Action-system
initialization `0x1400a7dd0` obtains that TypeId at `0x1400a7f73`, retains
the resource ID through local `+0x220`, and stores it at system-state
`+0x148` at `0x1400a81f3`. Runner `0x140127490` resolves that slot,
retains its value pointer at local `+0x210`, constructs the resource view at
local `+0xd0`, and passes that view as dispatcher argument5 at
`0x140127b26..0x140127b38`. Dispatcher `0x140099b40` receives that argument
through `R15` and retains its value pointer at native local `+0x188`.
The post-loop stores above use that exact pointer. The original Rust type
name has not been recovered, but this binding does not depend on naming it.

The common dispatcher skips actions while the state tag is1 and its
timestamp is nonnegative, at `0x140099f66..0x140099f7e` and the parallel
query path. It accepts changed Interaction byte0 (Pressed), without any
separate mouse-button-resource check. The source's extra
`mouse.just_pressed(Left)` gate was removed. It has no Enter confirmation
or informational notice.

Keyboard producer `0x140067ee0..0x140068166` checks just-pressed KeyCode
ordinals58 and102, matching Enter and NumpadEnter. It requires the current
main-menu byte `+13`, no open armory, language, Options or run-options pane,
and an idle first byte. It writes the exact eight bytes
`01 00 00 00 00 00 80 bf` at `0x140068011..0x14006801b`: tag1 and
timestamp `-1.0`. The dispatcher recognizes tag1/timestamp `-1.0` at its
entry and runs the same post-loop path. There is no name-focus exception.
The keyboard producer also consumes Enter, NumpadEnter and Escape key state
while the main menu is active. Source key ordinals were compared to the
project-local Bevy0.18.1 enum definition; no compilation was needed.

The same keyboard producer maintains the timed transition. For a tag1 with
nonnegative timestamp, and without completion flags `+14/+15`, it clears
the tag strictly when `elapsed_secs - started > 30.0`, at
`0x14006812d..0x140068145`. The exact float30 is at `0x1458f6600`.
The completed-session branch also uses this30-second bound but additionally
changes the main-menu byte, repeat timing and consumed key state. The
producer of those completion flags and the world-launch/session connection
are outside the recovered implementation here.

Source `MenuState::begin_enter` and `advance_enter`, called by the two Enter
paths in `menu.rs`, now implement invalid-name replacement/full-Pick commit,
the entering state, the action gate and the strict30-second no-completion
timeout. The footer uses the recovered entering label. The former invented
“gameplay excluded” notices were removed from both Enter paths. World entry
is unconnected, and successful native/rebuilt interaction parity is not
claimed. Source input/key-consumption ordering across every plugin remains
incomplete; the source maps the recovered request and commit to one input
pass rather than reproducing the native scheduler's pending `-1.0` phase.
The existing name-validation/generation and save helpers retain their own
version-bound provenance: this pass binds the current caller and helper
destinations, and does not independently revalidate every inner algorithm.

## Picker border and lift

Current body `0x140099120..0x14009993e` revalidates the border/lift behavior
previously bound only to 0.92. Its query initialization
`0x140338e80..0x1403391ba` resolves component getter `0x140284480` as the
first query field and repeats that same getter as the sole Changed filter.
The field is the one-byte Interaction used by the body. Source now uses
`Changed<Interaction>` only; changing the style without changing Interaction
does not add an extra native update trigger.

The native44-byte style record has a20-byte resting Color,20-byte active
Color and float lift at `+40`. Interaction byte2 selects the resting color;
the other interactions, including Pressed, select the active color. The
selected color is copied to all four20-byte sides of BorderColor. If an
optional UiTransform exists, translation becomes `(Px(0), Px(-lift))` while
active or `(Px(0), Px(0))` for None. The sign-bit lanes at `0x1458f8f50`
negate the lift; no easing or accumulated offset is applied in this body.
The source's corresponding logic is in `hover.rs`. Native full scheduling
relative to all other painters remains unverified.

## Wheel and scrollbar limits

Current shared wheel body `0x140072320` uses the singleton window's physical
cursor. Its window branch checks nonnegative coordinates and exclusive
physical width/height bounds. It does not invoke the fallback collection
found in the scrollbar drag routines. Helper `0x1400384d0` continues the
hovered list query and returns the maximum computed stack index. The named
cache,40-pixel line conversion, pixel unit and clamps are documented by the
[home-screen report](home-screen-0.97.2.md). Source uses the same physical
window-cursor API and chooses the maximum hovered enabled list stack.
Complete native root/query membership and run predicates remain incomplete.

Current scrollbar begin `0x1400732d0..0x1400742df` checks changed Pressed
interactions on thumbs before the track branch. It does not take or test a
separate mouse-button resource for beginning a drag. The source's extra
mouse-pressed gate was therefore removed. Continued dragging at
`0x140071dd0..0x14007231e` still uses the pressed-input check, preserves the
grab offset, scales the cursor delta and clamps the resulting scroll value.
The actual source geometry constants remain those revalidated against
current metrics body `0x140071480` in the home-screen evidence.

Both drag bodies have a fallback iterator over136-byte input records when
the window cursor is unavailable. Its exact type and producer were not bound
in this pass. Source retains the proved window path and does not insert a
guessed touch resource. Original drag and wheel schedule ordering and modal
run conditions also remain incomplete. No claim of complete shared input
parity is made.

## Evidence and reproduction

| Current body | REA/Ghidra Evidence ID |
| --- | --- |
| Enter keyboard/timeout `0x140067ee0` | `ev_73f167c87bdca9c967c71e3b80790033d093f5c53d1e2821e8241f21a20541da` |
| Border/lift `0x140099120` | `ev_ccb134668c0419d9847eac9a97c6f8151f7f96a336a80ffbaf9d7f4bffcad466` |
| Drag begin `0x1400732d0` | `ev_62bcced192e386566875926834128cb095582cd271e14becbc43d31b29c3227b` |
| Drag continuation `0x140071dd0` | `ev_f1eb9e92dc1210adfa702f2d6185b44b162e9805179c3ed1535ef0d31fe3f752` |

The [action report](menu-actions-0.97.2.md) owns the complete current
dispatcher REA record; [zone-scroll recovery](menu-zone-scroll-0.97.2.md)
owns the picker content invalidation and entering-label binding.

```sh
python3 scripts/recover-menu-input.py --prepare
python3 scripts/rea-batch.py runtime/menu-input-0.97.2/plan-140067ee0.json
python3 scripts/rea-batch.py runtime/menu-input-0.97.2/plan-140099120.json
python3 scripts/rea-batch.py runtime/menu-input-0.97.2/plan-1400732d0.json
python3 scripts/rea-batch.py runtime/menu-input-0.97.2/plan-140071dd0.json
python3 scripts/recover-menu-input.py --collect
```

Completed queries used REA6.5.0/Ghidra12.1.4 and closed their sessions.
The batch runner needs fresh output directories when repeating a query.
Generic GCC ABI from raw imports is not a Windows x64 signature; original
PE instructions establish the bindings described here.
