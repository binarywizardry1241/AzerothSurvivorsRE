# Menu localization and font recovery — 0.97.2

The authority is `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This pass used static PE data reads and REA 6.5.0 with Ghidra 12.1.4; it did not
execute the original or rebuilt game. The earlier [0.92 report](main-menu-localization.md)
remains historical evidence for that version.

## Recovered catalogs

The 13 native descriptors at `0x146984f48` have stride 56: code/name/catalog
pointer-length pairs, followed by the CJK flag at +48. Their order is English,
Polski, Deutsch, Português (Brasil), Español, Français, Română, Türkçe, Русский,
Українська, 简体中文, 日本語, 한국어. Every descriptor points to valid UTF-8 JSON
with the same 2,621 keys. Romanian, Ukrainian and Japanese are new relative to
the source's ten-language 0.92 baseline.

[recover-menu-locales.py historical recipe](../SCRIPTS.md#historical-execution-sources)
checks the complete EXE digest before reading those descriptors and reproduces
the source JSON assets. [locales.json](evidence/0.97.2/locales.json) retains
the descriptor addresses, catalog byte ranges and hashes, output hashes, and
exact native function-slice provenance. Source builds embed the recovered JSON;
building does not require the EXE.

The current English catalog shares 2,469 keys with the 2,507-key historical
baseline, removes 38 and adds 152. Removed keys include `menu.new_hero`; old keys
are not silently retained as current target data. The complete difference and
static checks are in [locales-validation.json](evidence/0.97.2/locales-validation.json).

## Native layout and choice behavior

[locales-native.json](evidence/0.97.2/locales-native.json) retains 13 scoped REA
records with Evidence IDs, exact slice hashes, assembly, pseudocode and four
confirmed Node constructions. The important native owners are:

| Owner | Address | Recovered behavior |
| --- | --- | --- |
| Toggle wrapper | `0x1401d8610` | Full-window absolute root, GlobalZIndex 5003 |
| Popup constructor | `0x1402707e0` | Separate bounded lane, panel, heading, scrolling list and scrollbar |
| Choice constructor | `0x1401cb990` | Auto width, horizontal padding 14, vertical padding 7, border 1, radius 4, text 17 |
| Choice handler | `0x1401d8e20` | Close list, skip persistence for the current code, refresh menus/fonts for changed code |
| Loader | `0x145452d80` | Saved code, then LC_ALL / LC_MESSAGES / LANG, ASCII lowercase locale prefix |
| Setter/writer | `0x145453e30` | Set the active index and pass its two-letter code to the file writer |

The outer popup lane is absolute right 16, top 58, bottom 16, column direction
and FlexEnd cross-axis alignment. Its panel has minimum width 200, minimum
height 0, maximum height 100%, padding 8 and row gap 4. The 12-pixel heading has
left/right/top/bottom margins 6/0/2/4. The inner row has minimum height 0 and
column gap 4. The `language-list` viewport has minimum height 0, flex grow 1,
column direction, row gap 4 and vertical Scroll overflow. This bounds the popup
to the window height instead of allowing its 13 choices to extend below it.
The shared scrollbar and shared `Kept` wheel/persistence owner are integrated
through `scrollbar.rs`.

The selected background is sRGBA 0.35/0.10/0.06/0.8; its border is
0.973/0.824/0.416 and text is 1/0.914/0.659. Ordinary choices use black alpha
0.4, border 0.169/0.129/0.071 and text 0.949/0.902/0.788. These are current
target constants, revalidated through the current choice constructor.

The writer receives an exact two-byte code without a newline. The storage
formatter at `0x1454546f0` uses the eight-byte basename `language` and the
embedded `.txt` suffix. Its directory owner `0x145454930` references
WOW_ROGUE_SAVE, APPDATA and XDG_DATA_HOME. The reconstruction retains the shared
BENILLA_HOME/project runtime storage abstraction used by its other menu files;
full original directory-resolution parity was not implemented by this locale
refresh and remains unverified.

## Current font behavior

`0x1401d8cb0` registers three tiny autonym subsets at startup: SC 2,368 bytes,
JP 2,068 bytes and KR 2,060 bytes. They make each CJK language name readable
before that language is selected. The current `0x1401caa50` registers only the
active locale's full font and retains registered byte buffers, rather than
loading both old SC/KR fonts together. The three flagged locale records are
zh, ja and ko. `menu_fonts.rs` follows this sequence.

The exact current base-font table at `0x146a01590` registers Friz, Morpheus and
Skurri. Friz and Morpheus pass through `0x145504c10`, with original bytes retained
on augmentation failure. [locales-font-tables.json](evidence/0.97.2/locales-font-tables.json)
retains native bytes/hashes and decoded records for these tables:

- 27 composite accents at `0x1469ade10`, extending the old rows with Romanian
  breve and comma-below forms. Comma-below mode uses `-0.06 × unitsPerEm − mark.yMax`.
- Two mirrored Ukrainian Є/є forms at `0x1469adfd8`, using the native `0x1247`
  component flags, x translation `xMin + xMax`, x scale -1 and y scale 1.
- Six missing-target Ukrainian donor aliases at `0x1469ae000`.
- The three SC/JP/KR virtual paths and embedded fallback keys at `0x1469add68`.

`font_patch.rs` preserves existing mappings and implements those recovered
composites, mirrors and aliases. SFNT table serialization remains owned standard
encoding; byte-for-byte equivalence to an original runtime font-buffer dump has
not been established.

Users supply compatible binary fonts using `--font-dir` / AZS_FONT_DIR. In
addition to FRIZQT__.TTF, MORPHEUS.TTF and SKURRI.TTF, this version uses
AZS_NAMES_SC.TTF, AZS_NAMES_JP.TTF, AZS_NAMES_KR.TTF, AZS_SC.TTF, AZS_JP.TTF and
AZS_KR.TTF. The optional QA utility `python3 scripts/prepare-reference-menu-fonts.py`
checks the current reference digest and copies nine exact native ranges into
ignored `runtime/menu-fonts-0.97.2`; `--target-version 0.92.0` preserves the old
workflow. Its [textual range manifest](evidence/0.97.2/locales-font-inputs.json)
is tracked. Binary font data remain ignored and are not source deliverables.

## Validation and remaining limits

Static checks passed for all 13 output hashes, 2,621 labels per catalog, equal
key sets, and exact equality of the source's 27 composite / two mirror / six
alias records with the current EXE tables. Rust tests cover locale count/order,
new language labels and indices, comma-below placement and mirrored component
geometry; the parent integration session owns their execution and build result.

No application was launched in this subtask. Full multilingual rendered parity,
all long-label layouts, the original directory-resolution chain, custom
`lang/*.json` overrides and every non-home-screen localized consumer remain
unverified or incomplete. Catalog recovery, source compilation and glyph table
presence alone do not establish main-menu parity.

## Static class-caption follow-up

The parent class-tile wrapper at `0x14008e6b0` calls the actual icon/caption body
`0x140244c40`. REA Evidence
`ev_5bfa3cd7af7cb953084a588d88f12a2b0802a808d40e5d99a7bc7b245c576b7a`
and the exact 2,578-byte slice are retained in
[locales-class-label-native.json](evidence/0.97.2/locales-class-label-native.json).
The caption is 12 pixels and writes TextLayout bytes `00 03` at `0x1402455db`:
Left justification and NoWrap, using the matching Bevy 0.18.1 enum layout. The
source previously left the default wrapping policy enabled; the class-caption
spawn in `picker.rs` now explicitly disables soft wrapping. The same rule covers
CJK captions. No separate locale-specific caption width or wrapping branch was
recovered in this helper, so no such behavior was added.

This final source change was checked only against the original instructions and
for diff whitespace. It was not compiled, tested or executed at this checkpoint. Earlier parent validation does not cover this addition.
