# Current treasure catalogs

Selected EXE SHA-256:
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.

The cache library now consumes all22 current jewelry records and all129 amulets
(17 shared,112 generated). Keys, strings, raw effect records, rarity factors and
empowerment steps are retained from the current selected PE. Current constructor
`145425af0`, shared table `14673c6e0` and ability table `146736b48` are bound in
[construction evidence](evidence/treasure-generation/amulet-construction.json).
The current asset is a build input with owned strings; PE pointer words are
forensic provenance and are never dereferenced by the reconstruction.

The optional constructor and jewelry recovery scripts use bounded unchanged
instructions with declared text/allocation/math boundaries and full target hash
verification. They never launch an original process. Source builds use the
tracked catalog and never require the reference EXE.

[Jewelry vectors](../../crates/azeroth-survivors-re/tests/fixtures/jewelry-0.100.1-native.json)
cover660 increments and12 rarity distributions. Existing cache candidate/order,
mutation and RNG tests passed during consolidation. This commit changes the
catalog/provenance seam, independently of later prose, equipped-effect callbacks,
transaction scheduling or UI. See the [pipeline report](treasure-pipeline.md)
for integration limits. Native runtime parity remains unverified.
