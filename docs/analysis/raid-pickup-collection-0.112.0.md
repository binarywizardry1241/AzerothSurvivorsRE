# AS death-reward pickup consumers — 0.112.0

Authority is the configured installed EXE, version **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [manifest](evidence/0.112.0/raid-pickup-collection/manifest.json) binds the
actual current instructions, PE owners, dispatch entries, constants, CRT import
identities, explicit fixture seams and live source guards.
[Ghidra provenance](evidence/0.112.0/raid-pickup-collection/rea-provenance.json)
binds the current reservation/removal helpers and collection/completion excerpts.
Generic raw-import types and incomplete dispatch decompilation do not select the
contracts below; installed Win64 instruction fixtures do.

This follows [death reward creation/publication](raid-reward-pickups-0.112.0.md),
[frame continuation](raid-frame-continuation-0.112.0.md) and
[forced player position](raid-forced-position-0.112.0.md). Scope is the AS
consumer of death-produced XP, Gold and Magnet, through the existing XP,
GameObject, unit-field, sound and notice ports.

## Current admission and order

The current frame owner is `1458fb890..145908680`. After actor effects and their
forced-position output, `1459028e1..1459035f4` reloads authoritative
`Game+4d0/+4d4/+4d8`, live pickup radius `+498` and clock `+a4c`.
The actual helper `1459d4d20..1459d4edc` traverses pickup GUIDs and the current
112-byte companion rows at `+958/+960`: phase `+18 == 1` and target GUID `+20`
reserve a matching pickup. This is the source `Fetching(guid)` predicate.

Idle XP activation proceeds in pickup order. XP older than **6 seconds** and
unreserved bypasses the radius and uses speed **32**. Every other idle XP row
requires ordered XY distance `<= live radius` and uses speed **24**. Reservation
does not forbid ordinary in-radius activation. Duration is
`max(distance / speed, 0.12)`. Native packed f32 subtract/multiply,
`dy² + dx²` and scalar square root supply distance; no hypot call participates.
The stage first records all activation state/deadlines, then publishes moves in
the same forward order, incrementing the global serial `+a7c` with u32 wrap.

The next scan freezes eligible indices in forward order. XP requires an active
flight with deadline reached. Gold is eligible when ordered distance is at most
the same live radius, or its flight deadline is reached. Magnet uses radius
**3**. The frozen set is consumed in reverse order. A callback changing actual
mode to 2 or entering the stage in terminal mode 4 does not abort this already
admitted stage. The companion admission gate starts independently at
`1459035f4`, as established by the frame report.

Dispatch table `146c0c1e4` binds current kinds **0 → XP**, **1 → Gold** and
**6 → Magnet**. These tags and the delivered creator's object-type publication
connect actual death outputs to these consumers. Other pickup dispatch branches
are outside this recovery.

## Removal and reward output

`14594d9e0..14594dbfd` stably removes one 72-byte pickup row. It publishes
RemoveObject opcode `0xaa` for the primary GUID, then each auxiliary GUID in
stored order, before returning to the reward branch. Both ordinary collection
and the choice XP sweep use this actual helper in the fixtures.

| Kind | Current output after removal |
| --- | --- |
| XP 0 | Convert raw u32 to f32, multiply by `Game+49c`, call imported `roundf`, enforce minimum 1, saturate to u32, call `145911e80` |
| Gold 1 | Same conversion/multiply/round using `+4b0`, without minimum 1; wrapping add to Gold `+4f0` and earned `+79c`; publish field 1176 as wrapping `Gold * 10000` |
| Magnet 6 | Increment counter `+7a4`; attract idle XP; set only idle Gold flight deadlines; publish sound 120, then account notice kind `magnet` with the installed fallback text |

CRT thunks are resolved through the current PE import table, including
`145c0a41d → roundf`. The fixture's explicit rounding seam implements its half
away from zero operation and preserves NaN/infinity for the following native
minimum/saturation instructions. Negative/NaN Gold grants saturate to zero;
XP still grants at least 1. Ordinary XP callbacks remain individually rounded.

Magnet executes the actual idle XP attraction helper
`14594eb50..14594ee2e`, whose canonical extract is owned by the primary boss
lifecycle proof. Idle XP moves use `max(distance / 40, 0.15)` and wrapping
serial publication. Idle Gold uses the same duration for collection state but
emits no movement packet. Existing flights remain unchanged. The actual sound
packet contains opcode `0x2d2` and u32 120. The fallback notice text is
`Magnet! Everything on the field comes to you.`

## Choice completion and source repair

The current completion owner is `14595e3f0..14595e9a7`. Its bounded XP consumer
`14595e4a4..14595e577` reads authoritative player XY and live radius, then
walks forward. Any flying XP or ordered in-radius XP is removed immediately,
with the index retained after stable removal. Raw u32 amounts wrap into one
sum. A wrapped zero skips the XP callback. Any nonzero sum is multiplied and
rounded once, with minimum 1 and u32 saturation. Reward-kind counters, cache
offers, level builders and resume effects outside this slice retain their
existing owners; this repair changes none of those rules.

The live source formerly split collection between forward matured-only entries
inside `Mechanics::tick` and a later reverse pass outside it. That pass skipped
all companion reservations and used a fixed Gold radius of 9. It ran after
world scheduling. The source now runs one collection stage immediately after
the final actor/player override, with forward activation and reverse frozen
admission, before companions and world scheduling.

`gameplay/mechanics/pickups.rs` owns this stage and the shared ordered removal
helper. `completion.rs` uses that helper for its forward raw XP sweep, publishing
the primary/auxiliary removals previously lost by `retain`, and applies the
native nonzero minimum. `gameplay/mod.rs` passes `RunSession.accepted_position`
to choice input before borrowing Mechanics, so a delivered Pull correction is
also the later choice sweep's position. The old external collection pass is
removed. Existing creator normalization/publication and unrelated Rune/cache
callbacks are preserved.

## Validation and limits

Run `python3 -B scripts/check-raid-pickup-collection.py`; `--stage`
writes ignored candidate evidence under
`runtime/native-evidence/0.112.0/raid-pickup-collection`.

**2,406 native profiles pass**: 392 Gold admission cases, 224 XP activation
cases, 128 multiplier/counter cases, 21 mixed Magnet/order/serial cases, 1,600
choice sweep cases and 41 reservation/norm/authoritative-position boundaries.
They cover exact/adjacent f32 age and radius inputs, NaN/infinity, zero and
wrapping raw sums, nonzero low multiplier grants, serial/counter wrap,
reservation phase and lists crossing eight entries, primary/auxiliary removal
order, mixed idle/flying XP/Gold, and collection continuing after XP opens a
choice. Two profiles execute the delivered Pull XYZ stores before the actual
collection or choice sweep consumer.

The checker executes only listed current ranges and rejects all unlisted calls.
Fixed canonical references reuse already owned bytes; the new extract contains
only previously unowned visited instructions. Native reservation, stable
removal and idle XP attraction helpers execute rather than being replaced with
fixtures. Allocation success, XP grant application, movement descriptor
construction, field publication, missing localization and account-notice
delivery are explicit ports. XP/Gold arithmetic and removal/sound packet bytes
are native; the existing full XP/choice builder and client handlers are not
reimplemented here.

Rustfmt parsed the four changed source files without rewriting them. The
current frame and forced-position checks also pass, with only the latter's
source guard updated for collection's new stage. No compiler, Rust tests,
build, game process, actual terrain/client/audio/UI interaction or
original/rebuilt parity comparison ran. This is bounded AS consumer recovery,
not whole-frame or asynchronous input parity.
