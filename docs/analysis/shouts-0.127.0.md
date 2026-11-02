# Warrior shouts and independent Judgement — 0.127.0

Bound to the selected installed EXE SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
This report owns #289's current source/static repair; the remaining compilation,
client/game/network and original/rebuilt checks belong to
[verification-needed](../verification-needed.md#gap-289). The
[manifest](evidence/0.127.0/shouts/manifest.json) binds exact native instruction
ranges, current talent producers, fourteen translations and completed shared
REA/Ghidra receipts. No build or application execution establishes this result.

## Recovered lifecycle

The current helper `0x145b760b0..0x145b7624b` retains two value/deadline pairs:
the strongest active value and one weaker future fallback. It first promotes a
still-live fallback when the active pair has expired. A stronger incoming value
replaces the active pair; an equal value extends it only with a later deadline.
A weaker cast cannot shorten or add to the strongest value. Candidates are
retained as fallback only when positive and when their deadline outlasts the
active pair; the highest value wins, then the later deadline. This is the
native four-float state, not an invented list of all previous caster effects.

The status owner `0x145c68a30` routes native status11 through that helper on
`Actor+0x110` (the source's semantic weakening tag10). At
`0x145c69188..0x145c691a8`, nominal reduction duration changes only if the
resulting active strength and deadline equal the incoming pair. Spell aura
identity remains a separate publication field. The source keeps this shared
actor-owned window across local/remote hero context switches, promotes its
fallback before ordinary/boss/ward decisions, and retires its metadata with
the actor. Conventional source/caster ownership is not substituted for the
native per-actor window.

Battle Shout uses a different representation: one player aura row per casting
hero, with self contributions using source GUID zero. The self dispatcher
`0x145c6437c..0x145c6448d` removes only its own matching row and publishes the
actual scaled status/lifetime through `0x145c05c60`. Its 56-byte shared event
contains source slot, GUID, position, spell, duration and the twelve-byte status.
The current party owner `0x145bfdac0` drains those events once, selecting active
recipients other than the originating slot within inclusive XY radius30.
`0x145c07c20` removes only rows matching both spell and source GUID, then appends
the captured status with expiry `recipient_clock + supplied_duration`. The
caster's departure does not revoke an already received timed contribution.
The existing shared-heal event route now also carries this ordinary aura arm.

The stat consumer `0x145c19060..0x145c1920e` counts each same-spell aura once.
For damage/haste statuses8/9, the strongest live value wins; equal values choose
the first live row. Rejuvenation remains independently cumulative. A weaker
Battle Shout keeps its own lifetime and becomes effective after the stronger
row expires. The damage and recovery source consumers use the same selector.

## Independent damage lanes and actual tooltip

The current Improved Demoralizing Shout definition is `0x147054e40`; its effect
at `0x1470541f0` is generic variant8 carrying statusMAX, base0.05, duration6 and
selector `demo_shout`. Judgement of the Crusader at `0x147057480` carries the
same generic status form with base0.04, duration3 and selector `consecration`.
Their retained source payloads have identical nonpointer lanes and selector
strings; these source inputs are verified independently of the changed prose.

`0x145c771da..0x145c77239` resolves the actual Demo spell ID before processing
MAX-status procs. Its matching arm at `0x145c77962` updates the strongest window
at `Actor+0x128`; the other arm writes the separate scalar/deadline at
`Actor+0x120/+0x124`. The canonical hit consumer
`0x145c326bf..0x145c3270a` adds the latter live scalar first and then Demo's live
active/fallback value. The source therefore keeps Improved Demo's shared actor
window separately from existing Judgement vulnerability, and supplies both to
ordinary, boss and ward hit consumers. One proc cannot replace the other.
The exact current Improved Demo description names **you and your allies**;
all fourteen current translations are connected while historical prose keys
remain available to historical consumers.

Battle Shout's ordinary base description still describes the caster's ability.
A separate current resource pass `0x145c0c300..0x145c0c668` selects the effective
live Battle Shout with the same strongest/first-tie rule. It updates only an
existing resource's secondary aura text to `Damage increased by {p}%.`, with
`p = ((1 + recipient_buff_bonus) * actual_aura_strength) * 100` and zero decimal
places. Its candidate deadline comparison is ordered; the stat loop retains
an unordered candidate but requires ordered future competitors. Three native
NaN deadline/clock cases preserve this distinction in source. It therefore displays a friend's effective contribution when stronger.
The source updates `ResourceRow.text_30` after ordinary/auxiliary row creation;
primary ability prose and absent resource rows retain their native behavior.
The existing per-hero resource producer carries this through the local and
remote wire11/FrameXML consumers recorded by
[the historical spell-text report](coop-spell-text-0.115.0.md).

## Source and checks

`StrongestWindow` and `effective_auras` provide the two native state models.
The callbacks, actor frame retirement, context swap and three victim adapters
connect their real lifetimes and damage consumers. `BuffActions`, `CastPort`
and its passive adapter feed the shared event route; source-keyed recipient
refresh preserves other contributions. The auxiliary tooltip and shared talent
catalog provide the actual value and selected current wording.

Run the existing non-compiling checker:

```sh
python3 -B scripts/check-player-aura-grouping.py --contract shouts --verify
```

The original-instruction replay checks **1,200 sequences / 4,800 strongest
updates**, **147 stat and tooltip cases**, **12 party producer cases**, **6
recipient refresh cases** and **24 independent damage-lane cases**: **262,544
instruction steps**. Cases cover weaker/stronger/equal ordering, deadlines,
expired contributions, fallback, two source GUIDs, recasting only one source,
unrelated spells, haste-vs-damage selection and Rejuvenation independence.
The tooltip replay stops at the external localization/formatting boundary,
then separately executes its original percentage arithmetic. Recipient replay
stops before the independent stat/publication helpers; vector spare capacity
avoids allocation. All executed instructions remain original, and writes are
restricted to synthetic scratch memory. The shared current party query is
reused from the revive-choice owner rather than duplicated.

The checker also verifies the selected current bytes, query subjects and saved
receipts when available, exact current locale values and connected source, and
syntax-parses sixteen Rust paths with rustfmt without compiling them. Authored
Rust regressions consume sampled native sequences and the actual tooltip/hit
fixtures, and exercise two live hero source contexts through the existing party
adapter, including weaker fallback and contribution survival after departure.
Those Rust tests have not been compiled or executed. Rendering, remote transport,
real client/game behavior and original/rebuilt parity remain unverified.
