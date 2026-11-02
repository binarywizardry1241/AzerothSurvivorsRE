# Run level cap 120 — 0.127.0

Permanent **#296**. The installed 146,721,280-byte EXE is SHA-256
`3ef9d74c30bb6b435d739b3d960c8535486836c540e0d8c20f98549a6f1dcbbb`.
The [compact proof](evidence/0.127.0/run-level-cap/manifest.json) binds current
original instructions/data, three completed journaled Ghidra queries and static
cases. The [0.119.0 cap 99 report](run-level-cap-0.119.0.md) retains its historical
provenance; this report supersedes only the run cap and its selected consumers.

## Native boundaries and live source

The current XP owner `145c2b460..145c2bf76` first adds collected XP with wrapping
u32 arithmetic to `Game+534`. It computes the existing rounded quadratic
threshold from `Game+530` (level), then `145c2b58e..145c2b592` rejects levels above
119. An admitted threshold subtracts XP, increments level and `Game+cd4` pending
levels, then publishes the level/stat/message/heal effects. On exit it still
publishes XP and the next threshold (player fields 716/717). XP keeps accumulating
at 120; it is neither zeroed nor converted into another reward.

`gameplay/mechanics.rs::add_experience` now admits `level < RUN_LEVEL_CAP`, using
the shared 120 constant in `run_progression.rs`. The old `level <= 98` stopped at 99.
All existing threshold, refresh, per-level heal, pending-level and publication
ordering is retained. The same unconditional native cap applies in endless;
there is no endless bypass in this XP owner. Source endless continuation keeps
level/XP/pending choices and resumes the same XP entry point.

The pending-level dispatch `145c2beda..145c2bf0f` checks the pending count,
playing phase, other open offer and store/spend flags. It calls `145c8e970` with
RCX=Game, DL=0 (earned mode) and R8B=1 (enter choosing). The retained current
Ghidra census binds 18 flow-body ranges for `145c8e970..145c8fa34`; original-byte
branch and helper-argument review reuses that inventory without a new query.
Earned mode enters the class-pool path and has no direct level-field read or cap
admission. Card construction produces fixed 0xa0-byte rows. If the collection is
empty, `145c8f57e..145c8f5dd` supplies a 25-gold selector to `145c934c0` with Game,
copies the resulting row and sets length 1, preserving a pending reward even
when no ability upgrade is eligible. `145c8f89c` enters phase 2 and
`145c8f939` publishes the offer. The selected admission proof does not re-certify
unrelated pool weighting, rarity, transport or card presentation contracts.

The source choice owner likewise admits earned pending levels without another
level cap and preserves the 25-gold fallback. Reaching 120 therefore keeps the
card earned by 119→120 and previously stored cards. Choice consumption decrements
pending levels and keeps existing cache/guardian priority. No new cap check is
added to that consumer.

The current recipient validator `145b528d0..145b5300c` reads the incoming run
level at `+9c`. `145b52b1a..145b52b22` performs the unsigned min with 120 and
`145b52dc9` stores the result in the validated record's same logical field.
The intervening scalar-clamp instructions preserve EAX. The source
`coop/client_state.rs::validate_state` now clamps the logical `word_6c` run level
with that same constant, so valid levels 100–120 survive recipient validation.
Other NativeState fields and validation boundaries retain their own provenance.
Account talent rank/XP is a separate progression domain and is unchanged.

## Real FrameXML

The bootstrap `145b98130..145b9826b` calls `145ba54d0` at `145b981c8`. The patcher
reads `Interface\FrameXML\ReputationFrame.lua`, formats its original contents
followed by the native suffix, then publishes the same path. The 83-byte compact
format record at `14707f7d8` retains the historical literal text; its u32 argument
at `14707f7d4` is now 120. Missing root, archive chain or file publishes nothing.
The exact new [suffix](evidence/0.127.0/run-level-cap.lua) is registered through
`client/framexml_hud.rs`, replacing the historical cap 99 suffix.

The existing core loader appends it before addons and recreates that ordering in
replacement VMs. Installed FrameXML's ReputationWatchBar consumers read the
shared `MAX_PLAYER_LEVEL` global for XP/reputation stacking, max-level rail and
locked reputation text. The native patch supplies 120 without replacing those
stock functions or overriding later addon changes.

## Static checks and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/check-run-level-cap.py --queries
```

The maintained checker verifies current PE extents, exact bytes/templates,
bootstrap edge, cap branches and retained query/result digests. Twelve cases
execute the complete native resource patcher with explicit root/file/UTF-8/
formatting/allocation/publication seams. Forty-eight cases execute actual XP
addition, threshold arithmetic, unsigned admission and level/pending writes,
covering 98/99/100/118/119/120/121, threshold±1, zero, batched XP and u32 wrap.
Roundf and per-level stat/heal/message/object publication are explicit seams.
Eighteen choice cases execute the current pending/phase/store/spend admission
gate and verify the mode0/pause arguments at levels 99/119/120; the card builder
is an explicit seam. Eight recipient cases execute the original level clamp and output-store
instructions; the wider validator is not emulated. Ghidra's raw-function
pseudocode omits some paths after unknown non-returning helpers, so original
assembly owns that cap proof.

The exact installed stock ReputationFrame Lua plus current suffix passes 568
assertions in two standalone mocked-widget VMs. Rust regressions cover final
cards, stored/automatic offers, endless and recipient level boundaries, but
remain unrun. No application compilation, game/client/network/server execution,
rendering or controlled original/rebuilt comparison occurred. Those checks remain
owned by [verification-needed #296](../verification-needed.md#gap-296).
