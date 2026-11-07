# Terminal return routing

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [routing manifest](evidence/terminal/return-routing-manifest.json)
binds the original byte ranges, REA/Ghidra identities and bounded instruction
checks. [verification-needed](../verification-needed.md) owns integrated gap #9 status.

## Frontend binding

The return label is a **process frontend mode**, independent of the selected
roster GUID. Startup `14000175f..14000179f` reads `WOW_ROGUE_GLUE` and enables
the switch only for the exact one-byte value `1`. With no explicit hero/zone
quickstart, `14000ff00` selects the custom-picker variant by default and the
stock-client-screen variant for that switch. `14000fa90` derives the custom
mode flag from the startup variant's niche tag; closure `14000f9d0` passes it
through `140063df0` to frontend construction. `14004004a` reads the closure's
flag, and `140040336/33d` initialize frontend resource fields `+c/+d` with it.
Terminal content `1401b1087..1401b10c4` reads resource `+c`: true selects
`menu.main_menu`, false selects `menu.character_select`.

The default source application installs the custom picker through
`LocalClientPlugin`; its Main Menu terminal label is correct. That label is
independent of a saved character GUID and the custom Armory Character page.
The [ordinary stock frontend](stock-frontend.md) now honors the exact
`WOW_ROGUE_GLUE=1` switch when no zone quickstart was requested. It installs
`LocalStockFrontend`, enables the engine's real GlueXML lifecycle and answers
its login/realm/roster operations through the local authoritative backend.
Its terminal label is Character Select. The custom picker scene/input/preview
and music publisher are suppressed in this process mode.

## Proven terminal Menu contract

The terminal action table maps Again/Endless/Menu to commands `6/8/9`.
Core dispatcher `1458a48a0` maps command 9 to `1458a1370`. That owner finds the
active connection, persists its terminal result through `1458a1690`, cleans up
the game, clears the connection's active flag, sends `SMSG_LOGOUT_COMPLETE`
(`0x4d`), and then emits frontend JSON `{ "type": "logout" }`. The same
summary's Again command 6 follows a separate restart path and does not take
this logout owner.

`gameplay/terminal.rs` now gives Menu its distinct logout delivery. The shared
`finish_client_delivery` first flushes final addon/chat packets while the VM
and sender cache are live, then sends `SessionEvent::LoggedOut` through the
production inbound handler. That handler removes the player from the GUID
index, clears its GUID and forced reputation state, and publishes the ordinary
logout notification. `LocalClientSession::logout()` then clears the embedding
snapshots while retaining the client destination `CharSelect`; `follow_session`
keeps that destination instead of overwriting it with `Login`. The existing
single world-exit lifecycle tears down the VM. The custom picker remains the
frontend callback's live destination through `MenuState::return_from_run`.

`LocalClientSession::begin` resets the logout latch on the next run, so the
ordinary entry returns to `InWorld`. Plain `end()` retains its prior Login
destination. The local client continues to own in-world authority in both frontend modes;
no socket worker is started. Stock mode also retains the engine's shared roster
and addressed pick for its loading, addon and save consumers. Again retains the
active client through the final-message flush and starts the same saved GUID and
zone; it neither logs out through character select nor changes the custom Pick. On Endless continuation, the shared
mover events are drained before its chat notice so the native unroot order
survives the source's First/Update schedule boundary.

## Checks and limits

`python3 scripts/recover-terminal-return.py` passed **15 bounded native
vectors**: exact environment value/length/result cases, startup variant to
frontend flag, both frontend field stores, both terminal labels and all three
command mappings. No native callee executes; localization cases stop before
their calls. The [retained vectors](evidence/terminal/return-routing-vectors.json)
record these inputs and outputs. Rust lifecycle regression source covers
Login → InWorld → logout CharSelect → new InWorld → ordinary end Login; it was
not compiled or run. Rustfmt parsed the three changed Rust owners without
compilation; the ten retained original byte ranges were rehashed against the
selected EXE, Python source parsed, and `git diff --check` passed.

The ordinary source backend, native twelve-realm selection, saved roster and
Enter/Create/Delete contracts are now connected; the owning [stock report](stock-frontend.md)
records their separate selected-target evidence and checks. No compilation,
game launch, screen/input comparison or runtime parity check was performed.
Common terminal hover remains bounded by the current picker query recovery;
full #9 parity is still open.
