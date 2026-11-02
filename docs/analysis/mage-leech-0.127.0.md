# Mage damage leech — 0.127.0

Finding **#292** is bound to installed EXE SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [native evidence](evidence/0.127.0/mage-leech/manifest.json) owns the exact
class data, scalar producer, hit/healing consumers and static validation.
[verification-needed](../verification-needed.md#gap-292) records source/static
completion, compilation,
application behavior and original/rebuilt comparison.

## Class scalar and its live producer

The current class table starts at `14703c908`, with nine 144-byte descriptors.
Mage's key/name/icon identify the row at **`14703cc68`**. Its +0x88 leech field
contains **`0x3ba3d70a`**, the f32 value 0.005. The current class-ID pointer index
at `1473e1450` selects that descriptor for class8. The other eight current class
leech fields match their retained source values.

The leaf `145c27310..145c2751e` computes the actual hit-time scalar in four
independent lanes, in this exact order:

1. Sum live temporary generic15/stat14 rows, multiplying each magnitude by its
   stack count. Expired rows, unavailable indices and other tags do not contribute.
2. Add the selected class descriptor's +0x88 scalar.
3. Add the separately accumulated permanent stat14 contributions.
4. Add the separately accumulated equipped jewelry leech values, native tag18
   normalized to source tag17.

The old source grouped `(class + jewelry) + (permanent + temporary)`. Even modest
values differ by a float bit: temporary0.001, class0.005, permanent0.001 and
jewelry0.01 yield native `0x3c8b4396` versus the old `0x3c8b4395`.
`healing::LeechBase` preserves the independent class/jewelry lanes, and both the
ordinary effect refresh and synchronous temporary-stat refresh use the recovered
order. The historical talent asset keeps its original target identity; the
catalog overlays only Mage's proved current scalar.

Each ordinary, boss and ward hit resolves the temporary contribution iterator
at its own run clock. Ordinary casts precede the frame's expiry compaction, so
the cached frame stat cannot admit an already expired leech row. This preserves
the recovered cast/expiry stage order while matching the hit-time scalar leaf.

## Damage and healing consumers

The canonical hit owner `145c322c0` calls the live scalar producer at `145c33518`.
For a positive scalar it multiplies the **full post-modifier hit amount**, including
overkill, before applying the current Withering factor and clamping health.
Damage meters retain their independently capped effective damage. Leech credits
the actual positive health gained to the explicit Leech meter, without turning
it into an ordinary spell heal, overheal-conversion request or spell combat log.

The source's direct, pending projectile, periodic, proc and pet attribution paths
reach the shared damage adapters. Installing a DoT is not an additional direct
hit; its actual ticks enter with their retained owner/source context. Ordinary,
boss and ward hit adapters use `HitDamage.amount` for leech while their damage
meters use `HitDamage.effective`.

The existing queue previously delayed leech until the end of a cast or tick.
The execution-aware ordinary/boss/ward hit paths now commit Leech at the common
post-damage boundary, before status/death/loot and class-special consumers. Nested
legacy callbacks retain their request until the enclosing execution boundary
drains it, before generic freecast predicates. Other queued healing and absorption
retain their existing scheduling. This lets same-frame consumers observe the
health actually restored by the preceding damage, including a healing freecast's
high-health rejection.

## Validation boundary

`check-balance-definitions.py --class-leech-contract` verifies all nine class
descriptors and replays **405 original scalar cases plus 360 original healing
consumer cases**, totaling **34,299 unchanged instructions**. Cases cover active,
expired and differently tagged temporary rows; permanent/jewelry combinations;
zero, negative and NaN scalar admission; full-hit power; health caps; and
Withering below/at/above its rank boundary. The source checks trace the class,
refresh, ordinary/boss/ward hit and per-hit healing consumers.

Authored Rust regressions cover exact addition bits, all four source kinds,
overkill versus the damage meter, Withering, an ordinary cast on a temporary
leech expiry boundary and a health-gated freecast crossing
its threshold after leech. They have not been compiled or executed. These static
checks do not establish actual client/server scheduling, rendered meters,
cooperative transport or original/rebuilt gameplay parity.
