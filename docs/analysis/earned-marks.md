# Duplicate-inclusive earned marks

Selected EXE: `3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`,
146,721,280 bytes. Finding #237 retains the historical achievement/catalog
work in [verification-needed](../verification-needed.md#gap-237). This report
owns the changed Danger Money/Hazard Pay producer and recipient connection.
The [current proof](evidence/0.127.0/ranked-gear/earned-marks.json) binds exact
native ranges, constants, import identity, source consumers and the retained
current Ghidra recipient-snapshot query.

## Producer and wire contract

Boss reward owner `145c2f2d0..145c2f7c2` still increments pending base marks and
the private Game's base sum/maximum. It additionally increments a private u32
boss serial at `Game+81c`, wrapping naturally, once per eligible boss reward
roll. Every successful item queues a twelve-byte record containing its u32
item ID, that boss serial and the f32 base award. All successful drops from
that boss share the serial and original base amount, including delayed delivery.
The serial is independent of the post-clear shared boss counter and the boss
definition's identity; recurring bosses do not accumulate under one static key.

Current serializer `145d14a90..145d160dc`, selected tag13 branch
`145d14c3a..145d14ca7`, writes:

```text
u8(13), u32 count, count × (u32 item, u32 boss_serial, f32 base_marks)
```

The internal enum index is twelve; the wire tag remains thirteen. Tag20 retains
its distinct base-mark/missed-item shape. Guest collector `145b537e0` and filter
`145d0e000` retain only allowed class/zone item IDs, preserving order, repeated
items and boss serials. The attached base mark is nonfinite→zero, otherwise
clamped to [0,400], preserving native negative-zero behavior. At most sixteen
accepted records survive one message; the outer recipient admits at most
sixty-four for the zone lifetime.

## Actual recipient and achievement snapshot

Successful-item recipient `145babc90..145bacd5e` converts an already owned item
through the current rarity table `[1,2,3,5,8,6]` and admitted Heroic multiplier.
The ordinary Save recipient remains responsible for ownership, pity removal,
the spendable class balance and the lifetime statistic. Duplicate run credit
uses the actual quantized award, `floorf(amount * 10 + 0.001) / 10`.

The selected local/guest app context owns a separate duplicate ledger:

- Add each duplicate's earned marks to its run total, independently of balance.
- For an existing boss serial, add only this duplicate award to that boss entry.
- For the first duplicate from a serial, seed its entry with the carried base
  award plus this duplicate award.

New equipment grants do not add duplicate currency. Carrying the base/serial
through the queue prevents a later receipt from joining the wrong boss or
adding a boss's base multiple times.

Current snapshot owner `145bd1150..145bd15d1` selects the local or guest ledger,
folds its per-boss maximum, and publishes:

```text
run_marks      = duplicate_total + raw_game_base_sum
max_boss_marks = max(raw_game_base_max, duplicate_ledger_boss_max)
```

The current successful Ghidra query is reused from
[party-achievements-insane.json](evidence/0.127.0/party-achievements-insane.json),
role `recipient-snapshot`; its exact scalar merge at `145bd1422..145bd144d`
is independently replayed. The raw private State15 fields remain base-only.
The ledger belongs to the receiving account and does not need the host to know
the guest's owned collection or later mark purchases.

## Connected source and checks

`EquipmentDrops` owns the per-hero serial and typed pending grants. Hero swaps
retain it through the existing private equipment owner. Host publication and
the local Save-delivery path both drain the same metadata-bearing queue;
ordered run-loot history still exposes item IDs. `replication::EquipmentGrant`
and tag13 encode/decode preserve all three words, and the guest sanitizer
enforces the native item/budget/float boundaries.

`save::gear_rewards::DuplicateMarks` records the actual Save receipt amounts.
Local Mechanics adds that ledger only when projecting feat counters; State15
publishes the original base counters. The guest cache retains duplicate credit
before world bootstrap, copies it into the live replica, and overlays cached
settlement snapshots independently. New ZoneKey/leave clears the ledger with
the existing run-cache lifetime. Spending the class balance never edits it.
Both local and cached/live guest account consumers therefore receive the same
duplicate-inclusive Danger Money/Hazard Pay counters.

The existing non-compiling checker accepts the current proof:

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/check-gear-rewards.py --proof docs/analysis/evidence/0.127.0/ranked-gear/earned-marks.json
```

It passes **41 cases / 2,155 original instruction steps**, including tag13 raw
float-bit serialization, zero/wrapping boss serials, twelve-byte queue writes,
allowed-item/float/per-message and zone budgets, delayed duplicate grouping and
the current snapshot sum/maximum merge. Typed append writers, preallocated
vectors, C `floorf` and snapshot scalar inputs are explicit synthetic seams.
Source connection guards and Rust parsing pass. Authored Rust regressions cover
wire truncation, sanitizer limits, delayed same/different-boss receipts, spending
through a real star transaction, pre-world cached feats and live replica credit.
Those Rust cases have not been compiled or run.

No game/client/network/server execution or original/rebuilt comparison occurred.
Compilation, transport delivery, live achievement notices and parity remain
separate checks in [verification-needed #237](../verification-needed.md#gap-237).
