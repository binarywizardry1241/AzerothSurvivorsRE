# Player class-special hit/death consumers,

Date: 2026-10-18. Static source recovery only. The authoritative input is `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589` (image base `140000000`). No compilation, compiler checks, tests, emulation, original-game execution or rebuilt application launches occurred.

Implemented source is [hit_passives.rs](../../crates/azeroth-survivors-re/src/player_abilities/behavior/hit_passives.rs). This is the current class-special tail of the shared hit/death owner, together with its Polymorph producer, Soul Fire credit and Redemption enqueue helpers. It does not replace the rest of the damage, death, loot, attribution or live-world pipeline. Source implementation and static evidence do not establish working gameplay or runtime parity.

## Evidence and reproduction

The complete current shared owner is `1454c2eb0..1454c63e5`, original-byte SHA-256 `fa34d349dd4e7597bc1f2da2f90bcae0cdef33ed8128f0837a0ec72110d63c49`. Its existing complete REA/Ghidra dossier is reused: `ev_ba95562638ee7eaae2ea1dc88d80c5df86859a014473f69b678b229aacd357bd`, with [original instructions](evidence/0.97.2/loot/enemy-death.asm), [pseudocode](evidence/0.97.2/loot/enemy-death.ghidra.c) and [retained provenance](evidence/0.97.2/loot/rea-provenance.json). Original Windows x64 instructions control argument mapping; generic raw-import Ghidra parameter names do not.

The focused helpers were passed unchanged at their original virtual addresses through `./scripts/rea` / the Ghidra provider. Their original PE runtime-function bounds, individual byte hashes, provider profiles, evidence IDs and pseudocode paths are in [native.json](evidence/0.97.2/player-hit-passives/native.json):

| Helper | Current recovered purpose | Boundary |
| --- | --- | --- |
| `1454d4dc0` | Polymorph application after eligible surviving spell hit | `1454d4dc0..1454d522b` |
| `1454d5230` | Redemption probability and delayed queue insertion | `1454d5230..1454d543b` |
| `1454d68b0` | Soul Fire credit on qualified death | `1454d68b0..1454d69ee` |

Ghidra warns about a bad instruction at the Soul Fire helper's out-of-slice tail. The original PE instructions explicitly restore registers and tail-jump to `1454d5bd0`; that tail is bound to the separately recovered shared Soul Fire publisher, rather than treated as a decompiler halt.

Reproduce the retained ten instruction ranges, twenty-two float constants, source-kind death jump table and focused helper curation with:

```sh
python3 scripts/recover-player-hit-passives.py
```

To reproduce the three focused Ghidra analyses when their disposable runtime dossiers are absent, first run the script with `--prepare`, then each corresponding `runtime/analysis/history/native-recovery/player-hit-passives/6ed5277e33ec/plan-<VA>.json` through `scripts/rea-batch.py`, and rerun the curation script. Every slice is equality/hash-bound to the selected PE. The script only reads the EXE and performs static disassembly/data extraction; it does not execute target code.

## Entry, gates and order

The original hit call takes Game in RCX, victim GUID in RDX, supplied power in XMM2 and spell ID in R9D. Caller stack offsets `+20/+28/+30` carry school, critical flag and final native bool respectively. In the owner frame these are `RBP+290/+298/+2a0`. New recursive passive hits pass the final bool as false.

At `1454c4d6f..4d96`, the class-special tail first checks that some learned definition has kind11. Without one it returns to the common source-context/talent tail at `1454c5fc8`. It then captures source kind `Game+111` and the normal-source gate: `Game+104 == 0`, `Game+40 == 0` (full64-bit tag), and `!Game+7ec`. These fields remain explicitly native-named; their wider enum meanings have not been substituted with conventional WoW assumptions.

The actual death qualification comes from PE table `1469acd94`, and only applies when original remaining health is ordered `<=0`:

| Source kind | Qualifies for the first death-proc arm |
| --- | --- |
| 0 | The normal-source gate above |
| 1 | `!Game+30` |
| 2 | Always |
| 3 (passive) | Never |

The implemented call order is:

1. Tracked Polymorph break/removal and any resulting burst.
2. For source0 with the captured normal gate: Bloodrage gain/publication, Seal Fate gain/publication, Faerie Fire charged hit/repeat, then eligible surviving nonzero-spell Polymorph application.
3. A qualified death credits Soul Fire then attempts Redemption with native chain word1. An otherwise unqualified source3 death with current `Game+7e4 == 1` attempts Redemption with chain word2.
4. On death, clear/consume the marked victim's Hunter's Mark state and possibly burst; then remove a dead Faerie Fire mark and attempt one replacement.
5. Return to the separate common source-context/talent tail.

The Polymorph-membership result is retained even after removal, matching the original local flag. Therefore a hit which breaks Polymorph cannot immediately enter its surviving-hit producer. The remaining-health snapshot is not recomputed from an actor after recursive proc damage. The source also preserves the original floating comparisons where unordered remaining health follows the surviving branch.

## Concrete class behavior

| Class special | Recovered source behavior |
| --- | --- |
| Bloodrage | Spend `max(min(bank,2),0)`, subtract from `Game+7c8`, add to pool `+7c4` capped100, write `+7cc=now`, then synchronously run the shared publisher. Publication/time stamping happen even with zero gain. |
| Seal Fate | Spend `max(min(floor(bank),critical?2:1),0)`, preserve fractional bank `+7d4`, add the saturating float-to-u32 result to points `+7d0` with wrapping addition, then cap5 and run its shared publisher. |
| Faerie Fire hit | First matching16-byte mark row must not have an ordered charge below1; decrement it by1 before learned/victim lookups. Query live targets around the victim, exclude its GUID, retain the first two distance-ordered results. |
| Polymorph break | Tracked victim, source kind below2, normal gate: remove all matching GUIDs stably, clear actor+320 and set+300=now. A still-live actor restores optional actor+144 metadata's word+36 / actor float+264 and removes aura118. Then a learned Polymorph bursts around the sampled victim position. Other tracked-target contexts remove it only on death. |
| Hunter's Mark death | For nonzero victim GUID matching `Game+7b0`, clear it and set `+7e8=now+1` **before** learned/readiness checks. If ready, begin the passive, query around the dead position excluding its GUID, emit visual1449, and apply independent-crit hits using definition spell1130/school6. No talent13 second pass is added here. |
| Faerie Fire death | Remove every matching mark with stable survivor order. Capacity is1 for base-targets0, otherwise `max(min(wrapping(base+ordinary+talent+global),3),1)`. If below capacity, query the recovered special candidates around the dead position with radius12, and mark only the first result. New marks have4 charges; emit spell770 from player to target, then aura770 present. |

Faerie Fire's primary per-target power is:

```text
factor = min(sqrt(ordinaryPower * talentPower) * 0.8, 1.2)
damage = min_preserving_original_nan(factor * suppliedHitPower, effectiveAbilityPower)
```

The supplied hit power is the original XMM2 value retained in XMM6, before this victim's damage-taken multiplier. The visual is Moonfire8921 but actual hit attribution remains the Faerie Fire definition's spell770 and school3. Both primary hits are uncritical. Afterwards the source sums current talent-effect variant13 records matching this ability key, in native order starting at negative zero. An ordered positive sum causes a second uncritical hit on each **same** first-two GUID which is still live, with `damage * sum`. It does not perform a new radius query or crit roll.

Polymorph's burst emits Arcane Explosion1449 and caps raw power at `min_preserving_original_nan(victimMaximumHealth * 0.15, effectiveAbilityPower)`. It calls the concrete shared `totem_passives::multi_hit`, which owns per-target crits, recursive source context and its separate talent13 survivor pass. Actual damage attribution uses definition spell118, not visual1449. Current power and area math reuse the current-target `damage` and `periodic` helpers. The radius helper `1454f96d0` is additionally retained in this evidence set.

### Polymorph producer

`1454d4dc0` is implemented as `try_apply_polymorph`, not an unnamed proc hook. It requires the first learned Polymorph instance, at most two already-tracked GUIDs, its first matching passive deadline ready, a present/live actor with both native actor+24 and actor+64 optional lanes absent, and `now >= actor+320`. Only then does it draw once and accept values below0.12. The native `next_u32 >> 8` sampler is the same high24 bits used by `unit24`; its original instructions are retained.

On success it calls the shared `begin_passive`, then writes actor+320=`now+10`, casting+112=0 and next-movement+300=`now+0.4`. It samples the interpolated position, corrects Z through the actual native terrain-height port when available, stops movement at that position, increments the real Game+908 movement serial and emits the stopped-movement packet. It appends the GUID, changes appearance to literal model856/scale1, emits the learned spell118 visual from the player and publishes aura118 present. The append/model/visual/aura tail still runs if the actor disappears after begin-passive; the source preserves that original branch structure.

### Soul Fire death credit and Redemption queue

`1454d68b0` is `gain_soul_fire`: for first learned Soul Fire, reject points above4 or credit deadline `Game+7dc > now`, increment points `+7d8`, and set the deadline to `now + passive_interval/5`. Then call the shared `1454d5bd0` resource publisher. This is separate from the queued Soul Fire hit consumer in `passive_tick`.

`1454d5230` is `queue_redemption`: first learned Redemption and at most three existing queued rows, then consume one high24-bit random draw. The probability is computed in original float order:

```text
denominator = max(baseCooldown * 1.4 * ordinaryCooldown * talentCooldown * globalCooldown, 0.25)
chance = min(((0.1 * baseCooldown) * 1.4) / denominator, 0.2) * effectMultiplier
```

This formula does not use the general passive per-key minimum or effect-multiplier floor. Reject when `roll >= chance`; the native unordered comparison is preserved. On success choose `start=max(now,Game+7e0)`, restoring the original `now` if that instruction result is NaN. Store `Game+7e0=start+0.5`, and append the32-byte row `{victimGuid,start,deadPosition,nativeChainWord}`. The row resolves at `start`, not at the following slot. The existing concrete tick consumer owns its later burst/removal.

## Shared source and integration boundary

`after_damage(hit, rng, port)` is the single orchestration entry, placed after the original common damage/death arm and before `1454c5fc8`. The caller supplies the same canonical run RNG to every recursive hit and publisher. `HitPassivePort` extends `totem_passives::PassivePort`; the module directly calls `begin_passive`, `multi_hit` and `resolve_passive_hit`, and directly uses `passive_tick::{faerie_candidates,add_faerie,remove_faerie,remove_polymorph}`. State is the same `PassiveTickState` consumed by GameTick, including Soul Fire/Redemption queue deadlines and the Faerie/Polymorph collections.

The three publisher adapter methods are explicitly bridges to concrete `passive_tick::publish_bloodrage`, `publish_seal_fate` and `publish_soul_fire`, with the same state/world/RNG. Their native bursts, resource resets and bar publication already have source owners; they must not be replaced by a UI-only counter update or a no-op. Remaining required world ports expose actual actors and supplemental native fields, appearance/aura/movement packets, actual terrain height, learned/state storage, and the canonical recursive damage/death handler. Recursive hit attribution is saved/restored by the shared helper: source-kind3, clear only the first64-bit enum tag of each16-byte Game+32/+64 block, retain payload words, and restore the captured words after each hit.

The parent owns module registration and the broader run adapter. No native run constructor defaults, generic hit/death prefix, meter/loot order, final `1454c5fc8` talent tail, or playable gameplay loop is claimed by this component. The explicit native hit-context fields still need their wider producers typed in the final adapter. The source and all shared API connections remain compiler-unvalidated at this source-recovery checkpoint.
