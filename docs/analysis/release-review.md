# Release-claim review

## 0.143.0 Hyper Mode

The [eight supplied claims](../CHANGELOG.md#01430) share the run mode tracked in
[#325](../CURRENT-STATE.md#gap-325). The Windows PE evidence below comes from
`installed-game/AzerothSurvivors.exe`, 151,566,336 bytes, SHA-256
`f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`.
The existing Difficulty and co-op paths carry the zone and Heroic rank. Neither
the persisted `Pick` nor the admitted `RunRules` carries Hyper Mode. The current
EXE supplies exact text and instruction selectors for recovery. The clock,
reward and packet contracts still require tracing to their actual consumers.

| Claim ID suffix | Assessment and live source | Next static proof and related findings |
| --- | --- | --- |
| `20eeba1dc4defaf3` | Release summary. The Difficulty lock/help literals corroborate the advertised achievement and pacing. The following assessments own the individual mode changes. | Trace the common selection-to-run handoff under [#325](../CURRENT-STATE.md#gap-325). |
| `2052657ed900be9c` | The Champion description in the EXE names both Crusader and Hyper Mode. The [source description](../../crates/azeroth-survivors-re/assets/achievement-catalog-0.121.0.json) only names Crusader. The [Armory unlock](../../crates/azeroth-survivors-re/src/armory_cosmetics.rs) already reads saved `heroic:naxx5` for enchant 1900. [Difficulty](../../crates/azeroth-survivors-re/src/run_options.rs), [menu state](../../crates/azeroth-survivors-re/src/menu_state.rs), [Pick](../../crates/azeroth-survivors-re/src/save.rs) and [run admission](../../crates/azeroth-survivors-re/src/gameplay/mod.rs) have no Hyper Mode field or toggle. | Follow the Difficulty labels from `0x1401bbfd0` and the saved achievement lookups into the pick and run constructors. Verify the old-achievement path, default, selection across Normal and Heroic ranks, and entry/restart lifetime. See [#219](../verification-needed.md#gap-219) and [#235](../verification-needed.md#gap-235). |
| `874ebdc6e9a66c37` | The pacing help says bosses arrive in half the time. The [source scheduler](../../crates/azeroth-survivors-re/src/bosses/spawning.rs) compares clock minutes with the zone's boss row. It receives no mode from [run state](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs). | Recover the native deadline input and zone-specific final thresholds from the scheduling and boss table consumers. Check full-strength initialization separately from schedule timing. The advertised 8/9/10 minutes and unchanged strength are pending native proof. |
| `850ed6c5a1af2d9e` | The same help says guardians return twice as fast. The [guardian death owner](../../crates/azeroth-survivors-re/src/guardians/mod.rs) adds the [rank-only refill interval](../../crates/azeroth-survivors-re/src/heroic.rs) to the current clock. | Trace the mode read in the death-to-lair deadline path and its interaction with difficulty and respawn suppression. Use [the existing lifecycle boundary](raid-guardian-lifecycle.md#current-owners-and-inputs) and [#89](../CURRENT-STATE.md#gap-89). |
| `d9930831bf9a59da` | The help names accelerated mob strength. [Run scheduling](../../crates/azeroth-survivors-re/src/gameplay/mechanics.rs), [ordinary spawning](../../crates/azeroth-survivors-re/src/enemies/spawning.rs) and [waves](../../crates/azeroth-survivors-re/src/enemies/waves.rs) use clock minutes for ordinary selection, strength/count and wave inputs. [Endless entry](../../crates/azeroth-survivors-re/src/gameplay/mechanics/bosses.rs), [repeat spawning](../../crates/azeroth-survivors-re/src/bosses/spawning.rs) and [co-op presentation](../../crates/azeroth-survivors-re/src/coop/client_state.rs) retain 300-second values. | Trace the effective mob clock into strength, counts and composition, then inspect the final-deadline boundary and retained lead in Endless. Locate both the initial and repeating 150-second boss deadlines and their published consumers. |
| `d829b1125a14e67a` | The help says rewards stay the same. [Boss loot and marks](../../crates/azeroth-survivors-re/src/mob_loot.rs) take zone, boss, rank and Endless reward inputs. [Local/live XP](../../crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs) uses `self.clock`, and [cached guest XP](../../crates/azeroth-survivors-re/src/gameplay/guest_settlement.rs) uses `projection.clock`. The [XP formula](../../crates/azeroth-survivors-re/src/run_progression.rs) awards 12 XP per input minute before its other modifiers. | Trace rank, boss reward and win settlement producers through the local and private guest consumers. Establish the exact clock value sent to the XP formula and compare marks/loot inputs for the same rank. See [#226](../verification-needed.md#gap-226), [#228](../verification-needed.md#gap-228) and [#238](../verification-needed.md#gap-238). |
| `b818f572e247d44b` | The [live feat snapshot](../../crates/azeroth-survivors-re/src/gameplay/mechanics/progression.rs) uses `self.clock` and the [cached guest snapshot](../../crates/azeroth-survivors-re/src/gameplay/guest_settlement.rs) uses `projection.clock`. [Party publication](../../crates/azeroth-survivors-re/src/gameplay/mechanics/coop.rs) retains the first fall from `self.clock`. [The timed feat predicate](../../crates/azeroth-survivors-re/src/account_progression.rs) checks elapsed and first-fall time separately. | Establish which current fields feed timed achievements, including the 40-minute Naxxramas threshold, first-fall capture and guest grants. The retained source alone cannot establish whether those inputs remain tied to real time in Hyper Mode. See [#285](../verification-needed.md#gap-285). |
| `d9da87b3033fb4b5` | Separate join-denial and lobby eligibility text have verified references. [Host advertising](../../crates/azeroth-survivors-re/src/coop/service.rs), [directory rows](../../crates/azeroth-survivors-re/src/coop/directory_wire.rs), [Hero profile](../../crates/azeroth-survivors-re/src/coop_profile.rs), [roster and admission](../../crates/azeroth-survivors-re/src/coop/server_party.rs), [world entry](../../crates/azeroth-survivors-re/src/gameplay/coop.rs) and [State15](../../crates/azeroth-survivors-re/src/coop/replication.rs) carry rank-related inputs. The [directory badge](../../crates/azeroth-survivors-re/src/coop_directory_row.rs) and [party card](../../crates/azeroth-survivors-re/src/coop_ui.rs) have no mode display. | Follow both denial references through capability, host selection, directory/roster wire fields, world entry and shared run publication. Resolve eligibility order and localization on both views. See [#63](../CURRENT-STATE.md#gap-63), [#258](../verification-needed.md#gap-258) and [#260](../verification-needed.md#gap-260). |

Exact literal byte ranges use the PE file offset and preferred VA. The reference
sites are RIP-relative `lea` instructions independently decoded with the existing
Capstone diagnostic reader from their enclosing PE unwind extent. They establish
static address formation within those extents. Runtime reachability, the
underlying gate, field layout and timing arithmetic remain open.

| Literal | File offset | Preferred VA | Bytes | SHA-256 | Decoded site |
| --- | --- | --- | ---: | --- | --- |
| Difficulty mode label | `0x0657d788` | `0x14657e388` | 10 | `25eaac946cf7b29497e0950c2d91302b447a293a7e2b535f276c2d6c25ad5495` | `0x1401bc2a7` |
| Difficulty unlock help | `0x0657d792` | `0x14657e392` | 43 | `f4e548c0fea7997c4863c3f01492120e3233e76c8fc3c04825ad5d9cfb59143f` | `0x1401bc4d4` |
| Difficulty pacing and rewards help | `0x0657d7c1` | `0x14657e3c1` | 122 | `08e78645a5206ad6854a7a8b857de9f138234b31a2c13893e5bd6c8ae007f49c` | `0x1401bc454` |
| Join denial | `0x06580be1` | `0x1465817e1` | 33 | `b42587a39dd5529f9d5e2a7a62d043980a049b3968b22f82edd07c2a91ecb990` | `0x1402226b0` |
| Lobby denial | `0x06581091` | `0x146581c91` | 34 | `7c9cfd51c343b405e4888ee1b23ce312d80630582b82dcca563594433bcaaba4` | `0x140227a38` |
| Champion description suffix | `0x073b7834` | `0x1473b8434` | 46 | `b29bbec2c47dddd6b233e23e869536bd54c6c2be7610d210966c48967eaa740b` | Pending. The adjacent name and achievement key are referenced at `0x145de2a3d` and `0x145de2b5b`. |

### Selected and unlocked state

`0x145e76430..0x145e76502` binary-searches the account's sorted 24-byte
string records for the exact `heroic:naxx5` key at `0x1473d4b10` and returns
the equality byte. `0x14023f800..0x14023f844` admits the selected mode byte
only when the achievement check succeeds. `0x14023f849..0x14023f853`
separately computes unlock state. The parent passes both bytes through
`0x1401bab50` and `0x14022eeb0` to the Difficulty panel. At `0x1401bc44c`
the unlock byte selects the pacing or locked tooltip, and `0x1401bc8fc`
reads the admitted selection for checked styling.

The writer at `0x14023ec60..0x14023f376` snapshots Pick mode at `+0x30`
and Heroic rank at `+0x39`. Action tag 1 requires the same achievement
lookup and toggles the mode byte at `0x14023ef73` or `0x14023f1ee`.
The rank and close branches are separate. If rank or mode changes,
`0x14023f267..0x14023f362` queues a single tag-12 Pick update through
`0x140009b00`. The full writer starts at file `0x23e060`, spans 1,814
bytes and hashes to
`e163b0a1a3bb7ae653bf34df51c64ee87a34f053f14deef4ceb123f7e566cd9f`.
The rebuilt menu already handles rank/close in `menu.rs::apply_actions`.
Trace the update consumer, persistent representation and run handoff.

The Enter preview reads the final encounter row's minute at `+0x50`.
`0x14018e381..0x14018e3a0` gates a multiply by 0.5 on selected and earned
Hyper, then `0x14018e421..0x14018e46d` supplies the result to the
`picker.awaits` minute field. The rebuilt `picker.rs` sends unscaled
`zone.minute` to that template. The separate difficulty formatter at
`0x145ea8260..0x145ea8329` joins the normal rank label with localized
`Hyper` when the mode byte is set. These establish presentation paths.
The actual encounter deadlines and simulation clocks still need recovery.

### Cooperative lock and presentation

In the `server/party.rs` owner `0x145e4c990..0x145e4cf32`, a mode-gated
branch tests the same achievement and combines its absence with the rank
gate. `0x145e4ceb9` calls `0x145e47310`, which emits `locked:hyper` for
its nonzero Hyper discriminator. The join renderer at `0x14022250f`
recognizes that exact 12-byte value and selects the lower-case denial.
The lobby's locked-row tooltip separately matches the five-byte `hyper`
reason at `0x1402279bd`. The
[co-op trace](coop.md#01430-hyper-mode-admission) follows the host's earned
gate, the guest's achievement ordinal, and the outbound directory profile.
The incoming directory row, party publication and game-start carrier still
need proof.

For the next journaled Ghidra pass, select the Difficulty extent
`[0x1401bbfd0,0x1401bceda)`, join denial `[0x1402224e0,0x140223482)`,
lobby denial `[0x140227900,0x140227aa8)` and Champion definition
`[0x145ddef20,0x145de8f9a)`. Follow the Pick update and its aliases before
assigning the gameplay, reward or wire fields. Compilation and controlled
solo/host/guest comparisons remain pending, including Normal and Heroic
selection, final-boss and Endless timing, reward delivery, and the 40-minute
achievement boundary.

## 0.141.0 gameplay and UI

The [eleven supplied claims](../CHANGELOG.md#01410) are individually recorded in the
[claim reviews](coverage/changelog-reviews.json) for `installed-game/AzerothSurvivors.exe`,
151,493,632 bytes, SHA-256
`6ca5f4ba4eb6b26716e4b7d9e03cbd25ddafe7582dcd8e55333e070a28058afa`.
Ten records have bounded static checks. The Ras record establishes source
connections and retains separate native evidence. Compilation, rebuilt
execution and original/rebuilt parity remain open in the linked findings.

| Claim ID suffix | Assessment and live source consumer | Finding and evidence |
| --- | --- | --- |
| `1d25a9296037f7e2` | Release summary. The three parts map to the Scholomance reward, pet attribution and Tranquility reviews below. | [#314](../verification-needed.md#gap-314), [#316](../verification-needed.md#gap-316), [#176](../verification-needed.md#gap-176) |
| `f9668c51059bacce` | One 50% armor roll with missing-piece priority. The award updates the recipient's ownership before another roll. The guest Hero message supplies entry ownership. Armory item and missing-list rows both display the fixed 25% catalog value, even when the missing item's actual chance is 50%. | [#314](../verification-needed.md#gap-314), [loot, wire and Armory](scholomance-loot.md) |
| `2b181b04dadea0dc` | The same reward owner uses the separate 25% Gandling gate and grants the full class weapon group, including both weapons for Rogue and Shaman. | [#314](../verification-needed.md#gap-314), [Gandling reward branch](scholomance-loot.md) |
| `8fdf49158695cf60` | The direct and frame healing paths credit effective healing plus overheal to Tranquility. Seed suppression, the anonymous direct-heal gate, the shield cap and effective-healing meter each retain separate handling. | [#176](../verification-needed.md#gap-176), [healing owners](tranquility-overheal.md) |
| `6caaee7fb93fce4a` | Ordinary and detailed meter rows receive the pet attack, Bleed, Shockwave and Wolf's Howl share through the live hit and recipient paths. The Howl share is split from capped damage. The detailed recorder retains companion and attack identities before aggregation. | [#8](../verification-needed.md#gap-8), [#75](../verification-needed.md#gap-75), [#316](../verification-needed.md#gap-316), [pet meter](pet-meter.md) |
| `6ea2cb1d0b80a4b9` | The offer and apply paths cap Soulfire's upgrade contribution at 12 added targets. The launch loop and live tooltip use the full shared count including the other bonus sources. | [#319](../verification-needed.md#gap-319), [Soulfire](soulfire.md) |
| `5788d609499311cd` | The sourced active melee callback admits Counterattack at 15% or 30%. The proc uses the ordinary Immolation Trap dispatcher and learned trap upgrades, with a fallback when unlearned. | [#316](../verification-needed.md#gap-316), [Counterattack](counterattack.md) |
| `ba5b9288f47bcd34` | The Shock scheduler takes one nearby secondary result per pass and applies the rank's 10%, 20% or 30% fraction to direct and periodic paths. A Stormbound repeat uses the same fraction and queries again. | [#305](../verification-needed.md#gap-305), [Resonant Shocks](resonant-shocks.md) |
| `30f289e99809b166` | The two retained 6%-per-rank spell modifiers feed the shared localized talent formatter, which substitutes both cumulative values for ranks 1–5. | [#34](../verification-needed.md#gap-34), [Improved Mind Blast](improved-mind-blast.md) |
| `26f30cd823bea0f6` | The boss damage path applies 0.25 for eight seconds and the marker path displays the two rising towers. The first admitted touch removes both towers and applies 1.2 for four seconds. Natural expiry grants no vulnerability. | [#313](../verification-needed.md#gap-313), [Ras script and marker evidence](scholomance-ras.md) |
| `623f08c5eb0ffcb7` | The four damage meter views share the vertical viewport and retained offset. Reset clears displayed baselines and rate samples, and the viewport clamps its offset to the new extent. | [#8](../verification-needed.md#gap-8), [viewport and Reset](meter-scroll.md) |

The loot release note describes the Armory as showing the actual chance. The
two recovered native display consumers copy the catalog value, so the 25% label
and the conditional 50% reward chance have separate evidence. Verify the
rendered views alongside solo, host and guest reward behavior under
[#314](../verification-needed.md#gap-314).

Review refresh checked the changed source consumers against their retained
proofs. The fourteen Improved Mind Blast templates and 42 pet locale values
were unchanged. The 0.141.0 Tranquility check replayed 576 bounded cases. The
earlier two-player achievement claim also retained its 0.141.0 correspondence
after replaying 516 recipient and history cases. Its scoped proof remains
under [#195](../verification-needed.md#gap-195).

The #41 recheck compared the six changed claim paths with their exact reviewed
source. The current [claim records](coverage/changelog-reviews.json) retain the
individual scope and rationale for loot, Tranquility, pet attribution,
Soulfire, Ras and meter scrolling. The current Tranquility and choice-preview
replays passed. The remaining checks follow the linked verification entries.

## Windows exception report and dump

The Windows crash claim `changelog:0.141.1:548650aa574f4367` has a
[source and recovery finding #326](../CURRENT-STATE.md#gap-326). The
0.143.0 PE, SHA-256
`f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`,
adds the `dbghelp.dll!MiniDumpWriteDump` import relative to 0.141.0.
Capstone 5.0.7 decoding from each declared start establishes these static edges:

| Current selector | Observation |
| --- | --- |
| `0x140007490..0x1400076bb` | The `0x140007591` LEA references `Diagnostics` at file offset `0x655cb05`. The `0x140007627` call passes the joined path into `0x140360300`. |
| `0x140360300..0x140360416` | `0x14036032e` loads `0x14035e680` into RCX. `0x140360335` calls `kernel32!SetUnhandledExceptionFilter` through IAT slot `0x1465598d0`. |
| `0x14035e680..0x14035fab1` | `0x14035e6d1` exchanges a one-byte latch and the following branch tests it. `0x14035e955` loads flags `0x1040` and `0x14035e95b` calls `MiniDumpWriteDump` through IAT slot `0x146559648`, with current process/thread information and exception parameters. The path format operands at `0x14035e7ad` and `0x14035f73b` select packed `fault-` formats with `.dmp` and `.txt` suffixes at file offsets `0x65c082c` and `0x65c0843`. |

The three code ranges have SHA-256 commitments
`9f9fc16b779e9ede98262abd101982fcc7f8393b501018405cf64315c298bf23`,
`45250ad97e1d30b30be8e956ef5dab2fe6c4b24c031175a8e783c8bd16d0311a`
and `6297d31ceb2e6c902bae15f01b0e59b76f9aa51c498d23ff8f1caffcbff73ba1`
in table order. These preferred addresses describe the installed PE.

The rebuilt [`crash::install`](../../crates/benilla-app/src/crash.rs) chains
the Rust panic hook and writes `Diagnostics/crash-<unix>.txt`. Reuse its
[startup call](../../crates/benilla-app/src/lib.rs) and
[local state directory](../../crates/benilla-app/src/local_state.rs) as the
source boundary. Recover the original startup guard, exception classification,
filename interpolation, text-write failures and filter return/chaining. The
static route establishes callback registration and the dump call. Windows
execution, filesystem results and original/rebuilt comparison remain separate.

## 0.141.1 follow-through and the macOS release

Earlier source repairs and their 0.141.1 proof retain SHA-256
`47f4da62a0ab17f10ef420c82ea4a6b66ad65be931aae2713bc938e191d72de6`.
Current Windows PE applicability is separate for each retained claim.

| Claim suffix | Retained source and next 0.143.0 proof |
| --- | --- |
| `303cc692c90057b9` | Release summary linking Every Bauble, rifle, tabard and Battle Shout below. |
| `eaa7fb6599d2747c` | The [current Codex and evaluator trace](coop-codex.md#01430-every-bauble-correspondence) verifies the 141-key set, Seen intersection and 100% threshold. The exact startup award and normalization remain under [#19](../verification-needed.md#gap-19) and [#73](../CURRENT-STATE.md#gap-73). |
| `e9b58d2529ae6b7e` | Follow guest Rockbiter's private legendary codex grant through the current host/guest path under [#63](../CURRENT-STATE.md#gap-63) and [#73](../CURRENT-STATE.md#gap-73). |
| `737de64a7a82f25e` | The current item resolver compares display `34484` at `0x145e5d6c2` and stores inventory `26` and subclass `3` on the gun branch. DBC row `34484` remains in the unchanged base archive. Trace item admission, animation, shot-ammo/muzzle and tooltip independently from damage under [#6](../verification-needed.md#gap-6). |
| `f254ac47b93d1ae2` | The [0.143.0 correspondence](lordaeron-tabard.md#01430-correspondence) proves item `90012` resolves to display `16078`, with matching Rewards descriptor, display row and both patch-D textures. Rebuilt lookup and render comparisons remain under [#324](../verification-needed.md#gap-324). |
| `5fb431ffa62f27ff` | Recheck the shouter's Horn and Bloodlust through ally aura state and individual tooltip fields under [#289](../verification-needed.md#gap-289). |
| `548650aa574f4367` | The [Windows callback](#windows-exception-report-and-dump) supplies the native lead for [#326](../CURRENT-STATE.md#gap-326). |
| `1f80975a909f28c0` | Release acknowledgement with no behavior claim. |
| `834d0a8114d2f92f` | macOS release summary linking the next two claims. |
| `97ee6c8f365508a6` | Apple silicon package, minimum macOS and first-launch instructions need the distributed macOS artifact for assessment. [#133](../CURRENT-STATE.md#gap-133) owns platform packaging and update applicability. |
| `e268b7f6ce6a673d` | Startup updates on macOS need that package's actual updater and data path under [#133](../CURRENT-STATE.md#gap-133). The selected Windows PE's updater version witness has Windows scope. |

## Retained reports

[0.140.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.140.0.md) · [0.139.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.1.md) · [0.139.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.0.md) · [0.127.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.127.0.md) · [0.123.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.123.0.md) · [0.121.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.121.0.md) · [0.120.5](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.5.md) · [0.120.4](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.4.md) · [0.120.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.2.md) · [0.120.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.0.md) · [0.119.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.119.1.md) · [0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.119.0.md) · [0.118.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.118.0.md) · [0.117.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.117.0.md)
