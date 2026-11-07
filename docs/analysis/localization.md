# Locale state, parser and overrides

Installed target SHA-256 `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This current #17 recovery revalidates the behavioral contracts described in the
[historical 0.108.0 report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/localization-0.108.0.md). The separate
[catalog report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.109.0.md) owns all fourteen current embedded
payloads. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall implementation and
runtime limits.

The selected EXE preserves exact case-sensitive two-byte selection, English
fallback after a missing selected-language key, and successful empty values.
Startup prefers a trimmed supported `language.txt`, then the first nonempty
Unicode `LC_ALL`, `LC_MESSAGES` or `LANG` value, ASCII-lowercasing its prefix up
to `-`, `_` or `.`; an unsupported first value selects English. Language
selection writes its canonical code even when unchanged.

Lazy initialization traverses all fourteen current 56-byte descriptors at
`146ecf758`. Each embedded map receives executable-parent `lang/<code>.json`
entries, followed by save-data-directory entries. Equal roots are retained.
Read errors contribute nothing; a malformed file contributes no prefix entries
and prints a diagnostic. Later entries overwrite equal keys, including empty
strings; omitted embedded keys survive. The shared save-data path contract has
one canonical current [extract](evidence/saves-browser/data-directory.asm).

The custom flat string-object parser retains its permissive native behavior:
repeated initial BOM, raw string controls, trailing text after the closing
brace, `+` in a four-byte Unicode field and masking a following surrogate field.
It filters underscore-prefixed keys, accepts empty keys/values, and rejects an
entire malformed file. Structural whitespace, escape errors and LF-based line
counts remain as documented by the historical report and current fixtures.

Current owners include lookup `1458ec500`, selection `1458ec750`, startup
`1458ecea0`, persistence `1458edf70`, loader `1458eb8a0`, parser `1458ed780`,
string `1458e96e0`, expect `1458e94d0`, hex `1458e9020`, lazy callback
`1458e89d0`, initializer `1459d19a0`, and native map insertion `1459a13c0`.
The [manifest](evidence/localization/manifest.json) binds their exact
current ranges and current Ghidra queries. The
[address map](evidence/localization/address-map.json) records independent
instruction/operand comparison for twenty-two historical/current owner pairs:
registers, instruction layout, scalar immediates and structure offsets agree;
calls and RIP-relative data are independently rebound. This is not a blanket
version offset or a historical-target fallback.

`localization.rs` and `localization/catalogs.rs` already implement these current
contracts; only provenance and the parser regression's current fixture reference
needed updating. Language maps load before menu art; dynamic selection reapplies
a fresh source catalog with English fallback. [Font supply](menu-fonts.md)
owns the repaired engine-atlas initialization order and current CJK selection.

`python3 -B scripts/recover-localization.py --check` passes **204 original
instruction cases**:129 selection/startup/persistence/lookup,63 parser/string/
expect/hex and12 loader/initializer/map cases. It shares checked historical
fixture algorithms through explicit AST address rebinding; every executed native
body is from the installed current PE. Retained fixture source hashes prevent
silent fixture drift. The actual current callback and worker traverse fourteen
descriptors; native HashMap insertion separately executes overwrite/new-key/
empty-value stores. All results are in the
[current vectors](evidence/localization/native-vectors.json).

File/environment/path results, Unicode trim, allocation/copy, hashing/byte
comparison, parser results used by the loader, map storage and diagnostics have
explicit host seams. The native parser executes separately. Ghidra raw imports
omit external memory/callees and infer a generic ABI; original operands govern.
No compilation, Rust regression execution, OS file/environment operations,
Bevy scheduling, rendering, game or original/rebuilt comparison was performed.

## Retained reports

[0.108.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/localization-0.108.0.md) · [0.107.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/localization-0.107.0.md) · [0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/localization-0.105.0.md) · [0.100.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/localization-0.100.1.md)
