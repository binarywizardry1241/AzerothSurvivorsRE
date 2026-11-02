# Party Hero bootstrap and engine recipients — 0.115.0

Target: installed `AzerothSurvivors.exe`, SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [manifest](evidence/0.115.0/coop-bootstrap/manifest.json) binds native ranges,
selected canonical extracts and Ghidra evidence. The
[server lifecycle report](coop-server-party-0.115.0.md) owns admission and wire
layout; [game party](coop-game-party-0.115.0.md) owns real shared-world hero state.

## Source ownership

The binary's [coop_profile.rs](../../crates/azeroth-survivors-re/src/coop_profile.rs)
produces the actual tag4 Hero from `Save`, `Pick`, current language, option bytes
and the supplied native world identity. It also normalizes an incoming Hero,
projects its native outfit, and configures its isolated `Mechanics` template.
The template is consumed by shared-world admission; it supplies no independent
enemy, pickup or world simulation. Account parsing, appearance, talents, gear
validation/effects and companion metadata reuse their existing owners.

[server_party.rs](../../crates/azeroth-survivors-re/src/coop/server_party.rs)
contains the world identity mixer and actual engine-packet recipient classifier.
`ServerClient.world_hero` names a successfully inserted world hero. Its
`synchronized` flag is a separate completion port, called after the initial
engine stream is queued. A joined connection or decoded Hero does not establish
either completion. Runtime/session ownership is documented separately from these
pure contracts.

[bootstrap.rs](../../crates/azeroth-survivors-re/src/coop/bootstrap.rs) supplies
the exact initial engine packet constructors, action buttons and name response,
plus all twelve current zone environments. It consumes actual self/inventory
object packets from the existing engine owner.

## World identity and account projection

Initializer `145876a00` receives a u64 seed and independently derives world GUID
`server+17c0`. It XORs the low32 seed bits with seed shifts46/23 and the low32 of
`wrapping_mul(0x1e3779b97f4a7c15) >> 40`, masks23 bits, and applies the exact
`0x800000`/`0x7fff00` selection. Its result is in `[0x800000,0xffff00)`.
Saved roster GUIDs and the temporary picker GUID are separate namespaces; neither
is copied into a wire Hero or derived from its accepted connection slot.

Outgoing owner `145893fc0` calls `145816520` with the current account, Pick and
world GUID. `145816520` reads these fields rather than filling protocol lanes
with unrelated defaults:

| Wire Hero field | Native producer |
| --- | --- |
| name, class/race/sex/features | Current Pick. |
| `words_188`, `optional_words_b8` | `145832890`: selected class equipment and cosmetic row, validated against the actual account inventory. |
| `bytes_18` | Selected class talent allocation, serialized by `1458575c0`. |
| `words_170` | Purchased `rerolls`, `banish` ranks. The run adds its three base rerolls. |
| `bytes_17e` | Purchased `skip` and `opening`, as booleans. |
| `float_178_bits` | `keen` rank times the native f32 `0.05`. |
| `key_150/rank_158`, `key_160/rank_168` | Selected companions and their instinct codes. `1459c30d0` collects purchased instinct codes in descriptor order; `1458c3320` assigns them to admitted companion slots. |
| `bytes_17c` | `leash`, `paws` ranks. |
| achievement points | `1458cbba0`: earned points before reward spending. |
| `byte_1e3` | Selected class zone-unlock value, clamped1..12. |
| `bytes_30` | Current two-byte language code. |
| `bytes_1d8`, optional profile | `145893fc0` overlays actual current flag bytes and any matching cached profile. |

The companion lookup/unknown-key handling belongs to the
[replication codec](coop-replication-0.115.0.md), before this normalizer.
An absent companion is an empty wire key/rank0; it is not a fabricated pet.

## Incoming Hero normalization

`14584b690` rejects a GUID outside the world interval, class outside mask`0x5df`,
disallowed class/race pairing or empty name. `145891b70` independently excludes
the host, current active and other client world identities. It then:

- Runs the existing Pick/name/appearance normalizer through `145837af0` and
  `1458367c0`.
- Collects incoming equipment and cosmetic IDs through `1459cd680`, and uses
  this ownership set for `14582a070`/`145829af0`. Hidden cosmetic `Some(0)`,
  starter appearance restrictions and synthetic cosmetics retain their native
  branches. Cosmetic overrides do not grant stats.
- Parses talent CSV with `1459c70e0`, normalizes it with `1458576c0` against a
  fixed **51 points**, and serializes it with `1458575c0`. This admission budget
  is independent of the host's saved class XP.
- Clamps reroll/banish and leash/paws ranks to3; clamps keen to `[0,0.1]`, mapping
  NaN to0; caps points at the complete achievement catalog total and zone unlocks
  to1..12.
- Accepts only `en pl cs de pt es fr ro tr ru uk zh ja ko` in `1458e1530`.
  Unsupported language bytes become an empty override.

`coop_profile::configure` applies normalized talents and gear effects, account
choice grants, keen and companion descriptors/instincts to the real per-hero
template. `coop_profile::outfit` uses the same GearSave starter/faction/cosmetic/
two-handed precedence as local entry and returns native one-based equipment
slots for actual client descriptors. There is no saved remote class-XP lane in
tag4 from which to invent a Veteran bonus.

## Assignment and synchronization

The pending iterator `1459c8df0` calls `1458254b0` for admitted connections with
an actual stored Hero. It clones that Hero with the actual connection index;
it does not assign a world actor. The run-start owner `145883b80` converts each
Hero with `1458162b0`, then calls the
[canonical actual insertion](evidence/0.115.0/coop-game-party/remote-hero-admission.c)
at `145900890`. Only successful returned actor indices are installed in
connection records at `14588792c..145887996` as discriminant1 plus actor index.
The network slot, actor index and world GUID remain distinct.

Initial-world owner `145892220` obtains the requesting actor's packet list from
`1458e9a60`. For every other actor, `1458e8b60` returns a pair: a hero create/update
packet from `14590e290` with self=false, then the actual GUID/name/race/class/sex
response built by `1459b5590`, opcode`0x51`. The canonical
[party context extract](evidence/0.115.0/coop-game-party/party-context.asm) owns
`1458e8b60`; it is not duplicated here.

`1458ecfd0` enters that same actor's context, publishes its learned-spell
action buttons through `14597e330`, and queues the localized hero/race/class/zone join announcement
plus zone introduction text. It does not generate a choice-card JSON snapshot.
The initial owner also appends actual raid-target data through `1459ac910`,
encodes its engine opcode/body pairs as tag7, and only then sets connection
`+471` synchronized. Group metadata is refreshed afterwards.

The requesting hero's `145822670` snapshot order is login-verify-world`0x236`,
128 zero account-data-time bytes`0x209`, 32 acknowledged tutorial bytes`0xfd`,
bind point`0x155`, initial spells`0x12a`, 64 neutral faction records`0x122`,
native packed time/speed`0x42`, optional inventory object, actual self object,
empty initial world states`0x2c2`, zone weather`0x2f4`, and name response`0x51`.
The class pool keys and all105 selected spell IDs are freshly compared with the
current native tables; the existing source records agree. The separate appended
spell is the racial: `145917530` resolves race-record`+30/+38` into an ability,
stores its descriptor at stack`+450`, then copies Game from stack`+30`, placing
it at **Game+420**. All eight race keys/spell IDs agree with the current source.

`14597e330`/`1459acf50` publish a distinct action-button packet`0x129`, containing
120 u32 slots. Learned spells fill consecutive slots, and the racial occupies
slot11. Player creation`14590e290` supplies six living movement speeds: walk2.5,
the actual run multiplier times7, back4.5, swim bits`0x40971c71`, swim-back2.5,
turn bits`0x40490fdb`. Other heroes use self=false.

The source world-removal completion port clears per-connection actor ownership
and synchronization while retaining joined transport/lobby membership. It is
called on actual source run removal. The exact native host End/reset record
mutation is not independently recovered by this report.

## Recipients and controls

After simulation, `145877810` drains engine packets tagged with their originating
actor index. It calls `14584a6e0`: true delivers only to that actor; false visits
every actor, with the native locale transformer `1458d69c0` when locales differ.
`owner_only_engine_packet` reconstructs the complete fixed opcode set and the
payload-dependent chat/update-object/destroy-object cases. Ownership is not
guessed from a broad source event category. `145894fe0` delivers actor0 through
the local engine callback, and other actor indices only to their matching,
assigned and synchronized connection as tag7.

`1458ee600` uses the actual assigned actor's context for these control subtypes:

| Subtype | Behavior |
| --- | --- |
|0/1/2/3|Choose/reroll/banish/skip, retaining native phase, resource and choice gates.|
|4|No operation.|
|5|Abandon active phases1..3, clearing choices and marking the hero finished.|
|6|Spend stored levels only with pending levels, active phase and no current choice.|
|7|Set cache-on-click (`Game+c37`) from the raw argument byte.|
|8|Set store-levels (`Game+c38`) from argument bit0, offering pending levels when disabled.|
|9|Copy the raw argument to `Game+c30`, enabling guardian POI tracking.|

The first two initial flag bytes are cache-on-click and store-levels. The third
controls guardian tracking. `145981fe0` chooses the nearest current guardian;
when disabled it clears the active latch and emits a clearing gossip-POI packet
`0x224` through `1459b0190`. When enabled it publishes a localized target POI
through `1459a9a00`, suppressing an unchanged active target for300 seconds.
The exact frontend command28 producer remains a separate input contract.

## Validation and limits

`python3 -B scripts/check-coop-bootstrap.py` passed421 current-target guards for native bytes,
canonical extract hashes, primitive clamp constants, the complete privacy/control
dispatch tables, twelve zone environments, ordered class/racial spell data and source connections. Rustfmt parses the changed Rust sources
without compilation. These checks run no native instructions or game code.

Existing talent, gear and account descriptor data retain their stated historical
provenance; current normalizer recovery is not blanket revalidation of those
catalogs. The optional profile's wider metadata semantics remain separate.
Compilation, a host/guest networking session, actual loading/controls/rendering,
and original/rebuilt gameplay parity have not been tested here. Source/static
checks do not establish a playable or parity result.
