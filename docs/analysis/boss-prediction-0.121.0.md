# Primary-boss predictive aiming — 0.121.0

Selected EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [manifest](evidence/0.121.0/boss-prediction/manifest.json) binds four completed
durable Ghidra queries, exact native code/data and the bounded static checker.
[verification-needed](../verification-needed.md) owns finding **#225** and current status.

The live boss dispatch now projects its actual selected hero's movement report
before constructing aimed effects. Local controller reports and admitted remote
movement packets feed the same per-hero owner. Frame-position differences remain
available to their existing unrelated consumers; they do not supply boss aiming.
The existing engine supplies terrain, collision, spell effects and markers.

## Native inputs and projection

The actual aiming owner is `145bf22a0..145bf29b6`, called by the boss dispatcher
`145bf29c0..145bf825a`. The earlier diagnostic lead `145b778f0` is an ability-stat
helper, not the prediction contract. Raw Ghidra imports omit external code/data;
independently decoded original instructions and bound current data govern the
inputs, branches and arithmetic below.

The input wrapper writes Game+`ce8` movement flags before invoking floor admission
at `145bafde8..145bafe17`. The admitted-pose owner writes XYZ, facing and the
simulation-clock report timestamp at `145bd22b7..145bd22e8`. An ignored pose can
therefore change intent without refreshing its accepted position, facing or
timestamp. Source retains flags separately from accepted pose/time and swaps
both with the existing co-op hero context.

For signed forward and strafe axes, bits 0/1 and 2/3 respectively contribute
`+1/-1`; opposed flags cancel. Bit `1000` suppresses motion, and bit `100` selects
speed 2.5. Pure backward movement uses 4.5; other movement uses the current run
speed, floored at 1.0. The direction is facing plus `atan2(strafe, forward)`.
These are native flag tests, not new controller or camera rules.

The helper first samples primary terrain at the accepted position. It returns
that position immediately for an actor without primary-boss metadata, including
ordinary and guardian actors. For a primary boss it extrapolates report lag,
clamped to 0–1 second, then clips against the existing optional collider with
the native 0.5-yard margin. It clamps to the actual zone center/radius minus
four yards and samples primary terrain again. Failed height samples retain the
preceding Z; no secondary/default height path is added.

For rank `h` and the action's windup `w`, the next projection uses f32 order:

```text
seconds = (float(h) * 0.1 + 0.15) * (w * (h == 0 ? 1.0 : 0.85))
delta   = velocity * seconds
```

A delta shorter than 0.05 is ignored. A delta longer than nine yards is scaled
to nine yards. The helper repeats optional collision clipping, zone clamping
and primary-height sampling for the resulting point. Normal rank zero also has
the recovered small lead; Heroic ranks increase its factor. Rank admission
belongs to the separate Heroic configuration owner. Helper SSE unordered lanes
are preserved in the source comparisons; this bounded static fixture uses
finite controller inputs.

## Connected action consumers

The current signed-relative dispatch table is at `147692f84`. Nine native
families call the same helper, once before their random offsets or direction:

| Native tag | Consumer | Windup supplied to prediction |
| --- | --- | --- |
| 3 | Targeted ground blast | Payload word 3 |
| 4 | Missile volley | Current target distance / native missile speed, floored at 0.6 seconds |
| 7 | Warned charge | 1.0 second |
| 8 | Cone/breath | Payload word 3 |
| 9 | Aimed line | Payload word 3 |
| 10 | Staggered rain circles | Payload word 4 |
| 15 | Rotating line | Payload word 3 |
| 16 | Four directed lines | Payload word 3 |
| 17 | Alternating circle rows | Payload word 4 |

`bosses::prediction::windup` adapts the existing semantic records to these
current native families. `CombatPort::raid_aim` connects the live primary-boss
and selected-hero inputs. `dispatch_live` supplies the projected target to each
existing effect owner. Sequence containers are not projected: their immediate
and delayed children enter dispatch independently with their own windup and
current input. Unrelated actions retain their existing target inputs.

The existing source's twelve zone keys, centers and radii match the current
table exactly. The missile speed lookup is checked separately against its
current original dispatcher branches, including unknown-spell defaulting. This
does not claim that the rest of the historical action catalog or boss behavior
has been completely revalidated.

## Static validation and remaining limits

Run the non-compiling check using the existing project Python dependencies:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-boss-prediction.py
```

The [result](evidence/0.121.0/boss-prediction/static-check.json) records original
instruction replay for 1,104 movement/rank/action contexts, covering all low
movement-flag combinations, cancellation/suppression, walking, backward/run
speeds, zero/long windups, lag boundaries, optional collision, terrain failure,
zone edges and primary-boss exclusion. Separate cases check the native missile
speed lookup. CRT trigonometry/hypot, terrain, collision and zone-key lookup are
explicit synthetic seams. Native bytes, query receipts, twelve source zone
bindings, the live input/dispatch connections and changed Rust syntax are
checked without compiling or running reconstructed code.

Compilation, actual client/network execution, MPQ collision/terrain behavior,
encounter presentation and original/rebuilt parity remain unverified. The
Heroic rank producer is supplied by the separately owned Heroic configuration
integration; this report does not infer admission from the aiming helper.
