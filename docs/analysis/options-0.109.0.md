# Options additions — 0.109.0

Target SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This is the descriptor/default/write portion of **#17**.
[verification-needed](../verification-needed.md) owns the remaining secondary-menu scope.

## Recovered and connected controls

The current native table at `0x145da1810` contains **104 records of 152 bytes**.
All descriptor fields, order, labels, pages, control/storage variants, ranges,
indentation, inversion, linked writes and dropdown labels/values are recovered
from this image. The former 96 rows have unchanged descriptor semantics; their
addresses are rebound rather than treated as unchanged native locations.
The [manifest](evidence/0.109.0/options/manifest.json) binds the complete table,
write jump table, eight registered name/default pairs and three native owners.

| Added setting | Native control | Default |
| --- | --- | --- |
| Player Titles (`UnitNamePlayerPVPTitle`) | Indented names-page checkbox | `1` |
| Multisampling (`gxMultisample`) | Graphics choices Off=`1`, 2x=`2`, 4x=`4`, 8x=`8` | `1` |
| Anisotropic Filtering (`anisotropic`) | Graphics choices Off=`1`, 2x=`2`, 4x=`4`, 8x=`8`, 16x=`16` | `1` |
| Trilinear Filtering (`trilinear`) | Graphics checkbox | `1` |
| Full Screen Glow (`ffxGlow`) | Graphics checkbox | `1` |
| Death Effect (`ffxDeath`) | Graphics checkbox | `1` |
| Emote Sounds (`EmoteSounds`) | Audio checkbox | `1` |
| Sound at Character (`SoundListenerAtCharacter`) | Audio checkbox | `1` |

The live [Options catalog](../../crates/azeroth-survivors-re/assets/options.json)
now includes these rows at their native positions. The existing renderer uses
the recovered checkbox/dropdown kinds and locale keys. All fourteen current
locale catalogs already supply the labels, hints and named dropdown choices.
No new independent settings store or rendering/audio substitute is introduced.

## Live write, reset and engine consumers

Current write owner `0x14001d920..0x14001de88` accepts indices 0..103,
multiplies by 152 and dispatches through `0x145da8a70`. All eight additions
use storage 0: the descriptor name and exact value reach native CVar setter
`0x140728070`. The retained setter wrapper resolves the registered CVar owner
and drains its change events. The current default-value wrapper
`0x140723a60` reads that registry's registered default, separately from a staged
or applied value. Raw-import pseudocode uses a generic ABI; original Windows
instructions and the separate PE data establish these arguments.

Source tracing follows `OptionsState::set` and page Defaults through
`sync_engine`, `LocalClientExtension::cvar_writes`, `extension::register` and
the ordinary registry. Its actual defaults outrank the standalone fallback.
The eight existing engine registrations already use `1`; game-mode descriptors
therefore do not override an incompatible default. Applied/staged snapshots
continue through the existing registry and Options mirror, with pending edits
taking precedence. File persistence remains with the registry's normal debounce.

Existing consumers are `video::on_cvar` for graphics, sound's CVar consumer
for listener/emote selection, and the nameplate CVar consumer for title display.
The existing multisample/texture startup policy and live glow/death/title/audio
policy are reused. Their target-specific internal and platform equivalence is
not established by this bounded menu/dispatch recovery. The current native
descriptor/default contracts do not promote every historical engine callback.

## Static evidence and limits

`python3 -B scripts/recover-options.py --check` compares all **104
descriptors**, **eight new registered defaults**, **252 locale keys** and retained byte/extract hashes.
It executes **105 unchanged native dispatch cases**, including every descriptor
and index 104 rejection, stopping before the first external call. No allocator,
registry mutation, Lua VM, file operation, UI or game process executes.

The script's `--prepare` recreates original-VA Ghidra slices and seeds the four
storage branches from the current jump table. `--stage` writes candidate JSON
under ignored `runtime/options-0.109.0/` for review. Neither mode writes the
live catalog. Only necessary assembly/target identities are retained; full tool
responses remain ignored. Unchanged nonliteral defaults outside the eight
additions retain the [historical Options report](options-0.105.0.md)'s provenance
and are protected by a separate retained-value digest, not relabeled as current.

Compilation, compiling tests, game launches, device/input, actual save/restart,
rendering/audio/platform behavior and original/rebuilt parity were not run.
The wider secondary-page, dependency and initialization ownership remains
**#17/#41**; this repair does not close those parent gaps.
