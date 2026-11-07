# Spell visual scaling and effect admission

Target SHA-256: `8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
This report owns the implemented source portions of #32 and #33; the parent gaps
retain the remaining source and runtime work in [verification-needed](../verification-needed.md).

## Scaling producers and consumers

Current radius lookup `1459614e0` preserves the nineteen recognized spell IDs
and their 5/8/10-yard visual bases. Ground creator `145926650` publishes radius
and `radius/base` scale independently. The source already produced those fields,
but the client DynamicObject root deliberately has unit scale and its area
model previously ignored the descriptor's scale.

The current ground initializer `140599e80` reads descriptor scale, accepting it
only when greater than zero and otherwise using one. The looping area model now
receives that scale locally, without scaling the object root or double-scaling
shard placement. Shard spread still uses the absolute radius field. Emission
rate now follows original instruction order: `min(scale*scale,4) * (rate*level)`.
The cap is the exact 4.0 at `145d9aecc`; level factors retain the ordinary client
0.33/0.66/1 behavior. Existing areas retain their creation-time decision.

Native table producer `145924e50` emits spell ID, scale and a kind8 flag. It uses
instance area times talent area, then definition range for kind8 or radius for
other kinds, then global area; values above 70 use the 70/10 `log1pf` soft cap
before dividing by the visual base. The first recognized ID wins. The live source
now publishes learned and racial entries each First stage, including upgrades,
equipment/talent refresh and teardown clearing. Ground-burst messages retain the
spell ID and read this map, accepting only positive scales as `1407e00a0` does.

The auxiliary `Game+b8/c0` vector is now traced to timed26 talent spells.
Current collector `14599e640` selects tag26, retaining the spell key and interval
override. Refresh `145927dc0` preserves the base prefix, creates neutral rank1
instances and publishes each as a 104-byte instance plus override at `+68`,
stride112. Its final `1459286e8..145928751` pass reapplies the current spell
modifiers. The live visual publisher now supplies these records after learned
and racial entries, using neutral instances plus current modifiers; it does not
copy learned upgrades into an auxiliary visual record. Duplicate IDs still keep
the first recognized entry. The [auxiliary manifest](evidence/0.105.0/auxiliary-spell-scales/manifest.json)
binds the collector, producer, modifier writes, timed consumer and Ghidra owner.

The attached-kit gate is now mapped through its actual query producer.
SystemState `+2d8` receives query `1414165b0`; its getter uses type ID
`145e4bed0`, whose descriptor names `benilla_app::net::SelfPlayer`.
Archetype matcher `141415dc0` requires that component to be present before
publishing membership. Kit context `14059fa40` supplies that query as context
entry11; `1408d9563` also requires instance class byte `+33` to be zero.
The class comes from Begin message `+25`. The exact hardcoded level-up and
meeting-stone Begin producers establish class0 for the source's Hold class,
independently of persistence or animation stage.

The live client now scales only admitted SelfPlayer/Hold kit roots. A world
plant or unresolved attachment uses mode=true; a resolved attachment uses
mode=true only for tag19. Other attachment tags require the table's kind8 flag.
Native lookup still rejects absent, nonpositive or unordered scales. Command
`1407e0cc0` queues `140b5af60`, whose `140b5b0dc..140b5b0f6` arithmetic multiplies
the existing effect-root XYZ scale. Source applies that multiplication once at
creation, preserving translation, rotation and ordinary unit/child transforms.
Existing effects keep their creation-time scale. The
[attached-kit manifest](evidence/0.105.0/attached-spell-scales/manifest.json)
binds query initialization, membership, class producers, command and source.

## Effect setting

Current `14003de60` registers/reads `noSpellEffects`, trims its string and enables
`1407e0430` only for exactly `1`. The setter writes the flag at `148004b98`.
Ground initialization tests it before creating the looping model and shard
emitter, while its sound-kit path remains outside that gate. Other native
readers advance message cursors to the current end instead of retaining hidden
requests for later replay.

The real client now reads the live ordinary CVar registry at effect creation.
It suppresses new ground models/shards/bursts, spell-kit model Begin requests,
missile models and chain-beam plays. Reaps, existing effects, combat packets,
actor animations, sounds and timing continue through their existing owners.
The source missile queue combines visual creation and timed impact delivery;
hidden missiles therefore use its established invisible-flight path rather
than discarding sound/impact work. Turning the setting off cannot replay a
suppressed model request, including a missile waiting for an animation release.

`hudLoot` now reaches the actual equipment pickup path and native card consumer.
The live drain emits each equipment notice, including repeated IDs, and compares
ownership before insertion. The native `ffffff` Tester GUID still emits notices
but never inserts newly collected equipment; repeated unknown drops therefore
remain new for that sentinel. Cards use the recovered rarity palette, typography,
40px item icon, native right/top placement, seven-second lifetime and animation.
Choice/pause/loading frames shift the retained birth timestamps; terminal
visibility alone does not freeze them. The existing count/revision rebuild key
does not recreate a card solely because its stored birth timestamp shifted.

`hudFlag` now drives the separate world marker through the real client
`GossipPoi` event. Native command23 writes the flag resource; the accepted active
run tick selects a lair independently of its visibility setting. Disabling a
visible flag emits one empty-name marker at the player's XY. Enabling it emits
the selected lair's home XY, flags99/icon6/data0, localized enemy name and fixed
English ` (Guardian)` or `'s lair (empty)` suffix. The same selected index and a
visible marker retain their prior packet until age exceeds300 seconds. A held
guardian's death alone does not force an immediate name update; spawning clears
the selection so even the same index is republished. No identity/name cache is
substituted for that law.

The [HUD consumer manifest](evidence/0.105.0/hud-consumers/manifest.json) and
[run HUD report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/run-hud-0.105.0.md) own these consumers. Existing
clock/boss/tally/build/banner/level and independent meter consumers retain their
own reports. These connected source routes do not certify rendered HUD parity.

## Evidence and checks

The [manifest](evidence/0.105.0/spell-presentation/manifest.json) binds canonical
assembly, selected REA/Ghidra pseudocode, exact constant bytes and Evidence IDs.
Raw slice imports omit external code/data and have explicit ABI/discovery limits;
original PE instructions govern the recovered contracts.

`python3 -B scripts/recover-spell-presentation.py --check` passes **23
radius lookups, 21 scale-table cases, 21 shard-rate cases and four message-cursor
gates**, plus checks of the actual source routes. Vector allocation and host
`log1p` are declared seams; the latter captures original f32 arguments and does
not establish Windows CRT equivalence. Source tests consume the table vectors;
engine regressions cover scale/toggle boundaries. Rust source was syntax-parsed;
Python/JSON checks pass. Rust tests were **not compiled or run**.

`python3 -B scripts/recover-auxiliary-spell-scales.py --check` adds
**18 current native table cases** covering auxiliary stride/order, learned and
racial precedence, repeated and unsupported IDs, kind8 and soft-cap inputs.
The producer/modifier correspondence is static; full refresh execution is not
claimed by these bounded table vectors.

`python3 -B scripts/recover-attached-spell-scales.py --check` passes
**two positive-membership cases,32 kit admission cases,40 native lookup cases
and four root multiplication cases**. These cover wrong class, dead/stale entity,
missing query membership, both modes, kind8 admission, absent IDs, nonpositive/
unordered scale and preservation of translation/rotation. The lookup uses a
synthetic one-key native BTree node with clear lock/poison state. Full query
scheduling, attachment/model loading and concurrent synchronization are outside
the replay; their relevant binding/mode paths are statically traced.

`python3 -B scripts/recover-hud-consumers.py --check` passes **four Node
snapshots,24 lifetime cases, five expiry boundaries, eight animation cases and24
flag retention cases**, plus current pickup/JSON-state/packet/source traces.
The exact ScreenState `choices` and `paused`/`unpaused` writes establish the
lifetime inputs; dead/completed are not inferred as pause inputs. UI layout,
full equipment dictionary lookup and full JSON dispatch are outside the replay.

No builds, game applications, screenshots, audible checks, device tests or
original/rebuilt comparison ran. Presentation and toggle interaction remain
unverified even for the connected source paths.
