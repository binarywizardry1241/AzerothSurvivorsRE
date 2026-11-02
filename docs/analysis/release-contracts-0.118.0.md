# Cooperative release contracts — 0.118.0

The installed 145,356,800-byte EXE has SHA-256
`4c3c6bbac1e5ca403672109ad57cf1c84781ffe78e113ba965b8d89c6f41b6ae`.
This static review investigates supplied [release items](../CHANGELOG.md#01180)
**#166–#168**, the independent implementation dimensions **#173/#174**, and supports the separate descriptor lead **#170**. The release
summary **#165** points to the individual obligations rather than proving them.
[CURRENT-STATE](../CURRENT-STATE.md) and [verification-needed](../verification-needed.md) jointly own permanent findings and current source
status; [locale review](locale-catalogs-0.118.0.md) owns **#169** and the translated
payloads. No gameplay source was changed by this review.

The [manifest](evidence/0.118.0/release-contracts/manifest.json) binds current
function bytes, curated instruction spans, data bytes, source receipts, current
Location references and completed durable REA/Ghidra queries. Historical
0.117.0/0.115.0 extracts were relocation leads only. Masked signatures identified
candidates; current PE unwind metadata, complete function decoding, exact current
instruction/data bytes and relevant control flow establish the bounded contracts
below. Preferred addresses are static PE addresses, not observed live pointers.

The [0.119.0 guest settlement repair](guest-settlement-0.119.0.md) owns current
#166/#174 source/static completion and deferred runtime/parity limits. The
0.118.0 observations below retain their historical identity.

## #166 — Guests settle before their run state disappears

Current summary owner `145b0f720` obtains its snapshot through `145b14cd0`.
The snapshot explicitly selects the cached guest state when app discriminator
`+10 == 2`, the guest connection exists and cached state is present. The local
branch uses the ordinary Game snapshot. The summary gate at
`145b0f7a7..145b0f7b5` admits **started phases 1 through 5**, including a running
or choosing guest. An absent state or phase zero produces no summary. This is
separate from waiting for a whole-party terminal edge.

The guest receive dispatch contains the newly connected sequence at
`145b1c26f..145b1c321`: while the cooperative connection is admitted, its run
identity is nonzero and cached state exists, call summary `145b0f720`, then
account delivery `145b154e0`, then clear cached run state. The later presentation
teardown retains its existing order. The dispatch's **internal enum selector
17** reaches this branch; the source wire `End` byte is **18**. These are separate
representations, not interchangeable tag numbers. Exact dispatch-table bytes
are retained without assuming every internal variant matches its wire ordinal.

Two additional connection-close wrappers repeat summary then account delivery:
`145b18980` at `145b189d0/145b189d8`, and `145b18ac0` at
`145b18b0d/145b18b15`, both before replacing the connection state. The complete
current direct-call scan also retains calls from the larger request/poll paths;
not every surrounding path or indirect caller has been semantically recovered.
No runtime ordering, socket loss or filesystem operation was observed.

The selected summary calls XP mutation `145ac3b00` followed by Save boundary
`145aca540` at `145b0fc1f..145b0fc43`. The separate account owner adds saturating
nonnegative counter deltas, handles won-zone history, evaluates run/account
achievements and calls the same Save boundary. These are native producer and
consumer interfaces; full Save schema, I/O and notification behavior are outside
this bounded review.

The actual source differences are:

- `gameplay/coop.rs` handles `NativeMessage::End` and transport loss by clearing
  `run.mechanics` and returning to the menu, without first calling the summary
  and account persistence routes. Those paths can discard unsettled guest XP
  and counters even though `summary_result` already supports a started replica.
- `gameplay/terminal.rs` already requests `persist_run(..., force_summary=true)`
  on an explicit Menu/Again action. That source path has existing summary/XP
  handling; it must not be described as wholly absent. However, `persist_run_at`
  excludes ordinary and cooperative feat/history handling under `!force_summary`,
  and its separate `count_eligible && terminal_edge` block also excludes forced
  exits from `apply_run_counts(delta)`, beaten-zone persistence and later grants.
  Current native close wrappers call both settlement owners.

The full account-transaction omission on explicit Menu/Again is **#174**; the End/loss
state-clear dimension remains **#166**.

The next static repair is to connect cached-replica settlement to every proven
exit boundary before state removal, preserve existing XP/count checkpoints and
idempotent earned dates, and complete the close-wrapper/host-loss caller
classification. It must reuse the existing ordered immutable account-save
consumer and the actual local/guest snapshot owner. No new packet or speculative
late award is justified by this evidence. Compilation, source tests, real save
operations, voluntary leave/host leave/network-loss scenarios and controlled
original/rebuilt comparisons remain unrun.

## #167 — Population is checked at the relevant victory or lethal event

Current source status and the selected 0.119.0 repair are owned by
[friend achievements](friend-achievements-0.119.0.md). The native review below
retains its original 0.118.0 identity and inspected-source snapshot.

Current composition helper `145b336b0..145b339c2` dispatches through the exact
four-entry signed-relative table at `1475e2550`. The **Any** arm at
`145b336df..145b336eb` now computes unsigned `member_count >= 2`; the historical
nonempty test is no longer the current contract. Five-member composition arms
remain separately bounded by their count-five checks.

The current run evaluator `145b42b40` passes the captured event's own member
pointer/count to this helper at `145b42f89..145b42f9b` and
`145b4340a..145b43421`. Its victory arm passes current context membership at
`145b43571..145b4358f`. The gate is consequently evaluated against the event or
victory population, not a lobby's historical roster or retained transport rows.
The context producer `145b84ed0` still admits a retained remote row independently
of the filtered member population: mere context presence does not prove that a
friend remained eligible.

Current account delivery adds its own **member_count >= 2** gate before writing
cooperative beaten-zone history at `145b15775..145b15791`, after confirming an
actual won run. Existing earned achievements/history are not erased by this
branch. Exact preservation across loading/migration remains a separate Save
contract, not something inferred from the release note.

Source `CooperativeParty::Any::matches` still returns `!members.is_empty()`.
The current `persist_run_at` history writer requires won plus context presence,
without the count-two requirement. Its boss/victory evaluator already supplies
respectively captured event members and current context members, so those
existing producers must be retained when correcting admission. The seven
friend-required descriptions also have current catalog keys that differ from
the retained source descriptors; the locale review owns that data evidence.

The independently missing cooperative-history writer guard is **#173**;
repairing the Any predicate alone does not correct it.

Next: repair the Any predicate and cooperative-history admission together with
the seven descriptors; revalidate the abandon/filter producer, serialized
context and per-recipient consumers against this target. Check zero/one/two
members, departure before a lethal hit or win, historical saved progress, and
five-member composition obligations separately. Native boundary/source tracing
is complete only for the stated clauses. Compilation, gameplay, live delivery
and parity remain unverified.

## #168 — Nearby choosing helpers hold the revive clock

The [0.119.0 source/static repair](revive-choice-0.119.0.md) owns current #168
completion and the separate recipient HUD defect #179. The observations and
inspected-source difference below retain their original 0.118.0 provenance.

Current party update `145b7cfc0..145b814b5` builds a 16-byte positional snapshot.
Its byte `+c` means state **1 or 2**; a new distinct byte `+d` means state **1**.
The exact local projection is `145b7e5dd..145b7e642`. Collector
`145c334a0..145c33666` continues selecting other heroes with `+c == 1` within
XY squared distance at most 25. Thus a nearby choosing hero remains in the
nearby set, but no longer advances revival by itself.

The timer branch at `145b7e937..145b7ea0b` and
`145b7ebd1..145b7ebf2` establishes three outcomes:

| Nearby helpers | Current timer change |
| --- | --- |
| None | Subtract delta, floor at zero. |
| At least one state-1 helper | Add delta exactly once. |
| State-2 helpers only | Preserve the timer unchanged. |

An additional active friend therefore keeps progress advancing while another
chooses. Chooser-only presence holds progress rather than decaying it. The
ordinary six-second completion and interaction rows remain separate consumers;
the review does not infer that changing helper eligibility alone is sufficient.

Source `Party::update_revives` currently treats both states 1 and 2 as helpers
and adds delta whenever its nearby set is nonempty. It has no separate
progress-capable flag or chooser-only hold branch. Next: preserve nearby
eligibility, introduce the recovered active-versus-choosing distinction in the
actual snapshot/timer consumer and retain a single timer increment with multiple
helpers. Recheck remote projection, interactions, HUD/addon progress and choice
entry/exit. Compilation, rendered bars, timing during level-up/item choice,
multiplayer execution and original/rebuilt parity remain unverified.

## Native ownership and bounded module contracts

Two module identities have direct current Location proof in this review:

- `custom-game-achievements`: current constructor `145b396b0..145b3fa81`
  references `crates/wenilla-rogue/src/achievements.rs`, line 398, at
  `145b3f594` and `145b3f5f3`. The constructor's Hakkar title/description lookup
  at `145b3e61d..145b3e6b3` uses the new 101-byte English descriptor, without
  “in co-op”. The existing source descriptor still uses the older key. This
  directly binds the **#170 descriptor/key discrepancy**, not a recovered new
  Hakkar gameplay predicate. Wider definitions, grants and localization remain
  separate contracts.
- `custom-game-game-party`: current party-update Location references at
  `145b7f2ed`, `145b81415` and `145b81431` identify party.rs lines 344, 353 and
  707. The bounded revive snapshot/three-way timer contract above belongs to
  that actual body. It remains missing from source and is not whole-module
  completeness.

The composition, account-delivery, snapshot and close helpers have their own
current function/data evidence and source interface associations. They are not
assigned Save/Game/app diagnostic ownership without their own proof. Raw-slice
Ghidra omits external PE data and callees, reports uncertain ABI/types, and does
not resolve the absent jump tables; the independently checked current PE tables
and instruction operands supply the bounded edges described above. Native
queries and their journals are retained for later recovery. All described
validation is static; no application, compiler, game, client, server, relay,
network service or controlled comparison was run.
