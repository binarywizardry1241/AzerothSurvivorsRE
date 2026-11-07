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

Use the comparison tied to the change being investigated. Each record contains
its own identity and points to the exact inputs.

| Area | Retained comparisons |
| --- | --- |
| Native structure | [0.117.0 whole-image delta](evidence/0.117.0/discovery-delta.json), [0.120.5 whole-image delta](evidence/0.120.5/discovery-delta.json), [0.123.0 whole-image delta](evidence/0.123.0/discovery-delta.json) |
| MPQ changes and member checks | [0.117.0 patch-chain identity](target-refresh-0.117.0.json), [0.120.5 members](evidence/0.120.5/mpq-member-coverage.json), [0.121.0 members](evidence/0.121.0/mpq-member-coverage.json), [0.127.0 members](evidence/0.127.0/mpq-member-coverage.json) |
| Source changes | [0.121.0 source frontier](source-frontier-0.121.0.md), [0.123.0 ownership input](evidence/0.123.0/source-frontier.json), [0.127.0 source frontier](source-frontier-0.127.0.md), [0.139.1 source frontier](source-frontier-0.139.1.md) |
