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
effect collection, live Flurry state and rate publication. Recover the
remaining origin and recursive proc edges, migration and active tree,
necklace effects and growth, armor/stat attribution and the picker and
buff consumers before certifying the rework.

The exact descriptors and pool, aura application and expiry instructions,
and four bounded Ghidra results were checked. Two broader function queries
exceeded the inline response boundary. Their raw instruction observations
do not establish whole-function ownership. Compilation, rebuilt gameplay
and original/rebuilt comparison remain open.
