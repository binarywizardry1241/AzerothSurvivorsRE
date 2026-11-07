# Camera correction and shake ordering

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report revalidates the selected #35 correction contracts and resolves the
specific control/correction/shake ordering question retained under #41. The
[0.105.0 report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/camera-room-0.105.0.md) retains its historical provenance.
Integrated status belongs to [verification-needed](../verification-needed.md).

## Recovered dependency chain

The current dependency graph explicitly orders **player control → room
correction → camera shake**. The existing Rust registration already implements
this relation; no behavior change is needed.

The [manifest](evidence/camera-room/manifest.json) binds installed code,
vtable and literal bytes. PlayerPlugin's vtable at `145ff4c00` links build slot
`+0x40` to `140cdf0b0` and name slot `+0x60` to `141259950`, whose literal is
`benilla_app::player::PlayerPlugin`. Within that build:

- Correction constructor `140930f20` creates FunctionSystem vtable `145ee2280`.
  Its `+0x48` runner `1409b1160` calls correction `140988190` at `1409b1997`.
  Registration `140cdfa0c` adds an After dependency on set vtable `145f0d278`;
  `140cdfa8a` adds a Before dependency on `145f107e8`.
- Control constructor `140d97cc0` creates vtable `145fc0e10`. Its runner
  `140ea1b70` calls `140e72d70` at `140ea3b85`. The default-set method at
  `+0x90`, `14129eb00`, interns set vtable `1460333d8`. This and `145f0d278`
  are zero-sized sets with the same concrete equality method `140a4bd90` and
  checked TypeId comparison.
- Shake constructor `140930db0` creates vtable `145edff10`. Runner `1409b21d0`
  calls `140964a70` at `1409b249b`. Default-set method `1412a4b10` interns
  `146036318`, sharing concrete equality method `140a4c840` with `145f107e8`.
  Shake registration `140ce0721` independently adds After(control).

These are graph dependencies rather than an inference from plugin call order.
The canonical [After helper](evidence/run-hud/schedule-ordering.asm)
`14013d450` and current Before helper `14013d550` append a 56-byte dependency,
using constructor `144e07e60` to set byte `+0x30` to **1** and **0** respectively.
The actual graph consumer loads that byte at `144e9767f`; endpoint selection
`144e976f4..144e977a1` passes **set → current** for After(1) and **current → set**
for Before(0) to edge insertion `144ebc1d0`. The checker executes these original
append and endpoint instructions with synthetic, preallocated storage.

The correction and shake constructors receive WorldStage variant **1**. The
current stage formatter's length/offset tables spell that variant **Input**.
Correction registration also adds the named **InWorldGated** set; shake's
registration does not. Both registrations append the same negated resource
presence condition via `140cb7340` and condition vtable `145fa3488`. Its runner
`140d04d00` returns true for an absent resource and XORs the live presence byte
with 1 otherwise. Initialization obtains the resource index through
`140d33060`. The connected source names this condition
`not(resource_exists::<CaptureMode>)`; the generic native condition's stripped
name is not treated as recovered original Rust symbol ownership.

Correction reads the placed Transform and writes the corrected translation and
premultiplied rotation. Shake computes distance from that resulting eye, then
adds its offset only to translation at `140965212..14096522d`. A zero offset
leaves the change tick and Transform untouched; nonzero or unordered components
write the position and change tick. Shake's native suspension branch bypasses
record expiry and offset evaluation. Its expiry compaction preserves survivor
order. These selected read/write relationships agree with the existing source;
the report does not certify the complete ordinary controller or shake subsystem.

## Current correction contracts

All seven entries were reached from current registration/call edges, rather
than selected by historical RVA. Their complete bytes and relevant read-only
operands are bound separately from the old evidence:

| Contract | Current entry | Revalidation scope |
| --- | --- | --- |
| Correction | `140988190` | Map 189, arm/axis/pivot gates, ten candidates, 80° bound, bias easing, final cast, eight bisections, rotation composition |
| Candidate | `1409311b0` | Current candidate instructions execute within the pose fixtures; room admission and solid-cast calls are seams |
| Room admission | `140946c80` | Current caller transforms the exact point/optional terrain height and calls the current room-ray owner; full WMO query is a fixture seam |
| Room ray | `14198f0f0` | Current 1,760-yard/flag-0x8 acceptance tail executes; complete face/grid geometry remains outside the fixture |
| Solid cast | `1415c70f0` | Current wrapper retains radius 0.3, solid layer mask 5 and its optional liquid branch; correction passes false |
| Terrain wrapper | `1417080b0` | Current wrapper calls `1417080d0`; terrain sampling remains a seam |
| Rotation arc | `144ff9f20` | Current arc and caller composition instructions execute; the checker compares only resulting position/bias |

`python3 -B scripts/check-camera-room.py` passes **90 bounded native
cases**: the existing **43 pose/bias** and **24 room-admission** inputs, plus
**17 schedule** and **6 final shake application** cases. The 67 historical
inputs/expected results are referenced in place with exact file hashes; the
executed instruction addresses and constants are current. All 67 current
outputs are exactly identical to the retained results and also meet the
independent scalar source model's tolerance.

The schedule cases cover both dependency directions, individual/empty/grouped
configuration, membership append, both system/set node kinds and index/generation
boundaries. Shake application cases include zero, negative zero, finite offsets,
NaN and infinity, checking translation, preserved quaternion and change tick.
The check revalidates the complete installed target, retained extracts and live
source registration/query routes. It does not compile or execute Rust.

## Remaining limits

The pose fixtures provide synthetic terrain, WMO admission and solid-cast
results. CRT asin/cos/sin/exp use explicitly rounded Python math seams, so the
check does not establish Windows CRT equivalence. Original quaternion
instructions execute, but Rust/glam quaternion equivalence is not established
by the position/bias comparison. Raw REA/Ghidra imports use a generic GCC ABI
and omit external code/data; PE instructions govern Windows arguments.

Graph fixtures omit interning, allocation, hashing and full scheduler execution.
The proof establishes these selected dependency edges, not global scheduling
completeness. Complete WMO face/grid and terrain/physics behavior, MPQ-backed
camera interaction, actual hardware input, world admission and original/rebuilt
rendering/gameplay parity remain unverified. No build or application was run.
This evidence does not close generic camera/engine parity or whole-image #41.

## Retained reports

[0.105.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/camera-room-0.105.0.md)
