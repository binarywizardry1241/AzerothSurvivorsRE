# Cooperative version admission in 0.141.1

The installed `installed-game/AzerothSurvivors.exe` is 151,534,080 bytes with
SHA-256 `47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
This bounded repair updates [#163](../verification-needed.md#gap-163).
The [0.141.0 audit](target-refresh-0.141.0.json) and
[prior handshake trace](coop-admission-0.141.0.md) retain their original scope.

The Join arm at `0x145edab11` requires protocol **13**, a version length of
seven, and exact bytes **`0.141.1`**. The two overlapping dword comparisons
cover all seven bytes. A mismatch jumps to `0x145edada4`; a match continues
at `0x145edab4b` to password handling. The guest constructs the same
protocol/version pair at `0x145ed6cec..0x145ed6df9`. The record's case-zero
serializer at `0x145e557c1` writes tag 1, protocol, version and password,
before the guest submits the bytes through its connection writer.

The directory constructor at `0x145e9de59` uses the same version, separate
protocol **3** and flag byte 1. Its case-zero serializer at `0x14620b833`
writes tag 1, protocol, version, staff key and the flag. The
[shared wire version](../../crates/azeroth-survivors-re/src/coop/server_party.rs)
now supplies `0.141.1` to direct TCP and relay Join, host admission and
the directory handshake. The repository's audited package baseline stays
bound to 0.141.0.

The [native evidence](evidence/0.141.1/coop-admission.json) binds the
unwind extent, exact comparison instructions, constructors, serializer
cells and writer anchors. The bounded Ghidra result is indexed by its raw
extent and evidence digest; external table destinations were checked in
the installed PE.

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-coop-admission.py \
  --manifest docs/analysis/evidence/0.141.1/coop-admission.json --require-source
```

All 3,198 comparison cases passed over 13,362 original instructions. Only
protocol 13 with `0.141.1` passed; `0.141.0` is one of the rejected
single-bit mutations. The checker inspected the shared source routes and
fixed wire fixture. The changed Rust file syntax-parsed. Compilation,
live client/service interoperability and original/rebuilt parity remain
unverified. Other message schemas and deployed service behavior are
outside this bounded proof.
