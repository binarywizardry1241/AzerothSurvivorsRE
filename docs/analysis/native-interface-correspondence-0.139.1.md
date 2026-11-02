# Bounded native-interface correspondence — 0.139.1

Target: configured installed `AzerothSurvivors.exe` 0.139.1, 150,633,472 bytes, SHA-256 `1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d`.

The four original local contracts are revalidated within their exact registered scopes. The [machine evidence](evidence/0.139.1/native-interface-correspondence.json) binds current code/data ranges, original query receipts, the frozen registration and independent branch checks. This establishes neither whole-owner semantic equivalence nor source assignment, complete features or parity.

The [0.139.0 audit boundary](evidence/0.139.0/audit-boundary.json) preserves the source-register snapshot from Git `71f10f5d5dafc469b5f3ca489431aacd8a3cb0ae`. Its exact selector is `evidence_target_bindings['docs/analysis/evidence/0.139.0/native-frontier-results.json'].bounded_contract_owner_scopes`. Those scope texts and exclusions are retained verbatim in the new evidence. The [original native review](native-frontier-0.139.0.md) and its real Ghidra query subjects/results keep their 0.139.0 provenance; no new Ghidra execution is claimed.

## Scope correspondence

| Original local scope | Current code | Revalidated facts and preserved exclusions |
| --- | --- | --- |
| Local-clock descriptor / #302 | Owner `0x14025c270`; construction `0x14025c290..0x14025c2ae` | Exact `AZS_NativeLocalTime` name, length 19 and callback-pointer construction. Successful registration, callback time/format/schema, VM lifetime and widget resources remain excluded. |
| Recap payload consumers / #300 | Renderer `0x140161bf0`; terminal `0x14018f390` | Exact `secs`, `absorbed`, `hits`, `by`, `avoidable`, `recap` and `killer` keys; object tag 5; generation/open-state operations at `+0xe4`/`+0xa0`; local consumer edges. Capture, grouping, recipient delivery, helper internals/numeric edges and input lifecycle remain open. |
| Enhancement timed cooldown consumer / #305 | Mixed owner `0x145ec5800` | Exact Rockbiter/Stormstrike keys, raw effect 42/subtype 10, rank-byte input, `+0x13c`/`+0xe88` time fields and local cooldown arithmetic. All 15 references to the required 1/6/100 floats are checked. Descriptor/expiry producers, source mapping, proc graph and surrounding generic code remain excluded. |
| Server first-answer mutation / #306 | `0x145e53aa0..0x145e53b48` | Exact phase 3, member-index bound, stride `0x858`, identity `+0x560`, 16-byte rows, pending byte 0 and `2-r8b` mutation. Caller bool/enum meanings, response creation, routing, timeout/cancel and run-start admission remain open. |

These are the same four scopes, without expansion or reduction. Unverified behavior excluded by their original registration is not a requirement for this local correspondence check and is not promoted by it.

## Code and control flow

Every complete retained raw range was searched across the entire current image. None of the thirteen has an exact match, including at its old virtual address. Ten have unique candidates whose bytes agree after encoded address fields are excluded, with equal declared unwind extents. Three changed-body candidates are identified by unique exact anchors and current declared extents: clock geometry, Ready Check UI and clock registration. All thirteen remain navigation records in the evidence; their owner names and code geometry do not establish source or full behavior correspondence. The historical meterfeed decompiler failure likewise remains a failure, despite its current code-navigation candidate.

Address masking is supplemented by an independent branch check for the four compared recap/Enhancement/server owner ranges. All **402** internal conditional and unconditional branches retain their actual opcode/displacement bytes, source instruction offsets and target instruction/owner offsets. Every target is an independently decoded instruction start in the corresponding owner. There are no indirect or external jumps in this checked population.

| Compared owner | Internal branches checked |
| --- | ---: |
| Recap renderer | 80 |
| Recap terminal | 37 |
| Mixed Enhancement owner | 276 |
| Server answer mutation | 9 |

The machine evidence stores the complete normalized edge tuples and their hashes. This structural check covers the registered regions without claiming semantic recovery of other instructions in the containing owners or their callees.

The exact clock construction is a 30-byte span of five instructions. Its shape matches after only the two RIP-relative displacements are excluded; all descriptor stores and the length immediate match. It contains no conditional or unconditional branch. The current name payload at `0x146538cb0` is independently read as the exact 19 bytes `AZS_NativeLocalTime`; the constructed callback pointer is `0x14025c7c0`. The callback's implementation is outside the registered scope.

## Separate clock boundary

Immediately after construction, current code calls `0x140118880`, compares `AL` with 2 and branches at `0x14025c2b5` to `0x14025c5fb` when `AL >= 2`. The target is a decoded instruction start inside the current clock owner. The ordinary path then calls `0x14016c980` with descriptor/context operands in `RCX`/`RDX`. Exact current bytes and instruction addresses are retained separately from construction.

The predicate, branch meaning and new wrapper remain unresolved. They do not invalidate the preceding descriptor-construction facts, and those facts do not establish successful registry semantics.

The source-first boundary is the existing benilla VM/embedding seam: `UiScript::{new,new_glue,lua,vm_kind,session}`, `LocalClientExtension::seed`, and the existing AS FrameXML/prelude extension. Source receipts are retained in the evidence. This does not identify either native callee with a particular source method or establish an edge to input isolation, Wine focus or IME. Generic VM/registration internals stop at that AS boundary.

## Data and validation limits

Every promoted current code range and referenced key/coefficient has an explicit VA, file mapping, length and hash or exact instruction bytes. Recap keys are read at each decoded current reference, and the Enhancement coefficient reads verify the actual 1/6/100 float payloads. Original code, data observations, query plans/journals/results and registered exclusions remain linked to 0.139.0 rather than relabeled as current native execution.

The configured installed image's whole hash is independently verified. This review ran static PE/Capstone comparisons only. No native query, application compilation, client/game/network/server execution, source assignment or original/rebuilt comparison was performed. Generic helper internals, upstream producers, broader consumers and runtime/parity remain separate work.
