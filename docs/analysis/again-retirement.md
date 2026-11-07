# Again retires the old world's objects

Target: installed **0.123.0**, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [manifest](evidence/again-retirement/manifest.json) binds seven
journaled Ghidra queries, exact current PE code/data and the connected source.
The permanent findings are #276 (ghost cache), #278 (retained companions) and
#279 (retained boundary pillars); #49 retains ordinary cache lifetime ownership.

## Recovered retirement boundary

Current command dispatcher `145c23740` selects command6 through current table
`1476acad4`, index4, into `145c237d0`. Its take/replacement branch begins at
`145c24476`. It persists the prior result through its existing helper, marks the
Game option absent and takes its contents. An absent Game does not construct a
replacement. With no active connection the old Game is dropped. For an active
connection, the taken Game's nonzero player GUID causes empty GossipComplete
(opcode17e) before object retirement.

Collector `145b1dd80..145b1ea56` enumerates these current native owners in order:

| Game pointer/count | Row / identity | Collection |
| --- | --- | --- |
| +5b8/+5c0 | stride1e0, GUID+f0 | Shared hostile actors, without a living-only filter |
| +660/+668 | stride48, GUID+28 | All primary pickup objects, including caches |
| same pickup vector | per-row pointer+8/count+10 | Separate flattened auxiliary GUID pass through `145c8c6a0` |
| +5d0/+5d8 | stride58, optional GUID+18 | Nonzero shared area objects |
| +648/+650 | stride78, GUID+58 | Totem objects |
| +d0/+d8 | stride80, GUID+20 | Combat followers |
| +958/+960 | stride20, GUID+0 | Lightwell objects |
| +3a8/+3b0 | stride48, u32 identity+38 | Item GUID composed with `4000000000000000` |
| +9f8/+a00 | stride70, GUID+38 | Loot companions |
| +a10/+a18 | raw u64 vector | Retained boundary objects |

The pickup kind2 table cell at `14732e63c+8` leads to `145b58e0c`.
The selected branch supplies entry9005/display259/type3; the shared append writes
its actual returned object GUID to pickup+28 and advances Game+668. This binds
caches to the primary pickup pass, independently of whether their creation
packet has already left the pending queue. The auxiliary pass follows *all*
primary IDs rather than interleaving children with each parent.

The current `game/companions.rs` owner `145b4c050` reads the same +9f8/+a00,
stride70, GUID+38 collection. Current Begin `145b18c00` loads descriptor
`14732b4d0` (entry9013/display4831/scale1), calls shared GO constructor
`145b6c2e0` with type5/flags16, and appends the returned GUID to +a10/+a18.
These producer/consumer links establish the separate companion and pillar
retirement boundaries. Existing follower/ground constructors retain their own
reported provenance; this bounded collector does not re-certify every spell,
pet definition or area-effect producer.

At `145c24799`, the caller serializes each collected u64 as the complete
8-byte payload of opcodeaa/ObjectDestroy and sends it through the existing
connection. The completed loop precedes replacement constructor `145c26320`.
The collector excludes the retained player's GUID and does not enumerate static
MPQ world objects. There is no speculative scene-wide despawn or aura wipe.

## Connected source

`Mechanics::retirement_objects` reads the actual retained logical collections.
The split hostile and combat-follower source vectors use their existing full
allocation chronology, preserving ordering through truncated GUID/counter wrap.
Primary pickups precede all auxiliaries; optional zero area IDs are excluded.
The private hero contexts contribute their actual retained summons and objects.
The shared boundary creator now retains each returned GUID in `boundary_objects`
in addition to publishing its ordinary create event. Clearing the event queue
therefore cannot lose the identity needed by Again.

The terminal input owner snapshots retirement while the old Mechanics still
exists, after settlement/gossip preparation and before replacing its option.
`finish_client_delivery` first drains previously admitted presentation/wire
traffic, then delivers final messages and retirement while the same client is
active. This matters because wire decoding appends behind an existing
presentation queue: appending destruction before that drain could otherwise
place an old create after its destruction. The source enters replacement on the
following entry pass; the retained client is paused only after the retirement
flush. The ordinary ObjectDestroyed handler owns GUID removal/fade.

The actual inventory publisher supplies its retained item IDs and clears its
publication identity before the new run can reconcile them. Shared retirement
uses the existing co-op packet encoder and synchronized-recipient routing after
old deferred engine traffic has been drained. Host item privacy remains governed by
the existing owner-only packet classifier. Each remote inventory retires its exact
published rows directly to its own client, between the shared pre-item and
post-item object passes; recipients may legitimately share private item GUIDs.
The terminal system explicitly precedes the host publisher, preserving its
old recipient/inventory mappings through deferred cleanup. Source collection and
delivery are separate from proving the complete cooperative restart/admission
lifecycle.

The existing First-stage visual synchronization removes old host-owned roots
before unit publication. Ordinary pickup/companion objects use engine ownership
instead of that host visual collection. Keeping this ordering preserves initial
unit creation before its queued casts; retirement adds no separate publication
delay. Actual scheduler execution remains unverified.

## Static checks and limits

```sh
python3 -B scripts/check-again-retirement.py
```

The checker verifies **1,346 original instructions**, four exact data ranges,
seven completed query/subject commitments and the live source connections.
**70 bounded original-instruction cases** execute the collector and selected
caller through counts0..20, including the scalar/vectorized boundaries,
auxiliary flattening, optional zero ground IDs, tagged item GUIDs, no Game,
no active client and zero/nonzero player-GUID gossip admission. The caller
fixtures assert every ObjectDestroy payload/order before replacement admission.

Unicorn executes the retained original code only. Allocator, vector reserve,
copy/free, settlement, packet delivery and the replacement constructor are
explicit seams; real allocations, packet queues, workers or game systems are
not executed. The raw dispatcher and pickup imports omit their external switch
tables; their selected current PE cells and decoded branch instructions supply
those mappings. The interior take-block decompilation retains its inherited
register/frame assumptions. Ghidra pseudocode is supporting evidence, not
original source or proof of complete native decoding.

The authored Rust regressions cover caches whose creates were already drained,
primary/auxiliary order, retained pillar GUIDs and private inventory retirement
with identical GUIDs across owners; they are uncompiled and unrun.
Rust syntax parsing and source guards do not execute Rust, Bevy, its scheduler or
the client lifetime handlers. Full ordering among separately reconstructed
shared area/private context collections is not certified by these source
checks. The ordinary supported cache retirement and the identified companion/
pillar owner connections have source implementations; complete system behavior,
compilation, actual Again timing, co-op transport/ACK/rebootstrap, loading,
rendered fades and original/rebuilt parity remain unverified. The separate
[#277 aura/mover repair](again-runes.md) recovers the fresh descriptor's
explicit reset and serial handoff; that behavior is not inferred from this
object-retirement collector.
