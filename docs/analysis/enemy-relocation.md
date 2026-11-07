# Distant enemy relocation

Date: 2026-10-18. Target: supplied Windows x64 EXE, SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`. This is static source reconstruction. The original game, rebuilt application, compiler and Rust tests were not run.

The active main tick recycles up to four distant existing enemies before its ordinary spawn-budget stage. It preserves their GUID and combat statistics, places them near the player, resets movement and active casting, and queues a movement/position request. This is distinct from creating an enemy or admitting a new enemy type.

Source: [relocation.rs](../../crates/azeroth-survivors-re/src/enemies/relocation.rs). Shared placement: [spawning.rs](../../crates/azeroth-survivors-re/src/enemies/spawning.rs). Static recovery: [recover-enemy-relocation.py](../../scripts/recover-enemy-relocation.py).

## Selection

Native iterator predicate `0x145531cb0..0x145531fb8` traverses the actual actor vector in order. Its caller at `0x1454a70fd..0x1454a7188` supplies a limit of **four** and snapshots the run clock and player coordinates.

An actor qualifies only when all these native fields satisfy the gate:

| Native actor field | Required value |
| --- | --- |
| `+0x68` dead byte | `0` |
| `+0x90` enemy-definition pointer | Nonnull |
| `+0x18` boss index | Sentinel `-1` |
| `+0x40` lair index | Sentinel `-1` |
| `+0x78` escape-state byte | `0` |

The predicate does **not** inspect the definition's `flag_4c`. An elite definition is not excluded solely because its definition flag is set; actor metadata controls this gate.

For positive movement duration, the actor's current XY is interpolated between its native `+0x10c` and `+0x118` positions using `(now-start)/duration` clamped to `[0,1]`. Nonpositive duration uses the destination directly. Native SSE unordered behavior is retained by the actor interpolation helper. The comparison is `dy*dy + dx*dx > 3025`, meaning strictly more than **55 XY units** from the player; equality and unordered squared distances do not qualify. The constant is recovered from VA `0x14670e5a4` with exact bits `0x453d1000`.

The resulting GUID list preserves actor-vector order and stops after four matches. It is a bounded per-tick list, not the four farthest enemies or a separately timed event.

## Placement and actor reset

For each selected GUID, `0x1454a721b..0x1454a7234` invokes the recovered placement helper `0x1454c17b0` with distance arguments **26..36** and forward chance **1.0**, consuming the owning run's shared RNG, actual terrain/path providers and smoothed player velocity. Placement's normal retries and fallback behavior remain owned by [the spawning report](enemy-spawning.md).

The sample is obtained **before** scanning the current actor vector for that GUID. If lookup fails, the sample and RNG draws have still occurred, but the actor reset, sequence increment and packet request do not occur. The source `RelocationPort` preserves this ordering and requires the actual actor store.

For a found actor, `0x1454a727c..0x1454a72e8` performs these mutations:

| Native field | New value |
| --- | --- |
| Movement from `+0x10c..+0x118` | Sampled XYZ |
| Movement to `+0x118..+0x124` | Same sampled XYZ |
| Movement start `+0x124` | Current run clock |
| Movement duration `+0x128` | `0.0` |
| Next movement refresh `+0x12c` | Current run clock |
| Cast state `+0x70` | `0` |
| Game sequence `+0x908` | Wrapping increment by one |

The native range leaves the cast deadline at `+0x74`, attack timer at `+0x130`, health, damage, other statuses and GUID unchanged. The source returns a request carrying GUID, sampled position and incremented sequence for native packet helper `0x1454451b0`; its real engine encoder remains responsible for wire serialization. This module does not create replacement world state or a packet simulation.

## Evidence and validation

- [Native span/constant manifest](evidence/0.97.2/enemies/relocation-manifest.json) binds the predicate and main-tick consumer ranges to exact original PE bytes.
- [REA/Ghidra Evidence](evidence/0.97.2/enemies/relocation-native.json): `ev_e1e2e5cb7502849ccfc7ede6ea9b1f274ec5904017d202e2869823621ab28fdb`. Original predicate slice SHA-256: `95fd023e30870a78ec3779177086da4458b562dc7a425825d5dc2408a045d4e0`. Boundaries come from the selected PE's `RUNTIME_FUNCTION`, not a historical RVA.
- [Retained decompiler output](evidence/0.97.2/enemies/relocation-predicate.ghidra.c), [predicate instructions](evidence/0.97.2/enemies/relocation-predicate.asm) and [main-tick instructions](evidence/0.97.2/enemies/relocation-tick.asm). Ghidra inferred signatures use a generic raw-import compiler specification; original Win64 instructions govern.
- Passed: full target identity and source-span checks; **seven whole native predicate fixture scenarios**, including strict distance boundary, all metadata gates, first-four ordering, movement interpolation/clamping, nonfinite input, negative/zero duration and an empty actor list. Only the predicate's allocation helpers are explicit bounded stubs; no source implementation is used as the native oracle.
- Passed: **three unchanged native actor-reset fixture cases**, including sequence wrapping from `0xffffffff` to zero and retention of cast deadline and attack delay. Emulation stops before the external packet helper.
- [Portable retained fixtures](../../crates/azeroth-survivors-re/tests/fixtures/enemy-relocation-native.json) and [authored Rust checks](../../crates/azeroth-survivors-re/tests/enemy_relocation.rs) compare source selection/reset against these native outputs when compilation resumes. The Rust checks are **not run** in the current source-only work mode.

These are static recovery results and native instruction fixtures with synthetic state. Real tick integration, terrain behavior, movement packets and runtime parity remain unverified. No claim of a playable gameplay loop is made.

Reproduction from this checkout:

```sh
python3 scripts/recover-enemy-relocation.py
python3 scripts/recover-enemy-relocation.py --prepare-native
python3 scripts/rea-batch.py runtime/enemies-relocation-0.97.2/plan-145531cb0.json
python3 scripts/recover-enemy-relocation.py --collect-native
```

Use a fresh batch output directory on subsequent REA runs; the batch runner deliberately rejects overwriting an existing session. The normal source build consumes only checked-in Rust and fixtures and does not require the reference EXE.
