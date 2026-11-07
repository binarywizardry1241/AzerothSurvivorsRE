# Again restart admission and retained selection

Installed target **0.108.0**, SHA-256
`dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b`.
The [manifest](evidence/0.108.0/terminal-restart/manifest.json) binds five
original PE ranges, two fresh REA/Ghidra imports and the current command table.
[verification-needed](../verification-needed.md) owns the remaining scope of gap #9.

## Native ownership

The command dispatcher is `1458b4c80..1458b6538`. Its current relative table at
`146be7534` sends **command 6** to `1458b4eee`; **command 11** reaches the
separate Pick mutation at `1458b4f92`. These addresses were independently
resolved against the current server-return caller and current table bytes;
the historical 0.107.0 addresses were not rebased as proof.

Again first calls result persistence (`1458b18b0`), takes the game option from
server `+10`, and writes its absent tag **2**. If the old option was absent,
it returns. Otherwise it moves the old game into local storage and scans
`b0`-byte connection rows in order, admitting the first nonzero active byte
at `+a8`. With no active connection it destroys the moved game, without a
replacement or logout. The native absent-game action does not enter the picker.

The active path optionally sends the old-player packet `17e`, collects old
world object identities, sends their destruction, and calls replacement
factory `1458b7220..1458b7b06`. That factory clones **retained entry inputs**
from the server's stored configuration; it does not issue command 11 or run
the picker name-normalization path. Missing retained configuration (`+f18`
equal to `-1`) yields an absent replacement. The factory also clears its
per-run delivery checkpoint words `+10a8..+10df` and flag `+1162`. The caller
resets delivery vectors and installs the replacement only when present.

The retained constructor also advances server RNG state with
`state * 0x5851f42d4c957f2d + 0x14057b7ef767814f` (wrapping u64), and owns
terrain-cache admission and further game/packet constructors. Those dependencies
are observed, **not certified as source-equivalent by this repair**. Complete
construction, RNG consumption, packet/error lifetimes and external/indirect
ownership remain #9/#41. Missing config is an absent game, not evidence for an
invented retry/error dialog.

## Source correction

`gameplay/terminal.rs::input` previously sent custom Again through
`MenuState::begin_enter`. That calls `commit_enter`, which can replace an
invalid editable name, then calls `commit_pick`, increments the save revision
and queues another full Pick save. That is the picker's command-11 side effect,
absent from the recovered native restart path.

The custom terminal now calls `MenuState::begin_restart`: it requests entry
without repeating name normalization or Pick persistence. The stock frontend
keeps its existing addressed GUID/zone route. An absent mechanics option now
returns before terminal teardown or picker entry, preserving native command 6's
no-op. Result persistence and final-message flushing retain their existing order.

The authored in-memory Rust regression preserves saved Pick bytes, editable name,
save revision, pending saves and the original entry deadline on repeated restart
requests. It has **not been compiled or executed**. This change does not certify
every retained field, constructor failure or live client transition.

## Static verification

From the repository root, using an existing local Unicorn installation:

```sh
python3 -B scripts/check-terminal-restart.py \
  --python-libs runtime/tool-state/python/armory/python-libs
```

The checker rehashes the installed target and curated code/text, verifies both
Ghidra input digests, the distinct command destinations, three native calls and
the live source routes. **134 bounded original-instruction cases pass**:
three game-option cases, all 127 active-connection masks for zero through six
rows, and four poisoned checkpoint states with all other server bytes preserved.
Replay stops before callees, permits only scratch writes and rejects native
calls; no allocator, filesystem, OS, packet sender or game executes. The checker
does not execute Rust or the complete factory. Both changed Rust owners parse
with the project rustfmt tool and child traversal disabled; Python parsing and
the focused whitespace check pass.

The Ghidra raw imports omit external data/callees and use a generic ABI.
Original PE instructions establish the Windows registers, fields and command
table; pseudocode is a navigation aid. The full command dispatcher import alone
cannot recover its missing-data jump table, so the retained Again query begins
at the independently verified command-6 branch. Compilation, compiling tests,
game launches and original/rebuilt input/rendering/parity checks were
intentionally not run. Gap #9 remains open.
