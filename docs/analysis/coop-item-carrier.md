# Cooperative item text delivery

Finding **#101** now connects the actual recipient ItemQuery reply to the guest's
persistent tooltip registry. The message helper/source assignment under **#298**
is established for this bounded ItemQuery path. Wider message and cooperative
closure remain separate findings. Compilation, network delivery, rendering and
original/rebuilt parity remain unverified.

The installed EXE is 146,721,280 bytes, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/coop-item-carrier/manifest.json) binds exact native
ranges, shared helper evidence and journaled Ghidra results. Historical
[registry work](coop-item-registry.md) retains its original target;
the previously missing carrier is a distinct current native message.

## Native contract

| Boundary | Current observation |
| --- | --- |
| Host wrapper `145b91b10..145b91bed` | Opcode `0x58` invokes the five-spell-cell reader `145afbe60`. A valid response becomes native enum variant 24; other opcodes and invalid/error item responses retain ordinary engine variant 6. |
| Text collection `145d032d0..145d03403` | Look up each of the five original spell IDs through `145af3cf0`, preserving ordinal order. An absent registry entry becomes an empty string. |
| Recipient send `145bd5b20..145bd5c13` | The wrapper runs before serializer `145d14a90` and the selected recipient's outgoing queue. No broadcast or new item query is fabricated. |
| Serializer case `145d14cc9..145d14d2f` | Native variant 24 writes wire tag **25**, a u32-length-prefixed binary ItemQuery body, u32 string count and each u32-length-prefixed string in order. It carries no extra opcode word. |
| Guest dispatch `145bd7b40`, case `145bd7ee8..145bd7fa6` | Table `147085ea0` selects variant 24. The guest remaps the body, then recursively submits a successful result as ordinary engine opcode `0x58`. Existing engine admission and delivery remain downstream of remapping. |
| Slot remap `145b53260..145b53565` | Validate the packet before any insertion. For each of the five slots, nonzero original ID and nonempty corresponding incoming text permit clone, sanitization and local interning. Missing/empty text or a zero original ID produces zero; surplus strings are unused. |
| Sanitizer `145b54cc0..145b54ea2` | Escape `\|H`, `\|h`, `\|T` and `\|t`, then truncate at the last UTF-8 boundary no later than 4096 bytes. This reuses the already available source sanitizer. |
| Local interner `145af3a50..145af3c52` | Exact bytes reuse an earlier entry; otherwise append and return `0xf00000 + index`. Current lock/vector addresses are `14865e430/431` and `14865e438/440/448`. Host IDs are never installed into the guest registry. |

The shared [message helper evidence](evidence/0.127.0/source-frontier-native.json)
owns the canonical extracts for `145afbe60` and `145b00d90`; they are not copied.
After the 12-byte entry/class/subclass header, both helpers consume four NUL
names. Relative to the following cursor, spell IDs occupy `0x104 + i*0x18`,
for `i=0..4`. The helper requires the complete five six-word spell records
through cursor plus `0x17c`; it rejects high-bit/error entries and incomplete
names/records. Remaining packet bytes stay unchanged. A malformed remap consumes
the owned input and returns absence.

The current parser is `145d106f0..145d1356c`, with tag dispatch table
`14771f034`. Its wire25 branch at `145d10f1b` reads a binary vector, passes
minimum row width **4** to count reader `145ec3b10`, and collects strings through
`145d02190` before publishing native variant24. No five-row receive cap is
introduced: the remapper alone uses at most five strings.

Raw-slice pseudocode omits distant callees/data and can truncate at external
branches. Original Windows-x64 register instructions bind the calls and enum
layout; generic raw-import signatures are not authoritative ABI declarations.
The unrelated remainder of the guest dispatcher is not re-recovered here.

## Connected source

`coop/replication.rs::NativeMessage::ItemTemplate` retains wire25 and its ordered
strings. `coop/engine_packets.rs::item_message` wraps only valid ItemQuery
responses and reads the host's actual `LocalItemDescriptions` entries. The live
`gameplay/coop_commands.rs` path applies this wrapper to the recipient-localized
reply from `RemoteInventory::query` before sending it to that client.

Existing ring, trinket and amulet producers already build their stat/effect
sentences in the recipient's locale and serialize them into the five ordinary
item spell ordinals. Those producers retain their historical evidence and
equations. The new carrier supplies their previously disconnected text; it does
not substitute formulas, identify stats by translated labels or rewrite numeric
item fields.

The guest's receive path calls `remap_item_descriptions` using its persistent
`LocalItemDescriptions::intern`, then follows the same synchronization, active
engine, opcode/length, trust, smoothing, observation and `LocalWireEvents` route
as an ordinary `0x58` packet. Registry insertion precedes that ordinary admission,
matching the native recursive dispatcher. The established registry publisher
updates the actual spell tooltip catalog before presentation dispatch. Cached
templates, local item/set insertions, run transitions and ReloadUI therefore
retain their own local IDs. There is no registry reset or host-ID merge.

## Static validation and remaining limits

`python3 -B scripts/check-coop-item-registry.py --carrier --native` verifies
14 journaled current query receipts, 14 exact code ranges and three dispatch
tables. The parser entry/branch use the existing independent instruction
decoder; their table and byte commitments remain explicit. The original
extract/remap/rewrite instructions pass **256** sparse-slot/string-count cases
and **403** malformed/truncated packets, totalling **156,201** original
instruction steps. String clone, sanitizer, persistent interning and free are
explicit seams; the replay does not execute those helpers or the full client.
The existing historical packet is used solely as a byte-grammar fixture.

Authored Rust regressions exercise the exact wire vector, truncation/trailing
bytes, sparse ordinals, different host/guest identities, hyperlink escaping,
UTF-8 truncation, missing/extra strings, unchanged stat/body bytes and the actual
ordinary item decoder. Four changed Rust paths syntax-parse without compilation;
those regressions remain uncompiled and unrun. No application, client, server,
socket, VM/rendering session or original/rebuilt comparison was run. Actual
recipient delivery, jewelry tooltips and parity remain verification work.
