# Cooperative version admission — selected EXE 0.123.0

The exact admission portion of **#267**, continuing **#163**, is source/static
repaired against the installed 146,228,736-byte EXE, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The parent release summary also depends on #268–#271; this bounded gate does not
complete those independent contracts.

## Native contract and correspondence

The [current proof](evidence/0.123.0/coop-admission/manifest.json) binds
server-party diagnostic Location lines 508/524/540/546 to current owner
`145c2e460..145c2f05c`, exact original bytes and a completed journaled Ghidra
query (`ev_97d5377df2880ef0a85f4a1100492c03faf6e304913424487bbe5674b1173fe7`).
Both decompilation and the independently decoded original gate
`145c2e6d4..145c2e70e` require **protocol 7**, **length 7** and exact
**`0.123.0`**. The overlapping DWORD comparisons are `0x32312e30` at string+0
and `0x302e3332` at string+3. Every mismatch branches to `145c2e966`;
success continues at `145c2e70e` into the password check. This precedes capacity
and run-state admission.

The [0.121.0 proof](evidence/0.121.0/coop-admission/manifest.json) retains its
original protocol 6/version `0.121.0` provenance. Current packet offsets, owner
diagnostics, comparison shape, rejection/success branches and the following
password/capacity path establish bounded correspondence. Both exact fields have
changed. The raw-function Ghidra input excludes external functions and data;
unrelated computed dispatch remains unresolved. No wider packet schema or
transport behavior is inferred from this gate.

## Connected source

`coop/server_party.rs::{GAME_VERSION,PROTOCOL_VERSION}` supply `0.123.0` and 7
to the existing `JoinRequest::current` producer and `PartyServer::admit`
consumer. Both TCP and relay Join routes encode that shared constructor;
directory Handshake uses the same game version. The fixed Join wire regression
now contains the same native fields. Existing field order remains tag,
little-endian u32 protocol, length-prefixed version and length-prefixed password.
This change does not certify the remaining protocol 7 payload schemas.

## Static verification and limits

```sh
python3 -B scripts/check-coop-admission.py \
  --manifest docs/analysis/evidence/0.123.0/coop-admission/manifest.json \
  --require-source
```

The [compact result](evidence/0.123.0/coop-admission/static-check.json) reports
connected shared source and **3,042 cases / 12,738 original instruction steps**:
39 protocol values × 78 version values, with exactly one accepted pair. The
replay covers all 32 protocol-bit mutations, all 56 version-bit mutations, and
empty, truncated, extended and embedded-NUL versions. The generic fixture set
now includes the manifest's required protocol explicitly, so a newly recovered
value is actually exercised as well as its bit mutations.

Only the original 58-byte gate executes in synthetic memory; the harness stops
before either continuation. It binds the installed target, owner and gate bytes,
diagnostic anchors, saved Ghidra receipts, source producers/consumer, codec field
order and fixed fixture. The Rust regression is inspected without compilation
or execution. No further source omission is identified within these exact
admission fields. Compilation, client/game/network/server execution,
interoperability and controlled original/rebuilt parity remain unverified.
