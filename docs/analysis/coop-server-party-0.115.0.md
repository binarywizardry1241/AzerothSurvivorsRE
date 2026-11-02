# Server-party source correspondence, 0.115.0

Target: installed 0.115.0, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [manifest](evidence/0.115.0/coop-server-party/manifest.json) binds current
native ranges, canonical extracts, Ghidra evidence/profile IDs, serializer branch
addresses and class/race data. Current status belongs in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

`src/coop/server_party.rs` supplies a real server admission and connection
lifecycle counterpart for original `crates/wenilla-rogue/src/server/party.rs`.
The transport/session bridge consumes its results and native binary packets.
This establishes partial source correspondence; it does not establish a complete
server, a playable cooperative run or native parity.

## Recovered lifecycle

| Native owner | Source contract |
|---|---|
| `1458952f0` | Admission checks hosting, exact protocol `4` and version `0.115.0`, byte-exact password, capacity including the host, then the running-state gate. Exact denial reasons remain native text. Repeated handshake admission uses the same checks; no special invented admission path. |
| `145877810` | Host command normalizes capacity to `1..=5`. New connection IDs increment a wrapping byte and skip zero. A client receives at most 200 messages per tick. The tick drains closing connections, removing dead transports or those past a 10-second grace. |
| `145894d00` | Queue the denial before clearing joined state and marking the closing timestamp. Preserve the connection while queued bytes drain. An existing joined client produces a left notification. |
| `145896390` | Remove a client while preserving the order of remaining records. Native world-member removal, recomputation and presentation calls remain distinct dependencies. |
| `145892220` | Synchronization requires an assigned world hero and an active world; it sends initial state and only then marks the client synchronized. The new source does not grant this state on admission. |

`ClientId` is a stable local transport handle, separate from the native wrapping
byte sent in the accepted packet. It is also separate from a hero's gameplay
GUID. `set_run_under_way` consumes the native host admission gate projected by
the caller; it does not infer it from lobby text.

## Binary packets and directions

`14581c690` writes one byte identifying the packet. Its primitive writers append
u8, u16/u32/u64 little-endian values and u32-length-prefixed byte strings.
`coop::tcp` supplies the separate TCP frame header.

| Tag | Recovered payload | Direction |
|---|---|---|
| 1 | Protocol u32, version bytes, password bytes | Guest to host |
| 2 | Connection byte, capacity byte | Host to guest |
| 3 | Denial bytes | Host to guest |
| 4 | Complete hero wire record | Guest to host |
| 6 | No payload; synchronization request | Guest to host |
| 7 | Engine opcode u16, payload bytes | Guest to host after synchronization |
| 9 | Engine event text bytes | Host to guest |
| 16 | No payload; disconnect | Guest to host |
| 17 | Count u32, roster records | Host to guest |

The server dispatcher ignores guest tag 9. Tag 7 requires the native
synchronized flag; receiving an accepted packet alone cannot bypass that guard.
These directions matter even when both endpoints use the reconstructed session
adapter.

Tag 17 records contain identity u64, name, class, race, optional profile,
achievement points and host flag. The current producer `145893640`, class/race
localization consumers in `145883b80` and score owner `1458cbba0` establish their
roles. Optional profile serialization is independently recovered in
`145b7c260`; fields whose wider meaning is unresolved retain native offset
names. Lobby records are not in-run heroes.

Tag 4's entire structural serializer is represented, including nineteen u32
words, nineteen optional words using `0xffffffff`, the exact string/rank pairs,
flags, optional profile and remaining scalar/byte fields. Unknown meanings retain
offset names. This avoids manufacturing fields or values while permitting exact
packet decoding and forwarding.

## Hero identity and remaining bootstrap work

`14584b690` admits only gameplay GUIDs in `[0x800000,0xffff00)`, nonempty names,
classes in mask `0x5df` and their allowed races. Current native pointer/length
arrays `14700bd18`/`14700bcc0` exactly match the existing
`save::allowed_races`, so the binary caller supplies that existing table to the
library validator as an explicit slice. The library does not depend on the
binary-only save module or maintain another race table. `145891b70` rejects
collisions with the host, active hero or other clients while excluding the
sender. `validate_hero_identity` implements only these checks.

That interval excludes the custom picker projection `0xfffffe`, which is a
roster identifier rather than a native wire world identity. The native server
initializer `145876a00` generates the separate world identity; see the current
[bootstrap recovery](coop-bootstrap-0.115.0.md). Neither a saved roster GUID nor
the accepted connection byte may be substituted for that producer. Identity
validation alone does not sanitize the entire hero. The subsequent
[bootstrap recovery](coop-bootstrap-0.115.0.md) implements native appearance,
equipment, reward and talent normalization using the existing source owners,
and documents actual assignment and initial-world publication. Its source and
static validation do not establish runtime or complete run/endless parity.

The native compressed batch packet, tag 19, expands through `145821360`, rejects
output above 4 MiB and then parses its contained messages. The subsequent
[replication recovery](coop-replication-0.115.0.md) owns its raw-DEFLATE wrapper,
contained message decoder and source implementation.

## Validation

`python3 -B scripts/check-coop-server-party.py` passed 70 current-target
range/extract/dispatch/data/source guards. The installed Rust formatter parsed
the module with `--emit stdout --config skip_children=true`; it did not compile
it. Fixed native wire vectors and admission-order/grace tests are present for a
separately authorized Rust test run and were not executed.

Raw Ghidra slices omit external code/data and may infer incorrect calling
conventions. A separate full-PE seeded query resolved the selected command and
admission dispatches. Exact byte commitments and explicit remaining contracts
bound these findings. No Rust compilation, TCP session, original/rebuilt game
launch, gameplay, rendered comparison or parity check was performed.
