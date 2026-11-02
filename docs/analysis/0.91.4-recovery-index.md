> Historical snapshot: this index records the earlier 0.91.4 investigation. The active target is now 0.100.1; see the [evidence index](README.md) for current behavior reports.

# Executable gameplay reconstruction

The investigation targets the Azeroth Survivors rules implemented in the EXE, using benilla as an engine reference. All evidence and reproduction tools stay in this repository. No game execution or MPQ inspection was performed.

## Version identity and source roles

- Target: `AzerothSurvivors/AzerothSurvivors.exe`, SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`, 130,840,064 bytes, Windows x64.
- The EXE embeds game version **0.91.4** in updater and version-display contexts. This is separate from its benilla-derived build stamp `v0.2.0-434-g097de76e`.
- The historical source is [`changelog_2026-10-15_1.json`](../../changelog_2026-10-15_1.json). Its 140 messages begin with **v0.19.0** on October 8, 2026 and end with **0.92.0** on October 15, 2026.
- The supplied EXE and newest changelog entry describe different versions. A historical feature statement is a reconstruction requirement to check against the selected build, not proof that this EXE contains it. Preserve later reversals and balance changes when interpreting older entries.
- **The supplied EXE's 0.91.4 behavior** is the reconstruction target. Later 0.92.0 changes are comparison material, not implementation requirements.
- Upstream comparison is pinned to [`samwhosung/benilla@7b608671a65274e0fe330da4a63f12da58162b61`](https://github.com/samwhosung/benilla/tree/7b608671a65274e0fe330da4a63f12da58162b61). The actual fork base remains unverified.

## Recovered material

| Material | Evidence and practical use |
| --- | --- |
| [benilla baseline](benilla-baseline.md) | Separates reusable world/client/UI infrastructure from custom simulation and integration seams. Of 665 embedded crate source paths, 609 occur in the reference tree and 56 do not; 46 are in `wenilla-rogue*`. Path overlap does not prove identical source. |
| [Executable inventory](executable-inventory.md) | PE identity, imports, 46 custom source paths, Rust diagnostic locations, targeted native function addresses, and bounded native assembly with hashes. |
| [Embedded game data](embedded-game-data.md) | Nine class records, 101 class-pool entries, nine zones, 108 enemies, 45 bosses, and a byte-exact 2,491-entry English catalog. Raw record fields remain distinguished from their inferred meaning. |
| [Historical changelog guide](changelog-guide.md) | Normalized release history, embedded 0.91.4 version evidence, superseded rules and subsystem recovery priorities; distinguishes the later 0.92.0 API changes. |
| [Addon API template](evidence/official-addon-api.lua) | Actual readable Lua embedded in the EXE: message parsers, run time/phase, bosses/guardians, cooldowns, buffs, meters and HUD controls. It requires template substitution; native injection and all producer behavior are separate obligations. |
| [Boss assembly manifest](evidence/boss-assembly-manifest.json) | Native boss-arrival comparison and health initialization; includes exact commands, target identity and hashes for the excerpts. |
| [Guardian assembly manifest](evidence/guardian-assembly-manifest.json) | Two linked scalar calculations and their callers, including ratio-preserving health rescaling. Names for untraced state fields remain provisional. |

The MPQ need not be unpacked to recover this content: these rules, tables and text are already in the executable. This does not establish that every gameplay-affecting input is independent of asset or DBC data.

## Reconstruction obligations

| System | Established in this pass | Still required for 1:1 behavior |
| --- | --- | --- |
| Version and engine boundary | Target hash, embedded 0.91.4 identifiers, pinned upstream comparison and custom module leads | Exact fork revision and local changes within inherited crates |
| Classes/content | Class spell-pool membership; zone-to-enemy/boss membership; raw numbers and text | All consuming field layouts, defaults and overrides |
| Run lifecycle | Embedded API phase vocabulary; native phase-gated clock update | Every transition, pause/choice/victory/endless gate, reset and restart path |
| Boss schedule | Native `clock / 60 >= next_boss[64]`, cursor bound five, configured minute thresholds | Every bypass/alternate spawn path and related mode fields |
| Combat/scaling | Native health-scalar inputs and current/max-health initialization; two guardian-linked scalar functions | Named modifiers, damage consumers, armor/shields, targeting, hit rules, procs and RNG |
| Spawning/navigation | Enemy/zone definitions; source and native entry-point leads | Density, wave weighting, outside-view spawning, recycling, stampedes, collision and movement rules |
| Level-up/cards/talents | Card/talent source leads and detailed embedded descriptions | Offer weighting, exclusions, rank effects, costs, prerequisite validation and selection state |
| Loot/equipment/jewelry | Embedded descriptions and content/source leads | Drop probabilities, quality/tier rolls, slots, growth, legendary modifiers and permanent reward writes |
| Meta progression/save | Achievement/perk/talent text and save record-prefix leads | Exact XP/reward thresholds, all record schemas, migration, backup/import and seal behavior |
| Addon interface | Exact extracted 0.91.4 Lua API source template | Injection/substitution, message producers/cadence and version-specific additions |

This is an evidence-backed recovery foundation, not a completed playable reconstruction or a claim of full behavioral parity. Static native code, embedded source, decoded tables, historical descriptions and inference are recorded separately.

## Reproduce

Run from the checkout root:

```sh
python3 scripts/inventory-executable.py --capture-guardian-assembly --capture-boss-assembly
python3 scripts/extract-embedded-game-data.py
python3 scripts/rea-batch.py docs/analysis/native-pass1-plan.json
```

The first two commands re-extract evidence from the original EXE without executing it. The last command runs selected Ghidra operations through `./scripts/rea mcp` in a single session, with project-local seeds and a scoped analyzer profile. Its output directory must be new; choose `--output runtime/<new-run>` on subsequent runs. See [REA usage](../REA.md).
