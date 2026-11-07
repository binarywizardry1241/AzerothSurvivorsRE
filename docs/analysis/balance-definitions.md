# Current ordinary balance definitions and equipped gear

The installed **0.112.0** EXE, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`,
is the specification. This is the ordinary-definition/gear source repair for
#34; [verification-needed](../verification-needed.md) owns overall status. Historical
[balance](balance-catalog.md), [gear](equipment-catalog.md) and
[ability](ability-definitions.md) reports retain their actual targets.

## Source correction and live consumers

The current ordinary item reader dispatches Feet (slot 5) to the single tag-5
movement payload at `14721f1bc`: **0.075**, replacing the source's historical
0.03. Shared base/extra scaling and the global 0.7 factor produce the exact
quality-specific values. The repair updates **45 ordinary boot rows** and the
**nine PvP boot rows** that share this same payload. PvP names, appearances,
release provenance and unrelated PvP behavior are not promoted by this numeric
repair. Both assets identify the selected numeric-effects provenance separately
from their historical identity/appearance fields. The other 444 item numeric
records remain unchanged.

Saved equipped IDs enter `GearSave::effects`, which merges equal tags in slot
order, then `gameplay::enter` supplies `configure_effects`.
`refresh_effects` calls `Numeric::apply_gear`; tag 5 adds movement speed, and the
existing movement consumer reads that refreshed accumulator. Both Armory stats
and gameplay therefore receive the corrected catalog values. Cosmetics never
supply stat IDs. The current native equipment producer `145997a50..145997e69`
iterates all nineteen equipment words and merges equal tags before the numeric
refresh. Pickup contributions add in that producer before multiplying the base
radius once. Tag 11 carries an integer payload in the native sum; the source's
human-readable catalog represents it as a numeric value and converts it to u32.

## Current definition and consumer checks

`python3 -B scripts/check-balance-definitions.py` reproduces the
[compact result](evidence/0.112.0/balance/definitions.json):

- All **113** ordinary ability records, at `146bf5eb0` with stride 120: keys,
  names, icons, ordered upgrade bytes, IDs, exact numeric/status bits, school
  and cast kind. The existing generic field decoder is reused with explicit
  current hash/address; no historical address or expected result selects input.
- All five current ordinary upgrade arrays and **11,300** actual native
  magnitude cases across every ability, kind, quality and four counter/cap
  profiles, including the u32 counter boundary.
- All **nine** classes at `146bf4988`, stride 144: names/icons/blurbs, menu and
  live ability pools, starter, base health/armor/leech and run-entry baselines.
- **313** retained non-Warlock/non-replacement talent definitions, complete
  normalized effect payloads, menu prerequisites/alternatives/exclusivity,
  milestone flags, follower entry IDs and **989** actual native rank texts.
  The changed forty Warlock and two Warrior rows retain their separate current
  [Warlock](warlock-talents.md) and
  [Warrior](warrior-talents.md) proofs.
- All **415 ordinary + 83 shared PvP numeric records**, including exact health
  rounding, extras and legendary additions. **913** native scaling executions
  use the actual current armor/weapon/extra scalers and PE tables.
- **127 equipped inventories** pass through the actual item reader and
  nineteen-word aggregation, then **127 numeric composition cases** traverse
  the current indirect stat dispatch. These include each class/quality's full
  ordinary set and boots alone, both factions' PvP sets/boots and empty gear.
  All thirteen accumulator lanes match the connected source arithmetic.

Current [player baseline arithmetic](player-baselines.md) separately
revalidates the class/race/level scalar consumer and fixes growth-before-race
rounding. Current [amulet construction/names](amulets.md),
[Star of Mystaria](jewelry.md),
[ordinary upgrade/Medallion rules](demonic-empowerment.md) and
[boss headers](raid-native.md)/[arithmetic](raid-inputs.md) have
separate current proofs. Matching definitions does not certify every spell,
proc, actor or menu consumer in those systems.

The [manifest](evidence/0.112.0/balance/manifest.json) binds fresh Ghidra imports
for the ordinary reader, equipment merger and three scalers, plus selected
native stat intervals and actual input tables. The numeric-refresh owner reuses
[canonical current provenance](evidence/0.112.0/buff-potency/manifest.json).
Raw Ghidra imports omit external data and retain unresolved computed jumps;
actual PE tables and original instruction execution own those exact dispatch
conclusions. `--prepare-rea` writes reproducible bounded plans under ignored
project `runtime/`. Full regenerable field inventories are reduced to semantic
and range digests in the retained proof.

Allocation, C memory, English fallback and finite health `roundf` are declared
fixture seams. Rank formatting executes original instructions; the effect/math
oracles and live source guards do not execute reconstructed Rust. Gear-stage
race/class baselines and storage are synthetic. No compilation, Rust regression
execution, game, MPQ/device/UI/GPU run, filesystem operation or original/rebuilt
comparison occurred. Windows CRT `powf`, full actor/global ownership and actual
movement/combat/presentation parity remain unverified under their owning gaps.
