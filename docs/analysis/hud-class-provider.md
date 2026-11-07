# Stored HUD class provider

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/hud-class-provider/manifest.json) binds the
registration, both system runners, class forwarding windows and immutable data.
[Current HUD recovery](run-hud.md) owns the separate class/atlas mapping.

The stored-level icon uses the **frontend Pick's class**. It does not substitute
the backend Save or running Game's class. This distinction matters when tracing
the separate frontend/backend accounts described by
[account ownership](account-command-owners.md).

Initializer `14029c080` passes descriptor `145d9df58` to `140005770`, retains
its resource ID in R13 and stores it at system state`+b98`. The descriptor has
layout64/alignment8 and TypeID bytes
`069ad40b469b67b8d24e086565767c39`, matching the frontend Pick installed by
startup `140064930` through its `145d9d780` identity constant. The canonical
[frontend Pick binding](evidence/account-commands/frontend-pick-binding.json)
retains that construction and its three equal TypeID copies. The source's
frontend Pick, independently restored after import, remains the corresponding
owner.

The shared system vtable connects normal runner `14029c710`, alternate runner
`1403db290` and that initializer. The normal runner fetches the `+b98` resource,
places its data pointer in its Res argument and passes it at caller stack`+28`.
That is the **sixth Win64 argument**, callee entry stack`+30`. The updater
`14028e670` reads Pick`+38` at `14028ea00`, then forwards the byte by reference
to HUD constructor `14020ccd0`. The constructor reads that byte at `14020efc3`
before calling class lookup `14588d790` and atlas lookup `140063ba0`.
The adjacent seventh parameter is a different resource; its layout is not used
to infer the class provider.

`stored_hud::sync` therefore retains `menu.class_id()`. Loot presentation has a
different provider: [terminal equipment delivery](terminal-presentation.md)
reads the actual Game race; its HUD and summary consumers use that race.

`python3 -B scripts/check-hud-class-provider.py` verifies the installed
identity, native/textual hashes, TypeID/layout/vtable and source connection, then
passes **256 original-instruction forwarding cases**. The actual class byte,
closure capture and constructor reads execute. Host setup supplies the resolved
resource pointer and register state between the declared native windows; full
resource lookup, parent/child UI construction and scheduler execution are not
replayed. The existing HUD suite separately checks every u8 class/atlas result.

Three fresh REA/Ghidra queries cover the complete initializer and both runner
owners and close normally. Their raw-carrier ABI is provisional; original
Win64 instructions govern stack arguments and fields. This bounded binding
does not certify complete shared ECS/global ownership under #41. No compiler,
Rust regression, application, game, actual input or rendered comparison ran.
