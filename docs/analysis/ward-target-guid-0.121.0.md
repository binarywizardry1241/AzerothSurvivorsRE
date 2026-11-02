# Ward creation target and hero identity — 0.121.0

Finding **#253** is the ward creation target defect discovered while following
[Explosive Orb's world display](explosive-orb-model-0.121.0.md). The current
receiving AS helper publishes the active hero GUID to `UNIT_FIELD_TARGET`
fields16/17. The live reconstructed ward adapter instead supplied GUID1.
Solo construction also retained Mechanics' default1 rather than the selected
native identity. These are source input/publication defects, separate from
#248's unavailable named model input.

The [proof and fixtures](evidence/0.121.0/ward-target-guid.json) bind installed
**0.121.0**, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
They reuse the existing Orb receiver, login, Game constructor, private hero-swap
and actor-hit query results. Two bounded journaled Ghidra recoveries add only
the missing2173-byte identity initializer and325-byte custom roster factory.

## Current native identity connection

Main `1400015ba..140001619` samples one process timestamp. Its successful
conversion is `seconds*1000 + nanoseconds/1000000` with u64 wrapping; failed
duration conversion uses1. `140001a62` forwards this seed into `140052130`.
The seed is preserved at `140052152`, passed at `140052285` into
`145af3890`, forwarded at `145af3956..145af399d` and through
`145b38c26..145b38c3f` to initializer `145b12840`. This path runs before
individual login/Enter/Again requests.

Initializer `145b12da8..145b12df9` reads that supplied seed and derives:

```text
mixed = (u32(seed) ^ u32(seed >> 46) ^ u32(seed >> 23)
         ^ u32(wrapping_u64(seed * 0x1e3779b97f4a7c15) >> 40)) & 0x7fffff
candidate = mixed + 0x800000
guid = candidate if candidate < 0xffff00 else mixed + 0x7fff00
```

At `145b1302c` it stores the seed at App+1a30; `145b13033` stores this
identity at App+1a38. The current custom roster factory `145b2a2a0` reads
App+1a38 at `145b2a2e9` and writes it into the projected row's GUID lane+18
at `145b2a35d`. The older fixed `0x00fffffe` preview/persistence sentinel
does not specify the current runtime identity.

The current login owner `145b21eb0` dispatches opcode0x003d through
table147665ab8 to `145b220fe`. It obtains the current roster at
`145b22708`, matches the requested GUID against row+18 at `145b2277c`,
restores that GUID at `145b2291f`, and writes it to App+1778 at
`145b235c8`. App+1778 is the Game input's Config+130. Thus explicit stock
roster login uses the selected row's GUID, while the custom projection carries
the once-process identity.

Game constructor `145bdcb10` loads Config+130 at `145bdce2c`, preserves
it at `145bdce65`, and stores it at temporary frame+4c0 at `145bdd239`.
Its output copy starts at frame+10, establishing actual Game+4b0. The
complete private swap leaf `145be6f10` exchanges the32-byte blocks at
Game/other+4b0/+4c0: `145be746c..145be74a4` loads both, installs the
other hero and saves the previous active context. Independently, actor-hit
`145c1696e` supplies Game+4b0 as the damage-log source GUID; the victim
GUID enters RDX at `145c169ec` before `145b807a0`. This identifies the
active combat hero, separately from account/award ownership.

The [canonical receiver proof](evidence/0.121.0/orb-world-resource.json)
executes `145c13ce0` through its field-write and create-packet interfaces.
It reads Game+4b0 and supplies its low/high words to fields16/17. These are
the existing engine's `UNIT_FIELD_TARGET` lanes. This contract concerns the
captured creation target; it does not specify every later ward AI retarget.

## Connected source

`run_seed::RunSeeds` retains an immutable `player_guid` derived from its
already-captured initial process seed using the existing
`server_party::native_world_identity`. Its run LCG and PCG expansion remain
unchanged; advancing Enter/Again cannot change this GUID. `CoopRuntime` copies
the same identity at startup, including offline startup, and its existing
direct-session condition still controls `Session::open`. This introduces no
new random sample or entropy failure path.

All `world_guid` readers were checked for presence-based role changes. The
receive adapter retains transport-loss and buffered lifecycle processing before
an offline idle return. Host publication retains End delivery/cache cleanup
before requiring an actual hosting driver, and mover forwarding has the same
host condition. Directory profile requests already require an active worker
and party code. An initialized GUID alone does not activate these consumers.

`gameplay::enter` supplies an actual hosting session's world GUID, the
explicitly selected stock roster GUID, or the custom process GUID. It sets
`Mechanics::player_guid` before configuring run effects/entry. The custom
persistence sentinel remains confined to its existing bookkeeping. The
cooperative template already supplies each admitted profile GUID before
configuring that hero. The addon target classifier now compares the selected
GUID to the actual `game.player_guid`.

The existing local engine API already accepts this identity:
`client::player_ui` copies it into `LocalPlayerUi`, and the local body owner
uses it for `SelfGuid`, the GUID index, body fields0/1 and the UI player seat.
Mover publication already uses `player_mover_for(player_guid, ...)`.
No engine identity API or mover packet implementation needs replacement.

Ward spawning captures `self.player_guid` into `Ward.player_guid`. The live
`ActorView` now carries that captured target through `unit_snapshot` into
`unit_visual`. The target participates in `UnitSnapshot` equality, so an
initial or changed snapshot publishes coherent low/high words. Ordinary
actors supply no ward target. Entry, scale, display131/132 and the remaining
unit fields retain their existing mappings.

## Static checks and limits

```sh
python3 -B scripts/check-orb-world-resource.py
python3 -B scripts/check-ward-target-guid.py
```

The second checker verifies all retained query subjects against the installed
bytes. It executes **8 seed/identity cases**, **8 constructor identity
transfers**, **8 active-context swaps** and **96 receiver publication cases /
16,896 original publication instructions**. Targets include zero,1, low-word
boundaries, a high-word-only identity, an arbitrary64-bit identity and u64::MAX;
both target words and unchanged scale/display lanes are checked. The separate
Orb check retains its **24 cases / 2,424 original steps**.

Clock APIs and surrounding Game construction are outside the replay. The
constructor's output memcpy and the receiver's typed field collector,
ceilf/atan2f and packet-creation boundary are explicit fixture seams. Rust
regressions consume the native fixtures for identity stability and ward
snapshot/field publication; they are uncompiled and unrun. Source guards bind
the actual adapters but do not execute them. Compilation, client/server/game
operation, actual model loading/rendering and original/rebuilt parity remain
unverified.
