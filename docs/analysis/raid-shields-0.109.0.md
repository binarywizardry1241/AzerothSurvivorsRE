# Boss and guardian shields — 0.109.0

This selected source portion of **#42** reconstructs native move 23: its defense
deadline, existing actor-aura publication, immediate self visual, exact warning
and deferred aura removal. It covers **five current records**: boss 1193's recurring
shield, guardians 811 and 1110 (alternate list 1), plus guardians 1311 and 1412's
health-phase shields. Current [wards](raid-wards-0.109.0.md),
[sequences](raid-sequences-0.109.0.md) and
[exposure crystals](raid-native-0.109.0.md) have their own connected consumers.
Original/rebuilt parity remains unverified.

## Current target and recovery

The installed target is 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/0.109.0/raid-shields/manifest.json) owns exact native
payload bits and six retained instruction ranges. Guardian bytes reference the
canonical current signature catalog. [REA provenance](evidence/0.109.0/raid-shields/rea-provenance.json)
records four completed Ghidra 12.1.4 queries through `./scripts/rea`: the move
producer, damage branch, actor aura helper and application-count helper.
Imports are bounded original-VA raw ranges with a generic ABI; they do not
establish global native ownership or execution.

| Current owner | Range, end exclusive | Recovered contract |
| --- | --- | --- |
| Native 23 producer | `145959aa1..145959bc4` | Overwritten shield deadline, add aura, deferred 37 removal, visual and warning |
| Deferred 37 branch | `14594ea43..14594ea7b` | Remove the recorded spell from the still-live source's aura slots |
| Raid defense factor | `145971998..145971a03` | Boss/guardian-only factor; exposure precedes protection |
| Hit product | `145971a45..145971a58` | Multiply after talent-adjusted power; retain native one-damage minimum |
| Actor aura helper | `145980540..145980c5e` | Same sixteen shared actor slots, first-free/deduplicate/remove, flags and applications |
| Application counter | `14590d560..14590d902` | Player-owner preference, live remaining ticks, 255 cap and packed byte groups |

The guardian reset continues to use its canonical current
[decision extract](evidence/0.109.0/guardian-signatures/decision.asm), which clears
the shield deadline while omitting the exposure deadline. This report does not
duplicate that owner.

## Native behavior and source connection

Native 23 is a **nonblocking** move. It overwrites actor `+1cc` with
`now + duration`, even when the previous deadline was later. It then adds the
spell through the actor's existing aura slots, queues a native 37 action for the
same deadline, sends the untargeted self spell visual and publishes the exact
raid warning `%s is shielded!`. It starts no timed cast and holds no movement.

Boss 1193 uses spell 25176 for **20 seconds**. Guardian 811 uses 22812,
guardian 1110, alternate list 1, uses 20619, and guardians 1311/1412, phase 0,
use 642; all four last **4 seconds**. The
current semantic 14 table preserves each native record independently.

The shared victim owner applies the defense factor only to a primary boss or
guardian. An active actor `+1d0` exposure deadline selects **1.5** first;
otherwise an active `+1cc` shield selects **0.25**. Equality is expired, and an
unordered deadline does not activate either window. Thus this shield reduces
incoming damage by 75%; it does not grant invulnerability. The final amount is
`max((talent_multiplier * power) * raid_factor, 1)`, in that multiplication
order. Multiplying the input power first can change single-precision rounding.
Native33 kind5 crystal resolution produces the exposure window at
`14595344a` and clears the shield deadline. The earlier report's native38 label
was incorrect: the deferred table has only native35/36/37 entries. Native22
ward defenses and lifecycle use their separately recovered actor owner.

`bosses/raid_shields.rs` owns the five semantic records, `RaidDefense` deadlines
and dispatch helper. It returns a `Removal` for the shared native 35/37 deferred
queue. Aura removal stays in insertion order with movement actions, and a dead
or missing source suppresses it. It removes the recorded spell without
clearing or rewriting the deadline; ordinary expiry is determined by the clock.
Guardian leash reset clears its shield deadline without changing exposure or
cancelling old queued removals. A later refreshed copy of the same aura can still be
removed by an earlier queued native removal, matching the original ownership.

The live adapter reuses `callbacks::State::aura_event` and its existing
`AuraSlots`; shields share the same slots with player-applied statuses. The
current helper publishes field `79 + slot`, flag group `99 + slot/8` with nibble 2
and application group `121 + slot/4`. Duplicate/full additions and unmatched
removals publish nothing. Application counts prefer player-owned active rows
of that spell, otherwise other owners; they store `min(count,255)-1`, saturated
at zero. Current instruction cases revalidate that existing source behavior.

## Static verification and limits

```sh
python3 -B scripts/check-raid-shields.py --check
```

The check passes five original record hashes and generated constants, six
native range hashes, retained Ghidra pseudocode hashes and **198 bounded native
instruction cases**: fifteen shield-deadline overwrites, 64 defense combinations,
60 rounded damage products, 32 aura-slot/flag cases, 24 application-count cases
and three shield-only leash resets. The same command checks the live dispatcher,
shared removal queue, aura slots, damage-factor call sites and guardian reset.
Native calls are rejected in these synthetic cases; map/packet allocation
remains an explicit external boundary. The victim source retains
its old `apply_hit` API through a default factor 1 path, while live raid hits
use its added multiplier lane.

All ten changed Rust files parse with the project `rustfmt --emit stdout`; the Python checker
parses with `ast.parse`. Three authored Rust regressions cover strict deadline/
exposure precedence, overwrite/reset, NaN handling, untimed shield presentation
and shared native 35/37 ordering after a late frame. They were intentionally not
compiled or run. Compilation,
runtime damage/aura presentation, original/rebuilt behavior, platform behavior
and parity remain unverified. [Native22 wards](raid-wards-0.109.0.md) and
[native33 shield-breaking crystals](raid-native-0.109.0.md) now reach their live
consumers; complete encounter validation remains under **#42**.

To recreate bounded Ghidra inputs without starting analysis:

```sh
python3 -B scripts/check-raid-shields.py --prepare-rea
python3 -B scripts/rea-batch.py runtime/raid-shields-0.109.0/reproduce/producer-plan.json
python3 -B scripts/rea-batch.py runtime/raid-shields-0.109.0/reproduce/damage-plan.json
python3 -B scripts/rea-batch.py runtime/raid-shields-0.109.0/reproduce/aura-plan.json
python3 -B scripts/rea-batch.py runtime/raid-shields-0.109.0/reproduce/applications-plan.json
```

The damage decompilation includes unrelated tail code; only its provenance/hash
and the necessary instruction ranges are retained. Raw imports, databases,
full responses and parser output stay under ignored `runtime/`.
