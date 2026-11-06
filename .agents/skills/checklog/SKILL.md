---
name: checklog
description: Review and record existing Azeroth Survivors gameplay logs. Report only new actionable findings and link them to their gap IDs in CURRENT-STATE for $fixgap. Use for $checklog or requests to inspect a gameplay capture.
---

# Check Gameplay Logs

Review existing captures, record the reviewed window and surface only findings
that give `$fixgap` new work. Invocation authorizes these documentation updates.
Follow `AGENTS.md` and the
[shared capture rules](../shared/autonomy.md#reuse-gameplay-tracker-logs).
Builds, launches, server operation, REA jobs, repairs and pushes require their
own authorization.

## Select and identify the capture

- Use the requested capture, run or time window. For a bare invocation or
  "latest," find the newest gameplay session in the owning checkout's
  `runtime/original-vulkan-cache/cache/traces/session-*/gameplay.log` or its
  authorized configured cache location. Use the `# t0=` header to distinguish
  sessions. Check the [retained evidence](../../../docs/analysis/gameplay-log-evidence.md)
  first. Verify the recorded prefix digest before resuming an appended log.
  If it differs, resolve capture identity before trusting the saved cutoff.
- Check session metadata and retained launch/build evidence where available.
  Bind an original capture to its launched EXE hash and a rebuilt capture to
  its revision/build identity. The installed EXE can be inspected read-only
  with `python3 -B scripts/register-target.py --inspect-installed`. A current
  installed hash alone leaves launch provenance unconfirmed.
- For a growing log, read through a fixed last complete line and record the
  cutoff. A missing end marker in that prefix leaves the outcome unknown.
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

## Record the review and report only new findings

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

If the review is recorded and there are no actionable new findings, reply only
`It’s all recorded. Nothing new found.` Otherwise report only each gap ID, what
was found and the evidence link. Keep routine progress out of chat. If a blocker
prevents review or recording, report it briefly instead of claiming completion.
