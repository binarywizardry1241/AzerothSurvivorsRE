# Native census — 0.107.0

**Historical target:** only the 0.107.0 hash below is covered. Current installed-target status is in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md); generic reproduction commands select the newest registered target and cannot revalidate this historical EXE.

The full PE has a retained Ghidra procedure inventory, a complete linear pass
over declared unwind extents and bounded current diagnostic-owner observations.
**Global Ghidra decoding, complete
function ownership and source/parity reconstruction remain incomplete under
gap #41.** The numbered gap status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The input is the complete 140,192,768-byte Windows PE,
`installed-game/AzerothSurvivors.exe`, SHA-256
`92eaef3bc806144860ca838660286c02b66f9d7bbee0771f1f07a628209e9f7a`.
See the [target identity](target-refresh-0.107.0.json). All native runs used
`./scripts/rea`, REA 6.5.0 and Ghidra 12.1.4. No raw slice replaced this input.
No application build, compiling test or game execution was performed.

## Complete declared-extent instruction census

[instruction-summary.json](evidence/0.107.0/instruction-summary.json) commits a separate
Capstone 5.0.7 pass over **all 346,904 declared AMD64 unwind extents**. It decoded
**23,015,279 instructions / 93,046,505 bytes**, with zero undecoded suffixes.
The summed and union byte counts agree for this input. This replaces the former
diagnostic-only linear decoding boundary; it does not replace Ghidra function
analysis or prove reachable code, recovered semantics or native source ownership.
**5,072,917 executable virtual bytes outside declared extents remain unclassified.**

The ignored, digest-bound SQLite inventory retains each extent's byte hash,
file mapping, decoded endpoint and instruction count. Its indexed reference
leads contain exact instruction bytes and distinguish:

| Encoded lead | Records |
| --- | ---: |
| Immediate calls | 1,109,911 |
| Unresolved indirect calls | 71,819 |
| Immediate branches | 1,951,877 |
| Unresolved indirect branches | 10,063 |
| Static address formation (`LEA`) | 479,287 |
| Statically addressed memory operands | 159,269 |

Only RIP-relative and absolute unindexed, unsegmented memory operands receive
static addresses. Encoded read/write access flags are retained; they do not
establish runtime access or alias ownership. Indirect memory addresses remain
pointer slots, never resolved callees. Register-based memory, data types,
ID meanings, dynamic dispatch and code outside declared ranges remain open.

The generator uses Capstone's version-gated native detail view to avoid copying
the complete architecture union for every instruction. Other API majors retain
the public decoder path. Fast and ordinary paths produced identical results for
126,733 instructions in a 500,000-byte target sample, and regression fixtures
compare control/memory/truncation boundaries. No skip-data mode is used.

Reproduce with an existing Python Capstone installation:

```sh
python3 -B scripts/inventory-native-instructions.py --write
python3 -B scripts/inventory-native-instructions.py
python3 -B scripts/test-native-instructions.py
python3 -B scripts/test-reconstruction-coverage.py
```

`--limit N` checkpoints at most N additional extents. Resume requires identical
target, generator, parser, decoder and unwind records, and rechecks saved extent
byte hashes. A partial pass stays under `runtime/`; only a complete pass writes
the tracked summary. Changed tools require preserving the old database under
another ignored filename before a fresh pass. Default reporting is read-only.
The accounting preflight checks summary denominators, byte bounds, tool hashes,
retained database digest and explicit #41 limits without loading a decoder.
The **14 decoder/reference regressions and 23 accounting regressions pass**;
they compile no application code and start no provider or game.

## Full-image inventory and decoding limits

| Profile | Observed result |
| --- | --- |
| `full-image-bounded-analysis` | Startup deadline after **601.142 s**; no procedure inventory exposed. |
| `full-image-no-address-tables` | Full inventory retained: **347,237** procedure records = **346,889** native address-space entries + **348** external-space entries. A bounded pass completed 100 four-facet query sets, with **0 decoded instructions**, 0 outgoing references and **102 incoming DATA references**. Native queue: **346,789 pending**, 0 failed. |
| `full-image-entry-decoding` | Startup deadline after **601.779 s**; no completed inventory/query result exposed for this profile. |
| `full-image-entry-decoding-extended` | Separate **6 GiB / 1,800 s** resource profile; provider startup deadline after **1,801.922 s**. No new inventory/query result exposed. |

The declared unwind inventory contains **346,904** entries; **16** declared
starts are absent from the discovery-only native queue. Unwind extents are
candidates, not a complete function partition. The 348 external-space records
are retained separately; they do not establish reconstructed platform code.

The original startup bottleneck was
`AddressTableAnalyzer.removeNonSearchableMemory` / `AddressSet.subtract`.
The changed profile disables its exact registered name,
`Create Address Tables`. The earlier exclusions remain `Stack`,
`Decompiler Switch Analysis`, `Function ID`, `Function Start Search`,
`Disassemble Entry Points`, `Subroutine References`, `Data Reference`,
`Reference`, `Non-Returning Functions - Discovered` and `Shared Return Calls`.
Automatic pointer-table discovery and omitted discovery/reference passes remain
unknown.

This change allowed analysis to finish, but the complete procedure result
exceeded MCP's 10 MiB response admission budget. The first such response arrived
after **60.108 s**. The repaired collector exports the complete retained Evidence
on the same connection, without truncating or repeating the producer query.
The resulting **34,741,796-byte** inventory export has SHA-256
`0943315ff856b10298e5702a6e9da0d2f6bd10905529237596e54c3c55644968`,
Evidence ID
`ev_da00d51e73e33aa879862ff7239a73664c7a9af105862c219698cad409c1de17`,
and profile digest
`a6dac4497105714befbd8aa2427db99195c21d321f3348a1809e5e88101b24b5`.
The saved inventory was validated and reused for queue construction after
separating `EXTERNAL:0x…` entries from native body queries.

The 100 completed query sets are **queried without decoded instructions**:
their bodies remained one-byte placeholders. Query completion does not imply
decoding. The separate entry-decoding profile enables only
`Disassemble Entry Points` relative to the preceding exclusions. Its captured
stacks progressed from instruction insertion to
`EntryPointAnalyzer.fixDummyFunctionBodies` / `CreateFunctionCmd.fixupFunctionBody`
and database reads before the deadline. The late heap observation was about
1.23 GiB used with a 2 GiB maximum; heap exhaustion was not demonstrated.
Neither unchanged failed profile was repeatedly retried.

The extended attempt used the same analyzer exclusions as entry decoding and
no seeds, with its own progress store. Increasing the heap and deadline did not
expose a completed result. Its retained diagnostics do not identify the final
blocking analyzer or establish heap exhaustion; no new thread-stack observation
was collected. The run failed before provider profile handshake, so no new
analysis-profile Evidence digest is claimed. Earlier successful discovery and
all independent linear/raw-range results remain separate. Future work needs a
changed analysis strategy rather than treating more timeout budget as recovery.
The collector rejects a changed recorded heap limit on resume, preserving the
resource-attempt evidence, and retains explicit one-byte/unknown body metrics.

## Bounded current diagnostic owners

The [curated selection manifest](evidence/0.107.0/native-census-selection.json)
binds the target, source inventory digest, all 53 path/owner byte hashes,
selection rule, seed commitment, profile, Evidence IDs and observed body limits.
The selection takes the smallest instruction-verified owner extent per custom
diagnostic path, breaking ties by owner then instruction address. Shared owners
are deduplicated while preserving every path mapping. This target yielded
**53 unique entries**, totaling 60,225 declared extent bytes.

The complete PE was loaded with the no-address-tables/no-global-entry profile
and exactly 53 function plus 53 code seeds. The seed digest is
`b9a5e9013050a9714d78d16b6956baf157dba877c7f346bb60f8fdc31822a540`;
the resulting profile digest is
`6055665adb827d73f19efcc63bedb89def6a8f52285d257e560e89fd8000b359`.
Seeds are caller-selected entries, not additional discovered functions.
The startup bound was 300 s; the first deep query returned after **294.713 s**.
All **212** requested instruction/reference/info operations returned retained
Evidence, with 0 failed query sets.

Those observations contain **1,595 instruction strings**, **366 outgoing** and
**245 incoming** reference records. However, **46 owners still have one-byte
placeholder bodies**, including `screens/markers.rs` at `0x1400e6610` and
`game/hazards.rs` at `0x1459c8320`. Seven owners have richer bodies: five match the
declared unwind extent and two differ, including non-contiguous ranges.
Matching an extent does not prove exact function ownership or source behavior.
Zero reported unresolved calls does not resolve calls outside these bodies or
unknown computed flows. The selected query set is separate from the global
pending queue and does not replace it.

Full bundles, queues, protocol diagnostics and private Ghidra databases remain
under ignored `runtime/coverage/<target-sha>/ghidra/`. Only the compact ownership
and observation manifest is curated; assembly/protocol payloads are not copied
into the report. No system, release claim or gameplay/UI parity status is
promoted by these observations.

## Declared entries omitted by full-image discovery

The [omitted-entry manifest](evidence/0.107.0/omitted-native-entries.json)
recovers all **16 declared unwind starts missing from the discovery-only native
queue**. They fit within the exact 30,499-byte code range
`0x145bdb16d..0x145be2890` (exclusive end). The range and each selected extent
are independently bound to the full selected EXE by file offset, size and SHA-256.

REA/Ghidra raw import with exactly sixteen function and sixteen code seeds
returned **48 retained instruction/body/reference Evidence records**. All sixteen
observed contiguous bodies match their declared extents: **755 instructions /
2,989 selected bytes / 151 outgoing reference records**. Capstone independently
agrees on every instruction boundary and complete selected-extent byte count.
The one-byte extent at `0x145be288f` is a legitimate `RET`. A body-size observation
alone must not classify it as a placeholder; the collector now preserves one-byte
and unavailable-body counts without making that semantic assumption.

This bounded raw probe does not add entries to the full-image queue or recover
their PE imports, incoming references, external targets, source owners or runtime
reachability. It closes their unexamined declared-body decoding question only.
The full-image, indirect/global and source-semantic parts of #41 remain open.

Reproduce the exact selection from the retained full-image Evidence, never from
a guessed missing count or mutable queue status:

```sh
python3 -B scripts/prepare-omitted-native-entries.py
python3 -B scripts/test-omitted-native-entries.py
```

Preparation verifies the current target and exact retained procedure
Evidence/profile/export digest, compares every declared unwind start, and refuses
more than 128 entries or a range larger than 64 KiB. It starts no provider.
Run its printed plan through `scripts/rea-batch.py` to repeat native analysis.
The observed range bytes, seed bytes and all 48 operation definitions were
reproduced exactly without a second native run. All **five** static selection
regressions pass. Complete bundles and raw extracts remain ignored under
`runtime/coverage/<sha>/ghidra/`; only the compact bound manifest is curated.

## Reproduce and inspect

The prerequisite whole-file and diagnostic inventories are generated by
`scripts/inventory-current-target.py --write` and
`scripts/discover-native-ownership.py --write`. Their current canonical ownership
summary is [diagnostic-ownership.json](coverage/diagnostic-ownership.json).
The preparation tool checks that summary's exact target and bulk path/digest,
then checks each selected owner byte extent against the verified current EXE.

Read the actual independent census stores without starting a provider:

```sh
python3 -B scripts/census-current-target.py
```

The successful discovery-only pass used:

```sh
python3 -B scripts/census-current-target.py --run --full-profile full-image-no-address-tables --limit 100 --timeout 180 --startup-timeout 600
```

It preserves the full queue and explicitly counts decoded, queried-undecoded
and unknown instruction-count rows. Its disabled disassembly profile is not a
method for completing instruction recovery. The failed global entry-decoding
profile needs a changed execution/analysis strategy before another attempt.

Prepare a fresh, bounded full-PE owner replay without launching analysis:

```sh
python3 -B scripts/prepare-native-census-selection.py
```

Then pass its printed project-local plan to `scripts/rea-batch.py`. For this
target's default fresh replay directory, the command is:

```sh
python3 -B scripts/rea-batch.py runtime/coverage/92eaef3bc806144860ca838660286c02b66f9d7bbee0771f1f07a628209e9f7a/ghidra/full-image-diagnostic-owner-decoding-replay/plan.json
```

Preparation refuses an existing output directory, a changed target or bulk
digest, missing verified owners and a scope exceeding 53 paths. `--output`
selects a new project-local directory. The seed content and 212-operation plan
were reproduced exactly without running another native analysis. Profile
digests also commit local seed paths, so use the recorded seed digest and
complete Evidence profile when comparing a replay in another checkout.

Static validation: **21** census reporting/transport/profile/resume regressions
and **6** bounded selection/provenance/owner-byte regressions passed via
`python3 -B scripts/test-census-progress.py` and
`python3 -B scripts/test-native-census-selection.py`. These tests do not start a
provider, compile source or run the game.
