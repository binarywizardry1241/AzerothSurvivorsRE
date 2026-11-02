# InputGate native boundary in 0.139.1

Target: installed `AzerothSurvivors.exe` 0.139.1, 150,633,472 bytes, SHA-256 `1c0912276637a41a1a971886bb74626577d021af55a313128f85fdbfcc3b2f1d`.

This is a bounded contract for **#310**, under `engine-selected-target-deltas`, outside the 77 AS diagnostic-module denominator. The [evidence manifest](evidence/0.139.1/input-gate-native.json) binds current bytes, source receipts, descriptors, instructions, tables, two executed query plans, four successful operations and their original journals/results. It establishes neither a source assignment nor complete input isolation. Current source actions and validation remain in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Source-first boundary

The question was which callable the new `InputGatePlugin` name actually selects, then which input records that callable filters. Existing `LocalClientExtension` overlay capture/reset, `UiKeyboardCapture`, bindings and `UiInput` ordering are reusable source interfaces. No local `host_controls::input_gate` or `InputGatePlugin` implementation was found. Their similarity does not identify the native resource layout or establish that the current source already implements the new gate.

## Name, descriptor and callback

Inventory selector `Q41-I01:module_type_namespace:241` contains the exact 55-byte name at `0x14651a8e0`. A 13-byte leaf at `0x1401a0290` returns that pointer and length. The sole absolute pointer to this leaf is descriptor slot `0x1465193c8`, at `+0x60` within the 112-byte descriptor beginning `0x146519368`.

Code at `0x140108a33` supplies that descriptor in `R9` to `0x145b5d240`. The consumer saves the descriptor, calls its `+0x60` name slot and, on its ordinary path, its `+0x40` callback slot. The latter points to declared owner `0x1408882e0..0x140888a05`. This follows the available Bevy `Plugin` build/name interface and is stronger than the namespace literal alone. The registration owner first admits a result `AL <= 1` from `0x140118880`; that predicate and successful execution remain unproved.

The [callback pseudocode](evidence/0.139.1/input-gate/owner-1408882e0.c) mainly constructs resource and system configuration. Original instructions prepare a 16-byte key at `0x1465af888`, size `0x38`, alignment 8 and cleanup pointer `0x1401a2430`. These are raw metadata observations. They do not name the resource or assign it to a local Rust struct.

The callback also uses descriptor `0x14660b4c8`. Its slot `+0x48` points to `0x1408981a0..0x140898397`. This wrapper fetches two resources and directly calls `0x140f1f330` at `0x1408982af`. The descriptor/slot/wrapper edges and original Win64 operands are retained independently of Ghidra's inferred signatures. Exact formatter payloads `UiInput`, `UiInputViews` and `BindingHead` provide input-interface leads; their presence does not establish before/after ordering, set membership or admission predicates.

## Record filter

The 595-byte owner `0x140f1f330..0x140f1f583` filters a queue in place. At entry, `RCX` supplies a structure whose `+0x8` is its record pointer and `+0x10` its count; `[RDX]` supplies the gate-data pointer. Records have stride `0x60`. Two gate-data pointer/count pairs, `+0x8/+0x10` and `+0x20/+0x28`, feed external predicates `0x14062c190` and `0x14062bf10`.

The raw dword at record `+0x40` selects index zero below `0xc3`, otherwise `raw - 0xc2`. Independent reads of the two four-entry tables at `0x146695010` and `0x146695020` resolve the first-scan and compaction paths. All eight entries target checked instruction starts in this owner. The producer's valid tag range is still unknown; this body supplies no upper-tag guard.

For those four observed indices:

| Index / raw value | Drop condition |
| --- | --- |
| 0 / below `0xc3` | Gate byte `+0x30 == 1` and record byte `+0x4c == 0`, except raw codes selected by mask `0x7b18000000000000`; otherwise drop if either external list predicate returns nonzero. |
| 1 / `0xc3` | Record byte `+0x4 == 0` and the second gate byte selects capture. |
| 2 / `0xc4` | Retain. |
| 3 / `0xc5` | The second gate byte selects capture. |

The mask selects raw codes 51, 52, 56, 57, 59, 60, 61 and 62. Their key names are not established. For indices 1 and 3, the first scan tests gate byte `+0x31 != 0`, while compaction tests `== 1`; these agree for bytes 0/1. The producer's boolean invariant remains unproved, so behavior for other raw values is not collapsed into one predicate.

Each discarded record is passed to `0x140f4c360`. Later retained records are copied in six 16-byte chunks to close gaps, preserving order, and the queue count becomes the number retained. Predicate equality/type semantics, teardown internals, unwinding, capture/list producers and resets remain separate boundaries. Raw tags and bytes are not named as keyboard, mouse or wheel enums without the missing typed connection.

## Native analysis limits and next source action

Both raw-slice queries completed `procedure_info` and `procedure_pseudo_code` on their first attempt: four completed operations, zero failed operations, no full-PE import. The callback has one reported contiguous 1,829-byte body and 39 blocks. The filter's Ghidra body covers only 144 non-contiguous bytes and four blocks; its [pseudocode](evidence/0.139.1/input-gate/owner-140f1f330.c) stops at an unrecovered indirect dispatch. The complete filtering observations above come from independent current instruction/table checks, not a claim that Ghidra recovered the full filter. Eight wrapper and 25 filter direct branch targets were checked against actual instruction starts.

Raw imports use Ghidra's generic GCC specification. Inferred parameters and types are not Win64 ABI proof, and external callees/data are absent from those Programs. Exact resource/list producers and lifetime, event enum identities, system ordering, modal admission and the picker/menu/world input consumers must be recovered before assigning or repairing source. Existing source applicability remains pending; a new target does not itself prove missing implementation. No compilation, application, game/client/server execution or original/rebuilt parity check was performed.

## Separate Wine/Proton boundary: #311

The current Windows helper at `0x1431cc110..0x1431cc197` calls `MapVirtualKeyW`, constructs two `INPUT` records, calls `SendInput`, then `SetForegroundWindow`. This corresponds to the existing winit `force_window_active` interface. Another bounded Windows owner compares the supplied handle with `GetActiveWindow` before its `ClipCursor` path. These ordinary platform interfaces do not identify the supplied 0.139.1 Wine/Proton alt-tab repair or its crash cause. No edge from the InputGate contract to that repair was established. macOS BgWin/ThreadQoS, AltF4 and XInput Wine detection remain separate context.
