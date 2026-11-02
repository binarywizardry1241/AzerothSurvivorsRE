# Raid ground-effect source lifetime — 0.115.0

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This repairs **HAZARD01 / #42**: fixed ground attacks previously continued after
their boss died. [verification-needed](../verification-needed.md) owns the remaining encounter
and comparison requirements. The selected EXE is read in place; no game or
compiler is used by this recovery.

## Recovered contract

The current hazard owner is `145922f90..145928348`. Before any kind-specific
operation, its common loop at `145923d55..145923e05` searches the actor vector
(`Game+578/580`, stride `1e0`) for the hazard's captured source GUID. Hazard
records use the shared `Game+5a8/5b0` vector, stride `80`, source GUID at `20`.
The search compares actor GUID at `f0` and skips state `1` at `b0`. No actor,
no matching GUID, or only dead matches queues the original hazard index for
removal at `145924020`; an eligible match proceeds to movement and kind dispatch.
This gate applies to fixed and following shapes, unarmed and active effects,
and published and unpublished markers alike.

The common hit/death owner `14594edf0..14595243f` writes state `1` at
`145950005`, then records the death time at `b4`. Existing source death owners
already set `actor.dead`; `gameplay/mechanics/bosses.rs::raid_source` searches
primary, ordinary/guardian and ward actors while excluding dead rows. The new
hazard gate reuses that live interface rather than introducing another death
registry or changing actor callbacks.

Common removal at `145927064..145927198` snapshots the optional object GUID
and publication flag, compacts the shared vector, queues destruction for a
nonzero object GUID, then enters marker-end serialization only for a published
row. The surrounding owner sorts/deduplicates removal indices and visits them
in reverse order. Ground-object removal is independent of marker publication;
unpublished cancellation does not create an `hzend` message.

The separate delayed visual queue at `14592b940..14592babe` retains its own
consumer and lifetime (`Game+5d0/5d8/5e0`, 32-byte records). A
captured spell presentation is distinct from an active ground hazard and its
damage; cancelling every delayed visual would alter that separate contract.
Static source tracing finds no live writer of the separate historical impact
queue: current schedules and the recursive registry omit its GroundArea/Charge
semantic adapters, while live circles/volleys/lines enter the common hazard
queue. That unused legacy interface is preserved. Other raid
producer/catalog/stateful/actor proofs retain their documented
historical targets; this common-loop repair does not promote them wholesale to
0.115.0 or establish whole-image type/alias/source closure under #41.

## Connected source

`bosses/raid_areas.rs::tick_areas` now checks every row's source before position
updates, extra-state advancement, damage, occupancy, grouped towers, spawns,
visual generation or marker publication. Previously only following rows made
that check. Fixed circles, volley landings, waves, bombs, pools and extra shapes
therefore use the same recovered cancellation boundary.

`Area::removal` transfers an Aftershock's optional ground-object GUID into the
shared removal record. Death cancellation and natural expiry both destroy that
object exactly once, immediately before the row's optional `hzend`, in reverse
original-index order. This also prevents losing an active object's GUID when
its source disappears. Surviving hazards still publish before the removal pass;
the ordinary clock/movement/occupancy message and subsequent damage retain
their stage order. Delayed action visuals remain in their separate queue.

Hazards resolve in the existing pre-actor effects stage. Death later in that
frame becomes visible at the next hazard stage; no eager death-callback clear
is added. Existing request/recursive action source gates remain in place.

## Static checks and limits

`scripts/check-raid-death.py` binds the full installed identity and exact
instruction bytes to synthetic native source-search, removal-index, death-state
and object/publication fixtures. **875 isolated native profiles** pass: 375
source GUID/state cases, four index boundaries, twelve cancellation appends,
252 removals, sixteen death writes and 216 complete delayed-visual queue cases.
The [manifest](evidence/0.115.0/raid-death/manifest.json)
records actual case counts, boundaries and explicit host seams. The compact
instruction extract and Ghidra provenance retain their target/input hashes;
raw query state stays under ignored `runtime/`.

```sh
python3 -B scripts/check-raid-death.py --python-libs runtime/armory-recovery/python-libs --python-libs runtime/camera-recovery-0.105.0/python-libs
python3 -B scripts/check-raid-death.py --prepare-rea
./scripts/rea query runtime/raid-death-0.115.0/source-gate-plan.json
```

The second command recreates the exact current 176-byte input and query plan;
it does not launch REA. Ghidra's omitted-continuation bad-data halts are raw-slice
boundaries, not observed native faults. Assembly and the isolated instruction
fixtures establish the actual outgoing branches. Decompiler types/ABI guesses
are not implementation specifications.

Authored Rust regressions exercise the public `PendingEffects`/`Pending` paths:
fixed and volley cancellation before/after publication, another source's live
hazards, active Aftershock cleanup, reverse removal order, natural expiry,
no resurrection or duplicate destruction, suppressed spawn/damage and the
independent delayed cone visual. Existing fixtures now supply living sources
where required. Those tests were not compiled or executed. The two changed
modules and nine regression files pass syntax-only parsing with the existing
rustfmt executable, without editing their formatting.

Original-instruction fixtures use synthetic actors/vectors and explicit
memmove/allocation/serialization seams. They do not execute the Rust source,
native allocator, real client or an encounter. Compilation, whole-frame/ECS
behavior, terrain, input/rendering/audio, platforms and original/rebuilt
gameplay/presentation parity remain unverified. No additional concrete source
omission was identified by the selected live raid-path trace; #42 remains open
for its recorded encounter/comparison scope.
