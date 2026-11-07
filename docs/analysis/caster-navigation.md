# Caster sight and hostile bolt impact

This bounded #287 contract uses installed **0.127.0**, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [manifest](evidence/0.127.0/caster-navigation/manifest.json) binds exact
native ranges, three completed journaled Ghidra queries and the reused actor
owner. [Native cases](evidence/0.127.0/caster-navigation/native-cases.json)
record the permitted instruction checks. Historical ordinary AI and ground
navigation retain their original provenance; this report establishes only the
current interfaces and gates below.

| Native scope | Recovered contract |
| --- | --- |
| `145b98c90..145b98de4` | Sight uses the occupancy segment query. If the destination cell is exactly 1, first request the existing nearest-open interface with radius 2.5. Failure returns clear; success substitutes that destination before testing segment fraction >= 1. Unordered fractions fail. |
| `145c3d50a..145c3d654` | Ordinary definition tag exactly 1 requests sight from the actor's interpolated XY to its selected victim. No optional occupancy grid means clear. Other actor definitions retain their ordinary admission. |
| `145c3d654..145c3d69f` | A due cast clears casting state, then completes only when sight is clear and the definition's caster bit is present. It does not restart the attack delay. A blocked completion is consumed without launching a bolt. |
| `145c3d759..145c3d76e` | In-range attack admission additionally requires sight and the existing zone gate. Failure enters the ordinary movement deadline/path pipeline. |
| `145c3d9df..145c3da1d` | When sight is blocked and the victim is within attack range, chase radius becomes 1.5 instead of the ranged preferred radius. Out-of-range chase preserves its previous preferred radius. |
| `145c3e5f6..145c3e6d8` | Completed hostile casts retain the source's current launch xyz in a tag-1 optional position in the pending row. The 144-byte row retains its travel deadline separately. |
| `145c69b43..145c69c24` | After detaching due impacts, a hostile tagged row checks sight from its captured launch XY to the victim's current XY. Blocked sight drops that impact; an absent grid admits damage. Source removal/movement does not replace the captured origin. |

The ordinary actor owner is `145c3a1f0..145c401b9`; its completed query is
shared with the party-scaling/control repair. The due-impact owner is
`145c69940..145c6aa0b`. Their inferred raw-import ABI names are not original
source types; exact Win64 instructions bind the arguments and state fields.

`enemies/ai.rs` now applies these sight gates before attack/cast completion and
uses the existing chase refresh, zone clipping, 14-yard path search and movement
publication. A failed or unavailable path correction preserves the ordinary
destination semantics and the existing retry deadline. It does not create a
separate caster pathfinder or polling clock.

`floor_recovery/navigation.rs::sight_clear` connects the recovered endpoint
correction to the existing nearest-open and segment implementations.
`gameplay/world.rs` supplies the real native occupancy grid. Its missing-grid
case returns clear, matching the native optional-grid branch. Occupancy creation
continues through the existing MPQ world adapter; no replacement collision world
or additional generic engine subsystem is introduced.

`gameplay/mechanics/actor_frame.rs` captures launch xyz in the pending hit's
`HitContext::hostile_origin`. The due-hostile consumer in `mechanics.rs` tests it
against the live victim position before `damage_player`. Party hero state owns
its pending vector, so the producer and impact continue through that hero's
existing context. Unrelated friendly/proc pending rows have no hostile origin.
Bit storage preserves float values without changing the context's equality or
copy semantics.

`python3 -B scripts/recover-enemy-ai.py --check-current` verifies the current
input/range/query receipts and passes **100 native cases**: endpoint correction
and its failure, occupancy values/bounds, segment thresholds and NaN, range/zone
and sight admission, close chase radius, cast deadlines/completion, and captured
origin/grid/LOS impact branches. Nearest-open, segment and LOS calls are declared
seams when checking their callers; their complete algorithms are not certified
by those cases. Live source connection guards are also checked. The authored
Rust cases cover blocked chase/retry, re-admission when clear and completion
suppression. Changed Rust parses through rustfmt; Rust tests were not compiled
or executed.

Source integration is complete for this bounded finding. Compilation, actual
client/network execution, Arathi building geometry/rendering, moving-victim
visuals, and controlled original/rebuilt comparisons remain unverified under
[#287 in the verification register](../verification-needed.md#gap-287).
