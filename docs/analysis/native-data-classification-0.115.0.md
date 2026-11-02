# Native data, embedded leads and MPQ classification — 0.115.0

This report belongs to permanent **#41** and the exact installed target
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`
(142,111,232 bytes). Current implementation status remains in
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md); this report classifies the target's data
selectors without promoting structural observations to native semantic closure.

The [compact proof](evidence/0.115.0/data-classification/manifest.json) commits
every selected input and all regenerable row inventories. Reproduce with
`python3 -B scripts/classify-target-data.py`; `--stage` proposes updated
proof/inventories under ignored `runtime/q41-data-0.115.0/`. Installed EXE/MPQs
are read in place; no binary assets are copied into the repository. The proof
uses the current committed file-range summary's exact ledger commitment.

## Complete selected populations

| Lead | Selected rows | What the classification can establish |
| --- | ---: | --- |
| Q41-B02 | 13 ranges / 42,795,556 bytes | PE directory format roles, all observed incoming references and relocation slot/destination counts; mixed constant/mutable schemas and AS consumers remain separate questions. |
| Q41-B03 | 5 tails / 1,054 bytes | Exact zero bytes and complete retained static/encoded-reference observations; padding and dynamic unreachability are not proved. |
| Q41-B04 | 0 ranges | The file partition has no unmapped gaps/overlay/trailer; this says nothing about other byte populations. |
| Q41-B05 | 7 ranges / 1,024 bytes | PE32+ fields, 16-bit DOS refusal prefix, Rich metadata boundary and zero header slack, with current references. |
| Q41-I01 | 2,110 embedded rows and 634,018 DIR64 sites | Every literal's exact bytes, direct native/encoded references, encoded pointer/length containers, source literal candidates and relocation destination sections; names are not recovered types or IDs. |
| Q41-R01 | 9 archives and all active slots/listfile names | Archive identity, declared member/hash/block coverage and existing-source override projection; native mount/locale/resource semantics and runtime loading remain unverified. |

The 2,110 embedded rows are 922 namespace labels, 352 binding identifiers, 336
Lua/UI-registration leads, two textual-ID assignments, zero textual numeric IDs,
five save/configuration leads, 306 resource paths and 187 Lua declarations. No
candidate is silently excluded because its AS ownership is unknown.

## Data and reference boundaries

The DOS header, COFF/PE32+ headers and six section records end at file offset
`0x300`; `SizeOfHeaders` is `0x400`. The 256 remaining header bytes and all five
raw alignment tails are zero. The DOS prefix is the exact 14-byte program
`0e1fba0e00b409cd21b8014ccd21`, adjacent to the DOS refusal message. Its execution
and the Windows loader were not tested. The XOR-decoded `DanS` and observed
`Rich` marker identify a toolchain-metadata boundary; individual compiler IDs
and checksum behavior are not reconstructed.

The B02 directory intervals are import descriptors/IAT, debug, TLS, load
configuration, x64 runtime functions, PE resources and base relocations.
These format roles are platform context. The other `.rdata` and `.data` ranges
remain mixed data: incoming reference counts and literal matches do not recover
every schema, record ID, producer, mutation, lifetime or AS consumer. The proof
walks all PE resource leaves and icon-group links, retains every TLS callback
pointer and checks every encoded DIR64 value against its actual bytes. It does
not reconstruct the surrounding engine/platform subsystem.

All current Ghidra references and both declared/complement encoded-reference
inventories are scanned. Actual Ghidra body intervals annotate the observed
reference sources; they do not assign a source function name. No ranges or
unknown census bytes are removed by this classification. Computed references,
dynamic aliases and references absent from the retained analyzer profile remain
unresolved.

The complete **775,329** Ghidra reference sources without function bodies are
all `DATA` records in platform metadata; none is in an executable section:

| Source role | Records |
| --- | ---: |
| `.pdata` runtime-function fields | 701,424 |
| Standard x64 unwind prefixes | 73,458 |
| IAT slots | 425 |
| PE header fields | 17 |
| Load-configuration fields | 3 |
| Load-configuration indirection slots | 2 |

The last two slots, `0x145eb8e50` and `0x145eb8e60`, are referenced by the
load-configuration fields at offsets `+0x70` and `+0x78`. All **274,542** unique
unwind-record RVAs have their standard header, code-slot and optional
handler/chained-record prefixes checked. Those prefixes occupy **6,392,920**
distinct bytes. Language-specific exception data after them remains unknown.
These facts classify reference origins; they do not close the executable
residual, indirect-dispatch, AS schema or ownership populations.

Regex leads are often substrings of native payloads. For example, a resource
path beginning `//interface/` may have an actual `mpq:` prefix immediately
before it; Lua declarations may share one script payload. The proof retains
exact encoded pointer/u64-length UTF-8 candidates and their incoming references
separately. A reference to a containing slice is not presented as a direct
reference to every substring. Pointer/length form remains a layout observation,
not a recovered Rust type. Existing engine namespace/source literal connections
are context; AS labels and unmatched/packed leads remain actionable unknowns.

Two executable-text leads have additional native operand recovery:

- `game_binding_identifier:0`'s apparent `AZS_OPENI3` spans an immediate and the
  following opcode. The length-14 comparison at `0x1400a4d49` uses overlapping
  `AZS_OPEN`/`ENLEVELS` constants and proves the actual spelling
  `AZS_OPENLEVELS`. Its absence as one contiguous literal is not removal of the
  binding. This does not establish the whole binding's dispatch behavior.
- `save_configuration_key_lead:0` is a real `talentxp` immediate comparison,
  but its inventory category is not its semantic domain. The reached branch
  replaces runtime JSON `context["talent"]` with a queued 32-byte JSON Value,
  drops the previous Value and increments the context revision. The destination
  helper is bound by its native panic Location to
  `serde_json-1.0.150/src/value/index.rs:102:18`. Its two current callers are
  resource/change-tick adapters. The producer, complete payload schema and
  downstream talent UI/progression/source connections remain separate AS work;
  this is not recovered save serialization or a numeric XP formula. The
  subsequent [#98 source repair](talent-context-0.115.0.md) recovers the complete
  terminal XP producer/schema and connects the context to its actual panel.
  The original classification proof retains its initial query limitations.

The talentxp evidence includes five durable queries. The raw whole-owner
import omits two external switch tables, and the selected branch import ends
after its first consumer. These limitations remain explicit; no complete
whole-function recovery is claimed. Use `--prepare-talentxp` to recreate/verify
the exact raw inputs and print the serial journaled REA commands.

## Resource and source limits

The MPQ parser reads all nine supplied archive hashes, listfiles, active hash
slots and associated block records. Complete names are matched case-insensitively
using the observed MPQ hash/probe chain. All opaque slots and blocks without
active hashes remain explicit. Later-archive resolution describes the existing
`benilla-formats` source chain and does not establish native mount equivalence.
Resource leads preserve exact-name matches, byte-observed complete URIs,
basename-only candidates and absent/packed paths separately; a basename match
does not authorize guessed path normalization or invented asset behavior.

There are **29,680** active slots, **29,672** distinct names, no opaque slots
and no blocks without active hashes. All slots have locale/platform `0/0` and
flags `0x80000000`. The only repeated name is `(LISTFILE)`: the other 29,671
named assets are unique across these exact archives. The 306 resource leads
contain 92 exact member/byte-observed URI matches, 179 basename candidates and
35 leads without exact matches. Several of the last group name embedded engine
XML rather than archive members. Four complete source XML files match current
EXE payloads after explicit LF-to-CRLF normalization:
`AccountLoginRealmlist.xml`, `ContainerFrameAdapters.xml`, `ScriptLogFrame.xml`
and `SpellBookAdapters.xml`. Five other source XML files lack whole-payload
matches; no engine defect is inferred from that observation.

No source defect follows solely from these structural/literal matches. Current
AS-specific contracts selected under TIMER01, BANNER01, RAIDTARGET01 and HAZARD01
have their own recovery/implementation evidence. Generic engine implementation
remains supporting context. Co-op gameplay/network/server reconstruction is
owned separately by [#63's source report](coop-0.115.0.md). Further static work
on an unresolved data lead needs its exact schema or AS producer/consumer
question, and the retained per-row selectors provide those sites.

The separately recovered current directory selector and actual named-member
consumer identify a concrete AS adapter defect, repaired by reusing the existing
engine resolver. Its focused [Data-directory report](data-directory-0.115.0.md)
owns the native path/empty-override/directory policy, source connection and
validation. Archive identity and this broad classification alone do not
establish that contract.

No compilation, source/game launch, OS/DOS loading, rendering, audio check or
original/rebuilt comparison was performed. Data inventory/classification does
not close #41's outstanding semantics, alias/source ownership or parity.
