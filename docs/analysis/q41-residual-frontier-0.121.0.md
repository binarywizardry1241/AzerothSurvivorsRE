# Residual code and incoming-flow frontier — 0.121.0

Permanent **#41**, leads **Q41-U01/U03/U04/G01/B01**. Historical **0.121.0** EXE
SHA-256: `22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [compact proof](evidence/0.121.0/residual-frontier.json) reconciles complete
retained populations with the existing [ownerless-AS classification](as-ownerless-sites-0.121.0.md)
and [AS-context residual-range review](as-residual-ranges-0.121.0.md).
It adds no decoded instructions, function owners or inferred source defect.

## Complete residual reconciliation

All **358,683 declared extents** retain complete linear decoding, with zero
undecoded suffixes. This is decoding coverage, not a semantic classification of
every extent. The **338,114 complement regions** and all **6,027 complement
stops** are consumed independently. Their stop reasons remain:

| Stop reason | Records | Bounded interpretation |
| --- | ---: | --- |
| Jump with no fallthrough | 2,913 | The linear pass stops at the encoded transfer; computed targets and runtime entries retain their separate questions. |
| Return | 3,068 | A nominal return encoding ends this pass; it does not prove whole-function semantics or reachability. |
| Trap or privileged exit | 7 | An encoded terminal boundary, without inferred AS ownership. |
| Outside the file-backed complement | 39 | Every stop equals the entry of the next declared unwind extent. |

For all 39 final rows, the preceding complement region ends at that same
address. The proof binds its complete prefix bytes and the following declared
extent. These are exact pass-boundary transitions into an already accounted
range, rather than 39 unexplained decoding successors. No instruction is
silently inserted into the selected Ghidra census, and no prefix is declared
padding, dead code or an AS feature.

All **91,724 observed ownerless instructions** are retained. Context joins
account for the complete population:

| Enclosing declared-extent context | Instructions |
| --- | ---: |
| Genuine AS Rust Location | 790 |
| Other diagnostic context | 24,927 |
| No diagnostic context | 25,093 |
| Outside declared extents | 40,914 |

The 790 genuine-AS-context instructions exactly reproduce all **49** retained
runs, including each run's instruction count. Their existing failure/removal/
token classifications are preserved. Other diagnostic or absent context does
not itself establish generic-engine or AS ownership. The original missing-byte
and ownerless totals therefore remain unchanged; no residual population is
dropped or newly equated with missing AS implementation.

## Reverse direct-flow projection

The earlier [reference-interface review](q41-reference-frontier-0.121.0.md)
joins outward from actual AS diagnostic-context bodies. This complementary
projection reads all **4,046,360 references** and selects destinations in those
same **315 bodies**. It keeps references, actual instruction ownership,
declared-extent context and semantic ownership distinct.

Exactly **28** direct CALL/JMP references originate at ownerless instructions:

- **25** source sites are members of the retained 49 classified runs.
- **Three** source sites are the retained `p` token-consumer calls at
  `145c91e00`, `145c91f36` and `145c91fdc`, in extent `145c91c40`.
  Their explicit length is one; adjacency to `i18n.rs` does not make these
  uses filename arguments. The five existing token classifications retain
  their separate selector from the genuine Rust-Location frontier.

All 28 sites are already observed instructions. The replay checks every exact
source, destination and retained classification. They expose no additional
unclassified ownerless AS operation. None lies in the separate 148 *unobserved*
mixed ranges; those populations must not be conflated.

A separate **897** direct CALL/JMP references originate in **463 actual
bodies** outside that AS diagnostic-context set. Of those references, 896 are
from 462 bodies without diagnostic association, and one is from a body with
another diagnostic context. Their complete original rows, source/destination
owners, extent contexts and ordinals are retained in the proof's ignored
`other_body_incoming_artifact`. This is a filename-free caller frontier, not
897 missing operations. Known contracts and actual source consumers must be
checked before treating any member as a new AS task. A proved generic helper
stops at its existing engine interface; unmapped historical applicability
alone does not reopen implementation.

Both completed journaled Ghidra batches are bound by the compact proof, covering
the exact **463 caller subjects** with nonempty saved pseudocode. Plans, seeds,
journals and original results remain under `runtime/fixgap41-callers/` for reuse.
The saved/static pass now records each subject's bounded immediate role or
reliable prefix, source interface/candidate and specific remaining boundary.
Two whole saved subjects remain unsafe because of overlapping/bad-flow tails.
Deeper AS producer, alias and dispatch questions remain separate; completed
queries and immediate role classification do not establish source equivalence.

## Saved caller interface review

The [caller context review](evidence/0.121.0/caller-context-review.json) validates
all 463 saved result receipts and the complete 897-reference projection without
rerunning native analysis. It classifies the bounded immediate role of 416 subjects:

| Subjects | Bounded role established from the saved bodies |
| ---: | --- |
| 51 | Bevy exclusive-system adapters: preserve/install the World tick, admit initialized parameter state, call the recorded AS system, flush and publish the next tick, then restore the saved tick. |
| 60 | Bevy function-system adapters: admit initialized state and matching World, prepare parameters/resources, allocate a change tick and call one AS system. The two touch/pad apply variants preserve their additional post-call step. |
| 24 | Nullable localization lookup with an explicit input/table fallback; generated keys retain temporary-string cleanup and indexed variants retain bounds gates. |
| 19 | Scoped locale callbacks: select the fourteen retained language codes, preserve/install TLS locale words and restore them on the shown successful path. Enclosed gameplay/party callbacks remain separate. |
| 13 | Output-collection allocation/reserve and iterator adapters; element identity and iterator behavior are not inferred from allocation width. |
| 1 | Direct call wrapper `140225910` into `140097040`. |
| 8 | Achievement-comparator sorting support: read optional first-earned dates, use zero for absence and order descending by date, then descriptor points. Generic sorting stops at that AS comparison. |
| 4 | JSON numeric-property append adapters, including temporary formatting allocation/cleanup. A shared formatter's `sets.rs` diagnostic does not turn these into set mechanics. |
| 213 | Explicit Save, Armory, loadout, codec, projectile, updater, localization, UI, account, party, actor, effect and choice interfaces, with per-subject inputs, source consumers/candidates and precise remaining boundaries. |
| 23 | World update-block writers, named opcode/payload builders and actual actor/local-field publication; caller-specific type/flags, numerical producers and delivery lifetime remain separate. |

Another **47 subjects** already have bounded contracts or source connections
in same-target owning reports. The review links their exact report spans and
preserves those scopes instead of resetting them to unexplained callers.
Missing newest-target applicability does not reopen their implementation.

Two whole saved decompiler subjects, `145b4e970` and `145b54a40`, retain unsafe
overlapping/bad-flow tails. Their bounded native tooltip roles are established
from reliable prefixes and retained declared/linear extents; their original
warnings and unresolved dispatch/shared-flow questions remain open. Every
subject retains its operation and exact incoming-row selectors. The per-subject
`remaining_boundary` also preserves unresolved record/variant, key/format,
projection and protocol-producer questions within classified interfaces.
Thus **416 + 47** accounts for all 463 subjects, while
`full_source_semantics_closed` remains **zero**. These counts measure bounded
review disposition, not 463 complete implementations. Classifying an adapter
stops generic engine recovery at the AS callee; it does not certify that callee,
its concrete application inputs or reconstructed source equivalence.
The per-subject limits preserve thirteen unsettled-type results, two with
bad/truncated flow, two with overlapping instructions and two with an
unnormalized switch selector; these sets overlap. Allocator/import jump warnings
are not promoted into missing AS behavior. The saved output alone cannot settle
those type/boundary/dispatch questions.

### Save and sorting continuation

All eighteen former Save-interface questions now have concrete bounded roles.
Eight are pointer-sort specializations over achievement descriptors, not Save
mutations. Read-only key lookup `145ab4ca0` returns presence in RAX and the
date in RDX; absence selects zero before the unsigned date/points comparison.
The current `progression.rs` RECENTLY EARNED path already uses
`Reverse((date.unwrap_or(0), points))`. Original census instructions also retain
the merge/comparator blocks that the saved `1401b9130` decompiler discarded
after a mistaken `memcpy` control-flow conversion. No new query is needed to
identify that role, and generic sorting is not an engine-reconstruction task.

The other ten roles are the achievement card's optional date display, Codex
seen-membership counts, pressed-input talent allocation/store/publication,
account Pick clamp and class-change adapter, active Save loading, export/seal,
sealed import, permanent roster-row parsing and seen/discovery persistence.
The review links their live source owners and stops at separately unresolved
UI carriers or file/lifecycle boundaries. In particular, `145aa2050` is a generic
bounded decimal-u64 column parser, and `145aa5560` merges sorted seen keys with
quality capped at four and reports actual changes. Diagnostic filenames do not
make these primitives separate missing Save features.

### Item and publisher continuation

All twenty-six former item/class/rank/set questions have bounded role/source
assessments. They include Armory details/tiles/collection, nineteen-lane
admission/sanitization/outfit composition, item token readers, drop-source and
class/paperdoll projections, remote feat/pity collectors, the numeric-property
adapters and the actual projectile and choice-publisher callers.
Descriptor compact slot `+0x48`, display ID `+0x54`, inventory type `+0x60`,
paperdoll lane `+0x68` and class `+0x69` remain distinct; byte width does not
identify a rank or inventory type.

Two recovered constituents retain explicit blockers rather than guessed output.
Choices JSON publisher `145c425a0` reaches computed transfer `145c430b9` for
nonempty card variants; its exact selector type/domain and remaining arms are
unresolved. Appearance projection `145ca08a0` loses output aliases in the saved
seeded pseudocode; its exact native field writes, absent-item result and parent
consumer remain open. The remote feat collector `145c690f0` and incoming
class-filtered pity/count clamp `145c78860` already have same-target Hero4
contracts, which are preserved rather than offered again as unexplained set
arithmetic or a new rank cap.

### Packet and presentation continuation

The twenty-three packet-context callers now distinguish actual world update
blocks, root/unroot, knockback/run speed, MonsterMove, spell start/go, melee,
healing/periodic logs and teleport acknowledgements from their enclosing AS
producers. The local pending-field drain moves/resets its vector before queuing
one active-hero update. The fractional actor-heal owner mutates health, publishes
the health field and then optionally publishes its self/self healing log; the
existing ward heal and client-event path preserve that order. Exact AS
create-block variants, flags and high words still require their real producer
mapping before claiming correspondence with generic engine encoder alternatives.

Seventeen further small or explicit presentation callers now have identified
size/update readiness, achievement/guardian/boss/unlock notice, object/item/school
name, flavor/attribution/status-tooltip, downed/HUD JSON, reward/unlock and cache
purchase roles. The cache admission body independently retains strict four-second
insufficient-gold throttling, subtraction before price advancement, separate
`f32` multiply/add and coinage/count publication. Pointed descriptor data, remaining
effect/field enums and complete UI/delivery lifetimes retain each subject's exact
boundary. Explicit formatter/JSON identity is not a gameplay implementation claim.

### General caller and locale continuation

All 103 remaining general caller subjects now have individual immediate role,
source interface/candidate and boundary records. The UI callers resolve to
Picker class/start-loadout views, account Rewards confirmation/reset and perk
admission, talent trees/specs, Armory item/drop-source details, Codex categories,
marker geometry and co-op JSON consumption. Generic collection, sort scratch,
TLS hashing and UI construction stop at those interfaces. A shared diagnostic
filename does not assign an unrelated feature to them.

The gameplay callers distinguish the Game frame coordinator, pending-hit drain,
XP award, store-levels setter, skip/banish/reroll actions, nearby reward-object
interaction, revive, healing attribution, aura mutation/publication, Polymorph,
Bloodrage, demons, loot companions and their terrain-grounded movement/create
publication. The two amulet helpers `145abd5e0`/`145abdd20` project next/current
scaled effect descriptions using the existing amulet multiplier interface.
Party callers distinguish selected-peer guards, member collection, relay
forwarding, ended/off teardown, logout and remote-hero admission/bootstrap.
None of those identities alone establishes the complete caller ABI or current
target behavior.

All 64 remaining locale/UI subjects also have individual assessments. Their
concrete consumers include achievements/categories, race/tabard/companion
Rewards, host capacity/form and lobby rows/filters, terminal talent-XP display,
stored-level HUD, ability/jewelry prose, starter-item descriptors, character
appearance labels, recipient-locale chat/card rewriting, party JSON and
END/RUN/ZONE/boss/ability/meter addon serializers. Existing Continue/endless
owner `145bc89d0` retains its same-target
[bounded lifecycle proof](evidence/0.121.0/reward-endless-lifecycle.json).
Known identities whose remaining question is an old label/template or newer
target applicability do not become fresh implementation tasks.

The following selectors retain actual native/source questions beyond generic
plumbing. The JSON records each member's exact journal operation and incoming
rows; these groups do not replace those selectors.

| Subjects/selectors | Exact remaining question and retained-input boundary |
| --- | --- |
| `145b4e970`, `145b54a40` | Their exact declared/linear extents and safe prefix slices are retained below. Whole saved C overlaps `145b5dab1/b0` and `145b5db25/b21` and includes unrelated tails. Resolve the four/seven exact indirect-jump selectors in the JSON, including relative tables `14768623c`/`1476862fc`, their valid domains and destinations. Pdata alone does not exclude shared/disjoint flow. |
| `145c425a0` at `145c430b9`; `145c1c0f0` at `145c1c207` | Recover the actual card/object selector type/domain and remaining computed arms. Placement's signed-relative table is `147693378`; saved caller text does not contain it. |
| `145ca08a0` | Recover exact nineteen-lane output writes, absent-item result and input/consumer type. Seeded pseudocode loses the output aliases; no appearance value is invented. |
| `14008c570`, `145abd9e0`, `145abb220`, `145abb3c0`, `145c8f2c0` | Identify the real incoming record/callback and bind the noted key prefixes/templates. Their clone/lookup/format behavior is known; specific AS notice/descriptor ownership remains unproved. |
| `145aba7d0`, `145b48c00`, `145c71670`, `145c84890` | Bind the glyph-vector producer/native bounds encoding, resource path/parsed record, locale mapper output and composite party row. The font helper's length>=10 and offsets2/4/6/8 match existing `font_patch::glyph_box`; its native extraction encoding remains unproved. Allocation width does not supply the other types. |
| `145b33630` | Identify the actual two-byte command admitted by the joined-slot guard and its `145bb1a20` consumer. The caller proves routing, not the command enum. |
| `145b64f40` | Bind native party JSON fields, particularly `zoneOk`/`classId`, to their source publisher/receipt registration. The existing party view is a consumer, not proof of the whole schema connection. |
| `145bb8660`, `145c95e20`, `145c96800` | Bind the object/list/timed-state/meter row schemas and numerical/category aliases to their serializers' actual inputs. Joining strings or matching totals/rates does not establish every column. |
| `145bc4680`, `145c006e0`, `145c42560`, `145c49a80`, `145c49ae0`, `145c4d3a0` | Resolve the stated effect/hit/card variants and shared-tail aliases before whole-flow claims. Broad saved decompiler bodies do not establish all causal routing, RNG or phase transitions. |
| `145b8b890` | Bind the actual actor caller and later grounding to the XYZ clip result. The historical helper interpolates Z; an existing source caller retaining `from.z` alone does not establish a current defect. |

The saved pseudocode and scoped historical preimages omit the noted constants
and tables. This does not establish that the retained historical Program lacks
their bytes. That Program and the existing instruction payload are the bounded
recovery inputs; installed 0.127.0 bytes cannot be queried at old addresses as a
substitute. No new native producer was launched for this continuation, and no
source defect was inferred merely from missing current correspondence.

The tooltip boundary check reused retained PE runtime-function records 340383
and 340441 and the original Capstone linear inventory. `145b4e970..145b51b6c`
contains 12,796 bytes / 2,409 linear instructions; `145b54a40..145b5872e`
contains 15,598 bytes / 3,017. All 126/221 direct jumps remain within those
declared extents. Four/seven indirect targets remain unresolved. The first
dispatches read definition byte `+0x75` and saved R9B mode respectively; this
establishes the base-description and mode-dependent-detail interfaces without
inventing their table arms. Four exact census spans bind the reliable prefixes,
one grow-buffer path and a UD2, with row and byte digests in the JSON. The
whole saved decompiler outputs remain unsafe; no new native query, original
image copy or assembly extract was created.

This review belongs to **0.121.0**. It preserves knowledge for the current queue
without transferring addresses, behavior or validation to 0.127.0. No source
defect, current-target applicability, compilation or execution is established.

## Reproduction and limits

```sh
python3 -B scripts/classify-q41-residual-frontier.py
```

The default replays and compares the exact compact proof and complete caller
artifact without writing. `--write` explicitly publishes them. The script
verifies the installed target, all consumed document/export hashes and the
actual helper-source receipts before and after its complete joins. It launches
neither Ghidra nor original/rebuilt code. The retained native census and
classifications keep their original evidence and profile boundaries.

These complete structural joins neither close global AS ownership nor establish
dynamic targets, aliases, runtime reachability or whole-module equivalence.
The filename-free caller continuation remains separately owned under #41.
No compilation, client/game/network/server operation, installed settings/save
mutation or original/rebuilt parity validation is established.
