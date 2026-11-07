# Gear progression contracts

Target SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md) owns findings #227–#229 and their remaining
scope. The [record proof](evidence/gear-records.json) retains five durable
Ghidra queries, source receipts and original-instruction fixtures. Current
recovery covers persistence, boss and duplicate awards, per-piece pity, receipt
chat and star offer/debit. Live armory and cooperative ingress integrations are
shared with their owning reports; static checks do not establish runtime parity.

## Persistent records

Parser `145aa6a10..145aad16c` and writer `145aaf840..145ab2e92` own these rows:

| Row | Current contract |
| --- | --- |
| `marks|class|amount` | Class is unsigned byte in mask `0xBBE`: 1,2,3,4,5,7,8,9,11. Amount is unsigned 32-bit **tenths** of a displayed mark. A later valid class row removes the old row and appends its replacement. Zero balances are retained. |
| `stars|item:count,...` | Unsigned 32-bit item, unsigned byte count; zero and failed parses are discarded. Valid synthetic gear descriptors are required, then count caps at five. |
| `pity|item:count,...` | Same token contract, with count capped at 255. The count parser itself rejects values beyond the byte domain. |

Token helper `145ab6a50..145ab6e1c` rejects extra colon fields and token
whitespace, accepts unsigned decimal's optional leading `+`, rejects a failed
descriptor, and requires its class byte at `+0x69` to be nonzero. This field is a
class ID, not a Boolean or a rarity. Cosmetic and ordinary client-item descriptor
paths have zero there. Existing `save::gear::decode` supplies the synthetic ID
domain at the source boundary; no original EXE is required to load a save.

Current price/admission owner `145aa4ea0..145aa52d6` maps synthetic rarity digit
six to digit five before ownership/star lookup. `save::gear::canonical_id`
supplies this shared faction key to star consumers and preserves other IDs.

The vector collector `145c78680` feeds the parser's two sort/deduplicate paths.
Small-sort `145cace10..145cacec9` and large-sort entry `145b678c0..145b67a68`
compare the unsigned item ID first and count second. The parser then deduplicates
by item ID, retaining the **lowest nonzero capped count**, including across
repeated rows. Sorting alone or a maximum-merge would alter native save behavior.

## Star purchase transaction

`save/gear_progression.rs` implements current admission `145aa4ea0`, other-class
armor counting `145aa52e0` and debit/update `145ab44d0`. An offer requires canonical
synthetic ownership and a next rank at most five. Its cap is the selected class's
highest **cleared** Heroic rank among zones whose set tier matches the piece;
an unlocked successor or another class's clear cannot supply this cap.

Base prices per rank are `[1,2,3,4,6,5]` in native rarity order. A fifth star in
tiers zero through three instead uses base six. Each other class counts once
only when all eight armor IDs of that tier are owned and at least the purchased
rank; weapons do not count. The reduction is `min(classes * 0.05, 0.4)`. Current
SSE order is `ceil((((1-discount)*rank)*base)*10 - 0.001)/10` displayed marks.
The transaction rounds that cost times ten to an unsigned debit, requires the
piece class's sufficient balance, then updates/inserts its sorted star record.
Invalid/unowned, maximum, locked and insufficient-funds paths leave both fields
unchanged. Public offer/transaction methods supply the separate armory owner;
its live input connection and rendering retain their own validation limits.

[Purchase proof](evidence/gear-purchase.json) binds three current queries
and **324 native offer contexts plus debit/failure branches / 2,111,010 original
instruction steps**. Descriptor allocation, CRT math and memmove are synthetic
seams. Tier/cap/discount/ownership/debit and sorted updates use original native
instructions. Two Rust purchase regressions are authored and unrun.

`save/gear.rs::Records` now includes these three families. Its existing live
consumers—`Save::parse` normalization, gear writes, armory equip/look application
and server gear-command replacement—retain them instead of losing them during
an otherwise unrelated save mutation. The writer emits native colon/comma and
pipe delimiters. The dedicated progression and reward modules use this codec for their mutations.

## Boss rewards and per-piece pity

Current owner `145c135f0..145c13abf` is called from the accepted primary death
branch at `145c1815b`. Its base mark amount is zone-pair ordinal plus one. When
the prior-final-clear phase is zero, a final boss multiplies it by three. When
that phase is nonzero it multiplies by `max(endless_boss_kills, 1)` instead. The death caller increments that unsigned
counter before rolling when Game `+d24 == 0` and `+b90 != 0`. Current rank marks
multipliers are Normal/invalid `0.5`, then ranks I–V `1,1.25,1.5,2,2.5`. The
shared `heroic` module supplies these rank policies.

`mob_loot::roll_boss_rewards` consumes the existing class/zone/boss candidate
collector and the same run RNG. The current candidate wrapper `145aff7d0`
selects the saved tier mapping and class weapon lists; the twelve source zone
tiers and every candidate-rate table bit match the selected target. Every roll
uses this f32 order:

```text
((base_chance + additive_chance) + f32(prior_piece_misses) * 0.1)
    * heroic_reward_multiplier > next_unit24
```

Heroic reward multipliers are Normal/invalid `1`, then `1.3,1.4,1.5,1.6,1.7`.
Run Options do not choose either policy. A successful candidate queues its ID
and removes its run pity entry. A miss queues its ID and increments its counter
with saturation at 255. The entry constructor clones saved pity into the run;
local and cooperative hero state each retain private pity counters and queues. Boss
mark sum and maximum single-boss marks are independent of duplicate conversion.

The live death port and cooperative admitted-hero loop call this current owner.
Current private swap `145be6f10..145be82b7` excludes shared phase `+b90` and boss
counter `+cd8`, while moving pity, reward queues and boss mark sum/maximum.
The shared death queue contains only collector identity and definition pointer.
Party update `145bba990..145bbee85` skips collector/abandoned recipients and
calls the same reward owner against the **then-current shared** phase/counter.
Consequently, a remote first-final-boss receipt can take the phase-nonzero
branch after the killer changed that phase; multiple queued kills read the
latest world counter for every remote receipt. Source preserves this ordering
rather than adding unshipped per-kill snapshots. The unswapped `BossState`
counter increments once at each eligible lethal boss, including when an
abandoned hero skips its reward. State15 therefore exposes one world counter
for all heroes, and a guest reads its accepted replica field.
`EquipmentDrops` retains pending successful IDs separately from ordered misses
and floating-point marks. `Mechanics::drain_boss_rewards`, `run_marks`,
`max_boss_marks` and `endless_boss_kills` expose those exact state families.
The older pure roll helper remains for explicitly historical isolated fixtures.

## Saved award recipients

Owner `145b0e8d0..145b0ee2c` accepts a class, floating-point mark award and ordered
**missed candidate IDs**. It calls saved-pity mutation `145aaf300..145aaf44d`
for every occurrence before processing the positive mark amount. These IDs do
not grant ownership: co-op tag20 transports the misses, while tag13 transports
successful items separately. The miss mutation performs a sorted insert at one
or increments the existing unsigned byte, saturating at 255.

The class balance is `u32`; the earned statistic is `u64`, both saturating. The
exact current conversion is:

```text
round((floor(max(amount, 0) * 10 + f32(0x3a83126f)) / 10) * 10) as u32
```

The constants at `146198910` and `14619892c` are 10 and approximately 0.001.
Current import thunks `145febc75`/`145febc9f` resolve to `roundf`/`floorf` through
IAT slots `146195370`/`1461953a0`. Saved values and the eighth cumulative statistic
use tenths; display values divide by ten. Raw-slice pseudocode has external-call
and control-flow limitations; original instructions govern these observations.

Success owner `145b0cb70..145b0db1d` clears the exact saved pity key before its
ownership lookup. A new ID is retained. A duplicate grants its descriptor's
class the rarity amount `[1,2,3,5,8,6][min(rarity,5)]` multiplied by the current
rank marks multiplier. Both award paths increment cumulative earned marks,
even when an existing class balance is already saturated. They do not update
the run's boss-only sum or maximum.

`Save::receive_equipment` returns typed new/duplicate receipts;
`Save::record_boss_rewards` applies ordered misses and marks. Local persistence
consumes success receipts first, then Seen records, then boss deltas, preserving
the native recipient order. Its normal account grant and commit paths retain
those changes. Cooperative ingress uses these shared APIs rather than treating
misses as equipment; its wire and admission contract is owned by the cooperative
progression report.

## Local Again input ownership

Fresh login reads Save pity at App `+12c8/+12d0`, filters the selected class,
and installs an independently allocated vector in retained Config `+38/+40/+48`
at App `+1648`. Start owner `145b2d080` deep-copies those rows; constructor
`145bdcb10` embeds its 448-byte Config at Game `+1b0`. The Game's mutable pity
therefore occupies its own vector, separate from Save and retained AppConfig.
The same constructor consumes nineteen Config equipment IDs at `+150` and
nineteen star bytes at `+1ac` for gear effects.

The selected synchronous local command6 Again path keeps this initial Config.
The complete summary and its inspected chat/unlock/account-event publishers
either mutate output queues, receive only Save `App+1110`, or narrow to the
separate Game `App+10`; they do not install updated Save/Game pity in retained
Config. The [ownership proof](evidence/again-entry.json) reuses six existing
manifest selectors and adds four journaled wrapper receipts. Its eight exact
PE ranges contain 509 bytes / 104 decoded instructions. This is a bounded AS
call/argument audit, without an all-process alias or arbitrary callback claim.

`RunSession::prepare_entry_loadout` captures the nineteen IDs/stars, derived
gear effects, full selected-class pity and chosen weapon glow on fresh Play. Terminal captures
solo Again intent before persisting/dropping the old Game. Entry reuses the
original capture only with that intent and the existing per-entry restart
marker, then consumes the intent. A stale flag cannot affect fresh Play;
Normal Again still has a present marker. Cooperative restart does not take
this local cache. Terminal ownership remains the current account view.
The [glow report](weapon-glow.md) binds its retained Config field and
the existing world consumer. Talent/options/perk retention remains separate.

`scripts/check-again-entry.py` verifies the current image, four query
subjects, eight byte ranges, retained manifest selectors and owned
source fragments and two syntax parses. The authored Rust regression covers
changed Save and old-Game state, retained gear/effects/pity/glow, Normal Again and
fresh-Play recapture; it remains uncompiled/unrun. Separate menu/profile
actions, cooperative restart and reentrant external output callbacks remain
outside this qualified audit.

## Receipt presentation

Current success chat uses the real localized armory name grammar and
`You receive loot: |c{quality}[{name}]|r`. The native producer creates colored
brackets, without a hyperlink. Quality strings at `14765c398` select white,
green, blue and purple; rarity four is orange only for item-class two weapons,
otherwise purple, and rarity five is purple. New items append green
`New in your collection!`. Duplicates append gray `(already collected)` and,
when converted, yellow localized `marks.gained` text. The original item receipt
format is at `14765c3f8`; suffix formats are at `147662c8a..147662d1f`.

Boss marks use yellow localized `marks.earned` with quantized award and resulting
class balance. The native formatter uses integer text when the displayed f32
value lies within `1e-4` of its rounded integer, and floating-point text otherwise.
`RunEvent::GearReceipt` and `MarksEarned` reach the existing native client system
chat pipeline; their presentation is separate from the unchanged addon loot-card
fields `type,name,rarity,icon,slot,new`. The fourteen current locale payloads are
owned by the localization recovery report.

## Static validation and limits

`scripts/check-gear-records.py` verifies target and query receipts, exact
original bytes and independent instruction boundaries. It replays **44 rank-token
cases and three tuple-sort cases / 6,440 original instruction steps**. Delimiter
iteration and descriptor allocation/class admission are explicit synthetic seams;
the original descriptor generator, file operations and reconstructed Rust do not
execute. Two Rust regressions cover typed-record retention, widths, duplicate
handling and caps; they are authored and unrun. The changed Rust file was parsed
with the installed `rustfmt --emit stdout`, without compilation or source edits.

[Reward proof](evidence/gear-rewards.json) binds seven durable current
Ghidra queries and **2,304 boss reward contexts plus two complete private swaps /
852,122 original instruction steps**. It executes original arithmetic, RNG transition, pity mutation and
success/miss output ordering, covering every zone, first/final boss, valid and
invalid ranks, counters zero through saturation, and endless counts. Zone-key
lookup, candidate collection and vector allocation are explicit synthetic seams.
The full733-instruction swap preserves the shared clear phase and counter,
moves private mark totals, and restores both complete state buffers on a second
execution. The source reward module and roll owner are hash-bound. Five additional Rust
regressions cover saturation/reset/duplicates, fractional receipts and current
roll policy; they are authored and unrun. Relevant Rust files passed syntax-only
`rustfmt --emit stdout` parsing.

The same reward checker also verifies the [clear/Continue lifecycle proof](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.121.0/reward-endless-lifecycle.json): **87 cases / 372 original steps**. Constructor fields initialize the shared clear phase and boss counter to zero. Continue changes the separate Endless-enabled flag, mode and deadline, while preserving phase/counter. The first final-clear write follows its reward call. These bounded slices stop before external calls and do not execute the application.

No build, compiling test, application/game/client/network/server operation or
original/rebuilt comparison ran. Compilation, gameplay, rendered receipt
presentation, cooperative runtime and parity remain unverified.

The two mark-receipt keys are bound to all fourteen current locale payloads in
[the localization proof](evidence/gear-marks-localization.json).
`scripts/check-set-localization.py --owner marks` verifies all28 values
without rewriting unrelated catalog entries.
