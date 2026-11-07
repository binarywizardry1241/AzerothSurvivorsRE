# Cooperative item-name requests

Finding [#63](../CURRENT-STATE.md#gap-63). The installed
`installed-game/AzerothSurvivors.exe` 0.139.2 has SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [manifest](evidence/0.139.2/coop-item-name.json) binds the selected
native ranges and saved raw-slice lookup query. The separate ItemQuery
template and spell-description carrier retains its own evidence.

The synchronized guest request selector at `0x145e62df6..0x145e62e8e`
keeps four engine opcodes on its local port. The local branch at
`0x145e62fc9` takes Logout `0x4b`, QueryTime `0x1ce`, Ping `0x1dc` and
ItemNameQuery `0x2c4`. Other admitted guest requests enter the ordinary
upstream Engine carrier. Guest receive variant 6 reaches
`0x145e17f30`, whose opcode predicate rejects an upstream `0x2c5` reply.

The shared command owner `0x145e4c400` selects `0x2c4` at
`0x145e4c693..0x145e4c698`. The branch reads up to four entry bytes with
zero fill and leaves the owner GUID and any trailing bytes unread. It calls
`0x145e35550` with only the entry. The descriptor lookup selects a bounded
90001–90114 special table, a lower-entry fallback `0x145e34b00`, or the
encoded ordinary equipment path. The observed lookup uses the existing
localized descriptors and has no Game, equipped-state or star argument.
The reconstructed route uses the established item definition constructor
for the name. Catalog completeness retains its separate source/evidence
scope under #92.

Serializer `0x145da1860` writes opcode `0x2c5`, then the entry and a
NUL-terminated name when present. Missing names produce only the entry
with bit 31 set. The sender-specific publisher `0x145e77490` receives the
original role and index. A synchronized guest Engine request that arrives
on the host follows this same sender-specific route. Its locale comes
from the assigned world actor when present, via `0x145e44870` and the
scoped locale adapter `0x145eb4880`.

The local client adapter now projects the real ItemNameQuery before the
guest wire path. The active local request drain replies without a Game
gate, and the ordinary ItemName event handler files the result or frees
the outstanding lookup on refusal. The host receive loop uses its existing
synchronized admission, recipient locale and private engine reply.

`python3 -B scripts/check-coop-item-registry.py --names --native` passes
**108** native routing cases, **208** request and serializer cases, and
**15** guest admission cases. It checks nine hash-bound ranges and six
live source paths. Synthetic descriptor results, allocation, byte copying
and the sender callback are explicit replay seams. The saved lookup query
and selected original instructions establish the descriptor call boundary
and do not replay every catalog item or translation.

Six Rust modules syntax-parse. The authored local routing and wire vector
regressions remain uncompiled and unrun. Actual UI/cache, client/service
execution and original/rebuilt parity remain open.
