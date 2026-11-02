# Executable unwind-handler destinations — 0.115.0

Target SHA-256 `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This bounded **Q41-M01/A01/A02** classification resolves the field roles of all
**14 executable destinations without actual bodies in the saved Ghidra census**.
The selector is independently rederived from all **3,766,641** saved references
and the hash-bound body inventory. All **73,393** selected records have type
`DATA` and address exact PE unwind-handler RVA fields.

[The proof](evidence/0.115.0/unowned-unwind-destinations.json) binds the complete
selected field projection, checker source, original reference/body files, metadata-reader
sources, two import thunks, all twelve native callback entries and the 35
metadata records selecting those native callbacks. Bulk reference rows remain
in the ignored census. Curated evidence stores hashes and compact field/flow
records without duplicating full native assembly.

## Exact field and destination roles

The source field is the aligned exception-handler RVA in AMD64 version-1
`UNWIND_INFO`. The existing metadata reader checks the version and flags,
aligns the unwind-code array, follows chained records and locates this
four-byte field. Its little-endian value plus the PE image base equals the
referenced destination in every selected row. This interpretation follows
[Microsoft's x64 unwind format](https://learn.microsoft.com/en-us/cpp/build/exception-handling-x64?view=msvc-170).

| Destination | Selected fields | Current role |
| --- | ---: | --- |
| `0x145b4a160` | 1 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145b4a2e0` | 2 | Native `UNW_FLAG_EHANDLER` callback; shared restore tail |
| `0x145b4ac70` | 2 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145b58270` | 1 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145b612c0` | 4 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145b624d0` | 2 | Native `UNW_FLAG_EHANDLER` callback; shared restore tail |
| `0x145b62530` | 2 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145b65a90` | 3 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145b65bd0` | 1 | Native `UNW_FLAG_EHANDLER` callback; shared restore tail |
| `0x145b680a0` | 2 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145b6c280` | 1 | Native `UNW_FLAG_EHANDLER` callback; shared restore tail |
| `0x145b6c2f0` | 14 | Native `UNW_FLAG_EHANDLER` callback |
| `0x145d145f5` | 73,356 | Exact `JMP [IAT]` thunk to `VCRUNTIME140.dll!__CxxFrameHandler3`, slot `0x145eb8240` |
| `0x145d14619` | 2 | Exact `JMP [IAT]` thunk to `VCRUNTIME140.dll!__C_specific_handler`, slot `0x145eb8270` |

The twelve native entries account for **35** fields. Each of those records
starts with header bytes `09 00 00 00`: version one, `EHANDLER`, zero prologue,
zero unwind-code slots and no frame register. The handler RVA is immediately
at header+4. Each record maps back to its exact protected `RUNTIME_FUNCTION`
interval, retained in the proof. Callback identity is established by this
metadata relationship; the eight callee-save pushes are an additional checked
instruction observation.

The PE contains **73,410** unique handler fields in total. The other **17**
lead to the already-owned entry `0x145d13b10` and are outside this selector.
The selected classification therefore retains the full metadata accounting
without assigning another 17 fields to these fourteen destinations.

## Necessary shared interface

Bounded branch traversal covers all twelve native callback entries, including
four entries that share earlier or later restore tails. Each reachable call
uses the exact current IAT slot `0x145eb80d8`, which the PE import table resolves
to `KERNEL32.dll!RtlVirtualUnwind`. No other call interface occurs in the
selected reachable paths. The shared tails remain one canonical set of byte
ranges: **695 unique instructions / 2,626 bytes**; per-entry totals sum to 847
instructions because tails are reused.

The exact boundary is Windows exception metadata → registered callback or
runtime thunk → existing OS/runtime unwind service. This is supporting
platform context. The selected fields and callback call graph establish no
missing AS mechanic or live source operation. The surrounding protected
algorithms, complete language-specific handler-data schemas and product/library
ownership are not inferred from these pointers. Generic engine/library/unwind
implementation stops at this boundary. Current co-op/server reconstruction is
owned separately by [#63](coop-0.115.0.md); these platform fields do not recover it.

The fourteen destinations retain their actual saved Ghidra body state. This
classification adds neither Ghidra bodies nor new global reference/instruction
coverage. It resolves these encoded field roles while leaving broader dynamic
aliases, source producer/consumer closure and original/rebuilt behavior under
#41 and the owning systems.

## Checks and limits

```sh
python3 -B scripts/check-unowned-unwind-destinations.py
python3 -B scripts/test-native-unwind-handlers.py
```

The first check verifies target identity, saved input hashes, the complete
reference selector, every selected field's exact metadata position and encoded
RVA, both IAT thunks, all 35 native callback registrations and twelve bounded
control-flow graphs. Instruction boundaries must agree across shared paths;
all branches must remain explicit and every call must resolve to the recorded
OS unwind import. The existing five metadata regressions pass, including
alignment, chains, invalid flags/targets and directory boundaries.

These checks decode original bytes and metadata. They do not execute native
instructions, callbacks, the protected functions, Windows exception dispatch,
reconstructed source or the application. No fresh Ghidra query, compilation,
compiling test, game launch or original/rebuilt comparison ran. Full native
semantics, runtime dispatch and parity remain unverified.
