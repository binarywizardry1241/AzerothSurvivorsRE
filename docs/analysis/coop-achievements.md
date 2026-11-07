# Cooperative achievement catalog and predicates

Selected installed EXE SHA-256:
`507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
Finding **#114** owns these fourteen definitions, the Co-op category, progress,
predicate interpretation and reward descriptions. **#157** separately owns
capturing and distributing the shared party context and delivering dated,
idempotent grants. **#115** owns cooperative victory persistence. Current overall
implementation status belongs to [verification-needed](../verification-needed.md).

The new [source catalog](../../crates/azeroth-survivors-re/assets/coop-achievements-0.117.0.json)
is merged by both the pure account evaluator and the real Achievements/Rewards
page. Historical catalogs remain unchanged and retain their original evidence.
The combined UI contains **98 achievements / 2,270 points**; the current additions
contribute fourteen achievements / 495 points in category 5, **Co-op**. Sidebar,
summary and category totals follow the six-entry category array. Existing input,
scrolling, card and notification consumers use those same merged definitions.
The artwork loader requests every unlock icon as well as achievement icons;
United Front's `Spell_Holy_PrayerOfHealing` is distinct from the achievement and
category icon `Spell_Holy_PrayerOfHealing02`.

## Native contracts and live source

The [manifest](evidence/0.117.0/coop-achievements/manifest.json) binds selected
code/data ranges to the current PE. Six journaled Ghidra queries have compact
[receipts](evidence/0.117.0/coop-achievements/ghidra.json). Raw imports omit external
data/callees and retain generic ABI and jump-table limitations. The bounded
original-instruction checks use the configured PE read-only and its actual tables;
they do not execute the application or reconstructed Rust.

| Native owner | Contract and source consumer |
| --- | --- |
| `145b3f980..145b45d51` | Constructor output records are 152 bytes: condition at `+48`, icon at `+80`, points at `+90`, category at `+94` (hex). The fourteen-row cooperative suffix supplies exact names, descriptions, icons, points and typed condition payloads to the shared current asset. |
| `145b39980..145b39c91` | Composition predicate consumes eight-byte members: highest spell ID at `+0`, raw class at `+4`, talent flags at `+5`. `CooperativeParty` preserves all native gates rather than interpreting descriptor prose. |
| `145a7b210..145a7b2a7` | Exact key lookup in the 113-row ability table supplies Consecration spell 26573 and Magma Totem spell 8190. Highest-spell predicates require each member's nonzero captured ID to match this lookup. |
| `145b47600..145b48c9e` | Condition 21 returns whether the cooperative beaten set is nonempty. Condition 20 counts selected zone ordinals; an empty descriptor list expands to all twelve zones. `Account.cooperative_beaten` comes from `Save::cooperative_beaten_zones()`. |
| `145b48e10..145b498d6` | Run conditions 8/9 consume current or lethal-event party snapshots. `eligible_cooperative_keys` preserves their separate victory, zone, death, modifier, event and attribution gates. `progression::grant_party_feats` uses existing Save grant/date handling. |
| `145b338f0..145b3397f` | Six current category selectors resolve Zones, Classes, Collection, Feats, Lifetime and Co-op. The retained UI icon cohort contains the corresponding six names. The existing page's category/count consumers are extended to six entries. |
| `145b4a810..145b4a9ef` → `145c2a470` → `145c3e300..145c3e80e` | The current unlock initializer, collector and iterator produce all fourteen exact ordered reward lines, including the special United Front and White Devilsaur rows. The source asset supplies them to ordinary achievement cards and icon loading. |

The [selected instructions](evidence/0.117.0/coop-achievements/selected-native.asm)
retain these newly recovered bounded owners. Shared grant/wrapper/wire recovery
remains owned by #157; these predicate checks do not certify that delivery route.

## Predicate details

All fixed-class, fixed-talent, highest-spell, same-class and different-class
conditions require **exactly five** members. The unrestricted condition requires
only a nonempty member list. Class equality/uniqueness uses raw class bytes.
Tranquility reads talent bit 0; Bladestorm reads bit 1. They are independent bits,
and the transport/source member byte must preserve both.

Victory conditions require a win, their optional selected zone, current party
composition, any requested zero-death condition, and any requested maximum-modifier
flag. Jurassic Pack uses Un'Goro/class 3; the no-death condition uses Duskwood.
The same-class and modifier conditions have no extra zone restriction.

Boss conditions scan captured lethal events independently of victory and the
recipient's own kill attribution. Composition comes from **that event's** member
snapshot. When the descriptor supplies spell IDs, source kind 2 is excluded and
the lethal spell must match the list. An empty spell list has neither restriction.
The maximum-modifier flag, where required, comes from the shared run context.

| Achievement | Boss / lethal spell IDs | Composition |
| --- | --- | --- |
| Rest in Photosynthesis | 1494 / 740 | Five class-11 members with Tranquility |
| The Brotherhood Falls | 694 / unrestricted | Five distinct classes |
| Hakkar Smoothie | 994 / 1680 | Five class-1 members with Bladestorm |
| Holy Frame Drops | 1394 / 26573 | Five class-2 members whose highest spell is Consecration |
| Totem'ly Balanced | 1094 / 8190 or 8187 | Five class-7 members whose highest spell is Magma Totem |
| The Old Gods Have No Friends | 1194 / unrestricted | Nonempty party; maximum-modifier flag |

For the Team reads cooperative zone ordinals 2/4 (`wsg`/`ab`); Dragonslayers reads
8/9 (`av`/`brm`). Together, To the End requires all twelve. Solo class clears do
not contribute to these conditions. First victory and history progress are
ordinary account predicates; they are not re-created as killing-blow feats.

## Static checks and remaining limits

Run `python3 -B scripts/check-coop-achievements.py`; add
`--require-retained-queries` to require the local saved Ghidra plans/results.
It checks current target/range/query commitments and replays:

- Fourteen original constructor rows, totaling 495 points, and every exact
  ordered unlock row under an explicit English locale-miss seam.
- **9,065** composition cases, including all 256 class and talent-byte values at
  every member position, member counts, spell boundaries and raw class uniqueness.
- **16,384** cooperative history cases: every subset of twelve zones against
  the four history definitions.
- **314** complete run-predicate scenarios, covering victory/zone gates,
  membership counts, deaths/modifiers, lethal spells/source kinds and event-time
  membership after current members depart.
- Six category-name selectors, exact source catalog/conditions/unlock equality,
  and live account/UI/artwork connections.

The independent display-data check is
`python3 -B scripts/check-coop-achievements.py --constructor-only`.
It uses the same constructor replay, the hash-verified configured EXE and only
`constructor-native.json` from this proof directory. It compares the fourteen
key/name/description/icon/points/category rows, the actual display catalog loader
and its 98-achievement/2,270-point assertions. It neither reads the full manifest,
Ghidra receipts or other proof files nor interprets predicates, party codecs or
unlock artwork. The full check also performs these display assertions.

Allocation, byte operations, locale misses, explicit clock input, grant insertion
and the already independently recovered zone-key projection are declared harness
seams. The complete selected predicate/lookup/iteration instructions execute;
neither gameplay nor rebuilt source executes. Two authored Rust regressions use
the retained native scenarios and distinguish solo/cooperative history; they are
**uncompiled and unrun**. Pinned Rust formatter emit-to-stdout parsing passed for
the affected source modules. No compilation, game/server/network execution,
real persistence/input/artwork/layout/render validation or original/rebuilt parity
comparison was performed. Those limits remain open independently of these
source and static-recovery results.
