# Guest item-effect registry recovery — 0.118.0

Finding **#101** remains blocked at the native mechanism that populates the guest
registry. This report binds the selected 0.118.0 EXE, SHA-256
`4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae`.
The [manifest](evidence/0.118.0/coop-item-registry/manifest.json) retains exact
native ranges, complete selected encoded-reference populations, journaled
Ghidra receipts, source witnesses and replay limits. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status; the [0.115.0 report](coop-item-text-0.115.0.md)
retains the earlier recipient-localization and identity repairs.

## Native contracts and source connection

| Boundary | Current evidence |
| --- | --- |
| Exact-string interning | `145b5ca70..145b5cc72` deduplicates length-delimited bytes in the process registry and returns `0xf00000 + index`. Mutex/poison are `148516728/729`; capacity, pointer and length are `148516730/738/740`. |
| Lookup and growth | `145b5cd10..145b5ce4c` rejects below-base/out-of-range IDs and clones a found string. The only observed address escape of the vector aggregate is its ordinary reserve call, `145f94210..145f9427b`, which replaces capacity/pointer. |
| Item response | `145b66170..145b68ed0` calls the interner at `145b6767d` and emits opcode `0x58` with synthetic effect spell IDs. Host `RemoteInventory::query` uses recipient-localized items and the host's `LocalItemDescriptions`. |
| Guest query | The synchronized guest gate at `145b09736` keeps only `0x4b/0x1ce/0x1dc` on the local handling path. ItemQuery `0x56` copies its payload, packs an Engine message, serializes it at `145b09ac9`, and queues it upstream. It does not regenerate the item response locally. |
| Guest delivery | Engine reception at `145b1ccc0` admits the received opcode/body and calls `145afd050` at `145b1d46b`. The helper selects the actor and invokes `145b5b1f0`, then appends bytes through `145c7dd30`. Framing encrypts only the four-byte header; it copies the body unchanged. |
| Real item description consumer | Registration at `14008b470` installs lookup through `14082a7f0`; slot/state are `1484cf7a0/1484cf7a8`. `140c7cb40..140c7cd3c` invokes the registered lookup and otherwise follows the ordinary spell-catalog fallback. This is a reader, not a guest registry writer. |

The current declared/complement reference inventories expose **30** selected
encoded references to the registry aggregate, interner or lookup. They include
the interner, lookup, their unwind guards, one direct serializer call and one
lookup registration. The complement population is empty for these selectors;
no initialized qword literal to the aggregate was found. This closes those
specific encoded populations, not arbitrary register-derived aliases, computed
writers or all executable ownership.

The live source makes the unresolved boundary concrete:

- `gameplay/coop_commands.rs` constructs a recipient's item template using the
  host registry. `coop/engine_packets.rs` serializes its effect IDs.
- `gameplay/coop.rs` queues the received Engine opcode/body in `LocalWireEvents`.
  It has no corresponding insertion into the guest's `LocalItemDescriptions`.
- Resources/wire11 fills `LocalSpellDescriptions` and separate VM spell/aura
  overrides. Item effects instead read `Spells.catalog`; sending more override
  rows alone would not reach that consumer.
- `benilla-app/src/local_client/item_descriptions.rs` is the existing insertion
  interface. Its registry and catalog survive a run and ReloadUI, so assigning
  host IDs to different guest-local strings cannot be repaired by guessing a
  reset, merge or remapping policy.

## Validation and precise remaining blocker

`python3 -B scripts/check-coop-item-registry.py --contract framing --verify-inventories`
checks the installed target, range/assembly bytes, decompiler receipts, source
witnesses and the exact retained reference populations without native execution.

`python3 -B scripts/coop_item_registry_native.py` uses the existing
Unicorn harness for **22 interner, 25 lookup, two isolated-registry and 640 framing
cases**. Unicode normalization distinctions, embedded NUL, empty/duplicate text,
all forty cipher positions, header carries, output prefixes and packet length
limits are covered. Eighty-eight oversized framing fixtures are correctly
omitted. Body bytes remain unchanged in admitted cases. Allocation, copying,
comparison, String cloning and registry growth are explicit harness seams;
contention, poisoning, allocation failure, invalid cipher indices and framing
reserve paths are excluded. The isolated registries demonstrate ID-history
dependence; they do not establish an original-game tooltip defect.

No recovered native producer or carrier associates the host's synthetic IDs
with text in the receiving process. The forwarding, receive, framing, registry,
registration and lookup boundaries above do not supply it. A concrete ordinary
client opcode `0x58` decoder owner was not established from the available
diagnostic lead; a nearby `items.rs` filename denotes a different operation and
cannot substitute for that proof. Computed/mutable aliases remain unresolved.
Those are the remaining recovery boundaries; generic engine completion is not
a prerequisite or a substitute.

No speculative transport, wire11 extension, ID remapping or registry reset was
added. The guest bridge is **not implemented**, and #101 is not complete.
Compilation, actual client/network/save/UI execution and original/rebuilt parity
remain unverified. The separately proven admission-version repair found while
tracing this path retains its existing **#163** identity.
