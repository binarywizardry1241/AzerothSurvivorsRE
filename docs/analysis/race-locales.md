# Race purchase, reset and hover labels

Reference: installed read-only **0.120.0**, 145,447,424 bytes, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
This is the localization dependency for **#187/#188/#189/#191**;
[verification-needed](../verification-needed.md) owns their implementation status.

The [locale manifest](evidence/0.120.0/race-locales/manifest.json) retains the
independently located fourteen-record descriptor table, each exact payload
range/hash and the actual pre-repair source receipts. The existing
`review-current-locale-catalogs.py` independently discovers the current flat JSON
payloads and seven-u64 descriptors; historical addresses or counts do not select
them. Code/autonym/order/pointer/length relationships are verified separately.

Every catalog gains the same eight keys: the Races section, Every class,
class availability template, purchase description, account ownership text,
reset description, unsaved-change confirmation and locked-race hover hint.
Three superseded perk/tabard-only descriptions are replaced. This restores
**112 translated values** across fourteen languages and removes 42 superseded
values. Every existing shared key/value is unchanged. Catalogs now contain
2,984 keys each, totaling **41,776 native values**.

`scripts/restore-race-locales.py --apply` restores only this exact
reviewed delta; without `--apply` it verifies it. It preserves repository LF
line endings while checking complete native descriptor-bounded payloads;
the native English payload uses CRLF. The source catalogs equal those native
payloads after CRLF-to-LF normalization. Pre-repair receipts remain historical.

`Localization::CATALOGS`, `catalogs::load` and `MenuCatalog::label` retain the
existing selected-language/English-fallback path. Rewards and RaceTip consume
these exact keys through their respective source owners. The existing catalog
regression expects the new equal key sets; it is authored but uncompiled/unrun.

The restoration checker and Python/Rust syntax checks pass. This verifies
source data, not translation quality, actual locale switching, external-file
overrides, glyphs, wrapping, interaction or original/rebuilt rendered parity.
No compilation, game/client/server execution or installed-file writes occurred.
