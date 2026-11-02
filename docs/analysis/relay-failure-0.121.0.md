# Relay-unreachable failure provenance — 0.121.0

Installed target SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`
(146,088,960 bytes). This report owns the source/static repair for **#216**.
The [current proof](evidence/0.121.0/relay-failure/manifest.json) binds the actual
guest getter, shared owner, terminal selector and admission/refusal flag
producers. The [selected transport proof](relay-policy-0.121.0.md) owns selected
configuration installation, terminal transport failure and their current native
state producers. Historical [0.120.5 recovery](release-review-0.120.5.md) retains
its original target; current addresses, fields, producer/consumer relationships
and source wiring establish this bounded correspondence independently.

## Guest terminal reason

The current guest vtable at `0x1476634f0` selects failure getter `0x145c64be0` at
slot `+0x48`. It reads selected relay presence, failed and prior-admission state
from shared owner `+0x78/+0x159/+0x158`, returning
`selected && failed && !admitted`. Guest receive `0x145c64e7b` supplies shared
owner `+0x18` to the pump, binding those fields to its live state producers.

Current frame `0x145b15efc..0x145b15f40` first asks guest liveness. A disconnected
guest asks that failure getter, selecting the exact relay-unreachable reason or
the ordinary host-left reason before the shared terminal transition.

The service now publishes this failure provenance through
`Session::service_relay_initial_failure`. The secondary failure closes peer zero
while retaining the selected configuration/lifetime; the same directory poll
then publishes the predicate before `CoopSet::Network` runs. The terminal runtime
therefore preserves relay-unreachable instead of replacing it with host-left.
An admitted relay's eventual failure, an actual host departure, a cleared selected
relay and direct TCP continue to use the ordinary branch. An explicit inner
handshake denial retains its higher-priority refusal handling. Localized display
uses the independent exact-key [#217 consumer](relay-locales-0.121.0.md).

## Static validation and limits

`scripts/check-relay-failure.py` verifies five exact instruction ranges,
two durable Ghidra receipts, the current guest vtable and the shared transport
producer proof. **24 original-instruction cases** pass: eight selected/failed/
admitted combinations and sixteen actual guest getter-to-terminal-reason
combinations, including live guests that publish no terminal reason. Source
checks bind the same-poll provenance handoff, preserved selected lifetime and
configuration, ordinary host-left path and explicit denial priority.

The fixtures use synthetic memory, uncontended/unpoisoned mutex state and
liveness/terminal-transition interface seams. Changed Rust parses through the
pinned formatter. One additional Rust regression is authored and remains
uncompiled/unrun. Compilation, actual ECS/worker/socket timing, client/server/
game/network operation, localized rendering and original/rebuilt parity remain
unverified. No client, server, game or relay service is started.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-relay-failure.py
```
