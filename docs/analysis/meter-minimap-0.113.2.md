# Damage Meter minimap button (#56)

Selected target: **0.113.2**, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[verification-needed](../verification-needed.md#gap-56) owns current verification status.
This report covers button geometry and its live source connection; historical
meter accounting/settings retain [their original proof](run-meters-0.105.0.md).

## Recovered layout and source correction

The reported screenshot shows the swords icon below/right of its circular
border. Both textures render. The current EXE proves a source geometry mismatch:
RE previously centered a 21px image in a 31px button and squeezed the complete
tracking-border image to those same bounds. Its transparent padding makes that
different from the native image arrangement.

Fresh REA/Ghidra 12.1.4 recovery follows the current placement owner
`1402137d0` into its direct child-constructor call `1402b23f0`. The
[canonical manifest](evidence/0.113.2/meter-minimap/manifest.json) binds exact
current PE bytes, immutable inputs, two Ghidra observations and six disjoint
assembly extracts. These are bounded raw imports with synthetic ABI/type names,
not original Rust source or whole-engine recovery.

| Part | Native local geometry | Connected source |
| --- | --- | --- |
| Button | 31×31, absolute; draw order4060 | The real Button/Toggle/RelativeCursorPosition owner remains 31×31. |
| Backing | Left6, top5, 21×21; circular maximum radius, black alpha0.8 | Restored before the icon. |
| Icon | Left7, top6, 19×19; `Ability_DualWield` | Absolute image node, with the existing open/hover tint. |
| Border | Left0, top0, 53×53; full `mpq://interface/minimap/minimap-trackingborder.blp` | Absolute image quad with native overhang; no artificial crop. |

The backing and both image children ignore picking. The parent retains the
native click/hover region; the oversized border's transparent area does not
enlarge it. The existing tooltip, toggle, visibility and open/hover tint consumers
remain connected to that parent.

The current placement prefix computes `factor = minimap_width / 140`, offsets
the live minimap center by `(-75.175407, 27.361612) * factor`, subtracts15.5 for
the fixed button's local top-left, and applies a centered UiTransform scale of
`factor` to the whole button. The native admission requires minimap width>1.

[meter.rs](../../crates/azeroth-survivors-re/src/gameplay/meter.rs) now follows
this layout. The existing FrameXML bridge supplies visible normalized Minimap
bounds; the window converts them to logical coordinates. Because this adapter
keeps the button on its already zoomed meter Canvas, it divides the desired
center by `hudScale`, subtracts the local15.5, and sets the button transform to
`factor / hudScale`. This cancels Canvas zoom once for the button's images and
input while preserving the meter window's separate HUD scaling. Changing Node
width/height alone previously moved its center as the minimap resized and did
not scale the border's actual native quad.

## Static checks and limits

```sh
python3 -B scripts/check-meter-minimap.py
```

The checker verifies the installed hash, all retained ranges/data and the live
source path. Unchanged original instructions produce **three child records**,
**fifteen button/position cases** and **eight width-admission cases**, including
zero, negative, subpixel, exact1, NaN and infinity boundaries. The fifteen native
cases cover five minimap sizes and three positions. A separate **75-case
geometric composition** checks five HUD zoom values against those native
results, including child corners and the button's input bounds. This composition
models centered transforms; it does not execute layout or hit testing.

Allocation, asset handles, ImageNode conversion and ECS submission are explicit
constructor seams. The selected Node stores, geometry, alpha, transform and
draw order execute as original instructions; no Bevy renderer, font/layout
engine or game process runs. `--prepare-rea` reproduces the raw-owner plans via
`scripts/rea-batch.py`; `--collect` stages compact evidence under ignored runtime
before review/promotion.

Rust syntax inspection uses project rustfmt with stdout output only. Compilation,
actual Bevy layout/rounding, GPU/texture sampling, DPI/window/HUD/minimap resizing,
interactive hover/click and controlled original/rebuilt visual parity remain
unverified. No additional concrete source omission remains identified in the
selected alignment path. #56 remains open for those presentation/input checks.
