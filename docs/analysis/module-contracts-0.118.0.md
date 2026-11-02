# Module contract recovery — 0.118.0

Selected SHA-256: `4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae`.
All 60 known AS modules retain partial source correspondence. The
[connection ledger](coverage/exe-connections.json) owns exact Location/body,
ownerless-site and source-anchor selections. Prior-target contracts are preserved
without promotion; a missing current contract is evidence work, not proof that
a module has no implementation.

Each selector below means `exe-connections.json:systems[id=...]`. Read the named
source and its local benilla interfaces before recovering current native input,
dispatch, state, consumer and failure boundaries. Bound current recovery is
registered only where the ledger has an exact reviewed current contract; other
rows require current recovery under their permanent finding IDs.

| Module selector | Finding | Candidate source | Current bounded scope |
| --- | --- | --- | --- |
| `custom-app-lib` | #122 | `crates/azeroth-survivors-re/src/main.rs` | Pending current contract review. |
| `custom-app-screens-armory` | #123 | `crates/azeroth-survivors-re/src/armory.rs` | Pending current contract review. |
| `custom-app-screens-backdrop` | #72 | `crates/azeroth-survivors-re/src/background.rs` | Pending current contract review. |
| `custom-app-screens-cards` | #124 | `crates/azeroth-survivors-re/src/gameplay/native_overlays.rs` | Pending current contract review. |
| `custom-app-screens-codex` | #73 | `crates/azeroth-survivors-re/src/codex.rs` | Pending current contract review. |
| `custom-app-screens-discord` | #74 | `crates/azeroth-survivors-re/src/community_icon.rs` | Pending current contract review. |
| `custom-app-screens-hud` | #125 | `crates/azeroth-survivors-re/src/gameplay/run_hud/mod.rs` | Pending current contract review. |
| `custom-app-screens-hudparts` | #126 | `crates/azeroth-survivors-re/src/gameplay/run_hud/layout.rs` | Pending current contract review. |
| `custom-app-screens-language` | #127 | `crates/azeroth-survivors-re/src/localization.rs` | Pending current contract review. |
| `custom-app-screens-meter` | #75 | `crates/azeroth-survivors-re/src/gameplay/meter.rs` | Pending current contract review. |
| `custom-app-screens-mod` | #128 | `crates/azeroth-survivors-re/src/menu.rs` | Pending current contract review. |
| `custom-app-screens-options` | #129 | `crates/azeroth-survivors-re/src/options.rs` | Pending current contract review. |
| `custom-app-screens-pad` | #76 | `crates/azeroth-survivors-re/src/native_input/mod.rs` | Pending current contract review. |
| `custom-app-screens-picker` | #77 | `crates/azeroth-survivors-re/src/picker.rs` | Pending current contract review. |
| `custom-app-screens-rewards` | #130 | `crates/azeroth-survivors-re/src/progression.rs` | Pending current contract review. |
| `custom-app-screens-runmods` | #131 | `crates/azeroth-survivors-re/src/run_options.rs` | Pending current contract review. |
| `custom-app-screens-talents` | #78 | `crates/azeroth-survivors-re/src/talents.rs` | Pending current contract review. |
| `custom-app-screens-talentview` | #79 | `crates/azeroth-survivors-re/src/gameplay/talent_view.rs` | Pending current contract review. |
| `custom-app-screens-touch` | #80 | `crates/azeroth-survivors-re/src/native_input/mod.rs` | Pending current contract review. |
| `custom-app-screens-update` | #132 | `crates/azeroth-survivors-re/src/update_ui.rs` | Pending current contract review. |
| `custom-app-screens-xinput` | #81 | `crates/azeroth-survivors-re/src/native_input/acquisition.rs` | Pending current contract review. |
| `custom-app-update` | #133 | `crates/azeroth-survivors-re/src/update.rs` | Pending current contract review. |
| `custom-game-achievements` | #82 | `crates/azeroth-survivors-re/src/account_progression.rs` | Current Location-owned Hakkar descriptor/lookup ingress; #170 source key/predicate remain open. |
| `custom-game-appearance` | #83 | `crates/azeroth-survivors-re/src/preview.rs` | Pending current contract review. |
| `custom-game-bindings` | #84 | `crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs` | Pending current contract review. |
| `custom-game-content` | #85 | `crates/azeroth-survivors-re/src/catalog.rs` | Pending current contract review. |
| `custom-game-dbc` | #86 | `crates/azeroth-survivors-re/src/native_dbc.rs` | Pending current contract review. |
| `custom-game-driver` | #134 | `crates/azeroth-survivors-re/src/gameplay/mod.rs` | Pending current contract review. |
| `custom-game-fonts` | #135 | `crates/azeroth-survivors-re/src/menu_fonts.rs` | Pending current contract review. |
| `custom-game-game-abilities` | #136 | `crates/azeroth-survivors-re/src/player_abilities/mod.rs` | Pending current contract review. |
| `custom-game-game-addon` | #137 | `crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs` | Pending current contract review. |
| `custom-game-game-auras` | #87 | `crates/azeroth-survivors-re/src/run_effects/player_auras.rs` | Pending current contract review. |
| `custom-game-game-companions` | #88 | `crates/azeroth-survivors-re/src/run_effects/loot_companions.rs` | Pending current contract review. |
| `custom-game-game-demons` | #138 | `crates/azeroth-survivors-re/src/run_effects/demons.rs` | Pending current contract review. |
| `custom-game-game-enemy` | #139 | `crates/azeroth-survivors-re/src/enemies/ai.rs` | Pending current contract review. |
| `custom-game-game-guardians` | #89 | `crates/azeroth-survivors-re/src/guardians/mod.rs` | Pending current contract review. |
| `custom-game-game-mod` | #140 | `crates/azeroth-survivors-re/src/gameplay/mod.rs` | Pending current contract review. |
| `custom-game-game-procs` | #90 | `crates/azeroth-survivors-re/src/run_effects.rs` | Pending current contract review. |
| `custom-game-game-talents` | #141 | `crates/azeroth-survivors-re/src/run_effects.rs` | Pending current contract review. |
| `custom-game-game-upgrades` | #91 | `crates/azeroth-survivors-re/src/loot_rewards.rs` | Pending current contract review. |
| `custom-game-gear` | #92 | `crates/azeroth-survivors-re/src/save/gear.rs` | Pending current contract review. |
| `custom-game-i18n` | #142 | `crates/azeroth-survivors-re/src/localization.rs` | Fourteen current catalog descriptors/full payloads; #169 source delta and native loader/UI remain open. |
| `custom-game-jewelry` | #143 | `crates/azeroth-survivors-re/src/loot_rewards.rs` | Pending current contract review. |
| `custom-game-mods` | #144 | `crates/azeroth-survivors-re/src/run_mods.rs` | Pending current contract review. |
| `custom-game-nav` | #93 | `crates/azeroth-survivors-re/src/floor_recovery/navigation.rs` | Pending current contract review. |
| `custom-game-proto` | #145 | `crates/azeroth-survivors-re/src/gameplay/client.rs` | Pending current contract review. |
| `custom-game-realmd` | #94 | `crates/benilla-app/src/ui_script/glue_mgr.rs` | Pending current contract review. |
| `custom-game-save` | #146 | `crates/azeroth-survivors-re/src/save.rs` | Pending current contract review. |
| `custom-game-server` | #147 | `crates/azeroth-survivors-re/src/gameplay/mod.rs` | Pending current contract review. |
| `custom-game-talents` | #148 | `crates/azeroth-survivors-re/src/talents.rs` | Pending current contract review. |
| `custom-game-terrain` | #95 | `crates/azeroth-survivors-re/src/floor_recovery.rs` | Pending current contract review. |
| `custom-app-screens-markers` | #96 | `crates/azeroth-survivors-re/src/raid_markers.rs` | Pending current contract review. |
| `custom-app-legacy-config` | #97 | `crates/azeroth-survivors-re/src/legacy_config.rs` | Pending current contract review. |
| `custom-game-hazards` | #149 | `crates/azeroth-survivors-re/src/bosses/raid_areas.rs` | Pending current contract review. |
| `custom-app-screens-coop` | #150 | `crates/azeroth-survivors-re/src/coop_ui.rs` | Pending current contract review. |
| `custom-game-coop-route` | #151 | `crates/azeroth-survivors-re/src/coop/route.rs` | Pending current contract review. |
| `custom-game-coop-tcp` | #152 | `crates/azeroth-survivors-re/src/coop/tcp.rs` | Pending current contract review. |
| `custom-game-game-party` | #153 | `crates/azeroth-survivors-re/src/coop/game_party.rs` | Current Location-owned revive snapshot and advance/hold/decay; #168 source repair remains open. |
| `custom-game-server-party` | #154 | `crates/azeroth-survivors-re/src/coop/server_party.rs` | Current protocol5/seven-byte0.118.0 admission; source connected under #163, wider lifecycle remains open. |
| `custom-game-banners` | #155 | `crates/azeroth-survivors-re/src/gameplay/notifications.rs` | Pending current contract review. |

The ledger, rather than this source-candidate table, determines module contract
counts. Current source discrepancies are separate release/consumer findings; one
bounded contract cannot certify a module's wider behavior. Compilation, actual
client/save/UI/network/server execution and original/rebuilt comparisons were
not performed. Unknown type/alias/dispatch and whole-system parity remain open.

Current ledger: **100% — 60/60** partial source correspondence; **6.7% — 4/60**
registered bounded current contracts. The remaining **56** module findings above
retain missing registration/recovery dimensions. These are module measures, not
AS code decompiled, implemented or matched.
