# Enemy spawning source recovery

Date: 2026-10-18. Selected target: `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.

Recovered source lives in `crates/azeroth-survivors-re/src/enemies/spawning.rs` and `waves.rs`. It implements ordinary admissions, selection, budget and population spawning, primary/fallback placement, timed elite appearances and all four periodic formations. The current application has no gameplay world adapter. This is source reconstruction with bounded native-instruction evidence, not a claim that enemies appear in a playable rebuilt game.

## Owning evidence and method

- [Instruction ranges, exact bytes digests, constants and jump table](evidence/0.97.2/enemies/spawning-manifest.json).
- [15 retained REA/Ghidra records](evidence/0.97.2/enemies/spawning-rea.json). Ten complete PE functions and four original branch-entry slices are imported at their original virtual addresses. The ordinary main tick reuses the already hash-bound REA result from the same selected target.
- [Bounded original-instruction fixtures](evidence/0.97.2/enemies/spawning-fixtures.json): 982 admission checks, 517 weights, 8 budget cases, 7 population cases, 21 uniform random selections, 18 formation counts and 6 interval pairs.
- [Recovered constructor defaults](evidence/0.97.2/enemies/initialization-native.json), owned by the scaling recovery.
- [Exact zone/enemy catalog and roster](enemy-catalog.md).

`python3 scripts/recover-enemy-spawning.py` verifies the full selected EXE digest, reads original PE mappings, retains disassembly/constant evidence and prepares project-local REA plans. `python3 scripts/rea-batch.py runtime/analysis/history/native-recovery/enemy-spawning/20e2f3691d48/plan-<address>.json` runs each prepared plan through `./scripts/rea` with Ghidra. Raw slices are unmodified bytes, not executable replacements. They omit unrelated code/data, so original Win64 instructions and selected-image constants govern recovered arguments. Decompiler-generated bad-instruction warnings at a shared-tail slice boundary do not mean the original EXE has that failure; the original outgoing branch is retained in assembly.

`python3 scripts/recover-enemy-spawning-fixtures.py` executes only declared original instruction intervals in Unicorn with synthetic inputs. Unknown instruction excursions are rejected. The imported `ceilf` value is supplied explicitly between two retained intervals. No OS/game process is launched. The script independently verifies every admission/weight against scalar arithmetic. A separate scalar-f32 comparison matched all eight retained budget cases. Native geometry/libm parity and full execution have not been verified.

## Ordinary enemy admissions and random selection

The ordinary collector `0x14552ef30` iterates the chosen zone's original definition order. It admits a row only when `flag_4c == 0` and `elapsed_seconds / 60 >= raw_48`. The time gate is inclusive. Rows admitted earlier stay eligible. A finite run never admits an infinite deadline; NaN comparisons refuse admission.

The weight builder `0x145536a90` calculates, in scalar f32 order:

```text
weight = min(1 + 0.5 * max(run_minutes - spawn_minute, 0), 4) / spawn_cost
```

`spawn_minute` is definition+`0x48`; `spawn_cost` is definition+`0x44`. Selector `0x1454beef0` sums weights in definition order, draws from `[0, max(sum, .001))` using the one shared run RNG, subtracts successive weights and chooses at the first `weight > remainder`. Its exhausted-roulette fallback is the first candidate. Empty ordinary input is a bounds failure when selection is attempted, not a fabricated default.

The collector's finite-time cases cover every row from all 12 zones in the catalog. The roster report lists which enemies and minute gates each zone supplies.

## Budget, population and live-entity limits

Main tick `0x1454a7339..0x1454a792f` runs inside the active-run gate and skips this whole stage if Game+`0x95b` is set. The caller owns the clock. New-run budget Game+`0x90c` is **3.0**; the shared death accumulator Game+`0x910` is **0.0**.

With `m = run_seconds / 60`, `d = density_percent / 100`, the base budget rate is `d * (.9 + .32*m + .025*m*m) * .6`. Living boss rows reduce it to `.45` for a definition whose byte+`0x54` is zero, or `.3` otherwise; multiple bosses take the minimum factor. Native eligibility is a live row with actor+`0x18 != -1`.

Endless multiplies this rate by `1.5`; Game+`0x858 == 1` adds `.1 * max((run_seconds - endless_started_at)/60, 0)` to that multiplier. This phase does not change the population top-up formula.

The existing `MobLootState.death_accumulator` owns Game+`0x910`: ordinary enemy deaths add their `raw_44` cost. Spawning borrows that same accumulator, decays it by `expf(delta_seconds / -12)`, and multiplies the base rate by:

```text
clamp((decayed_death_credit / 12) * 1.25 / max(base_rate, .001), 1, 3)
```

The tick adds `delta_seconds * accelerated_rate` to budget. While budget is at least one it selects an enemy, stops if its cost exceeds the budget, attempts creation, and subtracts cost only on success. At most **8 budget creations** occur in one tick. A cap refusal clamps retained budget down to that selected cost.

A separate top-up then targets:

```text
floor(min((4 + 1.6*m) * d * boss_factor, 36*d))
```

It subtracts currently living ordinary definition rows and attempts at most `3 * ceil(d)` missing enemies. The `ceilf` input is the density factor still in XMM0, not frame delta. Top-up does not spend budget.

Both paths call creator `0x1454c2040`, which refuses when all living entities reach `clamp(floor(50*d), 50, 120)`. This count includes elite/boss rows. The source checks the cap before passing creation to the engine adapter. GUID/stat/actor initialization is owned by `enemies/scaling.rs`.

## Ordinary placement and fallback

Creator `0x1454c2040` requests primary helper `0x1454c17b0` with near/far distances **26/36**, forward probability **.5**. A caller-supplied position bypasses this sampling. The shared run's smoothed player velocity Game+`0x8a8` supplies direction.

For each of 16 angle attempts:

1. If velocity squared exceeds 4, a 24-bit uniform draw chooses forward bias with the supplied probability. A biased angle is `atan2(vy,vx) + random(-1.2,1.2)`; otherwise it draws `[0,2π)`.
2. Draw one distance in `[26,36)`. Try that point, then reduce distance by 2 until it falls below 12.
3. Refuse points more than `zone.radius + 18` from the zone center, missing primary terrain surfaces, height difference over 25 inside the zone, or over 8 outside its radius.
4. With a collision grid and no path grid, byte value exactly 1 rejects. With a path grid present, any nonzero collision cell rejects. Missing/out-of-bounds collision cells alone do not reject.
5. A present path grid with at least 401 populated cells also requires an in-bounds non-`0xffff` distance no greater than `straight_distance*1.5 + 12`.

After all 16 angles fail, the original function tail-calls `0x1454c2a20` with the same 26/36 range. It tries 12 random radial samples, projects each within the zone radius using sqrt distance, rejects nonzero collision cells and accepts a primary surface only when its height difference is strictly below 25. A final random sample deliberately skips those restrictions and zone projection; its height is primary, otherwise secondary, otherwise the owning world's default surface height.

Terrain generation, collision/path construction and the imported trigonometric/hypot/exp functions remain explicit engine ports. No synthetic flat terrain is used in production.

## Timed elites and formations

`WaveTimers::new()` reflects the selected Game constructor: elite deadline **240 seconds**, pattern deadline **60 seconds**, previous-pattern byte **255**. Each due check is inclusive and schedules the next deadline from the current clock. A delayed frame processes one due event rather than backfilling missed waves.

Timed elites (`0x1454a793f..0x1454a7c18`) use collector `0x14552f110`: `flag_4c == 1` and the same inclusive minute gate. They choose uniformly, attempt ordinary creation, and announce the selected localized name with `%s approaches!`. The next interval is `max(55 - 2.5*m, 25)` seconds. The native still consumes its count-one random choice when no elites are currently eligible, then schedules the deadline. Announcement occurs for an eligible selection even when the live cap blocks creation.

Periodic formations (`0x1454a7c18..0x1454a92bd`) choose one of tags 0–3 excluding the immediately preceding tag. The enemy pool is admitted ordinary definitions whose cost is at most **1.2**, falling back to all admitted ordinary definitions if that subset is empty. An initial uniform enemy choice always occurs. Stampede and pack subsequently override that enemy, preserving the discarded draw's RNG consumption.

All counts apply `s = (density_percent / 100) * .6`:

| Tag | Message | Count | Recovered placement/behavior |
|---|---|---|---|
| 0 | Swarm surrounds you! | `max(floor((12+2.5*m)*s),1)` | Even angles `i/count * 2π` around the player; radius 26, reducing by 2 to 8 on failure. |
| 1 | A stampede charges through! | `max(floor((10+2*m)*s),1)` | Fastest pool member (last equal-speed tie); moving player heading plus random side ±1.57 and jitter ±.4, otherwise random heading. Center starts behind at 34, reduces by 2 to 14. Two rows, lateral spacing 2.6 and row spacing 3; successful creations receive the forced movement order below. |
| 2 | A wall of foes closes in! | `max(floor((10+2*m)*s),1)` | Moving heading or a random heading; centered 2.4-radian arc with half-cell angular offsets; radius 30, reducing by 2 to 10 on failure. |
| 3 | A pack hunts you! | `max(floor((5+.8*m)*s),2)` | Replaces the enemy with weighted selection from all ordinary admissions; random center direction at radius 32 reducing to 14. Group offsets use angle `2.4*i` and radius `1+1.6*sqrt(i)`. An invalid offset reuses the valid pack center. |

Shared point helper `0x1454d1b70` enforces radius+18, primary height, 25/8 height limits, nonzero collision-mask rejection and populated path-distance checks. Swarm/wall use equivalent inlined checks. Each failed point is skipped. Pack/stampede announce only after finding their valid center; every pattern schedules its next deadline even if placement fails. Next interval: `max(60 - 1.5*m, 35)` seconds.

Stampede travel is `2 * distance(center,player) + 12`. Successful spawns set actor+`0x78 = 1`, destination+`0x7c/+0x80 = spawn_xy + forward*travel`, expiry+`0x84 = now + travel/max(effective_speed*1.4,1) + 3`, and next-move time+`0x12c = now`. Effective speed uses the selected definition and the run's speed percent. The actor AI owns the resulting forced movement, attacks and removal.

## Validation and remaining integration

Performed: selected-target SHA verification; Ghidra decompilation; original Win64 instruction/data audit; bounded native-instruction fixture generation; scalar-f32 budget/admission/weight comparisons. Native fixture generation succeeds with **1,559 cases** (interval rows each contain two deadlines).

Authored `tests/enemy_spawning.rs` compares the retained admissions/weights/budget/population/RNG/formations/interval fixtures and covers initial budget plus top-up, live cap refusal, suppression and primary surface sampling. **Rust tests, compiler checks, builds and original/rebuilt game launches were intentionally not run**, per current static-only work mode.

Remaining: connect these rules to the real run tick, shared `MobLootState` credit, one shared RNG, actual terrain/collision/path resources, entity creation, client messages and AI orders. Boss/guardian schedules, distant-enemy relocation and actor combat belong to their separately documented source owners. No world execution, Windows comparison, geometry/libm bit parity or full gameplay parity is established by this recovery.
