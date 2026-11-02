# Cooperative packet smoothing — 0.123.0

Findings **#268/#269** are source/static repaired against the installed
146,228,736-byte EXE, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
[verification-needed](../verification-needed.md) owns the current status. The
[proof](evidence/0.123.0/coop-smoothing/manifest.json) extends the retained
[initial smoothing evidence](evidence/0.123.0/pick-smooth/manifest.json).
Compilation, actual multiplayer motion and original/rebuilt parity remain
unverified.

## Clock producer and lifetime

The host party update at `145c13044..145c13149` requires the Hosting variant
and at least `1/60` second since its preceding flush. It converts application
seconds to milliseconds as a saturating `u64`, then retains the low `u32`.
`145c13384..145c13482` prepends this message to each **nonempty** recipient
queue before the existing flush; it does not create idle clock traffic.
Serializer `145ccac10`, table `1476b84f4[20]`, and selected branch
`145ccbbf8..145ccbc15` establish **wire tag21 followed by little-endian u32**.

Guest dispatcher `145c2f6a0`, table `1476acce4[19]`, and
`145c305b2..145c305eb` feed that word and current application seconds to
`145be08a0..145be0a5e`. For each sample, the offset is
`now*1000 - host_milliseconds`. A monotone queue removes samples older than
**10 seconds**, removes trailing offsets greater than or equal to the new one,
and appends the sample. Delay is `max(current_offset - minimum_offset, 0)`.
The packet consumer admits zero below **40ms**, retaining the full delay at
40ms and above. This measures excess arrival delay above the recent baseline,
not round-trip latency or a globally synchronized clock.

`coop/session.rs::Session::flush` now prepends `NativeMessage::Time` at the
existing host cadence, and `coop/replication.rs` owns the tag21 codec. Guest
reception samples it before packets later in that batch. `Session::smooth`
owns the delay queue and GUID records. Native ZoneKey handling at
`145c2fd18..145c2fd63` resets run-cache fields without clearing the smoother,
so the source preserves it through ZoneKey and End. Closing or replacing the
party Session discards it. Object destruction retires its individual GUID.

## Engine packet adapter

The sole direct caller at `145c30abf` applies
`145be0a60..145be1534` only to admitted synchronized guest packets, after
the existing opcode/length gate and trust transformation. Source
`gameplay/coop.rs::receive` uses this same order, then passes the resulting
bytes to the existing benilla decoder and inbound wire consumer.
`coop/smooth.rs` implements the AS adapter; the shared movement and spline
engine remains its consumer. The independently repaired source-slot broadcast
exclusion under [#270](../verification-needed.md#gap-270) keeps ordinary guest
movement from returning to its controlling client.

The packet contracts are:

| Input | Recovered transformation |
| --- | --- |
| Destroy0xaa | With at least eight body bytes, remove the plain-u64 GUID's interpolation record and forward the packet. |
| Movement0xb5–0xcb except0xc7, plus0xda/0xdb/0xee | Parse the packed GUID and require 24 following bytes. Direction is `(forward-backward, left-right)`, normalized and rotated by orientation. Advance only XY by `min(delay/1000,1)*7` yards; preserve opcode, flags, timestamp, Z and remaining bytes. Zero direction and other opcodes pass through. |
| Spline0xdd, nonzero move type | Sample the GUID's previous record at current wall time. Keep that point only within20 XY yards of the incoming start. With a prior record and distance strictly greater than1 yard, send a run spline back to the incoming start at7 yd/s. Otherwise record a zero-duration point and forward the original packet. The original unordered comparison is retained. |
| Spline0xdd, move type0 | Only a complete single-destination body is transformed. Treat duration0 as1ms. Advance the raw start toward its destination by `min(delay/duration,1)`, then retain a prior sampled point only within20 XY yards of that delayed start. With zero delay and displacement strictly below0.25 yard, retain the original start/duration and packet. Otherwise use the catch-up duration below. Unsupported counts and truncated bodies pass through. |

For a moving spline, base speed is
`max(XY_distance(raw_start,end)/(duration_ms/1000),1)` in f32. Catch-up duration
is the maximum of the f32 travel time at `base_speed*1.6`, converted to f64
milliseconds, the nonnegative original duration minus admitted delay, and1ms.
The record retains f64 duration/start time and f32 endpoints. Sampling clamps
`(now-start)*1000/duration` to `[0,1]` and lerps all three coordinates; distance
gates and speed use XY only. The packet duration separately truncates/saturates
to u32. Builder `145c67c50..145c67eed` writes a packed GUID, start, preserved
spline ID, move type0, run flag0x100, duration with zero replaced by1, one
destination and XYZ. It replaces any original stop/facing/flag representation
only on the demonstrated transformation branches.

## Static checks and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs \
  python3 -B scripts/check-coop-smoothing.py
```

The [saved result](evidence/0.123.0/coop-smoothing/static-check.json) verifies
target bytes, data, jump-table cells, saved journaled
Ghidra subjects and live source wiring. **1,164 isolated native cases / 141,559
original instruction steps** cover the opcode/flag matrix, rotated directions,
40ms threshold, one-second extrapolation cap, single-destination admission,
zero duration,20/1/0.25-yard boundaries,1.6 catch-up duration, GUID removal,
rolling-window expiry, clock conversion/wrap and exact tag21 serialization.
Hash-map operations, CRT math, allocator release and typed packet/writer
boundaries are synthetic seams. These cases do not execute the Rust source or
the application, transport or game.

The raw Ghidra caller and serializer subjects omit their distant jump tables,
so their decompilations stop at dispatch. Hash-bound current PE cells and the
selected original instructions establish these branches independently. Raw
subjects also omit external function/data context and infer ABI types; original
Win64 instructions govern the recovered argument and arithmetic contracts.
The work does not certify general engine completeness, service deployment,
rendered movement quality or gameplay parity.
