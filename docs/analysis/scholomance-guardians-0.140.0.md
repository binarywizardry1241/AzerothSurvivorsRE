# Scholomance Guardian actions in 0.140.0

The installed EXE SHA-256 is
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
Begin at `0x145faf075..0x145faf09c` selects the explicit enemy indices for
zones 10 and 12. Its four-slot loop at `0x145fb0060..0x145fb0175` selects the
keyed point, samples ADT, WMO or map fallback, and sets the 20-second lair
deadline. Scholomance uses enemy indices 6–9 and positions (102,148),
(102,186), (158,186) and (158,156), supplied by the
[current zone data](scholomance-entry-0.140.0.md).

The exact entry selector at `0x145db9020` maps the four signature headers
at `0x1473bf490..0x1473bf570` (SHA-256
`f467b8dd15bae1a97882639949c5355471e0efaa27ea76977b46d4929c36e0d8`).
Each has two moves, with no alternate list or phase. The eight 56-byte
move records at `0x1473be7c8..0x1473be988` hash to
`c31f578418f73920b3a9bf5081ede7d1a6ee69e8e6de59a0bdd96aefc9631b1f`.
The current action jump table is at `0x147afabf8`.

| Guardian | First move | Second move |
| --- | --- | --- |
| Risen Construct (10488) | Spell 15284: 9.5-yard 90° cone, 0.96s windup, 1.5× damage, 6s repeat | Spell 20549: following 7-yard circle, 1.2s windup, 1.3× damage, knockback speed 12, 10s repeat |
| Necrofiend (11551) | Spell 745: aimed 5-yard circle, 1.2s windup, 0.4× damage, 2s root, 12s repeat | Spell 6917: 5.5-yard impact, 1.25s windup, 1.3× damage, 6s repeat |
| Spectral Tutor (10498) | Spell 686: 3.5-yard impact, 1.4s windup, 1.3× damage, 6s repeat | Spell 16583: source-centered 8-yard impact, 1.3s windup, 1.4× damage, 10s repeat |
| Scholomance Dark Summoner (11582) | Spell 686: 3.5-yard impact, 1.4s windup, 1.3× damage, 6s repeat | Summons three ordinary enemies, 16s repeat |

Tag 35 writes the root duration to hazard +0x7c at `0x145f71993..0x145f71a7c`.
The current impact loop keeps the last qualifying root in the recipient's
damage batch and calls `0x145f74160` after damage. The helper scales the first
five accepted roots by 1, .8, .6, .4 and .2, starts an eight-second refusal on
the sixth, and uses the later of the old and new deadlines. It sends targeted
SpellGo, roots only on an absent deadline, and unroots on expiry. The
co-op hazard gate at `0x145f6503b..0x145f6517a` compares the source actor's
selected hero with the active recipient, with missing-source fallback to
slot zero. The co-op swap at `0x145e484d1..0x145e484e3` and
`0x145e4883d..0x145e48852` retains deadline and diminishing state per hero.
The rebuilt Guardian signatures use the existing warning, hit and spawn
owners. Its new root arm uses the same hazard batch and recipient-specific
PlayerMover state.

Ghidra dispatcher results
`ev_6277408c8857f39309e6305936524247ea95b211d35edef8b067a1c97b52abdf` and
`ev_564715a59dc2cf9aada1b6d2fb372de0a5480557f436e213e1ee0c82f283b220`
bind raw slice SHA-256
`f936858e2a5a3e5da3b114d270250bb5aac561ef31b0b24da35bdc6ffe88ce8a`
at file offset `0x5f6d560`. Original PE instructions supply the external
jump table and recipient edges. Bounded checks passed the four selectors,
eight move records, four point/index rows and thirteen root and expiry cases
with packet producers intercepted. Rust syntax and whitespace checks passed.
Compilation, warning visuals, live co-op delivery and original/rebuilt
parity remain open under [#89](../verification-needed.md#gap-89).
