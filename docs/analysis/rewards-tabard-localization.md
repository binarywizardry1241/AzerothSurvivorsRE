# Rewards tabard names

Selected installed EXE: **0.119.0**, 145,357,824 bytes, SHA-256
`6cb443c6ee7bd8c6e08ea9fd22f715f21ef4bd9aab4f58caff83371fdb9e198f`.
[verification-needed](../verification-needed.md) owns permanent finding **#171**. The
[0.118.0 investigation](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/locale-catalogs-0.118.0.md) remains historical evidence;
the [current contract](evidence/rewards-tabard-localization/contracts.json)
independently binds the native inputs, tab selection, name helper and card output.

`progression/rewards.rs::tabards` now looks up `tabard.<id>` in the live menu
catalog and uses the descriptor's original name only when that key is absent.
The former literal-name lookup missed every tabard ID translation. This repairs
all **21** cards, including `tabard.90025` for Contest Winner's Tabard. A present
empty value or value equal to the key stays present; the fallback descriptor is
not translated a second time. Purchase/admission and worn/planned state remain
the inputs of the existing card consumer.

The live source route is `progression::rebuild` on `Page::Rewards`, then
`rewards::draw` with the current `MenuCatalog`, its tab-2 branch, and the name
text inside each `tabards` card. `Localization::menu_catalog` overlays the chosen
locale on English. The [current loader/lookup recovery](localization-loader.md)
separately establishes the selected-map then English priority and preservation
of empty values; #169 owns those dependencies and complete catalog import.

## Current native connection

The independently decoded current PE and seven completed journaled Ghidra
queries establish this bounded UI route:

| Current boundary | Observed connection |
| --- | --- |
| `1402073b0..140207c7f` | Its pane call at `140207af3` reaches `14034b650`. |
| `14034b650..14034be0e` | Reads selected tab at state `+0x74`; equality to 2 reaches `140209d20` at `14034b96f`. |
| `140209d20..14020a430` | Calls the tabard grid at `14020a3bd`. |
| `14034db40..14034e053` | Passes all 21 descriptors in `[1461ada50,1461adf90)`, in order, to `140203e00`; the call sites and RIP-relative arguments are individually checked. |
| `140203e00..140204910` | Carries the descriptor and available/planned/worn inputs into the card at `1402048c9`. |
| `1403470a0..1403476cd` | Calls the name helper at `1403473a3`, copies its pointer/length into the card's text bundle, then calls the shared text-widget boundary. |
| `145aab4a0..145aab537` | Reads the descriptor's u32 ID at `+0x30`, formats with the exact `tabard.` record at `1472c8640`, calls lookup `145b29ab0`, and retains the descriptor name only for a null lookup pointer. |

The helper's `test rdi,rdi` and conditional pointer/length moves at
`145aab51e..145aab529` distinguish absence from an empty or key-equal value.
Its formatting adapter at `145f789e0` reads the ID as u32 and selects radix 10
at `145f789ed..145f789f5`; this bounded input check does not reconstruct the
surrounding shared integer formatter.
Ghidra's raw imports infer a generic GCC ABI and omit PE globals and external
functions; independent PE instructions establish the Windows-x64 arguments and
pointer/length flow. Preferred PE addresses are static observations.

The 21 current descriptor IDs/names match the effective source catalog after its
party-reward insertion. Every one has an ID key in all fourteen current native
locale payloads, and none has a literal descriptor-name key. The checker reads
the exact descriptor-bound payloads in place, verifies their hashes, and checks
the corresponding source values without duplicating complete payloads. The
inventory/template name consumer remains separately owned by #161; achievement
unlock names remain separately owned by #172.

## Static checks and limits

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs python3 -B scripts/check-rewards-tabard-localization.py --queries
```

`--queries` additionally checks retained local journals/results; omit it when
only the portable curated proof and configured reference EXE are available.

The replay verifies **seven native extents (11,908 bytes), 27 direct call edges,
21 descriptor arguments and fourteen locale name joins**, canonical helper/card
assembly, helper pseudocode, query commitments and the actual source UI wiring.
The changed Rust module also passes syntax-only parsing with the existing
`rustfmt` executable; whitespace review passes. These checks execute neither
the reconstructed Rust nor the native target. Full screen/control behavior,
compilation, interaction, rendered text/fonts/layout and controlled
original/rebuilt parity remain unverified. No further missing source operation
is identified within #171's tabard-name consumer.
