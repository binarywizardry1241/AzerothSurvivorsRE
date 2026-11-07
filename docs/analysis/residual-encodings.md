# Residual instruction encodings

EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This is a static encoding classification under **#41**, selectors
`Q41-U01`, `Q41-U02` and `Q41-U04`. It neither establishes AS ownership nor
changes any original census population or function-body observation.

The [proof](evidence/0.113.2/residual-encodings.json) binds the canonical queue,
both full input inventories, exact original PE bytes, Capstone version and
complete classified-output commitments. No residual interval is sampled away.

| Inventory | Complete intervals / bytes | Entirely NOP/INT3 encodings | Mixed/unclassified |
| --- | ---: | ---: | ---: |
| Ghidra unobserved, U01+U02 | 462,533 / 8,480,008 | 452,599 / 3,487,203 | 9,934 / 4,992,805 |
| Independent complement, U04 | 332,690 / 4,819,742 | 313,474 / 2,546,698 | 19,216 / 2,273,044 |

These inventories overlap; do not add their counts or bytes. The Ghidra set
rechecks every original interval's SHA-256 against the installed image. The
complement set independently subtracts its complete decoded union from every
original region; its original selector digest exactly reproduces the queue.
The latter classifies each resulting interval rather than inheriting the
containing region's candidate label. Its mixed-byte count therefore differs
from the original region-label partition, which remains unchanged.

Uniform `CC` bytes are INT3 encodings and uniform `90` bytes are NOP encodings.
Other intervals qualify only when complete decoding consumes every byte and
every instruction is NOP or INT3. A truncated decode, non-NOP instruction or
undecoded suffix keeps the whole interval mixed/unclassified. Five explicit
boundary/counterexample vectors also exercise these distinctions.

NOP preserves fallthrough and INT3 traps if executed. This does **not** prove
padding, noncode, absence of incoming computed edges, mutation or dynamic
unreachability. The existing ten-byte [inter-function trap-fill proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/unknown-recovery-0.113.2.md#classified-u04-interval-inter-function-trap-fill)
retains its separate adjacent-return and observed-reference evidence; those
relations are not generalized to every NOP/INT3 interval. No function or source
owner is assigned from an encoding, a nearby diagnostic or an unwind extent.
Mixed intervals and actual AS producer/consumer questions remain actionable.

`python3 -B scripts/check-q41-range-encodings.py` reproduces all results
read-only. `--stage` writes proposed proof and complete JSONL records under
ignored `runtime/analysis/history/findings/q41-all/f1125d689593/`; each record preserves original bounds,
location/category and native hash alongside its encoding classification.
The records are reproducible inventories, not additional copies of assembly.

No generic engine implementation, compilation, application/game execution,
reconstructed source execution or original/rebuilt comparison occurred. Static
byte classification leaves the canonical #41 semantic/alias/ownership and
runtime/parity limits open.
