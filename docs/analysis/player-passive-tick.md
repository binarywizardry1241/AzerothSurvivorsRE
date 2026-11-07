# Player class-special GameTick consumers

Date: 2026-10-18. Status: **recovered and implemented source; no compilation or runtime/parity validation**.

The selected `AzerothSurvivors/AzerothSurvivors-0.97.2.exe` is authoritative. SHA-256:
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This report adds GameTick consumers to the current ability reconstruction. It does not claim that the menu application now runs gameplay.

## Source and evidence

- Source: [passive_tick.rs](../../crates/azeroth-survivors-re/src/player_abilities/behavior/passive_tick.rs).
- Reproduction: [recover-player-passive-tick.py](../../scripts/recover-player-passive-tick.py).
- Curated native ranges, constants, profile bytes, hashes and REA IDs: [native.json](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.97.2/player-passive-tick/native.json).
- Complete reused GameTick Ghidra owner: `14549d550..1454aaf72`, SHA-256 `14cd87f3990a2c0981051abf8e499d2c229717681964b36a757978a1664455e7`, REA `ev_c5c9cc29e1e6e39c77e71ac55fc8abbce607fd9cb931b6b010eee7b8f4720299`; retained by [behavior-native.json](evidence/player-abilities/behavior-native.json).
- Related consumers: [hit/death passives](player-hit-passives.md), [totem passives/shared cooldown helper](player-totem-passives.md), [shared ability behavior](player-ability-behavior.md).

The extractor checks the complete selected EXE hash, the reused GameTick byte hash and provider, and each imported focused helper dossier's subject SHA-256 and Ghidra provider before retaining pseudocode. Each original code slice has its own digest. No target execution is involved. Raw slices, REA sessions and generated plans stay under ignored `runtime/analysis/history/native-recovery/player-passive-tick/d94a2c1f9116/`; the curated textual evidence is tracked.

There are **25 retained assembly ranges**: five GameTick spans and twenty helpers. Nine helpers have new focused REA/Ghidra analyses: `1454d69f0`, `1454d7020`, `1454d5bd0`, `1454d5740`, `1454d5950`, `1454d7810`, `145512d50`, `14552b8f0`, `1454d2850`. Their exact evidence IDs are in `native.json`. The other eleven helpers were read as exact assembly without a new focused Ghidra invocation: `145531920`, `145544ec0`, `1455464c0`, `145532400`, `145532030`, `145523780`, `145524320`, `145524410`, `1454d42f0`, `145544f90`, `14541b9d0`. The manifest records that distinction. The two small leaf routines without PE unwind entries have explicit final-RET boundaries followed by INT3 padding.

Ghidra's raw-slice ABI inference omits or misassigns some register arguments. The source binds those arguments from the original Windows x64 instructions and call sites; pseudocode alone is not treated as an exact function signature.

## Shared state and caller contract

`PassiveTickState` is the single semantic storage consumed by tick, hit/death and totem paths. It is not a native memory overlay.

| Native Game field | Source state | Record layout |
|---|---|---|
| `+720/+728/+730` | `deadlines: ProcDeadlines` | vector capacity/data/count, 24-byte key pointer/key length/deadline at `+16` |
| `+738/+740/+748` | `soul_fire_hits` | 24-byte target GUID `+0`, deadline `+8`, crit-adjusted power `+12`, critical byte `+16` |
| `+750/+758/+760` | `redemptions` | 32-byte source GUID `+0`, deadline `+8`, sampled XYZ `+12..20`, chain/reason word `+24` |
| `+768/+770/+778` | `faerie_marks` | 16-byte GUID `+0`, charges `+8` |
| `+780/+788/+790` | `lightwells` | 32-byte object GUID `+0`, XYZ `+8..16`, expiry `+20`, next pulse `+24`, original duration `+28` |
| `+798/+7a0/+7a8` | `polymorph_guids` | ordered GUID vector |
| `+7b0` | `hunters_mark.guid` | zero means absent |
| `+7b8/+7bc/+7c0` | `resource_bar` | optional cached field/value |
| `+7c4/+7c8/+7cc` | `bloodrage.pool/bank/last_gain_at` | three floats |
| `+7d0/+7d4` | `seal_fate.points/bank` | u32, float |
| `+7d8/+7dc` | `soul_fire_points/soul_fire_gain_at` | u32, float |
| `+7e0` | `redemption_queue_at` | next queue slot time |
| `+7e8` | `hunters_mark.reacquire_at` | reacquisition deadline |

`ProcDeadlines::get` returns the first matching key; absence returns `f32::from_bits(0xff7fffff)`, **negative `f32::MAX`**, at native `1459eb2d0`. `set` changes the first matching row and appends only if absent. Duplicate rows are preserved. Free `last_proc`/`update_proc` expose the same policy for slice/vector callers. The shared `totem_passives::begin_passive` sets this table and the first learned row's remaining interval before returning both packet intents. Tick calls that concrete source helper directly through a disjoint learned/state storage getter.

The entry point is `passive_tick::tick(rng, port)`. The actual run implements `TickPort`: current learned/storage/stat/actor snapshots, actual terrain sources, current effect-six gear data, original math calls, packet publication and synchronous canonical hit/death handling. There is no substitute world or generated enemy list. `hit_in_passive_context` must set source-kind 3, clear only the low 64-bit enum tags at Game `+20/+40`, and restore all captured words after **each** hit, with the final native hit flag false. The same `NativeRng` is passed into recursive hit/proc work before the next crit draw.

`SpecialTarget` preserves the otherwise absent actor `+64` optional discriminant, raw byte `+96` and raw flag byte `+344`. Their broader meaning remains unnamed. These values must come from the actual actor storage; they cannot be reconstructed from conventional WoW categories. The existing general `Target` supplies boss metadata at `+24`, current HP/max HP and movement.

The `Default` implementations create empty Rust storage. **The native run constructor's initial fractional bank/counter/deadline values were not recovered in this bounded tick task**. A run adapter must install the native initial state; these defaults are not an evidenced initialization policy.

## Recovered execution order

`1454a0987..09b8` scans learned records (stride 88) and skips the entire block unless at least one definition has kind 11. With that gate passed, order is Bloodrage, Seal Fate, Soul Fire publication/queue, Redemption queue, Hunter's Mark, Faerie Fire, Lightwell, Polymorph cleanup and resource-bar publication. Source preserves this order and re-reads learned/state where synchronous hit/death work can affect later arms.

### Bloodrage and Seal Fate

`1454a0a2e..0b1f` regenerates Bloodrage's fractional bank at `100 / passive_interval` per second, capped to `max(rate * .5, 2)`. The pool loses 15 points per second, floored to zero, only when `now - last_gain_at > 3`. `1454a0b5d..0c11` regenerates Seal Fate's bank similarly at `5 / passive_interval`, with the same cap policy. The interval is the shared source `max(per_key_minimum, base_interval) / max(effect_multiplier, .1)`; the current minima are 8 and 2 respectively, as recovered by the shared cooldown owner.

`publish_bloodrage` implements `1454d69f0`: require pool at least 100, first-key deadline ready and first learned Bloodrage. Query live actors by the canonical scaled radius and distance order. An empty query retains the pool/deadline. Otherwise clear the pool, begin the passive, emit visual **5246**, then direct-hit each victim with the definition's spell ID **2687**, effective power and an independent crit draw. The 70/10 logarithmic radius softcap reuses the recovered common radius source.

`publish_seal_fate` implements `1454d7020`: require at least five points and readiness, query live actors within definition range, apply the current execute-target comparator and cap the wrapped target sum to 1..3. Empty queries retain points. Otherwise clear points, begin the passive and emit visual **2098** toward the first selected victim with the complete selected hit list. Hits use definition spell **14186**. Power is doubled strictly below 30% current HP/max HP; HP is looked up again before every hit, so earlier recursive effects can affect later victims. This is not a literal instant-kill operation.

Hit-side bank spending, point generation and immediate calls back into these publishers are owned by `hit_passives.rs`; storage is shared.

### Soul Fire and Redemption

`publish_soul_fire` implements `1454d5bd0`: require five points, readiness and the first learned instance. Repeatedly choose a unique special target up to the current 1..3 cap, preserving sampled positions. Native `1454d5740` chooses the greatest `(boss_metadata_present * 2) | raw_flag_344`, then greatest HP under total float order, with the last exact tie winning. The first eligible candidate requires optional `+64` absent or byte `+96 == 1`; later candidates accept nonzero byte `+96`. All candidates must have expired actor `+320` avoid/fear windows.

A successful nonempty selection clears points, begins the passive, emits per-victim spell 6353, rolls crit at launch and appends the native delayed record. Travel is XY distance divided by the current spell-ID speed (24 for 6353). `1454a0c4e..0e29` detaches due rows before resolving direct hits with literal spell 6353/school 2. Future rows retain order. The queue is consumed only while Soul Fire remains learned. Hit/death credit and its separate `+7dc` deadline are in the hit report.

`resolve_redemption` implements `1454a0e4e..13ac`: find and remove the first due row repeatedly, re-find the learned definition, and discard due rows if the ability is absent. Future rows remain queued. Query the sampled death position with the canonical scaled radius, excluding the source GUID. Emit visual 15237 from that GUID only if the source actor still exists; apply crit-adjusted definition damage in passive context. The stored chain/reason word temporarily replaces Game `+7e4` around the entire hit list, then the previous value is restored. Recursive deaths can append rows which a subsequent loop pass visits. The probability, cap-four queue producer and half-second slot spacing are in `hit_passives.rs`.

### Hunter's Mark and Faerie Fire

Hunter's Mark upkeep `1454a13d1..16d6` plus `1454a215a..2239` derives the actor damage-taken addition as `min(sqrt(ordinary_power * talent_power) * .2, .4)`. An old mark survives while live, eligible, not avoided and within **1.5 times** definition range. A valid old mark is replaced only when the best current candidate has strictly greater native priority; equal priority refreshes the old mark. Refresh writes actor `+316` and emits its aura. Invalid/replaced marks clear `+316`, remove the aura and clear the stored GUID. Only reacquisition consults `+7e8`; the hit/death path clears a killed marked GUID and sets that delay. This branch does not invent a per-frame cooldown write.

Faerie upkeep `1454a16f4..1f08` refills each mark at four charges per second, capped at four, before target maintenance. The original 16-byte rows and first matching charge consumption are shared with hit handling. Invalid marks fail native `1454d42f0`: missing/dead, avoid window active, optional `+64` present with byte `+96 == 0`, or beyond 1.5 times range. All matching GUID rows are removed stably and aura 770 is removed.

`faerie_candidates` implements `1454d5950/145544f90`: current ordered-target query, exclude all already marked GUIDs, reject avoid windows and require optional `+64` absent or byte `+96 == 1`. Fill the current cap 1..3 using the first candidate. At capacity, replace the **first lowest-priority** mark only when the first candidate has strictly higher priority, re-querying after each replacement. A reduced cap does not delete otherwise valid rows. `add_faerie` is the direct append of `{ guid, charges: 4 }`; the native apply helper additionally casts spell 770 from the player to the victim and adds aura 770. Tick refreshes all surviving auras after maintenance.

`remove_faerie` and `remove_polymorph` match `145524320/145524410`: remove every matching GUID and retain survivor order. They do not swap-remove.

### Lightwell and Polymorph cleanup

Lightwell `1454a1f18..3265` first collects expired wells, or all wells if the ability is no longer learned, removes every row with a collected GUID and emits object removal for nonzero GUIDs. No ability means cleanup only. A surviving due row advances its old pulse deadline by **one second**, at most once per frame, then queries current ordered targets around its stored position using definition range. Native special eligibility is applied before taking the 1..3 target cap. Each primary visual is spell **25912** from the well object; damage/crit uses the learned Lightwell definition, spell **724**.

After each primary hit, the first matching equipped effect-six record can bounce to the nearest live neighbors of the captured victim position, excluding that victim. The native iterator receives **100 as squared radius**, hence ten-yard distance, then sorts by distance and takes the effect's count (zero means no bounces). Bounces emit visual 25912 from the primary victim and multiply the primary raw power by the effect's factor before an independent crit. The gear data getter preserves the actual tag 6 / word `+16 == 0` / byte `+24 == 1` / matching-key filters; it supplies data, not a substitute class-behavior callback.

After existing pulses, a ready Lightwell spawns only if any live actor is within 25 yards of the player. Height uses the actual primary terrain, secondary terrain, then the run's native fallback height. Begin the passive, emit spell 724 at the sampled ground position, remove the oldest well if the list already contains three, and create the new object. Its expiry is `now + scaled_duration`; next pulse is `now + .5`; the original scaled duration is retained for the resource bar.

`lightwell_object` reconstructs `1454d2850` from the exact native profile at `1469ac2f0`: entry 9012, display 6671, scale 1; caller kind 5 and flags 16. It increments the shared object counter, samples yaw with the same 23-bit native RNG path over `[0, TAU)`, and creates `0xf110000000000000 | ((entry & 0xffffff) << 24) | (counter & 0xffffff)`. It supplies the original object type 5 and update fields 0, 1, 2=33, 3=entry, 4=scale, 8=display, 9=flags, 12=`sinf(yaw/2)`, 13=`cosf(yaw/2)`, 14=1, 15..17=XYZ, 18=yaw, 20=35 and 21=kind. The actual create-object packet is the required world/packet port. The current IAT proves the `sinf`/`cosf` thunks at `145756e2b/145756e31`; their bytes and import binding are retained in the manifest.

Polymorph cleanup `1454a3265..3491/145532400` removes tracked GUIDs when missing, dead or the actor `+320` window has expired. It clears actor `+320`, writes actor `+300 = now`, then restores the optional native `+144` appearance and removes aura 118 only for live actors. The hit-side burst and producer are owned by the hit report. Native unordered deadline comparisons are retained; NaN windows do not become an invented expiry rule.

### Resource bar

`1454a3491..3884`, including the earlier lead `1454a3568`, publishes **resource fields**, not delayed Seal Fate/Soul Fire/Lightwell effects. Priority is first available Bloodrage (field 24, pool times 10), Seal Fate (field 26, points times 20), Soul Fire (field 23, points times 20), Lightwell (field 23, normalized remaining duration/cooldown times 100). Current integer multiplication wraps. Lightwell uses the last well's remaining fraction, or the shared current passive cooldown when there is no well; native `14541b9d0` returns that interval for Lightwell. Fractions clamp in native operand order, then saturating float-to-u32 conversion. The cached field/value changes before packet publication, and an identical value emits nothing. With no matching resource ability the cache is retained.

## Validation and remaining integration

Completed: SHA-bound extraction, nine focused Ghidra helper analyses through `./scripts/rea`, original instruction/data review, explicit import binding, source-level API/lifetime/borrow review against the current canonical modules, shared-state coordination with hit/totem owners. Corrected during static review: the Bloodrage decay scalar is -15, bounce count zero selects no targets, squared radius 100 is ten yards, and Polymorph unordered-expiry handling follows the native branch.

Intentionally **not run**: builds, compiler checks, compile-based tests, behavioral harnesses, emulation, original/rebuilt launches, screenshots or runtime comparisons. The source has not been compiler validated. No functional or visual parity is claimed.

Remaining: bind this source and the shared hit/totem consumers into the actual run scheduler, actor/stat/gear storage, packet publication and complete canonical hit/death owner. Recover the native run-constructor initial banks/counters as noted above. The opaque actor `+64/+96` data must be supplied losslessly. Windows CRT math and float ordering need eventual controlled comparison once execution is authorized; no platform bit-parity claim is made from Rust source alone. Native vector padding and invalid enum/sentinel representations are not recreated as unsafe memory states in the semantic Rust records. Full surrounding gameplay, meters/death/loot adapter behavior and runtime verification remain outside this bounded completion.
