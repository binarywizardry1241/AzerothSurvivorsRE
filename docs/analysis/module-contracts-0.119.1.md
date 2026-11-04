# Current module contract register — 0.119.1

Selected installed EXE SHA-256:
`b3b5d86b06b95fd24f66697c023c196bac9687673905dcf03c000b31cc8d073c`. The verified
[connection ledger](coverage/exe-connections.json) accounts for all 61 discovered
AS diagnostic modules, including the new guest Engine trust owner. Every module
without current bounded behavioral proof retains its individual permanent
finding below. Evidence registration is separate from recovered historical
knowledge, source implementation, compilation, runtime and parity.

The prior 0.119.0 register had nine current bounded modules; their source repairs
and recovered contracts remain with their original targets. Their newer-target
applicability is pending unless the current ledger registers a scoped assessment.
A changed hash alone does not reset implementation or require starting recovery
from zero. No same-named source file is required when the actual existing
producer/consumer supplies a partial counterpart.

| Module | Permanent finding | Partial source owner | Current bounded proof / next static action |
| --- | --- | --- | --- |
| `custom-app-lib` | [#122](../CURRENT-STATE.md#gap-122) | `crates/azeroth-survivors-re/src/main.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-armory` | [#123](../CURRENT-STATE.md#gap-123) | `crates/azeroth-survivors-re/src/armory.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-backdrop` | [#72](../CURRENT-STATE.md#gap-72) | `crates/azeroth-survivors-re/src/background.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-cards` | [#124](../CURRENT-STATE.md#gap-124) | `crates/azeroth-survivors-re/src/gameplay/native_overlays.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-codex` | [#73](../CURRENT-STATE.md#gap-73) | `crates/azeroth-survivors-re/src/codex.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-discord` | [#74](../CURRENT-STATE.md#gap-74) | `crates/azeroth-survivors-re/src/community_icon.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-hud` | [#125](../CURRENT-STATE.md#gap-125) | `crates/azeroth-survivors-re/src/gameplay/run_hud/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-hudparts` | [#126](../CURRENT-STATE.md#gap-126) | `crates/azeroth-survivors-re/src/gameplay/run_hud/layout.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-language` | [#127](../CURRENT-STATE.md#gap-127) | `crates/azeroth-survivors-re/src/localization.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-meter` | [#75](../verification-needed.md#gap-75) | `crates/azeroth-survivors-re/src/gameplay/meter.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-mod` | [#128](../CURRENT-STATE.md#gap-128) | `crates/azeroth-survivors-re/src/menu.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-options` | [#129](../CURRENT-STATE.md#gap-129) | `crates/azeroth-survivors-re/src/options.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-pad` | [#76](../CURRENT-STATE.md#gap-76) | `crates/azeroth-survivors-re/src/native_input/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-picker` | [#77](../CURRENT-STATE.md#gap-77) | `crates/azeroth-survivors-re/src/picker.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-rewards` | [#130](../CURRENT-STATE.md#gap-130) | `crates/azeroth-survivors-re/src/progression.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-runmods` | [#131](../CURRENT-STATE.md#gap-131) | `crates/azeroth-survivors-re/src/run_options.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-talents` | [#78](../CURRENT-STATE.md#gap-78) | `crates/azeroth-survivors-re/src/talents.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-talentview` | [#79](../CURRENT-STATE.md#gap-79) | `crates/azeroth-survivors-re/src/gameplay/talent_view.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-touch` | [#80](../CURRENT-STATE.md#gap-80) | `crates/azeroth-survivors-re/src/native_input/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-update` | [#132](../verification-needed.md#gap-132) | `crates/azeroth-survivors-re/src/update_ui.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-xinput` | [#81](../CURRENT-STATE.md#gap-81) | `crates/azeroth-survivors-re/src/native_input/acquisition.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-update` | [#133](../verification-needed.md#gap-133) | `crates/azeroth-survivors-re/src/update.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-achievements` | [#82](../CURRENT-STATE.md#gap-82) | `crates/azeroth-survivors-re/src/account_progression.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-appearance` | [#83](../CURRENT-STATE.md#gap-83) | `crates/azeroth-survivors-re/src/preview.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-bindings` | [#84](../CURRENT-STATE.md#gap-84) | `crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-content` | [#85](../CURRENT-STATE.md#gap-85) | `crates/azeroth-survivors-re/src/catalog.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-dbc` | [#86](../CURRENT-STATE.md#gap-86) | `crates/azeroth-survivors-re/src/native_dbc.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-driver` | [#134](../verification-needed.md#gap-134) | `crates/azeroth-survivors-re/src/gameplay/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-fonts` | [#135](../verification-needed.md#gap-135) | `crates/azeroth-survivors-re/src/menu_fonts.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-abilities` | [#136](../verification-needed.md#gap-136) | `crates/azeroth-survivors-re/src/player_abilities/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-addon` | [#137](../CURRENT-STATE.md#gap-137) | `crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-auras` | [#87](../CURRENT-STATE.md#gap-87) | `crates/azeroth-survivors-re/src/run_effects/player_auras.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-companions` | [#88](../CURRENT-STATE.md#gap-88) | `crates/azeroth-survivors-re/src/run_effects/loot_companions.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-demons` | [#138](../CURRENT-STATE.md#gap-138) | `crates/azeroth-survivors-re/src/run_effects/demons.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-enemy` | [#139](../CURRENT-STATE.md#gap-139) | `crates/azeroth-survivors-re/src/enemies/ai.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-guardians` | [#89](../CURRENT-STATE.md#gap-89) | `crates/azeroth-survivors-re/src/guardians/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-mod` | [#140](../verification-needed.md#gap-140) | `crates/azeroth-survivors-re/src/gameplay/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-procs` | [#90](../CURRENT-STATE.md#gap-90) | `crates/azeroth-survivors-re/src/run_effects.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-talents` | [#141](../CURRENT-STATE.md#gap-141) | `crates/azeroth-survivors-re/src/run_effects.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-upgrades` | [#91](../CURRENT-STATE.md#gap-91) | `crates/azeroth-survivors-re/src/loot_rewards.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-gear` | [#92](../CURRENT-STATE.md#gap-92) | `crates/azeroth-survivors-re/src/save/gear.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-i18n` | [#142](../CURRENT-STATE.md#gap-142) | `crates/azeroth-survivors-re/src/localization.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-jewelry` | [#143](../CURRENT-STATE.md#gap-143) | `crates/azeroth-survivors-re/src/loot_rewards.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-mods` | [#144](../CURRENT-STATE.md#gap-144) | `crates/azeroth-survivors-re/src/run_mods.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-nav` | [#93](../CURRENT-STATE.md#gap-93) | `crates/azeroth-survivors-re/src/floor_recovery/navigation.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-proto` | [#145](../CURRENT-STATE.md#gap-145) | `crates/azeroth-survivors-re/src/gameplay/client.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-realmd` | [#94](../CURRENT-STATE.md#gap-94) | `crates/benilla-app/src/ui_script/glue_mgr.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-save` | [#146](../CURRENT-STATE.md#gap-146) | `crates/azeroth-survivors-re/src/save.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-server` | [#147](../CURRENT-STATE.md#gap-147) | `crates/azeroth-survivors-re/src/gameplay/mod.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-talents` | [#148](../verification-needed.md#gap-148) | `crates/azeroth-survivors-re/src/talents.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-terrain` | [#95](../CURRENT-STATE.md#gap-95) | `crates/azeroth-survivors-re/src/floor_recovery.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-markers` | [#96](../CURRENT-STATE.md#gap-96) | `crates/azeroth-survivors-re/src/raid_markers.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-legacy-config` | [#97](../CURRENT-STATE.md#gap-97) | `crates/azeroth-survivors-re/src/legacy_config.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-hazards` | [#149](../CURRENT-STATE.md#gap-149) | `crates/azeroth-survivors-re/src/bosses/raid_areas.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-app-screens-coop` | [#150](../CURRENT-STATE.md#gap-150) | `crates/azeroth-survivors-re/src/coop_ui.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-coop-route` | [#151](../CURRENT-STATE.md#gap-151) | `crates/azeroth-survivors-re/src/coop/route.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-coop-tcp` | [#152](../CURRENT-STATE.md#gap-152) | `crates/azeroth-survivors-re/src/coop/tcp.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-game-party` | [#153](../verification-needed.md#gap-153) | `crates/azeroth-survivors-re/src/coop/game_party.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-server-party` | [#154](../verification-needed.md#gap-154) | `crates/azeroth-survivors-re/src/coop/server_party.rs` | Exact protocol5/seven-byte0.119.1 admission; bounded guest Engine receiving-port/trust/delivery interface and real guest-removal caller/abandonment/roster boundary. Deeper party health/lifecycle dependencies and runtime/parity remain open. |
| `custom-game-banners` | [#155](../CURRENT-STATE.md#gap-155) | `crates/azeroth-survivors-re/src/gameplay/notifications.rs` | Prior bounded recovery/source repairs are retained; current input/dispatch/state/dependency/consumer applicability remains pending. |
| `custom-game-coop-trust` | [#186](../CURRENT-STATE.md#gap-186) | `crates/azeroth-survivors-re/src/gameplay/coop.rs` | Guest Engine receiver ordering and bounded0x51 name/0x96 chat payload transformation, guards, table and malformed-input passthrough; source transform missing under #186; no whole-module/runtime/parity proof. |

| Measure | Current result |
| --- | ---: |
| Known modules with partial reconstructed source | 100% — 61/61 |
| Modules with registered current-target bounded recovery contracts | 3.3% — 2/61 |

These are module-coverage counts, not percentages of AS code decompiled,
implemented or matched. One bounded contract may qualify a module while its
remaining behavior is incomplete. No compilation, game/client/network/server
execution or controlled original/rebuilt comparison occurred.
