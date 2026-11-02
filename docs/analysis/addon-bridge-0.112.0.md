# Addon summon snapshots and current producers — 0.112.0

Target SHA-256:
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This is gap **#11**'s current source/static recovery. The exact current Lua API,
seventeenth snapshot stream and current metadata are connected to the actual
client addon-chat route. Compilation, real addon/client lifetimes, gameplay and
original/rebuilt parity remain unverified. [verification-needed](../verification-needed.md)
owns the current gap status; this does not certify the underlying combat systems.

The [current manifest](evidence/0.112.0/addon-bridge/manifest.json) binds native
owners, Ghidra Evidence identities, byte ranges, metadata and canonical extracts.
The [historical report](addon-bridge-0.109.0.md) retains its actual target and full
prior field/source ledger. Current main producers and relevant helpers were
recovered again rather than selecting their historical addresses.

## Summon wire contract

The current 14,541-byte [embedded API](evidence/0.112.0/addon-api.lua) adds
`AZS_PETS`, `AZS_GetSummons`, `AZS_GetSummonCount` and `AZS_GetSummonGroups`.
`AZSPETS` follows `AZSBUFFS` and precedes `AZSMETER` on the ordinary snapshot poll.
It has eight comma-separated fields; rows are joined by semicolons:

| Field | Current native input |
| --- | --- |
| `id` | Low **32 bits of the creature GUID**, including the entry's low byte in the high eight bits; not the isolated creature serial. |
| `entry` | Definition `+0x20`, unsigned creature entry. |
| `key` | English definition name, ASCII lowercase, spaces changed to underscores. |
| `kind` | Definition `+0x39`: `pet`, `imp`, `felhunter`, `voidwalker`, `succubus`, `felguard`, `infernal`, `doomguard`, `pitlord`. |
| `ends` | Optional actual run-clock expiry; `-1` for a permanent summon. One decimal place. |
| `dur` | f32 expiry minus actual birth clock; `-1` when permanent. One decimal place. |
| `icon` | Explicit bare icon name, otherwise the first matching talent's icon, otherwise empty. |
| `name` | Localized English definition name with native English fallback; only commas and semicolons are replaced by spaces. |

Producer `0x1458e3ff0` and iterator `0x1459f8900` traverse every current 128-byte
combat-summon row in `Game+0xd0/+0xd8`. They do not enumerate totems or cosmetic
collectors, cap the list, filter rows, sort by GUID, or invent health/unit-token
fields. The constructor `0x14592e380` appends the real actor, retains the complete
creature GUID at row `+0x20`, and stores birth clock at `+0x6c`. Its creation
counter is shared with other creature actors. Cleanup `0x1459c4ce0` compacts
keepers forward in their original relative order; it does not swap with the
last actor. The source merges its ordinary and special actor containers by
retained allocation order before serializing `guid as u32`.

The immutable [13-row metadata asset](../../crates/azeroth-survivors-re/assets/addon-summons-0.112.0.json)
is derived from current definitions and the complete native icon fallback walk.
That walk visits nine classes in native order, three trees per class, 160-byte
talents and 64-byte effects. Tags 2/33/34 compare the definition pointer at
`effect+0x10`; tag 29 compares `effect+8`. The first matching talent supplies its
icon at `+0x50/+0x58`. Precomputing this immutable result avoids a second mutable
talent interpretation inside the addon adapter. Explicit icons win, including
the current Succubus descriptor even though no current talent references it.

The exact Lua getters retain row order, filter by key **or** kind, clamp expired
remaining time at zero, and return nil duration/remaining for permanent summons.
Groups use exact keys, retain the first occurrence's identity and order, count
permanent/temporary summons separately, and report the earliest temporary expiry.
An empty icon becomes nil in the getter. The current interpreted API harness
covers these behaviors alongside the established snapshot and banner branches.

## Established streams and lifetime

Current scalar templates retain all 129 existing fields and precisions. The
current major producers retain their established control flow and wire schemas;
reviewed changes are current struct offsets, relocated helpers/data and the
learned-spell row's 104-to-88-byte layout change. Current list admission, sort,
aura timing, meter, map and schedule helpers were recovered with their actual
current owners. The existing twelve-zone/sixty-boss API metadata is byte-field
equivalent to its historical asset. Of the 113 spell metadata rows, only the
English `soul_fire` name changes from `Soul Fire` to **`Soulfire`**; the current
asset and debuff consumer now use that name.

One current native behavior differs from the prior source: proc owner
`0x1459510e0` publishes Soulfire's **integer** points converted to f32 with maximum
five. It does not add the fractional credit bank. The live `addon_proc` projection
and its authored regression now preserve this distinction. Bloodrage, Seal Fate
and Lightwell keep their recovered priority and native clamp behavior.

The constructor initializes all seventeen payloads empty. Successful Again and
login invalidate them and selected target, preserving the poll clock. Menu drops
Game but retains cached payloads. The ordered `>=0.2` real-clock gate continues
while idle; unordered clocks do not poison it. Identical complete payloads,
including empty strings, suppress transmission. Current ReloadUI dispatch writes
only the pending client resource; it does not notify the server cache or create
a special summon reset/hydration. Fresh Lua evaluation creates fresh Lua tables;
a successful new run in the existing VM does not introduce a separate table reset.

Current packet publication, Menu teardown and snapshot owner order retain the
prior shared client path. Immediate banners use their separate sender, bypassing
the changed-snapshot cache and HUD visibility. The source adds no off-cadence
terminal packet, cached-payload reset at ReloadUI, or alternate addon consumer.

## Static checks and limits

```sh
python3 -B scripts/check-addon-summons.py
lua scripts/check-addon-bootstrap.lua
```

The current Python check passes 47 bounded native cases and verifies 59 current
Ghidra body hashes, ten canonical instruction ranges, exact Lua,
all current immutable metadata and source connections. Its
[native cases](evidence/0.112.0/addon-bridge/native-cases.json) execute unchanged
instructions for keys/icons, ASCII/SIMD key boundaries, expiry arithmetic,
creature GUID wrapping, integer Soulfire, seventeen cache slots, poll admission
and ReloadUI's pending flag. Key allocation/copy/free and cache-reset destructor
storage are explicit host seams. Native icon traversal uses actual current EXE
data. These are isolated instruction cases, not execution of the game or Rust.

`--prepare-rea` stages hash-checked raw carriers, seeds and group plans beneath
ignored `runtime/addon-bridge-0.112.0/reproduce/`; each plan can be run with
`python3 -B scripts/rea-batch.py <plan>`. Raw Ghidra imports omit external data,
unseeded callers and original ABI inference; the selected PE bytes and Windows
register/stack bindings control the recovered contracts.

The recovered addon producer/API/lifetime contracts are connected in source.
Underlying combat/talent behavior retains its separate
gap ownership. No compilation, game process, installed save/configuration change,
rendering, real addon interaction or original/rebuilt comparison was performed.
