# Mixed-script font consumers

This bounded font portion of **#293** uses installed EXE SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [evidence manifest](evidence/0.127.0/mixed-script-fonts/manifest.json) binds
current code, descriptors, font payloads and three journaled Ghidra results.
[CURRENT-STATE #293](../CURRENT-STATE.md#gap-293) owns the combined source scope;
[verification-needed #293](../verification-needed.md#gap-293) owns execution and
original/rebuilt comparison. Name validation, chat transport and IME input have
separate owners within that finding.

## Native registration and script requests

The current 48-byte records at `1473e5e88` map exactly `zh`, `ja` and `ko` to
`Fonts\AZS_SC.TTF`, `Fonts\AZS_JP.TTF` and `Fonts\AZS_KR.TTF` respectively.
`145cc3390` preserves an available virtual font; a miss copies the matching
embedded payload into that virtual asset. `14028a590` remembers each requested
path, loads/registers its face once and publishes it through both text consumers.

`14029bc00` still registers the tiny SC, JP and KR autonym payloads in that order,
then requests the active locale's full font. The absence of their supply filenames
as native literals does not mean those payloads disappeared. The nine current
font payloads exactly equal the retained 0.109.0 input hashes.

Current `14029b2b0` also gathers displayed text and missing codepoints, converts
the latter to UTF-8 and passes text to **`14027c320`**. That classifier appends each
needed locale once, in first-character order, independently of the UI language:

| Priority | Locale | Inclusive character ranges |
| --- | --- | --- |
| First | Korean | U+1100–11FF, U+3130–318F, U+AC00–D7A3 |
| Second | Japanese | U+3040–30FF, U+31F0–31FF, U+FF66–FF9F |
| Third | Chinese | U+3000–303F, U+3400–4DBF, U+4E00–9FFF, U+F900–FAFF, U+FF00–FFEF |

Japanese half-width kana therefore takes precedence over the overlapping Chinese
full-width range. The selected native classifier supplies no supplementary Han
range. Requested full fonts remain registered after the text or language changes.

## Source connections and glyph identity

`menu_fonts::register_cjk` retains active-locale loading and adds requests from
all custom UI `Text` and `TextSpan` values. It runs after Update and before Bevy's
UI content measurement. The three autonym fonts retain their startup registration.
This connects mixed-language hero, lobby and chat presentation to the existing
custom text font database.

FrameXML has a separate font database. `register_framexml` now supplies the same
full CJK inputs through the existing `FontOverrides` interface, with the recovered
ordered script ranges. The shared text engine opens an explicitly supplied
fallback on the first missing character in its range. A character present in the
requested classic face keeps that face. Without configured embedding fallbacks,
the existing client missing-character behavior remains in force.

A glyph number identifies a glyph **within one font**. The supplied CJK faces map
Latin `m` to glyph78; the classic faces map it to glyph80. A mixed line must carry
the selected font ID through metrics, rasterization, kerning and atlas lookup.
The engine previously keyed raster cells with the requested primary font while
its shaped glyph could carry another font ID. Its primary-cmap early rejection
also prevented the new fallback from being reached. The repair selects a supplied
face before shaping, keys and retrieves atlas cells using the shaped glyph's
actual font ID, and uses that face's metrics and same-face kerning.

All nine current inputs pass SFNT/table/checksum parsing. Their existing Unicode
maps retain distinct Latin mappings for the letters in `empty slot` and
`Rhahk'Zor`; no current input replacement or invented cmap substitution is needed.
The accent augmentation in `font_patch.rs` remains connected for Friz/Morpheus
with its retained glyph and stale-table repair provenance under #135/#250.
This bounded repair does not claim newly recovered full augmentation output.

## Supply and validation limits

Source builds never read the reference EXE and ship no font binaries. Users
supply compatible fonts through **`--font-dir /path/to/Fonts`** or `AZS_FONT_DIR`,
using the nine filenames in the [font supply report](font-inputs.md#runtime-supply).
Classic and FrameXML full-face reads can also resolve the supplied MPQ chain.
The embedding supplies fallback bytes before atlas startup; the private renderer
registers a face when needed. Missing or invalid supplied fonts cannot establish
native glyph coverage and are not replaced with arbitrary operating-system fonts.

`recover-menu-fonts.py --check-contract` verifies all nine current font hashes and
cmaps, the saved native queries and live source connections. **351 original
classifier cases / 24,740 unchanged instructions** cover every range boundary,
Latin, overlapping half-width kana, mixed strings, repeated scripts and unsupported
supplementary characters. The classifier uses preallocated scratch output; font
allocation, database loading, file timing and rendering do not execute.

Authored Rust regressions cover script classification, actual-face cache identity
when glyph numbers match, and supplied CJK fallback preserving Latin in the
primary face. They are uncompiled and unrun. Four changed Rust files pass syntax
parsing. Actual Bevy/FrameXML scheduling, layout, glyph rendering and
original/rebuilt parity remain unverified.
