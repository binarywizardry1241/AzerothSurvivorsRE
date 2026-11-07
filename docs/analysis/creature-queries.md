# AS Creature queries

Target: installed 0.113.2, 141,932,032 bytes, SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
Permanent source finding **#64**, discovered while tracing **#41**'s missing
AS protocol producer/consumer connections (`Q41-M03-creature-query-1458646d0`).
Current status is in [verification-needed](../verification-needed.md). This is source/static
recovery; compilation, the actual cache/FrameXML and original/rebuilt parity are
unverified.

The [current lifetime correction](local-request-lifetimes.md), #70,
allows these responses without an optional Game while the local channel is active.
Disconnect drains them even if a stale mechanics instance remains.

## Recovered contract and source correction

The engine already issues `ClientCommand::CreatureQuery` for a missing creature
template, and its ordinary `CreatureName` handler fills `NameCache`, notifying
held matching units through `UNIT_NAME_UPDATE` and
`UNIT_CLASSIFICATION_CHANGED`. The local embedding previously dropped the query
in `local_client/requests.rs`. Displayed actor names/models did not populate
this metadata cache. The embedding now forwards the entry, resolves it in the
active AS session, and publishes the existing `SessionEvent::CreatureName` through
`LocalPresentationEvents`. It reuses the ordinary cache, creature-type lookup,
tooltip and Lua consumers. It does not add a parallel cache or change the engine
subsystem.

Fresh REA/Ghidra recovery of `0x1458646d0` identifies opcode `0x60`'s entry reader
and finite AS template dispatch. Only the first four little-endian payload bytes
are consumed; missing bytes are zero-filled and the trailing GUID is unused.
Queries are independent of world-ready/movement state. Hit serializer
`[0x1458d4d00,0x1458d52c4)` and miss serializer
`[0x1458d08e0,0x1458d0940)` produce opcode `0x61`. The sender
`0x145885a50` is an intercepted interface in the static harness.

| Template population | Name/subname source | Type / rank / display |
| --- | --- | --- |
| 148 ordinary enemies | `enemy.<id>` with raw enemy-name fallback; `zone.<key>.subtitle` with raw zone-subtitle fallback | Enemy offsets `+0x2c` / byte `+0x4c` / `+0x24` |
| 60 bosses | `boss.<id>.name` with raw boss-name fallback; empty subname | Boss offsets `+0x4c` / fixed `3` / `+0x44` |
| 38 special templates | Exact literal or `object.<id>.name` keys, optional `Companion` subname | Exact source table in `client/creature_queries.rs` |

Name getters `0x1458006a0`, `0x145800820`, `0x145800a10` and
`0x1457fd770` establish those lookup keys and raw fallback strings. The current
query results revalidate the existing guardian catalog's **query-related fields
only**, including boss field `raw_3c` as creature type. Their broader historical
mechanics provenance remains unchanged. Raw subtitles reuse the embedded menu
catalog. Special templates cover Experience, Totem, thirteen companions (9513
is absent), twelve named objects (9600–9611), and eleven valid empty-name
mechanical templates (9612–9622). A valid empty name is `Some("")`, distinct from
a miss. The leaf `[0x145847c70,0x145847c8c)` bounds the latter display lookup to
9601–9622 and reads the pointer table at `0x147014d60`; it lies outside the unwind
inventory and was independently seeded/decoded in Ghidra.

The native hit carries the name, three empty alternate-name strings and subname,
then seven u32 words and two bytes. Type flags, pet family, the unused word,
pet-spell list, civilian and racial-leader values are zero. Empty subname decodes
to `None`. A miss emits only `entry | 0x80000000`; the existing decoder removes
bit31, including when the requested value already has it set. Unknown templates
do not translate. The local response preserves these distinctions.

## Evidence and validation

The [compact proof](evidence/0.113.2/creature-queries.json) retains native range
hashes, REA/Ghidra Evidence IDs, all 246 hit records, source projections and result
commitments. The [selected branch transcription](evidence/0.113.2/creature-query-branches.asm)
retains only the field/publication/miss/leaf boundaries, without another complete
protocol-handler extract. Fresh Ghidra plans/raw outputs stay under ignored
`runtime/analysis/history/findings/q41-creature-query/2dca5c5bd546/`.

`python3 -B scripts/check-creature-queries.py` verifies the installed
identity, executes original instructions and compares the current source inputs:

- All 65,536 u16 entries: 246 hits and 65,290 misses; five additional u32 miss
  boundaries test the response's high-bit treatment.
- Every hit in all fourteen supplied languages: 3,444 cases. Another 246 cases
  remove all locale keys to check the native raw fallback paths.
- Eighty payload cases cover lengths 0–15 for ordinary, boss, named-object,
  empty-name and missing entries, including ignored nonzero GUID bytes.
- Parsed source definitions and live forwarding/publication guards match the
  native records. The Rust test fixture covers the same templates/languages,
  raw fallbacks, missing entries, response fields, drain order and session gates.

These are original-instruction emulation and source parsing. Allocation,
capacity growth, memcpy/memcmp, Rust key formatting and locale-map lookup are
explicit synthetic seams. The host and packet buffers are synthetic; the
sender is intercepted and no network operation occurs. The 14 supplied maps are
complete for these keys; the shared lookup's external-file/English fallback
implementation is not re-proved by this harness. The u16 sweep is exhaustive
only for that domain; five u32 samples are not an exhaustive u32 proof.

Rust syntax was parsed with the installed project-local `rustfmt`; no compiler
or application ran. Authored Rust regressions remain **unrun**. Actual event
scheduling, persistent cache refresh, localized tooltip/type/classification
presentation, gameplay and original/rebuilt parity remain open under #64.
The [template-wire bridge](template-query-wire.md) additionally preserves
current producer bytes through the existing protocol decoder, including NUL
language overrides and high-bit handling under #65. Its authored actual-decoder
regression remains unrun. Native full-image counts and every original #41 residual selector are unchanged;
this bounded repair does not establish complete protocol or semantic/alias
closure.
