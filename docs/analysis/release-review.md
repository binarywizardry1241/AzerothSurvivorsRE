# Release-claim review

## 0.143.0 Hyper Mode

The [eight supplied claims](../CHANGELOG.md#01430) share [#325](../verification-needed.md#gap-325).
The selected Windows PE is `installed-game/AzerothSurvivors.exe`, 151,566,336
bytes, SHA-256 `f35034ea7d44c99728cc6cd5a07a06db1bc46dff3bbd24e1df2755934dd2b07b`.
The source carries one admitted mode through the picker, run construction,
scheduler, terminal accounting and co-op replication.

| Claim ID suffix | Bounded result |
| --- | --- |
| `20eeba1dc4defaf3` | The release summary combines the achievement gate, timing changes and downstream consumers below. |
| `2052657ed900be9c` | The [Difficulty and save contract](difficulty-ui.md#hyper-mode-in-01430) connects the existing Champion key, independent mode toggle, Pick reload, admission and Again. |
| `874ebdc6e9a66c37` | The primary scheduler at `0x145f71793..0x145f71836` halves the due minute and passes the same 1.0 constructor factor. All 65 native row times across 13 zones match the source table. Hyper finals land at 8, 9 or 10 real minutes. |
| `850ed6c5a1af2d9e` | Lair death at `0x145f5b8a6..0x145f5b910` and `0x145f5bca8..0x145f5bcd1` selects the rank delay (180 or 150 seconds), divides by two in Hyper and adds real elapsed time. Respawn suppression still uses the existing lifecycle gate. |
| `d9930831bf9a59da` | The scheduling path retains the effective mob-clock lead after the final-boss threshold. Initial and repeating Endless boss deadlines use 150 real seconds in Hyper and 300 otherwise. |
| `d829b1125a14e67a` | Terminal XP uses the capped lead for selected-and-earned Hyper, including defeat and Endless. The loot owner uses the same rank, boss, phase, repeat count and per-hero inputs across modes. |
| `b818f572e247d44b` | Timed achievements read actual elapsed time and the separately captured actual first-fall time. The 40-minute cutoff still consumes 2,400 real seconds. |
| `d9da87b3033fb4b5` | [Co-op admission and projection](coop.md#01430-hyper-mode-admission) carry the host mode through directory, roster and State15. Admission checks Champion after zone and rank eligibility. |

### Clocks and live consumers

`Game+0x464` is admitted Hyper and `Game+0x1030` is actual elapsed seconds.
The mob clock at `0x145f6f1dc..0x145f6f27a` and
`0x145f6f3f0..0x145f6f48b` uses
`2 * min(real_minutes, half_final) + max(real_minutes - half_final, 0)`.
`half_final` is half the fifth boss row's minute or 10 if the row is absent.
The zone table at `0x1473abc98` uses a `0xf0` zone stride, a boss pointer at
`+0x88`, a `0x68` boss stride and due minute at `+0x50`. The same effective
clock reaches the spawn budget, ordinary enemy strength and guardian strength
at `0x145f561c1..0x145f562cc`, `0x145f58045..0x145f5816d`,
`0x146004686..0x146004705` and `0x146004bc1..0x146004c3d`. The Explosive
ward HP calculation at `0x145f6f27a..0x145f6f358` uses that clock for its
ordinary HP polynomial. Per-actor deadlines, real delta and the separate
Endless elapsed growth input use actual time.

The initial Endless deadline at `0x145f9c8fb..0x145f9c943` and repeating
deadline at `0x145f71e70..0x145f71ee3` add 150 or 300 to actual elapsed
seconds. The rebuild shares these values across scheduling and guest
projection. The native HUD and addon owners scale primary countdowns and
schedule rows (`0x145fb2263..0x145fb22f2`, `0x145f3f55c..0x145f3f5fe`,
`0x145f3f9f0..0x145f3fa70`, `0x145f40936..0x145f409b1`,
`0x146064ad2..0x146064af5`). The Begin magnet window uses the scaled final
deadline at `0x145fbfc6c..0x145fbfcce`, with its 1,200-second missing-row
fallback preserved. Source connects the shared schedule to live spawning,
lair refill, magnet, affix and addon consumers.

### Rewards and timed achievements

The summary owner `0x145e38830..0x145e39d9d` uses snapshot `+0xfc` and
the account's earned Champion key. Its XP input is real seconds plus
`min(real_seconds, half_final * 60)` when both are true. The source shares
this calculation across local and both guest settlement paths. Best time,
terminal time, counters and feat inputs retain actual elapsed time.
The native feat delivery at `0x145e418c8` and `0x145e41a15` forwards raw
snapshot `+0xd0`. The first-fall producer at `0x145fb0919..0x145fb095a`
captures the real clock into an empty latch in started co-op. The party
context writes it at `0x145f4d6f7` for the evaluator. The current achievement
description selected at `0x145de7801` includes the no-deaths clause. The
source now uses that localized key. The ordinary boss
reward owner `0x145f56550..0x145f56cc2` reads boss/zone, rank, phase,
Endless count, final flag and per-hero inputs. The reconstructed marks and
loot paths already share those inputs across modes.

### Static checks

`python3 -B scripts/check-difficulty-ui.py --hyper` checks 17 bound PE
ranges, the picker/save/entry seams and all 14 locale catalogs. It also
replays 44 bounded Pick parse/write and solo-admission cases. Bounded
original-instruction replay passed 704 pacing cases and 464 settlement
cases (416 XP, 36 first-fall and 12 timed-feat). Ghidra queries covered
the row constructor, boss scheduler, reward summary and co-op wire and
admission helpers. Raw-slice analysis preserves the original VA and byte
digest; external calls and data are checked separately at their PE sites.
The underlying Ghidra results remain in the shared catalog. Compilation,
authored Rust regressions, rendered input, actual service traffic and
original/rebuilt parity remain open in [#325](../verification-needed.md#gap-325).

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
