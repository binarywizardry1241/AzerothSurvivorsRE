# Co-op discovery and Codex completion in 0.141.1

The inspected installed EXE has SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
This bounded review covers
`changelog:0.141.1:eaa7fb6599d2747c` (Every Bauble) and
`changelog:0.141.1:e9b58d2529ae6b7e` (guest Rockbiter).
The full coverage baseline and historical reports keep their own target identities.

## One membership for the Codex and achievements

The Codex page at `0x1400d0640` walks nine 144-byte class rows through the
initial pointer slot `0x148acbb68`. At `0x1400d0e2f`, it passes the class
ID from `+0x8c` to `0x145e1bbc0`. The builder joins each class's ordinary
spell pool at `+0x30/+0x38` to the talent-only spell list from
`0x145e1df30`. The latter scans three talent trees per class and adds
effect `0x29` keys absent from the class pool and earlier extras. Only
Rockbiter is added by this pass. The join at `0x146036c20` excludes
`healing_wave`, `lightning_shield` and `explosive_trap`. The spell rows
then produce their exact `legendary:` discovery keys.

The page accumulates the displayed length and the number with a saved key
at `0x1400d0e81..0x1400d0f39` and `0x1400d1a80..0x1400d1b3a`.
The corresponding account list constructor `0x145e196c0` uses the class
builder through iterator `0x146050f80`, together with the 23 jewelry and
16 shared amulet records. The resulting 141 unique keys consist of
102 legendary entries and 39 shared entries. Compared with the retained
0.105.0 display, Kill Command replaces Explosive Trap, Stormstrike replaces
Call of Flame, Rockbiter is added, and the two excluded Shaman entries are
removed. The visible Catalog uses the same live legendary membership and
the existing current amulet constructor, art, locale and effect text for
the three newly supplied rows.

The descriptor constructor stores 50 and 100 as percentages at
`0x145e5f2ab` and `0x145e5f4ed`. The ordinary evaluator calls the list
constructor at `0x145e6af52` and checks Seen presence for every listed key
at `0x145e6af8a`. The threshold at `0x145e6ba71..0x145e6bab5` rounds
`count × percent / 100` upward, leaving 71 for Jeweler's Eye and setting
141 for Every Bauble. The reconstructed account adapter now intersects
the saved map with the live Codex keys. Existing save parsing keeps valid
historical or unknown keys and still maps Explosive Trap to Kill Command.
The normal startup grant path evaluates existing complete saves and can
award Every Bauble without a new discovery.

## Guest discovery

The wire-14 guest arm in `0x145edc070` requires its admitted zone, then
calls `0x145e3e780`. That wrapper builds the same sorted Codex key vector
and passes it to `0x1460563f0`. The filter checks quality up to 4 and admits
up to 32 accepted rows per packet. It first uses its fixed class checks
and falls back to exact lookup in the Codex key vector. The fallback is
the acceptance path for `legendary:rockbiter`. The fixed checks also admit
`legendary:healing_wave` and `legendary:lightning_shield`, independently
of achievement eligibility. The enclosing dispatcher caps cumulative
accepted rows at 400 per zone.

At `0x145eddc8f` the receiver delivers the accepted rows to
`0x145ed30c0`. This excludes Tester, applies new/higher discovery rows
and, only when a row changed, runs the dated account grant
`0x145e6dbd0` before account delivery. The rebuilt guest follows the same
order and delivers earned notifications through the existing live or
pending event queue.

The reward writer at `0x145ff153b..0x145ff16f6` appends each displayed
jewelry or amulet offer's key and quality to the active hero's vector at
`+0x8d8`. The host recipient iterator at `0x14603ad50` selects assigned
peers with their Sync byte at `+0x89d` equal to 1. The host seats the
recipient and takes the Seen vector in `0x145f2ea40`. It then sends a
single nonempty vector at `0x145eb952b..0x145eb9606`. The wire-14
serializer at `0x145e55811` writes that vector's length and all its rows.
The 32-row limit belongs to the receiver. The rebuilt host now drains
each synchronized guest's pending reward discoveries in offer order,
including repeat offers. It retains the same one-vector publication even
while local character display data is unavailable.

## Static checks

| Preferred VA range | SHA-256 |
| --- | --- |
| `0x1400d0640..0x1400d2845` | `5dcb04ec2ac66bd57c9d9469ff9e78408077757fa4add030ac516b33331c003d` |
| `0x145e1df30..0x145e1e42b` | `c31b805ea5b0737fa57f003499660b260b481cd0a1f26e1d065eab3664fcc151` |
| `0x145e3e780..0x145e3e861` | `ad00f9c42c97026c346b0654b80e4a963f60ec0ed79b54e545d3241fc228abdb` |
| `0x145e55811..0x145e5586d` | `a68281ef5fc3f44f2f5eef8e2743d4827be4ad7c935ddb8636048dc91a6cb5a3` |
| `0x145e6a770..0x145e6c5b2` | `ff6fc8d88c9a1d9f67ffbc65edf2d5aa493599d8e6a1096ed505e07d6cb9e558` |
| `0x145eb9521..0x145eb9680` | `cf62d00aa56f61429e019b08e524f2d57c77187b8cfa65251f011faa7eb85b80` |
| `0x145ed30c0..0x145ed32ea` | `16efb0521e901cf27a603dae00117486ef9eb943ec01c93afb356f999a188d88` |
| `0x145f2ea40..0x145f2ee6c` | `20b554ed14a967263c26d8a198bbed7a6aa7190ca704d1bae7d15ef628f0d9c2` |
| `0x146036c20..0x1460370c8` | `182def8fa2603737bbfde1614fb67fa5a97448619eeae56833279d73c7204b9b` |
| `0x14603ad50..0x14603aeeb` | `44ca2311bb68b2f3b084995145a415bbbae092dbe19470cb0be29b9f9d88d970` |
| `0x146050f80..0x14605122d` | `73362bca1af6ac8f9698f7556340992101556d2d44aa617c7539eee5a6553ee7` |
| `0x1460563f0..0x146057cf7` | `d25184eee40dc5b76ca2e787439fc338f0d491226ba0f9340988a4e50af2fe29` |

Ghidra receipts for the key iterator and guest wrapper use the exact slices
above. Their saved result SHA-256 values are
`e9edb6fc71a3545c45138b314f31d7e8bc5f02234ee5deefa576ad7c7e6b5ecd`
and `a2656991c5b69d8616ea495494251de3ab6bed541b8593d1253425e37f2c198d`.
The direct PE references provide the table inputs and external calls.

```sh
PYTHONPATH=runtime/armory-recovery/python-libs python3 -B scripts/check-coop-seen.py
```

The check joins the nine class pools, native talent extras, shared key
records and rebuilt data. Isolated instructions pass both percentage
thresholds, 149 one-key guest cases and two mixed packet boundary cases.
The replay supplies the sorted key vector and substitutes comparison and
deallocation seams. Pinned rustfmt parses the changed Rust files. The
source regression covers a save that is numerically over the old threshold
but missing Rockbiter, and completion after its guest discovery.
Compilation, execution of the Rust regression, guest delivery, rendering,
account file behavior and original/rebuilt parity remain open.
