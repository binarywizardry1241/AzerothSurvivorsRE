# Service peer reconnection controls — 0.120.2

Target: installed read-only EXE, 145,484,288 bytes, SHA-256
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
Findings **#199/#200** own the two service messages; current completion and
remaining parity requirements belong to [verification-needed](../verification-needed.md).
The [core manifest](evidence/0.120.2/service-peer-flags/core.json) adds exact
readers, reset and parser-finalization bytes to the canonical
[initial relay proof](relay-sequencing-0.120.2.md). It references the original
parser/writer extracts rather than duplicating their bytes.

## Wire and state contract

Service tag31 carries a little-endian u32 peer at offset1 and sets temporary
reconnection state. Tag32 has the same shape and clears that state. Both require
the five-byte prefix and accept unused trailing bytes. The guarded parser at
`145e0b690` constructs variants `800000000000000b/c`; its common finalizer at
`145e0c0ab` rejects a truncated required field.

Peer zero selects the service's guest flag at `+1e2`. Tag31 copies active-guest
state at `+1e0`; tag32 stores zero. Nonzero IDs update only existing host-map
rows, writing the second flag at row-end minus7. They do not create unknown
peers, alter the separate alive byte at minus8, clear received packets, send
Leave/Close or perform actual peer departure.

The guest getter `145c05020` requires an enabled handle and reads the shared
flag through Arc+`1fa` (service+`1e2`). The host getter `145c03f90` looks up the
handle's peer ID and returns alive AND reconnecting. Reopened host IDs replace
the shared row, so older handles see the replacement. The selected-relay reset
at `145bf8ed2..145bf8f4e` clears guest and every host reconnection flag while
preserving alive bytes and queues. The inner sequencing/retry repair has its
separate [#198 owner](relay-sequencing-0.120.2.md).

## Sampling and presentation ownership

Frame owner `145b05c50` reads the transport's slot38 getter only for live
connections, after service input. It compares the result with cached guest
state at `+fea` or each host connection's `+47a`. Controls that set and clear
within the same pump therefore produce no intermediate notice. Caches advance
even when later world/presentation gates suppress delivery.

Guest true uses **“The host lost connection, reconnecting...”**; false uses
**“The host is back.”** The separate slot40 transport-retry getter/cached byte
`+feb` owns “Your connection to the party dropped, reconnecting...” and
“Reconnected to the party.” Those are distinct transitions and must not be
substituted for wire31/32.

Host transitions require hosting role3, an existing connection with an assigned
world hero and an available world. Recipient iteration excludes the affected
actor and retains each recipient's locale. Remote delivery `145b24860` requires
the recipient's assigned actor key and synchronized byte `+479`; actor zero
uses the first active local port. The affected hero's display name is the plain
world name, without added class colors or decoration. Guest notice delivery additionally
requires the synchronized client and an active local engine port. These gates
are distinct from transport liveness and ordinary disconnection settlement.

The [presentation proof](evidence/0.120.2/service-peer-flags/presentation.json)
binds the template, actor iteration, locale, name and packet helpers. Peer true
uses **“{hero} lost connection, reconnecting...”**; false uses
**“{hero} is back.”** Lookup precedes single-pass brace substitution; inserted
names are not parsed again. A recognized exact two-byte member language selects
that catalog; an invalid code preserves the selected global language.
[Targeted locale evidence](evidence/0.120.2/service-peer-flags/notice-locales.json)
binds all six notices to descriptor-bounded native JSON in fourteen languages.
The existing engine encoder carries SYSTEM chat10/opcode96 with universal
language, zero sender/tag and NUL-terminated text; no replacement overlay is used.

The host's separate relay-retry aggregate has asymmetric notification edges:
any existing transport's retry getter can raise it, including a retained dead
peer; clearing it requires a live peer. With no live peer, the cached true state
survives until a later eligible sample. An empty host cannot raise the flag.
The original `145b08856..145b089b9` branches have **170 exhaustive cases** in
the core replay. A dead guest skips retry sampling without advancing its cache.

The [leave/rejoin proof](evidence/0.120.2/service-peer-flags/lifetime.json)
binds four further functions and the actual guest-close vtable. Guest creation
zeros cached notice bytes `+fea/+feb` through the original zeroed SIMD store
`145b21a96`. Local guest Leave disables the handle, sends Leave and removes
the secondary, while preserving service active-guest `+1e0` and reconnect
`+1e2`. Joined sets active; Closed27 clears active without clearing reconnect.
The peer-zero set control therefore still copies the retained active byte
between Session drivers. Only the observed control/reset or fresh service
initialization changes reconnect state. Source `SharedGuestFlags` follows this
service lifetime; each new Session retains fresh notice caches.

## Connected source and static validation

`coop/directory_wire.rs` retains the exact tag/u32 records; the actual
`coop_directory.rs` dispatcher sends them to
the service-level `session::service_peer_reconnecting` helper for nonzero peers
and the shared service flag for peer zero. The Service-owned host map and
listener backlog retain flags and received queues even while Off; later handles
attach without resetting them. `RelayEndpoint` keeps the host flag separate
from alive and its received queue. The Session method remains an adapter over
the same shared owner. Guest handles share the actual Service-owned flags through
`share_guest_flags`, including controls received between Session drivers.
`Connection::is_reconnecting`
implements the guest/host getters; `Session::take_reconnection_changes`
samples final state and updates the separate caches. Actual relay replacement
clears flags through the service-level `service_relay_reset`, including when no
Session exists. The connected [relay lifecycle proof](relay-sequencing-0.120.2.md)
owns the shared queue/backlog and transport-reset integration.

`CoopRuntime` samples after the ordinary session tick and delivers typed changes
to `gameplay/coop_reconnection.rs`. Its installed First system consumes every
frame's changes before the local client lifecycle. It applies the recovered
world, synchronized-recipient and active-local-port gates, restores all
**84 selected translation entries**, and supplies ordinary engine chat locally
or through the actual recipient's Session packet queue. The related #198 local
relay-retry change uses the same consumer while retaining its separate flag,
cache and messages. On a host, that local relay notice goes only to actor zero.

The non-compiling checker is:

```sh
python3 -B scripts/check-service-peer-flags.py
PYTHONPATH=runtime/tests/query-python-deps:runtime/armory-recovery/python-libs python3 -B scripts/check-service-reconnection-presentation.py
```

It checks **1,037 exact original instructions**, eight retained Ghidra receipts,
and **434 original-instruction cases** covering prefix truncation, u32 extremes,
accepted suffixes, guest-active/handle gates, existing/missing/mismatched/dead
host rows, set/clear, selected-relay reset without alive/queue mutation and the
host's asymmetric retry-aggregate transitions.
Its hash-map seam supplies a known bucket; no generic hash, allocator, mutex
contention or platform networking behavior is reconstructed. The presentation
check independently verifies **1,298 original instructions**, eight further
Ghidra receipts, **94 original packet cases** and all **84 locale values**.
Allocation, byte copying and vector growth are declared synthetic packet-fixture
seams. Rustfmt parses eight connected source paths without building them.
Seven authored Rust regressions (one wire, four state and two presentation)
cover final-state sampling, queue/liveness retention, unknown/dead/reopened IDs
and reset, service flag retention across Leave/rejoin, exact packet encoding
and substitution, but are not compiled or executed.

Compilation, actual service/client/server/game execution, timing, displayed
chat and original/rebuilt parity remain unverified. Static evidence and source
connectivity do not establish those later validation levels.
