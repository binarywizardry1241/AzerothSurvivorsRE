# Native client baseline — 0.97.2

Reviewed 2026-10-18 against `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`,
SHA-256 `a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
The [textual evidence](evidence/0.97.2/native-client-baseline.json) records the
verified byte ranges, hashes, source owners and current adapter fingerprints.
This is historical pre-integration evidence. [Controller integration](local-controller-source-integration.md) explains the subsequent source changes; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current behavior and remaining gaps. Full native parity is unverified.
No code changes, builds, compiler tests or original/rebuilt launches occurred.

The fidelity baseline requires normal Vanilla movement/camera, Vanilla FrameXML action bars
and unit frames, and **level-up and treasure-choice screens matching the EXE**.
The pre-integration fixed camera, screen-relative movement and temporary HUD did not
satisfy that requirement. The earlier playable-zone checkpoint demonstrates
initial world/mechanics integration, not native client or screen fidelity.

## Current-target evidence

The selected EXE hash was rechecked. Seventeen relevant retained source-path
identities and the existing camera-constructor span were reverified against its
bytes. Representative file offsets are:

| Retained identity/resource | First file offset |
| --- | --- |
| `benilla-app/src/player.rs` | `0x5ab6e18` |
| `player/input.rs` / `player/camera.rs` | `0x5a3697e` / `0x5ae34c6` |
| `player/setup.rs` / `player/movement_net.rs` | `0x5a0293c` / `0x5ab5e56` |
| `ui_script/reference_ui.rs` / `ui_script/lifecycle.rs` | `0x5a1b326` / `0x59d77e8` |
| `benilla-ui/src/framexml.rs` | `0x66ddc40` |
| `Interface\FrameXML\FrameXML.toc` | `0x5a1a739` |
| `Interface\FrameXML\Bindings.xml` | `0x5a1acc1` |

Both FrameXML paths also have retained pointer/length descriptors. Stock frame
definitions come from the supplied MPQ patch chain; `PlayerFrame` and
`ActionButton` need not appear as EXE string literals.

Complete pinned Benilla layer files match the current EXE after LF-to-CRLF
conversion only: `layer.toc` at `0x5a9f74a` (1,168 bytes), `FrameXMLFixes.xml`
at `0x5a57cd7` (2,342 bytes), plus `GameMenuAdapters.xml`,
`ContainerFrameAdapters.xml` and `SpellBookAdapters.xml`. The evidence records
every full range and SHA-256. The embedded manifest explicitly follows the
stock `FrameXML.toc`; its fixes adjust stock chat, durability and nameplate
behavior. This is stronger than source-name presence alone.

Native camera setup `140838a90..14083953b` is already bound to
`player/setup.rs`: it constructs the rig/FlyCam with distance15, yaw0 and pitch-.5.
Those are constructor values, not proof of a fixed camera or its final entry pose.
The public take-control path subsequently seats body yaw and saved/default pitch;
that later path is not separately behavior-bound here.

## Existing source owners and the mismatch

[PlayerPlugin](../../crates/benilla-app/src/player.rs) owns the capsule controller,
right-drag turning, left-drag orbit, both-button forward movement, wheel zoom,
camera follow and movement transport. [Input](../../crates/benilla-app/src/player/input.rs)
normally makes A/D turn, switches them to strafe during mouselook, uses Q/E to
strafe, and moves forward along character facing. Camera modules own the model
pivot, zoom/CVars, saved views, follow dynamics and collision.

[FrameXML loading](../../crates/benilla-app/src/ui_script/reference_ui.rs) reads
the player's actual core files and bindings. The
[manifest](../../crates/benilla-app/src/ui_script/manifest.rs) loads core,
Benilla layer, then third-party addons. The
[world-entry lifecycle](../../crates/benilla-app/src/ui_script/lifecycle.rs) seeds
the VM with player/unit, XP, binding and CVar state. The existing client plugin
group composes PlayerUiPlugin, UiScriptPlugin, UiUnitPlugin and UiActionPlugin.
Their actual state feeds are the reuse boundary for unit frames and action bars.

The current reconstruction instead registers its own GameplayPlugin over the
world/render stack. `gameplay/mod.rs` decodes screen-relative movement and builds
Bevy health/XP/icon/modal UI. `gameplay/world.rs::publish_view` overwrites the
camera from a fixed offset each frame; its ground/ray bridge bypasses the
inherited capsule/controller. These are known substitutes, not recovered native
policies. Their reviewed file hashes are retained so this finding has a cutoff.

## Fork and screen boundaries

Existing current-target analysis confirms custom menu-scene behavior, a WorldLive
menu term, a menu camera-visibility gate and stock-preview suppression. It does
not establish replacement desktop movement or a fixed gameplay camera.
TouchDrivePlugin, WorldHoldPlugin and HeroPreview identities are present, but
their complete behavior/custom boundary remains unresolved. The request-present
view-lane owner also remains unresolved.

The EXE separately identifies AS `screens/hud.rs`, `hudparts.rs`, `cards.rs` and
`rewards.rs`. **Generic FrameXML does not recover those custom screens.** The
level-offer sampler recovers candidate/rarity/bundle rules, not card layout,
art, text, animations or interaction. Treasure-choice presentation and the
complete reward lifecycle likewise remain separate obligations; unavailable
rewards must not be represented as completed native functionality.

The pinned public revision remains `7b608671a65274e0fe330da4a63f12da58162b61`;
its identity as the exact original fork is unproved. Path identities establish
ownership leads, complete embedded matches establish those specific assets, and
neither proves every inherited native function unchanged or exercised. Restore
the real client stack and recover the AS overlays with bounded target checks;
no complete movement, camera, HUD or choice-screen parity is claimed here.
