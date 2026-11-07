# Meter snapshot clock

The installed EXE is SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the bounded source correction under **#252**, discovered while
classifying the `0x1401c98a4` meter mode consumer under #41.

The current display owner `0x1401c8e30` reads the exact four-byte key `time` from
its HUD snapshot at `0x1401c8fdf..0x1401c9048`, before selecting any meter mode.
It defaults to zero for an absent or nonnumeric value and admits the JSON
number's signed, unsigned and f64 representations. This clock feeds baseline
rewind detection, sample history and elapsed/rate calculation. The separate
replicated State clock is not an input to this read.

The connected source already keeps received HUD data in
`Mechanics::apply_replica_hud`/`replica_hud`, while State projection updates the
game clock independently. The meter view previously always used `game.clock`.
Consequently a guest with HUD `time=5.25` and State clock81 calculated its view
against81. The [source correction](../../crates/azeroth-survivors-re/src/gameplay/meter/view.rs)
now uses the received HUD time when that snapshot exists and keeps the local
game clock for a local simulation. It preserves the native missing/wrong-type
zero fallback. This fixes the clock source for every meter mode; Party DPS's
fourth mode is a separate source addition under #251.

The [bound evidence](evidence/0.121.0/meter-clock.json) records eight passing
unchanged-instruction cases, including HUD ahead of/behind State, signed and
unsigned numbers, f64 zero, missing, null and wrong-type data. Its only semantic
seam is JSON lookup with the exact `time` key and root HUD pointer. Native code,
conversion constants, query receipt and the source clock expression are bound
independently; the surrounding JSON library is not reconstructed here.

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs \
  python3 -B scripts/check-meter-clock.py
```

The journaled snapshot query and its canonical raw input are shared with the
Party DPS recovery. Raw-slice pseudocode has a generic ABI and omits external
data/callees; original instructions govern this bounded register/stack read.
The check executes native instructions in synthetic memory and inspects the
source expression. Rust compilation, reconstructed client/server/game execution
and original/rebuilt parity were not performed.
