# Cold zone loading: pause clocks and audio diagnostics

Selected EXE: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report separates the recovered engine rule from the reconstruction's local
pause adapter. [verification-needed](../verification-needed.md) owns application status.

## Native release contract

REA/Ghidra recovery of `140836110`–`14083647b`, original-PE assembly and byte
identity are retained in the [settle manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.105.0/cold-load/settle-manifest.json).
The function checks the body's focus tile, residency, scene readiness and
collider/merge/retained-render backlogs. It compares six progress counters. A
stale world or changed counters extends the deadline by the native **6 seconds**;
otherwise an expired deadline takes the timeout release. A presentable matching
world releases immediately, before the deadline check.

The raw-slice decompiler lacks external types and the Win64 compiler specification.
PE instructions establish registers, offsets, branches and constants; inferred
pseudocode parameter names are not ABI evidence.

## Source correction

`gameplay/client.rs::sync_to_client` pauses the controller while `ZoneWorld.ready`
is false. `local_client/player.rs::hold_input` previously shifted controller
clocks only on resume. Meanwhile `player/world_focus.rs::release_post_snap_hold`
kept checking the old deadline. Once the focus tile was resident, an outstanding
job with unchanged counters could consume the budget while control was suspended.
The host still refused gameplay readiness: premature release did not finish loading.

The pause adapter now accounts each held interval before the stream/release
stage. Resume accounts only the remaining interval, preventing double counting.
Matching residency still releases during the pause. The release function,
six-second budget, movement, camera and readiness requirements are unchanged;
unpaused stalls retain the native backstop. A permanently failed load still
cannot become ready; this correction does not invent missing assets or success.

## Verification and limits

[Six instruction cases](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.105.0/cold-load/settle-fixtures.json) execute
the unchanged selected-EXE release owner in Unicorn: expired clock, accounted
pause, readiness during pause, resumed stall, changing counters and stale world.
Clock/resource/tile inputs and the log callback are explicit seams. Supplied
deadlines exercise the native release rule, **not the Rust adapter or an MPQ load**.

Two authored Rust regressions compose the actual pause and release systems.
They hold fixed progress for 18 simulated seconds, release on readiness while
paused, and verify resume does not double-count or disable the timeout.
Rustfmt syntax/format checking passed; compilation and these regressions were
**not run** under the project's build restriction.

## Audio diagnostic correction

The selected target's stream-watch owner `140abbd60`–`140abc282` has been
recovered independently with REA/Ghidra and original-PE instructions. The
[audio manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.105.0/cold-load/audio-manifest.json) binds its bytes,
provider and constants: a one-second window, loss threshold 0.1 seconds and
three-second startup wait. The native meter adds frame-start deltas to its
expected time but samples playback position and a monotonic timestamp later
in the frame. Loading work before that poll can be credited to two different
windows when a window closes on the delayed frame.

[Three native replays](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.105.0/cold-load/audio-fixtures.json) confirm:

- Healthy regular polling: no warning.
- Healthy playback with one poll delayed 400 ms: a **false 400 ms warning**;
  the next window counts 1.0 seconds while spanning only 0.6 seconds and
  advancing playback by the same 0.6 seconds. No sample loss is supplied.
- A real supplied 1.2-second playback freeze: a 1.2-second warning.

Handle state/position, frame delta, monotonic time and duration subtraction are
controlled seams; the original meter's state transitions, arithmetic and verdict
instructions run unchanged. These vectors do not run a decoder or audio device.

The source watch now derives elapsed time from its own monotonic poll timestamps,
the same interval as its position difference. It keeps the startup/swap/pause
rules, one-second window and loss threshold. Glue, zone, ambience and Lua music
callers use the shared correction; the older standalone menu-audio module's call
also follows its signature. Two authored Rust regressions cover the healthy
delayed poll and actual freeze, and existing watch fixtures use poll timestamps.
Rustfmt syntax/format checking passed for all four changed audio files. The Rust
regressions and compilation were **not run**.

This deliberately corrects a diagnostic defect also present in the reference.
It changes no playback, volume, buffering, decoder priority, track selection or
game rule. Exact diagnostic-log parity is not claimed. It cannot establish that
the historical run's audio was healthy, or repair a separate real device/decoder
underrun without fresh evidence.

## Remaining runtime validation

The historical 0.100.1 capture record reports a cold Elwynn timeout and audio
starvation. Its runtime logs are absent, so this inspection cannot attribute that
run to one cause. No fresh original/rebuilt process, MPQ load, audio capture or
listening comparison ran. Cold-load duration, collision/rendering and audible
playback remain unverified; these source corrections do not close the whole gap.

Regenerate ignored evidence with `python3 scripts/recover-cold-load.py`;
add `--rea` for `./scripts/rea`/Ghidra recovery. The script uses the installed
Unicorn package, including the project-local recovery installation when present,
and never builds or launches a game.
