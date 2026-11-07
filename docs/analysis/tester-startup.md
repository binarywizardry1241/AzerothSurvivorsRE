# Optional Tester startup

This report owns the optional startup/roster source portion of **#9**, separate
from the `WOW_ROGUE_SHOWCASE` mode. Current integrated status and runtime limits
belong to [verification-needed](../verification-needed.md).

Target: `AzerothSurvivors/AzerothSurvivors-0.105.0.exe`, SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
The [manifest](evidence/0.105.0/stock-frontend/tester/manifest.json) binds the
current factory, zone parser, positional caller, publication and login gates.
Its shared references preserve the existing canonical roster/terminal/showcase
extracts. Fresh Ghidra pseudocode is retained for the factory and zone parser;
original Windows PE assembly establishes arguments and fields.

## Native startup and live consumers

`140001250` removes argv[0] and reads positional arguments in this order:
`zone [class [race [name [female]]]]`. A supplied second argument activates
Quick Start. `14000ff00` uses its current class/race row factory, optionally
replaces the default name through `1458912a0`, applies the fifth argument's
sex flag and calls ordinary engine startup `145878d40`. That owner publishes
`WOW_REALM` and, for a selected character, `WOW_CHAR`. A lone zone selects the
ordinary frontend/realm without creating a transient character.

`startup.rs` now supplies that process mode and process-lifetime optional row.
The exact lowercase zone keys are `elwynn`, `duskwood`, `wsg`, `ungoro`, `ab`,
`feralas`, `arena`, `sm`, `av`, `brm`, `aq`, `naxx`; every unrecognized value,
including uppercase or whitespace variants, selects Elwynn. Class keys compare
with ASCII case folding and unknown classes use Warrior. Race matching removes
spaces only from the native English race definition, then compares with ASCII
case folding: `nightelf` matches, while `Night Elf` does not. An absent,
unrecognized or disallowed race uses the class's first allowed race. The nine
ordered eligibility tables are checked directly against this target.

The factory's defaults are `Tester`, GUID `0xffffff`, level one, male sex,
zero appearance and zero remaining result counters. A valid fourth name is
trimmed, limited to 2..12 ASCII letters and title-cased; invalid input retains
`Tester`. Only ASCII-case-insensitive `female` as the fifth token changes sex.
The existing reconstruction-only named switches such as `--data-dir` and
`--zone` remain available; `--zone` retains its separate developer entry path.

`stock_frontend.rs` seats the optional row in `MenuState`, includes it in the
auth connection's captured roster count and prepends it to each current-zone
roster projection. The ordinary GlueXML manager, preview and actual Enter World
verb still own presentation and entry. Local roster replies bypass network
`CharListMessage`, so the shared engine now exposes the existing one-shot
character policy to that adapter and schedules its existing `enter_run_pick`
consumer in local stock mode. The one-shot clears after the first pick; terminal
Menu returns to ordinary selection instead of automatically reentering.

Addressed selection, identity validation and Again use the optional row before
permanent saved rows, preserving native ordering even with a duplicated GUID.
Neither initial entry nor Again writes it into Save or changes the independent
custom Pick. Delete keeps native saved-row deletion semantics; it does not
remove the process-lifetime optional row.

The GUID-specific login gates are independent of showcase:

- `14589cda3..14589cdbf` bypasses the saved class/zone unlock restriction for
  `0xffffff`. The source's unrestricted selected connection zone reaches
  `begin_roster_enter` and the ordinary live world entry without a later clamp.
- `14589ce9a` retains the normal equipment projection. `14589cea0..14589cedf`
  supplies empty saved talent allocation for this row. The live mechanics entry
  now preserves that distinction.
- Existing result admission excludes `0xffffff` from per-run feats, terminal XP,
  class result/progress and saved-character result writes. The
  equipment queue is still drained for presentation, but current pickup admission
  `1458972e7..145897393` does not insert new account equipment ownership for
  this sentinel. Its existing worn equipment remains projected. Seen-ability
  persistence is a separate owner and is not certified by these login gates.
  No sentinel row is materialized in the saved roster.

## Static checks and remaining limits

`python3 -B scripts/check-tester-startup.py` passes **164 bounded native
vectors**: 144 complete factory class/race cases and 20 exact zone-parser cases.
The checker verifies all nine current native eligibility tables against the
reused source, rehashes retained native/text ranges, checks current
startup/name/sex/login/environment instructions and traces the live source
connections separately. Factory vectors use declared allocation/vector-growth,
byte-copy and optional ASCII-comparison seams; they do not execute native
allocators, native callees, files, sockets or a game. Allocator failure behavior
is outside their scope.

Rustfmt parsed the edited Rust owners without compiling; `git diff --check`
passed. No builds, compiling tests, game launches or original/rebuilt interaction,
rendering or packet comparisons were run. Complete native startup/error/reset
ownership and terminal visual indirect/global hooks remain separately open
under #9/#41. These static/source connections do not establish full frontend or
terminal parity.
