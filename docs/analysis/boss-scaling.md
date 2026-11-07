# Primary boss creation and scaling

Reviewed 2026-10-18. Authority is `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`. These source components reconstruct the supplied target; they do not establish a playable world or verified runtime parity.

Primary boss creation is native `1454bf100..1454bfeec`, called by the selected target's scheduled and endless boss branches. `1454c8110` is a generic pickup creator, rather than the primary boss constructor. The PE unwind extent, three focused instruction scopes, constants and Ghidra evidence are retained in [scaling-native.json](evidence/0.97.2/bosses/scaling-native.json). REA `ev_ea4194960d19031fb3a6d3910c92132b075e08f93cc510876cf0191af4062b77` analyses unchanged function bytes at the original VA.

`crates/azeroth-survivors-re/src/bosses/scaling.rs` implements the constructor's scalar arithmetic and initial AI fields. It consumes the canonical `guardians::catalog::BossDefinition` reexported by `bosses::catalog`; there is one boss catalog and no duplicate data table. The ordinary enemy module's matching run-option/endless-exponent/GUID helpers are reused. Guardians use a different stat caller and scaling formula.

Let `e` be `max((clock_seconds - phase_started_at)/60, 0)` only when Game+858 is phase `1` and Game+952 is nonzero; otherwise `e=0`. The constructor requests both Windows CRT powf calls unconditionally, even for exponent zero. In original operand order:

- HP starts with `base_hp * 5.75`, then multiplies zone scale, active difficulty, `powf(1.22,e)` and HP percent/100. Current and max HP are equal.
- Damage starts with `sqrt(zone_scale * difficulty) * base_damage`, then multiplies `powf(1.096,e)` and damage percent/100.
- Speed is `(speed_percent/100) * definition.raw_4c`, without the ordinary constructor's additional 1.05 factor.
- Boss scale remains the definition scale. Melee reach is `min(scale * 1.5 + 3.5,9.0)` using the native MINSS second-operand behavior for unordered/equal values.
- Attack interval and initial attack delay are both 2 seconds. First movement refresh is `1.0 + clock`. The initial shared stun deadline is `1.5 + clock`; actor+148 separately receives the current clock. Movement angle starts at zero.
- Each ability's initial remaining cooldown is exactly `0.6 * f32(word6)`. These are relative timer durations. Root AI owns their decrement/reset/dispatch.
- The shared u32 counter wraps; creature GUID uses the original `f130` prefix, low 24 bits of entry and low 24 bits of incremented counter.

Normal boss HP/damage do not have the ordinary enemies' run-clock cubic polynomial. The selected boss's base catalog values already distinguish scheduled stages. Final byte+54 does not change constructor scaling; its later death/completion behavior has a separate owner. The actor receives primary-boss definition/cooldown-vector fields, zeroed status/effect fields, guardian sentinel `-1`, and flag+158 equal to 1. The shared entity creator receives definition entry, model, unchanged scale, computed HP, flag1 and recovered spawn position. Position selection and announcements are covered by [the boss spawning report](boss-spawning.md).

`python3 scripts/recover-boss-scaling-fixtures.py` completed bounded emulation of unchanged native instructions `1454bf2cc..1454bf8b7`: **480 cases**, all 60 bosses across 12 zones at eight input combinations. The oracle includes the original scalar/SIMD math, real ability-vector initialization, GUID increment/wrap, entity-call arguments and complete actor packing/copy. It supplies a position, returns a chosen zone, injects/captures both powf calls, captures entity creation and supplies allocation/memcpy seams. It does not launch the game. An independent f32 arithmetic transcription matches all 480 native outputs.

`tests/boss_scaling.rs` is authored to compare every recovered stat, timer, entity argument and GUID with these fixtures. **Rust compilation and Rust tests were intentionally not run**, honoring source-only mode. Native/rebuilt applications were not launched. The host `f32::powf` wrapper is a convenience seam; complete Windows CRT powf implementation and cross-platform bit parity remain unverified. Engine entity creation, terrain, movement packets and live gameplay integration are required external owners.

Regenerate curated evidence with `python3 scripts/recover-boss-scaling-evidence.py`. The raw function's REA plan is project-local under `runtime/bosses-0.97.2/scaling`, using `scripts/rea-batch.py` and `./scripts/rea` with Ghidra. Ordinary builds require neither the EXE nor analysis runtime files.
