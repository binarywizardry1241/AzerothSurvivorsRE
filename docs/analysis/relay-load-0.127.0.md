# Relay loss recovery — 0.127.0

This report owns the bounded source/static repair of **#198** for the installed
0.127.0 EXE, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/relay-load/manifest.json) binds current original
owners, selected instructions, dispatch tables, data and five completed
journaled Ghidra queries. [0.123.0 recovery](relay-load-0.123.0.md) retains its
original provenance; its forward-gap delivery and two-second ACK policy are
superseded in the current client.

## Current transport contract

Native receiver `145cbd180..145cbe33c` parses a nine-byte tag/u64-sequence
header. Tag 0 carries data, tag 1 acknowledges a prefix, tag 2 carries the
control boolean, tag 3 requests an inclusive missing range, and tag 4 carries
receive progress plus the highest sequence already sent. Tag 2 requires ten
bytes; tags 3/4 require seventeen. Unknown tags and shorter records are rejected.
The current raw receiver decompilation stops at the first indirect table.
The retained tables at `14771ce20/14771ce34` and exact original instructions
bind the parser variants and peer-state consumers independently.

Each peer now retains an ordered receive buffer, its raw-payload byte count,
received high-water mark and separate gap/request clocks. During pending control
only a sequence greater than wrapping `received + 1` is rejected immediately.
Otherwise the high-water mark advances to the maximum observed sequence.
Duplicate/older or already-buffered data lowers the ACK cursor to
`min(existing, sequence.saturating_sub(1))`, allowing a lost ACK to be sent again.
It never redelivers that payload.

An exact-next packet delivers, then drains every contiguous buffered successor
in ascending sequence order. A forward gap buffers its packet. Missing-range
helper `145cc1c30..145cc1e87` requests from wrapping `received + 1` through the
first buffered key minus one, or through the advertised high-water mark when
there is no buffer. The first request is immediate; retries require at least
**0.6 f32 seconds**. Ordinary packet loss therefore requests retained sent data
without requiring a transport replacement or skipping the hole immediately.

Native recovery also has explicit bounded fallbacks. Buffered raw payloads
**greater than 8 MiB**, or a gap lasting **strictly more than ten f32 seconds**,
flush the ordered buffered suffix and advance receive progress. An advertised
tail with no buffered data is skipped only after that same strict ten-second
boundary. These fallbacks, timer resets and unsigned wrap comparisons are
preserved in source; the repair does not promise indefinite lossless retention.

ACK/control progress clamps to the produced send sequence before inclusive
prefix draining. Helper `145cc1a30..145cc1c27` subtracts raw pending bytes and
saturating-decrements both sent and replay cursors for each drained packet.
For ACK/control records, only actual draining refreshes the send-progress clock.
A range request refreshes that clock when received. Control preserves the
retained receive buffer, rewinds the send cursor, captures the pending length
as the replay boundary and replies only to a false control.

A tag-3 reply clamps its high endpoint and scans **only the sent prefix** of
the pending deque before filtering by the inclusive requested sequence range.
The receiver writes the sent cursor into the range iterator's count at
`145cbda34..145cbda38`; iterator `145bebb40..145bebcbc` consumes that count while
searching both deque spans. While no raw bytes have accumulated it permits a matching payload even when
larger than **256 KiB**, and stops a later payload when the accumulated
raw length would exceed 256 KiB. Exactly 256 KiB remains admitted. Unsent fresh
queue entries cannot be pulled into replay by a wide request.

## Pump, source and object consumers

Service pump `145cb7780..145cbae3c` keeps the native order: a due pending
control takes precedence; the global **one-second** ACK cycle can advertise a
sent tail or ordinary receive progress; an unblocked peer then requests a gap
and retries its oldest sent payload after **five seconds** without ACK progress.
The control retry remains **three seconds**. Seconds/nanoseconds convert
separately to f32 at their actual comparisons. A due global ACK clock resets
even when no peer has new receive progress.

Sender `145cbe820..145cbed1e` retains the service-wide f64 bucket at
**1,572,864 bytes/second**. Only entries before the replay boundary require
positive credit and subtract raw payload length; an admitted whole payload can
leave negative credit. A fresh suffix keeps the native bypass but cannot pass a
blocked replay prefix. Queue owner `145cbee90..145cbf611` appends before rejecting
raw pending payload bytes **greater than 16 MiB**; exactly 16 MiB is allowed.
Existing host/guest failure consumers retain overflow ownership.

`coop/relay.rs` now implements those current peer states, packet variants,
replay requests, ACK clocks and limits. Its receive API returns all newly ready
payloads. Both `service_guest_receive` and `service_host_receive` extend their
existing service-owned inboxes in that order. `Connection::receive` pops the
front; `Session` decodes each frame and appends its messages in order.
The existing `NativeMessage::State` validator and EngineCommand path continue
to consume those messages. Engine packets reach the real inbound queue and its
existing enemy/game-object handlers, including chest updates. They receive the
recovered ordered payload stream; no replacement object model was introduced.

This traces the source input/state/output connections. It does not newly certify
every State field, engine opcode, replica consumer or original-game object
interaction. Their independently owned recovery/provenance limits remain.
The externally applied service-capacity claim under **#257** remains separate
from the client artifact and this source repair.

### Reconnect reply ordering (#213)

The retained pump calls the receiver for guest and host traffic at
`145cb7ed7` and `145cb9161`. Within that receive call, the control/missing-range
reply and the requested-payload loop submit to the shared writer `145cb76a0`
at `145cbdc3e` and `145cbdcfe`. The historical
[0.123.0 control-reply proof](coop-reconnect-0.123.0.md#permanent-departure-and-source-repair)
also binds direct submission before the next event.

The directory response handler now drains its staged inner receive replies
after either guest or host receipt, before handling another service event or
polling selected-secondary retry. Deferring those replies to the frame's final
drain could submit an old worker's reply to its replacement and interleave it
with the new connection's authentication and control exchange. Retry admission,
pending replay and the fresh-party reset keep their existing source owners.
This source repair uses the retained 0.127.0 contract. Applicability to the
installed 0.139.2 SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`
and actual socket delivery remain unverified.

## Static checks and limits

Run the existing checker with the current proof explicitly:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-relay-load.py --proof docs/analysis/evidence/0.127.0/relay-load/manifest.json
```

The checker preserves its historical mode and records its previous source
commit in the current manifest. Current replay passes **2,220 isolated
original-instruction cases / 94,606 steps**, covering packet/tag bounds,
control admission and wrap, duplicate ACK, clamps, sender gate/charge, the
16-MiB boundary, full inclusive ACK draining across both deque spans, sent-prefix
range filtering and the 256-KiB boundary, first/missing-clock gap requests,
0.6/1/3/5-second thresholds and strict buffer/tail timeout boundaries.
It verifies **720 selected instructions**, current native owner hashes, all five
query/input receipts, exact constants/tables and bounded source connections.
The [result](evidence/0.127.0/relay-load/static-check.json) records these counts.

Fixtures supply synthetic peer/queue state, one-leaf receive-map state and
explicit monotonic timestamps/deltas. Deallocation is opaque, and range
iteration stops before payload allocation/copy. No sockets, service, game
packet decoder or reconstructed Rust executes in these fixtures. Authored Rust
regressions separately cover reordered object payloads, lost final packets/ACKs,
reconnect buffers, retries, limits and request boundaries; they remain unrun.

Compilation, actual client/network/server execution, service performance,
object presentation and original/rebuilt parity remain unverified. The evidence
establishes this bounded contract and connected source repair, rather than
complete native-module recovery or operational network correctness.
