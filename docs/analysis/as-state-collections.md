# AS typed collection boundaries

This selected **#41** recovery is bound to installed 0.113.2 SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
It follows the concrete pickup, delayed-action, learned-instance and required
packet-helper interfaces already named by the historical
[AS frontier matrix](native-dispatch-recovery.md). Historical addresses
are discovery context only. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall
status; generic engine reconstruction and co-op behavior are excluded.

## Revalidated interfaces and source consumers

| Current native interface | Source ownership and bounded result |
| --- | --- |
| Pickup remover `14594fd70`, header `Game+608/610/618`, stride72 | `Mechanics::remove_pickup_at` removes the complete owned record stably, then emits primary/auxiliary removals before its reward consumer. Forty-five native prefix cases preserve full remaining records and header identity; out-of-bounds cases reach the native panic boundary without mutation. Packet allocation/destruction after compaction is outside this prefix check. |
| Linked pickup collector `14598b760` | Reads pickup GUID at row+40 and companion rows through `Game+958/+960`, stride112, phase1/GUID+32. Its 512 native cases preserve every supplied pickup byte. Source `companion_reserved`, the owned `Fetching(guid)` phase and the loot companion adapter retain GUID identity independently of pickup-vector indices. |
| Nearby pickup collector `14598ad90` | Its 4,112 native cases check full kind values0..255 plus `u32::MAX`, flight admission, four companion kinds and near/far distances. Source pickup snapshots and companion selection use owned GUID records; selecting a row does not mutate that pickup. This is a bounded read contract, not proof of every possible mutable writer. |
| Free-instance proxy `145939920`, learned header `Game+330/+338`, stride88 | Matching keys copy all84 semantic instance bytes to a separate result. The fallback creates rank1/remaining0.5, neutral five-lane upgrades, applies modifiers and uses at least1 mean learned power. Twenty-eight current native cases cover empty through six learned rows and every match position, preserving all supplied Game/learned bytes. Source `run_effects::actions::free_instance` returns a `Copy` instance; the ordinary scheduler and callbacks pass snapshots to mutable cast consumers. Fallback modifiers are empty in these fixtures. |
| Delayed actor-action queue, header `Game+5a8/5b0/5b8`, stride64 | Thirty-six deadline cases retain the native `deadline > now` skip rule, including unordered inputs. Another168 cases snapshot the entire48-byte action at row+16, then stably compact full64-byte rows and update length. Source `raid_lines::PendingLines::take_due` removes the owned `DelayedKind` before live source lookup; `PendingEffects::resolve_due_with_rng` visits appended due children through that same vector. Tag dispatch and the complete493-action graph are outside these prefix fixtures. |
| Custom-protocol packed GUID helper `1458b6e10` | All256 presence masks, three nonzero byte patterns and two preexisting output-prefix lengths pass1,536 native cases. The existing `benilla_protocol::wire::write_packed_guid` supplies that mask/low-to-high byte contract to ordinary packet encoders reached by `SessionEvent`. This does not recover every custom command/event discriminant or certify all packet payloads. |

Current callback calls `145936b3d` and `145936b98` obtain their separate
free-instance result before the ordinary cast calls `145936b70` and
`145936bcb`. The native proxy does not lend a pointer into the learned vector as
its mutable cast input. Source `RuntimeInstance` is semantic owned state, not a
native ABI overlay; all five upgrade counters and current modifier fields survive
its snapshot. The distinct source temporary-effect/index reset rules retain
their owning reports and are not promoted to full current equivalence here.

The live delayed visual queue has a different unordered deadline rule. Following
that dependency exposed a source defect, repaired with separate proof in
[delayed visual lifetime](as-delayed-visuals.md). Current run timing and
the first-endless transition notice have their separate
[step](as-state-step.md) and [continuation](as-state-contracts.md)
repairs. These findings were followed through their live consumers rather than
stopping at isolated native helpers.

## Checks and remaining boundary

`python3 -B scripts/check-as-state-collections.py` passes **6,437 native
cases** with current target verification. Exact ranges, fixture hashes, explicit
seams and fresh raw-import Ghidra observations are retained in
[contracts](evidence/0.113.2/as-state-contracts/collections.json),
[instructions](evidence/0.113.2/as-state-contracts/collections.asm) and
[provenance](evidence/0.113.2/as-state-contracts/collections-rea.json). The two
delayed-action intervals are selected prefixes inside the current diagnostic
owner `145913e10`; they are not asserted as independent native functions.

Allocator/free, memcpy/memmove, byte comparison and CRT roundf are explicit host
interfaces. GUID buffers are preallocated. The fixtures prove their declared
typed input/output and mutation bounds; they do not close arbitrary computed
callers, output/input aliasing, every mutable writer, native Rust type/resource
registration, the complete custom command/event format or whole-system semantic
ownership. Unseen aliases alone do not demonstrate another missing source
mechanic. No further concrete source defect was identified in these followed
collection/instance paths after the linked repairs.

Fresh run construction owns new `Mechanics` vectors; the existing `Again`/Menu/
Logout adapters retire their `Option<Mechanics>` and carry presentation messages
as owned values. Source inspection found no escaped borrow of these collections.
That source ownership observation is not a current native teardown or runtime
certificate: complete command/teardown ordering retains the historical terminal
reports' actual target and its open #41 boundary. No compilation, Rust test,
client/game application or original/rebuilt comparison ran.
