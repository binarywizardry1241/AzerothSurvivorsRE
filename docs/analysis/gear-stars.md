# Gear star effect projection

Target SHA-256: `22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md#gap-230) owns the complete finding.
The [proof](evidence/0.121.0/gear-stars.json) binds original code/data,
successful journaled Ghidra queries and the source helper.

## Recovered arithmetic

`145b00a20` obtains the original piece descriptor through `145b01970`. Zero
stars or a zero descriptor class byte at `+0x69` return no extra effects.
For a nonzero class it reads the descriptor's rarity index at `+0x30`, capped
at five. Its two authored f32 tables are:

| Rarity index | Each of stars 1–4 | Fifth-star addition | Total additional factor at five stars |
| --- | ---: | ---: | ---: |
| 0 | 0.64 | 4.16 | 6.72 |
| 1 | 0.40 | 2.01 | 3.61 |
| 2 | 0.28 | 0.88 | 2.00 |
| 3 | 0.17 | 0.40 | 1.08 |
| 4 | 0.12 | 0.12 | 0.60 |
| 5 | 0.15 | 0.15 | 0.75 |

The native expression is `min(stars, 4) * STEP[rarity.min(5)]`, then adds
`FINAL[rarity.min(5)]` when stars exceed four. Each multiply and add is f32.
It multiplies this additional factor by the piece's own original effects.
It does not look up a different tier's item at this interface. The supplied
95% description must therefore not be substituted for these exact tables.

Purchase preview helper `145b007c0` subtracts the previous additional factor
from the new one before projecting each effect. This includes f32 subtraction;
subtracting two already-rounded health bonuses would be a different operation.
Input stars above five have the same total and zero further increment. Admission
and purchasing caps remain the separate #229 contract.

`145c71430` projects tags 0–10 and 12–14 by f32 multiplication, with a further
`roundf` call for tag 2 (health). Tag 11 (integer extra targets) is omitted from
the bonus vector. The thunk `145febc75` reaches IAT slot `146195370`, identified
as `api-ms-win-crt-math-l1-1-0.dll!roundf` by the current import directory.

Live piece projection `145aff210` obtains base effects, invokes `145b00a20` at
`145aff28e`, then processes the original rows before the star rows. Matching
variants add their payloads. Float addition and health-bonus rounding occur
separately; replacing the sequence with `base * (1 + factor)` changes results.
Aggregate owner `145b03060..145b03972` reads the next worn item at `145b03300`,
its matching star byte at `145b0332b`, and invokes the combined piece helper at
`145b03338`. It drains that vector before advancing to the next item. Worn
pieces must retain native paperdoll order across all nineteen slots; compact
catalog order can change the f32 additions.

## Source and checks

`crates/azeroth-survivors-re/src/gear_stars.rs` supplies total/increment factors,
typed bonus projection and the base-first merge. `GearPiece::effects_at_stars`
connects it to `GearSave::effects` and supplies the shared projection for armory
and actual inventory metadata consumers.
GearSave reads normalized canonical ranks from the existing Records codec,
checks each worn native slot against its class/slot ownership, and drains each
piece's combined effects before advancing. The existing local run entry passes
that aggregate to configure_effects. Details uses the same projection. Purchase
transactions retain #229 ownership; the actual inventory metadata and remote
snapshot connections are recorded by #234/#238. [verification-needed](../verification-needed.md)
retains that integration evidence and deferred execution checks.

Run the non-compiling check from the checkout:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-gear-stars.py
```

The check verifies target/code/data hashes, independent instruction boundaries,
the two successful Ghidra receipts, the source tables' exact f32 bits and the
roundf import. It replays **353 synthetic cases / 17,535 original instruction
steps** across both scalar blocks and all fifteen typed projection variants.
Allocation, scalar inputs and the imported roundf interface are explicit
synthetic seams. It does not execute reconstructed Rust or the game.

Compilation, live execution, rendered presentation and original/rebuilt parity
remain unverified. `CURRENT-STATE` records remaining live source work separately.
