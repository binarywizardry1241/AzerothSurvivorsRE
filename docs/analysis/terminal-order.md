# Terminal stop order

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/terminal-order/manifest.json) binds six fresh
Ghidra 12.1.4 imports, independently decoded PE ranges and the live source
connections. [verification-needed](../verification-needed.md) owns permanent gap #9 and
the remaining terminal/startup scope. This report covers one source correction;
it does not promote historical terminal behavior to current-target parity.

## Native collection ownership

Current stop owner `145924710..145924e6d` visits hostile actors, combat followers
and loot companions in that order. Within each collection it preserves row
order when collecting and emitting stop packets. Its hostile vector remains
Game `+560/+568`, stride `1d8`; combat followers remain `+d0/+d8`, stride `78`;
loot companions remain `+940/+948`, stride `70`. Each emitted stop advances the
same wrapping `u32` movement serial at Game `+a64`.

The reviewed current hostile append windows are:

| Producer boundary | Current native window | Operation |
| --- | --- | --- |
| Ordinary actor | `14594e55a..14594e59e` | Copy one `1d8`-byte row at the old count, then increment Game `+568`. |
| Guardian inside the live tick | `14593e5db..14593e61f` | Append to the same vector before publishing its lair record. |
| Primary boss | `14596e07f..14596e0c7` | Append to the same vector before its boss-specific branches. |

Combat-follower constructor window `1459670f3..1459671a0` appends at the old
Game `+d8` count and copies its GUID to row `+20`. The retirement window
`14593235b..145932485` skips removed GUIDs and copies later survivors forward
without changing their relative order. These are bounded instruction windows,
not recovery of every constructor, mutation or indirect caller. The source's
ordinary/guardian vector, boss vector and demon retirement also use stable
append/retain operations; arbitrary additional native mutation remains #41.

## Source correction

The adapter splits the native hostile vector into ordinary/guardian actors,
bosses and [ward actors](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/raid-wards-0.109.0.md), and the native combat-follower
vector into ordinary pets and special demons. The current ward chain carries
its paired allocation order into the same hostile merge; it does not create a
separate terminal packet group. Its terminal merge previously sorted these rows by the low 24 bits of
their GUID relative to the current counter. Those bits repeat after 16,777,216
allocations. A surviving old row can therefore move after a newer row, and
equal low bits can make the source collection partition determine packet order.
The prior [0.108.0 report](terminal-errors.md) identified this limit.

The live `SharedCounter` now retains an internal `u64` allocation sequence.
One atomic operation returns both the unchanged native `u32` serial and that
operation's sequence. `creature_guid_with_order` composes the same GUID from
the native low 24 bits and retains the paired sequence separately. Existing
`next`, `creature_guid`, object GUIDs and `value` still expose exactly the
same wrapping native values and consume exactly one allocation per call.
Cloned synchronous allocation ports share this one counter.

`RunActor`, `RunBoss`, `Pet` and `Demon` retain the sequence as adapter metadata.
Guardian batches carry it through `GuardianSpawn`; both follower families carry
it through `pets::InitialState`. No caller reads the counter later to infer the
sequence of an earlier row. `terminal_movement` merges each split collection by
full sequence age, preserving chronology across low-24-bit GUID and native
`u32` wrap. Its stop admission, interpolation, primary-height query, three-family
order and packet consumer are unchanged. Loot companions already occupy one
ordered source vector and need no extra merge metadata.

This sequence is an adapter detail, not a newly recovered native Game field.
The plain-`u32` `NativeCounter` implementation remains a native leaf-fixture
counter; only the live `SharedCounter` retains full chronology. A survivor
spanning a complete `u64` allocation cycle is outside this bounded adapter
claim. No chronology value is persisted or sent in a packet.

## Static verification and limits

```sh
python3 -B scripts/check-terminal-order.py
```

The checker verifies the newest installed identity, six native/text hashes and
live allocation/producer/merge connections. **219 bounded native executions
pass**: 21 hostile appends, seven follower appends, all 127 retirement masks for
zero through six followers, and 64 terminal-stop executions. The stop executions
receive rows already arranged in native order; they check three-family packet
order, aliased GUIDs and movement-serial wrap. Distinct positions identify packet
order even when GUIDs alias. A separate **64-case Python merge model** checks all
partitions of four rows, repeated GUID serials, native `u32` wrap and internal
sequence wrap. It exposes **eleven disagreements** with the prior GUID-age model;
neither model executes the Rust merge or a native allocation chronology field.
Source regression cases additionally describe paired chronology,
shared-handle interleaving and unchanged emitted serials; they were not compiled
or executed.

Unicorn executes only original instructions in the reviewed windows, rejects
unreviewed instructions and confines writes to scratch memory. Explicit seams
replace temporary-vector growth, primary-height misses, packet construction,
deallocation and memcpy. Append fixtures supply sufficient capacity; allocator
failure and native callees do not execute. Python chronology transcription and
source token checks supplement manual tracing; they do not execute Rust.

All nine changed Rust files parse with the project `rustfmt` and child traversal
disabled. The Python checker parses and the focused whitespace check passes.
Compilation, compiling tests, games, packet/ack runtime behavior, input/rendering
comparison and original/rebuilt parity were intentionally not run. Complete
startup/channel/auth/roster/summary/progression and raw ComponentId/global/indirect
ownership remain open under #9/#41; this repair closes only the identified
GUID-cycle ordering source defect.
