# Main-menu source integration

Current reconstruction target: **0.97.2**; existing implementation baseline: **0.92.0**. The source foundation remains the same pinned revision. The [new target report](target-0.97.2.md) records identity and recovery requirements; this task did not update source logic/catalogs. See [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) and [historical build/runtime verification](menu-validation.md) for the maintained implementation status.

## Implemented milestone choice

`crates/azeroth-survivors-re` now builds its own native Bevy 0.18.1 menu App. It uses benilla's `benilla-formats` MPQ patch-chain and BLP readers for the configured runtime font/icons, and a source-embedded 0.92 menu catalog. This avoids opening the stock WoW login flow or starting network/authentication threads.

The menu now reconstructs the custom picker, real M2 hero preview, Armory and Talents, compatible sealed save records, and Options/keybindings/save-browser controls. The native canvas layout scale has been recovered. Public engine model-material/light APIs and the shader source matching the EXE are being integrated; this does not install the world, client/network or gameplay plugins. Exact parity and remaining screens are tracked in the [active reconstruction report](main-menu-reconstruction.md). Building requires neither the reference EXE nor MPQs; runtime MPQs provide game art.

## Historical source-foundation research

The sections below record the earlier, pre-implementation investigation, when the selected target was **0.91.4**. Statements about missing Rust tools, compilation not being run and future integration describe that historical pass, not the current checkout. The current 0.92.0 menu has since built and opened on macOS; Windows compilation was cancelled before verification. Gameplay recovery remains evidence for later implementation.

## Vendored upstream foundation

The pinned `samwhosung/benilla` source is now present directly under this checkout's `crates/` and `third_party/`, without a Git clone or alternate checkout.

| Property | Value |
| --- | --- |
| Upstream revision | `7b608671a65274e0fe330da4a63f12da58162b61` |
| Archive | `https://codeload.github.com/samwhosung/benilla/tar.gz/7b608671a65274e0fe330da4a63f12da58162b61` |
| Archive bytes | 9,041,970 |
| Archive SHA-256 | `4c9495f7941c48d6ef53b4f31340822fa0e400b3d4c4c87d5b2858a2687f04c7` |
| Selected files / bytes | 1,886 / 34,784,479 |
| Crates / patched dependency crates | 19 / 2 |
| Root source licenses | `LICENSE-MIT`, `LICENSE-APACHE` |
| Detailed original-file hashes | [benilla-vendor.json](benilla-vendor.json) |

The selection contains crate source and their own XML/WGSL assets, patched Lua C sources, patched Kira source, Cargo.lock, rust-toolchain.toml and licenses. It contains no MPQs, game executable, DLLs or binary art/audio/model/font assets. Upstream AGENTS.md, .cargo configuration, CI and unrelated root helpers were not copied.

The upstream root Cargo.toml is retained for constructing the project's merged manifest at `runtime/benilla-reference/upstream-Cargo.toml`; it was deliberately not installed as this project's root manifest. The archive and acquisition inventory remain disposable under `runtime/`. This is a source reference and foundation, not a claim that this revision is the exact 0.91.4 fork revision.

Two precise root resources are required for production compilation: `reference/glue_events.tsv` and `reference/events.tsv`. `benilla-ui/src/script/glue.rs` compiles them through include_str!, so they were included as required source data. Normal production source/assets and every declared local manifest path are present. On 2026-10-18 the exact test-only `reference/lua_globals.tsv` was also extracted from the same hash-verified pinned archive; the formerly missing fixture no longer blocks compiling upstream app tests. Its file hash and provenance are recorded in [benilla-vendor.json](benilla-vendor.json), and the controller integration and validation are described in [local-controller-source-integration.md](local-controller-source-integration.md).

## Build integration requirements

The pinned toolchain is Rust **1.98.1**, with rustfmt and Clippy components. Workspace packages use edition2021; the patched lua-src package uses edition2024. Bevy is **0.18.1**, wgpu27, and bevy_egui0.39 is an optional upstream developer dependency. C compilation is required for vendored Lua. A compatible C compiler and the pinned Rust toolchain are required. No Rust installation or compile was performed in this pass.

The merged root manifest must retain the upstream workspace dependency versions/features and both local patches:

```toml
[patch.crates-io]
lua-src = { path = "third_party/lua-src" }
kira = { path = "third_party/kira" }
```

The copied lockfile starts dependency resolution at the pinned upstream versions. A new launcher adds its own lockfile package entry. A static manifest audit found no Git dependencies, no missing declared local paths and no Git sources in the lockfile; a build still requires the locked crates.io dependencies unless they are cached.

Upstream documents `default-features = false` for its app/formats/assets/world dependencies and an optional forwarded `dev` feature. Enabling Bevy's broad default features can reintroduce its audio stack beside the existing Kira implementation; use the pinned workspace feature selection. Patched Lua and Kira retain their own licenses under third_party.

All tool/cache/state paths must stay inside this project: set CARGO_HOME, RUSTUP_HOME, CARGO_TARGET_DIR and TMPDIR accordingly. For any future benilla-based launch, explicitly set BENILLA_HOME to a project-local state directory. Its unattended fallback otherwise chooses the operating system's temporary folder. This pass did not launch anything.

## Startup seam and MPQ boundary

`benilla_app::run_with(BuildId, extend)` is the public extension entry point. The callback receives an App after upstream has installed DefaultPlugins, WorldPlugins and its private GamePlugins group. It therefore does not by itself replace the stock login/network UI with the Survivors picker. The upstream launch path starts at Login; its source says the world is loaded only after a character enters it. No public menu-only constructor or public disable-stock-login hook was found in the inspected source.

For the current milestone, an owned menu App or an explicit startup seam in the vendored engine is appropriate. It can use the existing formats/assets/world layers while avoiding the unrelated stock login sequence. The eventual local Survivors simulation/client bridge is a later integration task; it is not required merely to reach the menu. Exact menu layout, character preview and selection behavior still need version-specific implementation and verification.

The Data resolver is public through benilla-formats. Its search order is WOW_DATA, a developer-only project WoW/Data path, then Data and WoW/Data beside the executable. Explicitly empty WOW_DATA disables automatic discovery. These are paths to user-provided files, not assets to download or commit.

For the full engine app, the MPQ asset source is registered before AssetPlugin and its asset loaders afterward. Stock glue/UI reads fonts, textures, models and optional GlueXML from the configured patch chain; shaders and benilla's own UI adapters are source assets already included. A faithful game-art menu therefore still needs the supplied MPQs at runtime. A data-location/error screen may render before they are configured, but it must not be presented as verified visual parity with the original menu.

The historical source-foundation investigation did not open MPQs, execute either game or verify a build. Subsequent reconstructed-menu build/render checks are recorded separately in [menu-validation.md](menu-validation.md); they do not establish original-game parity.
