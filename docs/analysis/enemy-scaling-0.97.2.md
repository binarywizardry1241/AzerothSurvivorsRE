# Ordinary enemy creation and scaling — 0.97.2

Reviewed 2026-10-18. Authority is the supplied project-local `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`. This report concerns ordinary enemy creation. Guardians and scheduled bosses have different creation/scaling paths.

The reconstruction in `crates/azeroth-survivors-re/src/enemies/scaling.rs` contains recovered scalar creation arithmetic, initial AI parameters, shared-RNG initialization, the ordinary population limit and creature GUID construction. These are source components. This work does not establish complete gameplay integration or runtime parity.

## Owning native evidence

[Retained evidence](evidence/0.97.2/enemies/scaling-evidence.json) records exact native function byte hashes, file offsets, constant spans and curated procedure/assembly/pseudocode facets from the focused REA/Ghidra results. Full exported analysis bundles remain under ignored runtime; the excerpts retain their Evidence IDs, profiles, limitations and full-record digests. The original instructions govern SSE operand order; raw-slice Ghidra signatures are generic and do not express the target's Win64 calling convention.

| Function | Selected-target VA interval | REA evidence |
| --- | --- | --- |
| Ordinary constructor | `1454c2040..1454c293c` | `ev_d23038e067f82a2d203ad037ac514786faf0c4f47e3c93f1d06be790e4d8aee5` |
| Nonzero flag HP polynomial | `1454f0830..1454f0875` | `ev_4c505adb044f0c65ad5d5b70ae76b364f44a691f909698f669850418e11f0032` |
| Zero flag HP polynomial | `1454f0880..1454f08c5` | `ev_916314abca00d3723ed68a2eec52a7b9fde12e61f82eb821ff7595c2e30b5216` |

The constructor start and end come from the PE `RUNTIME_FUNCTION` entry. `1454c2170` is inside its population-count loop, rather than a function start. HP helper extents end after their leaf `RET`. Committed assembly files correspond to those exact target spans; no old-version RVAs are reused.

## Recovered rules

Let `t = run_clock_seconds / 60`, `z = zone.scalar_e0 * active_difficulty`, and `e = max((clock - endless_start)/60, 0)` only when run phase is `1` and the endless flag is nonzero; otherwise `e = 0`.

The HP helper computes `(1 + 0.1t + 0.036t² + ct³) * z`, where `c = 0.00594` for nonzero record byte `+4c` and `0.00704` for zero. The later packed HP/damage factors select using **bit zero** of that byte: `[4.8, 1.0]` when set, `[4.95, 1.25]` otherwise. These different checks are preserved. The byte's complete gameplay meaning is left at its recovered `flag_4c` name.

The damage time/difficulty multiplier is `sqrt(z) * (1 + 0.07t + 0.015t² + 0.0002t³)`. Final HP combines the HP helper, base HP and flag factor, Windows CRT `powf(1.22, e)`, and the HP percentage. Damage combines its time/difficulty multiplier, base damage and flag factor, `powf(1.096, e)`, and the damage percentage. Both powf calls occur **unconditionally**, including when the exponent is zero. Source code follows instruction multiplication/addition order without fused multiply-add. The readable formulas here express the recovered mathematics, rather than prescribing reassociation.

The scalar initializer writes:

- Current HP and max HP together, plus damage.
- Movement speed `(speed_percent / 100) * 1.05 * record.raw_3c`.
- Attack interval `record.raw_38`; initial attack delay `0.5 * record.raw_38`.
- Melee reach `1.2 * record.scale + 2.2`; ordinary scale is unchanged.
- Uniform facing in `[0, 2π)` and first movement due time `clock + uniform[0, 0.3)`. Both use the shared native four-word xoshiro256++ RNG and 23-bit f32 mantissa sampling; the source reuses the existing shared RNG implementation.

The original draws facing before powf/entity creation, then draws the first movement delay after entity creation. The timing convenience helper combines those draws, so an integration that lets intervening external calls consume run RNG must preserve the native interleaving explicitly.

The constructor counts each actor status at `+68` as `u32(status) XOR 1`. For the recovered alive/dead discriminants, alive rows consume the cap and dead rows do not. The cap is `clamp(trunc((density_percent / 100) * 50), 50, 120)`. At capacity it exits before zone resolution, selection, RNG, powf, entity creation or counter increments. Requested enemy indices saturate to the zone's last row; an empty list reaches the original bounds-panic path. No invented fallback enemy is supplied.

The GUID counter increments with u32 wrapping. GUID is `0xf130000000000000 | ((entry & 0xffffff) << 24) | (counter & 0xffffff)`. Actor status/effect/movement fields receive their native zero/sentinel defaults in the constructor; the source AI owns their lifecycle after creation.

## Fresh Game spawn-state defaults

[Constructor initialization evidence](evidence/0.97.2/enemies/initialization-native.json) binds the fresh-Game initializer `14549bb90..14549cefd` to this target and retains REA `ev_6ba2251b09c79873deb3f9348a6c19acb85427880b59bbb77c74fc878b07d86d`. The constructor assembles a Game at stack **RBP+0x28** and copies `0x960` bytes to its original output argument at `14549cd4f..14549cd63`. The called thunk's PE import is verified as `memcpy`. Thus a stack field at RBP+X is Game+(X−0x28); matching numeric offsets across those two bases would identify different fields.

| Field | Game offset | Stack offset from RBP | Initial value | Native source |
| --- | --- | --- | --- | --- |
| Ordinary spawn budget | `+90c` | `+934` | `3.0f32` | `14549c4bf..14549c4ce`: `MOVSS` constant 3.0 then `MOVLPS` |
| Shared death credit | `+910` | `+938` | `0.0f32` | Same packed store; `MOVSS` memory input clears the next low64 lane |
| Pattern deadline | `+914` | `+93c` | `60.0f32` | `14549c4ce` immediate `42700000` |
| Elite deadline | `+924` | `+94c` | `240.0f32` | `14549c504..14549c514`, constant `1469aa310` begins `[240.0, 40.0]` |
| Guardian lair respawn suppression | `+958` | `+980` | byte `0` | `14549c5e5` zero dword at stack+97d covers stack+980 |
| Ordinary spawn suppression | `+95b` | `+983` | byte `0` | `14549c84a` dword `ff000000` at stack+982 gives bytes `00 00 00 ff` |
| Previous pattern | `+95e` | `+986` | byte `0xff` | `14549c4d8` writes `-1` |

The first pattern/elite deadlines are absolute run-clock values of 60 and 240 seconds. This initializer does not establish later transition behavior; the ordinary spawning and pattern code own subsequent writes. The final pre-copy stat refresh `1454950d0..14549617c` was independently decompiled (REA `ev_7840563fa26a21db7d35e1c04dbed492491797f8d462d493c12e651350f3248d`) and its direct Game writes were inspected; no direct writes to these seven spawn fields were found. The two suppression fields are independent: ordinary spawn admission at `1454a701a` reads Game+95b; guardian lair respawning reads Game+958. All defaults above are concrete native stores rather than guesses based on zeroed allocation or run-start conventions.

Regenerate the retained focused instructions, constants, aggregate mapping and REA records with `python3 scripts/recover-enemy-scaling-initialization.py`. Its generated native-slice plans use `scripts/rea-batch.py` and `./scripts/rea`; no original game launch, compilation or compiler-based test was performed.

## Validation and limitations

`python3 scripts/recover-enemy-scaling-evidence.py` retained 3 functions, 20 constant spans and 3 focused REA records. The associated plans run Ghidra through `scripts/rea-batch.py` and `./scripts/rea` against unchanged hash-bound native slices. The game executable was never launched.

`python3 scripts/recover-enemy-scaling-fixtures.py` completed bounded instruction emulation of the unchanged constructor and both HP helpers, producing `tests/fixtures/enemy-scaling-native.json`: **1,184 creation cases** covering every one of 148 enemy rows across 12 zones at eight input combinations, **60 population boundary cases**, and **4 index-saturation/GUID wrap cases**. Inputs cover early/late clocks, different difficulty and percentages, zero/max modifiers, endless fractional/future-start/wrong-phase behavior and a nontrivial shared-RNG seed. Native entity-call arguments, created actor fields, both powf calls, counter and final RNG state are retained.

The oracle replaces the zone resolver with a selected catalog index, injects/captures CRT powf results, captures entity creation, supplies position directly, and preallocates actor storage. It executes the constructor's population gates, helper polynomials, scalar/SIMD math, RNG transitions and stores unchanged. This is isolated instruction emulation, not execution of the game as an application. Terrain placement, entity internals and allocation behavior are outside this oracle. Separate transcribed f32 scalar arithmetic was checked against all 1,184 oracle outputs; that check is not execution of the Rust source.

`tests/enemy_scaling.rs` is authored to compare all stat fields, powf arguments/call counts, RNG draws/state, cap behavior, entity metadata and GUID wrap with these fixtures. **Rust compilation and Rust tests were intentionally not run**, honoring the current source-only/static-recovery instruction in `AGENTS.md`. Neither original nor rebuilt game was launched. Host `f32::powf` is only a convenience seam; complete Windows CRT powf bit equivalence remains unverified. No playable-world or native visual comparison was performed.
