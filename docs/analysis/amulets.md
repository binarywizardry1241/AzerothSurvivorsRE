# Current ordinary amulet construction and spell names

Selected installed EXE: **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[verification-needed](../verification-needed.md) owns #34; historical
[equipment evidence](equipment-catalog.md) keeps its original target.

The current generic constructor `1458a1730..1458a2ddc` builds all **113**
ordinary generated amulets from the current 120-byte ability table at
`146bf5eb0`. Its canonical native extract/Ghidra observation belongs to
[Empowerment/Medallion](evidence/0.112.0/demonic-empowerment/manifest.json), role
`medallion-constructor`; the constructor is shared, despite that role's name.
This report references that extract rather than duplicating it. The sixteen
current shared descriptors start at `146c015c8`, stride 80; Star is now jewelry,
covered separately by [its current repair](jewelry.md).

All 129 descriptors compare their keys, English names, icons, rarities, complete
normalized effect payloads and owned strings against the live source catalog.
The only additional retained-asset difference after the separate current
Medallion repair is **Charm of the Fated Hour: Soulfire**. The source applies a
small current-name override, preserving the original asset's historical bytes
and the unchanged `legendary:soul_fire` collection key. The ordinary ability,
menu label and class list likewise use the current **Soulfire** spelling. All
113 current ability names match both source catalogs and their class lists.

`python3 -B scripts/check-amulet-definitions.py` reproduces
[the compact proof](evidence/0.112.0/balance/amulets.json): 113 actual native
constructor executions, sixteen shared descriptor traversals and **1,860**
native magnitude/selector/string-retention scaling cases. Zero and positive
factors cover every effect in those descriptors. Current stat/spell variants
36/37 normalize to stable source stat/spell tags 30/31. Forensic pointers and
inactive enum padding are excluded from semantic comparison; active values and
owned strings retain exact target provenance.

The native fixture maps actual PE code/data. Allocation, C memory operations,
English locale fallback and finite `floorf` are explicit host seams. The factor
oracle translates `scaled_bytes`; it does not execute Rust. Current generic
rank/exponent and Medallion consumers have separate
[Empowerment evidence](demonic-empowerment.md), including signed exponent
conversion; Windows CRT `powf` bit parity remains unverified. The existing catalog,
choice/application, effect refresh and reward/Codex localization consumers own
actual delivery. These checks establish descriptor/source connections, not all
proc behavior or complete equipment/gameplay fidelity. No compilation, Rust test
execution, game, device, save-file I/O or original/rebuilt comparison ran.
