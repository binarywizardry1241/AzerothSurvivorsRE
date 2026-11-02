# Terminal startup and return ownership — 0.107.0

Target: installed **0.107.0**, SHA-256
`92eaef3bc806144860ca838660286c02b66f9d7bbee0771f1f07a628209e9f7a`.
The [manifest](evidence/0.107.0/terminal-lifecycle/manifest.json) binds fresh
Ghidra 12.1.4 imports to the current PE ranges and data dependencies. It does
not redirect or relabel the historical [0.105.0 return](terminal-return-0.105.0.md)
or [Tester](tester-startup-0.105.0.md) evidence.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly retain permanent gap #9 and its limits.

## Revalidated live contracts

The current startup selector is `14000f4c0..14000f65f`. With no positional zone
or class, an exact-one `WOW_ROGUE_GLUE` value selects ordinary stock screens;
otherwise the custom picker is the default. A positional zone selects the
stock route, and a positional class adds the transient Tester row. The
selector's two negative niche tags represent custom and ordinary-stock startup;
they are not error codes. Its class factory, name-normalization call and
optional-sex field remain separate producers.

The environment owner `145889110..145889462` builds `WOW_USER=HERO`,
`WOW_PASS=survivor` and `WOW_HOST=azeroth.local`, then optional `WOW_REALM` and
`WOW_CHAR` entries. `1458ab720..1458ab746` resolves a zone argument through
`145885af0..145885c19` and reads the selected realm name from the current
twelve-row table. Matching is exact and case sensitive; unknown keys select
Elwynn. The embedding's `NativeStartup::configure_client`, fixed local login
and real GlueXML one-shot realm/character consumers retain these paths.

The current factory `1458aa470..1458ab4da` recognizes class keys with ASCII
case folding, falls back to Warrior, removes spaces from the *definition's*
race name and chooses only a race eligible for the selected class. It creates
`Tester`, GUID `0xffffff`, level 1, zero counters and appearance fields. All
nine current class/race admission slices are checked against `allowed_races`.
The source's process-lifetime row remains outside the saved roster. The separate
explicit-name/sex normalization, auth counts and talent/unlock bypasses retain
their historical evidence until their complete current dependencies are replayed.

Menu return is `1458a20d0..1458a2336`. It scans connection rows in order and
does nothing when none is active. For the first active row it invokes result
persistence, destroys a present game, sets its option tag to absent, clears the
retained pending result, clears the connection's active byte, sends empty
`SMSG_LOGOUT_COMPLETE` (`0x4d`), then publishes frontend `{"type":"logout"}`.
The current command table maps Again/Endless/Menu to tags 6/8/9. Menu reaches
this owner by a **tail jump**, not an E8 call. Again first persists, takes the
game option and marks it absent, then scans for the retained active connection;
an absent game returns without constructing a replacement. Its full replacement
factory and dependencies are outside this bounded check. Separate command 10
calls `1459394b0` for a present game before reaching the return owner; that
callee's complete behavior is not certified here. Packet logout also reaches
the return owner.

`gameplay/terminal.rs` still persists before dropping mechanics and calls
`finish_client_delivery` with distinct Menu/Again flags. That owner flushes
final messages while the VM is live; Menu publishes the real logout event and
retains Character Select, while Again retains the active client for replacement
mechanics. This is source tracing of the existing integration. The recovered
current startup/return subset exposed no supported source correction; no new
failure dialog, terminal color or reset policy was invented.

## Checks and remaining recovery

`python3 -B scripts/check-terminal-lifecycle.py` verifies the newest
installed target, all retained native/text hashes, current class/race admission
and realm-name dependencies, and selected live source connections. Its native
**212 native vectors** cover complete transient-row construction (144), exact
realm fallback (20), exact-one environment admission (6), startup-route admission
(8), Again's game-option take/absent gate (3) and the first-active/no-active Menu
gate (31). The terminal command-table destinations are checked separately.
The output retains each vector and its declared seams under ignored `runtime/`.
`--prepare-rea` stages fresh raw-function plans there for `scripts/rea-batch.py`;
it does not launch a provider or execute the game.
Source token checks supplement the manual producer/consumer tracing; they do
not execute Rust or prove complete source equivalence.

Ghidra imports use a generic raw x86-64 ABI and omit external callees. Original
Windows PE instructions corroborate arguments, literals and field offsets.
Allocator failure, thread/channel setup and failure, complete auth/network/crypto,
driver startup/reset errors, command 10's precondition and all indirect/global
UI painters or later hook mutation remain unresolved under #9/#41. Current
Menu ownership does not prove Again's complete constructor and result lifetime
or revalidate whole terminal layout/progression.

No compilation, compiling tests, game launch, input/rendering comparison or
original/rebuilt parity check was run. The parent gap remains open.
