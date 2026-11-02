# Fixed-address operands and supporting entries — 0.113.2

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
Parent **#41**, bounded selectors **A01/U02/O01/M02/M03**.
The [complete operand audit](evidence/0.113.2/native-operand-boundaries.json)
inspects all **22,663,778 verified current Ghidra instructions**. Its source
census, tool/input hashes and full ignored operand inventory are committed by
digest; its counts do not replace the independent linear/complement views.

## Exact operand domain

| Retained input | Records |
| --- | ---: |
| Fixed address expressions | 487,437 |
| Fixed memory operands | 174,748 |
| Retained operands with actual native source-body owners | 653,188 |
| Retained operands without such source owners | 8,997 |

The fixed-memory source/destination pairs are present in the exported Ghidra
references. The address-expression pairs are absent from that export; their
initial encoded values are additional static leads, not proof of live reads,
types or callbacks. Register-dependent, indexed and segmented addresses retain
their separate explicit input-domain counts and unresolved producer questions.

Among executable destinations without an actual native body owner, 5,872 already
name observed instructions, none names an observed instruction interior, and
**19 do not name an observed instruction**. Every one of those19 is formed by
an explicit LEA, through **20 total source operands**. The
[selected proof](evidence/0.113.2/address-leaves/contract.json) retains all20
operands and all19 fresh Ghidra entry/body observations, with the
[canonical leaf assembly](evidence/0.113.2/address-leaves/leaves.asm).

## Bounded classification

| Exact entries | Observed interface and context |
| --- | --- |
| `144094d80`, `144094d90` | u32 carrier constructors with tags12/11. Their observed parent has the current native `front/wgsl/parse/mod.rs` Location; original enum names/full parser semantics remain unestablished. |
| `1448e61d0` | Three-word argument forwarding into an expanded I/O helper with the current `futures-lite-2.6.1/src/io.rs` Location. No I/O behavior or async lifetime is reconstructed. |
| `14517fe00` | Rejects NaN operands and infinite exponents of absolute-base1 before the external pow boundary. Existing Lua math source has this guard; external CRT behavior remains unproved. |
| `1457ca250`, `1457ca260`, `1457ca270` | u32 OR/XOR/AND leaves. Existing Lua math closures are matching source candidates; actual dynamic closure identity/callers are not proved. |
| `1457de290`, `1457de2d0`, `1457de2f0`, `1457de310`, `1457de350`, `1457de370`, `1457de390`, `1457de3d0`, `1457de3f0` | Nine packed register/constant arithmetic-op carriers. The current parent explicitly references `crates/benilla-lua/src/compile.rs` and dispatches to these carriers; its complete compiler semantics and source enum/type equivalence are not recovered. |
| `1457fb960`, `1457fb980` | ASCII/Latin-1 lower/uppercase codepoint mappings with existing Lua string source counterparts. Complete Unicode/string/VM behavior remains separate. |
| `145af18c0` | Indirect formatting carrier. Expanded decompilation shows client/server authentication labels; concrete caller/type/dynamic formatter identity remains unestablished. |

Native Location payload hashes and portable source suffixes are retained without
copying build-machine paths. Fresh Ghidra function entries are analyst-supplied
candidates, not original source identities. The actual observed body sets stay
explicit, including the pow guard's separate import-thunk range. A body span is
never treated as contiguous code where the provider supplies disjoint ranges.

These bounded interfaces supply no demonstrated missing AS operation or new
gameplay contract. This branch stops at supporting engine/library context;
it does not reconstruct WGSL, the Lua compiler/VM, futures, I/O, TLS or CRT.
Source counterparts and numeric placement do not establish arbitrary AS use.

## Reproduction and remaining limits

`python3 -B scripts/check-q41-address-leaves.py` checks all selected
forming instructions and leaf bytes against the installed image, verifies the
complete audit commitments and reproduces the compact proof. `--stage` writes
a candidate under ignored `runtime/q41-address-leaves-0.113.2/staged`.

Regenerate the complete operand audit with project-local Capstone, after creating
its ignored output directory:

```sh
mkdir -p runtime/execheck-0.113.2/current-operands
PYTHONPATH="$PWD/runtime/camera-recovery-0.105.0/python-libs:$PWD/scripts" python3 -B scripts/audit-native-operands.py --census-summary docs/analysis/coverage/full-image-execheck.json --inventory-output runtime/execheck-0.113.2/current-operands/operands.jsonl.gz --summary-output runtime/execheck-0.113.2/current-operands-summary.json --write
```

For fresh Ghidra, seed each selected address for function/code and the four
actual parent entries recorded in the selected operands; use the current
disabled-analyzer profile and a fresh project-local output directory. Original
plans and observations stay ignored under `runtime/q41-address-leaves-0.113.2`.
New bulk gzip/profile bytes need new reviewed commitments.

All original census/queue populations remain unchanged. Full AS semantic/source
and dynamic-alias coverage remains missing under M03; neither fixed operands nor
19 body observations close it. No compilation, target/source execution, OS or
network operation, game session or original/rebuilt parity comparison ran.
