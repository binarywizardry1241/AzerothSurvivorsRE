# Directory difficulty fields

Selected installed EXE: **0.123.0**, 146,228,736 bytes, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [bounded proof](evidence/0.123.0/coop-directory-schema/manifest.json)
records the JSON row fields needed by **#258**. It supplements the separate
directory binary-wire/profile and co-op menu recovery; field recovery alone
does not certify those wider mechanisms or presentation.

## Keys, types and defaults

Current row parser `0x140099ea0..0x14009a8d6` looks up the following exact keys
through the existing JSON object interface `0x142cdd5d0`:

| Key | Literal | Lookup call | Native row destination |
| --- | --- | --- | --- |
| `lacks` | `0x1461bbea3`, 5 bytes | `0x14009a351` | String at `+0xa8` |
| `heroic` | `0x1461bbea8`, 6 bytes | `0x14009a3e7` | Signed i64 at `+0x108` |
| `difficulty` | `0x1461bbeae`, 10 bytes | `0x14009a436` | String at `+0xc0` |

The output row stride is `0x128`. The proof independently binds each key's
literal bytes, its length and RIP-relative argument producer, its lookup call,
the returned-value branch and the corresponding row stores.

`heroic` is a **signed** rank. The branch at `0x14009a3ed..0x14009a427` accepts
the JSON Number's signed-integer variant directly, including negative values.
Its unsigned-integer variant is admitted only when the high bit is clear,
which preserves the complete i64 range. A missing lookup uses the existing
fallback Value; nonnumeric values, floating-point numbers and unsigned integers
above i64::MAX yield **-1**. No nonnegative clamp, u8 truncation or tier cap
belongs to this parser.

`lacks` and `difficulty` accept only JSON strings. Missing or other value types
produce empty strings, using the existing string allocation/copy interface for
nonempty values. Their content remains the service-provided text; this proof
does not derive new eligibility rules or replace the supplied difficulty label.

The live `coop/directory.rs::DirectoryLobby::read` now preserves `heroic` through
`as_i64().unwrap_or(-1)` and reads both text fields with its existing string
helper. `coop_directory.rs::publish_directory` forwards all three fields, and
`coop_ui.rs::LobbyRow` retains a signed i64 rank. Named source guards verify
these connections without binding unrelated concurrently repaired source to a
whole-file hash. Their presentation/filter consumers retain their own evidence
and validation limits.

## Static checks

`scripts/check-coop-directory-transport.py --contract schema` verifies **617 exact owner
instructions**, **71 selected contract instructions**, all three key bindings
and the complete journaled Ghidra receipt with the shared native-subject verifier.
The raw query input is checked against the selected installed PE's exact bytes
and declared virtual base.

**213 original-instruction cases** pass: 169 rank cases cover Value types,
signed/unsigned/float Number variants, tier values, i64 limits, negative payloads
and the missing-key path; 44 string cases cover both added text fields, empty
and nonempty strings, other Value types and missing keys. Fixtures supply
synthetic Value memory and an explicit missing-key Null seam. They stop before
JSON lookup, allocation/copy or application delivery. This is not execution of
the application's JSON parser, menu or service.

Compilation, full directory/service execution, filtering interactions, rendered
colors/labels and original/rebuilt parity remain unverified.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-coop-directory-transport.py --contract schema
```
