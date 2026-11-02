# Raid death-output pickups — 0.112.0

Authority is the configured installed Windows EXE, version **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The current [manifest](evidence/0.112.0/raid-reward-pickups/manifest.json),
[instruction extract](evidence/0.112.0/raid-reward-pickups/selected-native.asm)
and [Ghidra provenance](evidence/0.112.0/raid-reward-pickups/rea-provenance.json)
bind the AS pickup creator `145944310..14594544f` and AS object provider
`14594f020..14594fb4d`. This continues the explicit pickup-output boundary in
[primary boss lifecycle](raid-boss-lifecycle-0.112.0.md) and
[guardian lifecycle](raid-guardian-lifecycle-0.112.0.md). Current implementation
status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Current AS mechanics

The shared creator first measures the requested XY displacement using the
actual CRT hypot call. Radius is `max(zone.radius-2,1)`. The ordered
`radius >= distance` branch keeps the position; the other branch normalizes
both components, including unordered input. Clamping performs a terrain query
whose result is discarded. Each creation arm subsequently queries final height
again, using primary height, optional secondary height, then world fallback.
An accepted primary NaN remains the height. These are AS call/operand rules;
terrain implementation remains the existing world port.

Kind 0 counts stationary XP rows. When at least **45** exist, it adds the
requested amount with u32 wrapping to the nearest eligible row. Squared
distances use current f32 operation order and total ordering; equal distances
retain the first row. In-flight XP and other pickup kinds are excluded. This
path does not allocate a counter, consume RNG, publish a create event, refresh
the existing display, or perform the final height query. The entry clamp query
still occurs if needed.

A newly created XP row uses creature entry **9001**, no facing RNG and a UNIT
descriptor. Amount below 4 uses scale 0.22; 4–19 uses 0.35; 20 and above uses
0.9. Display is 1825 below 20 and 16587 otherwise. Current descriptor fields
include health/max-health/level 1, faction 35, flags field 46 `0x02000002`,
both radius fields 0.1, and display/native-display. Zero amounts still create
when the caller requests them and aggregation does not apply.

Gold uses entry **9004**, display **2614**, scale **0.6**, object type 5,
native kind 5 and flags 0. Its AS GameObject provider increments the same
wrapping counter, constructs the `f110` GUID, consumes the actual 23-bit
facing draw, and writes the recovered quaternion, position, orientation and
other object descriptor fields. Magnet kind 6 creates entries 9009/9010/9011
in order, with flags 0/16/16 and three separate counter/facing draws. Its
logical row owns the first GUID and retains the two auxiliary GUIDs.
Existing rune kinds 3–5 are checked as regressions because they share the
normalization helper. Cache kind 2 retains its separate existing owner.

## Connected source and client port

[`create_reward`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/pickups.rs)
now owns XP/gold normalization, aggregation and publication. The primary
boss death port, guardian gold callback and ordinary death adapter use it.
The existing special-object creator shares the recovered XY normalization
and final-height path. The independent gold-facing adapter was removed;
the actual AS object provider now supplies the counter, facing and fields
together.

XP and gold previously remained host pickup rows rendered by a fallback
model path. They now publish their actual UNIT/GameObject descriptors through
`RunEvent::PickupObject` and the existing client `ObjectCreate` interface.
The AS event adapter respects object type 3 versus 5; native descriptor scale
and display fields pass to the existing client. XP/gold fallback drawing was
removed to avoid a duplicate entity. Cache host views retain their current
owner. Existing `PickupMove` and `ObjectDestroyed` events operate on these
same GUIDs. No benilla engine source, renderer, serializer or terrain provider
was changed.

The primary death composition executes current pickup/object bodies,
equipment candidate/roll bodies and XP attraction together. Gold's facing
draw, followed by an optional magnet's three draws, precedes equipment RNG.
Both newly created and aggregated XP paths are included for all 60 bosses.
Guardian composition executes gold creation before the current scheduled
magnet helper, proving that its chance draw sees the post-gold RNG state.
Future/empty heads, equal and unordered deadlines, and a due second record
behind a future head are included.

## Checks and limits

`python3 -B scripts/check-raid-reward-pickups.py` checks **2,088**
synthetic original-instruction cases: 192 descriptor/counter/RNG profiles,
12 population boundaries, 1,440 zone/terrain/NaN positions, 12 nearest-order
and wrapping-amount profiles, 240 primary compositions, 144 guardian
compositions and 48 adjacent radial admission boundaries. It also checks
44 source tokens and structural publication/aggregation order across eight
AS source files. `--stage` writes an ignored candidate; `--verify-stage`
checks that candidate without promotion.

The proof retains 922 new instruction rows and references 955 canonical rows
from primary boss, guardian and shared raid lifecycle evidence. Each referenced
instruction is checked against current installed bytes. Recorded ownership is
fixed during default verification; ambient/runtime extracts cannot change it.
Two fresh bounded Ghidra operations support the creator/provider review.
Ghidra cannot resolve the creator's computed switch in its headerless raw
import; the current seven signed-relative slots and executed cases are checked
separately. The enum domain is a caller context, not an invented arbitrary-input
selector guard or a new function-ownership claim.

Field-map storage, allocation/vector growth, localization, packet serialization
and terrain answers are controlled ports. CRT numeric responses are controlled
host responses. No Rust compilation, compiling tests, game process, MPQ terrain
comparison, packet/wire comparison or rendering/audio comparison ran. Cache
creation, complete collection/XP/stat callbacks and runtime interaction retain
their separate owners; this proof ends at the established client interface.
