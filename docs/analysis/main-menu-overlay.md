# Escape Menu and close action — 0.92.0

Target SHA-256: `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
Native `0x140356600` prepares three picker buttons and supplies a420×322 design
(`height =160+54×button_count`); `0x1401c8d40` constructs it with maximum scale1.3.
The source module `menu_overlay.rs` uses that native canvas and the shared panel
helper, rather than a screenshot-estimated fixed rectangle.

The title/description use46/15px, panel padding30×22 and gap12. Buttons have
minimum width240, gap10 and top margin6; each uses17px text, padding22×10,1px
border,4px radius, the shared red gradient and black.85 y2/blur6 shadow.
The native window shade is black sRGBA alpha.55 at global Z400.
[Curated stores and observations](evidence/0.92/menu-overlay-native.json) and
[hash-bound function slices](evidence/0.92/menu-overlay-slices-provenance.json)
retain the owning addresses and REA Evidence IDs.

The original runtime confirms Escape opens Menu. Choosing Options and then Done
returns to the picker directly. Build15 renders the new Menu and its Options
route. Its position and dimensions are close to the original, with approximately
one logical pixel of vertical difference still under comparison. Complete input
priority, hover behavior and pixel parity remain unverified.

The top-right X is a separate utility action: native action tag7 dispatches
through `0x140125b70` to `0x1401266b9`, which sends `AppExit::Success`. It does not
open Menu. The rebuilt X now follows that instruction-proved route. Quit was
not clicked in this validation pass.
