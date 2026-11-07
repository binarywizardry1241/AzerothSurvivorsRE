# Shared actor frame

Target SHA-256: `76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This connects the current shared actor decisions and their deferred consumers.
It does not establish compilation, playable encounters or original/rebuilt parity.

The [manifest](evidence/actor-frame-order/manifest.json) binds original
bytes, compact disjoint assembly slices and references to existing canonical
extracts. Fresh slices are decoded from the verified installed image; no new
Ghidra session or game process was started for this ordering repair.

## Native order and connected source

`Game+560/+568` holds one stable `0x1d8` actor vector. Ordinary enemies,
guardians, primary bosses and wards share its creation order. The decision walk
collects separate queues rather than publishing each actor's packets inline:

| Stage | Native owner | Connected behavior |
| --- | --- | --- |
| Decisions | `14597830a..14597b452` | One shared allocation-order walk; aura deadlines precede each actor's decisions. Ward special decisions bypass ordinary hold/movement/combat. |
| Removals | `14597b4e5..14597b549` | Remove expired corpses and escape removals before movement. Retire actor-owned phase, form, aura and defense state with the actor. Persistent lair/reward state keeps its own lifetime. |
| Movement | `14597b602..14597b77f` | Publish all movement requests in actor order and allocate the shared wrapping movement serial here, including facing requests and guardian return-home movement. |
| Melee | `14597b7ed..14597b8c3` | Publish each attack log before canonical damage/retaliation, then continue the queue. |
| Casts | `14597b97b..14597bc35` | Negative queued values are cast-start durations; otherwise re-find the source and publish completion/missile. |
| Periodic damage | `14597bc57..14597c1f4` | Consume the collected actor periodic requests after ordinary casts. |
| Aura cleanup and phase text | `14597c21a..14597c4bb` | Publish all aura removals before applications, then primary phase yells and guardian phase emotes. |
| Raid actions | `14597c4bb..14597c56c` | Resolve each saved shared actor index against the current vector and dispatch its copied original action payload with fresh caster/player context. |
| Ward actions | `14597c56c..14597c822` | Recheck ward/parent ownership after periodic damage and raid actions. |
| Guardian engagement | `14597c822..14597cd0f` | Re-find the queued GUID, rescale vitals, publish health/max-health fields, then publish the aggro yell. |

[`mechanics/actor_frame.rs`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/actor_frame.rs)
owns this ordering. Boss and guardian helpers collect into its queues. Player
death during melee does not prematurely discard the later queues: the native
caller continues after the canonical damage call. Later damage owners retain
their own admission gates.

The cast-start event reaches the existing client `SpellStart` consumer with
flags `2`, player unit target `1` and the exact milliseconds conversion. Original
instructions use a signed 64-bit truncation with ordered clamps; their upper
constant is the largest `f32` below `2^32`, `0x4f7fffff`. This matches the
source's saturating `f32` to `u32` conversion, including NaN/infinity and the
upper boundary. Cast completion rejects an absent source but does not reject
a dead actor that remains in the vector.

Primary phase text uses the GUID-bearing type `0x0c` serializer
`1458c2fb0`. The protocol and live chat consumer map that value to
`MONSTER_YELL`. Guardian phase text uses the separate type `0x5a` serializer
`1458c1260`. Guardian aggro scaling occurs after ward actions, so its first
engagement's earlier requests use the pre-rescale damage. Engagement relookup
has no dead-actor check; a dead guardian preserves health zero through ratio
scaling and still receives the original fields/text publication.

## Shared indices and optional actor fields

`1459b5300` destroys matching actor-owned state and stably compacts survivors.
It never adjusts queued raid indices. Dispatch `145957954` checks the current
length and current slot's dead flag; an out-of-range request returns silently.
The adapter therefore preserves this target behavior even when an earlier
corpse removal makes a request select a different actor. It resolves the vector
again for every request, so actors appended by earlier requests are visible.
The payload remains the originally queued action. Later native18/35/36/37
records retain their native GUID ownership instead of adopting this index rule.

A rebound action can select an ordinary actor or ward. Source context, baseline
size, maximum health, movement/hold/charge/teleport/pull, whirlwind, aura,
shield/exposure writes, minion yell and delayed-source lookup include those
actors. The current name helper uses localized `Enemy` when both boss and
ordinary definition pointers are absent; it does not substitute the ward
creature template's name.

Native optional fields still control consumption:

- Hold/stop writes are generic. Ordinary common AI consumes the hold deadline;
  the ward special lane runs before that check.
- Automatic cast blocks and replacement schedules write only existing boss
  `+18` or guardian `+58` lanes. Ordinary actors and wards gain no schedule.
- Transform cast and hold precede presentation/list changes. Form fields require
  a boss definition or a nonnull ordinary definition; wards have neither.
- Shield/exposure deadlines can be written for any current source, while the
  damage multiplier consumes them only for boss/guardian metadata. Ordinary
  actors and wards retain factor one.

For this exact target all **493 recursive semantic records** use delayed
hazards or non-damage producers. Historical immediate `AreaStrike`, `Charge`
and `GroundArea` variants are unreachable from the registry; root dispatch's
incoming/post-action/bomb/knockback buffers are consequently empty. The checker
asserts this selected-target boundary. A future registry must re-establish it
before reusing that adapter assumption.

## Validation and limits

```sh
python3 -B scripts/check-actor-frame-order.py
```

The checker runs **280 bounded native instruction cases** covering actor
iteration, wrapping movement serials, full stable removal with explicit
allocator/destructor/copy seams, post-compaction index/dead admission, cast
conversion, optional block/form lanes and guardian vital rescaling. Original
callees outside declared seams are rejected. Source guards trace the actual
frame, typed ports, packet consumer and all recursive semantic variants; these
are static assertions, not Rust execution or type checking.

Existing connector, guardian, raid-native, sequence, ward and shield checks
also pass after the consumer changes. Changed Rust sources parse with
`rustfmt --emit stdout`; compilation, game launches, terrain/rendering, packet
presentation and controlled original/rebuilt gameplay comparisons remain
unrun. Guardian stat functions retain their separately recorded provenance;
this ordering work does not promote their full numerical parity.
