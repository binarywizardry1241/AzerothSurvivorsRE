# Ahn’Qiraj Rifle in 0.141.1

The [bounded evidence](evidence/0.141.1/ahn-qiraj-rifle.json) uses installed
0.141.1, SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
It assesses claim `changelog:0.141.1:737de64a7a82f25e` under
[#6](../verification-needed.md#gap-6). The registered whole-image audit
remains bound to 0.141.0.

## Gear and appearance

The ordinary item resolver at `0x145e33ea0` decodes Hunter item 103830 as
weapon index 0, rarity 3. The 144-byte descriptor at `0x147728918` still
contains the shared bow subclass and inventory type. Its fourth display is
34484. The resolver reads the rarity-specific display and, on 34484 with bow
subclass 2, writes subclass 3 and inventory type 26. It retains weapon class
2, sheath 0, paperdoll slot 17 and the same effect-selection and scaling path.
The other four displays in this Hunter row keep their bow metadata. The live
Armory descriptor and appearance projection share the corrected display and
type while retaining the historical input catalogs. The existing Armory and
item-template consumers select the localized Gun label from class 2, subclass 3.

The installed `patch.MPQ` has the same rifle model and texture on displays
33826 and 34484. The latter selects SpellVisual 224 and rifle kits 161 and 167,
which select LoadRifle 106 and AttackRifle 49. The model has its muzzle particle
emitters on release animation 161. Visual 224 has no missile model of its own.
The existing engine selects the ranged visual from the visible item and uses
the ammo display when a spell supplies no missile model. For Auto Shot that
queues the bullet so the existing release key also starts the muzzle animation.

## Ammo and publication

The native run constructor resolves the starter outfit, overlays nonzero worn
IDs and then applies explicit appearance overrides, including zero. The
projected 19 dwords become `Game+0x60c`; slot 17 becomes `Game+0x650`.
The projectile owner at `0x145f97180` resolves that ID to the item descriptor.
Auto Shot 75, Multi-Shot 2643 and Aimed Shot 19434 publish bullet display 5998
for class 2/subclass 3 and arrow display 5996 otherwise, including the missing
descriptor case. Both use ammo inventory type 24. Other examined shots do not
publish this tail. The writer at `0x145f16880` selects flag `0x120` when ammo
is present and writes display then inventory type after the targets.

Solo entry and admitted co-op heroes capture the weapon kind from their
existing resolved appearance. Solo Again keeps the entry snapshot. The party
hero swap carries the weapon kind, so the shot uses the originating hero's
appearance. Both SpellGo ammo words are preserved through local presentation
and co-op serialization/decoding. The change uses the existing spell visuals,
projectile timing, damage and attribution paths.

The bounded instruction replay passed five Hunter metadata cases, five ranged
appearance cases and 28 ammo-selector cases. The ammo cases supplied a
descriptor seam and stopped at the writer call. The writer's flag and two
ordered stores were inspected separately. Pinned rustfmt parsed the changed
Rust files and the staged diff passed whitespace checks. The authored Rust
regressions, compilation, in-game aiming, muzzle and flight, damage comparison
and local/co-op parity remain open.
