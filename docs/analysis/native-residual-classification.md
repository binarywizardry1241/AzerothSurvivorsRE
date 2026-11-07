# Native residual classification

Permanent **#41**, target SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This report classifies complete selected populations from the independently
verified [canonical declared Ghidra census](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.115.0/refresh-baseline/full-image-census.json), the separate declared
linear decode and the unwind-complement decode. Their rows overlap; they are
not disjoint implementation coverage and must not be added into a percentage.
Current source status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Complete residual sets

The [residual proof](evidence/0.115.0/native-residuals.json) binds the generator,
its dependencies, every consumed summary/inventory and twelve complete derived
inventories. Bulk rows remain under ignored `runtime/`. Each row retains its
original address, current body relationship, encoded operand or boundary and
an explicit limit on semantic inference. No sampling cap is used.

| Population | Complete selected result |
| --- | --- |
| Saved instructions | All 21,869,183 have actual saved body owners; zero ownerless instruction rows. |
| Saved references | All 3,766,641 retain source/destination body and PE-region roles. Exactly 775,329 sources lie outside bodies. |
| Unowned executable reference destinations | Fourteen distinct addresses, all exact exception-handler RVA destinations; see the separate [unwind proof](unowned-unwind-destinations.md). |
| Diagnostic sites | All 17,790 are retained: 15,905 owned and 1,885 ownerless. The ownerless partition is 107 AS, six excluded co-op and 1,772 shared/noncustom sites. |
| Declared decode | All 350,712 extents, 3,826,005 references and 82,636 indirect transfers retain exact roles and unresolved operand state. |
| Complement decode | All 330,329 regions, 12,169 references, 648 indirect transfers and 5,439 stops retain their exact selector identities. |

All 775,329 reference sources outside saved bodies are metadata, with no
executable sources: 701,424 `.pdata` runtime-function boundary fields, 73,458
x64 unwind-prefix fields, 425 import slots, seventeen PE-header fields, three
load-configuration fields and two load-configuration indirection slots. Their
exact field projection is retained by the [data classifier](native-data-classification.md).
They do not establish missing executable instructions or AS producer functions.

The complement stop partition is 2,571 unconditional jumps, 2,822 returns,
seven traps/privileged exits and 39 transitions outside the file-backed
complement. Classifying an observed stop does not prove every successor's
runtime reachability or a padding/data role. Likewise, the declared and
complement joins retain candidate bytes and observed body intersections without
certifying unobserved bytes as padding.

The saved Ghidra Program remains unchanged: **12,042,392 executable bytes in
392,430 ranges are unobserved**, comprising 7,158,738 declared bytes and
4,883,654 bytes outside declared extents. Independent decode/classification is
separate evidence and does not silently subtract from that population.

## Explicit operands and computed interfaces

The [operand proof](evidence/0.115.0/native-operands.json) examines every saved
instruction. It retains 571,314 mapped explicit operands: 418,164 address
expressions absent from the saved reference pair export and 153,150 fixed
memory pairs already present. All their source instructions have body owners.
Address formation alone is not a read, write, call or execution edge.

The [ownership proof](evidence/0.115.0/native-ownership.json) separately decodes
Ghidra's computed-flow sites. It identifies 67,617 actual indirect calls and
7,645 indirect jumps; 127,190 `ud2`, 204 `int` and three `int3` observations
are not calls/jumps. Exact import slots resolve 1,329 calls and 175 jumps;
bounded straight-line encoded values provide 939 call and seven jump
candidates. Unknown register, indexed-memory, table and alias values remain
explicit. These classifications describe encoded or locally established
initial destinations, not successful calls or complete runtime targets.

The separate [F01/F02 operand proof](independent-indirects.md) covers
**all 83,284 independent indirect transfers**, including 7,986 declared sites
and 36 complement sites absent from the saved Ghidra instructions. It retains
45,636 register-relative memory operands, 36,065 register operands, sixteen
indexed operands and 1,567 fixed-relative slots. Of those fixed slots, 1,557
have declared import identities, four hold relocation-backed image pointers
and six lack a declared pointer binding. The other 81,717 sites need dynamic
address state. Initial image/import pointers are not verified runtime callees;
the 8,022 omitted sites retain their lack of saved body/instruction observation.

The same proof binds all 425 import slots, their observed native callers,
524,851 relocation-backed executable pointer slots and 31 conditional export
lookups. Those lookups have 26 literal-name inputs, one ordinal and four inputs
not established within the observed block. Module identity, forwarding, lookup
success and subsequent dynamic dispatch are not inferred from a name.

The [address-candidate proof](evidence/0.115.0/native-address-leads.json)
validates every one of the 8,051 executable address targets absent from saved
instruction boundaries/interiors. Each has an independently checked RIP-LEA
source and a coherent bounded decode consistent with existing instructions.
This establishes code candidates only. It does not assign function entries,
callback types, incoming computed edges, AS ownership or runtime use. Generic
engine recovery does not continue merely to grow the census.

The separate [five direct-AS candidate check](as-address-candidates.md)
classifies three supporting UI/storage thunks and two ordinary-enemy HP leaves.
All 659 bounded helper/caller/thunk cases agree with the existing scalar-f32
HP source expression and its operation order. No source defect was found;
complete scaling/gameplay and original/rebuilt parity remain unverified.

## Source boundaries

The diagnostic source comparison retains 731 exact paths: sixty AS owners,
608 byte-exact vendored candidates, 52 modified/local candidates and eleven
paths absent from the available engine source. Retained upstream archives also
lack those eleven paths. Path identity, source line proximity and baseline byte
equality do not recover the target's compiled source revision or prove behavior.
The embedded RSDS record identifies `benilla_rogue.pdb` and section contributions;
it supplies no named function/source symbols. Compiler stamps and embedded
upstream URLs are not promoted to the AS/engine build revision.

The [custom diagnostic report](custom-diagnostic-roles.md) resolves the
107 ownerless AS sites and six excluded sites at their exact immediate consumer
boundaries. The [shared diagnostic classification](engine-diagnostic-roles.md)
records all 1,772 noncustom sites. Failure helpers, platform metadata and generic engine context
do not imply an omitted AS operation. Any recovered live AS contract belongs to
its mechanic's owning report and source path.

The [owned custom projection](owned-custom-diagnostics.md) separately
checks all 618 owned AS records, including both successors at branching sites
and preserved pointer copies beyond nonconsuming calls. Every fixed helper
encountered has a supporting role; 31 sites retain exact cycle/outer-consumer
obligations. The complete custom selector has 725 AS and 63 excluded co-op
records. The source candidate comparison and immediate-interface classification
do not certify successful surrounding mechanics or complete source equivalence.

## Reproduction and limits

The producer and checker accept `--census-summary`; their default remains the
canonical declared census. The [expanded audit](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/execheck-0.115.0.md) has a
separate summary and matching twelve-artifact proof, including nonempty ownerless
instruction and executable-source sets. The canonical table and semantic
classifications here do not describe that expanded population.

Retain original input snapshots: support proofs replay the exact residual-summary
receipt in their retained inputs. `--residual-summary` on the owned-custom and
AS-address producers selects a different snapshot for a newly reviewed proof;
it does not relabel an old proof. The current canonical replay reproduces all
twelve artifact hashes/counts unchanged; its current generator/scope metadata
is retained separately from the original `residual-summary-v2.json` snapshot.

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/classify-native-residuals.py --output-directory runtime/analysis/history/findings/q41-ownership/2bcdf9438d76/residuals-v2 --summary-output docs/analysis/evidence/0.115.0/native-residuals.json
python3 -B scripts/check-native-residuals.py --proof docs/analysis/evidence/0.115.0/native-residuals.json --negative-tests
python3 -B scripts/test-native-residual-summary.py
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/test-native-residual-inputs.py
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/summarize-refresh-unknowns.py
```

Eleven snapshot-selection regressions cover retained/explicit inputs, missing
or ambiguous receipts, changed hashes and project path boundaries. They do not
decode the EXE or replace the producers' target/census validation.

The check verifies complete artifact hashes and row counts against independent
census/linear/complement selectors. Negative cases reject wrong targets,
truncated totals, substituted same-target input inventories and optimistic
source/alias/runtime/parity flags. Ownership, operand and address tools retain
their generator, dependency and input commitments in the linked compact proofs.
The unknown-selector summarizer admits ten current classification proofs through
their committed files, complete residual row counts and independent indirect
site/census joins. Thirty-eight admission regressions and thirteen census/selector
regressions pass. Classifier availability is recorded separately from the
census's unchanged structural-only flags and every global semantic/parity flag.

These classification tools use native-byte decoding, metadata inspection and
source tracing. Bounded instruction cases in linked AS reports retain their
own synthetic seams and limits. No application compilation, compiling tests,
game launch or original/rebuilt comparison ran. Complete dynamic aliases, types,
schemas, AS producer/consumer closure and parity remain unestablished under
#41. Generic engine implementation remains supporting context; current co-op
networking/server/gameplay reconstruction is owned separately by
[#63](coop.md). Original excluded collector labels retain their actual
collection scope.
