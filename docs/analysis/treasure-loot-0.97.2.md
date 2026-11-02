# Treasure, item upgrades and mob loot — 0.97.2

**Later integration checkpoint (2026-10-18):** playable-level integration followed this source checkpoint. The [live adapter and validation report](playable-zones.md) owns the new builds/tests, twelve-zone captures and remaining engine/presentation/persistence gaps. Source-only/no-adapter statements below describe the preceding recovery checkpoint; they are not current application status. Full native parity remains unverified.

Recovered on **2026-10-18** from native evidence. The selected reference
is `AzerothSurvivors/AzerothSurvivors-0.97.2.exe`, SHA-256
`a64895f593c02d41aa682570f4ebabb67838146ba9b32e4ff4184b8958a92589`.
All addresses in this report are preferred-image VAs in that EXE. Historical
[0.92 chest evidence](treasure-chests-0.92.md) remains separately version-bound.

This task authorizes these isolated gameplay source components while menu work
remains paused. It does not add world entry or claim original/rebuilt runtime
parity. The source builds without the reference EXE. No game was launched.
The standing menu-parity rule still prevents a GitHub push for this task.

## Evidence and source

- [Native spans/constants](evidence/0.97.2/loot/manifest.json), with exact file
  offsets, function-byte hashes and adjacent original instruction listings.
- [REA/Ghidra provenance](evidence/0.97.2/loot/rea-provenance.json), preserving
  Evidence IDs, provider profiles, raw-slice identities and limitations.
  Adjacent `.ghidra.c` files are decompiler observations, not original source.
- [Current chest/zone/enemy records](evidence/0.97.2/treasure-chests/catalog.json).
- [Chest source](../../crates/azeroth-survivors-re/src/treasure_chests/mod.rs),
  [reward source](../../crates/azeroth-survivors-re/src/loot_rewards.rs), and
  [mob loot source](../../crates/azeroth-survivors-re/src/mob_loot.rs).
- Reproduction: `scripts/recover-loot-native.py`,
  `scripts/recover-treasure-catalog.py`, `scripts/recover-jewelry.py`
  and `scripts/recover-mob-loot.py`. All readers reject a different target
  hash; generated production catalogs are ordinary source constants.

REA was invoked through `./scripts/rea` via the project batch runner, using
Ghidra 12.1.4. Exact function slices permit focused analysis without launching
the target. Raw imports omit outside callees/constants and infer a generic GCC
ABI, so original Windows x64 instructions, the full PE data and bounded native
instruction fixtures decide argument roles and arithmetic. Failed jump-table
recovery, incomplete call coverage and transport-size limits are not evidence
that a branch is absent. Oversized dossiers were read from their exported
retained Evidence rather than repeating the analysis.

## What was missing from the old source

The previous library ended at `ChestWorld::request_cache_choice`. It had no
cache candidate selection, rarity rolls, repeated-item arithmetic, amulet
empowerment scale, normal-enemy XP/gold drops or permanent boss-item acquisition.
Its nine-zone chest catalog also omitted three zones and new enemy definitions.

### Chest lifecycle and terrain

The current target retains two starting chests, first attempt at 60 run-seconds,
later deadline `current_time + 70`, a timer population gate below three and a
shared creation limit of five with one oldest-first removal. Prices start at 20
and use separate f32 multiply/add followed by saturating truncation of
`price * 1.3 + 5`. Walking/click ranges remain 3/10. Opening does not reset the
timer. These rules were rechecked in current-target instructions, rather than
inferred from old addresses.

Current owners include placement `0x1454c2a20`, creation `0x1454c8110`, purchase
`0x1454d34b0`, death `0x1454c2eb0`, RNG range `0x1454f97c0`, and tick
`0x14549d550`. Current Game offsets differ from 0.92: RNG `+0x880..0x898`,
run clock `+0x8e4`, chest deadline `+0x92c`, running-state byte `+0x95f`.

The 12 current zones have **148 enemy definitions, 40 with the chest flag**.
Un'Goro, Scarlet Monastery and Naxxramas are additions to the old catalog;
Arathi Basin's roster also changed. Naxxramas has 16 definitions, including four
extra flagged Horsemen; each other zone has 12. Geometry and flag bytes come
from current table base `0x146716438`, stride 240, rather than old stride 184.

The new terrain behavior matters: regular placement retries still use the
primary terrain query, while fallback/final creation paths can query a second
height provider before the resource's fallback Z. The required
`Terrain::secondary_height` port represents that native branch; it is not
silently replaced with a flat height. Native resource `+0x68 != -1` enables the
provider, result tag 1 carries Z at `+0xc`, and final fallback Z is `+0x90`.

### Cache choices and repeated item upgrades

The cache candidate owner is `0x1454e1d00`; the jewelry increment leaf is
`0x145412bb0..0x145413212`. The source preserves ordered candidates, excluded
keys, two ring/two trinket limits for new pieces, native ability predicates,
existing-piece weight 2 versus new-piece weight 0.5, new-amulet weight 2.5 and
existing-amulet empowerment weight 1. Seeds are drawn without replacement from
the shared run RNG. Their later expansion and rarity rolls are separate stages.

For a jewelry pick, the raw increase is native rarity multiplier × base value,
with **1.5× for the first pick**. Existing pieces do not receive that bonus.
The effect tag selects the growth rule:

- Tags 0/1/3/4/7/8 divide by `1 + upgrade_count * 0.08`, then limit the increase
  to the remaining cap. Some of these caps are positive infinity.
- Tags 2/5 use 16 f32 integration steps. Their growth curve changes at three
  base values; that threshold is not a hard cap.
- Remaining ordinary tags grow in proportion to their remaining room.
  Tags 6/14/17 cap at 3× base, tag 18 at 4×, Hand of Justice at 0.6 and the
  other bounded tags at 5×. The source retains raw tags where their original
  source names are unknown.
- Offering eligibility uses a separate 90%-of-cap threshold. Soulstone
  eligibility instead tests remaining lives below two; its increment is one
  for lower rarities or two for the higher two rarities.

Actual choice application is separately bound to `0x1454e40a0`, including its
jewelry arm at `0x1454e4b4f..0x1454e4c96`. A new item starts with pick count
one. A repeated item adds the recovered increment, wraps its pick count by one
and retains the higher rarity. Soulstone clamps its live refill to two lives.
Selecting the same amulet key increments its existing count while preserving
rarity/effect payload; a different key replaces the selected item. These source
operations require the owning engine to perform native stat recomputation,
UI updates and choice-completion scheduling afterward.

The general cache rarity calculation uses current run rarity, a level term
`min(level * 0.01, 0.3)`, the caller's source bonus, and an additional 0.5 for
amulets. With their native f32 operation order, weights are
`[60, 25*s, 10*s², 4*s³, s⁴]`. A short constructed card list receives one
fallback gold card worth `max(current_price >> 1, 60)`; it does not fill every
empty slot with another gold card.

Amulet effects use a separate multiplier tending toward three:
`3 - 2 * (1 - 0.5 * rarity_step)^saturating_sub(picks, 1)`, with native steps
`[0.6, 0.5, 0.35, 0.25, 0.2]`. A fresh item has pick count one. The preview
helper first performs a wrapping increment, then uses the same exponent rule.
Host `powf` bit identity with the Windows CRT remains unverified.

### Ordinary mobs, flagged enemies and boss equipment

Death-handler branch `0x1454c487e..0x1454c4d46` is distinct from boss and
guardian reward branches. Ordinary definition `+0x40` is base experience;
`+0x44` feeds the normal-death accumulator. Subsequent [enemy recovery](enemies-0.97.2.md)
identifies this shared `Game+0x910` field as decaying kill credit used to
accelerate the ordinary spawn budget; spawning borrows the same field from
the loot state. Normal enemies scale XP by
`1.65 / (density_percent / 100)`, stochastically round it using a native
24-bit unit draw, and omit the XP pickup when the resulting amount is zero.
Normal gold chance is that density scale × 0.1; a success draws an integer
in `[0,3)` and drops 2–4 gold. The native integer sampler and RNG consumption
order matter; a float-range substitution would change subsequent rewards.

Flag-one definitions give unscaled base XP, guarantee 15 gold and create a
chest at dead XY + (2, −1), independently of the chest timer. The gold roll
still consumes its native random draw. Gold appears at XY + (0.8, 0.8).
The chest creator supplies its shared terrain/clamp/eviction behavior.

Permanent gear is a separate boss-only candidate/roll path, not normal-mob
jewelry drops. Current zone tiers are **[0,0,1,1,2,2,3,3,5,5,4,4]** in zone
table order, with base chances **[0.6,0.5,0.4,0.3,0.2,0.25]**. Eligible
ordinary boss definitions divide the eight armor slots across the tier;
final bosses offer the class's weapon variants. Each candidate receives an
independent strict probability test after adding the run gear-drop modifier
and multiplying by the run reward multiplier. The native pending-item list
and eventual ownership/persistence remain separate concerns.

## Coverage and remaining work

| Question | Outcome |
| --- | --- |
| Current chest rules and catalog drift | Recovered and implemented; terrain adapters still required |
| Jewelry increment/cap/offering arithmetic | Recovered and implemented; checked against native instruction outputs |
| Cache candidate weights, seed/rarity/amulet expansion | Recovered source; complete reward application and connected UI/run scheduling remain incomplete |
| Amulet catalogue and empowerment | All112 generated and17 shared definitions recovered; pool/numeric modifier source added; complete effect application still incomplete |
| Ordinary mob XP/gold/cache branch | Recovered source; world/entity delivery still requires actual engine ports |
| Boss equipment pools and independent rolls | Recovered source; end-of-run account/save delivery unverified |
| Live gameplay, rendering, audio, MPQ terrain and addon bridge | Not run/incomplete; no parity claim |

The extra-pickup mode's enable route, primary boss/guardian XP/gold/magnet
pickup scheduling, full spell
upgrade system, complete equipped amulet effect recomputation,
localized card presentation and native event/VM delivery are outside the
completed component boundary unless separately recorded below. Existing
provisional menu source remains a 0.92 baseline; this loot work is not evidence
that all source has been upgraded to 0.97.2.

The later [native overlay checkpoint](native-overlays-0.97.2.md#amulet-catalogue-and-numeric-compositor-checkpoint)
owns the current129 amulet definitions, bounded constructor evidence and numeric
pool/modifier companion. It does not enable cache purchases while the generic
equipped effects and complete reward transaction remain unavailable.

Validation: **38 focused tests passed** (22 chest, 11 reward, five mob),
covering **3,902 bounded native fixture cases**. The locked/offline Apple
Silicon library and application build passed. No game, Windows build or
rendered comparison was run. Seventeen focused REA records are retained; an
optional full-PE startup was cancelled after 762 seconds without a function
result, and closed successfully. See the [validation record](evidence/0.97.2/loot/source-validation.json)
and [CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md). Fixtures execute bounded unchanged native
instructions in an emulator with explicit hooks; they do not execute the game
process or establish live application parity.
