# Party healing meter and addon feed in 0.139.2

The installed PE is `installed-game/AzerothSurvivors.exe` (150,793,728 bytes,
SHA-256 `0bb6c557c5f6cfeea212761a33554f9a5647ce7b7e03b8a163b95489496e908`).
This is bounded recovery for [#75](../CURRENT-STATE.md#gap-75). The
[0.139.0 release review](release-review-0.139.0.md#work-75) retains the
original claim ownership and the [0.119.0 shared-heal report](rejuvenation-0.119.0.md)
owns the earlier recipient and aura lifecycle.

## Direct received healing

The native kind-14 consumer at `0x145eda200..0x145edaabf` reads the shared
coefficient at event `+0x20`, recipient maximum HP at `+0x5c8`, and duration
at event `+0x24`. The nonpositive-duration arm at `0x145eda43b` adds the
product to recipient HP, caps at maximum HP and subtracts prior HP. This arm
has no recipient Heroic healing multiplier. It calls `0x145eea640` with that
actual gain, spell ID and a tag-2 descriptor carrying the caster GUID. The
recorder rejects ordered nonpositive gains, resolves the spell through the
static ability table for the detailed descriptor, and updates the legacy
healing meter through the descriptor/name path ending at `0x145f84b40`.
The caller only applies the 1-HP combat-log and field-publication gate after
the meter call. The periodic batch path at `0x145ee3fa0..0x145ee3fe8` already
has an effective proportional credit per contribution, with spell and caster
GUID in a tag-1 descriptor.

`Mechanics::receive_party_healing` now records the direct effective gain in
the currently selected recipient's aggregate healing meter using the spell's
descriptor. The existing hero-state swap gives each recipient its own meter.
The received-heal contribution flows through both `AZSHEAL` and the co-op
HUD's `healing` rows. Caster/recipient GUIDs stay on the existing combat
event. Periodic contributions already reach the aggregate via the aura batch
owner and retain that path. The regression covers a capped Heroic V heal,
sub-1-HP credit without a combat-log event, zero additional credit at full
health, and exclusion of a caster's own shared event.

## Detailed feed recovery

The complete retained [meter Lua](evidence/0.139.1/meter-api.lua) is byte
identical to 50,637 bytes at file offset `0x7a466cc` in this EXE
(SHA-256 `2871135e74cc78964c4997e12d3c9360a80adfa57ca166ddde3f4d4af1295588`).
Its `AZSMREQ full` request on load and world entry drives replay through
the producer instead of trying to retain the Lua VM. The native dispatcher
at `0x145e4d742` matches the prefix and passes the suffix into
`0x145dec170` at `0x145e4e610` or `0x145e4e8c2`. That handler matches
exactly `full`, `party` and `lines`. It sets recipient-state flags
`+0xf8/+0xfa`, `+0xf8/+0xf9` and `+0xfa`, respectively. The poller
at `0x145e50b10` stages a per-recipient state at `+0x260`, clears the
ordinary-line cache on the `+0xfa` path, and hands the produced `AZSM`
strings to the addon chat owner at `0x145e59f63`.

The language wrapper `0x145eadaa0` calls the frame builder at
`0x145f7c6d0`. The frame builder compares the retained run string and
uses the full and party flags at `0x145f7cedf` and `0x145f7cef6`.
Ghidra returned procedure metadata for that body. Its raw-slice
decompilation failed with `decompile_failed` and “Unable to find unique
hash for varnode.” The direct PE instruction trace establishes these
branches independently. The effective-heal recorder also calls
`0x145df1eb0`. That owner deduplicates the 0x108-byte source descriptors
by key and coalesces 0x28-byte history contributions by row index within
the current bucket. Its expiry branch uses the `-120.0f32` literal at
`0x147354b00` before comparing the next bucket's time.

The rebuilt core Lua issues the retained `full` request on installation
and world entry. The local bridge consumes the ordinary-lines portion
from the outgoing addon command. The co-op host accepts the same request
on the admitted guest's addon-language party chat packet and clears only
that recipient's publisher cache. The next scheduled poll republishes
current zone, cache and guardian lines through their existing publishers.
The reloaded guest's locally projected legacy meter lines also replay.
The `lines` token takes the same cache path. `party` is reserved for the
detailed feed, and unknown requests leave the caches intact.

Remaining implementation depends on binding the producer's row counters,
source/actor and loadout descriptors, party joins, and encounter/history
records to their native owners. The exact Lua decoder supplies the frame
shape, and the current Rust aggregate has already combined rows by label.
It cannot reconstruct those identities or recent windows from the totals.
Keep the detailed Lua publication and replay pending until the native feed
can supply the contract.

## Evidence

| Native owner | File offset and byte SHA-256 |
| --- | --- |
| Received-heal dispatch `0x145eda200..0x145edaabf` | `0x5ed9600` `f3fcb729adce64937bc5b8f382484437e4aaf942250cc635c516e1000adc6833` |
| Effective healing recorder `0x145eea640..0x145eecd8e` | `0x5ee9a40` `12467794aa82d04c5ff1de5ef99b343409b63a9d67ba9bc59e27a174103a2d24` |
| Periodic heal batch `0x145ee37d0..0x145ee6142` | `0x5ee2bd0` `c29e4beadbaac9e8c196744c63d1786488376b47431d72964f0b64999e2b3dfe` |
| Replay request `0x145dec170..0x145dec1f1` | `0x5deb570` `00b45f2ae29300e22407388bc440c38c9b5c921de06950b1cb61f363c1b30966` |
| Addon poller `0x145e50b10..0x145e5a4b0` | `0x5e4ff10` `38345c16eced040293b80e63505d18ef7f5c2e3f68f26015469edfef9886a593` |
| Detailed frame producer `0x145f7c6d0..0x145f80d11` | `0x5f7bad0` `a21d8c993ccef081e66cb6ef7417405870de457a5864d1d8af27e938846c528c` |
| Detailed row/history recorder `0x145df1eb0..0x145df2eda` | `0x5df12b0` `6fae81f12d8001a950f60e83dadbbcd7893a7706e1af655136ecdd5c2732dffd` |

Ghidra 12.1.4 raw-slice results include received heal
`ev_8c88dbb90e4bb714660f7edaae027146f5704366dc22a693620727bbf98f5249`,
replay request `ev_c5e605b7623170f99c519b9743e46ecea006ac8607c725ef7886ec7466bd2d98`
frame producer metadata
`ev_02738026a1e500f6ce5ca28c6d00518a1052fff738209b289659eec06de9c8bb`
and detailed row/history recorder
`ev_1743b2078eed20e73badc45129ea9b995d1375dc1d57437d56776441f5996903`.
Original PE disassembly controls ABI and external data resolution.
The Rust changes parse with Rustfmt. The composed bootstrap passed the
standalone Lua check for the startup request, repeat suppression and
world-entry retry. Compilation, co-op/game execution and parity are
unverified.
