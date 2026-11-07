# Spell text and auxiliary resources

Bound to installed EXE SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
This report owns the spell-resource portion of gap #102: current base prose,
appendices, auxiliary rows and their source connections. The
[base-description report](spell-descriptions.md) owns the 113 recovered
expression trees; [replication](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/coop-replication-0.115.0.md) owns wire11 encoding
and sanitation; [overlay integration](coop-overlay.md) owns the wider
co-op presentation path.

The selected [0.127.0 shout contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/shouts-0.127.0.md) supersedes only Battle
Shout's active secondary tooltip: it now displays the strongest live received
or self contribution. This report and its evidence retain their 0.115.0 target.

## Native contract and source

`1458629b0` constructs an ordered resource record containing localized name,
primary text at `+0x18`, secondary status text at `+0x30`, four independent
optional rank/range/cast/cooldown strings, and spell ID. The
[constructor manifest](evidence/0.115.0/coop-spell-text/manifest.json),
[append contract](evidence/0.115.0/coop-spell-text/append-contract.json) and
[auxiliary owner manifest](evidence/0.115.0/coop-spell-text/auxiliary-native.json)
bind the current code, tables, literals and durable Ghidra identities.

`gameplay/native_overlay_payload.rs::description()` selects the current base
catalog for choices and spell resources. `gameplay/coop_spell_text.rs` appends
immunity-total prose, upgrades, current bonuses, matching talent names, critical
chance/damage, multicast grammar and the unlearned/racial/talent footer. It
preserves the native f32 thresholds, group order, colors, singular/plural forms,
damage/healing/absorb gates and cast-count rules. The immutable
`Mechanics::spell_text_stats()` snapshot supplies the live numeric inputs.

`mechanics/spell_display.rs` selects talent names and applicability from the
current `native-spell-talents-0.115.0.json`, independently of the historical
combat catalog. All 355 talent descriptors are checked against all 113 spells.
`1459c2b50` retains applicable selected talents once in descriptor order;
`14586b890` and `145851d00` establish the predicates. Generic global conditions
do not automatically make a talent relevant to every spell's appendix. Current
auxiliary effect inputs are also compared against the installed talent and
amulet records.

`coop_overlay.rs::spell_resources()` reproduces the native producer order:

1. Class-pool order, using the learned instance when present and an unlearned
   preview otherwise.
2. The racial row, then learned spell IDs absent from the preceding rows with
   talent mode.
3. Speed `23451` and Berserking `23505`.
4. First shield payload `18/20/31`, first rescue payload `19`, then every
   temporary-stat payload `15`.
5. Learned immunity cooldown markers `25771`, then racial marker `6788`.
6. Permanent payload `25` rows, resolved against the current class's talent
   descriptors and formatted at rank one.

The auxiliary selector `1458f72c0` reads the complete equipped-effect vector,
so dormant proc metadata is included. The producer subsequently looks up active
stacks by effect index, using one for a missing or zero entry. Shield text uses
the current nonnegative absorb amount rounded with `roundf`; stat text uses
the current 33-template table and its quantity/percentage rules. Permanent
Shadowform, Dire Bear Form and Cat Form prose comes from current descriptors;
Shadowform's rank-one substitution is **4%**. Missing metadata and a valid empty
name remain distinct. Auxiliary rows duplicate their body into both native text
fields and leave all four optionals absent.

Rank modes are learned `Rank {n}`, unlearned `Not learned`, racial `Racial`, and
talent `Talent`. Range table `14702c47c` selects modified radius for kind2;
radius-or-range for kinds3/10; raw range for kinds4..7; modified cone range for
kind8; no range for kind9; and positive radius-or-range for kind11. Area combines
instance, talent and global modifiers and applies logarithmic softening above
70 yd. Kind11 uses `Passive` and its native optional cooldown rule; other kinds
use `Automatic` and a modified cooldown floor of 0.25 sec, or 0.5 for Hellfire.

## Locale identity and live consumers

Both native resource and world-aura callers pass the same stored Game `+0x850`
metadata name to alias helper `14585c570`. Talent metadata localization occurs
before that name is stored. Accordingly, `EffectsState` captures the actor's
locale at local game entry or remote profile configuration and refreshes its
localized provenance cache whenever equipped metadata changes. The cache moves
with the existing per-hero effects state. Resource aliases and world aura
publication use that same cached actor name, including all six CombatAdapter
sites; recipient title/body translation cannot change the aura identity. Raw
combat and meter provenance is retained separately. Generated amulet names use
the [current amulet-name formatter](amulet-names.md).

Solo and the local host publish through the same `spell_resources()` function.
The host evaluates each remote hero's current state with its recipient locale,
sends changed resource vectors through wire11, and the guest publishes the
received vector. `LocalSpellDescriptions` preserves the two text fields and
optional strings independently. Its FrameXML bridge runs after the ordinary
spell feed so refreshed DBC views or a new Lua VM receive the current overrides.
It also follows the local aura feed, so newly published aura subjects can use
their text before UI input. The pre-feed resource producer reads the last
completed simulation state; ordering it after the world tick would create a
cycle through UI input and world presentation.

`replace_spell_tooltip_overrides()` replaces separate embedding maps as a whole,
including an empty resource vector. Ordinary DBC views remain intact and warm,
so removed talent/amulet rows immediately reveal their current ordinary views
on the same VM. Aura overrides merge only name/body at lookup and retain dispel
metadata; the existing wait mechanism answers pending spell and aura hovers.

The [consumer contract](evidence/0.115.0/coop-spell-text/consumer-contract.json)
establishes queue-to-local-state transfer, forward first-ID-match selection and
the primary spell-hover renderer: `14002c3f0` renders `text_18` alone, with the
header and optional labels in separate rows. Duplicate IDs therefore use the
first resource, and primary/secondary prose must not be concatenated. Native
FrameXML buff bindings pass mode bit32 to `1451c6910`: it selects nonempty
secondary text, falling back to primary when secondary is empty. The source
projects these independently recovered fields into the existing FrameXML views,
preserving ordinary aura dispel metadata.

The native raw-resource-to-FrameXML-cache write edge remains unproven. The known
hash insertion `1451c2120` has only direct caller `144f9a900`, reached through
spell/pet wrappers from the ordinary DBC publisher `140c6fc10`. Direct and
rebased cache-offset searches and bounded inlined-writer checks did not find
an AS resource bridge. Custom JSON hover and cached FrameXML consumers are
separately established; this source cache projection is an explicit adapter,
not a recovered native call path. Gap #102 retains this proof limit.

The [typed-state consumer receipt](evidence/0.115.0/coop-spell-text/state-consumer-closure.json)
also follows all 39 retained LEA/MOVDQA/MOVDQU references to the exact 0xf0-byte
local UI state TypeId: 28 initializer/run pairs, six direct access/registration
owners and the shared registrar. Its state-reference and copied-Res forwards
reach the known custom compositor or consumers of JSON, flags and different
vectors. Within that finite set, `14013d690` replaces the raw spell-text vector
at `+0x48/+0x50/+0x58` and `1402fa610` reads its rows for custom spell hover.
No recovered route assigns those raw rows to the FrameXML cache. This closes
the enumerated typed consumers, while other erased/untyped paths and native
whole-image completeness remain outside the claim.

## Live FrameXML lookup after the benilla 0.3.0 integration

The benilla integration at `56c648e8` added call-time spell and aura views.
The normal [Lua call host](../../crates/benilla-app/src/script_calls/live.rs)
lends [TooltipLive](../../crates/benilla-app/src/ui_tooltip/live.rs), whose
ordinary spell and aura answers previously returned before the embedding
lookup. For an ID with a successful ordinary builder answer, FrameXML could
therefore display ordinary prose instead of the AS resource text even though
the producer had published it. The older cache-only regression did not reach
this call path.

The [player spell lookup](../../crates/benilla-ui/src/script/tooltip_spell.rs)
now uses the embedding view before consulting the ordinary host and store.
The no-ask lookup used for the FrameXML next-rank preview checks that same
embedding view, restoring the selection made before the integration.
The [aura lookup](../../crates/benilla-ui/src/script/tooltip_aura.rs) applies
the embedding name and secondary-or-primary body over the live ordinary aura
view when available, retaining its dispel metadata. The ordinary store remains
the fallback when the host declines. Pet spell lookups keep their separate
host and cache paths. The
[regression](../../crates/benilla-ui/src/script/tests/tooltip_spell.rs) adds
live host answers and checks the player spell body, next-rank lookup, aura
body, live dispel header, pet lookup and restoration of live views after
override removal.

Source checks and Rustfmt parsing cover the changed lookup paths. The authored
Rust regression has not been compiled or run. This is a source repair against
the retained presentation contracts above. The installed 0.141.0 identity is
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The native cache-write lineage and applicability of the historical bounded
native contracts to those bytes remain unproved.

## Static validation and limits

The following non-compiling checks passed against the 0.115.0 reference:

|Check|Evidence covered|
|---|---|
|`recover-native-card-prose.py --check`|113 base descriptions, 341 scenarios, 1,814 numeric outputs; a separate shared-expression check covers 578 callsites; 68 template keys exist in all 14 locales|
|`recover-spell-tooltip-append.py`|1,808 native appendix vectors: 113 spells × four input scenarios × four modes, plus the precision-format boundary case|
|`check-spell-tooltip-append.py`|2,646 byte/source/vector integrity guards, including all 28 typed state consumer routes, locale keys, producer wiring, first-ID selection, primary spell body, secondary aura/primary fallback selectors and replacement-map lifecycle|
|`check-spell-auxiliary.py`|15 shield-rounding cases, nine selector cases, 48 aliases, 363 stat outputs, 40,115 talent/spell predicate pairs, 129 amulet display inputs and three rank-one permanent descriptions|
|`check-coop-spell-text.py`|Constructor bytes, two optional-field tables and ten exact display literals|

Run these with `python3 -B scripts/<script>`. Retained
[append vectors](evidence/0.115.0/coop-spell-text/append-fixtures.json) and
[auxiliary proof](evidence/0.115.0/coop-spell-text/auxiliary-contract.json) feed
authored Rust regressions, including foreign-locale identity refresh and distinct
text-field handling. Those Rust tests have not been compiled or run.

Bounded instruction replay uses explicit allocation, locale, string-formatting
and imported arithmetic seams; it does not execute the original application.
Compilation, application/game/network execution, rendered locale behavior and
original/rebuilt visual or gameplay parity remain unverified. The native cache
lineage limitation above is separate from the recovered producer, custom
spell-hover path and FrameXML body selector.
