# Class weapon glow selection

Target SHA-256: `22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
[verification-needed](../verification-needed.md#gap-235) owns the full source/presentation
finding. The [proof](evidence/weapon-glow.json) binds native ranges,
the successful journaled Ghidra unlock query and source helpers.

## Admission and saved selection

Native `145ab4db0` accepts these enchant IDs:

| Enchant ID | Selection | Admission |
| --- | --- | --- |
| 0 | None | Accepted |
| 1894 | Icy Chill | Accepted |
| 1900 | Crusader | Achievement `heroic:naxx5` exists |
| 803 | Fiery Weapon | Achievement `radiantarmory` exists |
| Other | — | Rejected |

The latter two branches search the sorted achievement string vector at Save
`+0xb0/+0xb8`, using the exact current keys at `146fc88f8` (12 bytes) and
`146fc8904` (13 bytes). These are recovered conditions, not assignments inferred
from display names or release notes. Weapon eligibility and menu visibility are
separate consumers; unconditional acceptance of 1894 at this interface does not
establish when a weapon displays it.

Getter `145aa57f0` scans the class-glow vector at Save `+0x1e0/+0x1e8/+0x1f0`.
It reads the first matching class and rechecks the chosen enchant through the
admission helper. Missing or locked choices fall back to 1894. An explicitly
saved zero remains zero.

Setter `145ab47f0` calls admission first. Failure leaves the vector untouched.
Success retains all other classes, removes every old row for the selected class,
and appends one record. Each native record is eight bytes: class u8 at `+0`,
padding at `+1..+3`, enchant u32 at `+4`. The separately checked current parser/writer establishes the textual
`glow|class|enchant` family. Exactly three fields are required; class parsing
accepts the native nine-class u8 domain and the four known enchant IDs. The
last valid class row removes all earlier class rows, then appends. A later
invalid row leaves the earlier selection intact. The parser retains known
locked choices; admission remains the getter/setter responsibility. The
writer formats class u8 and enchant u32 with a newline from each eight-byte row.
The [record proof](evidence/weapon-glow-records.json) replays4,077
original parser cases and55 writer rows with declared synthetic token/storage
interfaces; no actual save file is written.

Snapshot constructor `145af4ae0` repeats selection at `145af4d6e..145af4dc4` and
stores the result at snapshot `+0x20c` (`145af4fb7`). Fresh local login repeats
selection at `145b23380..145b23420` and stores it at App `+0x17e8`
(`145b2362a`), within the retained Config at App `+0x1648`. RSI is the App
receiver (`145b21eec`); `145b23528` forms that Config address. Thus the glow is
Config `+0x1a0`. Construction embeds the 448-byte Config at Game `+0x1b0`, so
the world publication load at `145bd042a` reads glow from Game `+0x350`.

The qualified synchronous local Again path preserves this captured selection.
`145b2d242` loads the eight-byte pair at App `+0x17e4` into XMM6; the glow is
its high dword. `145b2d433` stores the pair at frame `+0x104c`, relative to
temporary Config base frame `+0xeb0`, preserving Config `+0x1a0`.
`145b2d743..145b2d775` copies all 448 bytes to the constructor input and calls
`145bdcb10`; the [Again audit](evidence/again-entry.json)'s canonical
`constructor-embedded-config` selector carries them to Game `+0x1b0`.
The inspected start/constructor bodies do not call the Save glow getter or
admission helper, and no later direct frame store overwrites these glow bytes.
This is the bounded local Again ownership conclusion in that audit, including
its explicit external callback/transport limits; it does not cover cooperative
restart or separate profile/menu changes.

Preview owner `1402c04a0` gates all three held slots at `1402c07b7..1402c0834`.
World publisher `145bcfe80` applies the same policy at `145bd0426..145bd04e8`:
only native slots 15–17 qualify, and the displayed item must be nonzero.
Enchant 1894 requires a per-slot star byte of at least five. Other selected
nonzero enchants work at every rank. Zero emits no added enchant. The world
publisher writes the first visible enchant field, `0x105 + 12 * slot`.

Native effective-visual helper `1408fc4b0` reads byte `1485c6d3c`. When it is
zero, a valid authored base visual wins immediately. When nonzero, the helper
scans enchant IDs first and uses the valid base only if no enchant visual is
available. Setter `14078b7d0` writes CL to that byte; AS startup passes true at
`140057212/140057214`. The current full renderer query `14125a7e0` separately
observes that same switch. Thus a selected enchant replaces legendary artwork;
None emits no additional enchant and retains any authored base artwork.

## Source and checks

`armory_cosmetics::weapon_glow_unlocked`, `selected_weapon_glow` and `weapon_glow`
implement admission, fallback and per-weapon gates. The engine exposes the
recovered priority switch, which AS startup enables. `HeroPreview` carries three
enchant IDs through `LocalHeroLook`, `DressUpLook` and `PreviewSpec` to the existing
ItemGlows assembler. This separate embedding interface leaves the roster's
`CharEnumItem` format intact. Enchant selection participates in look equality.
Missing catalogs preserve the native base fallback; their arrival or replacement
invalidates the dressing bake so the requested enchant can resolve.
The class-keyed Save codec and getter/setter preserve these choices. Armory
shows None plus admitted Icy Chill/Crusader/Fiery Weapon choices, omitting locked
ones and showing the Icy hint only for that selection. Its account command
rechecks admission and uses the existing persistence owner. Preview selection
flows through the same save getter. Fresh run entry freezes the chosen enchant and
nineteen star bytes; local and cooperative world publication uses each displayed
weapon with its corresponding frozen worn rank. Unchanged local enchant fields
are skipped. Exact current translations for all eight consumed labels are
bound by [the locale proof](evidence/weapon-glow-localization.json).
The complete integration status remains in `CURRENT-STATE`.

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-weapon-glow.py
```

The non-compiling check verifies exact target/code/data and the successful Ghidra
receipts. Original-instruction replay covers **48 admission, 144 getter, 48
setter, 336 world-gate and 48 preview-gate cases / 15,614 instruction steps**,
plus **100 visual-priority cases / 5,318 instruction steps**. Cases include all accepted
IDs, unknown IDs, exact and near-match achievement keys, absent choices, explicit
None, locked choices and duplicate class replacement. Synthetic save memory,
preallocated vector storage, CRT memcmp, selected input records and catalog
lookups are explicit seams. No application, game, network or server executes.
The record check is `scripts/check-weapon-glow-records.py`; locale
validation uses `scripts/check-set-localization.py --owner glow`.
Compilation, rendered behavior and parity remain unverified.
