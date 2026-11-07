# Player aura source indices and aliases

This source/static repair is bound to installed 0.112.0 SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own overall reconstruction status.
No compilation, game process, rendered check or original/rebuilt parity ran.

Native aura-index collector `1458e70c0` admits the first generic effect18,20 or31
as shield source0, the first19 as rescue source2, then every15 as temporary
source1, preserving the generic vector's indices. Source31 is the current Soul
Link contribution. Its source representation is marker253/native-tag-at63;
`PlayerAuraInputs::slots` previously admitted only18/20 and therefore omitted
Soul Link or attributed its shield to a later amulet row.

The current alias leaf `14597a300` also maps the original provenance name
`Soul Link` and kind0 to **19028**. Source used the generic 27779 fallback. Both
contracts are now connected in `run_effects/player_auras.rs`. First-source order,
other aliases and unknown-name/kind 0..2 fallbacks remain as the original helper
returns them. Numeric stat/spell rows remain excluded by the separate
[current generic partition](gameplay-frontiers.md).

The live demon hit path already grants Soul Link absorb and calls
`publish_player_auras`; this correction makes that publication select its
retained generic source and current spell ID. The native publication owner
`1458e9f80` emits this helpful aura only with positive absorb and no active
shield aura, with infinite expiry and one application. Temporary effects still
use their captured generic indices; rescue and cooldown rows retain the harmful
partition. The real field publisher retains its existing 48-slot layout.

[Contracts](evidence/player-aura-indices/contracts.json) and
[Ghidra provenance](evidence/player-aura-indices/rea-provenance.json) retain:

- **48 original index/order cases**, including empty vectors, all 36 admitted
  generic variants, duplicated sources and interleaved Soul Link/shield rows.
- **45 original name/kind aliases**, including all explicit names, case-sensitive
  near matches and fallbacks.
- All **19 actual aura-source effect rows** found across the current 355 talent,
  113 generated amulet and 16 shared amulet descriptors. Their actual provenance
  names/kinds enter the original alias leaf; the other 18 rows already agree with
  source. Current talent overlays retain those native names. The current amulet
  construction/name proof remains canonical under `balance/amulets.json`.
- **10 absorb/admission cases**, including zero, negative, NaN, positive and
  infinite absorb with/without an active shield.
- **14 learned/racial cooldown cases** checking positive remaining time,
  the exact 1000 exclusion, NaN, spell25771/6788 and expiry addition.
- **1,536 flags and 180 application-word cases** replayed from current bytes.
  Their existing 0.100.1 fixture is an input corpus with its historical hash
  preserved; current native execution revalidates those expected values.
  Helpful/harmful presence nibbles are 9/8; application bytes encode
  `min(count,255)-1`, saturating zero. Fields still start at 95/113.

The authored Rust regression checks all current aliases/producer rows and crosses
index/order inputs with native absorb gates. It retains the historical fixture's
actual provenance. Rustfmt syntax parsing is separate from compilation or test
execution; neither Rust test was executed in this repair.

Run `python3 -B scripts/check-player-aura-indices.py`. `--stage` writes
candidate contracts inside ignored `runtime/analysis/history/native-recovery/gameplay-frontiers/1d609cc38fa0` for
review. Exact source hashes, native byte ranges and allocator/byte-operation
seams are retained in the contracts. The complete aura publisher, shared field
map allocation, whole native body ownership and arbitrary incoming pointer/alias
identity are not certified by these bounded AS input/output checks.
