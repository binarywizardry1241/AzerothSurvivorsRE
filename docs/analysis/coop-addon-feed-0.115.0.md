# Co-op guest addon feed — 0.115.0

`gameplay/client/coop_feed.rs` connects received co-op run/HUD state to the
existing FrameXML `CHAT_MSG_ADDON` API. The guest bridge no longer stops before
publishing these snapshots. Ordinary engine packets continue to own character
bodies, movement, action bars, cooldowns and auras.

The source adapter is bound to installed 0.115.0 SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
It reuses current canonical evidence rather than retaining another native copy:

- [Wire/HUD and validated run state](coop-replication-0.115.0.md), including
  NativeState15 and HudJson10.
- [Party simulation/HUD](coop-game-party-0.115.0.md) and its canonical
  `hud-json.asm` (`14590f0f0`), `hud-meter-json.asm` (`145983f40`), party-meter
  and revive formatting evidence.
- [Current embedded API](evidence/0.115.0/embedded-api.lua), whose addon event
  handlers define the existing scalar/list formats.
- The existing addon scalar, list, meter and publisher owners. Their historical
  evidence retains its original provenance; this adapter does not claim a new
  complete 0.115.0 audit of every historical addon producer.

The adapter waits for validated State15 and uses the existing five-polls-per-real-
second publisher, changed-byte cache and successful-new-run invalidation. Run
time, phase, level, kills, boss/guardian/cache counters and earned gold come from
the validated replica. Local position/facing and hero/zone identity use their
existing source owners. Received HUD values provide current health, shield,
experience, gold, choice costs, stored levels and enemy count. Only supported
character-stat lanes are published. Full Run Options percentages are omitted
because State15 carries derived multipliers rather than the four original inputs.

Received ability/buff rows use the existing AZSSPELLS/AZSBUFFS layouts. Damage,
healing and boss meters reuse the same meter serializer as authoritative ledgers;
party meters reuse `Party::meter_payload`. Revive/share/helper/rescue values use
the received native HUD fields and current AZSREVIVE layout. Empty received arrays
clear their respective streams; absent collections do not manufacture clears.
Messages preserve the admitted player GUID rather than the solo GUID one.
Talent-menu bindings, the custom game-menu flag and character-stat postlude are
also maintained while the guest's existing client connection owns the VM.

This is a bounded presentation adapter. Native HUD meter damage values are
already rounded; rates and shares derived from those values cannot restore
discarded fractional ledger precision. The HUD does not carry full gear/stat
lanes, proc counters, actor/debuff classifications, target snapshots, map chest/
lair rows, pets, taken-damage categories or complete talent timer periods. Those
addon streams remain unavailable from these messages. In particular, HUD timer
`left` values cannot supply AZSTIMERS' required full `wait`; wire12 is visual-radius
scaling and does not fill that gap. Complete native addon-feed parity requires
authoritative per-hero addon publication or recovery of the missing owners.

`python3 -B scripts/check-coop-addon-feed.py` verifies the selected target,
the reused native HUD/meter/party/revive byte ranges and canonical extracts, current
API schemas and source integration gates. Two new pure projection regressions and
one publisher identity/cache regression are authored but unrun. Rustfmt parsed
the changed Rust through stdin. No compilation, Rust tests, game, live co-op session
or original/rebuilt parity comparison was run.
