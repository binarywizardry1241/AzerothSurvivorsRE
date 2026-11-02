# Options descriptor dispatch and failure blocks — 0.113.2

Target SHA-256: `58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This bounded classification belongs to **#41**, under `Q41-O01`/`Q41-M02`,
`Q41-F01`/`Q41-F02`/`Q41-M01` and `Q41-A01`. It does not classify the entire
parent populations or establish full Options implementation/parity.

## Ownerless blocks and their provenance

The expanded census decodes `0x1401a6ba0` and `0x1401a6bcc` without any actual
function-body owner. Its diagnostic-code input supplied both as
`undecoded-exact-diagnostic-lead` code seeds, naming the Options path. These are
code-only seeds, not recovered callable entries. The current linear inventory
and fresh REA/Ghidra flow locate their incoming branches within the declared
Options setter interval `[0x1401a6770,0x1401a6cd8)`.

Both sites are **missing-World-resource failure paths**, reached from distinct
global-setting arms. The resource lookup tests the World registry, resource
index/pointer and live flag. Its failures converge on `0x1401a6bb2` for the
string-valued global arm and `0x1401a6b86` for the boolean-global arm. The tails
build a type-format argument and call `0x145e9c300` with the current
`Requested resource ... does not exist in the World` message and Options
Locations **806:22** / **813:22**, respectively. The selected missing resource's
complete runtime type identity and alias/registration lifetime are unproved.

Fresh Ghidra retains only **127 actual body bytes**, in two disjoint ranges:
`[0x1401a6770,0x1401a67d9)` and `[0x1401a6cc2,0x1401a6cd8)`. It still reports
no containing procedure at `0x1401a6bcc`. The enclosing unwind interval and
diagnostic path do not become function-body proof. Classification stops at the
necessary AS-to-World failure interface; generic ECS/panic reconstruction is
outside scope. No absent AS operation is demonstrated by these failure blocks.

## Computed destination producer and bounds

The computed jump at **`0x1401a67d7`** appears in both `F01` and the independent
linear `F02` selector. It is absent from the applied guarded-table input. Its
producer is more specific than an unconstrained register: the setter rejects
unsigned descriptor indices **>=105**, multiplies an admitted index by **152**,
then reads the storage tag at descriptor offset **24** from immutable table
`0x145ee9fb0`. All 105 current tags are in `0..=3`:

| Tag | Rows | Destination | Setting storage |
|---|---:|---|---|
| 0 | 79 | `0x1401a67d9` | Ordinary engine CVar |
| 1 | 23 | `0x1401a68f4` | String-valued UI global |
| 2 | 2 | `0x1401a6842` | Boolean UI global |
| 3 | 1 | `0x1401a6879` | Specialized gamma conversion |

The four signed 32-bit entries at `0x145eef5a8` are relative to that table's
base. Exact descriptor bytes, tag values and destination arithmetic establish
the finite set for this immutable input. There is no newly inferred lexical tag
guard or arbitrary-memory admission, and the global guarded-table/census counts
remain unchanged. All source `options.json` row keys/storage tags match; gamma
uses its specialized native arm rather than a stored ordinary key in that union.

## Formed code address and first consumer

The independent `A01` record at **`0x1401a6904`** forms code address
**`0x140149550`**. This is a **formatting callback**, not an Options click or
gameplay dispatch. The string-global arm stores the input pointer/length pair's
address beside this callback, then passes that argument record to the formatting
builder at `0x145ccc6e0`. The callback's complete 18-byte body forwards the pair
and formatter context to `0x145cdf270`. Fresh Ghidra's observed tail-target
decompilation shows quoted/escaped string formatting; the generic formatter's
complete behavior is not reconstructed or tested here.

The live source counterparts are `OptionsState::set` in
`crates/azeroth-survivors-re/src/options.rs` and `options_globals::literal` in
`options_globals.rs`: string globals preserve the input as Rust Debug text,
whereas the two boolean globals use exact `"1"` versus `nil`. This matches the
selected storage/callback boundary. The global producer/VM/file semantics retain
their owning report's provenance; this classification supports no source change.

## Evidence and checks

[contract.json](contract.json) binds original queue-input digests, exact selected
instruction/reference rows, code-seed provenance, original PE byte spans,
descriptor projections and test results. The five assembly files are the
canonical selected extracts. [ghidra.json](ghidra.json) retains original Evidence
IDs, profiles, actual body observations and raw-response commitments; full
responses stay under ignored project `runtime/`. The portable
[probe plan](probe-plan.json) and [seeds](probe-seeds.tsv) reproduce a new bounded
Ghidra observation without assigning the code-only blocks a function entry.

`PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-q41-options-flow-0.113.2.py`
passes **116 original-instruction cases**: 105 descriptor dispatches, two unsigned
index failures, two complete resource-failure argument paths and seven
pointer/length/context forwarding cases. The allocator, actual World/resource
lookup, formatting backend and panic backend are not executed. The descriptor
comparison and queue membership checks inspect data/source; they do not execute
reconstructed Rust. The retained full-profile nonobservations remain explicit.

No build, compiling test, game/application launch, actual save/configuration
operation or original/rebuilt comparison ran. #41 retains remaining native,
alias/producer/consumer, source-execution and parity obligations.
