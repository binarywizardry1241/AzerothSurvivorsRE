# Fixed-address supporting leaves — 0.121.0

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This complete bounded **Q41-A01 / Q41-M01** classification follows the
operand audit's **twenty `not-observed` executable destinations**, reached by
**21 address-forming operands**. Current implementation status remains in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

The [proof](evidence/0.121.0/address-leaves.json) binds the exact
`native-operands.json:details.unowned_executable_address_candidates` selector,
complete operand-stream digest, every selected forming instruction, current leaf
bytes and relevant current surrounding interfaces. It preserves the original
observation that these entries were not observed in the selected Ghidra census.
No function ownership, original type or dynamic callback identity is inferred
from a formed address or from linear decoding.

| Complete destination set | Current bounded role and interface |
| --- | --- |
| `1442ee990`, `1442ee9a0` | u32 carrier constructors storing tags 12/11. Their common forming parent `1442f7c20` has the current `naga-27.0.3/src/front/wgsl/parse/mod.rs` Location. The local branch forms and calls the carrier address. This is WGSL parser context; original enum names and the whole parser are not recovered. |
| `144b40830` | Forwards three words from the first argument and tail-jumps to `144b42430`. That target supplies the current `futures-lite-2.6.1/src/io.rs` Location. This establishes the I/O interface boundary without reconstructing the asynchronous I/O state machine. |
| `14540ecc0` | Checks NaN operands and infinite exponents with absolute-base one, returning quiet NaN in those cases; the admitted branch reaches the independently verified imported `pow` slot. Its constants and complete instruction correspondence to the retained helper are checked. External CRT execution remains unproved. |
| `145a5b2d0` | Finite inputs with absolute value at least **2^63** return negative quiet NaN; all other inputs reach the independently verified imported `tan` slot. The maximum-finite bit guard, absolute-value mask, 2^63 constant and result bits match existing `benilla-lua::lib_math::tan`. This extra primitive is already implemented in the reused engine. |
| `145a60000`, `145a60010`, `145a60020` | u32 OR/XOR/AND leaves. The exact leaf bytes match the retained classification and existing Lua bit-library source remains a counterpart candidate. Actual dynamic closure identity is not established. |
| `145a76de0`, `145a76e20`, `145a76e40`, `145a76e60`, `145a76ea0`, `145a76ec0`, `145a76ee0`, `145a76f20`, `145a76f40` | Nine register/constant arithmetic-op carriers. Their exact leaf bytes match the retained classification, and all nine forming operands occur in parent `145a88bc0` with the current `crates/benilla-lua/src/compile.rs` Location. The surrounding compiler and original enum/type equivalence remain outside the proof. |
| `145a923f0`, `145a92410` | ASCII/Latin-1 lower/uppercase codepoint mappings with exact retained leaf byte matches and existing Lua string source counterparts. Complete Unicode/string/VM behavior is not inferred. |
| `145ddcf60` | Dereferences the first argument and tail-jumps to formatter `145ddd560`. The checked formatter branches select exact 21-byte `client authentication`/`server authentication` labels and forward them through vtable slot `+0x18`. Concrete dynamic type, callers and the full TLS/authentication behavior remain unestablished. |

## Cumulative classification and source consequence

The [0.113.2 classification](address-leaves-0.113.2.md) already established
nineteen of these supporting roles. **Eighteen current leaf byte streams are
identical** to their retained counterparts. The relocated pow helper also has
complete opcode/register/local-branch correspondence, with its current
constants and imported boundary checked separately. Current native Locations,
forward destinations and authentication label consumers are explicitly checked;
byte equality alone does not transfer the surrounding behavior.

The twentieth current target is the unary tan guard described above. Its current
instruction contract and CRT boundary identify an existing engine primitive.
There is no proved absent AS implementation, changed gameplay rule or missing
AS-specific consumer in this exact population. Each branch stops at its
supporting engine/library boundary. This classification does not authorize or
claim reconstruction of WGSL, Lua compiler/VM, futures, I/O, TLS or CRT.

All twenty selected targets are therefore **classified supporting context**,
with exact dynamic-type/alias and deeper subsystem limits retained. They must
not be offered again as unexplained AS recovery merely because the raw census
still correctly records their original `not-observed` status. Other unresolved
address/slot inputs and actual AS interfaces remain independent #41 work.

## Reproduction and limits

With the target, retained operand inventory and an existing Capstone environment:

```sh
python3 -B scripts/classify-address-leaves.py
```

The checker verifies the complete twenty-target/21-operand selector and compact
proof. `--write` deliberately republishes that proof;
`--analysis-workspace <primary-checkout>` reads retained inputs from the primary
checkout when used by a linked worktree. It creates no secondary store.

No new Ghidra query, import, seed or body observation was needed. No gameplay
source was changed. No compilation, compiling test, client/game/network/server
operation or original/rebuilt comparison ran. Primitive byte behavior and
supporting context do not establish actual AS invocation, source execution,
full gameplay fidelity or parity.
