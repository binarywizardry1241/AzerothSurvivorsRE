# Source-first discovery frontier — 0.127.0

Selected installed EXE SHA-256:
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [machine assessment](evidence/0.127.0/source-frontier.json) binds the complete
current/predecessor inventories, exact diagnostic leads, all added literal
candidates and inspected source hashes. It establishes navigation and bounded
source interface roles; native dependency correspondence, recovered semantics
and original/rebuilt parity remain separate.

## New diagnostic modules

The complete comparison with 0.123.0 adds **three AS diagnostic paths**, taking
the current population from 66 to **69**. None disappears. Prior implementations,
semantic recovery and issue identities remain retained with their actual target
provenance. The ranges below are declared unwind owners of independently decoded
diagnostic references; they are not a claim of complete Ghidra body ownership or
recovered behavior.

| Stable module / finding | Exact current native leads | Source interface and missing recovery |
| --- | --- | --- |
| `custom-app-screens-ime` / #293 | `screens/ime.rs`: Location `0x146278890` (63:23), instruction `0x1402dd75f`, owner `0x1402dd560..0x1402dd772`; Locations `0x1462788a8/0x1462788c0` (110:27/138:11), instructions `0x1402dd9ef/0x1402ddd78`, owner `0x1402dd780..0x1402ddd8e`. | The [IME bridge](ime-bridge-0.127.0.md) connects native process-key filtering, Commit forwarding, focused picker/FrameXML typing, caret/window updates and the recovered schedule boundary through `ime.rs`. This establishes partial source assignment. The reader census finds no other AS Preedit consumer; visible preedit/composing-Enter and browser resource/source boundaries remain open under #293. |
| `custom-app-screens-ontop` / #11 | `screens/ontop.rs`: Locations `0x146261268/0x146261280` (58:29/70:11), owner `0x1402130f0..0x140213828`; Location `0x1462612b0` (38:44), owner `0x1402138e0..0x140213b7e`; Location `0x146261298` (15:9), owner `0x140217070..0x1402174b1`. | The [current on-top source](above-card-frames-0.127.0.md) connects exact Lua registry publication, comma-name conversion and actual-hit/all-parent input predicates through the existing benilla layout/VM/render interfaces. This closes the selected #11 source interface; platform, renderer, VM lifecycle and original/rebuilt interaction remain verification work. |
| `custom-game-smsg` / #298 | `smsg.rs`: Locations `0x14702e358/0x14702e370/0x14702e388/0x14702e3a0` (308:29/38/51/64), owner `0x145afbe60..0x145afc15a`; Location `0x14702e7f0` (317:13), owner `0x145b00d90..0x145b00f44`. | `coop/engine_packets.rs`, `coop/replication.rs`, `gameplay/coop_commands.rs` and `gameplay/coop.rs` now connect the bounded ItemQuery path: actual opcode `0x58`, native variant 24 / wire 25, recipient-localized ordered strings, guest validation/sanitization/persistent interning and recursive ordinary-engine submission. The [carrier proof](coop-item-carrier-0.127.0.md) establishes this assignment; wider message/type/alias semantics and runtime delivery remain open. |

The initial source-first review left both **partial source correspondence** and
**registered current-target bounded contract** pending for each module. The
initial bounded native review below recovered limited on-top and message
contracts. Subsequent source work connects the [on-top bridge](above-card-frames-0.127.0.md)
the [recipient ItemQuery lifecycle](coop-item-carrier-0.127.0.md) and the
[IME commit/focus interface](ime-bridge-0.127.0.md); these are
bounded assignments, not complete module equivalence. The exact ledger selectors are
`systems[id=custom-app-screens-ime]`, `systems[id=custom-app-screens-ontop]` and
`systems[id=custom-game-smsg]`. These feature/subcase owners preserve the distinction
between candidate source interfaces and established native/source correspondence.
#298 now has a bounded native/source assignment through #101: actual recipient
ItemQuery replies, ordered spell text, guest sanitization/persistent interning and
ordinary engine admission. Wider message/type/alias discovery remains #41.
Compilation, execution and parity are separately unverified.

## Candidates beyond filenames

The complete distinct-literal delta adds **31 namespace candidates**, **11 game
binding identifiers**, **five Lua function declarations** and **two resource
candidates**. All **63 added candidate occurrences** have exact
`Q41-I01:<category>:<ordinal>` selectors and source-first assessments in the
machine record. Duplicate literal occurrences remain separate selectors; the
distinct and occurrence counts must not be added as independent behaviors.

| Connected feature | Exact added candidate selectors | Source-first outcome and next static question |
| --- | --- | --- |
| Amulet replacement confirmation / #18 | Namespace rows 44, 47 and 158: `cards::ConfirmAct`, `cards::ConfirmPanel`, `cards::ConfirmRoot` | Existing `gameplay/native_overlays.rs` carries `Card::replacement` and `ReplacementItem` data. Recover the opening payload, comparison stats, accept/cancel routing and modal lifetime; tooltip data alone does not establish the new confirmation. |
| Lobby chat, staff names and scroll retention / #291 | Namespace rows 0 and 143: packed `coop::StaffName` / `scrollbar::ToEnd`, and `coop::ChatList` | Existing `coop_ui.rs`, `coop/session.rs` and `scrollbar.rs` are actual seams. Recover chat message/cache publication and retained/end-following scroll state before treating neighboring type names as a shared root cause. |
| Armory foot glow / #297 | Namespace row 82: `armory::Stand` | `armory.rs:1906` already builds an oval radial-gradient node under the preview. The remaining question is exact current native foot projection, dimensions, position, colors and interaction with preview framing; no new visual mismatch is proved by this literal. |
| On-top addon frames / #11 | Namespace rows 216 and 686: `OverScreensPlugin` / `OverScreensCamera`; new `AZS_ON_TOP*`, `AZS_FrameName`, `AZS_SetOnTopOfScreens` and `AZS_IsOnTopOfScreens` binding/Lua rows | Recover the AS bridge and its required shared camera/order/input interface once. Do not recurse through the generic renderer because a new bridge calls it. `AZS_ON_TOP_FRAMESMessage` is a packed regex candidate, not an asserted API name. |
| Totem snapshot feed / #284 | New `AZS_TOTEMS`, `AZS_GetTotems`, `AZS_GetTotemCount` and `AZS_TOTEMS_UPDATED` binding/Lua rows | Reuse the retained 0.125.0 recovery, then map exact current Lua/native producers and recipient/lifetime dependencies. Missing 0.127.0 applicability does not erase that recovered contract. |

`AZS_OPENLEVELS` reappears with a changed packed boundary; existing
`native_bindings.rs` / `gameplay/stored_hud.rs` supply its role. It is not an
independent new binding behavior. Other namespace changes are packed/suffix
changes for existing plugin composition, menu scene/preview, Discord, world hold,
trainer respec, gamma, item text, quest log, loot rolls, inspect, tooltips,
developer instruments, platform thread/window/quit, targeting, pet spellbook,
audio output, UI quads, chat, moving transports, stables, opaque rendering,
portal visibility and model/terrain/texture loading. Actual corresponding local
source interfaces were inspected. These observations do not prove the native
compiled revision or behavioral equivalence. The moving-WoW-transport namespace
is not evidence about co-op relay transport.

The two added resource candidates stop at existing generic interfaces:

| Resource selector | Existing boundary and limits |
| --- | --- |
| `Q41-I01:resource_path:51`: `AccountLoginRealmlist.xml` | Existing `benilla-app/assets/ui/AccountLoginRealmlist.xml`, `realmlist.rs` and `ui_script/glue_mgr.rs` provide the dialog/control interface. The predecessor regex candidate included adjacent `FrameXML` text. No AS-specific resource addition is established. |
| `Q41-I01:resource_path:258`: `DBFilesClient\Cfg_Categories.dbc` | Existing `benilla-formats/src/cfg_categories.rs::load_realm_categories` reads the region/category/localized-name schema; `glue_session/login.rs` supplies existing login context. Recover further only if an AS-specific consumer/override is demonstrated. |

Five resource literals leave the regex set: rotation-right button, shadow blob,
LoadingScreens, PetPersonality and packed FrameXML realmlist. Removal from a
candidate set does not prove that their assets/consumers disappeared. Exact
removed memberships are retained in the machine delta; historical resource
recovery remains usable within its original bounds. Lua/UI registrations,
textual ID assignments, textual numeric IDs and save/configuration-key literal
sets are unchanged. Equal literal sets do not establish unchanged layouts,
dispatch, IDs or behavior.

## Initial bounded native review

The [native manifest](evidence/0.127.0/source-frontier-native.json) retains six
journaled REA/Ghidra queries over exact declared owner slices: **5,796 native
code bytes / 1,362 independently decoded instructions**, plus the exact
**17-byte** registry name. Every raw subject, original PE mapping, result,
provider/profile, plan and completed journal operation passes the existing
`discovery_native_subject.verify_native_query_subject` checks. The six canonical
pseudocode extracts are selected by that manifest. Raw slices omit surrounding
callees, imports and data; generic GCC decompiler signatures are not the Windows
calling convention. Original instructions independently bind the registry's
Windows-x64 argument registers. Linear decoding is not flow/body completeness.

| Reviewed current scope | Native result and precise remaining boundary |
| --- | --- |
| IME event/window interface / #293 | The first owner reads stride `0x58` records, checks variant `0x4f`, drains reader state and forwards a retained range. The second combines requested/helper bytes, clears a one-shot byte, compares previous byte/vec2 state and updates changed Window-like fields `+0xe1` / `+0xb0`. The exact event variant/type, helper origin and composition/Enter/submit meaning remain unresolved. This is structural evidence, not a registered behavioral IME contract. |
| On-top registry read / #11 | Original instructions `0x140213a05..0x140213a1e` pass `AZS_ON_TOP_FRAMES` at `0x146260c5a`, length `0x11`, via R8/R9 to helper `0x140664650`. The owner handles absent VM/global sentinels, converts a returned value and cleans owned vector elements. The companion owner validates cursor coordinates against Window-like dimensions and refreshes retained list state. Only the AS registry read/conversion boundary is recovered: helper/parser semantics, frame-name resolution, camera/visibility/input/resize consumers and complete layering remain pending. |
| Item-query spell-slot transform / #298, connected #101 | Both message owners reject error/high-bit entries and walk four NUL strings starting after the 12-byte entry/class/subclass header. They read or rewrite five u32 cells at the end of those strings plus `0x104 + i*0x18`. The actual existing `benilla-protocol/src/messages/items.rs::read_item_query_response` schema and `coop/engine_packets.rs::item` put the five `spell_id` fields there and preserve their ordinals. The rewrite returns the owned vector on success or consumes it and returns absence on malformed input. These initial helper contracts are retained in their exact scope. The subsequent [carrier proof](coop-item-carrier-0.127.0.md) recovers and connects actual opcode/caller admission, synthetic-ID remapping, recipient context and consumers. Neither scope proves jewelry numeric equations or the complete message module. |

The shared VM boundary is already available in
`benilla-ui/src/script/mod.rs`: `lua()` (836), `eval()` (1136), `frame_visible()`
(1214) and `named_frame_normalized_rect()` (1224). Reuse those interfaces rather
than reconstructing VM internals. That source also records that
`OnInputLanguageChanged` is stored but never runs because the engine has no input
method (566); the new AS input-method producer still needs connection.

The initial [bounded graph reviews](evidence/0.127.0/as-discovery-reviews.json) retain
each exact query/result link and three feature-owned module dimension bindings.
Unknown event/component types and mixed ECS plumbing remain unknown; one
AS-specific registry call does not classify the surrounding engine machinery or
complete its module. The current graph register records subsequent bounded review and source-assignment
updates separately from these initial six native queries. Previous graph/recovery pointers retain their
original target and do not transfer applicability automatically.

No application compilation, compiling test, client/game/network/server operation
or controlled original/rebuilt comparison occurred. The parent audit's full-image
census and embedded-script extraction retain their separate evidence. Generic
supporting uncertainty stays in the residual queue unless a concrete AS boundary
requires further bounded recovery.
