# Co-op Heroic profile, admission and private rewards — 0.121.0

The installed target is SHA-256
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
This report owns the current wire and live-path portion of finding **#238**.
[verification-needed](../verification-needed.md) owns overall completion status. The
[manifest](evidence/0.121.0/coop-heroic-wire/manifest.json) binds retained durable
Ghidra operations, original byte ranges and selected data to that target.
The separate [status report](coop-heroic-status-0.121.0.md) owns the locked-reason
parser and localized sentence; [co-op scaling](coop-scaling-0.121.0.md) owns #239.

## Profile and admission

Builder `145af4ae0..145af50a7`, sanitizer `145b4c110..145b4d019` and serializer
`145af9500..145afa925` establish the following additions to **Hero4** after its
nineteen optional appearance words, before the talent allocation:

1. Nineteen `u8` equipment-star counts.
2. A `u32` tuple count and ordered `(u32 item, u8 pity)` entries.
3. A `u32` byte count and the per-zone Heroic unlock bytes.
4. A `u32` selected weapon-enchant ID.

These are little-endian scalar/vector encodings. The profile builder derives
stars from the nineteen actual equipped IDs, filters the saved pity vector to
the chosen class, calls `Save::max_heroic_rank` for all twelve zones, and resolves
the selected enchant through the save owner's achievement gate. The builder's
normal unlock is clamped to 1–12. Sanitization clears stars on empty sanitized
slots and caps the other star counts at five; retains at most 64 valid,
selected-class pity entries, each capped at 40; clamps Heroic unlocks to five
and truncates/pads the vector to twelve; and admits only enchant IDs
0, 803, 1894 and 1900, replacing another ID with zero. Persistent save pity
remains a full byte; the cap of 40 is the received-Hero boundary.

`145b33260` computes the effective host rank as the lower of the selected rank
and the selected host class's `Save::max_heroic_rank` in the selected zone.
The received-Hero gate `145b35728..145b35749` first requires the zero-based zone
index to be below the remote normal unlock, then requires the effective host
rank to be no larger than that zone's remote Heroic byte. A missing byte is
zero. Producer `145b33b10..145b33bda` emits `locked:zone` for Normal, or
`locked:zone:rank` for Heroic. The denial starts the ordinary rejection drain.

The rank used for admission is independent of the constructed Game's rank.
The Tester route zeroes its Game constructor argument at `145b23215`, joins
the common constructor and stores the Game before the metadata route
`145b25984..145b25998` independently clamps the raw selected Pick rank against
the Save cap. A Tester host can therefore construct a Normal Game while its
admission metadata still requires a positive selected Heroic rank. Both source
admission gates now read the Pick/Save projection; authoritative remote hero
templates retain the actual host Game rules. No additional Tester hosting
exclusion or fabricated normalization is added.

The reconstructed codec preserves these fields, the account bridge builds and
sanitizes them, and the host applies the two gates both when accepting a profile
and immediately before inserting its world hero. Run-entry projection passes
the stars to the real gear-effect and set owners, and the pity vector to the
per-hero equipment-roll owner. World publication resolves the selected enchant
against each displayed hand/ranged weapon and its star gate, using the existing
Vanilla player visible-item enchant fields. Zone5 remains only the zone string;
Heroic rank is carried by the current State15 record.

The guest waits for an accepted State15 before constructing its passive replica,
so initial rank-dependent XP, rerolls, chest prices and feat inputs do not begin
at Normal and receive a late rank assignment. Native publication block
`145b18840..145b189d4` sends this metadata to the admitted world recipient on its
periodic/terminal gate. The earlier source sent State15 before Sync6 to
avoid a bootstrap wait. The [0.141.0 trace](coop-replication-0.141.0.md#guest-login-and-synchronized-recipients)
connects the guest's Zone5-driven login and gates host State15 publication
on the synchronized recipient. The host's remote templates reuse
its captured run week. The guest does not construct a fresh UTC-selected affix
runtime: native guest summary uses its accepted cache, and orb/pool/marker
simulation and effects remain host-owned packets. No week field was added to
Hero4, Zone5 or State15.

## State15 and private reward boundaries

Producer `145afaed0..145afb73e` and the serializer insert a Heroic rank byte and
the `Game+cd8` counter after the five existing counters; max-stars and active-set
bytes follow the boss-only mark-sum and maximum-boss-mark floats. Max-stars is the
largest of the nineteen run gear counts. Active set is its native tier index
plus one, with zero for absence. The `Game+cd8` value is the shared-world boss
counter used by the post-clear boss-mark path, independently of private
mark totals. The death route at
`145c18135..145c18160` increments it when `Game+d24` is zero and the endless
prior-final-clear field `Game+b90` is nonzero, immediately before the boss
reward. Reader `145c136c4..145c136e4` multiplies the base boss marks by at least
one from this shared counter. Remote mark rolls read its then-current value;
that ordering is retained rather than replaced with a per-death counter snapshot. The
wire retains the name `boss_counter`; every recipient sees the same world
counter. Validator `145b4a690` caps it by `floor(1 + clock/300)`, caps rank and
stars at five, and caps active-set at six. The two floats are current
`Game+7f4`/`Game+7f8`: boss-only mark sum and maximum single-boss marks. Duplicate
conversion currency is excluded. Validator caps are respectively 0–4000 and
0–400 for finite values; nonfinite values become zero. Source publication uses
`run_marks()` and `max_boss_marks()`, and accepted guest projections retain
those same meanings. Historical density/reward interpretation is removed;
run-rule multipliers are never derived from these mark floats.

The complete private-context swap leaf `145be6f10..145be82b7` contains 733
decoded instructions and no external calls. It exchanges pending marks at
`Game+c9c` with `Remote+99c` as part of the qword at `Game+c98`, but has no
access spanning `Game+cd8`. Wrapper `145badf60` performs that swap around the
locale-aware state producer and restores it afterward. Four synthetic native
round trips verify that the shared counter stays unchanged, pending marks
exchange between the two owners, and the second swap restores both complete
input buffers. The source therefore must not store this world counter inside
the private equipment/pity/mark state or increment it once per recipient.

**Tag20** encodes `u8(20), f32 marks, u32 count, count × u32 item`. Its IDs are
missed piece rolls that increment private pity; successful equipment grants
remain Tag13. The native server's per-recipient queue at `145b18617..145b186f8`
uses that recipient's pending marks and failed-roll IDs. It does not broadcast
one player's rewards to every peer.

The guest dispatcher `145b36070..145b37562`, filters `145b4b0b0`/`145b4b4c0`
and collector `145b614a0` establish these separate admission rules:

- Both item routes retain only current-class/current-zone boss equipment IDs,
  preserving input order and duplicates, and accept at most sixteen per packet.
- Tag13 additionally caps accepted successful drops at 64 for the current zone.
- Tag20 clamps each finite mark amount to 0–400, replaces a nonfinite amount
  with zero, and caps cumulative accepted marks at 4000 for the zone. Its missed
  IDs have the sixteen-per-packet bound, independently of that mark budget.

Source has independent successful-drop and private mark/pity codecs, admission
and queues. The selected recipient save owns retention and its Tester exclusion.
Successful duplicates and pity resets use the gear progression save owner;
failed IDs use `Save::record_boss_rewards`. The terminal clear/history and feat
consumers share the accepted State15 snapshot rather than borrowing the host's
save. Their concrete current progression producers remain separately owned.

## Static proof and remaining limits

`scripts/check-coop-heroic-wire.py` verifies the installed identity, query
receipts, original bytes and complete instruction boundaries. It replays the
original serializer with explicit typed append-writer seams for two Hero4
profiles, a State15 scalar record and four Tag20 floating-point bit patterns.
It also replays the actual Heroic admission branch across 6,048 combinations,
the allowed-item collector's order/duplicate/budget behavior, all 256 pity
count inputs, 36 active-set packing cases, all 256 Heroic party-flag inputs,
81 State15 scalar-validation cases, 1,536 effective reward-rank cases, the
Tester Game argument,1,536 independent host admission-rank projections and four
complete private-swap round trips. It decodes2,929 instructions and executes
78,108 original instruction steps. The retained
[result](evidence/0.121.0/coop-heroic-wire/static-check.json)
records counts and fixture bytes. Authored Rust packet regressions consume the
original encoder fixtures; they have not been compiled or run.

The current party-feat member record carries its own active-set byte at native
member+6, after the existing trait byte. Local construction
`145bbadd1..145bbadf9` and remote collector `145c6947c..145c69499` independently
pack the same set-tier-plus-one value, or zero for the native absent state.
Both current members and each lethal-event snapshot serialize this byte. The
source computes it from each hero's equipment/star-derived descriptor before
capturing that event, and retains it through the current seven-byte member
wire. Snapshot owner `145bc28c0` sets its flag34 when Heroic rank is at least
III, replacing the historical Run Options thresholds in the live source.

The source connects the gear progression owner's exact `endless_boss_kills`,
`set_equipment_pity`, `drain_boss_rewards`, `Save::receive_equipment` and
`Save::record_boss_rewards` interfaces. Duplicate successful drops use the
recipient's effective rank: helper `145b0f490..145b0f548` returns zero without
an accepted snapshot, otherwise the lower of that cached rank and the saved
class/zone cap. Successful-item receipts clear their exact saved pity key and
convert duplicates through the shared save owner. The guest publishes ordered
`GearReceipt`/`MarksEarned` notifications and account grants, keeping notices
received before replica construction in the existing pending-event lifetime.
The Tester and missing-account exclusions do not create a fabricated save
recipient. Current terminal Heroic clear persistence remains owned by the
shared accepted-snapshot settlement route.

The source inventory additionally verifies the published private-reward
module, method signatures, receipt fields and notification payloads. The
already-published metadata/pity initialization remains in its owning source
groups; this final consumer group adds no replacement fields or duplicate
configuration call. Static patch review excludes the separately owned actual
host guards and preserves their cleanup ordering.

No build, compiling test, application, game, client, network or server execution
ran. No original/rebuilt or presentation comparison ran. Static instruction
fixtures do not establish compilation, live networking, visual or gameplay parity.
