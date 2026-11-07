# Faction-based permanent Druid forms

This report owns the source/static repair for **#190**. The selected installed
EXE is 0.120.0, 145,447,424 bytes, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
[verification-needed](../verification-needed.md#gap-190) owns its remaining validation.

## Recovered contract and source correction

The retained [current native contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.120.0.md#horde-and-alliance-druid-forms--190)
and [canonical instructions](evidence/race-unlocks/manifest.json)
bind descriptor `145b7b820`. The existing full-PE Ghidra result
`ev_0892f2bc62e89c57a8d5182ae620a92fd1d060bab4b2184a4e8084ef964ee36f`
was reused after checking its saved result, plan, journal, target and normalized
result hashes. No new import or query was required.

The race byte at Game+33d selects the Horde family when race ≤8 and the
corresponding bit of `0x164` is set: IDs **2, 5, 6, 8**. Other byte values use
the other family; there is no masked-shift alias for out-of-range races.
The source formerly tested only race6. `run_effects/forms.rs::display_override`
now uses that complete set.

| Permanent row at offset4 | Horde display | Other display |
| --- | ---: | ---: |
| Cat spell768, tag25 | 8571 | 892 |
| Dire Bear spell9634, tag25 | 2289 | 2281 |
| Other spell or tag | Continue the ordered scan | Continue the ordered scan |

The first recognized form wins. Empty rows, Shadowform15473 and unrecognized
permanent spells do not select a display. No class or sex predicate is added.
Field131 receives the form or the ordinary body when no recognized form remains;
field132 always receives the independently selected ordinary race/sex body.
The native nonzero-sex and out-of-range-race fallback branches are retained in
the bounded replay, without changing existing source admission or body lookup.
The [proof](evidence/faction-forms/proof.json) binds the two existing
instruction ranges and the independent 56-byte ordinary-body tables at
`1475f7a04..1475f7a3c`; assembly is not duplicated.

The actual entry producer stores `hero.race` in `RunPlayerStats.native_race`.
`Mechanics::player_form_display` passes it and the composed equipped rows to
the corrected selector. Solo `gameplay/client.rs` publishes changed field131,
retains the normal body snapshot, resets its cached display on teardown and
uses the ordinary body again after the form disappears. Cooperative
`player_snapshot_fields` uses the same selector over the ordinary player fields,
overriding field131 and preserving field132. The existing benilla model/value
consumer remains responsible for actual display updates. Account purchases and
new race/class admission are owned separately by #187/#188/#189.

## Static checks and limits

With the existing Unicorn and Capstone packages on Python's import path:

```sh
python3 -B scripts/check-faction-forms.py
```

The checker verifies the installed hash, retained original bytes/assembly and
compact native vectors, then replays **14,336 native instruction cases**:
256 race bytes × four sex bytes (0,1,2,255) × fourteen ordered effect lists.
It records both actual descriptor insertion arguments through an explicit
map-insertion seam. The cases cover absent/wrong-tag/unknown spells, both
Cat/Bear orders, repeated forms and a full-width unknown spell ID. Every case
preserves the independent body field and expected fallback.

The checked syntax of the small live Rust selector supplies **3,584 source
policy projections** against those native results. Fragment checks retain the
entry, Mechanics, solo, cooperative and shared body-field connections. These
are source checks, not execution of Rust, its scheduler or renderer. The Rust
regression now consumes the current native vectors across every race byte;
it was authored but not compiled or run. Rustfmt parsed the changed module
without compiling. The historical 0.105.0 vectors/report keep their provenance
and their former race6-only rule.

No remaining source dependency is identified within #190's recovered selector
and display-publication contract. Compilation, actual MPQ model resolution,
animation/attachments, form lifecycle/gameplay, cooperative delivery and
original/rebuilt rendering remain unverified. The filename-free AS descriptor
does not establish Game/Nav module attribution or broader native completeness.
