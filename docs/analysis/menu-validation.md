# Historical main-menu validation

The checks below retain their **0.97.2 and 0.92** target boundaries. The current
reference is [0.100.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/target-0.100.1.md); [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) and
the [current validation record](evidence/0.100.1/consolidation-validation.json)
own later results. These historical captures/tests do not establish current parity.

## Explicit menu screenshot checkpoint — 2026-10-18

- Built current `main` source using `./scripts/run-menu --capture runtime/menu-launch-2026-10-18.png`. Fixed the E0515 boss spawn-point slice lifetime blocker with named const slices, and updated the recovery generator to reproduce it. `python3 scripts/recover-boss-point-data.py --check` passed for 12 zones, 60 bosses and 191 ability records; recovered coordinate bits are unchanged.
- The macOS arm64 `menu` build passed in 14.04 seconds. Binary: `runtime/cargo-target/menu/AzerothSurvivorsRE`, SHA-256 `be49015d589c1ec343be6a819f40e869133baf3a0201cd8d1bc6dff98f4bde90`. Retained warnings include unused code and the linker's oversized unwind section.
- The capture run exited zero. Visually inspected `runtime/menu-launch-2026-10-18.png`, SHA-256 `38f1733df84be2f8b15deb1bbbb5167ce45ef5d4c7980397dc36b5150e28c566`: title, menu tabs, class/zone lists, human preview and footer controls render. Capture mode exits automatically after 180 frames; a second launch without capture mode was left open.
- Both launches use project-local `runtime/menu-state` configuration/save and `AzerothSurvivors/Data`. Logs: `runtime/menu-launch-2026-10-18.log` and `runtime/menu-launch-2026-10-18-live.log`. No installed player save was selected.
- The asset server reports missing `world/wmo/azeroth/buildings/keepwall/wallpost01.wmo`, `world/wmo/azeroth/buildings/keepwall/wallpiece01.wmo` and `world/wmo/azeroth/buildings/goldshireblacksmith/goldshireblacksmith.wmo`; those world placements were not spawned. This screenshot is visual launch evidence only. No reference launch, full interaction/audio/comparison, gameplay, Windows check or test suite was run.

Screenshots, logs and binaries are ignored runtime artifacts.

## Historical reconstruction session — 0.92.0

All work, fixtures, builds and reference execution stayed inside this checkout. GitHub Actions is disabled and the workflow removed; no workflows or build artifact publishing are authorized for now. Gameplay was not implemented or entered.

- Final build26 passed11.08s with locked/offline dependencies (`menu-build-26-final.log`), following the combined29.09s build. It connects intrinsic Armory bodies, native save startup recovery, the exact-gated updater lifecycle/adapters and shared menu audio. The initial audio build failed on an undeclared libc dependency; the declaration and lockfile entry are fixed. The final artifact is Mach-O arm64; Windows remains unverified.
- All169 focused harness cases passed:74 binary,19 native-save,6 config,1 run-modifier,14 save-browser,37 updater and18 installer (`menu-tests-26-menu-bridges.log`, test compile12.95s). Harnesses overlap, including newly connected installer fixtures in binary/update suites. Six native loader cases and162 native zone outputs support startup recovery. Audio checks compare nine native gain cases and36 consumed-key cases from82 native callback outputs. Five connected updater fixtures use only memory readers/writers and recorded spawn hosts; no live adapter runs. The final audio loose-index Data-directory edit affects the production-only backend, was rebuilt successfully, and does not alter the fixture modules. Build25's105 cases and14.34s build remain the prior checkpoint.
- Build24 passed16.29s with53 cases for typed config and stream decoding. Build23 passed15.47s with64 cases after a Bevy child-iterator dereference fix. Build22 passed11.82s with26 binary cases; earlier results remain historical. **No build20–26 app launch, audio device/playback, HTTP request, download, install or restart was performed.** The source interaction/render proof remains bounded to build17 or earlier. Five closed native SHA256 vectors and ten native threshold/rate arithmetic checks also passed without an OS/backend path.
- Integrated Apple Silicon build19 passed (20.91s), including native shared Armory overlay,101 formatted spell tooltips, Codex ten-language outputs and the corrected binding header. It was **not launched**. Build18 failed on the15-plugin tuple limit; registration was split. Build17 passed24.72s and its key-slot constraints rendered correctly; a remaining4px native header margin was then proved from the bundle and added for19. Builds16/15 passed19.06s/18.72s respectively.
- Build8 compiled but failed its rendered check: the full-screen background covered the menu. Explicit UI-root z-order fixed that in build9. Build11 and build12 subsequently rendered complete UI and model, with no logged shader errors. Build11's corrected raw-linear gradient stops visibly restore the brown pane gradients.
- The native 0.92 EXE and rebuild ran in separate isolated project-local profiles. Rebuilt Saves export created the native sealed envelope and UTC filename; confirmed import restored the synthetic Orc Warrior `Changed`. Original import/export also accepted the Rust codec fixtures. Neither profile used an installed player save.
- The original AddOns page was exercised with two manifest-only fixtures. Checkbox toggles, title dimming, missing dependency status, notes in the hover footer and exact `AddOns/account.txt` lines were observed. Rebuilt checkbox toggling produced the same disabled line and dimmed title. Build14 corrected ordinary row labels to the direct native Text bundle, aligning labels and controls. The rebuilt AddOns header/rows were inspected and the TOC-note footer displayed the fixture note; full per-page comparison remains open.
- Rebuilt Run Options rendered at the native 760×560 design size and 1.4 scale cap. Reset returned all percentages to100 and the summary tox1.00. Other steps/persistence and complete button painting remain under comparison.
- Rebuilt language popover opened at the recovered top-right geometry. Choosing Polski translated connected picker/menu keys and wrote exactly `pl`; English was then restored. Missing accents/Cyrillic/CJK in ordinary MPQ fonts were a visible failure. Native font buffers, the 21-row composite-glyph transform and exact fallback registration were recovered. Build14 visibly renders the Russian, Chinese and Korean autonyms and the Polish accents; those established glyph failures are corrected. All-screen localization and shared emoji routing remain open.
- Preview asset checks passed for all80 supported race/sex/class looks, including native starter-item mappings. This validates asset resolution, not appearance parity.
- Build19 focused validation passed34 harness cases (28 distinct checks after repeated name cases):17 binary rules,11 native-save and6 save-browser. The new shared parser, invalid-name Hero fallback, direct writer and import backup semantics are covered. The unchanged run-modifier test passed earlier. Logs remain under `runtime/menu-recovery`.

The [native tooltip report](main-menu-tooltips.md), [ability formatter report](ability-tooltips.md), [Codex report](codex-recovery.md), [updater report](main-menu-update.md), [connected worker](main-menu-update-worker.md), [audio report](main-menu-audio.md) and owning [font report](main-menu-fonts.md), [Options report](options-recovery.md), [Run Options report](run-options-recovery.md), [name-input report](main-menu-name-input.md), [preview report](main-menu-preview.md) and [progression report](progression-recovery.md) distinguish recovered rules from source implementation and observed runtime results.

## Historical initial-menu checks (2026-10-15)

- The source-built `AzerothSurvivorsRE` compiles on Apple Silicon macOS with Rust 1.98.1 using `CARGO_BUILD_JOBS=4 ./scripts/cargo build --profile menu -p azeroth-survivors-re`.
- `--version` reports `Azeroth Survivors RE 0.92.0 — main-menu milestone`.
- `--check-data` successfully reads the game font and all 18 menu images (nine class icons and nine zone images) from the configured MPQs. The catalog contains nine classes, eight races and nine zones.
- `--capture runtime/menu-0.92.png` opens the native window, saves a rendered frame, and exits successfully. The captured frame was visually inspected: the game font, class icons, zone image, selections, descriptions and controls render.
- A separate launch without a data directory opens the fallback menu. Native UI interaction checks changed Warrior to Paladin, Human to Orc, entered `Testhero`, changed Elwynn Forest to Duskwood, opened the unavailable-run notice with Enter, dismissed it with Escape, and opened Options. Updated details and selection state were visually verified.
- With MPQs loaded, the Options fullscreen control entered fullscreen and rendered the expanded layout; Escape still dismissed the dialog. The UI automation lost its coordinate-input window binding after the macOS transition, so the return-to-windowed control was not verified through that tool. The diagnostic application process remained running without logged errors and subsequently exited with status zero through the standard Quit shortcut.
- The intended Git delivery was audited for MPQs, executables, libraries, toolchains, build outputs, nested repositories, operating-system metadata and credential patterns; none were found. Vendored source hashes match the pinned upstream input except the lockfile's added menu package.

The initial local compiler component had a missing LLVM runtime link for `rust-objcopy`; the project bootstrap now repairs that link and verifies `rust-objcopy --version`. This was a tool packaging warning; the application build and runtime checks above succeeded.

Screenshots, raw build logs, MPQs and executable outputs remain local under ignored directories. They are not source dependencies or Git deliverables.

## Windows

The former Windows CI job was configured to build the menu with the locked dependencies and check the resulting EXE's `--version`. Its October 16 and October 18 executions were cancelled.

Checkout and Rust installation passed. Compilation was cancelled; the EXE identity check and artifact upload were skipped. This is an incomplete build check, not evidence of either a successful Windows build or a diagnosed compiler failure. No verified Windows artifact was produced by this run, and Windows menu rendering/input remain unverified. The build was not restarted during the documentation task. A macOS launch does not establish Windows runtime compatibility.

Repository Actions was disabled, the workflow file was removed, and the artifact inventory was empty at that historical checkpoint. No successful Windows validation is established.

## Limits

**Main-menu1:1 parity is not achieved.** Static recovery, a successful build or an isolated matching control does not prove the entire screen. All-screen font/line breaking, zone cards, utility actions, audio, rebuilt particle render comparison, hover transitions, complete Defaults/normalization/file operations and all reconstructed-page interactions remain open. Windows rendering/input are unverified. Gameplay remains outside scope; recovered data and vendored engine source are not evidence of playable conversion.
