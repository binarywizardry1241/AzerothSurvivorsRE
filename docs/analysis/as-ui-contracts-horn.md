# Reward ability eligibility

Gap **#41**, selected installed EXE SHA-256
`58b484d4a5f145ba41b1241c184c38202e871fdd7aa4a6b90536d0503ecba6bb`.
The [native/source proof](evidence/0.113.2/as-ui-contracts-horn.json) binds the
current reward owner, exact predicate prefix, 113 ability descriptors and source.

The existing reward pool omitted Horn of the Warchief when Demonic Empowerment
was the player's only qualifying buff. Current native reward generation
`14596cbb0` checks the base ability and every learned ability. Kind `9` and the
unsigned `(effect_tag - 7) < 7` guard plus mask `0x4f` admit native effects
`7, 8, 9, 10, 13`. Current Demonic Empowerment has kind `9`, effect `10`.
The source predicate now includes that lane, and the live cache/guardian reward
pool uses it through its existing ability projection.

All 113 current descriptors match source keys and kind fields. Effect tags are
semantic source values: current Demoralizing Shout `11` is source `10`, immunity
`12` is source `11`, and reflection `13` is source `12`; Empowerment retains
`10`. These are distinct consumers despite the historical shared numeric lane.
The correction preserves the source catalog's established representation.

`check-horn-offers.py` executes the complete original base/learned
predicate prefix for all 113 descriptors in each position: **226 cases**, with
no calls or external seams. Source checks retain the actual new-item pool gate.
The related Rust regression follows Empowerment through `cache_candidates` and
checks the neutral pool; it was authored but not run. Fresh REA/Ghidra recovery
of the complete reward owner supplies corroborating evidence. Its raw import
does not include external calls or immutable tables; the fixture reads the
current PE directly and does not infer complete ownership from pseudocode.

Reproduce without compiling or launching a game:

```sh
PYTHONPATH=runtime/tool-state/python/camera/python-libs:runtime/tool-state/python/armory/python-libs python3 -B scripts/check-horn-offers.py
```

This establishes the selected reward-input contract, not complete choice flow,
arbitrary mutable aliases, ECS resource identity or engine behavior. Compilation,
actual selection/rendering/persistence and original/rebuilt parity remain
unverified. The broader #41 contracts retain their owning limits.
