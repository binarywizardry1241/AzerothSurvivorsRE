# AS producer contracts and effect indices

This source/static recovery for **#41** is bound to installed 0.112.0 SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall reconstruction status.
No compilation, game process, rendered comparison or original/rebuilt parity
check ran. Generic engine reconstruction is outside this work.

## Repaired live effect partition

Native aggregate `1458975c0..1458977e0` diverts effect **36** into merged numeric
stats and effect **37** into a separate 32-byte spell-modifier vector. Other
variants retain their 64 bytes in a generic vector together with matching
40-byte source metadata. Rebuild `14592d530` publishes those separate vectors at
`14592d840..14592d88d`; generic rows reach `Game+828/+830`, which executor
`145934c50` snapshots before assigning a generic effect index.

Source previously kept internal stat30/spell31 rows in `Effects.rows`. A numeric
row before a proc therefore increased its source index, deadline/counter slot
and captured effect attribution, although the original generic vector excluded
that row. `Effects::rebuild` now partitions generic rows, spell rows and merged
stats in the original input order. `spell_modifiers` and Imp Fire power read the
separate modifier rows. Talent/amulet provenance, meter metadata and retained
talent prefixes use the same generic-only ordering. Generic event, periodic and
deferred attribution continue to capture indices into that vector.

Native `14592da81..14592dab9` also retains temporary-stat entries only below
the generic **talent** count. Source previously used total composed rows, which
could keep an old amulet stack when a replacement occupied its index. Reward
refresh now removes that entire temporary suffix while preserving talent
entries. The stable native compaction at `14592df8f..14592e036` is replayed for
empty, reordered, duplicate and out-of-range indices.

The current Warlock catalog also omitted native army grant/rank29/30 rows
because Config/actors own their behavior. The original aggregate retains those
no-op generic slots, so omission shifted subsequent indices. They now retain
explicit marker253/native-tag-at63 payloads. Config/actors remain the sole
behavioral owners; rank30 retains the original rank byte. Markers do not enter
amulet description inputs. The source descriptions no longer accept the
unsupported historical modifier7 cooldown alias: all current producer modifier
values and each native inner table are exactly **0..6**.

The source regression fixture checks interleaved numeric/generic order and
empty rebuilds. The existing treasure regression now distinguishes equal input
descriptor counts from different generic suffix lengths: Execute has two
generic effects, Onyxia one. Replacing the item retains the talent prefix and
resets/truncates only the actual generic suffix. These Rust regressions were
written and syntax-parsed, not compiled or executed.

All manual `Effects` initializers were inspected. Spell fixtures populate
`talents` then rebuild; direct generic-row fixtures contain generic tags only.
The five `mechanics.rs` provenance helpers start from empty allocations and add
one passive row. They now use the shared `generic_talent_count` contract as well.
Captured periodic/deferred source words, meter lookup and demon effect timers
all use the same filtered row index; description builders still use complete
item definitions, so partitioning does not remove numeric tooltip lines.

## Current static evidence

[Contracts](evidence/0.112.0/gameplay-frontiers/contracts.json) and
[Ghidra provenance](evidence/0.112.0/gameplay-frontiers/rea-provenance.json) retain:

- **355 talent descriptors / 429 ordered payloads**, across all nine classes,
  compared with the live source overlays by count, tag, marker and modifier.
- **1,121 original rank-collector inputs / 1,227 emitted effect rows**; variant
  and modifier bytes retain their input identities.
- **113 generated and 16 shared amulet descriptors**, producing 372 effect
  rows, using the current factory and immutable shared table.
- Original aggregation of all **1,599** supplied effect rows: **304 generic
  records** with exact copied bytes and ordered source stamps, **655 spell
  modifiers** and **29 merged stat tags**. Combining these fixtures is a static
  producer-domain exercise, not an attainable player build or eligibility test.
- A complete conservative AL control-flow proof for `1459b7f00`: every normal
  return is in **0..3**, even when every callee may return an unrestricted byte.
  Eight original guardian cases produce all four values; six negative fixtures
  cover calls, clobbers, partial writes, implicit writes and indirect flow.
- Original pattern-filter execution for every **256** prior-state byte. Its
  supplied inline input is exactly `00,01,02,03`; it removes only the prior byte.
- **72 original selector-prefix cases**, separately scoped to guardian/pattern
  producers, generic effect0..35 and content modifier0..6. Tables are immutable
  signed-LE32 data and every selected destination is independently decoded.
- **147 original reset profiles** for the deadline/counter/timestamp vectors,
  plus **49 stable temporary-prefix compactions**, including removed amulet
  indices that still fall below the new total generic length.
- **58 immediate direct calls** to eight selected owners, independently found
  across all file-backed executable sections and checked at unwind-owner
  instruction boundaries. This catches omitted census edges: seven cast callers,
  the reward tooltip caller and both reward rebuild calls.
- **4,952 original slice-reader cases**: 512 linked-pickup GUID, 4,112 nearby
  pickup GUID, 288 army-descriptor and 40 timed-cast cases. Each preserves every
  supplied pickup/effect row. Iterator cursor/output vectors are separate.

The canonical current reset, rank collector, ability factory and amulet scaling
extracts remain in their existing reports. Only new filter, aggregate and rebuild
pseudocode is retained here. Full-PE decompiler warnings and missing global
type/alias information do not supersede exact instructions or the stated input
fixtures. No global census/body ownership is changed by these observations.

## Per-site source and remaining proof boundary

Every remaining site has a live AS consumer; local enum arithmetic is not used
to invent a new input domain. The current source changes resolve the demonstrated
partition/index defect. The following wider native proof obligations remain
explicit and do not independently imply another source defect.

| Native site | Current producer/input and live source consumer | Recovery and remaining obligation |
| --- | --- | --- |
| `145903061` | Pickup constructor `145944310` → 72-byte `Game+610/+618` rows, kind+20 → `gameplay/mechanics/pickups.rs::collect_pickup` | All 22 observed direct constructor calls inspected: constants0..6, except rune prefix `14590676f..14590678a` bounded to3/4/5. Current pickup lifecycle reports own append/removal. A closed inventory of all mutable pickup-row writers/indirect producers is not established by direct references. |
| `14590512b` | Fixed stack `00/01/02/03` → `1459cbd40` filter → length-checked selection → ESI/fallback save → `enemies/waves.rs::WaveTimers::tick_pattern` | The exact input route and all prior bytes are checked. Arbitrary replacement iterator buffers or alternate incoming aliases are not admitted. |
| `1459167bd` | Copied 48-byte queued action, tag+45 → live queued dispatch in `bosses/raid_areas.rs::Pending::dispatch_current_with_rng` | Current493-node graph, recursive producers and native sentinel255 are retained by raid reports. This does not enumerate every mutable action buffer alias before the normalized switch. |
| `1459179b6` | Hazard shape+30, kind4 lane → `bosses/raid_extra.rs::Area::advance_extra` gaze/geometry | Base R12 is initialized at `145917234` and remains unchanged in the observed linear span. Full incoming shape aliases are not inferred from that preservation. |
| `145918086` | Active hazard shape+30 → `Area::advance_extra` and `raid_areas.rs::Area::contains` | Current native shape constructors, lifecycle and geometry fixtures remain canonical. Every mutable input reaching this distinct state gate is not globally typed. |
| `1459182c9` | Due hazard shape+30 → `Area::contains` / activation consumers | Same current common constructor `14591f490`, plus shape2 mutation at `14591785b`; whole alias closure remains unproved. |
| `1459192d7` | Kind2 periodic/Aftershock shape+30 → `Area::advance_extra` | Current periodic/Aftershock producer and state transitions are covered by the stateful raid owner. Full mutable shape ancestry remains separate. |
| `145919353` | Kind3 periodic shape+30 → `Area::advance_extra` | Current periodic/native tick and geometry consumers are retained; no arbitrary shape domain is promoted from a fixture. |
| `145919a34` | Indexed hazard shape+30 → `Area::contains` and current hazard traversal | Hoisted R14 table is initialized at `1459198e5`; observed preservation is checked. Alternate incoming aliases require a closed shape writer inventory. |
| `14591a026` | Hazard kind+10 → `raid_areas.rs::Area::message` and `gameplay/mechanics/bosses.rs::raid_marker` | This is native `hz` JSON presentation (`danger/tower/pool/live`), not a new damage dispatcher. Existing14 kind/active fixtures and all13 observed common-constructor callers are retained; full mutable kind ancestry is unproved. |
| `1459250f3` | Incoming learned instance → descriptor byte+75 → `player_abilities/behavior/dispatch.rs::cast` | All113 immutable descriptor/factory tags and seven direct dispatch callers are available. Two calls inside the generic executor use proxy `145939fb0`, already retained by the current free-instance contract; live `milestones.rs::generic_freecast` captures/restores the generic source index. Reconstructed instances retain source-owned descriptors. A whole-native-instance pointer/mutation proof is not supplied by descriptor membership. |
| `145934f5e` | `14599e8d0`/amulet mapper → aggregate `1458975c0` → rebuild publication → copied generic vector → `callbacks.rs::generic_event_with_demons` | Full current descriptor/rank/aggregate domains and source partition are checked above; generic0..35 table/prefixes are valid. Unseen mutable Vec writers or arbitrary caller aliases remain outside that bounded claim. |
| `1459471a1` | Direct helper `1459b7f00` → AL → `guardians/ai.rs::GuardianDecision` and live `tick_guardian` | Complete normal-return byte domain0..3 proved; no arbitrary caller input value is assumed. Native helper/body ownership is otherwise unchanged. |
| `1459f5738` | Effect37 modifier+24, localized named branch → `loot_rewards/prose.rs::effect_description` | All current talent/amulet modifiers0..6 and native scaler identity are retained; exact7-case selector replay. Wider live effect-buffer aliases remain separate. |
| `1459f592c` | Same modifier, `Your spells` branch → `effect_description` | Same checked current inputs; independent table bytes and seven prefixes. The historical modifier7 alias was removed. |
| `1459f5b1e` | Same modifier, zero-length localized-name branch → `effect_description` | Same current producer/scaler bounds and distinct prefix replay; missing global buffer ancestry is not replaced by the named-branch fixture. |
| `1459fa10f` | Second effect-text builder, modifier+24 → `amulets::description_lines` → `gameplay/native_overlay_payload.rs` | Native builders iterate64-byte records. Current0..6 producer/type domain and table are checked; descriptors do not certify every arbitrary mutable buffer caller. |

For the hazard rows, all13 observed direct common-constructor callers and the
actual 128-byte publication were inspected. Native shape/kind values originate
in small stack descriptors; the current state consumer explicitly rewrites
shape to2 for its active line/tether state. Existing full graph/producers and
stateful source checks provide the supported gameplay path. Static observed
call membership alone cannot prove absence of additional computed or aliased
writes, so it is not represented as complete native ownership or parity.

## Followed mutable AS routes

The published header/tag writers and their identified consumer aliases were
followed through the existing custom owners and selected AS helpers. The bulk
source-operand inventory remains ignored; these are bounded contracts and do
not promote the global census or unknown body ownership.

| Typed collection | Identified AS writers/readers and boundary |
| --- | --- |
| Pickups `Game+608/610/618`, stride72 | Constructor `145944310` appends the bounded kinds; `14594d9e0` removes by full72-byte compaction. `1459d4d20` returns linked companion GUIDs and `1459d4350` returns eligible nearby GUIDs, with original rows unchanged in4,624 native cases. The shared interfaces are Vec growth `145c0da10` and complete-record memmove `145c0a3ed`. |
| Hazards `Game+590/598/5a0`, stride128 | `14591f490` and specialized branches of `14591f790` append current graph-derived rows. Consumer `1459164c0` removes complete records and explicitly rewrites the active line/tether shape to2 at `14591785b`. Current raid producer/state/geometry/marker reports retain all identified AS behavior. Shared Vec growth is `145c0daf0`; compaction is `145c0a3ed`. |
| Queued actions `Game+5a8/5b0/5b8`, stride64 | `14591f790` appends; `1459164c0` copies the48-byte typed action at offset16, whose tag is action+45 = queued-row+61, before full-record compaction. The consumer loads its first word at `145916696` from queued-row+0x10 and its tag at `1459166d3` from queued-row+0x3d. Current493-node recursive graph and sentinel/filter rules remain canonical. Vec growth `145c165c0` and full-record memmove `145c0a3ed` form the shared interface. |
| Generic effects `Game+820/828/830`, stride64 | `14592d530` publishes the partitioned vector; its known consumers read or snapshot it. `1459cc290` filters army descriptor pointers and `1459cdb60` collects timed-cast keys/intervals;328 native cases preserve all64 input bytes. Snapshot copying uses `145c0a3db`. |

The generic condition/selector path `145934b40` → `145939990` writes only its
own stack within the admitted typed input interface. Its remaining external
calls are shared byte comparison `145c0a3e7` and invalid-slice panic
`145da9a60`; neither is a new AS effect producer. The source counterparts are
`conditions.rs::condition_matches/matches_event`. Aura-index collector
`1458e70c0` exposed a further supported source mismatch: the first native31
Soul Link shield source and alias19028 were missing. The separate
[current aura repair](player-aura-indices.md) connects that path and
checks every actual aura-source name/kind from current talent/amulet catalogs.

The direct-edge cross-check resolves the additional reward path in
`145966a60`: full worn-amulet records at `Game+3d8/+3e0` pass through scaler
`1459d9940` before the `1459f5490` text builder at `145967ed3`. Equip and rank
increment call rebuild at `145967777` and `145968ae0`. The two other text-builder
callers are the current/next-rank wrappers `1458a1550`/`1458a0e10`; the third is
the nested builder itself. Their source counterparts already use complete
amulet definitions and current equipped scaling. The two additional cast calls
`1459370cc`/`145937123` obtain their instance from proxy `145939fb0`, which
copies the matching learned instance or constructs a current descriptor-backed
instance. No new modifier constructor, cast kind, effect variant or missing
source presentation behavior was demonstrated by these incoming routes.

All identified AS producer/state/presentation branches in these routes now
have source consumers; no additional concrete missing AS behavior remains
demonstrated by this audit. The precise remaining boundary is identity and
lifetime of the incoming typed Game/learned-instance resources and arbitrary
aliases beyond those methods, together with the named shared Vec/byte-operation
interfaces. A whole-program no-unseen-writer/computed-caller theorem is not
inferred from the bounded custom-owner audit. Those are still static ownership
obligations under #41, not a claim that gameplay alone can settle them. Ghidra
and original-byte replay worked; there is no unavailable-tool blocker.

## Reproduction

Run `python3 -B scripts/check-gameplay-frontiers.py` for the selected
original-byte/dataflow/source checks; `--stage` writes candidate contracts under
ignored `runtime/gameplay-frontiers-0.112.0/staged`. Run
`scripts/check-warlock-effects.py` for current ordered Warlock payloads.
The current amulet and demonic-empowerment checks retain their existing scopes.
They pass 1,860 native magnitude/selector cases and 183 empowerment cases;
the current build-countdown check passes 432 admission, 18 clamp and 11 number
cases. Rustfmt syntax-parsed all nine affected Rust owners/test files; this is
not compilation or execution of the Rust regressions.
Allocator, byte-operation and English fallback seams are explicit in the
contracts. These checks execute no Rust and start no game.
