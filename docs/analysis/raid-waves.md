# Concentric raid waves

The installed EXE SHA-256 is
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns the remaining **#42/#43** scope.
This report establishes selected native contracts and source connections, with
compilation, gameplay, rendering and original/rebuilt parity unverified.

## Native producer and current records

The [manifest](evidence/0.109.0/raid-waves/manifest.json) binds current native
move27 to producer `145958e3a..145959146`, its six payload words, five recurring
boss slots, three guardian signature slots and one guardian health phase. The producer's Ghidra evidence is
`ev_80cfbb2fcc905e884a1d637976f79982ef233ae88e39b17ddcb61c2b1f105e10`.
It comes from an original-VA raw import with this branch explicitly seeded;
external calls/data, indirect references and calling conventions require the
separately reviewed original instructions.

| Consumer | Native slot | Rings including first circle |
|---|---:|---:|
| Stitches | 1 | 4 |
| King Mosh | 1 | 5 |
| High Priest Venoxis | 2 | 4 |
| Azuregos | 3 | 4 |
| Majordomo Executus | 2 | 4 |
| Guardian1311 | 1 | 3 |
| Guardian1011 | 2 | 3 |
| Guardian1413 | 1 | 3 |
| Guardian1511 health phase0 | — | 3 |

Guardian records have one canonical copy in the
[guardian signature catalog](evidence/0.109.0/guardian-signatures/catalog.json).
Native shape0 is a circle and shape1 a donut; the marker serializer and damage
consumer own those meanings. Move numbers and shape numbers are separate enums.

The move stops its source for the configured windup and publishes a timed spell
start. The generic action gate uses `count * step + windup`, then the existing
block helper adds the native0.4-second gap. The current hold helper `145957320`, cast-start helper `1459577f0` and common
action-block extension `145957c3e..145957cd0` are retained at their current
addresses, rather than reusing historical RVAs. The source position is captured;
these waves do not follow subsequent movement or require the source to survive.
Each row receives its own terrain height sample and the shared wrapping hazard
serial.

The producer always creates a first circle, even for count0/1. Its radius is
`width`; it resolves at `(0 * step + windup) + now` and carries the configured
optional impact visual. For each subsequent index `i`, the annulus spans
`i * width` through `(i + 1) * width`, inclusive, and resolves at
`(step * i + windup) + now`. Later rings have no optional visual spell.
Collision uses the player's current XY at impact; Z is excluded.

The first circle has an unlimited warning lead. Each later ring limits its
warning lead to `min(step + step, 1.4)`. The shared hazard lifetime publishes it
only once the clock reaches `end - lead`; marker `t0` is
`min(now, max(birth, end - lead))`. This gate prevents distant rings from all
appearing immediately. All rows use the existing real marker receiver/geometry
path; the source adds no replacement world artwork.

The optional impact queue `1459527aa..145952808` passes an empty hit list
(pointer8, length0) and a ground target (native tag1, destination mask0x40).
The current serializer writes ordinary wire flags0x100 for empty ammunition;
R9d=8 is the empty-slice pointer, not a wire flag. It
publishes after creation messages and before reverse end messages. This is a
spell-go visual, separate from the windup spell-start and a custom cast widget.

## Source and checks

[The wave adapter](../../crates/azeroth-survivors-re/src/bosses/raid_shapes.rs)
connects semantic8 to the shared
[hazard lifetime](../../crates/azeroth-survivors-re/src/bosses/raid_areas.rs).
The historical seven-word port cannot carry six payload words plus a semantic
tag and cooldown. Its semantic8 record therefore carries an index into one
shared wave definition table, retaining the actual repeat in word6. Boss and
guardian consumers use the same implementation and independent native slots. The guardian1511 phase retains its native health
threshold/latch and `%s pounds the ground!` emote through the guardian phase
adapter, then dispatches the same wave implementation.
The common tick retains deferred marker publication, optional ground-target
spell-go, reverse end messages, clock publication and combined attributed damage.

Run the existing optional Capstone/Unicorn environment with:

```sh
python3 -B scripts/check-raid-waves.py
```

This hashes the selected target, checks all nine native/source payloads and
boss slot ordering, and executes **189 native producer cases plus189 native
duration-selector cases** with synthetic memory. Cases include all nine live
payloads, zero/one/multiple counts, multiple step sizes and clocks, wrapping IDs,
and primary/secondary/fallback height seams. A further8 native annulus
membership cases exercise both inclusive boundaries and unordered inputs;36
native tell-start cases check the bounded warning-window arithmetic. Hold, packet and height callees are
explicit stubs; their internals are not exercised by this checker. The exact
source constants and live hooks are traced separately. The
[Rust integration cases](../../crates/azeroth-survivors-re/tests/raid_waves_01090.rs)
cover phased warning publication, first-only impact visuals, inclusive annular
bounds, current player position and all five recurring boss slots; they were
not compiled or run.

Move28 is a distinct persistent donut pool with periodic ticks and a warning.
Its lifecycle and warning producer remain open. Other native shapes/kinds,
complete encounter phases and the custom boss cast-widget layout also remain
open. A timed creature cast start or these marker waves does not establish that
widget's appearance or interaction.
