# Primary boss death, damage meter and completion

Reviewed 2026-10-18. Target SHA-256: `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`, project-local supplied `0.97.2` EXE. [death-native.json](evidence/bosses/death-native.json) retains 15 focused native instruction scopes, eight relevant literal strings and three hash-matching REA records. Implementation is `crates/azeroth-survivors-re/src/bosses/death.rs`.

The shared damage/death owner `1454c2eb0` was already decompiled for this exact target: REA `ev_ba95562638ee7eaae2ea1dc88d80c5df86859a014473f69b678b229aacd357bd`. Its original bytes are checked again against the selected PE before reusing the record. The primary arm is `1454c41d3..1454c4af9`; unrelated generic damage, on-kill procs, aura/packet removal and guardian/ordinary branches are not replaced by the boss component. The caller must invoke this arm once after the shared owner marks the actor dead and stops its movement.

## Recovered primary death order

1. Scan the remaining actors for an alive primary boss (alive byte+68 zero and boss cooldown-vector tag+18 different from `-1`). When none remain, change the boss-meter marker Game+654 to `1` and stop time+658 to the current run clock only when the previous marker's bit0 is zero and the marker is not `2`.
2. Increment Game+668, the primary boss kill counter, with u32 wrapping.
3. Emit the boss's localized `Impossible...` announcement through its GUID, then queue an account event with `type: "bossdown"` and localized `name`.
4. Request kind0 experience pickup of `60 + 20*kills_after_increment` at death XYZ. Request kind1 gold of `40 + 20*kills_after_increment` at XY+(2,-0), preserving Z. First boss requests 80 XP and 60 gold. Arithmetic wraps as u32. The shared generic pickup creator owns further clamping, entity creation and credit on acquisition.
5. If the first shared magnet deadline is present and due, remove that first deadline and request a kind6 magnet at XY+(-2,1.5), preserving Z. The boss branch has **no random chance draw** here. Guardian magnet processing uses a different chance-gated path. Native unordered deadline comparison also takes this removal arm; source preserves it.
6. Admit permanent equipment only when Game+958 is zero and the actual boss definition pointer is one of the active zone's five canonical rows. Reuse `mob_loot::roll_boss_equipment` for the independently recovered class/tier/candidate/chance/RNG behavior and queue returned item IDs. Cloned or custom definitions do not acquire invented canonical equipment admission. No duplicate equipment table or random generator is introduced.
7. Call shared experience attraction `1454d2380` for all currently idle XP pickups, including newly created XP.
8. If this definition's final byte+54 is exactly `1` and the **low byte** of Game+858 is zero, write phase `1` and phase-start time Game+85c from the captured death clock. This write occurs even when endless mode is disabled; the later active-tick completion gate handles that case.

`DeathPort` exposes the actual announcement/account/pickup/equipment/XP-attraction consumers required by the engine. `BossDeathState` and `CompletionState` are explicit views of owning Game state. No substitute menu world, inventory UI or persistence route is introduced.

## Experience attraction

REA `ev_d74d3b1a18bff212539dba2083d62c29147b4ac6a1b9d0e0ff1c5b016bac17e5` decompiles selected-target `1454d2380..1454d265e`. It scans native pickup rows (stride `0x48`), admits kind+20 equal to 0 and state+18 equal to 0, writes state1 and arrival time `clock + max(XY_distance/40,0.15)`, and emits movement toward the current player. The source `attract_idle_experience` reconstructs this filtering, travel arithmetic, state and movement requests. Shared packet sequences, world movement and XP credit on arrival remain with the pickup owner. This helper is an XP vacuum, rather than a boss spell-choice generator.

## Boss damage meter

Game+650/+654/+658 belong to the `bossMeter` JSON consumer `1454988e5..145498c29`, rather than a choice or pause timer. It serializes `dealt`, `secs`, `live` and `lines`. Marker2 emits an empty object. Other values use `secs = ((marker & 1) != 0 ? stopped_at : now) - started_at`; the serialized live boolean specifically checks `marker != 1`. Source helper `boss_meter_timing` preserves these tests without an invented elapsed clamp.

The admitted primary-boss damage arm `1454c35ee..1454c3668` starts a new meter segment when marker is nonzero: set start+650 to now, marker+654 to zero and clear the existing meter-line vector Game+600/+608 before adding the new damage line. Marker0 continues the current segment. `begin_boss_meter` implements that state/vector transition. The last-primary-boss death stops the segment as described above. It does not open a UI choice or end the run by itself. Damage-line attribution/aggregation and final JSON formatting remain shared damage-meter owners.

## Deferred normal completion

The selected-target active tick's `1454aa103..1454aa235` gate admits completion only when phase Game+858 is nonzero, run-state byte+95f is `1` and endless byte+952 is zero. REA `ev_c5c9cc29e1e6e39c77e71ac55fc8abbce607fd9cb931b6b010eee7b8f4720299` contains this exact target's shared tick. The gate performs these operations in order:

1. Set run state to `5`, blocking repeated admission.
2. Call `145492fd0` to freeze live actor movement and other owned entity movement rows, resolve interpolated terrain Z and queue shared stop-movement packets.
3. Queue the packet constructed by `14543fb70`: raw opcode `0xe8`, player GUID Game+3d0 and the **preincrement** victory counter Game+4b4. No unverified conventional WoW opcode name is assigned.
4. Increment Game+4b4 with wrapping.
5. Construct and queue the comprehensive current-statistics account event through `1454b6620`, with `type: "victory"`, using the postincrement snapshot.

`finish_normal_run_with_port` preserves this order through concrete `CompletionPort` callbacks. Its state-only convenience wrapper calls the same implementation with an inert port. The retained completion branch does **not** directly call a save routine. Later account/statistics consumption owns any persistence; this report does not claim that work was reconstructed here. Endless mode retains active run state while phase1 supplies scaling and endless scheduling.

## Validation and remaining boundaries

`python3 scripts/recover-boss-death-fixtures.py` completed bounded execution of unchanged native instruction scopes, producing **300 primary death cases** (all 60 bosses at five combinations), **32 deferred completion gates**, **seven pickup-attraction cases**, and **six meter-state cases**. Coverage includes active-boss survivor checks, all canonical definition indices, equipment suppression/admission, due/future magnet heads, reward/count wrapping, low-byte phase behavior, endless/run-state completion gates, marker discriminants and the 0.15-second XP travel floor.

The oracle stubs localization/message/JSON creation, pickup creation, equipment candidate generation (empty candidates; admission/index captured), allocation, vector removal and completion side effects. Existing `mob_loot` evidence owns full equipment candidate/RNG comparisons. These fixtures verify the selected native control flow, scalar arithmetic and stores in their declared scopes; they do not execute the reconstructed Rust or launch a game application.

`tests/boss_death.rs` is authored against these fixtures. **Compilation, compiler checks and Rust tests were intentionally not run** at this source-recovery checkpoint. Neither game executable nor rebuilt application was launched. Shared engine/entity/pickup/movement/account implementations must be connected before live behavior or parity can be verified.

Regenerate curated evidence with `python3 scripts/recover-boss-death-evidence.py`. It verifies the original target digest and PE byte extents before retaining the matching REA records and focused assembly. All analysis runtime and target binaries remain local and excluded from source delivery.
