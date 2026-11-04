# Scholomance translations in 0.140.0

The installed EXE SHA-256 is
`27c8df53c87e38a98d474bf7106d2444e11e7634ca70dbffc5c2b0aecb894fd9`.
The [locale selection](evidence/0.140.0/scholomance-locale-selection.json)
records the fourteen payload ranges, the selected keys and their exact value
hashes. The 56-byte locale descriptors at `0x147ae68e0` retain the source's
language order, from English through Korean. Each descriptor binds the exact
UTF-8 JSON pointer and length. The initializer at `0x145e26a80` allocates fourteen 48-byte maps and
passes the exact descriptor interval to `0x146063570`. The ordinary lookup
at `0x145e7cc80` selects the global or thread-local language, searches its
48-byte map first, and on absence searches map zero (English). A matching
empty string still returns its pointer and length; neither map matching
returns null for the caller’s literal fallback. The current recipient translation routine at
`0x145e7b0c0` recognizes the fourteen two-byte codes and uses a 48-byte map
stride. It compares explicit recipient language with the current global or
thread-local source language before looking up a translation. The existing
[catalog loader and external override parser](localization-loader-0.119.0.md) retain their
prior proof for loading and merging external overrides.

The source imports 166 exact values per language, covering the zone card,
ten enemy labels, five boss names and yells, the Risen Guard name, the
identified encounter warning templates, Tier 0.5 names and effect text, and
the related progression and glow text. The same key set is present in all
fourteen source catalogs. Named placeholders and printf arguments in the
selected translations agree with English; the text values are unchanged
from the executable. Existing source uses the zone, enemy and boss keys in
menu and addon projections. Gear, achievement and warning strings are
available to their owners as the respective gameplay paths are recovered.
This import neither fabricates triggers for translated warnings nor claims
Tier 0.5 equipment and achievement rules.

The non-compiling check matched 2,324 values against the installed descriptor
payloads and confirmed that the fourteen complete source catalogs have the
same key set. The Rust catalog test now checks equal membership and explicit
Scholomance keys. Remaining work is to prove and connect the exact warning,
set and progression formatting inputs through their native consumers. Rendered
text, override I/O, compilation and original/rebuilt presentation are unverified.
