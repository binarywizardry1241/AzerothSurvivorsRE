# Consecration and Amulet of the Inferno in 0.140.0

The installed EXE SHA-256 is
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
This is the bounded [#143 repair](../verification-needed.md#gap-143) for
`changelog:0.140.0:09b7d43f6452dba3`.

The 120-byte Consecration descriptor at `0x1473b9a10` has spell 26573 at
offset `0x40` and raw power 144 at `0x44`. The spell descriptor supplies
the shared power before the run and equipped modifiers are applied. The
kind-3 dispatcher snapshots the resulting power into the ordinary ground
periodic row, including when Consecration is cast through a free route.

The generated amulet constructor starts at `0x145deab20`. It writes keyed
modifier 3 (+0.5 area) and modifier 4 (+1.0 duration) into the first two
64-byte records at `0x145deb4af..0x145deb51d`. The 12-byte key comparison
at `0x145deb525..0x145deb544` recognizes `consecration` and branches to
`0x145dec7b2`. That branch selects row index 2, bypasses the keyed modifier
0 (+0.5 power) write and joins the shared on-kill explosion write at
`0x145deb5c6`. The explosion retains the 0.3 maximum-health fraction,
7-yard radius, spell 11113 and two-per-second limit. The Inferno title is
selected at `0x145deb60a` and the resulting vector length is three.

The live amulet catalog projects this one deletion from the retained
historical definition. Equipped aggregation, rank scaling, reward prose and
temporary item tooltips use the projected rows. The Codex has a separate
localized snapshot. Its loader removes the same third line from the Inferno
entry after applying the locale overlays. The Consecration name and area,
duration, damage, explosion and rate-limit templates from all fourteen 0.140.0
locale payloads reproduce the four historical vectors exactly before removing
that line. The historical assets and fixtures retain their original bytes.

## Base spell picker

The picker wrapper at `0x1400d3cc0` initializes a default ability instance
and obtains level-zero Paladin stats through `0x145f3fbb0`. Both instance
power multipliers and the stat damage factor are 1, and the health bonus
is zero. The call at `0x1400d40b6` reaches the description body
`0x145f09130` via `0x145dd46a0`. Kind 3 applies the 1.4 ordinary scale
and its 0.5 weight to the 144 base power. The branch at `0x145f098a1`
scales the eight-second duration to 11.2 seconds, and the calculation at
`0x145f0a841` rounds the scaled count to 11 ticks. The template at
`0x145f0a972` receives 12.6 damage per tick (100.8 divided by eight raw
ticks) and 138.6 total (12.6 times 11). The numeric formatter
`0x145f0fb30` uses zero decimals for values at or above 9.95, yielding
**13** and **139**. The source picker expression carries those two tokens.
Its existing locale templates, radius, tick interval, duration and cooldown
are unchanged.

The declared constructor span `0x145deab20..0x145decf6f` was mapped from
the verified PE and checked with Capstone and a journaled raw-slice Ghidra
query. The slice SHA-256 is
`5a215aec56f55a5d1ed7744a68d3d1b45a502157b3350a1a2d33376301ea4369`,
and the completed pseudocode result SHA-256 is
`41e55359f2acd648316dc8cf75a7ee3962cf8364275e6d4d9157b1b478e7af73`.
The picker calculation and the fourteen Codex vectors were checked
against mapped PE instructions and locale data. Rust syntax parsing and
the source and fixture checks were static. Compilation, gameplay damage,
rank growth, tooltip execution and original/rebuilt parity remain unverified.
