# benilla source update

The 2026-10-20 engine integration followed
[`samwhosung/benilla@66b73cd6d46b29c0b2c17d05947ac277e374b217`](https://github.com/samwhosung/benilla/tree/66b73cd6d46b29c0b2c17d05947ac277e374b217),
the public `main` revision checked on 2026-10-20. It advances 178 upstream commits
from `7b608671a65274e0fe330da4a63f12da58162b61`. This is a source dependency
update, not evidence that Azeroth Survivors 0.105.0 used this revision or that
the updated reconstruction matches its EXE. [verification-needed](../verification-needed.md)
owns current implementation and validation status.

## Source identity and scope

The downloaded upstream archive has SHA-256
`63f8671543b7e496dd0e9d6dc609a516dda0f67da19b35e049c265c932908ec9`.
[benilla-vendor.json](benilla-vendor.json) records its immutable revision,
archive identity, baseline file hashes and intentional local overrides. Those
hashes describe pristine upstream files, not the adapted local files.

All engine crates, UI assets, patched dependencies and required textual
reference tables come from that one revision. Upstream scripts, documentation,
instructions, CI and machine configuration are excluded. The reconstruction's
own workspace settings and menu profile remain local. No game assets or
executables are introduced.

The dependency changes include the Rust `benilla-lua` interpreter and
`benilla-mlua` API adapter, retiring the patched C Lua/registry mlua dependency;
CPAL 0.17.3 and its upstream ALSA resolver compatibility package; and the newer
client text-filter, dialog and font-raster dependencies. Bevy remains 0.18.1,
Avian3D 0.6.1 and Kira 0.12.4. The reconstruction's target-bound updater pins
and existing TLS transitive versions remain locked. This does not update every
registry package independently of the engine's supported dependency graph.

## Reconstruction preservation and integration

The old archive's SHA-256 was checked against the previous vendor manifest
before a three-way comparison of old upstream, local source and new upstream.
The 33 files changed on both sides were reviewed; automatic text merges alone
were insufficient for the following integration changes:

- Offline session state follows upstream's relocated `client_state` and
  `glue_session` modules. Online login/reconnect policy and stock glue rendering
  remain gated while the embedding owns the menu. Returning from a run creates
  the embedding's boot VM rather than loading online login screens.
- Identity and the recovered addon API/CVars are still installed before real
  FrameXML/addons load. Race/class identity now uses the installed DBC name
  tables. Local UI feeds and request capture join upstream's ordered VM pass;
  the feed uses an engine turn while it owns CVar state shared with the host.
- Recovered cooldowns, resolved equipment displays, local names, optional font
  overrides and the common aura metadata adapter remain available. Aura lists
  use upstream's new container and retain the caster-level field.
- Each logical offline object-update packet now closes with
  `ObjectUpdateEnd`; first-pass GUIDs receive their explicit notify record. This
  preserves field notifications and create hooks before the next presentation
  event under upstream's new write/notify passes.
- Movement-report capture, pause-aware spline age, terrain grounding continuity
  and stationary-facing coverage remain. Existing facing fixtures now install
  their plugins before cleanup constructs the VM schedule.
- Audio starvation measurement still compares time between playback polls.
  The local shader's deferred-discard fix now also waits for upstream's new
  second-stage texture sample, preserving helper lanes for its derivatives.

The reconstruction crate's 232 existing source, asset, manifest and test files
were byte-for-byte unchanged by the engine update. Their sorted
`path + NUL + content-SHA256 + LF` digest before and after was
`b4f6508901732f9085edd7a23b38bcec19729e372ccff5d9619e3997b70faa2d`.
The selected EXE/MPQs, recovered evidence and saves were not update inputs or
replacement destinations. Existing local-only client modules are retained.

The import is divided by owning subsystem: Lua interpreter/adapter, data readers,
world renderer, UI core/bindings, client session/controller, client presentation,
and dependency/provenance integration. The Lua and UI changes are sizeable
because the interpreter and its callers move together; individual upstream
source files and their tests remain together within each subsystem.

## Validation limits

Non-compiling checks passed: changed Rust sources parse with the pinned
rustfmt, Cargo workspace metadata loads, the dependency lock resolves without
changing the preserved target pins, and Git whitespace/conflict checks pass.
The archive comparison found no missing selected upstream source paths. Literal
VM golden output spaces and empty TSV columns retain their upstream bytes, with
path-scoped whitespace attributes. The final source pin includes upstream
66b73cd6's cast-failure/cancellation update, which touched no locally modified
file; its regression source remains unrun.

Regression test source covers object-packet boundaries/first-pass masks,
localized identity and full offline-client schedule construction, alongside the
retained equipment, movement, facing, chat and audio tests. These tests have
**not run**. Compilation, application builds, original/rebuilt launches,
MPQ-content checks and behavioral/visual comparisons have **not run for this
engine update**. Previous test/runtime results apply to the earlier engine
baseline. In particular, source parsing cannot establish Rust type correctness,
Bevy schedule validity, addon compatibility or native parity.
