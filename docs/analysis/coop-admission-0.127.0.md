# Cooperative version admission — 0.127.0

The selected joining work under **#203** exposed the concrete **#163** source
defect: Join and directory producers still advertised 0.123.0/protocol 7.
The installed 146,721,280-byte EXE is SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.

The [0.139.2 report](coop-admission-0.139.2.md) owns the later Join fields
and the live source constants.

The [current proof](evidence/0.127.0/coop-admission/manifest.json) reuses the
journaled #41 server-party owner `0x145bd6280` and its four diagnostic anchors.
The independently decoded 58-byte gate `0x145bd651f..0x145bd6559` requires
protocol **8**, a seven-byte version and exact **`0.127.0`**. It compares
`0x32312e30` at version+0 and `0x302e3732` at version+3. Every mismatch branches
to `0x145bd67cb`; success continues into the password/capacity path. The raw
Ghidra owner omits external data/callees; the exact original comparison bytes
govern this bounded contract.

`coop/server_party.rs::{GAME_VERSION,PROTOCOL_VERSION}` and the fixed Join wire
fixture now supply those fields. Existing `JoinRequest::current` producers on
TCP and relay, `PartyServer::admit`, and directory Handshake all consume the
shared constants. The earlier [0.123.0 proof](coop-admission-0.123.0.md) retains
its original protocol/version and wider limitations.

The existing non-compiling checker passed **3,198 synthetic admission cases**
and **13,362 original instruction steps**, accepting exactly one pair. It also
checks source consumers, codec field order and the fixed Rust wire fixture.

```sh
python3 -B scripts/check-coop-admission.py \
  --manifest docs/analysis/evidence/0.127.0/coop-admission/manifest.json \
  --require-source
```

No further source omission is identified in these exact admission fields.
Protocol 8 payloads, reliable relay/object delivery and bootstrap ordering retain
their separate owners under #198/#203. Compilation, client/game/network/server
execution, interoperability and original/rebuilt parity remain unverified.
