# Cooperative boss credit — selected EXE 0.120.2

The selected installed EXE is **0.120.2**, 145,484,288 bytes, SHA-256
`80ac3217660a02020b3e09f1ce93bfaa6ba89abd9a9d62405b9f70114fd6d46c`.
The supplied notes are labeled **0.120.1**. No 0.120.2 notes were supplied;
this audit neither changes their label nor concludes that either label is a typo.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own implementation status and permanent
findings. The [manifest](evidence/0.120.2/party-achievement-share/manifest.json)
binds current native instructions, ten journaled Ghidra results, source
observations and the bounded replay. The original audit observations remain
unchanged. The [source repair](evidence/0.120.2/party-achievement-share/source-repair.json)
connects both #195 and #196 below, with compilation, execution and parity separate.

| Supplied item | Finding | Current native/source result | Next source/static step |
| --- | --- | --- | --- |
| Co-op achievements summary: a boss's killing blow counts for the party | #194 | The distinct ordinary-history and counter routes below implement the described native credit. Reconstructed ordinary histories and recipient boss counts now connect under #195 and #196. | Source/static connected; retain this summary's own claim review and execution/parity limits. |
| Every player still in the run earns the boss's achievements, whoever lands the killing blow | #195 | The lethal source captures one normalized ordinary record, keeps killer credit and queues its native hero slot outside private swaps. The distributor drains once after simulation into each non-killer, non-abandoned recipient before snapshot/publication. | Source/static work connected; compilation, actual party/account delivery and parity remain unverified. |
| Every slain boss counts toward Boss Hunter for everyone | #196 | Both native local and remote reward distributors increment the other recipient's private boss counter once per admitted boss equipment/death record. The reconstructed distributor now performs that wrapping increment after optional equipment rolls. | Source/static connected through the existing recipient State/count-checkpoint/account/save consumers; actual delivery and parity remain unverified. |

## Current producer and dispatch

The current lethal-hit owner is `145bba060..145bbd9bb`. The selected original
instruction window `145bbaa05..145bbac0b` preserves the killer's ordinary
12-byte history and the previously recovered 40-byte cooperative composition
history. In cooperative mode (`Game+c9d == 1`) it additionally appends a separate
**24-byte ordinary-credit queue record** to `Game+ad8/ae0/ae8`:

| Offset | Captured value |
| --- | --- |
| +0 | Native killer slot from `Game+b98` |
| +8 | Boss ID:u32 |
| +c | Normalized killing spell:u32 |
| +10 | School:u8 |
| +11 | Source kind:u8 |
| +12 | Melee classification:u8 |

The first word is a native slot, rather than an observed network GUID. The
shared tick sets local slot0 and swaps each retained remote under slots1..n.
Its current owner `145b60c20..145b650e5` drains the queue at
`145b64210..145b6424e`, together with the existing shared reward batches.
Local history distribution is `145b643b7..145b6448d`; the remote callback
`145b46770..145b46a7f` receives the same drained inputs while the selected hero
is swapped in. It appends the boss/spell pair to `Game+718/720/728` and the
12-byte enriched record to `Game+730/738/740`.

Both paths skip a record whose killer slot equals the recipient's slot, and
skip a recipient whose `Game+c8f` byte is nonzero. That byte has a current
independent producer: abandonment owner `145b89df0..145b89e6a` admits phases1..3,
sets `Game+c8f=1` and then enters the death owner. The straight-line private
swap exchanges it with `Remote+983` at `145b8cc98..145b8ccb6`. It maps to the
source's **abandoned** state; ordinary dead/down/completed state is a separate
field. History/counter delivery has no HP, dead-phase or victory exclusion.
The phrase “still in the run” is therefore constrained by these actual gates.

## Ordinary predicates and persistence boundary

The current state builder `145af1160..145af178e` clones the selected hero's
ordinary histories and obtains its party context separately. The selected
recipient snapshot `145b205a0..145b2081c` retains the non-tester, guest/local
showcase and phase1..5 admission. The ongoing writer
`145b01b00..145b01bd3` passes that snapshot to the current feat evaluator
`145b400f0..145b40bb6`, then saves and publishes newly inserted keys. Account
settlement `145b1f210..145b1f747` independently consumes the recipient snapshot,
applies nonnegative count deltas and invokes the existing grant/save route.

The ordinary evaluator continues reading ordinary histories separately from
cooperative composition events. The source consumers already exist in
`account_progression::meets_feat_with_events`, `progression::grant_run_feats`,
`gameplay::persist_run_at` and `guest_settlement::Snapshot::account`.
The repaired #195 connection is the **producer/distributor** supplying those
ordinary histories to non-killers. It retains both existing ordinary predicates
and the independent cooperative composition predicates.

The retained source catalog examples are `feat:nou` (“no u”, the
Sapphiron/Frostbolt pair), `feat:vancleef` (“You're Fired”, Fire killing spell)
and `feat:nefarian` (“Bad Dragon!”, pet killing blow). The new queue carries
both forms of ordinary history needed by those consumers. Their complete
catalog/individual predicate recovery retains its historical evidence; this
bounded queue audit does not claim a fresh whole-catalog proof. In particular,
the queue does **not** copy `damaged_by_bosses`: damage-exclusion predicates
retain each recipient's own damaged-boss input. “no u” itself is the pair
predicate, not the damage-exclusion predicate.

The old [party producer](party-achievement-producer-0.117.0.md),
[composition grant](party-achievements-0.117.0.md) and
[State15 wire](party-achievement-wire-0.117.0.md) knowledge/source are retained.
Their original targets remain explicit. The new ordinary-history route does
not undo #157 and does not establish current equivalence of every wire,
server, account-I/O or notification dependency.

## Boss Hunter counter

The local distributor's `145b64379..145b643a3` and remote callback's
`145b46949..145b46972` process the existing **16-byte boss equipment/death
records**. Each record whose killer slot differs from the recipient's slot
passes the same `Game+c8f == 0` gate. It calls the established equipment-roll
interface and then increments `Game+7b8` with wrapping u32 arithmetic. The
killer's separate lethal/death path already owns its own increment.

The current state builder reads `Game+7b8`; existing source `boss_kills()`,
`terminal_counts()[3]`, `NativeState.words_70[3]`, per-recipient checkpoints and
`Save::apply_run_counts` supply the terminal/account route. The retained Boss
Hunter source definition uses account statistic selector3 and threshold100.
`HeroState::swap` swaps `boss_death`, so the reconstructed counter is private
per hero: one killer's increment does not automatically credit the others.
`distribute_party_rewards` already loops the correct equipment recipients under
`!game.abandoned`, and now performs the corresponding wrapping count increment once per admitted
event, even with empty loot or no matching loot lookup. Its later
`game.dead` return belongs to experience/gold distribution and must not absorb
boss-history/counter credit.

## Evidence and validation limits

Run the non-compiling native/source checker:

```sh
python3 -B scripts/check-party-boss-credit.py
```

It verifies **11 exact original ranges / 8,382 bytes / 1,878 instructions**,
all ten retained current Ghidra receipts and the explicit pre-repair source
observations at their recorded pre-repair Git commit. Its scratch-only original-instruction fixture executes **324
counter cases and 216 history cases** (540 total), covering killer/departure
admission, down/dead inclusion, empty/multiple batches, existing history
prefixes, exact event metadata/order and wrapping counter overflow. The
[counter/history result](evidence/0.120.2/party-achievement-share/static-check.json)
retains both original audit omissions; that historical receipt is not rewritten
as repaired-source validation. Allocation branches are excluded by preallocated vectors. The
existing equipment function is an explicit argument-recording callback seam;
loot/RNG behavior is not exercised.

The separate [source check](evidence/0.120.2/party-achievement-share/source-check.json)
binds eleven reviewed files and traces the lethal record/active-slot producer,
shared queue ownership, recipient admission/order, State pair/enriched/damage
fields and existing host/guest account consumers. Rust syntax parses for
`bosses.rs`, `coop.rs` and `gameplay/mod.rs`; this does not compile the source.
Five authored regressions remain uncompiled/unrun: either killer's actual
lethal-hit path with a downed recipient, ordered/duplicate/abandonment admission,
and synthetic recipient State history through account grants, first dates,
notifications and plaintext Save round-trip; counter killer/abandoned/dead gates,
empty loot, wrapping and repeated drain; and synthetic recipient counts through
Boss Hunter grant/date/Save and repeated settlement checkpoints. The retained composition-only
account regression now uses the existing guest settlement entry instead of the
guest live-tick early return. No transport validation is exercised by the
synthetic State consumer fixture. No further #195/#196 source omission is identified.

Two compatible query batches reused and extended one shared current full-PE
Program. The decompiler's inferred ABI/types, disabled analysis and reported
large-owner overlap/type warnings remain limits. The curated original bytes
and bounded replay establish only the selected field/branch/copy contracts;
no whole large function is certified by its pseudocode.

The bounded current module registrations apply only to
`custom-game-game-mod` and `custom-game-achievements`. Generic collection,
allocation, engine event, codec and save-I/O internals remain existing source
interfaces, without recursive engine reconstruction. No application compilation,
compiling Rust test, client/game/server/network execution, actual save/notification
delivery, rendering or controlled original/rebuilt comparison occurred. These
remain separate from the completed selected source/static repairs.
