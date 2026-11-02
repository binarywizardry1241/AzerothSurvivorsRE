# Revive HUD mapping and addon bridge — 0.115.0

Target SHA-256:
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [manifest](evidence/0.115.0/revive-addon/manifest.json) binds six current
native owners, eight nonoverlapping [instruction excerpts](evidence/0.115.0/revive-addon/native.asm),
the ten-pair HUD table and the existing canonical
[embedded Lua](evidence/0.115.0/embedded-api.lua). The selected source change
implements the visibility mapping and addon cache/receipt contract. It does not
implement cooperative gameplay, a nonempty party producer or a party HUD renderer.
Current overall status remains in [verification-needed](../verification-needed.md).

## Native contract and source connection

Native bootstrap `0x1458494a0` substitutes the table
`[0x1470076b0,0x1470077f0)` into `HUD_CVARS_LUA`. Its tenth pair is
`revive` → `hudRevive`. Settings owner `0x1402b1ed0` registers the default
`"1"` and publishes the result at HUD visibility byte +9.
The renderer's helper `0x1401edaa0` trims Unicode whitespace before the
exact-zero comparison. The existing source `shown(value)` already preserves
that normalization. The Lua getter itself compares `GetCVar(cvar)` with `"0"`.

`gameplay/run_hud/settings.rs` now includes the tenth pair. Visibility storage
and synchronization mirrors derive their lengths from `PARTS.len()`, retaining
the extra `hudScale` mirror. Existing registration, pending-write capture,
Options observation and engine persistence paths own this CVar as they do the
other HUD keys; no alternate configuration writer is added.

The client bootstrap now installs the complete exact 0.115.0 embedded API;
the [timer integration](addon-timers-0.115.0.md) supersedes the original
baseline-plus-revive fragment composition. It preserves the shared
`AZSApiFrame`, legacy event arguments, load-before-addons order and replacement-VM
bootstrap. The current timer and empty solo party-meter paths have separate
bounded evidence in that report.

```lua
AZS_SetHudShown("revive", false)
local revive = AZS_GetRevive()
```

Visibility writes are independent of addon receipts. The getter returns the
current shared table, not a copy. `CHAT_MSG_ADDON` prefix `AZSREVIVE` replaces
that table using `AZS_Fields(arg2)` and sets `AZS_REVIVE_UPDATED = GetTime()`.
It does not dispatch an event named `AZS_REVIVE_UPDATED`. Empty payloads replace
the cache with a new empty table; optional fields remain absent.

Synthetic receipts exercise the recovered fields `down`, `share`, `by`,
`reviving` and `rshare` without creating party state. As in native Lua, numeric
zero is truthy: consumers must compare `revive.down == 1`, and the visibility
setter needs Boolean `false` to hide the part.

## Accurate solo publication and lifetime

Current producer `0x1458f5310` returns an empty string outside a party.
Dispatcher `0x145821710` assigns that string to `AZSREVIVE`. The live solo
snapshot includes that stream after `AZSBOSSDMG` and before chest publication.
The [co-op source](coop-0.115.0.md) now calls the recovered party serializer with
the actual typed party/shared-running inputs, retaining an empty result for an
absent/inactive party. The application does not yet complete remote hero/world
bootstrap, so it does not manufacture a nonempty cooperative stream.

The existing publisher retains its normal 0.2-second real-clock admission and
changed-byte suppression, corroborated by `0x145877810`. An absent cached value
already compares as empty, so a fresh solo snapshot does **not** force a packet
or timestamp: `AZS_GetRevive()` starts as `{}` and `AZS_REVIVE_UPDATED` stays nil
until an actual receipt. A prior nonempty cached payload would clear through
the same ordinary packet path; this is covered by an authored synthetic Rust
regression, not a live cooperative producer.

No new cache invalidation is attached to visibility, ReloadUI, menu exit or
solo death. New-run invalidation and idle polling retain the existing owner.
Solo terminal death, racial/talent rescues and consumable lives are not reported
as party revival, and no `{down=0}` party snapshot is fabricated for solo play.

## Validation and remaining scope

```sh
python3 -B scripts/check-revive-addon.py
```

This passed exact installed-target/native-owner/excerpt hashes, Lua byte-range
equality, all ten pointer/length mappings, exact current API installation, source wiring and shared standalone Lua
checks. The Lua checks cover legacy streams, banners and summons as well as
hidden revive receipts, getter identity, optional fields, zero truthiness,
visibility/all targeting, timestamps and empty resets. They use synthetic host
seams, not the actual client VM.

Four changed Rust modules were syntax-parsed without compilation. Two Rust
regressions are authored but **not run**: real-VM visibility/receipt/reload and
solo-empty stream cache/clear/new-run lifetime. Compilation, ECS execution,
actual CVar save/reload, addon/game interaction and original/rebuilt visual or
functional parity remain unverified. No build, compiling test, game launch,
installed save/configuration write, networking or server work ran.

`--prepare-rea` writes a portable, target-bound plan under ignored `runtime/`;
run it with `./scripts/rea query <plan.json>` when further native inspection is
needed. Original responses, journals and Ghidra databases remain ignored; the
compact manifest preserves original Evidence IDs and profile digests. Ghidra
types, calling conventions and tail-call expansions remain provisional.

Gap #11 owns the completed local API portion and remaining integration/parity;
#7 owns the broader HUD and #41 the remaining native recovery. Cooperative
simulation, real nonempty party publication and the party renderer remain
excluded under #63. This does not close those broader gaps or the combined
revive/talent-timer release claim.
