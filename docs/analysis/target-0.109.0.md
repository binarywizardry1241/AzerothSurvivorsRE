# Reconstruction target: 0.109.0

**Historical target:** this report covers 0.109.0 only. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) record the installed target and current implementation limits.

The installed AMD64 PE is 140,447,744 bytes, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`. The [identity manifest](target-refresh-0.109.0.json)
binds the whole EXE and eight independently rehashed MPQs. Updater/dialog
markers agree; a separate footer/build literal is a consumer-recovery lead.
All eight MPQs equal the 0.108.0 chain. Their unchanged bytes do not establish
compatibility with this EXE or reconstructed consumers. Installed files and
saves were neither modified nor executed.

The [whole-file PE scan](evidence/0.109.0/native-summary.json) covers six sections,
347,099 unwind extents, 631,068 relocation sites, 420 imports,
725 diagnostic paths and every script/UI/type/configuration/ID/resource
candidate category. All 53 custom paths remain present. The added shared-engine
path `crates/benilla-app/src/net.rs` has a freshly decoded diagnostic owner at
`0x140cd4ac0`; its complete behavior remains #41. The
[diagnostic pass](evidence/0.109.0/diagnostic-ownership.json) verifies 17,682
references across 5,939 candidate extents, including all custom paths.

The [discovery review](evidence/0.109.0/discovery-leads.json) compares complete
candidate sets with the retained 0.108.0 inventory. Packed-literal changes are
leads, not inferred functionality. Eight PE resource leaves have unchanged
payload hashes. The 12,028-byte addon API exactly matches its
[canonical 0.108.0 extract](evidence/0.108.0/addon-api.lua); native producers and
VM consumers are not revalidated by equal script bytes. No native code extract
or old address is silently reused.

[Fresh language data](locale-catalogs-0.109.0.md) is source-connected: fourteen
2,791-key catalogs, eighteen English additions, 108 additions per other language
and 345 changed Turkish values. The exact native descriptor table, payload and
source hashes plus 39,074 comparisons pass. Native selector/loader/parser/fonts
and complete translation presentation retain #17/#41 and earlier provenance.

The [104-row Options lead](evidence/0.109.0/option-descriptor-leads.json) at
`0x145da1810` identifies precisely the eight added settings. These current
pointer/length/field-shaped records do not revalidate their field semantics,
default registration, write dispatch, live/restart application or layout.
The [Options catalog](options-0.109.0.md) now contains all 104 current rows,
with eight added registered defaults and 105 native write-dispatch cases.
[In-run binding capture](in-run-bindings-0.109.0.md) is source-connected before
interface/gameplay readers, including release/repeat ownership and immediate
application (91 bounded native cases). [Picker name-only invalidation](picker-name-0.109.0.md)
updates retained Text/caret/fonts while structural changes still rebuild
(20 bounded native cases). Remaining callbacks, full lifecycle/engine owners
and actual input/rendered comparison stay #17/#21/#41.

All five new supplied paragraphs/bullets have individual pending ownership in
the [0.109.0 claim review](changelog-coverage-0.109.0.md). All 680 supplied claims
from 162 release sections are retained; 0.108.0 notes remain absent.
Earlier source/behavioral findings remain historical until their current
native contracts and dependencies are revalidated. Whole-system recovery and
parity are not inferred from a package version, copied data or accounting pass.

The [native census](native-census-0.109.0.md) separates complete declared-extent
linear decoding and complement byte accounting from incomplete Ghidra/global
semantics. No compilation, compiling tests, game launch, input/rendered check
or original/rebuilt comparison was performed. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation limits and permanent gap identities.
