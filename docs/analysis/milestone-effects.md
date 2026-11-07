# Current milestone casts, conversion and indexed refresh

2026-10-19. Specification: project-local supplied 0.100.1 EXE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
This pass implements generic families1 and5. Family2 has a recovered pure
request producer; its actual companion lifecycle remains unimplemented.

[Curated native evidence](evidence/run-effects/milestone-native.json)
retains PE addresses, byte-range hashes, instruction windows, the current Imp
record and REA/Ghidra companion-constructor evidence
`ev_1324ee0783b240f5a2ed30fcb5eb61ad32a72f45f6728206819594fca35878d3`.
The shared dispatcher was previously recovered by REA/Ghidra as
`ev_d2f300408601fd291c98dd0b810b54ef21984d81b3b1f22ac6e465871b024862`;
its actual switch targets come from current table1469f8748. Raw-function
decompilation alone does not recover that external table.

## Generic1 counted free casts

The native branch starts at1454cbcf4. Its64-byte row contains thresholdu32 at4,
optional per-second capu32 at8, freecast key at16/24 and condition at32. The
current catalog uses this for Rampage7 kills→Whirlwind, Adrenaline20
kills→Adrenaline Rush, Rapid Fire6 selected casts→Aimed Shot, Maelstrom5
casts→Chain Lightning, and Hot Streak4 qualifying Fire critical casts→Pyroblast
with a two-per-second cap.

After condition32 passes, the source-index counter slot must exist. Native
increments theu32 with wrapping arithmetic, then caps it at the threshold.
Below-threshold events return. A nonzero rate cap retains timestamps whose
f32 age is strictly less than one second; a full cap rejects the trigger while
leaving its counter at the threshold. An absent timestamp slot bypasses the
cap. An admitted trigger appends the current time and clears its counter
**before** resolving the freecast. A failed cast therefore still spends the
trigger. Family1 itself consumes no chance draw.

The shared freecast tail1454cde33 resolves the definition, obtains the current
free instance, installs effect-index attribution, increments recursion depth,
executes synchronously and restores attribution/depth. The implementation
shares this tail with generic0, preserving learned upgrades and the existing
unlearned-instance factory. It adds no learned slot or ordinary cooldown
publication. Current successful ordinary/racial cast producers and real
hit/death/token producers reach this consumer through the common dispatcher.

## Generic5 maximum-health damage

The branch1454cc453 reads fractionf32 at4 and condition at8. On admission it
resolves the event GUID in the actual actor collection and rejects native
death state1. At1454cd244 it multiplies the raw fraction by live victim
maximum health, saves source-kind, sets source3 and calls canonical actor-hit
1454d4ff0. It preserves the original event spell ID and school, forces
criticalfalse, suppresses the direct spell log iff that original ID is0,
then restores source-kind. This is additional damage; there is no global
damage multiplier, chance draw, separate invented visual or melee packet.

Current talents are Titan2% on Shield Slam, Hammer of the Righteous1.5% on
Hammer of Justice, and Shadow Weaving1% on matching Shadow hits. The live
consumer uses the existing ordinary/boss/guardian canonical hit path. Its
source3 classification suppresses generic recursion. Preexisting generic hit
callers retain their prior log-suppression parameter; only this newly recovered
branch supplies its zero-spell predicate.

## Reward refresh state ownership

Current refresh1454c9c50 independently applies the same boundary to three
indexed vectors: deadlines Game70/78 at1454c9fb4..ca03d, counters Game88/90
at1454ca041..ca0d6, and timestamp vectors Gamea0/a8 at1454ca0dd..ca1a1.
It preserves the base-talent prefix, discards the equipped suffix and appends
zero deadlines/counters or empty timestamp vectors for the newly composed
rows. Resizing an unchanged-length vector was insufficient: a replacement
amulet could inherit the previous amulet's cooldown or rate cap.

The shared pure refresh helper now owns that boundary for all three live
lanes. Actual treasure acceptance refreshes those lanes before shared choice
completion. Base talent progress survives jewelry/amulet refresh; amulet
empowerment or replacement recreates its suffix state.

## Generic2 temporary-companion producer and remaining gap

Demonic Pact is a distinct chance-based summon branch at1454cc206. It stores
chancef32 at4 (.08), durationf32 at8 (15), capu32 at12 (5), PetDefinition pointer
at16 and condition at24. Condition failure consumes no RNG. A passing condition
always draws the shared24-bit chance value **before** checking the cap.
Its `UCOMISS/JB` comparison also takes the unordered arm. It counts stored
96-byte companion rows with temporary flag and the same effect index; there
is no health or expiry filter at this event edge. A full cap returns after
the chance draw. An admitted request records temporary=true, expiry=clock+
duration and the source index, then draws its relative angle through current
23-bit range owner14550d590 before calling1454caaa0.

The retained constructor1454caaa0..1454cb721 uses native terrain queries,
the shared object serial, a real Unit descriptor and a96-byte companion row.
The current pointed record1469f1e88 is Imp: entry9512, model4449, scale1,
damage35.5, interval2, spell133 and school2. Its origin fields survive into
the stored row. The pure request helper reproduces the producer's chance,
cap, expiry, angle and RNG state. It is **not dispatched into the live game**:
real companion movement, attack, target, expiry and presentation consumers
remain the owning family2/29 dependency. No ordinary-enemy substitute is used.

## Validation

`scripts/recover-milestone-effects.py` completed760 independent
unchanged-instruction cases:96 counter gates,84 timestamp rate states,
36 conversion scalars,47 counter refreshes,47 deadline refreshes,162 timestamp
refreshes and288 companion requests/RNG states. All code windows are
hash-bound to the selected EXE. Timestamp-extension cases execute the actual
145533c70 helper with preallocated outer capacity and empty rebuilt rows;
removed suffix vectors are empty in that bounded native replay, so no
allocator/deallocator is stubbed. The nonempty suffix destruction path is
retained as textual native proof and exercised by the application replacement
regression.

Four new library tests consume those native vectors. Three application tests
exercise real Rampage deaths/Whirlwind damage and refresh preservation,
Hot Streak's pending rate-rejected trigger and first-critical token, and
Shadow Weaving's live100-point conversion from10000 maximum HP with original
metadata and unchanged shared RNG. A treasure test accepts an actual
same-length Execute→Onyxia replacement, retains the base Rampage state and
requires every rebuilt deadline/counter/timestamp suffix slot to reset.
The central r19 pass passed544tests across29suites, including54library,
172application and58mechanics cases. All new native-vector and live regressions
passed. The application build passed separately. No controlled original/rebuilt
interaction comparison is claimed; diff hygiene also passed.

Families16/17 exact weapon/pet power consumers, permanent25/forms and actual
followers29 remain separate gaps. This pass does not establish complete run
or original/rebuilt visual parity.
