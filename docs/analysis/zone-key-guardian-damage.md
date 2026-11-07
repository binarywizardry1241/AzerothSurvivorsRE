# Zone-key resolution and guardian damage

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`,
141,932,032 bytes. This follows **Q41-P01-zone-key-145808880**, under **#41**,
and records the runtime/API fallback mismatch as permanent **#66**.
[verification-needed](../verification-needed.md) owns implementation status. Source/static
repair of the fallback boundary is complete; source execution and parity remain
unverified. This does not certify the complete guardian system.

## Native contract and source connection

Current parser `[0x145808880,0x1458089a9)` compares exact bytes and lengths for
these keys, in definition order:

| Index | Key | Index | Key |
| ---: | --- | ---: | --- |
| 0 | elwynn | 6 | arena |
| 1 | duskwood | 7 | sm |
| 2 | wsg | 8 | av |
| 3 | ungoro | 9 | brm |
| 4 | ab | 10 | aq |
| 5 | feralas | 11 | naxx |

Every other byte string returns **index0**, including different case, extra
spaces, embedded NUL and empty text. Unsupported lengths return zero without
reading the input pointer. Canonical definition getter
`[0x1458089b0,0x1458089cf)` returns `0x146fdcd48 + index*240`.
The local branch of `[0x145881860,0x1458818f4)` returns a roster row's raw key
pointer/length unchanged; fallback resolution does not rewrite that key. Its
cooperative branch is not executed or implemented by this repair.

The reconstructed `Mechanics::new` previously rejected an unknown key;
`stock_roster` returned an empty list and run admission returned early. The
shared `zones::resolve` now supplies the native Elwynn default at these three
runtime/API boundaries. Subsequent world/map selection, enemy catalog and
mechanics therefore use the same resolved key. The original runtime selection
is retained. Normal save loading and picker commits already normalize keys,
and stock realm ports supply valid keys: no ordinary picker/roster failure was
reproduced. This change does not alter save normalization or establish that an
ordinary game session reaches a noncanonical key.

The selected original guardian-damage caller is the complete 399-byte function
`[0x145974490,0x14597461f)`. It resolves the Game key through this same parser,
bounds-checks the enemy index, and reads the selected definition's zone scalar
and enemy base damage. The existing source consumer is
`gameplay/mechanics/guardians.rs::resolve_guardian_engagements`, which uses
`guardians/scaling.rs::guardian_damage` with the resolved zone and enemy record.
All twelve current map/area/spawn records, zone scales and 148 enemy IDs/base
damage values match the retained source. Other enemy/boss fields keep their
actual historical provenance.

The native f32 operation order agrees with `guardian_damage_with_powf`:
minutes are clock/60; the polynomial is `(0.004*minutes)*minutes +
(0.08*minutes+1)`; the difficulty factor is `sqrt(zone_scale*difficulty)`;
base damage is multiplied by that product, 1.4, the Endless factor, the
kill multiplier and finally damage-percent/100. Endless applies only for
phase1 with the Endless flag; its exponent is `max((clock-start)/60,0)` and
its base is 1.096. The proof injects the powf return while checking both
arguments. It does not certify Windows CRT versus host powf bit parity.

## Evidence and checks

The [proof](evidence/zone-key-guardian-damage.json) retains exact range
hashes, fresh REA/Ghidra parser Evidence IDs, definition/record hashes, input
bits and result commitments. The [single instruction extract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.113.2/zone-key-guardian-damage.asm)
is bound to those current bytes. The parser's fresh 297-byte Ghidra body lies
outside declared PE unwind extents; it is not assigned an invented enclosing
owner. The guardian function is already the selected actual Ghidra owner in
`evidence/0.113.2/refresh-baseline/seeded-census.json` and its retained procedure artifact.

Run `python3 -B scripts/check-zone-key-guardian-damage.py` with the
project-local Capstone/Unicorn environments described by the existing recovery
tools. This executes original instructions with synthetic state, not the game
or reconstructed Rust. It passes:

- 65,536 two-byte keys and 12,329 key mutations;
- 23 UTF-8 key/definition/raw-local-accessor fixtures and 59 null-pointer cases
  at lengths the parser rejects without a read;
- all twelve map/area/spawn/scale and 148 enemy damage input comparisons;
- 2,072 complete damage cases, 24 bounds cases and eleven unknown-key callers.

Damage cases cover all enemies across fourteen clock/difficulty/kill/percent/
phase/Endless profiles, including NaN, infinity and signed zero. Finite and
signed-zero results compare exact bits; NaNs compare classification. Bounds
failures and the external powf call are explicit intercepted seams. Source
checks inspect the arithmetic order and live resolver connections. Rust
regressions cover known/unknown resolution and a synthesized noncanonical
runtime roster preserving its raw pick; they are authored/unrun.

No compilation, source/client/event execution, actual saves/world/MPQ loading,
combat, UI/rendering or original/rebuilt comparison ran. Full health/AI/alias/
producer ownership remains outside this bounded proof. Every original census
and queue selector/count is retained; neither this repair nor its static cases
closes #41 or establishes gameplay parity.
