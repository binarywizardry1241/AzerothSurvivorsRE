# Ice Barrier capacity

The selected installed EXE has SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
Spell 11426 uses an Ice Barrier balance at Game `+0x570` within total absorb
at `+0x56c`. The active spell reservation remains at `+0x540/+0x544`.
[Instruction ranges and hashes](evidence/0.139.2/ice-barrier.json)

| Transition | Native owner | Source behavior |
| --- | --- | --- |
| Own cast | `0x145f404c2`, `0x145f40c1a`, `0x145f414e4` | An existing same-spell aura rejects the cast. An admitted cast removes the old Ice Barrier balance, applies the normal reservation replacement for other spells, and puts a fresh capped amount into both total absorb and the Ice Barrier balance. The new amount is reserved as spell 11426. |
| Party delivery | `0x145f414f8`, `0x145eda22f`, `0x145eda603` | Kind 15 carries the caster's uncapped coefficient and scaled duration through the existing party queue. The recipient multiplies the coefficient by their own maximum health and adds up to the remaining Ice Barrier capacity. The spell aura refreshes even when no capacity is available. A party shield only seeds the ordinary reservation when no spell already holds it. |
| Incoming damage | `0x145ef10a6`, `0x145ef1238`, `0x145ef129c` | Absorbed damage reduces total absorb and the Ice Barrier balance. Ordinary reservation depletion can remove the aura while leaving a positive Ice Barrier balance. Total depletion clears both balances. |
| Expiry and frame clamp | `0x145ee3a75`, `0x145ee3bef` | Ice Barrier expiry subtracts the full remaining Ice Barrier balance. If the expired aura also holds the ordinary reservation, clear that reservation once. The frame clamps the Ice Barrier balance to current total absorb. |
| Stat refresh | `0x145eefe8c` | When maximum health falls below the counted balance, subtract the excess from total absorb. Clamp the associated spell reservation to the resulting Ice Barrier balance and Soul Link to the resulting total. |

The source reuses the [party shield recipient](../../crates/azeroth-survivors-re/src/gameplay/mechanics/shared_healing.rs),
[buff and expiry handling](../../crates/azeroth-survivors-re/src/player_abilities/behavior/buffs.rs),
and [incoming damage](../../crates/azeroth-survivors-re/src/player_abilities/behavior/incoming.rs).
Both the [live stat refresh](../../crates/azeroth-survivors-re/src/gameplay/mechanics/effects.rs)
and the [mid-frame callback refresh](../../crates/azeroth-survivors-re/src/gameplay/mechanics/callbacks.rs)
apply the same maximum-health limit.

The selected PE ranges and Rust syntax passed static checks. The new
party regression covers shared capacity, reservation depletion, own replacement,
damage, a maximum-health reduction, and aura expiry. Compilation and gameplay
validation remain open.
