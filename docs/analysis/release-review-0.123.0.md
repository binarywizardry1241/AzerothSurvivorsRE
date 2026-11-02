# Supplied release review against 0.123.0

Selected installed EXE: **0.123.0**, 146,228,736 bytes, SHA-256
`de7147a2a3a01b4fb84f3a7f036bc940f9e7d4fdfc42a7fdb79f3f1b2bd798be`.
The [0.122.0](../CHANGELOG.md#01220) and
[0.123.0](../CHANGELOG.md#01230) notes contain **sixteen independent items**:
eleven and five respectively, including each release's summary paragraph.
They map in supplied order to **#256–#271**. The claims are investigated against
the installed 0.123.0 target; no 0.122.0 EXE was supplied or inferred.

This report records source review and exact current discovery leads. A native
diagnostic owner is a recovery selector, not a recovered behavioral contract.
Current-target behavioral applicability remains pending wherever stated below.
No gameplay source is changed by this audit.

## Source boundary and retained recovery

All AS source paths below are relative to
`crates/azeroth-survivors-re/src/`. The existing [benilla source provenance](benilla-vendor.json)
supplies the generic protocol, movement/spline, local-client presentation,
rendering, audio and HTTP/library boundaries. Those interfaces are inspected
before native expansion. The concrete questions are the AS-owned delay,
admission, cleanup, selection and resource mappings; this review does not reopen
unrelated engine internals.

Retain [0.121.0 release recovery](release-review-0.121.0.md),
[Heroic clears](heroic-unlocks-0.121.0.md),
[private cooperative rewards](coop-heroic-wire-0.121.0.md),
[affixes](heroic-affixes-0.121.0.md),
[earlier lag-policy findings](release-review-0.120.4.md),
[updater recovery](main-menu-update-parts.md) and
[terminal recovery](terminal-flow-0.105.0.md) with their actual target identities.
Changed or unmapped applicability does not remove implemented source or erase
that semantic recovery. Static observations about the current source are
independent from proving the new EXE's complete behavior.

## Individual supplied items

| Finding / item | Source observation and exact next native question |
| --- | --- |
| **#256 — 0.122.0 summary** | The ten item-specific investigations below cover lobby presentation, service load, Fire Nova, healing eligibility, downloader reconnection, clear timing and Again teardown. No extra mechanism is invented for the summary. Source owners and native selectors are those of #257–#266; complete each separately before claiming the summary. |
| **#257 — Busy cooperative service keeps up, across client versions** | Current 0.123.0 client relay contract and incidental #198/#210–#212 source repairs are complete within the [bounded sender/receive/ACK proof](relay-load-0.123.0.md): replay-only credit, forward-gap admission outside control, ACK clamp/two cursors, 2-second ACK and 16 MiB pending limit. Four journaled Ghidra queries, 904 isolated instruction cases and Rust syntax/format checks pass. The note describes externally updated service scheduling/capacity across client versions; no authoritative external service artifact or deployment contract was supplied. That specific #257 portion remains blocked; client repair does not prove it. Compilation, transport/service execution and parity remain unverified. |
| **#258 — Lobby difficulty, Difficulty filter and Can join** | Current source connects [selection metadata](coop-selection-0.123.0.md), the [signed directory schema](coop-directory-schema-0.123.0.md) and [native lobby controls](coop-lobby-ui-0.123.0.md): optional rank remains unknown when absent, Can join combines selected-class zone/Heroic access, difficulty cycles distinct sorted received ranks, and rows use their supplied label and explicit lock reason. Native UI669/metadata1977/schema213 isolated cases and154 exact locale values pass. Compilation, service/UI execution/rendering and parity remain unverified. |
| **#259 — Hosting run preview and Change difficulty** | [Current native/source repair](coop-lobby-ui-0.123.0.md) connects the selected hero/class/zone/Save-capped rank to the shared native card. Change opens the exact ordinary Difficulty resource; Done/Escape returns to retained co-op tab/form. Selected snapshot invalidation and eleven labels across fourteen locales are connected. Native UI669 cases and source/syntax checks pass; compilation, input/focus/image/rendering and parity are unverified. |
| **#260 — Party selected zone/difficulty and per-member eligibility** | [Metadata](coop-selection-0.123.0.md) and [UI source](coop-lobby-ui-0.123.0.md) now carry complete selection/eligibility snapshots through publication, normalized receive and shared party card with host-only Change. Native46px frames/red inline warnings/footer use received eligibility. Pre-run ineligible profiles remain visible; independent world entry stays gated. Native metadata1977/UI669 cases and source/syntax checks pass; compilation, real delivery/input/rendering and parity are unverified. |
| **#261 — Fire Nova ring and own sound** | The [source repair](fire-nova-0.123.0.md) preserves descriptor1535/kind2/pulse0 and connects only the recovered cast-event alias1535→8349 in `dispatch.rs::visual`; existing `client/events.rs::spell_go` preserves that supplied ID. The [current native/data proof](evidence/0.123.0/fire-nova/manifest.json) binds kind2 dispatch at `0x145b32361` and opcode0x132 serialization at `0x145c74160`. Configured DBCs connect8349 to visual963/cast984/effect714 `FireNova_Area.mdx` and sound5636 `FireNova.wav`; their M2/WAV payloads and existing benilla consumers are present. Learned/first-hit/cooldown/direct-damage identity remains1535. The checker passes3,661 original instructions, two exact raw query subjects, five DBC tables/nine rows and two live Rust syntax paths. No further selected source omission is identified. Compilation, actual event/resource delivery, rendering/audio/gameplay and original/rebuilt parity remain unverified. Selector: `custom-game-game-abilities`; retain #13/#24 baseline ability/effect recovery. |
| **#262 — Sanguine excludes bosses and lair guardians** | The [current constructor/filter proof](evidence/0.123.0/sanguine-native.json) traces pool collection at `0x145b65e70` through filter `0x145ca02b0..0x145ca0580`: stride0x1e0, living byte+b0 and absent ward config+d0, primary-boss state+18 and guardian timer vector+58 before inclusive XY radius-squared36. Four exact current producer queries bind those subtype meanings and their actor-vector copy boundaries;13 current ward templates match the source. `Mechanics::tick_affix_pools` now rejects guardian registry rows and omits the separate boss list, retaining ordinary/elite horde and existing pool timing/health publication. [Source repair](sanguine-recipients-0.123.0.md):99 isolated original cases/791steps and syntax pass; two Rust regressions remain uncompiled/unrun. Selector:`custom-game-game-affixes`; full affix applicability, compilation, actual combat/network/rendering and parity remain unverified. |
| **#263 — Download resumes after remote connection loss** | The [connected reader and HTTP adapter](update-resume-0.123.0.md) retain the active part index/declared length/offset, reopen with Range and admit206 or discard the replayed prefix before gzip/progress. Positive reads reset failures; Interrupted retains the reader/budget, premature EOF retries, NotFound is terminal, and the ninth other failure returns after eight2/4/8/16/20-second capped waits. HTTP429/>=500 and transport failures map toOther; other HTTP errors map toNotFound. Existing decoded size/hash/staging cleanup and Ready consumers remain connected. The [four-query proof](evidence/0.123.0/update-resume/manifest.json) and non-compiling checker bind52 original-instruction cases and three syntax paths; eight authored Rust regressions remain uncompiled/unrun. Selector: `custom-app-update`; retain #17/#133 historical updater recovery. Actual HTTP/filesystem/process execution and parity remain unverified; no cross-application-restart resume journal is inferred. |
| **#264 — Cooperative Heroic clear at final-boss death** | The [current six-query proof](evidence/0.123.0/coop-clear/manifest.json) connects lethal final-boss phase1 at `145b54df0`, live snapshot won projection, driver phase admission and accepted State15 cache replacement to clear consumer `145c27820`, independently of queued choices and terminal summary. `guest_settlement::persist_victory` now owns the Normal/Heroic clear-only Save transaction; host delivery and accepted guest receive call it before terminal gates, including the pre-world event queue. Captured identity/rank, monotone class-zone progress, private rewards and later XP/count/summary consumers remain separate. [Source repair](coop-clear-0.123.0.md):88 original-instruction cases and four Rust syntax paths pass; five regressions are uncompiled/unrun. Selectors:`custom-game-driver`, `custom-game-server-party`, `custom-game-game-party`. Compilation, actual multiplayer/save/UI behavior and parity remain unverified. |
| **#265 — Again removes ghost chest and speed-rune carry** | [Object retirement](again-retirement-0.123.0.md) connects cache#276 destruction before replacement through retained GUIDs and ordered local/shared/private delivery. The independent [aura/mover reset](again-runes-0.123.0.md) now connects#277 through54 explicit zero fields and the retained-serial unroot/relocation/unconditional fresh-speed handoff.70 object-retirement and103 rune-reset isolated cases pass, with source syntax. Compilation, actual Again/input/transport/rendering and parity remain unverified. |
| **#266 — Again removes companions and boundary pillars** | [Current collector/producer/source proof](again-retirement-0.123.0.md) connects the companion and boundary GUID passes to retained source owners and ordinary destruction before replacement. Separate#278/#279 identities remain; complete companion/spell definitions retain their original provenance.70 isolated native cases pass; compilation, actual client/party lifetime and parity remain open. |
| **#267 — 0.123.0 lag summary and both sides version requirement** | [Exact admission repair](coop-admission-0.123.0.md) binds current owner `145c2e460..145c2f05c` and gate `145c2e6d4..145c2e70e`: protocol7, seven-byte `0.123.0`. Shared Join/server/directory constants and fixed fixture are corrected; 3,042 original-gate cases / 12,738 instruction steps and source tracing pass. #268–#271 retain separate contracts; this bounded gate does not certify protocol7 payloads, whole-run smoothness or interoperability. Existing #163 owns exact admission. |
| **#268 — Enemy motion continues/catches up during host delay** | [Source/static repair](coop-smoothing-0.123.0.md) connects host Time21 publication, rolling10-second excess-delay baseline and GUID-keyed spline/catch-up adapter to the existing benilla consumer. Current caller/serializer/sample/builder and exact20/1/0.25-yard/1.6 branches are recovered;1,164 isolated original-instruction cases /141,559steps and source checks pass. Session lifetime survives ZoneKey/Again and clears on party close. No further selected source omission identified; actual multiplayer motion and parity remain unverified. |
| **#269 — Remote players extrapolate to current position after delay** | [Source/static repair](coop-smoothing-0.123.0.md) binds actual clock producer, wire21, guest sample/caller and movement transform: selected opcodes advance XY by normalized flags/orientation and `min(delay/1000,1)*7`, using zero below40ms. Other fields remain intact; source-slot exclusion belongs to #270. The shared1,164 isolated native cases cover the selected packet/clock scope; compilation, actual delivery/motion and original/rebuilt parity remain unverified. |
| **#270 — Guest avoids self-teleport and replicated snapback during lag** | [Source/static repair](coop-correction-0.123.0.md) recovers actual timestamp/simulation-clock separation,3-second pending grace, final-XYZ result, active admission and source-slot-excluding movement broadcast. Live source preserves original accepted bodies, keeps owner corrections private, seeds forced-position gates and consumes opcode/XYZ admissions once without ACK misalignment.467 isolated native cases /8,614steps and eight Rust syntax parses pass; authored regressions remain unrun. The selected guest source path has no further identified omission; local packet-clock equivalence, compilation, actual terrain/teleport/network behavior and parity remain unverified. |
| **#271 — Offer-bound level-up picks and replay suppression** | [Current repair](coop-picks-0.123.0.md) connects per-hero wrapping offer generation, exact-prefix choices JSON, selective tag8 select/skip offer word, native zero/exact host gate, stale choices/resume republish and pending/HUD-triggered >4-second retry.126 isolated original-instruction cases and source syntax pass. Repeated-card #280 and stale-pick #281 retain their separate identities and execution/parity limits. No compiler, client/game/network/server or original/rebuilt comparison is run. |

Line anchors describe the reviewed source revision; named functions and source
paths are the durable owners if later edits move lines. [CURRENT-STATE](../CURRENT-STATE.md)
and [verification-needed](../verification-needed.md) jointly reserve every permanent
finding number. Changelog reviews use these current-target ownership
leads without claiming native recovery or source correspondence for an item
whose new contract is still pending.

## Current bounded native recovery

The [pick/smoothing manifest](evidence/0.123.0/pick-smooth/manifest.json)
retains one exact 42,276-byte PE slice, three durable Ghidra query receipts, three
canonical decompiler extracts, thirteen separately verified data ranges and four
math/copy import bindings. The queries cover the choice receiver, packet smoother
and its per-GUID replace/insert container boundary. The non-compiling checker
`scripts/check-pick-smooth-discovery.py` verifies **1,071 instructions**
across the three exact ranges, every declared data byte, raw-Program subject
mapping, completed plan/journal/result commitments and six reviewed source
witnesses. It does not execute those instructions or certify complete semantics.

The initial choice receiver evidence retains accepted payload, resume clear and
u32 offer extraction. The [extended pick proof/source](coop-picks-0.123.0.md)
connects actual generation, selective codec, zero/exact assigned-hero host gate,
stale authoritative republish and pending/HUD-triggered retry.126 isolated
original-instruction cases pass; complete module semantics, compilation,
actual client/service behavior and original/rebuilt parity remain separate.

The smoothing entry transforms ordinary movement and spline packets before the
existing engine consumer. Destroy 0xaa removes a keyed record. Spline 0xdd reads or
replaces the GUID's current interpolation record. Ordinary movement opcodes
0xb5–0xcb excluding 0xc7, plus 0xda, 0xdb and 0xee, enter the inspected extrapolation
branch. Its delay consumer uses zero below 40ms and otherwise retains the input;
that is a threshold, not a floor to 40. Its XY offset normalizes movement direction
and applies `min(delay/1000,1)*7`; original current IAT bindings establish
`_hypotf`, `cosf` and `sinf` at that boundary. The spline branch has additional
20-yard, 0.25-yard and 1.6 catch-up constants. The
[expanded clock/caller/source proof](coop-smoothing-0.123.0.md) connects host
Time21 publication, delay samples, admitted packet dispatch and party lifetime.
Whole-module dynamic behavior, compilation, actual multiplayer execution and
original/rebuilt parity remain unverified.
The generic hash container and CRT internals are stopped supporting interfaces.
No generic engine implementation is inferred missing from these AS hooks.

The [Fire Nova proof](evidence/0.123.0/fire-nova/manifest.json) binds its
unchanged 120-byte descriptor, current kind2 dispatch cell, selected AS alias
instructions, opcode0x132 serializer and five configured DBC tables. The existing
source now aliases only the kind2 cast event1535 to8349; canonical ability,
first-hit, cooldown and damage IDs stay1535. Generic benilla visual and sound
consumers receive the recovered event ID through the existing client adapter. The read-only `scripts/check-fire-nova.py` verifies two
raw-subject Ghidra queries, 3,661 exact original instructions and nine DBC rows,
with complete registered MPQ identity verification and two Rust syntax paths.
The [source repair](fire-nova-0.123.0.md) adds no replacement engine assets. The cast raw query cannot
follow a switch table outside its input; the current Fire Nova kind and exact
kind2 table cell plus original branch instructions establish the selected path.
No complete switch length or full cast decompilation is claimed. DBC-authored
`Spells\FireNova_Area.mdx` normalizes through the existing model interface to the
present `Spells\FireNova_Area.m2`; the exact FireNova WAV is also present. These
are data/source connections, with actual loading, rendering and sound unverified.

The [Sanguine proof](evidence/0.123.0/sanguine-native.json) binds the current
pool/filter and four actor-constructor queries. Original stack writes and
0x1e0-byte actor-vector copies establish the ward, primary-boss and guardian
optional-header meanings, including present empty vectors. The
[source repair](sanguine-recipients-0.123.0.md) admits only living ordinary/elite
horde through the live pool path. The checker passes99 isolated original cases /
791steps,13 current ward templates and Rust syntax. Two authored Rust regressions
remain uncompiled/unrun; application execution and parity remain unverified.

The [updater recovery](update-resume-0.123.0.md) supplies four exact native
query subjects and **52 isolated original-instruction cases** across failure
budget, Interrupted/NotFound branches, capped backoff, positive offset/progress
reset, bounded prefix discard, HTTP status conversion and premature EOF admission.
The connected reader/worker/install sources pass syntax parsing; eight authored
Rust regressions remain uncompiled/unrun. Read/stack-probe seams use synthetic callbacks.
These selected original instruction fixtures are separate from application or
HTTP execution; no real request, download, installation or process launch occurs.
The resumed reader now feeds the existing gzip/decoded size/hash/staging consumer;
terminal errors retain attempted-path cleanup and success retains Ready admission.
The retained offset is live-reader state; no cross-application-restart resume
journal is inferred.

## Separate defect identities within supplied items

| Finding | Evidence/source boundary and next static step |
| --- | --- |
| **#276 — Ghost chest survives Again** | [Current source repair](again-retirement-0.123.0.md) enumerates cache primary/auxiliary GUIDs before taking old Mechanics and delivers ObjectDestroy before replacement, after old admitted queues. Shared guest and private inventory consumers are connected.7 current queries/1346 instructions/70 bounded native cases pass; compilation, actual Again/transport/fade and parity remain unverified. |
| **#277 — Speed-rune buff survives Again** | Parent#265; the [current driver/descriptor/source proof](again-runes-0.123.0.md) connects the explicit54 zero aura ID/flag fields and old-serialN+10 unroot,N+11 spawn relocation,N+12 unconditional fresh speed, then nextN+13. Fresh constructor effects follow; race/equipment benefits remain. Five query subjects,1428 instructions,103 isolated cases/129699steps and three syntax paths pass. Compilation, actual buff/controller/ACK timing and original/rebuilt parity remain unverified. |
| **#278 — Old companions survive Again** | [Current retirement repair](again-retirement-0.123.0.md) binds +9f8/+a00 and actual loot-companion GUIDs, with source retained combat followers/private contexts. Retirement precedes replacement through ordinary handlers; full pet/spell producers and actual execution/parity remain separate. |
| **#279 — Old boundary pillars survive Again** | [Current Begin and retirement proof](again-retirement-0.123.0.md) binds entry9013/display4831, appended GUIDs at+a10/+a18 and collector tail ordering. Source retains and retires those IDs; event-queue clearing no longer loses them. Compilation, actual rendered lifetime and parity remain unverified. |
| **#280 — Chosen level-up cards reappear** | [Current source repair](coop-picks-0.123.0.md) retains the authoritative payload while locally dismissed, receives reset/resume and restores only on a HUD-message-triggered strict >4-second timeout. Host disappearance/stale-response publication now sends resume, including an absent cache. Compilation, actual delay/input/rendering and parity remain open. |
| **#281 — Late pick consumes a newer offer** | [Current source repair](coop-picks-0.123.0.md) carries u32 offer only for select/skip and checks the assigned hero before action; zero/exact accept, nonzero mismatch republishes current choices/resume. Wrapping offer identity is separate from UI/resend revisions. Compilation, actual network ordering and parity remain open. |
| **#282 — Guest movement starts the host run** | Incidental defect proved during selected #270: remote actor selector remains nonzero through floor admission, whose ready→running gate requires selector zero. Removed the guest-only displacement/start assignment; the host start consumer remains connected. [Current proof](coop-start-0.123.0.md): three reused current queries and307 isolated native cases/1256steps. Compilation, actual multiplayer start behavior and parity remain unverified. |

Each child retains separate implementation, native recovery, static-check,
compilation, execution and parity status. These identities do not imply that
release text alone proved a current implementation defect.

## Validation boundaries

The source review inspected existing producers, packet codecs, state owners and
presentation consumers. Native diagnostic references bind addresses and ranges
to the current EXE but do not establish semantic correspondence. Full-image
inventory/census, ownership publication and any targeted native queries are
reported independently by the current target's owning audit records.

No compilation, compiling tests, client/game/network/service execution, server
operation or controlled original-versus-rebuilt comparison was performed for
these release items. The externally deployed server claim additionally requires
server/deployment evidence; a client EXE cannot demonstrate that deployment.

The independently proved [solo clear defect #283](solo-clear-0.123.0.md) was found
while tracing #264’s actual caller. Current native local won/clear publication
does not require a party. The source’s extra party condition is removed, so a
pending solo choice cannot postpone the existing clear-only transaction. This
is an incidental source finding, not an added supplied release claim; #264
retains its cooperative identity. Forty-eight native cases and five syntax paths
pass; two Rust regressions remain uncompiled/unrun and actual behavior/parity
remain unverified.
