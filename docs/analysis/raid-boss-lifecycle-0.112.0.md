# Primary boss arrival and rewards — 0.112.0

Authority is the configured installed Windows EXE, version **0.112.0**, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The current [manifest](evidence/0.112.0/raid-boss-lifecycle/manifest.json),
[instruction extract](evidence/0.112.0/raid-boss-lifecycle/selected-native.asm)
and [Ghidra provenance](evidence/0.112.0/raid-boss-lifecycle/rea-provenance.json)
belong to this target. Historical catalogs and earlier recovery retain their
actual provenance. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own implementation status.

This proof connects the current primary-boss callers to
[`bosses`](../../crates/azeroth-survivors-re/src/bosses/mod.rs),
the [live adapter](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs)
and the existing client UNIT descriptor path. Current graph/header/scaling and
phase behavior remain owned by [raid inputs](raid-inputs-0.112.0.md). Guardian
providers, normal completion and frame-tail gates remain owned by
[guardian lifecycle](raid-guardian-lifecycle-0.112.0.md).

## Current contracts

| Route | Current code | Recovered connection |
| --- | --- | --- |
| Primary/endless schedule | Tick `145904d79`, `14590649b` | Five ordered minute deadlines; increment before creation; one creation per admitted tick; endless draw and 300-second replacement deadline |
| Fresh defaults / showcase | Constructor `1458f9cf0`; Begin `14590d7a0` | Primary cursor `Game+9e8=0`, endless deadline `+aa8=0`; showcase flag `+ad8` creates all five without advancing the cursor |
| Primary constructor | `14593b0f0..14593be1c` | Point selection, UNIT arguments, initial timers, actor publication, initial form and arrival queue |
| Shared placement | `14593d500..14593dd85`, tail `14593e800..14593ec84` | Current RNG/retry order, height and navigation consumers, fallback |
| Primary death | Shared owner `14593ec90..145942543`; branch `14594040e..145940de1` | Live-primary scan, stop marker, counters, announcements, rewards, gear and endless phase activation |
| Gear candidates | `145994a20`, `1459cf4a0`, `1459ca770` | All 60 headers × nine legal classes, actual tier pools and candidate order |
| Gear multiplier | Directly called leaf `14599d7a0..14599d808` | Current four percentage lanes and ordered SIMD expression; no PE function owner invented |
| Notices / attraction | `14598bf40`, `14598c950`, `14594eb50` | Localized arrival/death notice payloads and idle-XP flight records |

The schedule reads the owning clock's actual division by 60, ordered comparisons
and current native zone rows. Unordered clocks/deadlines skip. Endless selection
uses the actual five-entry multiply/reject RNG and preserves the primary cursor.
Constructor zero producers, their intervening writes, the single nonvolatile-XMM8
copy seam and aggregate copy offset are checked separately from CPU execution.

Only Scarlet Monastery and Naxxramas have fixed boss points: four and six. The
current filter admits distance 20 exactly and rejects NaN. Selection consumes
the shared RNG even with one candidate. If none qualify, native total ordering
keeps the farthest point and chooses the later point on a tie. Other zones use
the shared 24–28 sampler with zero directional chance. Its 16 angular attempts,
2-unit distance reductions to 12, navigation admission and separate fallback
execute against controlled terrain/grid inputs. The source's two positive `<=`
admission tests were changed to the native rejection tests `!(value > limit)`;
native unordered distances/heights reach the same branch. Adjacent f32 limits
and NaN are checked explicitly.

## Initial form and first client publication

The current constructor applies two initial descriptors before announcements:

| Boss | Current record | Effective fields |
| --- | --- | --- |
| Mr. Smite, 693 | `146be688c`, descriptor `146be6890` | Baseline display/scale, no mount, main hand 1390, weapon presentation and sheath 1 |
| Rend Blackhand, 1091 | `146be68ac`, descriptor `146be68b0` | Baseline display, scale 1, mount 9806, empty weapons and sheath 0 |

The preceding option gate is record `+1d != 2`. Both actual bytes are zero in
immutable `.rdata` with characteristics `0x40000040`. This is static descriptor
data, not a varying caller option: scheduled, endless and showcase callers all
reach the same constructor. The source ID mapping therefore follows the actual
current records. The existing transform encoder is reused without cast, hold
or recurring-list replacement effects. Its separate ten-form hazard check was
rerun after the descriptor-slice refactor.

`BossSpawner` persists the form before queuing yell, battlefield emote, sound
8174, an optional voice kit and the boss notice. Native queues are checked for
all 60 bosses with fallback and translated names/yells. All 257 recurring timer
records begin at their repeat value multiplied by 0.6; scalar and vector loop
boundaries are included.

The source form map now also supplies equipment, mount and sheath to the first
`UnitSnapshot`: fields **37, 38, 40, 41, 42, 43, 133, 164**. Display and scale
continue through `actor_appearance`. A live primary boss has every required
snapshot field and its native creature GUID, so it takes the early UNIT path
and its `continue` before the legacy model-dependent branches. The current
native caller passes definition scale directly to shared UNIT constructor
field **4**; the transform helper also writes that field directly. All 60
headers and wrapping creature counters are checked. The first source descriptor
therefore carries actor/form scale; no additional model-scale multiplication
belongs in this path.

The existing local client installs the first `ObjectStore` from the complete
descriptor, then merges only changed fields on later snapshots. Snapshot
equality includes the eight form fields, while `ActorFields` continues through
the existing `ObjectValues` event. The client reads object scale for live scale
easing and applies `net.scale` to the render transform. This establishes source
connections for first creation and subsequent updates. Native separate create
and values packets versus the source's effective first descriptor are not a
packet-serialization or presentation-timing parity claim.

## Death outputs and shared boundaries

The current primary branch retains odd stop markers and marker 2; otherwise
no remaining live primary stores marker 1 and the clock. It increments the
wrapping kill count before XP `20*kills+60` and gold `20*kills+40`. It queues
death yell and `bossdown` notice before pickup requests. A due/equal/unordered
magnet head is consumed without a chance roll and requests kind 6 at
`(-2,+1.5,0)` from the death point. Equipment is suppressed in showcase mode
and admitted only when the actual definition is one of the selected zone's
five static rows. Current candidate IDs, chances, tier distribution, final
class special cases, multiplier expression and 24-bit admissions are checked.
The final flag activates endless phase only when the current phase's low byte
is zero. Normal completion remains deferred to its owning frame tail.

Idle XP attraction executes current instructions over all pickup kinds and
existing-flight states. It uses duration `max(distance/40,0.15)`, wraps the
movement serial, records the actual start/destination/deadline and forwards
the current movement packet arguments.

Pickup constructor **`145944310`** is an explicit output boundary in these
death fixtures. They capture kinds, amounts, raw requested positions and call
order with a controlled constructor that consumes no RNG. Gold/magnet object
construction can consume RNG before equipment; actual constructor normalization,
aggregation, facing and complete reward RNG composition require their own
current provider proof. The actual constructor clamps XY and resolves terrain
height; this report does not treat raw caller positions as final pickup rows.
Localization, allocation/vector growth, field-map insertion and packet/notice
serialization also remain named seams. Notice constructors themselves execute,
with controlled localization/replacement responses and UTF-8 names.

## Checks and limits

`python3 -B scripts/check-raid-boss-lifecycle.py` replays **2,365**
bounded original-instruction cases: schedule 1,020; points 31; initial forms 64;
shared placement 40; gear providers 540; primary deaths 240; showcase startup
48; XP attraction 18; arrival publication 120; initial timers 68; multiplier
24; notices 16; placement boundaries 16; UNIT scale/GUID 120. It also checks
76 source guards across 16 files. `--stage` writes candidate evidence under
ignored `runtime/`; `--verify-stage` checks that candidate without promotion.
Default verification needs only canonical evidence and configured reference
inputs, and pins each retained instruction to its recorded owner.

The extract adds 2,419 instruction rows and references 235 rows already owned
by current hazards, lifecycle, guardian and UNIT presentation evidence. Every
referred assembly row is checked against installed bytes. Three fresh bounded
Ghidra operations recover shared placement, its fallback and the equipment
provider; existing current constructor, hit/death and guardian evidence is
referenced without duplicate imports. Static inspected context is identified
separately from byte-executed cases. Unexpected direct/computed calls reject.

No Rust compilation, compiling tests, game process, real MPQ terrain comparison,
wire/client packet comparison, audible playback or rebuilt/original gameplay
comparison was run. CRT numeric implementations, complete shared actor creation,
generic pickup output providers and whole shared-frame callbacks retain their
stated boundaries. Global #41 may expose additional producers outside the
currently connected raid graph; these bounded contracts do not certify a full
native census or close runtime/presentation parity.
