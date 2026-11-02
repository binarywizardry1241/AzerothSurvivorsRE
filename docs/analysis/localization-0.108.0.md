# Locale overrides and language state — 0.108.0

**Historical behavioral target:** the native contracts and results below remain bound to 0.108.0. [0.109.0 recovery](localization-0.109.0.md) now owns their current revalidation and the [catalog refresh](locale-catalogs-0.109.0.md) owns embedded source data; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation limits.

Target: installed **0.108.0**, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
This report owns the external catalog source repair and bounded language-state
revalidation within **#17**. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) retain the
other menu and parity requirements; #41 retains complete native/dependency
ownership. Earlier [0.107.0 recovery](localization-0.107.0.md) keeps its original
target and results.

## Native contracts

The current descriptor table at `146e95450` contains fourteen 56-byte records,
in the existing language order. All embedded payloads match the source assets
after CRLF-to-LF normalization: **2,773 English keys**, **2,683 per other language**.
No translation asset changes are needed. The
[descriptor/range manifest](evidence/0.108.0/localization/manifest.json) binds
their full pointer/length records and hashes independently of older addresses.

| Current owner | Recovered contract |
| --- | --- |
| `1458e5790..1458e59d3` | Lazy catalog access, selected-locale lookup, then English fallback; an empty translation remains a successful hit. |
| `1458e59e0..1458e5b37` | Exact case-sensitive two-byte selection; unsupported codes select English. |
| `1458e6130..1458e68e8` | Prefer a trimmed supported saved code, otherwise the first nonempty Unicode LC_ALL/LC_MESSAGES/LANG prefix, split at `-`, `_` or `.` and ASCII-lowercased. An unsupported first value yields English. |
| `1458e7200..1458e7247` | Select immediately, then write the canonical code using the save-data `language.txt` helper, even when the selection is unchanged. |
| `1458e1c60..1458e1d1b`, `1459caea0..1459cb26c` | Initialize fourteen maps from the embedded parser results, then insert external entries into each same map. |
| `1458e4b30..1458e527e` | Read each language's executable-directory override, then its save-data-directory override. Read failures are ignored; parser failures print diagnostics and discard that file's entries. |
| `1458e6a10..1458e70ae` | Parse the custom flat string object, preserving successful entries and filtering underscore-prefixed metadata keys. A parse failure rejects the whole file. |
| `1458e2970..1458e31ae`, `1458e2760..1458e292e`, `1458e22b0..1458e2754` | String escapes, expected bytes and four-byte Unicode fields, including native error text/line counting. |

The [loader manifest](evidence/0.108.0/localization-overrides/loader-manifest.json)
also binds the current lazy thunk/vtable, Windows executable-path producer,
path helpers, UTF-8 reader and map insertion. The Windows producer reaches
`GetModuleFileNameW`; no current-working-directory override root is added.
The save-directory helper is shared with the language file and existing
`save::native_base_directory()` route.

## External file and parser behavior

For every supported code, the loader reads `<executable parent>/lang/<code>.json`,
then `<save-data directory>/lang/<code>.json`. It retains both roots even when
they are equal. Valid entries merge over the built-in catalog in file order,
with the save-data entry winning duplicate keys. Omitted keys remain embedded;
unknown keys and empty values are admitted. An empty object makes no change.
Unreadable/non-UTF-8 files are ignored. A malformed file contributes no prefix
entries and prints `<path>: <parser error>` to stderr; the next root still runs.

The native parser differs from general JSON parsing:

- It strips repeated leading U+FEFF characters **before** ASCII whitespace.
  Only space, tab, LF and CR are structural whitespace.
- It requires a flat object with string keys and values, including metadata
  values. Keys beginning `_` are filtered after parsing; duplicate keys use
  their last value. Empty keys/values are valid.
- It returns at the closing brace and ignores trailing input. Trailing commas,
  non-string values and malformed escapes fail the whole file.
- Strings accept raw control bytes and the usual JSON escapes. Four-byte
  `\u` fields use the native radix parser, including its leading `+` acceptance.
  Lone surrogates become U+FFFD; a high surrogate followed by `\u` consumes
  the next field and masks its low ten bits without requiring a low surrogate.
- Diagnostics preserve `line N: expected …`, `bad escape`, `bad \u escape`
  and `unterminated string`, counting LF bytes up to the native cursor.

The supplied 0.78.0 claim says files replace the built-in words; the selected
EXE's per-key merge controls this implementation. No whole-map replacement or
invented hot reload is introduced.

## Live source and static verification

`localization/catalogs.rs` implements these loader/parser contracts.
`Localization::default` calls it using the same save directory as
`language.txt`; `LocalizationPlugin` applies the resulting maps before menu
art loads. Selecting a language reuses those loaded maps. The existing
`lookup`, page-facing English overlay, race/zone consumers and keyed menu text
therefore receive overrides through the actual application resource.
Test-only English construction remains independent of external files.

The following non-compiling commands pass against the selected EXE:

```sh
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/native_localization.py --sha256 44134ff89844c83be6f4bba1f736ec6f5875877be3749b1fbd56ad98c0b60d29
python3 -B scripts/recover-locale-overrides.py --check
python3 -B scripts/recover-locale-parser.py --check
```

They retain **204 bounded original-instruction cases**: 129 language-state
cases, 12 loader/initializer/map cases and 63 parser cases. The
[language vectors](evidence/0.108.0/localization/native-vectors.json),
[loader vectors](evidence/0.108.0/localization-overrides/loader-vectors.json) and
[parser vectors](evidence/0.108.0/localization-overrides/parser-vectors.json)
record their exact scope. Parser cases include every truncation boundary of a
surrogate-pair string, controls, metadata, duplicate/empty keys, BOM placement,
non-string values, invalid escapes, native permissive Unicode and error lines.
The real callback/worker traverses all fourteen native descriptors with
synthetic file/parser/map results; a separate native insertion probe checks
overwrite/new-key/empty-value stores. Original parser/string/expect/hex bodies
execute independently with allocation/vector/UTF-8-validation/format seams.

REA/Ghidra raw-range queries and canonical extracts are linked from the
[extract index](evidence/0.108.0/localization-overrides/extracts.json).
Raw imports omit external memory/callees and infer a generic ABI; original PE
instructions govern the Windows registers and operands. The original process
is never launched. OS path/file/environment calls, native hashing/allocation,
Bevy scheduling and rebuilt Rust do not execute in these checks. Current
source is traced to the native contracts; the Rust regression that consumes
the parser fixtures is added but **not compiled or run**.

Rustfmt parses both changed modules, Python source parsing and
`git diff --check` pass, and the current coverage accounting is consistent with
open work. No compilation, game, real filesystem language interaction, popup,
font/rendering/audio/platform or original/rebuilt comparison was run. Complete
translation consumers, native initialization/platform dependencies, other
secondary pages and UI parity remain open under #17/#41.
