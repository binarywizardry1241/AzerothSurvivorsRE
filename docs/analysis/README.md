# Recovered behavior and evidence

[Current state](../CURRENT-STATE.md) owns source and recovery findings.
[Verification](../verification-needed.md) owns build, runtime and parity checks.
[Target reviews](target.md) distinguish the installed EXE from the last audited
identity.

| Area | Start here |
| --- | --- |
| Native analysis | [Coverage](reconstruction-coverage.md), [native census](native-census.md), [native recovery](native-recovery.md), [AS discovery](as-discovery.md), [unknown recovery](unknown-recovery.md) |
| Source correspondence | [Module contracts](module-contracts.md), [source frontier](source-frontier.md), [release claims](changelog-coverage.md) |
| Addon API | [API guide](../addon-api.md), [detailed meter](detailed-meter.md), [world anchors](world-anchors.md) |
| Menu, world and movement | [Playable zones](playable-zones.md), [menu pages](menu-pages.md), [input](input.md), [mob movement](mob-movement.md) |
| Co-op | [Co-op mechanics](coop.md) |
| Run mechanics | [Run effects and progression](run-effects-progression.md), [treasure pipeline](treasure-pipeline.md), [upgrade flow](upgrade-flow.md), [raid mechanics](raid-native.md) |
| Tooling | [Recovery and validation tools](../SCRIPTS.md), [REA setup](../REA.md), [shared analysis storage](shared-analysis-storage.md) |

Update the owning report when a contract changes. Keep exact target identities
and reproducible inputs in the linked evidence. The
[report provenance index](report-provenance.json) maps former report filenames to
their maintained topics and records the Git revision holding the original
bytes. The [historical evidence index](artifact-history.json) preserves
the exact retired extracts and reports in Git. Read an indexed input by its
original path with `python3 -B scripts/artifact_history.py PATH`; use
`--sha256` when a proof records an expected digest. Archived evidence retains
its original applicability and checks.

Working evidence paths are organized by feature. Target versions belong in the
proof metadata. A retained fixture or extract keeps its bytes when moved.
Checkers use the category path for working inputs and the original logical
path when verifying a historical receipt.
