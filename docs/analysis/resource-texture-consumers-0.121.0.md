# DUST2B model consumers — 0.121.0

Finding **#246**, lead **`RESOURCE1210:patch-B:DUST2B:consumer`**, now has exact
configured-model consumers. The selected EXE SHA-256 is
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [original resource receipt](evidence/0.121.0/resource-delta.json) binds the
new patch-B texture and its archive/member identity. The separate
[consumer proof](evidence/0.121.0/texture-consumers.json) binds the current model
texture records, filename ranges and particle-emitter records.

## Observed consumers

The exact authored filename is
`WORLD\GENERIC\PASSIVEDOODADS\DUELINGFLAG\DUST2B.BLP`. It is referenced by
these four current MD20 v256 model members in `patch.MPQ`:

| Model | Texture index | Particle emitter index |
| --- | ---: | ---: |
| `Spells\Blink_Impact_Chest.m2` | 1 | 2 |
| `Spells\Clearcasting_Impact_Chest.m2` | 2 | 2 |
| `Spells\Enchantments\Shaman_Rock.m2` | 0 | 0 |
| `World\Generic\PVP\Warsong\WarsongGulch_Orc_door01.m2` | 2 | 0 |

Every matching texture has authored type0, and the selected emitter's u16
texture index at record+0x16 names that exact texture row. This establishes
shared spell, enchantment and world-model particle context. The directory name
does not establish that the DuelingFlag model itself consumes the texture.
There is no proved Explosive Orb relationship.

The existing `benilla-m2` texture parser reads the header+0x5c/+0x60 table,
16-byte texture records and bounded filename arrays. The existing
`benilla-formats::particles::parse_m2_particle_emitters` resolves emitter+0x16
through that texture table; `benilla-assets` requests its normalized texture
dependency through the existing MPQ chain. This route already supplies the
generic source consumer. No new AS state machine, renderer replacement or
gameplay source defect follows from this resource addition.

## Classification method and limits

```sh
python3 -B scripts/recover-resource-texture-consumer.py
```

The classifier streams **6,993 currently named model members / 275,146,928
payload bytes**, selected from the hash-bound current MPQ member inventory with
the existing highest-priority lookup rule. No model payloads were exported or
copied. All selected members were readable, with zero refused records. The
proof retains a deterministic ordered model-name/archive/payload-hash
commitment and only the four matching texture/emitter receipts. Archive table
hashes and member selectors are checked against the retained current archive
accounting.

The default command reproduces and verifies the complete curated receipt
without writing outputs. `--write` explicitly stages a refreshed receipt after
reviewing its selected inputs. The proof also binds the classifier, archive
reader, archive accounting and relevant source interfaces by hash.

The completed result is exact data-consumer and shared-context classification.
It does not establish which of those models an AS run actually selects, the
target's native compiled engine revision, actual resource lifetime, successful
decoding/rendering or original/rebuilt parity. Those unknowns do not authorize
generic engine reconstruction. No compilation, compiling test, application,
game/client/server/network operation or bitmap capture occurred.
