# AS computed-reference frontier — 0.119.0

Permanent **#41**, leads **Q41-F01/F02/A01/A02/M01**. Selected installed EXE
SHA-256: `6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
The [compact proof](evidence/0.119.0/computed-source-frontier.json) binds the
complete selected current reference populations, exact instruction prefixes,
one journaled ownership query and the complete ignored per-site artifact.
This is a classification frontier, not native/source completeness or parity.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) own implementation status.

## Complete current body-context projection

The selection starts with every actual saved-Program body that contains a
current Rust Location for `crates/wenilla-rogue/` or
`crates/wenilla-rogue-app/`. This includes co-op paths. It selects **300 body
contexts**, without assigning semantic ownership from the path alone. Both
independently decoded F01/F02 populations are consumed in full: **82,938**
declared transfers and **651** complement transfers. Exactly **113** transfer
sites have one of the selected body contexts.

Every selected site is retained, including its lead, exact address/bytes,
containing Program body, diagnostic paths, the independently decoded original
prefix range/digest, expression and remaining question. No sample substitutes
for the complete 113-site result.

| Current encoded classification | Sites | Disposition and missing proof |
| --- | ---: | --- |
| Declared loader-interface context | 6 | All six are exact `CloseHandle` import-slot calls. They are supporting OS interface context, not unexplained AS mechanics or permission to reconstruct the engine. |
| Signed-i32 relative-table expression | 78 | The exact prefix establishes indexed four-byte load, base addition and target register. Incoming type/selector producers, admitted domains, arbitrary aliases and successful consumers are not supplied by the expression. Source-module names do not fill those contracts. |
| Receiver/register writer identity unresolved | 29 | Calls through registers or receiver/vtable slots retain the exact load/call prefix. Actual receiver construction, mutable pointer writers, slot type and lifetime must identify a dynamic callee. An encoded offset is not a concrete function. |

The complete A01/A02 saved-reference join consumes **4,033,389** current
reference records and all **4,836** distinct unowned executable destinations.
Of **30,148** references from the selected body contexts, **zero** point into
that unowned-destination population. This closes that exact projection only.
It does not exclude AS code without a diagnostic-bearing body, erased/inline
owners, computed/address-taken aliases or independently decoded edges absent
from the saved Program. Those populations retain their separate selectors.

The [guest Engine admission repair](guest-engine-admission-0.119.0.md), **#180**,
followed a concrete computed-table dependency from a live AS receiver. Its full
native opcode/length domain and source omission are recovered separately; no
source defect is inferred for the other 113 contexts from this census.

## Party-control classification

The formerly unexplained current `game/party.rs` context at `145b74070..145b74503`
contains computed jump **`145b740cd`**. A dedicated durable REA/Ghidra raw-range
query classifies its surrounding remote-context removal/swap/action/reinsert
wrapper. The decompiler omits the external table and infers inaccurate incoming
register/stack types; those printed types are not used as a contract.

Original bytes establish that the local dispatch reads the first byte of the
supplied control record as its selector and the second as its argument. Ten
conditional cells at `1475e67bc` reach, in selector order:

| Selector | Destination | Existing source counterpart |
| --- | --- | --- |
| 0 | `145b740cf` | Choose the indexed offer. |
| 1 | `145b743d8` | Reroll choices. |
| 2 | `145b743e5` | Banish the indexed offer. |
| 3 | `145b74378` | Skip the choice under its phase/offer/index gates. |
| 4 | `145b744bb` | No action before ordinary publication. |
| 5 | `145b743fd` | Abandon under phase admission, clearing choices and taking the existing abandon owner. |
| 6 | `145b7445c` | Request stored levels under pending-level, phase and no-current-choice gates. |
| 7 | `145b743f2` | Save the cache-on-click option byte. |
| 8 | `145b74489` | Apply bit-0 stored-level behavior and its existing immediate-drain conditions. |
| 9 | `145b743cd` | Save the guardian flag/tracking option byte. |

The current live counterpart is
`gameplay/mechanics/coop.rs::party_control`, reached by the admitted
`coop_commands.rs` control drain and existing `with_party_hero` wrapper.
All ten actions are already represented. The current encoder/decoder rejects
kind values above 9 and normalizes the last three wire option arguments; the
native reader has **no local selector bounds check**. These ten conditional
cells therefore do not establish the complete native type/producer domain or
admit arbitrary byte values. Closing every local/wire writer and mutable alias
would require that separate producer proof. No new missing source operation
was identified in this branch, and an older implementation is not offered again
merely because its complete newest-target type proof is absent.

## Reproduction and limits

```sh
PYTHONPATH=runtime/tests/query-python-deps python3 -B scripts/check-q41-computed-frontier.py
```

The checker verifies every consumed artifact digest/count, the complete
113-site and incoming-edge projections, original instruction prefixes,
expression classification, declared imports, current raw-input byte identity,
the original Ghidra result/profile and ten conditional table cells. Normal
operation reproduces and compares the compact receipt and complete per-site
artifact without writing. It launches no new Ghidra import or game.

The result leaves the exact 78 discriminant and 29 receiver/writer questions
open. Further native work must follow an actual AS producer/interface or a
bounded unknown-ownership lead; unresolved generic callee totals do not mandate
engine reconstruction. Source/recovery state is independent of compilation,
actual network/client/server execution and original/rebuilt parity, all of
which remain unverified. The separate #101 guest item-text writer/carrier
blocker is unchanged.
