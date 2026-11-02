# Cooperative run selection metadata — 0.123.0

Installed target: 146,228,736 bytes, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
This is the directory/party wire and source portion of **#258–#260**.
[verification-needed](../verification-needed.md) owns the full findings, including their UI
consumers and deferred validation. The
[manifest](evidence/0.123.0/coop-selection/manifest.json) binds eleven journaled
Ghidra operations, selected original instructions, dispatch cells and field
literals. Historical protocol evidence retains its original target.

## Directory publication and receipt

Current service profile writer `145e648b0..145e64b17` writes hero, class, zone,
open flag, party classes, maximum party size, then **Heroic rank:u8**. The rank
is a suffix after the existing capacity field. `coop/service.rs::LobbyProfile`
and the binary encoder now carry it. The live directory owner derives its
profile from the selected hero/zone/rank; a changed rank participates in cached
profile equality, causing the ordinary UpdateProfile route to publish it.

Current tag20 response decoder `145e65370..145e66124` preserves its base row
vector, followed by the optional capacity vector, followed by the optional rank
vector. These are extensions after all rows. Missing rank stays unknown;
present rank, including zero, is clamped to five. `WireLobby` now preserves that
distinction as `Option<u8>`. An absent difficulty must not become an advertised
Normal run. The existing capacity fallback and clamp remain intact.

Projection `145bc2e40..145bc414c` uses the **local selected class** for both
eligibility gates. The zone must lie below that class's clamped Normal opening
count, and the requested rank must not exceed its saved Heroic ceiling for that
zone. Unknown directory rank supplies zero only to this eligibility predicate.
The projected JSON separately preserves unknown rank as `heroic:-1` and an empty
`difficulty` label. Known difficulty uses the existing localized rank-name
boundary. `opened` is the combined predicate; `lacks` is `zone`, `heroic`, or the
empty string, with the zone denial taking precedence. Service open/password
flags remain separate. `directory_wire::lobbies_message` now connects those
values to the real directory receiver and UI snapshot, using Save/locale
closures supplied by the application owner.

## Party selection and member eligibility

Current lifecycle serializer `145ccac10..145ccc0a0`, selected dispatch cell17
and branch `145ccbb20`, writes the roster row count and existing row fields,
then a sized **zone string**, then **rank:u8**. `NativeRoster` now represents
that whole snapshot. The final row boolean at native offset `0x94` is current
**eligibility**, replacing the source's historical `host` interpretation.
Host/local presentation identity is derived independently from row order and
the local hero identity by the existing JSON presentation owner.

The host seed `145c2c890..145c2cb0f` gives the first row a true eligibility flag.
Remote iterator `145caa880..145caab65` computes every other row from its actual
received Hero profile: zone index below the remote Normal opening count, and
`min(selected rank, host class's saved ceiling, 5)` no greater than the remote
zone's Heroic byte. A missing remote byte supplies zero. The resulting flag is
stored at `145caab46` and serialized with the row. The source now applies this
predicate to every remote roster row, rather than putting `false` there to
mean “guest.”

Host refresh `145c0e6fe..145c0eb57` compares roster, zone and effective rank and
publishes changed snapshots to joined recipients. `Session::publish_roster`
now caches that complete snapshot, so selection-only changes also publish.
Current guest receiver `145c2f75f` accepts tag17, keeps at most five rows,
normalizes names and zone through their existing owners, and clamps rank to
five before presentation. The source's typed receive path connects the same
metadata through `roster_snapshot` into `CoopRuntime` and `LobbyView`; each
`HeroRow` carries its received eligibility independently from class/points.
The current presentation serializer `145bfd990..145bfe598` resolves the
canonical zone to its localized display name and obtains the localized rank
label; the UI consumer applies the same existing locale boundary.

Profile reception `145c2e533..145c2e664` normalizes the submitted Hero and uses
identity guard `145c2ac80`; it does not reject a pre-run party member solely
because that member cannot enter the current selection. The previous source
did so before storing the profile, preventing the red eligibility row from
existing. That rejection was removed. The actual run-entry admission remains
separate in `gameplay/coop.rs`; a displayed row does not grant zone/Heroic
access, a world hero, or synchronization.

## Static validation and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-coop-selection.py
```

The checker verifies **11** exact query subjects/receipts, **1,273** selected
original instructions, the dispatch cells and source fragments connecting the
changed metadata. Isolated original-instruction fixtures pass **1,200** remote
eligibility cases, **9** tag17 serialization cases and **768** receiver/directory
rank cases. Memory, writer callbacks and stop markers are synthetic; these
fixtures do not execute an application or network service. Seven changed Rust
files pass stdin-only syntax parsing. Authored Rust codec/projection regressions
remain uncompiled and unrun.

Raw decompilation cannot follow switch tables outside its subject; exact
current table cells and original branch instructions establish the selected
dispatch. The large party/projection decompilations also retain Ghidra type
propagation warnings. No inferred decompiler type substitutes for the original
field accesses or a complete semantic proof of the wider server.

Compilation, client/game/server execution, actual delivery/timing, menu/party
interaction, rendered labels/colors and original/rebuilt parity remain
unverified. Broader lifecycle, admission and service capacity findings retain
their own owners; the selected metadata does not certify those systems.
