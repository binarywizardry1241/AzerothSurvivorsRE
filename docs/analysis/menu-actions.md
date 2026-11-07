# Home actions and selected-zone policy

Recovered on 2026-10-18 from the selected 133,231,104-byte EXE at
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
No game process, browser or external destination was opened.

## Top controls and dispatch

The current top-controls constructor, `0x140245750..0x1402467c2`, creates these
controls in order. The containing root-row geometry is owned by the separate
home-screen recovery.

| Control | Action byte | Construction instruction | Dispatcher target |
| --- | --- | --- | --- |
| Localized `picker.support` | 12 | `0x140245ae2` | `0x14009a57b` |
| Discord icon | 11 | `0x140245f3d` | `0x14009a828` |
| Current locale's native name | 13 | `0x1402461cd` | `0x14009a62d` |
| Localized `picker.options` | 8 | `0x1402461d8` | `0x14009a846` |
| `X` | 7 | `0x14024621c` | `0x14009a6e4` |

These action bytes are distinct from the command/message tags emitted by the
dispatcher. The fourteen-entry jump table at `0x1458fc524` binds each action to
its exact destination in `0x140099b40..0x14009abc0`.

Support passes the exact 29-byte URL `https://wow.aethus.pl/support` from
`0x1458fa958` to the shared URL helper at `0x140091c00`. Discord passes the exact
28-byte URL `https://discord.gg/UzxaZuSAk` from `0x1458fa93c` to the same helper.
The Windows helper constructs the literal command `explorer` from
`0x1458fafbc`, appends the supplied URL as one argument, invokes its process
operation, and logs a “could not open” error when that operation fails. No
confirmation branch appears in either URL action or the shared helper. Actual
process creation and browser handling were not executed; the standard-library
callee symbols were not recovered as original source names.

Language action 13 XORs the language-visible boolean with one. The control's
text comes from current-locale record fields `+16/+24`, read after the locale
getter at `0x1402461a6`; it is the native locale name, rather than the localized
`picker.language` heading. The language pane at `0x1402707e0..0x140271a03` uses
that heading internally and creates thirteen explicit locale rows, at a
56-byte locale-record stride, with the current locale marked by a code/length
comparison. It finishes with the existing scrollbar constructor. The separate
visible-pane wrapper `0x1401d8610..0x1401d8caa` gates construction and uses
GlobalZIndex 5003. Pane placement and row styling are separate from this action
recovery.

Options action 8 sets its owning visibility/state fields and initializes its
existing panel state. Quit action 7 directly appends a zero-payload message to
the application's message queue; the source integration identifies this as the
successful exit message. No quit-specific confirmation branch appears.

All of these actions share the dispatcher gate: the interaction byte must be
zero; when the common state tag equals one and its associated float is
nonnegative, dispatch is skipped. This gate is visible independently at
`0x140099f5d..0x140099f84` and `0x14009a169..0x14009a186`. The initial state test
also compares against the stored `-1.0` constant at `0x1458eb4fc`. The initial bounded pass did not identify the broader state. The subsequent
[Enter/input recovery](menu-input.md) binds this same resource to the
entering transition, its current keyboard producer, input lock and timeout.

## Current zone policy

The 71-byte leaf `0x145427250..0x145427297` scans the save's class-unlock slice:
pointer at save `+32`, count at `+40`, 16-byte records with class byte at `+0`
and unsigned 64-bit unlock value at `+8`. It returns one for a missing class or
zero value, otherwise the minimum of the stored value and twelve.

The selected-zone helper `0x14541d7f0..0x14541d987` independently uses the same
cap. If the current resolved zero-based zone index is below that count, it
retains the current key. Otherwise it replaces the key with the last unlocked
zone's current table key, at index `open_count - 1`. Its new table stride is
240 bytes. Neither function rewrites the stored unlock value or performs save
migration; migration elsewhere in the application is outside this pass.

[catalog-zone-policy-fixtures.json](evidence/0.97.2/catalog-zone-policy-fixtures.json)
records unchanged native instruction outputs from bounded Unicorn 2.1.4:

- 81 count cases cover all nine classes with missing, zero, 1, 9, 10, 11, 12,
  13 and maximum-u64 stored values; an unrelated class record precedes each
  tested class record.
- 216 selected-zone cases cover every current zone index for Warrior and
  Druid under those same values.
- All outputs agree with `max(1, min(stored_or_one, 12))` and
  `min(selected_index, open_count - 1)`.

The selected-zone lookup call is deliberately stubbed to each supplied
existing index. Allocator/memcpy/deallocation calls are bounded in-memory
operations; every other external call aborts. These fixtures establish count
and replacement policy, not save parsing, migration, key lookup, rendering or
game-runtime parity.

## Evidence and reproduction

[catalog-actions-native.json](evidence/0.97.2/catalog-actions-native.json)
retains five complete REA/Ghidra Evidence records, unchanged source spans and
hashes, original full-PE disassembly, exact URL/command bytes, and the action
jump table:

| Body | REA Evidence ID |
| --- | --- |
| Dispatcher `0x140099b40` | `ev_1a228619104072bb170dc4a7dee530cf3b3a6ca989ae5783d2b92c326f6a420d` |
| URL helper `0x140091c00` | `ev_c85b4dbe0b6e6b143fbdf1a291cab1913e6357f592f6084e356ed01a02ca3dea` |
| Language pane `0x1402707e0` | `ev_72865f588481704706d5477245d94f1cfcb56938beed6dbf9d3292dd7632c90c` |
| Selected-zone helper `0x14541d7f0` | `ev_33580dd29043ac2c4fd35ca0e327be8317b826c6c303ce2be7835d75308df273` |
| Open-zone count `0x145427250` | `ev_6c25eb6b8580ff5f44a2fc6d08e9dbf27a22eb2ea61d0485c35100196d0dd4c6` |

Raw imports use Ghidra's generic GCC compiler specification. The current
Windows x64 instructions and independently recovered constants/jump-table data
are therefore necessary to interpret arguments and actions. Ghidra pseudocode
is not the original Rust source.

Run from this checkout, with the selected reference present:

```sh
python3 scripts/recover-menu-actions.py --prepare
python3 scripts/rea-batch.py runtime/analysis/history/interface/menu-actions/213951b39c5b/plan-140099b40.json
python3 scripts/rea-batch.py runtime/analysis/history/interface/menu-actions/213951b39c5b/plan-140091c00.json
python3 scripts/rea-batch.py runtime/analysis/history/interface/menu-actions/213951b39c5b/plan-1402707e0.json
python3 scripts/rea-batch.py runtime/analysis/history/interface/menu-actions/213951b39c5b/plan-14541d7f0.json
python3 scripts/rea-batch.py runtime/analysis/history/interface/menu-actions/213951b39c5b/plan-145427250.json
python3 scripts/recover-menu-actions.py --collect
python3 scripts/recover-menu-actions.py --fixtures
```

The batch runner requires fresh output directories on a repeat run. The
fixture helper reuses the existing project-local Unicorn dependency at
`runtime/tool-state/python/armory/python-libs`; it installs nothing. All five native
queries completed and closed their sessions. No build or game launch was run
in this action-recovery subtask.
