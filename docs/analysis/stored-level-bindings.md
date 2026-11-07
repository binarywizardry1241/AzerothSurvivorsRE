# Stored-level keyboard binding

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This is the bounded source/recovery portion of permanent gap #21.
[verification-needed](../verification-needed.md) owns its remaining validation requirements.

## Native contract

The [manifest](evidence/stored-level-bindings/manifest.json) retains four
canonical REA/Ghidra instruction extracts. The
[selected data](evidence/stored-level-bindings/selected-data.json) binds
the command/header/default and format literals to original PE ranges.

| Owner | Recovered behavior |
| --- | --- |
| `0x1458e68a0` | Formats the `AZS_OPENLEVELS` command under header `AZS`, with body `AZS_OpenStoredLevels();`, and inserts it before the last `</Bindings>` in the stock binding file. The command has no `runOnUp`, hidden or platform attribute. |
| `0x1458e6ea0` | Trims trailing whitespace from the default file and appends `bind Y AZS_OPENLEVELS` with CRLF separators. It changes defaults, rather than forcing a key into each later live table. |
| `0x1458e71b0` | Installs those transformations for `Interface\FrameXML\Bindings.xml` and `WTF\DefaultBindings.wtf`. |
| `0x1400f39a0` | Gives the custom Options row the localized `Level Up!` label and its header `Azeroth Survivors`. The separately embedded addon API's FrameXML label remains `Open Level-Ups`. |

The exact selected-target [addon API](evidence/addon-api/game-mode-contract.lua)
already provides `AZS_OpenStoredLevels`, which writes `spendLevels=1`.
The binding checker supplies this recorded API explicitly to the shared Lua
contract suite; it does not depend on the suite's newer default input.
The existing mechanics consumer retains its own admission, stored-count,
choice/drain and reset rules. A keyboard binding does not bypass them.

## Connected source

[`native_bindings.rs`](../../crates/azeroth-survivors-re/src/native_bindings.rs)
and its XML asset share one command/default definition between the menu-only
Options catalog and the real client extension. The ordinary VM lifecycle now
appends the command after core registration and before addons. Its default key
is added to set 0 before the engine resolves account/character overrides, so
rebinding or explicitly unbinding it survives subsequent VM creation/ReloadUI.
The key-binding Defaults operation restores Y through that same default set.

The engine's existing chord dispatch executes the Lua body on a press; the
absence of `runOnUp` suppresses its release body. Existing UI keyboard capture,
modified-chord resolution, layout naming and persistence stay in that host.
There is no separate raw-Y gameplay handler. The real API/CVar exchange then
reaches the existing stored-level consumer in `gameplay/mod.rs`.

Options adds the same command/default for its menu-only account view and uses
the recovered custom label. During a run, its live binding snapshot and queued
SetBinding/SaveBindings/Defaults delivery now reach the same active VM before
the normal save drain. This bounded binding bridge is included in this repair;
VM-global settings and addon lifecycle remain separate #17 work.

## Checks and limits

`python3 -B scripts/check-stored-level-binding.py --check` passed. It
verifies newest-target identity, the four native instruction ranges/assembly
digests, six literal ranges, decoded native format strings, the source XML's
attributes/body, and the actual API/XML body through standalone Lua with the
existing stub host. That Lua check also passed its sixteen API message branches.
`--prepare-native` stages fresh bounded REA inputs/plans without launching them.

Source tracing checked default-before-override order, core-before-addon
registration, VM replacement, press/release ownership and CVar delivery.
Ten changed Rust modules passed syntax parsing with the installed rustfmt;
`git diff --check` passed. Two authored Rust regression functions cover default/saved
keys, replacement VMs, press-only delivery, live rebinding, the retained active
binding set and Defaults; they were **not compiled or run**.

Raw Ghidra inputs contain only selected code ranges and use a generic GCC ABI.
Original Windows instructions/literal bytes control the interpretation;
unmapped external routines and broad caller coverage remain limitations.
No build, `cargo check`, compiling tests, application launch, actual keyboard
interaction, rendered comparison or original/rebuilt parity check ran. Gap #21
retains those outstanding requirements.
