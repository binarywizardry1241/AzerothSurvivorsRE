# Guest item-effect registry recovery — 0.119.0

Finding **#101 remains blocked at the guest text producer/carrier**. The actual
ordinary item decoder is now recovered; it does not populate that registry.
No gameplay source change, transport extension, ID remap or registry reset is
justified by these results. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current
implementation status; the [0.115.0 recipient repair](coop-item-text-0.115.0.md)
and [0.118.0 investigation](coop-item-registry-0.118.0.md) retain their actual
targets.

The selected installed EXE is **0.119.0**, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
The [manifest](evidence/0.119.0/coop-item-registry/manifest.json) binds twenty
native ranges, original durable Ghidra results/profiles, selected canonical
decompiler text, exact current reference populations and source witnesses.
All native addresses below are preferred PE addresses, not observed runtime
pointers. Incoming register names/types and decompiler warnings retain their
provider limits.

## Recovered path and live source

| Boundary | Current native observation and source connection |
| --- | --- |
| Host string identity | `145b5cb20..145b5cd22` compares exact length-delimited bytes, appends a copied string when absent and returns `0xf00000 + index`. `145b5cdc0..145b5cefc` clones an in-range string. Lock/poison are `148516728/729`; the vector is capacity/pointer/length at `148516730/738/740`. `gameplay/client/inventory.rs::Item::template` retains this append-only identity through the shared `LocalItemDescriptions`. |
| Item response | `145b66220..145b68f80` calls the interner at `145b6772d` while producing five six-word spell records for opcode `0x58`. The selected effect-loop extract retains that ID/trigger connection. `coop_commands.rs` builds the recipient-localized item using the host registry; `coop/engine_packets.rs::item` serializes its IDs. This is not a text carrier to another process. |
| Guest query routing | Full-PE request owner `145b097a0..145b0d8b2`, gate `145b097e6..145b09859`, keeps only `0x4b/0x1ce/0x1dc` on its synchronized guest-local path. Opcode `0x56` copies its body, constructs the Engine variant, serializes via `145aaf3d0` and appends the outgoing buffer before returning. The local item constructor is bypassed on this branch. |
| Guest Engine delivery | Full-PE `145b1c260..145b1d5e4`, Engine case at `145b1cd70`, checks guest/synchronized state and admission helper `145ae0ce0`. For opcode `0x58`, that helper's explicit bit-test path admits body lengths through `0xfffd`; its raw Ghidra view does not include the external table used by other opcodes. The receive branch calls `145afd100` at `145b1d51b`. That callback selects the actor and calls framer `145b5b2a0`, which encrypts only the four-byte header and copies the body unchanged. The source queues the received opcode/body in `LocalWireEvents`. |
| Actual opcode `0x58` decoder | Full-PE dispatcher `145ca8b50`, case at `145caa0cd`, calls `145c8e500..145c8face`. This decoder reads the main name, three unused names, numeric/stat/damage fields, five six-word spell blocks, flavor and fourteen final words ending at bag-family. It returns the remaining cursor without reading a text extension. `benilla-protocol/src/messages/items.rs::read_item_query_response` and `parse_server_with_tail` expose the same ordinary boundary. |
| Decoder helper boundary | CString reader `145cc58f0` consumes through NUL and returns owned text; the three vector reserve helpers use row widths 8/12/28 and change capacity/pointer. No interner/lookup/registry reference is observed in these helpers. Valid UTF-8, allocation and vector services are explicit seams in the instruction replay, not claimed complete helper execution. |
| Template cache and tooltip lookup | `140ac94d0` moves the decoded template into the ordinary item cache and releases waiters. Startup installs lookup `145b5cdc0` through `14082a8b0`/Once helper `145fc32b2`; `140c7cc00` invokes the registered callback and otherwise uses the ordinary spell catalog. Those are registration/readers, not a receiving text producer. The source path is `local_client/events.rs` → protocol decoder → `net/objects.rs`; item effect text ultimately reads `Spells.catalog` in `ui_items/feed.rs`. |

The complete selected declared/complement inventories contain **30 encoded
references** to the registry aggregate, interner or lookup. They expose the
interner, lookup, unwind/lock handling, the serializer call and lookup
registration. No initialized qword literal into the 32-byte registry search
window was found. The observed aggregate-address escape calls reserve
`145f94690`; its recovered body changes capacity/pointer, not logical length or
text contents. This closes these encoded populations only. Register-derived
or computed/mutable aliases and unobserved instructions remain separate unknowns.

The existing insertion interface is
`benilla-app/src/local_client/item_descriptions.rs::publish` →
`SpellCatalog::insert_tooltip_description`. Its registry/catalog survives runs
and ReloadUI. Resources/wire11 instead reaches VM spell/aura overrides through
`LocalSpellDescriptions`; those overrides do not supply the ordinary item
tooltip catalog. The current inspected source provides no guest insertion at
this boundary. Resetting, merging or remapping host IDs would require a recovered
identity/lifetime policy, which these paths do not establish.

The separate [guest Engine admission repair](guest-engine-admission-0.119.0.md)
under **#180** now gates the same received opcode/body before source observation
and queue insertion. Its complete native opcode/length dispatch and receiving
port/synchronization guards preserve the item response bytes. It supplies no
effect-text carrier or registry insertion; the #101 blocker is unchanged.

## Validation and remaining blocker

`python3 -B scripts/check-coop-item-registry.py --contract decoder --verify-inventories`
verifies current EXE bytes, native/query/export commitments, selected source
connections and the exact retained reference populations. It does not launch
Ghidra or execute the game.

`python3 -B scripts/coop_item_decoder_native.py` replays only the admitted
current decoder instructions in Unicorn. **128 template, 8 unknown-entry and
68 scalar-truncation cases pass**, covering every sparse spell mask, ordinary
and synthetic IDs, all six spell words/ordinals, empty/Unicode name and flavor,
the fourteen final words and opaque trailing bytes. Input and registry bytes
remain unchanged in these fixtures. CString reading/allocation, vector growth
and deallocation are explicit seams. Spell growth is exercised; stat/damage
growth is declared but unexercised by the empty-stat/damage fixtures.
Missing-NUL, malformed UTF-8, allocation failure and unwind behavior are excluded.
This is bounded instruction evidence, not source/client/network execution.

No observed producer/carrier associates the host's synthetic IDs with text in
the receiving process. The previously missing ordinary decoder and its helper
boundary no longer supply an unexplored bridge; the current query, receive,
framing, cache, lookup and observed reserve aliases do not supply one either.
A further bounded recovery needs a concrete alternative guest registry writer,
carrier or computed/mutable alias lead. No such site was established by these
routes. Generic engine reconstruction is neither a substitute nor a prerequisite.
These bounded negatives do **not** establish global absence or an original-game
tooltip defect. The selected repair remains blocked, not complete.

No compilation, game/client/server/socket execution, save/configuration mutation,
mixed-language rendering or controlled original/rebuilt comparison occurred.
Compilation, actual delivery/rendering and original/rebuilt parity remain
unverified.
