# AS diagnostic sites outside saved function bodies

Target: installed **0.121.0**, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
Current implementation status remains in [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).
This is the complete bounded **Q41-D01 / Q41-G01 / Q41-U01** diagnostic-role
reconciliation, using existing census observations and exact installed bytes.

The [proof](evidence/0.121.0/as-ownerless-sites.json) selects **all 60** records
from `native-residuals.json:artifacts[diagnostic-sites.jsonl.gz]` where
`context == 'AS-custom-path' && actual_body_owner == null`. They occupy
**twenty declared unwind extents / fourteen diagnostic paths**. The connection
ledger's narrower **55 Location references / twelve paths** is precisely the
Location subset; the other five records are adjacent-token operands. The raw
Ghidra ownership observations and census totals remain unchanged.

| Complete selected population | Current immediate role |
| --- | --- |
| 53 Rust Location records | Thirty routes call `146194453`, twenty-one call `146194630`, one calls `146194370` and one calls `1461943b0`. Each wrapper has only straight-line instructions and calls before terminal `UD2`, with no return or conditional branch. These are failure-context operands. |
| 2 Rust Location records | Options site `1402f7e10` forwards its Location into stable eight-byte removal at `140195640`; abilities site `145bfa7b8` forwards its Location into stable 120-byte removal at `145c6ca50`. Their admitted paths return, so neither is classified as an unconditional panic site. |
| 2 adjacent `spell` tokens | Sites `145c44d33` and `145c45285` load a pointer five bytes before `game/auras.rs`, explicitly store length five and call the named-template interface at `145aeb340`. The selected bytes are `spell`. |
| 3 adjacent `p` tokens | Sites `145c91dc4`, `145c91efa` and `145c91fa0` load a pointer one byte before `i18n.rs`, explicitly store length one and call the same interface. The selected byte is `p`. |

Every selected instruction, local route, enclosing declared extent and 24-byte
Location record is independently checked against this installed EXE. Location
checks include filename pointer/length, source line and column. A filename
does not establish its containing extent's source owner, and a failure operand
does not explain the successful AS state or collection that produced an index.
The wrappers' external callees, unwinding and nonlocal exits remain generic
boundaries. Their local call/`UD2` shape is not a claim that all deeper failure
handling has been recovered or executed.

## Reuse of established removal contracts

The [0.119.0 proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/as-ownerless-sites-0.119.0.md) retains the original Ghidra
queries, exact raw helper inputs and their semantics. The current checker
verifies those saved query/result commitments and checks every old/current
helper instruction. After replacing each internal branch target with its
helper-relative offset and explicitly binding both external calls, the full
instruction sequences are identical. The current movement call's thunk is
independently joined to the PE's imported **`memmove`** slot. The current
bounds-failure wrapper `14619418b` is independently checked through terminal
`UD2`. No new import, decompilation or Program mutation is needed.

The admitted eight-byte helper removes the indexed row, shifts later rows,
decrements length and returns the removed value. The 120-byte helper has the
same stable movement and length update and then requires the removed row's
leading word to be nonzero. Both rejection paths forward the supplied Location
to the bounds-failure interface. This correspondence covers the helper's
inputs, guards, state writes and output; it does not assign a concrete game
type to a row from its width or certify its caller's full behavior.

Existing source still has the Options expanded-header toggle in
`options.rs::input`, the first-equal-key totem eviction and expire-before-create
sequence in `player_abilities/behavior/{totems,dispatch}.rs`, and named-token
formatting in `localization.rs`. Those are retained source connections, not new
full-target revalidation claims. The selected current operands establish no
source discrepancy that would justify changing them.

## Complete decoded ownerless-instruction context

The second selector follows **every** `ownerless-instructions.tsv.gz` row
inside any declared extent with a genuine Rust Location for either AS crate,
including cooperative paths. **302** Location-bearing context extents select
**790 instructions / 49 contiguous runs / nineteen extents**. Every selected
instruction's byte sequence and length matches the installed target and its
saved residual observation; exact ranges and digests are retained in the proof.

| Instructions | Retained bounded context |
| --- | --- |
| 239 | Every selected instruction's local successors reach a checked failure-wrapper call or `UD2`. The checker follows direct jumps and both conditional successors and rejects a return, unknown call/indirect jump, outside-extent successor or local cycle. This is two additional standalone `UD2` records compared with the historical 0.119.0 selector. |
| 248 | Existing totem removal, subsequent construction and owned-value cleanup context in `145bf8450`. |
| 296 | Existing upgrade/card payload and owned-value cleanup context in `145c44820`, including the two explicit `spell` descriptors. |
| 7 | Options writeback and returning removal context in `1402f6b00`. |

The latter three rows preserve their established context classifications.
They are **not** a new proof of every successful native path, enum tag,
dispatcher target, source type or presentation behavior. In particular,
unresolved card/choice dispatch semantics remain separate from the two
explicit token constructions. Continuing solely to map the existing source
to the latest EXE would be proof-only revalidation. The broad queue must not
offer these complete classified populations again merely because the original
census correctly still reports them outside function bodies.

## Reproduction and limits

With the selected target, saved residual inventories, retained historical query
inputs/results and an existing Capstone environment available:

```sh
python3 -B scripts/classify-as-ownerless-sites.py
```

The checker verifies the complete two selectors and commitments without writing
or executing source. `--write` deliberately republishes the compact proof;
`--analysis-workspace <primary-checkout>` lets a linked worktree read the
primary checkout's retained inputs without duplicating analysis storage.

Immediate diagnostic-role classification is complete for these exact sets.
The broader #41 byte/reference/alias/AS-semantics questions remain separate.
No gameplay source defect was established and no gameplay source was changed.
No new native query, application compilation, compiling test, game/client,
network/server operation or original/rebuilt comparison occurred. Static
classification does not establish source execution, complete gameplay or parity.

## Retained reports

[0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/as-ownerless-sites-0.119.0.md)
