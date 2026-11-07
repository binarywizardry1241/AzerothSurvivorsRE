# Heroic rotation and horde affixes

Target: the installed **0.121.0** EXE, SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the source/static portion of **#221–#224**. The
[manifest](evidence/affixes/manifest.json) binds exact code/data ranges,
completed durable Ghidra queries and source checks. [verification-needed](../verification-needed.md)
owns overall status; [Heroic helpers](heroic-native.md) retain their earlier
bounded selection proof. Source integration does not establish execution or parity.
The historical Sanguine recipient policy below is superseded in source by the
[0.123.0 horde-only repair](sanguine-recipients.md) under **#262**;
the older native evidence and unrelated affix recovery retain this target.

Native recovery and source delivery are accounted separately. The manifest's
`implemented_source_scopes` lists the connected source repairs: `selection`,
`bolstering`, `sanguine` and `explosive`. Its source checks and source receipts
cover only the listed scopes. The target contracts below remain recovered
evidence when a corresponding source scope has not yet been delivered; all
native-byte and synthetic replay checks still run in every scoped check.

## Rotation and construction

`145ac9f90..145ac9fde` reads the host clock and asks the existing duration
interface for elapsed time since Windows FILETIME Unix epoch
`0x019db1ded53e8000`. An error returns zero. Otherwise it divides unsigned elapsed
seconds by **604800**, then retains the low u32. There is no Monday/calendar
adjustment. The shared `heroic::current_week()` source preserves that contract.

The exact zone-key helper `145a9c190..145a9c2b9` returns these ordinals:

| Key | Ordinal |
| --- | ---: |
| `elwynn`, unknown key | 0 |
| `duskwood` | 1 |
| `wsg` | 2 |
| `ungoro` | 3 |
| `ab` | 4 |
| `feralas` | 5 |
| `arena` | 6 |
| `sm` | 7 |
| `av` | 8 |
| `brm` | 9 |
| `aq` | 10 |
| `naxx` | 11 |

`heroic::zone_selector` combines that ordinal with seven times the captured
week, using the existing wrapping-u64 selector helper. The recovered rank
selector chooses no affix below rank3, one at3/4 and two distinct IDs at5.
Its ID0/1/2 consumers are respectively Bolstering, Sanguine and Explosive.

The picker/start producer independently inlines the clock arithmetic at
`145b232cb..145b2332d`. It writes the captured week to application state+17e4
at `145b23623`; rank is written to+1807 at `145b2368c`. These are the run
configuration at application state+1648, offsets+19c and+1bf. Start owner
`145b2d080` captures that word pair at `145b2d242`, writes it into temporary
configuration+19c at `145b2d433`, retains rank+1bf at `145b2d46a`, then moves
all **448 configuration bytes** and calls the Game constructor at `145b2d770`.
The constructor's previously recovered `145bdcc01..145bdcc33` consumes those
same captured fields. It does not read the clock again or seed from run RNG.
The selection foundation exposes one configuration method and stores the active
IDs/rank. The live picker/start consumer that supplies the captured rank/week
belongs to **#219**'s separate constructor integration; the foundation alone
does not claim that consumer is delivered.

Solo **Again** reuses that captured week. The current terminal renderer loads
`end.again` at `1400d5ad7` and stores action byte0 at `1400d5af0`; its button
component stores terminal-action tag2 and that byte at `1400d5ed1..1400d5edf`.
The current terminal-input owner `140411f40..140412652` reads the action byte
at `1404125a0`, indexes the exact `[6,8,9]` table at `146209338`, then submits
the selected command at `1404125be`. Thus Again selects command6.

Command owner `145b2a420..145b2bbf1` indexes its signed-relative table at
`147665af0`; command6 enters `145b2a4b0`. Its solo lane reaches `145b2b156`,
persists the terminal result, takes the old Game, checks an active connection
and calls the same retained-configuration start owner at `145b2b50d`.
An absent old Game or active connection does not construct a replacement.
This route does not enter picker owner `145b21eb0`, whose separate producer
captures the week. The selected route leaves application state+17e4 (week) and
+1807 (effective rank) unchanged and passes that same application state into
`145b2d080`. Its retained rank load at `145b2d23a` reaches the temporary
configuration+1bf through `145b2d463..145b2d470`, including the byte store at
`145b2d46a`. The existing eighteen Again cases seed ranks0/3/5 and check both
retained fields without changing their native instruction paths. The cooperative branch
instead invokes its separately owned party callback; this does not establish
that every terminal command constructs a local replacement.

The additional durable raw Ghidra query identifies the current command
selector but cannot resolve its external jump table. The exact current PE
table, decoded branch instructions and bounded original-instruction cases
establish this route; terminal persistence and old-Game result extraction are
explicit fixture seams, not executed account/file operations. The source keeps
the captured discriminator through `begin_restart` and applies it to the newly
constructed Mechanics through `configure_heroic_affixes`.

## Bolstering

Current shared actor-hit owner `145c159a0` enters its affix death branch at
`145c17235`. Boss, guardian and ward deaths have separate optional-owner fields
and do not enter this branch. ID0 collects other living ordinary/elite actors,
excluding special owners and the dead GUID, with inclusive XY squared distance
**144**. Z does not participate. A stack byte at Actor+1d9 admits old values0–9;
10 or more does nothing.

For old stack `s`, the native operation multiplies current HP, maximum HP and
actor damage by `(1 + 0.2*(s+1)) / (1 + 0.2*s)`, then increments the stack.
This is additive scaling up to triple base HP/damage. Scale separately multiplies
by exact f32 **1.05** per admitted stack. Native packet fields22,28,4 publish
ceiled current/max HP and scale bits. `mechanics/affixes.rs` connects the real
lethal-hit path, actor state, scale projection, packet fields and actor retirement.
The six actual combat adapter constructors borrow the same run affix state.

## Sanguine

The same ordinary death branch tests the dead actor's nonzero elite byte before
ID1. It samples death XY through the existing primary/secondary/fallback height
interface, allocates dynamic spell **26573**, radius **6**, and retains a pool
with expiry `now+15` and first tick `now+1`. Pool and raid hazard markers share
one wrapping u32 identity owner, exposed through `Pending::allocate_marker_id`.
Using a second counter would collide in the frontend's shared marker map.

Tick owner `145c28900` checks pool expiry before its healing deadline. Every due,
unexpired pool advances its stored deadline by exactly one second and heals
living actors within inclusive XY squared distance **36**. Filter helper
`145c7da10` excludes ward-config actors; ordinary/elite actors, guardians and
primary bosses remain eligible. Requested healing is10% of each recipient's
maximum HP, capped to missing HP and floored at zero. It publishes health field22;
this path does not manufacture a player heal or a spell-heal log.

The creation marker carries `type=hz`, `kind=mend`, `shape=circle`, radius6,
angle0, sampled XYZ, shared identity, `t0=now`, `t1=now+15` and `t=now`.
After all due heals, expired pool indices are removed in reverse order; their
dynamic objects and matching `hzend` marker are removed. Source reuses the
existing engine ground-object, object-field and marker consumers.

## Explosive

ID2's first admitted tick arms `now+40`; later due ticks arm `now+15` and create
one orb. The existing shared xoshiro RNG supplies angle in `[0,2π)` and radius
in `[6,14)`, followed by ground sampling. Current HP construction uses the zone's
first ordinary enemy, current time/difficulty HP polynomial and baseHP*4.95,
then the selected Heroic HP multiplier and a final doubling. It does not add
an invented endless or second cooperative spawn factor.

The exact spawn call `145c29534` passes template12, parentGUID0, config kind3
with f32 fraction0.4, and lifetime **8 seconds** into existing ward constructor
`145be8d10`. That constructor clamps the template index to12 and reads the
32-byte table at `146fc0b40`. Index12 is descriptor `146fc0cc0`: entry **9612**,
display **16111**, scale **0.9**. It forwards the actual entry/display/scale into
the existing UNIT constructor at `145be8dd5`. This is an actual spawn connection,
separate from [CreatureQuery metadata](explosive-orb-query.md) or proof of
resource loading/rendering. The source extends the existing ward actor lane;
target selection, allocation order, shared counter, UNIT fields, status, death,
corpse cleanup and rendering retain their existing consumers.

Parentless kind3 admission in actor-hit looks up the class pool, then learned
records, matching both spell ID and pulse ID. Kinds **2,3,8,10,11** are rejected
by bit mask0xd0c; weapon spell0 bypasses that lookup, and unmatched IDs retain the
native admission. Admitted damage is capped to maximumHP/5 **after** victim
modifiers and before the common minimum-one floor; a zero capped request returns
before that floor. This preserves the actual bounded rule rather than inferring
all DoT/proc behavior from the help text. The current113 native records' spell
IDs, pulse IDs and kinds, and all nine class pools, match the source lookup.

At expiry, `145c2238d..145c225bf` re-finds the living orb, emits ground spell
**20475**, then in running state requests
`0.4*playerMaximumHP / max(1-playerArmorFraction,0.1)` through the existing
incoming-damage owner. This compensates the ordinary reduction before immunity,
absorb, reactive/death and cooperative incoming scaling. There is no radius test
in that branch. Removal follows even when player damage is not admitted.
The warning uses localized **SMSG_NOTIFICATION**, opcode0x1cb, with the exact
`An Explosive Orb appears! Destroy it before it bursts!` key.

The current actor update captures cooperative mode and active hero. Its
`145c1db92..145c1dbb6` gate skips decisions/ward-action collection unless
Actor+f8 equals the active hero. Collection at `145c1deab..145c1df62` follows
that gate. The deferred expiry therefore belongs to the orb's selected target
hero, rather than every party member or whichever local context happened to
resolve a shared queue. Source restores that target slot with `with_party_hero`
before ward resolution, preserving personal maximum HP, armor, phases, position,
facing, damage, meters and private events. Shared actor mutation/removal occurs once.

## Static verification and limits

Run from the owning checkout with the existing project Python dependencies:

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-affixes.py
```

The [result](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.121.0/affixes/static-check.json) binds the installed
hash, **32 code ranges / 51 data ranges**, independently decoded containing-owner
boundaries, **six completed Ghidra query subjects/results**, current113 ability
kind records/nine class pools. Source syntax and connection checks follow the
manifest scopes: selection alone checks3 Rust paths; all four scopes check14.
**293 synthetic
cases execute5,600 original instruction steps**. Synthetic replay
covers zone keys, week/error/truncation cases, captured448-byte configuration,
Again's action/command selection, Game admission and retained-week restart route,
pool expiry/heal/target gates, stack caps and radius boundaries, orb deadline,
actual spawned template/GUID arguments, direct-hit categories/cap and expiry
incoming-damage arguments, plus cooperative target-context ownership.

Allocation, interpolated position, SystemTime/duration, memcpy, UNIT/run
construction, terminal-result persistence, empty old-Game result extraction and
canonical player-damage interfaces are explicit fixture seams.
The original instruction slices execute only in synthetic memory. Reconstructed
Rust, native library/OS calls, a game/client/network/server and original/rebuilt
comparisons do not execute. Compilation, exact platform float/CRT behavior,
actual combat/scheduling, packet/marker presentation, model/resource rendering,
network delivery and original/rebuilt parity remain unverified.
