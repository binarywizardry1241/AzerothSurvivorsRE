# Amulet replacement confirmation

Finding **#18**. Target SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`,
146,721,280 bytes. Current implementation status belongs to
[CURRENT-STATE](../CURRENT-STATE.md) and the same permanent finding in
[verification-needed](../verification-needed.md).

The frontend opens a separate confirmation before accepting an amulet that
replaces the currently worn one. It compares both supplied items, explains the
permanent loss, and offers **Cancel / Esc** and **Confirm / Enter**. Acceptance
uses the existing ordinary selection command; it adds no protocol field or
backend confirmation transaction. Same-identity empowerment and equipping an
amulet into an empty slot retain ordinary selection.

## Native state and input

The [contract](evidence/0.127.0/amulet-confirmation/contract.json) binds fourteen
completed Ghidra queries to exact original-VA raw slices of this installed PE.
Their immutable result receipts, input plans and query journals remain under
the shared analysis storage. Raw imports omit external constants/callees and
use a generic ABI; the original PE's Win64 instructions govern argument and
field interpretation.

| Owner | Recovered contract |
| --- | --- |
| `1402844c0` / `1400c85e0` | The amulet parser's optional worn-item record begins at Card `+0xa8`; absence has capacity `-1`. The choices mapper records presence, including an empty string. Existing `replaces`, `replacesText`, `replacesIcon`, `replacesRarity` and `replacesRank` carry the comparison. |
| `140291630` | Ordinary pointer selection waits for the existing 0.45-second gate. A marked slot stores pending tag `+16`, slot `+24` and clock `+32`, without Select or closing. Existing pending blocks every ordinary pointer action. |
| `14028fab0` | Ordinary digit selection has the same pending branch. The final R branch reads the original snapshot after a newly selected digit, preserving Digit+R command ordering. A pending state present at entry blocks the ordinary keyboard handler. |
| `14028e9d0` | The modal requires pending tag exactly 1. Enter `58`, then numpad Enter `102`, can accept. The shared Escape request cancels. Typing suppresses keyboard lookup only. Pointer action 0 accepts, 1 cancels and 2 represents no action. There is no age or pause test in this handler. |
| `14028ff30` | A newly admitted choices revision clears pending and selected state. An already accepted card retains its separate 0.32-second exit gate. |
| `14028eef0` | Modal roots are keyed to the pending slot. A matching existing root is retained; obsolete roots are retired. The source payload and optional worn record are necessary before constructing a new root. |

Within the modal handler, keyboard decisions precede the pointer result.
Uncaptured Escape cancels even with Enter or a clicked Confirm. Otherwise Enter
or numpad Enter accepts even with a clicked Cancel. Captured typing leaves the
pointer action effective. Confirm clears pending, emits command **2** with the
captured slot and starts the ordinary selected-card exit immediately. Cancel
only clears pending; it does not replace the offer or reset its opening clock.
An outside click has no confirmation action.

Current AS registration `140286990..140287973` constructs keyboard, pointer and
modal systems through the same `145045b90` path, then packs seven configurations.
Their construction sequence establishes no explicit execution order. The final
vtable `14626b5a8` belongs to a generic SystemTypeSet: current 110-byte formatter
`140260bd0` names the shipped `SystemTypeSet` literal at `146271be8`. It does not
establish an AS pause predicate. Recovery stops at this generic scheduling
boundary. The source registers modal controls independently within captured
input / pre-tick bounds, with no relative edge against ordinary controls.
Pending is evaluated at each handler's own entry. A new pending slot and Enter,
or Cancel and a digit/R, can therefore depend on handler order; the source adds
no intrinsic extra-frame delay or whole-pass pending snapshot.

## Presentation and source connection

`140342530` and `140280f40` construct the shell/content, `140340930` orders the
worn/new comparison, `140282120` / `140340d00` render each item, and
`140283370` / `140341e70` construct the footer buttons. Current Node serializer
`142894130` independently identifies width `+136`, padding `+216`, border
`+248`, radius `+280`, row gap `+320` and column gap `+328`.

The modal has GlobalZ **6060**, a black **0.62** backdrop, and the existing
**1280×760**, maximum-scale **1.35** canvas. Its panel is **660** pixels wide
with left/right/top/bottom padding **28/28/22/24** and a 12-pixel row gap.
The current common panel helper `1402180e0` supplies its 1-pixel border,
10-pixel radius and existing panel colors/gradient/shadow.

The **250**-pixel comparison tiles preserve rarity colors, a 2-pixel border,
12-pixel radius, **14/14/12/14** padding, 6-pixel row gap and **64**-pixel
item icons. Their tags are 11 pixels, names 18, ranks 12 and numeric lines 15.
The worn tile uses the border palette at alpha 0.8 and icon alpha 0.7; the new
tile uses the text palette and its rarity-colored alpha-0.35 glow with 22-pixel
blur and 1-pixel spread. Both retain the native three-stop background gradient.
The gold separator is 40 pixels. The panel uses the body and heading font
handles already supplied to native Cards: AMULET 12, title 34, warning 15.
Footer buttons have **minimum width 150**, label 17 and key hint 11.
Their key badges retain the 5-pixel horizontal inset, 1-pixel border and
3-pixel radius in the current footer-content constructor.
The existing real MPQ icons and fonts remain the source of their artwork.

`native_overlays::confirmation` renders that hierarchy from the actual
presented Card snapshot. `ChoicePresentation` owns pending state independently
of closing. Local and guest routes share an independent modal decision system,
while ordinary controls retain their existing pause restrictions. On-top
FrameXML pointer capture gates pointer actions; keyboard handling retains its
own native typing gate. Pause leaves Escape available to a pending modal.
Tooltip roots retire while the modal is active.

Local replacement detection and payload production share `replaced_amulet`.
Existing reward generation, descriptions and inventory mutation retain their
[treasure pipeline provenance](treasure-pipeline.md).
Guests use the existing string-valued replacement carrier and send the normal
selection control only after acceptance. An absent/terminal run retires pending
presentation. Guest bootstrap preserves an authoritative newer Choices payload
while retiring the old modal. Offer revision checks also run before loading
can skip ordinary input; source existence is checked before modal root reuse.

The [locale proof](evidence/0.127.0/amulet-confirmation/locales.json) retains
three exact entries from each of fourteen hash-bound embedded catalogs:
Cancel, the replacement title and the permanent-loss warning. Existing item
names, AMULET, WORN NOW, NEW, Confirm and loss/rank strings are reused.

## Checks and limits

```sh
python3 -B scripts/recover-treasure-interface.py --check-confirmation \
  docs/analysis/evidence/0.127.0/amulet-confirmation/contract.json
```

The checker verifies all fourteen original-slice query receipts and native
ranges, replays **144** original modal decision cases with synthetic key-set
and command-enqueue interfaces, checks **4** optional-record presence cases
and **42** locale entries, and guards the connected source paths. The cases
cover both Enter aliases, Escape, typing, all pointer outcomes, their
simultaneous precedence, captured slot preservation and exact exit-clock writes.
No external native callee is executed. Separately, seven changed Rust files
passed syntax parsing through rustfmt/stdin; Python AST and diff whitespace
checks passed.

Five source regressions were added for cancellation preserving the offer and
opening clock, on-top pointer capture preserving immediate Enter admission,
retiring an old guest modal without discarding a fresh pre-bootstrap pick, and
both admitted handler orders for new-pending+Enter and Cancel+digit.
They were syntax-parsed but remain unexecuted because they require compilation.

Compilation, actual input scheduling, rendering/layout, save/session effects,
local/host/guest gameplay and original/rebuilt parity remain unrun. Scalar
instruction replay and source syntax parsing do not establish those tiers.
