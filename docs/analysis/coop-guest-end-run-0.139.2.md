# Cooperative Guest End Run in 0.139.2

Finding [#206](../verification-needed.md#gap-206). The target is
`installed-game/AzerothSurvivors.exe` 0.139.2, SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.
The [native ranges and query receipts](evidence/0.139.2/coop-guest-end-run.json)
bind the bounded recovery to these bytes. The whole-image audit baseline is 0.139.1.

## Guest departure

The local request 9 producer at `0x145e4c54f` enters the guest dispatcher
`0x145e76740`. The guest guard at `0x145e76767..0x145e76784` precedes case
`0x145e767ae`. That case flushes existing guest output, serializes variant 16
using constant `0x1476c5b00`, submits it through the guest connection writer,
takes the service state and invokes the terminal close owner `0x145f94b20`.
It then publishes the exact local reason `you left the run`. The writer case
`0x145dc9290` emits only byte `0x10`. The joined-host variant 16 cell at
`0x1476c8220` selects the connection close slot through `0x145e78345`.
Control 5 has its own per-actor action under `0x145ec30a0` and does not own
this request.

The confirmed pause action queues a distinct Leave Run request. It uses the
existing Disconnect codec, party teardown, guest settlement and hero-picker
return. The role writes Disconnect after pending guest packets. The service
then performs its terminal primary and secondary Leave/close sequence. The
picker receives the existing localized reason. The earlier [logout contract](coop-logout-0.115.0.md)
keeps its original target and its separate host End packet.

## Permanent departure and the last active run

Host removal `0x145e79140` removes the connection in order and sends its
assigned world index to `0x145edbf60`. The world owner increments the permanent
departure count at `0x145edc058`, retires the departing actor through its borrowed
context and restores the retained world row. At `0x145edc3d9..0x145edc3fb`,
`max(1 + retained_remotes - departures, 0) <= 1` selects the finalization sweep.
The local branch at `0x145edc493` admits phases 1–3 with a clear abandonment
latch, clears the pending choice, then enters the defeat helper `0x145ef4480`.
Downed players still count toward membership until their connection is retired.
The defeat helper enters phase 4. Existing terminal publication and account
settlement consume that phase without marking the host's action as End Run.

The old/new health-factor paths use the same zone coefficients (1.0 or 0.7),
ordinary/special coefficients (0.72 and 1.04), and 0.8 cooperative factor.
`leave_party_hero` keeps the world indices and retained reward ownership. The
source tracks permanent departure on each retained remote, allowing the final
host check to use membership separately from the live count. The existing
health rescale and spawn-density consumers use the refreshed live count and
retain their [bounded scaling proof](coop-scaling-0.127.0.md).

`scripts/check-coop-logout.py --end-run` verifies the selected target ranges,
dispatch cells, payload tag and reason and replays 47 native count/phase cases.
The authored Rust regression covers a downed remaining member, repeated
retirement and the last active host's terminal state. Compilation, authored
regression execution, socket delivery, picker/result display and original/rebuilt
comparison remain open.
