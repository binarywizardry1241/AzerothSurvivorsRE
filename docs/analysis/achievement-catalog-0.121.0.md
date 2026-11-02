# Achievement catalog and run predicates — 0.121.0

Target SHA-256: `22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md#gap-237) owns overall implementation status.
[Owned armor/Heroic account progress](achievement-progress-0.121.0.md) owns the
18 account additions; this report owns the full menu catalog and current run
and party conditions.

## Current catalog and presentation

Original constructor `145b973b0..145ba0d42` and its class-gear iterator
`145c7d050..145c7d51b` emit **124 achievements worth 2,950 points**. The
[catalog proof](evidence/0.121.0/achievement-catalog.json) binds the current target,
native ranges, journaled Ghidra result and normalized source asset. Synthetic
allocation, string/number formatting, locale lookup and token replacement are
explicit interfaces; undefined record padding and synthetic heap pointers are
not promoted as descriptor data.

`assets/achievement-catalog-0.121.0.json` preserves native order, title and
message lookup keys, icon, points, category and replacement tokens. The menu
loads those descriptors and retains previously recovered reward associations
by stable achievement key. That historical association is not independently
proved by the new descriptor constructor. Existing sidebar, category counts,
point totals, progress and reward views consume the resulting catalog.

The category domain is now Zones, Classes, Collection, Feats, Lifetime, Co-op
and Heroic. The separate [category artwork proof](evidence/0.121.0/achievement-category-icons.json)
binds all seven icons plus Summary directly to the current category button.
The [locale projection](evidence/0.121.0/achievement-localization.json) checks
202 actual native keys in all fourteen catalogs. Four numeric replacement
strings are not locale keys and retain ordinary literal fallback.

The current category artwork is independently bound by
[achievement-category-icons.json](evidence/0.121.0/achievement-category-icons.json).
AS category control `1400cb7a0` reads the category byte, increments it with u8
wrapping, and selects a relative string at `1461b1c18` and its length at
`1461b1c38`. Summary (`0xff`) selects entry zero; categories 0–6 select entries
one through seven. The six historical category icons match this table. Heroic
selects the 26-byte `INV_Misc_Head_Dragon_Black` string at `1461ad142`.
`CATEGORY_ICONS` now contains that seventh exact entry; existing loading and
sidebar consumers index the complete table. The non-compiling
`scripts/check-achievement-category-icons.py` verifies all eight
Summary/category mappings, target/code/data/query provenance and the live source
constant/loading/selection connections. No replacement artwork is inferred.

## Current run and party conditions

`145ba6470..145ba7292` evaluates catalog variants 0–14 and skips already earned
keys. [Original predicate replay](evidence/0.121.0/run-achievements.json) stops
at its actual award branch, before date acquisition, save mutation or notices.
The current `145b90f00..145b91272` party helper executes as native code too.

| Achievement | Recovered condition |
| --- | --- |
| Overtime / Never Ending | Shared post-clear boss counter reaches 3 / 6. No extra victory requirement. |
| Hazard Pay | Private boss-mark sum plus f32 `0.001` reaches 100. Duplicate-item currency is excluded. |
| Danger Money | Largest private boss-mark award plus f32 `0.001` reaches 50. |
| Unpolished | Victory, effective Heroic rank at least II, and maximum of all nineteen worn star bytes equals zero. |
| Humble Beginnings | Victory in Naxxramas, active eight-piece set encoded as tier zero plus one. |
| Matching Outfits | Victory, at least three party members, and every member has the same nonzero active-set byte. Classes may differ. |
| Raid Night | Victory, exactly five party members and the captured Heroic-III-or-higher party flag. |

The three previous full-reward achievements now use the current rank gate:
Against the Odds requires victory and rank at least III; Against All Odds adds
at least two members; The Old Gods Have No Friends requires the captured
C'Thun lethal event with at least two members and the captured rank gate, without
requiring a subsequent victory. The native checks cover these separately from
the six new solo feats and two new cooperative feats.

The snapshot interface reads zone at `+0x80`, post-clear boss counter at `+0x98`,
private boss marks sum/max at `+0x9c/+0xa0`, victory at `+0xa4`, Heroic rank at
`+0xa6`, maximum worn stars at `+0xa7` and active set at `+0xa8`. Native State15
and the local/guest summary owners retain their separately checked production
and recipient boundaries; the predicate replay does not replace those checks.
Snapshot owner `145b306b0..145b3093c` calls `145b0f490..145b0f548` for the
effective rank: the accepted local/shared snapshot's captured class and zone
select the saved admission cap, and the lower of that cap and the captured rank
reaches the predicate. Missing snapshot state returns rank zero. This is a
static producer/rank trace, separate from the predicate instruction replay.

## Checks and limits

Run these non-compiling checks from the checkout with the retained Unicorn and
Capstone libraries on `PYTHONPATH`:

```sh
python3 -B scripts/check-achievement-catalog.py
python3 -B scripts/check-run-achievements.py
python3 -B scripts/check-achievement-progress.py
python3 -B scripts/check-achievement-category-icons.py
python3 -B scripts/check-set-localization.py --owner achievements
```

The run/party check passes **772 cases / 150,381 original instruction steps**.
Account checks pass 522 cases; the catalog and category checks verify all current
records and mappings. These checks do not execute reconstructed Rust, a client,
a server or the game. Compilation, save/UI interactions, rendered layout,
network execution and original/rebuilt parity remain unverified.
