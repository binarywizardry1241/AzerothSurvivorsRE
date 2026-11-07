# Mograine Marks and immediate ground-circle escape

The selected source/static repair for finding **#294** is complete.
[Verification #294](../verification-needed.md#gap-294) retains compilation,
execution and original/rebuilt comparison. The authoritative installed EXE is
0.127.0, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [native manifest](evidence/0.127.0/mograine-marks/native-manifest.json)
binds original instructions, referenced constants and journaled Ghidra results.
The [current data records](evidence/0.127.0/mograine-marks/data-records.json)
own the selected catalog identities and payloads. Historical raid contracts
retain their recorded target and broader limits under #42/#43.

## Mark timing and damage

Current native action dispatcher `145c5a780` reads the record discriminant at
`+2d`. Its guarded signed-relative table at `1473e17e8` selects native11 at
`145c5da28`; the `0xa0180006` mask is a separate common-blocking gate, not a
count of reachable actions. This resolves the selected `AS-context-table:
0x145c5aac0` interface subcase without certifying all other table variants.

Native11 computes an escape allowance from the actual Mark radius:

```text
escape_seconds = radius / 7.0 + 0.5
warning_factor = rank == 0 ? 1.0 : 0.85
windup         = max(payload_windup, escape_seconds / warning_factor)
follow_until   = max(now, min(now + payload_tracking, actual_end - escape_seconds))
damage         = effective_actor_damage * payload_damage_factor
```

The adjusted windup reaches cast presentation and shared hazard creation. The
follow cutoff reads the created hazard's actual deadline; it does not subtract
a fixed 0.6 seconds from an unscaled payload. The SSE unordered selections are
visible in the retained original instruction fragment and must remain explicit
when source arithmetic is connected. Current Highlord and Scarlet Commander
payload identities are recorded independently from this shared runtime rule.
Highlord Mograine's native11 damage factor is 1.2; the historical source row
used 1.6. The other recovered actor/Heroic damage consumers remain separate.

The retained current Ghidra census supplies the constructor dependency at
`145c59db1..145c59dcb`: it chooses the same rank factor, multiplies the adjusted
windup and adds the current clock. The created row stores that result at
`+54`. Its exact instruction boundaries and bytes are bound in the manifest.

The common action-duration helper also changed. For native11 its result is
`max(payload_windup, radius / 7 + 0.5)`, independent of Heroic rank. For native18
sequences it recursively takes the last child's duration and adds
`(count - 1) * spacing`; an empty sequence returns zero. Scarlet Commander's
second Mark is the last child of such a sequence. Its enclosing AI block must
therefore use the new child duration too. The common dispatcher takes the
maximum of the prior AI deadline and `(now + duration) + 0.4`. This differs
from the rank-adjusted Mark cast/impact windup above. The small cast helper
only queues nonzero-spell presentation; it supplies no additional AI hold.

## Accepted tracking and projected hit admission

Shared hazard update `145c50640` retains two distinct points. The accepted
position comes from Game `+520/+528`; its ground height uses the primary
provider, then an available secondary provider, retaining accepted Z if neither
answers. A following Mark copies this accepted, grounded point while its
tracking cutoff is strictly later than the current clock.

The update separately projects the admitted movement report for hit admission.
It uses movement flags at Game `+d3c`, admitted facing at `+52c`, current run
speed at `+5a8`, simulation clock at `+cc0` and report clock at `+d40`. The live
adapter supplies `BossCombat.player` as the current selected-hero position,
including a forced/replaced pose already installed in that context. An archived
`MovementReport.position` cannot override it; the report supplies the retained
facing, intent and clock.
Signed forward/strafe axes, cancellation, suppression bit `0x1000`, walking
speed 2.5 and pure-backward speed 4.5 retain the existing recovered movement
contract; other movement uses run speed floored at 1.0.

The projection adds velocity times `clamp((now - report_clock) + 0, 0, 1)` to
raw accepted XYZ. An available collision provider clips from the grounded
accepted point to that destination with a 0.5-yard margin. Clipping interpolates
Z as well. There is no boss windup lead, zone clamp or post-projection terrain
sample in this hit-position path.

Ordinary circle, donut, line and cone impacts first test the accepted point
and then the projected point, rejecting on either failure. Initial Aftershock
hits and enemy-producing impacts consume that same result. Periodic and later
Aftershock branches call the same shape predicate for both points with the
same short circuit. A projected exit therefore prevents a hit while projected
entry alone cannot turn an accepted miss into damage.

Crystal exposure uses the opposite combination: accepted **or** projected
membership admits its exposure request. It explicitly retries with the
projected point after an accepted miss. Gaze's leaving-circle trigger, tether
break/geometry, marker occupancy and grouped tower soaking retain accepted
coordinates. Following centers remain accepted as well. These separate input
domains prevent a blanket position replacement from changing control, visual
or beneficial-area behavior.

The unused historical `PendingEffects.impacts` adapter has no writer in the
current recursive schedules; live ground areas and volley impacts use the shared
hazard vector. Sanguine heals enemy recipients, and Explosive Orb expiry has no
player radius gate. Neither supplies another escape-admission consumer.

## Evidence and validation limits

Three completed Ghidra analyses supply the current update, dispatcher prefix
and native11 branch; the completed full-image census supplies constructor
timing without repeating native decoding. Raw imports omit external globals,
callees and switch tables. Original PE bytes and separately bound constants
govern ABI and switch interpretation. Selected indirect case blocks omitted
by Ghidra are covered by exact parent-EXE decoding and bounded replay, with
that distinction recorded in the manifest. The update's oversized MCP reply
reports a transport failure while its complete exported Evidence establishes
analysis completion.

The two journal-completed queries carry exact raw-result, original-plan, slice
and analysis-profile receipts for discovery graph reviews. The oversized tick
reply remains export-only; it is not a completed raw-result journal operation.

The [static check](evidence/0.127.0/mograine-marks/static-check.json) records
**5,977 isolated original-instruction cases**. With the project's retained
Python libraries, use:

```sh
python3 -B scripts/check-release-raid.py --marks \
  --python-libs runtime/camera-recovery-0.105.0/python-libs \
  --python-libs runtime/armory-recovery/python-libs
```

Coverage includes all 23 current Marks, six Heroic ranks, producer/constructor
arithmetic, 32 sequence duration records, 3,780 movement-projection cases,
tracking boundaries, real circle/donut/line/cone predicates, harmful dual-pose
admission, Crystal either-pose exposure and accepted-only control cases. Named
CRT math, terrain and ray results are explicit fixture seams. Live source
connections and syntax were checked without compiling or executing Rust.

Compilation, actual movement/collision, local and recipient gameplay,
encounter rendering and original/rebuilt parity remain unverified. No game,
client, network service or server was run.
