//! Owner-private choices and display metadata use the native party envelopes.
//! Current 1459770c0 owns the card JSON; 14590f0f0 owns the HUD snapshot.
//! See docs/analysis/coop-overlay-0.115.0.md for producer and validation limits.
use super::*;
use benilla_app::local_client::{LocalClientExtension, LocalClientInput};
use serde_json::{Value, json};

#[path = "coop_spell_auxiliary.rs"]
mod spell_auxiliary;
#[path = "coop_spell_text.rs"]
mod spell_text;

#[derive(Default)]
struct Published {
    identity: Option<u64>,
    at: f64,
    choices: HashMap<ClientId, (u64, String)>,
    resumes: HashMap<ClientId, u64>,
    recaps: HashMap<ClientId, recap::Published>,
    hud: HashMap<ClientId, Value>,
    resources: HashMap<ClientId, Vec<ResourceRow>>,
    timers: HashMap<ClientId, Vec<TimerRow>>,
    locales: HashMap<String, crate::localization::Localization>,
}

pub(super) fn install(app: &mut App) {
    app.add_systems(
        Update,
        publish
            .after(publication::publish)
            .after(RunSet::Tick)
            .before(RunSet::Present),
    )
    // Feed/UI input precedes the world tick. Seat the last completed state;
    // ordering this publisher after Tick would create a schedule cycle.
    .add_systems(Update, guest_metadata.before(LocalClientSet::Feed))
    .add_systems(
        Update,
        guest_hud
            .in_set(RunSet::Present)
            .before(native_overlays::animate)
            .before(native_overlays::confirmation::sync)
            .before(native_overlays::tooltip::rebuild),
    );
}

fn spell_resources(
    game: &Mechanics,
    locale: &crate::localization::Localization,
) -> Vec<ResourceRow> {
    let (area_multiplier, buff_bonus, dot_tick_bonus, global_targets) = game.description_inputs();
    let context = native_overlay_payload::Context {
        maximum_health: game.max_health(),
        damage_multiplier: game.current_damage_multiplier(),
        cooldown_multiplier: game.current_cooldown_multiplier(),
        bonuses: native_overlay_payload::DescriptionBonuses {
            area_multiplier,
            buff_bonus,
            dot_tick_bonus,
            global_targets,
        },
    };
    let mut rows = Vec::new();
    for key in game.class.pool {
        let Some(definition) =
            azeroth_survivors_re::player_abilities::AbilityDefinition::by_key(key)
        else {
            continue;
        };
        let learned = game
            .abilities
            .iter()
            .find(|row| row.definition.key == definition.key);
        let preview = game.preview_spell(definition, 0);
        let (instance, mode) = learned.map_or((&preview, spell_text::Mode::Unlearned), |row| {
            (row, spell_text::Mode::Learned)
        });
        rows.push(spell_resource(game, instance, mode, locale, &context));
    }
    if let Some(racial) = &game.racial {
        rows.push(spell_resource(
            game,
            racial,
            spell_text::Mode::Racial,
            locale,
            &context,
        ));
    }
    for instance in &game.abilities {
        if !rows
            .iter()
            .any(|row| row.id == instance.definition.spell_id)
        {
            rows.push(spell_resource(
                game,
                instance,
                spell_text::Mode::Talent,
                locale,
                &context,
            ));
        }
    }
    spell_auxiliary::append(&mut rows, game, locale);
    spell_auxiliary::active_battle_shout(&mut rows, &game.execution.auras,
        game.clock, buff_bonus, locale);
    rows
}

fn spell_resource(
    game: &Mechanics,
    instance: &azeroth_survivors_re::player_abilities::RuntimeInstance<'_>,
    mode: spell_text::Mode,
    locale: &crate::localization::Localization,
    context: &native_overlay_payload::Context,
) -> ResourceRow {
    let definition = instance.definition;
    let rank = match mode {
        spell_text::Mode::Learned => locale
            .label("Rank {n}")
            .replace("{n}", &instance.rank.to_string()),
        spell_text::Mode::Unlearned => locale.label("Not learned").to_owned(),
        spell_text::Mode::Racial => locale.label("Racial").to_owned(),
        spell_text::Mode::Talent => locale.label("Talent").to_owned(),
    };
    let range = spell_range(instance, context.bonuses.area_multiplier).map(|(template, amount)| {
        locale
            .label(template)
            .replace("{n}", &native_overlay_payload::number(amount))
    });
    let cooldown = (!(definition.kind == 11
        && matches!(definition.key, "redemption" | "faerie_fire")))
    .then(|| {
        let value = if definition.kind == 11 {
            azeroth_survivors_re::player_abilities::behavior::totem_passives::passive_interval(
                instance,
                game.current_cooldown_multiplier(),
            )
        } else {
            damage::base_interval(instance, game.current_cooldown_multiplier())
        };
        locale
            .label("{n} sec cooldown")
            .replace("{n}", &native_overlay_payload::number(value))
    });
    ResourceRow {
        id: definition.spell_id,
        name: locale
            .lookup(&format!("ability.{}.name", definition.key))
            .unwrap_or(definition.name)
            .to_owned(),
        text_18: spell_text::primary(
            native_overlay_payload::description(instance, &context, &context.bonuses, locale)
                .unwrap_or_default(),
            game,
            instance,
            mode,
            locale,
        ),
        text_30: spell_secondary(instance, &context, locale),
        optional: [
            Some(rank),
            range,
            Some(
                locale
                    .label(if definition.kind == 11 {
                        "Passive"
                    } else {
                        "Automatic"
                    })
                    .to_owned(),
            ),
            cooldown,
        ],
    }
}

/// Current1458629b0 separates the status body from the ability description.
/// The retained combat catalog predates the insertion of demonic empowerment;
/// translate that descriptor's enum identity at this display boundary only.
fn spell_secondary(
    instance: &azeroth_survivors_re::player_abilities::RuntimeInstance<'_>,
    context: &native_overlay_payload::Context,
    locale: &crate::localization::Localization,
) -> String {
    use azeroth_survivors_re::player_abilities::{behavior::periodic::DotPlan, damage};
    let definition = instance.definition;
    let native_tag = spell_text::native_tag(instance);
    let mut effect = definition.effect.value;
    if matches!(native_tag, 2 | 3 | 7 | 8 | 9 | 10) {
        effect *= instance.effect_multiplier;
    }
    if native_tag == 11 {
        effect = azeroth_survivors_re::player_abilities::behavior::state::scaled_hit_effect(instance).value;
    }
    let replace = |template: &str, values: &[(&str, String)]| {
        let mut text = locale.label(template).to_owned();
        for (key, value) in values {
            text = text.replace(&format!("{{{key}}}"), value);
        }
        text
    };
    let number = native_overlay_payload::number;
    if definition.kind == 6 {
        let power = damage::effective_power(
            instance,
            &damage::PowerContext {
                maximum_health: context.maximum_health,
                damage_multiplier: context.damage_multiplier,
            },
        );
        let plan = DotPlan::new(instance, power, context.bonuses.dot_tick_bonus);
        let school = [
            "Physical", "Holy", "Fire", "Nature", "Frost", "Shadow", "Arcane",
        ]
        .get(usize::from(definition.school))
        .copied()
        .unwrap_or("");
        let mut text = replace(
            "{total} {school} damage over {secs} sec.",
            &[
                ("total", number(plan.total_power)),
                ("school", locale.label(school).to_owned()),
                ("secs", number(plan.duration)),
            ],
        );
        if native_tag == 5 {
            text.push_str(&replace(
                " Heals the caster for {p}% of it.",
                &[("p", format!("{:.0}", effect * 100.))],
            ));
        }
        if native_tag == 11 {
            text.push_str(&replace(
                " Deals {p}% less damage.",
                &[("p", format!("{:.0}", effect * 100.))],
            ));
        }
        return text;
    }
    match native_tag {
        2 => locale.label("Rooted in place.").to_owned(),
        3 => locale.label("Stunned.").to_owned(),
        6 if definition.kind == 9 && definition.duration > 0. => {
            let heal = (instance.power_multiplier * instance.talent_power_multiplier).sqrt()
                * 1.4
                * (effect * context.maximum_health);
            replace(
                "Healing {n} over {secs} sec.",
                &[
                    ("n", number(heal)),
                    ("secs", number(damage::scaled_duration(instance))),
                ],
            )
        }
        7 => {
            let mut absorb = effect * context.maximum_health;
            if definition.kind == 9 {
                absorb *=
                    (instance.power_multiplier * instance.talent_power_multiplier).sqrt() * 1.4;
                absorb *= 1. + context.bonuses.buff_bonus;
            } else {
                absorb *= 1.4;
            }
            replace("Absorbs up to {n} damage.", &[("n", number(absorb))])
        }
        8 if definition.kind == 9 => replace(
            "Damage increased by {p}%.",
            &[(
                "p",
                format!("{:.0}", (effect * (1. + context.bonuses.buff_bonus)) * 100.),
            )],
        ),
        9 if definition.kind == 9 => replace(
            "Cooldowns recover {p}% faster.",
            &[(
                "p",
                format!("{:.0}", (effect * (1. + context.bonuses.buff_bonus)) * 100.),
            )],
        ),
        10 if definition.kind == 9 => replace(
            "Demons deal {d}% more damage.",
            &[(
                "d",
                format!("{:.0}", (effect * (1. + context.bonuses.buff_bonus)) * 100.),
            )],
        ),
        12 if definition.kind == 9 => locale.label("Immune to all damage.").to_owned(),
        13 if definition.kind == 9 => {
            let value = instance.power_multiplier * effect * instance.talent_power_multiplier;
            let value = ((1. + context.bonuses.buff_bonus) * value) * context.damage_multiplier;
            replace("Melee attackers take {n} damage.", &[("n", number(value))])
        }
        _ => String::new(),
    }
}

fn spell_range(
    instance: &azeroth_survivors_re::player_abilities::RuntimeInstance<'_>,
    area: f32,
) -> Option<(&'static str, f32)> {
    let definition = instance.definition;
    let radius = match definition.kind {
        2 => true,
        3 | 10 => definition.range <= 0. && definition.radius > 0.,
        8 => true,
        9 => return None,
        11 => {
            if definition.radius > 0. {
                true
            } else if definition.range > 0. {
                false
            } else {
                return None;
            }
        }
        _ => false,
    };
    if !radius {
        return Some(("{n} yd range", definition.range));
    }
    let value = instance.area_multiplier
        * instance.talent_area_multiplier
        * if definition.kind == 8 {
            definition.range
        } else {
            definition.radius
        };
    let value = area * value;
    let value = if value > 70. {
        ((value - 70.) / 10.).ln_1p() * 10. + 70.
    } else {
        value
    };
    Some((
        if definition.kind == 8 {
            "{n} yd cone"
        } else {
            "{n} yd radius"
        },
        value,
    ))
}

fn spell_intervals(game: &Mechanics) -> Vec<TimerRow> {
    // Despite the retained wire record name, current145936cf0 publishes
    // visual radius/base-radius ratios and a kind8 attached-kit flag.
    game.visual_spell_scales()
        .into_iter()
        .map(|row| TimerRow {
            id: row.spell_id,
            value_bits: row.scale.to_bits(),
            flag: row.attached,
        })
        .collect()
}

fn guest_metadata(
    runtime: Res<CoopRuntime>,
    state: Res<CoopGame>,
    mut run: ResMut<RunSession>,
    mut descriptions: ResMut<benilla_app::local_client::LocalSpellDescriptions>,
    mut scales: ResMut<benilla_app::local_client::LocalSpellScales>,
    locale: Res<crate::localization::Localization>,
    mut active: Local<bool>,
) {
    if !runtime.is_guest() {
        // The local hero uses the same native display producer as a recipient.
        // The ordinary DBC spell feed cannot supply AS upgrades/talent prose.
        let rows = run
            .mechanics
            .as_ref()
            .map(|game| spell_resources(game, &locale))
            .unwrap_or_default();
        let rows = rows.iter().map(local_description).collect::<Vec<_>>();
        if descriptions.0 != rows {
            descriptions.0 = rows;
        }
        if *active {
            scales.0.clear();
            *active = false;
        }
        return;
    }
    *active = true;
    if state.zone.is_none() {
        descriptions.0.clear();
        scales.0.clear();
        return;
    }
    if let (Some(game), Some(hud)) = (run.mechanics.as_mut(), state.hud.as_ref()) {
        game.apply_replica_hud(hud);
    }
    let rows = state
        .resources
        .iter()
        .map(local_description)
        .collect::<Vec<_>>();
    if descriptions.0 != rows {
        descriptions.0 = rows;
    }
    let rows = state
        .timers
        .iter()
        .map(|row| benilla_app::local_client::LocalSpellScale {
            spell_id: row.id,
            scale: f32::from_bits(row.value_bits),
            attached: row.flag,
        })
        .collect::<Vec<_>>();
    if scales.0 != rows {
        scales.0 = rows;
    }
}

fn local_description(row: &ResourceRow) -> benilla_app::local_client::LocalSpellDescription {
    benilla_app::local_client::LocalSpellDescription {
        spell_id: row.id,
        name: row.name.clone(),
        description: row.text_18.clone(),
        secondary: row.text_30.clone(),
        rank: row.optional[0].clone(),
        range: row.optional[1].clone(),
        cast: row.optional[2].clone(),
        cooldown: row.optional[3].clone(),
    }
}

/// The native pick owner retains the authoritative offer across local dismissal.
pub(super) fn receive_choices(state: &mut CoopGame, bytes: &[u8]) -> bool {
    state.pick.receive(bytes)
}

fn raw_icon(card: &native_overlays::Card, art: &MenuArt) -> String {
    let Some(handle) = &card.icon else {
        return String::new();
    };
    let key = art
        .icons
        .iter()
        .find_map(|(key, image)| (image == handle).then_some(key.as_str()));
    match key {
        Some("native_gold_choice") => "INV_Misc_Coin_02".to_owned(),
        Some(key) => azeroth_survivors_re::player_abilities::AbilityDefinition::by_key(key)
            .map_or_else(|| key.to_owned(), |row| row.icon.to_owned()),
        None => String::new(),
    }
}

fn card_payload(
    card: &native_overlays::Card,
    art: &MenuArt,
    locale: &crate::localization::Localization,
) -> Value {
    use native_overlays::CardKind;
    let kind = match card.kind {
        CardKind::NewSpell => "new",
        CardKind::UpgradeSpell => "upgrade",
        CardKind::Ring => "ring",
        CardKind::Trinket => "trinket",
        CardKind::Amulet => "amulet",
        CardKind::Gold => "gold",
        CardKind::Other => "",
    };
    let mut value = json!({"title":card.title,"name":card.name,"lines":card.lines.join("\n"),
        "text":card.text,"icon":raw_icon(card,art),"rarity":card.rarity,
        "rarityName":locale.label(&format!("rarity.{}",card.rarity)),"kind":kind});
    if let Some(rank) = card.rank {
        value["rank"] = json!(rank);
    }
    if matches!(
        card.kind,
        CardKind::Ring | CardKind::Trinket | CardKind::Amulet
    ) {
        value["worn"] = json!(card.worn);
    }
    if card.banish {
        value["banish"] = Value::Bool(true);
    }
    if let Some(replacement) = &card.replacement {
        value["replaces"] = json!(replacement.name);
        value["replacesText"] = json!(replacement.lines.join("\n"));
        let icon = art
            .icons
            .iter()
            .find_map(|(key, image)| {
                replacement
                    .icon
                    .as_ref()
                    .is_some_and(|handle| handle == image)
                    .then_some(key.clone())
            })
            .unwrap_or_default();
        value["replacesIcon"] = json!(icon);
        value["replacesRarity"] = json!(replacement.rarity);
        value["replacesRank"] = json!(replacement.rank);
    }
    value
}

fn choice_payload(
    game: &Mechanics,
    art: &MenuArt,
    locale: &crate::localization::Localization,
) -> Option<Value> {
    if game.dead || game.completed || game.choices.is_empty() {
        return None;
    }
    let (area_multiplier, buff_bonus, dot_tick_bonus, global_targets) = game.description_inputs();
    let context = native_overlay_payload::Context {
        maximum_health: game.max_health(),
        damage_multiplier: game.current_damage_multiplier(),
        cooldown_multiplier: game.current_cooldown_multiplier(),
        bonuses: native_overlay_payload::DescriptionBonuses {
            area_multiplier,
            buff_bonus,
            dot_tick_bonus,
            global_targets,
        },
    };
    let cards = game
        .choices
        .iter()
        .enumerate()
        .map(|(index, choice)| {
            let mut card = if let Some(reward) = game.cache_reward(index) {
                native_overlay_payload::for_treasure(reward, game, art, locale)
            } else {
                native_overlay_payload::for_choice(choice, game, &context, art, locale)
            };
            if let Some(definition) =
                azeroth_survivors_re::player_abilities::AbilityDefinition::by_key(
                    choice.ability_key,
                )
            {
                card.name = locale
                    .lookup(&format!("ability.{}.name", definition.key))
                    .unwrap_or(definition.name)
                    .to_owned();
            }
            card.banish = game.can_banish_choice(index);
            card_payload(&card, art, locale)
        })
        .collect::<Vec<_>>();
    let footer = game.choice_footer();
    Some(
        json!({"type":"choices","offer":game.choice_offer(),"why":if game.guardian_choices_active(){"guardian"}
        else if game.cache_choices_active(){"cache"}else{"levelup"},"level":game.level,
        "rerolls":footer.rerolls,"rerollCost":footer.reroll_cost,"gold":game.gold,
        "banishes":footer.banishes,"skip":footer.skip_gold.is_some(),
        "skipGold":(game.cache_price()>>2).max(10),"choices":cards}),
    )
}

fn publish(
    mut runtime: ResMut<CoopRuntime>,
    mut state: ResMut<CoopGame>,
    mut run: ResMut<RunSession>,
    time: Res<Time>,
    art: Res<MenuArt>,
    locale: Res<crate::localization::Localization>,
    mut cache: Local<Published>,
) {
    if runtime.is_guest() {
        return;
    }
    if cache.identity != Some(run.identity) {
        let locales = std::mem::take(&mut cache.locales);
        *cache = Published {
            identity: Some(run.identity),
            locales,
            ..Default::default()
        };
    }
    let cache = &mut *cache;
    let Some(game) = run.mechanics.as_mut() else {
        return;
    };
    let now = time.elapsed_secs_f64();
    let due = now - cache.at >= 0.2;
    if due {
        cache.at = now;
    }
    cache.recaps.retain(|client, _| state.admitted.contains_key(client));
    let members = state
        .admitted
        .iter()
        .filter_map(|(client, guid)| {
            game.party_slot(*guid).and_then(|slot| {
                state
                    .profiles
                    .get(client)
                    .cloned()
                    .map(|hero| (*client, slot, hero))
            })
        })
        .collect::<Vec<_>>();
    for (client, slot, hero) in members {
        let synchronized = runtime.driver.as_ref().is_some_and(|driver| {
            driver
                .server
                .clients()
                .iter()
                .any(|row| row.id == client && row.synchronized && row.closing_since.is_none())
        });
        let code = String::from_utf8_lossy(&hero.bytes_30).into_owned();
        let member_locale = cache
            .locales
            .entry(code.clone())
            .or_insert_with(|| locale.for_code(&code));
        let generation = state.choice_generations.get(&client).copied().unwrap_or(0);
        let Some(Some((signature, choices, hud, resources, timers))) =
            game.with_party_hero(slot, |game| {
                cache.recaps.entry(client).or_default().publish(
                    &mut runtime, client, &hero, game, member_locale,
                );
                synchronized.then(|| (
                    format!("{}:{}", game.choice_offer(), offer_signature(game)),
                    choice_payload(game, &art, member_locale),
                    due.then(|| game.coop_hud(member_locale)),
                    due.then(|| spell_resources(game, member_locale)),
                    due.then(|| spell_intervals(game)),
                ))
            })
        else {
            continue;
        };
        if let Some(choices) = choices {
            if cache.choices.get(&client) != Some(&(generation, signature.clone())) {
                if runtime.send(
                    Some(client),
                    NativeMessage::Lifecycle(LifecyclePacket::EventBytes(
                        azeroth_survivors_re::coop::pick::choices_json(choices).into_bytes(),
                    )),
                ) {
                    cache.choices.insert(client, (generation, signature));
                }
            }
        } else if cache.choices.contains_key(&client)
            || (generation != 0 && cache.resumes.get(&client) != Some(&generation)) {
            if runtime.send(Some(client), NativeMessage::Lifecycle(LifecyclePacket::EventBytes(
                br#"{"type":"resume"}"#.to_vec(),
            ))) {
                cache.choices.remove(&client);
                cache.resumes.insert(client, generation);
            }
        }
        if let Some(hud) = hud {
            if cache.hud.get(&client) != Some(&hud) {
                if runtime.send(Some(client), NativeMessage::HudJson(hud.to_string())) {
                    cache.hud.insert(client, hud);
                }
            }
        }
        if let Some(resources) = resources {
            if cache.resources.get(&client) != Some(&resources) {
                if runtime.send(Some(client), NativeMessage::Resources(resources.clone())) {
                    cache.resources.insert(client, resources);
                }
            }
        }
        if let Some(timers) = timers {
            if cache.timers.get(&client) != Some(&timers) {
                if runtime.send(Some(client), NativeMessage::Timers(timers.clone())) {
                    cache.timers.insert(client, timers);
                }
            }
        }
    }
}

fn resolve_icon(art: &MenuArt, key: &str) -> Option<Handle<Image>> {
    art.icons.get(key).cloned().or_else(|| {
        let bare = key
            .trim_start_matches("Interface\\Icons\\")
            .trim_end_matches(".blp");
        if bare == "INV_Misc_Coin_02" {
            return art.icons.get("native_gold_choice").cloned();
        }
        azeroth_survivors_re::player_abilities::ABILITIES
            .iter()
            .find(|row| row.icon.eq_ignore_ascii_case(bare))
            .and_then(|row| art.icons.get(row.key).cloned())
    })
}

fn guest_hud(
    mut commands: Commands,
    runtime: Res<CoopRuntime>,
    state: Res<CoopGame>,
    session: Res<RunSession>,
    art: Res<MenuArt>,
    locale: Res<crate::localization::Localization>,
    opened: Res<ChoicePresentation>,
    roots: Query<Entity, With<native_overlays::OverlayRoot>>,
    mut previous: Local<String>,
    mut images: ResMut<Assets<Image>>,
    mut rays: Local<Option<Handle<Image>>>,
    options: Option<Res<crate::options::OptionsState>>,
) {
    if !runtime.is_guest() {
        return;
    }
    if opened.renewal_pending {
        return;
    }
    let payload = state.pick.visible().filter(|_| {
        session
            .mechanics
            .as_ref()
            .is_some_and(|game| !game.dead && !game.completed)
    });
    let ability_count = state
        .hud
        .as_ref()
        .and_then(|hud| hud["abilities"].as_array())
        .map(Vec::len);
    let skip_key = options.as_deref().and_then(crate::options::OptionsState::skip_key_label);
    let stamp = format!(
        "{}:{}:{}:{}:{ability_count:?}:{skip_key:?}",
        state.pick.revision(),
        opened.at.to_bits(),
        session.paused,
        payload.is_some()
    );
    if *previous == stamp && !art.is_changed() && !locale.is_changed() {
        return;
    }
    *previous = stamp;
    for root in &roots {
        commands.entity(root).despawn();
    }
    let Some(payload) = payload else {
        return;
    };
    let cards = payload["choices"]
        .as_array()
        .into_iter()
        .flatten()
        .map(|row| {
            let mut card = native_overlays::Card::from_payload(row, |key| resolve_icon(&art, key));
            card.slot_count = match card.kind {
                native_overlays::CardKind::NewSpell => state
                    .hud
                    .as_ref()
                    .and_then(|hud| hud["abilities"].as_array())
                    .map(|rows| (rows.len() as u64 + 1).min(6)),
                native_overlays::CardKind::Ring | native_overlays::CardKind::Trinket
                    if card.rank.is_none() =>
                {
                    Some((card.worn + 1).min(2))
                }
                _ => None,
            };
            if let Some(name) = row["replaces"].as_str() {
                card.replacement = Some(native_overlays::ReplacementItem {
                    name: name.to_owned(),
                    icon: row["replacesIcon"]
                        .as_str()
                        .and_then(|key| resolve_icon(&art, key)),
                    rarity: row["replacesRarity"].as_u64().unwrap_or(0).min(4) as usize,
                    rank: row["replacesRank"]
                        .as_u64()
                        .unwrap_or(0)
                        .min(u64::from(u32::MAX)) as u32,
                    lines: row["replacesText"]
                        .as_str()
                        .unwrap_or("")
                        .lines()
                        .map(str::to_owned)
                        .collect(),
                });
            }
            card
        })
        .collect();
    let number = |key: &str| payload[key].as_u64().unwrap_or(0);
    let ray = rays
        .get_or_insert_with(|| {
            images.add(Image::new(
                bevy::render::render_resource::Extent3d {
                    width: 1024,
                    height: 1024,
                    depth_or_array_layers: 1,
                },
                bevy::render::render_resource::TextureDimension::D2,
                native_overlays::ray_pixels(),
                bevy::render::render_resource::TextureFormat::Rgba8UnormSrgb,
                bevy::asset::RenderAssetUsages::default(),
            ))
        })
        .clone();
    native_overlays::spawn(
        &mut commands,
        &art,
        &locale,
        &native_overlays::OverlayState {
            reason: match payload["why"].as_str() {
                Some("cache") => native_overlays::Reason::Cache,
                Some("guardian") => native_overlays::Reason::Guardian,
                _ => native_overlays::Reason::LevelUp,
            },
            level: number("level").min(u64::from(u32::MAX)) as u32,
            cards,
            rerolls: number("rerolls"),
            reroll_cost: number("rerollCost"),
            gold: number("gold"),
            banishes: number("banishes"),
            skip_gold: payload["skip"]
                .as_bool()
                .unwrap_or(false)
                .then(|| number("skipGold")),
            skip_key,
            can_reroll: number("rerolls") != 0 || number("gold") >= number("rerollCost"),
            inputs_enabled: !session.paused,
            opened_at: Some(opened.at),
            ray_image: Some(ray),
        },
    );
}

pub(in crate::gameplay) fn guest_skip_available(state: &CoopGame) -> bool {
    state.pick.visible().is_some_and(|payload| {
        payload["skip"].as_bool() == Some(true)
            && payload["choices"].as_array().is_some_and(|rows| !rows.is_empty())
    })
}

#[allow(clippy::too_many_arguments)]
pub(in crate::gameplay) fn guest_controls<'a>(
    runtime: &mut CoopRuntime,
    state: &mut CoopGame,
    keys: &ButtonInput<KeyCode>,
    input: &LocalClientInput,
    client: &mut LocalClientSession,
    session: &mut RunSession,
    time: &Time,
    clicks: impl Iterator<
        Item = (
            &'a Interaction,
            &'a native_overlays::OverlayAction,
            &'a native_overlays::Enabled,
        ),
    >,
    opened: &mut ChoicePresentation,
    extension: &mut LocalClientExtension,
    options: &mut crate::options::OptionsState,
    pause: &run_hud::Pause,
    stored_clicked: bool,
) -> bool {
    if !runtime.is_guest() {
        return false;
    }
    if session.mechanics.is_none() {
        // Bootstrap/teardown retires the old presentation. A newer Choices
        // packet can already follow ZoneKey, so retain that authoritative pick.
        opened.signature.clear();
        opened.closing = None;
        opened.confirming = None;
        opened.renewal_pending = false;
        client.set_paused(true);
        return true;
    }
    if session
        .mechanics
        .as_ref()
        .is_some_and(|game| game.dead || game.completed)
    {
        state.pick.clear();
        opened.signature.clear();
        opened.closing = None;
        opened.confirming = None;
        opened.renewal_pending = false;
        session.talent_view_open = false;
        session.talent_view_selected = None;
        client.set_paused(true);
        return true;
    }
    if input.talent_toggle {
        session.talent_view_open = !session.talent_view_open;
        if session.talent_view_open {
            session.talent_view_selected = None;
        }
    }
    for (name, value) in &input.cvars {
        if name == "storeLevels" && opened.store_value.as_ref() != Some(value) {
            if extension
                .cvar_writes
                .iter()
                .any(|(pending, _)| pending == name)
            {
                continue;
            }
            runtime.send(
                None,
                NativeMessage::Control {
                    kind: 8,
                    argument: u8::from(native_cvar_text(value) == "1"),
                    offer: 0,
                },
            );
            options.set_engine_cvar(name, value);
            opened.store_value = Some(value.clone());
        } else if name == "cacheOnClick" && options.cvar(name) != Some(value.as_str()) {
            let enabled = value.parse::<f32>().is_ok_and(|value| value != 0.);
            runtime.send(
                None,
                NativeMessage::Control {
                    kind: 7,
                    argument: u8::from(enabled),
                    offer: 0,
                },
            );
            options.set_engine_cvar(name, value);
        } else if name == "spendLevels" && native_cvar_text(value) == "1" {
            runtime.send(
                None,
                NativeMessage::Control {
                    kind: 6,
                    argument: 0,
                    offer: 0,
                },
            );
            extension.cvar_writes.push((name.clone(), "0".into()));
        }
    }
    if stored_clicked && !input.game_menu_open {
        runtime.send(
            None,
            NativeMessage::Control {
                kind: 6,
                argument: 0,
                offer: 0,
            },
        );
    }
    session.paused = input.game_menu_open || session.talent_view_open || pause.paused(options);
    extension.custom_game_menu = true;
    extension.script_update = client::talent_view::publication(true, session.talent_view_open);
    if let Some((_, began)) = opened.closing {
        if !(time.elapsed_secs() - began < CHOICE_EXIT_SECONDS) {
            // The selected payload remains retained until native resume,
            // another authoritative offer, or the four-second retry boundary.
            opened.closing = None;
            opened.renewal_pending = false;
            opened.signature.clear();
        }
    }
    if opened.closing.is_none() {
        let signature = state
            .pick
            .visible()
            .map(|value| format!("{}:{value}", state.pick.revision()))
            .unwrap_or_default();
        if opened.signature != signature {
            opened.signature = signature;
            opened.at = time.elapsed_secs();
            opened.confirming = None;
        }
    }
    let choosing = state
        .pick
        .visible()
        .and_then(|value| value["choices"].as_array())
        .is_some_and(|rows| !rows.is_empty());
    let terminal = session
        .mechanics
        .as_ref()
        .is_none_or(|game| game.dead || game.completed);
    if choosing && !terminal && opened.closing.is_none() && opened.confirming.is_none() && !session.paused {
        let Some(payload) = state.pick.visible() else { return true; };
        let Some(cards) = payload["choices"].as_array() else { return true; };
        let count = cards.len();
        let number = |key: &str| payload[key].as_u64().unwrap_or(0);
        let can_reroll = number("rerolls") != 0 || number("gold") >= number("rerollCost");
        let can_skip = guest_skip_available(state);
        let replacements: Vec<_> = cards.iter()
            .map(native_overlays::confirmation::payload_requires_confirmation).collect();
        let age = time.elapsed_secs() - opened.at;
        let admitted = age >= CHOICE_OPENING_SECONDS;
        let mut actions = Vec::new();
        let mut selected = None;
        let mut pointer_skip = false;
        for (interaction, action, enabled) in clicks {
            if extension.on_top_pointer || *interaction != Interaction::Pressed || !enabled.0 {
                continue;
            }
            match *action {
                native_overlays::OverlayAction::Select(index) if admitted => selected = Some(index),
                native_overlays::OverlayAction::Reroll if can_reroll => actions.push(*action),
                native_overlays::OverlayAction::Banish(_) if admitted => actions.push(*action),
                native_overlays::OverlayAction::Skip if admitted && can_skip => pointer_skip = true,
                _ => {}
            }
        }
        if pointer_skip {
            actions.push(native_overlays::OverlayAction::Skip);
        }
        if let Some(index) = selected.filter(|index| !pointer_skip && *index < count) {
            if opened.select_or_confirm(index, replacements[index], time.elapsed_secs()) {
                actions.push(native_overlays::OverlayAction::Select(index));
            }
        }
        if !pointer_skip && !input.keyboard_captured && opened.closing.is_none() && opened.confirming.is_none() {
            if input.contextual_key_pressed && can_skip {
                if admitted {
                    actions.push(native_overlays::OverlayAction::Skip);
                }
            } else {
                let (selected, reroll) = keyboard_choice_actions(keys, count, age, can_reroll);
                if let Some(index) = selected {
                    if opened.select_or_confirm(index, replacements[index], time.elapsed_secs()) {
                        actions.push(native_overlays::OverlayAction::Select(index));
                    }
                }
                if reroll {
                    actions.push(native_overlays::OverlayAction::Reroll);
                }
            }
        }
        for action in actions {
            let (kind, index) = match action {
                native_overlays::OverlayAction::Select(index) => (0, index),
                native_overlays::OverlayAction::Reroll => (1, 0),
                native_overlays::OverlayAction::Banish(index) => (2, index),
                native_overlays::OverlayAction::Skip => (3, 0),
                native_overlays::OverlayAction::Confirm | native_overlays::OverlayAction::Cancel => continue,
            };
            if let Ok(argument) = u8::try_from(index) {
                let offer = if matches!(kind, 0 | 3) { state.pick.offer() } else { 0 };
                let sent = runtime.send(None, NativeMessage::Control { kind, argument, offer });
                if matches!(kind, 0 | 3) {
                    if sent {
                        if kind == 3 {
                            opened.skip(time.elapsed_secs());
                        }
                        state.pick.selected(time.elapsed_secs_f64());
                        break;
                    }
                    opened.closing = None;
                }
            }
        }
    }
    opened.renewal_pending = opened.closing.is_some();
    client.set_paused(session.paused || choosing || terminal);
    true
}

/// Revision delivery can occur while loading covers input. Preserve a pending
/// modal only for the same live authoritative offer; never drop a newer pick
/// that arrived in the same poll as its ZoneKey bootstrap.
pub(in crate::gameplay) fn retire_stale_confirmation(
    state: &CoopGame,
    session: &RunSession,
    opened: &mut ChoicePresentation,
) {
    if opened.confirming.is_none() { return; }
    let live = session.mechanics.as_ref().is_some_and(|game| !game.dead && !game.completed);
    let signature = state.pick.visible()
        .map(|value| format!("{}:{value}", state.pick.revision())).unwrap_or_default();
    if !live || opened.signature != signature {
        opened.confirming = None;
    }
}

/// The modal emits the same offer-bound selection as an ordinary accepted card.
/// A failed outgoing queue admission leaves its authoritative pick available.
pub(in crate::gameplay) fn accept_confirmed(
    runtime: &mut CoopRuntime,
    state: &mut CoopGame,
    index: usize,
    now: f64,
) -> bool {
    let Ok(argument) = u8::try_from(index) else { return false; };
    let sent = runtime.send(None, NativeMessage::Control { kind: 0, argument, offer: state.pick.offer() });
    if sent { state.pick.selected(now); }
    sent
}

#[cfg(test)]
mod confirmation_tests {
    use super::*;

    #[test]
    fn absent_guest_game_retires_old_modal_without_discarding_new_choices() {
        let mut state = CoopGame::default();
        assert!(state.pick.receive(br#"{"type":"choices","offer":17,"choices":[{"kind":"amulet","replaces":""}]}"#));
        let revision = state.pick.revision();
        let mut opened = ChoicePresentation { signature: "old offer".into(),
            confirming: Some((0, 3.)), ..default() };
        retire_stale_confirmation(&state, &RunSession::default(), &mut opened);
        assert!(opened.confirming.is_none());
        assert_eq!(state.pick.revision(), revision);
        assert_eq!(state.pick.offer(), 17);
        assert!(state.pick.visible().is_some());
    }
}
