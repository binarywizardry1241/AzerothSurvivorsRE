# Tranquility healing credit

The installed `installed-game/AzerothSurvivors.exe` is 0.141.0,
151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
This bounded trace covers `changelog:0.141.0:8fdf49158695cf60` and the
Tranquility portion of `changelog:0.141.0:1d25a9296037f7e2` under #176.
It supersedes the credited-healing rule in
`changelog:0.140.0:713f1d1f551a5bca`. [Release notes](../CHANGELOG.md#01410) ·
[0.140.0 credit and pulse proof](class-balance.md#tranquility-and-seed-of-life)

The direct heal owner at `0x145f6ffd0` applies the Heroic healing factor,
clamps health and records the effective heal. At `0x145f70068`, a zero spell
ID bypasses both the Tree of Life and Tranquility effect paths. For a spell,
`0x145f70073..0x145f70082` separates nonnegative effective gain and excess.
The raw tag 32 branch fills absorb up to its fraction of maximum health at
`0x145f700db..0x145f70114`. The subsequent `ADDSS` at `0x145f70114`
adds effective gain and excess. The raw tag 33 scan and clear Seed of Life
suppression byte gate the addition to Game `+0x288` at `0x145f70158`.
The separate healing log gate still reads effective gain at `0x145f70168`.

The frame healing owner at `0x145f61700` checks the scaled HoT total at
`0x145f61e62` and computes effective HoT healing after subtracting the
regeneration allocation. At `0x145f61f3c` it takes the difference between
the scaled total and effective HoT healing. The raw tag 32 cap branch writes
absorb at `0x145f61fcd`. At `0x145f61fd5` the pool credit adds the effective
and excess HoT values, with the same raw tag 33 and Seed suppression gates.
The spell meter retains the effective HoT input at `0x145f61edd`.

The reconstructed direct and frame HoT paths use the same
`credit_healing` helper. It updates capped absorb separately and credits
effective healing plus excess, including while health and absorb are both
full. The direct caller still requires a spell ID and the batch caller
separates regeneration before allocating spell credit. Seed of Life impact
suppresses the pool addition. [Healing source](../../crates/azeroth-survivors-re/src/run_effects/healing.rs) ·
[Live callers](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs)

| Original VA span, end exclusive | File offset | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| `0x145f6ffd0..0x145f70298` direct owner | `0x5f6f3d0` | 712 | `b74f9eb4103ed07b110e85487ad6a115da25d810d0346a7b660c8a7ce3b0a7f5` |
| `0x145f61700..0x145f64092` frame owner | `0x5f60b00` | 10,642 | `003272a0ea1bd8d0f9eabf747332d184575eed5e36639d72a31ccb0dfc8cdd82` |
| `0x145f70068..0x145f70168` direct credit | `0x5f6f468` | 256 | `6729fb1c12ef771e251290d39032ca5c42abc52d1e0ccaf25197cda5e7db1291` |
| `0x145f61f3c..0x145f62028` frame credit | `0x5f6133c` | 236 | `d6bb9b2f36410b92a14d85c5c6e760216a4a951a432529cafa7189b8b6707d22` |

The direct Ghidra record is
`ev_ba013e43a6fe2fcf68a29a0b53d97af1f1b76accb1d0696d6eb2d950ca2c641a`.
The frame record
`ev_7dfe04b58dc48adb54f4a4890be88d4525cef9b5dca08aa68d2d01b024d83e82`
is present in the completed evidence export
`f53b675b06a0a42739c175a89710d72aaefc422249610d2e8ae1cfce29b8123e`
after the inline dossier exceeded the transport budget. Both raw slice
mappings were verified against the installed PE. The instruction trace
supplies the Windows register and branch semantics independently of the
raw Ghidra signature guesses.

`python3 -B scripts/check-tranquility.py --installed-credit` passed 576
isolated original-instruction cases for direct and frame credit. These
cover full health, full or absent absorb capacity, missing talents,
anonymous direct heals and Seed suppression. The checker also verifies
source connections. The updated Rust regression is uncompiled and
unrun. Compilation, gameplay, cooperative delivery and original/rebuilt
parity remain open. [Static checker](../../scripts/check-tranquility.py)
