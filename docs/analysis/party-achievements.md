# Cooperative achievement conditions

Selected installed EXE: 146,721,280 bytes, SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This report owns the changed conditions under **#157** and their source
connections. The [0.117.0 party-award report](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/party-achievements-0.117.0.md)
retains its shared membership, lethal-event, recipient and persistent delivery
recovery with its original target.

## Rest in Photosynthesis (#157)

The current achievement constructor `0x145b2da80..0x145b3764f` stores kind 9,
Heroic mode 2, rank 3, boss 1494, spell 740 and the five-Druid Tranquility
composition. Its current description explicitly names Heroic III. The
[evidence](evidence/party-achievements-photosynthesis.json) binds exact
original bytes, selected text and both journaled constructor/evaluator results.

The evaluator `0x145b3cd70..0x145b3de9c` first computes the effective rank as
`min(run rank, recipient account cap)`. Mode 2 then compares that rank for
**equality**, rather than using the older Heroic-III-or-higher context flag.
An absent cooperative context rejects the condition. The existing boss and
party consumer still uses the membership captured at the lethal event, rather
than requiring the recipient to own the killing blow or the later roster to
remain unchanged.

`account_progression::CooperativeCondition::Boss` now supplies a separate
optional exact-rank condition. The selected descriptor replaces the older
Photosynthesis row by stable key; the historical catalog and native evidence
remain unchanged. `progression::Catalog` applies the same descriptor to the
actual achievement page, preserving its Ancient Protector reward. The revised
English description and all fourteen translations are copied from hash-bound
current locale payloads; their exact selections are in the same evidence.

Local account delivery already caps `Mechanics::feat_snapshot` with the actual
recipient save before calling `grant_party_feats`. Live replica and pre-world
cached settlement retain that same cap and persistent grant route. The normal
new-key/date/save/notification consumers remain connected; this repair adds no
late teardown grant or packet.

The existing checker now supports:

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-run-achievements.py --photosynthesis-current
```

It passed **162 isolated original-instruction cases / 2,673 steps**, including
absent context and run/account rank combinations, and checks the changed
catalog/condition and actual local, replica and cached grant source paths.
Authored Rust regressions additionally cover ranks 0–V, lethal-party retention,
wrong boss/spell/source kind and missing Druid/talent membership. Those Rust
regressions are uncompiled and unrun. Compilation, actual multiplayer delivery,
save/UI rendering and original/rebuilt parity remain unverified.

## The Insane and Unholy Weapon (#285)

The same current constructor places `coop:insane` immediately after
Photosynthesis: The Insane, 50 points, Co-op category, icon
`Spell_Shadow_UnholyFrenzy`. Its condition is kind 15, exact Heroic mode 2/rank 5,
2400 seconds, at least three current members and zone key `naxx`.
[Current evidence](evidence/party-achievements-insane.json) binds nine
completed queries, exact descriptor/evaluator/producer/lifecycle/wire spans and
reused current validator/revive results. It does not duplicate those extracts.

The evaluator requires current run time at least 2400, effective recipient rank
exactly V, Naxxramas, at least three members and a life marker between zero and
2400 inclusive. The marker starts at zero in the Game constructor; only the
completed downed-player revival helper resets it to the shared run clock.
State export supplies -1 while phase 4 is down. Thus a player revived after
40:00 cannot gain this feat later by returning to play. Ordinary pre-down
Soulstone/extra-life rescues retain the marker. Membership is current retained
party membership, independently of class, deaths or a victory flag.

Native State15 writes the f32 marker after maximum stars/active set and before
bare/class/zone. The guest validator admits finite nonnegative values clamped
to its admitted run clock, and normalizes negative/nonfinite input to -1.
`Mechanics` now retains this field per hero, preserves it through swaps and
resets it on completed party revival. Local, live replica and cached settlement
snapshots supply it to the same capped-rank account predicate. The existing
new-key, first-earned date, immutable save and notification route then grants
`coop:insane` for each admitted recipient.

Current State receipt caches the accepted snapshot, unconditionally calls the
live feat owner `145bae320` at `145bd93c6`, and only then enters terminal checks.
That live owner evaluates the snapshot, saves newly inserted keys and queues
notifications. The guest now follows that order through a feats-only cached
snapshot consumer, including before local-world bootstrap. It does not deliver
summary totals, cooperative-history writes or acknowledge account counters.
A standing guest earns the feat at 40:00 even if a later downed packet arrives
before terminal settlement; first-earned dates and duplicate suppression remain
owned by the ordinary Save path.

Current glow gate `0x145b1f0c0` accepts enchant **1899** only for `coop:insane`.
The save parser's bit mask explicitly recognizes it alongside 1894/1900 and
retains a locked stored choice. The getter rechecks achievement admission and
falls back to Icy Chill; the setter checks admission before mutation. The
Armory shows the locked Unholy label and its native explanation, then exposes
the actual selection action after earning the feat. Its selected enchant uses
the existing preview/world publication path, including ordinary low-rank
weapons. Name, description and locked hint use all fourteen exact current
locale payloads. The menu insertion preserves the constructor order.

The maintained non-compiling checks are:

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-run-achievements.py --insane-current
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-weapon-glow.py --current-unholy
```

The survival/normalizer check passes **4,117 isolated native cases / 58,949
original steps**, including time/life/rank/member/zone boundaries and invalid
markers, with live source connections checked. The glow check passes **90
native gate cases**, using synthetic earned-key storage and a declared memcmp
seam. Rust syntax parsing is non-compiling. Authored regressions cover host and
guest marker normalization, per-hero revival, cached and nonterminal guest
delivery, the 40:00 boundary, exact Heroic rank, membership, grant/save/date
round trips, locked selection and low-rank weapon publication; they remain uncompiled and unrun.
Compilation, actual game/network/save/Armory rendering and original/rebuilt
parity remain unverified.

## Retained reports

[0.117.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/party-achievements-0.117.0.md)
