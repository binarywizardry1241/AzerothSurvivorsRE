# Co-op account Seen admission —0.115.0

This report is bound to installed0.115.0 SHA-256
`0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c`.
The native client receives wire14 as `(String,u8)` account Seen grants; its
validator rejects quality above4 and accepts only142 exact keys:39 jewelry keys
and103 `legendary:<ability>` keys. An arbitrary `legendary:` suffix is refused.

The current owner1458e4ae0 is an inlined6148-byte literal comparison tree. Its
accepted branch1458e4b40 retains a record;1458e5b70 discards it. The prefix test
at1458e4c20..1458e4cb3 compares all10 bytes of `legendary:` before comparing the
suffix, while the ordinary comparisons retain the original full-string pointer.
Both the length dispatch and complete equality tests matter. For example,
`legendary:hammer_of_justice` uses a16-byte comparison plus its final byte;
`legendary:demonic_empowerment` compares two overlapping16-byte spans.

`coop::client_state::recognized_seen_key` contains the sorted exact set and uses
binary-search membership. The existing `accept_seen_grants` applies this predicate,
quality≤4 and the native400 accepted grants per-zone budget. The account consumer
and persistence ownership remain described by
[the wire/state recovery](coop-replication-0.115.0.md).

[Canonical evidence](evidence/0.115.0/coop-seen/manifest.json) binds the complete
owner range, its retained Ghidra identity and every key's literal comparison
pieces to original EXE offsets. This range is separate from the similarly named
1459c4ae0 retained by the wire/state scope. No previous extract is duplicated.

Validation: `python3 -B scripts/check-coop-seen.py` verifies the installed
identity, native range,142 literal reconstructions, source set/order and separate
quality/quota gates. Rustfmt parsed the source through stdin without compiling.
Compilation, original/rebuilt sessions and account-runtime parity have not run.
