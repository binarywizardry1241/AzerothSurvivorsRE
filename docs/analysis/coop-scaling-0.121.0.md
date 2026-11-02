# Cooperative scaling — 0.121.0

The installed 146,088,960-byte EXE has SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the source/static portion of permanent finding **#239**.
[verification-needed](../verification-needed.md) owns overall completion and remaining gaps.
The [manifest](evidence/0.121.0/coop-scaling/manifest.json) binds exact original
code/data and five completed Ghidra queries, including the shared affix/spawning
query. Raw subjects are verified against their original positions in this EXE.

## Recovered contract and source connection

The actual non-down world-hero count at `Game+c28` is clamped to at least one
by `145bc354b..145bc355e`. Transport connections and lobby capacity do not
select these factors. Zone lookup `145a9c190` supplies the index; the first
three zones use `0.7f`, and all others use `1.0f`. Define `extra` as the f32
conversion of `count - 1`, multiplied by that zone coefficient.

| Consumer | Current original arithmetic | Connected source |
| --- | --- | --- |
| Ordinary and elite HP | `1 + extra * 0.72f` | `coop::scaling::PartyScaling`, existing ordinary/minion spawn adapters |
| Boss and guardian HP | `1 + extra * 1.04f` | The same shared factors, existing scheduled boss/guardian and engagement adapters |
| Incoming player damage | `raw * (1 + extra * 0.064f)` | `mechanics/incoming.rs::damage_player`, before immunity, armor, absorption and reactive effects |
| Horde budget | `budget + delta * ((rate * pressure) * (1 + extra * 0.48f))` | `enemies/spawning.rs::advance_budget_with_expf` |
| Ordinary top-up target | `min((minutes * 1.6f + 4) * boss_factor, 36) * (1 + extra * 0.48f)`, then truncation | `population_target`; native cooperative per-tick top-up cap remains three |
| Total live-actor admission | `round(50 * (1 + extra * 0.48f))` | `TickInput::population_limit`, ordinary and timed-wave admissions |
| Private XP/gold grants | Reciprocal of `1 + extra * 0.48f` | `mechanics/coop.rs::party_reward_factor`, immediate and recipient-private accumulated rewards |

The current constants are read from their actual consumers, not calculated
from the release note. Packed HP lanes at `14768f410` contain `0.72f/1.04f`;
the early-zone/density table is `14730e4f0`, and incoming damage reads
`14768f428`. Ordinary constructor `145c14ae0` and boss constructor
`145c4e9e0` independently confirm the HP lanes. Incoming owner `145bcdcf0`
applies its factor before checking live immunity/aura and armor paths.

Disconnect owner `145bc5ff0` refreshes actual hero state before and after
abandoning the selected hero. It computes new/old HP ratios with those same
two lanes. Actor membership `+18` or `+58` being present selects the special
lane. Only strictly positive-health actors are rescaled. Maximum HP has a
one-HP floor; health is clamped between one and the resulting maximum. The
existing source preserves allocation order and the native maximum/current
field publication. Dead and unordered-health actors remain unchanged.

The budget factor follows death-pressure acceleration; inserting it into
the rate used to calculate acceleration changes behavior. The live cap is
rounded after multiplication, and has no historical `50..120` clamp in the
current cooperative constructor. Top-up applies its factor after the 36-unit
cap and before integer conversion. These orderings are retained in source.

The old four-percentage Run Options interface is separately owned by **#219**.
Its retained solo input and catalog evidence are not current difficulty proof.
The adapter carries the current cooperative factor separately, without
converting it to an integer percentage. With the normal 100% legacy input,
the connected party arithmetic matches the recovered contract. Full current
Heroic difficulty/input replacement and its interactions retain their own
open source obligations; this report does not certify them.

## Static verification and limits

Run the existing project Python dependencies:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-coop-scaling.py
```

The [result](evidence/0.121.0/coop-scaling/static-check.json) verifies current
target identity, 12 exact instruction ranges, 11 data ranges, every saved query
subject and the live source connections. Original-instruction synthetic replay
covers all twelve zones and one through five live heroes, the zero-count
producer clamp, and disconnect ordinary/boss/guardian membership with dead,
unordered, below-one and ordinary health inputs. The zone-helper return and
CRT round boundary are explicit fixture seams. These checks execute no game,
client, service or server and compile no application.

Source compilation, actual float/CRT behavior, live scheduling and combat,
network replication, presentation and original/rebuilt parity remain unverified.
Heroic admission and private mark/clear wire fields belong to **#238**, not to
the arithmetic evidence here.
