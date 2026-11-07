# Target reviews

Use [current state](../CURRENT-STATE.md) for the selected reconstruction target
and the [target registry](coverage/targets.json) for registered identities.
The installed EXE can advance before a complete audit. Compare its hash with the
registry before using any native addresses or applicability claims.

## Identity and coverage

A target identity binds the exact EXE bytes, the embedded release marker and the
Data archive chain. A completed native census and the source reconciliation are
separate records. An updated package version or matching MPQ chain does not
transfer either record to the new executable.

- [Reconstruction coverage](reconstruction-coverage.md) describes the selected
  native pass and the distinction between file, code and behavior coverage.
- [AS discovery](as-discovery.md) explains the candidate graph, residual queue
  and the source evidence needed to resolve them.
- [Module contracts](module-contracts.md) maps diagnostics to source and
  permanent findings. [Verification](../verification-needed.md) owns build,
  gameplay and parity work.

## Native and data evidence

The [target registry](coverage/targets.json) owns identity, including the SHA-256
and MPQ chain. Inspect those fields before applying a code or data observation.
Record verified changes there when registering the installed inputs.

The [coverage provenance index](artifact-history.json) points to exact
historical identity receipts and audit inputs in Git. Use
`python3 -B scripts/artifact_history.py <original-path> --sha256 <recorded-hash>`
when a retained proof needs the original bytes. Current evidence lives with its
owning category and keeps the hash it was observed against.
