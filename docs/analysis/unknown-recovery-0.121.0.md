# Unknown recovery queue — 0.121.0

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This queue binds the [verified expanded census](coverage/full-image-execheck-0.121.0.json),
[machine residual queue](evidence/0.121.0/unknown-recovery.json),
[candidate graph](coverage/as-discovery.json) and
[connection ledger](coverage/exe-connections.json). Each selector retains its
target, exact artifact/range, source context and next static action. Counts
below describe overlapping populations, not unexplained-AS features or a
percentage of missing implementation. [CURRENT-STATE #41](../CURRENT-STATE.md#gap-41)
owns the broad native finding; independently actionable questions retain their
own permanent findings.

## Complete structural selectors

The machine queue's `sqlite_selectors` bind each SQL selector to the exact
current inventory and SHA-256. The [native report](native-census-0.121.0.md)
separates linear decoding from actual Ghidra bodies and semantic recovery.

| Lead / current input | Exact selector | Records | Next static action |
| --- | --- | ---: | --- |
| Q41-U01 / `instruction-summary` | `SELECT * FROM extents ORDER BY ordinal` | 358,683 | Recover actual flow/inline/error roles and concrete AS dependencies/source ownership; unwind extent membership is not function semantics. |
| Q41-U02 / `instruction-summary` | `SELECT * FROM extents WHERE decoded_end < end ORDER BY ordinal` | 0 | Recover any invalidated suffix exactly; an empty set does not close reachable-code discovery. |
| Q41-U03 / `unwind-complement-summary` | `SELECT * FROM regions ORDER BY start` | 338,114 | Classify complement leaf/inline/data roles; preserve candidate padding as unknown until proved. |
| Q41-F01 / `instruction-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 83,068 | Recover selector guards, callback/vtable/registration producers, computed destinations and incoming aliases. |
| Q41-F02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 651 | Recover complement computed transfers independently from declared-range references. |
| Q41-A01 / `instruction-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 3,851,634 | Trace encoded direct/address/memory edges to relevant AS state and consumers without assuming live pointers. |
| Q41-A02 / `unwind-complement-summary` | `SELECT * FROM refs WHERE kind NOT IN ('call_indirect','jump_indirect') ORDER BY site,kind,operand` | 14,045 | Classify complement references and imported slots; retain dynamic call uncertainty. |
| Q41-U04 / `unwind-complement-summary` | `SELECT * FROM stops ORDER BY site,reason` | 6,027 | Follow exact decoding/flow stop boundaries and classify unobserved successors. |

The [26-range file ledger](coverage/file-range-summary.json) covers
`[0, 146088960)` without overlap or omission. Its exact groups are
`ranges[lead_id == '<lead>']`, also selected by the machine queue's
`file_range_groups`. Headers, section data, alignment and unexplained contents
retain their own classification questions. Structural accounting does not
prove semantics or noncode. Q41-R01 selects all eleven registered MPQs and
their member accounting; recover relevant mount/locale/resource lifetime and
actual world/model/texture consumers. Q41-I01 selects
`embedded_candidates.<category>[*]` from the current whole-file inventory;
follow actual readers/writers/constructors/parsers to recover widths, bounds,
IDs and schemas. Literal/regex candidates are not an exhaustive AS-data census.

## Exact native residual and dispatch frontier

The expanded census retains **8,617,172 unobserved executable bytes / 473,494
ranges**, comprising 5,276,919 bytes inside declared extents and 3,340,253
outside. `independent_instructions.executable_sections.range_inventory`
selects the complete remaining executable partition; the declared subset is
`independent_instructions.unobserved_range_inventory`. These bytes are not
automatically AS-specific, missing implementation or proved padding.

The [residual proof](evidence/0.121.0/native-residuals.json) retains twelve exact
artifact sets. Each key below selects `native-residuals.json:artifacts`, which
provides the path, digest and complete row count for this same census.

| Lead / artifact key | Records | Next static action |
| --- | ---: | --- |
| Q41-G01 / `ownerless-instructions.tsv.gz` | 91,724 | Recover interior/inline/error/data roles through incoming/outgoing flow without forcing function ownership. |
| Q41-G01/A01 / `ownerless-reference-sources.tsv.gz` | 810,330 | Establish each retained source role; header/data sources are not automatically missing instructions. |
| Q41-A01/A02 / `unowned-executable-destinations.tsv.gz` | 8,048 | Recover callable/code-only roles, incoming state and required AS source interfaces. |
| Q41-D01 / `diagnostic-sites.jsonl.gz` | 18,122 | Reconcile exact Location/literal/site/body roles and retained classifications before declaring a new AS question. |
| Q41-F01 / `declared-indirect-sites.tsv.gz` | 83,068 | Recover guards/domains, aliases and pointer producers; encoded candidates do not prove runtime calls. |
| Q41-F02 / `complement-indirect-sites.tsv.gz` | 651 | Recover complement computed-transfer roles separately. |
| Q41-U04 / `complement-stops.jsonl.gz` | 6,027 | Resolve exact stop boundaries and successor code/data roles. |

The diagnostic set contains **1,222 records without actual body owners**,
including **60 AS-context records**. The full reference-role set retains
4,046,360 records. These overlap other populations. Legacy `excluded-coop-path`
labels preserve the original collector's scope and exclude no current
client/network/server source. The connection ledger's Location/source projection
is a separate population.

The [complete AS ownerless-site review](as-ownerless-sites-0.121.0.md)
classifies all **60** current diagnostic roles: **53** terminal-failure
Location operands, **two** Locations forwarded to returning stable-removal
helpers, and **five** explicitly sized adjacent `p`/`spell` tokens. The
Location subset is exactly the ledger's **55 references / twelve paths**.
The complete genuine-AS-Location extent projection also retains **790 decoded
ownerless instructions / 49 runs / nineteen extents**: checked failure routes,
and established Options, totem and card payload/cleanup contexts. These bounded
roles establish no new source defect. Preserve raw ownership counts; do not
offer these classified roles again solely because Ghidra has no body owner or
an older successful-path contract still needs current applicability. Wider
successful state, dispatcher and type/alias meanings remain separate questions.

| Lead / exact current selector | Population | Next static action |
| --- | ---: | --- |
| Q41-M01 / `native-operands.json:inventory` | 676,285 static address/memory expressions | Follow actual AS writers/readers, initial slots and consumer schemas; infer no access/call semantics from address shape. |
| Q41-M01 / rows with `source_native_owner == null` | 10,249 | Recover source/body roles and concrete AS state ownership. |
| Q41-A01 / `native-operands.json:unowned_executable_candidates` | 5,834 exact starts + 20 unobserved targets | Trace incoming reference state and callable/code-only roles; no interior conflicts are present. |
| Q41-F01 / `native-dispatch.json:unowned_direct_destinations_inventory.artifact`, selector `unowned_direct_destinations` | 5,738 exact instruction starts | Recover incoming flow, code-only/interior roles and required source interfaces. |
| Q41-F01/F02 / `native-dispatch.json:producer_records_inventory.artifact`, selector `producer_records` | Complete retained computed-jump producer observations | Trace register/slot writers, callback/vtable/registration domains and selector guards beyond contiguous fallthrough shapes. |
| Q41-F01/F02 / `native-ownership-classification.json:artifact` | 70,819 actual indirect CALLs + 11,649 indirect JMPs | Review each site/body/resolution basis and unresolved reason; prove required AS aliases and dynamic state. |

The [operand](evidence/0.121.0/native-operands.json),
[direct-flow](evidence/0.121.0/native-dispatch.json),
[constant-register](evidence/0.121.0/native-constant-dispatch.json) and
[opcode/source](coverage/native-ownership-classification.json) proofs use the
same selected census. The no-memory constant-register audit supplies no
additional target within its exact domain. Missing rows do not establish
global absence. Thirteen absent generic-engine source candidates remain
supporting context; inspect local benilla first and stop at an established
AS interface unless a concrete target-specific contract requires more.

The [complete fixed-address leaf review](address-leaves-0.121.0.md) classifies
all **twenty** operand-audit `not-observed` executable destinations and their
**21** forming operands as supporting WGSL, I/O, Lua arithmetic/compiler/string,
CRT or authentication-formatting interfaces. Nineteen retain their established
roles with checked current boundaries; the additional tangent guard matches the
existing engine primitive. These entries remain unobserved in the unchanged
census. Their bounded supporting roles establish no missing AS implementation
and are not new unknown recovery tasks; dynamic identities and wider behavior
remain outside the proof.

## Current AS residual ranges

The [complete AS-Location residual review](as-residual-ranges-0.121.0.md)
binds every mixed range wholly inside the 302 genuine AS-Location extents:
**148 ranges / 103,712 bytes / 20,620 linear instructions in 36 extents**.
No partially overlapping range is dropped; ten ranges selected only by literal
tokens are kept outside this narrower population. Ninety-seven intervals have
same-extent direct incoming branches and twenty have unapplied table-target
candidates, with six overlapping; 37 have neither under those exact domains.
Every preceding boundary is a jump, return or trap. This is complete local
encoding/entry evidence, not source ownership or reachability proof. All 37
intervals without those incoming observations are accounted for by 25
[gameplay/co-op prefixes](evidence/0.121.0/gameplay-reference-review.json) and 12
[UI/font boundaries](as-ui-entry-roles-0.121.0.md). Their existing interfaces and
the separately numbered source consequences are retained below; arbitrary
runtime entries and wider type/alias semantics remain outside this proof.

## Completed AS reference-interface review

The [complete current reference projection](q41-reference-frontier-0.121.0.md)
consumes all 4,046,360 retained reference records and the full operand stream.
Its 315 actual-body AS diagnostic-context owners (291 with genuine Rust
Locations) contain 32,775 references and 7,052 explicit operands. Neither bounded
join reaches the 8,048 unowned executable destinations. This is a negative join,
not global AS discovery closure. The complete 138-site indirect union separates
13 declared-only contexts, five platform imports, 45 retained table reviews and
75 further interfaces (65 game/co-op and ten UI/font sites).

The receiver proof distinguishes the accepted/published peer data/vtable pair,
its concrete TCP framing/pump/liveness/close methods, and the different
caller-supplied server-core interface. Existing source already implements those
bounded interfaces. The [UI/font review](as-ui-entry-roles-0.121.0.md) resolves
its ten sites and follows the actual meter/settings and changed-font consumers;
it found and repairs #250–#252. Classified interfaces are not missing-source
choices. Full source/type/alias semantics, complete native ownership and actual
client/server/game/rendering parity remain separately unverified.

The [extended residual replay](q41-residual-frontier-0.121.0.md) consumes the
complete stop, ownerless and reverse-flow populations. All 39 exits from the
file-backed complement enter the next declared extent; all 28 ownerless incoming
AS sites reuse retained run/token classifications. A separate 897-reference /
463-body caller set has completed native queries with exact saved plans and
results, while its source/semantic review remains unfinished. These observations
do not add decoded bytes, establish generic-engine ownership or close #41.

The [exact-slot continuation](q41-data-slots-0.121.0.md) joins all 676,285 explicit
expressions through 30 AS-context `.data` addresses and all 9,176 reverse
expressions. Three producer/helper queries classify locale selection/cache and
the shared registry; existing catalog, CVar and transport interfaces are retained.
Dynamic/interior aliases remain outside this exact-address join. The separate
[included-source proof](included-source-frontier-0.121.0.md) accounts for all
2,144 embedded candidates and 236 source directives: 173 unresolved binding/Lua
rows occur in included payloads. Inclusion does not establish native schemas or
reopen existing source solely for missing current applicability.

## Supplied release items: current source outcomes

The [native question frontier](evidence/0.121.0/native-question-frontier.json)
retains the initial 22 supplied-item navigation questions and three Heroic
producer/consumer questions. Original native ranges and source-first receipts
remain historical evidence; a raw pending navigation node is not a new missing
implementation. Each `RELEASE1210:item:<ID>` keeps its stable selector. The
[release review](release-review-0.121.0.md) and
[item proof](evidence/0.121.0/release-items.json) distinguish that initial audit
from the current source assessment.

Current source outcomes are summarized below. The linked canonical findings
own exact consumers, source/native proofs, material limits and unrun comparison
cases. These bounded source/static outcomes do not certify gameplay or parity.

| Finding / exact selector | Current source outcome |
| --- | --- |
| [#218](../verification-needed.md#gap-218) / `RELEASE1210:item:218` | Component source/static scopes supplied; resource/runtime limits open. |
| [#219](../verification-needed.md#gap-219) / `RELEASE1210:item:219` | Difficulty/twists and local Again source repaired; runtime/parity unverified. |
| [#220](../verification-needed.md#gap-220) / `RELEASE1210:item:220` | Current native contract and source implemented; runtime unverified. |
| [#221](../verification-needed.md#gap-221) / `RELEASE1210:item:221` | Current native contract and selection foundation implemented; runtime unverified. |
| [#222](../verification-needed.md#gap-222) / `RELEASE1210:item:222` | Current native contract and source implemented; runtime unverified. |
| [#223](../verification-needed.md#gap-223) / `RELEASE1210:item:223` | Current native contract and source implemented; runtime unverified. |
| [#224](../verification-needed.md#gap-224) / `RELEASE1210:item:224` | Current native contract and source implemented; runtime unverified. |
| [#225](../verification-needed.md#gap-225) / `RELEASE1210:item:225` | Current native contract and source implemented; runtime unverified. |
| [#226](../verification-needed.md#gap-226) / `RELEASE1210:item:226` | Current XP, feat and accepted-rank source connected; runtime/parity unverified. |
| [#227](../verification-needed.md#gap-227) / `RELEASE1210:item:227` | Current award and recipient source implemented; runtime/parity unverified. |
| [#228](../verification-needed.md#gap-228) / `RELEASE1210:item:228` | Pity and recipient source repaired; execution/parity unverified. |
| [#229](../verification-needed.md#gap-229) / `RELEASE1210:item:229` | Star transaction and armory input connected; runtime/parity unverified. |
| [#230](../verification-needed.md#gap-230) / `RELEASE1210:item:230` | Source stat projection implemented; runtime/parity unverified. |
| [#231](../verification-needed.md#gap-231) / `RELEASE1210:item:231` | Source stat consumers implemented; runtime/parity unverified. |
| [#232](../verification-needed.md#gap-232) / `RELEASE1210:item:232` | Source activation and spell consumers implemented; runtime/parity unverified. |
| [#233](../verification-needed.md#gap-233) / `RELEASE1210:item:233` | Source PvP set consumers implemented; runtime/parity unverified. |
| [#234](../verification-needed.md#gap-234) / `RELEASE1210:item:234` | Source metadata, rank queries and help connected; runtime/parity unverified. |
| [#235](../verification-needed.md#gap-235) / `RELEASE1210:item:235` | Source selection, save and rendering bridge implemented; runtime/parity unverified. |
| [#236](../verification-needed.md#gap-236) / `RELEASE1210:item:236` | Source collection, formatting and purchase controls implemented; runtime/parity unverified. |
| [#237](../verification-needed.md#gap-237) / `RELEASE1210:item:237` | Source catalog, predicates and snapshot consumers implemented; runtime/parity unverified. |
| [#238](../verification-needed.md#gap-238) / `RELEASE1210:item:238` | Source wire, admission, bootstrap and private receipts implemented; runtime/parity unverified. |
| [#239](../verification-needed.md#gap-239) / `RELEASE1210:item:239` | Source/static repair implemented; runtime/parity open. |

The narrower [Heroic proof](heroic-native-0.121.0.md) preserves recovered helpers;
the remaining questions do not reopen their established arithmetic/label scope.

| Exact selector / findings | Next static action |
| --- | --- |
| `HEROIC1210:seed-producer:0x145bdcc01` / [#221](../verification-needed.md#gap-221) | **Source/static recovered.** The [affix policy/calendar contract](heroic-affixes-0.121.0.md) binds current week/configuration/zone producers and their constructor copy path; the shared source supplies the recovered inputs. Actual clock/game execution and parity remain unverified. |
| `HEROIC1210:affix-consumer:0x145bdcc33` / [#221](../verification-needed.md#gap-221), [#244](../verification-needed.md#gap-244) | **Source/static recovered.** The current three-ID selection reaches [Bolstering, Sanguine and Explosive host simulation](heroic-affixes-0.121.0.md), including existing creation/cleanup and received-state interfaces. Full game/client/server execution, rendering and parity remain unverified. |
| `HEROIC1210:rank-producers:state+0x1bf` / [#219](../verification-needed.md#gap-219), [#220](../verification-needed.md#gap-220), [#238](../verification-needed.md#gap-238) | **Source/static supplied.** Selected Pick rank, effective Game rank, Normal-first/class unlock caps and current host/guest admission are connected in the owning menu, unlock and co-op reports. The Tester Game/host-metadata distinction is preserved. Actual execution and parity remain unverified. |

## Independent resource, query and selector questions

These findings remain independent of the supplied-item identities and module
registration dimensions. Exact native/resource/source commitments are retained
in their owning proofs; no absence or mechanical meaning is inferred solely
from data shape or a failed bounded lookup.

| Finding / exact evidence selector | Source boundary and next static action |
| --- | --- |
| [#246](../verification-needed.md#gap-246) / `RESOURCE1210:patch-B:DUST2B:consumer`, [model/texture proof](evidence/0.121.0/texture-consumers.json) | **Classified supporting resource consumers.** All 6,993 registered M2 members / 275,146,928 bytes were inspected in place. Four exact model texture/emitter consumers are retained in the [report](resource-texture-consumers-0.121.0.md), using existing M2/particle/MPQ/BLP interfaces. No Explosive Orb connection or new AS source defect was established; stop at those interfaces. Actual loading/rendering and parity remain unverified. |
| [#247](../verification-needed.md#gap-247) / [current Orb source proof](evidence/0.121.0/orb-source.json), entry9612 | **Source/static repaired.** Existing query construction and opcode0x61 serialization now publish localized Explosive Orb, type10/rank0/display16111 with fourteen exact locale entries and null-only fallback. Nineteen native packet cases pass. Scale/world-model resolution remains #248, combat #224; actual delivery/rendering and parity are unverified. |
| [#248](../CURRENT-STATE.md#gap-248) / `RESOURCE1210:display16111:M2-texture-consumer`, [world/publication proof](evidence/0.121.0/orb-world-resource.json) | **AS display route recovered; model input blocked.** Template12 selects entry9612/display16111/scale0.9, and the receiving AS helper publishes those unchanged to fields3/4/131/132 before the existing create-packet interface. All 24 native cases / 2,424 steps pass. The configured DBC route selects model2247, whose authored `.mdx` and normalized `.m2` names have no exact member in eleven registered MPQs. A matching payload or proved applicable native mount/model replacement is required before texture/emitter inspection. Actual loading/rendering and parity are unverified; the separate target-GUID repair is #253. |
| [#249](../verification-needed.md#gap-249) / [current selector contract](evidence/0.121.0/talent-selector/contract.json) | **Classified; retained source already matches.** Current raw36 binds `dark_pact` / Soul Reaping, coefficient0.05, half-step rank growth and generic aggregate publication. The existing stable marker253/35 source matches; 256 rank plus 256 publication cases / 72,192 original steps pass. No duplicate effect/enum renumbering was needed. Full combat/UI execution and parity remain unverified. |
| [#250](../verification-needed.md#gap-250) / `Q41-U03:font-SFNT-filter`, [table-filter proof](evidence/0.121.0/font-table-filter/manifest.json) | **Source/static repaired.** Current changed-font serialization omits exactly `DSIG`, `LTSH`, `VDMX` and `hdmx`; zero modifications preserve the original input. The live augmentation now removes those four original tables after its unchanged-input return. The complete tag/gate/payload boundary is checked; complete generated-font bytes, reconstructed execution and rendering/parity remain unverified. |
| [#251](../verification-needed.md#gap-251) / `Q41-F01:meter-mode3:0x1401c98a4`, [current source/native proof](evidence/0.121.0/party-meter-ui.json) | **Source/static repaired.** The fourth Party DPS mode is wired through existing settings/actions, host/guest HUD, rows/colors/icons/breakdowns, elapsed/history/reset and empty-state consumers. 76 original-instruction cases pass. Reconstructed compilation/execution, rendered interaction and parity remain unverified. |
| [#252](../verification-needed.md#gap-252) / [HUD clock proof](evidence/0.121.0/meter-clock.json) | **Source/static repaired.** Exact `time` lookup precedes all mode selection; the guest view now reads that HUD clock instead of its independent State/game clock. Eight bounded number/default cases and the source expression pass. This is independent of mode3 implementation; source execution and parity remain unverified. |
| [#253](../verification-needed.md#gap-253) / [active hero/ward target contract](evidence/0.121.0/ward-target-guid.json) | **Source/static repaired.** A once-process identity or selected stock roster GUID enters Game+4b0 and is exchanged with each active private hero. Native ward creation publishes that captured GUID to target fields16/17; the source correction carries it through `RunSeeds`, Game entry and `ActorView`/`UnitSnapshot`. Eight seed, eight constructor, eight swap and 96 publication cases pass. Default native/source checks pass against the committed code; compiled/live behavior and parity remain unverified. |

## Retained guarded-table correspondence (not new repairs)

The [unapplied proposal proof](evidence/0.121.0/native-switch-proposal-review.json)
retains 1,108 additions / 6,865 distinct target candidates: 583 exact starts,
6,282 unobserved targets and zero instruction-interior conflicts. Proposed edges
are not applied census edges. All 45 current AS-context tables have
[bounded source/context review](evidence/0.121.0/switch-context-source-review.json).

Each stable selector is `Q41-F01:correspondence:<question ID>`, selecting the
matching `computed-correspondence-frontier.json:leads[<question ID>]` record.
The [reviewed supplement](evidence/0.121.0/reviewed-switch-correspondence.json)
separately preserves the changed CreatureQuery interface; it does not rewrite
the generic six geometry matches/eight unmatched result. Seven questions have
a current candidate after that interface review; seven remain wholly unmapped.

| Stable question ID / findings | Current candidate or precise remaining action |
| --- | --- |
| `retained-table-1403076a2` / #17/#73 | Dispatch `0x1400fa4b2`, table `0x1461b1f80`: map current Codex input/type/field producers and Details formatter/consumer to retained jewelry growth. Geometry alone does not revalidate dependencies. |
| `retained-table-145afa2a7` / #64/#65 | Reviewed changed query interface: dispatch `0x145b101b4`, table `0x147664420`, opcode96 and base9500, domain112→113. #247 recovers the new9612 cell. Recover other-case/default/producer/consumer applicability against the retained finite contract. |
| `retained-table-145afb3fb` / #64/#65 | Wholly unmapped: locate the retained guard/selector and required producer/consumer range in current bytes. |
| `retained-table-145afb49a` / #64/#65 | Dispatch `0x145b1171e`, table `0x14766475c`: map entry/selector producers, finite metadata cells and reply/source consumers. |
| `retained-table-145afb64e` / #64/#65 | Wholly unmapped: locate the retained guard/selector and required producer/consumer range in current bytes. |
| `retained-table-145afb798` / #64/#65 | Wholly unmapped: locate the retained guard/selector and required producer/consumer range in current bytes. |
| `retained-table-145afb7c1` / #64/#65 | Wholly unmapped: locate the retained guard/selector and required producer/consumer range in current bytes. |
| `retained-table-145afb7ed` / #64/#65 | Wholly unmapped: locate the retained guard/selector and required producer/consumer range in current bytes. |
| `retained-table-145afbad2` / #64/#65 | Dispatch `0x145b11d6c`, table `0x147664c98`: verify current producer/domain/cells and reply/source dependencies against retained metadata recovery. |
| `retained-table-145afbb29` / #64/#65 | Dispatch `0x145b11d94`, table `0x147664fa4`: verify current producer/domain/cells and reply/source dependencies. |
| `retained-table-145afbb66` / #64/#65 | Dispatch `0x145b11dd1`, table `0x147664c70`: verify current producer/domain/cells and reply/source dependencies. |
| `retained-table-145afbb92` / #64/#65 | Wholly unmapped: locate the retained guard/selector and required producer/consumer range in current bytes. |
| `retained-table-145afbe39` / #64/#65 | Wholly unmapped: locate the retained guard/selector and required producer/consumer range in current bytes. |
| `retained-table-145afbed3` / #64/#65 | Dispatch `0x145b12134`, table `0x147665134`: verify current producer/domain/cells and reply/source dependencies. |

All fourteen questions above retain already classified finite contracts. Their
remaining newest-target mapping/applicability alone is excluded from repair
choices; changed query metadata and talent behavior have their distinct #247
and #249 owners. Raw unmatched geometry does not reset recovered semantics.

[Incremental correspondence](evidence/0.121.0/incremental-correspondence.json)
preserves **93 historical review records**, including prior source repairs and
classifications with their actual targets. These overlapping review records
are not 93 distinct features or current contracts. Current mapping, dependency
applicability and unknown behavior remain separate. A geometry mismatch does
not erase recovered semantics or prove a new gameplay difference.

## Individual module dimensions

The [module register](module-contracts-0.121.0.md) links each current module to
its exact source/native scope and permanent findings. The Heroic, affix and set
source dimensions (#240–#242) and bounded registrations (#243–#245) retain their
separate contracts and consumer owners. The current font and meter contracts
are independently #135/#250 and #75/#251/#252.

| AS-only module measure | Current result |
| --- | ---: |
| Known modules with partial reconstructed source mappings | 63/63 |
| Modules with registered current-target bounded recovery contracts | 16/63 |

The qualifying modules and exact scopes are listed in the module register. These counts follow the actual connection
ledger's bounded-contract admission rule. One bounded contract does not certify
a whole module; a partial source mapping does not establish full implementation.
Pending current applicability/registration alone is excluded from repair
choices. All six discovery stages retain partial semantic limits. Generic
engine/compiler residuals remain supporting context until a concrete AS
interface or bounded ownership question requires expansion.

The ledger's narrower Location/source projection retains **55 ownerless native
Location references across twelve AS paths**. Its historical-range join retains
**19,901 commitments**, with exact match candidates remaining navigation rather
than semantic correspondence. Neither projection replaces the broader residual
or missing-contract selectors above.

## Controlled comparisons still required

All cases below are **not run**. Any later permitted comparison must bind the
exact original target hash and rebuilt source revision; record MPQ chain,
locale/addons/settings, account/class/zone/equipment state, inputs, RNG/seed and
clock/timing controls, plus any uncontrolled differences. Static recovery and
synthetic instruction fixtures do not transfer runtime/parity evidence.

| Comparison population | Required cases |
| --- | --- |
| Heroic selection/unlocks | Normal and ranksI–V, class-specific normal clears versus account-wide rank unlocks, locked/invalid selections, persistence and failure paths. |
| Weekly affixes and combat | Controlled weekly boundaries/seed inputs; rankIII/IV/V selection, affix creation/stack/pool/Orb lifetimes and cleanup, direct/weapon versus area hits and health-based effects. |
| Rewards, equipment and UI | Class marks/duplicate conversion/endless growth, misses/successes and pity persistence; all star ranks/costs/discounts/caps, worn four/eight-piece activation/empowerment, spell overrides, tooltips, collection transition, tenths formatting and glow priority. |
| Cooperative admission/settlement | Host-selected rank, every guest's unlock gate, private marks/drops/clears, player-count HP/density/damage and disconnect rescale. Existing no-server-operation restriction remains in force. |
| Baseline client and presentation | Vanilla movement, mouse/orbit/follow/zoom camera, real FrameXML/action bars/unit frames, overlays/input, graphics/audio and save/settings/failure behavior. |
| New resource/model | First identify the actual consumer/model and asset availability; then compare controlled loading, emitter/texture lifetime, appearance and cleanup for the same assets and state. |

No application compilation, compiling test, client/game/network/server operation,
installed save/settings mutation or controlled original/rebuilt comparison was
performed in this audit. Required builds and runtime checks need their separate
authorization; this queue authorizes no server operation. Missing evidence,
source differences, source implementation and verified parity remain distinct.
