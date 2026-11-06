---
name: checklog
description: Review existing Azeroth Survivors gameplay tracker logs and identify observations that can help $fixgap or verify reconstructed behavior. Use for $checklog, requests to inspect the latest gameplay capture, or questions about what a capture can establish.
---

# Check Gameplay Logs

Inspect captured gameplay, map useful observations to the repository's permanent
findings and explain which comparison or source trace each observation enables.
Review is read-only unless the user asks to save findings. Follow `AGENTS.md`
and the [shared capture rules](../shared/autonomy.md#reuse-gameplay-tracker-logs).
Reading a capture does not authorize a build, launch, server, REA job, repair or
push.

## Select and identify the capture

- Use the requested capture, run or time window. For a bare invocation or
  "latest," find the newest gameplay session in the owning checkout's
  `runtime/original-vulkan-cache/cache/traces/session-*/gameplay.log` or its
  authorized configured cache location. Use the `# t0=` header to distinguish
  sessions. Check the [retained evidence](../../../docs/analysis/gameplay-log-evidence.md)
  first so another review can focus on new captures or appended rows.
- Check session metadata and retained launch/build evidence where available.
  Bind an original capture to its launched EXE hash and a rebuilt capture to
  its revision/build identity. The installed EXE can be inspected read-only
  with `python3 -B scripts/register-target.py --inspect-installed`. A current
  installed hash alone leaves launch provenance unconfirmed.
- For a growing log, read through a fixed last complete line and state the
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
  evidence and live publisher. Report the concrete fields and order observed,
  log line references, the permanent IDs, and what can be compared or traced
  next. Identify a source discrepancy only when both sides establish it.
  Keep expected-output cases, unresolved source leads and verification-only
  work distinct.
- Account for capture filters and missing inputs. An addon message establishes
  publication within that window. Rules, Lua callbacks, actual rendering and
  original/rebuilt parity require their own evidence. Keep raw logs in ignored
  storage and omit personal identifiers from summaries.

## Save when requested

Add only new reusable observations to the
[gameplay tracker evidence](../../../docs/analysis/gameplay-log-evidence.md).
Record the header, reviewed line range or prefix digest, producer provenance,
relevant finding IDs and limits. Reuse the existing record for an extended
window of the same capture. Link any new area from its owning report when
needed. Preserve finding statuses unless the evidence establishes a change.
