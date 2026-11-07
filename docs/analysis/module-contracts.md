# Module contracts

The [connection ledger](coverage/exe-connections.json) owns the audited
diagnostic module population. Look up `systems[id=<module>]` for its source
assignments, bounded contracts and permanent finding IDs. Use the original
diagnostic path to select the matching native references in
[diagnostic ownership](coverage/diagnostic-ownership.json).

## Source and native evidence

- A source assignment identifies partial reconstructed source for the module.
  Trace the live producer, dispatcher and consumer for the behavior in question.
- A bounded native contract applies to the input, path and target it explicitly
  proves. One such contract can coexist with open work elsewhere in the module.
- Reuse the [finding register](../CURRENT-STATE.md) for missing source or
  correspondence. Keep build, runtime and parity work in
  [verification](../verification-needed.md).

The [audited module table](module-contracts-0.141.0.md) lists the selected rows
and next steps. Refer to its target identity before applying a proof.

## Historical correspondence

Use the [0.139.1 source frontier](source-frontier-0.139.1.md) and
[0.140.0 incremental record](evidence/0.140.0/incremental-correspondence.json)
for predecessor source assignments and bounded contracts. Earlier source work
retains its permanent issue and evidence when a new EXE needs separate
applicability proof.
