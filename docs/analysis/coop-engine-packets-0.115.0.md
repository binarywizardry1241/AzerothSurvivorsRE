# Co-op engine packet bridge —0.115.0

The current native co-op protocol carries ordinary engine opcode/body packets
bidirectionally in wire7. Its native serializer/decoder and compressed batch
boundary are retained in [the wire/state report](coop-replication-0.115.0.md),
bound to installed0.115.0 SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.

`coop::engine_packets::encode` writes the existing benilla protocol for actual AS
`SessionEvent` output. It provides object fields/create/remove, movement, casts,
combat logs, cooldowns and unit cooldown resets, aura expiry, chat/addon lines,
templates, inventory refusals, map POIs, raid targets, world entry and logout.
It also provides spell-book/action-bar snapshots and ordinary spell delta codec
forms. Native bootstrap uses the complete class-pool book plus racial and separate
learned action buttons; codec support alone is not evidence of a native per-hero
learn/unlearn stream. Every output remains an ordinary `EnginePacket`; the co-op
session owns recipients, ordering and wire7.

The inverse layouts come from the existing public engine's production parsers
under `crates/benilla-protocol/src/messages/`, including `spellbook.rs`,
`action_bar.rs`, `items.rs`, `gameobject.rs`, `spells.rs`, `monster_move.rs`,
`combat_log.rs`, `gossip.rs` and `update_object/`. These are source codec contracts;
this work does not treat a generic WoW behavior as new native AS evidence.
The existing AS template producer and client decoder already use these formats.

Spell-book IDs retain their wire16-bit width and reject overflow. Action bars
write120 packed32-bit slots and reject duplicate/out-of-range slots or IDs above
24 bits. Cast-result arguments are preserved. Item templates restore only the
parser's specified unused blocks; spell ordinals, signed charges/cooldowns,
resistances and complete tooltip strings remain available. Contradictory duplicate
spell ordinals, mismatched first damage/use-spell projections and excess blocks
are refused. Ground path offsets round to quarter yards and reject nonfinite or
out-of-range packed offsets instead of wrapping.

At 0.115.0 the representation omitted ammunition inventory type, so the
bridge rejected ammo-bearing SpellStart and SpellGo. The [0.141.1 rifle
repair](ahn-qiraj-rifle-0.141.1.md) preserves and forwards both SpellGo ammo
words. Ammo-bearing SpellStart still requires a complete representation.
Object-create movement with transport, jump or
spline data omitted by the event is refused; existing AS producers supply the
supported forms. Semantic notify/end markers return no independent packet,
because their owner is the surrounding UPDATE_OBJECT record. Other unsupported
semantic variants return an error. Fields explicitly discarded as unused by the
parser use its canonical empty/zero representation; the resulting semantic
inverse is not a claim that arbitrary original packet bytes can be reconstructed.

Validation: `python3 -B scripts/check-coop-engine-packets.py` checks that
every direct current AS client/bootstrap event constructor has an encoder arm,
and checks important bounded representation gates. Ten authored Rust
regressions use the real production decoder for sparse fields/full GUIDs, hit
lists/destinations, spell metadata, query/inventory/POI replies, full signed item
templates, signed48-slot aura expiries, complete cooldown-reset GUIDs, rejected ammo,
packed paths and unread-tail checks across world/combat packet forms. They have
not run or compiled. Rustfmt successfully parsed the
source through stdin. Builds, live multiplayer sessions and native parity remain
unverified.
