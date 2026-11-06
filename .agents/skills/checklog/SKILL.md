---
name: checklog
description: Review new and appended Azeroth Survivors gameplay logs, link actionable findings to their gap IDs in CURRENT-STATE, and remove reviewed logs older than seven days. Use for $checklog or requests to inspect a gameplay capture.
---

# Check Gameplay Logs

Review existing captures, record the reviewed window and surface only findings
that give `$fixgap` new work. Invocation authorizes these documentation updates
and the scoped log cleanup below.
Follow `AGENTS.md` and the
[shared capture rules](../shared/autonomy.md#reuse-gameplay-tracker-logs).
Builds, launches, server operation, REA jobs, repairs and pushes require their
own authorization.

## Select and identify captures

- Read [CURRENT-STATE](../../../docs/CURRENT-STATE.md), the
  [verification register](../../../docs/verification-needed.md) and the
  [retained evidence](../../../docs/analysis/gameplay-log-evidence.md) before
  reviewing captures. Use the owning reports for the findings they touch.
- By default, enumerate every `session-*/gameplay.log` under the owning
  checkout's `runtime/original-vulkan-cache/cache/traces/` or its authorized
  configured cache location. Review all new or extended captures, including
  older sessions. Narrow the scan when the user explicitly selects a capture,
  run or time window.
- Match each capture's `# t0=` header to the
  [retained evidence](../../../docs/analysis/gameplay-log-evidence.md) and verify
  its saved prefix digest. Skip a matching capture with no complete lines
  beyond its cutoff. For a matching extended capture, review only the complete
  lines after that cutoff, using earlier lines as context where needed. Start
  an unrecorded capture at the beginning. Resolve a truncated or mismatched
  prefix before using its cutoff, and continue checking the other captures.
- Check session metadata and retained launch/build evidence where available.
  Bind an original capture to its launched EXE hash and a rebuilt capture to
  its revision/build identity. The installed EXE can be inspected read-only
  with `python3 -B scripts/register-target.py --inspect-installed`. A current
  installed hash alone leaves launch provenance unconfirmed.
- For each growing log, read through a fixed last complete line and record the
  cutoff. Leave partial lines and later appends for the next invocation.
  A missing end marker in that prefix leaves the outcome unknown.
  Keep the `AZSRUN` clock distinct from elapsed trace time. Use `# t0=` plus
  the row's `t=` offset for wall-clock alignment.

## Find evidence that changes the next step

- Start with `AZSZONE`, `AZSRUN` and `AZSEND` for setup, phase transitions and
  outcome. Then read the relevant addon, movement, cooldown, spell or combat
  windows. For example, correlate `AZSTGT` with `AZSUNITS` by actor and time,
  `AZSCHESTS` with gold and `owed` across a purchase, or `AZSM` with
  `AZSMETER` to distinguish same-name direct damage and procs.
- Follow [CURRENT-STATE](../../../docs/CURRENT-STATE.md) and the
  [verification register](../../../docs/verification-needed.md) to the owning
  evidence and live publisher. An actionable new finding supplies a concrete
  source discrepancy or changes the next source or recovery step for a gap.
  Establish a discrepancy against live source and applicable evidence. Repeated
  expected behavior, additional normal examples and verification-only evidence
  belong in the retained record when useful. They do not trigger a report or a
  source-gap update.
- Account for capture filters and missing inputs. An addon message establishes
  publication within that window. Rules, Lua callbacks, actual rendering and
  original/rebuilt parity require their own evidence. Keep raw logs in ignored
  storage and omit personal identifiers from summaries.

## Record the review

Update the [gameplay tracker evidence](../../../docs/analysis/gameplay-log-evidence.md)
with the capture header, reviewed line range and prefix digest, producer
provenance and useful observations. Replace the cutoff when extending the same
reviewed prefix. A focused review does not advance the general cutoff over
unreviewed lines. Omit routine confirmations and duplicate observations.

For each actionable new finding, record the log lines and limits in the evidence
report. Update the owning gap in [CURRENT-STATE](../../../docs/CURRENT-STATE.md)
with the concrete source or recovery action and a link to that evidence. Reuse
the permanent ID even when its prior work is in the verification register. Apply
the project register rules if a genuinely distinct issue needs a new ID.
Preserve unrelated statuses and keep runtime-only comparisons in the verification
register. Commit the focused documentation changes locally.

## Remove old logs after recording

After checking the docs, reviewing the selected logs and committing any needed
evidence or gap updates, check the last-write time of each selected
`gameplay.log`. Consider fully recorded logs here even when their review was
skipped. If a current finding still needs a raw window, save the relevant
evidence before considering that log for deletion. Delete a log only when all
of the following hold.

- Its last modification is more than seven days (168 hours) before the cleanup
  check.
- Its saved cutoff covers the last complete line, and the evidence report
  retains the observations and excerpts needed for follow-up. If an inactive
  log ends with a partial line, inspect the fragment for useful evidence and
  record that limit before deleting it.
- It is a regular file within the authorized trace directory with no active
  writer or remaining raw-file dependency. Recheck its identity, size and
  last-write time immediately before removal. Defer a changed, active or
  unverified file to a later run.

Remove only the exact eligible files and verify their absence. Preserve the
saved capture records, neighboring files and other sessions. If removal of an
eligible file fails, report its path and the reason.

## Report only new findings

If the review is recorded and there are no actionable new findings, reply only
`It’s all recorded. Nothing new found.` Otherwise report only each gap ID, what
was found and the evidence link. Keep routine progress out of chat. If a blocker
prevents review or recording, report it briefly instead of claiming completion.
