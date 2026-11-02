# Added and removed candidate source review — 0.139.1

Selected EXE: 150,633,472 bytes, SHA-256
`1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d`.
The [machine review](evidence/0.139.1/source-frontier.json) binds both exact
inventories, the [discovery delta](evidence/0.139.1/discovery-delta.json),
inspected source hashes and every reviewed selector. The predecessor is
0.139.0 SHA-256
`0e8e314df4d78ab211b1bef5c48d78d713ed64260894af342f998d298d74d274`.
Current implementation and selected audit status remain in
[CURRENT-STATE](../CURRENT-STATE.md).

This is a source-first candidate review, not native semantic recovery. It
assigns every added occurrence exactly once and reviews every removed
predecessor occurrence separately. A changed packed literal, diagnostic name
or available source does not prove native ownership, changed behavior or
source equivalence.

## Exact membership

No AS diagnostic path was added or removed: the discovered module population
remains 77. Previously recovered source/contracts and the eight 0.139.0 module
source candidates retain their actual status; unchanged membership establishes
no whole-module correspondence.

| Candidate category | Added distinct literals / occurrences | Removed distinct literals / occurrences |
| --- | ---: | ---: |
| `module_type_namespace` | 23 / 23 | 26 / 26 |
| `resource_path` | 0 / 0 | 2 / 2 |
| Binding identifiers, Lua/UI registration, textual IDs, save/configuration keys and Lua function declarations | 0 / 0 | 0 / 0 |
| **Total** | **23 / 23** | **28 / 28** |

The membership comparison is by distinct literal per category. An added
occurrence is a current row whose literal was absent from the predecessor set;
it is not every relocated occurrence of an unchanged literal. Removed selectors
refer explicitly to the predecessor inventory, never the current ordinal.

## Every added occurrence

All added selectors have the exact prefix
`Q41-I01:module_type_namespace:`. The ordinals below complete those selectors;
the machine review retains their complete spelling, source-first disposition
and next action without duplicating the bulk literal inventory.

| Reviewed group | Ordinals | Count | Source/recovery disposition |
| --- | --- | ---: | --- |
| `gamepad-input-interface` | 239 | 1 | **#22**: packed `xinputmessage9` retains the old namespace with a changed suffix. Existing source separates Select-to-C/Character from East/cancel. Recover the actual Back/Select native acquisition, edge and capture/action contract; the suffix is not an enum or new API. |
| `host-input-gate-composition` | 241 | 1 | **#310**, with retained **#302/#137/#11/#23** interfaces: the packed composition includes `host_controls::input_gate::InputGatePlugin` among menu scene, local clock, touch, position and on-top names. Existing extension/mouse/Escape/binding ownership is source; typed native registration/state/schedule and consumers remain unknown. |
| `retained-preview-combat-marker-composition` | 243 | 1 | **#60/#297/#307/#96**: previously separate preview/combat-anchor/marker names now share one literal. Reuse existing preview/scenery/marker/combat-text interfaces; regrouping does not establish new functionality or current dependency correspondence. |
| `engine-plugin-composition` | 735, 736 | 2 | Ordinary engine/plugin/GPU-text composition; source registration order can matter, but string order is not execution proof. Stop at the plugin interface absent a concrete AS dependency. |
| `engine-platform-process-context` | 528, 529 | 2 | QoS/background/macOS-quit and dev/AltF4 source roles are supporting context. Local BgWin activation/QoS behavior is macOS-only or inert elsewhere; AltF4 is a close chord. None establishes the Windows-on-Wine alt-tab repair. |
| `engine-world-context` | 792, 799 | 2 | Existing terrain-shade and water wake/ripple interfaces; changed packed suffixes do not prove an AS override or changed rendering. |
| `engine-audio-context` | 503, 507 | 2 | Existing cfg-selected output/device and Windows COM seams. The local cpal adapter already anchors its cached enumerator apartment. No changed native behavior or **#311** crash cause follows from these namespace candidates. |
| `engine-render-text-context` | 502 | 1 | Existing glyph-cache/VM-measure/render-lock interface; no IME or font reconstruction conclusion from a suffix change. |
| `engine-client-services-context` | 476, 530, 597, 600, 628, 649, 777 | 7 | Existing item state/use, quest log, persisted window layout, world map, item soulbinding and innkeeper home binding. These are generic source roles, not proved native exclusions. In particular, `ui_bind_confirm`/`ui_binder` are not Options keyboard rebinding. |
| `engine-network-context` | 680 | 1 | Existing ordinary login/realm/world socket worker; no co-op schema, transport or AS admission change established. |
| `engine-creature-animation-context` | 689 | 1 | Existing ordinary animation/sheath/death state driver; stop without a concrete AS override. |
| `engine-target-context` | 737 | 1 | Existing world-picking/camera interface; **#310** requires an actual input-ownership edge before expanding this generic scan branch. |
| `retained-world-hold-context` | 240 | 1 | `WorldHoldPlugin` already existed in the predecessor candidates; only its packed suffix changes. Existing AS client/pause/extension interfaces are candidate seams, while an exact local `spell_override` counterpart was not established. Preserve that unknown interface without recreating generic engine code from its name. |

These are three AS-facing candidate occurrences and twenty supporting engine
context candidates. Native ownership remains unestablished by this review;
none of the supporting groups is a whole-function semantic exclusion.

## Removed patterns and retained source

The machine review's `removed_candidate_review_groups` assigns all 26 removed
namespace occurrences to the corresponding inspected interface groups, bound to
the predecessor target and exact old selectors. Namespace components recur in
regrouped literals or with changed `message`/`crates` suffixes. That observation
does not prove removed functions, features, assets or unchanged native behavior.

The two removed resource-pattern occurrences have explicit independent
dispositions:

| Predecessor selector | Pattern/source observation | Limit and next static boundary |
| --- | --- | --- |
| `Q41-I01:resource_path:27` | The old `//textures/shadowblob.blp` regex candidate drops out. Local `benilla-app/src/blob_shadow.rs` still loads `mpq://textures/shadowblob.blp` through the asset server. | No missing MPQ member or removed shadow feature is proved. Follow an exact current lookup/draw dependency only if an AS requirement needs it. |
| `Q41-I01:resource_path:58` | The old `AccountLoginRealmlist.xml` pattern drops out. Local `ui_script/glue.rs::GLUE_LAYER` still names and loads the builtin overlay after GlueXML.toc. | No deleted file or absent character-select consumer is proved. **#310** must trace actual current picker/underlying input ownership rather than infer it from resource-pattern membership. |

## Current questions and cumulative recovery

The [release review](release-review-0.139.1.md) retains every supplied item and
the actual source observations behind **#310/#311**, **#59**, **#7/#8**,
**#17**, **#22** and **#293**. Existing Escape filters, pointer/drag capture,
Options press/repeat/release suppression, Select-to-C and Commit forwarding
remain implemented source with historical evidence. Recover their affected
current native producer/state/schedule/consumer contracts before claiming a
missing implementation or changing them.

The new InputGate name is a concrete **#310** registration/interface candidate,
not proof of its typed behavior. No added literal establishes **#311**'s actual
Windows activation failure path; it remains an explicit recovery question.
Neither macOS process plugins nor audio COM labels are assigned that cause.
Generic engine branches stop at the inspected source interface unless a proved
AS dependency requires a further bounded trace.

The current main [embedded API](evidence/0.139.1/embedded-api.lua) is 22,984
bytes with exactly the predecessor payload SHA-256
`eb88eba838da6002f8ec9e7837292cd27081f86d880137a1d6ff8259c2c15cd8`,
at current file `0x7690278` / preferred VA `0x147691478`.
This is bounded Lua-byte equality, not revalidation of native clock/position,
combat-event/anchor producers, callback scheduling or source applicability.
Unchanged literal sets likewise do not close filename-free code/data changes.

No native query/decompilation, instruction-semantic recovery, source repair,
compilation, compiling test, game/client/network/server execution or original/
rebuilt comparison was performed by this source-first review. The main audit
owns whole-image native work and final graph/queue/accounting independently.
