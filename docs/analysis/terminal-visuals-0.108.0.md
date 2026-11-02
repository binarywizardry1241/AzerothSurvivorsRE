# Terminal visual and dynamic component ownership — 0.108.0

This scoped static recovery uses the installed **0.108.0** EXE, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
The [contracts](evidence/0.108.0/terminal-visuals/contracts.json) bind current
ranges, TypeIds, direct calls, diagnostics and retained Ghidra output. The
[0.107.0 report](terminal-visuals-0.107.0.md) retains its historical provenance.
Current overall status belongs to [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md).

## Terminal registration and visual queries

The terminal tuple is independently located at `145df88ba`, referenced by
bundle registration `140377d00`. Its component owner `1402d0010` registers the
current one-byte EndAction, then Interaction, Node, BorderColor,
BackgroundGradient and BoxShadow. It does not insert picker Hover or Button.
The current EndAction TypeId is `0a9c5a24253c839aa7c6cd2bce7857b4`;
the historical EndAction TypeId is absent from this EXE. Current Interaction
retains `fa4b97b45afe582358501e3a717a5faa`.

Current Ghidra decompilation of the two component owners corroborates the
registration path. The shared leaf `144e3e1a0` copies the 88-byte descriptor,
retains the component identity at `+100` and clears all five hook slots at
`+108/+110/+118/+120/+128`. EndAction and Interaction registration also
initialize empty required-component collections. These are registration
defaults, separately assessed from later hook registration below.

The current declared-unwind instruction inventory identifies 68 direct calls
to the custom Interaction query getter `1402d6c90`, belonging to **43 query
owners**. Exactly three also call BorderColor getter `1402d7770`:

| Current query | Additional required state | Current registration owner |
| --- | --- | --- |
| `1403d2090` | 4-byte singleton animation state | `1402e22c0` |
| `1403d2770` | 56-byte card animation state | `1402eaea0` |
| `1403d90e0` | 44-byte picker Hover state | `1402f95e0` |

Those states are absent from the terminal tuple. BoxShadow query getter
`1402da8e0` has three direct query owners: the singleton/card queries above and
`1403ce6a0`, whose separate Badge filter is recovered below.
The terminal EndAction getter `1402e7e30` has one decoded direct caller,
`1403d76d6`, in terminal query `1403d76a0`. That query fetches Interaction,
EndAction and the separate optional state; it has no visual component fetch.
The optional state's historical timing behavior is not relabeled as current
input-body proof by this report.

The live `gameplay/terminal_view.rs::button` already matches the recovered
Interaction-only component admission and retains border, gradient and shadow.
This evidence supports preserving that source path; it does not support adding
hover interpolation, lift, colors or a confirmation component.

## The additional BoxShadow painter belongs to the updater Badge

Expanding beyond the previous BorderColor-only census finds query `1403ce6a0`: it
fetches mutable BoxShadow and Interaction, then registers the zero-sized
component from `1402ff150` as a separate query filter. Its sole component-bundle
producer `1400e3230` is named by the current tuple at `145dfde75` as
`wenilla_rogue_app::screens::update::Badge`, alongside update Act, Interaction,
Node, border, gradient, shadow, GlobalZIndex and UiTransform. The terminal tuple
does not contain Badge.

The original filter helper `144e73910` sets that component's bit in the first
mask of each 48-byte filter entry. Current marker-only and shadow-query owners
both use this helper. The shadow query belongs to system initialization
`1400daf60`, runner `1400db390` and updater body `1400ce690`; the current stored
system vtable independently holds initialization at `145dcf238` and the runner
at `145dcf200`. The additional painter therefore has concrete updater-Badge
ownership; its discovery is not a reason to attach updater Badge to terminal
buttons. This classification expands the recovered source/visual boundary;
arbitrary computed painters remain outside it.

## The additional dynamic writers are entity-clone writers

The expanded current TypeId references include `PCMPEQB` memory comparisons,
which the earlier selected LEA/MOV search did not classify. Following these
references recovers additional concrete writers:

| Current owner | Recovered role |
| --- | --- |
| `14012ca30` | Typed one-byte EndAction clone-component writer |
| `140129dd0` | Typed one-byte Interaction clone-component writer |
| `142620110` | Reflected Interaction clone-component writer |

Their actual diagnostic carrier identifies Bevy **0.18.1**
`entity/clone_entities.rs`. Current Ghidra pseudocode is retained for the
EndAction and reflected Interaction owners; the current original instructions
for all three are retained. The ordinary Interaction writer has the same
reviewed storage/guard shape as EndAction with its own current TypeId.

The typed writer rejects a previously written builder or a source descriptor
without the required TypeId. On its preallocated path it copies one byte into
scratch storage, appends the component identity and copied-data pointer to two
parallel vectors, and marks the builder written. These are component identities,
not dispatched terminal actions or entity events. The reflected route first
checks the reflected input TypeId, then applies the destination descriptor and
single-write guards before the same one-byte copy. Allocation/growth paths
remain external callees; the checker does not execute them.

These recovered writers can copy an Interaction/EndAction component. They
neither register ComponentInfo hooks nor write border/gradient/shadow fields.
Their existence therefore supplies no generic terminal hover painter. Discovery
of a type-erased component writer is kept distinct from discovering a live
terminal animation system.

## Later public hook registration

The current EXE contains **ten** exact public hook-mutation diagnostic carriers,
referenced by **48** declared-unwind owners. Their associated type-specific
carriers identify UiGammaLane, FfxBackdrop, MotionBlur, DynamicSceneRoot,
ShadowFilteringMethod, ContrastAdaptiveSharpening, Tonemapping, Readback and
Mesh2d. The shared carrier's seven owners resolve to the five Avian joint types
(Fixed, Distance, Revolute, Prismatic, Spherical), Sleeping and Collider.
The retained manifest binds each current owner range to its bytes. None of
these recovered public registration routes identifies EndAction or Interaction.

The five shared native setters are also recovered independently:

| Setter | Owner | Slot relative to ComponentHooks |
| --- | --- | --- |
| on_add | `144e30fe0` | `+0` |
| on_insert | `144e31010` | `+8` |
| on_replace | `144e30fa0` | `+10` |
| on_remove | `144e31050` | `+18` |
| on_despawn | `144e30f60` | `+20` |

Each accepts an empty slot and stores the requested pointer; an occupied slot
branches to its duplicate-hook panic. This explains how later hooks can mutate
the initially empty metadata without treating that default as permanent.
It does not establish that every raw ComponentId, direct metadata store,
indirect callback or computed/global visual writer has been recovered.

## Checks and remaining boundary

Run from the checkout root:

```sh
python3 -B scripts/check-terminal-visuals.py
python3 -B scripts/check-terminal-visuals.py \
  --python-libs runtime/armory-recovery/python-libs --prepare-rea
```

The checker verifies **29 native ranges**, **75 direct query-call contracts**,
current TypeId occurrence locations, ten public hook diagnostic carriers and
48 owner hashes, retained extract hashes and the live terminal bundle.
With the existing optional Unicorn package, **57 bounded native cases** pass:
16 poisoned initializer/identity combinations, 20 empty/occupied hook-slot cases
and 21 component-clone cases covering byte transport, descriptor flags, TypeId
mismatch and duplicate writes. Every original instruction is checked against
its retained address/bytes; execution stops before returns or rejection/panic
handlers. Calls, allocation/growth, external callbacks and writes outside
scratch memory are forbidden. These cases execute neither a game nor a Rust
application/test build. `--prepare-rea` stages reproducible raw-function plans
under ignored `runtime/` without starting Ghidra or the target.

The reference census begins at declared PE unwind entries. It does not classify
computed/encoded references, all indirect dispatch, executable bytes outside
those extents or complete system scheduling. The updater-Badge painter, clone writers and public hook
registration routes above are now classified; arbitrary ComponentId/global
painters remain unresolved under **#9/#41**. No source visual behavior change
was justified. Compilation, game execution, input/rendering/DPI/device checks
and original/rebuilt visual parity were not performed.
