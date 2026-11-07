# Bounded Heroic contracts

Installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [manifest](evidence/heroic-native/manifest.json) binds three durable
Ghidra raw-slice queries, original instruction/data ranges and actual source
receipts. This is bounded native recovery for the new `heroic.rs` owner, not a
complete difficulty implementation or proof of weekly behavior. Supplied items
[#219 and #221](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.121.0.md) retain their wider obligations;
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own permanent findings and current status.

## Source boundary

Source was inspected before native expansion. Existing
`crates/azeroth-survivors-re/src/run_options.rs` constructs the four percentage
controls, and `run_mods.rs` calculates their weighted difficulty/reward cap.
`save.rs` and `menu_state.rs` retain that modifier state. Their historical
[0.109.0 recovery](run-options.md) remains valid evidence for that target;
it is not the new Heroic rank/affix contract. No Heroic rank-name/selector owner
is implemented in those inspected source connections. The benilla engine's
allocation, localization and string-formatting interfaces are supporting
boundaries; no generic-engine reconstruction follows from this observation.

## Rank labels and domain

Current diagnostic `crates/wenilla-rogue/src/heroic.rs` at `0x146fca015` has
instruction-verified owners `0x145abfe70..0x145abff78` and
`0x145ac00b0..0x145ac026c` (half-open ranges). The latter owner consumes the low
byte of its rank argument:

| Rank | Exact bounded behavior |
| --- | --- |
| 0 | Looks up the six-byte `Normal` key at `0x146fca038`; a missing translation uses that original key. The result is copied to an owned string. |
| 1–5 | Looks up the six-byte `Heroic` key at `0x146fca03e`, with the same fallback. It selects bounded slices `I`, `II`, `III`, `IV`, `V` at `0x146fca044..0x146fca04d` and supplies both strings to the existing packed formatter. |
| 6–255 | Takes the explicit bounds-failure call at `0x145ac0265`, with bound 6 and the Heroic source Location at `0x146fca050`. |

The formatter descriptor is exactly five bytes at `0x146fca068`. The static
fixture checks its input records; it stops at the generic formatter interface.
Thus it proves the selected label/rank arguments and fallback/bounds branches,
not the complete formatter implementation or rendered output. These helper
bounds do not prove every menu/save/co-op admission clamp.

## Affix count and selector arithmetic

Owner `0x145abfe70` returns a byte vector, using the exact three-byte table
`[0, 1, 2]` at `0x146fca012`. For rank `h` and unsigned 64-bit selector `s`:

```text
h < 3:   []
h = 3–4: [s mod 3]
h >= 5:  [s mod 3, ((s mod 3) + ((s div 3) and 1) + 1) mod 3]
```

Within the displayed rank domain 0–5 this supplies no affix below Heroic III,
one at III/IV and two distinct IDs at V. The pair order covers all six ordered
pairs over a six-selector cycle. This is an exact arithmetic result; it does
not establish the selector's calendar origin or assign the three IDs to
Bolstering/Sanguine/Explosive effects without their actual dispatch consumers.

The current input connection is independently decoded at
`0x145bdcb8a..0x145bdcc38`. The caller retains its input state in `r15`, reads
rank from `state + 0x1bf`, calls `0x145a9c190` with the pointer/length pair at
`state + 0x120/+0x128`, then passes its returned value plus seven times
`u32(state + 0x19c)` to the affix selector at `0x145bdcc33`. Arithmetic wraps
at 64 bits. The input helper's semantics and all upstream field writers remain
pending. Calling it a weekly timestamp, week number, zone hash or RNG seed is
not yet justified. The raw caller's decompilation has an external stack-probe
modeling limitation; exact original instruction bytes govern this connection.

## Validation and next static work

The [static result](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.121.0/heroic-native/static-check.json) records
**174 affix-selection cases**, including 64-bit boundary selectors, and
**16 rank-name cases**, covering translation hit/miss, all displayed ranks and
two rejected ranks. It checks **7,569 original instruction steps**, exact
original bytes and independent Capstone boundaries, three query subjects,
plans/journals/results and source receipts. Synthetic allocation/growth,
localization, string-copy and formatter seams are explicit; no OS code or
reconstructed source executes.

Reproduce from the checkout with the existing project dependencies:

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-heroic-native.py
```

The manifest retains three precise recovery selectors:

| Selector | Next static action |
| --- | --- |
| `HEROIC1210:seed-producer:0x145bdcc01` | Recover the `0x145a9c190` interface and writers of the pointer/length and `+0x19c` fields; establish weekly origin/epoch and any zone coupling. |
| `HEROIC1210:affix-consumer:0x145bdcc33` | Follow the returned vector through run initialization to the `game/affixes.rs` owner `0x145c28900`; establish ID/effect dispatch and lifetimes. |
| `HEROIC1210:rank-producers:state+0x1bf` | Recover current save/menu/co-op rank writers and admission, preserving the distinction between formatter bounds and accepted gameplay inputs. |

Only `custom-game-heroic` qualifies for this bounded native registration. The
affix-effects module, difficulty UI, full gameplay state and save/network
consumers require separate proof. No compilation, compiling test, game/client/
network/server operation, installed save/settings mutation or controlled
original/rebuilt comparison occurred. Actual source delivery and parity remain
unverified.
