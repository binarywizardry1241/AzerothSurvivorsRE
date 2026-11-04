# Enhancement recovery in 0.139.2

[Finding #305](../CURRENT-STATE.md#gap-305) and the [native
receipt](evidence/0.139.2/enhancement.json) use the installed EXE with
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
The existing [0.139.1 local correspondence](native-interface-correspondence-0.139.1.md)
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
