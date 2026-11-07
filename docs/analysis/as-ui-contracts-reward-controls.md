# Equipment choice controls

Gap **#41**, installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
[Native/source proof](evidence/0.113.2/as-ui-contracts-reward-controls.json),
[guardian delivery](as-ui-contracts-guardian.md).

The source admitted Reroll, Banish and Skip only on level offers. Current native
transactions admit all three active sources: level `0`, purchased cache `1` and
guardian equipment `2`. The source now uses the existing reward generator for
equipment rerolls and banishes, retaining the captured source and its pending
counter. Both regenerate the actual offer, including displayed-item Seen records.
Skip clears equipment offers and consumes only the captured source counter before
shared completion schedules the next reward. Stored levels and first-level-offer
state remain independent of equipment completion.

The native Banish key helper rejects gold, already-owned jewelry and the currently
worn amulet. New equipment uses its key; learned ability cards and `rank:` upgrade
keys retain their existing distinction. The source now applies the equipment
ownership checks to both the displayed button and transaction admission.

Skip's displayed amount is `max(current_cache_price >> 2, 10)`, including on
level offers. The previous source read the level field. The repaired transaction
multiplies the amount by the run gold multiplier, rounds once and adds it to both
currency counters with wrapping arithmetic.

## Current native contracts

- `1459729a0..145972adf` gates Reroll on phase `2`, a non-sentinel active
  source, and a free charge or sufficient gold. Paid cost is `100 * 3^paid`,
  saturating to `u32::MAX`; the paid counter wraps. Regeneration retains source.
- `14596efc0..14596f0c6` gates Banish on the same phase/source, a remaining
  charge and a valid displayed index. A successful key decrements one charge,
  appends the key and forwards the captured source to `145965190`.
- `145964f70..145965182` dispatches the actual displayed variant: learned
  ability, upgrade, jewelry, amulet or gold. Its jewelry and amulet branches
  compare against live equipment before producing a key.
- `14596ee30..14596efb8` gates Skip on phase `2`, the actual Skip perk byte
  `Game+2a6`, and a non-sentinel source. It reads price at `Game+bc4`, scales
  by the gold multiplier at `+4b0`, and updates purse `+4f0` and earned `+79c`.
  Shared completion receives the captured source.
- Current JSON preparation `145968a3b..145968a51` reads that same price for
  the displayed amount. Cards root `1400b3e0d` enables the Reroll capability
  independent of equipment reason.
  Opening-animation admission and offer renewal are covered by the
  [separate controller report](as-ui-contracts-reroll.md).

## Static validation and limits

`check-reward-controls.py` passes **2,003 original instruction cases**:
48 Skip gates, 567 Skip currency/display cases, 1,080 Reroll transactions,
288 Banish gates, 12 Banish commit/source-forward cases and eight key scenarios.
The source checks connect those contracts to the live footer, transactions and
source-preserving regeneration. The guardian regressions now include equipment
Reroll, Banish and Skip; two additional authored Rust regressions cover cache
currency/source preservation and owned-equipment Banish rejection. They were not
run.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-reward-controls.py
```

Skip fixtures stop before CRT `roundf`, then resume the original conversion and
currency prefix with finite half-away rounding. Field/packet publication is a
stop boundary. Key fixtures supply explicit allocator, byte-copy/comparison and
String-clone seams. The upgrade formatter and arbitrary factory/Vec alias ancestry
are outside those fixtures. Banish commit uses existing spare vector capacity.
Co-op paths are excluded. Compilation, Rust execution, real UI/input/persistence
and original/rebuilt parity remain unverified.
