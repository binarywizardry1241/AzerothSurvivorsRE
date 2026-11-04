# AS guarded dispatch and retained source in 0.140.0

The installed `AzerothSurvivors.exe` is 0.140.0, SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`,
151,521,280 bytes. The [final applied and proposed proof](evidence/0.140.0/native-switch-proposal-review.json)
selects the exact current context objects under
`complete_AS_context_reconciliation.current_AS_context_tables[site]`. All
54 current AS diagnostic-context tables are applied. The first expanded pass
had 31 applied and 23 proposal-only. Twenty-three have one predecessor AS geometry candidate. Thirty-one
have no predecessor candidate even in the predecessor's full proposed population.
Thirty-one predecessor AS contexts have no current AS geometry candidate. The
predecessor's 54 records and established source contracts retain their original
scope. Of its 40 source receipt paths, 20 file hashes have changed and 20 still
match. The current interfaces below were checked against source. Geometry and
diagnostic association establish navigation and work ownership. They leave branch
semantics, complete table ownership and source equivalence open. [0.139.1 source review](switch-context-source-review-0.139.1.md).

## Existing source owners and next static steps

| Context and finding | Current candidate interfaces and next action |
| --- | --- |
| Menu screen dispatch [#128](../CURRENT-STATE.md#gap-128) | `menu.rs::Action`, `menu.rs::input` and `menu_state.rs::Page`. Follow the input tag producer and the 24-cell dispatch through screen activation, fallback and persistence. [Menu](../../crates/azeroth-survivors-re/src/menu.rs), [state](../../crates/azeroth-survivors-re/src/menu_state.rs). |
| Ground marker dispatch [#96](../CURRENT-STATE.md#gap-96) | `raid_markers.rs::Markers::receive`, `Kind`, `Shape`, `paint` and `mask`. The prefix loads fields at `r12+0xc0` and `r12+0xc8` and subtracts five from ECX at `0x1400bb44a` before the 0–4 guard. Trace the producer of the raw tag and the selected marker geometry, paint and lifetime branches. The diagnostic comes from the enclosing PE extent. [Marker source](../../crates/azeroth-survivors-re/src/raid_markers.rs). |
| Lobby hero inspection [#299](../CURRENT-STATE.md#gap-299) | `coop_ui.rs` party rows, `coop_profile.rs` profile state and `armory.rs::equipment_summary`/`SetTip`. The three current 7-cell contexts have separate native owners. Trace the actual inspected profile handoff, read-only panel and preview/tooltip case selection for each site. Prior `screens/inspect.rs` geometry does not bind these cases. [Party UI](../../crates/azeroth-survivors-re/src/coop_ui.rs), [profile](../../crates/azeroth-survivors-re/src/coop_profile.rs), [Armory](../../crates/azeroth-survivors-re/src/armory.rs). |
| Codex dispatch [#73](../CURRENT-STATE.md#gap-73) and retained [#17](../CURRENT-STATE.md#gap-17) navigation question | `codex.rs::CodexCatalog`, `CodexText` and detail assembly, with `catalog.rs::MenuCatalog`. Trace the descriptor selector and its text/preview consumer separately at each of the three sites. The unique candidate for `retained-table-1403076a2` is now `0x1403bbca5` through predecessor `0x140368c05`. Preserve that historical question and the separately recovered growth-text scope. [Codex](../../crates/azeroth-survivors-re/src/codex.rs), [growth-text proof](codex-growth-dispatch-0.120.2.md). |
| Armory dispatch [#123](../CURRENT-STATE.md#gap-123) | `armory.rs::input`, `build`, `equipment_summary` and `SetTip`, plus `save/gear.rs` equipment and stars. Recover three current branch producers and distinguish gear rendering and choice paths from inspection and persistence. [Armory](../../crates/azeroth-survivors-re/src/armory.rs), [save gear](../../crates/azeroth-survivors-re/src/save/gear.rs). |
| TCP lifecycle [#152](../CURRENT-STATE.md#gap-152) | `coop/tcp.rs::TcpConnection::{pump,send,receive,close}`. Trace the four selector values from framed input or connection state into delivery, error and cleanup. [TCP source](../../crates/azeroth-survivors-re/src/coop/tcp.rs). |
| Save parser [#146](../CURRENT-STATE.md#gap-146) | `save.rs::Save`, `save/schema.rs` normalization and `save/talents.rs::decode_allocation`. The two current sites share owner `0x145e09a90`. Recover selected row-family dispatch and fallbacks, including key/ordinal handoffs only where the bytes show those paths. [Save source](../../crates/azeroth-survivors-re/src/save.rs), [schema](../../crates/azeroth-survivors-re/src/save/schema.rs), [talent save](../../crates/azeroth-survivors-re/src/save/talents.rs). |
| Gear [#92](../CURRENT-STATE.md#gap-92) | `save/gear.rs` equipment/rank model, `armory.rs` item descriptor consumers and `gameplay/client/creature_queries.rs` at the separate metadata boundary. Classify each selector and output before transferring historical equipment or metadata scope. The unmatched 7-cell site shares the 114-cell table's owner `0x145e2ca90`. [Save gear](../../crates/azeroth-survivors-re/src/save/gear.rs), [Armory](../../crates/azeroth-survivors-re/src/armory.rs), [query source](../../crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs). |
| Peer trust [#186](../CURRENT-STATE.md#gap-186) | `coop/server_party.rs::validate_hero_identity` and `gameplay/coop.rs` admission. Recover the selector across its nine cells and the actual identity/key checks before connecting success and rejection to host/guest state. [Party source](../../crates/azeroth-survivors-re/src/coop/server_party.rs), [integration](../../crates/azeroth-survivors-re/src/gameplay/coop.rs). |
| Font table tags [#135](../CURRENT-STATE.md#gap-135) | `font_patch.rs::read_tables`/`augment`, `menu_fonts.rs::read_font`/`register_framexml`. The 10-cell table has declared-extent context and a unique predecessor geometry candidate. Confirm actual tag comparisons, retain/remove/write behavior and publication through the patch boundary. [Font patch](../../crates/azeroth-survivors-re/src/font_patch.rs), [registration](../../crates/azeroth-survivors-re/src/menu_fonts.rs). |
| Relay event and state [#197](../CURRENT-STATE.md#gap-197), [#198](../verification-needed.md#gap-198) | `coop/relay.rs::Relay::receive`, `coop/service.rs` event decoding and `coop/session.rs::service_host_receive`/`service_guest_receive`. Map event byte, ACK/replay state and delivery order. Earlier source repair and current-target admission remain separate. [Relay](../../crates/azeroth-survivors-re/src/coop/relay.rs), [service](../../crates/azeroth-survivors-re/src/coop/service.rs), [session](../../crates/azeroth-survivors-re/src/coop/session.rs). |
| Route selection [#151](../CURRENT-STATE.md#gap-151) | `coop/route.rs::forward_to_peers` and `coop/session.rs` relay commands. Trace which selector reaches peer forwarding, fallback and recipient admission before assigning the five branches. [Route](../../crates/azeroth-survivors-re/src/coop/route.rs), [session](../../crates/azeroth-survivors-re/src/coop/session.rs). |
| Mixed command, gear and creature-query owner [#63](../CURRENT-STATE.md#gap-63), [#154](../CURRENT-STATE.md#gap-154), [#64](../CURRENT-STATE.md#gap-64), [#65](../CURRENT-STATE.md#gap-65), [#92](../CURRENT-STATE.md#gap-92) | All 17 sites from `0x145ea43dc` to `0x145ea7666` share owner `0x145ea4350` and both `gear.rs`/`server/party.rs` diagnostic contexts. The first two retain the shared-command geometry candidates, and three specific rows retain creature-query geometry. Start at command opcode admission and trace caller, entry-width/ID-domain split, selected descriptor and serializer. Partition the other 12 sites by this evidence before assigning them to a command, gear or query role. Source seams are `coop_commands::apply`/`template_entry`, `creature_queries::{query_with,SPECIALS}`, `query_packets::decode`, `engine_packets::encode`, `PartyServer` and the gear descriptors. [Commands](../../crates/azeroth-survivors-re/src/gameplay/coop_commands.rs), [queries](../../crates/azeroth-survivors-re/src/gameplay/client/creature_queries.rs), [decode](../../crates/azeroth-survivors-re/src/gameplay/client/query_packets.rs), [encode](../../crates/azeroth-survivors-re/src/coop/engine_packets.rs), [party](../../crates/azeroth-survivors-re/src/coop/server_party.rs). |
| Party lifecycle [#63](../CURRENT-STATE.md#gap-63), [#154](../CURRENT-STATE.md#gap-154) | `coop/server_party.rs::PartyServer` and `LifecyclePacket`, `coop/session.rs::PartyEvent`, `coop/replication.rs` codec. Map the five current sites' packet discriminator, admitted peer phase, state update and emitted responses through the existing host/guest interfaces. [Party](../../crates/azeroth-survivors-re/src/coop/server_party.rs), [session](../../crates/azeroth-survivors-re/src/coop/session.rs), [replication](../../crates/azeroth-survivors-re/src/coop/replication.rs). |
| Hazard action [#149](../CURRENT-STATE.md#gap-149), [#294](../verification-needed.md#gap-294) | `bosses/raid_areas.rs`, `raid_shapes.rs`, `raid_lines.rs` and `gameplay/mechanics/bosses.rs::resolve_boss_effects`. The 32 distinct destinations need typed action/tag and producer proof before assigning any particular encounter, warning or hazard retirement path. [Areas](../../crates/azeroth-survivors-re/src/bosses/raid_areas.rs), [shapes](../../crates/azeroth-survivors-re/src/bosses/raid_shapes.rs), [lines](../../crates/azeroth-survivors-re/src/bosses/raid_lines.rs), [mechanics](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs). |
| Mixed attack/script dispatch [#313](../CURRENT-STATE.md#gap-313), [#318](../CURRENT-STATE.md#gap-318) | The 6-cell `0x145f76a3c` has `game/attacks.rs` and `game/scripts/mod.rs` extent context without an exported native owner. The prefix reads `[rbp+0x1a0]`, toggles bit 63 in its copy and substitutes 8 when the original is nonnegative. Only unsigned selectors 0–5 reach the table. Recover that tagged value's constructor and both callers/consumers before assigning a script or swing/reach meaning. Compare `weapon_tick`/`attack_candidates`, `tick_boss` and `resolve_boss_effects`. [Attack source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/attacks.rs), [boss source](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs). |
| Mixed ability/status and Kill Command [#136](../verification-needed.md#gap-136), [#316](../CURRENT-STATE.md#gap-316) | Four 11-cell tables share declared `game/abilities.rs`/`game/kill_command.rs` context without an exported native owner. Two have unique status-scaling predecessors. Trace each selector producer and selected float or actor output to `StatusEffect`, `scaled_hit_effect`, the cast/impact route or a separately proved pet action. The selected 0.139.2 Demoralizing Shout recovery remains source-connected at its earlier scope. [Status](../../crates/azeroth-survivors-re/src/player_abilities/behavior/state.rs), [dispatch](../../crates/azeroth-survivors-re/src/player_abilities/behavior/dispatch.rs), [pet runtime](../../crates/azeroth-survivors-re/src/run_effects/pets.rs), [weakening proof](status-weakening-0.139.2.md). |
| Runtime talent selectors [#141](../verification-needed.md#gap-141) | `run_effects/conditions.rs::{Event,EffectRow::matches_event,EffectRow::condition_matches}` and `run_effects.rs::EffectRow::matches`. For `0x145fbcd0a`, the nearby prefix checks stack byte equality to 2, guards `r14b` at six and reads `[rax+0x2a5]`. This makes the retained kill-reset selector a concrete candidate despite no geometry match. Prove producer, field meaning, matching destinations and reset consumer. The separate 9-cell table still needs its event/row tag identified. [Conditions](../../crates/azeroth-survivors-re/src/run_effects/conditions.rs), [effects](../../crates/azeroth-survivors-re/src/run_effects.rs), [selected prior recovery](kill-selector-0.139.2.md). |
| Demon effects [#24](../verification-needed.md#gap-24), [#138](../CURRENT-STATE.md#gap-138) | `run_effects/demons.rs::{select_target,ActorState,SummonRequest}` and `run_effects/pets.rs::PetDefinition`. The two unmatched tables share `0x145fe5160`. Recover actual input variant, timer/target and hit/effect producers before attaching any specific demon or companion behavior. [Demons](../../crates/azeroth-survivors-re/src/run_effects/demons.rs), [pets](../../crates/azeroth-survivors-re/src/run_effects/pets.rs). |
| Mixed content and localization [#85](../CURRENT-STATE.md#gap-85), [#142](../CURRENT-STATE.md#gap-142) | `localization.rs::Localization::lookup`, `catalog.rs::MenuCatalog` and content definition consumers. The 49-cell site has `i18n.rs` owner context with `content.rs` also in its declared extent. Trace the tag/value producer and formatting/data consumer before attributing its dispatch to locale selection. [Localization](../../crates/azeroth-survivors-re/src/localization.rs), [catalog](../../crates/azeroth-survivors-re/src/catalog.rs). |

## Exact selected selectors

Each site is `AS-context-table:<site>` and selects the corresponding immutable
context object key. The ordinal selects `tables[ordinal]` in the bound proposal
inventory. In each row the final columns identify selected application and the
one predecessor geometry candidate, if present. All 54 table byte commitments
and signed relative vectors were checked directly against the installed PE. A
fresh Capstone 5.0.7 decode from every recorded guard confirmed the jump starts
at the exact listed site. The checks do not show the guards' full incoming
contexts or executed destinations.

| Site | Table VA | Guard VA | Cells / distinct | Ordinal | Selected | Predecessor | Finding |
| --- | --- | --- | ---: | ---: | --- | --- | --- |
| `0x1400542f8` | `0x146568a90` | `0x1400542e5` | 24 / 6 | 8 | Applied | `0x140234338` | #128 |
| `0x1400bb469` | `0x14656c8c0` | `0x1400bb44d` | 5 / 4 | 14 | Applied | — | #96 |
| `0x1401acbd4` | `0x1465a1ae4` | `0x1401acbbc` | 7 / 5 | 39 | Applied | — | #299 |
| `0x1401af9c1` | `0x1465a1b00` | `0x1401af9a9` | 7 / 5 | 40 | Applied | — | #299 |
| `0x1403bb560` | `0x1465d3b14` | `0x1403bb548` | 17 / 6 | 47 | Applied | `0x1403684c0` | #73 |
| `0x1403bbbfd` | `0x1465d3ba8` | `0x1403bbbe5` | 20 / 5 | 48 | Applied | `0x140368b5d` | #73 |
| `0x1403bbca5` | `0x1465d3b58` | `0x1403bbc8d` | 20 / 5 | 49 | Applied | `0x140368c05` | #17/#73 |
| `0x1403d8ca8` | `0x1465d3c60` | `0x1403d8c94` | 7 / 5 | 50 | Applied | — | #123 |
| `0x1403de412` | `0x1465d3cc4` | `0x1403de3fa` | 7 / 5 | 52 | Applied | — | #123 |
| `0x1403e165b` | `0x1465d3ce0` | `0x1403e1643` | 4 / 4 | 53 | Applied | — | #123 |
| `0x140407517` | `0x1465d3d0c` | `0x1404074ff` | 7 / 5 | 54 | Applied | — | #299 |
| `0x145e0493a` | `0x1473e9e44` | `0x145e04928` | 4 / 4 | 3518 | Applied | `0x145e10ada` | #152 |
| `0x145e0a13b` | `0x1473e9e64` | `0x145e0a123` | 7 / 7 | 3519 | Applied | — | #146 |
| `0x145e0be47` | `0x1473e9e80` | `0x145e0be2f` | 6 / 5 | 3520 | Applied | `0x145e681e7` | #146 |
| `0x145e2bdb3` | `0x1473f6b6c` | `0x145e2bd9c` | 8 / 8 | 3531 | Applied | `0x145e15583` | #92 |
| `0x145e2cad6` | `0x1473f6e58` | `0x145e2cabf` | 114 / 36 | 3534 | Applied | `0x145e162a6` | #92 |
| `0x145e2d883` | `0x1473f7020` | `0x145e2d861` | 7 / 7 | 3535 | Applied | — | #92 |
| `0x145e37e0a` | `0x1473f777c` | `0x145e37df2` | 9 / 4 | 3553 | Applied | `0x145dfaffa` | #186 |
| `0x145e61955` | `0x147733f6c` | `0x145e6193e` | 10 / 5 | 3562 | Applied | `0x145df1ba5` | #135 |
| `0x145e89a86` | `0x147aef58c` | `0x145e89a6e` | 13 / 11 | 3572 | Applied | `0x145f6d056` | #197/#198 |
| `0x145e95d63` | `0x147aef61c` | `0x145e95d45` | 5 / 5 | 3575 | Applied | — | #151 |
| `0x145ea43dc` | `0x147af1ba4` | `0x145ea43c5` | 52 / 4 | 3581 | Applied | `0x145e2ceac` | #63/#154 |
| `0x145ea4421` | `0x147af1b4c` | `0x145ea440a` | 22 / 6 | 3582 | Applied | `0x145e2cef1` | #63/#154 |
| `0x145ea4cc9` | `0x147af1c74` | `0x145ea4cb2` | 115 / 16 | 3583 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea6893` | `0x147af1fb8` | `0x145ea687c` | 23 / 17 | 3584 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea6acf` | `0x147af2190` | `0x145ea6aaa` | 101 / 19 | 3585 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea6c2b` | `0x147af2324` | `0x145ea6c18` | 95 / 18 | 3586 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea6c54` | `0x147af2014` | `0x145ea6c3d` | 95 / 18 | 3587 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea6c80` | `0x147af24a0` | `0x145ea6c69` | 12 / 12 | 3588 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea6f7b` | `0x147af24f8` | `0x145ea6f58` | 195 / 35 | 3589 | Applied | `0x145e2fa59` | #64/#65 |
| `0x145ea6fa3` | `0x147af2804` | `0x145ea6f90` | 95 / 18 | 3590 | Applied | `0x145e2fa81` | #64/#65 |
| `0x145ea6fe0` | `0x147af24d0` | `0x145ea6fc9` | 10 / 9 | 3591 | Applied | `0x145e2fabe` | #64/#65 |
| `0x145ea700c` | `0x147af2980` | `0x145ea6ff5` | 5 / 5 | 3592 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea72c0` | `0x147af2af8` | `0x145ea72a7` | 195 / 35 | 3593 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea73ad` | `0x147af2994` | `0x145ea7388` | 89 / 10 | 3594 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea73d5` | `0x147af2e1c` | `0x145ea73c2` | 34 / 11 | 3595 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea7452` | `0x147af2e04` | `0x145ea743b` | 6 / 6 | 3596 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145ea7666` | `0x147af2ea4` | `0x145ea7645` | 89 / 16 | 3597 | Applied | — | #63/#154/#64/#65/#92 |
| `0x145eacf77` | `0x147af3058` | `0x145eacf60` | 8 / 8 | 3598 | Applied | `0x145e355e7` | #63/#154 |
| `0x145ebb4eb` | `0x147af3078` | `0x145ebb4d4` | 8 / 5 | 3600 | Applied | `0x145e437cb` | #63/#154 |
| `0x145ed0e23` | `0x147af3208` | `0x145ed0e08` | 24 / 9 | 3602 | Applied | `0x145e585b3` | #63/#154 |
| `0x145ed1153` | `0x147af31b0` | `0x145ed113b` | 22 / 5 | 3603 | Applied | `0x145e588e3` | #63/#154 |
| `0x145ed1941` | `0x147af32c0` | `0x145ed192d` | 22 / 5 | 3604 | Applied | `0x145e590d1` | #63/#154 |
| `0x145f6e4a0` | `0x147afabf8` | `0x145f6e474` | 32 / 32 | 3615 | Applied | — | #149/#294 |
| `0x145f76a3c` | `0x147aface0` | `0x145f76a24` | 6 / 6 | 3616 | Applied | — | #313/#318 |
| `0x145f7e124` | `0x147afae30` | `0x145f7e108` | 11 / 4 | 3617 | Applied | — | #136/#316 |
| `0x145f7e2fe` | `0x147afae5c` | `0x145f7e2eb` | 11 / 9 | 3618 | Applied | `0x145f2284e` | #136/#316 |
| `0x145f7e996` | `0x147afad54` | `0x145f7e978` | 11 / 9 | 3619 | Applied | — | #136/#316 |
| `0x145f7ec6b` | `0x147afadac` | `0x145f7ec5f` | 11 / 9 | 3620 | Applied | `0x145f2125b` | #136/#316 |
| `0x145fbcd0a` | `0x147afb3c0` | `0x145fbcce0` | 7 / 5 | 3630 | Applied | — | #141 |
| `0x145fc0924` | `0x147afb258` | `0x145fc090d` | 9 / 9 | 3631 | Applied | — | #141 |
| `0x145fe5458` | `0x147afb52c` | `0x145fe5440` | 7 / 7 | 3634 | Applied | — | #24/#138 |
| `0x145fe54dc` | `0x147afb548` | `0x145fe54c4` | 7 / 7 | 3635 | Applied | — | #24/#138 |
| `0x14606be4d` | `0x147b00c48` | `0x14606be36` | 49 / 29 | 3668 | Applied | — | #85/#142 |

## Predecessor correspondence and remaining proof

The 31 unmatched predecessor selectors retain their prior source owners and
questions. Inspect the current call/data route for the retained behavior, then
match the relevant guard and case semantics. The previous site keys in the
proof’s `predecessor_AS_context_tables` object are grouped below.

| Prior context | Unmatched 0.139.1 site keys |
| --- | --- |
| Inspection #299 | `0x1402665cf`, `0x140268d98`, `0x1403b46d6` |
| Armory #123 | `0x14037977b`, `0x14037cd79`, `0x140385b4d`, `0x14038a730`, `0x14038b2b1`, `0x14038e50c` |
| Picker #77 | `0x1403a1f53` |
| Talent allocation #148 | `0x145dd2cbc` |
| Route #151 | `0x145dd9431` |
| Gear #92 | `0x145e1702c` |
| Creature query #64/#65 | `0x145e2d7b4`, `0x145e2f380`, `0x145e2f3cd`, `0x145e2f5bf`, `0x145e2f709`, `0x145e2f732`, `0x145e2f75e`, `0x145e2faea`, `0x145e2fd8d`, `0x145e2fe21` |
| Save #146 | `0x145e66524` |
| Hazard #149/#294 | `0x145f19644` |
| Ability status scaling #136 | `0x145f20051`, `0x145f2259d` |
| Runtime talents #141 | `0x145f35e55` |
| Demon effects #24/#138 | `0x145f4e148`, `0x145f4e1cc` |
| Localization #142 | `0x145fecc82` |

All fourteen historical `retained-table-…` identities remain in the computed
frontier. The four geometry navigation matches are `retained-table-1403076a2`
at `0x1403bbca5`, `retained-table-145afbad2` at `0x145ea6f7b`,
`retained-table-145afbb29` at `0x145ea6fa3` and
`retained-table-145afbb66` at `0x145ea6fe0`. The other ten remain open for
correspondence. Existing findings own the bounded candidate families in this
review. The global computed-edge frontier remains under #41. Compilation,
application or network execution and original/rebuilt comparison remain open.
