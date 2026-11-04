# Scholomance loot and Armory odds in 0.141.0

This review binds [#314](../verification-needed.md#gap-314) to
`installed-game/AzerothSurvivors.exe`, 151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
The [0.140.0 gear catalog](scholomance-0.140.0.md#catalog-rewards-and-star-progression)
retains its own provenance.

The recipient reward owner at `0x145f183b0` draws one top-24-bit random
value and calls `0x145e44ab0` with the class, boss entry and owned items
at Game+0x2f8. The first four bosses each supply two ordered armor IDs.
The draw must be below `2 × 0.25` before ownership is considered. The
selector keeps the unowned IDs if any exist and otherwise uses the full
pair. It divides the same draw by the original gate, multiplies by the
eligible count and selects the truncated index, capped at the last item.
With one piece owned, every successful roll yields the other piece.
With neither or both owned, the lower and upper quarters select the two
slots. Gandling uses the separate 0.25 gate and returns the whole class
weapon group, including both items for Rogue and Shaman.

The caller writes each successful ID to the ordinary equipment receipt
with the boss serial and marks. It then inserts an ID missing from
Game+0x2f8 before the next roll. The killer and admitted party-recipient
calls reach the same owner. The reconstructed [reward roll](../../crates/azeroth-survivors-re/src/mob_loot.rs)
uses the recipient's existing [equipment state](../../crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs).
Solo and host runs seed ownership from the entry save. The cooperative
actor swap carries the recipient's equipment state with their RNG.

The Hero builder at `0x14604961c` intersects the Tier 0.5 catalog with
Save+0x38/+0x40 and the selected class. Tag 4 places a little-endian u32
count and that many u32 item IDs directly after the pity rows and before
Heroic unlocks. The reader admits a count only if the remaining bytes can
hold all four-byte IDs. The sanitizer at `0x145e39c40` filters to valid
Tier 0.5 IDs of the submitted class and keeps up to 64 accepted rows.
The [Hero codec](../../crates/azeroth-survivors-re/src/coop/server_party.rs)
and [profile adapter](../../crates/azeroth-survivors-re/src/coop_profile.rs)
carry those items from the guest save to the host's guest actor.

The Armory tier-7 table emits 0.25 beside each item. Its missing-piece
list at `0x1402d4a2f` skips owned rows and retains the table's rate in the
display record. The item-details lookup at `0x145e305dd` also copies the
table's rate. Both [Armory views](../../crates/azeroth-survivors-re/src/armory.rs)
therefore display 25% per item, including when the actual roll gives a
missing sibling the full 50% chance.

| Native range, end exclusive | File offset | SHA-256 |
| --- | --- | --- |
| Roll `0x145e44ab0..0x145e44d0c` | `0x5e43eb0` | `a1a29d3e2fb7b41d3765392b34d79d5f91e98e899000cf0d5a4b8b064a916a07` |
| Owned-item filter `0x145e45c80..0x145e45d5d` | `0x5e45080` | `4251bff806d563926c051259904cb23358c23fbe60da72545263b0032594f24b` |
| Award and update `0x145f183b0..0x145f18b22` | `0x5f177b0` | `78c0b8e9a6d64873a654126f30cbdde805b7c8a5f23cddcad64219f0aec63659` |
| Candidate IDs `0x145e60ba0..0x145e60e46` | `0x5e5ffa0` | `95be510d8952ccff85b256ba8ad524f1c199db76cd92c104de3598457d564118` |
| Armory rate `0x14603b3b0..0x14603b563` | `0x603a7b0` | `e37d91643d8ceb4092f771db6b408f8514e2f5ac87b941612fae1d09ee06db25` |
| Saved collection filter `0x146047d90..0x146047ee0` | `0x6047190` | `adfc7f34bffb004f949c7197f7ac2963f6739f002411a43bc5932c52aec267f1` |
| Peer ownership sanitizer `0x145e45d60..0x145e45ea8` | `0x5e45160` | `6709219382c6512f5eafc5d0c7a661f4759bd82a52b4bbda11d81d8aa6f1a3b3` |
| Hero writer `0x1460508bb..0x146050944` | `0x604fcbb` | `2047449b44fae2fa36153fb599a3c00e80ccc9adfcfb29d06d7a03e57e1f2025` |
| Hero reader `0x14604b597..0x14604b637` | `0x604a997` | `2720078c536699b4e6f0b05ee6fd79a7a7772435333d7c60cc18ab9c815221dc` |

The journaled Ghidra results for the roll and membership filter are
`ev_112b355b75d74919a7e6de88b8fe67cf603027d13cfc0bd867c130a1f1ae7cf4` and
`ev_98d335986fcad4b6543f782d021756d5a00facc8a049911210dc84065b3ccd94`.
The shared original-instruction harness passed 1,080 reward cases over
233,376 instructions, 45 Armory cases, and 12 Hero writer and reader-count
cases. Allocator calls in the reward and Armory checks used scratch
storage. The reward cases cover every class and boss, both thresholds,
and all ownership combinations. The Rust fixtures exercise the matching
source boundaries. Compilation, gameplay, rendered UI and co-op
interoperability remain open in #314.
