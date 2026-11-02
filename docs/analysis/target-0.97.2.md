# Reconstruction target: 0.97.2

**Historical target, superseded on 2026-10-18 by [0.100.1](target-0.100.1.md).** This report and its hashes/RVAs describe the preserved 0.97.2 reference. Its dated scope and validation statements are historical; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation and validation status. No 0.100.1 behavior is established by this report.

The October 18 reference is **0.97.2**, verified statically from its embedded version markers and SHA-256. The [identity/refresh record](target-refresh-0.97.2.json) owns the exact locations, context bytes, source-copy provenance and limits.

- Project-local reference: `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, 133,231,104 bytes, PE32+ x86-64.
- SHA-256: `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
- Three exact ASCII `0.97.2` markers occur in picker/version-label and updater contexts; exact ASCII `0.92.0` is absent.
- [REA PE identity evidence](evidence/0.97.2/pe-resources.json): `ev_8e520163bc27eec9974471cac7b2ef44a9e16e73f129d7a9a0682b7ca1ab94d6`. This resource-parser inspection does not establish behavior or rendered parity.

The installed EXE was read and copied into the historical reference archive. The installed folder was not modified. The new reference is versioned separately so existing hash-bound 0.92 extraction scripts still read their original input at `AzerothSurvivors/AzerothSurvivors.exe`. Its hash remains `47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`. The archived 0.91.4 reference also remains historical. New native analysis must select the **0.97.2 path above**; do not reuse old RVAs, layouts or conclusions without new evidence.

## Implementation boundary

The initial retargeting changed metadata/documentation only. The **0.97.2 project baseline and package version** also apply to guardian source recovery. The [guardian checkpoint](guardians-0.97.2.md) records newly recovered source and remaining engine/runtime gaps. Earlier menu source retains its explicit 0.92 origin until revalidated; changing the version is not a parity claim. **This checkpoint records source recovery and static REA; compilation, compiler checks, compiling tests and launches were not performed.**

Home-screen source reconstruction has resumed; the [current checkpoint](home-screen-0.97.2.md) recovers controls/layout/catalogs/languages/scrolling and background interfaces. Animated world loading/compositing and rendered parity remain incomplete. The active fidelity scope remains **main-menu appearance and functionality 1:1**. The new target supersedes the old investigation order: recover the changed menu/data surfaces first, then reconcile still-open 0.92 gaps against the new EXE. World entry and broader gameplay remain outside the active scope.

## Recovery work identified by the supplied notes

The [single readable changelog](../CHANGELOG.md) combines 138 historical version sections with the nine newly supplied releases. These release claims guide investigation; the selected EXE decides actual behavior.

| Surface | Release claims to recover from 0.97.2 | Existing baseline / remaining work |
| --- | --- | --- |
| Main-menu background and Graphics | 0.96.0 adds a drifting 3D view over the selected zone, a Main Menu Background option and black default on phones. | Current option/gate, orbit profiles, camera and cover/particles recovered; animated world loading/compositor remains missing. See [background](main-menu-background-0.97.2.md). |
| Zone picker and Armory Drop Tables | 0.96.0 adds Un'Goro Crater, Scarlet Monastery and Naxxramas; lists scroll and keep the selected zone visible. | Twelve-zone picker catalog/order, unlock limit, list geometry, cached scroll and selected-card adjustment connected. Migration, Drop Tables and rendered interaction remain unverified. |
| Gear and collection data | 0.96.0 adds faction-specific PvP armor/weapons between Epic and Legendary and remaps drops to pairs of zones. | Recover current catalogs, rarity/slot/faction rules and ownership migration; old 415-item tables are historical. |
| Talents, spell pool and text | 0.94–0.95 add Shred, mutually exclusive Cat/Dire Bear capstones, revised talents and starter substitutions. | Recover current nodes, gates, descriptions, icons and starter display from native data/code. Gameplay combat implementation remains outside this task. |
| Languages and fonts | 0.97.0 adds Romanian, Ukrainian and Japanese, Japanese-specific glyphs, accent coverage, language scrolling and CJK class-list layout fixes. | Thirteen exact catalogs, JP/Cyrillic/accent fonts and bounded scrolling selector connected. Storage paths and rendered coverage remain unverified. See [localization](menu-localization-0.97.2.md). |
| Menu actions | 0.95.1 adds second-press confirmation; 0.96.0 limits it to End Run in the pause menu. Quit and end-screen Main Menu act on first press again. | Recover the final action gates/timers. Do not apply the superseded 0.95.1 rule to every action. |
| Addon contract | 0.97.0 adds `AZS_RUN` hero `px`, `py`, `pz`, `pf` on every map, including instances. | Existing chest-position exports belong to 0.92. Recover the current producer/schema before adding an adapter. |

The notes also report DoT hit procs, spell targeting/healing, proc limits, floor/collision recovery, guardian sizes, and browser performance/music/cache/memory fixes. They are recorded in the changelog; this documentation task does not implement them. The Shred necklace bleed described in 0.94 is explicitly removed in 0.95.1. Browser-specific claims require a matching browser artifact/runtime and cannot be verified from this Windows EXE alone.

## Checks and remaining limits

Subsequent asset-recovery task, **2026-10-18**: [asset extraction source and owning report](assets-0.97.2.md) recover 10 embedded fonts, 8 validated PNGs, PE icon resources and 27,717 local MPQ member copies, retaining paths, hashes and four native-loader REA/Ghidra dossiers. Data files were read only inside this checkout and were not refreshed from the installed game. Extraction is implemented tooling, not menu/gameplay parity. The paragraph below records the preceding target-refresh task's validation scope.

The initial target-refresh task verified source stability while reading, byte-identical local copying, SHA-256, PE identity/resource parsing and version-marker contexts. The historical changelog archive is unchanged; the readable document contains 147 distinct version sections and all 138 historical section bodies are preserved. Local links resolve. Locked/offline Cargo metadata accepted the selected target separately from the unchanged package version. No game, Ghidra decompilation, build or application tests were run during that initial metadata task. Subsequent current-target decompilation/source implementation and its limited validation are recorded in the [home-screen checkpoint](home-screen-0.97.2.md). Installed saves, DLLs, MPQs and fonts were not read or refreshed; compatible assets remain a later comparison requirement.

GitHub stays private and source-only; Actions remains disabled and no workflows or build artifacts are authorized. The reference EXEs remain ignored and are not required to compile the source. All 0.97.2 behavior, visual parity and Windows execution remain unverified.
