# Cooperative version admission

Finding **#163** is source/static repaired for the installed 145,447,424-byte
EXE, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
[verification-needed](../verification-needed.md#gap-163) owns the remaining validation status.

The [canonical native proof](evidence/0.120.0/coop-correspondence/manifest.json)
binds the server-party Location owner `145b24fc0..145b25bad`, saved full-PE
Ghidra result and exact comparison `145b2526e..145b252a8`. Protocol **5**,
length **7** and exact **`0.120.0`** bytes are required; mismatch branches to
`145b25506` before password, capacity and run-state checks. Existing assembly
and query results are reused without duplicating native extracts or running
new Ghidra analysis. The earlier source observations in that manifest remain
the audit's pre-repair receipts; they are not the repaired source state.

`coop/server_party.rs::GAME_VERSION` now supplies `0.120.0` to both
`JoinRequest::current` and `PartyServer::admit`. TCP and relay Join producers
use that constructor and the existing length-prefixed version codec. The
directory Handshake consumes the same constant; its wider service contract is
not established by this admission branch. The fixed Rust Join wire fixture
contains the same seven bytes. Protocol, packet format and rejection order
retain their recovered behavior.

```sh
python3 -B scripts/coop_handshake_check.py --proof docs/analysis/evidence/0.120.0/coop-correspondence/manifest.json --native
```

The [compact result](evidence/0.120.0/coop-handshake-check.json) records **3,081**
bounded original-instruction cases: 39 protocol values × 79 version values,
with exactly one accepted pair. The matrix includes all 32 protocol-bit and
56 version-bit mutations, previous versions including `0.119.1`, truncations,
extra bytes and embedded/appended NULs. The checker validates current EXE/owner/
comparison bytes, twelve instruction boundaries, the original saved query and
module anchors, all shared source routes, codec fields and the fixed fixture.
Only the 58-byte comparison executes in synthetic packet/string memory; the
replay stops before password/capacity/session handling.

No further #163 source omission is identified. Broader packet, Hero/State,
liveness and trust contracts retain their separate findings. The Rust fixture
is inspected, not compiled or executed. No build, client/game/network/server
operation or original/rebuilt comparison occurred. Actual interoperability,
compilation, runtime and parity remain unverified.

## Retained reports

[0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-handshake-0.119.0.md) · [0.118.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-handshake-0.118.0.md) · [0.117.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-handshake-0.117.0.md)
