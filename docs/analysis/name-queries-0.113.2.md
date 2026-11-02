# Local player-name query delivery — 0.113.2

Installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The current #41 lead `Q41-M03-name-query-1458646d0` establishes a distinct
missing request/response path, now tracked under permanent **#68**.
[verification-needed](../verification-needed.md) owns current status.

## Native contract and source repair

Fresh REA/Ghidra observes incoming owner `1458646d0`, name lookup `1458630e0`
and response serializer `1458d4300`. In the ordinary local flag0 context,
opcode0x50 bypasses the nonlocal lookup. It reads up to eight request bytes,
zero-filling missing bytes, and returns silently when the wrapper's retained
character at `+1390` is absent (`-1`). Otherwise it echoes the requested GUID,
without comparing it to the local player's GUID. This fallback does not require
the optional Game at wrapper+10.

The caller at `145864faa..145865010` supplies name pointer/length from
wrapper+1398/+13a0 and the three bytes at +14fd/+14fe/+14fc. Serializer
`1458d4300..1458d459c` emits opcode0x51: u64 GUID, the complete UTF-8 name and
NUL, an empty realm and NUL, then race/gender/class as three zero-extended
little-endian u32 values. Names are copied by length, including embedded NUL;
the ordinary packet decoder owns the resulting C-string interpretation.

The local request adapter previously discarded `ClientCommand::NameQuery`.
Preseeding the known local name in NameCache did not implement uncached requests.
`LocalClientRequest::NameQuery` now preserves all GUID bits. The live AS drain
uses the retained `LocalPlayerUi` before its optional-Game gate and emits the
native response through the existing packet parser/event decoder and PlayerName
consumer. Missing or inactive local character snapshots remain silent. This
adds no alternate name cache, target selection, nonlocal lookup or party logic.

Fresh inspection also distinguishes the post-cast `1458ded90` wrapper's temporary
player-context selection from target selection. The manual-cast refusal remains
the existing reason0x17; no target-change behavior is inferred from that call.

## Static evidence and limits

The [proof](evidence/0.113.2/name-queries.json) binds both native ranges, twelve
fresh Ghidra observations, the reviewed source and deterministic native results.
`python3 -B scripts/check-name-queries.py` executes **2,236 original-
instruction cases**: all 256 values in each metadata byte with/without Game,
642 name-length cases, 26 truncated/extra-byte requests, four character-presence
states and 28 complete wire fixtures covering GUID boundaries, Unicode, buffer
growth and embedded NUL. Allocation, buffer growth, memcpy and the sender are
explicit intercepted services; the nonlocal branch never executes.

Four authored Rust regressions cover request projection, exact native packet
bytes, the actual decoder and live once-only/absent-character/inactive delivery
without a Game. They are uncompiled/unrun. Five changed Rust modules syntax-parse;
the existing template and inventory checks retain their separate scopes.
The fixture's Python decoded projection is an expectation, not execution of the
Rust or native client parser. No compilation, reconstructed source/ECS/cache/VM,
application/network/game or original/rebuilt comparison ran. Actual character
snapshot lifetime, event/cache refresh, arbitrary aliases and parity remain open.

No individual supplied release claim specifically identifies this missing name
query route; no unrelated claim is promoted. Original census/queue populations
remain unchanged, and broader #41 work remains open.
