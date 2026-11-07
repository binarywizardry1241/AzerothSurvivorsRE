# Ordinary stock frontend

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the ordinary frontend source portion of **#9**. Integrated
status and remaining validation belong to [verification-needed](../verification-needed.md).

## Startup and ownership

With no explicit zone quickstart, exact `WOW_ROGUE_GLUE=1` now installs the
engine's ordinary GlueXML frontend. The existing default custom picker remains
the other process mode. The selected-target [return binding](terminal-return.md)
owns this exact environment switch; startup `145878d40` supplies the ordinary
engine `--username=HERO`, `--password=survivor` and `--realmlist=azeroth.local`.
The source local bridge begins the normal glue manager's login using those
fixed local credentials. It starts no socket worker.

The [native SRP contract](evidence/0.105.0/terminal/stock-realms/auth-contract.json)
binds client normalization, fixed server credentials and both proof outcomes.
The native client normalizes 1..16 printable ASCII bytes to uppercase,
without trimming. The local server derives its proof from the submitted
account and fixed `SURVIVOR` password, accepting any normalized account name.
The offline adapter preserves the resulting credential predicate: a different
password or invalid normalization follows the existing manager's ordinary
transport-failure path (`refusal: None`, login state 5/result 0x14). The native
server does not issue an invented wrong-password rejection byte; its success
reply fails the native client's M2 check instead. The source adapter reproduces
that logical outcome without opening an SRP socket.

The real patch-chain GlueXML and its existing manager retain login, realm
selection, character selection/creation, dialogs, selection indices and the
character model pane. The local backend answers that manager's ordered
operations; it does not build a replacement character screen. The same local
client still owns the ordinary controller and in-world FrameXML lifecycle.
Local replies also seat the shared client roster, realm and pending character
identity, so ordinary addon enable state, per-character saved variables,
macros and loading-screen consumers see the same addressed row. The normal
network sender and local Enter share a memory-only pick preparation helper.
The custom picker, scene and preview are suppressed in stock mode, including
its independent custom menu music publisher.

## Recovered local backend contract

The [realm proof](evidence/0.105.0/terminal/stock-realms/contracts.json) binds
twelve realms in the selected-target zone order. Each uses its actual zone
name, `azeroth.local:8085+index`, PvP type 1, flags 0, category 1, a one-based
realm ID, and native `f32` difficulty squared for population. The auth
connection captures `min(projected roster count, 255)` once. Later realm-list
refreshes retain that auth snapshot after character creation/deletion.

The world listener `145896880..1458968f9` derives the connection zone from
port minus 8085; an out-of-range value uses index zero. It copies that zone's
key into connection `+98/+a0`. Ordinary enumeration and login use this
connection key, independently of the custom saved Pick. [Roster recovery](evidence/0.105.0/stock-frontend/roster-projection-manifest.json)
owns the factory's ordered projection and selected-zone map/area/position.
The displayed level is `clamp(best_level, 1, 60)`. The shared source equipment
projector now feeds both the ordinary roster and the in-world player. Native
wire fields for flags, first login and all three pet values are zero.
The native iterator can also prepend a transient `Tester` row. Its producer
`1458b7e58..1458b7ee9` is called by the explicit startup character-option path;
it is independent of the `WOW_ROGUE_SHOWCASE` game factory flag. The
[showcase report](showcase.md) records its fields and caller. The
[startup connection](tester-startup.md) now accepts the native positional
zone/class/race/name/sex arguments, prepends this process-lifetime row, counts it
in the auth snapshot and addresses it through entry/Again. Its sentinel login
bypasses zone unlock and saved talent allocation while retaining gear. The row
is never appended to Save; ordinary saved rows retain their order.

The current packet owner `14589b380` dispatches opcodes 0x36/0x37/0x38/0x3d
to Create/Enumerate/Delete/Login. The [backend manifest](evidence/0.105.0/stock-frontend/backend-manifest.json)
binds the relevant original instructions and Ghidra owners:

- Create normalizes trimmed 2..12 ASCII letters to title case. Failed names
  return 0x45 for empty, 0x46 for one Unicode scalar, 0x47 for more than twelve,
  or 0x48 for other invalid names. Duplicate names are checked before the
  ten-character limit, returning 0x31 and 0x34 respectively. Success appends
  the selected appearance bytes with GUID `max(saved GUID)+1` (wrapping u64;
  empty roster starts at 1), result fields `[1,0,0,0]`, persists and returns 0x2e.
- Delete removes every matching saved GUID, preserving other row order and
  account records. It persists even when no row matched and returns 0x39.
- Login addresses the selected GUID directly. The source carries that saved
  identity through the run and terminal result, without issuing custom Pick
  command 11. A requested locked zone falls back to the class's highest
  unlocked zone, as `14589cdbf..14589ce59` does. Both frontend modes use the
  shared normalized Pick modifiers: `14589cf15` loads the four-u16 word from
  Game `+cd0`, and `14589d0b5` copies it to the run specification at `+fe0`.
  Character identity and the connection zone remain independent of that Pick.

The source owners are `stock_frontend.rs`, the existing Save/MenuState owners,
and `benilla-app::local_client::stock_frontend` plus the glue manager's offline
transport branch. Menu logout retains the ordinary client CharSelect
destination; its terminal label is Character Select. Again starts the same
addressed saved character and zone without overwriting the custom Pick. Final
packets flush while the old client identity remains live; the paused client and
FrameXML VM remain seated until the replacement run is fed, avoiding an
intermediate character-select transition.

## Static checks and limits

`python3 scripts/check-stock-backend.py` passes **27 bounded native
vectors** and rehashes seventeen original byte ranges. Those vectors execute only
original leaf instructions: GUID maximum/order/wrap, Unicode scalar counts
and invalid-name statuses, the permanent roster count boundary, and the shared modifier-word transfer. Native
callees never execute; name-error cases supply the failed-normalization outcome
and already-trimmed input. [Retained results](evidence/0.105.0/stock-frontend/backend-vectors.json)
state those limits. Separate roster and realm checkers own their respective
current-target table and instruction assertions. The realm recovery checker
also passes twelve credential-boundary vectors against unchanged native
normalizer instructions.

Rust regression source covers creation order, normalized identity, failure
precedence, raw appearance, row defaults, GUID overflow and preservation of
unrelated progress, memory-only client pick seating and the active-client Again
boundary; it has not been compiled or run. Rustfmt parsed the changed
Rust owners without compilation, and `git diff --check` passed. Raw Ghidra
imports use a generic x86-64 ABI; original Windows PE assembly corroborates
arguments, fields and constants. No compilation, game application, live
packet/input check or original/rebuilt visual comparison was performed.
Those deferred checks keep full #9 parity open.
