# Enhancement recovery

[Finding #305](../verification-needed.md#gap-305) and the [native
receipt](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.139.2/enhancement.json) use the installed EXE with
SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

## Frost Shock debuff

The Frost Shock descriptor at `0x147349fa8` identifies spell 8056 and
status tag 1 with a 50% slow for four seconds. The status branch at
`0x145f461bf` applies the chosen magnitude and deadline to the recipient.
It stores spell 8056 for the debuff when the source spell matches, or zero
when a different slow replaces it. The old aura is removed on replacement.
The actor update at `0x145f175b5` removes the recorded spell at the slow's
deadline. Refreshes extend the existing slow's deadline.

The source now uses the existing actor aura slots and event replication
for this debuff. Its duration follows the applied status, including
the addon aura list. Guest hero state switches retain the shared actor
record. Actor retirement clears that record.

## Talent, spell and proc boundaries

The current native Shaman spell pool ends in Stormstrike. Rockbiter is
outside that pool. The two 120-byte descriptors at `0x14734a278` and
`0x14734a2f0` carry Nature school, melee cast kind 5 and range 10.
Stormstrike targets one enemy and Rockbiter targets two. The stored
cooldown values produce the 8.5 and 2.2 second baseline intervals under
the ordinary multiplier.
The ordinary Shaman offer pool now uses the current Stormstrike descriptor
and the existing priority-targeted melee cast. The picker uses the same
spell and icon and the native nearest-enemy body template at `0x14734e7a5`.
Isolated execution of the default stats, power and cooldown instructions
returns 481.600006 and 8.5, displayed as 482 Nature damage and 8.5 seconds.
All fourteen localized names and referenced template keys were checked.
Rockbiter’s picker entry and startup grant remain open.

Thirteen contiguous talent descriptors at `0x147367c38` retain native
keys, position, ranks, prerequisites and effect references. Stormguard
keeps the key `enh_earthen_bulwark` and Elemental Sunder keeps
`enh_unleashed_weapons`. Rockbiter Initiation uses native effect 29 with
key `rockbiter` (first-spell replacement). Stormbound Echoes includes
native effect 28 with key `stormstrike` (additional starting spell).
These data records identify the grants and retained keys. The old-tree
save migration gate and active tree integration remain open.

Flurry's talent row binds raw effect 42, subtype 10. When the proc driver
`0x145ec82f0` receives the critical input, it looks up that row and stores
`now + 4` at Game `+0x13c`. The update path reads the deadline and applies
`1 + rank * 6 / 100` to running Rockbiter and Stormstrike cooldowns.
The existing [0.139.1 local correspondence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-interface-correspondence-0.139.1.md)
retains its own target. Source still needs the current Enhancement
effect collection, live Flurry state and rate publication. Integrate the recovered
origin and recursive proc edges, and complete the migration and active
tree, necklace growth and remaining consumers, armor/stat attribution,
and buff and Rockbiter picker publication before certifying the rework.

The exact descriptors and pool, aura application and expiry instructions,
and four bounded Ghidra results were checked. Two broader function queries
exceeded the inline response boundary. Their raw instruction observations
do not establish whole-function ownership. Compilation, rebuilt gameplay
and original/rebuilt comparison remain open.

## Proc origins and repeat limits

The timed-cast owner `0x145ee37d0` selects Rockbiter and Stormstrike by
exact key. Before invoking the normal cast at `0x145f3d010` it arms hit
capture and clears the critical latch at Game `+0x142/+0x143`. A successful
cast with a nonempty hit list reaches `0x145ec82f0` with the base key,
the cast's critical latch, permission to roll Windfury and the repeat bit
clear. The Rockbiter path checks Heart of the Earthbreaker using the first
captured hit before joining the same proc entry. Windfury uses the normal
cast directly, bypassing the outer Heart branch.

The driver handles Flurry first, then Flametongue for Rockbiter and Windfury
for either base spell. Stormstrike continues through Frostbrand, Ancestral
Fortitude and Eye of the Tempest. The dispatcher at `0x145ec8e20` constructs
the effective spell using `0x145f58030` and temporarily sets effect attribution
at Game `+0x40/+0x48` and proc depth at `+0x224` around the normal cast.

| Effect | Trigger and payload |
| --- | --- |
| Windfury Weapon (42/4) | Rockbiter or Stormstrike rolls 10%, 18% or 25% by rank. Success rolls again against `0.0001` and selects five extra casts below that threshold, or two otherwise. |
| Flametongue Weapon (42/5) | Rockbiter rolls `rank * 5 / 100` and casts Fire Nova with `rank * 10 / 100` added to its effective damage multiplier. |
| Frostbrand Weapon (42/7) | Stormstrike rolls `rank * 10 / 100` and casts Frost Shock with one extra target slot on top of its effective count. |
| Ancestral Fortitude (42/9) | Stormstrike increments the counter at Game `+0x138`. The thresholds by rank are eight, six and four. At the threshold it clears the counter and casts Healing Wave with a 0.5 multiplier. |
| Eye of the Tempest (44 and 45) | Stormstrike finds the first chance and multiplier records and requires both. On success it casts Chain Lightning with that multiplier applied to its effective damage. The proc is attributed to the chance record. |

Stormbound Echoes (42/11) rolls 5% after each primary proc in the table
when the incoming repeat bit is clear. Success calls the dispatcher with
the same payload and the repeat bit set. A repeated Windfury therefore
reuses the queued count. Each Windfury strike rebuilds its effective spell
and targets and captures its own hits and crit. Failure or an empty hit
list ends the remaining strikes. Successful strikes call the driver at
`0x145ec9303` with Windfury disabled and the inherited repeat bit. A primary
Windfury strike may produce secondary procs and roll their repeats. The
strikes from a repeated Windfury can still produce secondary procs, with
the repeat check skipped before any Stormbound random draw.

## Necklace records and equipped scaling

The necklace constructor branches bind the item names to these effects.

| Necklace | Base effect records |
| --- | --- |
| Heart of the Earthbreaker | Raw 48 adds 0.30 to Rockbiter damage. Raw 43 holds 0.40 of the first captured hit and radius 6.0. |
| Cinderheart Pendant | Raw 48 adds 0.60 to Fire Nova area and 0.30 to its damage. Raw 46 holds a 0.40 Flame Shock remainder fraction. |
| Eye of the Tempest | Raw 44 holds 0.20 proc chance and raw 45 holds a 1.0 Chain Lightning multiplier. |

The equipped-effect path at `0x146004ecb` calls the scalar at `0x145decb90`.
Its indexed leaves multiply Heart's raw 43 damage fraction while copying
its radius unchanged, multiply Eye's raw 44 chance with a 1.0 cap, and
multiply the raw 45 and 46 values. The keyed raw 48 records use the ordinary
keyed effect scale.

These bounded observations resolve the proc driver, dispatcher and base
necklace records. Full item growth, the Cinderheart consumer and the live
source integration require separate evidence. The dispatcher result uses a
raw function slice. Its jump table and Windows x64 call arguments were
resolved against the original PE bytes.

## Rockbiter and the picker in 0.140.0

The installed 0.140.0 PE has SHA-256
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
Its Rockbiter descriptor at `0x1473bb450` is 120 bytes with SHA-256
`ce1ce0ba464dfe96932f54b84daec993844c9b2c0521793ad1c46995820e28da`.
It carries power 66, interval bits `0x3fc92493`, range 10, two targets, spell
8017, Nature school, cast kind 5 and the upgrade list `[0, 1, 2]`. The
existing spell arithmetic scales the raw power to 92.4 and the interval to
2.2 for the unmodified picker display. The source adds the descriptor to
the ordinary cast catalog and lists it only in the Shaman picker. The
level-up spell pool and default Lightning Bolt starter still come from the
class's gameplay descriptor.

The picker uses the existing multiple-target text expression and the native
`Learnt from {talent}` annotation. The three added keys for the spell name,
talent name and annotation were compared with all fourteen pointer/length
bound native locale payloads, for 42 exact key/value comparisons. These
checks cover the descriptor, pool separation and text inputs. Compilation,
rendered placement, gameplay and original/rebuilt comparison are open.

## Enhancement mechanics in 0.140.0

The same current PE supplies 13 Enhancement talent descriptors starting at
`0x1473d9e18` with stride 176. Their 16 effect records retain the original
definition order. The current tree replaces the pre-rework keys while
preserving the Stormguard and Elemental Sunder keys from the intervening
release. The existing allocation normalizer drops removed allocations,
keeps XP and validates the retained ranks against the current tree.
Native tag 41 replaces the first spell with Rockbiter and tag 40 adds
Stormstrike. The same overlay supplies the allocation catalog and the live
effect rows. Rank-three Sweeping Storm retains the target rank table
`[1, 2, 2]` and applies a separate 1.2 multiplier for Stormstrike or either
spell under Windfury. The native origin check and allocation lookup are in
`0x145f25dc0..0x145f25eee`.

The current melee hit collector records the victim and precritical power
at `0x145f7d07b..0x145f7d18f`. Thundering Strikes adds 1.5 percentage
points of critical chance per rank to those attacks. The current proc
driver at `0x145f25ef0` processes Flametongue before Windfury for Rockbiter,
and continues Stormstrike through Frostbrand, Ancestral Fortitude and Eye
of the Tempest. Its Windfury rank-three branches use one draw and ordered
cutoffs 0.25 and 0.375 for two and three strikes. The first two ranks use
0.10 and 0.18, then a second draw selects five strikes below 0.0001 or two
otherwise. The dispatcher at `0x145f26a70` rebuilds each Windfury strike,
captures its targets and crits, and re-enters the proc driver with Windfury
disabled. Stormbound Echoes repeats a primary proc on a 0.05 draw, retaining
its payload and suppressing further repeat draws. The source routes
Windfury, Flametongue and Frostbrand through their allocated talent
identities for meter publication.

Flametongue uses the rank table `[10, 20, 50]` at
`0x145f26090..0x145f260ee` for added Fire Nova damage and a 5% draw
per rank. Frostbrand adds one target to the effective Frost Shock instance
and rolls 10% per rank. Ancestral Fortitude consumes its eight-, six- or
four-strike counter before a half-strength Healing Wave. The Flurry
deadline and both cooldown consumers are [separately bound to the current
EXE](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/native-interface-correspondence-0.140.0.md#enhancement-timed-cooldown--305).
The source uses the active interval to scale the scheduled decrement and
calculates the remaining wall time across expiry for cooldown publication.

Shattering Elements uses the previous successful learned Shock's key and
time. A different Shock at elapsed time up to and including six seconds
adds 4% per rank before the cast. Successful casts update the key and time
and refresh spell 16246. The buff collector admits only a strictly
future deadline. Elemental Sunder applies spell 7386 to a surviving
Rockbiter or Stormstrike victim, stores a four-second actor deadline and
adds 0.10 to the damage taken multiplier only for Fire or Nature before
expiry. The source retains that deadline with the shared victim's control
state and publishes the application, removal and addon duration.
Current auxiliary spell resources provide the localized Flurry,
Shattering Elements and Elemental Sunder rows. Lightning Shield retains
its existing resource and appends the Stormguard description for an
allocated rank.

Resonant Shocks captures the successful learned Shock's base target list.
The secondary query at `0x145f25350` centers on the first base target,
excludes the full base list, and selects up to the allocated rank within
eight yards. Earth and Frost use 35% of the composed power and independent
critical draws, then apply the original status. Flame installs its normal
periodic payload with the reduced power, scaled duration and tick factors.
Stormbound repeats the secondary query with the same exclusions on a
successful repeat draw. The detailed and legacy meter selectors omit
the Resonant talent identity and attribute the results to the source Shock.

The current necklace constructors supply Heart of the Earthbreaker
(Rockbiter power and first-hit splash), Cinderheart Pendant (Fire Nova
area, power and Flame Shock remainder), and Eye of the Tempest (stat 19,
Chain Lightning chance and power). The Earthbreaker splash centers on
the first captured victim, excludes it from the six-yard secondary
selection, and draws a fresh critical for each secondary victim.
Cinderheart uses the surviving Fire Nova victim's remaining Flame Shock
ticks and per-tick damage without consuming the periodic rows. A party
caster counts unattributed rows and its own rows, and the additional hit
has its own critical draw. Its damage inherits Flametongue's effect
identity when Fire Nova was triggered by Flametongue. Tempest's first
line uses the selected native boss/elite wording, while the shared stat
19 damage consumer also admits Guardian metadata and has no spell filter.
These definitions enter the same worn-effect growth, loot offer and
tooltip path as other legendary amulets. Stormguard uses the live
Lightning Shield state for its capped Armor contribution and publishes
the `bwk` and `bwa` fields to the retained PaperDoll consumer.

| Current PE range | SHA-256 |
| --- | --- |
| `0x1473d9e18..0x1473da6f8` Enhancement records | `9970d57b6e8420fc077de2997018ac989451c9d44814d2b06ac056dd47ed876c` |
| `0x145f25dc0..0x145f25eee` Sweeping damage | `b27d245663f6b6c82753dbc0a245bbdd0bf83db91d7cee21bd5a272cad87827b` |
| `0x145f25ef0..0x145f26a6d` proc driver | `ce8b0092fc2868a2d7ce612408f1924887720468954302c5ef7085faabd2d12e` |
| `0x145f26a70..0x145f2717b` proc dispatcher | `bdd9082068917adbdb0dfe71b69fbfcef2bfd2a5db7d065567c261e8383792b0` |
| `0x145f7d07b..0x145f7d18f` melee capture | `cd8238bf51cd5a48fd498bc086d13fc7822b63cbb18312f150196bdea3a6500d` |
| `0x145f8e773..0x145f8eb99` Earthbreaker consumer | `70ea6618aab7dd0ff33a9a9c705ca71cbc45d5df018ff6593b056a4e6b368242` |
| `0x145f8e23b..0x145f8e35f` Shattering cast | `284dd46fdc5817466fa3ca446a3f192796b4f3e81d87282e6460f27652262a34` |
| `0x145f8ad99..0x145f8ade9` Shattering aura | `d9c41378000deca558c5ce8f60baf0bcf3ff852210739a51c7cd9dd9d9a5a5d5` |
| `0x145f7d37d..0x145f7d409` Sunder application | `59bf53671feca37535e0ff3313e7aabbfadfa75f7ead1ef7b90b7860b55fc48f` |
| `0x145f432c3..0x145f4333b` Sunder hit filter | `c9329f9908b893e1433d78858d15cbed232002c988f8fb5918700d5212dd76f6` |
| `0x145f25350..0x145f25be0` Resonant hit and periodic dispatch | `f359c03c2e3848f34561b36309ceabb4f58b3c05988b9817711107df64738c47` |
| `0x145deaef6..0x145deaf90` Heart constructor | `89549aedd9a90d6511f27314b875c6b8dde4a2738aac98b9a6c359b3ebb7da6b` |
| `0x145debb35..0x145debbe9` Cinderheart constructor | `e7b75019c12a5c1fdfe68c952b89e4369656c9f6584ecc264cad773670bf98a6` |
| `0x145f7e45a..0x145f7e77c` Cinderheart consumer | `f98ca6c5765b336fe00792e638a463eed71980e03697909bd48cc4be5b3e3761` |
| `0x145dec3ba..0x145dec445` Tempest constructor | `35518bf5862a89e953a89e68072d4d3ef92d6d399bfac4ea324cc9ea6c3462eb` |
| `0x145fbbfb4..0x145fbbfcd` Tempest target filter | `cb09e527558384e58864be895076ddd26291a5b05d7d259724716a0720e6fc0d` |

The proc driver and dispatcher use separate Ghidra raw slices, with the
unresolved dispatcher jump table verified in the original PE. The larger
mixed scheduler exceeded Ghidra's inline response size. The bounded
instruction comparisons above use the original file mapping and complete
declared extent decoding. Current tree, necklace and Armor labels were
compared across all fourteen native locale payloads. Compilation, rebuilt
execution, network exchange, rendered UI and original/rebuilt comparison
remain open.

## Shock necklaces in 0.140.0

The same installed 0.140.0 PE supplies three keyed constructors. The current
source replaces the old definitions at their existing save keys.

| Key | Constructor | Current effect rows |
| --- | --- | --- |
| `legendary:frost_shock` | `0x145dffa40` | Winter's Embrace writes raw 49 (70% slow, six seconds) and raw 50 (75% damage bonus against already chilled victims). |
| `legendary:earth_shock` | `0x145dffb90` | Earthshatter Seal writes raw 51 (75% damage bonus below 35% health) and raw 52 (50% of remaining cooldown removed on an eligible kill). |
| `legendary:flame_shock` | `0x145dffae0` | Emberwake Pendant writes keyed raw 73 (40% Flame Shock power) and raw 53 (two additional targets, six yards, 50% of the tick's input power). |

The worn-amulet iterator at `0x146064af0..0x146064b06` passes the growth
factor to `0x145de6d70`. Five signed entries at
`0x1473e71d0..0x1473e71e4` select the same 64-byte copy path
`0x145de71f5..0x145de7218` for raw 49–53. Those records keep their
original fields at all ranks. The keyed raw 73 lane scales separately at
`0x146064b57..0x146064b69`.

Winter's status override first selects the keyed raw 49 record. The
ordinary movement slow and its published aura use the applied magnitude
and duration. The independent chill deadline at actor `+0x1dc` is refreshed
by this keyed effect and remains available to the next Frost Shock even if
a different source replaces the movement slow. The raw 50 branch at
`0x145fbbb13` checks a strictly future chill deadline before adding the
keyed bonus. The raw 51 branch at `0x145fbbcd6` compares
`max_health * 0.35 > health` before adding Earthshatter's bonus. The common
hit owner adds these keyed contributions before Elemental Sunder and
Packlord.

Raw 52 at `0x145fbce23` consumes one eligible ordinary Earth Shock
cast token on a kill before looking up the learned timer. Failed or
nonlethal casts keep the token until an eligible kill. Procs and overcasts
do not arm or spend it. A nonfinite timer first resolves the ordinary live
cooldown. The reduction leaves at least the smaller of the original timer
and 0.25 seconds. The dirty cooldown publishes through the existing timer
adapter.

Raw 53 dispatches at `0x145fbcd19` only for a periodic Flame Shock hit
with the original periodic source kind. It queries around the captured
victim position, excludes that victim, takes the first two candidates
within six yards, and publishes the spell independently for each. The
secondary hit takes half of the tick's incoming power before victim
modifiers, uses source kind 3, and does not draw a critical. The addon
damage row carries the worn amulet's current key and rank.

The learned-spell legendary builder at `0x146020620`, called at
`0x145fee6c4`, skips `lightning_shield`, `healing_wave` and
`explosive_trap` before invoking the constructor. The first name's
separate Talisman constructor remains visible at `0x145dead80`. Source
applies the exclusion in the offer path and retains the keyed definitions
for other lookups. Rockbiter and Stormstrike's generated keys are admitted
by the co-op Seen source registry.

| Current PE range | SHA-256 |
| --- | --- |
| `0x145f84b00..0x145f856e6` shared status owner | `ecd6385054c26b226f5fa59961b696afcae3e97ad3e2f9f4619e848da129aeef` |
| `0x145fbb990..0x145fbbe87` keyed hit sum | `ad646f9ad43325cc17efc8c26847485c71c4c4a6296278b205d39bfdbdc90791` |
| `0x145fbce23..0x145fbcf17` Earthshatter event admission | `b87c1306f7fed5cc7c19b6b0c860466afb1e7746652fbcde87c0b0ca492010f8` |
| `0x145fbf79a..0x145fbf937` Earthshatter timer write | `d88845c3c1b31caeb172b748cb3636996cd5c297579abd8a2c153c860451eee1` |
| `0x145fbcd19..0x145fbcd85` Emberwake event admission | `5d33a7a7f255060fa3a7aa969fbf7384a24290ef8f8ad2a86626ee31bbc9879f` |
| `0x145fbff64..0x145fc012e` Emberwake query and hit | `c36f6d379d68b0da976654a31165b32e46ba202a755d457fb62e530e2e0d6385` |
| `0x1473e71d0..0x1473e71e4` worn dispatch cells | `3912964b4b2434edf15e7cee290a49dce56c1a20fdada1a6b85efd7141ffc790` |
| `0x145de71f5..0x145de7218` unscaled copy leaf | `f890a5e5b47771db8b35fcc599bd9eb682cb15253fea1de4628fa1e10ec10f6e` |
| `0x146020620..0x14602078a` offer filter | `3424b66e2342f0fddd11a7d5514864d03d70010d6ec1e1c3da33206f97c85c80` |

The status owner Ghidra result has digest
`3fde62d270f26a0256ed78078e0ea3ccb4e09353d6bc07ab742a993e5814fe7a`.
The direct PE instructions resolve its detached table and keyed references.
The item labels and effect templates were compared with 112 values across all
fourteen native locale payloads. The selected Emberwake native instructions
passed 25 event cases and 192 count and power cases. Winter and Earthshatter
passed 64 keyed damage and 44 timer cases. Rust source syntax and
the live source connections were checked. Compilation, runtime behavior
and original/rebuilt parity remain open.
