# Menu audio and world-load handoff — 0.109.0

Installed EXE SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The current #17 [manifest](evidence/0.109.0/menu-audio/manifest.json) binds five
full sound owners, fresh REA/Ghidra queries, current installed MPQ source and
115 original-instruction cases. The [historical report](main-menu-audio.md)
retains its actual 0.92.0 observations and device/backend limits;
[verification-needed](../verification-needed.md#gap-17) owns integrated runtime status.

The installed `patch.MPQ` supplies `Interface\GlueXML\GlueParent.lua` as a
stored 10,517-byte member. Its canonical `CurrentGlueMusic` remains
`Sound\Music\GlueScreenMusic\wow_main_theme.mp3`. Glue screen changes and
`START_GLUE_MUSIC` call `PlayGlueMusic(CurrentGlueMusic)`; the movie route uses
`StopGlueMusic`. The manifest records the registered archive hash and exact
stored member offset/hash. The current checker rereads that member directly.
The absence of this filename from the current EXE string table does not change
the Lua-supplied theme.

Current handoff `14097bb30..14097bcd6` updates the remembered loading-cover
state on every call. Only a falling cover edge in ClientState tag 2 (InWorld)
with a held theme writes the stop command: three seconds, zero nanoseconds,
then the fading flag. The native music-request path separately implements the
one-second StopGlueMusic movie verb. The shared source already preserves this
three-second world-load handoff in `sound/glue.rs`.

The custom embedding in `gameplay/client.rs` previously sent StopGlueMusic
immediately when a run became active, preempting that shared load-drain path
with a one-second fade. It now starts/restarts the theme when returning to the
custom menu and lets the existing shared engine own the world-entry fade.
Stock GlueXML continues to publish its own music requests. This is a connected
production-path correction; the older independent `MenuAudioPlugin` is not
installed by the application.

Current CVar observer `1409705b0..140970ba3` preserves the historical callback's
instruction/register/layout behavior after independently rebinding its calls,
constants and length dispatch table. All fourteen keys remain ASCII
case-insensitive. Values trim then use the actual current native f32/lexical
parser: invalid event numerics become zero, volumes clamp 0..1 with NaN
retained, and toggles use nonzero including NaN. Accepted keys update the
resource tick. Startup registry rejection of invalid saved numerics remains a
separate stage. The numeric helper ranges are shared with the existing
[Options values manifest](evidence/0.109.0/options-values/manifest.json).

Watch owner `14097b520` retains enabled/music-enabled gain `MusicVolume × 0.8`,
the 0.001 floor, -60 dB silence, `20 × log10f` and the 15 ms gain command.
Current focus owner `14096fa20` preserves the background-sound/single-window
query, effective-state cache, missing-mixer behavior and 15 ms output gate.
Master owner `1409a73f0` preserves enabled/unmuted, master/limiter tuple caching,
NaN refresh, gain command and limiter byte write. The current original operands
were inspected alongside fresh Ghidra; raw-import inferred types are not source
ABI declarations. The shared `SoundConfig` and mixer source agree with these
reviewed contracts; no additional policy correction was needed.

`python3 -B scripts/recover-menu-audio.py --check` passes 82 current
CVar cases, nine current gain cases and 24 load-drain combinations. The latter
execute the actual cached-state/tick stores, triple-buffer command and fading
flag, with optional tracing suppressed through its real level gate. CVar
fixtures execute the original parser bodies with trim/allocation/copy seams;
gain fixtures have an explicit rounded CRT log10f seam. The source's Rust
regressions now consume these current vectors, but were not compiled or run.

Focus/master complete ECS queries, Bevy scheduling, decoder/device/DSP/platform
behavior and audible/native-rebuilt parity remain unverified. No compilation,
Rust execution, game, device, recording or playback comparison was performed.
