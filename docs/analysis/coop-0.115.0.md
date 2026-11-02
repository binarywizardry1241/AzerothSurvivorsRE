# AS co-op source integration — 0.115.0

Selected EXE SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
All **60/60 known AS diagnostic modules have partial source correspondence**.
The denominator excludes the shared engine and measures module mapping. It does
not measure recovered code, complete systems, working multiplayer or parity.

Current [0.123.0 ordered input and party-list proof](coop-party-frames-0.123.0.md)
supplements the historical contracts below. Its resumable host pump applies each
assigned Sync and departure before advancing the native peer loop, retaining
intermediate world/status snapshots; profile storage and world assignment remain
separate. Compilation and runtime/parity remain unverified.

## Direct session and world bootstrap

The application reads `WOW_ROGUE_COOP_HOST`, `WOW_ROGUE_COOP_JOIN` and
`WOW_ROGUE_COOP_PASSWORD` through the recovered direct-session driver. The
[session integration](coop-session-0.115.0.md) composes actual TCP, all nineteen
native envelopes, bounded raw-DEFLATE batches, profile/roster lifecycle and exact
private/shared engine-packet routing. Denials drain before closure; host polling
caps outer frames at 200 per peer and writes at 1/60 second. Guests drain all
available frames. No static checker opens sockets.

`gameplay/coop.rs` builds the real local profile, sanitizes remote profiles using
the [native bootstrap helpers](coop-bootstrap-0.115.0.md), and creates each hero
with actual class/race, equipment, talents, account progression and options.
Roster GUIDs, native world GUIDs and compact simulation indices have separate
owners. Listening alone does not activate a party. Remote insertion calls the
real world-assignment port; synchronization follows actual login and initial
world publication. Guest login is allowed before MPQ world loading completes.

Initial publication supplies the current zone environment, ordinary client
login packets, complete class/racial spellbook, action buttons, actual player
fields, inventory, other heroes and already registered world objects. Accepted
state/HUD arriving before replica creation is applied when that replica is
constructed. No readiness is inferred from a handshake or roster.

## Shared simulation and replication

`gameplay/mechanics/coop.rs` advances one world, RNG, clock, actor/boss/pickup set
and spawn queues while swapping each hero's actual private state. The
[party proof](coop-game-party-0.115.0.md) owns per-hero input, targeting, damage,
revive, rewards, terminal and endless contracts. Shared hazards retain their
native target owner; they do not damage every geometrically overlapping hero.
Opening a co-op menu does not pause the shared simulation. Hosting with no
remote hero retains the ordinary local path.

`gameplay/coop_commands.rs` admits received movement through the existing
native floor-recovery owner and dispatches commands against the assigned hero.
Guest movement retains original conditional tails; the host supplies the actual
GUID and relays admitted positions. The production client encoder captures
guest commands. The host observes its ordinary controller stream. Guests never
advance a second AI/combat simulation.

`gameplay/coop_publish.rs` publishes actual create/value/destroy descriptors
before queued movement and casts, then per-hero fields, action bars, inventory,
gear, Seen and native run state. State15 uses its one-second/terminal cadence;
HUD/resource/visual-radius messages retain their independent 0.2-second gate.
Queued event recipients are resolved by stable GUID after member changes.
The [replication contract](coop-replication-0.115.0.md),
[engine inverse codec](coop-engine-packets-0.115.0.md),
[Seen allowlist](coop-seen-0.115.0.md) and
[spell text](coop-spell-text-0.115.0.md) own their individual native evidence.

The [choice/HUD adapter](coop-overlay-0.115.0.md) routes guest selections to the
actual host hero and presents received choices, boss bars, build icons, timers
and meters. The [addon feed](coop-addon-feed-0.115.0.md) supplies actual received
party/revive/resource/run data to the existing FrameXML/Lua consumers. Received
cooldowns, auras and visual spell radii retain their ordinary engine consumers.

End18 clears the guest world and returns to the lobby while retaining TCP.
Guest logout sends Disconnect16 and closes the upstream link through the
[native logout owner](coop-logout-0.115.0.md). Host world teardown notifies peers
and clears assignments. Transport loss has an explicit local-session teardown.
Disconnect retains an abandoned hero in its existing world slot. The native
world vector still permits only four remote rows, including departed heroes;
network capacity and world insertion are separate guards. Repeated pre-run
reconnections can therefore exhaust world admission until that world ends.

## Remaining scope and validation

The requested direct-peer world/bootstrap/simulation/replication source paths
are connected. Their execution is **unverified**: no compilation, compiling
tests, actual TCP session, application launch, multiplayer play, rendering or
controlled original/rebuilt comparison has been run for this integration.
Authored Rust regressions remain uncompiled/unrun. Native/static checks and Rust
syntax parsing are separate evidence and do not establish playable co-op.

Public WebSocket lobby discovery (**#99**) and Host/Code request forms
(**#100**) have separate source/static repairs through the shared service.
Recipient item-description construction is connected, while the guest synthetic
effect-text registry population/identity/lifetime bridge remains unrecovered
(**#101**). Spell/resource base, bonus/talent and auxiliary prose is source-connected;
the native raw-resource-to-FrameXML-cache lineage remains unproven (**#102**).
Broader native alias/type/dependency closure, compilation, live service/session
execution, rendering and parity remain open; packet coverage alone does not
certify those contracts. Global historical catalogs
retain their actual target and must not be treated as current parity evidence.
The [unknown queue](unknown-recovery-0.115.0.md) records each distinct lead's
current native selectors, source boundary and next static recovery step.
The [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), system ledger and #41 retain these
limits independently from the 60/60 partial-module metric.
