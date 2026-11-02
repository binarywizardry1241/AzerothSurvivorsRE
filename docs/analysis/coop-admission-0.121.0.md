# Cooperative version admission — selected EXE 0.121.0

Finding **#163** is source/static repaired against the installed
146,088,960-byte EXE, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md#gap-163) owns its remaining validation status.
The [0.120.5 proof](evidence/0.120.5/admission/manifest.json) retains its original
target and protocol 5/version `0.120.5` contract.

## Native contract and correspondence

The [current proof](evidence/0.121.0/coop-admission/manifest.json) binds
server-party diagnostic Location lines 500/532/516/538 to current owner
`145b34e30..145b35a2c`, its exact original bytes and one completed journaled
Ghidra query. Both the decompiler and independently decoded original comparison
`145b350a4..145b350de` establish **protocol 6**, **length 7** and exact
**`0.121.0`**. The overlapping DWORD comparisons are `0x32312e30` at string+0
and `0x302e3132` at string+3. Every mismatch branches to `145b35336`;
success continues at `145b350de` into the password branch. The gate precedes
password, capacity and run-state admission.

The predecessor's 58-byte comparison shape persists, but **both protocol and
version changed**. Current diagnostic ownership, input offsets, branch targets,
comparison constants and the surrounding admission path establish this bounded
correspondence; the old RVA or a package-version string alone does not.
The raw-function Ghidra import omits external functions and data context and
leaves unrelated computed dispatch unresolved. Those limits do not supply wider
packet/session or transport semantics.

## Connected source

`coop/server_party.rs::GAME_VERSION` now supplies `0.121.0`, and
`PROTOCOL_VERSION` supplies 6, to `JoinRequest::current` and `PartyServer::admit`.
The fixed Join wire fixture includes the same fields. Existing TCP and relay
Join routes use that constructor and lifecycle encoder; directory Handshake uses
the shared game version through its own existing service codec. The lifecycle
field order remains tag, little-endian u32 protocol, length-prefixed version and
length-prefixed password. This repair changes the exact admission fields; it
does not certify all protocol 6 payload schemas.

The shared source checker now follows the actual relay producer,
`service_join_with_flags`, after its wrapper refactor. The generic admission
checker reuses that stricter source trace, verifies the fixed Rust fixture and
can require connected source with `--require-source`. Native protocol values
come from the selected proof rather than a hard-coded historical protocol 5.

## Static verification and limits

```sh
python3 -B scripts/check-coop-admission.py \
  --manifest docs/analysis/evidence/0.121.0/coop-admission/manifest.json \
  --require-source
```

The [compact result](evidence/0.121.0/coop-admission/static-check.json) reports
connected source and **3,120 cases / 13,050 original instruction steps**:
40 protocol values × 78 version values, with exactly one accepted pair.
The synthetic replay includes all 32 protocol-bit mutations, all 56 version-bit
mutations and empty, truncated, extended and embedded-NUL versions. It executes
only the original 58-byte gate in synthetic memory and stops before either
continuation. The check binds the installed target, owner/comparison bytes,
diagnostic anchors, saved Ghidra receipts, shared source producers/consumer,
encoder/decoder field order and fixed wire fixture. The Rust regression remains
uncompiled and unrun.

No further source omission is identified within #163's exact admission fields.
Current Heroic fields and private rewards remain under #238; wider lifecycle
and payload recovery retain their existing owners. Application compilation,
client/game/network/server execution, actual multiplayer interoperability and
controlled original/rebuilt parity remain unverified. This bounded result does
not close the server-party module or those separate findings.
