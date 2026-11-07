# Recovered behavior and evidence

[Current state](../CURRENT-STATE.md) owns source and recovery findings.
[Verification](../verification-needed.md) owns build, runtime and parity checks.
[Target reviews](target.md) distinguish the installed EXE from the last audited
identity.

| Area | Start here |
| --- | --- |
| Native analysis | [Coverage](reconstruction-coverage.md), [native census](native-census.md), [AS discovery](as-discovery.md), [unknown recovery](unknown-recovery.md) |
| Source correspondence | [Module contracts](module-contracts.md), [source frontier](source-frontier.md), [release claims](changelog-coverage.md) |
| Addon API | [API guide](../addon-api.md), [detailed meter](detailed-meter.md), [world anchors](world-anchors.md) |
| Menu, world and movement | [Playable zones](playable-zones.md), [menu pages](menu-pages.md), [input](input.md), [mob movement](mob-movement.md) |
| Co-op | [Admission](coop-admission.md), [item registry](coop-item-registry.md), [replication](coop-replication.md) |
| Run mechanics | [Run effects and progression](run-effects-progression.md), [treasure pipeline](treasure-pipeline.md), [upgrade flow](upgrade-flow.md), [raid mechanics](raid-native.md) |
| Tooling | [Recovery and validation tools](../SCRIPTS.md), [REA setup](../REA.md), [shared analysis storage](shared-analysis-storage.md) |

Update the owning report when a contract changes. Keep exact target identities
and reproducible inputs in the linked evidence. The
[report provenance index](report-provenance.json) maps former report filenames to
their maintained topics and records the Git revision holding the original
bytes. Archived reports retain their original applicability and checks.
