# Source-first discovery frontier — 0.139.0

Selected installed EXE SHA-256: `0e8e314df4d78ab211b1bef5c48d78d713ed64260894af342f998d298d74d274`; **150,595,584 bytes**.

The [machine review](evidence/0.139.0/source-frontier.json) binds the complete current/predecessor inventories, a frozen current diagnostic receipt, inspected source hashes and every added candidate occurrence. It records source reuse seams and bounded interface questions. Candidate source ownership, recovered native semantics, reconstructed source and verified parity remain separate.

## Eight new diagnostic modules

The comparison with 0.127.0 adds **eight AS diagnostic paths**, taking the discovered population from **69 to 77**; none disappears. Every new path has independently decoded references. The following are declared unwind owners, not complete Ghidra function/body or behavioral ownership certificates. All eight source assignments remain **candidate-only** in this review; existing analogous source does not establish partial reconstruction of the new native module.

| Module / source finding | Exact current diagnostic/declared-owner lead | Reuse seam and missing contract |
| --- | --- | --- |
| `custom-app-screens-inspect` / #299 | `crates/wenilla-rogue-app/src/screens/inspect.rs`; Location `0x1465433f8`, instruction `0x1400b361d`, owner `0x1400b34a0..0x1400b365b`. Full owner/reference selectors are in the machine review. | Party/profile, Armory, preview, read-only talent tree and achievement timestamp source exist. Recover the actual member snapshot/request/change subscription and all inspection tabs. |
| `custom-app-screens-localclock` / #302 | `crates/wenilla-rogue-app/src/screens/localclock.rs`; Location `0x146543658`, instruction `0x1402fe0ae`, owner `0x1402fe070..0x1402fe432`. Full owner/reference selectors are in the machine review. | HUD registry/bootstrap and Options/VM/CVar seams exist; current source has ten HUD parts and no localClock entry. Recover native local time, formatting, widget gates and cross-VM lifetime. |
| `custom-app-screens-readycheck` / #306 | `crates/wenilla-rogue-app/src/screens/readycheck.rs`; Location `0x14650c600`, instruction `0x14011e009`, owner `0x14011dc10..0x14011eaf9`. Full owner/reference selectors are in the machine review. | Party UI/session/server source exists; recover custom ready-state messages, answers, cancel/timeout/member-change handling and final zone admission. Stock engine ready-check support is a separate interface. |
| `custom-app-screens-recap` / #300 | `crates/wenilla-rogue-app/src/screens/recap.rs`; Location `0x146510f40`, instruction `0x140178ec1`, owner `0x140178750..0x140178f2a`. Full owner/reference selectors are in the machine review. | Terminal state currently stores aggregate damage taken. Recover per-player last-hit history, killing blow, shield/health/overkill, grouping/avoidable/source totals and recap input lifetime. |
| `custom-game-game-enhancement` / #305 | `crates/wenilla-rogue/src/game/enhancement.rs`; Location `0x147a1b5e0`, instruction `0x145ec0617`, owner `0x145ebdd50..0x145ec06c2`. Full owner/reference selectors are in the machine review. | Historical spell/passive/talent source exists and still lists Call of Flame. Recover the current 0.137 proc graph, repeats, necklaces, migration and Stormguard producers. |
| `custom-game-game-meterfeed` / #75 | `crates/wenilla-rogue/src/game/meterfeed.rs`; Location `0x14734ffa8`, instruction `0x145dd3fd1`, owner `0x145dd3d50..0x145dd4015`. Full owner/reference selectors are in the machine review. | Existing ledger/provenance and legacy addon publication are reuse seams. Reuse the exact new Lua consumer, then recover native serializers, history/descriptors, authority and reload replay. |
| `custom-game-game-meterlog` / #75 | `crates/wenilla-rogue/src/game/meterlog.rs`; Location `0x147330af0`, instruction `0x145dcdc84`, owner `0x145dccc90..0x145dcdcba`. Full owner/reference selectors are in the machine review. | Existing ledger/provenance and legacy addon publication are reuse seams. Reuse the exact new Lua consumer, then recover native serializers, history/descriptors, authority and reload replay. |
| `custom-game-server-party-readycheck` / #306 | `crates/wenilla-rogue/src/server/party/readycheck.rs`; Location `0x14769e458`, instruction `0x145e4be44`, owner `0x145e4bdb0..0x145e4be58`. Full owner/reference selectors are in the machine review. | Party UI/session/server source exists; recover custom ready-state messages, answers, cancel/timeout/member-change handling and final zone admission. Stock engine ready-check support is a separate interface. |

Each module has its exact `diagnostics[path=…]` selector, full declared-owner ranges/hashes, representative reference, candidate source files and next static step in the machine record. The corresponding `systems[id=…]` rows must retain both missing dimensions: source assignment and current-target bounded contract. This source-first review establishes neither dimension for these eight modules.

## Every added literal occurrence

| Candidate population | Added distinct literals | Added occurrences reviewed |
| --- | ---: | ---: |
| `module_type_namespace` | 116 | 120 |
| `game_binding_identifier` | 85 | 470 |
| `lua_ui_registration` | 0 | 0 |
| `textual_id_assignment` | 3 | 5 |
| `textual_numeric_id` | 0 | 0 |
| `save_configuration_key_lead` | 0 | 0 |
| `resource_path` | 21 | 21 |
| `lua_function_declaration` | 68 | 68 |
| **Total** | **293** | **684** |

All 684 occurrences are assigned exactly once to the groups below, using exact `Q41-I01:<category>:<ordinal>` inventory selectors. The hash-bound inventory retains the literal, original bytes/range and address; the curated review does not duplicate that bulk inventory. Repeated literal occurrences are not independent behaviors. Regex candidates can join packed adjacent names or instruction bytes: `AZS_SKIP*`, `AZS_OPENI` and long namespace strings are not asserted API/type identities. The bounded stored-level comparison below resolves this one `AZS_OPENI` occurrence.

| Reviewed source boundary | Occurrences | Source/recovery owner |
| --- | ---: | --- |
| `lobby-inspect` | 9 | #299 |
| `local-clock` | 8 | #302 |
| `ready-check` | 5 | #306 |
| `death-recap` | 2 | #300 |
| `enhancement` | 3 | #305 |
| `meter-ledger` | 477 | #75 |
| `player-position` | 19 | #137 |
| `combat-text-anchors` | 37 | #307 |
| `host-control-composition` | 1 | #302, #137, #11 |
| `skip-binding` | 6 | #304 |
| `stored-level-binding` | 1 | #21 |
| `manual-update-check` | 2 | #132, #77 |
| `menu-preview-interface` | 1 | #60, #297 |
| `loading-interface` | 8 | #61 |
| `engine-client-context` | 61 | Generic supporting context; native role/revision correspondence unproved |
| `engine-world-context` | 22 | Generic supporting context; native role/revision correspondence unproved |
| `engine-assets-context` | 4 | Generic supporting context; native role/revision correspondence unproved |
| `engine-lua-context` | 1 | Generic supporting context; native role/revision correspondence unproved |
| `engine-resource-context` | 17 | Generic supporting context; native role/revision correspondence unproved |

The machine groups contain the actual inspected source files, precise assessment, complete selector membership and next static action. Independent AS leads use their feature owners; generic renderer/codec/compiler/OS/context uncertainty remains in the exact residual partition and is not relabeled as a gameplay defect. Source names and inspected source roles do not prove whole-function native exclusions.

## Bounded stored-level binding comparison

`Q41-I01:game_binding_identifier:3` at file `0x1f730f` is executable code, not a renamed binding. The hash-bound current range `[0x1f730d,0x1f7367)` (preferred PE VAs `[0x1401f7f0d,0x1401f7f67)`) independently decodes with Capstone 5.0.7 as 21 instructions over 90 bytes. Its exact bytes, range hash, decoder binding and canonical instructions are retained in `bounded_native_reviews[id=stored-level-binding-literal]` in the machine review.

The first `movabs` loads `AZS_OPEN`; the next loads `ENLEVELS`. The apparent trailing `I` in the regex candidate is byte `0x49`, the next instruction’s REX prefix. The later predicate checks length 14 and compares the first 8 bytes and bytes+6 against those two constants, combining mismatch bits. This proves the exact `AZS_OPENLEVELS` string comparison and matches the existing `native_bindings.rs::COMMAND` literal. It does not establish complete binding dispatch, VM publication, saved/default/rebind behavior or the downstream consumer.

Keep **#21**’s existing implementation and verification history; this regex hit establishes no new source defect and does not by itself reopen that source repair. Any independent current-target dispatch/consumer applicability remains separately pending under its existing owner. No module contract or whole-function source correspondence is registered from this bounded predicate.

## AS interfaces moved into engine namespaces

`benilla_app::host_controls` adds concrete AS-facing dependencies: `combat_text` belongs to **#307**, `local_clock` to **#302**, `player_position` to **#137**, and the packed composition includes `over_screens` under **#11**. The existing reconstructed client supplies `LocalClientExtension`, the stock combat-text and camera/UI passes, player control, and the on-top adapter. Those are reuse boundaries, not proof that the newer compiled interfaces already exist or match. Recover the specific registration, producer/state, schedule and consumer contract, then stop at the established generic engine seam.

Existing source also supplies menu-scene/hero-preview requests (**#60/#297**), loading art/cover/progress (**#61**), ordinary bindings/VM/item/network/UI, and world/asset rendering interfaces. The local upstream baseline and overrides remain those in [benilla provenance](benilla-vendor.json). The compiled 0.139 engine revision is unproved. Packed engine-only namespace/resource deltas do not authorize reconstructing the whole generic engine or imply lost AS implementation.

## API and data review

- **Clock /#302:** [current embedded Lua](evidence/0.139.0/embedded-api.lua) explicitly calls `AZS_NativeLocalTime`, handles unavailable/failed reads and returns a fresh `{text,hour,minute,is24Hour}` table. It documents availability outside runs and while hidden. The native device-time producer and its independent VM/widget/CVar lifetime still require recovery. Existing `gameplay/run_hud/settings.rs` has ten parts, while `addon_bootstrap.rs` embeds 0.127 Lua.
- **Full meter /#75:** the primary 22,984-byte API is not the meter implementation. The separate [50,637-byte meter Lua](evidence/0.139.0/meter-api.lua), bound by the [supplemental-script manifest](evidence/0.139.0/addon-supplemental-scripts.json), assembles multipart frames, checks predecessor sequences, reconstructs descriptors/source/actor closure and validates query, checkpoint, loadout and portrait operations. It requests replay after reload. Native serialization/authority, row accounting, history and replay delivery remain open; feature flags alone do not prove them.
- **Live position /#137:** `AZS_SpaceOf`/`AZS_TagSpace` create `m<map>:<run-or-none>` identities. The meter-script wrapper reads `AZS_NativePlayerSample`, validates finite coordinates, map and frame sample, and keeps run/map matching explicit. Historical server-movement addon packets are not proof of this rendered-pose interface.
- **Anchored addon combat text /#307:** primary Lua supplies capability values, cursor/project wrappers, a handler registry and the callback loop. Existing ordinary `benilla-app/src/combat_text/mod.rs` already anchors the game’s own numbers. The new independently readable addon stream, dead-target anchor retention, native frame scheduling and source attribution are separate missing contracts.
- **0.139 attribution /#307:** the supplied [addon reference](../addon-api/reference-supplied-0.139.0.md) omits `meterSource` and `meterSourceKey` from its combat-event table. Native packed keys occur at file offsets `0x65d5078` and `0x65d5083`; exact lengths/hashes are in the machine review. Their presence establishes a current data lead, not the promised proc/pet/sourceKey constructor semantics. The primary Lua wrapper delegates those events to native code.
- **Stormguard /#305:** the separate [PaperDoll patch](evidence/0.139.0/paperdoll-run-stats.lua) reads `bwk`/`bwa` to show active/inactive Stormguard under Armor. Recover the numeric reducer, Lightning Shield state and stat publication; the label alone does not prove the cap or gameplay effect.
- **IDs:** `runId=1`, `ownerId=1` and `checkpointId=1` are Lua query/loadout allowed-key sets. They are not recovered numeric gameplay or wire enum values.

The [clock proposal](../addon-api/local-clock-proposal-supplied.md) and addon reference are user-supplied guidance. They do not replace current EXE-bound consumers or certify live behavior. Complete source, exact Lua, native consumer recovery and runtime comparison are independent evidence levels.

## Limits and next static frontier

This completes the added-candidate source-first review, not all six global semantic discovery stages. No native decompilation or registered module contract was produced by this review. The one bounded instruction comparison above establishes only its stated string predicate. The [current native census](native-census-0.139.0.md), [AS graph](coverage/as-discovery.json), [CURRENT-STATE](../CURRENT-STATE.md) and exact unknown queue own the broader frontier. Follow each numbered feature’s pending registration/dispatch/state/data/consumer questions using these selectors and retained recovery.

Prior semantic knowledge, source repairs and stable issue identities remain retained with their actual target provenance. Pending 0.139 correspondence does not erase them. Compilation, compiling tests, client/game/network/server execution and controlled original/rebuilt comparisons were not performed; parity is unverified.
