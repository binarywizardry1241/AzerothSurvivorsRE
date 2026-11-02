# Treasure placement catalog — 0.100.1

Selected EXE SHA-256:
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.

The [current catalog evidence](evidence/0.100.1/treasure-chests/catalog.json)
binds all twelve zone geometry records and ordinary enemy cache flags to exact
current PE ranges. Recovered values agree with the existing source constants;
this update gives those constants their independently checked current provenance.
The optional `scripts/recover-treasure-catalog.py` reproduces them without
an original process. Builds use source constants and do not read the EXE.

The existing 22 treasure-chest regression tests passed during consolidation.
This data/placement checkpoint alone does not complete cache purchase, reward,
equipped effects or visual fidelity. Those stages are tracked by the
[treasure pipeline report](treasure-pipeline-0.100.1.md).
