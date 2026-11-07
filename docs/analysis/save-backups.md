# Hourly progress backups

Recovered 2026-10-19 from selected 0.100.1, SHA-256
`17abcc4caad41f4150b0a05cc9bf8c428a4666121c49091db19f887a9b79eb7b`.

Ordinary persistence `1454356a0` attempts the active save write, then checks
progress and the ordinary backup timer. The timer is
`characters.backup-at.txt` beside the active save. A timestamp no later than
the current time suppresses backup until 3,600 seconds have elapsed. A future
stamp does not suppress backup.

Writer `145469450` creates `Saves/Backup YYYY-MM-DD HH-MM-SS.sav` in UTC,
keeps five names in descending path order, and advances the timestamp only
after successful backup creation. The filename filter `14546a1f0` requires
exact-case `Backup ` and `.sav`; exports and other names are retained.
Failed active writes do not suppress this separate backup attempt. Failed
retention cleanup does not invalidate the newly created backup.

The source uses the existing sealed envelope for active files, backups and
manual exports. Export does not run the active-save backup timer. UTC naming
is shared between those paths. Import keeps its distinct before-import backup.

[Ordinary-write instructions](evidence/target-menu/ordinary-write.asm),
[hourly backup](evidence/target-menu/hourly-backup.asm),
[filename filter](evidence/target-menu/backup-name-filter.asm) and
[path ordering](evidence/target-menu/backup-path-order.asm) retain the
current native ownership. The target/menu manifest carries their body hashes
and REA identities. Static recovery does not establish desktop restore parity.

The hourly-boundary, future-clock, five-copy retention, failed-backup and
export-isolation cases passed in the combined save regressions. The old
ordinary-write fixture is updated to verify the actual backup and stamp,
using deterministic times and an isolated project-local directory.

The source's progress check recognizes supported row prefixes and roster rows.
Full typed-parser normalization remains incomplete: malformed recognized rows
can count as progress where the native typed parser would discard them. Full
restore-list metadata and original/rebuilt desktop interactions remain unverified.
