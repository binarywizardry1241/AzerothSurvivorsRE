# Shared overlay Canvas fit

Target SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This revalidates current Canvas-present arithmetic used by pause and terminal
presentation under **#7/#9**. Current overall status belongs to
[verification-needed](../verification-needed.md). Existing `canvas.rs` formulas match these
selected native paths; no new size/scale behavior is introduced.

The current owners are `14018f300..14018f75e` (layout fit) and
`140190700..140191126` (render-target propagation). Fresh Ghidra 12.1.4
imports bind their identities in the
[manifest](evidence/0.109.0/overlay-canvas/manifest.json). Exact original
instruction windows independently establish:

- Convert the window's physical width/height to `f32`, divide by its active
  scale factor, then by the Canvas design dimensions.
- Select the smaller ratio and maximum Canvas scale, with a floor of `0.1f`.
  Center the design using `(logical / fit - design) * 0.5f` per axis.
- The Canvas-present render-target branch independently computes the same fit.
  The selected camera branch multiplies camera scale by `UiScale`, then multiplies
  that result by fit, all as separate `f32` operations.

`NativeCanvasPlugin` applies those formulas before target propagation through
`ComputedUiRenderTargetInfo`; `terminal_view` supplies design 560×700 with
maximum 1.3, and the pause shell uses the same Canvas path. The source retains
real text/layout target scaling. Other native target modes and complete camera,
query and scheduler admission are not certified by these arithmetic windows.

`python3 -B scripts/check-overlay-canvas.py --check --verify` passes
**315 original-instruction executions** over 105 window/DPI/design combinations:
seven physical sizes, five scale factors and three Canvas templates. Each
combination checks fit/offsets, independent target fit and camera/UiScale
multiplication. Window/query/camera state is supplied in scratch memory. The
probe rejects all calls and every instruction outside the retained windows;
it neither runs Rust nor instantiates a renderer. Existing Python Capstone and
Unicorn dependencies are required; no installation is performed.

`--prepare --work runtime/canvas-current-replay` stages two raw Ghidra plans.
Run their `plan.json` files through `scripts/rea-batch.py`, then `--collect`
with the same work path to stage candidate evidence. Bulk raw imports and
generated vectors stay ignored under `runtime/`.

These checks retain exact target bytes and interpreted arithmetic separately
from source tracing. They do not establish dynamic content clipping, all scale
modes, engine/global/indirect ownership, text shaping, actual DPI/resize/GPU
behavior or original/rebuilt parity. Compilation, compiling tests and both game
applications were intentionally not run. Whole-image ownership remains **#41**.
