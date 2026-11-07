# Nameplate layout

The installed EXE has SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
This bounded review covers the Options and health-bar placement path for #303
and the independent release claim [R01310-01](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.0.md#r01310-01).
The summary claim [R01310-00](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.0.md#r01310-00) also includes
separate clock and Skip features.

## Option and consumer

The 152-byte descriptor at `0x14653e430` has page 4 (Combat), storage 0
(CVar), control 7 (value buttons), no indent or linked key, and follows Pet
Damage before Save Combat Log. Its two string-pair choices at `0x14653ad58`
are Stacking / `stack` and Overlapping / `overlap`. The native adapter at
`0x1402608b0` registers the 15-byte key `nameplateLayout` with the five-byte
default `stack`. It reads the applied value, trims Unicode whitespace through
`0x1400ce050`, and writes true only when the remaining seven bytes match
`overlap` exactly. An absent or different value selects stacking.

The setter at `0x1405e2120` stores the flag in byte `0x148a19480`. The
health-bar nameplate pass at `0x1413422b2` reads that same byte after
constructing the desired plate rectangle. The true branch calls
`0x141208890`, which normalizes to the viewport and applies the screen
seat to the desired rectangle. The false branch calls the displacement
solver at `0x1411f3170` with its bucket of already placed rectangles. The
branches rejoin at `0x141342317` for device snapping. Both branches add
the snapped rectangle to the bucket at `0x141342653..0x14134269e`.

The rebuilt Combat page uses its existing saved CVar writer and value-button
control. The plate pass reads that registry and the current frame's pending
Options write, so it seats already visible plates with the new setting without
a reload. The shared seat keeps the viewport and snap behavior in both modes.
The 14 source catalogs include the exact label, tooltip and two choices
recovered from the installed locale descriptors.

## Static evidence

| PE virtual range | SHA-256 |
| --- | --- |
| `0x14653e430..0x14653e4c8` | `aa4a019a93d61493ef649381c98f1e361f48873bad9ca2d218480778a672ea49` |
| `0x14653ad58..0x14653ad98` | `a52157f1130669d68744aef69986104300e73f39de0cba1ffc1a2e014e95145b` |
| `0x1413422b2..0x141342317` | `61c02bb928fc1a5b806feddd4b46fb52400bb994c325992c9fb50f1b9361a6c8` |

The shared Ghidra queue analyzed PE-declared ranges beginning at
`0x1402608b0`, `0x14133fa40`, and `0x141208890`. The selected
Ghidra evidence IDs in the same order are
`ev_048b4f930802ba2c613bcfd9b0c009c4b02ed68d605e1416089a89a7e539f222`,
`ev_0a9ad42113a4935b9d1bbc06f22d30fb0695538db912ed0d7881e6a9291d340b`, and
`ev_6a6f236c2654eb564f3f55e2654183ab70bce245c1019954f074b45ad296a272`.
The placement owner exceeded the tool's inline response budget and was
verified from its exported evidence record. Original instruction bytes
establish the flag address, branch targets and common continuation.
Independent checks compared the connected descriptor, both choices and all 56
localized values with the installed data. Compilation, game execution and
original/rebuilt placement comparison remain open.
