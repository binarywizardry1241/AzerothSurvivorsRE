# Language lookup and persistence — 0.107.0

Target: installed **0.107.0**, SHA-256
`92eaef3bc806144860ca838660286c02b66f9d7bbee0771f1f07a628209e9f7a`.
This report owns the language-data, fallback and persistence source repair within
**#17**. [verification-needed](../verification-needed.md#gap-17) retains the menu
execution and parity requirements; #41 retains complete native/dependency ownership. Earlier
[locale](localization-0.105.0.md), [Codex](codex-0.105.0.md) and
[font](localization-0.100.1.md) evidence keeps its actual target provenance.

## Recovered native contracts

The current table at `0x146e93b88` contains fourteen 56-byte records with
code/name/catalog pointer-length pairs and the CJK flag. Its order remains
English, Polish, Czech, German, Brazilian Portuguese, Spanish, French, Romanian,
Turkish, Russian, Ukrainian, Simplified Chinese, Japanese and Korean. The exact
current maps contain **2,773 English keys** and **2,683 keys per other language**.
Compared with the prior live 0.105.0 maps, English adds 70 keys and every other
language adds 44; no existing key is removed or its value changed. The native
90 English-only keys are retained without invented translations. New text is
principally raid mechanic names, warnings and instructions; text presence does
not implement those mechanics (#42/#43).

| Native owner | Contract |
| --- | --- |
| `1458be720..1458be96a` | Look in the selected locale map, then English. An existing empty translation is a successful lookup and does not fall back. Missing from both returns no value. |
| `1458be970..1458beac7` | Exact, case-sensitive two-byte codes select indices 0–13; unsupported codes select English. |
| `1458bf0c0..1458bf838` | Read the saved language through the game save-file helper. Trim it and accept only a supported exact code. Otherwise inspect `LC_ALL`, `LC_MESSAGES`, then `LANG`; the first nonempty Unicode value wins. Split on `-`, `_` or `.`, lowercase ASCII and accept the supported prefix. An unrecognized higher-priority value yields English instead of consulting the next variable. |
| `1458c0150..1458c0197` | Select immediately, then persist the canonical two-byte code through the `language` file key. Selecting the already active language still reaches the writer. |
| `1458d0c40..1458d0e28` | Use the parent of `WOW_ROGUE_SAVE`, otherwise the existing APPDATA/XDG_DATA_HOME/HOME save-data route. This is independent of engine configuration. |
| `1458d1c90..1458d1de5`, `1458d0a00..1458d0b73` | Read/create the save-data file using the common `{key}.txt` filename formatter. The language path is therefore `language.txt` beside the active save, not under `BENILLA_HOME`. |

The [manifest](evidence/0.107.0/localization/manifest.json) binds the complete
table, payloads, native intervals and filename literals. Source assets preserve
the exact JSON text apart from CRLF-to-LF normalization, with separate embedded
and source hashes. Assembly is retained once per interval in the same directory.
[REA identities](evidence/0.107.0/localization/rea.json) bind four scoped Ghidra
queries. Raw imports omit external memory/callees, use a generic ABI and can
truncate pseudocode; the original PE instructions and Windows registers govern
the contracts above. These queries are not full native ownership or runtime
observations.

## Connected source repair

`localization.rs` now loads all fourteen current catalogs. Its page-facing
`MenuCatalog.labels` starts with English and overlays the selected map. The
prior replacement with only the selected map lost English fallback for callers
of `MenuCatalog::label`, even though `Localization::lookup` already supplied it.
For example, a non-English page asking for
`ability.demonic_empowerment.name` now receives `Demonic Empowerment` rather
than the untranslated key. Race descriptions and zone enemy/boss fields also
use the shared lookup. A language switch still rebuilds from canonical source
definitions, preserving the lookup keys across repeated switches.

Language load/save now obtains the shared game save-data directory from
`save::native_base_directory()`. Previously it used `BENILLA_HOME`, or a fixed
`runtime/menu-state` fallback. A custom save path therefore no longer reads or
writes an unrelated engine configuration account. The existing launcher pins
both locations to the same isolated directory, so this defect was hidden in
that launch path. If the native save-directory route is unavailable, language
selection remains usable without a persistence path. Native behavior supplies
no migration from the reconstruction's incorrect former directory.

Existing Rust assertions now use current counts, cover the page-facing fallback,
and keep language fixtures free of a player-state path. These assertions are
updated source; they have **not been compiled or run**.

## Static checks and remaining limits

[recover-localization.py historical recipe](../SCRIPTS.md#historical-execution-sources) verifies the installed
target, all fourteen full descriptor/catalog records, embedded/source hashes,
live source connections and **129 bounded original-instruction cases**:

- 21 exact/unsupported language-code selections.
- 35 startup cases, including every saved code and every uppercase environment
  prefix, saved-file precedence, trimming, empty variables and invalid priority.
- 17 persistence cases, including canonical English output for invalid codes.
- 56 lookup cases across all fourteen language indices: selected hit, English
  fallback, empty translation and missing from both maps.

The [vectors](evidence/0.107.0/localization/native-vectors.json) declare the
file/environment, Rust whitespace trim, allocation/copy, hash and comparison
fixture seams. Lookup uses synthetic native-layout hash buckets; it verifies
native probing/fallback branches, not the real platform hash implementation or
JSON parser. File-helper and save-directory assembly is source-traced; these
helpers, real filesystem writes and OS environment functions are not executed.
No target application, network or player state is touched. Python parsing,
Rustfmt source parsing and `git diff --check` also pass without compilation.

External `lang/*.json` override loading and its parser/error ownership remain
unrecovered in the current source. Complete popup construction/input/scrolling,
font-switch/glyph coverage, shared engine translation consumers, other secondary
pages, audio/preview behavior and other persistence contracts remain open.
Compilation, Rust tests, language-switch/file interaction, rendered comparison
and original/rebuilt parity were **not run**. This bounded source repair does
not close #17 or #41.
