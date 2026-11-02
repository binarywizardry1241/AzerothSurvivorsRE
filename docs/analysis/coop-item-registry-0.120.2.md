# Guest item-effect registry writer search — 0.120.2

Finding **#101 remains blocked at the guest text producer/carrier**. This
bounded follow-up closes the selected current aggregate-reference and reserve
escape questions; it does not identify a source repair. The installed target
is **0.120.2**, SHA-256
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status.

The [manifest](evidence/0.120.2/coop-item-registry/manifest.json) binds the exact
current EXE, all selected declared/complement encoded references, the saved
full-image Ghidra operand inventory, three journaled Ghidra results, canonical
extracts and the existing source insertion interface. Preferred PE addresses
below are static coordinates, not observed runtime pointers.

## Current bounded result

| Boundary | Observed result |
| --- | --- |
| Complete selected references | The 32-byte registry window `148534458..148534478`, interner `145aa2a40` and lookup `145aa2ce0` select **30 declared references and zero complement references**. They expose the interner, lookup, lock/unwind guards, one serializer call and one lookup registration. |
| Independent full-image operand join | All **29** selected fixed/address operands on the saved verified Ghidra instruction boundaries match those same reference sites; the remaining direct serializer CALL is outside that operand category. This population supplies no additional writer site. |
| Initialized aggregate pointers | Scanning every possible qword value pointing inside the registry window finds **zero mapped initialized literals**. This is a static-image search, not a claim about mutable pointer values. |
| Interner `145aa2a40..145aa2c42` | Exact length-delimited byte comparison, copied append-only strings and `0xf00000 + index` are retained. The current capacity/pointer/length are `148534460/468/470`. The only selected ordinary length write is `145aa2bde`; lock/poison writes remain separate. |
| Lookup `145aa2ce0..145aa2e1c` | IDs below the synthetic base or outside the current length are absent; admitted indices clone the stored string. This function inserts no text. |
| Aggregate escape `145aa2bb3` → `145fab2e0..145fab34b` | The interner passes the vector aggregate to reserve. Reserve passes capacity/data-pointer values to allocation and replaces capacity/pointer. It neither writes logical length/text contents nor passes the aggregate address to that allocator. This is not an alternative guest text insertion. |

The three current ranges contain **937 exact bytes / 252 decoded instructions**.
Their current decompiler results preserve external-signature, incoming-register
and helper limits. The actual target bytes and selected instruction/reference
boundaries, rather than guessed C types, identify the contracts.

The existing source continues to intern strings in
`gameplay/client/inventory.rs::Item::template` and publish those rows through
`benilla-app/src/local_client/item_descriptions.rs` into the ordinary tooltip
catalog. Those source paths are retained; this investigation proves no new
guest bridge to connect. The [0.119.0 ordinary query/receive/decoder/cache and
tooltip recovery](coop-item-registry-0.119.0.md) retains its historical target
and was not repeated. This three-function review does not transfer that whole
pipeline's applicability to 0.120.2.

## Static check and remaining blocker

`python3 -B scripts/check-coop-item-registry.py --contract writer-search --verify-inventories`
reproduces both exact reference populations, the selected full-image operand
population, mapped initialized-pointer search, current native/export/query
commitments and the existing source witnesses. It starts no Ghidra process or
application and compiles no code.

No concrete alternative guest registry writer, carrier or computed/mutable
producer has emerged from these current populations or the already recovered
ordinary decoder path. The remaining question is the native producer that
associates another process's synthetic effect IDs with its text, including
identity and lifetime. Further recovery requires a concrete alternative site
or producer; repeating the ordinary decoder or reconstructing generic engine
subsystems would not resolve that missing lead. Arbitrary register-derived
aliases and unobserved native instructions remain outside these bounded
negatives. They do not prove global absence or an original-game tooltip defect.

No speculative packet extension, ID remapping, registry reset or merge policy
is implemented. No application compilation, compiling test, game/client/network/
server operation, save/settings mutation or original/rebuilt comparison ran.
The guest bridge, actual delivery/rendering and parity remain unverified.
