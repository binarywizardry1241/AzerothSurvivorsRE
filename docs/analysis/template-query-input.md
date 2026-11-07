# Short cooperative template-query payloads

Finding **#201**, discovered through **#41**'s retained CreatureQuery dispatch
questions, is a source/static repair. The installed target is **0.120.2**,
SHA-256 `80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
The [manifest](evidence/0.120.2/template-query-input/manifest.json) binds the
current native handler, journaled Ghidra result and bounded instruction replay.

## Native input and source correction

Current handler `145b01eb0..145b04a8a` dispatches item `0x56`, GameObject `0x5e`
and Creature `0x60` queries to three independent little-endian entry readers.
Each consumes the first four available bytes, supplying zero for every missing
byte and ignoring a trailing GUID or other suffix. Empty input produces entry
zero; one to three bytes remain valid query input. The current decompiler
result agrees with the exact reader instructions. Its inferred pointer types
for the length parameter are not used as a source schema.

The existing lifecycle decoder accepts a length-delimited EngineCommand body
and queues it unchanged for the admitted client. `coop_commands::apply` then
selects that client's existing hero and locale. Its three template-query arms
previously required `u32_at` to return four bytes, silently dropping shorter
bodies before the established lookup/serializer path. For example, Creature
payload `29 23` must select entry 9001 rather than disappear.

All three arms now use one `template_entry` reader with the recovered zero-fill
rule. Their existing inventory, creature and GameObject consumers still produce
the response; the ordinary event encoder sends it to the same originating
client. The helper retains a full entry's high bit and ignores bytes after the
fourth. Existing lookup/miss, locale, event and packet semantics keep their
separate owning contracts under #11/#64/#65/#101. No new item-description carrier
is inferred from this parser repair. Other command fields retain their own
readers and admission behavior.

The complete finite CreatureQuery metadata/table classification is separate
from this input defect. Fixing a reader does not certify every template, the
surrounding handler, all command admission or the global native frontier.

## Static verification and limits

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-template-query-input.py
```

The checker replays **19,923 original-instruction cases / 931,734 instructions**
over 6,641 distinct payloads, exercising 103 distinct instructions. It enters
the original opcode dispatcher and stops immediately after each selected entry
reader, before any catalog, allocator, serializer or sender. Cases cover every
byte value in every entry lane at lengths zero through eight, plus selected
short, trailing and high-bit inputs. The payload population is bounded; it is
not every possible byte string or a client/server execution.

Source guards check the shared helper, all three live query arms, unchanged
length-delimited command queue and existing reply loop. Rust syntax parsing
passes. An authored Rust boundary regression remains uncompiled and unrun.
No application compilation, compiling test, client/game/network/server
operation or original/rebuilt comparison occurred. Actual response timing,
UI/cache delivery and gameplay parity remain unverified.
