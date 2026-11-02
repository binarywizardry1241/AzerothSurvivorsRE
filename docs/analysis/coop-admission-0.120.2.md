# Cooperative version admission — selected EXE 0.120.2

Finding **#163** is source/static repaired against the installed
145,484,288-byte EXE, SHA-256
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
[verification-needed](../verification-needed.md) owns the permanent finding and repair status.
The prior [0.120.0 repair](coop-handshake-0.120.0.md) retains its actual provenance;
the current repair reuses the same established source interfaces.

The [current native proof](evidence/0.120.2/coop-admission/manifest.json) binds
server-party diagnostic Location lines 497/528, current owner
`145b24b70..145b2575d` and one completed journaled full-PE Ghidra query. Exact
comparison `145b24e1e..145b24e58` requires **protocol 5**, **length 7** and exact
**`0.120.2`** bytes. Its overlapping DWORD comparisons are `0x32312e30` at
string+0 and `0x322e3032` at string+3. Mismatch branches to `145b250b6` before
password, capacity and run-state admission. The existing diagnostic inventory,
original owner hash and original instruction bytes independently bind that gate.

`coop/server_party.rs::GAME_VERSION` now supplies **`0.120.2`** to both
`JoinRequest::current` and `PartyServer::admit`; the fixed Join wire fixture uses
that same value. TCP/relay Join producers and the directory Handshake consume
the shared constant. Their actual source routes and codec fields were inspected;
this narrow native proof does not establish the wider directory/relay contracts.
The shared constant and fixed fixture match the recovered exact target.
Protocol 5, packet fields and password/capacity/run rejection order are unchanged.
The manifest's `source_first` observation retains the pre-repair source state.

```sh
python3 -B scripts/coop_handshake_check.py --proof docs/analysis/evidence/0.120.2/coop-admission/manifest.json --native
```

The existing shared checker is reused through a thin selected-target wrapper.
The [compact result](evidence/0.120.2/coop-admission/static-check.json)
reports source state **connected** and passes **3,042** bounded original-instruction
cases: 39 protocol values × 78 version values, with exactly one accepted pair.
Only the 58-byte comparison runs in synthetic packet/string memory, stopping at
acceptance/rejection before password/session code. It includes all 32 protocol-bit
and 56 version-bit mutations and malformed/truncated/extra-byte version values.
The checker verifies the current EXE/owner/comparison bytes, saved Ghidra receipts,
shared source routes, codec fields and fixed Rust wire regression. The Rust
regression is inspected, uncompiled and unrun.

No further #163 source omission is identified. This supports one bounded current
registration for `custom-game-server-party`.
It neither closes that module nor revalidates all Hero/State/transport/server
behavior. Application compilation, compiling tests, client/game/network/server
operation, actual interoperability and controlled original/rebuilt parity remain
unverified. Available source interfaces are reused; no engine or generic
network internals were reconstructed.
