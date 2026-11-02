# Cooperative scaling — 0.127.0

This owns the source/static completion of **#239** for the installed 0.127.0
EXE, SHA-256 `3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/coop-scaling/manifest.json) binds current original
instruction/data ranges and the completed shared Ghidra spawning query.
[0.121.0 recovery](coop-scaling-0.121.0.md) retains its historical provenance.

Current native arithmetic uses two different counts. `Game+c88` is the actual
non-down hero count, clamped to at least one. Its excess above one is converted
to f32 and multiplied by 0.7 in the first three zones or 1.0 elsewhere.
`Game+a58` is the retained other-hero collection length. A nonempty collection
selects 0.8 from `1473ddb70`; an empty collection selects 1.0. The latter guard
is independent of the live count, including after a hero is down or abandoned.

| Consumer | Recovered current formula | Connected source |
| --- | --- | --- |
| Ordinary/elite HP | `(extra * 0.72 + 1) * party` | `PartyScaling.health[0]`, ordinary/minion spawn |
| Boss/guardian HP | `(extra * 1.04 + 1) * party` | `PartyScaling.health[1]`, boss/guardian spawn and engagement |
| Incoming player damage | `raw * ((extra * 0.064 + 1) * party)` | `damage_player`, before immunity/armor/absorption |
| Spawn density and live cap | `extra * 0.312 + 1` | Horde budget, top-up target and rounded `50 * density` cap |
| Private XP/gold | `1 / density` | Both immediate and transferred private rewards |

These are native f32 constants and operation order, rather than percentages
computed from release text. Health factors are visible in `145c09d38..09dac`,
ordinary creation `145c31628..3169d`, boss creation `145c450ef..45126` and
current guardian scaling `145c9dcf4..9dd5f`. Incoming damage uses
`145c123d8..12441`. Spawning `145c475e0..47633`, live-cap construction
`145c3138c..313e0` and private rewards `145be27f3..2851` independently bind the
new density coefficient. Party mode still gates these paths; solo remains one.

`Mechanics::party_scaling` now supplies retained `CoopSimulation.remotes`
presence separately from `live_heroes`. During `with_party_hero`, the selected
remote row is temporarily removed; a nonzero `active_slot` retains its presence
even when the remaining vector is empty. Host and guest private ticks therefore
use the same reduction in a two-player party. It preserves the existing actual
hero count producer, stable abandonment/context swap and actor rescale ordering.
This avoids conflating cooperative mode or a one-hero live count with an empty
party. The same native health lanes remain connected to the positive-health
rescale adapter; wards retain their existing copied-parent/scaled-health path.

The existing checker now verifies the current manifest and replays original
instruction factors for all twelve zones, one through five live heroes, and
zero/one/four stored other heroes: **180 cases**, with six arithmetic consumers
per case and 179 decoded instructions. The result is retained in
[static-check.json](evidence/0.127.0/coop-scaling/static-check.json). Zone lookup,
the already recovered live-count clamp and the CRT round call are explicit
fixture boundaries. Authored Rust regressions cover party presence independent
of live count and the updated spawn/abandonment/reward expectations. A connected
Mechanics regression compares both recipients' full factors with exactly one
remote, after that remote goes down, and after abandonment retains its row.

Compilation, Rust regression execution, actual game/client/network/server
behavior and original/rebuilt parity remain unverified. Static arithmetic
replay does not establish those checks.
