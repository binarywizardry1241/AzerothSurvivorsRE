# 0.105.0 Options controls and settings lifecycle

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
Current implementation status belongs to [verification-needed](../verification-needed.md).
Current custom file-value reads and live VM admission are revalidated separately
in [the 0.112.0 Options interface report](options-vm-0.112.0.md); the addresses and
96-row table below retain their historical target.
This report owns the source/recovery portion of gap #17 for Options controls,
VM-global persistence, live rebinding and account AddOn enable state. It does
not establish every secondary page, rendering or interaction parity.

## Selected-target contracts

The current table at **0x145da18a8** has **96 records of 152 bytes**. The
[manifest](evidence/0.105.0/options/manifest.json) binds its full byte range,
selected native procedures, default sources and dispatch tables. The live
[`options.json`](../../crates/azeroth-survivors-re/assets/options.json) already
contained the same 96 controls, including `storeLevels`, `menuScene` choices and
`renderScale`. Their labels, storage/control kinds, pages, ranges, inversion,
indentation, stops/choice values and linked writes now have current provenance.
This pass found no missing descriptor and did not add an invented control.

Default sources are distinct:

- 52 engine defaults come from the current 88-byte registered table. Native
  lookup **0x140da0760** reads names at +0x28, defaults at +0x38 and consumes the
  table's actual bounds. Initialization **0x140dcea63** uses the same layout.
- 23 VM-global rows carry their own default literals. The two nameplate globals
  use the current Defaults storage-2 branch, which constructs ASCII `0` at
  **0x1400faebe**.
- Eleven custom rows register their defaults directly: cache/store levels,
  gamepad, meter placement, Discord presence, spell effects and menu background.
  The retained registration fragments include the strings and call arguments.
- HUD scale and seven visibility-row defaults reuse the canonical current
  [HUD manifest](evidence/0.105.0/run-hud/controls-manifest.json); their original
  extracts are not duplicated here.

The registered gamma default is text `1.000000`; the native Brightness reset
parses it, applies the display inversion and formats it through the write path.
The asset's stored numeric `1` represents that same reset result.

The native write consumer **0x1400f2100** rejects indexes above 95, multiplies
the index by 152 and dispatches on storage through **0x145da88f0**:

| Storage | Route |
| --- | --- |
| 0 | Write the descriptor CVar through **0x14063d3f0**. Mouse Look Speed and Pet Damage also write their recorded linked CVar, using the recorded multiplier. |
| 1 | Format the value and write the Lua/global setting; apply it to the live VM when available. |
| 2 | Convert exact text `1` to the native Boolean-global representation. |
| 3 | Parse the displayed brightness and write `gamma = 1 - display`. |

The CVar wrapper resolves the registry, calls its setter and drains resulting
change events. Page Defaults scans the same 96 records, selects their +0x91
page byte, obtains the storage-specific default and invokes this write consumer.
The raw Ghidra import omits the external jump tables and uses a generic ABI;
the original assembly and retained tables establish the actual Windows argument
and dispatch routes.

## Live source correction

Before this change, ordinary custom Options edits changed the launcher's map and
its parallel config writer. The unused `native_cvar_overrides` accessor did not
deliver those values to the embedded engine. The separate HUD/meter/stored-level
bridges covered only their own settings. Camera, UI, audio and render-scale
callbacks therefore could retain their prior registry value after an edit.

[`options.rs`](../../crates/azeroth-survivors-re/src/options.rs) now sends CVar
edits, page defaults, gamma and linked pitch/pet writes through the existing
`LocalClientExtension` queue. The normal registry retains its validation,
callbacks, VM mirror and save debounce. Recovered custom defaults are registered
through the extension; existing engine registrations retain their own defaults.
Registry values also update the Options view. A pending menu write takes
precedence over the preceding snapshot, and synchronization runs after client
input capture. The client supplies staged latched values separately so display
mode/VSync controls retain the requested value until the engine commits it.
Defaults also restores a linked pitch/pet value when the primary CVar already
equals its default. CVar Defaults uses the registry's actual default, including
locale-specific `gxWindow`, with the frozen descriptor value as a standalone
fallback. The normal registry owns CVar persistence when embedded, avoiding
the launcher's second writer; isolated menu-only use retains its fallback.

This connects the real engine consumers already present in benilla. It does not
implement missing game-mode consumers tracked separately under #33, or claim
that every reused engine callback matches the selected target.

## VM globals and the shared saved-variable file

The current file owner **0x14063adf0** reads `saved-variables.lua`, constructs
`NAME = literal`, replaces every matching assignment and writes through the
normal atomic-file helper. Its iterator **0x14091a860** matches the exact,
case-sensitive name at column zero, then optional whitespace and `=`. It leaves
leading-indented assignments, longer names, comments and other lines alone.
When no assignment matches, it appends one; an empty file also receives the
native one-line header. Line endings become LF and the file ends with a newline.
The native owner treats an unreadable/invalid-UTF-8 file as empty. The separate
live owner **0x14063a4e0** applies the same assignment to the current in-game VM.
The [lifecycle manifest](evidence/0.105.0/options/lifecycle-manifest.json)
binds these procedures, the iterator, file literals and current binding excerpts
to this target. The original Options dispatch extract remains canonical.

[`options_globals.rs`](../../crates/azeroth-survivors-re/src/options_globals.rs)
now owns this immediate file operation for all 23 string globals and the two
numeric nameplate toggles. String controls remain quoted text, including `"0"`;
only exact input `1` makes a plate global the Lua number `1`, while every other
input writes `nil`. Startup uses the existing non-executing flat reader and
keeps descriptor defaults for absent string globals. Both plate defaults are
off. The provisional `menu-options.json` is no longer read or written; it is
left in place rather than being promoted over the target's actual settings.

The custom Options page also queues the assignment to the real in-game VM and
observes its current globals, so FrameXML/addon changes can update the controls.
Pending menu edits outrank the preceding snapshot. The flush runs after custom
Options input and before the ordinary UI drain and exit shutdown. It does not
seat game globals in GlueXML. ReloadUI restores values through the same normal
saved-variable reader and `RegisterForSave` shutdown owner.

## Live bindings and account AddOns

The custom binding page previously edited and saved a separate account map
without updating an already-running VM. It now observes the live declaration
list, key order and defaults, including loaded-addon commands, and delivers
edits through `GetBindingKey`/`SetBinding` followed by
`SaveBindings(GetCurrentBindingSet())`. The real binding generation, events,
dispatcher and account/character writer own the result. Defaults follows the
current embedded Lua: `LoadBindings(0)` then the same commit. The engine's set-0
load preserves the current account/character set. A standalone page retains its
account-file fallback; old standalone edits are not replayed over a later
character-specific set. Binding registration and stored-level Y are separate
scope; this repair adds neither a command nor a default chord.

The current AddOn inventory **0x1411cb7a0** first resolves the ordinary
character/realm/TOC enable choice, then applies the first case-insensitive
account match. **0x1411cf3a0** resolves the exact lowercase
`addons/account.txt`; **0x1411cf760** re-reads its rows, changes the first matching
row in place or appends a new one, preserving row order and spelling, then
writes atomically. The real client now reads these same account overrides after
its ordinary enable choice at world entry and ReloadUI. The custom AddOns page
uses the recovered state path and writer behavior. Changes take effect through
the existing interface load lifecycle; enabled state does not unload a running
addon in place. The third-party inventory root remains `AddOns`.

## Checks and limits

[recover-options.py historical recipe](../SCRIPTS.md#historical-execution-sources) verifies all 96 live
descriptor/default contracts, retained byte/text hashes, **97 native dispatch
cases** (every descriptor and the index-96 rejection), and **108 native default
lookups** (both key casings for all 52 registered defaults plus the locale-1
Click-to-Move and locale-4 display-mode overrides). Default lookup runs
the unchanged table/locale instructions; only its long-name ASCII-insensitive
comparator is replaced by an explicit fixture seam. Dispatch stops before each
first external call. Neither check mutates the registry, opens a VM, writes a
target file or launches the application.

Six scoped REA/Ghidra analyses were used: write dispatch, page synchronization,
gamepad registration, CVar write/register wrappers and registered-default lookup.
Only necessary original assembly and compact identities are retained. Raw
responses and slices remain disposable under `runtime/`.

`python3 -B scripts/recover-options-lifecycle.py --check` verifies the
selected target and retained hashes, **12 unchanged native 1/nil write cases**,
**10 native assignment-matching cases** and **six native account-enable
precedence cases**. These stop before filesystem, allocation or VM callees; only
the explicit string comparators are fixture seams. A Lua interpreter also runs
the byte-bound current binding reset/commit excerpts and exact global literals
for **14 cases**, with declared binding-host seams. The real Rust binding load
is source-traced here, not executed by that interpreter.

Rust regression cases cover the flat-file boundary rules, global value types,
current character-set Defaults and ordered live rebinding, alongside the prior
CVar queue/default/snapshot cases. They are authored for future compiling
validation and were **not run**. Project rustfmt parsed the eight selected Rust
files without compiling or changing them; `git diff --check` passed.

[Binding-surface recovery](binding-sets-0.105.0.md) verifies the existing full
FrameXML character/account selector and five Lua transitions. The current custom
binding page contains only empty/section/binding rows, so it adds no selector or
cross-layer popup transport. [AddOns-page recovery](addons-page-0.105.0.md)
checks all16 native status combinations and the existing Title/Notes surface.
Complete shared-engine metadata/dependency ownership, other secondary pages and
input/layout/font/persistence parity remain unverified.
