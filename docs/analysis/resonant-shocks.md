# Resonant Shocks

The installed `installed-game/AzerothSurvivors.exe` is 151,493,632 bytes,
SHA-256 `6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This scoped evidence covers `changelog:0.141.0:ba5b9288f47bcd34` and
[#305](../verification-needed.md#gap-305). The
[0.140.0 Enhancement contract](enhancement.md#enhancement-mechanics-in-01400)
retains its original target and its historical three-rank target limit and 35%
damage rule.

The learned Shock scheduler reads the first tag-54, subtype-2 effect's rank
byte at `0x145f62de8`, converts it to `f32`, and multiplies by `10.0`. After a
successful base cast with a nonempty captured target list, `0x145f630b5` divides
the value by `100.0` and passes it with the first target and the full exclusion
list to `0x145efdd50`. The callee samples that target's interpolated position,
calls the existing eight-yard radius query, and takes the first result if one
exists. The iteration end at `0x145efdfb6` is exactly one eight-byte GUID past
the first result. The rank sets damage to 10%, 20% or 30% of composed power.

The callee applies the fraction at `0x145efdfbe`, before the hit-type split.
Earth and Frost Shock take their independent critical draw and direct hit/status
path. Flame Shock scales the same power by the duration ratio and tick factor
and installs its existing periodic row. The original base targets are excluded
on each pass. After the first pass the scheduler finds subtype 11 and compares
one random draw with `0.05`. On success `0x145f63336` invokes the same callee with
the same fraction and exclusion list. A repeat queries the actors again and
can select the same eligible secondary target.

The [cast path](../../crates/azeroth-survivors-re/src/gameplay/mechanics/enhancement.rs)
implements the one-result limit and the recovered rank multiplier. The
[runtime talent replacement](../../crates/azeroth-survivors-re/assets/talent-replacements-0.141.0.json)
supplies the current description to the
[talent menu](../../crates/azeroth-survivors-re/src/save/talents.rs). The menu
and cast derive their rank values from the same percentage per rank. All
fourteen locale catalogs carry the matching native description row. The stable
save key and rank cap remain in the retained 0.140.0 tree. The current 64-byte
effect record at `0x14770d310` matches its predecessor byte for byte.

| Current PE range | File offset | SHA-256 |
| --- | --- | --- |
| `0x145f62dd9..0x145f630d9` rank producer and first call | `0x5f621d9` | `69d5b85f242d335c00b2ef61702eff40163091bbb4f1becd32d0e625fe9713e3` |
| `0x145f6328d..0x145f6333b` Stormbound repeat | `0x5f6268d` | `f802b5b5c7e7a95e3e626b1abadcb43fde135bfc1a1439dee58237ec4e87e178` |
| `0x145efdd50..0x145efe5bf` Resonant consumer | `0x5efd150` | `f4986a9e2b14867b473d1d1d0751191e68c51c697b780ec2ac0555c32ac0bd67` |
| `0x145f5ad00..0x145f5ae82` radius query adapter | `0x5f5a100` | `ee03ab024a8164ee5c7893ceddc487ca16f44e09b69bfb5baeec1241a3d1d9af` |
| `0x14770d310..0x14770d350` talent effect | `0x770b910` | `83929592a55d3f9165d3301776ae7a5da2988e714cfd29e8f6152fdbc6aa6347` |
| `0x14770d350..0x14770d38d` tooltip template | `0x770b950` | `f92ab75df5506c1e1f854fd46b4d750dd022af968ff7c07070b685731e559953` |

The completed Ghidra query for the exact 2,159-byte consumer slice has Evidence
ID `ev_88d2d921a9faa0b02441f13f89f3f11ea3c3d5680bba20f7c88de2b8016bd669`.
Original PE instruction decoding resolves the Windows x64 argument order and
external constants omitted by the raw slice. Fifteen bounded instruction
replay cases cover the three rank fractions at five incoming power values.
The fourteen localized values,
serialized as sorted compact UTF-8 JSON keyed by locale, hash to
`3d5396518a5e22948f1fb8624b69f7a2fbc9fdfa402a3c161b85a8f2f0ae401a`.
The source check matched the descriptor, effect payload and all fourteen
translations to the PE. Rustfmt parsed the changed Rust files.
Compilation, runtime spell and tooltip behavior, and original/rebuilt parity
remain open.
