# 0.97.2 menu backdrop recovery

Updated 2026-10-18. Target: `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`,
SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
The source owner is `crates/azeroth-survivors-re/src/background.rs`. This report
supersedes the 0.92 report for the selected target; it does not establish visual parity.

## Recovered and implemented

The selected target retains its loading-picture UI while its new 3D world scene
becomes ready. Ghidra-backed constructor `0x1402472a0` binds the image's absolute
−3% left/top and 106% width/height, Srgba(.4,.38,.36,1) tint, radial/linear gradients
and 28 ember entities. These are current-target observations, rather than an
assumption that the 0.92 constructor remained valid. The radial stop offsets
30/100%, FarthestCorner tag 10, y −10%, black .8 edge, downward PI linear gradient
with 60/100% stops and black .6 edge remain present. The ember formulas were
revalidated through constructor `0x1402472a0` and updater `0x14009ad90`.
Current thunk `0x145756e25` resolves through IAT `0x1458e8450` to CRT `truncf`,
so fractional terms continue to use subtraction of truncation.

The native `backdrop.rs` cvar system `0x14009df40` registers `menuScene` with default
`"1"`. `WOW_MENU_SCENE` takes precedence over the cvar. Its trimmed value disables
the scene only when exactly `"0"`; absent values and other strings enable it.
The Graphics descriptor at `0x14593a358` is control 7, storage 0, page 8, with
ordered choices **Animated Zone** (`1`) and **Black** (`0`), placed before Brightness.
The rebuilt Options row uses the existing CVar persistence and choice machinery.
This Windows EXE does not establish the phone/browser default described in release notes.

The source now publishes the recovered `SceneRequest` from the twelve native
zone records. It includes map ID, zone index, camera eye, look-at and required
terrain clearance. `SceneProfile::request` implements native `0x145509c20` profile
selection and `0x14009d4d0` orbit math. Explicit Elwynn, Duskwood, Arena, Naxxramas,
Scarlet Monastery and Feralas profiles are preserved; the remaining zones use the
native radius/anchor-derived profile. The selected zone changes only after the
previous scene fade reaches zero. The native `WOW_ROGUE_BACKDROP` and
`WOW_ROGUE_BACKDROP_SPEED` environment overrides are also supported.

For `p = seconds * TAU / period`, the orbit angle is
`phase + (sin(p) * amplitude if amplitude < TAU else p)`. Eye radius is
`radius + sin(p) * radius_wave`; the target circles oppositely at
`radius * target_radius`. Eye and target heights are independent profile values.
The Scarlet Monastery profile uses a fixed PI angle and a breathing radius.

`SceneRequest::camera_pose` implements the native engine clearance adjustment:
`wanted = max(ground_height + clearance - eye.z, 0)` when ground is available,
otherwise zero; `lift += (wanted - lift) * min(delta * 2, 1)`. Only the eye
receives this lift; the look-at remains fixed before conversion from WoW coordinates.
This corrects the earlier interpretation using native `14070ed0c..14070ed3a`.

The publisher fades toward the ready scene by `delta / 1.4`, and back to the
loading picture by `delta / -0.35`. Alpha is `1 - f*f*(3 - 2*f)`.
Disabling the scene sets picture alpha to zero; the dark background remains.
The source retains the native loading image until an actual world adapter marks
the scene ready. It does not substitute a static picture for a verified 3D scene.

## Connected engine source

The new [menu scene driver](menu-scene-0.97.2.md) reconstructs the native request,
mask, map, world-live, camera and residency owners. It activates after three
unchanged identity frames and latches ready after18 frames with the native
focus/scene/collider/merge/GX gates. Its armory mask hides drawing while retaining
world residency. No invented readiness timer replaces those loader conditions.

The [world compositor](menu-compositor-0.97.2.md) now connects MPQ asset sources,
loaders and `WorldPlugins`, world/UI cameras, world render sizing and the FFX/UI
gamma pass. Complete current-target shader matches and native camera/resize
functions support the reused adapter. `MenuScene.ready` is now written by the
real residency adapter; it is no longer permanently false in source. This is
implemented integration, with compilation and visual/runtime comparison explicitly
not run at this checkpoint.

## Evidence and validation

[The curated evidence](evidence/0.97.2/menu-background-0.97.2.json) preserves full
reference identity, original VAs/file offsets, immutable function-slice hashes,
REA/Ghidra Evidence IDs, literal bytes, profiles and implementation limitations.
Sibling `menu-background-0.97.2-*.asm` files contain the selected original native
instructions. `scripts/recover-menu-background.py` reproduces the profiles
and evidence from the SHA-bound EXE and saved local REA bundles. The source build
requires neither the EXE nor this analysis script.

The initial profile subtask and subsequent scene/compositor task used static
extraction and Ghidra analysis. The continuation performed no build, compiler
check, test, emulation, original launch or rebuilt launch. Native requests,
profiles and connected transition logic are source implementation; exact frame
timing, all aspect ratios, inherited world-system fidelity and rendered output
remain unverified. See the owning scene/compositor reports for the new evidence.
