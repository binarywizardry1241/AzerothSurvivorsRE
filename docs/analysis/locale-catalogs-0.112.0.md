# Embedded locale catalogs — 0.112.0

Historical target evidence. The source payloads are now independently refreshed
under the [0.113.2 record/index proof](locale-catalogs-0.113.2.md);
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own implementation status.

Selected installed EXE SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
The [compact proof](evidence/0.112.0/locale-catalogs.json) commits the exact
56-byte descriptor table and all fourteen UTF-8 payload ranges. Each descriptor's
code, autonym, pointer and length is checked against the installed bytes before
source is compared or written. Historical locale catalogs retain their own
provenance; the new catalogs are independently bound to this target.

All fourteen source JSON catalogs now contain the native **2,842 keys** and their
exact values (**39,788 values**). This includes the current appearances and
combat-log option labels, changed Demonology wording, Trauma/Bloodlust and other
current translations. Line endings alone are normalized to LF. Source
`localization::CATALOGS` already includes every catalog and the existing loader
passes them to the active menu catalog; no duplicate translation layer is added.
The asset refresh supplies current text to existing consumers and to the
separately recovered new controls. A label does not establish the behavior it
describes: talent effects, equipment mechanics, achievement grants and companion
actors retain their own reports and gaps.

`python3 -B scripts/recover-locale-catalogs.py --contract catalog-records` independently verifies target
identity, descriptor order/autonyms, every mapped payload hash, common key
membership and exact source bytes. `--write` reproduces only these fourteen source
files. The checker never invokes a compiler, application, VM, file writer in the
native target or rendering. The historical `recover-locale-catalogs.py`
remains bound to its original target and is not a current check.

Existing Rust regression expectations now match the actual equal2,842-key sets
and the Polish Demonic Empowerment name. They were parsed without compilation;
this does not execute the source's locale-switch lifecycle.

The loader/parser, language choice, external `lang/*.json` overrides, font refresh
and UI rebuilding are separate behavior contracts; their historical
[0.109.0 recovery](localization-0.109.0.md) is not upgraded to current proof by
catalog equality. Actual locale-file loading, font shaping/wrapping, input,
compilation and original/rebuilt presentation remain unverified.
