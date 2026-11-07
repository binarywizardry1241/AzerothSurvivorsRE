# Q41-D01 diagnostic operand and outer-consumer recovery

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The installed reference remains read-only. This pass addresses every one of the
31 previously unresolved owned diagnostic operands and every expanded-profile
ownerless custom diagnostic site. It identifies no missing gameplay operation
or source defect. Complete successful AS semantics remain a separate #41 limit.

The [reproducible proof](evidence/0.115.0/q41-diagnostic-contracts.json)
retains exact selections, current-byte commitments, supporting interfaces,
pointer-state graph results and direct outer consumers. The original
[owned classification](owned-custom-diagnostics.md) and
[ownerless roles](custom-diagnostic-roles.md) retain their original
selectors and first-boundary results; this proof supplements those results.

## Expanded all-seed diagnostic selector

The exact selector is
`profiles.expanded_all_seeds.artifacts.jsonl`, followed by
`actual_native_owner == null && custom_game_crate == true` in the
[diagnostic projection](evidence/0.115.0/execheck-diagnostic-sites.json).
All **60 selected sites across fourteen paths** match existing canonical
ownerless sites by path, original target, reference kind, complete declared
extent bytes, decoded flow and first consumer. Every selected instruction is
also independently observed at the same exported boundary. No canonical body
ownership is transferred to the expanded profile.

| Byte-verified immediate interface | Expanded sites |
| --- | ---: |
| Bounds failure | 30 |
| Formatted failure | 21 |
| Missing-key failure | 1 |
| Option failure | 1 |
| Stable 8-byte and 120-byte vector removal | 2 |
| Adjacent `spell`/`p` named-template keys | 5 |

The existing removal producers, literal extents and four scoped source
connections are checked by the canonical ownerless checker. Their 109 vector,
28 totem-cap and 54 Options-membership original-instruction cases pass.
The expanded selector supplies no additional unexplained consumer or missing
source operation. A failure Location still does not explain the successful
AS index/state producer, and a filename does not establish a function type.

## All 31 cycle/return operands

The earlier path-local traversal stopped at 191 repeated-address paths and
52 returns. The new checker explores the finite graph of exact pointer states:
an instruction address, retained selected-pointer registers and exact local
pointer locations. Every conditional successor is followed. A repeated
identical pointer state merges into its existing node, while all other exits
remain checked. This removes the need to guess an iteration count or claim
that a collection loop terminates.

All **31 sites, twelve owners and 2,621 pointer states** are checked without
reaching the explicit graph bound. They produce 38 distinct nonconsuming-call
exits, fifteen overwrite exits and 22 return-residue exits. These counts are
per selected operand and exact exit, rather than the earlier count of guarded
paths. No selected pointer reaches an exact memory store or RAX return.

| Native owner | AS screen context | Selected operands |
| --- | --- | ---: |
| `140052540` | Talent viewer | 2 |
| `140054020` | Cards | 2 |
| `140058900` | Run modifiers | 2 |
| `140109240` | Picker | 4 |
| `14016b820` | Meter | 3 |
| `140190130` | HUD | 2 |
| `1401981e0` | HUD | 4 |
| `14019d570` | HUD | 2 |
| `1401a03b0` | HUD | 4 |
| `140219790` | Co-op screen presentation | 2 |
| `14021dce0` | Update banner | 2 |
| `14021f090` | Update modal | 2 |

At every call exit the selected pointer is absent from the current helper's
meaningful arguments. The helpers are already byte-bound queue append,
tagged-value drop/key lookup and heap-release interfaces. Their concrete
engine types are not reconstructed. Exact callee-saved pointer copies are
followed across ignored calls; volatile copies are not assumed to survive.
Nine selected sites have no return-residue exit at all.

The remaining return exits retain only RDX, R8, R10 or R11 residue. This is a
register observation, not an inferred Rust return type. The checker follows
**all 24 direct incoming calls to these twelve owners** through their actual
post-call continuations and returns. None reads any of those four volatile
registers before overwriting it or returning; the caller's ordinary output
is formed independently. The other twelve saved references are verified
four-byte start-RVA fields in PE `.pdata`, rather than callable references.
The retained census selector establishes this bounded incoming set; it does
not establish the absence of every possible computed or aliased caller.

A fresh journaled Ghidra query of the cards owner corroborates its state-update
role and infers a `void` return:
`ev_60ca12a67b465a56e188414f0e4aca5ddddc3f9cc96447d812aa834364ccece2`.
Its raw-function input exactly matches `140054020..1400551d0` in the selected
EXE. The full result, plan, input receipt and query journal remain under
ignored `runtime/q41-diagnostics-0.115.0/cards/`. A raw-function decompiler
inference is not original types or complete callback ABI proof.

## Checks and remaining scope

With the existing Capstone 5 environment available:

```sh
python3 -B scripts/check-q41-diagnostic-contracts.py
python3 -B scripts/check-custom-diagnostic-roles.py
python3 -B scripts/check-owned-custom-diagnostics.py
```

The new checker verifies all 60 expanded interfaces, all 31 pointer-state
graphs, every selected outer reference, current helper bytes, native query
input/result identity and five independent pointer-transfer regression cases.
It rejects unhandled alias use, computed transfers, outside-extent successors,
meaningfully consumed pointers or a reached graph bound. The two prior
checkers pass their existing complete populations and scoped source guards.

The exact local-cycle obligations now have a bounded operand-flow result;
the selected direct outer consumers do not consume the retained residue.
This does not recover the successful collection/state semantics of all
twelve AS owners, prove arbitrary aliases or concrete callback output types,
or establish executed branch choices and loop termination. Those broader
unknowns remain #41. This pass supplies no evidence-based gameplay change to
implement. No compilation, compiling test, game/application/network launch
or original/rebuilt comparison occurred.

## Retained analyses

- [Q41-P01 — current aura alias and remaining-call routing](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/evidence/0.113.2/q41-p01-aura/report.md)
- [Q41-P01 — XInput function-slot producer](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/evidence/0.113.2/q41-p01/report.md)
- [Q41-C01: ordinary upgrade choice index diagnostic](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/evidence/0.113.2/q41-c01-upgrade-constructor/report.md)
- [Q41-C01: Armory slot-selection diagnostic](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/evidence/0.113.2/q41-c01/report.md)
