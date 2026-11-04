# Ranked set bonus tooltip activation in 0.140.0

The installed `installed-game/AzerothSurvivors.exe` is 0.140.0, 151,521,280
bytes, SHA-256 `27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
This is the rendered bonus constituent of [#242](../verification-needed.md#gap-242).
The earlier [item-set publication](item-set-publication-0.121.0.md) owns the
item identity, metadata and bonus prose.

| Native range | SHA-256 |
| --- | --- |
| AS callback registration `0x140043646..0x140043652` | `07b28da836982c1fde5d569a4532887a38ace11d088dbd94af9507c050515bc0` |
| Engine callback thunk `0x142a2f310..0x142a2f3a1` | `0d603fcfa9f0646a6465dbc0c7d58ae4edff2801d7edbbdbb248efca2ee6cc4a` |
| Rank join `0x145e35360..0x145e3553f` | `6a93d1bb869a6038b2296a71ee8354aa81e9255145fc1288a8306c477da1123a` |
| Bonus check `0x145e34820..0x145e34ba2` | `53b713ffe93e05c40973d7575888ad5fb6f66c246b62a821c0165d115fadcc21` |
| Eight-piece selection `0x145e34f70..0x145e352aa` | `46a28148021737f2f293d9fda84337842d540bb51b724fdf20932dcb98a605b8` |
| Tooltip bonus loop `0x1427dc85e..0x1427dc99a` | `a8614b3fd7b8dda59a566d279d2b5c4dd88b4c82343ce6337c2c0297aac82e5c` |

The callback joins worn item IDs to exact ranked IDs, using rank zero on a miss.
Its predicate normalizes the Horde PvP tier nibble and checks only the tier.
Four-piece bonuses require at least four decoded pieces with nonzero ranks.
Eight-piece bonuses use the first tier in order 0, 1, 2, 3, 5, 7, 4 with
eight pieces and a minimum rank of three. Rank five controls empowerment.
An unsupported count or tier returns 2 and uses the stock count comparison.
The skill test gates either result before the engine chooses the green or grey
localized line.

The AS publisher supplies the entry gear and rank rows for local play and the
guest profile. The item-tooltip host reads the current worn IDs at tooltip
build time. AS bonuses use the shared ranked predicates. Member names, worn
count and stock DBC sets retain the existing tooltip readers.

Bounded Ghidra results establish both rank gates. PE instruction inspection
binds registration, callback arguments and the color consumer. The 31-byte
branch at `0x1427dc89c` (SHA-256
`8c47d11571509f197220e5255bc5034968a578697dfd3463c4012906a38f4893`)
passed 108 isolated cases across worn counts zero through eight, both
thresholds, all three callback results and both skill states. All seven
changed Rust files syntax-parse. Compilation, live tooltip behavior, guest
presentation and original/rebuilt parity remain unverified.
