# benilla baseline for executable analysis

> Historical analysis of **0.91.4**, preserved as `AzerothSurvivors/AzerothSurvivors-0.91.4.exe` (SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`). The current target is **0.97.2**; this report remains bound to 0.91.4 and has not been revalidated against the new target. See [current target provenance](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/target-refresh-0.97.2.json) and the [historical 0.92 refresh](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/target-refresh-0.92.json).

Comparison snapshot: [`samwhosung/benilla@7b608671a65274e0fe330da4a63f12da58162b61`](https://github.com/samwhosung/benilla/tree/7b608671a65274e0fe330da4a63f12da58162b61), resolved from `main` on 2026-10-15. GitHub reports the commit date as `2026-10-15T18:54:27Z`. This snapshot establishes an upstream reference, **not the revision from which the game was built**.

Target: `AzerothSurvivors/AzerothSurvivors.exe`, SHA-256 `719da61487e0ffaf6491a1ca65410a6666028e83271f059692ad46bc4d8af150`. No target execution or MPQ inspection was performed for this baseline. [Machine-readable provenance](benilla-baseline-provenance.json) records source URLs, hashes, source ranges, and target file offsets.

## Reusable architecture

The upstream separates the world engine from the WoW client. `benilla-world` supplies rendering, world streaming, collision, animation, and frame scheduling; `benilla-ui` supplies the Lua/FrameXML interface core; `benilla-protocol` supplies auth and network messages. `benilla-app` composes these with the client. This provides a useful starting boundary for recovering game-specific rules without repeating asset-format or renderer work. [Upstream crate map, lines 9–27](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/docs/MAP.md#L9-L27).

The app installs `WorldPlugins`, then `GamePlugins`; the latter includes the player, network bridge, entity presentation, spells, targeting, and UI. Its name refers to the upstream WoW client layer; it does not identify the Survivor simulation. [App composition, lines 415–430](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla-app/src/lib.rs#L415-L430), [client plugin chain, lines 104–160](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla-app/src/game_plugins.rs#L104-L160).

The intended extension entry point is `benilla_app::run_with(build, extend)`. It exposes read-only streamed `Objects` and an `Interact` handle, then calls the extension closure after constructing the app. The upstream example adds a Bevy plugin through that closure. These are promising reconstruction seams, but the target's implementation still requires native confirmation. [Public API, lines 194–225](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla-app/src/lib.rs#L194-L225), [extension invocation, lines 457–460](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla-app/src/lib.rs#L457-L460), [example, lines 72–86](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla-app/examples/extended_launcher.rs#L72-L86).

Upstream receives session events and converts them into ECS entities before input. Its exported `Objects` API reads descriptor fields and looks up the player by GUID/entity. The target's `wenilla-rogue/src/server.rs`, `driver.rs`, `proto.rs`, and extra local transport paths make the boundary between a local simulation and this existing client bridge a high-priority REA target. Their filenames alone do not establish the mechanism. [Network bridge, lines 1–7](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla-app/src/net.rs#L1-L7), [object access, lines 548–588](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla-app/src/net.rs#L548-L588).

## Target-specific surface

A direct byte scan found **665 unique Rust source paths** of the form `crates/<crate>/src/<path>.rs` in the executable. **609** exist in the pinned upstream tree and **56** do not. Of the latter, **46** belong to the two `wenilla-rogue*` crates. Every absent path and its raw file offsets is preserved in the provenance JSON. Path overlap is useful for triage; it does not prove byte-for-byte source reuse.

| Target evidence | Analysis priority |
| --- | --- |
| `wenilla-rogue/src/game/{mod,enemy,abilities,auras,companions,guardians,procs,talents,upgrades}.rs` | Simulation state, damage rules, ability scheduling, enemies, guardians, progression. Recover call graphs and constants before claiming exact rules. |
| `wenilla-rogue/src/{content,dbc,gear,jewelry,mods,talents,achievements,save}.rs` | Content definitions, equipment, modifiers, permanent progression, persistence. |
| `wenilla-rogue/src/{server,realmd,proto,driver,nav}.rs` | Local game loop, client protocol integration, movement/navigation. |
| `wenilla-rogue-app/src/screens/{picker,runmods,cards,hud,talents,talentview,rewards,codex,armory}.rs` | Player-facing choices and HUD; useful anchors for following UI requests into authoritative rules. |
| `benilla-protocol/src/transport/{mod,local,native}.rs` | Transport implementation absent from the reference snapshot; investigate how local simulation reaches the client. |
| `benilla-app/src/{host_controls,web_pbr_lite}.rs`, `webbridge/mod.rs` | Target integration or platform seams; lower priority than simulation. |

The executable also contains the type identities `benilla_app::spell_override::WorldHoldPlugin` and `benilla_app::hero_preview::HeroPreviewPlugin`; neither module name occurs in the upstream tree. Their containing printable strings start at raw file offsets `0x58a6008` and `0x58fa788`. They are additional evidence that a crate-name filter alone would miss changes inside the reused app layer. Offsets are file positions, not PE virtual addresses or function entry points.

## Version and limits

The reference workspace declares version `0.2.0`, Rust edition 2021, and Bevy `0.18.1`; it patches Lua and Kira in the root manifest. Its launcher stamps the Git identity into `BuildId`. An executable string matching `0.2.0` or Bevy `0.18.1` therefore cannot identify the fork revision. Recover the target's own stamp or compare actual functions before selecting a reconstruction base. [Manifest, lines 5–8 and 18–44](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/Cargo.toml#L5-L44), [launcher stamp, lines 6–16](https://github.com/samwhosung/benilla/blob/7b608671a65274e0fe330da4a63f12da58162b61/crates/benilla/src/main.rs#L6-L16).

This baseline identifies where to focus native analysis. It does not recover combat formulas, spawn schedules, level-up probabilities, save semantics, or exact upstream/fork ancestry. Source-path absence is relative to this snapshot; earlier upstream history may contain different names. MPQ content is outside this pass.
