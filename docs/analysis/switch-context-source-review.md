# AS guarded dispatch and source correspondence

The installed EXE contains 151,493,632 bytes and has SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [applied and proposed switch proof](evidence/native-switch-proposal-review.json)
selects each current context under
`complete_AS_context_reconciliation.current_AS_context_tables[site]`.
Thirty of 54 AS diagnostic-context tables have one exact predecessor
geometry candidate. Twenty-four have no match in the predecessor's full
proposal population. All 54 are applied. All 24 unmatched 0.140.0 contexts
retain their original scope and finding ownership. The geometry comparison
uses the complete guard kind, register, selector bounds, distance to the
dispatch and all dispatch-relative destinations. A match is navigation for
current applicability. The guard and diagnostic association alone cannot
identify the producer, consumer, or semantics of a table's cases.
[Predecessor source review](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/switch-context-source-review-0.140.0.md).

## Source owners and remaining questions

| Context and finding | Current source boundary and next static action |
| --- | --- |
| Menu [#128](../CURRENT-STATE.md#gap-128) and marker [#96](../CURRENT-STATE.md#gap-96) | Trace the menu input tag through `menu.rs::Action`, `input` and `menu_state.rs::Page`. Follow the separate marker tag into `raid_markers.rs::Markers::receive`, `Kind`, `Shape`, `paint` and `mask`. The exact geometry candidates retain the earlier menu and marker questions. [Menu](../../crates/azeroth-survivors-re/src/menu.rs), [markers](../../crates/azeroth-survivors-re/src/raid_markers.rs). |
| Lobby [#150](../CURRENT-STATE.md#gap-150) | [Lobby event dispatch](#lobby-event-dispatch) resolves the three guarded tables to event type, roster reset and chat reset. Closed and ended status now enqueue a directory refresh. The locked-reason handoff now cancels pending entry and restores the co-op window in the menu. |
| Inspection [#299](../CURRENT-STATE.md#gap-299) and Armory [#123](../CURRENT-STATE.md#gap-123) | Keep the three read-only inspection candidates distinct from the three Armory candidates. Reuse the [current wire and UI connection](coop.md#joining-readiness-and-world-start) for the roster and sidebar scope. Identify the exact inspection item-kind detail branches, preview lighting and achievement selection where their producers can be bound. For Armory, follow the selectors into the existing build, input, equipment summary and item detail paths and the save gear model. [Inspection](../../crates/azeroth-survivors-re/src/coop_inspect.rs), [Armory](../../crates/azeroth-survivors-re/src/armory.rs), [save gear](../../crates/azeroth-survivors-re/src/save/gear.rs). |
| Codex [#73](../CURRENT-STATE.md#gap-73) and [#17](../CURRENT-STATE.md#gap-17) | The [current growth-ceiling trace](codex-growth-dispatch.md#admitted-growth-ceilings-in-01410) resolves `retained-table-1403076a2` at `0x140374fd5` through the indexed row and Hand of Justice formatter. It also confirms the separate Seal of the Damned finite-growth branch at `0x140374f2d`. The other row families and wider menu dependencies retain separate proof scopes. [Codex](../../crates/azeroth-survivors-re/src/codex.rs), [catalog](../../crates/azeroth-survivors-re/src/catalog.rs). |
| Font augmentation [#135](../CURRENT-STATE.md#gap-135) | The [current exact font proof](font-table-publication.md) independently identifies `0x145dd9057` as the nested second-byte dispatch for the `h` branch. Its 40-byte table at `0x1476f3d18` matches the proved SHA-256 `1e34d391a995f7082ae67a16640be5dc1744de10c921ff55caae093eff0906ba`. Keep the repaired scaler, post table and original-provider fallback paths. Trace remaining font selection and layout dependencies only where required by AS. [Font patch](../../crates/azeroth-survivors-re/src/font_patch.rs), [provider](../../crates/azeroth-survivors-re/src/menu_fonts.rs). |
| Save [#146](../CURRENT-STATE.md#gap-146) and gear [#92](../CURRENT-STATE.md#gap-92) | The two save sites retain candidates for row-family dispatch and normalization. The three standalone gear sites retain candidates for descriptor and ranking work. Trace row tags through `save.rs::Save`, `save/schema.rs` and the talent allocation parser, and equipment/rank selectors through the actual gear and Armory consumers. Preserve the independent Scholomance reward scope under [#314](../verification-needed.md#gap-314). [Save](../../crates/azeroth-survivors-re/src/save.rs), [schema](../../crates/azeroth-survivors-re/src/save/schema.rs), [talents](../../crates/azeroth-survivors-re/src/save/talents.rs), [gear](../../crates/azeroth-survivors-re/src/save/gear.rs). |
| Peer trust [#186](../CURRENT-STATE.md#gap-186), relay [#197](../CURRENT-STATE.md#gap-197) and [#198](../verification-needed.md#gap-198), and route [#151](../CURRENT-STATE.md#gap-151) | Verify the trust selector through `validate_hero_identity` and the gameplay admission adapter. Follow the relay selector through event bytes, ACK/replay state and recipient delivery, and the separate route selector into peer forwarding and fallback. The unmatched predecessor TCP lifecycle table retains [#152](../CURRENT-STATE.md#gap-152). [Party](../../crates/azeroth-survivors-re/src/coop/server_party.rs), [relay](../../crates/azeroth-survivors-re/src/coop/relay.rs), [route](../../crates/azeroth-survivors-re/src/coop/route.rs), [TCP](../../crates/azeroth-survivors-re/src/coop/tcp.rs). |
| Mixed command and template queries [#63](../CURRENT-STATE.md#gap-63), [#64](../CURRENT-STATE.md#gap-64) and [#65](../CURRENT-STATE.md#gap-65) | The [current ingress trace](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/coop-command-ingress.md#nested-creaturequery-selectors) identifies two outer opcode tables and thirteen CreatureQuery entry selectors in owner `0x145e9e690`. The thirteen inner selectors remain under #64 for exact descriptor fields and recipient-cache correspondence. GameObjectQuery, inventory and cast denial and guest selection retain their separate branches. |
| Service and party lifecycle [#63](../CURRENT-STATE.md#gap-63) and [#154](../CURRENT-STATE.md#gap-154) | The current-only eight-cell site `0x145ea7797` belongs to the existing service/peer poller at `0x145ea3420`. Trace its event producer, admitted peer phase and destination side effects. Four other lifecycle sites retain geometry candidates. The [current desktop exit trace](coop.md#interruption-departure-and-settlement) and [meter request trace](detailed-meter.md#recipient-request-and-publication) separately establish uses of the poller without identifying this eight-cell dispatch. Retain the current exact Join, wire-17 and guest-spell-row scopes separately. [Session](../../crates/azeroth-survivors-re/src/coop/session.rs), [party](../../crates/azeroth-survivors-re/src/coop/server_party.rs), [replication](../../crates/azeroth-survivors-re/src/coop/replication.rs). |
| Hazards [#149](../CURRENT-STATE.md#gap-149) and [#294](../verification-needed.md#gap-294), mixed attack/script [#313](../verification-needed.md#gap-313) and [#318](../verification-needed.md#gap-318) | The 32-cell hazard and six-cell attack/script tables retain exact geometry candidates. Identify the hazard action producer and the mixed tagged-value constructor before associating cases with the existing raid shapes, attack targeting or encounter script consumers. [Raid areas](../../crates/azeroth-survivors-re/src/bosses/raid_areas.rs), [attacks](../../crates/azeroth-survivors-re/src/gameplay/mechanics/attacks.rs), [boss effects](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs). |
| Ability/status and Kill Command [#136](../verification-needed.md#gap-136) and [#316](../verification-needed.md#gap-316) | The [current status trace](status-weakening.md#ground-periodic-and-self-aura-payloads-in-01410) classifies `0x145f53e53` as ground-periodic status and `0x145f546c9` as self-aura status. Both use the descriptor's typed tag and floats. The two other geometry matches retain their own scope. The [Counterattack](counterattack.md) and [pet attribution](pet-meter.md) proofs remain separate. |
| Runtime talents [#141](../verification-needed.md#gap-141) and Prepared [#315](../verification-needed.md#gap-315) | The [current typed selector trace](kill-selector.md#kill-reset-and-prepared-selectors-in-01410) binds `0x145f8ebbd` to raw-22 kill cooldown reset and `0x145f927b4` to class-specific Prepared use. The [authored reset rows and lookup](kill-selector.md#authored-rows-and-live-admission) account for all seven connected rows and classify the separate wildcard and pet gates. The [Counterattack tag-12 cell](counterattack.md) at `0x147af368c` sits just beyond the Prepared table and keeps its own role. |
| Demon effects [#24](../verification-needed.md#gap-24) and [#138](../CURRENT-STATE.md#gap-138), mixed content and localization [#85](../CURRENT-STATE.md#gap-85) and [#142](../verification-needed.md#gap-142) | The demon pair retains its prior geometry candidates. Follow the actual timer/target and hit/effect producers through the existing companion adapters. The mixed content/locale table retains its candidate. Prove the tag/value producer and its formatting or data consumer before assigning the dispatch to locale selection. [Demons](../../crates/azeroth-survivors-re/src/run_effects/demons.rs), [localization](../../crates/azeroth-survivors-re/src/localization.rs). |

## Exact current selectors

Each dispatch site is `AS-context-table:<site>` in the proof above. Table
and guard addresses below use preferred PE VAs. A predecessor address means
one geometry candidate, with source correspondence and runtime proof separate.

| Site | Table VA | Guard VA | Cells / distinct | Predecessor | Finding |
| --- | --- | --- | ---: | --- | --- |
| `0x1400565d8` | `0x1465636a0` | `0x1400565c5` | 24 / 6 | `0x1400542f8` | #128 |
| `0x1400ca5b9` | `0x146567804` | `0x1400ca59d` | 5 / 4 | `0x1400bb469` | #96 |
| `0x14010628e` | `0x14656d9a4` | `0x140106276` | 7 / 6 | — | #150 |
| `0x140107bb3` | `0x14656d9c0` | `0x140107b9b` | 9 / 6 | — | #150 |
| `0x140107cef` | `0x14656d9e4` | `0x140107cd0` | 9 / 6 | — | #150 |
| `0x1401b6504` | `0x14659c884` | `0x1401b64ec` | 7 / 5 | `0x1401acbd4` | #299 |
| `0x1401b92f1` | `0x14659c8a0` | `0x1401b92d9` | 7 / 5 | `0x1401af9c1` | #299 |
| `0x140374890` | `0x1465cb8e4` | `0x140374878` | 17 / 6 | `0x1403bb560` | #73 |
| `0x140374f2d` | `0x1465cb978` | `0x140374f15` | 20 / 5 | `0x1403bbbfd` | #73 |
| `0x140374fd5` | `0x1465cb928` | `0x140374fbd` | 20 / 5 | `0x1403bbca5` | #17/#73 |
| `0x140392338` | `0x1465cba30` | `0x140392324` | 7 / 5 | `0x1403d8ca8` | #123 |
| `0x140397aa2` | `0x1465cba94` | `0x140397a8a` | 7 / 5 | `0x1403de412` | #123 |
| `0x14039aceb` | `0x1465cbab0` | `0x14039acd3` | 4 / 4 | `0x1403e165b` | #123 |
| `0x1403c0ba7` | `0x1465cbadc` | `0x1403c0b8f` | 7 / 5 | `0x140407517` | #299 |
| `0x145dd9057` | `0x1476f3d18` | `0x145dd9040` | 10 / 5 | — | #135 |
| `0x145de759b` | `0x1476f75b0` | `0x145de7583` | 7 / 7 | `0x145e0a13b` | #146 |
| `0x145de92a7` | `0x1476f75cc` | `0x145de928f` | 6 / 5 | `0x145e0be47` | #146 |
| `0x145e2cbb3` | `0x147724638` | `0x145e2cb9c` | 8 / 8 | `0x145e2bdb3` | #92 |
| `0x145e2d8d6` | `0x147724924` | `0x145e2d8bf` | 114 / 36 | `0x145e2cad6` | #92 |
| `0x145e2e683` | `0x147724aec` | `0x145e2e661` | 7 / 7 | `0x145e2d883` | #92 |
| `0x145e389ba` | `0x147725244` | `0x145e389a2` | 9 / 4 | `0x145e37e0a` | #186 |
| `0x145e83fd6` | `0x147aea194` | `0x145e83fbe` | 13 / 11 | `0x145e89a86` | #197/#198 |
| `0x145e90633` | `0x147aea224` | `0x145e90615` | 5 / 5 | `0x145e95d63` | #151 |
| `0x145e9e71c` | `0x147aec588` | `0x145e9e705` | 52 / 4 | — | #63/#154/#64/#65/#92 |
| `0x145e9e761` | `0x147aec530` | `0x145e9e74a` | 22 / 6 | — | #63/#154/#64/#65/#92 |
| `0x145e9f009` | `0x147aec658` | `0x145e9eff2` | 115 / 16 | — | #63/#154/#64/#65/#92 |
| `0x145ea0f9d` | `0x147aecb74` | `0x145ea0f7f` | 101 / 19 | — | #63/#154/#64/#65/#92 |
| `0x145ea10fb` | `0x147aecd08` | `0x145ea10e8` | 95 / 18 | — | #63/#154/#64/#65/#92 |
| `0x145ea112b` | `0x147aec9f8` | `0x145ea1114` | 95 / 18 | — | #63/#154/#64/#65/#92 |
| `0x145ea115e` | `0x147aece84` | `0x145ea1147` | 12 / 12 | — | #63/#154/#64/#65/#92 |
| `0x145ea1580` | `0x147aecedc` | `0x145ea1564` | 195 / 35 | — | #63/#154/#64/#65/#92 |
| `0x145ea15a8` | `0x147aed1e8` | `0x145ea1595` | 95 / 18 | — | #63/#154/#64/#65/#92 |
| `0x145ea15ec` | `0x147aeceb4` | `0x145ea15d5` | 10 / 9 | — | #63/#154/#64/#65/#92 |
| `0x145ea161f` | `0x147aed364` | `0x145ea1608` | 5 / 5 | — | #63/#154/#64/#65/#92 |
| `0x145ea19cc` | `0x147aed4dc` | `0x145ea19b3` | 195 / 35 | — | #63/#154/#64/#65/#92 |
| `0x145ea1ab2` | `0x147aed378` | `0x145ea1a94` | 89 / 10 | — | #63/#154/#64/#65/#92 |
| `0x145ea1ade` | `0x147aed800` | `0x145ea1ac7` | 34 / 11 | — | #63/#154/#64/#65/#92 |
| `0x145ea1b6f` | `0x147aed7e8` | `0x145ea1b58` | 6 / 6 | — | #63/#154/#64/#65/#92 |
| `0x145ea7797` | `0x147aeda3c` | `0x145ea7780` | 8 / 8 | — | #63/#154 |
| `0x145eb5cdb` | `0x147aeda5c` | `0x145eb5cc4` | 8 / 5 | `0x145ebb4eb` | #63/#154 |
| `0x145ecaff3` | `0x147aedbec` | `0x145ecafd8` | 24 / 9 | `0x145ed0e23` | #63/#154 |
| `0x145ecb323` | `0x147aedb94` | `0x145ecb30b` | 22 / 5 | `0x145ed1153` | #63/#154 |
| `0x145ecbb11` | `0x147aedca4` | `0x145ecbafd` | 22 / 5 | `0x145ed1941` | #63/#154 |
| `0x145f441d0` | `0x147af2fd8` | `0x145f441a4` | 32 / 32 | `0x145f6e4a0` | #149/#294 |
| `0x145f4c76c` | `0x147af30c0` | `0x145f4c754` | 6 / 6 | `0x145f76a3c` | #313/#318 |
| `0x145f53e53` | `0x147af3210` | `0x145f53e37` | 11 / 4 | — | #136/#316 |
| `0x145f5402e` | `0x147af323c` | `0x145f5401b` | 11 / 9 | `0x145f7e2fe` | #136/#316 |
| `0x145f546c9` | `0x147af3134` | `0x145f546ab` | 11 / 9 | — | #136/#316 |
| `0x145f5499b` | `0x147af318c` | `0x145f5498f` | 11 / 9 | `0x145f7ec6b` | #136/#316 |
| `0x145f8ebbd` | `0x147af37d0` | `0x145f8eb93` | 7 / 5 | — | #141 |
| `0x145f927b4` | `0x147af3668` | `0x145f9279d` | 9 / 9 | — | #315 |
| `0x145fb6b98` | `0x147af395c` | `0x145fb6b80` | 7 / 7 | `0x145fe5458` | #24/#138 |
| `0x145fb6c1c` | `0x147af3978` | `0x145fb6c04` | 7 / 7 | `0x145fe54dc` | #24/#138 |
| `0x14606561d` | `0x147afb0b8` | `0x146065606` | 49 / 29 | `0x14606be4d` | #85/#142 |

## Lobby event dispatch

All three tables are inside the `screens/coop.rs:440` app event owner
`0x140106060..0x140108579`. Its 9,497 bytes at file offset `0x105460`
have SHA-256
`dd81fe5256346a0eeb86a2b74185831ca06dfc9e44e3e435e5648bfa257ef9a1`.
The shared Ghidra result digest is
`171590c7cee8720a890ee6e04c377f76d239f6a7c27e5d17388b8f158c0296e3`.
The raw-slice result supplies the body trace. Exact PE reads supply the
external table cells and comparison literals.

| Site | Selector and validated destinations | Table SHA-256 |
| --- | --- | --- |
| `0x14010628e` | Event JSON `type` string length minus four at `0x14010626e`. Cases compare `coop` at `0x140106290`, `party` at `0x140106338`, `lobbies` at `0x1401061e2`, `coopchat` at `0x1401063cc` and `readycheck` at `0x140106444`. Lengths 6 and 9 fall through. | `2bfef437748ea76f6b1c5b5b4106a470f7869e6659cf791a0083ca596f7d64c7` |
| `0x140107bb3` | Incoming `coop` event's `state` length minus three at `0x140107b97`. Exact `off`, `closed`, `ended`, `refused` and `unavailable` select the roster and Ready Check reset at `0x140107c73`. Other statuses continue to chat and status handling. | `a375346b0f0a6e5ac16f34e2af6d6d91ec5b5a7fe8bf10be11414d2dfad91b39` |
| `0x140107cef` | The same state-length index at `0x140107cd0`. The five reset states, `joining` and a transition to `hosting` from another state reach chat reset at `0x140107e1a`. A repeated `hosting` event preserves chat. | `e703eb659eea2c4447abf8c93d9f500b7b1107dccc70e6a408101869122e66b8` |

The exact `closed` and `ended` comparisons at `0x140107eb4..0x140107ee9`
submit local request 22 through `0x140040100` at `0x140107eeb..0x140107f08`.
The game poller selects request 22 through `0x145ea7797` and enters
`0x145ea7799`. It calls service ensure at `0x145ea77b9` and submits the
refresh record at `0x145ea77fa` when the service is present and ready.
The rebuilt [status consumer](../../crates/azeroth-survivors-re/src/coop_ui.rs)
now queues the existing `FormRequest::Refresh` on those two transitions.
Its existing `coop_directory.rs` request drain performs service admission
and refresh. Refusal, off and unavailable states skip this route. All five
terminal states clear the displayed member and Ready Check state. Roster
projection requires an active party, so the retained host transport cannot
repopulate a closed party's display. Joining and a changed hosting state
reset chat without clearing the roster.

### Locked entry handoff

The `coop` branch checks the stored reason for the exact prefix `locked:`
at `0x140107f10..0x140107f30`. A match sets the co-op open latch at
`0x140107f36` and clears the menu entry tag at `0x140107f54`. The pointer
is the same resource the Ready result writes at `0x140106a44..0x140106a55`
with tag 1 and a pending timestamp of −1.0. The lobby root owner at
`0x1401035c3..0x1401035f1` retains the latch only while the native
main-menu byte at +13 is set and the entry tag is idle. The
[menu entry resource proof](menu-input.md#enter-action-and-keyboard)
independently identifies those fields and the pending-entry record on its
historical target.

The rebuilt service rejection and party closure paths in
[the directory pump](../../crates/azeroth-survivors-re/src/coop_directory.rs)
and the admitted guest denial in
[the co-op runtime](../../crates/azeroth-survivors-re/src/coop_runtime.rs)
send the reason through the same UI consumer. The lock prefix clears
pending entry and opens the co-op window while the reconstructed menu is
active. Ordinary reasons continue through the existing status
presentation. The shared menu resource maps the native active-menu gate
to the reconstructed run boundary. The existing lock string parser and
rank formatting retain their
[separate proof](coop.md#shared-simulation-and-replication).

The typed source paths for the first table are the directory pump for
lobbies and service state, and the co-op runtime and UI for roster, chat
and Ready Check. This trace covers the selected app switch sites. The distinct lobby, inspection and Ready Check
layers are covered by the [modal trace](native-interface-correspondence.md#ready-check-modal-construction).
Compilation, frame timing, interaction and network parity remain open.

## Unmatched predecessor contexts and stable questions

Each unmatched site below selects the corresponding 0.140.0 record in the
`predecessor_AS_context_tables` object. All 24 retain their original evidence
and source owners. Use the required selector, producer and consumer to
establish applicability when no equal geometry exists.

| 0.140.0 finding | Unmatched predecessor sites |
| --- | --- |
| #152 | `0x145e0493a` |
| #135 | `0x145e61955` |
| #63/#154 | `0x145ea43dc`, `0x145ea4421`, `0x145eacf77` |
| #63/#154/#64/#65/#92 | `0x145ea4cc9`, `0x145ea6893`, `0x145ea6acf`, `0x145ea6c2b`, `0x145ea6c54`, `0x145ea6c80`, `0x145ea700c`, `0x145ea72c0`, `0x145ea73ad`, `0x145ea73d5`, `0x145ea7452`, `0x145ea7666` |
| #64/#65 | `0x145ea6f7b`, `0x145ea6fa3`, `0x145ea6fe0` |
| #136/#316 | `0x145f7e124`, `0x145f7e996` |
| #141 | `0x145fbcd0a`, `0x145fc0924` |

All 14 stable historical questions remain in the
[computed correspondence frontier](evidence/computed-correspondence-frontier.json).
The Codex question `retained-table-1403076a2` has a bounded current
producer-to-formatter proof at `0x140374fd5`. The other 13 remain current applicability
work under #64/#65. Recover actual opcode admission, selector domains,
descriptor production and recipient packet/cache boundaries. This retains
the prior classifications and source contracts with their original target.
The remaining computed-edge, code/data and dynamic-reference queue lives
under [#41](../CURRENT-STATE.md#gap-41). Compilation, game and service execution,
and controlled original/rebuilt comparisons remain open.

## Retained reports

[0.140.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/switch-context-source-review-0.140.0.md) · [0.139.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/switch-context-source-review-0.139.1.md) · [0.139.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/switch-context-source-review-0.139.0.md)
