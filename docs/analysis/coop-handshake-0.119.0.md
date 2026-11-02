# Cooperative version admission — 0.119.0

Finding **#163** connects the exact current version requirement to the shared
co-op source. The selected 145,357,824-byte EXE has SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
[verification-needed](../verification-needed.md) owns current implementation status.

The retained [native review](evidence/0.119.0/coop-admission-review.json) binds
the server-party Location owner `145b1b030..145b1bc1d`, its original durable
full-PE Ghidra result and the comparison at `145b1b2de..145b1b318`. It requires
protocol **5**, version length **7** and exact bytes **`0.119.0`**. Any mismatch
branches to `145b1b576` before subsequent admission. The review's `source_first`
records the pre-repair `0.118.0` discrepancy and retains that historical observation.

`coop/server_party.rs::GAME_VERSION` now supplies `0.119.0` to
`JoinRequest::current` and `PartyServer::admit`. Both TCP and relay joins use that
constructor and the existing length-prefixed version codec. The directory
Handshake also consumes the shared constant; its wider service contract is not
recovered by this admission branch. The fixed Join wire regression now contains
the same seven version bytes; protocol 5 is unchanged.

`python3 -B scripts/coop_handshake_check.py --proof docs/analysis/evidence/0.119.0/coop-admission-review.json --native` reuses the saved
proof without new native discovery. It verifies current target identity,
owner/comparison bytes, original query receipts, source producer/admission,
TCP/relay/directory consumers, codec fields and the fixed wire fixture.
[The compact result](evidence/0.119.0/coop-handshake-check.json) records **2,964**
bounded instruction cases across 39 protocol and 76 version values. These include
all 32 protocol-bit mutations, all 56 version-bit mutations, older versions,
truncation, appended bytes and embedded/appended NULs. Only protocol 5 with exact
`0.119.0` reaches success. The replay uses synthetic packet/string memory and
stops before password/capacity/session handling. The earlier versioned checker
retains its explicit target guard and shares the checker implementation.

No selected source defect remains. Hero/State schemas, broader packet/lifecycle
contracts and other co-op findings remain independently owned. The Rust fixture
was inspected, not compiled or run. Compilation, sockets, client/server/service
execution and original/rebuilt interoperability or gameplay parity remain
unverified.
