# Cooperative relay sequencing

Selected installed EXE SHA-256:
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
The [bounded proof](evidence/relay-sequencing/manifest.json) connects the
newly observed `coop/relay.rs` diagnostic to an actual service-input contract
and the reconstructed source. The discovery/source-discrepancy observations
retain their reviewed revision `5799d44b`; the [implementation proof](evidence/relay-implementation/manifest.json) owns the repaired live paths below. Neither proof establishes which release introduced the native layer.

## Current native boundary

The service pump `145bf6e00..145bf9737` forwards its decoded relay-event case 6
into receiver `145bfac90..145bfb3cc`. The call at `145bf796a` admits guest peer
zero only while the guest flag at `+1e0` is active. The call at `145bf849a`
follows the existing host peer-map lookup. These are original direct CALLs,
independently checked against the current bytes; the Ghidra caller query's
empty result before seeding the pump did not imply that callers were absent.

The receiver rejects fewer than nine bytes, reads a byte tag at zero and an
eight-byte little-endian sequence at one, and handles three tags:

- Tag 0 owns/copies the payload after byte nine. Only the next sequence advances
  receive state and delivers that payload into the guest or selected host queue.
- Tag 1 enters the acknowledgement/drain path.
- Tag 2 also requires byte ten and retains its nonzero flag before the
  control/drain/reset path.

Other tags and truncated headers return. The out-of-sequence route retains a
three-second control-response gate. Its clock, replay and lifecycle contracts
are implemented below; this original discovery boundary remains separately
hash-bound. The receiver's diagnostic
sites `145bfb399` and `145bfb3b8` identify `relay.rs:118:51` in the native
queued-message failure branch. Its enclosing 1,852-byte unwind span includes
six bytes outside the three Ghidra body intervals; these are kept separate.
Decompiler warnings about PIC construction and merged heap-free tails are
retained in the saved result and do not establish an invented source body.

Outer-send helper `145bf6d20..145bf6dc8` calls the inner encoder `145bf5ed0`,
wraps the result in outer Relay variant 5 and calls the selected primary or
secondary transport callback. That matches the existing source's outer service
boundary; it does not recover all inner message production or the complete
outer protocol anew.

## Original source discrepancy and permanent findings

At the reviewed discovery revision, the `coop_directory.rs` Bytes dispatcher
forwarded the outer payload to `Session::service_receive`, which queued it
directly. Outgoing
`Connection::send` creates `RelayCommand::Send` with raw game-message bytes,
and `coop_directory::send_relay` wraps them unchanged in `ClientMessage::Relay`.
The outer codec and Session ownership were already present; those routes lacked
the current inner tag/sequence/control layer.

**#197** records the independently actionable missing module-contract dimension
for the newly observed relay diagnostic. The current service-input, bounded
receiver and source-boundary proof supplies that registration. It establishes
partial module correspondence, with substantial work remaining.

**#198** owns this inner relay sequence/control connection. Its source repair is
implemented in `coop/relay.rs`, `coop/relay_lifetime.rs`, `coop/session.rs` and
the actual `coop_directory.rs` frontend. Ordinary game messages now cross the
inner layer in both directions; the outer service codec remains the existing
owner. Compilation, network operation and original/rebuilt parity remain open.

## Implemented sequence, replay and clock contract

Encoder `145bf5ed0` and its offset table prove the three little-endian wire
shapes: tag0/u64/payload, tag1/u64, and tag2/u64/bool. Unrecognized tags and
truncated headers are ignored; ACK/control suffixes are unused. Service peer
zero is reserved for the active guest route, including when a host has a map
entry numbered zero. Nonzero incoming peers require the existing host row.

Each peer keeps monotonically wrapping send and receive sequences, its pending
payload deque, total pending bytes, sent cursor, last ACKed receive sequence,
control-pending flag and optional control clock. Only the exact next data
sequence is delivered. Older/duplicate data is discarded; a forward gap sends
tag2(false, last received sequence), subject to the three-second control clock.
ACKs drain pending sequences up to and including the acknowledged sequence,
subtract bytes and saturating-decrement the sent cursor. Either control variant
drains the same acknowledged prefix, resets the sent cursor to zero, clears the
control flag and removes its clock. A false control additionally replies with
true and the local receive sequence. Remaining messages replay with their
original sequence IDs; they are never newly numbered on retransmission.

Producer `145bfbc00` increments the send sequence and appends before applying
the **4 MiB** limit to raw unacknowledged payload bytes. Overflow removes that
peer's relay state. It clears a host peer's alive flag; peer0 sets the independent
guest-fatal flag, which overrides even a nonempty delivered queue. Ordinary
remote closure still preserves its recovered queue-drain behavior.

Sender `145bfb420` uses one service-wide **1,572,864 bytes/second** token bucket,
initially full and capped at the same amount. A whole packet may start whenever
credit is positive, and its raw payload length can take credit below zero;
inner/outer headers do not consume this budget. The queue retains each sent
message until acknowledgement. A peer with pending control sends no data.
The service-wide ACK clock sends only new receive progress at **0.5 seconds**;
control retry uses **3 seconds**. The native ACK/control comparisons convert
seconds and nanoseconds separately to f32; token refill uses f64. Source uses
monotonic `Instant` clocks rather than game/simulation time. The shared sender
and ACK clock live in the frontend's service resource across party sessions.

Service peer state follows the service lifetime, independently of Game/Session
handles. The guarded native variant4 (wire24) first replaces or inserts the host
endpoint, resets the corresponding inner row and then publishes the peer ID to
the listener backlog. Both new and reused IDs follow that reset. Creating a
handle does not clear an endpoint, sequence counter, pending queue or input.
Shared host endpoints, received queues, reconnect flags and listener IDs now
survive Off mode; the host Session accepts that backlog through its ordinary
PartyServer path. Unknown IDs remain ignored. Service31/32 and nonzero data
therefore update the same state even before a host handle exists.

Guest construction `145b21850`, guest close `145c053b0` and outer command
wrapper `145bfdf90` contain no inner-row reset/removal. Guest close submits Leave to the primary and any selected secondary before
closing the secondary; that explicit guest effect remains separate from a host
Leave. Guest sequence state, fatal-overflow byte and received inbox survive
local Leave and replacement
handles. The active guest receiver consumes and sequences input while Off,
buffering admitted payloads in that service-owned inbox. ACK/control/replay
output also drains without an active Session. A fresh service resets these
owners; wire24 resets the selected inner row, while Closed27 stops subsequent
guest admission without discarding buffered input.

Host close `145c045b0` is distinct: an active peer sends its primary Kick, drains
the sender when a secondary exists, sends the secondary Kick, then removes the
host endpoint and inner row. The extra drain uses newly refilled credit and
can send previously unsent pending data; it is absent on primary-only close.
The source transport consumer preserves that sequence. Inactive host close
removes state without issuing a Kick. The service-level secondary reset also
runs while Off and clears all shared peer reconnect flags exactly once.

The selected secondary's lifecycle is a necessary reset producer. The existing
frontend now retains its authentication inputs and follows the recovered pump:
connecting is allowed through **8 seconds**, silence while connected through
**15 seconds**, secondary heartbeat at **5 seconds**, failed attempts spaced by
at least **2 seconds**, with an active retry deadline of **45 seconds**. Every
binary arrival refreshes silence, but only a valid non-refusal event admits
retries and clears the retry marker. Refusal closes the selected secondary;
a repeated refusal after admission is not forwarded again. The deadline is
checked on an unhealthy socket, matching the native branch rather than an
independent wall-clock teardown.

Reopening closes the old socket, authenticates the replacement and sends its
heartbeat. It clears peer reconnect flags, marks each existing inner peer as
control-pending, stamps its control clock and emits tag2(false). Admission of a
valid secondary event releases the transport gate; peer control exchanges then
release their individual replay gates. Underlying socket closure during a
permitted retry preserves the party. Only the native permanent-failure state
tears it down. The separate local retry getter and cached transition are
exposed to the existing cooperative notice consumer; remote wire31/32 flags
retain their independent ownership under #199/#200.

Source tracing also preserves immediate guest-handshake ordering, buffers only
admitted game payloads, drains encoded bytes before close commands, keeps TCP
framing separate, and clears obsolete secondary metadata on teardown. Old
unsequenced test inputs now carry real inner envelopes. Rust unit cases cover
sequence admission, malformed inputs, replay/reset, ACK and token boundaries,
overflow, failure/lifetime and the live Session/frontend hooks. These cases
include **24 authored cases**, which are **not compiled or executed**.

## Separate outer control messages

The current parser `145e0b690` has a proved thirteen-entry relative table at
`1476773bc`, reached by subtracting 20 from the wire tag and guarding at 12.
Its actual table address and byte hash are retained in the manifest; no adjacent
data is used to infer the domain. Two current cases are absent from the actual
`directory_wire::decode_response`, which admits tags 20 through 30:

| Finding | Current native parser and dispatch | Connected source |
| --- | --- | --- |
| #199 Wire 31 | Case `145e0b74e` requires five bytes, reads a little-endian u32 peer ID at one and constructs variant `800000000000000b`. The existing pump writes the guest's `+1e2` byte from the active-guest flag for peer zero, or sets an admitted host peer's second flag. | Decoder/dispatcher now connect temporary reconnect state to the sampled native getters and actual localized world/recipient chat; [owning proof](service-peer-flags.md). |
| #200 Wire 32 | Case `145e0b791` has the same five-byte/u32 shape and constructs variant `800000000000000c`. The pump clears the corresponding guest or admitted host peer flag. | The separate clear path preserves peer/queue lifetime and emits the recovered return notices; selected-relay reset uses the same flag owner. [Owning proof](service-peer-flags.md). |

The guest store is `145bf7afa`; the existing-host peer store is `145bf7cfe`.
Unknown peers are not created by these handlers. Mandatory truncation rejects
the record; the parser accepts an unused suffix. The flags' stronger names and
operational meaning were initially unproved. The subsequent reader/caller and
packet recovery establishes temporary reconnection semantics, independently of
ordinary peer departure, and connects their actual presentation consumers.
No release-introduction claim follows from their discovery.

## Verification and limits

The discovery checker verifies **seven native ranges / 712 instructions**,
one thirteen-entry guarded table, seven completed durable query receipts and
five current source observations:

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-relay-sequencing.py
```

The full-image inventories separately retain exact incoming selectors and
residual ownership. All query results reuse the compatible shared full-PE
Ghidra Program, with saved plans, journals and target/profile commitments.
The implementation checker additionally verifies **25 ranges / 3,917 instructions**,
16 completed Ghidra receipts, seven constants, three tables, 81 instruction
anchors and four source bindings, including the current encoder/producer/sender,
wire24 reset/listener publication, close/construction and liveness interfaces:

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-relay-implementation.py
```

Pinned rustfmt parses the changed Rust source without compiling it. These static
checks establish the bounded recovered/source contract, separately from broader
cooperative-module completeness, compilation, actual network/file/UI delivery
and controlled original/rebuilt parity. No compilation, compiling tests, game/client/network/
server operation or installed-input modification occurred.
