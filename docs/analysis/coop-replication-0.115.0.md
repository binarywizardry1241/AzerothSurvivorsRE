# Co-op wire replication and guest state — 0.115.0

The source implements all nineteen native message shapes, raw DEFLATE batch
framing, the ordinary engine opcode/body boundary and the current named run-state
projection. Target: installed0.115.0, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This is source/static recovery. No compilation, network session, target execution
or original/rebuilt parity check was performed.

The owning source is [`replication.rs`](../../crates/azeroth-survivors-re/src/coop/replication.rs)
and [`client_state.rs`](../../crates/azeroth-survivors-re/src/coop/client_state.rs).
Existing [transport](coop-transport-0.115.0.md),
[server-party](coop-server-party-0.115.0.md) and
[bootstrap](coop-bootstrap-0.115.0.md) reports own their respective lifecycle and
world producers. A message codec alone does not establish that every native
producer or consumer has been connected.

## Wire format

All scalar words are little-endian. `String` means `u32` byte length and UTF8
bytes, decoded lossily by native145b7c600. `Bytes` uses the same length prefix
without text conversion. Collections use a `u32` count. Any nonzero native bool
byte is true. Native count readers check the count against remaining bytes and
a minimum wire element size before allocating. Trailing bytes after a complete
message are tolerated.

| Tag | Payload | Application direction |
| --- | --- | --- |
|1|protocol:u32, version:String, password:String|guest admission request|
|2|slot:u8, capacity:u8|host acceptance|
|3|reason:String|host rejection|
|4|existing complete NativeHero record|guest identity submission|
|5|zone:String|host selects guest zone|
|6|empty|guest synchronization request|
|7|opcode:u16, body:Bytes|engine packets in both directions|
|8|kind:u8, argument:u8|guest native control; kind0..9;7..9 arguments normalize to bool|
|9|event:String|host presentation JSON/event text|
|10|HUD JSON:String|host per-hero HUD snapshot; guest accepts at most65536 bytes|
|11|count, spell tooltip rows|host spell text overrides|
|12|count, (spell:u32, multiplier:f32, kind8:bool)|host spell visual-radius factors|
|13|count, item:u32|host account equipment grants|
|14|count, (seen-key:String, quality:u8)|host account Seen grants|
|15|complete NativeState record below|host per-hero run/account state|
|16|empty|disconnect lifecycle|
|17|existing complete roster collection|host lobby roster|
|18|empty|host run end/reset|
|19|compressed:Bytes|batched native messages|

Tag4 companion names resolve through current14583ed80: known descriptor keys
are exactly the twenty-two existing companion catalog entries; an unknown key
becomes absent. Companion instincts4..255 normalize to0. The native absence
sentinel is internal; the wire-facing projection preserves its empty-key/rank0
serialization.

The canonical serializer remains in the server-party evidence directory.
[Replication evidence](evidence/0.115.0/coop-replication/manifest.json) owns the
complete parser145819960 and both nineteen-entry dispatch tables. Raw-slice
Ghidra decompilation stops at some indirect jumps; complete retained assembly and
original-image table bytes supply those paths. Neither the slice decompiler nor
its printed C types independently establishes a complete semantic struct.

## Batching and initial world

Native145824200 sends nothing for an empty queue, sends one encoded message
directly for a one-message queue, and wraps two or more messages using tag19.
The inflated payload is `count:u32` followed by one `Bytes` blob per encoded
message.145820d40 uses compression level1 with raw, headerless DEFLATE.
145821360 reads at most4194305 inflated bytes and rejects sizes above4194304.
1459c4ae0 skips malformed inner messages and nested compressed envelopes while
preserving accepted message order.

`EnginePacket` carries the real WoW opcode/body without another WoW socket or
encryption header. Its receive helper reuses
`benilla_protocol::messages::parse_server` and `benilla_protocol::decode`.
`initial_world_messages` preserves145892220's order: local snapshot; both
engine actor packets for every other party slot in slot order; raid-target list
last. The actual world owner performs finalization and synchronization; this
helper creates no player, NPC or placeholder packet.

The main-loop host receive budget is200 outer transport frames per peer per
update. Expanding a tag19 frame does not spend another unit per inner message.
A guest drains upstream without that200-frame cap. Host queued writes flush at
intervals of at least1/60 second; guest queued writes flush each update. Per-peer
HUD/text/visual-scale refresh uses0.2 seconds. State15 uses1 second, with immediate
terminal-state refresh when the effective phase is Dead or Victory. General
metadata refresh starts with its last-refresh clock0.

ZoneKey5 resolves the canonical zone, clears previous state, stamps the zone
start clock, resets account-delivery budgets and emits
`{"type":"coopstart","bg":"<zone>"}` locally. Native synchronization is
triggered by the real `CMSG_PLAYER_LOGIN` opcode0x003d after zone selection:
145883dce sets the synchronized flag, flushes previous queued writes and sends
wire6 immediately. Waiting for the initial self-object before sending wire6
would deadlock because that object belongs to the requested initial snapshot.

End18 returns an admitted guest to the lobby without closing transport.
1458965df calls1458948f0 when synchronized: clear the synchronized flag,
deactivate the client engine port and emit ordinary logout-complete0x4d.
It then clears the selected zone and cached state, rebuilds the current hero
from the saved account through145893fc0 and resubmits Hero4 to the host after
flushing pending writes. The resulting frontend status is `joined`. Treating
End18 as a TCP disconnect would discard the native continuing party session.

## Current state and metadata semantics

Tag15 serializes, in order:

1. run clock:f32, local phase:u8, effective-terminal:bool, level:u32, won:bool;
2. kills, earned gold, guardian kills, boss kills, cache purchases, each:u32;
3. density multiplier:f32, reward multiplier:f32, bare equipment:bool, class:u8;
4. zone:String;
5. count and pairs ofu32; count and rows(u32,u32,u8,source-kind:u8,bool);
   count and words:u32.

Current14581d7b0 reads the local hero, while1458eb290 temporarily installs a
remote hero context and restores it afterward. The current AZSRUN serializer
1458f25e0 and its original compact format bind the counter meanings rather than
reusing older layout offsets. Phase values0..5 are Ready, Playing, Choosing,
Paused, Dead and Victory. Effective-terminal uses the local/shared phase's
`phase & 6 == 4`. Bare tests all nineteen equipment words for zero.

`RunProjection` exposes these confirmed fields and preserves the remaining
history arrays when applying named scalar state. The history payloads are
retained in wire order; their wider achievement-event producers remain owned by
the game/account recovery rather than inferred from wire field widths.

For Run Options percentages density, health, damage and speed, the native
producer calculates density/100 and, using sequentialf32 operations,
`min(2,1+(density-100)/100*.05+(health-100)/100*.4+(damage-100)/100*.6+(speed-100)/100*2)`.

Native14584a9b0 rejects a wrong class, different canonical zone or nonfinite
clock. It clamps the clock to0..elapsed-since-zone+30, level to99, density to1..5
and reward factor to1..2; nonfinite factors become1. With clamped clockt, the
counter ceilings are40t+50 kills,500t+1000 earned gold,.05t+1 guardian kills,
`5+floor(1+t/300)` boss kills and.1t+2 cache purchases, saturated tou32 before
integer admission. Won requires `t+30 >= zone duration`. All three history lists
retain only current zone boss IDs, preserving order and duplicates; pair/row
lists also receive the boss-count ceiling, while words are capped by the
number of native zone boss IDs. The caller supplies canonical zone comparison,
actual zone duration and actual boss IDs to `StateValidation`.

HUD JSON10 is produced by14590f0f0 through the per-hero1458ebc80 wrapper. Its
root type is `hud`, with current phase/time/level/XP/vitals/gold, ability and
jewelry rows, buffs, timers, damage/healing/boss meters, bosses, next boss and
co-op revive/share/rescue/party-meter fields. This is separate from EventBytes9
choice-card messages and separate from account grants.

Spell tooltip11 is a complete seven-string display record identified by spell
ID: localized name; primary ability description; secondary effect description;
optional rank(RankN/Racial/Talent), range(yd radius/cone/range),
Passive/Automatic and cooldown text. Icons remain in the actual spell catalog.
`ResourceRow::tooltip` exposes the named projection. Native client sanitation
keeps the first128 rows, escapes `|H`, `|h`, `|T`, `|t` introducers and truncates
each string at4096 UTF8 bytes. Spell visual-scale12 keeps the first128 rows,
rejects the retained list if any factor is nonfinite, and clamps factors
at0.1..10. Producer145936cf0 multiplies instance area and talent-area modifiers
by definition range for kind8, or definition radius otherwise, then global area;
radii above70 use the existing logarithmic soft cap before division by the
engine spell radius. The boolean selects kind8 attached-kit scaling. This
revalidates the existing `player_abilities::visual_scale` projection; these
values are visual-radius ratios, separate from cooldown or countdown data.

Equipment13 is filtered against the current class/zone catalog, limited to64
accepted rows cumulatively per zone, then passed through actual item decoding,
account equipment admission and loot presentation. Seen14 requires recognized
native keys and quality<=4, limits accepted rows cumulatively to400 per zone,
and updates a sorted saved key/quality map using the higher quality. The
transient Tester identity0xffffff does not retain Seen changes.
`accept_equipment_grants` and `accept_seen_grants` own these budgets; the caller
must provide current real catalog validation. The full native recognized-key
predicate and broader account persistence are not replaced by accepting
arbitrary strings.

## Validation and limits

`python3 -B scripts/check-coop-replication.py` passed:33 current byte
ranges,5 dispatch tables,35 literal ranges,21 completed retained Ghidra query
identities and both source modules' contract anchors. Syntax-only rustfmt
parsing also passed. Six codec and three state regressions are authored; none
was compiled or executed.

This scope establishes the recovered codecs, named state mapping, selected
validation and initial-message ordering. Live host/guest replication, native
engine packet completeness, all account paths, every choice producer and
original/rebuilt behavior still require their owning implementation and
separately authorized validation. Source coverage and these static checks are
not multiplayer parity proof.
