# AS data and embedded contract recovery — 0.115.0

This report belongs to permanent **#41/#105/#106**, leads **Q41-B02/I01**, and installed
SHA-256 `0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
[verification-needed](../verification-needed.md) owns current overall status. The
[data classification](native-data-classification-0.115.0.md) retains the complete
13-range B02 and 2,110-row I01 selectors; structural classes and lexical source
connections do not establish all AS schemas or consumers.

## Complete WorldStateFrame behavior — #105

The 146 otherwise unmatched AZS binding names and 28 unmatched Lua declarations
in the retained embedded classifier include substrings of actual packed scripts.
They cannot be treated as 174 independent dispatch interfaces. Source-first
tracing of their full containing scripts found a concrete omission:
`gameplay/client/framexml_hud.rs` kept only the 8,191-byte interval beginning
at `UpdateTalentButton` and ending before the action-tooltip wrapper. It dropped
989 prefix bytes and 1,024 suffix bytes from its existing canonical source.

The current [raid-target proof](raid-targets-0.115.0.md#popup-and-connected-source)
already recovers native patcher `0x145996550..0x1459967dd`: it reads the stock
`Interface\FrameXML\WorldStateFrame.lua`, combines its contents with the full
patch and generated addon API, and supplies the patched core file. Its current
descriptor `0x1473366f0` points to `0x147333bd4`, length **11,034**. That full
payload is byte-for-byte the existing 10,204-byte
[canonical Lua](evidence/0.108.0/hud-framexml/world-state-patch.lua), with the
current separately owned 830-byte [raid popup](evidence/0.115.0/raid-targets/popup.lua)
inserted before the chat wrapper. The earlier canonical file keeps its original
provenance; the [current compact proof](evidence/0.115.0/q41-framexml.json) binds
the complete current descriptor, code, payload and source connection without
duplicating native extracts or the Lua payload.

The source now appends the whole canonical chunk. This restores:

- Hiding all present always-up/capture world-state frames before ordinary frame
  position management.
- The native string talent-toggle counter, disabled spellbook/quest/social
  toggles, and rejection of the reputation tab while ordinary character tabs
  retain stock dispatch.
- Button-side action tooltips, with the native left/right parent test and
  action-dependent refresh lifetime.
- A single localized system line for `PLAYER_LEVEL_UP`; all other chat events
  continue through the captured stock handler with their existing context.

The existing core loader installs these wrappers before external addons on each
fresh or replacement VM, including nested core script reads. Locale changes
update the separate stats postlude and do not replay the core chunk. The existing
talent-view bridge, generated addon API, character-pane extension and current
raid-popup fragment retain their source owners. The popup and chat wrappers act
on separate functions; their source append ordering does not change each other's
capture target. No replacement behavior is invented.

The [source-lifetime follow-up](q41-framexml-lifetime-0.115.0.md) removes the
older talent bridge's late duplicate function installation, counter resets and
button restoration. Publication now owns only overlay state and its input guard;
it preserves the core initialization and later addon hooks across active,
inactive and retry-style transitions. Its 485 interpreted assertions and four
rejected mutations retain explicit VM/widget seams and unchanged watcher provenance.

## Graveyard-release popup — #106

The same complete candidate review found a separate script with no source
consumer: `game_binding_identifier:195/196`, `lua_function_declaration:157` and
`resource_path:211`. Current owner `0x145995680..0x1459958a1` reads
`Interface\FrameXML\StaticPopup.lua`, combines its current contents with the
embedded wrapper and republishes the same 34-byte core path. The
[compact proof](evidence/0.115.0/q41-death-popup.json) binds its 545 exact bytes,
[single canonical assembly](evidence/0.115.0/death-popup-bootstrap.asm), completed
journaled Ghidra query, compact format prefix, path and actual source consumer.
The raw-function import omits external filesystem, formatting and publication
callee bodies; these necessary interfaces reuse the current core-patch recovery.

The exact 271-byte [Lua fragment](evidence/0.115.0/death-popup.lua) is
`0x1473339ac..0x147333abb`. It captures the stock `StaticPopup_Show`, returns nil
without calling it only for `which == "DEATH"`, and forwards all four arguments
and the complete return tuple otherwise. This suppresses the stock graveyard
release surface; it does not suppress resurrection, party invites or unrelated
dialogs. `framexml_hud::appends` now supplies the fragment to its actual core
file. The existing fresh/replacement VM loader owns installation before addons;
no per-frame or locale-triggered replay is added.

## Validation and limits

`python3 -B scripts/check-q41-framexml.py` checks the current target,
full patch bytes, pointer/length descriptor, retained native-bootstrap proof,
canonical fragment composition and five live source/lifecycle connections.
`lua scripts/check-framexml-hud.lua` passes **242 interpreted assertions** across
two fresh VM fixtures. These include the restored command/character gates,
missing world-state rows, talent counter text, all tooltip parent/refresh
branches, localized level-up message and ordinary-chat forwarding, as well as
the existing main-bar/name tests. Explicit widget, stock-function, event and
tooltip seams remain.

`python3 -B scripts/check-q41-death-popup.py` checks the selected EXE,
native owner/assembly, exact Lua/template/path bytes, nine native interface
sites, completed query/result commitments and the live append. Its Lua harness
passes **52 interpreted assertions** across two fresh VM fixtures, including
exact-case DEATH suppression, nil/numeric/boolean/other dialog identities,
argument identity and nil/false/multiple-return preservation. Recreate the
stable native-query inputs with `--prepare-rea`, then use the printed
`./scripts/rea query` command to resume/reproduce the original journaled query.

Compilation, actual Rust/ECS/VM/core-loader execution, key/tooltip interactions,
rendering and original/rebuilt gameplay/visual parity remain unverified. The
supported source omissions are repaired; this does not close #41's remaining
mixed-schema, dynamic-reference, ownership or native/source-semantic populations.
