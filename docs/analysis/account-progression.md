# Current account achievements and reward catalog

Recovered **2026-10-19** from the supplied 0.100.1 PE, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.
The [recovery script](../../scripts/recover-account-progression.py)
regenerates the shared [catalog](../../crates/azeroth-survivors-re/assets/progression.json)
and [hash-bound evidence](evidence/account-progression/manifest.json).
Building the reconstruction does not require the EXE.

This is historical 0.100.1 achievement/grant evidence. The current shared asset's
selected-target [`no u` addition](no-u.md) supplies feat6 killing-blow
matching and adds25 points: current totals are73 records/1,520 points. The72
older records retain this report's provenance. Current status belongs to
[verification-needed](../verification-needed.md).

The current shared asset's
Rewards records, selected labels and menu now have separate
[0.105.0 ownership](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/rewards-menu-0.105.0.md), including thirteen companion looks.
The older recovery script requires its original EXE and must not be redirected
to the selected target or treated as the generator for the newer Rewards data.

## Current definitions

The actual lazy initializer `1458e9ead`, typed vtable `146d349e8` and wrapper
`145524640` identify constructor **`14551e7f0`**. Its original instructions,
together with actual gear-ID iterator `14553eda0`, construct **72 definitions
worth 1,495 points**: 24 Zones, 20 Classes, 7 Collection, 9 Feats and 12 Lifetime.
This replaces the historical 66-definition, 1,365-point source asset.

The twelve zone pairs use current catalog order. The nine `classlast:*` entries
retain the Scarab Wall/Ahn'Qiraj condition, now explicitly zone index **10**;
they do not switch to Naxxramas. Whole Armory has target **498**, from the native
iterator's actual six quality lanes, rather than the 415 ordinary gear effects.
The retained [native catalog](evidence/account-progression/catalog-native.json)
contains every generated ID, without inferring either faction's absent lane.
The legendary subset has 83 IDs across nine classes. The Codex consumer uses
**141** as its denominator, so half/all thresholds are **71/141**.

The current static reward records are 13 perks at `1469d8c20` (stride120),
20 tabards at `1469d94b8` (stride64) and 12 companion appearances at
`1469d9c68` (stride96). The current lookup/unlock owners and every table span
are retained. Their recovered names, costs, gates, descriptions and appearance
records now come from this target; this does not establish unchanged menu
geometry or input behavior. Historical UI recovery remains separately bound
in [the 0.92 report](progression-recovery.md).

## Conditions and scheduling

Evaluator `14552e100` dispatches ten native variants. The shared pure module
`account_progression.rs` implements zone-any-class, zone-all-nine, class-any-zone,
class-specific-zone, classes with51 earned talent points, owned gear count,
best class legendary fraction, seen count, seven lifetime counters and feats.
The native legendary selector compares **f32 ratios**, keeps the later class
on ties and returns an unclamped numerator/denominator. The UI caps the shown
numerator as its existing presentation did; the grant comparison uses actual
native values. Native cases include the empty0/9 result and completed9/9 set.

Before evaluating ordinary conditions, account grant `14552fae0` inserts clears
strictly before each class's highest open zone and takes the maximum of saved
lifetime runs/wins and the sum of permanent roster run/win counters. The Save
adapter implements those mutations while retaining unrelated account records,
unknown prefixes, specs and Pick. This does not fabricate a permanent roster
entry for a custom hero.

Snapshot `1454502d0` is absent if wrapper+10 is2, selected GUID+f80 is`0xffffff`,
+9c2 is nonzero or phase+9c9 iszero. The native custom GUID`0xfffffe` passes.
Constructor `1454ad570` defaults its game state to0 and phase to0. Factory
`14544f710` overwrites the +9c2 flag from exact environment variable
`WOW_ROGUE_SHOWCASE=1`; missing/other values producefalse. The
[delivery/guard proof](evidence/account-progression/delivery-guards.json)
retains the temporary-layout/copy edges. The caller owns these gates; the
reconstructed application's environment override needs its own integration. A valid snapshot contains elapsed time,
density-normalized/truncated/saturating u32 kills, guardians, caches, win,
all19 equipped words beingzero, and the native option reward multiplier being
at least the exact f32 word`0x3ffffcb9` (1.999899983406067).

Feat grant `14552f770` tests the current variant payloads:

| Kind | Actual condition |
| --- | --- |
| 0 | normalized kills >=2,500 or6,000 |
| 1 | guardians >=4 and elapsed <=480 seconds |
| 2 | win and elapsed >=1,500/1,800/2,400 seconds |
| 3 | win and all19 equipped wordszero |
| 4 | win and cacheszero |
| 5 | win and full option reward |

The native kind2 check uses the win field. An additional endless flag is not
inferred from the achievement label. The boundary at exactly480 seconds is
inclusive despite the prose saying “before8:00”.

Current account consumer `14543f4f0` evaluates newly added gear/seen state,
then active snapshot/feats before terminal processing. After terminal account,
roster, lifetime and beaten-zone mutations, the order is snapshot at
`14544144f`, feats at `145442238`, then account grants at `1454422b0`.
The application caller and its final regression status are root-owned.

## Dates and delivery

Save grant `14542e180` adds a timestamp only when a key is newly inserted and
its date flag is present. Already earned keys neither gain missing dates nor
replace previous dates. Startup `14543edf0` and reload `14544d470` call ordinary
grants with no date; they write the active save only when the returned new-key
list is nonempty. Normalization alone does not cause that startup write.

Gameplay feats call `145703e20` for Windows FILETIME and the original duration
leaf `145703dd0` subtracts epoch`0x019db1ded53e8000`, dividing by10,000,000.
Clock-before-epoch produceszero. Dates are **whole UTC Unix seconds**, serialized
as `achat|key=seconds,...`. Current date formatter `14552d690` divides by86,400
before its calendar arithmetic and localizes month abbreviations. Five native
cases include the day boundary and leap day.

Notification owner `14544f390` handles returned keys in catalog order. With a
present game it queues a `SMSG_MESSAGECHAT` packet through `14545dc90`, followed
by opcode`0x2d2` with u32 soundID888. System line `14552f600` produces:

```text
|cffffd100Achievement earned:|r |cffffff00[NAME]|r |cff9d9d9d(N points)|r
```

It separately invokes the UI callback with JSON from `14552dd50`:

```json
{"type":"achievement","key":"KEY","name":"NAME","text":"DESCRIPTION","icon":"ICON","points":10}
```

The text and points labels are localized; the key/icon remain catalog data.
`progression::achievement_notification` exposes those exact metadata fields
and the system line. Current UI dispatch `140062b50` recognizes the exact
11-byte `achievement` tag at `1400636d6`, reads only name and integer points,
localizes `Achievement earned: {name} (+{n})`, and appends a **kind0** ordinary
banner at `140064341`/`1400646f3`, stamped with the UI clock at `140064919`.
It ignores key/text/icon for presentation. Thus the same centered top27%,
24px gold, three-second fade/lifetime and loading-cover deferral recovered for
[named notifications](notifications.md) apply; there is no separate
achievement popup or extra interaction in this path. The application now routes returned keys through `RunEvent::Achievement`;
the sole client event collector queues the exact system chat, sound888 and
localized kind0 banner in order. Startup/reload and terminal/active grant
bindings are present. The central r17 pass passed50library and166application tests, including
startup/dates/terminal lifecycle cases; no original/rebuilt visual parity is
claimed. The follow-up delivery system also runs independently of choice pause: a
ready Game still drains gear/seen, while phase0 excludes snapshots/feats. The
new paused/ready regressions passed in the final r19 combined run:544tests
across29suites, including54library and172application cases.

## Validation and remaining limits

The recovery script executed the current constructor and gear iterator, then
**16 account states ×72 definitions**, full account grant/set/date insertion,
**25 snapshot/feat/date cases**, **5 UTC calendar cases** and **72 system lines**.
Its vectors are retained beside the full owner assembly and five Ghidra results.
The fixture harness supplies memory/stack, allocator/Vec capacity, byte-copy/
comparison, locale-miss, String formatting and placeholder substitution seams.
The legendary path executes its original selector/filter/iterator; only item
rarity projection is supplied from current iterator IDs, without running item
effect/name construction. Gameplay SystemTime is fixed to Unix1700000000;
the original FILETIME duration arithmetic executes. The catalog cache is seeded
from the actual constructor output. These are bounded instruction replays,
not original-application sessions or GUI parity checks.

Source regressions consume the independent native vectors for condition,
Save grant, snapshot, date and system-line behavior. This worker did **not**
run Cargo; root owns the central integration log and [verification-needed](../verification-needed.md).
The source was frozen for that pass after targeted formatting and a clean
`git diff --check`. Current Rewards source recovery/validation is owned by the
[0.105.0 report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/rewards-menu-0.105.0.md); controlled GUI comparison remains open.
Main-menu layout, complete Rewards plan validation, original/
rebuilt popup behavior, exact native frame scheduling and unimplemented showcase gameplay retain their separate verification limits.
