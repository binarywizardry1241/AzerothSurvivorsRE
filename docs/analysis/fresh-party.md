# Fresh-party relay reset

Installed EXE: **0.123.0**, 146,228,736 bytes, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [current proof](evidence/fresh-party/manifest.json) completes the
selected source/static work for **#207/#208**. The prior
[0.120.4 observation](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.4.md) retains its original target.

## Admission and end boundaries

The current parser `0x145e65370` maps wire21/22/27 to variants1/2/7. Its exact
dispatch table and discriminant producers bind the service pump's table at
`0x1476a1e9c`; these are actual guarded dispatch destinations, not inferred labels.
The saved pump query omits table memory, so original instructions and independently
read table values establish the selected branches.

- **Hosted21**, `0x145bd8229..0x145bd8286`, clears the inner relay map, truncates
  the guest inbox to zero, zeros its head, and clears guest fatal/reconnecting.
  It preserves the active-guest byte.
- **Joined22**, `0x145bd80ff..0x145bd8163`, sets active guest before the same
  reset. Both branches finish before publishing their admission response.
- **Closed27**, `0x145bd82fa..0x145bd83b8`, disables guest admission, drops the
  selected secondary, then clears the inner relay map. It preserves unread
  guest input and the remaining guest flags until subsequent admission.

The pump binds `service+0x1c8` to clear helper `0x145be0190`, which destroys all
pending payloads and empties its **112-byte peer rows** while retaining the
table allocation. Helper `0x145ccc2f0` receives `service+0x40` and length zero:
it drops every unread 24-byte guest payload descriptor across contiguous or
wrapped inbox segments and retains the buffer allocation. The following pump
store zeros the inbox head at `+0x50`; flags occupy `+0x1f8/+0x1f9/+0x1fa`.
Neither helper resets the outer host-endpoint map/listener backlog, service
transport, sender credit or ACK clocks. Existing close/retry ownership remains
separate; resetting the whole Service would change this contract.

## Connected source

Current receiver`145bdc810` immediately calls sender`145bd7aa0` at`145bdce1f`
when a control request has response=false; it sends response=true before returning
to subsequent service events. The saved [relay receiver proof](evidence/relay-load/manifest.json)
binds this dependency without a new query. The source's deferred `Relay::outgoing`
is an adapter queue, so its already admitted replies must reach the selected
worker before the next event clears rows or drops that transport.

`coop_directory.rs` therefore drains relay output first in Hosted21, Joined22
and Closed27. Both admission arms then reset before run/driver guards, new
Session construction or the guest Join handshake. Closed27 drains before
disabling guest admission or dropping its secondary. `session::service_party_reset` clears the actual shared guest inbox,
fatal/reconnect flags and inner `Relay`; Joined sets active while Hosted retains
it. Closed27 invokes `service_party_ended` after secondary retirement.

`Relay::fresh_party` drops old sequence, pending payload, replay, ACK and control
rows. It discards any remaining adapter output only after the earlier native
send side effects have reached the worker; the later Last-stage source drain
cannot postpone them beyond retirement. Transport connectivity,
service clocks and credit retain their existing lifetime. Fresh queue production
therefore starts at sequence1, and the next guest handle cannot read old inbox
payloads. Ordinary handle replacement and temporary reconnect do not call this
fresh-party boundary.

## Static validation and limits

Three verified journaled Ghidra receipts bind the saved pump and both clear
helpers. Four original owner ranges contain **3,528 instructions**, with **361
selected instructions** and both exact dispatch tables independently checked.
**172 isolated original-instruction cases / 10,489 steps** pass: Hosted/Joined
flag/head state, empty/contiguous/wrapped inbox destruction, inner peer-table
payload destruction and Closed27 admission-byte retention. Fixtures supply
valid container memory; allocator deallocation and memset are explicit seams.
They execute no reconstructed application, socket or service.

The reused receiver query additionally binds a **12-instruction control-reply
tail**. Two isolated original-branch cases/14steps verify immediate true reply
for a false request and no second reply for a true response. This supplements
the unchanged172 reset cases rather than promoting their allocator/container
scope into transport execution.

The changed Directory Rust file parses through pinned rustfmt; the original
three-file reset syntax scope is retained. Three authored Rust
regressions cover service clock/connectivity retention and guest state/sequence
reset plus pending reply delivery before21/22/27, including reply-before-Stop
on Closed27. The earlier Off-path fixture now supplies an actual control(false)
request and expects response=true; an ordinary forward data gap does not request
control under the recovered policy. All Rust regressions remain **uncompiled and unrun**. No remaining selected source
omission is identified. Compilation, actual next-party admission, transport
delivery and original/rebuilt parity remain unverified.

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-fresh-party.py
```
