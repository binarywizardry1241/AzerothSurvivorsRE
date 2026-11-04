# Cooperative version admission in 0.141.0

Installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes with SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This bounded recovery closes the [#163 source action](../verification-needed.md#gap-163).
The [0.140.0 protocol-12 analysis](coop-admission-0.140.0.md) retains its original target.

The host dispatcher at `0x145ecaf20` checks protocol **13** and the exact
seven bytes **`0.141.0`** at `0x145ecb0c1`. It rejects mismatches at
`0x145ecb354` and advances to password handling at `0x145ecb0fb`.
The guest constructor at `0x145ec7250` writes the same version and protocol.
At `0x145ec73a9` it passes the record to `0x14604fa80`. Serializer case zero
emits tag 1, a little-endian u32 protocol, and length-prefixed version and
password bytes. The constructor submits those bytes to the connection writer.

The directory constructor at `0x145e8d320` writes the same version with its
independent protocol **3** and calls serializer `0x146204750`.
Case zero emits tag 1, the protocol, version and staff key.
The shared source constants connect TCP and relay Join, host admission and the
directory version field. The fixed Join vector uses the recovered bytes.
[Party codec](../../crates/azeroth-survivors-re/src/coop/server_party.rs),
[session](../../crates/azeroth-survivors-re/src/coop/session.rs),
[directory worker](../../crates/azeroth-survivors-re/src/coop_directory.rs).

The [PE evidence](evidence/0.141.0/coop-admission.json) binds both constructors,
serializer case-zero ranges and helper stores to the exact installed bytes.
The existing checker matched the runtime-function extent and source routes
and replayed **3,198** isolated native comparisons over **13,362** original
instruction steps. Exactly one protocol/version pair passed. The changed
Rust file syntax-parsed. The fixed Rust fixture remains uncompiled and unrun.

```sh
python3 -B scripts/check-coop-admission.py \
  --manifest docs/analysis/evidence/0.141.0/coop-admission.json --require-source
```

Other payloads and the relay and terminal-service contracts retain separate
scope under [#63](../CURRENT-STATE.md#gap-63). The roster inspection payload
belongs to [#299](../CURRENT-STATE.md#gap-299). Compilation, actual connections,
interoperability and original/rebuilt parity remain unverified.
