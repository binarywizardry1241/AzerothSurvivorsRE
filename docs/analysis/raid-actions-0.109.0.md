# Warned cones and following knockback circles — 0.109.0

The selected source portion of **#42/#43** connects native moves **8 and 19**
through the shared live raid hazard vector. It covers **58 current recurring
records**: fifteen boss and fifteen guardian cones, plus thirteen boss and
fifteen guardian knockback circles. No current guardian health phase uses these
two tags. The [complete current action graph](raid-native-0.109.0.md) owns the
other move/phase families and nested uses of these contracts. Compilation,
encounter behavior and original/rebuilt parity remain unverified.

## Target and evidence

The installed 0.109.0 target is SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/raid-actions/manifest.json) owns exact original
byte ranges, current records and their payload bits. Guardian payloads reference
the canonical signature catalog instead of duplicating its native bytes.
[REA provenance](evidence/0.109.0/raid-actions/rea-provenance.json) records four
completed Ghidra 12.1.4 queries through `./scripts/rea`: the two producer branches,
shared constructor and knockback packet serializer. These raw imports use a
generic ABI and omit global references/external callees; instruction tracing
and bounded instruction cases establish the selected contracts independently.

| Native owner | Current range, end exclusive | Contract |
| --- | --- | --- |
| Dispatcher input fragment | `145957aef..145957b7c` | Captured player height and current source-to-player aim |
| Cone producer | `145959bc4..145959ceb` | Native8 payload, cone, facing hold and separate visual |
| Following circle producer | `145957f34..145958025` | Native19 payload, follow ownership and knockback speed |
| Shared hazard constructor | `1459575e0..1459577e7` | Ground height, serial, captured start/end and shape |
| Delayed visual constructor | `14594e230..14594e2d3` | Independent source/spell/position/deadline vector |
| Knockback selection | `14595056b..1459505b9`, `14595105e..145951086` | Positive speed; strict one-yard direction fallback |
| Knockback publication | `145952fed..145953120` | Last qualifying hit; playing-phase check after damage |
| Knockback packet | `1458c1c70..1458c1f35` | Opcode239, packed GUID, shared player-move serial, launch floats |
| Delayed visual consumer | `14593874c..1459388cb` | Runs after shared hazards, independent of source liveness |

The native duration helper remains the canonical
[wave evidence extract](evidence/0.109.0/raid-waves/duration.asm); this repair does
not duplicate it. Shared constructor instructions use the canonical
[line constructor extract](evidence/0.109.0/raid-lines/hazard-constructor.asm),
while the separate Ghidra pseudocode remains with this scope.
Current native jump-table bytes and every selected move's
duration are checked against the installed target.

## Recovered behavior

Native8 stores `(spell, range, angle_degrees, windup, damage_factor)`. Dispatch
faces the actor toward the captured player, holds movement for `windup + 0.3`,
starts the spell for `windup`, and applies the common action gate using the
unextended windup. The cone stays at the original grounded source position.
Range is inclusive and checked first; distance strictly below one yard admits
the player regardless of angle. Otherwise the wrapped angle difference must be
within half of the native full radian arc, inclusively.

The cone's eventual spell is a separate delayed ground visual. Its XY is the
original source plus half the range along the captured aim. Its Z comes from
the dispatch prefix's **player** primary-height sample, falling back to player
Z. It is neither the cone's grounded Z nor a new midpoint terrain sample. The
visual persists after source removal. Shared hazards resolve and publish their
markers, visuals, aggregate damage and optional knockback before this separate
visual queue is consumed. A due visual is removed without skipping the next
entry; an ordered `now < deadline` is the only deferral branch.

Native19 stores `(spell, radius, damage_factor, horizontal_speed)`. It starts a
1.3-second cast/hold and follows the living actor's grounded position. Source
loss cancels the circle and its eventual impact visual. At expiry it emits the
spell at the current center and tests the current player XY against the
inclusive radius. A positive speed on a hit replaces the shared pending
knockback. Distance at least one yard chooses `atan2(player-center)`; nearer
points use the hazard's stored angle, zero for this family.

The native owner sends at most one knockback after all hazard hits and their
aggregate damage. The last qualifying hazard supplies its direction and speed,
even when its damage is zero. The owner rechecks run phase `Game+ac7 == 1`
(playing), then consumes the prior value of the player movement serial at
`Game+548`. This is separate from creature movement serials. Opcode239 carries
packed player GUID, u32 serial, `cos(angle)`, `sin(angle)`, horizontal speed,
and **-7.0** vertical speed. The existing real client controller consumes that
launch; no substitute server teleport is inferred from this owner.

## Source and static checks

`bosses/raid_actions.rs`, included under `raid_areas`, owns the current semantic10
record table, two producers and independent delayed visual queue. The parent
dispatcher/schedulers retain current native ordering and cooldowns; the shared
hazard lifecycle owns marker IDs, collision, follow cancellation and damage
aggregation. The live movement adapter owns knockback phase/serial routing.

```sh
python3 -B scripts/recover-raid-actions.py --check
```

The check verifies all 58 original record hashes/payloads, eleven instruction
ranges, generated source constants, retained Ghidra pseudocode hashes and
**265 bounded original-instruction cases**: 174 producer cases, 58 duration
dispatches, fifteen post-hit direction cases and eighteen packet serializer
cases. External height, hold, constructor, allocation, packed-GUID and CRT
operations are explicit synthetic seams, not executed game behavior. The
source guards are not a Rust type checker.

Two Rust files parse with the project `rustfmt --emit stdout`; the Python
recovery script parses with `ast.parse`. Four authored Rust integration
regressions cover cone range/near-center behavior, separate height/visual
ordering, current-source circle hits and dead-source cancellation. They were
intentionally not compiled or run. Compilation, actual assets/rendering,
original/rebuilt behavior, audio, platform behavior and parity are unverified.

Recreate the bounded Ghidra inputs without starting analysis:

```sh
python3 -B scripts/recover-raid-actions.py --prepare-rea
python3 -B scripts/rea-batch.py runtime/raid-actions-0.109.0/reproduce/dispatch-plan.json
python3 -B scripts/rea-batch.py runtime/raid-actions-0.109.0/reproduce/hazard-create-plan.json
python3 -B scripts/rea-batch.py runtime/raid-actions-0.109.0/reproduce/knockback-packet-plan.json
```

Raw imports, databases, protocol output and parser output stay ignored under
`runtime/`. `--write` stages curated evidence there for review before promotion.
