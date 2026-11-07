# Cooperative zone history

Finding **#115** belongs to the fourteen-feat package **#113**. The installed
EXE SHA-256 is `507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
The [range and query manifest](evidence/0.117.0/coop-history/manifest.json) binds
the current native contracts; [verification-needed](../verification-needed.md) owns current
implementation and validation status.

The Save adapter now preserves an account-wide `coopbeat|zone,zone` family,
independent of ordinary per-class `beat|class|zones` and unlock progression.
`save/coop_history.rs` exposes the remembered ordinal set and an idempotent
victory writer. `save/schema.rs` includes it in canonical output after ordinary
beat rows and before perks. Unknown zone keys are discarded, repeated valid
keys are unioned and sorted by native zone ordinal, and empty history is omitted.
Tokens inside a comma-separated row retain their exact spelling; line-level
trimming does not admit spaces around individual zone keys.

## Native producer and persistence contracts

- `145c0e650..145c0e8ae` admits a nine-byte `coopbeat|` prefix after the shared
  trimmed-line reader, comma-splits its suffix and filters through
  `145b4d1d0`. The lookup recognizes exactly the twelve current zone keys.
- `145c37b20..145c37cc8` and `145c32910..145c32a67` collect the accepted ordinals.
  The full Save loader `145ac5150..145ac98b4` sorts/deduplicates that collection
  and stores it at Save `+f8/+100`, separately from per-class beat records.
- The full Save formatter `145acb970..145ace12e` emits that family only when
  its count is nonzero. `145c2cd90..145c2cf52` maps retained ordinals back to the
  current zone descriptors. The format at `1472ce88b` is the current encoded
  `coopbeat|…\n` template. Its placement is after ordinary beat rows and before
  purchased perks.
- The ongoing account-delivery route owns the **won plus cooperative-context**
  admission. Callers of `Save::mark_cooperative_victory` must retain that gate;
  the persistence adapter does not infer a co-op victory from an ordinary win.
  Party-state production, recipient delivery and achievement predicates remain
  separately owned by **#114/#157**.

The account evaluator's first-co-op-victory and required-zone conditions read
this separate history; the new category and actual grants belong to the
achievement implementation. Native raw-slice pseudocode retains external-data,
callee and ABI limits. Selected instructions, exact byte commitments and the
independent lookup replay constrain the conclusions above.

## Static verification and limits

`python3 -B scripts/check-coop-history.py` checks nine native spans,
retained query receipts, all twelve native/source zone identities and the actual
Save source connections. With existing Unicorn/Capstone dependencies supplied,
`--native` passes **65,896 original-instruction lookup cases**: every two-byte
input plus exact keys, case/whitespace/NUL/separator, deletion and replacement
boundaries. The replay executes only the pure lookup function in an isolated
emulator; it does not execute the application or any network service.

Compilation, reconstructed Save execution and real filesystem I/O, client/server
execution, multi-run delivery and original/rebuilt parity remain unverified.
The source adapter alone does not establish completion of the full co-op package.
