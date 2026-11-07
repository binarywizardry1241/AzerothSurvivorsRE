# Custom DBC native owners

Selected EXE SHA-256:
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This is bounded native recovery and source connection under **#41**. Current
implementation and remaining work belong to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The [decoded diagnostic discovery](coverage/diagnostic-ownership.json) finds
eight instruction references to `crates/wenilla-rogue/src/dbc.rs` in four native
extents. All eight refer to three Rust Location records for source lines 38, 48
and 52. These are bounds-check owners, not a new game-specific DBC asset format.
The [canonical producer manifest](evidence/custom-dbc/manifest.json) binds
original PE byte ranges, assembly, scoped Ghidra pseudocode and Evidence IDs.
The [dictionary/caller manifest](evidence/custom-dbc/dictionary-consumers.json)
adds table construction, fixed descriptors, replacement branches and callers,
referencing the existing producer and addon-debuff extracts.

| Native owner | Recovered bounded contract |
| --- | --- |
| `145873b10..145873bea` | String reader: compute wrapping u32 `row * record_size + field * 4`, read the dword at file offset `20 + index`, add the table's string base, then scan to NUL or actual file end. Field and string-offset bounds failures panic. Invalid UTF-8 returns an empty slice. |
| `1458b9140..1458b9217` | Sequential SpellIcon ID/string producer: field 0 is the ID and field 1 goes through the shared string reader, then insertion owner `1458ba8b0`. Retains ID zero and empty values; a duplicate ID replaces the earlier string, including replacement with empty. |
| `1459ad750..1459ad931` | Requested ItemDisplayInfo icon producer: for each requested display ID, scan rows in order by field 0, read field 5 on the first matching row and insert a nonempty copied string through `1407cf030`. A missing, empty or invalid-UTF-8 first match produces no entry; scanning does not continue to later duplicates. |
| `1459b2e30..1459b32ad` | Spell metadata producer: ID field 0, dispel field 4, icon lookup key field 117 and raw name field 120. Name does not fall back to another locale column. Missing icon keys produce an empty string. Duplicate spell IDs replace the entire 64-byte metadata payload through `1458ba640`. |

Dispel values 1, 2, 3 and 4 map respectively to the fixed strings `Magic`,
`Curse`, `Disease` and `Poison`; all other values produce an empty descriptor.
The four u64 lengths at `1471b6850` and relative i32 pointers at `1471b6870`
resolve to these current literal bytes. This custom dictionary does not read
SpellDispelType.dbc for display labels.

## Table construction and consumers

`1458c0250..1458c0a41` opens `DBFilesClient\Spell.dbc` and
`DBFilesClient\SpellIcon.dbc`. It calls the icon producer at `1458c0556`,
then passes that dictionary and the Spell table to the metadata producer at
`1458c05d7`. Its cached spell-ID lookup returns a pointer to a 64-byte record:
owned name at offsets 0..24, owned icon at 24..48 and the fixed dispel slice at
48..64. A missing ID or failed table open/header yields null. The current direct
call at `1458ed1dd` connects this getter to the target-debuff addon serializer
([canonical owner](evidence/addon-bridge/lists/manifest.json)); the call at
`145917d40` supplies ID zero during Begin warmup. These direct E8 references do
not establish complete computed/indirect/global reference coverage.

`1458bef90..1458bf4a2` opens `DBFilesClient\ItemDisplayInfo.dbc`, obtains
requested display IDs through `1458bc2e0`, then calls the selected-name producer
at `1458bf214`. Its cached lookup returns the icon string pointer/length or a
missing value. Direct callers include custom menu item rendering and equipment
notification serialization (`145897875`); the manifest records all seven
observed direct calls to the two getters.

The collector `1458bc2e0..1458bc976` walks nine ordinary class records at
`146bbd128`: five armor display arrays (zero entries skipped) and each weapon's
five displays. It then walks nine PvP class records at `146bbe098`: two armor
variants (zero entries skipped) and weapon pairs flattened by
`1459b0ea0..1459b1258`. It appends 66 display IDs from the fixed strided table
at `146bba4f0` (the first 64 also have a precomputed contiguous copy at
`146bb9200`) and 20 fixed IDs at `146bb9300`, then sorts and deduplicates u32
values. Original collector/flatten/deduplication instructions produce **540
unique IDs** from current native data. All **454 nonzero display IDs** requested
by the source Armory equipment catalog are a subset. The shared cache serves
additional consumers; this subset check does not claim every menu consumer is
connected.

All three table-header blocks require at least 20 bytes and `WDBC`. They compute
`row_count * stride` with wrapping u32 multiplication, widen that result, then
require `20 + product + declared_string_bytes <= actual_file_length`. They store
the declared column count without enforcing a schema or restricting field
reads to the stride. Extra trailing bytes are accepted. The string reader may
scan beyond the declared string extent to actual EOF. Header/open failure
cleans up and returns missing metadata; field/string access outside the actual
buffer follows the panic path. Error formatting and actual MPQ/OS reads remain
unexecuted. The lazy cache and publication behavior below is recovered separately.

## Live source connection

Current-source update: the [0.113.2 picker artwork repair](picker-equipment-art.md) also admits Picker to the shared gear-art loader. Native recovery below retains its 0.105.0 provenance.

[`native_dbc.rs`](../../crates/azeroth-survivors-re/src/native_dbc.rs) owns the
custom raw table laws and these two dictionaries. It reads the same three DBC
paths, preserves the native duplicate/empty/UTF-8 behavior, uses raw Spell name
column 120 and the fixed dispel descriptors.

[`gameplay/client.rs`](../../crates/azeroth-survivors-re/src/gameplay/client.rs)
warms the custom spell getter with ID zero at Begin (`145917d40`), separately
from the ordinary full SpellCatalog.
[`client/addon_lists.rs`](../../crates/azeroth-survivors-re/src/gameplay/client/addon_lists.rs)
uses the same lazy getter for each target-debuff name/icon fallback and fixed
dispel publication. A failed warmup leaves these actual requests able to retry. The
existing custom ability-name/icon branch remains ahead of the DBC fallback,
matching the separate branch in the native serializer. The ordinary engine
SpellCatalog remains available to its existing client/talent consumers.

[`armory.rs`](../../crates/azeroth-survivors-re/src/armory.rs) requests the shared
icon dictionary when a Character, Collection or Drop Tables gear page is
visible, then reads `Interface\Icons\{basename}.blp` for its equipment catalog's
base/faction displays. A failed dictionary request retries on the next visible
page update. It previously loaded only at Startup. The dictionary now selects
all **540 native display IDs**, retained in the generated
[`native-dbc-display-ids-0.105.0.json`](../../crates/azeroth-survivors-re/assets/native-dbc-display-ids-0.105.0.json),
so first initialization does not restrict shared cache membership to Armory's
454-ID subset. All IDs are checked against the original collector replay.
Texture decoding remains the ordinary asset consumer's separate responsibility.

## Lazy dictionary lifetime and synchronization

The [canonical lazy-cache manifest](evidence/custom-dbc/lazy-cache.json)
binds four additional current native ranges: the item/spell publication wrappers
`145d4d1d7..145d4d231` and `145d4d231..145d4d28b`, shared 48-byte map-move closure
`1458b9810..1458b9893`, and shared Once synchronization
`145d67f70..145d6811b`. It references the existing getter extracts instead of
copying them.

The item cache lives at `1480045d0`, with state at `148004600`; the spell cache
lives at `148004608`, with state at `148004638`. Both state words are **3** in
the supplied PE. State 0 is complete, 1 is publishing, 2 is poisoned and bit 4
records waiters. Each getter builds its dictionary while the shared state is
incomplete, **before** entering Once publication. No load lock encloses MPQ
reads or dictionary construction. Failed chain/file opens and invalid headers
return missing metadata without changing state, so later getters retry.

Only successful construction reaches publication. The wrappers check state,
then use the shared forced Once path. Its atomic compare-exchange claims the
publisher state, the callback moves all 48 map bytes and clears the local
owner, and atomic exchange completes state 0. Waiters use the imported
WaitOnAddress/WakeByAddressAll path. A competing successful builder waits for
that publication, retains its own unconsumed local map for disposal, and reads
the first completed cache. A successful **empty** dictionary is equally final;
a missing key in that cache does not re-open tables. The two globals have
process lifetime, with no per-run, locale or menu reset in these owners.

`native_dbc.rs` mirrors this with independent static `OnceLock` dictionaries.
`get_or_try_publish` first reads an existing cache, builds fallibly outside
`OnceLock::set`, and returns the first published result. Failed loading leaves
the cache unset. Successful competing loads use `set`'s wait/first-success
semantics. This reproduces the recovered contract without manual OS-specific
atomic or wait primitives. Spell.dbc headers are validated before opening
SpellIcon.dbc, preserving the native failed-first-table boundary.

## Static validation and remaining limits

`python3 -B scripts/check-custom-dbc.py` verifies the four original
selected extents and executes **23 original string-reader cases** with synthetic
DBC buffers. Its original UTF-8 validator executes without a replacement seam.
[Retained reader results](evidence/custom-dbc/native-vectors.json).

`python3 -B scripts/check-custom-dbc-dictionaries.py` verifies both
canonical manifests, table literals, original loader ranges and direct calls.
It executes **58 original-instruction cases**: 31 dictionary emissions covering
ID zero, empty/duplicate/invalid strings, requested first matches, raw base names,
missing icons and all dispel branches; 24 header admissions covering all three
table blocks, short/bad headers, exact/short extents, field-count independence
and wrapping multiplication; two occupied-bucket replacement branches; and one
current-data display-ID collection/flatten/deduplication case.
[Retained dictionary results](evidence/custom-dbc/native-dictionary-vectors.json).
Allocation, memcpy, hashing and map insertion in producer-loop cases are explicit
fixture seams. Collector allocation and sorting are also explicit seams; native
selection, pair flattening and deduplication execute without substitution. The
original occupied-bucket instructions independently verify replacement writes
and returned old payloads. Source consumer assertions and
rustfmt parsing check the connection without executing Rust.

`python3 -B scripts/check-custom-dbc-lazy.py` verifies the lazy manifest,
initial state words and callback tables, then executes **20 original-instruction
cases** across both getters: failed chain open, file read and header followed by
successful retry; successful-empty finality and open order; complete 48-byte
publication; a later builder retaining the first map; a controlled waiter;
waiter wakeup; forced publication after poison; and a competing builder winning
between construction and publication. Allocation/drop, synthetic MPQ files,
dictionary producers and OS wait/wake calls are explicit seams. Getter control
flow, shared Once atomic transitions and map movement remain original PE
instructions. [Retained cache results](evidence/custom-dbc/lazy-native-vectors.json).
Source assertions bind the two independent static caches and fallible-load-before-
publication ordering. Rustfmt parses the changed source without compiling it.

No compilation, game launch, real MPQ compatibility or original/rebuilt
comparison was performed. The raw-slice Ghidra profile uses a generic GCC ABI
and omits external code/data; original PE instructions govern Win64 arguments
and fields. Complete native readers/call/global/indirect coverage, all callers
of the shared icon cache, OS synchronization behavior and runtime/parity remain
open under #41. The bounded lazy retry/first-success/lifetime source task is
implemented and statically checked; it does not establish complete #41 recovery.
