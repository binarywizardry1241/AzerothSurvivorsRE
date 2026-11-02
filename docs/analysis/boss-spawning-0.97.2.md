# Primary boss scheduling and placement — selected 0.97.2

Date: 2026-10-18. Target: supplied Windows x64 EXE, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`. This is static source reconstruction with native instruction fixtures. No game, compiler, build or Rust test ran.

[spawning.rs](../../crates/azeroth-survivors-re/src/bosses/spawning.rs) implements the native five-entry primary schedule, endless selection and special startup branch. [placement.rs](../../crates/azeroth-survivors-re/src/bosses/placement.rs) implements fixed-point admission/selection and the recovered fallback. [All zones, bosses, times and abilities](boss-catalog-0.97.2.md). Creation/scaling, death and combat effects have their own source owners under `src/bosses`; these modules require the actual owning Game state, actor storage, terrain, RNG and packets.

## Schedule and gates

The main tick `0x1454a92bd..0x1454a93d6` reads the next boss index from Game `+0x8b0`. While it is below five, the selected zone's row `+0x40` is compared to elapsed run minutes. Equality admits the boss; an unordered comparison refuses it. When due, the index advances **before** creator `0x1454bf100` is called. There is no retry rollback, previous-boss death check or living-boss population gate in this schedule. At most one scheduled boss is processed per admitted active tick, so a large time jump catches up across successive ticks rather than spawning every missed boss in one call.

The schedule is inside the active run tick and the shared Game `+0x95b == 0` spawn gate at `0x1454a701a`. Pausing or leaving the active run must suppress invocation through the real caller; `Scheduler::tick` also exposes the explicit shared suppression input. The component does not advance a second clock or seed a separate RNG.

Fresh Game defaults are next primary index **0** and endless boss deadline **0.0**. Constructor stores are at `0x14549c565` and `0x14549c5d0`; the aggregate is built at stack `RBP+0x28`, so the relevant stack fields `+0x8d8` and `+0x95c` map to Game `+0x8b0` and `+0x934`. The latter constant vector begins at `0x1469aa320` with float zero. Treating equal stack/Game offsets as the same field would recover the wrong default.

After all five primary entries have been processed, nonzero endless flag Game `+0x952` enables another branch. When the run clock reaches the deadline at `+0x934`, the branch selects one of all **five** zone boss definitions, including the flagged final entry, using the shared xoshiro state and the native five-way multiply/reject draw. It then creates that boss and sets the deadline to **current clock + 300 seconds**. The initial zero deadline means the first endless replacement can occur on the next admitted tick after the fifth scheduled boss; subsequent replacements use this five-minute cadence. The schedule index stays at five or its existing greater value.

The native index draw accepts the high word of `next_u64() * 5` only when low-product bits 63..61 are at most four. Source `endless_index` preserves this exact rejection and RNG consumption instead of substituting modulo-five selection.

## Special startup branch

The run initializer `0x1454b07c0` contains a separate branch guarded by raw Game `+0x958 != 0`. It creates all five boss records in table order at `0x1454b0b18..0x1454b0b54`. Its fresh default is zero. The same flag separately suppresses guardian lair respawn; it must not be inferred to be a generic boss suppression flag. The startup calls do not increment the primary schedule cursor, so `startup_bosses` deliberately leaves the scheduler unchanged. Normal startup does not create these five bosses immediately.

## Placement

Only two zone records provide fixed boss spawn points: **Scarlet Monastery, index 7, has four**; **Naxxramas, index 11, has six**. The other ten slices are empty. Exact point float bits and source spans are in [catalog.json](evidence/0.97.2/bosses/catalog.json); generated source points share [catalog.rs](../../crates/azeroth-survivors-re/src/bosses/catalog.rs) with canonical boss reexports.

Point-filter helper `0x145529b50` retains points whose native `hypotf(point-player)` distance is **at least 20**. Equality qualifies and unordered distance refuses. A nonempty candidate list is selected uniformly using the shared native multiply/reject draw, including an RNG draw when only one candidate remains. The selected point's Z uses the recovered primary-height, secondary-height, then fallback-height chain.

If no point passes in Scarlet Monastery or Naxxramas, creator `0x1454bf491..0x1454bf536` chooses the **farthest** original point under native float total ordering. Equal distances choose the later point. This behavior was checked directly against the native compare/update instructions: current distance 10 and candidate 15 updates; current 15 and candidate 10 keeps the old point. The branch does not choose the nearest point.

For the other zones, the empty candidate list calls shared native placement `0x1454c17b0` with **24..28 distance** and **forward chance 0**. Its actual terrain/path/zone checks, 16 angle attempts, inward distance retries and fallback remain the recovered common algorithm. To reuse that owner, [ordinary spawning source](../../crates/azeroth-survivors-re/src/enemies/spawning.rs) now accepts caller-supplied geometry/distances internally; the established ordinary `sample_position` wrapper retains its original 26..36 arguments and behavior. This avoids fabricating terrain or copying the placement algorithm into a second module.

## Evidence and checks

- [spawning-manifest.json](evidence/0.97.2/bosses/spawning-manifest.json) retains ten original instruction scopes, constants, exact default-field mapping and matching reused REA provenance for the main tick, run initializer and Game constructor.
- Reused SHA-checked REA dossiers: main tick `ev_c5c9cc29e1e6e39c77e71ac55fc8abbce607fd9cb931b6b010eee7b8f4720299`; run initializer `ev_e6f30ed60ac4cc6f9c3c6dea58abc8cc11d4f27c396aaed4d6801d2aba98d9df`; constructor `ev_6ba2251b09c79873deb3f9348a6c19acb85427880b59bbb77c74fc878b07d86d`.
- New focused REA/Ghidra point-filter Evidence: [`ev_90c1541efd3a719e744b67b824ab03a4752ffed1d84692ffaf1394c701ac14bb`](evidence/0.97.2/bosses/spawning-point-filter-native.json). The unchanged PE function slice is mapped at its original VA; its completed session exported and closed. Raw-import inferred signatures are not original source types, and Win64 instructions govern.
- Passed **252 bounded unchanged-instruction cases**: 228 schedule cases across all 12 zones, six point-distance gates, six farthest/total-order comparisons and 12 point-selection/RNG cases. Native creation is explicitly stubbed without consuming RNG; actual creator behavior is a separate owner. Fixtures are retained in [boss-spawning-native.json](../../crates/azeroth-survivors-re/tests/fixtures/boss-spawning-native.json). Independent mathematical RNG reconstruction agrees with all native point/endless outputs and resulting shared state.
- Authored [boss_spawning.rs regression checks](../../crates/azeroth-survivors-re/tests/boss_spawning.rs) compare source schedule, point choices and RNG against those native outputs and cover suppression/startup behavior. **Compilation and Rust tests were not run**, at this source-recovery checkpoint.

Real Game tick orchestration, terrain/path providers, packets and runtime/rendered parity remain unverified. The source APIs and native instruction fixtures do not establish a playable world. Boss death/ending transitions and combat behavior are documented by [the complete boss report](bosses-0.97.2.md), rather than inferred from schedule data.

Reproduce static evidence inside this checkout:

```sh
python3 scripts/recover-boss-point-data.py --check
python3 scripts/recover-boss-spawning.py
python3 scripts/recover-boss-spawning.py --prepare-native
python3 scripts/rea-batch.py runtime/boss-spawning-0.97.2/plan-145529b50.json
python3 scripts/recover-boss-spawning.py --collect-native
```

Use a fresh output directory when rerunning REA; the runner refuses to overwrite an existing session. The reference EXE is needed only for authorized recovery, never for the normal source build.
