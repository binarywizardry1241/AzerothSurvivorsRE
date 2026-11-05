# Original Azeroth Survivors performance launcher

Keep `AzsPerf.dll` and `AzsPerfLaunch.exe` together in a separate directory.
Use the same Wine runner and prefix that you use for the original game. Run the
launcher with the Windows path to `AzerothSurvivors.exe` as the first argument.
Any subsequent arguments go to the game.

```sh
wine "/path/to/AzsPerfLaunch.exe" 'Z:\path\to\AzerothSurvivors.exe'
```

Use your prefix's drive mapping. On Windows, run
`AzsPerfLaunch.exe "C:\path\to\AzerothSurvivors.exe"` from Command Prompt.

The launcher explicitly loads the adjacent DLL, applies the profile in its own
process and starts the game from the original executable's directory. The game
inherits the profile through its environment before the renderer initializes.
Launching the original directly uses its ordinary settings.

| Setting | Default for this launcher | Effect |
| --- | --- | --- |
| `WOW_RENDER_SCALE` | `0.75` | Renders the 3D world at 75% width and height. The world target has about 44% fewer pixels than at 100%. The interface stays at native resolution. |
| `WOW_MSAA` | `1` | Requests single-sample rendering. This avoids multisampling costs if it was enabled. |

The DLL preserves caller-provided values, including empty values. For a sharper
image, supply `WOW_RENDER_SCALE=0.85` in your launcher environment. Supply
`WGPU_BACKEND=vulkan` or `WGPU_BACKEND=dx12` only when you want to test a backend
that your Wine setup supports. Backend selection and VSync otherwise follow the
game's existing settings. For frame-time comparisons, supply
`WOW_FPS_JOURNAL` with a writable path for each run and compare the journal's
`p95_ms` in the same scene.

## Build and evidence

Run `tools/original-perf/build.sh` from the checkout. The SDK-free build uses
Clang and a COFF linker and writes both files to `runtime/original-perf/`.
Set `AZS_PERF_CLANG` or `AZS_PERF_LLD_LINK` to select an installed tool.
The script can also use the pinned project's `rust-lld` if installed.

The installed [0.141.0 target](../../docs/analysis/target-refresh-0.141.0.json)
has a render-scale environment reader at `0x140e93f80` and an MSAA environment
read at `0x141c997b7`. Both appear in the session CVar ownership path, matching
[RE's session setting handling](../../crates/benilla-app/src/cvars/mod.rs#L945).
The [world backdrop](../../crates/benilla-app/src/world_backdrop.rs#L30) and
[multisampling setting](../../crates/benilla-world/src/view.rs#L105) explain the
work each option changes. The launcher uses these settings without binding to
native function addresses.

Both artifacts were cross-compiled as Windows x64 PE files. A smoke test with
mocked Win32 calls checked arguments, working directory, setting overrides,
child exit status and startup errors. The profile reduces GPU work where fill
rate or multisampling limits the frame. Actual FPS and Wine compatibility
depend on the runtime setup and require a live comparison.
