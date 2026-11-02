# Co-op choices and display metadata — 0.115.0

Target: installed `AzerothSurvivors.exe` SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The [overlay manifest](evidence/0.115.0/coop-overlay/manifest.json) binds the
current card writer, control tables, passive cooldown helpers and selected
ability identities. The [replication report](coop-replication-0.115.0.md),
[bootstrap report](coop-bootstrap-0.115.0.md) and
[party report](coop-game-party-0.115.0.md) own their separate contracts.

## Private choices

Current1459747f0 invokes1459770c0 and queues its JSON in the owning hero's
event queue. It reaches that hero's client through server-to-client wire9;
guest decisions return through wire8. This is distinct from filtered shared
hazard/banner events and from wire10 HUD snapshots.

The root fields are `type:"choices"`, `why` (`levelup`, `cache`, `guardian`),
`level`, `rerolls`, `rerollCost`, `gold`, `banishes`, `skip`, `skipGold` and
`choices`. Each card carries `title`, `name`, newline-joined string `lines`,
`text`, `icon`, `rarity`, `rarityName` and `kind` (`new`, `upgrade`, `ring`,
`trinket`, `amulet`, `gold`). Conditional fields are `rank`, `worn`,
`banish:true`, and `replaces`/`replacesText`/`replacesIcon`/`replacesRarity`/
`replacesRank` for the actual replaced amulet.

`gameplay/coop_overlay.rs` reads the real swapped host hero and reuses the
existing choice/reward text producers. It preserves per-client localization
without changing or persisting the host's language. Only assigned,
synchronized clients receive private offers. A successful regeneration's
generation counter also publishes when the resulting cards compare equal.

The guest parses this actual envelope into the existing card hierarchy and
replacement tooltip. Selection, reroll, banish, skip, stored-level opening,
cache-on-click and Store Levels inputs send their recovered wire8 subtypes;
they do not modify a guest-side progression simulation. Selection/banish/skip
retain the existing entrance gate, digits run in ascending order before R,
and pointer selection runs after the other collected pointer commands. The
old hierarchy remains during its selected-card exit; a queued next revision
gets a new entrance clock. A selection with no next revision retires the old
offer when the exit completes.

## HUD, spell text and visual radius

Wire10 publication reads `Mechanics::coop_hud` in each actual hero context at
the native0.2-second metadata cadence and sends changed values. The guest
passes the authoritative payload through `apply_replica_hud`; the party report
records which scalar and collection schemas are implemented.
Current14583cdd0 joins the HUD amulet's description lines with comma+space;
the choices/replacement writer independently uses newline.

Wire11 uses actual class-pool/racial spell IDs, localized names, existing
native description expressions and the current constructor's separate status
body and optional rank/range/cast/cooldown cells. Current14580a670 omits the
passive cooldown exactly for `redemption` and `faerie_fire`. Otherwise it uses
the ordinary interval floor, current final cooldown multiplier, the native
key floor, then division by `max(effect_multiplier,.1)`. The key floors match
the existing `passive_minimum_interval` source: Bloodrage8, Hunter's Mark/Seal
Fate2, Soulfire/Polymorph3, Lightwell6 and Call of Flame1.5 seconds.

The current rank table distinguishes learned, unlearned, racial and talent
records. Range kinds2/3/10/11 use their recovered radius branches, kind8 uses
the scaled cone, kind9 has no range and ordinary kinds use the raw range.
Radius/cone arithmetic uses the actual area modifiers and70/10 logarithmic
softcap. Passive/Automatic and the ordinary cooldown's Hellfire0.5-second
floor are read from the current constructor. Secondary status bodies include
DoT totals, root/stun, healing, shield, damage/recovery/demon bonuses, immunity
and reflected damage.

The source combat catalog retains a historical status enum. The current
native table inserted demonic empowerment at10: damage reduction is11,
immunity12 and thorns13. This display adapter translates the historical
descriptor identity locally; it does not silently change every combat enum
consumer. Full current combat-consumer revalidation retains its owning evidence
limits; the translated internal tag alone does not establish a missing mechanic.

The solo/host producer and guest's seven-string record reach `LocalSpellDescriptions`, which
seats an explicit view in the real FrameXML tooltip cache after the ordinary
spell feed. Spell icons and visuals remain the actual MPQ/DBC owners.
ReloadUI re-seats these views through the same VM lifecycle.

Wire12's retained record name `TimerRow` is misleading: current145936cf0
publishes **visual radius/base-radius ratios**, with a kind8 attached-kit flag.
Its actual source counterpart is `Mechanics::visual_spell_scales`. The guest
sanitizes these rows and feeds `LocalSpellScales`, consumed by the existing
ground and attached visual owners. These are not countdown timestamps or
cooldown interval multipliers.

## Validation and limits

`python3 -B scripts/check-coop-overlay.py` checks current executable
bytes, canonical extracts, branch tables, selected status identities and live
producer/consumer source anchors;137 guards passed. Syntax-only rustfmt parsing is separate
from compilation. No Rust/application build, compiling test, network session,
game launch or original/rebuilt comparison was run for this envelope check.

All 113 live base ability descriptions now use the [current primary/passive
expression recovery](spell-descriptions-0.115.0.md). Card layout retains its
separate provenance. The [current spell-text repair](coop-spell-text-0.115.0.md)
now separately recovers full primary bonus/talent append prose, auxiliary rows,
actor-localized aura identities and the independent primary/secondary tooltip
consumers under **#102 / [SPELLTEXT01](unknown-recovery-0.115.0.md)**. Its bounded
instruction replay and source checks establish those selected contracts.
Compilation, authored Rust tests, host/guest UI, localized tooltip and timing
comparisons remain unperformed; no playable or visual parity is certified.
