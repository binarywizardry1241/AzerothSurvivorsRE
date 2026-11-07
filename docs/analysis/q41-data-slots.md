# AS fixed data-slot interfaces

Permanent **#41**, leads **Q41-M01/A01/A02/F01/F02**. Installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [exact-slot witness](evidence/0.121.0/as-data-slots.json) extends the
[complete AS reference projection](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/q41-reference-frontier-0.121.0.md).
It does not repeat or reset that projection's 138 classified indirect interfaces,
twenty fixed-address leaves or fourteen retained finite contracts.

## Complete exact-address join

The original **676,285 explicit expressions** are consumed twice, without
sampling. The frozen **315 actual-body AS diagnostic-context owners** select
**230 `.data` operands / 30 distinct exact addresses**. A reverse join of the
entire same inventory retains **9,176 expressions** addressing those slots,
including readers outside the original AS-context bodies, every observed
direct write and every exact address escape. The complete rows stay in the
ignored hash-bound artifact; the witness retains all thirty slot identities,
access counts, producer/escape sites and source-interface classifications.

An exact fixed address is the join key. This does not discover arbitrary
interior/indexed aliases or stores through dynamically supplied pointers.
The `.data` section is not itself evidence of writable AS state: four selected
locations carry pointers to constant definition slices. Initial file bytes and
PE-loader zero-fill are recorded separately.

| Slot family | Addresses | Bounded classification |
| --- | ---: | --- |
| Definition-slice carriers | 4 | Twelve zones, nine heroes, 23 ordinary ring/trinket records and sixteen shared amulets. First keys are `elwynn`, `warrior`, `accuria` and `mark_of_fordring`; existing catalogs/Codex own their consumers. |
| Frontend fallback | 1 | Shared empty frontend-context fallback; existing Party DPS/HUD-clock proofs own the concrete selected consumers. |
| Shared registry | 1 | Reader/writer-locked heterogeneous hash registry with an erased key/constructor interface. Stop at that library/engine boundary. |
| Logging filter/callsites | 5 | Shared filter and callsite metadata observed by the Discord path; no new AS operation is established. |
| Panic/poison state | 1 | Shared panic-count/poison guard, including the registry's lock lifetime. |
| Lazy i18n aggregates/fields | 12 | Three existing lazy aggregate groups, including address escapes to the standard lazy-initialization helper. |
| Process locale | 1 | Exact fourteen-code selector with English fallback. |
| Per-locale cache | 1 | Fourteen lazy 32-byte entries, selected by thread override or process locale. |
| PE TLS index | 1 | Windows loader TLS index followed by `GS:[58]` and the thread block. |
| Transport observations | 2 | Atomic byte/send increments before the existing transport-send interface. |
| Spell-effect admission | 1 | `noSpellEffects` publication and existing shared creation gates. |

The witness binds each family to its exact native locations and, where relevant,
the existing source. A field/layout classification does not certify every
contained type, native operation or dynamic backend. The complete reverse join
establishes no additional AS source defect.

## Missing producer classifications recovered

Three new journaled REA/Ghidra subjects use **2,025 original bytes** in total,
with exact raw-subject/VA/target bindings. Their saved results and compatible
shared Programs are retained for reproducible reuse.

* `145aeb1e0..145aeb337` writes process selection `1485c9220`. It admits exactly
  two bytes and selects `en/pl/cs/de/pt/es/fr/ro/tr/ru/uk/zh/ja/ko` in that order;
  every other value selects English. Existing `LANGUAGES`, `language_index`,
  selection and recipient-localization consumers preserve this bounded rule.
* `145b96c70..145b96cc9` reads the thread-local override, otherwise the process
  selection, clamps at index13 and addresses `1485c6778 + index*32`. It forces
  the lazy entry when its state at `+18` is nonzero, then returns the two-word
  value at `+8`. Existing localization/catalog consumers remain the source
  owner; lazy-storage scheduling is not a new absent gameplay mechanism.
* `1402aa300..1402aa939` classifies the shared registry reached through
  `1485bf750`. It uses a read lock and hash lookup, upgrades to a write-on-miss
  path, and calls the caller-supplied erased key/constructor interface. Its
  panic/poison checks separately read `1485c6b78`. This is supporting generic
  library context; the surrounding subsystem is not reconstructed to reduce a
  global unknown count.

Raw-subject decompilation has incomplete incoming types, unavailable external
bodies and SIMD presentation artifacts. Printed parameter names/types are not
the Windows ABI specification. Original bytes, exact field coordinates and
the separate pure-instruction checks govern the stated contracts.

## Validation and remaining scope

```sh
PYTHONPATH=runtime/camera-recovery-0.105.0/python-libs:runtime/armory-recovery/python-libs python3 -B scripts/classify-q41-data-slots.py
```

Default operation is read-only. It verifies all native/query/target commitments,
the complete reverse-join artifact and the compact witness. The actual source's
fourteen locale keys are compared with **65,536 two-byte original-instruction
cases plus seventy other-length cases** using isolated synthetic memory and
stack. Invalid UTF-8 byte words are native-boundary probes, not fabricated valid
Rust strings. No reconstructed Rust execution is implied.

The broader #41 unknowns remain: dynamic/interior aliases, types and AS ownership
outside these exact slots, plus the separate filename-free caller frontier.
Compilation, application/client/server/network execution and original/rebuilt
gameplay/rendering parity are unverified. No server was operated.
