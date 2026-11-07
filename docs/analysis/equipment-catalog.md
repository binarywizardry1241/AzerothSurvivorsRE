# Equipment numeric definitions revalidation

Target: supplied **0.105.0**, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns current implementation status and gap
numbers. This report covers the ordinary gear and amulet portion of gap **#34**.

All **415 ordinary gear definitions** and **130 live amulet definitions / 375
effects** match the selected target. No numeric source values needed changing.
The Armory and historical amulet asset now identify this separate numeric
revalidation without changing their original names, appearance or raw-pointer
provenance.

## Native contracts and source connection

The existing [PvP equipment recovery](pvp-gear.md) already recovered
the current item reader, class/weapon tables, ordinary base and flavor arrays,
legendary additions and scaling consumers. Its checked formula produces every
ordinary rarity/class/slot combination in `assets/armory.json`, including native
health rounding and equal-tag merging. The current recovery rechecks all **415**
records against those tables and consumers; it reuses the canonical
[data ranges](evidence/0.105.0/pvp-gear/data-evidence.json) and
[procedure extracts](evidence/0.105.0/pvp-gear/procedures.json).
Names, appearance, prose and starter outfits keep their separately recorded
historical provenance.

Amulet owner `14587b8e0..14587cfc7` constructs one legendary definition from
each of the **113** current ability descriptors at `146bacad8`, stride 120.
The shared catalog at `146bb5798..146bb5ce8` contains **17** records, stride 80.
The selected-target offer owner `145959720` supplies those exact shared bounds
and calls the constructor for learned abilities at rarity 4. The retained
[offer block](evidence/0.105.0/equipment-catalog/offer-pool.asm) records the live
connection; this is not an inferred catalog based on matching strings.

The constructor's **112 existing generated** definitions and all **17 shared**
definitions match the retained historical asset, including keys, English
fallback names, icons, rarity, effect fields and decoded strings. Its additional
`demonic_empowerment` definition exactly matches the already connected
`legionlord-0.105.0.json`. The live loader in
[`loot_rewards/amulets.rs`](../../crates/azeroth-survivors-re/src/loot_rewards/amulets.rs)
loads the retained catalog and appends that current definition, yielding 130.
This preserves the existing treasure/offering/equipment/stat paths; another
parallel catalog is unnecessary.

Current native Effect64 stat/spell discriminants **35/36** correspond to the
source's internal **30/31** representation. The comparison translates those two
tag bytes and masks only each identified pointer word; the owned string, length,
remaining payload bytes and decoded fields must still match exactly. Other
selected discriminants match without translation. Historical raw payloads keep
their original target identity and are never dereferenced as native pointers.

## Scaling consumers and checks

Current rank owner `14587af80` retains the five rarity steps
`[0.6, 0.5, 0.35, 0.25, 0.2]` and generic
`3 - 2 * (1 - step/2) ^ max(picks-1, 0)` multiplier. Its existing canonical
[assembly](evidence/0.105.0/demon-offers/amulet-rank.asm) leads through
`1459a8f10` to current iterator `1459b5410`; passive effects use `1458e0750`.
The iterator multiplies stat amounts and spell modifier magnitudes, caps spell
cooldown reduction at 0.5 and floors target counts after adding native 0.0001.
Other fields retain their original values. The source's `scaled_bytes` contract
matches these consumers for the catalog's selected variants.

[`recover-equipment-catalog.py`](../../scripts/recover-equipment-catalog.py)
checks the full EXE hash before recovery, then:

- Rechecks all 415 ordinary numeric definitions with the current PvP recovery.
- Executes all 113 original amulet constructors in bounded Unicorn memory and
  compares all 130 live source definitions / 375 Effect64 records.
- Checks **1,484** generic scaling cases: 371 non-Legionlord effects at factors
  `1`, `1.5`, `2` and `2.5`, within the recovered multiplier domain. Original x64
  output matches every normalized Effect64 byte of the source translation.
- Checks the five current rarity-step bits, the actual live asset includes,
  numeric provenance metadata and retained native/extract hashes.

Legionlord uses its separate recovered rank interpolation, documented and
checked in [Demonology offers](demon-offers.md); those canonical extracts
are referenced rather than duplicated. The ordinary gear's earlier 166 native
scaling cases remain [separate evidence](evidence/0.105.0/pvp-gear/native-scaling-validation.json).

Run `python3 scripts/recover-equipment-catalog.py --check` for the
noncompiling source/native checks. `--prepare` stages three focused REA plans
under ignored `runtime/equipment-catalog-0.105.0/`; run a selected plan with
`scripts/rea-batch.py`. The checked source assets build independently of the
reference EXE and Unicorn. The constructor recovery uses reviewed vector
reservation, successful allocation, locale miss, string formatting and memcpy
seams; unknown calls fail closed. Scaling uses only a floorf seam and real PE
data/jump tables.

The [compact result](evidence/0.105.0/equipment-catalog/catalog-validation.json)
contains counts, normalized output digests and exact native byte ranges. The
[manifest](evidence/0.105.0/equipment-catalog/manifest.json) binds the extracts to
REA/Ghidra evidence and records the shared canonical dependencies. Ghidra does
not resolve the constructor/passive indirect switches; the complete selected
assembly and bounded original-instruction cases supply those observations.

No compilation, Rust test execution, game application, proc execution or visual
comparison was performed. Native scaling is compared with a source translation;
the Rust implementation remains uncompiled, and host `powf` has not been proven
bit-identical to the Windows CRT. These results complete the selected numeric
definition recovery, without establishing gameplay or presentation parity.
