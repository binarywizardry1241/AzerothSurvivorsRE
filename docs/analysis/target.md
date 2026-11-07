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
| Source changes | [0.121.0 source frontier](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.121.0.md), [0.123.0 ownership input](evidence/0.123.0/source-frontier.json), [0.127.0 source frontier](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.127.0.md), [0.139.1 source frontier](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/source-frontier-0.139.1.md) |

## Retained reports

[0.139.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.139.0.md) · [0.120.4](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.120.4.md) · [0.120.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.120.2.md) · [0.120.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.120.0.md) · [0.119.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.119.1.md) · [0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.119.0.md) · [0.118.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.118.0.md) · [0.115.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.115.0.md) · [0.113.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.113.2.md) · [0.113.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.113.0.md) · [0.112.5](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.112.5.md) · [0.112.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.112.0.md) · [0.110.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.110.0.md) · [0.109.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.109.0.md) · [0.108.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.108.0.md) · [0.107.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.107.0.md) · [0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.105.0.md) · [0.100.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.100.1.md) · [0.97.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.97.2.md)
