# Selected-target system coverage

The [system register](coverage/systems.json) binds **60 known custom diagnostic
modules** and a separate shared-engine context record to installed **0.119.0**,
SHA-256 `6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
All prior identities and source candidates remain. Native diagnostic bytes,
actual body/site joins, reconstructed source and bounded behavioral contracts
are independent dimensions. Prior-target assessments remain historical.

The [connection ledger](coverage/exe-connections.json) supplies current native
owners, source anchors and evidence partitions. Every missing current contract
has its own [module finding](module-contracts-0.119.0.md); the whole-image residuals
retain exact queue selectors under [#41](unknown-recovery-0.119.0.md).
[Release findings](release-review-0.119.0.md) remain separate from module coverage.
Neither existing code nor a registered bounded contract certifies a whole module,
actual execution or parity. Full cooperative source is in scope; no server runs.

The technical guidance below retains historical examples with their original
scope. [CURRENT-STATE](../CURRENT-STATE.md), [verification-needed](../verification-needed.md) and [current coverage](reconstruction-coverage.md)
own the latest facts and validation limits.

## Always use the most recent supplied target

Use the configured installed artifact, verify its complete SHA-256,
and compare its identity with this register before using these statuses. The
version is not a permanent default: a newer supplied EXE, or another hash with
the same version label, invalidates the active identity until selection and
coverage are refreshed. Re-scan diagnostic owners, triage additions/removals and
revalidate affected native contracts. The number 60 describes this artifact;
it is not a required count for future EXEs. Keep stable system IDs and permanent
gap identities across updates.

The [0.97.2 inventory](game-layer-inventory.md),
[ownership report](code-ownership-0.97.2.md) and its engine-delta ledger are
historical evidence only. Their old RVAs, module counts, missing-source findings
and source-presence percentages must not be used as current coverage. Current
status comes from [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), this register and the
selected-target artifact inventory; historical contracts require byte-bound
revalidation before reuse.

## What each record establishes

The `original_path` and every `native_path_evidence` offset/length/hash refer to
exact diagnostic bytes in `target.sha256`. They establish an identity lead.
They do not identify every native function associated with that path or recover
its behavior. `source_refs` identify real subsystem correspondences; named
`source_review_anchors` record inspected definitions/consumers, and
`reviewed_source_hashes` detect later source drift. A shared basename, imported
engine revision or adjacent API seam is not sufficient correspondence by itself.

Each `evidence_ref` resolves through `evidence_target_bindings`: current bounded
reports remain bounded, historical reports explicitly require revalidation,
and an engine-source baseline is not native equivalence. Working-tree-only
adjacent seams are isolated in `pending_source_refs`; they do not count as
durable implementation and their absence from a clean checkout cannot turn a
missing system into a passed mapping.

| Dimension | Meaning |
| --- | --- |
| Recovery | Native producers, state transitions, values, IDs, dispatch and consumers recovered for the stated scope. Path identity alone is insufficient. |
| Implementation | Recovered behavior connected through actual source inputs/state/outputs/UI. A catalog, helper or file alone is insufficient. |
| Static validation | Only the recorded checks/contracts. This register verifies diagnostic bytes, references and limited source correspondence; owning reports retain behavior checks and their target/source limits. |
| Runtime validation | Actual checks of the relevant current source application and interaction. Historical builds do not validate later edits. |
| Parity | Controlled original/rebuilt gameplay, UI and UX agreement for the stated scope. Source presence and a successful build do not establish it. |

The whole-owner recovery state is `partial` or `unknown`; implementation is
`partial` or `missing`; static validation is `bounded`. Whole-system runtime and
parity remain `unverified`. No status automatically advances another dimension.

The [0.108.0 language repair](localization-0.108.0.md) binds all fourteen
descriptor/catalog records and 204 native language-state, loader/initializer/map
and parser cases. Live source merges executable/save-directory overrides with
the recovered parser, retains English fallback and persists language beside the
game save. Complete translation/initialization/platform dependencies, popup/font
behavior and runtime/parity remain open under #17/#41.

The historical 0.105.0 [Options CVar repair](options-0.105.0.md) binds that target's descriptors,
defaults and registry delivery. Current [combat-log admission](combat-log-option-0.112.0.md)
and [Options file/VM delivery](options-vm-0.112.0.md) have separate proofs.
The historical [normal stock frontend](stock-frontend-0.105.0.md)
binds credentials, realms, permanent saved-roster operations, shared client
identity and terminal return/restart. The [hover query evidence](evidence/0.105.0/terminal/hover/manifest.json)
bounds the picker updater and terminal action query. Constructor hook/default
dependencies were recovered for that target and Interaction-only actions retain typed device
routing; later computed/global painters and dynamic registry mutation remain unresolved. These are source/static portions of #17 and #9; full system
recovery, compilation, runtime validation and parity remain open.

## Remaining discovery and repair ownership

Every current diagnostic owner links **#41** for remaining complete-body/native
ownership discovery. This includes function/call/data/global readers-writers,
dispatch tables, constants/IDs, unresolved indirect routes and unknown regions.
The artifact inventory and native census provide discovery inputs; a decoded
instruction/reference list still needs classification and source mapping. The
engine residual explicitly retains menu scene/preview/world-hold changes,
real FrameXML/Lua and input/controller/camera behavior, visual/audio differences
and platform-specific obligations. Shared engine filenames are not an exclusion.

The table below links only the established issue numbers in addition to #41;
they retain the exact identities across the canonical
[source register](../CURRENT-STATE.md#gap-register) and
[verification-needed](../verification-needed.md). The machine register carries
all source/evidence references and the complete follow-up questions. Fixgap
should select a bounded source/recovery deliverable from those questions, then
recover and connect it; completing ownership accounting does not close missing
gameplay or outstanding runtime/parity work.

`app:` abbreviates `crates/wenilla-rogue-app/src/`; `game:` abbreviates
`crates/wenilla-rogue/src/`. All **60 known current paths** have partial source
correspondence. The table retains historical source contracts, including
[Windows XInput acquisition and custom consumers](pad-0.112.0.md). Whole-system semantics and
platform/runtime parity remain open.
Hazard/raid source connections have current evidence under #42/#43.
These source correspondences do not establish complete selected-target native bodies.
Custom DBC raw dictionaries now feed actual debuff/Armory consumers; their
lazy first-success/retry/cache lifetime is connected with 20 historical 0.105.0 native cases;
remaining shared-cache callers and indirect/global ownership stay open. Pad/touch source now has bounded connected contracts;
complete native ownership and hardware/runtime parity remain open.

| Native diagnostic owner | Reviewed source anchors | Other canonical gaps |
| --- | --- | --- |
| `app:legacy_config.rs` | [Current migration/merge source and bounded proof](legacy-config-0.113.2.md); Windows file operations and preservation parity remain unverified | #17, #62 |
| `app:screens/coop.rs` | [Current capacity/roster/list UI adapter and bounded proof](coop-ui-0.115.0.md); direct-peer roster consumer connected; public discovery/full forms and UI execution/parity remain open | #17, #63 |
| `game:coop/route.rs` | [Native event projection](coop-transport-0.115.0.md) and [actual world-owned private/shared recipients](coop-session-0.115.0.md); execution/parity unverified | #63 |
| `game:coop/tcp.rs` | [Native TCP framing/lifecycle/startup](coop-transport-0.115.0.md); direct session integration, no runtime/interoperability proof | #63 |
| `game:game/party.rs` | [Shared-world/per-hero simulation, targeting, revive, rewards, health scaling and guest HUD source](coop-game-party-0.115.0.md); compilation/gameplay/parity unverified | #63 |
| `game:server/party.rs` | [Admission/binary lifecycle](coop-server-party-0.115.0.md) and [actual profile/world/bootstrap/replication integration](coop-0.115.0.md); public service and execution/parity open | #63 |
| `app:lib.rs` | [main.rs: `main`](../../crates/azeroth-survivors-re/src/main.rs); [gameplay/mod.rs: `enter`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs) | #9, #17 |
| `app:screens/armory.rs` | [armory.rs: `ArmoryCatalog`](../../crates/azeroth-survivors-re/src/armory.rs); [armory.rs: `input`](../../crates/azeroth-survivors-re/src/armory.rs) | #4, #17 |
| `app:screens/backdrop.rs` | [background.rs: `SceneProfile`](../../crates/azeroth-survivors-re/src/background.rs); [menu_scene.rs: `drive_camera`](../../crates/azeroth-survivors-re/src/menu_scene.rs) | #17, #35, #39 |
| `app:screens/cards.rs` | [gameplay/native_overlays.rs: `OverlayState`](../../crates/azeroth-survivors-re/src/gameplay/native_overlays.rs); [gameplay/native_overlays.rs: `from_payload`](../../crates/azeroth-survivors-re/src/gameplay/native_overlays.rs) | #2, #18 |
| `app:screens/codex.rs` | [codex.rs: `CodexPlugin`](../../crates/azeroth-survivors-re/src/codex.rs); [codex.rs: `CodexCatalog`](../../crates/azeroth-survivors-re/src/codex.rs) | #17, #34 |
| `app:screens/discord.rs` | [community_icon.rs: `image`](../../crates/azeroth-survivors-re/src/community_icon.rs); [menu.rs: `community_button`](../../crates/azeroth-survivors-re/src/menu.rs) | #17, #63 |
| `app:screens/hud.rs` | Selected [0.108.0 FrameXML HUD](framexml-hud-0.108.0.md) also reaches the real core loader; broader HUD/native owners remain open. [gameplay/run_hud/mod.rs: `RunHudPlugin`](../../crates/azeroth-survivors-re/src/gameplay/run_hud/mod.rs); [gameplay/run_hud/view.rs: `clock`](../../crates/azeroth-survivors-re/src/gameplay/run_hud/view.rs) | #7, #21, #33, #63 |
| `app:screens/hudparts.rs` | [gameplay/run_hud/layout.rs: `parse`](../../crates/azeroth-survivors-re/src/gameplay/run_hud/layout.rs); [gameplay/run_hud/settings.rs: `scale`](../../crates/azeroth-survivors-re/src/gameplay/run_hud/settings.rs) | #7, #33 |
| `app:screens/language.rs` | [localization.rs: `select`](../../crates/azeroth-survivors-re/src/localization.rs); [menu_fonts.rs: `register_cjk`](../../crates/azeroth-survivors-re/src/menu_fonts.rs) | #17 |
| `app:screens/markers.rs` | [raid_markers.rs: `Markers::receive`](../../crates/azeroth-survivors-re/src/raid_markers.rs); [gameplay/raid_markers.rs: `present`](../../crates/azeroth-survivors-re/src/gameplay/raid_markers.rs); current encounter producers have separate [bounded proofs](raid-hazards-0.112.0.md), while renderer evidence retains its historical target | #42, #43 |
| `app:screens/meter.rs` | [gameplay/meter.rs: `input`](../../crates/azeroth-survivors-re/src/gameplay/meter.rs); [gameplay/meter.rs: `present`](../../crates/azeroth-survivors-re/src/gameplay/meter.rs) | #8, #24, #63 |
| `app:screens/mod.rs` | [menu.rs: `native_button_gradient`](../../crates/azeroth-survivors-re/src/menu.rs); [hover.rs: `update_hover`](../../crates/azeroth-survivors-re/src/hover.rs) | #9, #17, #22, #23 |
| `app:screens/options.rs` | [options.rs: `Definitions`, `sync_engine`](../../crates/azeroth-survivors-re/src/options.rs); [cvars/mod.rs: `set`](../../crates/benilla-app/src/cvars/mod.rs); [options_config.rs: `write_atomic`](../../crates/azeroth-survivors-re/src/options_config.rs) | #17, #21, #22, #23, #33 |
| `app:screens/pad.rs` | [native_input/mod.rs: `NativeInputPlugin`](../../crates/azeroth-survivors-re/src/native_input/mod.rs) | #21, #22 |
| `app:screens/picker.rs` | [picker.rs: `keep_selected_visible`](../../crates/azeroth-survivors-re/src/picker.rs); [menu_state.rs: `begin_roster_enter`](../../crates/azeroth-survivors-re/src/menu_state.rs) | #9, #15, #17, #63 |
| `app:screens/rewards.rs` | [progression.rs: `valid_plan`](../../crates/azeroth-survivors-re/src/progression.rs); [progression.rs: `request_page`](../../crates/azeroth-survivors-re/src/progression.rs) | #3, #14, #27 |
| `app:screens/runmods.rs` | [run_mods.rs: `difficulty`](../../crates/azeroth-survivors-re/src/run_mods.rs); [run_mods.rs: `reward`](../../crates/azeroth-survivors-re/src/run_mods.rs) | #17, #34 |
| `app:screens/talents.rs` | [talents.rs: `TalentsPlugin`](../../crates/azeroth-survivors-re/src/talents.rs); [save/talents.rs: `budget`](../../crates/azeroth-survivors-re/src/save/talents.rs) | #12, #16, #17, #34 |
| `app:screens/talentview.rs` | [gameplay/talent_view.rs: `input`](../../crates/azeroth-survivors-re/src/gameplay/talent_view.rs); [gameplay/talent_view.rs: `rebuild`](../../crates/azeroth-survivors-re/src/gameplay/talent_view.rs) | #10, #12, #22, #23 |
| `app:screens/touch.rs` | [native_input/mod.rs: `NativeInputPlugin`](../../crates/azeroth-survivors-re/src/native_input/mod.rs) | #23 |
| `app:screens/update.rs` | [update_ui.rs: `UpdateUiPlugin`](../../crates/azeroth-survivors-re/src/update_ui.rs); [update_ui.rs: `menu_input_enabled`](../../crates/azeroth-survivors-re/src/update_ui.rs) | #17 |
| `app:screens/xinput.rs` | Windows selector/loader/four-slot poll and event publisher; [current bounded evidence](pad-0.112.0.md) | #22, #41 |
| `app:update.rs` | [update.rs: `automatic`](../../crates/azeroth-survivors-re/src/update.rs); [update_install.rs: `decode_verified`](../../crates/azeroth-survivors-re/src/update_install.rs); [update_worker.rs: `start`](../../crates/azeroth-survivors-re/src/update_worker.rs) | #17 |
| `game:achievements.rs` | [account_progression.rs: `meets_feat_with_killing_blows`](../../crates/azeroth-survivors-re/src/account_progression.rs); [progression.rs: `grant_account`](../../crates/azeroth-survivors-re/src/progression.rs) | #19, #26, #27, #34 |
| `game:appearance.rs` | [preview.rs: `HeroLook`](../../crates/azeroth-survivors-re/src/preview.rs); [save/appearance.rs: `normalize_features`](../../crates/azeroth-survivors-re/src/save/appearance.rs); [hero_name.rs: `normalize`](../../crates/azeroth-survivors-re/src/hero_name.rs) | #17, #25, #34 |
| `game:bindings.rs` | [gameplay/client/addon_bootstrap.rs: `extension`](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs); [bindings.rs: `press`](../../crates/benilla-app/src/bindings.rs) | #10, #21, #22, #23 |
| `game:content.rs` | [catalog.rs: `MenuCatalog`](../../crates/azeroth-survivors-re/src/catalog.rs); [enemies/catalog.rs: `EnemyDefinition`](../../crates/azeroth-survivors-re/src/enemies/catalog.rs) | #29, #32, #34, #35 |
| `game:dbc.rs` | [native_dbc.rs: `spell_metadata`, `item_icons`](../../crates/azeroth-survivors-re/src/native_dbc.rs) | #41 only |
| `game:driver.rs` | [gameplay/mod.rs: `enter`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs); [gameplay/mod.rs: `native_requests`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs) | #9, #17 |
| `game:hazards.rs` | [Current hazard/action graph](raid-native-0.112.0.md) and [lifecycle/actor connections](raid-lifecycles-0.112.0.md); [presentation](raid-markers-0.109.0.md) retains its historical target; runtime/parity remains unverified | #42, #43 |
| `game:fonts.rs` | [menu_fonts.rs: `register_framexml`](../../crates/azeroth-survivors-re/src/menu_fonts.rs); [font_patch.rs: `cmap`](../../crates/azeroth-survivors-re/src/font_patch.rs) | #2, #17, #39 |
| `game:game/abilities.rs` | [player_abilities/behavior/dispatch.rs: `begin_cast`](../../crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs); [gameplay/mechanics/attacks.rs: `weapon_tick`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/attacks.rs) | #13, #16, #19, #24, #32, #34 |
| `game:game/addon.rs` | [gameplay/client/addon_bootstrap.rs: `extension`](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs); [gameplay/client/addon_feed.rs: `changed`](../../crates/azeroth-survivors-re/src/gameplay/client/addon_feed.rs) | #11, #21, #24, #31, #33, #63 |
| `game:game/auras.rs` | [run_effects/player_auras.rs: `publish`](../../crates/azeroth-survivors-re/src/run_effects/player_auras.rs); [player_abilities/behavior/buffs.rs: `tick_auras`](../../crates/azeroth-survivors-re/src/player_abilities/behavior/buffs.rs) | #19, #25, #31, #32, #33 |
| `game:game/companions.rs` | [run_effects/loot_companions.rs: `saved_config`](../../crates/azeroth-survivors-re/src/run_effects/loot_companions.rs); [gameplay/mechanics/loot_companions.rs: `tick_loot_companions`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/loot_companions.rs) | #14, #27, #31 |
| `game:game/demons.rs` | [gameplay/mechanics/demons.rs: `demon_tick`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/demons.rs); [gameplay/mechanics/demon_lifecycle.rs: `lifecycle_action`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/demon_lifecycle.rs) | #8, #12, #24 |
| `game:game/enemy.rs` | [enemies/spawning.rs: `create_enemy`](../../crates/azeroth-survivors-re/src/enemies/spawning.rs); [enemies/waves.rs: `pattern_candidates`](../../crates/azeroth-survivors-re/src/enemies/waves.rs); [bosses/minion_phases.rs: `take_due`](../../crates/azeroth-survivors-re/src/bosses/minion_phases.rs) | #1, #28, #29, #32, #34, #42 |
| `game:game/guardians.rs` | [guardians/mod.rs: `spawn_due`](../../crates/azeroth-survivors-re/src/guardians/mod.rs); [gameplay/mechanics/guardians.rs: `guardian_awake`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/guardians.rs) | #1, #11, #19, #29, #34 |
| `game:game/mod.rs` | [gameplay/mod.rs: `tick`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs); [gameplay/mod.rs: `account_delivery`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs) | #9, #13, #19, #21, #25, #28, #30, #31, #33, #34, #63 |
| `game:game/procs.rs` | [run_effects.rs: `rebuild`](../../crates/azeroth-survivors-re/src/run_effects.rs); [run_effects/conditions.rs: `condition_matches`](../../crates/azeroth-survivors-re/src/run_effects/conditions.rs) | #13, #16, #19, #24, #31, #34 |
| `game:game/talents.rs` | [run_effects/demon_talents.rs: `from_allocation`](../../crates/azeroth-survivors-re/src/run_effects/demon_talents.rs); [gameplay/mechanics/milestones.rs: `milestone_event`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/milestones.rs) | #12, #13, #16, #19, #24, #34 |
| `game:game/upgrades.rs` | [gameplay/mechanics/choices.rs: `generate_level_choices`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs); [gameplay/mechanics/choice_controls.rs: `reroll_choices`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/choice_controls.rs) | #2, #13, #18, #21, #24, #34 |
| `game:gear.rs` | [save/gear.rs: `decode`](../../crates/azeroth-survivors-re/src/save/gear.rs); [mob_loot.rs: `boss_candidates`](../../crates/azeroth-survivors-re/src/mob_loot.rs) | #4, #17, #19, #34 |
| `game:i18n.rs` | [localization.rs: `lookup`](../../crates/azeroth-survivors-re/src/localization.rs); [localization.rs: `apply`](../../crates/azeroth-survivors-re/src/localization.rs) | #17 |
| `game:jewelry.rs` | [loot_rewards/amulets.rs: `scaled_bytes`](../../crates/azeroth-survivors-re/src/loot_rewards/amulets.rs); [loot_rewards.rs: `increment`](../../crates/azeroth-survivors-re/src/loot_rewards.rs) | #18, #19, #34 |
| `game:mods.rs` | [run_mods.rs: `reward`](../../crates/azeroth-survivors-re/src/run_mods.rs); [run_progression.rs: `talent_experience_parts`](../../crates/azeroth-survivors-re/src/run_progression.rs) | #17, #19, #34 |
| `game:nav.rs` | [floor_recovery/navigation.rs: `build`](../../crates/azeroth-survivors-re/src/floor_recovery/navigation.rs); [floor_recovery/navigation.rs: `chase`](../../crates/azeroth-survivors-re/src/floor_recovery/navigation.rs) | #1, #38 |
| `game:proto.rs` | [gameplay/client/events.rs: `collect`](../../crates/azeroth-survivors-re/src/gameplay/client/events.rs); [local_client/requests.rs: `collect`](../../crates/benilla-app/src/local_client/requests.rs) | #9, #11, #28, #29, #31, #32, #63 |
| Historical `game:realmd.rs` (no current diagnostic) | [stock_frontend.rs: `serve`](../../crates/azeroth-survivors-re/src/stock_frontend.rs); [ui_script/glue_mgr.rs: `send_asks`](../../crates/benilla-app/src/ui_script/glue_mgr.rs); [glue_session/roster.rs: `prepare_pick`](../../crates/benilla-app/src/glue_session/roster.rs) | #9 |
| `game:save.rs` | [save.rs: `Save`](../../crates/azeroth-survivors-re/src/save.rs); [save/backup.rs: `after_write`](../../crates/azeroth-survivors-re/src/save/backup.rs); [save/progress.rs: `record`](../../crates/azeroth-survivors-re/src/save/progress.rs) | #12, #15, #17, #19, #37 |
| `game:server.rs` | [gameplay/mod.rs: `tick`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs); [gameplay/mod.rs: `finish_client_delivery`](../../crates/azeroth-survivors-re/src/gameplay/mod.rs) | #9, #19, #21, #28, #63 |
| `game:talents.rs` | [save/talents.rs: `can_learn`](../../crates/azeroth-survivors-re/src/save/talents.rs); [save/talents.rs: `normalize`](../../crates/azeroth-survivors-re/src/save/talents.rs) | #12, #16, #19, #24, #34 |
| `game:terrain.rs` | [floor_recovery/map.rs: `NativeTerrain`](../../crates/azeroth-survivors-re/src/floor_recovery/map.rs); [gameplay/world/native_floor.rs: `ensure`](../../crates/azeroth-survivors-re/src/gameplay/world/native_floor.rs) | #1, #30, #32, #38, #39 |

## Validation and limits

The register's 58 normalized current custom paths were independently matched against
all exact occurrences in the selected EXE. Every retained occurrence is
hash-bound. All 350,243 declared extents decode in the linear pass, and the
separate complement accounts for all 5,126,586 other executable bytes. These
byte accounting results do not recover complete flow or native semantics.
Ghidra owner/full-image observations retain the separate
[native census](native-census-0.113.0.md) limits. Named source
anchors and reviewed hashes retain their limited historical correspondence
review; their preservation does not establish current native-body equivalence.
Historical data/native/source checkers and addon Lua fixtures retain their
own target/report bounds. They do not execute reconstructed Rust or advance
current whole-system statuses. The refresh did not compile, run a game or recover every
native function. Source drift requires review, rather than silently
retaining a passed source association.

This is an ownership register, not a reconstruction denominator or an exhaustive
memory/reference proof. Paths omit units with stripped/inlined metadata;
runtime memory and dynamic state are not fully represented by diagnostic strings
or static PE references. Unknown producers, values and behaviors remain named
questions rather than invented implementations. The
[claim-level changelog crosswalk](coverage/changelog.json) and its
[individual reviews](coverage/changelog-reviews.json) supply additional discovery
leads; an unmentioned native system
still belongs in coverage, and a release-note claim is not implementation proof.
