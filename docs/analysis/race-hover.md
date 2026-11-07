# Account-aware race hover guidance

Selected installed target: **0.120.0**, 145,447,424 bytes, SHA-256
`291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08`.
This report owns the source/static portion of **#191**. Actual hover, input,
layout, font/rendering and original/rebuilt parity remain unverified.

## Producer and consumer

The [picker contract](evidence/0.120.0/race-picker/manifest.json) and
[hover contract](evidence/0.120.0/race-hover/contract.json) retain the current
native chain. They preserve two durable Ghidra query commitments and 309
independently decoded original instructions, including the previously retained
[restriction footer](evidence/0.120.0/race-unlocks/restricted-race-tip.asm).
Assembly is canonical per range; the hover proof adds only missing ranges.

| Boundary | Observed contract |
| --- | --- |
| Picker `1402fccf5..1402fcd26` | Passes the selected Pick class byte and account to `145a97aa0`; the returned base-plus-purchased vector is the eligibility input. The union's owning source/evidence is the [shared race contract](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-contracts-0.120.0.md). |
| Membership `1402fd659..1402fd6cc` | Tests the current race against that vector, retaining the result in `DIL`. |
| Carrier `1402fdd55..1402fdd8c` | Places the allowed flag and race ID in consecutive bytes of the typed race-row component. The associated click registration is also gated by eligibility and current selection. |
| Hover `14024c7d2..14024c82f`, `14024c91c..14024c981` | Both query-storage paths select two-byte component rows. The existing shared ECS query/bundle matching is an explicit interface seam. No surrounding ECS subsystem is reconstructed. |
| Descriptor and call `14024d01c..14024d028`, `14024d3a6..14024d3d4` | Uses row byte 1 for the race descriptor. The RaceTip argument bundle retains the row pointer at `+0x18` and Save at `+0x20`; call `14024d3cf` invokes `1402f8e00`. |
| Footer `1402f97e9..1402f9b3c` | A nonzero supplied allowed byte skips both restriction lines. Otherwise the existing class-specific `armory.not_open_to` line precedes the localized hint below. Both use font size 12 and weight 400; the hint uses muted RGB `(0.725, 0.663, 0.510)`. |

The exact 55-byte hint is:

> Open it to every class on the Rewards tab, under Races.

The current [locale dependency](evidence/0.120.0/race-locales/manifest.json)
recovers that key's native translations in all fourteen catalogs. The existing
selected-language, English, then literal-key fallback remains the localization
boundary. Raw Ghidra imports omit PE globals and original Rust types; the
original PE instructions, exact range commitments and the typed-interface seams
above bound the conclusions. The initial saved full-PE reference list omitted
the direct call; its absence was not used to infer an absent consumer.

## Connected source

`armory/race_tip.rs::update` now uses `state.save.allowed_races(class)` for the
footer gate, sharing the account-aware union used by the picker. A normally
eligible or permanently bought race omits both restriction lines. A locked
race retains the translated class restriction and adds the exact hint through
`MenuCatalog::label` and the existing `flow_text` consumer, with 12px body font
and `menu::MUTED` color. The state/catalog change guards rebuild an
unchanged hovered race when ownership, class or locale changes.

The source uses the existing Save and locale dependencies from **#187/#188**;
it adds no competing eligibility table or translation catalog. Persistence and
purchase semantics retain their own **#188/#189** ownership. Historical broader
RaceTip geometry and racial-description recovery retain their original target
and do not become proven 0.120.0 presentation through this footer repair.

## Static check

With the existing Capstone and Unicorn installations on `PYTHONPATH`:

```sh
python3 -B scripts/check-race-hover.py --queries
```

The [retained result](evidence/0.120.0/race-hover/check.json) records **1,016
synthetic native cases**, **309 exact original instructions**, and **two
verified durable queries**. The cases cover all fourteen current catalog
inputs, nine class names, both actual allowed values, and both recovered font
reference representations; a separate exhaustive raw-byte guard sweep checks
the comparison's zero/nonzero behavior without claiming invalid Rust booleans
are admissible inputs. The footer replay executes 35,306 original instructions.

The check observes the class restriction, locale-key lookup and widget
publication order, exact text, font size/weight and colors. Class naming,
token formatting, localization services, allocation/copy and widget publication
are explicit synthetic seams. It also checks the live source gate, publication
order, state/catalog invalidation and current Save/localization interfaces.
It does not execute Rust or the renderer. Compilation, actual UI interaction,
font selection/rendering and original/rebuilt parity remain unverified;
**#191** retains those deferred requirements.
