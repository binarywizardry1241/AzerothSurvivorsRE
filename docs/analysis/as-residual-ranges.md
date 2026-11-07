# AS-context residual instruction ranges

Selected installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This is a bounded **Q41-U03** classification within [#41](../CURRENT-STATE.md#gap-41).
The [compact proof](evidence/0.121.0/as-residual-ranges.json) binds every selected
range to the unchanged expanded census, exact original bytes and direct-flow
observations. It does not change the census's unobserved-byte population or
establish complete AS semantics, missing source or parity.

## Exact population and classification

The selection joins each AS `rust_location` instruction into its declared
unwind extent, then selects every `mixed-unclassified` missing executable range
wholly inside those extents. Only paths beginning `crates/wenilla-rogue/` or
`crates/wenilla-rogue-app/` qualify. A literal filename or short token alone
does not qualify. This yields **302 context extents**, with **148 mixed ranges /
103,712 bytes in 36 extents**. Ten additional mixed ranges selected solely by
literal/token context are explicitly excluded, with their original inventory
ordinals retained. The same genuine context population contains 824 NOP/CC
candidate ranges / 7,043 bytes and 52 single-byte NOP candidate ranges; those
are separate from the 148 mixed ranges.
The checker also examines every missing executable row for an overlap that
starts before a genuine AS context extent or crosses its end, before applying
the containment filter. **No partially overlapping row is dropped**: the exact
partial-overlap set is empty and its zero count is retained in the proof.

Every selected interval's exact hash agrees with the original-byte census.
Capstone 5.0.7 independently decodes its entire enclosing extent; all 148
interval boundaries fall on that decoder's instruction boundaries. The selected
intervals contain **20,620 instructions**. Their local endings are:

| Local encoding/control shape | Ranges |
| --- | ---: |
| Last instruction is a branch | 78 |
| Last instruction has a nominal fallthrough encoding | 65 |
| Last instruction is a return | 1 |
| Last instruction is a trap | 4 |

These are local instruction classifications, not whole-function roles or proof
that a called function returns. The
four terminal trap sequences are at `0x140244275`, `0x140244298`,
`0x1402f80d6` and `0x1402f80f9`; each contains a direct call to `0x1461940bb`
and ends in `UD2`. The callee's wider failure/unwinding semantics are not
inferred. The returning interval is `0x1402e98cf..0x1402e99b2`.

## Complete incoming-edge reconciliation

**97 intervals** have a direct incoming branch from another decoded instruction
in the same declared extent. **20 intervals** contain target candidates from
the retained guarded-table proposals; all such tables are **unapplied** in the
selected census. None is silently promoted to an applied edge. Six intervals
have both observations; **37 have neither** within these exact domains.

Four proposal-target intervals belong to the Codex-context dispatch at
`0x1400fa4b2`. The other sixteen belong to the query/metadata extent
`0x145b0f580..0x145b1243d`, including the already independently recovered
[9612 query branch](explosive-orb-query.md). The proof preserves every
case ordinal, target, dispatch site and applied/proposal state. A target inside
an interval is checked against the independent whole-extent instruction starts.
This does not establish all selector inputs or runtime reachability.

The instruction immediately preceding each selected interval is also retained:
132 follow a `JMP`, eight follow a `RET` and eight follow `UD2`. This rules out
an ordinary linear fallthrough explanation at those boundaries. Incoming
conditional branches, computed targets, cleanup paths and other entry states
remain separate questions; an interval after a return or trap is not thereby
proved dead. In particular, the 37 intervals without a direct/proposal incoming
observation require their actual computed-target or other-entry proof before
being called reachable, unreachable, padding or source omissions.

## Context, retained source and remaining scope

The complete compact proof retains all 36 enclosing extent hashes and all 148
interval selectors. The broader context groups are:

| Genuine diagnostic context | Extents | Mixed ranges | Bytes |
| --- | ---: | ---: | ---: |
| Markers | 1 | 3 | 5,345 |
| Discord screen | 2 | 6 | 732 |
| Codex | 1 | 6 | 136 |
| Armory | 2 | 5 | 4,060 |
| Options | 4 | 19 | 11,054 |
| Rewards | 1 | 3 | 2,241 |
| Fonts | 1 | 5 | 2,391 |
| Gear / server-party query | 1 | 16 | 3,144 |
| Server / server party | 2 | 4 | 2,335 |
| Co-op TCP | 1 | 6 | 793 |
| Game abilities | 2 | 5 | 12,661 |
| Game party | 1 | 2 | 363 |
| Hazards | 2 | 12 | 9,042 |
| Content / talents | 1 | 7 | 14,689 |
| Content | 3 | 12 | 11,848 |
| Content / enemy | 1 | 2 | 20 |
| Enemy | 2 | 9 | 4,086 |
| Affixes / enemy / navigation | 1 | 1 | 5,205 |
| Demons | 1 | 2 | 670 |
| Content / upgrades | 1 | 9 | 5,623 |
| Upgrades | 1 | 3 | 51 |
| Gear | 3 | 6 | 1,005 |
| Content / jewelry | 1 | 5 | 6,218 |

Each name above is diagnostic **context**, not an assignment of every byte to
that mechanic. Existing source and historical recovery remain owned by the
[system ledger](coverage/systems.json) and [incremental correspondence](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/b4117154651e507abec7d190207174568a802a29/docs/analysis/evidence/0.121.0/incremental-correspondence.json).
The query metadata and affix/gear branches retain their independently numbered
findings. This structural review proves no additional missing mechanic or
source defect. Missing newest-target applicability for an existing source
contract is separate from an unexplained native branch and does not reopen the
implemented contract.

The exact remaining static question is the producer/domain/entry-state proof
for the intervals without established incoming flow, followed by each relevant
AS state/value consumer where its meaning is still unknown. The detailed
inventory retains the complete local direct-call/branch sets, boundaries,
diagnostic sites and guarded-target records needed to select those operations;
it is not a sample or a replacement for their semantic recovery. Follow
`Q41-F01` under the existing [unknown queue](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/unknown-recovery-0.121.0.md) and
reuse prior classifications before issuing new native queries. Generic library
interfaces stop at their existing source boundaries.

## Reproduction and limits

With the existing Capstone 5.0.7 Python dependency available:

```sh
python3 -B scripts/classify-as-residual-ranges.py
```

The default verifies retained compact and detailed outputs; `--write` explicitly
publishes them. A linked source worktree may supply `--inputs-root` pointing to
the primary checkout and its existing shared analysis inputs. Complete derived
details stay under ignored `runtime/coverage/<target-sha>/as-residual-ranges/`
with their hash in the compact proof. No EXE/MPQ copy or independent Program is
created. The checker does not launch Ghidra or execute original instructions;
it reads original bytes and retained inventories. Compilation, source execution,
client/game/network/server operation and original/rebuilt parity remain unrun.
