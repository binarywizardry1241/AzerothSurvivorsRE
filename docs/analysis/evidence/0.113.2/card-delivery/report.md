# Card command delivery and selection lifetime — 0.113.2

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
This selected AS contract belongs to #41 (`Q41-S01`/`Q41-M03`).
[CURRENT-STATE](../../../../CURRENT-STATE.md) owns overall status. The
[proof](proof.json) binds the selected current bytes, fresh REA/Ghidra queries,
native fixtures and source. [delivery.asm](delivery.asm) retains the canonical
selected instruction excerpts; complete disposable owner decodes remain under
`runtime/q41-card-delivery-0.113.2/`.

## Native input-to-consumer chain

The current [keyboard proof](../card-keyboard/report.md) establishes the actual
digit/Numpad aliases, typing admission, ascending digit priority and subsequent
R command. The earlier [pointer report](../../../as-ui-contracts-0.113.2-reroll.md)
owns pointer selection collection after its other row actions. These producers
call `1400dd4a0` with UI command **2** plus the selected index, or command **3**
for Reroll.

`1400dd4a0` locks the supplied shared interface and appends the entire
**232-byte** command to the vector at `+28/+30/+38` (capacity/pointer/count).
It performs no age test, choice acceptance or animation wait. The selected
server update `145868160` obtains a command vector through its existing UI
interface at `14586b5f5..14586b626`. Its loop
`14586b6ab..14586b6e5` advances by 232 bytes and copies each tag/payload in
order. After the separately bounded cooperative interception boundary declines,
commands 2/3 reach the ordinary local dispatcher `14587df60` through
`14586bda0..14586bdbf`. No cooperative behavior is implemented or reconstructed.

The dispatcher's table at `147018628` indexes the UI tag minus two:

| UI command | Lane | Actual local consumer |
| --- | --- | --- |
| 2, index at `+8` | `14587e30c..14587e333` | `CALL 14596f110` at `14587e328` |
| 3 | `14587e42e..14587e44a` | `CALL 1459729a0` at `14587e43f` |

Each lane first rejects an absent Game (`Server+10` tag 2). The selected lanes
have no animation clock or delayed-selection slot. The native accept consumer
checks active choice phase, a displayed index and a non-sentinel source, applies
the selected effect, refreshes it, then calls completion `145966b20` at
`145971182`. Its existing completion contract consumes the captured source and
either opens the next pending reward or clears the source/returns to playing.
The next queued Reroll therefore sees that resulting state: it can reject when
there is no offer, or reroll the next offer. It cannot cancel the preceding
accepted effect. The complete native accept/reroll/completion implementations
retain their owning recovery boundaries; this proof does not certify every
choice payload, mutable alias or generic UI implementation.

Fresh full-PE REA/Ghidra observations match all selected queue, loop, table,
dispatch and accept/completion call bytes. The virtual UI-interface identity,
lock ownership and full runtime resource lifetime remain explicit shared seams.
The observed ordering does not claim a worker latency, a native frame boundary
or an original/rebuilt scheduling comparison.

## Source correction

[`gameplay/mod.rs`](../../../../../crates/azeroth-survivors-re/src/gameplay/mod.rs)
previously processed R before digits, omitted Numpad aliases and delayed actual
`game.choose` until the visual exit. A later Reroll revision could suppress that
pending acceptance. This reversed the native transaction relation.

The source now collects admitted intents from one card input snapshot, then
delivers them in order. Pointer Reroll/Banish/Skip retain query order before the
deferred pointer Select; a preceding reroll changes the row the later Select
accepts. A pointer selection closes its UI before the source keyboard pass.
Otherwise keyboard input selects the lowest valid digit/Numpad alias and then
emits an affordable R from the same original snapshot, including after the
digit sets closing. Later backend transactions validate against the state left
by earlier ones. Pointer Skip cannot retroactively admit a keyboard R merely
because its reward makes the player able to afford a reroll.

Actual acceptance runs once in that delivery pass. The old visible root remains
through its independently recovered **0.32-second** exit, while the game already
owns the accepted effect and any following reward state. The exit gate only
reveals or removes the hierarchy; it never applies or discards a transaction.
Both that gate and
[`native_overlays::animate`](../../../../../crates/azeroth-survivors-re/src/gameplay/native_overlays.rs)
use `CHOICE_EXIT_SECONDS` (`3ea3d70a`). Replacement/teardown retires this retained
root and latch even during loading. Absent/dead/completed runs take precedence
over pending card presentation.

Fresh native timing recovery also corrects choice maturity to **0.45 seconds**
(`3ee66666`), separately from exit duration. The pointer comparison rejects an
unordered age; the keyboard's constant-first rejection admits it. Reroll keeps
its independent availability/affordability gate during entrance. Exact timing
and key-name evidence belongs to the keyboard proof.

## Checks and limits

`scripts/check-card-delivery-0.113.2.py` passes **12 native append cases** with
preexisting prefixes and both command orders, **15 native cursor/copy cases**,
and **242 native local-dispatch sequences** through length four with present
and absent Games. It verifies full command bytes, index preservation and
consumer order. Lock acquisition, copying, stack probing, command destruction
and final handler calls are declared fixture seams. Handler seams record
arguments/order; they do not simulate native acceptance effects.

The existing pointer checker now injects the actual recovered 0.45 threshold
and verifies its installed bytes. Its **80 button, 1,600 Reroll admission,
30 selection/closing and 96 offer-renewal cases** pass; these retain their
separate narrow instruction boundaries.

Authored Rust regressions cover all eight aliases, count/age/NaN and lower-index
priority, typing versus pointer input, simultaneous digit/R with and without a
next reward, pointer reroll before acceptance in either entity query order,
snapshot affordability after Skip, retained root through exit, exactly-once
application, and covered/uncovered teardown. They are **uncompiled and unrun**.
Both changed Rust modules syntax-parse through `rustfmt --emit stdout` without
altering source. No application build, compiling test, native game, actual
device/UI/rendering or original/rebuilt comparison ran. #41's broader semantic,
alias, resource-lifetime and runtime/parity requirements remain open.

Replay the checker with the existing Capstone/Unicorn paths. Fresh REA
reproduction uses the proof's exact seeds, query parameters, disabled analyzers
and original runtime plan, against the installed reference EXE, writing to a
new project-local output directory. Preserve new Evidence identities rather
than replacing the retained probe.
