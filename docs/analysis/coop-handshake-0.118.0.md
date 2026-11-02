# Cooperative version admission — 0.118.0

Finding **#163** retains its identity from the [0.117.0 repair](coop-handshake-0.117.0.md).
It was encountered again while recovering **#101**. The selected 0.118.0 EXE is
bound by SHA-256 `4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae`.
This is historical 0.118.0 evidence; the [0.119.0 repair](coop-handshake-0.119.0.md)
owns the later version update. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current
implementation status.

The existing [native admission proof](evidence/0.118.0/coop-admission-review.json)
binds the actual server-party Location owner `145b1af80..145b1bb6d`, its durable
Ghidra query and comparison block `145b1b22e..145b1b268`. Admission requires
protocol **5**, version length **7** and exact bytes **`0.118.0`**. A mismatch
reaches version rejection before password/capacity/session admission.

The source still advertised `0.117.0`, preventing its outgoing Join request and
incoming party admission from matching this current native contract.
`coop/server_party.rs::GAME_VERSION` now supplies `0.118.0` to both existing
consumers. The fixed Join wire regression uses the corresponding seven bytes;
the protocol remains 5. Historical Hero, State and other packet contracts keep
their actual provenance and are not revalidated by this small repair.

`python3 -B scripts/coop_handshake_check.py --proof docs/analysis/evidence/0.118.0/coop-admission-review.json --native` verifies the native
owner/comparison bytes, original Ghidra receipts, source producer/admission and
fixed-wire linkage. **2,964** original-instruction fixtures cover 39 protocol
values and 76 version values, including all single-bit mutations, earlier/nearby
versions, lengths and NUL boundaries. Only protocol 5 with exact `0.118.0` reaches
the success continuation. The replay uses synthetic packet/string memory and
stops before password handling. A separate check after the source change confirms
the connected constants and fixed wire bytes.

The Rust regression was inspected but not compiled or run. No client, socket,
server/service, gameplay or original/rebuilt comparison ran. This source fix
does not resolve the separate [guest item-effect registry blocker](coop-item-registry-0.118.0.md).
