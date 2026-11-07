# Native level-up and treasure overlays

The custom choice screen belongs to the supplied EXE's `screens/cards.rs`, not
the default Vanilla FrameXML. The new
[`native_overlays.rs`](../../crates/azeroth-survivors-re/src/gameplay/native_overlays.rs)
replaces the earlier plain-label presentation with the recovered card
hierarchy; companion modules now supply native prose, animation and supported
level-control transactions. This is a bounded implementation checkpoint; no visual or functional
parity is claimed.

The target is `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
[`manifest.json`](evidence/native-overlays-comparison/manifest.json) retains38
unchanged PE function slices analyzed through project-local REA/Ghidra, including
slice hashes and complete tool evidence. The original Win64 instructions govern
argument layout. [`data-spans.json`](evidence/native-overlays-comparison/data-spans.json)
retains the relevant original constant bytes, ranges and hashes.

| Owner | Address | Recovered responsibility |
| --- | --- | --- |
| Choice root | `1400d6fc0` | JSON choices/why/counters/skip; rebuild; opening gate; headings; full-screen backdrop |
| Choice hierarchy | `140217370` | 1280×760 canvas, title/cards/footer layout |
| Card tile | `1400c1d40` | JSON fields, rarity switch, kind/rank/slot annotations, frame/shadow |
| Card content | `140214080` | Numeric badge, rarity pill, icon/glow, name, descriptions and footer |
| Banish control | `1400c1500` | Per-card eligibility, disabled presentation and count |
| Footer style | `1400c7a20` | Native button border and two-stop gradient |
| Divider | `1400c7f20` | One-pixel horizontal gradient, transparent ends |
| Numeric emphasis | `1400c7270` | Signed decimal/percentage emphasis in description text |
| Card tooltip text | `1400c0790` | Replacement tooltip fragments and WoW color escapes |
| Localized fragment | `1400c6cf0` | Shared translated fragment construction |
| Icon lookup | `1400c7c50` | Lowercase icon-key normalization and image lookup |

`cards.rs` panic descriptors bind its root at lines171/215; other descriptors
bind the rich-text/tooltip functions at lines494/503 and997–1011. Matching
`hud.rs`, `hudparts.rs` and `rewards.rs` path strings establish separate modules,
but their generic existence does not recover a choice screen. In particular,
the in-run guardian/cache cards are rendered by this shared cards owner;
account `rewards.rs` is not used as a substitute treasure presentation.

## Implemented static presentation

The root is absolute100%×100%, blocks pointer input beneath it and uses
`GlobalZIndex(6000)`. Its radial backdrop is centered at x0/y−5%, with a warm
(.16,.08,.02,.55) center and black(.88) at70%. The choice canvas is1280×760,
maximum scale1.35. The centered column has18px gaps; cards have26px gaps and
stretch alignment; each card/banish column has10px gaps; the footer has20px gaps.

The reason-specific strings and header colors are retained:

| Reason | Header | Title | Subtitle |
| --- | --- | --- | --- |
| levelup | `LEVEL {n}`; gold | `Level Up!` | `Choose a spell. Its rarity decides how strong it is.` |
| guardian | `GUARDIAN SLAIN`; (.64,.21,.93) | `Its Hoard!` | `Its lair yields jewelry. Choose one.` |
| cache | `BATTLEGROUND CACHE`; (.44,.83,1) | `Treasure!` | `Choose a ring, a trinket or an amulet.` |

The header/title/subtitle font sizes are13/60/16. Cards are252px wide,
minimum388px high, with2px borders and14px corners. Their native three-stop
background gradient uses angle bits`403e2e93`, stops0/55/100%, a rarity-specific
first stop and fixed dark later stops. The card shadow is black alpha.75,
x0/y18/spread0/blur40. The top-left choice-number circle is26px at(10,9);
the rarity pill is top10/right9 with7×2px padding. The icon stage is108px
with40px top margin, a150px radial glow alpha.42, an84px image with2px
border/10px corners and a rarity-colored shadow alpha.55/spread1/blur18.
The name uses21px, annotations11/13px, description14px and bottom note12px.
A70%-width fading divider has9px vertical margins.

The five native palettes come from the switch table`14590002c`; these are not
assumed conventional item colors. Rank **presence** selects the jewelry
upgrade annotation. A missing rank is not equivalent to a present rank0.
The new `Card` model retains this distinction with `Option<u64>`. Native
new-spell and jewelry occupied counts are capped at6 and2 respectively.
`Card::from_payload` reads the current native string/numeric/bool fields and
accepts an owning icon resolver. The renderer never generates items or spends
currency.

## Action interface and proof boundaries

The renderer emits typed `Select(index)`, `Banish(index)`, `Reroll` and `Skip`
components with an explicit `Enabled` flag. Its parent owns transaction and
session handling. The native root suppresses opening actions for.32 seconds.
Banish controls are per card; they appear when any card has the native `banish`
flag and enable only for an eligible card with remaining banishes. Skip appears
only when the native `skip` flag provides its gold amount. Reroll also checks
its native availability flag and either a remaining free count or gold covering
the displayed cost. The footer presents labels and counts/prices as separate
text nodes. Default absent native counters remain zero and missing cost is
`u64::MAX`; callers must supply actual run/account state rather than fabricate
counter values.

These are still incomplete:

- Selected-card exit, exact dynamic shadow/color interpolation and ray
  presentation. Entrance/hover transforms, Breathe and the legendary Rim are
  implemented below.
- The replacement item hover tooltip, including its worn-item image, comparison
  and colored WoW text. Its owner is retained, but it is not implemented here.
- Complete run/account stat/talent inputs for every description branch.
- Native cache/guardian reward payload expansion and delivery. The supported
  level-control companion does not complete the amulet/category pipeline.
- Full original/rebuilt interaction, localization/font and screenshot comparison.

The root agent owns the runtime adapter wiring and validation status. This
subtask did not compile, run tests, launch the original EXE or launch the rebuilt
application. The static recovery helper was executed and verified every retained
slice against the selected EXE hash. Runtime integration and any later build
results must be recorded separately.

Reproduce focused collection with:

```sh
python3 scripts/recover-native-overlays.py --prepare
python3 scripts/rea-batch.py runtime/analysis/history/native-recovery/native-overlays/09f281cf4862/plan-1400c1d40.json
python3 scripts/recover-native-overlays.py --collect
```

The helper keeps raw slices/provider working data under ignored`runtime/` and
retains only curated textual evidence under this report's evidence directory.

## Later source correction: dynamic payloads and native transactions

The source now also includes
[`native_overlay_payload.rs`](../../crates/azeroth-survivors-re/src/gameplay/native_overlay_payload.rs)
and [`choice_controls.rs`](../../crates/azeroth-survivors-re/src/gameplay/mechanics/choice_controls.rs).
The payload converter fills current `RunChoice` spell bodies and upgrade lines
from current-target owners, without drawing randomness or mutating an instance.
This extends the static layout checkpoint above. The root agent
owns integration/build/runtime claims; the author of these companions ran no
compiler, test executable or original/rebuilt game process.

| Additional owner | Address | Recovered responsibility |
| --- | --- | --- |
| Ordinary spell prose | `145476fe0` | Kind-specific native translated fragments and numeric formulas |
| Class passive prose | `1454d7be0` | Passive-specific current fragments/formulas |
| Upgrade description | `1455187c0` | Power/cooldown/targets/area/duration lines; Redemption special case |
| Number formatting | `14547ccf0` | One decimal below native9.95 threshold, otherwise zero; remove trailing`.0` |
| Animation | `1400d8f40` | Entrance/hover transforms, Breathe, Rim and Rays updates |
| Ray image | `1400da210` | Deterministic1024×1024 white texture with angular alpha |
| Action slots | `1454e3d30` | Learned index→same zero-based bar slot; racial→slot11 |
| Action packet | `145441c20` | Zeroed120×u32 slots, direct spell IDs, opcode`0x129` |
| Run constructor | `14549bb90` | Three base free rerolls plus profile`+e8`; paid count0 |
| Choice input dispatcher | `1454de2b0` | Reroll action9; skip action10; ordinary choose dispatch |
| Reroll transaction | `1454e7820` | Free charge or growing gold price, then regenerate |
| Banish key / transaction | `1454da3d0` / `1454e3f50` | Eligibility/key extraction, charge/exclusion, then regenerate |
| Choice footer payload | `1454dc9c0` | Remaining charges, price, gold, banish eligibility and skip display |
| Choice completion | `1454dbbc0` | Pending reason counts, nearby XP sweep and run resume |

The retained manifest now has38 completed focused function slices, including
the original eleven presentation owners. Additional prepared but unanalyzed
slices do not count as recovered evidence.

The generated
[`native-spell-descriptions-0.97.2.json`](../../crates/azeroth-survivors-re/assets/native-spell-descriptions-0.97.2.json)
contains112 definition expressions and29 additional plural branches. All67
translation keys used by these expressions exist in all13 embedded locale
catalogs. The native radius formatter softens values above70 as
`70 + 10*ln1p((radius-70)/10)`; it is a separate branch rather than a conventional
range tooltip approximation. Source expressions retain the original f32
operation order. Healing/absorb power-upgrade descriptions retain the native
square-root transform, and Redemption retains its before/after burst-chance
calculation.

[`prose-fixtures.json`](evidence/native-overlays-comparison/prose-fixtures.json)
records baseline and modified **emulated formatter** outputs, symbolic
expressions and callsite addresses.573 shared numeric outputs matched exactly
as f32 when the baseline expressions were evaluated with the independently
executed modified scenario's inputs; zero mismatches. This is a bounded native
instruction check, not an original application observation or screenshot test.
The helper admits only the current native formatter/math ranges, substitutes
reviewed allocation/String boundaries and the named roundf/ceilf/log1pf imports,
and fails closed on unknown calls. Extreme integers and non-finite values are
outside these fixtures. Global target/DoT repeat/area/heal/absorb stat producers
are not thereby recovered; the source exposes supported bonus inputs and the
runtime adapter must supply its actual composed stats.

Inspect the archived source/evidence collection recipe:

```sh
# Inspect the exact historical recovery source; native evidence keeps its original target.
python3 -B scripts/script_sources.py --show scripts/recover-native-card-prose.py --sha256 d49ecd70617c4aa69405b8b980dfbcfd94013981fa1827677ab583118e12463f
```

The implemented transform subset uses a per-card delay`index*.11+.08`,
entrance duration`.55`, and for clamped progress`t>0` the native overshoot
`1.4*(t-1)^2 + 2.4*(t-1)^3 + 1`. Hover approaches its target with
`min(delta*14,1)`, adds3.5% scale and moves y−10. The glow's shared-time scale
is`1 + sin(elapsed*2.6)*.06`. Only rarity4 attaches the native five-color gold
conic rim, rotated by`elapsed*2.1`. Root replacement at the input gate must not
restart this animation. Selected-card exit, dynamic shadow/color interpolation,
ray presentation and replacement tooltip remain incomplete here. The native
ray pixel constructor is retained as`ray_pixels()` without inventing its GPU
format/display node; cross-platform atan2f/fmodf bit identity is unverified.

The level-control companion uses the same run RNG and candidate generator.
It starts with three native base free rerolls. After those, the price is
`100*3^paid_count`, saturated to`u32::MAX`; insufficient gold rejects the action.
A paid reroll subtracts that amount and wraps the paid counter. Banish spends
one charge, appends the native key, then regenerates without spending a reroll.
New-spell keys are the spell key; upgrade keys are`rank:` followed by the spell
key, suppressing upgrades while retaining the learned spell. Native JSON adds
`banish:true` only when a charge remains and the card has an eligible key.
Gold cards have no banish key. Skip requires its actual perk flag; displayed
gold is`max(level>>2,10)`, while the transaction awards
`roundf(displayed*gold_multiplier)` to both current and earned gold with wrapping
addition. Native profile/account producers of extra rerolls, banishes and skip
remain separate; the companion does not fabricate those grants.

The existing level completion seam is reused after skip. The native shared
completion additionally sweeps nearby XP and publishes a short resume aura;
those effects are not implemented by this companion. The current cache guard
continues to preserve the cache and gold while the full category/amulet
expansion, effect recomputation and reward delivery remain incomplete. Recovering
spell presentation and footer transactions does not make a treasure payload
complete. The earlier [loot report](treasure-loot.md) owns those boundaries.

The action publication is now independently bound to this target. Learned rows
at Game`+298`, stride`0x58`, supply definition`+40` spell IDs in slots0 onward.
The racial definition at Game`+378` supplies slot`0xb` (Lua button12).
`145441c20` clears all120 packed words before writing the given pairs and emits
`SMSG_ACTION_BUTTONS` (`0x129`), with spell kind0. The learn choice first emits
`SMSG_LEARNED_SPELL` (`0x12b`), then republishes the full bar. This does not imply
any recovered manual-cast policy or account action-layout persistence.

The fallback gold card is separately bound to`1454df345`/`1454e008c`: title
`A Pouch of Gold`, body`+{g} gold`, icon`INV_Misc_Coin_02`. The converter uses
these native locale keys and an explicit`native_gold_choice` art handle; its
amount is the raw offer value, with awarding multipliers applied by the native
transaction owner rather than presentation.

## Client descriptor and racial bindings

[`client-descriptors.json`](evidence/native-overlays-comparison/client-descriptors.json)
retains the original bounded instruction ranges and hashes. Player field owner
`145491140` sets normal rest state2 in descriptor194's high byte while retaining
the actual facial-hair low byte. Its race faction table is Human1, Orc2,
Dwarf3, Night Elf4, Undead5, Tauren6, Gnome115 and Troll116. The current XP and
next-level fields are716/717. There is no explicit rest-XP-pool1175 or sheath
descriptor143 write in this owner; omitted fields must follow the actual fresh
client-object initialization, rather than a fabricated packet write.

The ordinary creature creator `1454c0820` writes faction14, bytes0=`0x100`,
unit flags0, and base/offhand attack times2000. Its level is
`min(wrapping_u32(run_level + 3*definition_flag4c),63)`. The ordinary spawn
callsite passes definition`+4c` unchanged. These bindings are scoped to that
creator; boss/guardian descriptors need their actual caller/owner bindings.

The run-entry source asset now includes each race's verified racial key and
faction. Its racial action uses zero-based slot11 (Lua button12):

| Race | Ability | Spell ID | Stored base cooldown |
| --- | --- | --- | --- |
| Human | Perception |20600|30|
| Orc | Blood Fury |23234|40|
| Dwarf | Stoneform |20594|45|
| Night Elf | Shadowmeld |20580|75|
| Undead | Will of the Forsaken |7744|60|
| Tauren | War Stomp |20549|15|
| Gnome | Escape Artist |20589|20|
| Troll | Berserking |26635|35|

The separate racial record starts at rank1 with remaining cooldown`.5`, neutral
multipliers and zero upgrade counts. GameTick`14549ed8b` visits it immediately
after the ordinary learned auto-cast loop and before the later passive,
pending-hit, ground and totem owners. It subtracts delta, casts when
`0 >= remaining`, retries failures after`.5`, and on success stores
`max(.25, (((base_cooldown*1.4)*cooldown_multiplier)*talent_cooldown_multiplier)*global_cooldown)`.
It has no ordinary kind11 special case and does not execute the ordinary
successful-cast proc path. The stored cooldown column above is therefore not
the final interval. The mechanics adapter owns wiring this separate step.

## Amulet catalogue and numeric compositor checkpoint

[`recover-native-amulets.py`](../../scripts/recover-native-amulets.py)
hash-checks the selected EXE and recovers all112 definition-specific legendary
amulet constructor outputs plus17 shared definitions. The shared80-byte records
are at`14671f7b0..14671fd00`. The generated constructor is`145414300`.
Its bounded Unicorn execution admits the original constructor and numeric
spell-modifier evaluator ranges only, substituting reviewed Vec reserve,
allocation, locale-miss, String-formatting, memcmp and roundf boundaries; unknown
calls fail closed. No original application process or OS operation runs. Locale
misses deliberately select the embedded English fallback.

The source-owned
[`native-amulets-0.97.2.json`](../../crates/azeroth-survivors-re/assets/native-amulets-0.97.2.json)
retains names, keys, icons, rarity,64-byte effects and owned strings.
[`amulet-construction.json`](evidence/native-overlays-comparison/amulet-construction.json)
binds its SHA-256, constructor scope, reviewed calls and record counts. Raw
padding reflects the bounded emulator's zeroed allocation and is not a claim
about native uninitialized padding. Original pointer words are forensic data;
runtime code must use decoded values and owned strings, never dereference them.

The new library companion
[`amulets.rs`](../../crates/azeroth-survivors-re/src/loot_rewards/amulets.rs)
implements the recovered pool and numeric aggregation stages. Shared records
of the sampled rarity retain table order. Rarity4 then appends the generated
amulet for each learned row in learned order. Current worn and banished keys
are removed without reordering. This does not consume or replace the later
native uniform selection draw; the separate`draw_new_amulet` function owns that
draw. Its full64-bit multiply/rejection uses
`zone = (count << count.leading_zeros()) - 1`, accepting a product when its low
word is at most the zone and selecting its high word. Even a one-element pool
draws from the shared RNG. If filtering leaves no candidates, native`1454e2e47`
constructs the first shared record (Mark of Fordring) without drawing; it does
not skip that seed. The helper preserves that fallback even when the first
record was excluded from the ordinary filtered pool.

The same companion's`draw_cache_rewards` completes all weighted seed draws
before expanding them in order. Jewelry rolls the ordinary rarity distribution;
new amulets include the native extra`.5` rarity strength and run the pool sampler;
empowerment preserves the worn item's payload, rarity and current pick count.
A result shorter than three receives exactly one rarity2 gold offer using
`max(cache_price>>1,60)`. This is source offer generation, separate from purchase,
selection application, presentation and shared completion.

[`amulet-draw-fixtures.json`](evidence/native-overlays-comparison/amulet-draw-fixtures.json)
records36 unchanged native sampler-span executions, including one-element pools
and rejection cases. Each selected index and final four-word RNG state matched
the source equations. No calls are substituted in this sampler span.

`145415a50` adds Effect30's repeated stat tags into the first matching row,
retains Effect31's selector/modifier order, and stores other effects separately.
`145415f40` computes seven spell lanes from already-scaled modifiers: additive
power, cooldown reduction with`.4` floor, rounded target sum, additive area,
duration, health-power and effect values. Reward refresh`1454b84f0` overwrites
only these talent lanes, preserving learned rank, upgrades, remaining cooldown
and ordinary multipliers. The source companion implements this numeric subset.

[`amulet-modifier-fixtures.json`](evidence/native-overlays-comparison/amulet-modifier-fixtures.json)
retains274 bounded native evaluator vectors across matching/nonmatching generated
selectors and shared definitions. The seven numeric equations matched their
native output bits in every case. These are finite current-catalogue inputs at
initial empowerment1; roundf is a reviewed substituted import. The Rust module
was not compiled or executed by this helper, and these vectors do not verify
empowerment scaling, generic effects or live equipped behavior.

The complete equipped path remains missing: generic passive effect payload
consumers, the full empowerment scaling stage, all global stat composition,
localized amulet comparison prose, category delivery and shared completion.
The companion preserves and explicitly reports unsupported passive tags; it
does not discard them and claim a working equipped amulet. Cache purchase
availability remains guarded by the gameplay owner, preserving gold/cache
while complete reward application is unavailable. This checkpoint adds source
and bounded evidence; no build, test executable, game launch or visual parity
check was run by this subtask.

Reproduce the constructor asset with:

```sh
python3 scripts/recover-native-amulets.py
```

### Client cooldown publication integration

The ordinary successful-cast branch
[`14549ec0f..14549ed8b`](evidence/native-overlays-comparison/ordinary-cooldown-publication.asm)
stores the final scheduled remaining value after the native minimum/NaN handling,
then emits its spell cooldown as truncated saturated unsigned milliseconds.
The failed-cast branch writes only the`.2` retry and jumps to the next instance;
the learned instance's initial`.5` delay is also separate from a cooldown packet.
The [client descriptor manifest](evidence/native-overlays-comparison/client-descriptors.json)
binds this380-byte span to the selected executable.

The live scheduler now exposes publication after successful rescheduling.
Mechanics retains that publication, and both actual action buttons and the
native spellbook consume its original start/duration. They do not turn retry
timers into sweeps or rewrite an existing publication when live stats change.
The separate racial uses the same millisecond conversion. Source fixtures cover
an actual Holy Light failed gate, subsequent successful heal/publication, live
stat changes, and native millisecond truncation. These new fixtures were authored
but were not run by this subtask; whole-application validation is separate.
