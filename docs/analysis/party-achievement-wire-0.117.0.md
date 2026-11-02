# Cooperative feat replication — 0.117.0

The selected installed EXE is 145,283,072 bytes, SHA-256
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
The [curated native evidence](evidence/0.117.0/party-achievement-wire/manifest.json)
binds the current party-context extension, reader admission, state validation and
guest delivery boundary for **#157**. The actual predicate and producer mappings
belong to the party-achievement repair; this report preserves unresolved member
fields by their native representation.

The message family still contains nineteen tags. Parser
`145aabbe0..145aae27d` bounds `tag - 1` by 18, and serializer
`145aaf250..145ab0383` has nineteen entries. The new context extends **State15**;
there is no new achievement-grant tag. Existing engine packets, EventBytes9 and
account equipment/Seen messages retain their separate owners in the
[historical replication report](coop-replication-0.115.0.md).

## State15 extension

After the existing scalar record, zone and three history vectors, the current
writer appends a bool indicating an optional party context. False omits the
remaining fields. The presence byte is required even for solo state: an old
payload ending directly after its words vector is truncated for this target.

| Optional field | Wire representation | Native rule |
| --- | --- | --- |
| Current members | count:u32, then `(class:u8, word:u32, byte:u8)` | Retain at most five in native order; both bytes remain raw |
| Context word | u32 | Preserved by codec; validator clamps to the admitted run clock |
| Context flag | bool | Nonzero is true |
| Lethal events | count:u32, then events below | Validator admits current-zone boss IDs and caps by the ordinary history budget |
| Each event | two u32, byte, source-kind byte, bool, member count/rows | Source kind at least four becomes zero on read; each event retains its own party snapshot |

Native member stride is eight bytes, with `word+0`, `class+4`, raw byte `+5`.
Event stride is forty bytes, with member vector first, words `+18/+1c`, byte
`+20`, source kind `+21` and bool `+22`. The source uses `NativeFeatMember`,
`NativeFeatEvent` and `NativeCoopFeats` to preserve these finite shapes without
guessing the raw member word/byte's gameplay meaning.

The count reader `145df6fb0..145df702f` first checks the **original count** against
remaining bytes divided by the minimum element size. Only then does the caller
cap the member count to five. Member rows use a six-byte minimum; events use
twelve in the native guard, with their actual field reads still requiring at
least fifteen bytes for an event with no members. The decoder consumes only the
capped member rows and does not skip advertised excess rows. The encoder also
writes at most five members. These rules are distinct from rejecting a count
greater than five or admitting an otherwise impossible original count.

Current validator `145ae0c00..145ae1202` preserves the existing class, canonical
zone, finite-clock and scalar/history admission. When the party context exists,
it filters event word `+18` through the current zone's boss IDs, truncates the
event list to `6 + floor(clock / 300)`, and clamps the context word to the
saturating-u32 conversion of the admitted clock. It preserves the context flag,
member records, event metadata and ordering. This does not turn malformed or
absent context into a synthesized party.

## Guest and terminal boundary

Guest State15 handling at `145b1c3e2..145b1c4c3` requires an admitted role and an
active selected zone, applies the validator and retains the complete current
state. The received context therefore survives into the account/feat consumer;
it is not a separate direct save-writing packet.

End18 at `145b1c32f..145b1c3e2` conditionally tears down the synchronized client,
then clears the selected zone and cached state, rebuilds the saved hero and
returns it to the joined session. Teardown `145b1a640..145b1a850` clears the
synchronization/engine-port state, emits logout-complete `0x4d` and frontend
status. Neither this helper nor the direct End18 branch invokes the achievement
writers. This evidence does not justify inventing an extra grant or save inside
teardown; main-loop/account ordering remains with the owning repair.

EventBytes9 is independently ruled out as a new achievement message. Its current
validator permits the existing hazard, start, choices, banner, pause/resume,
down/revive and terminal presentation types. Its cache application handles
choices/resume. It supplies no new achievement type or account writer.

## Source and verification

`coop/replication.rs` now reads/writes the complete optional State15 context,
retains raw member bytes, caps member rows and normalizes the event source kind.
`coop/client_state.rs` validates its current-zone events and bounded context word.
The scalar projection continues preserving all history/context fields it does
not own. Gameplay production and achievement consumption remain separate source
connections, owned by #157's main repair.

Run `python3 -B scripts/check-party-achievement-wire.py --require-retained-queries`
to replay eight curated native spans, three dispatch tables, their complete
instruction-byte extracts, source anchors and five retained Ghidra query
receipts. Raw Ghidra imports omit the PE's external data and callees; serializer
and guest-entry pseudocode stop at indirect dispatch. The original-image tables
and independently decoded assembly establish the selected paths. These results
do not certify whole-module native completeness.

Three Rust regressions are authored for exact field order, raw-byte/bool/kind
normalization, absence/truncation, count caps and current-zone history bounds.
They remain uncompiled and unrun. Source syntax parsing and the non-compiling
evidence replay are separate checks. No build, Rust test, client/game/server
execution, real save operation or original/rebuilt parity comparison occurred.
