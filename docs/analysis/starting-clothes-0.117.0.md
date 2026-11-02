# Starting clothes, Hidden and starter Showing text — 0.117.0

Target: installed 0.117.0, SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
Finding **#159** was discovered while tracing the children of #120's
[Look viewport](armory-looks-0.117.0.md). The [manifest](evidence/0.117.0/starting-clothes/manifest.json),
[vectors](evidence/0.117.0/starting-clothes/vectors.json) and bounded assembly
extracts retain the current native contracts; [verification-needed](../verification-needed.md)
owns implementation and comparison status.

## Recovered behavior

The current Look body `[0x14031b280,0x14031c5b6)` reads the selected native
paperdoll lane from the class context's nineteen baseline items at `+0x128`.
For a nonzero baseline, it emits **Starting clothes** with an explicit positive
item override. **Hidden** is a separate unconditional explicit zero override;
**Worn** removes the override. The old source emitted just one zero action,
labelling it Starting clothes for selected local slots. It could therefore hide
an item when the baseline appearance was selected.

Context constructor `0x140249b50` selects the actual Hero class/race, calls the
current starter getter `0x145ab5910` and publishes its nineteen items at the
observed context field. Both Armory routes pass that context and selected lane
through the Look parent. Native button construction preserves the action
payload. The Look input branch copies the optional item into the selected lane,
then calls account setter `0x145ac3120` and the existing Gear command boundary.

The current getter/projector preserves exact race/class/slot starter IDs without
ordinary collection ownership, alongside explicit zero and the independently
gated ordinary/cosmetic rows. The source's read/project/backend paths already
allowed these starter IDs, but its frontend `set_look` rejected them. That
admission discrepancy prevented merely adding the missing button from completing
the repair.

For positive starter overrides, current metadata construction resolves
`starter.<id>` with the native English name as fallback. The Showing footer
uses quality-zero RGB `(0.91, 0.91, 0.91)`. The source previously handled only
synthetic gear and earned cosmetics in that footer, so it omitted starter text.

## Source connection

The Armory builder now offers the exact selected baseline item when present and
always offers Hidden independently. A shared baseline-slot lookup supplies the
button and both appearance-admission paths. The setter admits only that exact
race/class/slot starter without adding it to the owned collection. Existing
ordinary-gear and earned-cosmetic admission remains in place.

The positive starter footer uses the existing translated-key/English-fallback
helper with `starter.<id>` and the recovered gray. Existing save records, Gear
commands, backend normalization, outfit resolution, menu previews and gameplay
appearance consumers already retain explicit positive starter IDs. The repair
does not turn cosmetic overrides into equipped statistics or owned loot.

## Static checks and limits

`python3 -B scripts/check-starting-clothes.py` checks 66 metadata records,
72 native/source starter outfits, 5,472 admission cases, 303 action/account/command
cases, 198 localization/fallback cases, 528 faction transformations and the
actual footer-color initializer. Allocation, text/locale services, account/UI
publication and command recording are explicit bounded fixture seams; the
original instruction ranges and current data remain hash-bound.

An authored Rust regression covers the distinct baseline/hidden/worn states
through save writeback and reload. It is uncompiled and unrun. Source tracing
and Rust syntax parsing do not execute the reconstruction. Actual mouse/UI/save
operations, preview/world presentation, language switching, compilation and
controlled original/rebuilt parity remain unverified.

Inventory publication is a separate contract outside this bounded Look repair;
its source/recovery issues belong to [CURRENT-STATE](../CURRENT-STATE.md) and its
execution/comparison status to [verification-needed](../verification-needed.md). The proven footer
does not certify other item-name consumers.
