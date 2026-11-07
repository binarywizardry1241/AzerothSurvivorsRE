# 0.92 menu background and embers

Historical 0.92 report. The selected 0.97.2 target is covered by
[main-menu-background-0.97.2.md](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/main-menu-background-0.97.2.md).

Updated 2026-10-16. Target `AzerothSurvivors/AzerothSurvivors.exe`, SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The owning implementation is `crates/azeroth-survivors-re/src/background.rs`.
Build15 compiled and rendered the backdrop and embers without reported shader errors.
The rebuilt frame was inspected alongside the native picker; exact visual parity is not claimed.

REA/Ghidra scoped functions `0x140201e50` and `0x140127000` recover the constructor
and particle update. [menu-background-native.json](evidence/0.92/menu-background-native.json)
records their evidence IDs, original constant bytes/VAs/file offsets, type bindings,
formulas and remaining limits. `scripts/recover-menu-background.py` reproduces the
curated record from the SHA-bound reference and existing local REA exports. Neither
the source build nor runtime requires that analysis script or the reference EXE.

The background uses the selected zone's actual loading-screen image, with the same
MPQ runtime data route as the zone cards. Its image Node is absolute, left/top−3%,
width/height106%, default ImageNode Auto mode, without a crop override. The image
tint is opaque Srgba(.4,.38,.36,1); the former white tint with .19 alpha was an
unverified approximation and has been replaced.

Two gradients share an absolute full-window Node. The radial gradient is centered
at the center anchor plus x 0%/y −10%, uses FarthestCorner, and changes from clear
at 30% to black .8 at 100%. The linear gradient points downward (PI), clear at 60%
to black .6 at 100%. Both use native default Oklaba interpolation and .5 hints.
Native color conversion exports Srgba components and stores them as
Color::LinearRgba, matching the separate gradient pass already used by the recovered
pane backgrounds. Public Bevy 0.18.1 compiled layout constants bind radial fields and
the FarthestCorner enum storage tag 10 to the native stores; this is a type-layout
inference cross-checked against the original instructions.

The 28 embers are deterministic, indexed 0..27. With `fract(x)=x-truncf(x)`:

| Property | Native formula |
| --- | --- |
| Diameter | `fract(i*1.37)*3+2` pixels |
| Base x | `fract(i*.618034)*100` percent |
| Speed | `fract(i*.731)*.08+.06` |
| Drift | `(fract(i*.414)-.5)*12` percent |
| Phase | `fract(i*.293)` |
| Progress | `fract(speed*elapsed+phase)` |
| Position | x=`drift*progress+base_x`, y=`102-106*progress`, both percent |
| Alpha | `.9*(progress/.1)` below .1, otherwise `.9*((progress-.1)/(-.9)+1)` |

The math thunk `0x145714a45` jumps through IAT `0x1458a5450`, explicitly imported
as CRT `truncf`. An earlier provisional floor interpretation is superseded by this
import binding. The inputs here are nonnegative, but the implementation preserves
the recovered truncation operation.

Each ember has a circular 50% radius, Srgba(1,.7,.28,alpha) background, and a static
raw-linear RGBA(1,.48,.11,.5) shadow: zero offset, spread 1px, blur 6px. Only position
and background color change in the recovered update query; no invented shadow
animation or random number source was added.

`BackgroundPlugin` owns an independent full-window root at GlobalZIndex−100,
separate from the 1600×900 menu Canvas. It observes the zone image handle and
selection, rebuilding only when they change, and uses public `Time::elapsed_secs()`
for the native f32 elapsed term. Exact timestamp alignment against a native frame
and the original Time resource's generic specialization remain unverified.
The independent root is the reconstruction's integration boundary, rather than
a claim that its ECS entity IDs, type tuple or scheduling match the original.

Validation frame: `runtime/analysis/history/interface/menu-recovery/0558cac00653/reconstructed-picker-15-small.jpg`, compared
with `runtime/analysis/history/interface/menu-recovery/0558cac00653/native-picker-current-small.jpg`. The previously different
background opacity/gradient appearance is corrected, and animated ember sprites render.
These single frames do not verify animation speed, elapsed-time phase or all aspect ratios.

Audio remains separate and incomplete. The existing native reference log now confirms that
this custom picker starts `wow_main_theme.mp3`; scoped REA binds its start/watch controls and
exact volume operands. Build26 connects the recovered theme through the existing mixer source,
with compilation pending and no new playback. See the [audio report](main-menu-audio.md) for
current evidence and the remaining backend, scheduling and audible-comparison limits.

## Retained reports

[0.97.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/main-menu-background-0.97.2.md)
