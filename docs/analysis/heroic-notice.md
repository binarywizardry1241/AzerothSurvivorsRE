# Heroic clear system chat

Installed EXE SHA-256:
`22f7938eb4f99f2857dc091b1c57c147bd848eaabfeaa81e444c0a3393ca8150`.
The [manifest](evidence/0.121.0/heroic-notice/manifest.json) binds the current
victory-account owner, rarity-name helper, start/admission owner and frontend dispatcher to four
completed journaled Ghidra subjects and exact original code/data.
[verification-needed](../verification-needed.md#gap-220) owns overall #220 status;
[clear persistence](heroic-unlocks.md) owns the save/admission contract.

The retained start owner `145b21eb0..145b263d0` separates requested Pick rank
from admitted run rank. For an ordinary local roster identity, `145b23235` calls
the selected class/zone ceiling helper `145aa3b80`; `145b23258..145b23266`
computes the unsigned minimum of that ceiling and the requested byte. The
accepted rank is copied into the run-construction argument at `145b232a9`.
The stored request at Game+`13e0` is not rewritten. Before that query, the exact
transient Tester GUID `0x00ffffff` takes `145b231ce..145b23219`, zeroing the
admitted rank and bypassing the ordinary ceiling path. It therefore runs Normal
even if its class has account Heroic progress.

This is the common login construction path for local play and hosting. The
effective EDI is stored at caller slot `rbp+3028` by `145b232a9`; instructions
`145b23686/145b2368c` copy it into constructor input owner+`1807`, immediately
before calling `145b2d080` at `145b236a3`. The constructed Game is published at
owner+`10` by the copy at `145b25560`. The retained original instruction CFG
has a 974-instruction direct path from the Tester zero to the later metadata
minimum, with calls treated as returning and no hosting exclusion before the
Tester zero. This static path is not whole-application execution.

Later in that same owner, host metadata/admission independently calls the
class/zone ceiling helper at `145b25984`, reloads the **retained Pick request**
from owner+`13e0` at `145b2598a`, and stores a fresh minimum at `145b25998`.
The host-session test (`d48 == 3`) follows at `145b259ae`. This recomputation
does not consume the already admitted run rank and is not an alternate
construction lane. A Tester can therefore have a Normal constructor input
while the retained request still yields a higher host metadata minimum.
Current constructor source correctly applies Tester Normal without a hosting
exception and otherwise uses the class/zone minimum. The independent host
metadata raw-Pick consumer is checked separately under #238; using
`game.rules.heroic_rank` there is not equivalent in this case. Both native
operations preserve Pick.
Run construction and cooperative State/admission integration retain their
separate [#219](../verification-needed.md#gap-219)/[#238](../verification-needed.md#gap-238)
owners. These start-query receipts are reused; no native owner is re-queried.

`145b2e580..145b2f49c` records the Normal beaten pair before obtaining the
effective Heroic rank through `145b0f490`. That rank is the captured run rank
limited by this class's current ceiling. The clear mutator `145aa3f70` returns
whether the class/zone record increased. Only a changed record reaches the
notice branch at `145b2e8e3`. Guest mode two additionally requires connection
variant zero/one and local-client synchronization byte Game+`10c5` nonzero.
The chat queue `145b134d0..145b135ea` repeats that guest gate and selects an
active local-client row; an accepted State15 cache alone does not admit chat.

The notice localizes this complete template before formatting its five named
arguments:

> {heroic} of {zone} beaten: your {class}s' {set} gear may now go to {stars} stars.

Rank names come from the shared Heroic helper. Zone and class names use their
`zone.{key}.name` and `class.{key}.name` keys with the native descriptor's raw
name as fallback. The set argument is the zone's gear rarity, through
`145afff40` and `rarity.{tier}`; the caller looks up that returned name once
more. Current zone tiers are the same twelve already used by boss equipment
drops, including PvP tier five for BRD/MC and Legendary tier four for BWL/Naxx.
The stars argument is the effective cleared rank, independently of the account
ceiling and other zones sharing a gear tier.

After the clear, `145b2ec6f..145b2edbd` recomputes the account's next rank for
this zone. If it exceeds the effective cleared rank, the notice appends a space
and the localized template `{heroic} is open to every class.` using that ceiling.
This is a comparison with the **post-clear** ceiling, not a test that the
ceiling changed in this transaction. A new personal I clear can therefore
announce V when another class had already opened V. At V, no sentence appends.

The entire line is wrapped in `|cff40ff40` and `|r`. Native serializer
`145b7e450..145b7e694` produces the ordinary opcode `0x96` system chat: type
`0x0a`, language zero, sender zero, terminated text and chat-tag zero. The
existing client `system_message` projection supplies this packet interface.
No `SMSG_NOTIFICATION` packet or custom toast is produced for this notice.
The two notice templates and shared Normal/Heroic labels are projected from
all fourteen current embedded locale objects: **56** selected values. The
existing class, zone and rarity label dependencies also match those objects.
The proof retains their canonical descriptor/payload receipts and consumed
key/value projections; source locale files preserve unrelated entries.

The adjacent strings `heroic`, `set`, `stars`, `level` and `open` do not all
belong to one event. The first three are named-template arguments for the
existing string formatter `145aeb340`. The later JSON builder really emits
`{"type":"heroic","bg":localizedZone,"level":clearedRank,"open":accountCeiling}`.
Current frontend `140063040..140064851` consumes neither this Heroic event nor
its fields: it passes through both type dispatches into the generic drop path.
The six-byte branch handles `roster`, `picked`, `paused`, `resume`, `banner`,
`defeat` and `logout`. The source's typed `HeroicProgress` intent retains the
clear inputs for chat rendering and does not invent a frontend popup for that
ignored JSON.

`Save::record_run_victory_notice` returns the effective rank and post-clear
ceiling only after a changed record. Its Boolean wrapper remains available for
existing persistence callers. Local terminal accounting and accepted guest
accounting queue the typed notice before achievement events. Guest readiness
comes from the existing local-client synchronization owner; both ordinary
collection and teardown render the same localized chat helper. Cached account
progress can persist while presentation remains unadmitted.

Run `scripts/check-heroic-notice.py` with the installed project Capstone
and Unicorn modules. The [result](evidence/0.121.0/heroic-notice/static-check.json)
records **160** changed-clear/guest-admission cases, **2,880** post-clear ceiling
cases and **18** frontend branch cases, plus **3,072** local/host minimum cases
and **1,280** Tester-branch cases: **7,410** cases and **132,146** original
instruction steps. It also binds twelve zone names/tiers, eleven class descriptor selections,
six rarity fallbacks, four query subjects and eight Rust syntax parses. Admission
source guards inspect the coordinated owning checkout; the checker reports
the independent host-metadata consumer's match or pending #238 repair rather
than certifying the wrong effective-rank input. Notice/persistence
guards inspect the checkout running the checker. The
locale check verifies the 56 selected values and 378 existing label dependencies.
The frontend raw-slice pseudocode stops at external jump tables; the checker reads
the current tables and replays the relevant original branch instructions.

The fixture supplies typed vectors and parser-result strings in synthetic
memory. It does not execute reconstructed Rust, allocation/file operations, the
game, client or any server. One Rust regression for a previously opened account
ceiling, repeated clears and V is authored and unrun. Shared current rank/configuration
and authoritative State15 integrations retain their owners. Compilation, actual
save/chat delivery, rendering and original/rebuilt parity remain unverified.
