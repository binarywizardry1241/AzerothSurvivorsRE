# Source-first discovery frontier for 0.141.0

The installed PE contains 151,493,632 bytes and has SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [whole-image discovery delta](evidence/0.141.0/discovery-delta.json)
compares the verified 0.141.0 and 0.140.0 inventories. Addresses are
preferred PE virtual addresses.

## Scholomance gear diagnostic

The scan added one AS diagnostic path and removed none. The new path,
`crates/wenilla-rogue/src/gear/t05.rs`, occurs at file offset `0x7724429`
and VA `0x147725e29`. The Rust Location at `0x147725e50` records line
217, column 17. Its sole verified reference is the instruction at
`0x145e44cfa` in extent `0x145e44ab0..0x145e44d0c`. The [diagnostic
receipt](coverage/diagnostic-ownership.json) selects the full row by
`diagnostics[path='crates/wenilla-rogue/src/gear/t05.rs']`.

The 604-byte extent at file offset `0x5e43eb0` has SHA-256
`a1a29d3e2fb7b41d3765392b34d79d5f91e98e899000cf0d5a4b8b064a916a07`.
It matches the [current Scholomance roll proof](scholomance-loot-0.141.0.md),
including the owned-item filter, armor selection and full class weapon
group. The rebuilt source supplies the item identifiers and slot sets in
[`tier05.rs`](../../crates/azeroth-survivors-re/src/tier05.rs),
the reward selection in
[`mob_loot.rs::roll_scholomance_rewards`](../../crates/azeroth-survivors-re/src/mob_loot.rs),
and the Armory rate and ownership consumers in
[`armory.rs`](../../crates/azeroth-survivors-re/src/armory.rs) and
[`coop_profile.rs`](../../crates/azeroth-survivors-re/src/coop_profile.rs).
The bounded scope is registered under `systems[id=custom-game-gear-t05]`
and [#314](../verification-needed.md#gap-314). Wider Tier 0.5 catalog
and set-effect evidence retains its [0.140.0 provenance](scholomance-0.140.0.md).
The diagnostic path adds no independent gameplay defect. The #314
verification record retains the compilation, save, UI, co-op and parity checks.

## Exact distinct-literal changes

`+n` and `−n` are one-based selectors into the
`candidate_changes.module_type_namespace.added` and `.removed`
arrays in the [delta](evidence/0.141.0/discovery-delta.json). The corresponding
literal selects the full byte range in the current or predecessor inventory.
All four additions and five removals are namespace matches.

| Exact selectors | Source owner and disposition |
| --- | --- |
| `+1` file `0x659a9ef` (459 bytes), `+2` file `0x65cc548` (55 bytes), `−1…−3` | The same MenuScene, HeroPreview, LocalClock, TouchDrive, PlayerPosition, InputGate, CombatText, OverScreens, WorldAnchors and WorldHold names are packed into two matches. Follow the existing menu/preview and loading seams under [#60](../CURRENT-STATE.md#gap-60) and [#61](../CURRENT-STATE.md#gap-61), and the existing overlay under [#11](../CURRENT-STATE.md#gap-11). Preserve the separately recovered [clock](../verification-needed.md#gap-302), [position](../verification-needed.md#gap-137), [input](../verification-needed.md#gap-310) and [combat](../verification-needed.md#gap-307) adapters. Use [#317](../CURRENT-STATE.md#gap-317) for the outstanding callback order. These match boundaries do not establish changed registration or execution order. |
| `+3` file `0x69c6422` (31 bytes), `−4` | The generic `benilla_assets::gpu_blp` match changes its trailing `messagey` to `message9`. The source boundary remains [`gpu_blp.rs`](../../crates/benilla-assets/src/gpu_blp.rs), with no specific AS dependency change shown. |
| `+4` file `0x686c72c` (29 bytes), `−5` | The generic `benilla_world::skybox` match gains a trailing `A` after `message`. Reuse [`skybox.rs`](../../crates/benilla-world/src/skybox.rs) as the source boundary. The literal supplies no AS skybox change. |

The distinct binding, Lua declaration, UI registration, textual ID,
save/configuration and resource-path populations are unchanged. The PE
import library/function sets are also unchanged. The 28,656-byte main
addon Lua span at file offset `0x7ae141a` matches the [canonical retained
extract](evidence/0.140.0/embedded-api.lua) with SHA-256
`24be94eb96a3e539ab7d30a9171090cfd15e2667efa0a9423802b37705f4e8e6`.
Exact Lua bytes leave native producer and scheduling correspondence
as separate questions.

## Q41-I01 embedded Lua, bindings and persistence

The [embedded classification receipt](evidence/0.141.0/data-classification/manifest.json)
selects all 2,901 occurrences. The following byte joins account for 930 of
949 binding-identifier, 149 of 259 Lua declaration, 29 of 347 Lua
registration-token and five of seven textual-ID occurrences. Select each
row in `outputs['embedded-classification.jsonl']` by file offset within the
half-open span and category. The two combat slices fall within the main
addon API span and their occurrences count once.

| File offset / bytes | Exact payload and rebuilt consumer |
| --- | --- |
| `0x76ec4d8` / 11,034 | The [core patch](evidence/0.108.0/hud-framexml/world-state-patch.lua) with the [raid popup](evidence/0.115.0/raid-targets/popup.lua) inserted at byte 9,728. The pointer/length at file `0x76eeff8` confirms the full span and its SHA-256 is `c71f24c567d36c3c7f7c557e71ef8e136c6d62ae34369f3fdae386f623061809`. The rebuilt client installs these through the [core](../../crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs) and [raid](../../crates/azeroth-survivors-re/src/gameplay/client/raid_targets.rs) append paths. |
| `0x73a90c3` / 271 | [StaticPopup death wrapper](evidence/0.115.0/death-popup.lua), installed by the core append path. |
| `0x7ae141a` / 28,656 | [Main addon API](evidence/0.140.0/embedded-api.lua). The [rebuilt extension](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs) composes recovered sections into the WorldStateFrame append. |
| `0x76dfef4` / 50,637 | [Meter API](evidence/0.139.1/meter-api.lua), including the five textual IDs at ordinals 2–6. The `AZS_ML_QUERY` and `AZS_ML_LOADOUT` Lua tables use value 1 as request defaults. The [typed producer and publication gap](detailed-meter-0.141.0.md) remains #75. |
| `0x76ef063` / 9,167 | [PaperDoll Lua](evidence/0.139.1/paperdoll-run-stats.lua). [The rebuilt character pane](../../crates/azeroth-survivors-re/src/gameplay/client/run_stats.rs) incorporates its Stormguard helper in the retained run-stats postlude. Byte identity of the native span does not establish whole-pane source equivalence. |
| `0x7ae478c` / 1,810 and `0x7ae4e9e` / 830 | [Combat text API](evidence/0.139.2/combat-text/event-projection-api.lua) and [frame handlers](evidence/0.139.2/combat-text/frame-handlers.lua), appended by the rebuilt extension. |

Outside those spans, the other two textual IDs are the `bagId = 0`
loop starts in `BenillaOpenBackpack` and `BenillaCloseBackpack` at
`0x1466cbbad` and `0x1466cbdc6`. The [existing XML adapter](../../crates/benilla-app/assets/ui/ContainerFrameAdapters.xml)
contains both loops. Of the 110 remaining Lua declaration matches, 109 have
engine source-literal context and ordinal 109 crosses the end of the
shader diagnostic “Not a global variable or a function argument” into the
next packed diagnostic. The remaining 318 registration-token rows have
source-literal occurrences. These engine source matches establish lexical
context only. Recover an actual loader, callback or dispatch edge before
assigning behavior to any remaining token.

All 19 binding-identifier rows outside the seven spans have bounded roles.
Ordinals 0–6 are machine operands. The instructions at `0x140080fa2`,
`0x1401ef4cb`, `0x1401f3239`, `0x1401ffd51` and `0x1402005c6` carry
eight-byte `AZS_SKIP` immediates. `0x1401f3c38` and `0x1401fff57` carry the
first eight bytes of `AZS_OPENLEVELS`. Their partner immediates at
`0x1401f3c45` and `0x1401fff61` overlap by two bytes to cover the 14-byte
name. Longer apparent spellings consume the next instruction's prefix or
opcode. The [source command table](../../crates/azeroth-survivors-re/src/native_bindings.rs)
and Options use the actual names. Ordinals 7–13 contain player sample,
packed combat/world callback names, talent toggles, local clock, the
skip name and the overlay registry. The [callback trace](world-anchors-0.141.0.md#frame-callback-registration)
establishes separate registration for the two packed callback families.
Ordinals 16–18 are the SC/JP/KR font filenames used by [menu fonts](../../crates/azeroth-survivors-re/src/menu_fonts.rs).
Ordinals 947–948 select the stored-level binding and its Lua command.

The packed namespace change has a concrete name boundary. The native
`0x1401dc950` leaf returns the 59-byte OverScreens plugin name at
`0x14659c542` inside namespace ordinal 5. Its [descriptor and consumer](above-card-frames-0.141.0.md#registration-and-shared-state)
prove that the whole concatenation is not one registration or a schedule
order. The adjacent generic tracing rows at namespace ordinals 933 and
987 have independent relocation-backed slices for the namespace and the
seven-byte `message` field. Their trailing characters are outside that field.
Other plugin interfaces retain the individual owners above.

The ReputationFrame path at resource ordinal 222 has distinct read and
publication sites at `0x145ddb13a` and `0x145ddb1f6`. In between, the
formatter at `0x145ddb1c8` takes the little-endian `u32` value 120 at
`0x1476e1848` and the packed template at `0x1476e184c`. This explains why
the completed Lua line is absent as a contiguous PE string. The existing
[ReputationFrame append](evidence/0.127.0/run-level-cap.lua) supplies the
result under [#181](../verification-needed.md#gap-181).

| Save/configuration ordinal | Current role and source boundary |
| --- | --- |
| 0, 4 | The producer in `0x145ebb750` writes eight bytes from `0x147aeaade` into the four-byte JSON key `type` at `0x145ebc203`. The frontend `movabs/cmp/je` at `0x140052b75..0x140052b88` dispatches to `0x140053216`; that case selects the six-byte `talent` context at `0x140053260`. The [existing request and context](../../crates/azeroth-survivors-re/src/talent_context.rs) connect to the [terminal consumer](../../crates/azeroth-survivors-re/src/gameplay/terminal.rs). This is an event discriminator. |
| 1 | `0x14001872e` selects an 11-byte relative-name comparison in the [legacy migration](legacy-config-0.113.2.md) path. The current source counterpart is [legacy_config.rs](../../crates/azeroth-survivors-re/src/legacy_config.rs). |
| 2 | `0x1411e64b3` and `0x1411e8652` pass the same 11-byte filename to the shared path join. The existing [CVar owner](../../crates/benilla-app/src/cvars/mod.rs) and [home resolver](../../crates/benilla-app/src/local_state.rs) use this filename. |
| 3 | The bytes occur within the saved-account-name migration diagnostic at `0x146726f70`. `adopt_legacy_account` has the corresponding message and CVar path. |
| 5 | The resolver `0x145eef4b0` checks the 14-byte `WOW_ROGUE_SAVE` first and returns a present override. Otherwise it calls the base-directory helper at `0x145eef506` and appends the 14-byte `characters.txt` from `0x147aee27d`. [save.rs](../../crates/azeroth-survivors-re/src/save.rs) uses the same priority. |

The bounded classification identifies no new gameplay or persistence source
defect. The full inventory remains intact. Unresolved type layouts,
registration lifetimes, resource joins and dynamic consumers remain under
their individual findings and #41.

### Native query receipts

Ghidra 12.1.4 analyzed six exact, unwind-bounded slices. Reproduce the inputs
with `scripts/extract-menu-native-slices.py --current-target`, the start
addresses below and a project-local workdir, then run the resulting plans
through `./scripts/rea query`. The journal target hashes match the original
PE slice hashes. Original instructions establish Win64 arguments, external
data and the computed frontend case that the raw imports omit. The last
column selects the immutable result in the shared analysis store.

| Start VA / bytes | Slice SHA-256 | Ghidra evidence | Result SHA-256 |
| --- | --- | --- | --- |
| `0x1400178f0` / 7,678 | `80ffb92be8e1d0aedfcba13b182c2a9aa35272fd7038a3b9676bf1fb21b2cbfa` | `ev_d92cdc92301e88495cde4962350b6a40a19a9ecc948ac718b6756b0ccff14761` | `ba464b3358a5d292b3f2adb4ff4ed2e114c3c7ed8f8f3bee9d8b881f02d89f50` |
| `0x140052100` / 6,026 | `67ff7ae2c1adf204662f8f16f1e29c3138c4c6e4482751ef1aca5dd3cde088fe` | `ev_a3e456a0163d98623bbf1da1d883444e380f7122c44da7f5fa8e1cdb58d7a01b` | `01272a556643fdc224884b3dc074c978df207a74186dc1fe800a20407f8b4262` |
| `0x1411e6400` / 4,209 | `609deda9ba292dc4ce835fe78e472db80d93064fadba3b3243e1bca7e22d1766` | `ev_ffb70b4ae8b3684b5c733f3c1486719a608aee5906c9548325742f2336aaf2a9` | `2334f8cd5c69ef8417d24a5550523112e338645bd7ecfebe2d8d88b38702fcb5` |
| `0x1411e8600` / 1,089 | `554dd630af0c06d604b88a9fe7312d898d31e733d711d7da68c37b1d69a9d3cb` | `ev_2e31fe161aace47caab22c95a9eff82cc8fef6865d99c2c65fc166b612b3059a` | `5bf0d45a2ae42903f151967920f4fc2870e2231c3625d404111546e175d9aa33` |
| `0x145ebb750` / 5,133 | `8e3748d6773d78d05ca31ce64caa20c0e9719ac8857d5a12727dcc62c5ebd030` | `ev_d092161829001d6bb011d986a3e0656aa69b5c0c08a55ea22852ad810858ced7` | `5ad871499a1d59cf557fb474e2a1ba182a507c7525dfb7027d5e938e32ce7015` |
| `0x145eef4b0` / 208 | `6c95a4fdf8ff7e53d30070cce3435c5f57a9d05edd74fb2220c6d1eeb5d5c2f0` | `ev_b10a470e62922d3d58535e75920cf2f4beb64889350eb001a4e441526d8143d7` | `7c551aeef4bc4bf9d5c34baba283a29d1aca4a687ba85d78af7aaf986033adc1` |

## Bounded native and source connections beyond the literal delta

| Scope | Current evidence and remaining action |
| --- | --- |
| Directory, hosting, transport and service | The [admission recovery](coop-admission-0.141.0.md) connects the protocol-13 host/guest Join and the protocol-3 directory request under [#163](../verification-needed.md#gap-163). Retain the existing directory worker, TCP/relay transport, and session host/admission source. [#63](../CURRENT-STATE.md#gap-63) retains wider packet and service correspondence, with route, TCP and relay proof tracked under [#151](../CURRENT-STATE.md#gap-151), [#152](../CURRENT-STATE.md#gap-152) and [#197](../CURRENT-STATE.md#gap-197). [#257](../CURRENT-STATE.md#gap-257) requires an authoritative external service input to settle scheduler/capacity behavior. |
| Desktop departure | [#206](../CURRENT-STATE.md#gap-206) owns the [current AppExit trace](coop-desktop-exit-0.141.0.md). Follow the type key at `0x1465bf4e0` and the service command producer to test for a departure enqueue or close before the detached worker terminates. The rebuilt AppExit route already invokes ordered co-op cleanup. |
| World bootstrap, guest replication and party | Keep the existing bootstrap, typed session and gameplay consumers. The [wire-11/12 bounds and scale filtering](coop-guest-spell-rows-0.141.0.md) connect to guest snapshots under [#63](../CURRENT-STATE.md#gap-63). [#110](../verification-needed.md#gap-110) connects the recipient-wide spell table to ordinary-base player, party and pet FrameXML views. The [party incoming-damage](coop-incoming-0.141.0.md) and [achievement-settlement](party-achievement-settlement-0.141.0.md) connections cover their own repaired branches. [#196](../CURRENT-STATE.md#gap-196) retains the independent ordinary boss-counter distributor and consumer correspondence. |
| Roster and cooperative UI | [#299](../CURRENT-STATE.md#gap-299) owns the [wire-17 roster appendix and read-only screen](coop-inspection-0.141.0.md). Keep the connected profile and sidebar. Trace item-kind detail branches, inspection floor lighting, and achievement scrolling and selection in their current owners. |
| Detailed addon meter and world anchors | [#75](../CURRENT-STATE.md#gap-75) owns the remaining typed contribution, actor, encounter, history, loadout and replay producers identified in the [0.141.0 meter trace](detailed-meter-0.141.0.md). The reducer at `0x145e10f60` and the authoritative frame builder at `0x145fc7330` establish part of the native contract. The [combat and world callback registrations](world-anchors-0.141.0.md#frame-callback-registration) share a phase and have no explicit sibling dependency. [#317](../verification-needed.md#gap-317) owns the realized order comparison. |
| Platform composition and fonts | The [Windows preedit](native-ime-preedit-0.141.0.md) and [deployed browser bridge](browser-ime-0.141.0.md) traces have distinct artifacts. [#293](../CURRENT-STATE.md#gap-293) retains the rebuilt browser app/data bootstrap and its input connection. [#135](../CURRENT-STATE.md#gap-135) retains wider [font table](font-table-publication-0.141.0.md) correspondence beyond the connected table rebuild and provider fallback. |

These bounded observations leave dynamic targets, source joins and
unclassified code/data open under their owners and
[#41](../CURRENT-STATE.md#gap-41). Compilation, original/rebuilt
comparisons and client/server behavior remain in the
[verification register](../verification-needed.md).
