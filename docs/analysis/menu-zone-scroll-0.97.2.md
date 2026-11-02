# Chosen-zone visibility — 0.97.2

Static recovery on 2026-10-18 targets the supplied EXE, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
At this source-recovery checkpoint, no compilation, compiler checks,
emulated fixtures, or game/rebuilt application launches were run in this pass.

The owning native system is `0x140096af0..0x140097178`, immediately before the
picker-root constructor. Its preserved REA/Ghidra Evidence ID is
`ev_3e47308fef07df3f785b0fa2e109eb7861d6efaa03049fadb913885b656c2f50`.
The complete record, unchanged original bytes, original PE disassembly, and
supporting type/call chain are in
[catalog-zone-scroll-native.json](evidence/0.97.2/catalog-zone-scroll-native.json).

## Role binding

The `ChosenZone` type name at `0x145945adc` is registered by `0x140342fb0`.
That registration binds the exact 128-bit TypeId bytes at `0x1458f8e60`.
The same TypeId is resolved by `0x1402a2d10`, called by query initialization
`0x14033c5a0`. System-parameter initialization `0x1400a7310` uses that query.
The system vtable at `0x1458fb2b0` links the initializer to runner
`0x1401239b0`, whose instruction `0x140123b25` calls `0x140096af0`.
This binds the body to the chosen-zone query independently of release notes.

The separately recovered zone constructor creates the `ZoneList` with the
`Kept` key `picker-zones`. Shared wheel scrolling and keyed restoration belong
to their separate scrollbar recovery. This system adds a one-shot request to
bring the chosen row into view.

## Exact finite-value policy

The body returns immediately unless the pending boolean is exactly one. It
requires exactly one matching list viewport and exactly one chosen node, with
both computed heights positive. A missing/nonunique match or nonpositive
height leaves the request pending.

Once those conditions hold, `0x14009708e..0x140097092` updates the request's
change tick and clears the pending boolean **before** testing visibility.
Thus an already visible chosen row also consumes a valid request. No margin
or extra padding is added by this system.

For a node's computed size and its `UiGlobalTransform` affine matrix:

```text
top(node, transform) = transform.translation.y
    - 0.5 * (node.size.x * transform.matrix2.x_axis.y
           + node.size.y * transform.matrix2.y_axis.y)

s = viewport.inverse_scale_factor
relative_top = (top(chosen) - top(viewport)) * s
viewport_height = viewport.size.y * s
chosen_height = chosen.size.y * s

if relative_top < 0:
    delta = relative_top
else if relative_top + chosen_height > viewport_height:
    delta = min(relative_top + chosen_height - viewport_height, relative_top)
else:
    return

max_scroll = max(0, (viewport.content_size.y - viewport.size.y) * s)
scroll_position.y = clamp(scroll_position.y + delta, 0, max_scroll)
```

The minimum in the below-bottom branch preserves top alignment for a chosen
row taller than its viewport. An already visible row does not write the scroll
position. The native instructions retain their own IEEE/SSE edge behavior;
the formula above describes finite layout values and does not claim a complete
NaN/infinity contract.

The original data loads are: computed node size at `+48/+52`, content height at
`+60`, inverse scale factor at `+100`; the 32-byte affine transform uses its
matrix Y components at `+4/+12` and translation Y at `+20`. The constant vector
at `0x1458ed000` contains four exact `-0.5` floats. The core visibility/arithmetic
instructions are `0x140097057..0x140097162`.

## Pending producer and native invalidation

The request is a separate one-byte resource. Its exact TypeId bytes are
`71a6eb22e50e9eaf5a0806f59ec62c0f` at `0x1458f8ce0`. The shared resource-ID getter
`0x140083b20` is called by visibility-system initialization `0x1400a7310` and
content-producer initialization `0x1400ad270`. Startup `0x14008f2c0` uses the same
getter at `0x14008f568`; when the resource is absent, `0x14008f5c1` prepares a
zero byte and installs it. It does not overwrite an already present resource.

The producer is the separate content-pane updater
`0x14009b220..0x14009bdaf`, reached from runner `0x14013c4c0`. Its full static
REA Evidence ID is
`ev_eb6e3bc7fe0719eaadac6769c8b78c772a6691aea6b4b9dcfd1df15e588cd842`.
After replacing its previous content snapshot, it writes the shared pending
resource to one at `0x14009b9e6`, updates existing text/commands, then rebuilds
the content through picker-shell `0x14024d6d0` at `0x14009bd6a`.

The cached snapshot is the 64-byte Pick plus an auxiliary byte at snapshot
`+64`. Equality checks include hero class/race/sex/features, name string
length/content, zone string length/content, run modifiers and the auxiliary
byte. A missing snapshot or native content pane, or any differing field,
reaches the content-rebuild/request path. If those match, the updater also
checks the Save resource's change tick at
`0x14009b8c2..0x14009b8e3`; changed Save data forces reconstruction as well.
An unchanged matching snapshot and unchanged Save return without requesting
visibility. Earlier screen/query eligibility gates can clear the cached
snapshot and return without requesting visibility.

The changed resource is the current Save passed in Windows x64 `R9`, copied to
native local `+24`. Producer initialization uses getter `0x140084110` with
TypeId bytes `ce6d86bb34af349833918b062bb8b005` at `0x1458f9400`. Startup uses
that same getter for the 440-byte Save recovered by `0x14541e3c0`.

The auxiliary snapshot byte comes from a separate resource obtained through
`0x140081da0` with TypeId bytes `949eb60ff3eb1a6b9b2e0295a04c528f` at
`0x1458f9a88`. The content producer reads its first byte at `0x14009b6d2`.
Picker-shell `0x14024d6d0` captures the same resource pointer at
`0x14024d9e7`, reads it at `0x14024df3f..0x14024df4a`, and passes it to the
footer. Footer `0x140249100` tests that first byte at `0x140249c1f`: nonzero
selects the 15-byte key `picker.entering` at `0x14593f600`; zero selects the
12-byte key `picker.enter` at `0x14593f5f4`. The auxiliary byte therefore has
the proved display role of entering/launch-in-progress state. Follow-up
[Enter recovery](menu-input-0.97.2.md) binds action3 and keyboard Enter to
this exact resource: the action dispatcher sets tag1/timestamp, and the
shared keyboard producer clears that tag after30seconds without completion.
Its original Rust type/name and launch/session completion writer remain
unresolved. Full producer eligibility semantics and complete system schedule
ordering also remain unresolved.

The native request therefore follows content-pane invalidation, rather than
every global picker-root redraw or the separate root-state `+13` gate.
Source `ZoneVisibility::observe_content` compares Pick, entering state and an
explicit Save revision. Save replacement and successful account/Pick commits
increment that revision; unrelated redraws do not. The footer now selects the
proved entering label from the same state. The subsequently bound native
Enter producer now drives that state; no informational notice is substituted.
The source intentionally leaves world entry and completion events unconnected.
Screen/query cache resets and exact schedule ordering are still incomplete.
These source changes were not compiled or executed.

## Reproduction

```sh
python3 scripts/recover-zone-scroll.py --prepare
python3 scripts/rea-batch.py runtime/menu-zone-scroll-0.97.2/plan-140096af0.json
python3 scripts/recover-zone-scroll.py --prepare-producer
python3 scripts/rea-batch.py runtime/menu-zone-scroll-0.97.2/plan-14009b220.json
python3 scripts/recover-zone-scroll.py --collect
```

The batch runner requires a fresh output directory for a repeat run. The
completed queries used REA 6.5.0 with Ghidra 12.1.4 and closed their native sessions.
The reconstruction does not require the reference EXE to compile or consume
the recovered source behavior.
