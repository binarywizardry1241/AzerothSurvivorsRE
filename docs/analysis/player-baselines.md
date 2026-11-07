# Player baseline arithmetic order

The installed **0.112.0** EXE, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`,
computes level growth before adding racial damage/regeneration. The source
previously rounded each racial-plus-base sum at entry, then added growth during
refresh. Those expressions produce different f32 results. Dwarf damage and Troll
regeneration expose the difference in ordinary levels; it affects every class.
This is the remaining baseline consumer repair under #34, following the
[current definition/gear](balance-definitions.md) repair.

Native `1458f2c39` converts the unsigned level to f32 before adding -1. Native
base damage is `1 + .03 * offset`, and regeneration is `.8 + .08 * offset`;
the racial payloads are added afterward. The old integer-first saturating
subtraction also differs at explicit float/integer boundaries. Health uses the
same native level offset before its class/health-multiplier composition.

The live entry path now supplies the uncombined base/racial components to
`EffectsState` before `configure_effects`. The ordinary refresh uses that precise
seed for growth and subsequent racial additions. It retains the public stat
record and the existing level-one totals. Hand-authored mechanics callers still
supply their own base stats through the existing path. Final damage passes the
existing normalized stat/current-damage adapter; regeneration reaches the normal
health tick. The new seed adds no separate refresh, writer or gameplay rule.

`python3 -B scripts/check-player-baselines.py` reproduces the
[compact result](evidence/balance/player-baselines.json): **7,776** full
original numeric-refresh prefixes, comparing **85,536** exact scalar bit values.
Profiles cover nine class records, eight race records, levels 1–100 and eight
explicit zero/f32/u32 boundaries. The previous source differs in **675** compared
fields across that complete matrix; 243 lie in the level 1–100 matrix. The fixed
source arithmetic model agrees with all fields. It also verifies the existing
subtract/add damage projection retains those selected bits and traces the real
entry/refresh/damage/regeneration source consumers.

The [manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.112.0/balance/player-baseline-manifest.json) binds a
fresh REA/Ghidra import of `1458f28e0..1458f3aaf` and the selected level/racial/
finalization instructions. Existing aura/buff-store and gear intervals retain
their canonical extracts; they are referenced rather than duplicated. The full
actual PE supplies class/race data and indirect dispatch. Raw Ghidra pseudocode
omits external data and retains unresolved jumps; it is not a recovered Rust
function signature or proof of unrelated gameplay paths.

The checker verifies every selected byte range, retained assembly digest and
canonical dependency against the installed target. `--prepare-rea` reproduces
the bounded whole-owner Ghidra import plan under ignored project `runtime/`;
run it through the project REA wrapper as described in [REA](../REA.md).

The native fixture uses empty synthetic equipment, stat, jewelry, aura,
temporary and actor collections. It stops at `1458f3455`, after scalar/health
updates and before movement/health packet work. The profile matrix is bounded
numeric evidence, not a claimed gameplay level domain or playthrough. The
comparison models explicit f32 source operations and uses source guards;
reconstructed Rust, ECS and application scheduling do not execute. The two
changed sources syntax-parse. Compilation, Rust regression execution, active
proc/actor combinations, actual ticks/UI/input/persistence and original/rebuilt
parity remain unverified. [verification-needed](../verification-needed.md) owns overall status.
