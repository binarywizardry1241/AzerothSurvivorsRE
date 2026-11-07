# AzerothSurvivorsRE

Source reconstruction targeting **Azeroth Survivors 0.141.0**, using the Rust/Bevy
benilla engine. The [installed identity](docs/analysis/target-refresh-0.141.0.json)
binds the reference EXE and twelve MPQ archives. The
[current state](docs/CURRENT-STATE.md) tracks release claims and their source and
recovery findings.

The source connects the menu, real MPQ worlds, Vanilla controller/camera/FrameXML
and recovered run mechanics. Reference inputs are read directly from the
configured installed game; this checkout contains no game EXE or MPQ copies.
Existing gameplay, catalogs, repairs and native contracts retain their actual
historical version/hash until current applicability is established.

The [module register](docs/analysis/module-contracts-0.141.0.md) distinguishes
partial source, bounded native contracts and remaining source connections.
Co-op transport, server/party, world bootstrap and replication source remains
available. New release requirements and current-target correspondence remain
incomplete; selecting the target version does not implement its release changes.
[CURRENT-STATE](docs/CURRENT-STATE.md) owns source/recovery gaps;
[verification-needed](docs/verification-needed.md) owns execution/comparison work
and retained source-complete evidence. Compilation, client/game/server execution
and original/rebuilt comparisons are separate from the static audit.

## Build and run

Use Rust **1.98.1** and a C compiler (MSVC C++ build tools on Windows).
Building requires neither the reference EXE nor MPQs. Supply your own compatible,
complete MPQ Data patch chain to load real worlds, models, textures, fonts and audio.

With a standard Rust installation:

```sh
cargo +1.98.1 build --locked --profile menu -p azeroth-survivors-re
cargo +1.98.1 run --locked --profile menu -p azeroth-survivors-re -- --data-dir /path/to/Data
```

Direct binary launches check a nonempty `WOW_DATA` override, then `Data` and
`WoW/Data` beside the executable. The first existing directory wins; an empty
`WOW_DATA` disables automatic discovery. `--data-dir` supplies the override.
See the [current directory contract](docs/analysis/data-directory-0.115.0.md).

On Windows, use a path such as `--data-dir "C:\path\to\Data"`.
The output is `target/menu/AzerothSurvivorsRE` (`.exe` on Windows).
Windows compilation and runtime behavior remain unverified.

For optimized gameplay, replace `--profile menu` with `--profile ship` in both
commands; the executable is then in `target/ship/`. The `menu` profile compiles
game code at optimization level 0 and dependencies at level 1. The `ship` profile
uses release optimization level 3, full LTO and one codegen unit; its initial
build takes substantially longer.

The optional macOS/Linux bootstrap keeps Rust and build caches in this checkout:

```sh
python3 scripts/install-rust.py
WOW_DATA=/path/to/Data ./scripts/run-menu
```

`./scripts/run-menu` uses the installed Data directory configured in the local
ignored `.codex/reference-game.json` unless `WOW_DATA` is set. A portable
[configuration example](.codex/reference-game.example.json) is tracked. It places
build output in `runtime/cargo-target/menu/`. Without MPQs, the menu uses fallback
art and explains how to supply data. Native extended/CJK fonts can be supplied
with `--font-dir /path/to/Fonts` or `AZS_FONT_DIR`; see the
[font supply and registration](docs/analysis/font-inputs-0.113.2.md).

Language catalogs support `lang/<code>.json` beside the executable and in the
save-data directory. Entries merge over the built-in text; the save-data file
wins duplicate keys. Restart to reload files. See the
[language loader and parser limits](docs/analysis/localization-0.108.0.md).

## Play and save data

Enter loads the selected zone and waits at the movement-to-begin gate. The app
uses the benilla movement/camera and real FrameXML unit frames/action bars.
Abilities cast automatically; 1–4 select upgrades and Escape pauses/resumes.
The picker enforces saved unlocks. For development, `./scripts/run-menu --zone naxx`
selects a zone without granting permanent unlocks.

On Windows, `WOW_PAD=xinput` selects the recovered XInput producer,
`WOW_PAD=gilrs` (or `wgi`) selects the ordinary backend, and `WOW_PAD=off`
disables controllers. With no recognized override, Wine selects XInput.
Other platforms retain the ordinary backend. See the
[input contracts and limits](docs/analysis/input-0.109.0.md); hardware and
platform parity remain unverified.

The optional stock character frontend is selected with
`WOW_ROGUE_GLUE=1 ./scripts/run-menu`. It loads the configured GlueXML and
provides the recovered twelve-zone realm list and local saved-roster operations.
An explicit `--zone` quickstart takes precedence. This source path is uncompiled;
see the [stock frontend contracts and limits](docs/analysis/stock-frontend-0.105.0.md).

The helper isolates configuration and progress under `runtime/menu-state`.
For direct launches, `BENILLA_HOME` selects configuration; `WOW_ROGUE_SAVE`
selects the active save. Otherwise progress uses the native `APPDATA`,
`XDG_DATA_HOME`, then `HOME/.local/share` precedence under
`wenilla-rogue/characters.txt`. Exports use that save-data directory's `Saves`
folder. Use isolated copies for compatibility checks; complete save migration
and normalization remain unverified. See the [save format](docs/analysis/main-menu-save-format.md).

## Co-op

The source supports native direct TCP startup. After building, launch a host
with `WOW_ROGUE_COOP_HOST=37241` and a guest with
`WOW_ROGUE_COOP_JOIN=127.0.0.1:37241` (or the host's address on another machine).
Set the same `WOW_ROGUE_COOP_PASSWORD` on both when a password is required.
Both clients need compatible MPQ data. Join before movement starts the run.
Use separate `BENILLA_HOME` directories and `WOW_ROGUE_SAVE` paths for local
instances so configuration and account writes cannot overlap.

This integration has not been compiled or exercised with two clients. The
[integration report](docs/analysis/coop-0.115.0.md) records source ownership,
static checks and remaining service/presentation limits. The menu's
[public directory](docs/analysis/coop-directory-0.115.0.md) and
[Host/Code requests](docs/analysis/coop-forms-0.115.0.md) use the shared native
WebSocket service. `WOW_ROGUE_LOBBY_URL` overrides its endpoint for a compatible
service. Directory, form, input and rendered behavior remain unverified.

## Test and inspect

```sh
cargo +1.98.1 test --locked --profile menu -p azeroth-survivors-re --lib --bin AzerothSurvivorsRE --tests --no-fail-fast
```

With the local bootstrap, replace `cargo +1.98.1` with `./scripts/cargo`.
Tests include retained native fixtures, including version-bound historical data.
Source tests do not establish original-game parity.

```sh
./scripts/run-menu --check-data
./scripts/run-menu --check-preview
./scripts/run-menu --capture runtime/menu.png
./scripts/run-menu --zone elwynn --capture runtime/elwynn.png
```

## Documentation

Contributor work may use Git worktrees under the [workspace rules](AGENTS.md#workspace-boundary).
The Rust bootstrap and `./scripts/cargo` share the primary checkout's pinned
toolchain and Cargo registry with registered linked worktrees. Each checkout
keeps its own `runtime/cargo-target/` and compiler scratch.
Finish each task by removing disposable analysis output, temporary files and
unused worktrees under the
[storage and completion cleanup policy](AGENTS.md#storage-and-completion-cleanup),
while preserving useful game build caches, Ghidra projects actually reused for
reopen/resume, required source, assets, fixtures, documentation, curated evidence
and active work.

- [Current source/recovery gaps and issues](docs/CURRENT-STATE.md)
- [Gameplay/runtime verification, comparisons and retained completed findings](docs/verification-needed.md)
- [Newest-target coverage workflow](docs/analysis/reconstruction-coverage.md), [system map](docs/analysis/system-coverage.md) and [individual changelog claims](docs/analysis/coverage/changelog.json)
- [$changelog](.agents/skills/changelog/SKILL.md) saves pasted release notes and queues selectable leads.
- [$fixgap](.agents/skills/fixgap/SKILL.md) works on selected gaps or release leads and uses the installed EXE for targeted recovery.
- [$execheck](.agents/skills/execheck/SKILL.md) runs the full EXE and Data audit on request or when a selected gap requires it.
- [Recovered behavior and evidence index](docs/analysis/README.md)
- [Addon API guide](docs/addon-api.md)
- [Original-game changelog](docs/CHANGELOG.md) and its unchanged [source archive](changelog_2026-10-15_1.json)
- [Source distribution and runtime data](docs/SOURCE-DISTRIBUTION.md)
- [Pinned benilla source provenance](docs/analysis/benilla-vendor.json)
- [Optional REA/Ghidra setup](docs/REA.md)
- [Shared REA storage, migration and recovery](docs/analysis/shared-analysis-storage.md)
- [Recovery tools and historical source provenance](docs/SCRIPTS.md)
- [Contributor rules](AGENTS.md)

The repository distributes source and curated textual evidence. Engine/Lua interpreter source,
patched dependencies and their licenses are included. Executables, MPQs, toolchains,
caches and raw analysis output are excluded. GitHub Actions and binary publication
remain disabled; GitHub delivery contains source and curated textual evidence.
