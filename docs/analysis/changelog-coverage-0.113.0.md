# Release-claim coverage — 0.113.0

Selected 0.113.0 target SHA-256:
`c3a82f594e05dc8cea49dfa38e69aca96c9ee625a5b7df3ffa93c19dc8c95773`.
[Identity](target-refresh-0.113.0.json), [target review](target-0.113.0.md).
Historical release context: [0.112.5](changelog-coverage-0.112.5.md)

The ledger accounts for **761 claims across 169 supplied releases**. The sixteen
new 0.113.0 paragraphs/bullets are indexed individually. The repeated addon API
bullet is retained once; no 0.108.0 notes have been supplied. Prior claim
assessments retain their original target and are unapplied to this hash.

| Release | Obligation | Source status | Remaining check | Owning report |
| --- | --- | --- | --- | --- |
| 0.113.0 | Cooperative runs, lobbies, party gameplay/UI/persistence, two addon read APIs and chat input guards. | API recovery is separate; cooperative producers/backend and full release implementation are missing/deferred. | #63/#11/#41: recover and connect each contract independently; actual network, gameplay, presentation and original/rebuilt parity remain unverified. | [Target review](target-0.113.0.md), [API recovery](addon-party-api-0.113.0.md) |

| Obligation | Recovery and source status | Remaining check |
| --- | --- | --- |
| Lobby hosting/discovery/codes, five independent heroes and class-zone admission | New lobby, route/TCP and party diagnostic owners are current leads; source integration is missing/deferred. | #63/#41: exact contracts, transport/auth, admission and lifecycle. |
| Party-scaled horde/bosses, nearest targeting, shared XP/gold, personal caches, card holds, down/revive/team defeat, healing and guardian rewards | Release claims and native party leads; API revival progress does not establish all gameplay rules. | #63/#41: native producers/consumers and cooperative run implementation. |
| Party frames/chat/inspection, endless and retained party, per-hero saves and Discord presence | Current co-op/UI leads; complete source and functional behavior are unverified. | #63/#41, with existing menu/HUD/persistence ownership: full contracts and original/rebuilt checks. |
| `AZS_GetPartyMeter` and `AZS_GetRevive` | [Bounded current API recovery](addon-party-api-0.113.0.md) documents the embedded Lua and native stream producers. The reconstruction has no cooperative producer/backend. | #11/#63/#41: source integration is deferred; actual game/addon/network behavior and parity remain unverified. |
| Offline solo behavior and typing no longer choosing/rerolling cards | Separate current release obligations; unchanged labels and historical input recovery cannot certify them. | #63/#41, with #7/#8: current input guards, offline transitions and runtime comparison. |

Individual reviews distinguish the bounded API contract from ownership-only
co-op claims. No entire release, system, network service, persistence operation
or original/rebuilt parity is certified. No compilation, compiling tests,
game/network execution or controlled runtime comparison was performed.
