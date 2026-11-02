# Source-first discovery frontier — 0.121.0

Selected installed EXE: **146,088,960 bytes**, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [exact assessment](evidence/0.121.0/source-frontier.json) binds the current
whole-file/diagnostic inventories, predecessor delta and inspected source hashes.
It records discovery and source-interface questions, not complete native
semantics, implementation or parity. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own
the permanent findings and [release review](release-review-0.121.0.md) owns each
supplied item.

This report retains the initial discovery/source receipts. Subsequent
[Heroic core reconstruction](heroic-source-0.121.0.md),
[affix reconstruction](heroic-affixes-0.121.0.md) and
[set core reconstruction](sets-source-0.121.0.md) supply reviewed source
and broader bounded contracts; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) and the
system register own current source completion. Initial empty source mappings
below are discovery-time observations, not assertions that later source is absent.

## New diagnostic modules

The full path-set comparison adds **three** AS paths and removes two, producing
**63 current diagnostic modules**. All three added paths have independently
instruction-verified diagnostic references. An unmapped
`engine-selected-target-deltas` fallback is not evidence that
these AS paths belong to the generic engine. Their stable module IDs below
are registered with their actual AS paths. Address ranges below are declared
runtime extents; the independently verified census supplies actual body owners.

| Stable module / separate finding dimensions | Exact current native lead | Source-first assessment and next static action |
| --- | --- | --- |
| `custom-game-heroic` / partial source [#240](../verification-needed.md#gap-240), bounded current-contract dimension supplied under [#243](../verification-needed.md#gap-243) | `crates/wenilla-rogue/src/heroic.rs`; path `0x146fca015`; instruction sites `0x145abfeea`, `0x145ac0259`; declared extents `0x145abfe70..0x145abff78`, `0x145ac00b0..0x145ac026c` | Existing `run_options.rs`, `run_mods.rs`, menu state and saved progress provide candidate integration seams. The separate [bounded proof](evidence/0.121.0/heroic-native/manifest.json) recovers rank-name and affix-selector arithmetic plus its current input callsite. The old percentage controls/formulas retain their original evidence; neither they nor this bounded native proof establish reconstructed Heroic source or complete progression. Recover upstream level/seed/unlock producers through menu, run and save consumers. |
| `custom-game-game-affixes` / partial source [#241](../verification-needed.md#gap-241), current contract [#244](../verification-needed.md#gap-244) | `crates/wenilla-rogue/src/game/affixes.rs`; path `0x14769022c`; Location `0x147690258` (175:32); instruction `0x145c2c242`; declared extent `0x145c28900..0x145c2c377` | Existing enemy spawning, damage/hazard and progression adapters are candidate consumers. No reviewed weekly-affix state/dispatcher correspondence is established. Inspect the Location owner and incoming weekly-selection, death-event and direct-hit inputs, then recover state and actual consumers. Supplied Bolstering/Sanguine/Explosive items retain separate release findings. |
| `custom-game-sets` / partial source [#242](../verification-needed.md#gap-242), current contract [#245](../verification-needed.md#gap-245) | `crates/wenilla-rogue/src/sets.rs`; path `0x146fc974f`; seven diagnostic references across declared extents `0x145ac09b0..0x145ac0ad6`, `0x145ac3de0..0x145ac403f`, `0x145ac4160..0x145ac4478` | Existing `armory.rs::GearSave`, `save/gear.rs`, gear-effect progression and class-ability consumers remain preserved. Armor/set names and ordinary gear effects do not establish star/set-bonus source correspondence. Recover current set/slot/class dispatch, thresholds, scalar producers, persistence and spell consumers. Supplied upgrade/set-bonus items remain individually owned by the release review. |

The [system register](coverage/systems.json) deliberately keeps these adjacent
seams in `candidate_source_refs`, with `source_refs` empty until partial
reconstructed-source correspondence is established. The three source questions
and three current-contract questions are distinct evidence dimensions. The
separate Heroic proof supplies one bounded current-contract dimension; the two
other current-contract dimensions and all three source dimensions remain open.
That native proof does not resolve the other dimension or certify a complete
module.

The removed `mods.rs` and `realmd.rs` paths retain their stable rows, historical
diagnostic targets, source, recovered contracts and findings. Their current
`original_path` is null, excluding them from the current diagnostic denominator.
Literal absence proves neither behavior removal nor loss of implementation.
Any relevant old-to-new correspondence still requires the actual dependency
join, rather than a rename inferred from release text.

## Candidate changes beyond diagnostic filenames

Every added regex candidate has an exact `Q41-I01:<category>:<ordinal>` selector
and source-first assessment in the [machine report](evidence/0.121.0/source-frontier.json).
All **27 added namespace candidates** and **four added resource candidates** were
reviewed. Unchanged candidate categories, including binding names, Lua functions,
UI registration, textual IDs and discovered save/configuration keys, remain
discovery observations rather than proof that their behavior is unchanged.

The two new AS type labels `SetTip` (`module_type_namespace:149`,
`0x146201faa`) and `SetTipBox` (`:176`, `0x1462031bc`) belong to the supplied
armor-tooltip investigation [#234](../verification-needed.md#gap-234). The packed
`ScreensPlugin9w` candidate (`:3`) remains application-composition navigation;
the suffix does not establish a new independent mechanic. Other namespace
changes are generic engine/type/plugin context, including packed type lists and
the new `benilla_app::entities::item_glow::ItemGlowInstance` spelling (`:697`).
The existing item-glow/effect attachment source establishes that engine
interface; AS glow selection/override is the separate supplied
[#235](../verification-needed.md#gap-235) question. Missing exact type names or changed
packed suffixes do not identify an AS override or the native compiled revision.

| Added resource selector | Existing source boundary and remaining scope |
| --- | --- |
| `Q41-I01:resource_path:51`, `//textures/shadowblob.blp`, `0x1462c9ad1` | `benilla-app/src/blob_shadow.rs` owns `SHADOW_TEXTURE`, asset loading, the retained texture handle and shadow consumers. This is supporting generic rendering context; no new independent AS behavior is proved. |
| `Q41-I01:resource_path:63`, `FrameXMLAccountLoginRealmlist.xml`, `0x1463516c5` | The bytes pack `FrameXML` immediately beside `AccountLoginRealmlist.xml`; an exact pointer/length descriptor at file offset `0x639a5b0` selects the latter's 25 bytes. `ui_script/glue.rs::GLUE_LAYER` / `load_glue_layer` own that existing builtin glue interface. Source need not open the concatenated regex candidate as a literal filename. Historical custom realmd applicability remains [#94](../CURRENT-STATE.md#gap-94). |
| `Q41-I01:resource_path:218`, `DBFilesClient\\ItemDisplayInfo.dbc`, `0x14765c030` | `native_dbc.rs::load_item_icons` / `item_icon_dictionary` and `armory.rs::load_gear_art` own the retained custom icon interface; `benilla-formats/src/items.rs` owns the full shared display schema. This current literal occurrence supplies navigation for existing [#86](../CURRENT-STATE.md#gap-86) applicability rather than proving a new behavior. |
| `Q41-I01:resource_path:259`, `DBFilesClient\\Cfg_Categories.dbc`, `0x14770b888` | `benilla-formats/src/cfg_categories.rs::load_realm_categories` and `glue_session/realm.rs::load_categories` own the generic Region/category interface. Actual native reader/dependency applicability is not proved by source availability. |

Native consumers of these resource/type candidates remain unverified in this
source-first assessment. Recovery stops at the established engine/library role
unless a concrete AS dependency or override requires a further bounded trace.
Generic supporting uncertainty is not a new engine reconstruction finding.

The exact **16,665-byte addon API** matches 0.120.5 at its new current address
`0x1473063b8`. Its unchanged bytes preserve that script observation; native
producers, interface lifetimes and actual source/runtime behavior require their
own correspondence proof.

## Cooperative source boundary and retained recovery

The existing source covers discovery/directory and relay services, direct TCP
and route selection, session/party lifecycle, world bootstrap and replication,
in-run gameplay, recipient-private settlement, UI and localization. The machine
report binds the actual source files across that complete path. Historical
excluded-co-op labels exclude no current source or recovery work.

The shared source version in `coop/server_party.rs:7` remains `0.120.2` under
existing [#163](../verification-needed.md#gap-163). The installed target's independent
version witnesses alone do not recover its current admission gate. Existing
relay, retry, party-reset, ACK/sequence and localized-error contracts retain
their actual targets and permanent findings; new-target applicability does not
erase those implementations.

The supplied current Heroic host/admission/reward and reduced co-op scaling
items require their own current field, wire/state, producer and recipient
consumer investigations. Trace those boundaries through the existing codecs
and state owners instead of recreating generic transport or inferring every
historic behavior absent. No server operation is required for that static work.

No REA/Ghidra query, application compilation, compiling test, client/game/network/
server operation or controlled original/rebuilt comparison was performed by
this source-first review. The parent audit's separately recorded native passes
and release contracts have their own evidence. This report establishes no
whole-module semantic completeness, source execution or parity.
