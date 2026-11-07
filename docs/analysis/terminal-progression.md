# Terminal rewards and endless continuation

This report covers the selected EXE's terminal counters, XP and continuation
contracts used by gap #9. Current integrated status belongs to
[verification-needed](../verification-needed.md). Source is implemented but uncompiled;
static instruction checks do not establish game or presentation parity.

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [mechanics manifest](evidence/0.105.0/terminal/mechanics-manifest.json)
records exact byte ranges, hashes and REA/Ghidra evidence identities. Raw slice
analysis uses generic x86_64 types/ABI; original PE instructions and literals
corroborate the recovered contracts. Overlapping meter and pause extracts are
referenced at their canonical locations rather than copied.

## Counters and loot

The current shared hit/death owner `145933ec0` increments total kills once on
first death, and increments Game+710 elites when Actor+15c is nonzero. Ordinary
and guardian actors copy the definition's +4c byte; primary bosses explicitly
set this byte to one. Primary bosses therefore contribute to both elite and
boss counters. Source now tracks this counter at the actual health/death path.

The summary reads the same `Mechanics::effective_damage()` used by the meter.
It is accumulated from min(modified damage, positive prior target health),
widened from f32 to f64 once. Damage taken uses the shared incoming ledger,
after armor/absorb, retaining lethal overkill. Meter display reset does not
reset these cumulative values. See [meter accounting](run-meters.md).

The current equipment consumer `145896520`, window `1458971b7..145897a72`,
publishes each valid equipment record in order. It compares ownership before
insertion, emits faction-aware name/icon, rarity and `new`, and does not dedupe
repeated drops. Invalid sentinel characters do not insert ownership. The source
now separates the account-delivery queue from ordered run loot history, so
saving an item cannot remove it from the terminal display. The summary captures
ownership at entry and replays this order to preserve new flags.

## XP and account checkpoints

`1458a1690` computes seven signed i64 parts, in order: time survived, kills,
bosses slain, victory, zone bonus, run options and Veteran's Lessons.

The arithmetic remains f32 until the native conversions. Kills are divided by
density, truncated to u32, then multiplied by .1. Time is seconds/60*12;
bosses contribute 40 each and victory 200. Base XP evaluates
`zone_factor * (bosses + (time + kills) + victory)` before roundf/u32 conversion,
where `zone_factor = 1 + zone_index*1.6/11`. The zone part is the residual after
subtracting the first four separately rounded/integer parts from base XP.

Run-option contributions accumulate density*.05, HP*.4, damage*.6 and speed*2
in that order, then add one and cap at two. Options XP rounds
`(factor-1)*base`. Veteran XP rounds `(base+options)*veteran_bonus`. Reversing
these additions changes reachable results: at 375 seconds, zero kills/bosses,
zone zero and modifiers `[100,125,110,125]`, the native options part is 49,
not the former 50. The source helper now preserves the native order.

Each current part minus its prior checkpoint wraps as i64. The seven deltas
are summed with wrapping addition, clamped at signed zero, then narrowed to
u32. Zero/negative results still replace checkpoints. Display parsing clamps
individual parts to u32 and omits zero; it must not filter negative parts before
the account sum. The source separates cumulative parts, delivery deltas and
acknowledgement. A query does not acknowledge a result.

The five counter deltas are kills/gold/guardians/bosses/caches. Current minus
checkpoint saturates at u32 zero; saved u64 counters saturate on addition.
The first-result flag separately gates runs, wins, unlocks and character result
records. Later terminal results after endless continuation deliver new XP and
counters without granting another run or win. Existing account source still
commits these counters at terminal delivery; native live account/update cadence
outside this terminal path remains a broader account-delivery limitation.

## Leaving and continuing

`14591d4c0` admits running/choice phases 1–3, retires active choices and source
provenance, marks left/phase4 and preserves health, stored levels and purchased
reward counters. Source abandonment now retires active offers without losing
those earned values.

`1458f0110` admits victory phase5 only. It enables endless, resumes phase1 and
sets the next boss deadline to click-time plus 300 seconds. The consumer
`14590f994..14590fa5f` invokes the primary-boss constructor and renews that
deadline. It preserves health, progression, sticky victory, prior account
checkpoints and the final-boss death timestamp used for endless scaling.
Source now connects those fields through ordinary, guardian and boss scaling.
See the [terminal UI report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/terminal-flow-0.105.0.md) for action delivery and
the connected shared player packet sequence and remaining comparison limits.

## Checks

`python3 scripts/recover-terminal-contracts.py` passed **1,712 bounded
native instruction cases**: 1,547 XP, 103 part-delta/checkpoint, five count-delta,
28 continuation, 14 abandon and fifteen optional sink-test gate cases. The
native disabled-default store is also checked separately. Thirty-eight XP cases expose the former
float order. [Curated native fixtures](evidence/0.105.0/terminal/native-fixtures.json)
retain representative inputs, outputs, exact spans and declared seams; bulk
regenerable output stays under ignored `runtime/`.

The check uses Unicorn 2.1.4 and unchanged selected-target instruction windows.
XP supplies only the zone-index return and CRT roundf semantics. Delta output
buffers are preallocated. Action checks stop before packet, pause and choice
destructor calls; unknown executed addresses fail closed. This compares native
instructions with a Python transcription aligned to the changed source; it
does not execute Rust or Windows CRT.

Rust regressions were added for reachable float-order cases, query/acknowledge
lifetimes, zero/negative checkpoints, loot retention, elite counting and
victory → endless → later defeat grants. They were **not run**. Rustfmt source
parsing and whitespace checks passed. No compiler, compiling tests, game
application, MPQ interaction or original/rebuilt comparison ran for this work.
