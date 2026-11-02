# Bounded native interfaces in 0.139.0

Target: installed `AzerothSurvivors.exe` 0.139.0, 150,595,584 bytes, SHA-256 `0e8e314df4d78ab211b1bef5c48d78d713ed64260894af342f998d298d74d274`.

This report reviews representative interfaces in the eight newly discovered AS diagnostic modules. The [source frontier](source-frontier-0.139.0.md) and [release review](release-review-0.139.0.md) own the wider source and release requirements. These bounded queries do not recover every function in a module or supersede the full-image census under #41. Current implementation and verification status remain in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Evidence and method

The [selection manifest](evidence/0.139.0/native-frontier-plan.json) records a source-first question, source file hashes, current diagnostic references, original exception-directory owner extent, exact raw bytes and query invocation for each owner. The [results manifest](evidence/0.139.0/native-frontier-results.json) binds real operation journals, result hashes, Ghidra Evidence IDs, analysis profiles and one canonical pseudocode file per exact target/range. Original instructions and referenced data were checked separately where they support a numerical or field-level conclusion.

The existing query runner cannot adopt the active census Program through its normal query route. These queries therefore use declared raw slices extracted by the existing `extract-menu-native-slices.py` interface, with content-addressed inputs and saved Programs in `runtime/analysis/`. Each plan disables full-image analysis, declares its entry point and performs `procedure_info` followed by `procedure_pseudo_code`. Queries use the shared native queue sequentially; the census has priority and the common capacity remains two worker slots. No second full-PE import was created.

Raw-slice Ghidra uses a generic x86-64 GCC compiler specification. The original executable uses Windows x64 conventions, so inferred argument names, signatures and types are not an ABI contract. External code, data, switch tables and caller context are absent unless independently checked against the installed target. A completed query proves the selected bytes were processed; the observations below identify the narrower semantics actually supported.

All 13 plans were attempted against 64,764 selected bytes. Twelve completed both operations; one retained its successful procedure-information result and failed decompilation, for 25 completed native operations. Each successful operation ran once. Selection records preserve their original prepared-state wording and first-12 commitments; execution outcomes belong to the results manifest.

The 26 recorded operation calls total 326.298 seconds, including 9.117 seconds for the failed decompilation. First raw Program preparation is charged to the corresponding procedure-information call where applicable. These figures exclude queue waiting and other session calls; they are not whole-audit wall time or a full-image performance measurement.

| Module | Selected owner(s) | Narrow result |
| --- | --- | --- |
| `custom-app-screens-inspect` | `0x14030a950`, `0x140319c90` | Partial tooltip consumer; display lifecycle context |
| `custom-app-screens-localclock` | `0x140311940`, `0x140312430`, `0x1402fe070` | Geometry/construction context; exact native binding descriptor |
| `custom-app-screens-readycheck` | `0x14011dc10` | Snapshot/modal lifecycle context |
| `custom-app-screens-recap` | `0x140161d90`, `0x140178750` | Named recap payload consumption and terminal lifecycle |
| `custom-game-game-enhancement` | `0x145ebdd50` | Timed Rockbiter/Stormstrike cooldown consumer inside mixed update body |
| `custom-game-game-meterfeed` | `0x145f50e10`, `0x145f56de0` | Unrecovered external dispatch table; second owner decompiler failure |
| `custom-game-game-meterlog` | `0x145e768f0` | Pointer sorting with inlined AS ordering comparator |
| `custom-game-server-party-readycheck` | `0x145e4bdb0` | First-answer admission and response-byte mutation |

## Inspection: #299

Source-first question: which inspected-subject fields reach the item/appearance tooltip, and which state invalidates or rebuilds the display? Existing party/profile and armory code provide reuse seams, but the source review found no complete inspection snapshot/action path.

The [tooltip owner `0x14030a950`](evidence/0.139.0/native-frontier/owner-14030a950.c) bounds a slot index by 18, reads a byte at subject + `0x14e` + slot, and clamps a rank-like value to 5. Original instruction `0x14030a9e6` performs that indexed byte read; `0x14030afbb` compares against 5. Independent RIP references reach `armory.card_bonuses`, `Hidden` and `Shown as` text. These establish a ranked item/appearance consumer boundary, while caller identity and external item/text helpers remain unresolved.

The raw slice omits the guarded item-kind 1–5 jump table at `0x1465461f8`. Ghidra renders that branch as an indirect call and return. Its resulting pseudocode cannot establish the complete tooltip control flow, set membership or every item-kind branch.

The [lifecycle owner `0x140319c90`](evidence/0.139.0/native-frontier/owner-140319c90.c) calls `0x140151930`; a returned -1 enters clearing behavior. It traverses two ECS storage forms, retires matching entities through `0x145bcc400`, conditionally clears fields at `+0x70` and `+0x8f`, and calls `0x1403e8f00` for construction/update. The AS predicate and consumer are concrete next interfaces. The generic ECS traversal is supporting context and does not prove profile serialization, subject correspondence or live lobby refresh.

Eligibility: retain the tooltip as a partial consumer contract with its missing switch table explicit. The lifecycle body remains classified context until its AS predicate and construction inputs are mapped. Neither owner supports complete inspection recovery or a current source connection.

## Local clock: #302

Source-first question: which AS visibility/geometry/text state extends the existing HUD registry, and where does local-time formatting originate? Existing source has HUD and Options/bootstrap seams but lacks the local-clock entry identified in the source review.

The [geometry owner `0x140311940`](evidence/0.139.0/native-frontier/owner-140311940.c) receives a rectangle-like float tuple from `0x1405f7710`, derives three geometry values divided by a resource float, gates visibility on three flags, and avoids unchanged component writes. The original divisions occur at `0x140311f76`, `0x140311f80` and `0x140311f85`. Exact resource/component identities and the tuple provider remain unresolved; these instructions alone cannot name the flags as minimap visibility, local-clock preference or HUD scale.

The [constructor owner `0x140312430`](evidence/0.139.0/native-frontier/owner-140312430.c) returns when an entity query already has a matching entry. An empty query requires a non-null constructor input and calls `0x140355490` and `0x14035bee0` to build bundles. ClockRoot/ClockText type-name candidates support the module frontier but do not type these opaque bundle fields or establish a time provider.

Eligibility: geometry and construction remain classified context pending the actual AS resources and typed inputs. Generic ECS internals are a stopped boundary.

The added [owner `0x1402fe070`](evidence/0.139.0/native-frontier/owner-1402fe070.c), linked to `localclock.rs:22`, registers a binding descriptor rather than formatting time. Original instructions `0x1402fe090..0x1402fe0b9` build the exact name pointer `0x146543640`, length 19, and callback pointer `0x1402fe5a0`, then pass the descriptor to `0x14013fd20`. An independent read of the named 19 bytes is exactly `AZS_NativeLocalTime`. Subsequent bundle/scheduling construction stays at the generic engine boundary.

Eligibility: the binding-name/callback registration is a bounded candidate contract. Actual time acquisition, locale/12–24-hour selection, returned schema, cached text/time lifetime and VM lifetime stop at the concrete callback `0x1402fe5a0`; that callback was not queried. This registration does not turn the earlier geometry/construction context into recovered formatting behavior.

## Ready Check UI: #306

Source-first question: what snapshot and retained UI state govern the custom lobby modal, independently of stock engine ready-check support?

The [UI owner `0x14011dc10`](evidence/0.139.0/native-frontier/owner-14011dc10.c) gates on UI state and obtains a snapshot through `0x140151190`. Missing/sentinel data retires modal content. Retained fields, flags and vectors are compared before rebuilding changed content through `0x1401135a0` and `0x1403677e0`.

Those concrete snapshot and rendering interfaces are the next AS boundaries. This body does not establish typed Ready/Not Ready answers, a 30-second deadline, host cancellation, all-ready zone admission or wire routing. Eligibility remains classification/context until the snapshot schema and action producers are mapped.

The [server owner `0x145e4bdb0`](evidence/0.139.0/native-frontier/owner-145e4bdb0.c) is a complete 168-byte admission/mutation boundary. It requires phase dword `+0xf60 == 3`, bounds the incoming member index by `+0xfa0`, and requires non-sentinel member/context fields and a nonempty response vector. Member records have stride `0x858`. It matches identity `member +0x560` against 16-byte response rows and changes only a matching unanswered byte (`row +8 == 0`) to `2 - r8b` under the original Windows x64 register convention. Later answers cannot overwrite an already nonzero byte in this owner.

Eligibility: retain that exact first-answer admission/mutation contract. Caller boolean/enum meanings, authenticated request routing, response membership creation, the meaning of phase 3, timeout/cancel handling and all-ready start admission remain separate missing interfaces. The generic out-of-bounds panic helper is a stopped boundary. An inferred GCC parameter list does not replace the verified Windows register operands.

## Death Recap: #300

Source-first question: how does the terminal screen consume recap/killer objects, and which named fields feed its rows and totals? Existing terminal and replication source lacks the full capture-to-screen path identified in the source review.

The [renderer `0x140161d90`](evidence/0.139.0/native-frontier/owner-140161d90.c) consumes named `secs`, `absorbed`, `hits`, `by` and `avoidable` fields. It references `Death Recap`, `Final Blows` and `Damage by Source`, iterates 32-byte value entries and delegates rows to `0x14015ff90` and `0x140165160`. Avoidable damage presentation uses a ratio scaled by 100 and bounded to 0–100. External value lookup, row construction and numeric edge behavior remain unresolved. Ghidra reports unsettled type propagation, so the inferred signature is not relied upon.

The [terminal owner `0x140178750`](evidence/0.139.0/native-frontier/owner-140178750.c) looks up exact nested keys `recap` (length 5) and `killer` (length 6), requires an object-like tag 5, compares retained generation/state at `+0xe4`, and clears open state when invalidated before teardown/rebuild. It passes the chosen recap object to `0x1403add50`.

Eligibility: these support bounded recap payload-rendering and nested-payload/lifecycle contracts. History capture, time-window selection, hit grouping, killing-blow production, each player's delivery and complete button/Escape dispatch remain independent missing contracts. No source implementation or gameplay parity follows from the renderer.

## Enhancement cooldown consumer: #305

Source-first question: which current cast/state operands distinguish Enhancement attacks and repeats? Existing ability, talent and meter code remains a reuse seam; current proc and migration requirements exceed the historical source.

The [owner `0x145ebdd50`](evidence/0.139.0/native-frontier/owner-145ebdd50.c) is a mixed main-update body with inlined Enhancement regions. Health, regeneration, aura and ordinary cast-loop regions are supporting context, not whole-function Enhancement ownership.

An exact-key branch recognizes `rockbiter` and `stormstrike`. It scans raw effect tag 42 and subtype 10, reading the following rank byte. While state timestamp `+0x13c` exceeds the clock-like field `+0xe88`, an existing cooldown decreases by `delta * (1 + rank * 6 / 100)`. A second region adjusts published remaining cooldown across that active rate window. The original tag/subtype reads occur at `0x145ebea29..0x145ebea38` and `0x145ebf88d..0x145ebf89c`; time tests occur at `0x145ebf0a1..0x145ebf0b4` and `0x145ebf9ff..0x145ebfa12`. Independently read native floats at `0x1464d5b60`, `0x1464d5ea0` and `0x1464d5e80` are 1, 6 and 100 respectively.

Eligibility: the timed Rockbiter/Stormstrike cooldown consumer is a narrow candidate contract. Mapping subtype 10 to the current Flurry descriptor, its four-second expiry producer and the actual source consumer remains necessary. The cast helper `0x145f17720`, origin flags and repeat/proc dispatch are external interfaces. This query does not recover Windfury, all Stormbound repeats, necklace behavior, talent migration or the complete 0.137 proc graph.

## Meter descriptor dispatch: #75 / #307

Source-first question: does the meterfeed owner construct a stable meter row/source identity, distinct from a borrowed spell label? Existing source already has effective-damage ledgers, source provenance, localized row resolution and legacy addon publication. Those historical contracts are retained; the current descriptor/feed boundary requires separate recovery.

The [owner `0x145f50e10`](evidence/0.139.0/native-frontier/owner-145f50e10.c) checks state byte `+0xf4b == 2`, bounds an index by `+0x740`, and rejects state byte `+0xf49 == 0xff`. It selects a record with stride `0xa0`, derives a dispatch tag from that record's `+0x78` field, and jumps through table `0x147a1f7f8`. Original entry instructions at `0x145f50e5c..0x145f50ed4` confirm these gates and the indirect jump.

The table is outside this raw slice. Ghidra reports an unrecovered jump table and emits only the entry dispatch, leaving the selected owner's other branches outside the pseudocode result. Eligibility is classification/context only. A complete row descriptor/source identity is not recovered. The concrete next boundary is this exact dispatch table and its reached AS branches; generic formatting or serialization internals are not opened by this observation.

The second meterfeed query, owner `0x145f56de0..0x145f5b421`, retained a successful `procedure_info` result (Evidence `ev_54e01ce73051ee418b091f9fa9d2669f6876520b6154476f7a6c83b4425ec4ed`). Ghidra reports 559 basic blocks and a non-contiguous body totaling 17,696 bytes within the declared 17,985-byte span. Those are database observations, not a proven producer schema.

Its pseudocode operation failed with `decompile_failed`: `Unable to find unique hash for varnode`. REA marked the error non-retryable, so the configured three-attempt transient recovery policy did not repeat an unchanged deterministic failure. The original plan, successful operation, failed journal entry and saved raw Program remain available. No pseudocode file or semantic producer contract is claimed for this owner. Further recovery needs an explicit boundary/profile diagnosis rather than treating the filename, block count or failed operation as evidence of feed serialization.

## Meter-log ordering: #75

Source-first question: is the selected meterlog owner a ledger constructor, serializer or another role, and which subject/category fields are used? The [owner `0x145e768f0`](evidence/0.139.0/native-frontier/owner-145e768f0.c) is an in-place pointer sort with an inlined AS comparator. It is not a ledger row constructor or a reload checkpoint serializer.

The comparator derives a category byte using record fields `+0x18`, `+0x58`, `+0x200`, a nested flag at `+0x64`, and exact referenced `final`/`elite` labels. Within equal derived categories it compares the low unsigned 32 bits at record `+0xf0`. Original instructions `0x145e76b40..0x145e76b5d` confirm the secondary unsigned comparison and category override. The surrounding merge/run-reversal operations implement sorting; those generic internals are a stopped boundary.

Eligibility: a bounded AS ordering comparator can be retained with its raw fields, while actor/category correspondence and the caller's ordered-subject contract remain pending. This body establishes neither damage aggregation nor snapshot/reload lifetime. It must not be registered as a complete meter-log producer merely because its diagnostic path names meterlog.

## Validation limits

All conclusions are static and target-bound. No gameplay source was changed, and no compilation, game/client/server execution, network session or original/rebuilt comparison was performed. Candidate contract eligibility is owner-scoped; module-wide recovery and source connection require separate evidence. Opaque ECS traversal does not qualify as a recovered AS behavior. The full-image census and its remaining decoding/reference frontier are reported independently under #41.
