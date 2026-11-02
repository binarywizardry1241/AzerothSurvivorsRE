# Relay replay and acknowledgement policy — 0.123.0

Installed EXE: **0.123.0**, 146,228,736 bytes, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [current proof](evidence/0.123.0/relay-load/manifest.json) owns the bounded
client repair discovered while investigating **#257**. It completes the concrete
client defects retained under **#210–#212** and the pending-byte limit portion
of **#198**. Historical [0.120.2 sequencing](relay-sequencing-0.120.2.md) and
[0.120.4 findings](release-review-0.120.4.md) retain their original provenance.

## Client contract and source repair

Current receiver `0x145bdc810..0x145bdcfc3`, sender
`0x145bdd020..0x145bdd615`, queue producer `0x145bdd7f0..0x145bddd77` and service
pump `0x145bd7b80..0x145bdabf2` establish the connected policy. Four journaled
Ghidra queries reuse the existing exact 42,276-byte pick/smoothing subject and
its saved Program; no independent copy of that input or database is required.
Current diagnostic locations identify `relay.rs:134:51` inside the receiver.
The pump calls this receiver for guest peer zero and an admitted host peer,
then calls the sender after its control/ACK work. Sender output uses the selected
existing service transport; allocation, hash-table and transport internals remain
supporting interfaces.

Each 112-byte native peer row has independent queue length, sent cursor and replay
boundary. Relative to the row's end pointer these are `-0x50`, `-0x28` and
`-0x20`; produced sequence, pending bytes, received sequence, last acknowledged
receive and pending control are `-0x38`, `-0x30`, `-0x18`, `-0x10` and `-0x08`.
The constructor zeroes both cursors. The source `coop/relay.rs::Peer` now retains
the additional `replay_end` boundary through the actual shared service lifetime.

- The sender blocks data while control is pending. Only a cursor **below** the
  replay boundary requires positive shared credit and subtracts the payload
  length. A whole replay payload may take credit below zero. A fresh suffix
  bypasses that gate and charge once its preceding replay messages have sent;
  it does not overtake a blocked prefix. The unchanged bucket rate/cap is
  **1,572,864 bytes/second**, refilled through the existing monotonic f64 clock.
- A tag0 payload delivers if its sequence equals wrapping `received + 1`, or
  exceeds that value while no control exchange is pending. Duplicate/older
  values are ignored using these exact unsigned comparisons. A forward gap
  no longer starts the source's old receiver-side control request. Exact-next
  delivery remains allowed during a pending exchange.
- ACK and control sequences clamp to the peer's produced send sequence before
  inclusive prefix draining. Each drained entry reduces pending bytes and
  saturating-decrements **both** cursors. Either control variant then rewinds
  sent to zero, snapshots the retained queue length as the replay boundary,
  clears pending control and its clock, and replies only to a false control.
  Initial alternate-endpoint fallback rewinds only sent; admitted reconnect
  retains its distinct control-pending/clock transaction.
- The connected service pump uses one **2-second** ACK clock, emits only newly
  received progress and retains a **3-second** pending-control retry. A due
  control takes precedence over that peer's ACK; pending control that is not yet
  due may still publish an ACK. Seconds and nanoseconds convert separately to
  f32. The pump resets its global ACK clock when due, including without new
  per-peer progress.
- Queueing increments the wrapping sequence and appends the payload before
  rejecting pending raw payload bytes **greater than 16 MiB**. Exactly 16 MiB
  is admitted. Existing peer removal and guest/host failure consumers remain
  the owners of overflow liveness.

These changes are connected through the existing `session` shared relay owner
and `coop_directory` pump/drain/send paths. No new scheduler, transport protocol,
background server or gameplay substitute is introduced. The separate fresh-party
reset is separately [source/static repaired under #207/#208](fresh-party-0.123.0.md).

## What #257 cannot establish from this artifact

The supplied 0.122.0 item says the improvement applies once the **servers** are
updated, whatever client version is used. The inspected client pump supplies
sender/ACK/replay behavior and calls an existing selected service transport.
The embedded `server/party` path owns the host's game-party admission and game
state; that source is not evidence of the deployed multi-party relay/directory
service's scheduler or capacity change.

No authoritative deployed service source, service executable or hash-bound
before/after scheduling contract is supplied for that external claim. That is
the specific remaining recovery blocker for **#257**. The client repairs above
must not be presented as reconstructing that externally applied scheduling
change, proving server throughput, or proving compatibility with every older
client. No service is started or contacted to infer the missing implementation.

## Static validation and limits

`scripts/check-relay-load.py` verifies the current installed identity,
four owner ranges containing **3,722 exact original instructions**, **81 selected
contract instructions**, four independently read data constants, four completed
Ghidra receipts, raw-input-to-PE mapping and the changed source commitment.
**904 isolated original-instruction cases** pass for replay gating/charging,
unsigned gap admission and wrap, ACK clamp, both saturating cursor decrements,
control reset, the pending-byte boundary, f32 retry timing and ACK progress.
The fixtures use synthetic registers/memory and stop before allocation,
transport and game-payload delivery. Raw-subject decompiler warnings about
outside callees/PIC tails remain in the retained results; selected original
instructions and independently read constants govern the checked branches.

The changed relay source and Session overflow fixtures parse and pass the pinned
formatter check. The Rust regressions cover the changed sequence/replay/ACK
policy and the connected guest-fatal 16 MiB boundary; they remain
**uncompiled and unrun**. Compilation, actual client/network/server scheduling,
rendering, service capacity and original/rebuilt parity remain unverified.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-relay-load.py
```
