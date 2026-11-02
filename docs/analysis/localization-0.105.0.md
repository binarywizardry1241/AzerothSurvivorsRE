# Live locale catalogs — 0.105.0

Target: supplied **0.105.0**, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the live locale-data repair within gaps #17/#41.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall reconstruction status.
The live catalogs, lookup and language persistence are now superseded by the
[0.107.0 language report](localization-0.107.0.md); this report retains its
0.105.0 provenance and historical checks.
The [0.100.1 locale/font report](localization-0.100.1.md) and its evidence retain
their historical provenance; current font/native-renderer correspondence is not
established by updating text catalogs.

## Current data and source connection

The live fourteen catalogs had a 0.100.1 base with eleven later Rewards labels
appended, leaving 2,643 keys per language. Their current replacement comes from
the selected EXE's actual embedded JSON: **2,703 English keys** and **2,639 keys
in each of the other thirteen languages**. English gains 66 keys, removes six,
and changes two existing values; every other locale gains two, removes six,
and changes the same two existing keys. The maps intentionally preserve the
native 64 English-only keys; no compatibility translations are added.

Changes include current Demonology names/description templates, the Sapphiron
Frostbolt achievement description, the clarified Backstab capstone, updated
Edwin VanCleef yell and the gamepad hint's stored-level Y control. The six
obsolete literal keys cover the former Backstab wording and former companion
collection/speed/instinct prose. Existing current companion/Rewards translations
are retained at their actual native positions rather than appended separately.
These are data/text changes, not proof of the corresponding gameplay effects.

`localization.rs` continues to include all fourteen `assets/locales/*.json`
files in the selected native language order. Its provenance and parse diagnostic
now identify 0.105.0. Existing Rust assertions now reflect the actual uneven key
sets and the newly present English Demonic Empowerment name; they are updated
source and have not been compiled or executed. Localization, language persistence
and lookup behavior otherwise use their existing source paths.

## Canonical evidence and static checks

[recover-localization.py historical recipe](../SCRIPTS.md#historical-execution-sources)
reuses `embedded_locales` from the current Codex recovery. The canonical fourteen
embedded payload ranges, byte counts, language prefixes and hashes remain in
[Codex validation](evidence/0.105.0/codex/validation.json#L1); no second payload
extract is retained. `--apply` serializes each recovered map as stable UTF-8/LF
JSON. `--check` verifies the latest target/hash, all canonical payload records,
every source key/value, separate serialized-source hashes, and the live language
and include order. English's native payload has CRLF; its LF source hash is
`0ecbe2c0b0326768946ece72d852f642abd20dd42f2e6d6047ee23834d79c80a`,
which is deliberately separate from its embedded hash in the canonical record.

Passed source/static checks:

- [recover-localization.py historical recipe](../SCRIPTS.md#historical-execution-sources): all fourteen full maps.
- `python3 -B scripts/recover-run-stats.py --check`: 73 localized literals,
  exact current character-pane Lua and 42 feed fields.
- `python3 -B scripts/recover-balance-catalog.py --check`: current class,
  ability/talent definitions and connected Demonic Empowerment picker tooltip.
- Project rustfmt parsed `localization.rs` without compilation or source mutation;
  `git diff --check` passed.

Historical locale output hashes remain historical and no longer describe these
live asset paths. The 0.92 Codex and 0.97.2/0.100.1 prose extractors read those
paths as locale inputs; reproducing their historical localized outputs requires
matching historical input catalogs, not these current maps. They were not rerun
or relabeled. The historical locale recovery commands also overwrite the live
paths and evidence, so they are not current validation commands. Current Codex
recovery reads current embedded maps directly and is independent of these live
asset files.

No compilation, Rust test execution, game launch, language-switch interaction,
font/glyph coverage, clipping/wrapping or original/rebuilt comparison ran. Current
text data does not close full menu/interface localization or presentation parity.
