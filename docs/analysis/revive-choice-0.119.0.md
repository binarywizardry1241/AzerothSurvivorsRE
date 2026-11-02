# Revive choices and recipient progress — 0.119.0

The selected installed EXE is 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
This report owns the source/static repair of **#168** and the distinct guest
HUD consumer **#179**. [verification-needed](../verification-needed.md) owns their current
completion and remaining validation. The
[native manifest](evidence/0.119.0/revive-choice/manifest.json) retains exact
current instruction ranges and original durable REA/Ghidra result commitments.
The [0.118.0 review](release-contracts-0.118.0.md#168--nearby-choosing-helpers-hold-the-revive-clock)
remains historical evidence; its addresses are not promoted to this target.

## #168 — Nearby choosers hold accumulated progress

The current party-update owner is `145b7d080`. Its positional snapshots retain
separate flags for nearby eligibility (state 1 or 2) and progress eligibility
(state 1 only). The local projection at `145b7e69d..145b7e702` and the remote
producer feed the same nearby collector. The collector excludes the recipient's
own slot and admits other eligible heroes at XY squared distance at most 25;
vertical separation does not change that test.

The timer branches at `145b7e9f7..145b7eacb` and
`145b7ec91..145b7ecb2` distinguish three outcomes:

| Nearby helpers | Elapsed revive time |
| --- | --- |
| None | Subtract frame delta, floored at zero. |
| At least one state-1 helper | Add frame delta once, regardless of helper count. |
| State-2 helpers only | Preserve the existing value. |

`coop/game_party.rs::Party::update_revives` now captures both predicates before
mutating any downed hero. It preserves every nearby chooser's interaction row,
uses the captured state-1 bit to advance, and holds the timer when only choosers
remain. The existing six-second completion, half-health restoration and
two-second immunity consumers remain connected.

The live integration already supplies the required distinction. In
`gameplay/mechanics/coop.rs`, `capture_party` projects local choice admission and
remote nonempty choices as state 2. `tick_party` continues the shared simulation,
captures party state before the timer, writes elapsed values back to
`local_revive` and each remote's `revive`, applies completed revives, and captures
again for publication. Opening, accepting or replacing a choice does not clear
those timer owners. Departure marks the hero abandoned/down and finished, clears
its choices, and excludes it from helping or being revived.

`can_revive` intentionally continues admitting states 1 and 2. It also controls
shared-running and addon interaction visibility; changing that predicate to
state 1 would incorrectly discard chooser interactions and stop chooser-only
party updates. The addon payload still exposes the held fraction and helper
identity. Guest custom-HUD timer selection is the independent defect below.

## #179 — Guest HUD reads the selected recipient's timer

Current recipient wrapper `145b71740` temporarily removes the selected remote
row, swaps its player state into the shared Game, assigns the active slot and
calls `145b215b0` → HUD owner `145b96730` before restoring the row. The native
swap leaf at `145ba985a..145ba9876` exchanges Game `+0xc68` with the selected
remote payload `+0x978`. The HUD reads that recipient's timer at `145b9960b`,
divides by six,
clamps the fraction and publishes key `revive` at `145b99657`. The addon
serializer independently reads the recipient timer at `145b7af02`.

The reconstructed publication also calls `coop_hud` inside `with_party_hero`,
which temporarily removes the active remote. Its former lookup through
`coop.remotes` missed that recipient and defaulted to zero. The remote branch
now selects that slot's `revive_elapsed` from the stable party snapshot. The
local branch retains its direct timer. Shared-running, localization and GUID
selection remain valid through the borrow, and existing tick writeback/capture
keeps the snapshot current before publication.

The existing HUD JSON and guest addon feed consume the corrected fraction;
no packet or extra timer owner is introduced. An authored regression invokes
the actual HUD inside `with_party_hero`, with the remote absent and local/remote
timers deliberately different, then checks the guest HUD cache. It remains
uncompiled/unrun; source tracing and the native fixtures below are separate
from actual network or rendering behavior.

## Checks and limits

```sh
PYTHONPATH=runtime/armory-recovery/python-libs:runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/check-revive-choice.py --require-retained-queries --guest-hud
```

The non-compiling check passes 512 local/remote state-byte cases, 112 helper
selection cases and 756 timer/choice-transition cases: **1,380 original-instruction
fixtures**. Selection covers the inclusive radius, self exclusion, Z independence,
NaNs and infinities; timers cover multiple helpers, thresholds and repeated
choice entry/exit. Another **36 fixtures** execute the original timer exchange,
HUD fraction and inverse exchange with distinct local/remote values, for
**1,416 cases** overall. The check verifies 18 disjoint native spans / 3,933 bytes /
809 instructions, constants and nine retained current query results. The
undeclared swap leaf is independently bound to its exact 4,961-byte current-image
range and raw-input query; its subject hash is distinct from the complete EXE.
These are bounded scratch-memory instruction replays, with explicit entry/exit and
memory seams, not application execution or Rust regression results.

The timer and HUD source, including their three authored regressions, pass
syntax-only
Rust parsing with the existing formatter; no files are reformatted. The
regressions cover chooser-only hold, mixed helpers, final-helper departure,
choice entry/exit and local/remote completion, including addon fractions.
They remain uncompiled and unrun.

Static native/source checks do not establish real scheduling, transport, addon
or HUD rendering. No application compilation, compiling tests, game/client/
network/server execution, save/settings mutation or original/rebuilt comparison
is performed. Wider party, networking and module contracts retain their owning
gaps; no whole-system or gameplay parity is claimed.
