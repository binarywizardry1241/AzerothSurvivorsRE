# Terminal startup failure and abandonment — 0.108.0

Target: installed **0.108.0**, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
The [manifest](evidence/0.108.0/terminal-errors/manifest.json) binds fresh Ghidra
12.1.4 imports, independently decoded instructions, constructor dependencies
and data to these exact bytes. Historical
[0.107.0 lifecycle evidence](terminal-lifecycle-0.107.0.md) retains its own target.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own permanent gap #9 and current scope.

## Startup failure ownership

Current driver `1458e7cc0..1458e7e15` creates a thread named `rogue-server`.
A failed name allocation reaches the allocation-error owner. The thread builder
returns either its join state or an OS error. Success closes the detached native
handle and releases retained join state; it does not wait for server completion.
A spawn error reaches the expect-panic owner with `spawn the rogue server thread`,
the original error and `crates/wenilla-rogue/src/driver.rs:26:10`.
There is no recovered custom error dialog or retry branch in this owner.
The builder's result conversion at `1458e0854..1458e08b1` corroborates the nullable
success-state representation used by the driver.

The source embedding runs its local simulation inside the existing Bevy/client
schedule and has no corresponding `rogue-server` thread. The recovery therefore
adds no invented thread failure UI. Native worker execution, server receive/send
failures and complete startup/authentication/channel failure ownership remain
open. This bounded driver owner does not certify those omitted paths.

## Command 10 and the shared stop owner

The current command table maps tag10 to `1458b573f`. An absent game goes directly
to the Menu return path. For a present game it calls `145944640`; a true return
keeps the game alive for its terminal screen, while false reaches Menu return.
The callee admits exactly phase bytes **1..=3**. It destroys pending choice rows,
clears their count, sets the deliberate-departure byte and terminal phase4,
resets selection to `0xff`, captures the current clock, calls the shared movement
stop owner and queues the terminal result. Phase0 and all phase bytes outside
1..=3 return false without these mutations. The result constructor receives its
`defeat` default separately from the deliberate-departure flag; the existing
result projection retains the `left` distinction.

The stop owner `14591da20..14591e17d` visits three native collections in order:

| Native collection | Current producer and layout | Connected source |
| --- | --- | --- |
| Hostile actors | Game+560/+568; stride0x1d8; GUID+f0; motion+174 | Ordinary actors and guardians in `Mechanics.actors`, plus `Mechanics.bosses` |
| Combat followers | `14595f810` appends Game+d0/+d8; stride0x78; GUID+20; motion+40 | Ordinary pets and special demons |
| Loot companions | `14593ebe0` appends Game+940/+948; stride0x70; GUID+38; motion+40 | Account loot companions, including Sapphiron |

Live hostile actors require a positive movement duration and a deadline strictly
after the current clock. Combat followers use the same duration/deadline gate.
Loot companions first test `now >= deadline`; a future zero-duration row uses
its destination. Their operand order also admits unordered comparisons, unlike
the hostile/follower gates. Each admitted row samples its current interpolation,
queries only primary terrain height and retains interpolated Z on a miss. Both
endpoints become that point, the new start is now and duration becomes zero.
Combat/loot next-update clocks also become now. Dead/expired hostile movements
and expired followers remain untouched. Each admitted row increments the one
wrapping movement serial and queues the existing stop-movement packet.

`mechanics/terminal_movement.rs` now supplies this shared live operation.
Deliberate departure calls it from `Mechanics::abandon`; pause End Run and the
started logout/quit callers supply the resident native floor cache. Their
existing `session.started` gates exclude ready phase0. Victory also calls the
same owner with its live terrain provider, replacing the previous two loops
that neither sampled primary height nor emitted stops and omitted followers.
The existing `StoppedMovement` event reaches the normal MonsterMove stop
consumer; paused terminal screens still drain that event buffer.

The adapter splits the native hostile and combat-follower arrays into separate
source collections. It restores their interleaving using the shared creature
GUID's allocation serial relative to the current counter. Current follower
retirement compacts later rows stably (`14592b6ed..14592b795`), and reviewed
actor producers append to their shared native vector. A survivor spanning a full
low-24-bit GUID cycle (over 16 million allocations) cannot have its true age
reconstructed from that GUID. Complete indirect collection mutation/lifetime
and packet-order parity remain open; no runtime equivalence is claimed.

## Checks and limits

`python3 -B scripts/check-terminal-errors.py` verifies the newest installed
identity, all retained native/text hashes, driver panic context/location, command
table and live source connections. **354 original-instruction vectors** cover allocation
and thread-spawn outcomes; every phase byte; present/absent command10 routing;
all three movement families; death, expiry and exact boundaries; primary-height
hit/miss; future zero/negative duration; unordered values; and shared packet
ordering/serial wrap. The checker explicitly intercepts allocators/vector growth,
primary height, packet construction, choice destruction and result JSON creation.
No native application, OS thread or external callee executes. Its source token
checks supplement manual producer/consumer tracing and do not execute Rust.

Eight changed Rust files parsed with the project `rustfmt`. Compilation,
compiling tests, game launches, interaction/rendering comparison and
original/rebuilt parity were intentionally not run. The parent gap stays open.
