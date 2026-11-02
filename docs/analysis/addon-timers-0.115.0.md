# Local addon timers and current API — 0.115.0

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
Gap **#11 / TIMER01** now has a connected local source implementation. The
[current manifest](evidence/0.115.0/addon-timers/manifest.json) and
[integration proof](evidence/0.115.0/addon-timers/integration.json) bind native
code/data, canonical extracts and bounded checks. Compilation, reconstructed
execution and original/rebuilt interaction or presentation remain unverified.

## Live publication

`client/addon_bootstrap.rs` installs the complete immutable current
[embedded Lua](evidence/0.115.0/embedded-api.lua), replacing the earlier
baseline-plus-revive fragment composition. Its ordinary core FrameXML append,
legacy event arguments, shared API frame, ten-key HUD substitution and
load-before-addons route remain intact.

The live twenty-stream snapshot inserts `AZSTIMERS` immediately after
`AZSSPELLS`, before `AZSBUFFS`. It reads the actual equipped generic-effect
ordinals, timestamps/counters, raw stat and active-aura recovery, shared lethal
deadline and source metadata. No second scheduler or summon-arrival estimate is
introduced. Existing changed-byte filtering and addon-chat packets deliver the
result to `AZS_ApiOnEvent` and `AZS_GetTimers()`.

The current snapshot also places `AZSPARTY` before `AZSREVIVE`. Both are empty
for the local solo source; fresh Lua tables and ordinary empty-payload
suppression preserve the native no-party result. This adds the current read
accessors without cooperative state, gameplay, networking or server behavior.
Nonempty party production and party rendering remain excluded under **#63**.

## Selector and metadata

| Native effect | Row admission and absolute readiness | Full wait |
| --- | --- | --- |
| 0 / 16 / 17 | Ordered positive wait only; indexed deadline or zero | Effect `+8` |
| 10 | Ordered positive wait only; indexed deadline or zero | Effect `+4` |
| 19 | Always listed; separate shared lethal-protection deadline | Effect `+4`, without a positive-wait filter |
| 32, Legion Gate | Indexed deadline or zero | `MAXSS(base × current cooldown, 4)`; 12 under equipped Supremacy |
| 34, recurring summon | After activity: indexed last timestamp plus current wait; otherwise current run time | Native NaN-aware maximum of `base × current cooldown` and the effect's minimum |

Other variants, including timed-cast 26, are absent. Source semantic markers
253/32 and 253/34 map back to the actual native variants. Duplicate identities
remain separate rows in original generic-effect order. Missing timestamp and
counter slots preserve the native defaults; missing metadata skips the row.
The raw32 and raw34 maximum operations retain their different unordered and
signed-zero behavior.

Current append/talent/rebuild owners keep each 40-byte name/icon record aligned
with its 64-byte generic effect, after stat/spell modifiers are diverted. Refresh
retains the base talent clock/counter prefix and recreates the amulet suffix.
Talent names use selected-locale, English, then literal fallback; icons pass
through. Generated amulet names separately translate the prefix and
`ability.<key>.name`, falling back to the ability descriptor, then join with
`: `. Looking up the full English composite would miss those translation keys;
the timer source now carries the actual generated ability identity only for its
amulet suffix. Shared amulets and talents retain literal-name lookup. The
shared [amulet name helper](amulet-names-0.115.0.md) also serves inventory and
treasure cards, with the separate Renew/Rejuvenation and Legionlord constructor
branches covered there. The original timer cases and extracts remain unchanged.

The wire formatter cleans TAB/comma/semicolon/equals in the localized name,
preserves icon/kind, clamps absolute readiness using `MAXSS(ready, +0)`, and
prints readiness/full wait to one decimal place. The exact Lua getter computes
remaining time from the pause-aware run clock, clamps expiry at zero, filters by
exact case-sensitive name and returns new row tables. It does not sort,
deduplicate or upper-clamp remaining time to the full wait.

## Shared cooldown input repair

Current stat owner `0x14590d030..0x14590dfe9` seeds raw recovery at zero, adds
racial/stat recovery, folds active tag9 auras in row order using
`value × (1 + buff bonus)`, then adds one and takes one reciprocal before
storing `Game+0x498`. Unordered time/expiry retains an aura under the native
`!(now >= expiry)` predicate.

The previous shared source helper inverted an already rounded cooldown
multiplier, added aura recovery to that denominator, and inverted again. It
changed twelve of the 21 native boundary vectors, including nine ordinary finite
positive cases. All fifteen live helper consumers now pass `Numeric.recovery`
and share the corrected fold/add-one/reciprocal order. The existing cooldown
packet regression also changes the raw stat input so it continues to exercise a
real stat change.

Actual run entry additionally retains the original racial recovery payload in
its existing racial-component seed. Gnome uses exact f32 bits `0x3da3d70a`
(0.08); other current races use zero. Reconstructing it from the rounded 1.08
divisor produced `0x3da3d710`. The retained seed survives subsequent effect
refreshes. Synthetic/custom `RunPlayerStats` inputs outside that native entry
interface retain their existing conversion fallback.

## Cache lifetime

Current constructor/login/successful Again branches initialize or clear all
twenty payload lengths, reset selected target, and preserve the real poll clock
across new games; only construction starts it at zero. Reset precedes the later
poll gate. The gate admits ordered elapsed time at least 0.2 seconds, rejects
NaN without poisoning its clock, and still advances before the Game-absent
branch. Identical complete payloads, including empty strings, suppress delivery.
The existing `Publisher` owns this behavior for timers as for the other streams.

Current isolated reset slices begin after admitted successful Game creation.
The native action owner's computed dispatch remains partially decoded; actual
Game construction and full Menu/ReloadUI/VM scheduling are not replayed. The
historical retained-cache contract outside these bounded current reset/poll
proofs is not promoted to exhaustive current lifecycle or alias coverage.

## Checks and limits

```sh
python3 -B scripts/check-addon-timers.py
python3 -B scripts/check-addon-metadata.py
python3 -B scripts/check-addon-timer-names.py
python3 -B scripts/check-addon-cache.py
python3 -B scripts/check-addon-localizer.py
python3 -B scripts/check-addon-cooldown.py
python3 -B scripts/check-addon-recovery-base.py
python3 -B scripts/check-addon-timer-bridge.py
python3 -B scripts/check-revive-addon.py
```

These pass **499 bounded original-instruction cases**: 291 selector, 144
class/race/level recovery, 21 aura/finalization, eight lookup, eight cache,
three generated payload and 24 generated-name cases. Selector/metadata/name/
lookup/cache probes declare their allocation, formatting, locale or hash/compare
seams. The 144 recovery and 21 aura cases have no external-call/arithmetic seam;
they still use synthetic state. Native checks do not execute reconstructed Rust.

Current immutable inputs compare all 113 spell records, twelve zones/sixty
bosses, thirteen summon records, 355 talent icon candidates, the exact eligible
21 timer talents, sixteen shared amulets and three generated timer amulets.
Historical asset filenames retain their real provenance. This is bounded
metadata equivalence, not complete combat/catalog or engine certification.

The exact Lua passes 23 timer/party-reader assertions plus the existing full API,
revive, banner and summon harnesses with synthetic host stubs. Eleven changed
Rust modules syntax-parse only. Twelve new Rust regressions are authored and
**uncompiled/unrun**, including native golden vectors and actual clock/metadata
state transitions. Source-token guards supplement manual tracing; they are not
source/ECS/client execution.

Compilation, real packets/addon/FrameXML/VM lifetimes, locale changes, persistence,
input/rendering, platform behavior and original/rebuilt parity remain open.
Broader native/system ownership remains **#41**. No installed input, game binary,
MPQ, toolchain or build artifact is delivered.
