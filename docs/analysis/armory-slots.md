# Armory equipment slot producer

The installed target is 0.112.0, SHA-256
`dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a`.
This report resolves the slot-vector producer left open by the
[current appearance recovery](armory-cosmetics.md).

Current Armory rebuild `1400fe650` constructs the vector rather than receiving
an unrestricted list from the serialized backend payload. After reading the
selected class record and its baseline outfit, it initializes a byte iterator
at `[145dbc290,145dbc29c)`, supplies the selected class byte and account save,
and calls collector `1400853e0` at `1400febbd`. The exact candidate order is:

`Head0, Shoulder2, Back14, Chest4, Hands9, Wrist8, Waist5, Legs6, Feet7, MainHand15, OffHand16, Ranged17`.

Collector `1400853e0` preserves that order while invoking predicate `1400f8890`.
The predicate first calls class-slot provider `1459962d0`. That provider checks
the nine admitted classes, walks their eight armor entries plus native weapon
count, constructs the rarity-zero item IDs and compares each metadata slot.
If the class has no ordinary item for the slot, the predicate admits Head0 for
any of `feat:vancleef`, `feat:hakkar`, `feat:cthun`, `feat:azuregos`, or Back14 for
any of `feat:nefarian`, `feat:nou`, `feat:herod`. Membership uses the account's
sorted earned-key vector through `1458dd750`.

The resulting vector moves from the collector output at frame offset `+380`
to the view input at `+90`; that input is passed through `140288ec0` at
`1400fed3e`, then `1400f61e0`, to retained equipment viewport `14028dc50`.
This incoming producer establishes Back membership and placement independently
of the downstream row consumer.

Source now walks that exact native candidate order, admits ordinary rows from
the current class slot domain, and admits the extra row from the already
validated earned cosmetic grants. Back appears third when any cloak is earned.
Selecting its empty equipment row clears an old ordinary item selection; its
Look footer offers only earned cloaks and publishes the existing Gear command.
Native empty-row art maps slot14 to the **Chest** placeholder; that behavior is
preserved. Hunter's slot17 uses the native Ranged placeholder. The current locale
catalog supplies `slot.14` for the Back label. No new Back art asset is needed.

`python3 -B scripts/check-armory-slots.py` checks both class-pointer table
copies, all415 connected ordinary item slot fields, 4,864 native class-slot calls
(all256 byte classes by19 slots), and1,792 complete ordered vectors (nine valid
plus five invalid class inputs, each with all128 achievement masks). It executes
the original collector, predicate, class guards/iteration and sorted achievement
membership. [Cases and body/table hashes](evidence/armory-slots/cases.json)
and [Ghidra identities](evidence/armory-slots/analysis.json) bind the proof.

The ordinary metadata seam supplies only slots from current armor and weapon
records. Its grammar is independently recovered in the canonical
[ordinary item constructor](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.112.0/balance/ordinary-gear-reader.ghidra.c);
item formatting, names and effects are not executed by this check. Allocation,
Vec growth and byte comparison are host seams. The rebuild producer and viewport
forwarding are statically recovered. This runs no compiler, game, filesystem,
rebuilt Rust, rendered interface or original/rebuilt comparison.
