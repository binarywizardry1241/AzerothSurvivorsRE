# Again resets retained-player rune presentation

Findings **#265/#277**. Installed target **0.123.0**, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [manifest](evidence/0.123.0/again-runes/manifest.json) binds four new
journaled Ghidra subjects and reuses the existing command6 query. Object
retirement retains its separate [owning proof](again-retirement.md).

## Recovered replacement boundary

Command6 retires the previous world's objects, calls replacement factory
`145c26320` and takes its new Game. The factory calls current Game constructor
`145b15970`; it does not reuse the old run's aura vector or numeric state.
The retained client and player GUID survive this operation.

The direct publication at `145c24baf` calls player descriptor `145b08d20` with
the replacement Game. Its two exact loops write **zero to all 48 aura ID fields
47–94 and six aura flag words95–100**. This is an explicit native reset; it
does not follow merely from the old Game being dropped. The selected reset
does not write application words113–124. Existing ordinary aura publication
owns the replacement run's later active effects, including permanent benefits.

The caller captures the old Game's next mover serial **N** from its field+5a0.
It then publishes, in order:

| Packet | Native builder | Serial / value |
| --- | --- | --- |
| Unroot, opcode`ea` | `145c67620` | wrapping`N+10` |
| Spawn relocation, opcode`c7` | `145c74b00` | wrapping`N+11`; new Game position and selected zone facing |
| Forced run speed, opcode`e2` | `145c6a940` | wrapping`N+12`; new Game cached speed+5a4 |

The caller stores wrapping**N+13** as the replacement Game's next serial at
`145c24ce4`. The speed send is unconditional: the ordinary0.01 speed deadband
does not gate this direct publication. Thus a fresh default7.0 must reach a
retained client that previously received a Speed Rune increase. The new cached
speed may instead include the new run's race/equipment/talent bonuses; the
reset does not hardcode7.0 or discard those benefits. Ordinary constructor
packets remain queued for later delivery after this direct reset.

## Source connection

`TerminalState` captures `Mechanics::player_mover_sequence` while the old Game
still exists. It retains that value only across an admitted Again replacement,
consumes it during successful entry and discards it after failed admission or
replacement. Ordinary Play, absent Game and inactive-client paths do not use it.

After fresh composition and `finish_player_entry`, the entry owner calls
`restart_player_entry` with that saved serial and the selected zone's spawn and
facing. The method prepends the exact54 zero fields, unroot, relocation and
unconditional cached-speed events to the new Game's event queue, then leaves
its next serial atN+13. Existing constructor events retain their order after
the prefix. The ordinary event adapter publishes actual player-GUID fields and
mover events through existing local and synchronized co-op packet consumers.
Guest Again retains its separate admitted-cache/logout path.

Fresh `Mechanics` already excludes the previous rune aura and timer; the normal
48-slot projector, `LocalClientSession::begin` and FrameXML snapshot publish
the new aura state. No rune-only mutation or speculative permanent-effect
removal is added. The previous local body re-creation also supplied fresh run
speed and masked a lasting carry locally, but it omitted this recovered
retained-client packet and serial handoff. Static source correspondence does
not establish an observed original-game defect or live reconstructed behavior.

## Static checks and limits

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-again-runes.py
```

The checker verifies **1,428 current instructions**, all five query commitments
and their exact PE slices. **103 isolated original-instruction cases /
129,699 steps** cover empty and existing aura-map entries, the complete54-field
reset, default/bonus speeds, compact/full GUID packing, all three outgoing
serials and wrap boundaries. Source guards and three Rust syntax parses pass.
Two Rust regressions cover an active old Speed Rune, preserved fresh aura and
speed benefits, queued constructor packets and wrapping serials; they remain
uncompiled and unrun.

Native BTree insertion/allocation, packet delivery, selected zone lookup and
shared teleport serialization are explicit fixture seams. The actual aura
loops, caller ordering/arithmetic and speed/unroot serializers execute only as
isolated original instructions. The selected constructor/raw-import
decompilations retain inferred types, missing external callees and stack-probe
limitations. The fixtures do not execute Rust, Bevy scheduling, MPQ resources,
networking or a game/server. Compilation, real Again/input/ACK timing, actual
buff/controller rendering and original/rebuilt parity remain unverified.
