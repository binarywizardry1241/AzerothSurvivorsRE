# Reconstruction target: 0.105.0

Historical target record: the project EXE/MPQ copies below have been removed.
Inputs now come directly from the configured installed game, where 0.107.0 has
been discovered but awaits its full coverage refresh. Preserve this report's
0.105.0 hashes and original paths as provenance; see
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) and the [current input workflow](reconstruction-coverage.md).

The reconstruction baseline and package version are **0.105.0**. The
[identity and file manifest](target-refresh-0.105.0.json) records the selected
EXE, three embedded version markers, PE identity, archive hashes and limits.
[CURRENT-STATE](../CURRENT-STATE.md) owns remaining source/recovery issues;
[verification-needed](../verification-needed.md) owns execution/comparison status.

## Reference inputs

- EXE: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, **139,892,736 bytes**,
  PE32+ AMD64, image base `0x140000000`.
- SHA-256: `8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
- Data: `AzerothSurvivors/Data`, **eight MPQs / 1,641,903,179 bytes**:
  `patch.MPQ` and `patch-2.MPQ` through `patch-8.MPQ`.
- [REA static PE evidence](evidence/0.105.0/pe-resources.json):
  `ev_0a54b743d0a398bb0f1913eb4fcc0e8f5391ab7ede0ffb3078dfe31fcc499300`.

The EXE and MPQs were copied from the supplied installed game on 2026-10-20.
Every destination matches its source SHA-256; source files stayed stable while
being read. The installed source folder was not modified. No other installed
assets, saves, configuration, DLLs or fonts were refreshed.

The four older game EXEs (0.91.4, 0.92.0, 0.97.2 and 0.100.1) and six former
project MPQs were removed. Only the versioned 0.105.0 game EXE remains; no
unversioned executable alias points historical recovery scripts at a new target.
Ghidra's bundled Windows tools remain installed analysis components.

The existing run helper selects `AzerothSurvivors/Data` through `WOW_DATA`.
Direct launches accept `--data-dir /path/to/Data` or `WOW_DATA`; see the
[README](../../README.md). Inputs remain local and ignored, and building source
requires neither the EXE nor MPQs.

## Recovery boundary

This refresh replaces reference inputs and updates package metadata. Existing
source, catalogs, menu footer, byte ranges, addresses and fixtures retain their
0.100.1 or older provenance unless separately revalidated. Current
[mob movement publication](mob-movement-0.105.0.md) now has its own hash-bound
owners and 44 passing native instruction cases; its source fixture was refreshed.
That bounded check does not revalidate AI, navigation or cache production.
A package version change does not revalidate other behavior.
Historical textual evidence and recovery scripts remain useful; regenerating
their extracts requires the exact former input, which is no longer present.
Do not redirect old scripts or native addresses to 0.105.0 without revalidation.

The [original-game changelog](../CHANGELOG.md) contains all nine newly supplied
release sections from 0.101.0 through 0.105.0, preserving previous release bodies
and the historical JSON archive. These notes guide recovery and are not proof
of implemented features or native parity:

| Releases | Recovery leads |
| --- | --- |
| 0.101.0–0.102.0 | Newer client rendering/chat/loading/font/audio behavior, Lua 5.0 compatibility, CJK text, stored-level bindings and addon summary/guardian-flag APIs. |
| 0.102.1–0.102.3 | Browser save export/site handling and zone-unlock migration. Browser claims need the matching artifact/runtime. |
| 0.103.0–0.103.1 | Boss voices, unsaved Rewards confirmation, Shadow Dance replacement, boss sizes, achievement/companion additions, companion sweeping, Shadow Weaving and addon memory limit removal. |
| 0.104.0–0.105.0 | Demonology replacement/migration, demons and targeting, Empowerment/Medallion caps, new talents and echoes, missiles, damage/healing attribution, totem limits, run-summary damage, class-proc addon fields and Scarlet Monastery camera correction. |

The reference-input refresh performed only static PE/version inspection and
file-copy/hash verification; the subsequent bounded movement recovery is linked
above. No compilation, builds, compile-based tests, application launches,
archive-content compatibility checks or original/rebuilt comparisons were run. Previous MPQ
floor/navigation caches, captures and validation remain tied to the earlier
inputs; compatibility with this refreshed chain is unverified.
