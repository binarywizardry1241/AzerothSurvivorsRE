# Module contract recovery — 0.117.0

Selected SHA-256: `507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`. The connection ledger owns exact current body/location selectors and source anchors. All 60 known AS modules retain partial source correspondence; no prior-target bounded contract is automatically promoted. These are evidence findings, not claims that 60 implementations are absent.

Each row uses `docs/analysis/coverage/exe-connections.json:systems[id=...]`. Read its source before tracing current Location owners, input, dispatch, state, downstream consumers and failure paths as required by AS. Stop at established benilla interfaces. Compilation, actual execution and controlled parity comparisons remain separate and unrun.

| Module selector | Finding | Candidate source |
| --- | --- | --- |
| `custom-app-lib` | #122 | `crates/azeroth-survivors-re/src/main.rs` |
| `custom-app-screens-armory` — bounded Look viewport/starter contracts registered; #120/#159 parity open | #123 | `crates/azeroth-survivors-re/src/armory.rs` |
| `custom-app-screens-backdrop` | #72 | `crates/azeroth-survivors-re/src/background.rs` |
| `custom-app-screens-cards` | #124 | `crates/azeroth-survivors-re/src/gameplay/native_overlays.rs` |
| `custom-app-screens-codex` | #73 | `crates/azeroth-survivors-re/src/codex.rs` |
| `custom-app-screens-discord` | #74 | `crates/azeroth-survivors-re/src/community_icon.rs` |
| `custom-app-screens-hud` | #125 | `crates/azeroth-survivors-re/src/gameplay/run_hud/mod.rs` |
| `custom-app-screens-hudparts` | #126 | `crates/azeroth-survivors-re/src/gameplay/run_hud/layout.rs` |
| `custom-app-screens-language` | #127 | `crates/azeroth-survivors-re/src/localization.rs` |
| `custom-app-screens-meter` | #75 | `crates/azeroth-survivors-re/src/gameplay/meter.rs` |
| `custom-app-screens-mod` | #128 | `crates/azeroth-survivors-re/src/menu.rs` |
| `custom-app-screens-options` | #129 | `crates/azeroth-survivors-re/src/options.rs` |
| `custom-app-screens-pad` | #76 | `crates/azeroth-survivors-re/src/native_input/mod.rs` |
| `custom-app-screens-picker` | #77 | `crates/azeroth-survivors-re/src/picker.rs` |
| `custom-app-screens-rewards` — bounded reward data registered; whole UI open | #130 | `crates/azeroth-survivors-re/src/progression.rs` |
| `custom-app-screens-runmods` | #131 | `crates/azeroth-survivors-re/src/run_options.rs` |
| `custom-app-screens-talents` — bounded White Devilsaur interface registered; source/#119 open | #78 | `crates/azeroth-survivors-re/src/talents.rs` |
| `custom-app-screens-talentview` | #79 | `crates/azeroth-survivors-re/src/gameplay/talent_view.rs` |
| `custom-app-screens-touch` | #80 | `crates/azeroth-survivors-re/src/native_input/mod.rs` |
| `custom-app-screens-update` | #132 | `crates/azeroth-survivors-re/src/update_ui.rs` |
| `custom-app-screens-xinput` | #81 | `crates/azeroth-survivors-re/src/native_input/acquisition.rs` |
| `custom-app-update` | #133 | `crates/azeroth-survivors-re/src/update.rs` |
| `custom-game-achievements` — bounded cooperative descriptor/predicate contract registered; broader delivery/runtime/parity open | #82 | `crates/azeroth-survivors-re/src/account_progression.rs` |
| `custom-game-appearance` | #83 | `crates/azeroth-survivors-re/src/preview.rs` |
| `custom-game-bindings` | #84 | `crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs` |
| `custom-game-content` | #85 | `crates/azeroth-survivors-re/src/catalog.rs` |
| `custom-game-dbc` | #86 | `crates/azeroth-survivors-re/src/native_dbc.rs` |
| `custom-game-driver` | #134 | `crates/azeroth-survivors-re/src/gameplay/mod.rs` |
| `custom-game-fonts` | #135 | `crates/azeroth-survivors-re/src/menu_fonts.rs` |
| `custom-game-game-abilities` | #136 | `crates/azeroth-survivors-re/src/player_abilities/mod.rs` |
| `custom-game-game-addon` | #137 | `crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs` |
| `custom-game-game-auras` | #87 | `crates/azeroth-survivors-re/src/run_effects/player_auras.rs` |
| `custom-game-game-companions` — bounded descriptor/admission/metadata registered; whole simulation open | #88 | `crates/azeroth-survivors-re/src/run_effects/loot_companions.rs` |
| `custom-game-game-demons` | #138 | `crates/azeroth-survivors-re/src/run_effects/demons.rs` |
| `custom-game-game-enemy` | #139 | `crates/azeroth-survivors-re/src/enemies/ai.rs` |
| `custom-game-game-guardians` | #89 | `crates/azeroth-survivors-re/src/guardians/mod.rs` |
| `custom-game-game-mod` — bounded United Front stat interface registered; broader gameplay open | #140 | `crates/azeroth-survivors-re/src/gameplay/mod.rs` |
| `custom-game-game-procs` | #90 | `crates/azeroth-survivors-re/src/run_effects.rs` |
| `custom-game-game-talents` | #141 | `crates/azeroth-survivors-re/src/run_effects.rs` |
| `custom-game-game-upgrades` | #91 | `crates/azeroth-survivors-re/src/loot_rewards.rs` |
| `custom-game-gear` — bounded cosmetic/tabard metadata registered; broader gear open | #92 | `crates/azeroth-survivors-re/src/save/gear.rs` |
| `custom-game-i18n` — bounded catalog-data contract registered; native consumers/#158 open | #142 | `crates/azeroth-survivors-re/src/localization.rs` |
| `custom-game-jewelry` | #143 | `crates/azeroth-survivors-re/src/loot_rewards.rs` |
| `custom-game-mods` | #144 | `crates/azeroth-survivors-re/src/run_mods.rs` |
| `custom-game-nav` | #93 | `crates/azeroth-survivors-re/src/floor_recovery/navigation.rs` |
| `custom-game-proto` | #145 | `crates/azeroth-survivors-re/src/gameplay/client.rs` |
| `custom-game-realmd` | #94 | `crates/benilla-app/src/ui_script/glue_mgr.rs` |
| `custom-game-save` — bounded White Devilsaur interface registered; source/#119 open | #146 | `crates/azeroth-survivors-re/src/save.rs` |
| `custom-game-server` | #147 | `crates/azeroth-survivors-re/src/gameplay/mod.rs` |
| `custom-game-talents` — bounded White Devilsaur interface registered; source/#119 open | #148 | `crates/azeroth-survivors-re/src/talents.rs` |
| `custom-game-terrain` | #95 | `crates/azeroth-survivors-re/src/floor_recovery.rs` |
| `custom-app-screens-markers` — bounded draw-order contract registered; rendering/#111 parity open | #96 | `crates/azeroth-survivors-re/src/raid_markers.rs` |
| `custom-app-legacy-config` | #97 | `crates/azeroth-survivors-re/src/legacy_config.rs` |
| `custom-game-hazards` | #149 | `crates/azeroth-survivors-re/src/bosses/raid_areas.rs` |
| `custom-app-screens-coop` | #150 | `crates/azeroth-survivors-re/src/coop_ui.rs` |
| `custom-game-coop-route` | #151 | `crates/azeroth-survivors-re/src/coop/route.rs` |
| `custom-game-coop-tcp` | #152 | `crates/azeroth-survivors-re/src/coop/tcp.rs` |
| `custom-game-game-party` | #153 | `crates/azeroth-survivors-re/src/coop/game_party.rs` |
| `custom-game-server-party` | #154 | `crates/azeroth-survivors-re/src/coop/server_party.rs` |
| `custom-game-banners` | #155 | `crates/azeroth-survivors-re/src/gameplay/notifications.rs` |

#78/#146/#148 now have the bounded current White Devilsaur interface proof; #142 has the current catalog-data proof. These resolve registration dimensions only. The Look viewport proof now registers the bounded #123 interface; its source correction is #120. The marker draw-order proof now registers the bounded #96 interface; its source correction is #111. The #116/#117 reward proof also registers bounded #88/#92/#130 data, admission and metadata contracts. The other 47 rows retain missing current-contract dimensions. #158 owns the separate English source addition. Current native consumers and complete module behavior remain unverified.
