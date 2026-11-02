# Warrior Trauma and Bloodlust — 0.112.0

Target: configured installed 0.112.0 EXE, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
[verification-needed](../verification-needed.md) owns current status and remaining validation.
This report owns #47's source/static repair. The 2026-10-23 optimized macOS
application build passes after separating talent lookup from replacement to
avoid borrowing a moved value in both definition overlays. Authored Rust tests,
gameplay, rendered talent interaction and controlled original/rebuilt parity
remain unverified.

## Definitions, ranks and saved allocation

| Stable key | Current presentation | Runtime stat | Per rank | Displayed ranks |
| --- | --- | --- | --- | --- |
| `imp_heroic` | Trauma / `Ability_Warrior_DecisiveStrike` | 21, damage against a victim with retained periodic rows | 0.03 | 3/6/9/12/15% |
| `unbridled_wrath` | Bloodlust / `Spell_Shadow_BloodBoil` | 23, shared buff potency | 0.06 | 6/12/18/24/30% |

The [current records](evidence/0.112.0/release-data-leads.json) preserve Arms
row0/column0, Fury row1/column0, five ranks and the existing save keys. The two
records in `assets/warrior-talents-0.112.0.json` now contain the current names,
icons, descriptions, rank values and effects. Both the runtime effect catalog and
the shared menu/allocation catalog overlay these two keys from that single
asset. Historical catalogs retain their actual target identity; replacing two
selected records does not revalidate every other talent. Current raw effect36
is explicitly lowered to the existing source
internal effect30, preserving its stat byte and magnitude. This is a semantic
translation, not an assertion that historical raw enum layouts remain current.

The current collector `14599e8d0` reads definition effects at +96/+104. For these
two records, no custom rank-weight slice exists; it converts the supplied rank
to f32, multiplies effect+4 and preserves stat+8. Fourteen current instruction
cases include zero, every valid rank and raw255. The raw collector does not clamp
an invalid saved rank itself. The separate
[saved allocation owner](talent-allocations-0.112.0.md) checks sixteen Warrior
load/import/spec/switch cases, including zero through five, oversized ranks,
retained keys and Fury's preceding-row requirement. There is no invented rename,
reset or Warrior-specific migration.

All ten current English rank descriptions are replayed through `14599ddf0`,
reusing the [shared formatter evidence](evidence/0.112.0/warlock-talents/manifest.json).
The [fourteen locale catalogs](locale-catalogs-0.112.0.md) provide translated
current templates and names. Between-run and in-run viewers use the same
embedded definitions, shared rank substitution and ordinary icon loader.
Actual icon/font display, translations and interaction remain unverified.

## Live combat connections

`configure_effects` resolves the saved keys, scales the two selected payloads and
rebuilds the equipped stat vector. Neither replacement adds stat16 weapon power.
Trauma remains a conditional victim modifier; it is not folded into the global
outgoing-damage scalar or baked into stored DoT power.

The current canonical hit owner `14593ec90`, specifically
`14593ed6c..14593f188`, adds the ordered stat21 sum when Actor+0x10, its retained
periodic-vector length, is nonzero. It does not test guardian membership, spell
ID, periodic owner or remaining ticks. Retained exhausted rows therefore still
satisfy this predicate. Ordinary spell DoTs and effect-owned DoTs already use
this same vector; no separate Trauma row or meter attribution is introduced.
All canonical hit kinds pass through the same multiplier. Installing a DoT is
still not a second direct hit, and spread/stack replacement does not pre-apply
Trauma to stored power.

`player_abilities/damage.rs::Victim` now receives `has_periodic` from the actual
ordinary enemy, primary boss and ward vectors. Guardian metadata continues to
select raid defense independently. Current native vectors cover plain victims,
control, boss/elite, execute, vulnerability, shield, combined modifiers and
ordered duplicate stat rows. The 144 cases compare exact f32 bits. Existing
periodic attribution, effective-damage meters, proc/death callbacks and packet
ordering remain on the shared hit route.

Bloodlust's current refresh owner `1458f28e0` folds stat23 into Game+0x4c0;
stat21 is deliberately ignored by this scalar refresh. Buff potency and the
jewelry potency lane add before consumers compute `1 + bonus`. The
[buff proof](evidence/0.112.0/buff-potency/manifest.json) retains current dispatch,
producer and consumer ranges, including these rules:

- Live damage8 and recovery9 auras multiply their stored magnitude by shared
  potency once, in aura order. Refresh does not rewrite the stored aura.
- Fixed damage/movement runes keep their separate +0.5/+0.6 contributions.
  Healing, movement, duration, invulnerability and unrelated aura tags do not
  acquire a blanket multiplier.
- Shield7 applies potency once when constructing the reservation. Source now
  preserves native f32 order: effect multiplier × base fraction; maximum HP ×
  that fraction; square-root power ×1.4; then prepared power × prepared HP;
  finally `(1 + buff bonus)` × amount. Expiry/removal subtracts that reservation
  without applying potency again.
- Thorns uses its existing active-aura sum, first matching spell attribution,
  shared potency once and current outgoing damage. Gear retaliation retains its
  separate source and arithmetic.
- Current Demonic Empowerment's raw producer and damage consumer are owned by
  the concurrent #12/#24 repair. Its potency belongs once at the demon consumer;
  this Warrior repair does not duplicate it in stored aura power.

The shared jewelry-health branch in the buff manifest is a dependency reused by
#34; the selected equipment repair owns its catalog, scaling and presentation.

## Reproduction and limits

Run from the repository root with the existing Python Unicorn environment:

```sh
python3 -B scripts/check-warrior-talents.py
python3 -B scripts/check-buff-potency.py
```

The Warrior check verifies exact target/data/code hashes and reproduces 14 rank,
10 description, 144 damage-prefix cases and 56 localized labels across fourteen
current catalogs. `--write` refreshes its compact
fixture only after review. The buff checker independently verifies current
stat/aura/shield/thorns ranges and bounded native arithmetic, retaining its case
count in [bounded-cases.json](evidence/0.112.0/buff-potency/bounded-cases.json).
Ghidra raw imports retain their external-data, Win64 ABI and reference-discovery
limits in the two manifests. Native instruction fixtures execute controlled
regions; they do not start the original game or execute the rebuilt Rust source.

Authored source regressions cover rank-to-equipped-stat delivery, all current
victim vectors, actual weapon packet/hit ordering with and without retained DoT
rows, and Bloodlust's live damage/recovery consumers, shield reservation/expiry and the
actual menu catalog. The historical weapon
regression now uses current Trauma expectations. Rust syntax parsing is separate
from compilation; these regressions have not been compiled or run. Shield,
all-class buff/DoT interactions, saved input, rendered presentation and controlled
original/rebuilt gameplay parity remain unverified. #47 retains those deferred
validation requirements; no further missing source connection is claimed here.
