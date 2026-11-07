# Owned armor and Heroic account progress

Target SHA-256: `22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md#gap-237) owns the full achievement finding;
this report covers the current account predicates. Earlier ordinary, cooperative
and run-feat predicates retain their separately documented provenance.

The [proof](evidence/achievement-progress.json) binds current native code,
data, the journaled Ghidra query, source and
[native-derived cases](evidence/achievement-progress-cases.json).

## Native interface

Evaluator `145ba4260..145ba62f6` receives an output Option of two u64 counters,
Save and a 152-byte definition. Definition byte `+0x48` is the condition kind.
Kinds 15–36 use the 22-entry jump table at `14768f28c`; earlier kinds return no
account progress. The retained Ghidra result resolves the dispatcher but warns
about the indirect jump. The branch contracts below are supported independently
by original instruction decoding and replay, including their native callees.

Save owns sorted item IDs at `+0x38/+0x40`, eight-byte star records at
`+0x1a0/+0x1a8`, and sixteen-byte Heroic clear records at `+0x1d0/+0x1d8`.
A star record is `(u32 ID, u8 rank)`; a clear is `(u64 zone, u8 class, u8 rank)`.
These predicates do not read equipped or appearance slots.

Counter `145ba3940..145ba425a` constructs eight compact armor IDs:
`100000 + class*1000 + slot*100 + min(tier,5)*10`, for slots 0–7. It requires
both raw ownership of each ID and its star rank meeting the requested minimum.
An absent star record reads as zero. The current catalog class domain is
`1,2,3,4,5,7,8,9,11`; tier traversal is `0,1,2,3,5,4`.

| Native kind | Condition and returned progress |
| --- | --- |
| 27 | Any star record reaches the selector: 0/1 or 1/1. This branch does not additionally require ownership. |
| 28 | Any class and tier has at least four owned armor pieces at one star: 0/1 or 1/1. |
| 29 | Maximum over tiers of classes owning all eight pieces at one star: N/9. All counted classes share that tier. |
| 30 | Any Heroic clear reaches the selector: 0/1 or 1/1. |
| 31 | Number of zones 0–11 with any qualifying class clear: N/12. |
| 32 | Any class has a qualifying clear in the definition's zone: 0/1 or 1/1. The current Naxxramas definition selects zone 11 and rank five. |
| 33 | Any class and tier owns eight armor pieces at the selector rank: 0/1 or 1/1. Current definitions select three or five stars. |
| 34 | Maximum over classes of complete three-star armor tiers: N/6. All six tiers belong to one class. |
| 35 | Classes owning eight legendary-tier (4) armor pieces at three stars: N/9. |
| 36 | Classes owning any complete five-star armor tier: N/9. Each class may complete a different tier. |

The related native folds are `145c7abb0` (class domain), `145c8cbf0`
(Wardrobe), `145c92230`/`145c97d30` (any set), and `145c97de0` (shared tier).
These contracts distinguish Shared Wisdom from Radiant Armory and Wardrobe;
combining all owned sets or requiring current equipment would change them.

Native lifetime condition 23 selects the eight u64 counters at Save `+0x250`.
Selector seven is special: at `145ba563f..145ba567a`, both lifetime marks
(`+0x288`) and the definition target are divided by ten using unsigned integer
arithmetic. The three raw targets 1000, 10000 and 100000 therefore display
100, 1000 and 10000 marks. Other lifetime counters retain their native units.

## Source and verification

`account_progression::Account` carries owned IDs, raw normalized star records
and Heroic clears. `progress` implements the current conditions and mark-unit
conversion. `Account::armor_pieces` centralizes the owned/rank intersection.
The additive account definition asset contains 15 armor/Heroic predicates and
three lifetime-marks predicates, normalized for the existing evaluator interface.
`progression::achievement_inputs` reads the canonical gear-record parser once
and obtains all clears through the existing Heroic parser's public projection.
Both retroactive grants and the menu progress consumer use that same input.
The full current achievement presentation and run/cooperative feat conditions
have separate source owners.

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-achievement-progress.py
```

The non-compiling check passes **522 original-instruction cases / 2,471,673
instruction steps**, across 23 armor/Heroic states and 13 lifetime-marks boundary
states. Cases cover unworn owned sets, orphan ranks, mixed tiers/classes,
seven-versus-eight pieces, three/five-star boundaries, duplicate Heroic zones,
all zones, and unsigned mark division through u64::MAX. Successful allocation,
vector growth/free and synthetic Save/Definition memory are explicit seams.
The same retained native outputs feed a Rust source test; that test has not been
compiled or run. No application, game, network or server executes. Compilation,
rendered behavior and original/rebuilt parity remain unverified.
