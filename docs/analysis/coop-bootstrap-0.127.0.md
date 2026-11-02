# Joining and initial world publication

This bounded #203 assessment uses installed **0.127.0**, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [current manifest](evidence/0.127.0/coop-bootstrap/manifest.json) binds the
actual guest producer and host callback queries, canonical shared frame,
handler and serializer queries, exact instructions and source connections.
The [static check](evidence/0.127.0/coop-bootstrap/static-check.json) records
482 original-instruction cases. Historical snapshot packet fields retain their
[0.115.0 provenance](coop-bootstrap-0.115.0.md); current producer/queue ordering
does not relabel every older packet or certify the full client engine.

The manifest binds the two decoded-enum range descriptors used here and their
canonical shared assembly files directly. Other scopes may extend the broader
dispatch manifest without changing this proof; changed selected native bytes,
assembly or query receipts still fail. No assembly extract is duplicated.

The actual guest producer is the `PLAYER_LOGIN` opcode case. At
`145bc27f9..145bc2814`, the native opcode domain subtracts `0x36`, admits indices
0 through 7 and dispatches index 7 (`0x3d`) through table `147085c1c` to
`145bc298e`. This is an opcode, rather than a rendered-world-ready callback.

`145bc298e..145bc2a42` admits unsigned application modes at most 1 with a
nonzero accepted canonical ZoneKey pointer at `+1190` (length `+1198`).
It sets the Sync-requested flag `+11bd`, flushes already pending engine packets,
serializes the descriptor at `1470835a0`, then calls the upstream send port.
That descriptor is signed-minimum plus 5; serializer table `14771f0c4`, index 5,
selects `145d15b7d`, which writes wire tag **6**. An already set `+11bd` does not
add another admission gate. This establishes the actual Sync producer without
inventing a world-loading acknowledgement.

The current manifest's shared handler/frame query receipts retain the 200-frame
per-client budget and decoding boundary. Joined state
`+4e4` is checked before ordinary message dispatch. The Sync arm at
`145bd6904..145bd6947` additionally requires a nonzero assignment and zero
synchronized byte `+4e5`, then calls `145bd31f0`. A duplicate request after
completion does not rebuild another initial stream.

The callback `145bd31f0..145bd3690` checks server mode 3, client-index bounds,
assignment variant 1 and application `+10` unequal to variant 2. The precise type
name of that last variant remains unestablished supporting representation; its
raw guard is retained. The source uses the actual present-world owner and an
assigned hero, rather than inventing a semantic name for the native enum.

The callback builds the requesting actor's initial packets, appends the other
heroes' create/name pairs and raid-target packet, and serializes/queues each
engine message as wire tag **7**. Only after all queue appends does it set
`client+4e5`, then refresh party metadata. The checked cases vary snapshot size,
other-hero count and selected hero; every serialization sees the flag clear and
the metadata callback sees the complete queued stream and the flag set.
Snapshot helpers, packet serialization and allocation are declared seams in
these queue-order tests, not substitutes for their full recovered semantics.

The live source already connects these stages:

- `gameplay/coop.rs::bootstrap` constructs the accepted guest replica, calls the
  existing `LocalClientSession::begin` port and sends Sync when that actual
  session is active. `begin` publishes both the player and active state;
  `follow_session` maps them to the real local client's InWorld lifecycle.
  This occurs independently of `ZoneWorld.ready` and its loading cover.
- `Session::next_host_event` admits Sync only for a joined, assigned,
  unsynchronized client. `gameplay/coop.rs::synchronize` requires the real run,
  admitted hero, MPQ creation metadata and actual world objects to construct the
  stream. `Session::synchronize` queues every packet before committing the
  `PartyServer` synchronized flag; failed queue admission does not set it.
- Successful synchronization calls the existing party-frame fanout afterwards.
  The early unsynchronized guard in `coop_publish.rs` precedes the operations
  that drain recipient-owned engine data. Ordinary post-sync engine routing
  retains its synchronized recipient gate.

Ordinary packet-loss retry, acknowledgement, gap requests, buffering and timeout
fallback belong to the now connected [current relay contract](relay-load-0.127.0.md),
including a lost final Sync or snapshot packet. The selected producer/handler/
callback does not establish an additional application ACK or retry deadline;
none is added to the source. The transport repair and the existing bootstrap
connections resolve the feasible selected joining/replay work without requiring
a running server or a fabricated timeout.

Run `python3 -B scripts/check-coop-bootstrap.py --proof
docs/analysis/evidence/0.127.0/coop-bootstrap/manifest.json` to verify the exact
current receipts, opcode/serializer joins, 482 native cases and live source
connections. Reconstructed Rust is not executed. Compilation, real poor-network
joining, initial object appearance, source-preserved packet-field applicability
and controlled original/rebuilt comparisons remain separate under
[#203 in the verification register](../verification-needed.md#gap-203).
