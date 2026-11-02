# Native inventory and discovery — 0.112.5

Target SHA-256: `445e9de90f1a0e9be18d4e99e59eb170f4d253ac0440b970cdd0d0b3562dfd36`.
[Target review](target-0.112.5.md), [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Whole-file and independent byte accounting

The complete [PE inventory](coverage/native-summary.json) scans the entire
140,664,832-byte file, all six sections and embedded code/data/script/UI/config,
ID/resource/module leads. It records 347,520 declared unwind extents, 421 imports,
631,703 nonpadding relocations and 725 diagnostic paths (54 custom).
[Diagnostic decoding](coverage/diagnostic-ownership.json) checks 17,685 references
across 5,943 candidate extents, with verified leads for every custom path.
Ranges/summed counts can overlap; diagnostic association is not semantic ownership.

The [linear census](coverage/instruction-summary.json) independently decodes all
347,520 declared extents: **23,056,099 instructions / 93,212,960 bytes**, without
an undecoded suffix. Its 71,837 indirect-call and 10,103 indirect-jump records
remain encoded leads, not resolved callees or runtime paths.
The [complement](coverage/unwind-complement-summary.json) separately accounts for
all **5,079,582 executable bytes outside declared extents**: 298,543 decoded
candidate bytes, 2,282,740 mixed/unclassified bytes, 919,227 uniform-CC candidates,
10,838 uniform-NOP candidates and 1,568,234 padding-sequence candidates.
Byte partitions and plausible decoding do not prove reachable code or noncode.

## Complete declared-entry Ghidra pass

The [current full-PE pass](evidence/0.112.5/full-image-census.json) reads the installed
EXE directly through the project REA/Ghidra streaming driver, automatic analysis
disabled, 6 GiB heap. All **347,520 requested declared starts** have decoded
entries and repaired flow bodies; no requested start is missing. Ghidra derives
actual bodies from control flow rather than assigning unwind extents as bodies.

The pass exports **21,655,144 instructions / 86,411,982 bytes**, **349,849 native
functions**, 405,783 body ranges, 3,731,745 static Program references and 421
external locations. Capstone 5.0.7 independently verifies every exported
instruction's exact installed bytes and length. All 2,338 observed direct-CALL
helper targets have final native owners; seven owners change during primary
body repair and remain separately audited.

Ghidra leaves **11,880,560 executable bytes unobserved**: 7,040,300 inside declared
extents and 4,840,260 outside. Exact missing ranges/classes stay committed by the
summary. Its **67,427 computed calls / 134,047 computed jumps** remain unresolved
native/alias/semantic leads. This declared-entry profile does not apply a current
guarded-switch, relocated-pointer/complement code-root, metadata or expanded
custom-dispatch seed queue. Historical expanded 0.112.0 profiles are retained
without promotion. No new atomic source/operand classification is published.
Full-byte accounting above remains independent from Ghidra instruction coverage.
All semantic/dependency/reference limits remain **#41**.

## Selected owners and bounded procedure discovery

The [selected full-PE profile](evidence/0.112.5/refresh-baseline/seeded-census.json) completes all **54
custom diagnostic-owner query sets**, with **13,605 instructions**, 64,761 summed
body bytes, 2,894 outgoing references, 1,434 incoming references and 245 unresolved
calls. Independent instruction boundaries match every selected body. This is
one reviewed owner per path, not complete source semantics or all callers.
The new legacy_config owner is included; its migration is **#62**.

The separate resumable `full-image-no-address-tables` profile discovers 347,505
native-address-space procedures and 349 external-space entries. Its first ten
query sets complete, leaving 347,495 pending. Those ten have no decoded
instructions and one-byte placeholder bodies because entry disassembly is
disabled. This profile is discovery only; its pending queue is not erased or
counted as decoded recovery by the successful streaming pass. Profiles and
analysis environments remain separate and target-bound.

## Reproduction and limits

From this checkout, use an existing project-local Python environment with
Capstone 5.0.7 for decoder/summary commands. No package acquisition is automatic.

```sh
python3 -B scripts/inventory-current-target.py --write
python3 -B scripts/discover-native-ownership.py --write
python3 -B scripts/inventory-native-instructions.py --write
python3 -B scripts/inventory-unwind-complement.py --write
python3 -B scripts/census-current-target.py --run --full-profile full-image-no-address-tables --limit 10 --startup-timeout 600
python3 -B scripts/census-current-target.py --run --full-profile full-image-diagnostic-owner-repaired --limit 54 --startup-timeout 600
python3 -B scripts/summarize-seeded-census.py --write
python3 -B scripts/census-native-image.py --run --startup-timeout 1800
python3 -B scripts/summarize-native-image.py --write
python3 -B scripts/register-target.py --check
python3 -B scripts/check-reconstruction-coverage.py
```

The streaming command requires a new output directory if reproducing an existing
pass; pass `--output runtime/<new-directory>` and the same `--input` to its
summarizer. Reuse the existing resumable procedure profiles without changing
target, heap, seeds or analyzer commitments. All Ghidra work runs through
`./scripts/rea`; databases and bulk inventories remain ignored inside this checkout.

[Current raid recovery](raid-release-0.112.5.md) separately checks all retained
493 action nodes and native12/native26 initial-queue suppression in 262 isolated
cases. [Migration leads](evidence/0.112.5/legacy-config-review.json) retain the
bounded raw-range REA owner and unresolved path/merge/failure contracts. These
finite scopes do not certify other gameplay, whole systems or release claims.
No compilation, compiling tests, game launch, actual Windows file migration or
controlled original/rebuilt gameplay/presentation comparison was performed.
