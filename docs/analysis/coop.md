# Co-op mechanics

This guide owns the reconstructed co-op contracts from lobby discovery through
run settlement. The source and recovery register owns [#63](../CURRENT-STATE.md#gap-63)
and related findings. The [verification register](../verification-needed.md)
owns build, service, gameplay and parity checks. An exact proof applies to its
recorded executable, instruction ranges and inputs.

## Lobby, admission and transport

The public directory uses a binary WebSocket service. Directory and game
handshakes have separate protocols. The game handshake checks the exact admitted
version and the password before assigning a peer. The directory handshake carries
its staff key separately. The shared version field and checks live in the co-op
server-party and service source. Protocol identifiers and field order are wire
contracts. EXE identity and build-specific values belong in the underlying proof.

The directory publishes real lobby rows to the browser, including capacity,
difficulty, rank and lock reason. Local filtering does not change service rows.
Host and Code forms send through the same service. Host publication supplies the
name, password, description, visibility and capacity. An admitted guest sends the
inner handshake before requesting the game handle. A refusal and a service
transport failure have separate presentation paths. Closing the service clears
pending form credentials.

The direct-session driver uses TCP and bounded compressed frame batches. The
game handles its own typed envelopes and private/shared engine routes. Host input
is admitted by connection identity and dispatched against the assigned hero.
Relay selection and primary directory state are separate owners. The directory
samples primary status before pumping events, then evaluates failure against the
resulting relay state before accepting new form requests. A connecting primary
expires after strictly more than eight seconds. A surviving relay can preserve
an active role. Once the terminal gate admits departure, role teardown precedes
service Leave and stop. The original instructions prove ordering at the writer
boundary. Live delivery needs separate verification.

## Joining, readiness and world start

A handshake, profile row or open transport does not establish world readiness.
The host sanitizes the admitted hero profile and assigns the hero to the actual
world through the ordinary client engine. The initial publication includes the
zone environment, login state, spells, action buttons, fields, inventory and
already registered actors. Previously received state can apply once the target
replica exists. Roster identities, simulation slots and engine GUIDs have
separate lifetimes.

Ready Check is owned by the hosting lobby. It starts with the ordered admitted
roster and at least one guest. A response binds to the authenticated connection
and updates its first pending answer. Cancellation or a changed roster takes
precedence over the answer outcome. A pending check expires at thirty seconds.
The start path checks the result and live roster before entering the run.
Inspect and hero-refresh messages have separate admission and presentation
owners.

## Shared simulation and replication

The host owns one clock, RNG, world, actor set, pickup set and spawn queue.
During party updates it seats each hero's private talents, gear, effects and
inputs. A guest consumes replicas and sends admitted commands. It does not
advance a second world simulation. A co-op menu does not pause the shared run.
Without a remote hero, the host uses the ordinary local path.

The publisher orders create/value/destroy before movement and cast packets,
then emits the appropriate recipient state. State15 has a per-peer one-second
period. Effective terminal state can publish between periodic updates without
moving the next deadline. A personally downed hero in a continuing party does
not take the terminal fast path. HUD, resource and visual updates have separate
admission and cadence. The engine bridge preserves the private and shared packet
lanes, movement correction uses native floor recovery, and queued recipient
events resolve their stable GUID before dispatch.

Member identities also gate downed and revive state, party frames, hazard
occupancy and raid-target requests. Use the existing FrameXML and
[addon API](../addon-api.md) consumers. Recipient-local positions, effect clocks
and meters come from the admitted hero context. The downed-party GUID report and
its runtime verification remain separately tracked.

## Choices, progression and rewards

The host owns active offers and applies picks to the addressed hero. During a
choosing HUD update, a guest with no retained choices requests a resend after
three seconds. The resend returns the authoritative offer or Resume without
advancing the offer ID. Leaving the choosing phase clears the pending retry.
Dismissal alone does not permanently blacklist an authoritative repeated offer.

The party settlement path carries shared run history and recipient-local
rewards. Zone, phase, identity and packet bounds gate the individual receivers.
The shared Codex membership feeds account achievements and guest Seen admission,
with separately retained explicit receiver allowances. Account achievement
progress counts only displayed eligible keys. Historical or unknown saved
entries retain save compatibility without expanding those achievement totals.
Item, spell and effect prose have their own request and delivery owners. A
partially connected text registry does not establish full guest text parity.

## Interruption, departure and settlement

Transient relay interruption and explicit departure have distinct paths. A
permanent departure settles the admitted cached run, submits the role's game
departure, then closes the applicable transport. Guest End Run can clear the
world and return to the lobby while the service remains connected. Host world
teardown notifies peers and clears assignments. A departed hero can retain a
world slot, so the four-remote world cap is distinct from current connection
count. A returning transport does not by itself create a new hero.

## Evidence and open checks

The maintained source entry points are
[co-op protocol and services](../../crates/azeroth-survivors-re/src/coop/mod.rs),
[world integration](../../crates/azeroth-survivors-re/src/gameplay/coop.rs),
[host publication](../../crates/azeroth-survivors-re/src/gameplay/coop_publish.rs)
and [party simulation](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs).
Check admission, dispatch, party, publication and settlement against their
recorded source and proof in the finding registers. The
[historical proof index](artifact-history.json) identifies the prior exact
reports. Read a specific report from Git through `scripts/artifact_history.py`.
Historical proofs preserve their original producer and target identity.

Static checks leave actual sockets, lobby and relay operation, world entry,
multiplayer rendering, save lifecycle and original/rebuilt parity open.
