# Addon frames above custom cards

The installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This traces the live host-controls interface for [#11](../verification-needed.md#gap-11).
The [0.127.0 report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/above-card-frames-0.127.0.md) retains the original adapter
and Lua contracts. The [0.139.2 input report](input-gate-native.md)
owns the earlier input gating and drag producer proof.

## Registration and shared state

The leaf at `0x1401dc950` returns the 59-byte
`benilla_app::host_controls::over_screens::OverScreensPlugin` name at
`0x14659c542`. Its pointer is at `+0x60` of descriptor `0x14659adb0`.
Configuration `0x1402d28e0` calls the registration wrapper
`0x140163090`, which supplies that descriptor at `0x1401630b3`.
The build slot at `+0x40` is `0x140ee6d80`. The build initializes the
48-byte resource keyed by the 16 bytes at `0x1466a93f0` and includes
the paint callback in the set whose formatter at `0x140f132d0`
selects `UiQuadAppend`.

The configuration supplies descriptor `0x1465c2d18` at
`0x1402d2a43`. Its two run entries reach `0x1402c8c80`, the Lua
reader registered through the `Update` schedule wrapper. At
`0x1402c8da5` it passes the exact 17-byte `AZS_ON_TOP_FRAMES` key to
`0x1408adcf0`. It calls the comma-split producer at `0x1402c8e23`
and publishes the owned string rows through `0x1408ae900`, which
jumps to `0x140e70e50`. That setter locates the same resource as the
plugin builder. It compares row counts and ordered strings before
replacing the vector. Missing VM state and a missing value have
their own input branches. The 1,159-byte Lua block that defines and
initializes the API matches both the 0.140.0 extract and the
[0.127.0 Lua used by the rebuilt bootstrap](evidence/0.127.0/embedded-api.lua).

## Pointer and paint consumers

Descriptor `0x1465c2c70` reaches the pointer handler at
`0x1402c8490` through two generated run entries. Configuration
`0x1402d2b0c..0x1402d2bd9` adds the after edge to
`InputSystems` and the before edge to variant zero of the UI set,
whose formatter table at `0x1465c4388` resolves to `Focus`.
The schedule wrapper selects `PreUpdate` through the descriptor at
`0x1465634b0`. The handler admits a present cursor inside the
physical window bounds and divides both coordinates by the effective
window scale before calling the shared hit predicate.

The predicate `0x140e70720` reads the registered name vector,
projects the logical pointer to the 768-high root and calls
`0x142809dc0` for the actual UI hit. It obtains frame names and walks
parents through `0x1427fe540` and `0x1427fe6e0`. Its comparison
at `0x140e70d3c..0x140e70d55` checks length and exact bytes.
When that predicate is true, the pre-focus handler selects the
three fresh button keys 0, 1 and 2, removes those edges and records
the pointer ownership byte at `0x1402c8a07`. The hit path therefore
leaves the ordinary Lua input walk available while protecting lower
Bevy controls. The retained input gate report identifies these
three keys as Left, Right and Middle.

The paint system descriptor at `0x1466b4970` reaches
`0x140ee9a30`, which calls `0x140ec0670`. The paint owner
passes registered names to `0x1427fe820`, compares the returned
eight-byte frame identifiers against its cached list and replaces
the list only on a change. The camera flag at `+0x100` tracks
whether the resulting identifier list is nonempty. The camera
constructor at `0x140ec0480` uses the exact `over-screens camera`
label and constructs a mask with bit 62 at `0x140ec04f9`.

The rebuilt [extension](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs)
seats the same global before external addon loading.
[The pre-focus input registration](../../crates/benilla-app/src/local_client.rs)
applies the same three fresh-edge removals on an actual registered
hit in the same named schedule window. The
[ordered UI input owner](../../crates/benilla-app/src/ui_script/input.rs)
also uses registered ancestry for per-record routing. The
[existing extractor](../../crates/benilla-app/src/ui_script/extract/mod.rs)
and [late pass](../../crates/benilla-app/src/ui_pass.rs) route the
registered subtrees and their existing paint data through the late
camera. The rebuilt renderer uses its reserved layer and activates
the camera when there are promoted quads. The traced AS interface
has no remaining source correction. Exact same-frame effects of
registry edits, absent or hidden roots, native camera lifetime, and
rendered or interactive equivalence remain verification work.

## Static receipts

| Original VA range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Registration `0x140163090..0x14016312d` | `0x162490` | 157 | `840cf58cddeff1fdb766015743a17c07387dbc62158e636c4beda902764cfd36` |
| Configuration `0x1402d28e0..0x1402d2d2c` | `0x2d1ce0` | 1,100 | `70ba739fcbc769c3a21d1e11609fc326e6c3046c3442744b48c85168da80a285` |
| Plugin descriptor `0x14659adb0..0x14659ae20` | `0x65993b0` | 112 | `0a8b487546f88534488f37eeb732f574ae7b15287b0ebb9fba1b17dee1d7cb66` |
| Plugin build `0x140ee6d80..0x140ee727b` | `0xee6180` | 1,275 | `923fd2d448a9a1fd192404cc3bd450ff07c3210ad3283f5e6ed7ad26337072af` |
| Lua adapter `0x1402c8c80..0x1402c8f1e` | `0x2c8080` | 670 | `42066e262d9302c67ee569e21d6f85861a3643bd1f0718a594b332db01776b47` |
| State setter `0x140e70e50..0x140e7118d` | `0xe70250` | 829 | `783becb8f5a34a3e037e7e56b786c456516eaeeccfb480f8282bf89303f599a6` |
| Pointer handler `0x1402c8490..0x1402c8bd0` | `0x2c7890` | 1,856 | `00557e3085eed3d3b9f766918c28c8873e8c6ce92f795d10888fd783e50fe7ca` |
| Hit and ancestry `0x140e70720..0x140e70dda` | `0xe6fb20` | 1,722 | `88a242c7ce6c324a4058f241fa7b889ee2802bc527f9e53399fb9845e716ba86` |
| Camera setup `0x140ec0480..0x140ec05de` | `0xebf880` | 350 | `fbc3a4f15df2e546c36f6f96d1905c1729e7c2b7429bf4ccfdd6d43495ad50dc` |
| Paint owner `0x140ec0670..0x140ec0a7c` | `0xebfa70` | 1,036 | `ced6f175112818c88d5f635668a8b30a134e2416816645f276a28051b775fcad` |
| Lua block `0x147ae8274..0x147ae86fb` | `0x7ae6874` | 1,159 | `3ae5294ca16a339938f7f02fbc952c3718920420dd4672a8f24c7767465071f4` |

Ghidra 12.1.4 queried the original plugin build slice at its preferred
VA. The journal and both results agree on the exact slice digest above.

| Operation | Ghidra evidence | Journaled result SHA-256 |
| --- | --- | --- |
| Procedure metadata | `ev_5d8d330f42f9bbaf9e64e55960056cb7b1a604408d4202b5f74b76211f8c5ec4` | `a3985589f48c513f45223418bde71ff0f9025a8250a06e404c4b1b17c3e91e74` |
| Pseudocode | `ev_123fd54e072593d796186227ab5193ecedbc9afc7bdfe0c166668f0ef3d0df3f` | `d96438a3b46940f59a28aefad66d87a0c56a6a94e5dedd1cd7c9846139994261` |

The bounded import omits external code and data. Original PE operands,
set formatter tables, and Win64 argument sites establish the joins.
The existing Lua checker passed 47 stub-host assertions using the
actual bootstrap fixture. Compilation, game or addon execution,
real input and rendering, and original/rebuilt comparisons remain open.

## Retained reports

[0.127.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/above-card-frames-0.127.0.md)
