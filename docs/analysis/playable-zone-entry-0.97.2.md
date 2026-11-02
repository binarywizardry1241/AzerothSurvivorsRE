# Playable zone entry recovery — 0.97.2

Static recovery performed 2026-10-18 against the supplied
`AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
This report owns native entry data, neutral player defaults, pickup/XP inputs,
player-hit arithmetic, race contributions and the level-choice construction owner.
It does not certify a complete playable session or runtime parity. The parent
integration task owns implementation and any build/launch results.

The source-owned [run entry asset](../../crates/azeroth-survivors-re/assets/run-entry-0.97.2.json)
contains the recovered table and neutral values. Its build/runtime consumer does
not require the original EXE. [The manifest](evidence/0.97.2/run-entry/manifest.json)
retains full source-span hashes, eight REA records, original PE disassembly,
class rows and constants. Adjacent `.ghidra.c` files are provider output rather
than original Rust; exports trim presentation whitespace while the manifest
preserves raw provider text. Windows x64 argument registers and original PE bytes govern
interpretation when the raw import's generic ABI differs.

## Zone selection and map/ground creation

`14543e970..14543f17a` is the sole direct caller of the fresh Game constructor
`14549bb90`. It resolves the selected zone through `14540e820`, then indexes
the current table at `146716438`, stride240. The table's `+c0` is map ID,
`+c8/+cc/+d0` are spawn XYZ, `+d4` is facing, and `+d8` is zone radius.
The same XYZ values are used as the recovered chest-placement center; backdrop
profiles have a separate camera purpose and must not replace these run spawns.

| Zone key | Map ID | Spawn XYZ | Facing | Radius |
| --- | ---: | --- | ---: | ---: |
| elwynn | 0 | -9396, -633, 68 | 1.6 | 120 |
| duskwood | 0 | -10540, 180, 30.3 | 0 | 120 |
| wsg | 489 | 1230, 1450, 310 | 1.57 | 120 |
| ungoro | 1 | -6720, -1920, -272.2 | 1.6 | 120 |
| ab | 529 | 975, 1030, -45 | 4 | 127.5 |
| feralas | 1 | -4680, 1300, 95.2 | 6.05 | 120 |
| arena | 0 | -13204, 274, 21.9 | 0 | 32 |
| sm | 189 | 1045, 1396, 27 | 0 | 150 |
| av | 30 | -230, -290, 7 | 1 | 135 |
| brm | 0 | -7760, -1800, 132.8 | 1.6 | 120 |
| aq | 1 | -7800, 1500, 1.5 | 3.14 | 120 |
| naxx | 533 | 3716, -5106, 141.3 | 0 | 44 |

The source asset preserves exact f32 conversions; table prose rounds for reading.
Factory `14543ec25..14543eca6` reuses the cached ground state only when map and
all three coordinates match, rejecting unordered float comparisons. Otherwise
it calls `145460720` with map directory name, XYZ and `radius+20.0`, then retains
the result in an Arc-like object. The radius extension is at
`14543edb1..14543edf9`, constant20 at `1458f8fa0`. The factory advances the
shared LCG once before constructing the new run. The fresh Game constructor
independently resolves ground from the selected spawn, preferring its primary
provider and then its secondary provider before retaining the fallback height.
The complete existing [constructor evidence](evidence/0.97.2/enemies/initialization-native.json)
owns its stack-to-Game aggregate mapping and remaining initialization.

The native Enter request/menu resource remains owned by
[menu input](menu-input-0.97.2.md). The new factory recovery binds the run creation
side; complete native scheduler, readiness, control ownership and menu completion
flag routing are still partial reconstruction.

## Neutral player values and progression

Current stat refresh `1454950d0..14549617c`, previously retained with the Game
constructor, binds class-record `+80` to maximum health and `+84` to armor.
For `n = level-1`, the branches with no racial, equipment, talent or active-effect
contributions compute:

- Maximum health `class_health + 9*n`.
- Outgoing power multiplier `1 + .03*n`; cooldown multiplier1.
- Critical chance.05 and critical multiplier2.
- Movement multiplier1, giving native run speed7 world units per second.
- Pickup radius9 and XP multiplier1.
- Armor `min(class_armor,.6)`; the source asset keeps every class's stored value.
- Regeneration `.8 + .08*n` per second.

The native refresh applies additional race/equipment/talent/status contributions.
The source asset additionally retains all eight current race rows, including
explicit neutral additive/multiplicative fields. These come from Human's fallback
record `1467175f8` and the seven pointers at `1469ac9f0`, with eight-byte effect rows
and the original twelve-way stat switch at `1469acb30`:

| Race ID/key | Native contributions |
| --- | --- |
| 1 human | XP multiplier +.1; gold multiplier +.2 |
| 2 orc | Health multiplier +.1 |
| 3 dwarf | Damage bonus +.06; pickup multiplier +.3 |
| 4 nightelf | Movement bonus +.08; armor +.05 |
| 5 scourge | Kill-heal field +1; armor +.04 |
| 6 tauren | Health multiplier +.15 |
| 7 gnome | Cooldown divisor +.08; luck bonus +.2 |
| 8 troll | Regeneration +1.5; critical chance +.03 |

The cooldown divisor starts at1 and the effective cooldown multiplier is its
reciprocal. Health's multiplier applies after class health and per-level growth;
racial outgoing damage adds to the scalar before its per-level growth. The
kill-heal field feeds Game494. The common death arm at `1454c4061..1454c40d2`
reads this field after the kill-counter writes and, when positive, applies
`min(current_health+field,maximum_health)`, preserving the original sum on an
unordered minimum. Undead's1 is therefore flat one health per common death,
not a fraction of maximum health. This precedes the class-special tail.
Equipment and talent producers remain partial.
When maximum health increases, current health gains the positive max-health
delta, then clamps to the new maximum; ordinary neutral levels therefore add9
current health while preserving missing health.

XP adder `1454b4920..1454b53f4` wraps the u32 XP addition. Its per-level cost is
`ceil((.35*n)*n + (4*n + 5))`, with the written f32 operation order preserved,
where `n=level.saturating_sub(1)`. While enough XP remains and current level is
at most98, it subtracts cost, increments level and pending-choice counter
`Game+8ec`, and invokes stat refresh. The cap is99. Its tail opens the level
choice only when pending choices exist, phase byte `Game+95f` is1 and `+958` is0.

## Pickups and incoming damage

XP is pickup kind0. `1454a54d2..1454a5553` admits idle XP within the radius from
`Game+470`, then marks it moving and records
`arrival = now + max(horizontal_distance/24,.12)`. The separate already-known
merged/vacuum branch uses speed32. Collection happens at or after the stored
arrival; entering the attraction radius alone does not credit XP. Gold kind1
uses direct radius9; other pickup kinds use direct radius3. The XP collection
branch credits `max(ceil(value * Game+474),1)` with native saturated u32 handling.
Gold credit at `1454a5c33..1454a5c7c` takes `ceil(value * Game+488)`, saturated
to u32, then wrapping-adds to current gold `Game+408` and earned gold `Game+66c`.
The retained full GameTick evidence owns these branch identities and state rows;
the new focused spans retain their exact instructions.

Shared incoming-player owner `14548f420..14549091a` gates on phase1, non-special
run and absence of an unexpired kind11 invulnerability status. It computes
`damage = (1-armor_fraction) * raw_damage`, consumes positive absorb before health,
subtracts the remainder from float health, and stamps the last-hit time. The
physical flag controls later classification/procs; this prologue applies armor
regardless of that flag. The minimum1/truncated u32 damage shown in the adjacent
melee packet producer is not a minimum on actual float health subtraction.
The full owner also handles absorb-aura cleanup, reactive effects, death
prevention, Soulstones and final death. Implementing just its arithmetic must not
be described as reconstructing the entire owner.

Ordinary hostile cast completion is deferred. `1454cc3a0..1454cc5c6` interpolates
the caster's current position, uses already recovered
`bosses::abilities::native_missile_speed` (`1454f08d0`) and queues an80-byte
effect at `now + horizontal_distance/speed`, or `now` when speed is nonpositive.
The queue carries target player, source GUID, spell ID and effective raw damage.
Immediate damage at cast completion would bypass this recovered travel delay.

Pickup creator `1454c8110..1454c924f` uses XP entry9001 with unit display1825
below20 value and16587 at20 or more. Its scale is.22 below4 value, .35 from4
through19 and.9 thereafter. Gold uses entry9004/display2614/scale.6; caches use
entry9005/display259/scale1. Gold/cache creation shares the recovered gameobject
construction and update-field owner; the unit/gameobject display domains are not
interchangeable. Native zero-damage pending impacts skip the common damage call
at `1454a3af8..1454a3b31`; installing a DoT must not add a minimum-one direct hit.

## Level-choice candidate generator

`1454da5f0..1454db51d` handles level mode0 and delegates modes1/2 to the existing
cache generator `1454e1d00` with factors0/.25. In level mode it builds a weighted
pool in order:

1. New class spells when fewer than6 are learned, excluding existing spells and
   current exclusion/history keys. `call_of_flame` additionally requires a learned
   definition whose kind is10. New-spell weight is1.6 below3 learned spells,
   otherwise.9; exact table `1469aa610`.
2. One candidate per learned spell with a nonempty native eligible-upgrade result
   (probe rarity4). Each contributes weight1.3. It does not add one weighted
   candidate for every upgrade kind.
3. Draw up to3 candidates without replacement; the first-offer flags can raise
   count to4. Sum weights in order, draw the shared RNG range from0 to
   `max(sum,f32::MIN_POSITIVE)`, choose the first `weight>draw` while subtracting
   preceding weights, default to the last candidate, then remove it with ordered
   `memmove`.

`145536160` maps all selected candidates through `1455452d0`; their concrete
card builder is `1454ded40`. Every candidate draw finishes before any rarity
draw. Rarity luck is `1 + Game+484 + min(level*.01,.3)`. The five ordered rarity
weights are `[60,25*l,10*l*l,4*l*l*l,l*l*l*l]`, using the same shared run RNG as
combat and selection. Upgrade conversion raises sampled rarity until an eligible
kind exists, stopping at4. It shuffles that final eligible-kind vector with the
existing native shuffle, taking one kind below rarity4 and two at rarity4,
capped by available kinds. The pool's initial kind byte is not the final kind.

Learning passes the sampled rarity0..4 **directly** to `14540f1c0`: the builder
preserves its incoming R9 tag through RBX and reloads it into R8 at `1454deedd`
before the call at `1454deef9`. Common0 therefore receives no learned-rarity
bonus. An empty resulting offer set receives one25-gold fallback card.
[choices.rs](../../crates/azeroth-survivors-re/src/gameplay/mechanics/choices.rs)
implements this generator and uses the existing eligible/apply/rarity owners.
Native card prose, full account/exclusion/first-offer producers and other reward
categories remain separate; English runtime card labels are presentation glue.

## Class-special ports and initial state

[passives.rs](../../crates/azeroth-survivors-re/src/gameplay/mechanics/passives.rs)
supplies the live `TickPort`, `HitPassivePort` and shared recursive hit adapter
for the existing [passive tick](player-passive-tick-0.97.2.md),
[hit passive](player-hit-passives-0.97.2.md) and
[totem passive](player-totem-passives-0.97.2.md) source owners. Shared actor/boss
arrays, terrain, learned instances, clocks and the run RNG remain the actual
runtime storage. The shared primary damage/death/loot prefix returns its captured
input before invoking the canonical class-special tail. Recursive hits preserve
source-kind3 and the native context save/clear/restore ordering.

Native actor+64 is the guardian optional lane: the retained guardian AI checks
that sentinel before `14550a0a0`, and its existing unchanged-byte fixtures read
and write awake at actor+96. The adapter therefore supplies actual guardian
awake state, ordinary absence, and raw elite flag344 from the current definition.
Actor periodic hits use source-kind1 and the actual owner-kind word at Game+30,
as shown by the retained full actor-update owner; first-player-tick instead goes
to Game+110 and must not be substituted for that owner discriminant.

Fresh passive resource values are zero, with explicit constructor proof rather
than relying on Rust's storage default. The constructor assembles Game at
RBP+28. `14549c0b6..14549c0c6` clears temporary AC0..ADB; the later pack into
stack7e4..803 maps its zero words to Game7c4 Bloodrage pool,7c8 bank,7cc gain
time,7d0 Seal Fate points,7d4 bank and7d8 Soul Fire points. Stack804 takes the
zero AD8 word for Game7dc; the zero writes at stack808/80d cover Redemption
queue time7e0, chain word7e4 and Hunter's Mark reacquire7e8. These spans are
retained in the entry manifest, and the common constructor report owns the
RBP+28-to-output memcpy binding.

The native actor+144 appearance metadata's word36 and actor+264 scale are not
yet bound to a runtime packet record. The adapter emits actual Polymorph model856,
aura, stopped movement and resource/object intents, and an explicit missing
original-appearance binding when restoration is required. Renderer cache restore
can be implemented independently without calling its base model native packet
metadata. Equipped bounce effects and talent rows are not manufactured for an
unequipped neutral run. Native104/7ec producer lanes and the wider final talent
tail remain partial.

Unexpired stat auras are consumed at `1454957d2..14549595c`: kind8 adds
`aura.value*(1+buff_effect_bonus)` to outgoing damage; kind9 adds the same to
the haste accumulator before the reciprocal `1/(1+haste)`. Without equipment/
talent buff-effect bonuses the multiplier is1. Spell23505 additionally adds.5
outgoing damage; spell23451 adds.6 movement multiplier. The exact constants and
complete stat owner remain retained; this does not claim complete gear/talent
stat composition.

## Camera evidence and exact boundary

The current native player setup is `140838a90`, already fully retained by
[menu composition](menu-compositor-0.97.2.md). It initializes the camera rig's
distance, target distance, collision distance and alpha from
`1459f7d30 = [15,15,15,1]` at `140838e08`. It initializes the FlyCam yaw/pitch
from `1459f7ca0 = [0,-.5]` at `140839030`. These values are current-target
observations, not assumptions from public benilla defaults.

The source asset's WoW offset `[-15*cos(.5),0,15*sin(.5)]` reproduces that default
boom at a zero pivot. Zero is the native rig's initial pivot-channel state.
The public camera source explains how the rig subsequently follows the M2
attachment17 framing pivot and reacts to facing, input, water, terrain and camera
collision. Full native correspondence for those later paths and the entry yaw
reset is not recovered by the initial values alone. A fixed-offset implementation
is therefore a partial adapter, with native dynamic camera behavior still missing.
It must not be labeled a recovered fixed gameplay camera.

## Reproduction and validation

```sh
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/recover-run-entry.py --sha256 2205ac503199a27b87d545881aac4d3e35cb3d7a60d37e4b2cccc2b9b6329e17
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-14543e970.json
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-1454b4920.json
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-14548f420.json
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-1454da5f0.json
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-145536160.json
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-1455452d0.json
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-1454ded40.json
python3 scripts/rea-batch.py runtime/playable-zone-entry-0.97.2/plan-1454c8110.json
```

Eight static REA/Ghidra queries completed and closed their targets. Hash-gated
extraction, source-asset reproduction and original instruction review passed.
No original application was launched by this recovery task. The parent owns any
reconstructed build, compiler test and application launch; those outcomes must be
reported from its actual evidence. No full camera, world entry, stat, pickup,
combat, card-selection or session parity is established by static recovery alone.
