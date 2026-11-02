# Special demon actors — 0.105.0

The selected EXE is SHA-256
`8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7`.
[verification-needed](../verification-needed.md) owns integrated status and gap #24;
[hit effects](demon-hit-effects-0.105.0.md) owns Soul Link, Voidwalker healing,
Soul Shards and the Felhunter periodic mark.

## Native contracts and source

The [current descriptors](evidence/0.105.0/pet-creation/definitions.json)
identify all eight special kinds independently of ordinary combat pets.
`run_effects/demons.rs` supplies their actor state, target selection, attack
interval, per-victim power/critical calculation and movement plan.
`gameplay/mechanics/demons.rs` publishes real creature creation/removal/movement,
routes attacks through the canonical hit/pending owners and captures the demon
entry plus attack attribution at the producer.

| Contract | Canonical native owner |
| --- | --- |
| Kind-specific selection, allocation pressure, pending lethal missiles, Felguard elite retention, Doomguard focused elite/boss selection | `14594cdc0..14594e0e4`, [shared helper manifest](evidence/0.105.0/power-scaling/pet-tick/helpers-manifest.json), role `special-target`; jump table at `146e7b754` |
| Army haste and Felguard recovery/execute timing | `14594e0f0..14594e482`, same manifest, role `cooldown` |
| Movement/attack order, surround offsets, Imp spread, Felguard Cleave/Brutal Momentum, Succubus control and echoes | [shared tick instructions](evidence/0.105.0/power-scaling/tick.asm), `145904e91..1459077f2` |
| Common melee base and source2 attribution | `14594c4e0..14594cce9`; [actor manifest](evidence/0.105.0/demon-actors/manifest.json) |
| Pet multiplier, stat17, active aura10, 1.3 factor, Voidwalker maximum-health/armor lanes, Felhunter missing-health/Agony lanes and crit | `145950e90..14595143d`, audit role `demon-crit` |
| Imp spell6996 and missiles at30 units/sec | `145950ce0..145950e84`, shared tick calls; pending constructor `14594ed10..14594f14a` |
| Imp/Doomguard descriptor and visual packet batch | `145950ab0..145950c36`, actor manifest |
| Infernal pulse stage before ordinary movement/attacks | enclosing tick `14590484d..145904b3a`, calling `14594f2b0` before `145904e91` |
| Doomguard launch marker, current bounce-row lookup and post-impact Shadow Cleave | `14594f150..14594f2ad`, tick `14590a838..14590acc6`, actor manifest; fresh REA/Ghidra evidence `ev_2d8b0b859186889a9b6c1748f8438cced2bf70af8658e13975c741a2514894f6` |

The selector scans no more than32 native query candidates. Ordinary targets
whose unconsumed missiles already cover their remaining health are skipped.
Other demons' current assignments contribute pressure; the current demon is
excluded. Bosses/elites admit larger groups. A retained target receives a
one-point preference. The eight distinct score branches use current player and
demon distance, health, Immolate/Curse of Agony/Corruption and nearby density.
The Felguard first retains or selects an elite/boss near the player, choosing
the lowest health fraction when replacing it. The Doomguard retains its focus
unless a higher-priority boss should replace an elite.

Army damage and critical chance remain separate from player Echo. Imp Firebolts
can include burning enemies, constrained by the shared one-second extra-missile
budget. The Felguard cleaves the full local query and doubles every third
swing; its captured secondary `Brutal Momentum` splits the admitted damage
under the existing meter contract. An echo recaptures `Demonic Echoes` and
rerolls each victim through the same native critical owner.

The critical owner reads equipped rows directly from Game778/780 at
`145950ecd..145950ed4`, summing stat17 at `145950f39..145950f40` and stat29 at
`1459510b9..1459510c0`. The [stat refresh](evidence/0.105.0/power-scaling/weapon/initial-stat-refresh.asm)
copies those rows into a separate scratch vector at `1458f9803..1458f9862`,
then appends temporary rows only to that copy at `1458f98b0..1458f98c2`.
Temporary stat17/29 rows therefore do not contribute directly to demon
critical power or chance; their ordinary numeric-stat effects retain their
existing stat-refresh path.
The Imp's additional power likewise sums equipped stat30 at
`145950d7f..145950e0e`. Echo gates sum equipped stat31, including the pulse gate
at `1459049fb..145904a8a` and melee gate at `14590741b..14590749c` in the shared
tick extract. The adapter combines those direct rows with the current talent
Config lanes, which the historical numeric compositor deliberately omits.

Imp and Doomguard casts each emit two packets with the same primary target:
the descriptor spell133/686 with an empty hit list, then visual6996/27383 with
the full selected hit list. This preserves the shared native batch helper.

The Doomguard captures whether a matching `shadow_bolt` bounce row existed at
launch. After each admitted primary impact, it rereads the current composed
gear row, queries within10 units of the victim's post-hit position (including
a killed victim's retained row), and immediately hits the requested number of
other enemies. These are source2 `Shadow Cleave` attacks with the original
launched power times the current bounce fraction, critical=false, and visual
spell27383. They have no new missile delay or critical draw and cannot bounce
again. The pending context retains the demon descriptor even after despawning.

## Static checks and limits

`python3 scripts/recover-demon-actors.py --check` verifies the complete
selected EXE hash and exercises unchanged original instructions in Unicorn:
144 selector cases,128 per-victim power/critical cases,8 Doomguard
post-impact bounce cases and2 Imp/Doomguard visual batch cases. The selector uses
the actual PE jump table and constants; its query seam supplies explicit
ordered candidates. Critical cases use the complete native helper, original
Win64 argument registers and shared RNG state. Recorded outputs are
[target vectors](evidence/0.105.0/demon-actors/native-target-cases.json) and
[power vectors](evidence/0.105.0/demon-actors/native-critical-cases.json).
The [bounce vectors](evidence/0.105.0/demon-actors/native-bounce-cases.json)
execute the original post-primary tail with current gear lookup, ordered query,
packet construction and canonical hit boundaries intercepted. They check
count, power, critical flag, source2, descriptor, caption and visual source/ID.
The [visual vectors](evidence/0.105.0/demon-actors/native-visual-cases.json)
execute the native two-packet batch helper with packet publication intercepted.
The script compares a separately traced semantic calculation against those
native outputs. Source tests consume the same native vectors; they are present
but have not been compiled or run. The installed `rustfmt` parses the changed
Rust source successfully.

Finite instruction vectors establish these contracts under their explicit
engine seams. They do not establish live terrain/navigation, visual packets,
client animation, audible behavior or original/rebuilt parity. No compilation,
compile-based test or game process was run. Initial army composition, summon
proc/gate ordering and Infernal landing belong to the separate lifecycle path;
greater demon spells use their own spell-derived owner. Their integrated
completion is reported in the source/verification registers rather than inferred from this helper.
