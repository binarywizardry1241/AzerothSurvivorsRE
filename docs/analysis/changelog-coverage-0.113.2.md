# Release-claim coverage — 0.113.2

Selected 0.113.2 target SHA-256:
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[Identity](target-refresh-0.113.2.json), [target review](target-0.113.2.md).
Historical release context: [0.113.0](changelog-coverage-0.113.0.md)

The ledger accounts for **768 claims across 171 supplied releases**,
covering every paragraph, bullet and source note through 0.113.2. The unchanged sixteen 0.113.0 claims are retained once; 0.113.1 adds four
claims and 0.113.2 adds three. No 0.108.0 notes or intermediate 0.113.1 executable
were supplied. Historical assessments keep their exact target and remain
unapplied to the selected hash unless a current claim-specific review exists.

| Release | Obligation | Source status | Remaining check | Owning report |
| --- | --- | --- | --- | --- |
| 0.113.1 | Lobby capacity 1–5, full-lobby admission/list filtering, open-slot presentation, complete scrolling list and unspecified co-op performance fixes. | Current selector, capacity-bounded roster and full scrolling-list UI consumers are connected through read-only snapshots. Live discovery/session and multiplayer logic remain absent/excluded. | #63/#41: current UI layout/input recovery remains distinct from excluded admission/network/server logic; performance is unmeasured. | [Target review](target-0.113.2.md), [native census](native-census-0.113.2.md) |
| 0.113.2 | Smoother co-op, bundled/compressed per-friend host traffic and faster message arrival. | Release obligations and native route/TCP/server-party discovery only; no transport/server implementation. | #63/#41: excluded multiplayer logic; packet counts, bandwidth and latency are unverified release claims. | [Target review](target-0.113.2.md), [native census](native-census-0.113.2.md) |

| Obligation | Discovery/source status | Scope and remaining limits |
| --- | --- | --- |
| Hosting size selector, open-slot display and lobby-list scrolling | Current native UI contracts and local picker/modal/selector plus snapshot list/roster consumers are source-connected; 518 native cases, nine Node captures and 14 locale subsets pass. | #63/#17/#41: the presentation adapter has no runtime snapshot producer or host/join request form. No hosting, joining, capacity enforcement, game execution or UI parity is established. [Source/proof](coop-ui-0.113.2.md). |
| Capacity enforcement, full-lobby list removal and cooperative performance | Current route/game-party/server-party owners are discovery leads. | #63/#41: multiplayer/session/server logic is excluded. UI visibility is not proof of admission behavior. |
| Bundling, compression, fewer messages/bytes and faster delivery | Whole-image native discovery includes the existing route/TCP/server-party diagnostics. Unchanged imports do not establish unchanged protocols. | #63/#41: discovery only; no backend implementation or measurements. The approximately tenfold/half-data claims are not certified. |
| Earlier 0.113.0 party gameplay, rewards, saves, frames/chat/inspection and presence | Individual current ownership assessments retain the separate source gaps. | #63/#41 with existing HUD/persistence ownership: co-op gameplay/network/server logic is excluded; UI-only work is a separate selection. |
| `AZS_GetPartyMeter` and `AZS_GetRevive` | The bounded Lua/native recovery is historical 0.113.0 evidence. | #11/#63/#41: current contracts/dependencies are not certified; no cooperative producer/backend is implemented. |
| Typing in chat must not choose or reroll cards | [Current input](evidence/0.113.2/card-keyboard/report.md) binds the typing getter/snapshot/resource identity, Digit/Numpad aliases and native opening/exit constants. [Ordered delivery](evidence/0.113.2/card-delivery/report.md) now connects snapshot actions to immediate Select/Reroll transactions; typing blocks keyboard input while pointer controls remain active. | #41: 6,410 input/gate and 269 delivery cases plus separate pointer checks pass. Actual chat-focus/VM/input scheduling, source execution and original/rebuilt parity remain unverified; bounded native interfaces do not certify every shared producer or alias. |

Individual current assessments distinguish bounded source/static contracts from
pending ownership and excluded backend obligations. The UI adapter does not certify a whole co-op claim. No whole release, system, runtime behavior or parity is
certified. No compilation, game/network session, packet measurement or controlled
original/rebuilt comparison was performed.
