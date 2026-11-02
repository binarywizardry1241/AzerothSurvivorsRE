# Release-claim coverage — 0.115.0

Selected 0.115.0 target SHA-256: `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
[Identity](target-refresh-0.115.0.json), [target review](target-0.115.0.md).
Historical release context: [0.113.2](changelog-coverage-0.113.2.md)

Each supplied paragraph and bullet has its own stable claim ID in the
[ledger](coverage/changelog.json). The five newly supplied releases are
0.113.3, 0.114.0, 0.114.1, 0.114.2 and 0.115.0. No intermediate EXEs were supplied;
only installed 0.115.0 is selected. No 0.108.0 notes exist. Historical reviews
remain unapplied to this hash. Textual release statements are recovery leads,
not measured performance or implemented behavior.

| Release | Obligation | Source status | Remaining check | Owning report |
| --- | --- | --- | --- | --- |
| 0.113.3 | Per-client language, party chest count, friendly Battle Shout/Power Word: Shield and replicated down-state | Direct party/reward/down-state source connects bounded contracts; complete per-recipient text/localization and clause-level proof remain open | #63/#41, with existing reward/effect/localization owners; whole release claims remain pending | [Target review](target-0.115.0.md), [co-op source](coop-0.115.0.md) |
| 0.114.0 | Dedicated co-op server and minimum compatible party version | Native TCP/admission source exists; deployed dedicated service remains unimplemented/unverified | #63/#41; retain version compatibility as a release obligation | [Target review](target-0.115.0.md) |
| 0.114.1 | Bundled party updates up to 20 Hz | Current source connects native batches/cadence; no traffic or performance measurement validates this historical release claim | #63/#41; 0.114.2 changes guest cadence, so do not impose this historic limit on current behavior | [Target review](target-0.115.0.md), [session proof](coop-session-0.115.0.md) |
| 0.114.2 | Class-specific boss loot for all party members, guest updates up to 60 Hz, immediate guest actions and leaving the lobby on run end | Direct per-hero rewards, commands, replication and End lifecycle connect source; exact compound claim and execution remain unverified | #63/#41; retain individual clause/dependency and runtime/parity obligations | [Target review](target-0.115.0.md), [co-op source](coop-0.115.0.md) |
| 0.115.0 | Solo/party raid markers; dead-boss ground-attack cancellation; talent timer addon API; party disconnect/friendliness/scaling/progression/revive/loot/localization, lobby defaults/filters and another server | Bounded local source/static contracts and direct-party source are connected; individual whole claims remain pending | #11/#41/#42/#58/#63/#71; public discovery/full host/code forms and complete per-recipient text/localization remain source work; runtime/parity are unverified | [Target review](target-0.115.0.md), [unknown queue](unknown-recovery-0.115.0.md) |

[Co-op backend source](coop-0.115.0.md) now has native-bound partial contracts
for all four formerly missing modules. Individual compound release claims remain
pending; neither module mapping nor a binary codec certifies their full gameplay,
service deployment or parity. The solo raid-target icon source/static scope is
connected under #71; its execution and comparison remain open. The individual
[ground-attack death claim](raid-death-0.115.0.md) is source-connected and
static-checked under #42: all shared ground kinds require a living source,
optional ground objects and published markers use normal removal, and the
independent delayed visual queue retains its lifetime. 875 isolated native
profiles pass; compilation, encounter/rendering and original/rebuilt parity
remain unverified. Current [timer/API recovery](addon-timers-0.115.0.md)
source-connects the equipped producer, metadata/localized names, raw racial/haste
inputs, serialization, twenty-stream cache and exact Lua getters under #11.
The bounded local API/revive clauses and empty no-party readers have 499 native
cases and 23 interpreted Lua assertions. Current [co-op addon source](coop-addon-feed-0.115.0.md)
connects actual received party/revive/resource/run producers separately; their
execution, rendering and original/rebuilt parity remain unverified. The
[revive CVar map](revive-addon-0.115.0.md) has independent current native proof.
New lobby defaults/filters are presentation leads
under #63/#17; their UI proof does not establish multiplayer behavior.

The new `banners.rs` diagnostic links banner/localization recovery under #58/#11;
it does not establish the root cause of the historical takeover defect. Other
new claims retain their individual ownership reviews. Ground-attack and local
addon API clauses have the named bounded source/static assessments; no new claim
is runtime-validated or parity-matched.
