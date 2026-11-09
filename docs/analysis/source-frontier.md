# Source-first discovery frontier

## 0.143.0 structural delta

The [current PE delta](evidence/discovery-delta.json) compares the installed
0.143.0 EXE, SHA-256
`f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`,
with 0.141.0. All 83 diagnostic paths remain present. The single new import,
`dbghelp.dll!MiniDumpWriteDump`, has a verified registration and callback
under [#326](../CURRENT-STATE.md#gap-326). The
[Hyper Mode trace](release-review.md#01430-hyper-mode) uses additional
direct string references outside the diagnostic-name inventory.

| Current PE lead | Source boundary and remaining trace |
| --- | --- |
| `module_type_namespace` at file `0x65baa10`, `0x6593678` | The prior combined Hero Preview/menu-scene registration string is split. Follow exact descriptor references to the existing preview/menu scene in [#60](../CURRENT-STATE.md#gap-60) to test whether registration or composition changed. |
| `module_type_namespace` at file `0x65baa50`, `0x656d960` | CombatTextAnchors, OverScreens and WorldAnchors names are current registration leads. Compare their registering functions and data handoffs with `benilla-app/src/combat_text`, `local_client/extension.rs` and the existing AS addon bootstrap. Keep [#307](../verification-needed.md#gap-307), [#317](../verification-needed.md#gap-317) and [#11](../verification-needed.md#gap-11) as separate source and prior verification scopes. |
| `module_type_namespace` at file `0x6584910`, `0x656b20c`, `0x668f5ea` | WorldHold, GameWindow, Screens and UI Quad names appear in different packed boundaries. Start with current call/descriptor references and the existing AS menu composition and shared engine interfaces. The packed strings do not establish a plugin or draw-pass change. |
| `game_binding_identifier` at file `0x655cc44` | The candidate scanner includes adjacent `Message` bytes after `AZS_ON_TOP_FRAMES`. `gameplay/client/addon_bootstrap.rs` already supplies the exact global name. Check the native descriptor length and VM registration handoff under [#11](../verification-needed.md#gap-11). |
| `resource_path` at file `0x7b7d288` | `DBFilesClient\PetPersonality.dbc` has the shared loader `benilla-formats/src/pet_stats.rs` and consumer `benilla-app/src/ui_pet_stats.rs`. The removed `LoadingScreens.dbc` text candidate has `benilla-formats/src/loading_screen.rs` as its source boundary. Check native resource loaders before assigning either change to an AS override. |

The other changed module candidates are suffix changes in generic GPU BLP,
entity shading and skybox strings. Existing `benilla-assets` and `benilla-world`
source owns those interfaces. Lua function/registration, textual ID and save-key
candidate sets are unchanged. The 28,656-byte addon API fragment is byte-identical
to the retained extract. Its current data and registration dependencies require
separate proof.

## 0.141.0 structural delta

The installed PE contains 151,493,632 bytes and has SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [historical whole-image discovery delta](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/70576100b062d6d2d68830e6dbbadddfaf4b007e/docs/analysis/evidence/discovery-delta.json)
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
It matches the [current Scholomance roll proof](scholomance-loot.md),
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
and set-effect evidence retains its [0.140.0 provenance](scholomance.md).
The diagnostic path adds no independent gameplay defect. The #314
verification record retains the compilation, save, UI, co-op and parity checks.

## Exact distinct-literal changes

`+n` and `−n` are one-based selectors into the
`candidate_changes.module_type_namespace.added` and `.removed`
arrays in the [delta](evidence/discovery-delta.json). The corresponding
literal selects the full byte range in the current or predecessor inventory.
All four additions and five removals are namespace matches.

| Exact selectors | Source owner and disposition |
| --- | --- |
| `+1` file `0x659a9ef` (459 bytes), `+2` file `0x65cc548` (55 bytes), `−1…−3` | The same MenuScene, HeroPreview, LocalClock, TouchDrive, PlayerPosition, InputGate, CombatText, OverScreens, WorldAnchors and WorldHold names are packed into two matches. Follow the existing menu/preview and loading seams under [#60](../CURRENT-STATE.md#gap-60) and [#61](../verification-needed.md#gap-61), and the existing overlay under [#11](../CURRENT-STATE.md#gap-11). Preserve the separately recovered [clock](../verification-needed.md#gap-302), [position](../verification-needed.md#gap-137), [input](../verification-needed.md#gap-310) and [combat](../verification-needed.md#gap-307) adapters. Use [#317](../CURRENT-STATE.md#gap-317) for the outstanding callback order. These match boundaries do not establish changed registration or execution order. |
| `+3` file `0x69c6422` (31 bytes), `−4` | The generic `benilla_assets::gpu_blp` match changes its trailing `messagey` to `message9`. The source boundary remains [`gpu_blp.rs`](../../crates/benilla-assets/src/gpu_blp.rs), with no specific AS dependency change shown. |
| `+4` file `0x686c72c` (29 bytes), `−5` | The generic `benilla_world::skybox` match gains a trailing `A` after `message`. Reuse [`skybox.rs`](../../crates/benilla-world/src/skybox.rs) as the source boundary. The literal supplies no AS skybox change. |

The distinct binding, Lua declaration, UI registration, textual ID,
save/configuration and resource-path populations are unchanged. The PE
import library/function sets are also unchanged. The 28,656-byte main
addon Lua span at file offset `0x7ae141a` matches the [canonical retained
extract](evidence/addon-api/selected-reference.lua) with SHA-256
`24be94eb96a3e539ab7d30a9171090cfd15e2667efa0a9423802b37705f4e8e6`.
Exact Lua bytes leave native producer and scheduling correspondence
as separate questions.

## Q41-I01 embedded Lua, bindings and persistence

The [embedded classification receipt](evidence/data-classification.json)
selects all 2,901 occurrences. The following byte joins account for 930 of
949 binding-identifier, 149 of 259 Lua declaration, 29 of 347 Lua
registration-token and five of seven textual-ID occurrences. Select each
row in `outputs['embedded-classification.jsonl']` by file offset within the
half-open span and category. The two combat slices fall within the main
addon API span and their occurrences count once.

| File offset / bytes | Exact payload and rebuilt consumer |
| --- | --- |
| `0x76ec4d8` / 11,034 | The [core patch](evidence/hud-framexml/world-state-patch.lua) with the [raid popup](evidence/raid-targets/popup.lua) inserted at byte 9,728. The pointer/length at file `0x76eeff8` confirms the full span and its SHA-256 is `c71f24c567d36c3c7f7c557e71ef8e136c6d62ae34369f3fdae386f623061809`. The rebuilt client installs these through the [core](../../crates/azeroth-survivors-re/src/gameplay/client/framexml_hud.rs) and [raid](../../crates/azeroth-survivors-re/src/gameplay/client/raid_targets.rs) append paths. |
| `0x73a90c3` / 271 | [StaticPopup death wrapper](evidence/hud-framexml/death-popup.lua), installed by the core append path. |
| `0x7ae141a` / 28,656 | [Main addon API](evidence/addon-api/selected-reference.lua). The [rebuilt extension](../../crates/azeroth-survivors-re/src/gameplay/client/addon_bootstrap.rs) composes recovered sections into the WorldStateFrame append. |
| `0x76dfef4` / 50,637 | [Meter API](evidence/addon-api/meter-api.lua), including the five textual IDs at ordinals 2–6. The `AZS_ML_QUERY` and `AZS_ML_LOADOUT` Lua tables use value 1 as request defaults. The [typed producer and publication](detailed-meter.md#rebuilt-authority-and-replay) are connected under [#75](../verification-needed.md#gap-75). |
| `0x76ef063` / 9,167 | [PaperDoll Lua](evidence/addon-api/paperdoll-run-stats.lua). [The rebuilt character pane](../../crates/azeroth-survivors-re/src/gameplay/client/run_stats.rs) installs the complete localized payload with the [stock FrameXML chunk](#paperdoll-core-file-and-localized-gear-prefix). |
| `0x7ae478c` / 1,810 and `0x7ae4e9e` / 830 | [Combat text API](evidence/combat-text/event-projection-api.lua) and [frame handlers](evidence/combat-text/frame-handlers.lua), appended by the rebuilt extension. |

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
skip name and the overlay registry. The [callback trace](world-anchors.md#frame-callback-registration)
establishes separate registration for the two packed callback families.
Ordinals 16–18 are the SC/JP/KR font filenames used by [menu fonts](../../crates/azeroth-survivors-re/src/menu_fonts.rs).
Ordinals 947–948 select the stored-level binding and its Lua command.

The packed namespace change has a concrete name boundary. The native
`0x1401dc950` leaf returns the 59-byte OverScreens plugin name at
`0x14659c542` inside namespace ordinal 5. Its [descriptor and consumer](above-card-frames.md#registration-and-shared-state)
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
[ReputationFrame append](evidence/hud-framexml/run-level-cap.lua) supplies the
result under [#181](../verification-needed.md#gap-181).

| Save/configuration ordinal | Current role and source boundary |
| --- | --- |
| 0, 4 | The producer in `0x145ebb750` writes eight bytes from `0x147aeaade` into the four-byte JSON key `type` at `0x145ebc203`. The frontend `movabs/cmp/je` at `0x140052b75..0x140052b88` dispatches to `0x140053216`; that case selects the six-byte `talent` context at `0x140053260`. The [existing request and context](../../crates/azeroth-survivors-re/src/talent_context.rs) connect to the [terminal consumer](../../crates/azeroth-survivors-re/src/gameplay/terminal.rs). This is an event discriminator. |
| 1 | `0x14001872e` selects an 11-byte relative-name comparison in the [legacy migration](legacy-config.md) path. The current source counterpart is [legacy_config.rs](../../crates/azeroth-survivors-re/src/legacy_config.rs). |
| 2 | `0x1411e64b3` and `0x1411e8652` pass the same 11-byte filename to the shared path join. The existing [CVar owner](../../crates/benilla-app/src/cvars/mod.rs) and [home resolver](../../crates/benilla-app/src/local_state.rs) use this filename. |
| 3 | The bytes occur within the saved-account-name migration diagnostic at `0x146726f70`. `adopt_legacy_account` has the corresponding message and CVar path. |
| 5 | The resolver `0x145eef4b0` checks the 14-byte `WOW_ROGUE_SAVE` first and returns a present override. Otherwise it calls the base-directory helper at `0x145eef506` and appends the 14-byte `characters.txt` from `0x147aee27d`. [save.rs](../../crates/azeroth-survivors-re/src/save.rs) uses the same priority. |

The binding and persistence classification identifies no new source defect.
The full inventory remains intact. Unresolved type layouts,
registration lifetimes, resource joins and dynamic consumers remain under
their individual findings and #41.

### Packed UI bundle names

The nine encoded references inside Q41-I01 module namespace selector 8
each pass a separate name pointer in RDX and byte length in R8D to
0x145bff950. The slices cover the complete 401-byte packed row. The
representative caller at 0x14025e810 checks a 16-byte type key, returns the
existing index on a match, and otherwise appends the helper's 40-byte result.
All nine callers use the same output stride. The helper's duplicate-component
diagnostic at 0x145bffe80 and source location at 0x14735c080 identify
Bevy 0.18.1 bundle metadata. The pinned Bevy BundleInfo constructor uses
the name in that diagnostic and builds the explicit and required component
lists. The nine names therefore identify bundle registrations.

| Name suffix | LEA | Name bytes |
| --- | --- | ---: |
| screens::hud::Confirm | 0x14025e948 | 40 |
| screens::coop::StaffName | 0x14025ec38 | 43 |
| screens::picker::ChosenZone | 0x14025ef28 | 46 |
| screens::picker::Action | 0x14025f218 | 42 |
| screens::update::CheckButton | 0x14025f508 | 47 |
| screens::options::TipText | 0x14025f7f8 | 44 |
| screens::talents::TalentAct | 0x14025fad8 | 46 |
| screens::scrollbar::ToEnd | 0x14025fdc8 | 44 |
| bevy_render::view::window::screenshot::Screenshot | 0x1402600b8 | 49 |

The separate 19 relocated pointer/length uses in namespace selectors
1, 4, 6, and 7 select the Discord, Picker, XInput and Options module names,
the seven-byte message field and the Options Rust source path. The Picker
instruction at 0x14014dc5d passes that exact message field as a seven-byte
entry to 0x14637e8b0. The packed suffixes have separate consumers.
These checks establish the selected metadata boundaries. UI action timing
and system scheduling remain with the individual screen findings.

The two Ghidra 12.1.4 results use exact original PE unwind slices.

| Start VA / bytes | Slice SHA-256 | Shared result SHA-256 |
| --- | --- | --- |
| 0x14025e810 / 702 | 6c8e4d2cef9edbde4718f74ebfdcdaa3c405e3121136a125222343e6f7b226c5 | 6e7bf8d89cd62ad3c9afd43be34697928f491453e90a320100c9ee806a4725ac |
| 0x145bff950 / 1,837 | 5889690028dfb6798c68429d0d741afb6ab99a1472454ded708246bb01b7f17c | 77ddb2e3e15b45398a561f8292a039a4ea6abd8ef098c1d991725993d6bdd99e |

The [MPQ override trace](mpq-mount.md#registered-resource-overrides)
also connects Q41-I01 resource selectors 63 and 227 to the exact native
binding and CreatureSoundData file producers and ordinary readers.

#### UI tuple metadata

Namespace ordinals `9..245` are 237 interior substrings of packed Bevy
bundle names. The complete contiguous span at file
`0x65b11bb..0x65bba22` has SHA-256
`658a24f6983fbd2b624a94ea1fe1f0db93e4d14acf554bd79dcbe02705713bf7`.
Balanced top-level tuple boundaries select 230 names, including the
engine-only tuple names between the selected AS substrings.

Query the declared instruction inventory's `refs.target` at the preferred
VA of each tuple start. Each of the 230 starts has one encoded reference.
Replay of every site verifies the `LEA RDX` name pointer, the exact `R8D`
byte length, and the first direct call to the same bundle helper
`0x145bff950`. The projection of `(LEA VA, tuple VA, length, CALL VA)` as
little-endian `u64` rows in ascending tuple VA has SHA-256
`f56e1dc6f77822d276bdaf4a7c1d4661056c1a3205b348d179dfba2b3fdee602`.
The first row is `(0x1402606fa, 0x1465b2bbb, 228, 0x14026070f)` and the
last is `(0x14028baf0, 0x1465bd340, 226, 0x14028bb04)`.

The helper's saved Ghidra result and duplicate-component diagnostic above
establish the shared Bevy `BundleInfo` boundary. The 237 lexical leads now
have a bounded name consumer. Screen state, event ordering, and individual
widget behavior are owned by the corresponding AS screen traces.

### Builtin glue and FrameXML resource selectors

The ten 40-byte file descriptors at file offsets `0x6712628..0x67127b8`
carry separate path and payload pointers with their exact lengths. The
[resource proof](evidence/resource-consumers.json) binds each
descriptor and payload. The source counterpart is
[`include_dir` and `content::read`](../../crates/benilla-app/src/ui_script/content.rs).
The [glue layer](../../crates/benilla-app/src/ui_script/glue.rs) loads
`AccountLoginRealmlist.xml` after GlueXML. The
[in-game layer](../../crates/benilla-app/src/ui_script/manifest.rs)
uses `layer.toc` after stock FrameXML and before third-party addons.

- `resource_path:{68,70,76,81,90,148,162,170}` are the filenames directly
  preceding eight descriptor payloads. ScrollTemplates, KeyBindingsPage and
  GameMenuAdapters are byte-identical to their source assets. The other five
  differ only in comments.
- `resource_path:{173,175,177..181}` are lines in the same embedded
  `layer.toc`, which is byte-identical to source. Ordinals 129 and 146 occur
  in OptionsFrame comments and 152 in a ScriptLogFrame Lua comment.
  These are references to the named scripts within explanatory comments.
  OptionsFrame differs only in comments.
- `resource_path:219` is the `compat.lua` reference within the comment
  in the 2,654-byte embedded `WOW_STDLIB` chunk at file `0x69fde9e`.
  The complete chunk equals the current
  [Lua standard-library adapter](../../crates/benilla-ui/src/script/stdlib.rs).
  The [VM's compatibility chunk](../../crates/benilla-lua/src/lib.rs)
  is a separate startup input.

These selected spans account for the lexical builtin and comment rows
reported as unmatched MPQ resources. They do not establish an additional
AS registration or load-order change.

### PaperDoll core file and localized gear prefix

Resource selector `Q41-I01:resource_path:224` reaches the selected
PaperDoll patch at `0x145ddba80..0x145ddbc17`. The startup call at
`0x145e80eee` and the tail jump at `0x145e7fece` reach the same patch.
It reads `Interface\FrameXML\PaperDollFrame.lua` at `0x145ddbaad`,
then localizes the exact 9,167-byte payload at `0x1476f0a63` via the
call at `0x145ddbb61`. The packed `c0 c0 00` format program at
`0x1476f3ac8` combines the stock bytes with the localized extension.
`0x145ddbbee` publishes the combined bytes through the core-file
override interface at `0x146244270`, under the same 37-byte path.
If the stock read fails, the patch logs the failure and skips publication.

The selected `patch.MPQ` supplies `FrameXML.toc` row 54,
`PaperDollFrame.xml`. Its line 3 includes `PaperDollFrame.lua` and its
line 1047 calls `PaperDollFrame_OnLoad`. The rebuilt postlude previously
ran after third-party addon loading and after stock OnLoad. The
[character pane](../../crates/azeroth-survivors-re/src/gameplay/client/run_stats.rs)
now configures the named core append on initial setup and locale changes.
The normal nested-script load installs the wrappers before the frame's
OnLoad and before addons, including on ReloadUI.

The localizer takes 76 16-byte label descriptors at `0x1476f3608`. The
set contains the 73 retained labels and both Stormguard variants, plus
`Worn gear: `. The rebuilt tooltip now uses its translated prefix, such
as `Équipement porté : ` in French. All 76 labels match the embedded
catalogs across 14 languages. This extends [#20](../verification-needed.md#gap-20).

The Ghidra 12.1.4 operation used the exact 407-byte unwind slice at file
`0x5ddae80`, SHA-256 `954c893701be86ac79ecf940a3df8b45b51c0ccd14762930b318efe73859c11b`.
The verified result SHA-256 is
`e86afa64bcc616a8913d5461d942827e180a1c0defe7e0bb1c3a7c2252d52a7d`.
The static PE/source check is `python3 -B scripts/recover-run-stats.py --check-current`.
`lua scripts/check-run-stats.lua` executes the retained Lua against a
stub host. Actual VM, addon load, rendering and parity checks remain open.

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
| Directory, hosting, transport and service | The [admission recovery](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-admission-0.141.0.md) connects the protocol-13 host/guest Join and the protocol-3 directory request under [#163](../verification-needed.md#gap-163). Retain the existing directory worker, TCP/relay transport, and session host/admission source. [#63](../CURRENT-STATE.md#gap-63) retains wider packet and service correspondence, with route, TCP and relay proof tracked under [#151](../CURRENT-STATE.md#gap-151), [#152](../CURRENT-STATE.md#gap-152) and [#197](../CURRENT-STATE.md#gap-197). [#257](../CURRENT-STATE.md#gap-257) requires an authoritative external service input to settle scheduler/capacity behavior. |
| Desktop departure | [#206](../CURRENT-STATE.md#gap-206) owns the [current AppExit trace](coop.md#interruption-departure-and-settlement). Follow the type key at `0x1465bf4e0` and the service command producer to test for a departure enqueue or close before the detached worker terminates. The rebuilt AppExit route already invokes ordered co-op cleanup. |
| World bootstrap, guest replication and party | Keep the existing bootstrap, typed session and gameplay consumers. The [wire-11/12 bounds and scale filtering](coop.md#shared-simulation-and-replication) connect to guest snapshots under [#63](../CURRENT-STATE.md#gap-63). [#110](../verification-needed.md#gap-110) connects the recipient-wide spell table to ordinary-base player, party and pet FrameXML views. The [party incoming-damage](coop.md#shared-simulation-and-replication) and [achievement-settlement](party-achievement-settlement.md) connections cover their own repaired branches. [#196](../CURRENT-STATE.md#gap-196) retains the independent ordinary boss-counter distributor and consumer correspondence. |
| Roster and cooperative UI | [#299](../CURRENT-STATE.md#gap-299) owns the [wire-17 roster appendix and read-only screen](coop.md#joining-readiness-and-world-start). Keep the connected profile and sidebar. Trace item-kind detail branches, inspection floor lighting, and achievement scrolling and selection in their current owners. |
| Detailed addon meter and world anchors | [#75](../verification-needed.md#gap-75) connects typed credit, retained actors, encounter, history, loadout and replay producers to the [detailed meter feed](detailed-meter.md#rebuilt-authority-and-replay). The [combat and world callback registrations](world-anchors.md#frame-callback-registration) share a phase and have no explicit sibling dependency. [#317](../verification-needed.md#gap-317) owns the realized order comparison. |
| Platform composition and fonts | The [Windows preedit](native-ime-preedit.md) and [deployed browser bridge](browser-ime.md) traces have distinct artifacts. [#293](../CURRENT-STATE.md#gap-293) retains the rebuilt browser app/data bootstrap and its input connection. [#135](../CURRENT-STATE.md#gap-135) retains wider [font table](font-table-publication.md) correspondence beyond the connected table rebuild and provider fallback. |

These bounded observations leave dynamic targets, source joins and
unclassified code/data open under their owners and
[#41](../CURRENT-STATE.md#gap-41). Compilation, original/rebuilt
comparisons and client/server behavior remain in the
[verification register](../verification-needed.md).

## Retained reports

[0.140.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.140.0.md) · [0.139.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.139.1.md) · [0.139.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.139.0.md) · [0.127.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.127.0.md) · [0.123.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.123.0.md) · [0.121.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.121.0.md)
