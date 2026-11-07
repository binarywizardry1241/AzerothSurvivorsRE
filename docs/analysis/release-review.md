# Release-claim review

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

## Retained reports

[0.140.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.140.0.md) · [0.139.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.1.md) · [0.139.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.139.0.md) · [0.127.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.127.0.md) · [0.123.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.123.0.md) · [0.121.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.121.0.md) · [0.120.5](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.5.md) · [0.120.4](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.4.md) · [0.120.2](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.2.md) · [0.120.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.120.0.md) · [0.119.1](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.119.1.md) · [0.119.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.119.0.md) · [0.118.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.118.0.md) · [0.117.0](https://github.com/binarywizardry1241/AzerothSurvivorsRE/blob/229fd4278b9b40ecd552f1561b4e4e92b3f03339/docs/analysis/release-review-0.117.0.md)
