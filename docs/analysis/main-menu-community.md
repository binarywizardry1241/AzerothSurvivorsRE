# Community button

This report records 0.92.0.

Target SHA-256: `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The Discord mark is an embedded alpha bitmap, rather than an MPQ texture, PNG or external
SVG. The picker constructor `0x1401231b0` uses the1200 alpha bytes at `0x1458e4bff`
to create a40×30 image. `0x140101160` expands each byte to RGBA `(255,255,255,a)`.
The native constructor passes D2, Rgba8UnormSrgb and RenderAssetUsages::RENDER_WORLD,
then caches the image handle and passes it to utility builder `0x140200950`.

The utility builder displays the mark at24×18 with sRGBA tint(.973,.824,.416,1).
Its button uses Auto width/height,14px horizontal/8px vertical padding,1px border and4px
radius, plus the shared `0x1400a1200` frame. The explicit black sRGBA shadow has alpha.85,
x0/y2, spread0 and blur6. At this content size the button is54×36 before flex layout.

The source `community_icon::image()` reconstructs those exact pixel bytes from textual
hex alpha rows in `assets/community-icon.json`. The data extraction utility is
`scripts/recover-community-icon.py`; it requires the reference only when re-running analysis.
Neither a source build nor the runtime image constructor reads the EXE. Original VA/file
ranges, mask/pixel hashes and native function Evidence IDs are retained in
[community-icon-native.json](evidence/0.92/community-icon-native.json).

Native action tag11 dispatches to the OS URL opener for `https://discord.gg/UzxaZuSAk`.
This subtask did not open that URL. The root menu owns the corresponding source action and
button integration. The build14 capture renders the integrated mark and button; native pixel data and sizing
are traceable to the evidence above. Full visual comparison and OS opener dispatch remain
separate checks. The URL was not opened during validation.
