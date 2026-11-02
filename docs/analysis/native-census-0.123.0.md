# Native discovery census — 0.123.0

Historical 0.123.0 evidence. The selected installed target and current source/recovery status are maintained in [CURRENT-STATE](../CURRENT-STATE.md); this report does not certify newer-target applicability.

Selected installed EXE SHA-256:
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The configured EXE and eleven MPQs were read in place without modification or
application execution. Structural accounting, decoded instructions, native
bodies/references, recovered behavior, connected source and parity are distinct.
[CURRENT-STATE](../CURRENT-STATE.md#gap-41), the
[AS review](as-discovery-0.123.0.md) and
[unknown queue](unknown-recovery-0.123.0.md) retain the semantic frontiers.

## Whole-file and independent scans

The fresh [complete PE inventory](evidence/0.123.0/refresh-baseline/native-summary.json) records
146,228,736 bytes, six sections, **358,847 unwind extents**, 425 imports,
zero exports and 637,314 nonpadding relocations. Its 766 diagnostic paths
include **66 AS paths**: new `coop/pick.rs`, `coop/smooth.rs` and returned
`realmd.rs`. Historical source/recovery is preserved independently of path
membership. The [26-range ledger](evidence/0.123.0/refresh-baseline/file-range-summary.json) covers
`[0,146228736)` with zero overlap and omitted bytes; candidate padding and
unexplained data retain exact selectors.

The [Capstone declared inventory](evidence/0.123.0/refresh-baseline/instruction-summary.json) records
**23,985,437 instructions / 97,158,135 union bytes**, with no undecoded suffix.
The separate [executable complement](evidence/0.123.0/refresh-baseline/unwind-complement-summary.json)
contains **5,263,703 bytes / 338,263 regions**. Its 2,855 seed addresses yield
80,575 candidate instructions / 348,287 bytes. These independent linear
observations do not establish actual flow, ownership, semantics or reachability.

All eleven MPQs retain unchanged identities. Their current
[member accounting](evidence/0.123.0/mpq-member-coverage.json) covers 29,701
active slots / 29,691 names with no opaque slots or orphan blocks. The exact
16,665-byte embedded addon API is unchanged. All nine added namespace and three
resource candidates have [source-first review](source-frontier-0.123.0.md);
packed text and literal equality do not establish full consumer semantics.

## Durable full-image Ghidra passes

The [declared pass](coverage/full-image-declared-0.123.0.json) verifies
**22,557,270 instructions / 90,212,478 bytes**, 361,365 functions,
419,815 body ranges and 3,890,101 static references. All 358,847 requested
starts are decoded and repaired. Its residual is 12,209,360 executable bytes;
this is the declared population, not the expanded result.

The [expanded pass](coverage/full-image-execheck-0.123.0.json) extends the
same saved current-target Program with all declared/diagnostic/complement,
guarded-switch, address-code, import and unwind inputs. Its 431,015 requested
entry repairs and 24,063 additional code starts complete. All **17,094 admitted
guarded edges / 2,581 tables** are applied. Body repair conservatively uses full
repair with reason `unresolved-thunk-boundary-dependency`; same-Program reuse
is not a claim that old bodies were skipped. Original producer/input commitments
and checkpoints remain retained in the shared analysis store.

| Independently verified expanded observation | Result |
| --- | ---: |
| Instructions / exact instruction bytes | 23,388,226 / 93,797,243 |
| Ghidra functions / actual body ranges | 433,642 / 490,807 |
| Static references / external locations | 4,050,815 / 425 |
| Computed call / jump flow records | 71,040 / 142,481 |
| Unobserved executable bytes / ranges | 8,624,595 / 473,889 |

Every exported instruction passes independent original-byte/boundary checks.
The residual contains **5,283,201 bytes inside declared extents** and
**3,341,394 outside**. The complete selector is
`independent_instructions.executable_sections.range_inventory`; the declared
subset is `independent_instructions.unobserved_range_inventory`. Candidate
padding and unobserved bytes are not automatically AS code or missing source.

## Ownership, residual and correspondence records

The [exact residual proof](evidence/0.123.0/native-residuals.json),
[operand audit](evidence/0.123.0/native-operands.json),
[direct-flow audit](evidence/0.123.0/native-dispatch.json),
[constant-register audit](evidence/0.123.0/native-constant-dispatch.json),
[ownership register](evidence/0.123.0/refresh-baseline/native-ownership-classification.json) and
[atomic selection](evidence/0.123.0/refresh-baseline/native-image-current.json) bind the same census.
Each supplies its exact artifact paths/digests and population selectors.
Opcode indirect transfers differ from Ghidra computed-flow tags and cannot be
added to other inventories as semantic coverage.

The [switch frontier](evidence/0.123.0/native-switch-proposal-review.json)
separates the census's applied inputs from later proposals. Unapplied proposed
edges never count as applied native edges. Retained finite-table questions keep
stable identities and [correspondence evidence](evidence/0.123.0/computed-correspondence-frontier.json);
geometry candidates do not prove behavioral/dependency equivalence.

[Incremental recovery](evidence/0.123.0/incremental-correspondence.json)
preserves earlier query reviews, classifications, repairs and module assessments
with their original targets. Exact historical byte matches provide candidate
locations, not current producer/dependency/consumer proof. Established benilla
interfaces stop generic-engine recovery unless a concrete AS contract requires
more. Pending current applicability does not erase implementation progress.

## Current bounded behavior and validation

Eleven journaled exact raw-subject queries establish bounded pool-recipient,
choices-offer, movement-packet, Fire Nova cast/DBC and updater-resume contracts.
The [release review](release-review-0.123.0.md) links each proof and actual source
counterpart; six supplied items have bounded native assessments and ten retain
specific pending questions. The updater additionally passes 38 isolated
original-instruction fixtures. These checks do not execute the game or server.

The [module register](module-contracts-0.123.0.md) and
[connection ledger](evidence/0.123.0/refresh-baseline/exe-connections.json) own partial-source and
current-contract fractions. These are module counts, not AS-code recovery,
implementation or parity percentages. All six global discovery stages remain
partial with exact next selectors in the AS/unknown queues. Full source/type/
alias closure, compilation, client/game/network/server execution and controlled
original/rebuilt comparisons remain unverified.
