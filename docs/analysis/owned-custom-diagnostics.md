# Owned custom diagnostic boundaries

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This completes the bounded per-row projection for the **618 owned AS diagnostic
sites**, complementing the [107 ownerless AS sites](custom-diagnostic-roles.md).
The [compact proof](evidence/0.115.0/owned-custom-diagnostics.json) commits every
selected row and its guarded first-interface paths in ignored runtime storage.
It establishes no new source defect or missing AS implementation.

The [D01 follow-up](native-recovery.md#diagnostic-consumers) extends this original
first-boundary projection for all 31 cycle/return operands. Its finite-state
graphs and complete saved direct-caller continuations classify their retained
pointer flow; it also checks the expanded profile's sixty ownerless custom
interfaces against the canonical roles. The original path counts below retain
their selected scope. Successful AS state/collection semantics, callback ABI,
arbitrary aliases/computed callers and parity remain unproved.

## Exact selected set

| Actual all-custom D01 partition | Owned | Ownerless | Total |
| --- | ---: | ---: | ---: |
| AS paths | 618 | 107 | 725 |
| Excluded custom co-op paths | 57 | 6 | 63 |
| All `custom_game_crate=true` records | 675 | 113 | 788 |

The separate requested excluded-context projection retains **92 owned rows**:
57 custom and 35 shared/noncustom. The 35 shared rows do not enlarge the actual
all-custom D01 selector. No excluded gameplay, transport or server behavior is
implemented. The four `screens/coop.rs` rows remain in the AS UI context; their
independent presentation scope is not reclassified as cooperative gameplay.

The 618 owned AS records cover 56 paths: 576 Rust Locations and 42 path-literal
candidates. Original duplicate records remain separate through their committed
residual ordinals. Every source instruction, Location filename/coordinates and
declared-extent digest is checked against the current installed bytes. Saved
Ghidra body intervals supply spatial ownership only.

## Guarded immediate boundaries

Both encoded successors are followed at all **39 branching source sites**.
The resulting **1,179 bounded path records** retain exact guard instruction
bytes, taken/fallthrough edges, local pointer copies/stores and flow hashes.
These are static graph paths; no relational predicate solver or runtime
observation establishes that every combination of guards can execute.

| First boundary | Path records |
| --- | ---: |
| Direct call | 789 |
| Local cycle | 191 |
| Return before a consuming interface | 52 |
| Selected pointer overwritten without delivery | 141 |
| Exact immutable data read | 6 |

No instruction, guard or path limit was reached. Cycles stop at their exact
repeated native address. A live condition does not by itself stop traversal.
Known nonconsuming calls are passed when an exact callee-saved pointer copy
remains. Four such call sites across three selected source sites are followed;
volatile register values after a call are never assumed to preserve a pointer.
**587 sites have only classified bounded boundaries; 31 retain cycle or
outer-consumer obligations.** Their unresolved paths comprise 191 exact local
cycle stops and 52 returns before delivery. Every fixed call target reached by
this projection has a supporting role; no fixed helper is left unknown merely
because its concrete subsystem type is outside this scope. This projection is
not closure of the remaining cycle/outer-consumer obligations.

Canonical [D01 failure/container identities](custom-diagnostic-roles.md)
and [E01 shared interfaces](engine-diagnostic-roles.md) are reused by
reference and current-byte verification. Three small additional failure
wrappers are bound to their current message prefixes, complete wrapper bytes,
Location carriers and direct call to the already identified formatted-failure
interface: 12 removal-index, one insertion-index and 11 remainder-zero sites.
Failure delivery does not establish the successful index producer, allocation,
container ownership or AS mechanic.

The former 206 unclassified fixed-call path records contained **46 unique
callees**. Their complete current bytes and minimal contracts are now guarded;
one additional allocation/capacity-failure dispatcher is identified after
following preserved copies. This review establishes only necessary supporting
operations:

- Command/context helpers append fixed 24-byte commands, reserve IDs, or copy
  32/416-byte payloads into 48/432-byte queued records. Their unused incoming
  Location arguments are distinguished from the actual context/payload inputs.
  The nested ID allocator's nonconsumption proof is reused from E01.
- Tagged-object key lookup compares bounded key strings. Adjacent `name`,
  `slot`, `dmg` and `xp` literals are keys; selected pointers merely retained in
  callee-saved registers are followed to their later boundary.
- Tagged-value drop glue and the heap deallocation thunk release contained
  storage. The current adapter is bound through `GetProcessHeap`/`HeapFree`
  imports; no generic allocator reconstruction is attempted.
- Checked state/descriptor operations retain Location only for canonical
  failure delivery. The eight-byte vector-pair removal wrapper forwards
  Location only on its bounds failure.
- Localization fallback returns the original `Looks` string on a missing
  lookup. Structured text construction copies the three-byte minus glyph;
  object-field writers consume `spell` keys and the six-byte `resume` value.
- Fixed-resource string operations forward one-byte `0`/`1` values. The
  resource lookup wrapper's lack of a local R9 read does **not** imply that the
  pointer is unused: its fixed tail/nested target consumes the forwarded pair.
- The options collection helper consumes the selected static pointer through
  tuple offset +8 as an iteration end bound, not as filename text.

All recovered bounded literal inputs stop before their adjacent diagnostic
filenames. Concrete engine/UI/JSON types and successful surrounding state
transitions are not inferred from these supporting roles.

The six `enemy.rs` path candidates at `1458b5549`, `1458b55b9`, `1458b567a`,
`1458b56f5`, `1458b57ca` and `1458b5845` point to the five bytes `final` at
`147030c31`, immediately before the filename. Their first exact data read
consumes the four bytes `fina`; it overlaps no filename byte. Later comparison
or gameplay meaning is not inferred from that read. Other literal candidates
retain their exact prefix bytes and first interface without silently treating
an adjacent filename as consumed text.

The current literal-name lookup is reused from the
[timer/localization evidence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/addon-timers-0.115.0.md). Current banner and raid
consumers keep their separate [banner owner proof](evidence/0.115.0/banners-owner.json),
[raid-target report](raid-targets.md) and
[ground-source lifetime report](raid-death.md). A diagnostic's immediate
interface does not re-certify those complete mechanics.

## Reproduce and limits

With the existing Capstone 5 Python environment available:

```sh
python3 -B scripts/check-owned-custom-diagnostics.py
```

The checker reselects all rows, reconstructs the bounded graphs from current
bytes, verifies canonical and reviewed supporting helper identities, runs five
synthetic pointer-model checks (including volatile-copy and partial-overwrite
negative cases), and requires the retained gzip
projections and compact proof to match exactly. `--stage --proof
runtime/<new-directory>/proof.json` prepares new ignored evidence without
overwriting a previous proof. No assembly/decompiler extract is duplicated.

The source language, actual alias/type state, shared engine/container/UI/panic
subsystems and executed branch choices remain unverified. No source repair,
new Ghidra session, compilation, application/game/network/server/co-op launch
or original/rebuilt parity comparison occurred. Complete successful AS
contracts and the 31 explicitly unresolved owned boundaries remain open.
