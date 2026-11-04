# Cooperative version admission in 0.139.2

Findings [#63](../CURRENT-STATE.md#gap-63) and
[#163](../verification-needed.md#gap-163). The installed
`installed-game/AzerothSurvivors.exe` 0.139.2 has SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [manifest](evidence/0.139.2/coop-admission.json) binds its 58-byte Join
gate, sender ranges and previously retained Ghidra dispatcher query from
the [Ready Check proof](coop-ready-check-0.139.2.md).

Native Join at `0x145e73f10` allocates the seven version bytes, stores
`0.139.2` and writes protocol **9** at `0x145e74029`. It sends native
variant zero through `0x145dc91e0`, whose branch emits wire tag 1. The
host's variant-zero branch at `0x145e77d32` reaches
`0x145e77d71..0x145e77dab`. That gate checks protocol 9, length seven and
the two overlapping four-byte pieces of `0.139.2`. All mismatches branch
to `0x145e78004`. Success continues to the existing password checks.

The directory connection owner `0x145f941d0` builds the same seven-byte
game version. Its separate service handshake serializer `0x1461aa410`
emits tag 1 and directory protocol **3** before the version bytes.

`coop/server_party.rs` now supplies the proved Join version and protocol
through its existing constants, which feed TCP Join, relay Join, host
admission and the directory version field. The exact Join wire fixture
uses the same fields.

```sh
python3 -B scripts/check-coop-admission.py \
  --manifest docs/analysis/evidence/0.139.2/coop-admission.json \
  --require-source
```

The checker passed **3,198** gate cases over **13,362** native instructions,
with one admitted pair. It also checked the exact selected sender ranges,
the current source consumers and the fixed wire fixture. Rust syntax parsing
passed. Compilation, sockets, actual client and service interoperability,
and original/rebuilt parity remain open. Payload layouts and the wider
cooperative lifecycle retain their own proof scopes.
