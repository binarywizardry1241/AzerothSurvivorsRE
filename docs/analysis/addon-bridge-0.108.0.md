# Addon banner publication — 0.108.0

This report owns the current banner extension under **#11**, against installed
EXE SHA-256 `dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
The real FrameXML VM now loads the exact 12,028-byte current API, including its
seventeenth `AZSBANNER` branch. The existing sixteen snapshot streams retain
their [historical producer evidence](addon-bridge-0.105.0.md); unchanged Lua
getters do not revalidate every native snapshot producer.

## Native contract

[Current byte ranges](evidence/0.108.0/addon-bridge/manifest.json) bind the sender,
wire/JSON serializers, packet helper, event constructors and ten direct publisher
calls. [Ghidra extracts](evidence/0.108.0/addon-bridge/rea.json) retain seven scoped
owners. Their immutable raw imports omit external code/data and use generic GCC
signature inference; original Win64 instructions determine arguments and fields.
Decompiler string locals and signatures alone are insufficient evidence.

Sender `1459443e0` fetch-adds the process-wide u32 at `14804f5c8`, initialized to
one, using the old value as the event ID. It appends JSON and a client packet
immediately, without snapshot polling, duplicate suppression, phase or HUD gates.
It wraps through `4294967295` to zero and does not reset per run or ReloadUI.

Formatter `1458e3300` reads text at record `+8/+10`, name at `+20/+28`, kind at
`+30/+38` and the boss byte at `+40` (offsets hexadecimal). Its compact format
is `id=…;kind=…;boss=…;name=…;text=…`. Both strings replace TAB/LF/CR with spaces;
the name additionally replaces semicolon/equals. Commas and Unicode survive.
The final text keeps semicolon/equals. Packet helper `1458bc860` sends chat6,
language `ffffffff`, the player GUID and `AZSBANNER + TAB + payload`.

| Kind | Native producer / connected source | Name and boss field |
| --- | --- | --- |
| `achievement` | Constructor `1458e3740`, live achievement event collector | Achievement name; false |
| `boss`, `finalboss` | Constructor `1458e3900`, primary-boss spawn after entrance packets/sounds | Localized boss name; true |
| `rune` | Constructor `1458e3be0`, real rune collection | Localized object name; false |
| `cache` | Inline native cache paths, existing cache purchase/hint events | Empty; false |
| `magnet` | Native forced-spawn/collection paths, existing corresponding events | Empty; false |
| `guardian` | Constructor `1458e3fd0`, actual guardian death event | Localized enemy name; true |
| `unlocked` | Constructor `1458e4170`, admitted first-victory next-zone result | Localized zone name; false |
| `bossdown` | Constructor `1458e4310`, actual primary-boss death event | Localized boss name; true |

Arrival templates are `{name} approaches!` and `{name} has come!`. The final
flag comes from the existing boss definition. Guardian, unlock and defeat
templates are respectively `{name} is slain! Its hoard and a level.`,
`{zone} is now open!` and `{name} is defeated!`. Rune object-name lookup
`145886ae0` selects `object.rune_speed`, `object.rune_berserk` and
`object.rune_restore`; the banner appends `!`, replacing the former invented
lowercase ` rune!` suffix. Selected locale values are supplied by the existing
current embedded catalogs.

## Live source and lifecycle

`gameplay/client/addon_banners.rs` supplies immediate ordinary inbound addon-chat
packets, independently of `addon_feed::Publisher` and HUD visibility. The sole
event collector renders the localized name/text and publishes each event once.
The existing notification queue shares that rendered text for its existing
toast/death paths. Boss and guardian death events now retain semantic localized
labels instead of losing their IDs before client delivery.

Primary-boss startup queues the new banner after its existing entrance events.
Terminal capture appends an unlock event behind final kill/achievement events,
using its existing first-result/unlock admission and summary latch. This keeps
serialization order and prevents terminal recapture from duplicating the event.
The live VM's ordinary chat handler dispatches `CHAT_MSG_ADDON` to the native
API frame and later registered addons.

`addon_bootstrap.rs` installs the exact current API before addon loading. Its
numeric `AZS_Parse` remains byte-identical in the current EXE; the manifest binds
that current range independently. Run-snapshot resets preserve the event
history, latest banner/timestamp and registered callbacks in the same VM.
ReloadUI initializes a fresh VM through the normal bootstrap. The exact Lua
parser keeps final text whole, timestamps with `GetTime()`, keeps twenty entries
oldest-first, deduplicates handler registrations and isolates handler errors.

## Validation and limits

These checks pass without a compiler or game process:

```sh
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/check-addon-banners.py --sha256 59106db0b2a4b552cf39532b0d38473db233b1ab5edebf885eb93b221bb8c860
# Run the shared contract suite against the recorded API input.
lua scripts/check-addon-bootstrap.lua docs/analysis/evidence/0.108.0/addon-api.lua
python3 -B scripts/check-reconstruction-coverage.py
```

The [94 bounded native cases](evidence/0.108.0/addon-bridge/native-cases.json)
execute six rune-name lookups, 36 constructor cases, 48 cleaning/field cases and
four immediate sender/packet cases, including equal messages and u32 boundaries.
All sixty source boss names/IDs/final flags also match the selected native fields.
Allocation, memcpy/free, localization/template replacement, final Rust formatting
and JSON construction are explicit host seams. Native sanitization, field
selection, constructor flags/kinds, atomic increment, queue writes and packet
assembly execute unchanged. These fixtures do not execute reconstructed Rust or
certify the omitted platform/serializer internals, allocation failure or races.

The interpreted Lua harness checks all seventeen message branches, the existing
getters/CVars, invalid banner input, history cap/order, punctuation/Unicode,
duplicate registration/removal, failing callbacks, hidden-HUD delivery and zero/
duplicate IDs. It uses stub host calls, not the real FrameXML VM. Eleven changed
Rust modules syntax-parse; real-VM lifecycle and packet regressions are authored
but **not compiled or run**.

To stage a reproducible static Ghidra plan, use
[check-addon-banners.py historical recipe](../SCRIPTS.md#historical-execution-sources), then
`python3 -B scripts/rea-batch.py runtime/addon-bridge-0.108.0/reproduce-rea/plan.json`.
Sparse-carrier gaps are zero and are not asserted to be target bytes.

**#11 remains partial.** Other native snapshot producers, polling/formatting,
complete reset/registration/teardown ownership and their dependencies still need
0.108.0 revalidation. The shared custom-banner painter retains its historical
evidence; this repair does not establish its current rendering. Compilation,
actual addon interaction, gameplay/platform behavior and original/rebuilt parity
remain unverified. No installed game file, save or configuration was modified.
