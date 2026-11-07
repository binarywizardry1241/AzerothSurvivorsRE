# Contest Winner's Tabard admission

Target SHA-256: `507a791fad3aec59afb2f90d2737cdab4dbbe79b98c5e74d7699fe44bed16293`.
The [manifest](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/869aa7fbc7a177d6dacaa1b3e69b12b24842cc47/docs/analysis/evidence/0.117.0/tabard-admission/manifest.json) binds current
EXE ranges, eight completed journaled Ghidra queries and canonical extracts.
[verification-needed](../verification-needed.md) owns the current implementation status.
This report owns **#156** and the distinct purchased-record defect **#160**.

## Corrected scope of #156

The initial audit inferred that a new tabard descriptor must extend the
`tabard|` purchase range. Current native recovery disproves that inference:
90025 has the earned gate `coop:odds` and is intentionally rejected from purchase
records. Its persisted ownership is the achievement key; a class can retain
`look|class|18:90025` when that key is earned. Widening the purchase range would
not reconstruct the target's format or unlock rule.

The actual source defect is in `armory.rs::GearSave::valid_item`: its tabard
range stopped at 90024. Current native owner `145ac20b0..145ac2250` admits
90001–90006 and **90011–90025**, only in paperdoll slot **18**, and then requires
the ID in the supplied authority inventory. The source now includes 90025 in
that same range. The saved-class projector, backend gear mutation and co-op
loadout sanitizer share this validator.

The descriptor, display/name construction and reward consumers belong to the
separate [party-reward source repair](party-rewards.md) under #116.
The native descriptor is ID 90025, display 31676, cost 0, icon
`INV_Shirt_GuildTabard_01`, gate `coop:odds`. Achievement generation and party-wide
delivery are tracked separately under #114/#157; this admission repair does not manufacture the feat.

## Native ownership and class projection

| Current owner | Recovered contract |
| --- | --- |
| `145b4a9f0..145b4ab76` | A non-null descriptor gate at `+20/+28` searches sorted earned strings at Save `+b0/+b8`. That branch never consults purchases. Ungated rows instead scan purchased IDs at Save `+128/+130`. |
| `145c33e40..145c33faa` | Tests each descriptor with the preceding predicate and collects its `+30` ID when available. |
| `145ac4e00..145ac505b` | Uses all 21 current tabard rows at `1475c9830..1475c9d70`, including 90025 at index 7, before combining cosmetic grants. |
| `145acb7a0..145acb925` | Gets the requested saved class, calls the combined inventory and passes that authority to the class projector. |
| `145ac28d0..145ac2a88` | Checks the nineteen equipped lanes and present nonzero/nonstarter look overrides through `145ac20b0`. |

The source connection is `Tabard::available` → `available_tabard_ids` →
`GearSave::read_raw` → requested-class `project` → `valid_item`/`valid_look`.
The retained earned-key gate was already correct. Adding an ID to a purchase
record alone does not make this tabard available.

## Purchased records and #160

The actual `tabard|` parser prefix is `145c0e3e0..145c0e64b`; its CSV iterator
`145c382a0..145c38458` calls value predicate `145b2bbd0..145b2bdee`.
That complete pure leaf parses a u32, resolves its exact current descriptor and
accepts it **only when its gate pointer is null**. It accepts thirteen current
IDs. Both 90016 (`feat:herod`) and 90025 (`coop:odds`) are rejected.

Collector `145c34400..145c34546` supplies the purchased vector to current Save
parser `145ac5150..145ac98b4`, which sorts and deduplicates it before publishing
Save fields `+120/+128/+130`. Formatter `145acb970..145ace12e` reads that vector
and emits the literal `tabard|` family. Full native parsing/formatting and actual
file operations are not executed by these bounded checks.

This exposed a separate source mismatch: the old 90011–90024 purchase range
retained achievement-gated **90016**. The source correction under #160 now
uses the shared public-library catalog-only predicate
`account_progression::is_purchasable_tabard`, an exact-ID/null-gate lookup.
It admits the thirteen current ungated IDs and rejects 90016 and 90025
from purchases. The shared helper performs no Save read or UI call, so
normalization cannot recurse into account parsing. Achievement keys and
class appearance records remain independent of the purchased vector.

## Static validation and limits

- `check-tabard-admission.py` passes **644** current native admission/branch
  cases and **237** availability cases across all 21 descriptors. Actual scalar,
  SIMD/tail membership and earned-key binary search execute. Byte comparison is
  the sole host-call seam. The **550** cases entering generic metadata decoding
  stop at that interface and record `metadata_fallback`; they do not claim a
  generic-item rejection or execute that subsystem. The compact fixture retains
  the **94** completed authority decisions; the boundary matrix is regenerated
  and verified through its count and digest.
- `check-purchased-tabards.py` passes **249** current native value cases,
  with no host-call substitutions. Exact IDs, gates, optional plus signs,
  leading zeroes, malformed numbers, non-ASCII digits, whitespace and u32 overflow are
  checked against the current descriptor pointer table. The composed source
  catalog also matches all 21 current IDs/gates, with thirteen ungated entries;
  this is a data-composition check, not execution of the reconstructed loader.
- Authored Rust regressions cover native authority vectors, earned-only 90025
  class projection, wrong-slot admission, removal and preservation of another
  class's look record. Purchase regressions also exercise all 249 native token
  vectors and load/reparse preservation of achievements and class looks while
  filtering gated IDs and deduplicating purchases. They remain uncompiled and unrun.

Raw-function decompilation omits PE data and external callees, and its inferred
signatures are not the ABI authority. Full Save queries retain type-propagation
and unreachable-block warnings; only the stated field connections are used.
These are recovered contracts and source connections, not proof of compilation,
actual Save I/O, rendered tabard appearance, multiplayer behavior or original/
rebuilt parity. No game, client, server or network session was started.
