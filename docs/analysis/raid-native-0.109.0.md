# Historical complete raid action graph — 0.109.0

This report retains its **0.109.0** target and evidence. The [0.112.0 raid review](raid-native-0.112.0.md) owns current input-graph and initial-request dispatch revalidation; [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status.

The recovered source routes all recurring and health-phase records for the sixty
bosses and thirty-seven guardian identities, including recursively referenced
sequences and replacement move lists. This removes the remaining missing action
consumers in this bounded part of **#42**. It is source integration supported by
static native evidence; encounters have not been compiled or compared in game.

The historical reference for this report is 0.109.0, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
These historical recovery/check commands require that exact target and reject a
changed installed EXE. Building the source does not require the EXE.

## Complete input graph

The [native catalog](evidence/0.109.0/raid-native/catalog.json) records each
48-byte action payload by address and hash, retaining equal payloads at distinct
addresses. Its 493 nodes include all 257 boss recurring records, 33 boss phases,
120 guardian recurring records across forty possible lists, fifteen guardian
phases and their recursive children. The count is a graph-node count, not a count
of distinct behaviors. Phase payloads begin sixteen bytes into their 72-byte
records; recurring records append their repeat to the 48-byte payload.

`recover-raid-native-catalog.py` follows the current pointers directly.
Native18 references 48-byte children; native0/1/2/32 references 56-byte recurring
descriptors. `connect-raid-mechanics.py` converts the complete graph to
semantic source records, joining each existing family to its canonical current
catalog. Every generated guardian action is `Some`; current boss schedules no
longer fall through to historical missile/charge entries. The historical
seven-word fixtures retain their separate provenance.

The current dispatcher begins at `1459578e0`; the signed jump table at
`14722ce3c` covers native tags3..34. Normalized tags below3 share the replacement
branch. Semantic source indices are internal dispatch representations and are
not native tag numbers.

| Native action | Connected behavior and owner |
| --- | --- |
| 0/1/2/32 | Replace the recurring list and initialize each new timer to repeat×0.5+1; update unit form except for native2 |
| 3/6 | Existing circles/circular casts, with current native impact-spell fields restored |
| 4/5 | Existing missile volleys and ordinary enemy creation |
| 7/8/19/20/21 | Warned movement/lines, cones, knockback, deferred pull and collision-clamped blink |
| 9/10 | Aimed line and staggered random circles |
| 11 | Player-tracking circle followed by a persistent damaging pool and dynamic object |
| 12/30 | Existing independently recovered tower and bomb lifecycles |
| 13/14/15/16 | Following donut, whirlwind, rotating periodic line and four cardinal lines |
| 17/29 | Alternating rows of circles and alternating crossfield lanes |
| 18/24 | Ordered child sequence and drifting radial disks; [sequence owner](raid-sequences-0.109.0.md) |
| 22 | Targetable wards/eggs and their attack/death/healing lifecycle; [ward owner](raid-wards-0.109.0.md) |
| 23/27/28 | Existing shields, waves and periodic donut pools |
| 25/26/31/33 | Tether with source healing, gaze safe area, enemy-producing circle impacts and shield-breaking exposure crystals |

Nested cones, knockbacks and shields use the same live families even when their
payload is absent from a root-only family catalog. All graph nodes have the
native generic duration, including recursive sequence duration. Admission
retains the native nonblocking mask `a0180006`, strict deadlines and original
slot ordering; generic duration and visible cast duration remain distinct.

## Stateful consumers

`bosses/raid_extra.rs` extends the shared hazard vector rather than allocating
separate marker identities. `raid_areas.rs` supplies actual elapsed time, actor
positions, occupancy and aggregate incoming damage. The live adapter supplies
terrain, collision, actor movement, forms, exposure, dynamic objects and source
healing. Existing lines, towers, bombs, shields, wards and sequences retain their
own evidence owners.

The [current marker presentation report](raid-markers-0.109.0.md) separately
revalidates the receiver, geometry and paint consumers under #43. Its cast
packet evidence does not establish a separate boss cast widget; that release
claim requires controlled original-game observation before a UI contract can
be asserted. Producer integration does not certify rendered presentation.

The periodic families activate at their native windup, use native cadence and
expire at their separate end deadline. Drifting disks move toward the player;
rotating lines change angle only after activation. A tether continually updates
its source-to-player line, breaks at its range, ticks every0.5s and uses its final
payload scalar as source healing fraction, separately from player damage. The
shared ward healing helper applies that fraction to the living source.

Native11 follows the player only through the recovered tracking window,
`max(min(track, windup−0.6),0)`. Its initial hit activates the pool; secondary
damage begins one second later and repeats every second. Surviving activated
pools create their dynamic object before marker publication and player damage;
the object is removed with the pool. Native31 enemy creation, exposure and
source healing remain after the real player-damage stage.

The current dynamic-object helper `145963f80` and radius lookup `14599e8a0`
agree with the existing source object fields, shared object counter and radius
override rules. Their complete bounded fixtures cover400 object constructions
and67 radius branch boundaries. Marker motion follows the native guard:
follow-source, trackingUntil>start, positive drift, or kind3 nonzero angular
speed. Stationary crystals and enemy-producing circles emit no extra movement
rows, and unpublished warnings receive no movement updates.

Native26 follows the player for0.8s, then damages once if the player leaves its
radius2.5 before expiry. Native33 uses the same native tower marker kind and
occupancy input; an occupied crystal sets the source's recovered exposure
deadline and breaks its shield. Exposure is this hazard's real kind5 path,
not an invented deferred enum entry.

Native31 impacts create ordinary enemies after damage. Its first eight payload
bytes are a direct source-zone enemy-array index; the constructor clamps that
index to the final row. There is no elite-filter selector. Random placement,
zone-radius−4 clamping and0.45s staggering come from the current producer. Native10
uses0.35s staggering. Both preserve the first circle at the player and the shared
RNG order. Native17 uses circular cells,1.6×radius step spacing and2.6×radius lane
spacing. Native29 uses60-unit lines and a later-wave warning lead of
`min(0.9×wave_spacing,1.4)`.

## Forms and replacement schedules

`raid_transforms.rs` reconstructs the ordered unit field map from
`14594d490`: display131, scale4, mount133, weapon item fields37/38, weapon
descriptors40..43 and sheath164. A zero display or nonpositive requested scale
selects the source's baseline. Bosses use their current definition display/scale;
guardians use their definition display and actual spawned scale. The packed
weapon variant2 preserves that slot; other variants use the native descriptor
and flag words.

The live form port publishes these fields, stores resolved render overrides,
replaces the boss/guardian scheduler and applies the recovered cast/movement
hold. A guardian leash reset restores its originally selected base/alternate
list and phase latches. [Boss input verification](boss-inputs-0.109.0.md) covers
all sixty base definitions and the current constructor arithmetic.

## Evidence and validation limits

The [manifest](evidence/0.109.0/raid-native/manifest.json) owns thirty-six canonical
instruction ranges. [REA provenance](evidence/0.109.0/raid-native/rea-provenance.json)
retains eighteen Ghidra12.1.4 branch/form/object results with raw-input and pseudocode
hashes. Assembly, not Ghidra's inferred types, owns exact fields and arithmetic.
The whole hazard-owner decompilation timed out; the selected lifecycle ranges
were recovered separately. This is not a full-image reference census.

```sh
python3 -B scripts/recover-raid-native-catalog.py
python3 -B scripts/connect-raid-mechanics.py
python3 -B scripts/check-raid-native.py
python3 -B scripts/check-boss-inputs.py
```

The native check passes493 original duration cases,163 producer cases,
ten form-field cases, fourteen marker-kind cases,192 marker-motion cases,
67 radius cases and400 dynamic-object cases. Original instructions run
only in synthetic Unicorn fixtures. Producer fixtures intercept terrain,
cast/hold helpers, the selected range helper and CRT trigonometry; form fixtures
intercept ordered map insertion and stop before packet serialization. Object
fixtures intercept field-map/packet allocation while executing the actual
current helper and radius selector; the renderer is outside these fixtures. Golden
native hazard bytes, counts and selected fields are retained, while source
guards inspect the connected consumers. They do not execute Rust or certify
Windows CRT, terrain, packet ordering, rendering, audio or encounter parity.
Changed Rust files were parsed with `rustfmt --emit stdout`; compilation,
compiling tests and game launches were intentionally not run.

To prepare fresh target-bound REA inputs without launching analysis:

```sh
python3 -B scripts/recover-raid-native-catalog.py --prepare-rea
python3 -B scripts/rea-batch.py runtime/raid-native-recovery-0.109.0/dispatch-plan.json
python3 -B scripts/rea-batch.py runtime/raid-native-recovery-0.109.0/transform-plan.json
```

Raw inputs, databases and protocol responses remain ignored under `runtime/`.
Current overall limitations and gap closure are owned by
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md), not inferred from action-record coverage.

The [shared actor frame](actor-frame-order-0.109.0.md) owns current insertion
order, publication stages, post-compaction source indices, arbitrary caster
ports and optional boss/guardian field gates. Its source and byte checks remain
separate from gameplay verification.
