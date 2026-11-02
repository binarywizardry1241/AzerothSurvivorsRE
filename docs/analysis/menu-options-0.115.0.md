# Locale catalogs, Options descriptors and AddOns statuses — 0.115.0

Target SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This is the locale/data portion of gap #17. Overall implementation and remaining
gaps belong to [verification-needed](../verification-needed.md).

The fourteen immutable language records now reside at `0x14732e768`, with the
same native order, exact autonyms and 56-byte layout as the historical
[0.113.2 recovery](locale-catalogs-0.113.2.md). Each current embedded catalog has
**2,929 identical keys / 41,006 values**. All 2,923 retained values in every
language were unchanged; the source omitted six current browser-filter labels:
`Unlocked zones`, `No password`, `Zone: any`, `No lobby matches the filters.`,
`Zone: {zone}` and `{shown} of {all} shown`. All fourteen source payloads now match
the current EXE exactly after CRLF-to-LF normalization. Existing `CATALOGS` →
`catalogs::load` → active `Localization`/`MenuCatalog` consumers load these
entries through the ordinary lookup. The co-op labels are presentation data;
this repair adds no hosting, joining, transport, server or cooperative gameplay.

Current producer `0x1458e0210` and complete getter leaf `0x1458e1f35` use the
current index global `0x148217160`. The producer accepts exact case-sensitive
two-byte codes in native language order and stores English for every other
code/length. The getter clamps its unsigned index to thirteen and returns the
corresponding immutable record. Code/index/table targets were re-derived from
the current instructions and checked against current descriptor pointers.
The [proof](evidence/0.115.0/menu-options/proof.json), canonical
[producer](evidence/0.115.0/menu-options/index-producer.asm) and
[getter](evidence/0.115.0/menu-options/record-getter.asm) bind these bytes to the
selected target. Their leaf semantics needed no Rust behavior change.

All **105 current Options descriptors / 1,155 fields**, including the 23 direct
string-global default literals, match the connected `assets/options.json` at
current table `0x145ee9600`. The comparison includes order, key, label, page,
storage/control kind, numeric range/step, inversion, choices/values, indent,
linked write and multiplier. No missing descriptor or changed stored literal
was found. Native default registration, dispatch, file/global/binding writes,
capture and live engine callbacks retain their separately stated provenance in
[Options](options-0.105.0.md), [file/VM admission](options-vm-0.112.0.md),
[binding capture](in-run-bindings-0.112.0.md) and [AddOns](addons-page-0.105.0.md).
The current descriptor match does not certify those behavioral owners or the
entire secondary-menu surface against 0.115.0.

Current AddOns page `0x14009f470..0x14009ffcf` retains its 104-byte rows and the
existing status priority: missing dependency names, outdated while version
checking is enabled, load-on-demand, then empty. All **16 current native flag
combinations** match the existing `draw_addons`/`Addons::missing` source law;
no status/control correction was needed. The
[selected status instructions](evidence/0.115.0/menu-options/addons-status.asm)
and proof bind this bounded current behavior. The replay stops before the first
join/translation call or empty-status construction; inventory/TOC/metadata,
account writes, loader behavior and rendering remain separate contracts.

`python3 -B scripts/check-menu-options.py` verifies the selected EXE,
all language record/code/autonym/payload pointers and exact source bytes, and
the complete descriptor data. It executes **65,800 original-instruction leaf
cases**: all 65,536 two-byte codes, five invalid lengths with an unreadable text
pointer, and 259 getter indices including u64 boundaries. No native external
callee runs. Seven completed durable REA/Ghidra queries cover both complete
language leaves and the AddOns page, with
[digest-checked identities](evidence/0.115.0/menu-options/analysis.json).
Raw imports omit external memory/callees and infer a generic ABI; the original
instructions and Windows-register fixtures govern. `--write --stage` reproduces
the source payloads and compact proof
under ignored `runtime/menu-options-0.115.0/` before review/promotion.

The existing Rust catalog regression now expects the current equal key sets and
checks the six added text/template categories across languages; it was not
compiled or run. Loader/parser/override/startup/persistence and font contracts
retain their actual historical target until separately revalidated. No compiler,
application/game, native filesystem/VM operation, input/layout/font/GPU comparison or
original/rebuilt parity check ran. These remain open under their owning gaps.
