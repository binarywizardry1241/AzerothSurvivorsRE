# REA investigation recipes

Project adaptations of the feature tracing, native exploration, games, version
comparison, resumption, structure recovery and behavior reconstruction material
from [REA-Prompts by Joas Antonio dos Santos](https://github.com/JoasASantos/REA-Prompts/blob/ccb02b89721dd7d466beb17004a89d6bc25f5b02/README.md).
See the [upstream MIT license](REA-Prompts.LICENSE).

Use these recipes to plan bounded static questions within `$fixgap` and
`$execheck`. Start from the owning finding, claim or queue lead, its retained
evidence and the live source. Scope each question to one missing fact or
contract and keep necessary dependencies in view. For an unknown #41 lead,
start from its selector and test its ownership before naming a feature.
`$fixgap` uses a recipe only for selected work that needs native evidence.
`$execheck` applies the recipes within its full discovery and reporting workflow.

## Frame a native question

Use this outline when selecting operations for the existing query plan or
recording the next action in the owning work queue.

```text
Resolve <missing fact> for <finding, claim or queue lead>.
Use <verified target version and SHA-256> and start at <RVA, file range or selector>.
Reuse <retained result or Program> and compare <source owner or candidate interface>.
Follow <the branches, references or data accesses that could answer the question>.
Stop when <the required condition, relationship or value is established> or when
<the available routes are exhausted and the exact missing edge or input can be recorded>.
```

Verify the installed EXE before fresh queries and verify Data inputs when the
contract depends on them. Submit missing operations through the
[durable native query runner](autonomy.md#durable-native-queries) with Ghidra.
Resume from verified saved results, the last completed operation and the
remaining question. Use existing plans, journals, evidence and reports for
continuation. Keep the selected scope, local benilla/wenilla interface boundary,
read-only installed inputs and project workspace rules. Use the recipes within
the calling workflow's static analysis scope. Build, launch, runtime comparison
and co-op service restrictions apply throughout.

## Choose the trace that answers the question

- **Feature or UI action.** Start from the trigger, input binding or
  registration and follow dispatch, state mutation and the gameplay, UI, save
  or network consumer. Recover relevant guards, ordering, fallback and failure
  paths. Tie a resource or presentation claim to its actual loader or draw/input
  consumer and the state that selects it.
- **Function, dispatch or unknown ownership.** Start at the exact body, interior
  region or selector. Follow callers, callees, table entries and pointer
  readers/writers as needed. Where pseudocode leaves arguments or aliases
  unclear, inspect instruction bytes and call sites to verify registers, stack
  slots and branch conditions. For computed dispatch, establish the index or
  pointer producer, bounds and reachable targets. Record the evidence for an AS
  role or a known generic interface. Keep candidates with unresolved ownership
  in their existing queue entries.
- **State and gameplay rules.** Recover initial state, allowed transitions,
  guards, update order, formulas and reset behavior. Identify where values enter
  and where changes are applied or published. Use a bounded transition or
  decision table in the owning evidence when it clarifies cases such as
  thresholds, failures and teardown.
- **Tables, resources and layouts.** Trace construction, parsing, access and
  consumption. Prove offsets, widths, strides, signedness and bounds from the
  relevant instructions and call sites. Infer field meaning only as far as
  producer/consumer evidence supports it. For resource IDs or paths, connect
  the selected entry to the verified Data input and the code that uses it.
- **Protocol or persistence.** Trace serialization and parsing on each
  available side. Establish message or format version, field order, lengths,
  endianness, defaults and rejected inputs as relevant. Connect packet dispatch
  to the client or server state transition and its consumers. Keep static
  contracts and any unresolved transport behavior separate.
- **Cross-version correspondence.** Start with the retained question, proof
  and dependency chain. Use constants, control-flow shape, call/reference
  relationships and producer/consumer roles to locate current candidates.
  Verify the relevant instructions and dependencies against the current hash
  before using a conclusion as proof of current native behavior. Record moved,
  changed or unresolved evidence against both identities under the
  [incremental recovery rules](autonomy.md#incremental-recovery-across-target-updates).

## Record the proof and the next action

Bind the conclusion to the verified target and exact coordinates, including
file range, RVA or preferred VA as applicable. Cite the instructions, references
or Data records that prove it and the source path/symbol that owns the behavior
or still needs to be identified. Separate confirmed observations, inferences
and open questions. For a remaining question, record its exact selector,
missing proof and next static action in the existing owner or queue.

Keep native evidence, source correspondence, implementation and verification
distinct. Record the relevant inputs, expected outputs and state transitions
for permitted static checks or pending original-versus-rebuilt comparisons.
Use the [existing finding and verification records](autonomy.md#source-gaps-and-verification-ownership)
for that handoff. In `$fixgap`, use recovered proof for the selected source work.
In `$execheck`, reconcile the proof with claims and findings within the audit's
discovery and reporting scope.
