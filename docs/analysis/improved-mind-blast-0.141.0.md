# Improved Mind Blast tooltip in 0.141.0

The installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This assessment covers [#34](../verification-needed.md#gap-34) and
`changelog:0.141.0:30f289e99809b166`. The
[0.140.0 modifier recovery](class-balance-0.140.0.md#mind-blast-power-cooldown-and-descriptions)
retains its original evidence.

The five-rank `imp_mind_blast` descriptor points to a template with two
`{v}` substitutions. Both effect records still target `mind_blast` with
the same 6% scalar at offset 32. Their modifier lanes are 1 for cooldown
and 0 for damage. After resolving the spell-key pointer and mapping raw tag 73
to source tag 31, both records match the retained modifier definitions.

The [shared talent catalog](../../crates/azeroth-survivors-re/src/save/talents.rs)
formats the existing scaled effect for ranks 1–5 as 6, 12, 18, 24 and 30.
The [shared detail view](../../crates/azeroth-survivors-re/src/talents.rs)
substitutes both occurrences and supplies current and next rank text to the
talent menu and the in-run read-only overlay. The unlearned row previews
rank one. All fourteen locale catalogs carry the matching native template.

| Current PE range | File offset | Bytes | SHA-256 |
| --- | --- | ---: | --- |
| Descriptor `0x14770ba30` | `0x770a030` | 112 | `38c517c1ca97abde5c0a488f7047f3c10615caf1836ad8064b0a17bce5216c07` |
| Effect records `0x14770b010` | `0x7709610` | 128 | `1cda68632454e9d684e685bf2ef55dbae669d551b38bf95842e06b24d52684f9` |
| Template `0x14770b090` | `0x7709690` | 68 | `0d04c29f83f3c01d11691614a9c714bc1a389752c8a3b769b59cd5700a415558` |
| Locale descriptors `0x147ae1870` | `0x7adfe70` | 784 | `ecdc0eec7b39e5fb07ced1d60317d820fc9ca39320184a44db36a2a64ffed515` |

The fourteen template values serialized as compact UTF-8 JSON with sorted
locale keys hash to
`3032695f81930c1a354c4353bb2378f455b6766f8b1368526342c6d740fd7105`.
The static comparison checked both modifier records across all five ranks and
both substitutions for each rank in every native locale row. Rustfmt parsed
the catalog changes. Compilation, rendering and original/rebuilt presentation
remain open.
