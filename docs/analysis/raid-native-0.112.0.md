# Raid inputs and initial-request dispatch — 0.112.0

Target SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[verification-needed](../verification-needed.md) owns overall implementation and gap status.
This report revalidates the complete raid input graph and repairs the current
initial-request tower filter under **#42**. Other native dependencies retain their
own evidence and are not certified by matching data.

## Complete graph and boss headers

The [current catalog](evidence/0.112.0/raid/catalog.json) follows all twelve zone
boss slices and all thirty-seven guardian signatures, including alternate move
lists, health phases, nested sequences and replacement schedules. Its 493 nodes
retain all 257 boss recurring / 33 boss phase records, forty guardian lists with
120 recurring / fifteen phase records, and every recursive child.

The zone table was independently located by its exact key descriptor and all
twelve ordered keys at a 240-byte stride. The guardian table was found by its
complete thirty-seven-identity sequence and its actual slice records. Current
zone/boss/guardian addresses are recorded in the catalog and reproducible checker.
The installed image's exact hash is checked before using these addresses.

Every scalar payload, child index, repeat value, phase threshold/yell, root slot
and alternative order matches the historical 0.109.0 graph. Thirty-seven nodes
have relocated sequence/replacement pointers; these are followed in the current
EXE rather than interpreted as historical addresses. All sixty 104-byte boss
headers preserve their scalar fields, names and yells and agree with source.
The source registry retains its explicitly historical raw pointer words; runtime
recursion uses its checked child indices, not those words as pointers.

## Tower suppression belongs to the initial request queue

The five retained tower roots belong to Lord Aliden Perenolde (one phase),
Hakkar (one recurring slot), Sapphiron (one recurring slot and one phase), and
Kel'Thuzad (one phase). Their records and native tower producer still exist.
Deleting them from the graph would change phase numbering, timer admission and
other source state without matching the current executable.

The current actor tick's [initial-request loop](evidence/0.112.0/raid/queue.asm)
reads the native tag at request+53, stops at `0xff`, copies the request payload,
and skips tag 12 before calling the common dispatcher at `14591f790`.
It advances to the next 56-byte request without invoking any tower producer.
The source's semantic tag 13 is the generated adapter for native tag 12.
`bosses/abilities.rs::queued_action_enabled` now owns this filter. Both the live
`gameplay/mechanics/bosses.rs` loop and `bosses/ai.rs::dispatch_queued` apply it
after the terminator and before actor resolution.

Phase latches/yells, original recurring slots and their reset/admission behavior
remain connected. The direct recursive and delayed dispatch paths keep their
separate native rules; this queue filter does not erase the retained tower
consumer or globally disable marker kind 4, which other actions also use.

## Static evidence and limits

The [proof](evidence/0.112.0/raid/manifest.json) and
[REA provenance](evidence/0.112.0/raid/rea-provenance.json) bind the current
assembly and Ghidra 12.1.4 observations. The bounded raw import omits PE-wide
callers/types and ends at the original loop's outgoing boundary; Ghidra renders
those omitted continuations as bad-data halts. The independently decoded assembly
and exact original instruction fixtures own the actual exit behavior.

```sh
python3 -B scripts/check-raid-target.py
```

The checker follows and checks all 493 current graph nodes, all sixty boss
headers and live source schedule/guardian connections. It executes all **493
native duration cases** and **262 native request-queue cases**, covering every
byte tag, empty/mixed queues, tower skips, terminators and retained source indices.
The queue fixture intercepts the dispatcher instead of running gameplay; the
duration fixture uses synthetic stack/payload inputs and current installed code
and immutable data. Neither executes Rust. The three changed Rust modules
syntax-parse with the installed `rustfmt --emit stdout` tool.

## Connected current dependencies

The current graph and queue proof is supplemented by independent current-target
contracts for the AS producers, state and live consumers below. Each owning
report identifies its actual executed instruction ranges, source guards and
shared-interface seams. Existing benilla/wenilla services remain the engine.

| AS contract | Owning current proof |
| --- | --- |
| Action producers, forms, markers and ground objects | [Hazards](raid-hazards-0.112.0.md) |
| Boss arithmetic, phase/timer rules and guardian scheduling | [Inputs](raid-inputs-0.112.0.md) |
| Wards, healing/shields and deferred removal | [Wards](raid-wards-0.112.0.md) |
| Actor ordering, Pull/teleport, areas and hit/death | [Lifecycles](raid-lifecycles-0.112.0.md) |
| Periodic/drift, Aftershock, Tether and Gaze | [Stateful consumers](raid-stateful-0.112.0.md) |
| Guardian placement, awake/reset, rewards and completion | [Guardian lifecycle](raid-guardian-lifecycle-0.112.0.md) |
| Active choices, local damage/movement gates and admitted frame continuation | [Frame continuation](raid-frame-continuation-0.112.0.md) |
| Primary arrival, initial equipment/mount, placement, rewards and first UNIT fields | [Primary lifecycle](raid-boss-lifecycle-0.112.0.md) |
| Forced-position handoff, movement-report expectation and downstream marker input | [Forced position](raid-forced-position-0.112.0.md), [lair marker](raid-lair-marker-0.112.0.md) |
| Death-produced XP/gold/magnet creation and collection/sweep | [Reward pickups](raid-reward-pickups-0.112.0.md), [collection](raid-pickup-collection-0.112.0.md) |

These bounded contracts replace the former blanket historical-dependency
qualification for the listed AS paths. They do not establish Rust execution,
whole-frame/terrain/client/platform behavior, gameplay/presentation fidelity or
controlled original/rebuilt parity. Those remain open under #42/#43; unresolved
AS native/type/alias contracts retain #41 ownership. Generic engine census
unknowns are discovery context and do not block these AS source repairs.
