# Choice and ordinary upgrade contracts

Gap **#41** source/static recovery for the installed EXE with SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [compact native/source check](evidence/choice-contracts.json) and
[focused Ghidra observations](evidence/choice-contracts-ghidra.json)
bind the result to current bytes. Existing
[producer contracts](evidence/native-producer-contracts.json) remain the
canonical copy of their descriptor, weighted-record, cursor, publication and
selector extracts.

## Implemented source correction

`UpgradeKind` now contains precisely the five ordinary lanes `Power=0`,
`Cooldown=1`, `Targets=2`, `Area=3` and `Duration=4`. The obsolete `Haste=5`
variant exposed a zero-magnitude/no-op apply path and demon attack-speed prose
after the target removed that Empowerment upgrade. Its sixth count slot and
both card/prose arms are removed. The runtime count array has five lanes;
existing in-memory proxy assertions were adjusted to that shape.

All **113 current descriptor slices** match the source catalog in order and
contain only `0..4`. The current collector and the magnitude, apply and prose
consumers retain those five meanings. `RuntimeInstance` is a semantic runtime
structure, without a serialized save representation or a native memory-overlay
contract. Its count consumers are magnitude/apply and the existing copied demon
proxy state. No other source talent/proc producer uses the deleted variant.
Historical native fixtures retain their original target identity.

## Current native input chain

The weighted candidate writer in `14595ca60` supplies a 32-byte sum after its
weight. Learn candidates write niche header `8000000000000000`; upgrade
candidates write a positive one-byte Vec header `1`, pointer, length and ability
index. Selection copies the payload into the private 32-byte cursor buffer.
`1459d9c90` adapts that buffer, and `1459ebfd0` advances the cursor by 32 bytes,
retains the original sum, chooses rarity, and calls constructor `145961590` at
`1459ec39b`. The copied original sum is distinct from the scratch upgrade Vec
used during rarity admission.

Constructor and accept normalize nonnegative headers to selector `1` and
negative headers by XOR with `8000000000000000`. Their current meanings are:

| Selector | Constructor input / display payload |
| --- | --- |
| `0` | Learn by key pointer/length. |
| `1` | Ordinary upgrade byte Vec plus learned-ability index. |
| `2` | Jewelry descriptor pointer. |
| `3` | Owned 112-byte amulet record pointer. |
| `4` | Gold amount. |

The constructor rebuilds the ordinary upgrade Vec with collector `1459cb2a0`,
shuffles it, limits it to one kind or two for rarity `4`, and publishes that
Vec header at display `+0x78`, with the learned index at `+0x90`. The selected
Vec's nonnegative capacity occupies the sum's first word; the five fixture
selectors do **not** turn factory first words into choice headers. The other
four branches publish their exact negative niche headers.

The collector reads the iterator's original bytes and appends each accepted
byte unchanged. Its inputs are the descriptor slice at `+0x30/+0x38`, the
learned instance, stats and rarity references. Prose adapter `1459d8300` passes
the constructor's selected byte slice to `1459f4900`, which forwards each byte
to magnitude. Accept reads display `+0x78` from `Game+0x658`, stride `0xa0`,
after state/index gates; its upgrade branch clones the selected byte Vec and
passes those bytes to magnitude before applying them in order.

## Direct calls beyond the current body census

The focused encoded-`CALL` scan checks every executable section for calls to
these five selected interfaces, then verifies each candidate against a complete
independent decode of its declared extent. It retains **15** exact call sites.
This is instruction-boundary evidence, not additional Ghidra flow ownership.

Magnitude `145993420` has **three** such callers:

| Call site | Declared extent | Input producer |
| --- | --- | --- |
| `1458965c0` | Eligibility iterator `145896530` | A byte from the captured descriptor slice. |
| `14596748a` | Accept `145966a60` | A byte from the selected display upgrade Vec. |
| `1459f49d2` | Prose iterator `1459f4900` | A byte from the constructor's selected upgrade slice. |

The previous current Ghidra reference census observed only the first and third.
The accept call lies beyond its unresolved computed dispatch. Constructor calls
to the collector at `145961e62` and prose adapter at `145961ef3` are also exact
current instructions beyond that observed reference set. The current reference
census is preserved rather than silently relabeled as complete. These call facts
must remain in the missing slice/alias contract; the earlier two-caller list
cannot define its full scope.

## Static checks and limits

`check-choice-contracts.py` passes:

- **113** source/native ordered descriptor slices and **15** exact selected CALLs.
- **1,130** complete original collector scenarios: all descriptors, five rarities
  and neutral/modified runtime states. Every result is an ordered filter of its
  input descriptor bytes.
- **2,275** complete original constructor scenarios followed by accept's actual
  state/index/dispatch prefix. Ordinary learn/upgrade cases cover all descriptors,
  five rarities and both states; concrete current jewelry, amulet and gold
  payloads exercise the other branches. Constructor outputs supply the actual
  160-byte records read by accept.
- **1,650** original accept-to-magnitude call prefixes covering every permitted
  current descriptor tag and all five rarities, with exact instance/tag/rarity
  argument checks.

The existing current balance check passes **113** ability records, nine classes,
498 shared gear effects, 913 native scaling cases and 313 retained talents.
The existing Empowerment check passes five support, 85 eligibility and 60
ordinary apply cases. These are static/native fixtures; Rust is not executed.

The mapped-image fixture supplies allocator/C-memory/English-fallback seams.
Finite prose `ceilf` uses host `ceil`; the amulet cases supply only
`powf(x,0)=1`, with a guard rejecting every nonzero exponent. Actual Windows
floating-point imports and localization resources are separate validation.
Bounded Ghidra raw imports recovered the collector and prose adapter; their
external callees, generic ABI, original types and allocation-failure rendering
remain explicit limitations.

The arbitrary-run ancestry of definition pointers in `Game+0x330`, and every
possible mutable alias/write into the published `Game+0x650` choice Vec, remain
unclosed static contracts. Finite constructor cases and exact direct-call sites
do not establish universal mutable-input domains, globally guarded dispatch
edges, actual native function ownership, or complete state transitions after
accept's prefix. Those #41 boundaries remain open. No compilation, game,
rendering, save I/O or original/rebuilt parity comparison ran.

Reproduce from this checkout using the existing ignored Python dependencies:

```sh
export PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs
python3 -B scripts/check-choice-contracts.py
python3 -B scripts/check-balance-definitions.py
python3 -B scripts/check-demonic-upgrade-flow.py
```

`--prepare-rea` prepares two bounded raw-range plans beneath
`runtime/analysis/history/native-recovery/choice-contracts/d1999c75543b/`; run each with `scripts/rea-batch.py` in a new
output directory to reproduce its Ghidra observation. Bulk case inventories,
raw Ghidra responses and failed full-image startup diagnostics remain ignored.
