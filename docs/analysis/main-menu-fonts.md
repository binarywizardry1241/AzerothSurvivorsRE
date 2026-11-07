# Native menu font provider

This report records 0.92.0.

Current mixed-script registration and the FrameXML fallback connection are owned by
[the 0.127.0 font repair](mixed-script-fonts.md). Historical glyph/output
claims below retain their original target and validation limits.

Target SHA-256: `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The font-path initializer alone was insufficient evidence for the correct font data. The native
engine registers embedded Cyrillic Friz, Morpheus and Skurri over those MPQ paths before the
menu loads them. It also synthesizes missing Polish/Turkish glyphs and registers dedicated
Chinese/Korean subsets. Ordinary English 1.12 MPQ fonts therefore do not reproduce the
native multilingual menu, even when their filenames match.

The exact native functions, REA Ghidra Evidence IDs and 21 composite records are retained in
[menu-font-native.json](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.92/menu-font-native.json). Font names/table metadata are
in [menu-font-metadata.json](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.92/menu-font-metadata.json); native copy ranges and
SHA-256 hashes are in [menu-font-inputs.json](evidence/menu-font-inputs.json).

`0x14545c270` registers `Fonts\FRIZQT__.TTF`, `Fonts\MORPHEUS.TTF` and
`Fonts\SKURRI.TTF`. It first calls `0x145459290` for Friz/Morpheus, retaining the original
font if augmentation fails. That transform appends a glyph only when its target character
is absent and the base letter and accent are present. It uses the original outlines, recovered
integer/f32 placement and component flags `0x227`/`0x7`, copies the base advance and sets
the bearing to the composite bounds' xMin. The 21-row table covers ogonek, acute, dot,
breve and cedilla combinations. Existing ó/Ó are preserved. The native helper imports
CRT `roundf`; the owned implementation uses the equivalent f32 round-away-from-zero.

`0x140074f20` always registers the tiny `AzS Names SC` and `AzS Names KR` fonts in
CosmicFontSystem so the autonyms in an English language list are readable. Only Chinese
and Korean locale records have their +48 CJK flag set. Their selection invokes the once-only
`0x140063760`, which obtains the full `Fonts\AZS_SC.TTF` and `Fonts\AZS_KR.TTF` data
and registers both in the font database. The fonts remain registered after switching back.
`0x145459100` supplies those exact virtual-file bytes; `0x1454db010` reads the available
font buffers from its two-entry path table.

The owned `menu_fonts.rs` follows that registration sequence through public Bevy/fontdb APIs.
Its private `font_patch.rs` ports the recovered glyph rules and rebuilds valid TrueType tables.
SFNT directory/cmap serialization is owned standard encoding; the final output bytes have
**not** been compared with an original runtime font-buffer dump. Original glyph identities,
outlines, advances and the recovered new component geometry are preserved. This is not a
claim that every font-file byte is identical.

The [0.121.0 table-filter repair](font-table-filter.md) preserves the
original bytes when augmentation makes no changes. When glyphs or aliases
change, it omits the original `DSIG`, `LTSH`, `VDMX` and `hdmx` tables before
serialization, matching the current native filter. The eight regenerated
tables and other original payloads keep their existing paths. This bounded
source correction does not establish complete generated-font byte or rendering
parity.

## Runtime supply contract

Source builds never read the reference EXE and do not embed font binaries. Users can supply
compatible font data with `--font-dir /path/to/Fonts` or `AZS_FONT_DIR`. The directory uses
these filenames:

| Filename | Native data |
| --- | --- |
| `FRIZQT__.TTF` | Native Cyrillic Friz variant; the recovered augmentation is applied at runtime |
| `MORPHEUS.TTF` | Native Morpheus Cyr variant; augmentation is applied at runtime |
| `SKURRI.TTF` | Native Skurri Cyr variant |
| `AZS_NAMES_SC.TTF` | Exact tiny AzS Names SC autonym subset |
| `AZS_NAMES_KR.TTF` | Exact tiny AzS Names KR autonym subset |
| `AZS_SC.TTF` | Native Noto Sans SC Thin subset |
| `AZS_KR.TTF` | Native Noto Sans KR Thin subset |

The three base paths can fall back to the supplied MPQ chain when a directory file is absent.
That permits compatible data sets but does not promise native Cyrillic/extended coverage from
an English MPQ. No arbitrary substitute or operating-system font is provisioned. Missing or
invalid auxiliary fonts are logged. Binary font data are not repository deliverables.

For isolated reference comparison only, `python3 scripts/prepare-reference-menu-fonts.py`
checks the supplied reference SHA and copies the exact original native font byte ranges to
ignored `runtime/analysis/history/interface/menu-fonts/b488d8153517`. This utility is optional analysis tooling, never a build step.
The resulting files and patched QA outputs remain ignored runtime artifacts.

## Validation and remaining gaps

The recovered component-position/flag unit check passed via project-local rustc. Applying the
owned patch to the exact QA Friz/Morpheus inputs added19 missing glyphs to each; all original
glyph outlines and cmap bindings remained unchanged, both SFNT checksums were valid, and
both fonts parsed through the same read-fonts library used by Bevy. Those checks are retained
in [menu-font-patch-validation.json](evidence/menu-font-patch-validation.json). The supplied native
font maps cover every language-specific catalog codepoint after augmentation; five shared emoji/variation
codepoints are absent from these maps in all locales. Their native rendering route remains unverified.
`scripts/verify-menu-font-patch.py` reproduces these outline/mapping/checksum/coverage checks.

Build14 compiled and rendered the font-directory provider and shared text shadows with no
logged rendering error; the Polish capture now renders accents correctly. The combined bin
test run passed13 focused tests, including the font geometry case, three name cases and two
locale cases. The native-data font route fixes the established build11 MPQ glyph gap.
Rendered coverage for every language, all line breaking and complete native/rebuilt
multilingual comparisons remain pending; this is not a full menu parity claim.
