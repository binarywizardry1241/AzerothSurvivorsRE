# Controller input, focus and presentation — 0.109.0

Target: installed read-only 0.109.0 EXE, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
[verification-needed](../verification-needed.md) owns #22/#41. The
[manifest](evidence/0.109.0/pad/manifest.json) binds fresh Ghidra owners and the
canonical instruction intervals. [Windows acquisition](input-0.109.0.md) is a
separate source/evidence boundary.

## Current owners and live source

Fresh current owners are `1401bc030` (stick projection), `1401c2800` (device
handoff), `1401c2ee0` (world input), `1401c39e0` (custom focus/input) and
`1401c59f0` (CVar settings). Historical
byte anchors located candidates; exact installed bytes, current callers/data and
fresh Ghidra analysis establish the recorded current intervals. Old addresses
and old replay results are not relabeled.

The [focus adapter](../../crates/azeroth-survivors-re/src/native_input/focus.rs)
now publishes the actual secondary input. Current `1401c4ef2` asks for West
(tag 3); `1401c4f02..1401c4fae` emits two `MouseButtonInput` messages with the
active window entity, Right (tag 1), Pressed then Released, and sets the
one-pass synthetic-input latch. The native record layout and source Bevy
mouse/window types establish this route; it is not a dedicated Reroll request.
The previous source implementation substituted a Reroll button activation and
therefore omitted the real menu secondary consumers.

The live device producer now queues that exact typed mouse pair. Focus remains
on the current control. The existing talent page consumes Right on its hovered
talent and applies its recovered refund checks; Armory consumes the actual
mouse messages and retains its equip/appearance/ownership gates. The device
producer precedes `AccountInput` explicitly, in addition to the existing
Options/gameplay input edges. No direct account mutation or synthetic card
transaction is added. Pointer/card actions retain their owning handlers; the
secondary producer alone cannot establish every card or whole-page contract.

Current `1401c2e35..1401c2e9a` consumes and clears the synthetic latch once. A set
latch skips the complete keyboard/mouse/travel handoff for that pass. It does
not merely discard one Right-button edge or admit simultaneous pad activity.
Both source handoff branches share that latch gate. The current world-input
Select/C keyboard producer also sets native `.4e` after its two messages.
The next pass ignores all handoff once; generated keyboard/mouse input cannot
change the mode by itself. The retained touch Escape adapter has separate
historical ownership under #23; it is not a controller menu-request producer.

The keyboard/mouse readers at `1401c2b5e..1401c2d16` consume their two message
buffers oldest first and stop after the first Pressed record. Later messages
remain for the next pass, including when the synthetic latch suppresses that
pass's mode change. A repeated Pressed message still counts. The live source
now retains independent typed message cursors and uses short-circuit `any` for
this exact lifetime. The earlier `ButtonInput::get_just_pressed` shortcut
deduplicated presses and could not represent repeats or pending messages.
Existing touch/pause button-state readers retain their own separate ownership.

World Select (tag 10) at `1401c34f1` publishes physical KeyC (tag 22) with
logical character `c`, then releases it. The Pressed record includes text `c`;
Released has no text; both have repeat=false, the active window and consecutive
message IDs. Publication sets the same one-pass synthetic-input latch.
The live source now sends this exact typed pair through the ordinary
FrameXML/binding message path, including when physical C is already held.
It no longer substitutes the hardcoded `TOGGLECHARACTER0` command: remapping C
must affect Select through the target's actual key route.

Start (tag 11, `1401c3215`) and focus Back (tag 1, `1401c4ec9`) instead write a
logical menu-request boolean/change tick at `1401c321c..1401c323c` and
`1401c4ed1..1401c4eee`. They publish no keyboard pair and do not set `.4e`.
The source now produces one frame-owned `LocalDeviceInput.menu_requested`:
Start is independent of keyboard capture; Back requires the active focus route.
The real picker/menu and Options consumers use that request alongside their
ordinary keyboard path. The local-client snapshot preserves it while adding
FrameXML requests, so existing talent-view/pause/Options transition owners run.
It bypasses neither those owners nor their context gates. The previous synthetic
Escape substitute depended on Escape bindings/held keys and incorrectly set
the generated-input latch. Existing primary-window focus/admission adapters and
actual ECS/schedule behavior retain their separate validation boundary.

Current `1401c2db0` visits every queued `CursorMoved` position. It retains the
previous position even outside pad mode and during a synthetic pass, sums f32
segment distances, then admits mouse handoff only above 12 logical pixels.
The source now uses a retained `MessageCursor<CursorMoved>` instead of sampling
the final Window position. For `(0,0) → (10,0) → (0,0)`, native travel is 20,
whereas a final-position-only sample incorrectly reports zero. Pad activity
resets the travel bank only when entering pad mode; continued pad activity
preserves the already accumulated bank.

Current `1401c2b15..1401c2b5e` admits pad activity only when a new digital button
edge exists or either projected stick length is strictly above .5. The source
previously treated every nonzero stick/zoom value as activity. It now retains
the .25 radial movement threshold separately from the .5 mode-entry threshold;
trigger/shoulder zoom magnitude alone does not enter pad mode. A digital trigger
edge can still enter through the normal button-edge route.

The current radial threshold, held-A release latch, focus forward admission and
score, and repeat arithmetic have renewed bounded checks. Radial equality is
admitted; directional selection requires more than four forward pixels and
scores `forward + 2 × lateral`; repeats use .38 then .11 seconds. These selected
contracts already have live source consumers.

The current settings consumer clamps both `padLookSpeed` and `padZoomSpeed`
using `MAXSS(value, +0)` at `1401c5c47` and `1401c5cc3`. Negative values, either
zero sign and NaNs therefore become positive zero; positive values, including
infinity, remain unchanged. The live shared speed policy now uses `value > 0`
instead of `value <= 0`, which previously propagated NaN and negative zero.
Both live CVar consumers use that policy. The native dead-zone clamp has a
different operand order and retains NaN; that separate source policy is
unchanged.

The generic edge query at `1401ba960` walks every matching entity in each
table/archetype and stops only on a matching button or after exhausting the
query. It has no four-device bound. The source consumer now retains every
`Gamepad`; its first-available stick selection and aggregate button/zoom
readers keep the query's existing order. The four-slot bound belongs only to
the Windows XInput acquisition API. It must not truncate ordinary-backend
controllers or other matching gamepad entities.

Focus reacquisition at `1401c46e4..1401c476b` uses a saturating byte counter.
An initial search without a remembered center selects immediately near the
window center. A missing previous control resets the counter; with a remembered
center, the first two missing-focus passes wait and the third selects the
nearest candidate. Subsequent unsuccessful attempts saturate at 255. The source
now preserves this delay instead of selecting immediately whenever a control
disappears. Navigation repeat advances only while a focus target exists.
The native inactive branch `1401c3e41..1401c3e5a` clears focus and repeat while
retaining the remembered center/counter. Both inactive source routes now use
that same reset, including the transition into unobstructed world gameplay.

Current dependency recovery also follows the filename-free filter
`140047740`, candidate-ancestor collector `140129540`, parent iterator
`140119520` and blocking-node projection `1401c2010`. Their exact owner bytes
and fresh Ghidra evidence are bound by the manifest. The live source now
collects visible `Interaction` nodes with physical dimensions at least one,
rejects controls over half the logical window area and rejects candidates that
are ancestors of another candidate. Existing typed disabled/choice gates remain
the source adapters' admission boundary.

The filter uses actual `UiStack.uinodes` order. A candidate absent from that
stack is rejected. A later visible node with explicit `FocusPolicy::Block`
blocks only when its rectangle contains the candidate center; the same node,
its ancestors and its descendants do not block one another. An unrelated
lower-layer control remains eligible when its center is uncovered. This
replaces the source's global highest-layer restriction, which lost such controls
and missed same-layer draw order. Center coverage is inclusive at boundaries;
unordered coordinates fail it. Candidate ancestors and each candidate's own
ancestors have different roles and are kept distinct.

Native geometry transforms two opposite corners and divides by
`max(window_scale, .01)`. The source follows that exact policy, including
rotated/negative transforms; it no longer substitutes a four-corner hull,
clip-rectangle intersection or viewport intersection. Actual layout/DPI/rendered
behavior remains unverified; the static result establishes the selected policy.

The current ring constructor `1401c3670` submits a Node, four border colors,
`BoxShadow`, `GlobalZIndex(100000)` and nonhoverable/nonblocking `Pickable`.
It has no amber background fill. The source now uses that transparent interior,
fixed draw index and ignored picking. The border is sRGBA `(1,.914,.659,1)`;
the shadow is linear RGBA `(.973,.824,.416,.6)`, with zero pixel offsets, one
pixel spread and eight pixel blur. Native color tags are traced through the
current copy/linear-to-sRGB branch; the border and shadow use different tags.
The prior source substituted a linear border, solid fill and target-relative
draw index. Its explicit `FocusPolicy::Pass` remains the port's legacy
Interaction-system bridge in addition to the native picking exclusion.
The independently recovered placement owner `1401c2120` uses logical left/top
minus three pixels and width/height plus six. It hides a missing/invalid focus
with `Display::None`; the source now follows that layout lifetime instead of
leaving the Node displayed with hidden visibility.

The focus owner then walks parents to the nearest vertical Scroll container
with a scroll position. Current `1401c50f4..1401c5250` reveals the focused bounds
above/below that viewport with eight logical pixels of margin. It divides the
delta by `max(transform_y_length,.01) / max(window_scale * inverse_ui_scale,.01)`,
adds the old offset and clamps it to zero through
`max((content_height - node_height) * inverse_ui_scale,0)`. The first matching
ancestor owns the adjustment; it does not continue through outer scrollers.
The live source now connects this policy, changes the actual `ScrollPosition`
and mirrors it into the open Options state so a rebuild retains the offset.
The native clamp owner `1401b5e60` preserves NaN/signed-zero input and validates
its upper bound. The independent eight-pixel margin is not the ring padding.

## Ordinary engine input boundary

The installed image identifies `bevy_input-0.18.1`, matching the retained source
baseline. Native defaults at `1469396a0` contain button thresholds .75/.65,
axis bounds `1,.05,-.05,-1` with .01 change threshold, and button-axis
high/low/threshold `.95,.05,.01`. Both the selected direct initializer
`14458d640` and boxed default factory `1445a52d0` produce the exact same
136-byte settings value with three empty override maps. The direct initializer
is supplemental local Ghidra recovery outside the canonical census's existing
function partition; that partition and its unknowns are not relabeled complete.

Current stick getter `144586b90` reads the analog field at Gamepad+`.60`, asks
for LeftStickX/Y and substitutes zero only for absent entries. Its selected
lookup tail `144654e8f` clamps the stored value to -1..1 without dead-zone
rescaling. The retained Bevy 0.18.1 event processor stores an admitted raw value
in that analog field while publishing scaled axis events separately. The live
pad consumer uses the getter, followed by the game's own radial policy.

The port's unconditional identity `AxisSettings` override therefore changed
ordinary .01 event admission, rather than correcting the consumer's magnitude.
It is removed; normal engine defaults and per-device settings remain intact.
This reuses the existing engine baseline with current native defaults/getter
checks. It does not implement or certify the complete generic input engine,
actual initialized settings, hardware calibration or other operating systems.

## Checks and limits

[check-pad.py historical recipe](../SCRIPTS.md#historical-execution-sources) passes **3,108 bounded scenario checks**:
26 exact speed-bit cases, 64 mode-activity, 84 radial, four Jump-release, eighteen directional-score, five repeat,
six exact mouse-pair publications, four cursor-path fixtures and 96 handoff
states. Cursor fixtures include empty/first-sample models; nonempty segments,
publication, arithmetic and handoff blocks execute original instructions with
synthetic state. The checks compare both mouse-message halves, window/entity
and event counters, latch consumption, strict threshold and mode/travel state.
Speed cases include signed zeros, subnormals, infinities and NaNs; raw output
bits are compared. The checks also trace the real source event/CVar consumers
and producer ordering. Another 216 cases execute the complete generic query
traversal with synthetic table/archetype descriptors and an explicit
per-controller predicate seam: empty and multiple storage groups, reversed row
mapping, no hit, and each possible hit through eight controllers are covered.
Focus reacquisition adds all 512 counter/remembered-center combinations, two
lost-target reset cases and 32 inactive-state preservation cases.
Ninety geometry cases cover scale bounds/NaN, rotations, shear, negative
transforms and logical projection. Another 96 cases execute the complete native
retain/filter loop across draw orders, exact/empty/NaN coverage rectangles,
ancestry/siblings and absent stack entries. Hashing, RNG, temporary set
allocation/insertion/free and parent-query reads are explicit fixture seams;
native comparisons, ancestry decisions, retention and vector publication execute.
The complete keyboard and mouse message-reader intervals add 1,280 cases over
all press/release sequences through four messages, every split between the two
buffers, lost/stale/ahead cursors and early Pressed exits. Both admission and
the exact retained reader counter are checked.
The native ring submission, complete shadow constructor and color-copy branch
add three checks. The fixture retains exact native bundle/shadow bytes and
compares all four border colors, shadow fields, draw index and picking flags.
Ring ECS spawn/copy/color/shadow publication uses declared helper seams; the
shadow constructor and exact selected color-copy instructions execute separately.
Four placement arithmetic and four display-state cases additionally verify
padding and the hidden-state/change-tick branch.
Another 480 native reveal/update cases cover top/bottom/contained/large/boundary
targets, transform/window/UI scales, empty/extended content, old offsets and
Options mirroring. Its clamp call is supplied and separately checked with 21
native cases, including NaN, infinities and signed zero. Parent/ECS lookup and
actual layout/scroll interactions remain explicit external dependencies.
Two native settings factories, nine lookup-clamp boundaries and 36 raw stick
getter cases add 47 checks. Factory allocation and axis lookup are supplied;
the original defaults, getter, lookup tail and missing-entry decisions execute.
Six current Select keyboard-pair publications check key/logical/text fields,
both button states, repeat flags, window identity, queue/message counters and
the latch with an explicit preallocated append seam.
Eight Start/Back publication cases verify each boolean/change tick and unchanged
synthetic latch; source checks trace the real menu, Options and local-client
snapshot consumers. No Rust input system or real menu transition executes.

Native ECS/scene construction, layout engine, real allocation, actual input
system and reconstructed Rust do not execute in these fixtures. The query traversal
executes with synthetic descriptors; its ButtonInput predicate is supplied.
Native owner hashes and fresh
Ghidra references establish the selected recovery context, not complete bodies'
behavior. Changed Rust syntax parses with the pinned project-local rustfmt.
Compilation, devices, actual scheduler/message delivery, DPI/platform behavior,
controller/card/menu interaction/rendering and original/rebuilt parity remain
unverified. Broader native contract, source revision and indirect/global
ownership limits remain #41.
