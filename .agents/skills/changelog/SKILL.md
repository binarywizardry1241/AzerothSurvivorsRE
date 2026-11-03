---
name: changelog
description: Save pasted original Azeroth Survivors release notes in the repository changelog and queue connected claims in CURRENT-STATE for selection with $fixgap. Use for $changelog or requests to record supplied Azeroth Survivors release notes.
---

# Changelog

Read `AGENTS.md`, [the original-game changelog](../../../docs/CHANGELOG.md) and
the [release leads in CURRENT-STATE](../../../docs/CURRENT-STATE.md#unreviewed-release-leads).
Use the pasted text and its supplied release versions. If either is missing or
ambiguous, request only that input.

1. Merge the notes into `docs/CHANGELOG.md` in version order using `## X.Y.Z`
   headings. Preserve the supplied wording, bullet nesting, tables and versioned
   acknowledgements. Omit chat timestamps and unrelated unversioned conversation.
   Update the introduction's version range and supply provenance. Preserve
   the historical JSON archive. Re-pasting identical notes is a no-op. Merge
   genuinely new items into existing sections without duplicating them. If
   supplied text conflicts with an existing claim, establish whether it is an
   addition or correction before editing. Preserve IDs referenced by existing
   reviews or explicitly reconcile their provenance when correcting text.
2. Run `python3 -B scripts/index-current-changelog.py --claims-only <version> ...`
   with the affected versions. This uses the same item boundaries and claim IDs
   as the full audit. Review the output against the paste and the existing intake
   and review records for those claims. Keep each item individually traceable.
3. Add the new actionable leads to CURRENT-STATE's **Unreviewed release leads**.
   Group related claims by behavior or plausible shared dependency across the
   supplied releases. Use one row per group with a descriptive choice name,
   release links, each exact claim ID and the next source/recovery question.
   Link an existing permanent finding where it owns the same issue. Keep
   claims without an established owner selectable by group name or claim ID.
   Release summaries, acknowledgements and superseded aspects remain traceable
   as context for their related choices. Keep platform-only and other out-of-scope
   items in the changelog and identify their scope without offering them as
   desktop repair work. A note alone does not establish a defect, a native
   contract or a new numbered finding.

Intake is documentation work independent of the installed game. Keep the
target-bound audit ledger and its reviewed EXE/Data baseline separate. Review
and commit the changelog and queue updates together locally. Report the new
`$fixgap` choices and their release links. With no new items, report that result
without making a commit.
