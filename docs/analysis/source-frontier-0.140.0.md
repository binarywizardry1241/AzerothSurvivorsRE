# Source-first discovery frontier — 0.140.0

The installed PE is 151,521,280 bytes, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [whole-image discovery delta](evidence/0.140.0/discovery-delta.json)
binds both inventories. Its predecessor is the last audited **0.139.1**,
SHA-256 `1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d`.
Several source and addon findings also retain independent 0.139.2 evidence.
The namespace and resource comparisons below cover the exact distinct literals
selected by the inventory's regexes. Native addresses are preferred PE VAs.

## Diagnostic and code frontier

All five new AS diagnostic paths and both additional benilla paths are listed
below. Use `diagnostics[path=…]` in the full inventory referenced by the
[diagnostic receipt](coverage/diagnostic-ownership.json). The receipt records
the decoded instructions; the table gives representative references and the
scope for reuse. An unwind extent with a diagnostic reference can also contain
inlined or shared code. The candidate source seams leave module correspondence
and bounded current-contract registration open.

| Added diagnostic path | Current reference population and lead | Candidate source seam and next static action |
| --- | --- | --- |
| `crates/wenilla-rogue/src/game/attacks.rs` | 29 references in six candidate extents. `0x145ee2eb2` belongs to declared extent `0x145ee2a90`. `systems[id=custom-game-game-attacks]`. | [#318](../verification-needed.md#gap-318) covers the new attacks module and Rogue reach. Reuse `gameplay/mechanics/attacks.rs`, `run_effects/weapon.rs` and `player_abilities/behavior/targeting.rs`. Separate automatic swing and ordinary ability target selection, including the class gate and target dimensions. |
| `crates/wenilla-rogue/src/game/kill_command.rs` | 33 references in twelve candidate extents. `0x145f807a9` belongs to `0x145f7bb40`. `systems[id=custom-game-game-kill-command]`. | [#316](../CURRENT-STATE.md#gap-316) covers the new Hunter dispatch. The current pool/descriptor and retained trap have [bounded data proof](class-balance-0.140.0.md#hunter-pets-offers-and-kill-command). Trace the pet-admission predicate, cast kind 12 and each actor's target and attack route before connecting the existing pet actor/effect consumers. |
| `crates/wenilla-rogue/src/game/scripts/mod.rs` | 15 references in three candidate extents. `0x145eeba81` belongs to `0x145eeb730`. `systems[id=custom-game-game-scripts-mod]`. | [#313](../CURRENT-STATE.md#gap-313) covers the shared encounter scheduler and script dispatch. Reuse existing boss runtime and raid marker/damage interfaces. Trace registration, selected encounter state and tick/warning/damage handoff into the exact current script. |
| `crates/wenilla-rogue/src/game/scripts/krastinov.rs` | Five references in two candidate extents. `0x145eec04d` belongs to `0x145eebea0`. `systems[id=custom-game-game-scripts-krastinov]`. | #313 also owns the Krastinov sequences. Start at the [named descriptor and script leads](scholomance-0.140.0.md). Follow the dash, cleave, Bladestorm and hook through their exact timing, targeting and hit geometry. |
| `crates/wenilla-rogue/src/game/scripts/ras.rs` | Four references in three candidate extents. `0x145ee3d37` belongs to `0x145ee3900`. `systems[id=custom-game-game-scripts-ras]`. | #313 also owns Frozen Checkmate and Ras's shield and runes. Trace the tile masks, armor/rune lifecycle and vulnerability through the same existing event and state interfaces. |
| `crates/benilla-app/src/host_controls/world_anchors.rs` | Diagnostic name at `0x146648c56`, `0x146648cb8`, `0x14664be16`. Zero verified Location-derived references. | AS-facing [#317](../CURRENT-STATE.md#gap-317). Resolve the plugin name at `0x146597348` and the packed registration names at `0x14655bb28` to actual callable slots. Reuse the combat anchors, camera and Lua render extraction boundary. Recover catalog insertion, expiry, reset, limits, attachment and projection ownership. |
| `crates/benilla-app/src/entities/carried_light.rs` | Diagnostic name at `0x146654a40`; references `0x140a7401f` and `0x140aa392d` in two declared extents. | Generic model-light interface. The [vendored counterpart](../../crates/benilla-app/src/entities/carried_light.rs) attaches eligible M2 point lights to their bone or frame. Equipment spawning and attached actor models already consume it. The [vendor record](benilla-vendor.json) identifies the local upstream file; further native work depends on evidence of a concrete AS consumer difference. |

The whole-image inventory found seven added diagnostic names and zero removed
names. Five additions increase the AS diagnostic path population from 77 to 82.
The other two distinguish an AS-facing addon interface from supporting engine
context. The newly observed paths each retain the review boundary above.

## Exact lexical delta ownership

In the tables, `+n` selects the **one-based** entry `n` in
`candidate_changes.<population>.added`; `−n` selects the corresponding entry
in `.removed`. Use that exact literal to select all matching
`embedded_candidates[population]` rows in the current or predecessor inventory
named in the delta. Each row has its byte range and digest. These selectors
preserve packed strings and repeated observations without duplicating them.

| Candidate population | Added distinct | Removed distinct |
| --- | ---: | ---: |
| `module_type_namespace` | 31 | 28 |
| `game_binding_identifier` | 25 | 0 |
| `lua_ui_registration` | 0 | 0 |
| `textual_id_assignment` | 0 | 0 |
| `textual_numeric_id` | 0 | 0 |
| `save_configuration_key_lead` | 0 | 0 |
| `resource_path` | 4 | 1 |
| `lua_function_declaration` | 12 | 0 |
| **Total** | **72** | **29** |

### Namespace candidates

| Exact selectors | Source boundary and disposition |
| --- | --- |
| `+4, +5` | WorldAnchorsPlugin and packed world-anchor path. Both feed #317's registration and source recovery above. |
| `+3, +7, +29; −4, −6, −13` | Packed hero preview, clock, touch, position, InputGate, menu scene, WorldHold, combat anchor, overlay and marker names, plus the separate marker plugin. The earlier names were packed into different matches. Reuse menu `background.rs` and [preview #60/#297](../CURRENT-STATE.md#gap-60), benilla `loading_screen.rs` and [loading #61](../CURRENT-STATE.md#gap-61), the [clock #302](../verification-needed.md#gap-302) and [position #137](../verification-needed.md#gap-137) adapters, `native_input` and [input #310](../verification-needed.md#gap-310), `combat_text/anchors.rs` and [combat #307](../CURRENT-STATE.md#gap-307), the [on-top interface #11](../CURRENT-STATE.md#gap-11) and [marker interface #96](../CURRENT-STATE.md#gap-96). Compare actual registration, phase and snapshot boundaries under those owners. |
| `+30, +31; −27, −28` | Options and XInput retain their type-name prefixes; their following packed text changes. `options.rs` and `native_input` supply the retained adapters. Use [#129](../CURRENT-STATE.md#gap-129) for options and [#22](../CURRENT-STATE.md#gap-22) for pad/focus applicability. |
| `+17, +22; −1, −16, −22` | Binding confirmation, webbridge and layout symbols regroup beside existing names. The engine source includes `ui_bind_confirm`, `bindings/layout.rs` and the local extension's input adapters. The specific AS key-to-action interfaces retain [stored levels #21](../verification-needed.md#gap-21), [Skip #304](../verification-needed.md#gap-304) and #310. |
| `+2, +12; −3` | Dev tools and Alt+F4 registration split into separate matches. `benilla-app/src/shutdown.rs` emits the ordinary window-close request. [#206](../CURRENT-STATE.md#gap-206) separately owns any actual native desktop close-to-co-op handoff. |
| `+24, +26, +27; −25` | The three BgWin, MacQuit and ThreadQos names were one predecessor match. Existing `benilla-world/src/{bgwin,mac_quit,thread_qos}.rs` supply generic window and thread lifecycle interfaces. |
| `+10; −9` | Packed network registration text at `0x146746300` for 14,524 bytes, beginning `benilla_app::net::session::on_pong`, matches the predecessor's 14,530-byte string at `0x14664d628` after removing the final adjacent `crates` bytes. Callback names and order in this match are identical. Stop at the existing `benilla-app/src/net.rs`, `field_callbacks.rs` and message consumers. The PE import library/function sets are also unchanged. Actual [co-op/service #63](../CURRENT-STATE.md#gap-63) correspondence remains separate. |
| `+1, +6, +8, +9, +15, +16, +18, +19, +21; −2, −5, −7, −8, −14, −15, −17, −19, −21` | Generic creature animation, item, name, network I/O, target, transport, binder, loot roll and addon namespaces. Compare stable prefixes to existing `benilla-app/src/{creature_anim,items,names,net,target,transport,ui_binder,ui_loot_roll,ui_script}` owners. Changes are boundary-text variations in these matches. Preserve exact engine residuals independently of specific AS consumers. |
| `+11, +20, +23, +25, +28; −10, −18, −20, −23, −24, −26` | Generic UI pass, opaque-pass/gamma registration, BLP, entity shade and water. The UiQuadMaterial match has a different trailing enum/name block; source boundaries are `benilla-app/src/{opaque2d,ui_gamma,ui_pass,ui_chat}`, `benilla-assets/src/gpu_blp.rs`, and `benilla-world/src/{entity_shade,water_fx}.rs`. The packed text alone establishes no new AS behavior. |
| `+13, +14; −11, −12` | Windows audio COM and MMCSS names persist across different packed boundaries. Existing `benilla-app/src/sound/output` owns device and realtime scheduling. Keep generic native/audio verification separate from AS recovery. |

### Bindings, Lua and resources

| Population and selectors | Source boundary and disposition |
| --- | --- |
| `game_binding_identifier` `+1`; `lua_function_declaration` `+1` | `AZS_CTSeat` is the local helper at `0x147aeb318`, reused by combat and world projection. Preserve #307's exact [0.139.2 combat wrapper](evidence/0.139.2/combat-text/event-projection-api.lua) and confirm current native projection separately under #307/#317. |
| `game_binding_identifier` `+2…+4`; `lua_function_declaration` `+2` | Downed party list and dirty flags. The Lua getter starts at `0x147aec889`; the separate packed producer seed `AZSDOWNED` is `0x1477339fe`. Follow the authoritative position, fall epoch, replay and removal through `coop/game_party.rs`, `gameplay/mechanics/coop.rs` and `gameplay/client/coop_feed.rs`. The [current wrapper proof](world-anchors-0.140.0.md#downed-party-location-publication) and #63 retain these as specific source connections. |
| `game_binding_identifier` `+5…+12, +14…+25`; `lua_function_declaration` `+3…+12` | All world catalog query, sync, projection, stream, unit, handler and lifecycle names map to #317. The 151-byte packed name run is also an independent registration selector at `0x14655bb28`. The [current wrapper proof](world-anchors-0.140.0.md#catalog-projection-and-combat-distance) distinguishes exact Lua behavior from pending native limits, scheduler and state producers. |
| `game_binding_identifier` `+13` | Exact `AZS_OPENLEVELS` at `0x147af46f8` matches `native_bindings.rs::COMMAND` and the existing stored-level FrameXML binding. The predecessor's [bounded comparison](source-frontier-0.139.0.md#bounded-stored-level-binding-comparison) already identified the same command despite the scanner's boundary. Keep #21's source repair and outstanding current dispatch applicability separate. |
| `resource_path` `+1, +2, +3` | The target reticle `//interface/spellshadow/spell-shadow-unacceptable.blp` at `0x1466cfc07`, blob shadow `//textures/shadowblob.blp` at `0x14665ee41`, and `AccountLoginRealmlist.xml` at `0x1466cfd4c` each have an existing engine consumer in `target/reticle.rs`, `blob_shadow.rs` and `ui_script/glue.rs` respectively. Their paths are generic resource context. [MPQ coverage](evidence/0.140.0/mpq-member-coverage.json) owns resource presence separately. |
| `resource_path` `+4; −1` | Both regex matches end in the exact `DBFilesClient\CreatureSoundData.dbc` suffix. The current packed prefix joins `glowSpell_Shadow_LifeDrain`, and the old prefix joined `FrontSpell_Holy_PrayerOfHealing`. `benilla-formats/src/creature_sound.rs` reads the DBC independently, and the existing AS creature-sound addon adapter uses the parser. The two regex spans are candidate boundaries, with no independent resource removal or AS gameplay change identified. |

Every changed distinct literal has one selector group above. The
[Scholomance](scholomance-0.140.0.md), [class combat](class-balance-0.140.0.md)
and [world-anchor](world-anchors-0.140.0.md) reports own the additional native
data, publication and gameplay questions. This review adds no native code
contract from a filename, namespace or unchanged literal. Indirect flow,
nonliteral data consumers, residual code classification and remaining native
work continue under the current graph and [#41](../CURRENT-STATE.md#gap-41).
Compilation, execution and controlled original/rebuilt comparison remain open.
