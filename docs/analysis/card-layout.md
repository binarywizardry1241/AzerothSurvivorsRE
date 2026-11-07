# Card fonts and sizing

Target: `installed-game/AzerothSurvivors.exe`, 140,203,520 bytes, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
The [manifest](evidence/0.108.0/card-layout/manifest.json) binds current PE
owners, instruction/data ranges and five fresh REA/Ghidra evidence records.
[verification-needed](../verification-needed.md) owns current implementation and gap status.

## Revalidated contract and connected source

| Contract | Current native owner | Live source |
| --- | --- | --- |
| Width 252px, height Auto, minimum height 388px | `1401356b0`, stores at `1401360bd..1401360df` | `native_overlays::card_tile` retains width/minimum and no fixed height. |
| Footer width 100%, Auto top margin, horizontal/vertical padding 10/9px | `14023fe40`, `140241d6e..140241fff` | The shared footer retains `UiRect::top(Val::Auto)` and the native padding. |
| Card name uses the supplied ordinary font at 21px | Capture forwarding `140136751..1401367df`, load `14024015f`, clone/stores `140241544..1402416bb` | `card_tile` calls `text` with `heading=false`; that branch uses `art.font`. |
| Plain description uses that font at 14px | `140241bee..140241d24` | The nonempty `card.text` lane uses 14px. |
| Independent highlighted lines use 15px | Current call `140241d60` to `14013abb0`; parent-font stores through `14013b050` | Every `card.lines` entry calls `number_text`, independently of plain-description admission. |
| Every span preserves the font at 15px; numeric RGB `(0.302,1,0.416)`, ordinary RGB `(0.949,0.902,0.788)` | Line call `14013b0b4` to `14024a220`; stop before first spawn at `14024a3e7` | `number_text` explicitly installs its font on both the parent and each `TextSpan`. |

These current contracts agree with the existing shared renderer. No card
behavior change was supported. Source comments now cite the current stores;
the earlier font/height repairs and their evidence retain their
[0.105.0 provenance](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/card-layout-0.105.0.md). Current evidence does not retroactively
validate the earlier executable or every other card property.

The source path serves spell, jewelry, amulet and gold cards. Replacement-tooltip
spans also retain an explicit 15px ordinary font in source; their complete native
tooltip construction/interaction was not revalidated in this bounded pass.

## Discovery and static checks

The current image contains a unique constructor with the packed width252 and
minimum-height388 immediates. Its current call target identifies the content
owner; current content/line calls identify the numeric span constructor. This
discovery does not use an older RVA as proof of current ownership.

Current Node reflection owner `1426553b0` independently pairs the `width`,
`height`, `min_height` and `margin` field names with member offsets 136, 144,
160 and 184. The margin top member is at Node+200. The checker verifies those
instruction/name pairs, current call destinations, complete owner hashes,
referenced PE data and every extract's instruction boundaries. Extracts are
decoded from their declared owner entry, avoiding instruction-shaped bytes
inside another instruction.

The [native cases](evidence/0.108.0/card-layout/native-cases.json) record twelve
passing bounded instruction replays: one frame, one footer, two name-font,
two plain-description, two highlighted-parent and four span cases. Both native
font-handle representations and both span colors are covered. Source checks
trace the shared card, heading selector, independent text lanes, footer and
explicit span fonts. REA used Ghidra 12.1.4; the case record identifies the
Capstone and Unicorn versions actually used.

Reproduce from the checkout, supplying existing project-local Python packages:

```sh
python3 -B scripts/recover-card-layout.py --check \
  --python-libs runtime/tool-state/python/camera/python-libs \
  --python-libs runtime/tool-state/python/armory/python-libs
```

`--prepare` stages five raw-function plans under `runtime/analysis/history/interface/card-layout/a253b785ead7/`.
Run each `*-plan.json` with `python3 -B scripts/rea-batch.py <plan>`, which uses
`./scripts/rea`. `--collect` stages textual extracts and the manifest under
`runtime/analysis/staging/native-evidence/0.108.0/card-layout/`; review them before promotion.
These modes never start REA or the game implicitly. All modes reject a different
installed target, including changed bytes with the same version.

Replay supplies synthetic registers and valid font handles, copies bytes at
explicit memcpy seams and substitutes an empty title-string clone. It stops
before ECS spawning; no native application, allocator, renderer or OS callee
runs. Raw Ghidra imports omit external data/callees and use a generic ABI;
original PE instructions govern the recovered Windows arguments.

Compilation, glyph registration/fallback for every language, actual layout,
localized wrapping, GPU color space, pointer/input and controlled
original/rebuilt visual comparison remain unverified. The source/static
revalidation portion of **#2** is complete; its visual comparison stays open.

## Retained reports

[0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/card-layout-0.105.0.md)
