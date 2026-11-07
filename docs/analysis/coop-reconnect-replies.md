# Cooperative relay reply ordering

Finding [#213](../verification-needed.md#gap-213). The
[bounded proof](evidence/0.139.2/coop-reconnect-replies.json) binds the
installed 0.139.2 EXE with SHA-256
`0bb6c557c5f6cfeea212761a33554f9a5647ce7cb7e03b8a163b95489496e908`.

The service pump at `0x145f8a9d0` calls receiver `0x145f90810` with
peer ID zero for guest ingress at `0x145f8b0e6` and with the decoded
peer ID for host ingress at `0x145f8c518`. Both paths resume event
cleanup at `0x145f8c381` after the receiver returns. Inside that receive
call, the immediate control or missing-range reply at `0x145f910cd` and
each retained payload reply at `0x145f9118e` invoke the same writer
`0x145f8a8f0` with the receiver's peer ID.

The writer reads the selection at service `+0x60`, chooses the worker
pair at `+0x130/+0x138` or `+0x180/+0x188`, serializes the reply
through `0x1461aa410`, and calls the chosen worker's submit slot
`+0x18` before returning. The reconstructed directory handler drains
the guest or host receive replies before the next service event and
before the selected-secondary retry poll. This corroborates the
[retained 0.127.0 ordering proof](relay-load.md#reconnect-reply-ordering-213)
for the installed target.

`python3 -B scripts/check-coop-reconnect.py --current-replies` checks
seven hash-bound instruction ranges, 23 instruction anchors and nine
original-instruction writer routing cases. The bounded routing cases
stub serialization and stop at the worker submission call. Live source
order guards and two Rust syntax parses pass. Compilation, actual
reconnect and socket delivery, and original/rebuilt parity remain open.
