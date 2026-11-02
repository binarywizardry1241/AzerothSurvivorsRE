# Main-menu audio recovery (0.92.0)

This report's historical supplied EXE has SHA-256
`47e4ab65c1ad7366e554171a6a28b0272141664010a50795371129b203111bf2`.
The custom picker plays `Sound\Music\GlueScreenMusic\wow_main_theme.mp3`.
This is now supported by the existing native wrapper log, in addition to static
code and the inherited engine source. No new launch or audio capture was made.

The integration and validation below describe the recorded 0.92.0 milestone.
[Current0.109.0 recovery](menu-audio-0.109.0.md) now owns current policy and the
connected world-load handoff repair.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current application status. The current
0.105.0 [cold-loading report](cold-loading-0.105.0.md) separately recovers the
shared stream-watch diagnostic and explains its source correction; it does not
revalidate this report's historical audio policy or audible output.

## Native evidence

[menu-audio.json](evidence/0.92/menu-audio.json) retains the captured log-prefix
hash, selected line numbers, exact constant bytes and nine bounded native gain
outputs. `scripts/recover-menu-audio.py` regenerates that evidence from the
verified target and the existing log. Its emulation performs no audio, file,
network or process operation inside the target. CRT `log10f` alone is replaced
with Python's math result rounded to f32; the native branch and final f32
multiplication run unchanged. These cases check controller arithmetic, not CRT
accuracy or audible output.

The existing log names the hero picker, records build
`0.2.0+435 · 919a0183 · 2026-10-15 · release · extended`, opens the theme while
the client is on the login/character-selection route, and records its audio
device. Later theme starts occur in the same log. Its first 200 lines are hashed
as a stable captured prefix; the full running log is not treated as immutable.

Scoped Ghidra owners are:

| Owner | Recovered behavior |
| --- | --- |
| `1409017a0` | Start the theme unless a handle is already retained and not fading; require assets and an available mixer. |
| `1409020c0` | Feed the playing handle's volume, clear it after the stopped state, and service the stream watch. The next start pass can reopen it. |
| `1408fd770` | Native CVar callback: trimmed native f32 parsing, four volume clamps and ten boolean fields. |
| `1408fcc90` | Background/focus output gate, cached edges, absent-mixer behavior and15ms command. |
| `140921500` | Master-volume system: cached enabled/!muted, master and limiter tuple; gain command and limiter byte store. |
| `140914e30` | Register the sound systems; presence of `WOW_NOSOUND` or `WOW_CAPTURE` selects no mixer. |
| `140001250` | Current target startup entry, retained to bind the custom picker startup route rather than relying on historical addresses. |

The gain is `MusicVolume × 0.8` when both master sound and music are enabled.
At amplitude≤0.001 the controller emits−60dB; otherwise it uses
`20 × log10f(amplitude)`. The thunk at `145714ab1` is bound through the original
PE import table to CRT `log10f`. The watch sends a15,000,000ns volume tween.
The original instructions, rather than the raw-image Ghidra parameter names,
bind the SoundConfig fields and operands.

The [CVar/focus policy](evidence/0.92/audio-cvar-policy.json) binds the sound
observer callback at `1408fd770` and focus gate at `1408fcc90`. Its82 unchanged
native callback outputs cover all14 audio keys, using the native f32/lexical
parser rather than a numeric formula stub. Volumes clamp0..1 with NaN retained;
toggles use `value != 0`, including NaN. Invalid event numerics become zero.
Loaded invalid registered numerics are rejected earlier by the startup registry.
The source fixtures compare the36 cases belonging to its six consumed keys.

Background sound bypasses the window query; an absent/non-single primary window
opens the output. The effective open state is cached even when the mixer is
absent. Changed gates send0dB or−60dB through a15ms transition. The master owner at `140921500` independently binds the cached tuple, enabled/!muted
gain,15ms transition and limiter store. NaN refreshes the tuple and reaches log10f;
original UCOMISS instructions close a misleading decompiler comparison. The menu
starts with the native unmuted default; developer mute input remains unimplemented.

## Source integration

`sound.rs` connects the menu theme to the existing engine mixer, limiter, meter,
mix tap and platform output modules. Kira's built-in CPAL backend remains off;
the shared backend uses CoreAudio on macOS and its CPAL device layer elsewhere.
No new audio player or alternative music track was introduced. The theme is
read through the existing loose-file-first/MPQ-chain resolver using the supplied
`--data-dir`/`WOW_DATA` route. Neither the EXE nor MPQs are build inputs.

`menu_audio.rs` reads the relevant menu CVars and supplies theme/master gain,
limiter and background-focus policy. The mixer retains its own15ms transition
and device servicing. Missing/failed devices leave a silent menu, and missing
theme data is retried by the start pass. A stopped theme is released and can
restart on the next frame. UI panels share the same music handle.

The unchanged pure amplitude→dB calculation was extracted to shared `gain.rs`
so the native fixtures exercise the same conversion used by the real mixer.
Unit tests exclude the device/backend modules and the engine's live audio test
harness. Normal builds compile those modules and their platform APIs. This
keeps fixture execution from opening a device while still typechecking the
production path in the application build.

Final locked/offline build26 passed in11.08s after the combined29.09s build.
All169 overlapping focused harness cases passed; the two audio cases compare
nine native controller outputs and36 consumed-key callback outputs. The first
audio build exposed a missing libc dependency, now fixed. Production builds
compile the actual backend; unit execution excludes device code. No rebuilt
playback or audible comparison has been performed.

## Remaining limits

The exact target dependency revision, patched Kira/DSP/device equivalence and
native ECS scheduling/run-condition equivalence are not established by sharing
source. Callback, focus and master policy owners are instruction-bound; their
complete schedule/type chain remains unverified.
Complete CVar registry/session/VM ownership is still an existing menu gap.
Native click sounds, developer mute, diagnostic probes, credits/movie routes
and full sound-health reporting are not reconstructed by this menu bridge.
Gameplay entry and its fade are outside the current task. Main-menu1:1 audio
parity remains unverified until a controlled rebuilt/native comparison.
