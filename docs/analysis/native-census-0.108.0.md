# Native census — 0.108.0

**Historical target:** this report covers only the 0.108.0 hash below. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status; generic commands now select the newest installed EXE.

Target SHA-256 `dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`;
140,203,520 bytes, read in place. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own
current implementation limits. Builds, compiling tests and games were not run.

## Complete declared-unwind linear pass

The [bound summary](evidence/0.108.0/instruction-summary.json) records Capstone 5.0.7:
all 346,865 extents, 23,014,369 instructions and 93,046,030 unique bytes,
zero undecoded suffixes. Exact extent/operand bytes, direct call/branch leads,
static memory operands/access flags and unresolved indirect sites are indexed
under ignored `runtime/coverage/<sha>/native-instructions.sqlite`.
The 71,824 indirect-call and 10,067 indirect-branch leads are not resolved.
The 5,072,864 executable virtual bytes outside declared extents receive the
separate complement pass below; they are not added to declared-body coverage.
Linear decoding does not prove reachability, semantic function ownership,
source equivalence, global reader/writer aliasing or native completeness.

## Full-image Ghidra discovery

REA 6.5.0 / Ghidra 12.1.4 analyzed the full PE with the isolated
`full-image-no-address-tables` profile: 347,198 retained entries,
346,850 native plus 348 external-space imports. 16 declared starts
are absent from that queue. Ten completed query sets observe zero decoded
instructions and 12 incoming DATA references. These one-byte bodies are observations,
not native decoding or certified placeholders. The complete retained transport
export is reused with its exact target/Evidence/profile validation.
`Disassemble Entry Points`, `Create Address Tables` and the other recorded
bounded-profile passes are disabled; complete Ghidra bodies/references are
unknown. A fresh 0.108.0 `full-image-entry-decoding-extended` attempt with
6 GiB / 600 s reached the startup deadline after **602.045 s**, before any
inventory/body query completed. The [compact failure record](evidence/0.108.0/entry-decoding-timeout.json)
keeps this distinct from the historical 0.107.0 6 GiB/1,800 s timeout.

## Bounded omitted-entry recovery

The [fresh bound manifest](evidence/0.108.0/omitted-native-entries.json) covers
all sixteen declared entries missing from current full-image discovery. One
30,499-byte raw range, sixteen function/code seeds and 48 retained facets
produce sixteen matching declared bodies: 755 instructions / 2,989 selected
bytes / 151 outgoing references. Independent Capstone boundaries agree.
The one-byte RET body is valid. Raw import omits PE imports, global callers,
external targets and source semantics; it does not add entries to the global
queue or close #41. Earlier 0.107.0 extracts were not relabeled or reused.

## Executable complement and forwarding boundary

The [complement summary](evidence/0.108.0/unwind-complement-summary.json) accounts for
all **326,767 regions / 5,072,864 bytes** outside declared unwind extents.
All are file-backed on this target. Mapping uses executable virtual bounds,
excludes raw alignment slack, and retains explicit zero-fill handling for other
images. The existing 309 MiB instruction inventory is an unchanged, hash-bound
input; neither its generator nor historical records were rewritten.

Its 376,048 incoming direct-reference leads select **2,635 seed addresses**.
Following encoded branch successors and call continuations within mapped
complement ranges decodes **69,312 instructions / 298,060 unique bytes**, with
no overlapping alignments. Returns, unconditional/indirect jumps, traps, invalid
encodings and mapping exits stop a path. Computed targets remain unresolved.
The byte partition is disjoint:

| Category | Bytes |
| --- | ---: |
| Decoded candidates | 298,060 |
| Uniform CC candidates | 917,454 |
| Uniform NOP candidates | 10,830 |
| Exact canonical x86 NOP/CC sequence candidates | 1,564,677 |
| Mixed/other residual, still unclassified | 2,281,843 |

Padding candidates are observations, not proof that bytes are unreachable or
noncode. Unseeded routines/data can remain inside mixed gaps. The inventory
retains each range/hash, incoming seed provenance, encoded instructions,
references and explicit flow stops. It records 639 unresolved indirect jumps
and 120 encoded imported-pointer transfer sites touching 114 IAT slots;
slot association does not establish runtime callees or imported implementations.

The [bounded Ghidra evidence](evidence/0.108.0/unwind-complement/manifest.json)
selects the region with the most incoming leads, ties by address: 94 bytes at
`0x1400021b2`, with 239,603 incoming leads to five entries. Four five-byte direct
jump stubs and one one-byte RET agree with independent decoding. Following all
four destinations to current unwind entries adds 146 instructions / 415 bytes;
all nine bodies total **151 instructions / 436 bytes** with matching boundaries.
Exact destination IAT operands name `GetProcessHeap`, `HeapFree` and
`HeapReAlloc`, exposing a shared heap-management boundary. Raw-import synthetic
external names are not DLL ownership. Two pseudocode results carry bad-data/PIC
warnings, so signatures, allocator ABI and complete source semantics remain
unproven; exact disassembly is the canonical extract.

The independent standard-library checker recomputes mappings, byte hashes,
incoming seeds, flow closure, instruction unions and residual accounting.
Changed present inventories fail; absent disposable inventories remain explicit
reproduction warnings. None of this closes global Ghidra bodies/references,
indirect/global/source ownership, remaining unclassified bytes or #41.

## Reproduce

Use an existing Python Capstone installation for decoder commands:

```sh
python3 -B scripts/inventory-current-target.py --check
python3 -B scripts/discover-native-ownership.py --check
python3 -B scripts/inventory-native-instructions.py --write
python3 -B scripts/census-current-target.py --run --full-profile full-image-no-address-tables --limit 10 --timeout 180 --startup-timeout 600
python3 -B scripts/prepare-omitted-native-entries.py
python3 -B scripts/inventory-unwind-complement.py --write
python3 -B scripts/prepare-unwind-complement-probe.py
python3 -B scripts/prepare-unwind-complement-probe.py --destinations
python3 -B scripts/curate-unwind-complement-probe.py
python3 -B scripts/check-reconstruction-coverage.py
```

Run each prepared probe's printed plan through `scripts/rea-batch.py` before
curation. Use fresh output directories; retained evidence is not overwritten.
Curation reuses the two recorded probe directories and the last whole-image
failure session. The whole-image retry command is:

```sh
python3 -B scripts/census-current-target.py --run --full-profile full-image-entry-decoding-extended --limit 10 --timeout 180 --startup-timeout 600
```

Pass the printed omitted-entry plan to `scripts/rea-batch.py`. Preparation
rechecks exact current input, retained discovery export/profile, missing-start
selection, seed/range bytes and bounded scope. The fresh replay range/seed and
all 48 operation definitions were reproduced without a second provider run.
The generic tools always resolve and verify the newest installed target.
The 14 decoder, 24 collector, 23 accounting, 6 diagnostic-selection and 5
omitted-selection regressions passed (72 total); none starts a provider,
compiles source or runs a game. Target-native observations above are separate.
The complement work adds **46 passing regressions** (18 mapping/flow, 21
independent accounting, seven probe selection/curation); the 14 existing instruction and
23 existing accounting regressions also pass. These are Python-only checks;
no compilation, game launch or original/rebuilt comparison ran.
