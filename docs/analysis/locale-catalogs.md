# Embedded locale data and restoration

## 0.143.0 payload correspondence

The [current descriptor audit](evidence/locale-catalog-review.json) binds
the 0.143.0 EXE SHA-256
`f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`.
It located all fourteen seven-u64 descriptors at preferred VA `0x147afa770`
and independently checked the full payloads. The native catalogs contain
49,322 values and the current source catalogs contain 48,664. The native English
catalog has 62 keys absent from source, and the other catalogs have 806 missing
keys in total. These differences compare the live source to the installed PE.

The current English payload includes the Hyper Mode toggle, Champion of
Naxxramas unlock description and both party denial variants. The source catalog
still names only the Crusader glow in the achievement description. Follow the
exact caller keys and fallback behavior in [#158](../CURRENT-STATE.md#gap-158),
with Hyper Mode consumers in [#325](../CURRENT-STATE.md#gap-325). The earlier
Ready Check UI also has string keys whose source translations need checking.
Runtime lookup and rendering remain separate.

## 0.119.0 payload baseline

Selected installed EXE: **0.119.0**, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
The configured EXE and Data were read in place. This bounded data review does
not execute the game or promote earlier native lookup/UI contracts.
[verification-needed](../verification-needed.md) owns permanent finding status.

The [historical descriptor review](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/70576100b062d6d2d68830e6dbbadddfaf4b007e/docs/analysis/evidence/locale-catalog-review.json) independently
locates fourteen flat UTF-8 JSON payloads and the contiguous fourteen-record
seven-u64 table `[0x1475d7350,0x1475d7660)`, raw
`[0x75d6150,0x75d6460)`. The 784-byte table hashes to
`5b81aaebf5d64dde681efdc5f5e85df5882af359e34403840c4b597d599ec313`.
Each code/autonym/pointer/length is checked against its complete current payload;
the trailing word remains an unknown u64. Exact ranges, hashes and source
receipts are retained without duplicating the fourteen payloads.

The [complete content delta](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.119.0/locale-content-delta.json) verifies
that all fourteen descriptor-bounded payloads are byte-identical to 0.118.0.
Each has 2,979 keys; together they contain 41,706 values. The retained pre-repair
source review records 41,056 values: fifty missing keys in each non-English
catalog (650 translated values) and eight superseded English description keys.
Those receipts retain the actual pre-repair source hashes.

## Connected source repair — #169

All fourteen source catalogs now equal the complete current native payload bytes,
including the final LF. This restores all 650 missing translated values and
replaces the eight obsolete English description keys without changing any shared
key's value. The fifty-key population per translated catalog covers achievement
names/descriptions, seven cosmetic IDs, one tabard ID, four companions, United
Front and the White Devilsaur switch/prose controls. The English key changes
preserve the exact target wording; achievement eligibility is separately owned
by #167/#170.

`scripts/restore-coop-locales.py --apply` independently rediscovers the
fourteen descriptors, requires their native commitments to match the retained
audit and restores only their exact payloads. Without `--apply` it checks source
equality. It never rewrites the pre-repair delta evidence or installed files.
`Localization::CATALOGS` includes these files; `catalogs::load_from` parses them
and applies external overrides. `lookup` and `menu_catalog` connect selected
translations and English fallback to the existing UI consumers. The catalog
regression now expects 2,979 keys for every language; it remains uncompiled/unrun.

The source-data checks pass:

```sh
python3 -B scripts/restore-coop-locales.py
python3 -B scripts/review-current-locale-catalogs.py --check-source
```

Both verify all 41,706 values and exact payload hashes. This is a data/source
repair, not proof that every consumer uses the right key. Rewards tabard names
and achievement unlock names have independent repairs under #171/#172. The
[current loader/parser/lookup recovery](localization-loader.md) separately
binds ten native ranges and the actual descriptor-to-map-to-lookup call path.
It confirms embedded parsing, ordered executable/save overrides and selected
then English lookup, preserving empty values. No further parser/loader source
correction was found. Its 2,459 independently decoded instructions and ten
journaled Ghidra queries pass the bounded check; unchanged payloads alone were
not used to revalidate those interfaces.

Linguistic quality, glyph/layout/rendering, filesystem overrides, compilation,
actual execution and controlled original/rebuilt parity remain unverified.

## Retained reports

[0.118.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.118.0.md) · [0.117.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.117.0.md) · [0.113.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.113.2.md) · [0.112.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.112.0.md) · [0.109.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.109.0.md)
