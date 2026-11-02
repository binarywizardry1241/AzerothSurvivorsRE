# Reconstruction target: 0.108.0

**Historical target:** this report covers only the 0.108.0 hash below. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own current implementation status; generic commands now select the newest installed EXE.

The installed AMD64 PE is 140,203,520 bytes, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`. The [identity manifest](target-refresh-0.108.0.json)
binds the complete EXE and all eight rehashed MPQs. Matching embedded updater
and new-version-dialog markers identify 0.108.0; a separate 0.108.0 footer
literal was not found. No installed file or save was modified or executed.
All eight MPQs match the 0.107.0 input chain; this is not content compatibility.

The [whole-file PE census](evidence/0.108.0/native-summary.json) records six sections,
346,865 declared unwind records, 631,265 relocations, 420 imports
and 724 diagnostic paths (53 custom). [Decoded ownership](evidence/0.108.0/diagnostic-ownership.json)
verifies 17,689 references across 5,933 candidate extents, including all custom paths.
The [instruction census](evidence/0.108.0/instruction-summary.json) decodes all declared
extents into 23,014,369 instructions / 93,046,030 bytes without an undecoded suffix.
5,072,864 executable bytes outside those extents and 71,824 indirect-call
leads remain unknown. Function semantics, global/data/indirect ownership,
external/platform dependencies and original/rebuilt parity remain **#41**.
See the separate [Ghidra census](native-census-0.108.0.md).

The [complete candidate review](evidence/0.108.0/discovery-leads.json) compares
every script/UI/type/ID/resource candidate class with the retained 0.107.0
inventory. No old RVA or layout is transferred. Path membership is unchanged,
but this is not an additive-update assumption. New banner API/parser/history/handler leads now reach the [connected banner extension](addon-bridge-0.108.0.md), with nine kinds and 94 bounded native cases under **#11**. Other producer/ownership and actual addon comparison remain open. Main-bar slices, XP text and player-name fitting have separate **#7/#41** ownership.
The exact [12,028-byte addon API](evidence/0.108.0/addon-api.lua) is recovered;
shipping its source does not establish connected reconstructed behavior.
All fourteen locale objects were independently found and parsed; their 2,773
English / 2,683 other-language values match current source. Native localization
selector/file/font contracts still need current-target revalidation under #17.
All eight PE resource leaves were reviewed. Encounter behavior remains #42. The [marker review](raid-markers-0.108.0.md)
now revalidates bounded 0.108.0 consumer contracts under #43; encounter event
production and original/rebuilt presentation remain open.

The package/coverage baseline is 0.108.0. Existing source and all older behavior
reports keep their actual target provenance until individually revalidated.
No 0.108.0 release notes were supplied: the readable changelog ends at 0.107.0,
and no claims are invented. Individual earlier claims retain pending recovery;
current ownership-only records certify neither implementation nor parity.
No compilation, compiling tests, game launch or original/rebuilt comparison
was performed. [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own implementation limits.
