# Input isolation in 0.139.2

Installed target `installed-game/AzerothSurvivors.exe`, version 0.139.2,
150,793,728 bytes, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
This bounded #310 recovery follows the
[0.139.1 descriptor and filter evidence](input-gate-native-0.139.1.md) and
identifies separate producer edges for #59 and #293.

## Ordered input records

The exact `benilla_app::host_controls::input_gate::InputGatePlugin` name at
`0x146560f24` is returned by `0x1402fd790`. Its descriptor at
`0x14655faa8` reaches build callback `0x140db77d0` from the registration
site at `0x1401098d3`. The callback initializes a 56-byte resource with two
empty vectors and two zero bytes. The resource TypeId bytes are
`ab05b739ddcaeac72fbf3a7949a92465` at `0x146544e60` and
`0x146635508`. The initializer at `0x140dbee30` resolves this TypeId
into the gate system's cached resource slot. The scheduled wrapper
`0x140dbf100` passes the ordered-record resource and the gate into
`0x140fd4fe0` at `0x140dbf20f`.

The build callback adds the gate to Update in `UiInput`, after the input-record
collector, before `UiInputViews` and before `BindingHead`. The hierarchy
insertion at `0x140db7972` takes the `UiInput` formatter. The later
dependency calls insert direction byte 1 for the collector and byte 0
for the two named sets. The two builder helpers at `0x140cec3d0` and
`0x140cec4d0` reach the common dependency constructor `0x145b99760`.
These bytes match the bundled Bevy 0.18.1 `DependencyKind::{After, Before}`
and the vector destinations match its hierarchy and dependency builders.
The collector's system descriptor at `0x146601b40` calls
`0x14098d170` and publishes the default `SystemTypeSet` through
`0x14171fbe0`. That set and the gate's after-set use the same
`SystemTypeSet` TypeId bytes, `2932f7e3ff2e6fd1f2921a146a53514a`,
at `0x146772128` and `0x146693eb8`. The schedule formatter reached
through `0x1410d1c00` / `0x1410bdfe0` selects `Update`.

The collector constructs 96-byte records with a nested enum at `+0x40`.
The key path carries the logical key at `+0x00`, the physical key at
`+0x40`, and state at `+0x4c`. The non-key arms write `0xc3` for a
mouse button at `0x14098d777`, `0xc4` for cursor movement at
`0x14098d580`, and `0xc5` for a wheel notch at `0x14098d94a`.
The button arm carries its state at `+0x04`. The filter's paired
four-entry tables at `0x1466bf5a0` and `0x1466bf5b0` dispatch in both
the initial scan and compaction paths.

| Record | Gate behavior |
| --- | --- |
| Keyboard | With byte `+0x30` set, discard presses except left/right Alt, Control, Super and Shift. Their `KeyCode` values 51, 52, 56, 57, 59, 60, 61 and 62 are the bits in mask `0x7b18000000000000`. For either press or release, also discard an exact physical `KeyCode` in the vector at `+0x00` or an exact logical `Key` in the vector at `+0x18`. |
| Button | With byte `+0x31` set, discard presses and preserve releases. |
| Cursor move | Preserve. |
| Wheel | Discard while byte `+0x31` is set. |

The two membership predicates at `0x14063d410` and `0x14063d190`
compare 12-byte physical and 32-byte logical keys respectively. The
filter retains input order. The first and subsequent pointer tests
use `!= 0` and `== 1` respectively. The observed pointer producers
write booleans.

## Producers and boundaries

- **Picker keys.** The picker input wrapper `0x14027b6a0` gets the same
  gate through its parameter initializer and calls `0x14025c850` at
  `0x14027bc6a`. The callee requires byte `+0x0d` of the fourth argument's
  resource (TypeId `90de0348d74a38d0dcc6ac04b74ce4c4`), corresponding
  to the main-menu active byte in the [prior picker input contract](menu-input-0.97.2.md#enter-action-and-keyboard).
  The shared Enter/NumpadEnter lookup and tag-1/`-1.0` entry-request store
  at `0x14025ce5b` and `0x14025ce6a` identify this consumer. The gate
  appends only when the preceding typing snapshot is clear. The preparation owner
  `0x14025d4d0` calls the typing getter `0x1405e0690` and copies its result
  to byte `+0x01` of the shared Escape request resource at `0x14025d626`.
  At `0x14025c941` and `0x14025c948`
  it appends physical Enter `0x3a` and NumpadEnter `0x66` and advances
  the gate vector length by two. This is independent of the subsequent
  just-pressed lookup and picker action guards at `0x14025c9cf` through
  `0x14025c9ed`. The shared gate suppresses both edges for downstream
  consumers. This producer registers in PreUpdate after `InputSystems`
  at `0x140254edd`. The append precedes the picker action-specific
  guards. A picker-local message reader would leave those records in
  the ordered stream.
- **Pointer.** The hover writer `0x14025cfd0` queries
  `(Interaction, FocusPolicy)`. The query registration at
  `0x1404d669d` and `0x1404d66a8` reaches component TypeIds
  `cd4bc2e214b72371320c7bfd288a329f` and
  `4becec6131497697708bea5b17e17266` respectively. The exact type names
  and IDs are paired at `0x143380f2f` / `0x143380f66` and
  `0x1433809cf` / `0x143380a06`. In either query iteration path,
  `Interaction::None` (2) and `FocusPolicy::Pass` (1) are rejected.
  A qualifying Pressed or Hovered node with Block policy writes the
  inverse of a resource byte at `+0x18` to the gate pointer byte and
  clears the just-pressed mouse-button entries 0, 1 and 2.
  No qualifying node resets the gate pointer byte to false. The
  exception producer `0x1401317b0` passes an in-bounds logical cursor at
  `0x1401319e5` through `0x1405df3e0` to `0x140e36440`. That helper
  checks the registered name vector, projects to a 768-high UI root,
  hit-tests and compares frame names while walking parents. The producer
  publishes the result to byte `+0x18` at `0x140131d27` of the same
  resource TypeId, `d2524cd6157b6b3653aa7d8f4760c4a4`, used by the
  hover writer. This is the [registered on-top frame path](above-card-frames-0.127.0.md).
  The exception producer registers after `InputSystems` and before
  `UiSystems::Focus` at `0x14011fa7a` and `0x14011fafc`.
  The hover writer registers after both at `0x140254fc5` and
  `0x140255056`. Both registrations use the PreUpdate wrapper
  `0x14010b070`, which selects the exact `PreUpdate` formatter.
- **HUD and meter drags.** After the hover writer, the meter setter
  checks its active drag tag at `0x140176f6c` and writes true at
  `0x140176f75`. The HUD setter does the same at `0x14029e31c` and
  `0x14029e325`. Both clear just-pressed mouse buttons 0, 1 and 2.
  Registration sites `0x14015cf12` and `0x140280ee1` add an After edge
  to `SystemTypeSet` descriptor `0x146552b70`, the canonical default
  set of the general hover writer. The drag state TypeIds match the
  updater initializers at `0x1401772df` and `0x14029e683`. The
  updater bodies at `0x140166810` and `0x140285730` inspect held mouse
  and pressed touch before window position. When both are clear, they
  clear the drag tags and enter their own persistence routes. Thus the
  drag may retain ownership outside a hovered Block node.
  [Drag receipts](evidence/0.139.2/input-gate-drags.json).
- **Escape (#59).** The shared input preparation owner `0x14025d4d0`
  resolves the same gate TypeId, clears its physical vector at
  `0x14025da42` and conditionally adds physical Escape `0x73` at
  `0x14025da71`. It also writes the keyboard-press gate at
  `0x14025da87`, from the separate predicate at `0x14025d925`.
  The ordered-record and typed keyboard buffers have separate
  consumers. The [Escape repair](escape-game-menu-2026-10-23.md#ordered-input-and-stock-menu-handoff-in-01392)
  joins the current request resource to its pause consumer and covers the
  reconstructed stock-menu handoff.
- **Process (#293).** The client setup at `0x140255d97` obtains a
  mutable instance of the same gate. At `0x140255db2` it sets the
  logical tag `0x4f` (`Key::Process`), then copies the 32-byte value
  into the gate's logical vector and increments its length at
  `0x140255df9`. The per-frame physical reset does not clear this list.
  This route filters a Process event in ordered input before bindings
  and UI dispatch. Composition state and the OS commit carrier are
  separate from the list. [Current IME bridge](ime-bridge-0.139.2.md).

## Reconstructed source

The custom frontend publishes Enter ownership before the ordered
collector. The collector withholds both edges of physical Enter and
NumpadEnter while that frontend is active and the prior typing snapshot
is clear. The picker reads its own input plane and retains the existing
dialog, pending-entry and co-op admission checks. The explicit stock
frontend still has its own GlueXML input route.

Bevy hover and press on a blocking node now feed the embedding pointer
gate. A registered FrameXML hit withholds fresh Left, Right and Middle
presses from the lower Bevy UI before focus runs. The ordered walk uses
the existing per-record hit test for that exception. A captured wheel
stops before the saved-cursor FrameXML fallback and before world
bindings. A missing VM or primary window still honors embedding
ownership. A synthesized touch record follows the same pointer gate.

An active HUD or meter drag takes precedence over the registered hit.
Both publish capture before the input walk and keep it through their
release or departure cleanup. The meter uses the first pressed touch
when the window cursor is unavailable, and persists an off-window
release before querying cursor coordinates.

The reconstruction enforces general post-focus pointer ownership in
the ordered dispatch and its world consumers. It keeps the underlying
fresh-button plane available to the custom Options editor, whose mouse
binding capture reads that plane later in the frame. The native post-focus
clear is therefore represented at the consumer boundary. The authored
regressions cover both picker Enter edges, ordinary typing admission,
overlay wheel isolation, promoted FrameXML hits, drag precedence and
touch behind an overlay. They were syntax parsed and remain unrun.

## Static verification

Independent PE/Win64 operand checks bound the address and field observations
above. Four successful journaled Ghidra `analyze_function` operations used
exact raw slices at the original VAs. The raw-slice digests and PE offsets
are below. The raw imports omit external functions and data. Their inferred
signatures are not Win64 calling-convention evidence.

| Ghidra entry | Journaled result SHA-256 |
| --- | --- |
| `0x140db77d0` | `dad98801f926728eb49ffb38e6a5a6f4e265f3d2e3f942109e7160affec28966` |
| `0x14098d170` | `e25ff6451af537117bd603a103526365c0656a7f91a18c810ae5a9c3aecbda47` |
| `0x14025c850` | `1c06b7ec71ad7715212dcbdb5e4df9d1491d656157220ef75b5b5d245f396573` |
| `0x14025cfd0` | `8aea5b081acb9d01a6dea85de4e72424cc1a3062c6cc7f28dceca8f69d498d35` |

| Original VA range | File offset | SHA-256 |
| --- | --- | --- |
| `0x140db77d0..0x140db7b07` | `0xdb6bd0` | `d9e6fa40d7607ef078acb36f7d49b40d035bcde3ed048161bfa54cdf0ae1311b` |
| `0x14098d170..0x14098dd41` | `0x98c570` | `bdfc8dcfc76a9fbd599cdcfff708ac6ae0a151245f3d4247c7f3dd891851c3f7` |
| `0x14025c850..0x14025cebd` | `0x25bc50` | `6e21aee69546032b5669f553b60e887191e03292934389cb0460fc0eb4cea681` |
| `0x14025cfd0..0x14025d2e4` | `0x25c3d0` | `880689c515be63f52527f29caa73c954decc6a5b792526f57718add292de27cd` |
| `0x140fd4fe0..0x140fd5233` | `0xfd43e0` | `9024f3be31eaddf271b537590301d94ad16349bc52113b99195e64c00a153c0f` |
| `0x1401317b0..0x140131ef0` | `0x130bb0` | `dae90d74512347054ee4246fa71478c48da94bd24e802ac4d31f12b956b616d0` |
| `0x140e36440..0x140e36afa` | `0xe35840` | `89b264309424bf6e6dc27f5c3304eaced9caec1c1fabd37d10912a43418628e4` |
| `0x140166810..0x140166b3c` | `0x165c10` | `3f3cd20d0ed464fe07d5816e9a9fbf85d839544ca5fa45de498fdda421bd2f45` |
| `0x140285730..0x140285b9f` | `0x284b30` | `d0b060f6f1b5f5a87c3032f7e42b17e08fed27956194e9440f7229d33ad27545` |
| `0x14025d4d0..0x14025e27a` | `0x25c8d0` | `d984de6969270949adeedd6024accf853f6f0d23d88c01bbed036637e276b710` |
| `0x140255d86..0x140255dfd` | `0x255186` | `3cb4b0bd56bcb52a94cece241706b3132379269ac9fe08b6b414517c01c25d0f` |

Original input delivery, menu/window and drag interactions, OS composition,
compilation and original/rebuilt comparison remain
[under #310](../verification-needed.md#gap-310).
