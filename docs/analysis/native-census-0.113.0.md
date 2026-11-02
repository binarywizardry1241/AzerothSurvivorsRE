# Native inventory and discovery — 0.113.0

Target SHA-256: `c3a82f594e05dc8cea49dfa38e69aca96c9ee625a5b7df3ffa93c19dc8c95773`.
[Target review](target-0.113.0.md), [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Whole-file and independent byte accounting

The complete [PE inventory](coverage/native-summary.json) scans all 141,960,192
file bytes, six sections and embedded script/UI/configuration, ID/resource/module
leads. It records 350,243 declared unwind extents, 425 imports, 634,045 nonpadding
relocations and 729 diagnostic paths (58 custom). Five co-op paths are new;
`realmd.rs` is absent from the literal inventory and retains historical ownership.
[Diagnostic decoding](coverage/diagnostic-ownership.json) checks 17,780 references
across candidate extents, with verified leads for every custom path. Summed
candidate extents can overlap; diagnostic association is not semantic ownership.

The [linear census](coverage/instruction-summary.json) decodes all 350,243
declared extents: **23,260,890 instructions / 94,068,116 bytes**, without an
undecoded suffix. Its 72,257 indirect-call and 10,314 indirect-jump records remain
encoded leads. The [complement pass](coverage/unwind-complement-summary.json)
accounts separately for all **5,126,586 executable bytes outside declared
extents**: 307,477 decoded candidate bytes, 2,302,081 mixed/unclassified bytes,
925,623 uniform-CC candidates, 10,925 uniform-NOP candidates and 1,580,480
padding-sequence candidates. These classes do not prove reachability or noncode.

## Complete declared-entry Ghidra pass

The [full-PE pass](evidence/0.113.0/full-image-census.json) reads the installed EXE in
place through the project REA/Ghidra streaming driver, automatic analysis
disabled, 6 GiB heap. All **350,243 requested declared starts** have decoded
entries and repaired flow bodies; none is missing. Bodies follow observed
control flow rather than being assigned unwind extents.

The pass exports **21,839,448 instructions / 87,169,259 bytes**, **352,595 native
functions**, 408,995 body ranges, 3,760,522 static Program references and 425
external locations. Capstone 5.0.7 independently verifies every exported
instruction's exact installed bytes and length. All 2,361 observed direct-CALL
helper targets have final owners; seven change owners during primary body repair
and remain separately audited.

Ghidra leaves **12,025,443 executable bytes unobserved**: 7,145,793 inside declared
extents and 4,879,650 outside. Exact missing ranges/classes are committed by the
summary. Its **67,772 computed calls / 134,786 computed jumps** remain unresolved
native/alias/semantic leads. This declared-entry profile applies no current
guarded-switch, relocated-pointer/complement, metadata or expanded custom-dispatch
queue. No fresh atomic source/operand classification is published. Historical
expanded profiles retain their actual target. Complete linear byte accounting
and full Ghidra instruction coverage are distinct; **#41 remains open**.

## Selected owners and resumable discovery

The [selected full-PE profile](evidence/0.113.0/refresh-baseline/seeded-census.json) completes all **58
custom diagnostic-owner query sets**: **11,838 independently checked
instructions**, 55,861 summed body bytes, 2,551 outgoing references, 1,250 incoming
references and 192 unresolved calls. Every selected body's independent linear
boundaries match; 33 bodies match the declared extents exactly. Only 57 selected
diagnostic sites are observed in these selected bodies: `coop/route.rs` selects
owner `0x145809030`, whose recovered body omits diagnostic site `0x145809200`.
The difference remains explicit; bodies are not expanded artificially. This is
one minimum owner per path, not full custom-source recovery or all callers.

The separate `full-image-no-address-tables` profile discovers 350,228
native-address-space procedures. Its first ten query sets complete, with 350,218
pending. Those ten contain no decoded instructions and have one-byte placeholder
bodies because entry disassembly is disabled. It remains discovery-only; the
successful streaming pass does not erase or promote its unfinished queue.

The [party API report](addon-party-api-0.113.0.md) separately recovers the exact
embedded Lua and selected native producers under #11. Those raw-range Ghidra
batches retain incomplete external types/ABI guesses, with original PE
instructions/constants governing interpretation. Co-op source remains
missing/deferred under #63. No compilation, game/network execution, save/config
operation or controlled original/rebuilt comparison ran.

## Reproduction

Use the existing Capstone 5.0.7 Python environment for decoder/summary commands;
no package acquisition is automatic. All outputs stay inside this checkout.

```sh
python3 -B scripts/inventory-current-target.py --write
python3 -B scripts/inventory-current-target.py --check
python3 -B scripts/discover-native-ownership.py --write
python3 -B scripts/discover-native-ownership.py --check
python3 -B scripts/inventory-native-instructions.py --write
python3 -B scripts/inventory-unwind-complement.py --write
python3 -B scripts/census-current-target.py --run --full-profile full-image-no-address-tables --limit 10 --startup-timeout 600
python3 -B scripts/census-current-target.py --run --full-profile full-image-diagnostic-owner-repaired --limit 58 --startup-timeout 600
python3 -B scripts/summarize-seeded-census.py --write
python3 -B scripts/census-native-image.py --run --startup-timeout 1800
python3 -B scripts/summarize-native-image.py --write
python3 -B scripts/check-party-addon-api.py --lua
python3 -B scripts/register-target.py --check
python3 -B scripts/check-reconstruction-coverage.py
```

Use a new `--output runtime/<directory>` when reproducing an existing streaming
pass, then give its summarizer the same `--input`. Resumable profiles keep their
exact identity, heap, seeds and analyzer commitments. All Ghidra work runs through
`./scripts/rea`; bulk exports/databases remain ignored. An accounting pass
certifies record consistency, not complete native reconstruction or parity.
