# Two-player cooperative achievement settlement in 0.141.0

[#195](../verification-needed.md#gap-195) covers the
[0.132.0 two-player guest claim](../CHANGELOG.md#01320), including For the Team,
cloak rewards and fresh cooperative clear credit. This assessment uses
`installed-game/AzerothSurvivors.exe` (151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`).
The [PE ranges and four Ghidra receipts](evidence/0.141.0/party-achievement-settlement.json)
bind this scope independently of the registered 0.140.0 audit.

The native State15 dispatcher installs the accepted cache at `0x145ece3b3`.
It calls the live feat owner `0x145e9e1e0` at `0x145ece40e`. The regular poll
calls the same owner at `0x145ea8c44`, including when the mode at app
`+0x10` is guest (2). The owner reads the recipient snapshot, evaluates run
feats and saves and notifies only for newly earned keys. The guest snapshot
reader `0x145ec0e70` needs an admitted connection and present cache. It
copies the optional cooperative context, including its member count and
lethal history. The live admission helper `0x145ec4370` excludes the tester
GUID `0xffffff`, exempts guests from the local showcase gate and admits
phases 1–5.

Cooperative clear history is owned by account settlement `0x145ec30b0`.
The guest dispatcher calls it after summary on an accepted changed terminal
phase at `0x145ece472..0x145ece487`. The End, connection-close and form-leave
routes settle the same cache before removal. The host's regular update
dispatches summary and account settlement at `0x145eaaf89..0x145eaaf96`
after its changed terminal phase gate. Both modes pass the same account
admission, apart from the local showcase exclusion. The account owner
updates its private count checkpoints, then tests the won byte, present
cooperative context and **at least two current members**. It inserts the
zone into the sorted cooperative history at app `+0x16e0` once. The run and
account evaluators then consume that account state, followed by Save and
notification. The account progress evaluator reads this same history at
Save `+0xf8/+0x100` for cooperative zone membership. The live owner has
no cooperative history write.

The host already publishes shared current membership and lethal events in
each recipient's State15. While it borrows the only remote row, the active
slot keeps the context present, so a two-player guest receives both member
records. The guest keeps that context through cache and replica settlement
and uses the same earned-key and first-date Save code as the host. The host
now records cooperative history at settlement instead of on its live won
tick. The guest now also checks the admitted cached snapshot during the
regular feat poll. The separate Normal/Heroic class-clear path and the
guest's existing terminal and close account paths continue to use their
own boundaries.

The [Save history adapter](../../crates/azeroth-survivors-re/src/save/coop_history.rs)
reads only `coopbeat|` for this progress. Ordinary `beat|` records supply
no cooperative credit. The retained reward catalog maps the Warsong Gulch
and Arathi Basin pair to `coop:team`; its earned key feeds United Front
both for the local run and the co-op Hero profile. The same zone-history
consumer supplies the history-based cloak condition. The authored
regressions cover pre-world and live-replica settlement, two fresh clears
with existing solo records, the first-earned date, duplicate delivery
and the host's nonterminal/terminal boundary.

The maintained [static checker](../../scripts/check-party-achievements.py)
passed 516 original-instruction cases and 4,304 steps for recipient
admission, live phases, won/member-count gates and sorted/deduplicated
history insertion. It checks the live source and Save boundaries. The
instruction replay substitutes the separate class-clear call and
`memmove` and uses preallocated history storage. Rust syntax parsing
passed. Compilation, authored Rust test execution, actual Save I/O,
host/guest gameplay, reward presentation and original/rebuilt parity
remain unverified. The earlier ordinary boss-kill producer and recipient
history retain their [0.120.2 proof](release-contracts-0.120.2.md).
