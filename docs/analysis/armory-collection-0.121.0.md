# Missing collection tiles and star progress — 0.121.0

Target SHA-256: `22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md#gap-236) owns the full presentation finding.
The [proof](evidence/0.121.0/armory-collection.json) binds the retained Ghidra
queries, exact current native ranges/data, source and replay results. Compact
[native summary vectors](evidence/0.121.0/collection-progress-cases.json) also
feed a Rust source test. Numeric bonus formatting has its own recovered helper.

## Missing pieces and transition

Owner `1402afde0..1402b0814` visits unlocked zones, then their bosses, then each
boss's piece/chance pairs from `145aff7d0`. It removes owned pieces and keeps only
the first occurrence of each ID. The retained occurrence preserves its original
zone, boss and chance. A nonempty list uses `armory.still_to_find` with the full
missing count. Child `1401098c0..14010a63e` renders at most six candidates in a
two-column grid, with the item name, boss, zone and drop chance.
The current call supplies a 34-pixel icon, a 12-pixel item name, a 10-pixel
boss/zone line, and an independent 11-pixel chance badge. The chance is the
native pair's fraction multiplied by 100 and formatted without decimals.

For an empty missing list, the header checks ownership of every item in the
selected class catalog. Owning every item selects `armory.collection_complete`;
otherwise it selects `armory.zones_done`. Both paths render star progress. This
is not the historical instruction to open the next zone without a progress
panel. The child visits all six tiers in order `0,1,2,3,5,4`, independently of
which tiers have collected pieces.

The current original drop generator `145aff7d0..145affb7e`, including native
iterator helpers `145c77660` and `145c71160`, matches retained source data for
**all 540 combinations of nine classes, twelve zones and five bosses**. Every
returned item ID and chance was compared; there were zero differences. This
revalidates those retained drop mappings against this target rather than
assuming their older provenance applies unchanged.

## Per-set rows

`1402b1560..1402b1c9f` constructs each row. Iterator `1401a2570` retains only
owned `(compact slot, star byte)` pairs; missing star records read as zero.
`1401a3ae0` projects armor slots 0–7 for the bonus gates. Row rendering
`14010afe0..14010cbc2` retains every class slot position, including weapons and
unowned placeholders, with five rank segments per position.

The numerator is the sum of owned piece ranks. Its denominator is five times
`8 + class weapon count`, giving 45 or 50 for the current class domains.
Weapon stars contribute to this total, but not to armor bonus gates:

| Indicator | Native gate |
| --- | --- |
| Four-piece | At least four owned armor pieces have one or more stars. |
| Eight-piece | All eight owned armor pieces have three or more stars. |
| Empowered | All eight owned armor pieces have five or more stars. |

The row displays numeric four/eight status badges. Active badges use green;
empowered eight uses the paper color. Inactive text uses `(0.42,0.40,0.36)`.
`145fc5ae0` converts the numeric badge label to decimal; it does not construct
an inline effect description. The collection badges add no tooltip interaction.

`145ab4910..145ab49db` returns the highest Heroic clear of the selected class
across the tier's two zones, capped at five. Either zone can open the stars;
other classes' clears do not contribute. Current tier zone pairs are
`(0,1),(2,3),(4,5),(6,7),(10,11),(8,9)` for tiers 0–5. The row uses
`armory.star_cap_none` for zero and `armory.star_cap` with `n=cap, of=5` otherwise.
Source uses the canonical `Save::star_cap` API rather than copying this policy.

## Source and validation

`armory::collection` now selects missing tiles or the six tier rows.
`collection_set_progress` centralizes ownership, rank totals and armor-only
thresholds; `collection_stars` consumes it. Pure `name_rules`, `set_name_base`
and `set_name` helpers share the existing localized set-name grammar with later
consumers. This change does not add the selected-piece/Character set-bonus rows
or their SetTip behavior; those consumers have separate evidence and ownership.

The standalone [locale proof](evidence/0.121.0/collection-localization.json)
binds five labels in all fourteen current EXE catalogs. Its checker reuses the
published descriptor/payload receipts, verifies their offsets, bytes and hashes,
and compares all 70 UTF-8 values with the source locale files. It does not depend
on the separate selected-set/SetTip labels or the common locale checker mode.

The collection uses five current native labels: `armory.collection_complete`,
`armory.zones_done`, `armory.star_cap`, `armory.star_cap_none`, and `armory.stars`.
The shared compact-stat formatter additionally consumes `bonus.calm_regen` and
`bonus.crowd_armor`; their native translations belong to the shared set-label
catalog. No new native art is substituted for the source renderer primitives.

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-armory-collection.py
python3 -B scripts/check-collection-localization.py
```

The non-compiling check passes **2,604 original-instruction cases / 591,730
instruction steps**: 540 complete drop-generator cases, 120 set-row count/gate
prefix cases and 1,944 class/tier/clear-pair cap cases. In particular clearing
only either tier zone returns that clear's rank. Allocation/vector growth/free,
summary slot/rank projection and synthetic UI/context memory are explicit seams;
the renderer itself is not executed. The accompanying Rust source test is not
compiled or run. Compilation, live layout/interaction and original/rebuilt visual
parity remain unverified.
