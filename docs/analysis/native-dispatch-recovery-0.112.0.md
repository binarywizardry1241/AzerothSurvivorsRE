# Azeroth Survivors native recovery (0.112.0)

This is static recovery for gap **#41**, focused on Azeroth Survivors gameplay,
mechanics, menu/run state and their required shared interfaces. It is bound to
the installed 140,514,816-byte EXE with SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
Recovered code/data contracts, actual native body ownership, source connections
and runtime/parity verification remain separate observations.

The original [integrated census](evidence/0.112.0/integrated-census.json) remains
immutable. The new [supporting census](evidence/0.112.0/full-native-census.json)
provides discovery context for the AS recovery. Generic engine completeness is
outside the gameplay repair's completion criteria.

## AS ownership and recovered inputs

All **53 AS diagnostic paths and 681 raw reference sites** are retained. Actual
body ownership improves from 579 to **626 sites**; 55 remain without an observed
body owner. Independently decoding a diagnostic, dispatch source or case target
does not create a function entry or establish a gameplay contract.

The [custom-only proof/census](evidence/0.112.0/custom-dispatch-census.json)
retains **44 bounded tables and 438 distinct edges**. Recovery handles scalar
aliases, exact unsigned guards, complete mathematical domains, and intervening
instructions that preserve an already calculated 64-bit destination. It rejects
register/partial-register clobbers, opaque transfers, writable tables and any
whole domain containing conflicting or unproved instruction targets.

The current options proof reads all 105 immutable records at `145dc2250`, stride
`0x98`, field `+0x18`, after the encoded 64-bit index guard. Their tag domain is
exactly `0..3`; dispatch source `14012d257` uses table `145dc9668`. This produces
two further real reference owners.

[Producer contracts](evidence/0.112.0/native-producer-contracts.json) retain the
current byte spans, descriptors, native replay cases and their input bounds:

- Factory `1458a1730` was replayed for all **113 immutable ability descriptors**
  and all **12 observed factory tags**. Every static upgrade slice contains only
  `{0,1,2,3,4}`. The 112-byte factory output and 32-byte incoming choice sum have
  distinct layouts; their first words cannot be substituted for one another.
- `14595ca60` constructs 40-byte weighted learn/upgrade records, selects their
  32-byte payloads and assembles the iterator at `14595d623..14595d663`.
  Adapter `1459d9c90` calls `1459ebfd0` at `1459d9d5c`; the closure copies the
  sum and advances its cursor in 32-byte steps before constructor `145961590`
  at `1459ec39b`.
- Pool/fallback callers create current niche headers 2, 3 and 4 directly. The
  constructor has exact niche output stores; its upgrade branch forwards a
  byte-vector header. The display Vec is published to `Game+0x650` at
  `14595d7ac..14595d7bb`. Accept reads record `+0x78` from `Game+0x658`, stride
  `0xa0`, after its current index/state gates.
- Five supplied selector contexts are replayed through constructor, accept and
  magnitude dispatch prefixes. They establish those fixture destinations,
  without asserting a closed domain for every mutable record or caller alias.

Addresses `1484713f8`, `148471614`, `148471704` and `148472e44` are verified
`.pdata` `RUNTIME_FUNCTION.BeginAddress` DWORDs for constructor, pool, accept and
magnitude. They are metadata references rather than additional callback callers.

Two current `auras.rs` path-literal leads, `145961a92` and `145961fdf`, point to
the five-byte label `spell` immediately before the filename. Their pointer and
length descriptor is passed in R9 to `14598e180`, with counts 1 and 2. The
recognizer invalidates this observation on argument/descriptor/count clobbers,
including partial and implicit writes. All 681 raw leads and both actual owner
states remain in accounting; no `rust_location` record is excluded.

## Exact remaining AS proof boundary

The [current choice repair](choice-contracts-0.112.0.md) removes the obsolete
sixth ordinary upgrade lane, checks all five constructor variants through the
actual accept prefix and records a third magnitude caller `14596748a` beyond
the observed Ghidra reference census. Constructor collector/prose calls
`145961e62`/`145961ef3` are also independently decoded current CALLs. The
original census and its ownership counts remain unchanged. The [Options
choice-label repair](options-choice-labels-0.112.0.md) separately connects its
current complete-formatter bound; it does not prove all UI input tags.

The [effect/producer repair](gameplay-frontiers-0.112.0.md) checks all nine
classes and current amulets through rank collection and native aggregation.
Source now separates numeric stats and spell modifiers from generic proc rows,
retains army marker positions and uses matching generic indices for state and
attribution. Its 1,599 original input records yield 304 generic rows, 655 spell
modifiers and 29 merged stat tags. The [UI input proof](ui-frontier-inputs-0.112.0.md)
separately binds current marker publication and font data/guarded inputs, all 105
Options descriptor ancestors, six complete Options queue paths, nineteen Armory
slot commands and 28 Rewards availability/selection paths. Callback copies reach
typed insertion; component-registration/query identity remains the existing
engine interface. The [aura repair](player-aura-indices-0.112.0.md) restores
Soul Link as the first raw31 shield source with current aura19028, including
all 19 actual source rows, 48 ordered index cases and 45 alias cases.

The deeper collection trace follows pickup, hazard, queued-action and generic
proc append/remove/publication owners, GUID readers, condition callbacks and
reward tooltip/equip consumers. Its 4,952 bounded slice/read cases preserve the
input rows. Shared growth, memmove/snapshot and comparison calls are named
interfaces in the effect report; arbitrary computed writers and pointer/lifetime
identity remain static proof limits. No further concrete missing AS behavior
was identified in these routes. These scoped contracts do not change the global
census or certify its ownership.

The [current frontier](evidence/0.112.0/native-custom-frontiers.json) retains
**55 ownerless references in 18 declared extents and 30 computed frontiers**.
These are native proof limits; they do not independently establish missing or
incorrect reconstructed gameplay. The two label observations above also retain
their actual ownership state.

| Current owner/extent | Dispatch sources | Missing input/alias evidence |
| --- | --- | --- |
| Armory `140056fa0`, `1400fd960` | `140057609`, `1400fde26` | Current tag7 / slots0..18 construct commands through callback copies and typed insertion `1401751f0`. Registration→queried ECS column identity is the remaining shared interface; the separate 24-byte column is distinct. |
| Markers `140102980` | `1401033c0`, `1401048d0` | Current selector/publication proves shape0..3 at record+0x54 through both prefixes; arbitrary mutable row ancestry remains separate. |
| Options/menu `14012de80`, `140136fa0`, `14013be20` | `14012dec7`, `140137943`, `14013c6d5` | All105 immutable descriptors feed the builder with branch-isolated copy dominance; six actual option queue paths pass. Other event constructors/resource identity remain outside this proof; nonnegative normalization alone cannot bound negative variants. |
| Rewards `1401884e0` | `140188a92` | Seven cosmetic slot/tag3 commands with availability/selection gates pass 28 cases through callback and typed insertion `140180cc0`. ECS registration→consumer identity remains a shared-interface limit; the unrestricted byte-domain proposal remains rejected whole. |
| GameTick `1458fb890` | `145903061`, `14590512b` | Current pickup constructor constants and fixed stack pattern00/01/02/03/filter are traced. Append/remove and linked/nearby GUID readers are recovered; arbitrary computed writer/lifetime alias closure remains unproved. |
| Hazards `1459164c0` | Eight exact sites in the frontier inventory | Current 493-action graph, hazard/queue append, publication, consumer removal, shape2 mutation and two hoisted bases are traced; remaining mutable kind/shape and lifetime identities are static limits. |
| Abilities `145924df0`, executor `145934c50`, enemy `145945710` | `1459250f3`, `145934f5e`, `1459471a1` | Current 113 descriptors and all-class/amulet aggregate inputs are checked; generic effect0..35 and guardian helper return0..3 are proved. Arbitrary instance/Vec writer aliases remain outside those contracts. |
| Choice constructor/accept | `14596163f`, `145966b24` | Complete 32-byte input and 160-byte display-record mutation/alias ancestry beyond the retained producer contexts. |
| Fonts `145975cf0` | `145976a64`, `145978009` | Current 41 immutable composites prove mode0..4; the distinct guarded tag route admits 45 indices and preserves hoisted R15. Arbitrary replacement buffers remain outside this shared-interface input proof. |
| Upgrade magnitude `145993420` | `145993435` | Complete live slice ancestry at direct callers `1458965c0`, `14596748a` and `1459f49d2`. Static 113-descriptor values are proved; the 256-value proposal intersects established instructions and remains rejected whole. |
| Content `1459f5490`, `1459f9fb0` | `1459f5738`, `1459f592c`, `1459f5b1e`, `1459fa10f` | All current talent/amulet modifier inputs are 0..6; each independent seven-case prefix is checked. Whole mutable effect-buffer/caller ancestry remains unproved. |

Recovery attempted exact encoded guards/aliases, mathematical scalar bounds,
transparent destination-preserving tails, current descriptor/factory inputs,
direct caller and `.pdata` role tracing, and the concrete choice queue/cursor/
publication route, complete guardian return analysis, current effect aggregation,
marker publication and font guards/data. Prefix cases and static catalogs are not silently widened to
unproved mutable alias domains. Native field/type ancestry absent from these
proofs remains explicit; compiled-game interaction and original/rebuilt parity
remain separate validation work.

## Supporting census and accounting

| Observation | Original integrated profile | New supporting profile |
| --- | ---: | ---: |
| Independently checked instructions | 21,990,655 | 22,505,006 |
| Instruction union bytes | 87,769,873 | 90,100,985 |
| Reference records | 3,763,437 | 3,901,897 |
| Executable bytes unobserved | 10,439,117 | 8,108,005 |
| Actual native functions | 420,680 | 420,680 |
| AS references with an actual body owner | 579 | 626 |
| AS references without an actual body owner | 102 | 55 |

The [supporting switch proof](evidence/0.112.0/full-native-switches.json) admits
3,713 whole tables, 69,176 encoded cases and 23,920 distinct edges. Whole-domain
boundary checks reject 419 proposals. A complete lexical scan of 347,158 current
declared extents supplies additional source-code candidates, without assigning
function ownership.

The function request list remains **418,250 entries**. Separately classified
code-only roles retain 102 AS diagnostics, 1,691 engine diagnostics, 3,713 source
JMPs, 23,402 case targets and 5,964 exact RIP-LEA address targets: 34,871 distinct
roots because roles can overlap. Address graphs are re-derived against current
established/table boundaries. Their carried source owner is explicitly an
observation from the original operand parent, never asserted as the latest owner.
Only independently observed direct CALLs supply the separate helper-entry queue.

The [same-parent explicit-operand audit](evidence/0.112.0/full-native-operands.json)
and [ownership classification](evidence/0.112.0/full-native-classification.json)
retain encoded address/data relationships separately from AS contracts. Their
source candidates use an immutable Git tree. Operand detail snapshots have
separate runtime locations and exact hash commitments.

Raw whole-image observations and engine source candidates provide discovery
context. They do not set AS gameplay completeness, certify compiled source
identity or promote native decoding into a reconstructed mechanic. Unknown
computed edges, aliases, mixed bytes and padding candidates remain unproved.

## Validation and reproduction

Use project-local Capstone/Unicorn dependencies:

```sh
export PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs
python3 -B scripts/test-custom-native-dispatch-selection.py
python3 -B scripts/test-full-native-accounting.py
python3 -B scripts/test-native-source-roles.py
python3 -B scripts/recover-custom-producer-inputs.py --output runtime/producer-replay.json --summary-output runtime/producer-contracts.json
```

Tools record target/input/generator hashes. `native_dispatch_validation.py` is
shared by discovery, admission and current full-census verification; every
supplied successor is reconstructed from immutable signed LE32 table bytes.
Negative cases cover substituted valid targets, stale helper digests, overlap/
interior starts, register/partial-register writes, descriptor/count clobbers,
mutable tables and unsupported transfers. Unselected historical-target profiles
retain their original identity; a selected wrong-target profile still fails.
Source-candidate hashes use an immutable Git tree.

The earlier 43-table custom replay stopped after disassembly without completing
helper/body/export work and is not a completed census. Explicitly seeding the
independently proved source JMPs allowed the fresh profile to finish. Only
Python/static analysis and original-instruction fixtures ran. No application
compilation, game process, gameplay comparison or parity check ran.
