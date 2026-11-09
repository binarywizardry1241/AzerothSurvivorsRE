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

### 0.143.0 Join and directory admission

[#163](../CURRENT-STATE.md#gap-163) tracks the wire update for
`installed-game/AzerothSurvivors.exe` 0.143.0, 151,566,336 bytes, SHA-256
`f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`.
The [0.141.1 admission proof](evidence/coop-admission.json) retains its original
target. Masking only address displacements and version/protocol immediates in
its 58-byte gate finds one match in the current `.text` section. Decoding from
the current PE unwind start reaches that match in the `server/party.rs`
diagnostic owner at `0x145e48350..0x145e48ff9`.

| Boundary | Current evidence |
| --- | --- |
| Host Join comparison | `0x145e484f1..0x145e4852b`, file offset `0x5e478f1`, SHA-256 `e7464727e6255ac51330f6ff77c5af1f85c197b8deb2cb7f25803e9370fee8c0`. The guard compares protocol 14 at record `+0x38`, requires seven version bytes at `+0x18`, and XOR-compares overlapping little-endian dwords for `0.143.0`. Mismatches branch to `0x145e48784`. The successful comparison continues at `0x145e4852b` into password handling. |
| Guest Join construction and send | `0x145e4465c..0x145e447a5`, file offset `0x5e43a5c`, SHA-256 `583736ba9c4aa5529c1852986357c4e665e822f0ef79d82ea03ceb00c35f89de`. The constructor stores the same version and protocol 14 at `0x145e44729`, then calls the serializer at `0x145dd7840`. Its zero cell at `0x1473bb584` selects `0x145dd78b1`, writing tag 1, the protocol, and the sized version and password before the connection send. |
| Directory handshake | `0x145e0ad89..0x145e0ae93`, file offset `0x5e0a189`, SHA-256 `844abd0fcae4753eaa7a9572ceb794877efa33a0e752258299c5774923058673`. The constructor stores `0.143.0`, directory protocol 3 at `0x145e0ae08`, and flag 1 at `0x145e0ae44`. Its serializer at `0x14620e960` resolves zero cell `0x147b7c390` to `0x14620e9c3` and emits the tag-1 directory envelope. |

The existing `coop_handshake_check.replay` passed 3,198 comparison cases and
13,362 instruction steps on the exact current gate with synthetic packet
memory. Only protocol 14 and `0.143.0` reached the success continuation. The
[shared source constants](../../crates/azeroth-survivors-re/src/coop/server_party.rs)
still supply protocol 13 and `0.141.1` to the guest Join and host admission.
The directory [connection owner](../../crates/azeroth-survivors-re/src/coop_directory.rs)
reads that same stale game version, with directory protocol 3 supplied by the
[service encoder](../../crates/azeroth-survivors-re/src/coop/service.rs). A
selected repair can align the shared constants and fixed Join wire fixture
with this proof. The gate replay ends before password handling. Compilation,
sockets, deployed service acceptance and original/rebuilt comparisons remain
open.

### 0.143.0 Hyper Mode admission

[#63](../CURRENT-STATE.md#gap-63) and [#325](../CURRENT-STATE.md#gap-325) share
the run selection dependency. In the same 0.143.0 image, the
`server/party.rs` owner `0x145e4c990..0x145e4cf32` sanitizes the Hero profile
before its first-profile gate. The selected gate `0x145e4cbe3..0x145e4ced1`
starts at file offset `0x5e4bfe3` and has SHA-256
`6b2f84c99c97ed439e6f71cd5894d5304fdd61df0ea2c7a667811721953845c2`.
It enables the added eligibility check when the host selection byte at
`+0x18d8` is 1 and the host account's earned-key search finds `heroic:naxx5`.
For a guest whose zone and capped rank qualify, the gate finds that key's
catalog ordinal and scans the guest's sanitized eight-byte achievement rows
for the matching u16 ordinal. The key comparison reads the 12 bytes at
`0x1473b688e`. A missing match follows the existing refusal route.

When the zone and rank qualify but the achievement does not, the refusal
builder `0x145e47310` constructs `locked:hyper` at `0x145e4733b`. The send
owner `0x145e47d80` selects variant 2, which the game serializer's table
cell `0x1473bb58c` maps to the tag-3 writer at `0x145dd7b4f`. The guest
status owner checks the exact 12-byte reason at `0x140222517..0x14022253e`
before resolving its localized sentence. The directory list has a separate
display reason. `0x1402279bd..0x1402279cf` matches `hyper` and selects the
localized `You haven't opened Hyper Mode yet.` label.

The reconstructed [first-profile gate](../../crates/azeroth-survivors-re/src/gameplay/coop.rs)
uses zone and rank. The [co-op view](../../crates/azeroth-survivors-re/src/coop_ui.rs)
would parse `locked:hyper` as a zone key. The source already carries dated
Hero achievements through [the profile bridge](../../crates/azeroth-survivors-re/src/coop_profile.rs).
Trace the current writer, reader and sanitizer around that carrier before
changing the codec.

The host profile builder at `0x145e41b40` stores the selected-and-earned
mode at output `+0x49`, capacity at `+0x4b` and capped rank at `+0x4c`.
Directory serializer `0x14620e960` selects Host tag 3 at `0x14620ec17` and
UpdateProfile tag 4 at `0x14620ef0b`. Their profile suffixes read the
corresponding record bytes at `0x14620ee9a..0x14620ef0b` and
`0x14620f065..0x14620f0d6` and write capacity, rank and Hyper Mode as three
consecutive bytes. The source service profile writer ends after rank.

The incoming directory decoder `0x14620f890` dispatches tag 20 through
cell `0x147b7c3bc` to `0x14620f901`. Its base rows are `0xc8` bytes and
initialize Hyper to false at `+0xc4`. The optional capacity and rank vectors
precede a third optional vector at `0x146210570..0x14621068f` (file offset
`0x620f970`, SHA-256
`f70ab377114fa246a14e394cbf2c8c65aa70df8419f97f76492b4d84652098fb`). Each
available byte sets the corresponding row's Hyper flag by a nonzero check.
Rows without an extension byte keep the false default. The directory
projection reads that flag at `0x145dad893` and passes it with the rank to
the difficulty label helper `0x145ea8260` at `0x145dadeea`.

Host publication sets the roster record's Hyper byte at `+0x38` and rank
at `+0x39` in `0x145e2393c..0x145e23958`. The tag 17 serializer at
`0x145dd8880` writes the rows, then sized zone, rank and Hyper at
`0x145dd8c56..0x145dd8c81`, before the country and inspection fields. The
matching reader's cell `0x1473bb52c` selects `0x145dd23a2`. It reads the
sized zone, rank byte and nonzero boolean in that order at
`0x145dd3f0b..0x145dd3f43`. A missing Hyper byte clears decoder validity,
before the reader considers the optional country and inspection fields.
The party projection reads the received selection bytes at
`0x145df5549..0x145df555b` and calls the same difficulty label helper at
`0x145df583b`. The helper appends localized `Hyper` when the mode is set.
The reconstructed directory and party receive records and their views carry
rank but lack the mode byte and label.

For world entry, `0x145e35d35..0x145e35de6` passes capped rank and earned
Hyper to the peer filter. A journaled Ghidra query for `0x14603ec70` and
the original x64 call operands establish a `0x8a0`-byte peer stride, active
and assigned-hero gates, a predicate call to `0x145dcf070`, and rejection
rows with peer index and zone/rank eligibility. The consumer at `0x145e35e37`
uses the same refusal builder for each returned peer. Follow the accepted
peer path from `0x145e35ec3` into authoritative run mode and guest bootstrap.
Actual clients, service behavior and original/rebuilt comparisons remain
open. The relay questions under [#206](../CURRENT-STATE.md#gap-206) and
[#257](../CURRENT-STATE.md#gap-257) still require service evidence.

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
