# Process and run seed construction

Target: installed **0.109.0**, SHA-256
`76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0`.
The [manifest](evidence/run-seed/manifest.json) binds fresh REA/Ghidra
imports, original PE instructions and the connected source. This report owns
this constructor dependency of [gap #9](../verification-needed.md).

Current main `1400015ba..140001619` samples the system clock, obtains the
unsigned duration since Unix epoch, and uses `seconds*1000 + nanos/1000000`
with u64 wrapping. A failed duration conversion uses seed **1**, rather than
zero or a new random sample. The timestamp is sampled once after argument
collection. It passes unchanged through `14000e690`, `145891530` and
`1458d05c0` into server constructor `1458acff0`, which stores it at `+1118`.

Both first world entry (`1458b3ff7..1458b401d`) and the replacement factory
used by Again (`1458be1f5..1458be222`) advance that same state exactly once:

```
state = state * 0x5851f42d4c957f2d + 0x14057b7ef767814f  (wrapping u64)
```

The resulting u64 is the Game constructor's definition field `+110`.
Current constructor `14592d7e0` calls `14590c4d0` to expand it into eight PCG32
outputs. Each expansion step advances a private copy with multiplier
`5851f42d4c957f2d` and increment `a17654e46fbe17f3`; its xorshift/rotate output
is packed in little-endian order into four u64 words. An allzero expanded
state uses SplitMix64(0), called at `14590c64f`; all four fallback constants
are retained in source and checked against that actual native callee.
The Game's existing shared xoshiro256++ consumers then use those words.
Randomness consumed by one Game does not change the next run's server seed.

The reconstruction previously read 32 new OS entropy bytes on every run.
`run_seed.rs` now owns the one process timestamp and persistent LCG, main
samples it at startup, and `gameplay::enter` supplies its expanded words to
the existing shared Game RNG. It no longer introduces an entropy-failure
picker dialog for an operation absent from this native constructor chain.
No unrelated random consumer or name/appearance generator was changed.

Factory `1458bdf90` returns its no-context variant at `1458be042` before seed
advancement when no run context is held. The source's early entry guard likewise
leaves its seed untouched. The recovered Game factory otherwise constructs the
Game directly; allocation/assertion failures reach their fail-fast owners.
Missing recovered catalogs/world entries in the reconstruction remain explicit
reconstruction diagnostics; their picker message is not claimed as a recovered
native error presentation.

`python3 -B scripts/check-run-seed.py` checks all native/text digests
and passes **122 unchanged native cases**: the clock conversion (success, failed duration,
submillisecond and u64 overflow boundaries), both LCG owners across repeated
runs, full PCG32 expansion, actual zero-state fallback and no-context return.
It also checks the live source connections; these guards do not execute Rust.
Native clock APIs, external callees, OS entropy, threads/sockets, Game execution,
rendering and gameplay are not executed. Rust syntax parsing is separate from
compilation; no build, compiling tests or game comparison was run.
