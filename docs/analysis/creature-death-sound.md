# Creature death sound replacement

Permanent **#182**, discovered under **#41**, lead
**Q41-I01:resource_path:221**, **Q41-B02/R01**. The installed EXE is
145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
[verification-needed](../verification-needed.md) owns current overall status. The
[compact proof](evidence/0.119.0/creature-death-sound/manifest.json) binds both
native functions, original Ghidra queries, installed table and source consumers.

## Exact native operation

The same startup bootstrap recovered under [#181](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/run-level-cap-0.119.0.md)
calls `145b45d30..145b45e4d`. It reads the exact 35-byte path
`DBFilesClient\CreatureSoundData.dbc`, calls `145b45bf0..145b45d27`, and publishes
the returned bytes under the same path only when the transformation succeeds.
A read error or rejected table emits a diagnostic and publishes no replacement.
The existing bootstrap extract/query is reused without another native copy.

The complete transformation accepts only:

- At least sixteen header bytes and the exact `WDBC` magic.
- At least seven columns; `columns * 4 <= record_stride`, using widened values.
- A complete declared record extent: `20 + rows * record_stride <= input_size`.

It clones the complete supplied byte vector and visits field index **6**, four
bytes at `20 + row * stride + 24`, in every declared row. Exactly **8449**
(`0x2101`) becomes zero. Other death IDs, row IDs, all neighboring fields,
padding, the string-size header field, string bytes and trailing data survive.
There is no row-ID filter and no boss, roster, class or phase condition. The
string block's declared extent is not validated by this transformation.

The installed table has 406 rows, thirty fields and stride120. Exactly one row,
ID **2068**, has death8449; its transformed whole-file digest is recorded.
That observation does not turn row2068 into a hard-coded source exception.

## Live source connection

The source previously loaded the unmodified table into its shared voice cache.
`gameplay/client/addon_bootstrap/creature_sound.rs` now supplies the exact raw
transformation through `LocalClientExtension::creature_sound_data_patch`.
The extension is constructed before startup. The existing creature-voice loader
reads this optional policy after `AssetSet::Open` and supplies the transformed
bytes to the existing parser before publishing `CreatureVoices`. A rejected
transformation retains the original input, matching native failed replacement;
read failures retain the ordinary loader's error path. The generic parser and
its existing malformed-table behavior are unchanged.

`benilla-formats::load_creature_voice_catalog_with_patch` is the necessary
shared input boundary; the ordinary entry point delegates with no patch.
It preserves model/display lookup, fallback, all thirty field projections and
other client behavior. No generic archive-overlay subsystem or installed-file
write is introduced.

The actual parser projects field6 into `CreatureVoice::death`. Every current
death-voice consumer uses this same published catalog: health-to-zero or dead
flag edges enter `death_vocals`, resolve display/model metadata and select
`BARK_DEATH => voice.death`. The existing bark owner retains priority and
stops the previous voice before its zero-kit return, so the native replacement
does not introduce another timing or cancellation policy. Nonzero kits continue
through the existing `SoundKits` cache/resolution and mixer interfaces.

The other raw `CreatureSoundData` reader in `formats::creatures` collects only
row IDs for display validation. Those bytes are unchanged. Footstep, combat,
animation, pet and looping sound consumers use the shared voice catalog's
other preserved fields. Explicit `SMSG_PLAY_SOUND` kits and boss-arrival voices
under #29 remain independent; kit8449 is not removed from the sound-kit catalog.

## Static checks and limits

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs python3 -B scripts/check-creature-death-sound.py --queries
```

The checker passes **505 bounded original-instruction cases**, including the
complete installed table, field/stride/row combinations, header truncation,
unsigned bounds, empty tables, preserved non-death matches and trailing bytes,
and the complete patcher's read/reject/publish branches. Allocation/memcpy,
archive reads, diagnostics and replacement publication are explicit synthetic
seams; unreviewed calls fail. Original input bytes remain immutable in every
case. Complete current assembly, exact native extents/path, original Ghidra
journals/results and source registration/parser/cache/death-consumer checks
are retained. Two authored Rust regressions are uncompiled/unrun.

The shared adapter supplies raw bytes before the existing parser; native and
source raw-table admission are independently traceable. Source guards and
Rust syntax parsing do not prove compilation or execution. Actual cache/audio
timing, audible behavior, platform/client execution and controlled original/
rebuilt parity remain unverified. This does not close #41's remaining data,
alias, type or source-ownership populations.
