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

## Bounded native and source connections beyond the literal delta

| Scope | Current evidence and remaining action |
| --- | --- |
| Directory, hosting, transport and service | The [admission recovery](coop-admission-0.141.0.md) connects the protocol-13 host/guest Join and the protocol-3 directory request under [#163](../verification-needed.md#gap-163). Retain the existing directory worker, TCP/relay transport, and session host/admission source. [#63](../CURRENT-STATE.md#gap-63) retains wider packet and service correspondence, with route, TCP and relay proof tracked under [#151](../CURRENT-STATE.md#gap-151), [#152](../CURRENT-STATE.md#gap-152) and [#197](../CURRENT-STATE.md#gap-197). [#257](../CURRENT-STATE.md#gap-257) requires an authoritative external service input to settle scheduler/capacity behavior. |
| Desktop departure | [#206](../CURRENT-STATE.md#gap-206) owns the [current AppExit trace](coop-desktop-exit-0.141.0.md). Follow the type key at `0x1465bf4e0` and the service command producer to test for a departure enqueue or close before the detached worker terminates. The rebuilt AppExit route already invokes ordered co-op cleanup. |
| World bootstrap, guest replication and party | Keep the existing bootstrap, typed session and gameplay consumers. The [wire-11/12 bounds and scale filtering](coop-guest-spell-rows-0.141.0.md) connect to guest snapshots under [#63](../CURRENT-STATE.md#gap-63). [#110](../CURRENT-STATE.md#gap-110) traces the missing native subject/recipient join from the app resource vector at state `+0x48` to the selected FrameXML aura view. The [party incoming-damage](coop-incoming-0.141.0.md) and [achievement-settlement](party-achievement-settlement-0.141.0.md) connections cover their own repaired branches. [#196](../CURRENT-STATE.md#gap-196) retains the independent ordinary boss-counter distributor and consumer correspondence. |
| Roster and cooperative UI | [#299](../CURRENT-STATE.md#gap-299) owns the [wire-17 roster appendix and read-only screen](coop-inspection-0.141.0.md). Keep the connected profile and sidebar. Trace item-kind detail branches, inspection floor lighting, and achievement scrolling and selection in their current owners. |
| Detailed addon meter and world anchors | [#75](../CURRENT-STATE.md#gap-75) owns the remaining typed contribution, actor, encounter, history, loadout and replay producers identified in the [0.141.0 meter trace](detailed-meter-0.141.0.md). The reducer at `0x145e10f60` and the authoritative frame builder at `0x145fc7330` establish part of the native contract. [#317](../CURRENT-STATE.md#gap-317) owns the [current combat/world callback order](world-anchors-0.141.0.md#frame-callback-registration) between `0x1409ca830` and `0x1409cc3e0` after the two groups enter the common schedule. |
| Platform composition and fonts | The [Windows preedit](native-ime-preedit-0.141.0.md) and [deployed browser bridge](browser-ime-0.141.0.md) traces have distinct artifacts. [#293](../CURRENT-STATE.md#gap-293) retains the rebuilt browser app/data bootstrap and its input connection. [#135](../CURRENT-STATE.md#gap-135) retains wider [font table](font-table-publication-0.141.0.md) correspondence beyond the connected table rebuild and provider fallback. |

These bounded observations leave dynamic targets, source joins and
unclassified code/data open under their owners and
[#41](../CURRENT-STATE.md#gap-41). Compilation, original/rebuilt
comparisons and client/server behavior remain in the
[verification register](../verification-needed.md).
