# Guest Engine trust transformation — 0.120.0

Selected installed EXE SHA-256:
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
This report owns the source repair for **#186**. The earlier
[co-op correspondence](coop-correspondence-0.120.0.md) retains its original
native/source inspection receipts; its source snapshots describe the code
before this repair. [Repair evidence](evidence/0.120.0/coop-trust/manifest.json)
reuses its canonical native ranges and adds the required conversion contract,
original-instruction fixtures and current source connections.

## Native contract and connected source

Current trust owner `145aa8d20..145aa95e1`, bound by the `coop/trust.rs`
Location at `145aa94c4`, is called at `145b274b0` after guest synchronization,
opcode/body-length admission and selection of an active receiving port.
Delivery follows at `145b274f4`. The source now calls
`coop::trust::guest_engine_payload` inside
`CoopGame::guest_engine_packet` after its existing admission predicates. Its
returned packet feeds both `decode_server`/`observe` and `LocalWireEvents`.
Host-bound commands and the separate resource-description sanitizer retain
their own consumers.

The complete owner has two rewrite cases; all other opcodes pass through:

- **0x51:** require at least nine bytes and a terminating NUL after the
  eight-byte GUID. Remove all pipe bytes before the terminator; preserve GUID,
  NUL and the complete suffix. No UTF-8 validation is applied to names.
  Too-short or unterminated input passes through unchanged.
- **0x96:** require five bytes before inspecting the unsigned chat type.
  The complete guarded nine-cell table admits types 0/1/5/6 with length/text
  offsets 21/25 and type 8 with offsets 13/17. Type 6 passes through when the
  four-byte language is `0xffffffff`; other types pass through.

Chat requires the complete four-byte little-endian length field. For declared
length `L`, validate exactly `L.saturating_sub(1)` bytes at the text offset,
requiring those bytes to fit the body. The helper at `145f7f020` validates
strict UTF-8 and returns discriminant 1 on failure; the owner then preserves
the original packet. Successful text normalization doubles a lone pipe and
retains an already paired pipe. Valid multibyte text remains byte-identical.
The source uses Rust's strict `str::from_utf8` admission followed by the same
pipe-pair handling.

The output retains the prefix before the length field, writes normalized
byte length plus one, normalized text and one NUL, then appends the original
suffix from `min(text_offset + L, payload.len())`. The owner does **not**
check that a declared terminal byte is NUL. `L=0` inserts a NUL before the
whole tail; `L=1` discards one declared terminal byte if present; a missing
terminal byte is accepted when all `L-1` text bytes fit. These details are
preserved rather than replaced by the ordinary chat parser's string rules.

## Validation and limits

The durable Ghidra helper query reuses the current target/profile's saved
Program. The fixture checker verifies current original bytes, the canonical
guarded table and query receipts before replaying the owner and UTF-8 helper.
All **655 cases / 159,724 original instructions** pass, including every unsigned
chat-type byte, malformed UTF-8, length boundaries, missing/non-NUL terminal
bytes, pipe runs, multibyte text and preserved suffixes.
Allocation, vector growth, byte copies and frees are explicit fixture seams;
the packet transformation and UTF-8 decisions use original instructions.
Shared byte vectors also drive authored Rust regressions. The Rust tests are
uncompiled and unrun. Source syntax is checked with the existing rustfmt
parser through stdin, without module traversal or compilation.

```sh
PYTHONPATH=runtime/armory-recovery/python-libs python3 -B scripts/check-coop-trust.py
python3 -B scripts/check-reconstruction-coverage.py
```

No remaining source omission is identified within #186's selected transform
and live receiving boundary. Complete opcode-domain applicability remains
**#180**; broader co-op and native ownership remain **#63/#41**. Compilation,
actual client/packet/UI delivery, rendering and original/rebuilt parity are
unverified. No application, game, network or server is launched by these checks.
