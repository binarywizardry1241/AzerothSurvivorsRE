# Discord IPC transport

Installed target SHA-256:
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
This report owns the native Windows worker and wire connection under #17.
The snapshot/publisher report separately owns activity construction and the
Options CVar. [verification-needed](../verification-needed.md) owns integrated status.

The source previously exposed `discordPresence` without a live presence worker.
The new `discord/transport.rs` connects the activity receiver to the local desktop
Discord IPC service. No service request was made during reconstruction.

## Recovered worker

The [manifest](evidence/0.109.0/discord-transport/manifest.json) binds eight current
ranges, fresh REA/Ghidra profiles and canonical C/assembly. Publisher spawning
reaches `1401a5860`, the standard thread builder `140046860`, thunk `14004e850`,
payload `140090800` and worker `140067fc0`. Ghidra's raw import signatures are
provisional; Win64 callsite/register operands determine the actual contracts.

The worker receives with a one-second timeout, drains queued updates and keeps
the latest activity. None drops the connection and last-sent activity; it does
not send a synthetic null activity command. An equal activity is not resent.
Sends are separated by at least four whole elapsed seconds, including failed
attempts. The first send is immediate. A wrapping u64 nonce increments before
formatting, so the first command carries the decimal string `1`.

Endpoint iterator `1400a91d0` produces `\\.\pipe\discord-ipc-0` through `-9`.
Each pipe opens for reading and writing. Handshake opcode 0 carries
`{"v":1,"client_id":"1559232589020012564"}`; its reply must have opcode 1.
The ordinary opcode 1 payload contains `cmd: SET_ACTIVITY`, `args.pid` for the
current process, `args.activity` for the latest snapshot and the nonce string.
Failed endpoint scans or ordinary write/read failures drop the connection and
set a twenty-second retry deadline. Retry scheduling remains on the worker;
the menu never blocks on IPC.

Successful command replies are decoded as JSON, with invalid JSON becoming
null. `evt: ERROR` logs `data`; it does not invalidate a successful transport
exchange or cause the same activity to be resent. The native worker reads one
reply after each handshake/command; it has no separate invented ping/pong loop.
Channel shutdown ends the worker and drops its connection.

## Frame contract and validation boundary

Write owner `14006b080` serializes the JSON Value, prefixes little-endian u32
opcode and u32 body length, then writes the full frame. Read owner `14006af20`
reads exactly eight header bytes, rejects body lengths above 1,048,576, reads
exactly the admitted length and rejects opcode 2 as a closed connection.
Other opcodes survive for the caller to interpret. Standard read/write helpers
retain their ordinary full-buffer/retry-on-interruption behavior; the source
uses `Read::read_exact` and `Write::write_all` through the platform file adapter.

`python3 -B scripts/check-discord-transport.py` passes **138** current
original-instruction cases: 90 complete read-helper cases across six opcodes,
five lengths and three I/O outcomes; 32 complete write-helper cases; twelve
send-throttle branches; and four wrapping nonce boundaries. Explicit seams
supply JSON serialization, read/write results, allocation/free and clocks.
This does not certify those libraries, OS calls, full-channel scheduling or
Discord server behavior. Source traces separately cover endpoint count,
handshake/command schemas, opt-out, deduplication and retry consumers.

Only a Windows native artifact was supplied. Unix endpoint discovery is not
present in it, so non-Windows transport returns Unsupported rather than
inventing a target implementation. That platform-specific source boundary
remains open; it cannot be revalidated from this Windows EXE. The recovered
Windows source path is connected. Compilation, actual IPC, Discord desktop
interaction, cancellation of an OS-blocked pipe, and original/rebuilt runtime
or platform parity remain unverified. No build, compiling test, game or real
IPC operation ran.
