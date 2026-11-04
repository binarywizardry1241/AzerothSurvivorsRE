//! Live equipped/talent/stat refresh owner. Current baseline arithmetic:
//! docs/analysis/player-baselines-0.112.0.md (1458f28e0).
//! Other effect contracts retain their separately recorded target provenance.
use super::*;
use azeroth_survivors_re::run_effects::{self, EffectRow, Effects, Numeric};

fn apply_heroism_feralheart_talent(class: u8, row: &mut EffectRow) {
    match (class, row.tag()) {
        // 0.140.0 145e30ff8 modifies the cap in the original Shield Slam
        // absorb rows, including the allocated Shield Mastery ranks.
        (1, 18) if row.word(16) == 7 && row.bytes[24] == 1
            && row.key(32) == Some("shield_slam") =>
        {
            let cap = row.float(8) + 0.20;
            row.bytes[8..12].copy_from_slice(&cap.to_le_bytes());
        }
        // 0.140.0 145e3116c replaces the allocated Tranquility radius.
        (11, 21) => row.bytes[8..12].copy_from_slice(&15.0_f32.to_le_bytes()),
        _ => {}
    }
}

// Native refresh computes growth before adding the racial payload. Retain the
// original components instead of trying to recover them from a rounded sum.
#[derive(Clone, Copy, Debug)]
struct RacialProgression {
    damage_base: f32,
    damage_bonus: f32,
    regeneration_base: f32,
    regeneration_bonus: f32,
    recovery: f32,
}
impl RacialProgression {
    fn damage(self, levels: f32) -> f32 {
        (self.damage_base + 0.03 * levels) + self.damage_bonus
    }
    fn regeneration(self, levels: f32) -> f32 {
        (self.regeneration_base + 0.08 * levels) + self.regeneration_bonus
    }
}
#[derive(Debug)]
pub(super) struct EffectsState {
    pub base: RunPlayerStats,
    racial_progression: Option<RacialProgression>,
    pub equipped: Effects,
    /// Native per-hero entry snapshot, parallel to the nineteen equipment IDs.
    pub equipment_stars: [u8; 19],
    pub set_descriptor: Option<&'static azeroth_survivors_re::sets::Descriptor>,
    pub tier_half_four_piece: Option<&'static azeroth_survivors_re::sets::Descriptor>,
    pub set_meter_name: &'static str,
    pub set_generic_start: usize,
    pub set_generic_count: usize,
    /// Selected talent descriptors retain definition order for spell tooltips.
    pub spell_display_talents: Vec<String>,
    pub graduation_enhancement: bool,
    pub talent_provenance: Vec<&'static str>,
    pub provenance: Vec<&'static str>,
    /// Native Game+850 stores the actor's localized metadata, before alias IDs.
    pub display_locale: Option<crate::localization::Localization>,
    pub display_provenance: Vec<String>,
    pub talent_meter_sources: Vec<azeroth_survivors_re::run_effects::healing::MeterSource>,
    pub meter_sources: Vec<azeroth_survivors_re::run_effects::healing::MeterSource>,
    pub numeric: Numeric,
    pub pre_stats: Numeric,
    pub base_leech: run_effects::healing::LeechBase,
    pub incoming: behavior::incoming::IncomingState,
    pub seen: Vec<(String, u8)>,
    pub result_saved: bool,
    pub last_terminal_phase: u8,
    pub victory_reached: bool,
    pub terminal_counts: [u32; 5],
    pub terminal_xp_parts: [i64; 7],
    pub talent_xp_bonus: f32,
    pub cooperative_luck: f32,
    pub base_movement: f32,
    pub leech: f32,
    pub generic: super::callbacks::State,
    pub timed: Vec<run_effects::actions::TimedCast>,
}
impl EffectsState {
    pub fn new(base: RunPlayerStats) -> Self {
        Self {
            base,
            racial_progression: None,
            equipped: Effects::default(),
            equipment_stars: [0; 19],
            set_descriptor: None,
            tier_half_four_piece: None,
            set_meter_name: "",
            set_generic_start: 0,
            set_generic_count: 0,
            spell_display_talents: Vec::new(),
            graduation_enhancement: false,
            talent_provenance: Vec::new(),
            provenance: Vec::new(),
            display_locale: None,
            display_provenance: Vec::new(),
            talent_meter_sources: Vec::new(),
            meter_sources: Vec::new(),
            numeric: Self::base_numeric(base, 1, None),
            pre_stats: Self::base_numeric(base, 1, None),
            base_leech: run_effects::healing::LeechBase::default(),
            incoming: Default::default(),
            seen: Vec::new(),
            result_saved: false,
            last_terminal_phase: 0,
            victory_reached: false,
            terminal_counts: [0; 5],
            terminal_xp_parts: [0; 7],
            talent_xp_bonus: 0.0,
            cooperative_luck: 0.0,
            base_movement: 1.0,
            leech: 0.0,
            generic: Default::default(),
            timed: Vec::new(),
        }
    }
    fn base_numeric(base: RunPlayerStats, level: u32, racial: Option<RacialProgression>) -> Numeric {
        // Current 1458f2c39 converts the unsigned level before subtracting one.
        let levels = level as f32 + -1.0;
        Numeric {
            health: base.maximum_health + base.health_per_level * levels,
            health_multiplier: base.health_multiplier,
            damage: racial.map_or_else(
                || base.damage_multiplier + 0.03 * levels,
                |seed| seed.damage(levels),
            ),
            recovery: racial.map_or_else(
                || 1.0 / base.cooldown_multiplier - 1.0,
                |seed| seed.recovery,
            ),
            crit: base.critical_chance,
            crit_damage: base.critical_multiplier,
            armor: base.armor_fraction,
            armor_cap: 0.6,
            regeneration: racial.map_or_else(
                || base.regeneration + 0.08 * levels,
                |seed| seed.regeneration(levels),
            ),
            regeneration_fraction: 0.0,
            calm_regen: 0.0,
            crowd_armor: 0.0,
            move_speed: 1.0,
            pickup: base.pickup_radius,
            experience: base.experience_multiplier,
            gold: base.gold_multiplier,
            area: 1.0,
            targets: 0,
            luck: base.luck_bonus,
            extra_cast: 0.0,
            heal_on_kill: base.heal_on_kill,
            buff_bonus: 0.0,
            dot_tick: 0.0,
            armor_damage: 0.0,
            excess_armor_damage: 0.0,
        }
    }
    pub(super) fn player_stats(
        base: RunPlayerStats,
        numeric: Numeric,
        level: u32,
    ) -> RunPlayerStats {
        RunPlayerStats {
            maximum_health: base.maximum_health,
            health_per_level: base.health_per_level,
            health_multiplier: numeric.health_multiplier,
            regeneration: numeric.regeneration,
            pickup_radius: numeric.pickup,
            luck_bonus: numeric.luck,
            heal_on_kill: numeric.heal_on_kill,
            armor_fraction: numeric.armor,
            damage_reduction: base.damage_reduction,
            damage_multiplier: numeric.damage - 0.03 * level.saturating_sub(1) as f32,
            cooldown_multiplier: 1.0 / (numeric.recovery + 1.0),
            critical_chance: numeric.crit,
            critical_multiplier: numeric.crit_damage,
            experience_multiplier: numeric.experience,
            gold_multiplier: numeric.gold,
            native_race: base.native_race,
            packed_player_field: base.packed_player_field,
        }
    }
    pub(super) fn apply_health(
        execution: &mut ExecutionState<'_>, soul_link_absorb: &mut f32, numeric: &Numeric,
        effects: &Effects,
    ) {
        let vitals = &mut execution.vitals;
        let old_max = vitals.maximum_health;
        vitals.maximum_health = numeric.health;
        if numeric.health > old_max {
            vitals.health += numeric.health - old_max;
        }
        vitals.health = vitals.health.min(numeric.health);
        execution.shield.refresh_capacities(vitals, soul_link_absorb, effects);
    }
}
impl EffectsState {
    fn apply_tier_half_talent_rows(&mut self, class: u8) {
        let four_piece = self.tier_half_four_piece.is_some();
        if class == 3 && four_piece {
            // 0.140.0 145e311a7 rewrites the pet-hit bounce row, not the grant.
            for row in &mut self.equipped.talents {
                if row.tag() == 6 && row.word(16) == 0 && row.bytes[24] == 6 {
                    row.bytes[4..8].copy_from_slice(&5_u32.to_le_bytes());
                    row.bytes[8..12].copy_from_slice(&1.5_f32.to_le_bytes());
                }
            }
        }
        if class == 9 && four_piece {
            // 0.140.0 145e3107f rewrites Conflagrate's fraction and radius,
            // preserving its selector and required Immolate spell.
            for row in &mut self.equipped.talents {
                if row.tag() == 4 && row.word(16) == 348 {
                    row.bytes[4..8].copy_from_slice(&0.35_f32.to_le_bytes());
                    row.bytes[8..12].copy_from_slice(&8.0_f32.to_le_bytes());
                }
            }
        }
        if class != 5 {
            return;
        }
        let active = self.set_descriptor
            .filter(|set| set.tier == azeroth_survivors_re::sets::TIER_HALF);
        let empowered = active.is_some_and(|set| set.empowered);
        if !four_piece && active.is_none() {
            return;
        }
        // Native 145e311f1 rewrites only the corresponding Shadow Word: Pain
        // rows in the ranked talents. The existing callbacks retain event order.
        for row in &mut self.equipped.talents {
            match row.tag() {
                0 if (four_piece || empowered) && row.word(32) == 4
                    && row.key(16) == Some("mind_blast") && row.bytes[40] == 1 && row.key(48) == Some("sw_pain") =>
                {
                    let chance = if empowered { 0.12_f32 } else { 0.08 };
                    row.bytes[4..8].copy_from_slice(&chance.to_le_bytes());
                }
                11 if active.is_some() && row.bytes[1] != 0 && row.bytes[24] == 1 && row.key(32) == Some("sw_pain") => {
                    let fraction = if empowered { 0.10_f32 } else { 0.08 };
                    row.bytes[4..8].copy_from_slice(&fraction.to_le_bytes());
                }
                14 if active.is_some() && row.bytes[8] == 1 && row.key(16) == Some("sw_pain") => {
                    let targets = if empowered { 3_u32 } else { 2 };
                    row.bytes[4..8].copy_from_slice(&targets.to_le_bytes());
                }
                _ => {}
            }
        }
    }
}

impl Mechanics {
    /// Current145c4f090 builds talents first, then the worn armor-set descriptor
    /// from the same class/equipment/star snapshot. No ownership-only item enters.
    pub fn configure_armor_set(&mut self, gear: [u32; 19], stars: [u8; 19]) {
        use azeroth_survivors_re::sets;

        self.set_equipment_ids(gear);
        self.effect_state.equipment_stars = stars;
        let lookup = |id| {
            crate::save::gear::decode(id).map(|piece| sets::Piece {
                class_id: piece.class,
                slot: usize::from(piece.slot),
                tier: usize::from(piece.set_tier()),
            })
        };
        self.effect_state.set_descriptor = sets::equipped_descriptor(
            self.class.class_id, &gear, &stars, lookup,
        );
        self.effect_state.tier_half_four_piece = sets::tier_half_four_piece(self.class.class_id)
            .filter(|_| sets::four_piece_tiers(&gear, &stars, lookup).contains(&sets::TIER_HALF));
        self.effect_state.set_meter_name = self.effect_state.set_descriptor
            .and_then(|descriptor| crate::armory::set_name_base(
                self.class.class_id, usize::from(descriptor.tier)))
            .unwrap_or("");
    }

    pub fn equipment_stars(&self) -> [u8; 19] {
        self.effect_state.equipment_stars
    }

    /// Current145bad070 searches the frozen nineteen entries in slot order.
    /// Some(0) is a match, distinct from the miss that admits a local save lookup.
    pub fn item_star_rank(&self, requested_id: u32) -> Option<u8> {
        self.equipment_ids.iter().zip(self.effect_state.equipment_stars)
            .find_map(|(&id, stars)| {
                (id != 0 && crate::save::gear::faction_item(id, self.stats.native_race)
                    == requested_id).then_some(stars)
            })
    }
    /// The native final stat contribution is skipped entirely in solo mode.
    pub(super) fn active_cooperative_luck(&self) -> Option<f32> {
        self.has_party().then_some(self.effect_state.cooperative_luck)
    }

    /// Entry-only seed: the next ordinary configure_effects refresh consumes
    /// these exact source components. The initial level-one totals are unchanged.
    pub(crate) fn set_racial_progression_components(
        &mut self,
        damage_base: f32,
        damage_bonus: f32,
        regeneration_base: f32,
        regeneration_bonus: f32,
    ) {
        self.effect_state.racial_progression = Some(RacialProgression {
            damage_base,
            damage_bonus,
            regeneration_base,
            regeneration_bonus,
            // Current14590d030 seeds recovery at zero and adds racial tag2.
            // Gnome's exact0.08 payload must not pass through the rounded
            // cooldown divisor and a second reciprocal at run entry.
            recovery: if self.stats.native_race == 7 { f32::from_bits(0x3da3_d70a) }
                else { 0.0 },
        });
    }
    /// Current descriptor changes field131 for Cat/Dire Bear, retaining the
    /// ordinary race/sex body in native display field132.
    pub fn player_form_display(&self) -> Option<u32> {
        run_effects::forms::display_override(&self.effect_state.equipped.rows, self.stats.native_race)
    }

    pub fn player_vital_fields(&self) -> [(u16, u32); 2] {
        azeroth_survivors_re::run_effects::healing::vital_fields(&self.execution.vitals)
    }
    pub fn healing_meter(&self) -> &[azeroth_survivors_re::run_effects::healing::MeterEntry] {
        &self.effect_state.generic.healing_meter.entries
    }
    pub fn damage_meter(&self) -> &[azeroth_survivors_re::run_effects::healing::MeterEntry] {
        &self.effect_state.generic.damage_meters.damage.entries
    }
    pub fn boss_meter(&self) -> &[azeroth_survivors_re::run_effects::healing::MeterEntry] {
        &self.effect_state.generic.damage_meters.boss.entries
    }
    /// Shared effective total for meters and downstream terminal consumers.
    pub fn effective_damage(&self) -> f64 {
        self.effect_state.generic.damage_meters.total
    }
    pub fn spell_damage(&self, spell_id: u32) -> f64 {
        self.effect_state.generic.damage_meters.spell_totals
            .get(&spell_id).copied().unwrap_or(0.0)
    }
    pub fn boss_meter_timing(&self) -> Option<azeroth_survivors_re::bosses::death::BossMeterTiming> {
        self.effect_state.generic.damage_meters
            .boss_timing(&self.boss_state.death, self.clock)
    }
    pub(super) fn accept_refreshed_stats(&mut self, mut stats: RunPlayerStats, leech: f32) {
        stats.maximum_health = self.effect_state.base.maximum_health;
        self.stats = stats;
        self.effect_state.leech = leech;
        self.choice_state.luck_bonus = self.effect_state.numeric.luck;
    }
    /// Current native offer preview applies145451c30 before145420e20.
    pub fn preview_spell(
        &self,
        definition: &'static AbilityDefinition,
        rarity: usize,
    ) -> RuntimeInstance<'static> {
        let mut instance = RuntimeInstance::learned(definition);
        self.effect_state
            .equipped
            .spell_modifiers(definition)
            .apply(&mut instance);
        upgrades::apply_learned_rarity(&mut instance, rarity);
        instance
    }

    /// Native formatter stats+40/+64/+72: area, aura potency, periodic bonus.
    pub fn description_inputs(&self) -> (f32, f32, f32, u32) {
        let numeric = &self.effect_state.numeric;
        (
            numeric.area,
            numeric.buff_bonus,
            numeric.dot_tick,
            numeric.targets,
        )
    }

    /// Called at native run entry with the selected persisted specification. The
    /// UI's existing normalizer owns allocation validity; effects follow definition
    /// order, then each talent's native payload order.
    pub fn configure_effects(&mut self, allocation: &[(String, u8)], gear: &[(u8, f32)]) {
        let class = self.class.class_id;
        let soulforge_four_piece = class == 2 && self.effect_state.tier_half_four_piece.is_some();
        let soulforge_hammer_fraction = self.effect_state.set_descriptor
            .filter(|descriptor| class == 2 && descriptor.tier == azeroth_survivors_re::sets::TIER_HALF)
            .map(|descriptor| if descriptor.empowered { 0.019_f32 } else { 0.0175_f32 });
        self.effect_state.graduation_enhancement =
            super::kill_feats::graduation_enhancement(class, allocation);
        self.configure_demons(if class == 9 {
            run_effects::demon_talents::Config::from_allocation(allocation)
        } else {
            run_effects::demon_talents::Config::default()
        });
        let definitions = run_effects::catalog()
            .classes
            .iter()
            .find(|row| row.id == class);
        self.effect_state.equipped.talents.clear();
        self.effect_state.equipped.fortified = class == 1
            && allocation.iter().any(|(key, rank)| key == "fortified" && *rank != 0);
        self.effect_state.equipped.sweeping_storm_rank = if class == 7 {
            allocation.iter().find(|(key, _)| key == "enh_sweeping_storm")
                .map_or(0, |(_, rank)| *rank)
        } else {
            0
        };
        self.effect_state.equipped.meter_talents.clear();
        self.effect_state.spell_display_talents = allocation
            .iter()
            .filter(|(key, rank)| *rank != 0 && key != crate::save::talents::WHITE_DEVILSAUR)
            .map(|(key, _)| key.clone())
            .collect();
        self.effect_state.talent_provenance.clear();
        self.effect_state.talent_meter_sources.clear();
        if !self.pet_state.started {
            self.pet_state.grants.clear();
            // The independent Hunter switch controls the spawn appearance.
            self.effect_state.generic.white_devilsaur = class == 3
                && allocation.iter().any(|(key, rank)| {
                    key == crate::save::talents::WHITE_DEVILSAUR && *rank != 0
                });
        }
        if let Some(definitions) = definitions {
            for talent in &definitions.talents {
                if let Some((_, rank)) = allocation.iter().find(|(key, _)| key == &talent.key) {
                    if *rank != 0 {
                        let effects: Vec<_> = talent
                            .effects
                            .iter()
                            .map(|effect| {
                                let mut row = EffectRow::talent(effect, *rank);
                                // 145e310dc rewrites the allocated Paladin rows in place.
                                if soulforge_four_piece && row.tag() == 3 && row.word(16) == 10 {
                                    row.bytes[4..8].copy_from_slice(&0.75_f32.to_le_bytes());
                                }
                                if let Some(fraction) = soulforge_hammer_fraction
                                    && row.tag() == 5 && row.word(8) == 0
                                    && row.bytes[16] == 1 && row.key(24) == Some("hammer_of_justice")
                                {
                                    row.bytes[4..8].copy_from_slice(&fraction.to_le_bytes());
                                }
                                if self.effect_state.tier_half_four_piece.is_some() {
                                    apply_heroism_feralheart_talent(class, &mut row);
                                }
                                row
                            })
                            .collect();
                        let generic_count = effects.iter().filter(|row| row.is_generic()).count();
                        self.effect_state.equipped.meter_talents.extend(std::iter::repeat_n(
                            (talent.key.as_str(), *rank),
                            generic_count,
                        ));
                        self.effect_state
                            .talent_meter_sources
                            .extend(std::iter::repeat_n(
                                azeroth_survivors_re::run_effects::healing::MeterSource {
                                    name: talent.name.as_str(),
                                    icon: talent.icon.as_str(),
                                    talent: true,
                                },
                                generic_count,
                            ));
                        self.effect_state
                            .talent_provenance
                            .extend(std::iter::repeat_n(
                                talent.name.as_str(),
                                generic_count,
                            ));
                        self.effect_state.equipped.talents.extend(effects);
                    }
                }
            }
        }
        if class == 8 {
            // 0.140.0 145ffe2c0 rewrites talent rows before appending set effects.
            // Mode 0 replaces radius and damage, then mode 2 replaces only damage.
            let four_piece = self.effect_state.tier_half_four_piece.is_some();
            let empowered = self.effect_state.set_descriptor
                .is_some_and(|set| set.tier == azeroth_survivors_re::sets::TIER_HALF && set.empowered);
            if four_piece || empowered {
                let fraction = if empowered { 1.5_f32 } else { 1.25_f32 };
                for row in self.effect_state.equipped.talents.iter_mut()
                    .filter(|row| row.is_splitting_ice())
                {
                    row.bytes[4..8].copy_from_slice(&fraction.to_le_bytes());
                    if four_piece {
                        row.bytes[8..12].copy_from_slice(&7.0_f32.to_le_bytes());
                    }
                }
            }
        }
        self.effect_state.apply_tier_half_talent_rows(class);
        self.effect_state.set_generic_count = 0;
        for (eight_piece, descriptor) in [
            (false, self.effect_state.tier_half_four_piece),
            (true, self.effect_state.set_descriptor),
        ] {
            if eight_piece {
                self.effect_state.set_generic_start = self.effect_state.talent_provenance.len();
            }
            let Some(descriptor) = descriptor else { continue; };
            for payload in &descriptor.effects {
                let row = EffectRow::armor_set(payload);
                if row.is_generic() {
                    let set_name = crate::armory::set_name_base(class, usize::from(descriptor.tier))
                        .unwrap_or("");
                    let icon = AbilityDefinition::by_key(&descriptor.spell_key)
                        .expect("current set descriptor has an ability icon").icon;
                    self.effect_state.talent_provenance.push(set_name);
                    let (name, icon) = match row.tag() {
                        // 0.140.0 145f250be..145f250e7 uses distinct source descriptors.
                        66 => ("Thunderburst", "Spell_Nature_ThunderClap"),
                        69 => ("Deathmist burn", "Spell_Fire_Immolation"),
                        _ => (set_name, icon),
                    };
                    self.effect_state.talent_meter_sources.push(
                        azeroth_survivors_re::run_effects::healing::MeterSource {
                            name,
                            icon,
                            talent: true,
                        },
                    );
                    self.effect_state.set_generic_count += usize::from(eight_piece);
                }
                self.effect_state.equipped.talents.push(row);
            }
        }
        if !self.pet_state.started {
            self.pet_state.grants.extend(
                self.effect_state.equipped.talents.iter()
                    .filter_map(|row| run_effects::pets::raw29_definition(&row.bytes))
                    .filter(|definition| definition.special == 0)
                    .map(|definition| definition.entry),
            );
        }
        self.effect_state.equipped.gear = gear.to_vec();
        // Native startup-only ability replacement/addition; subsequent refreshes
        // overwrite modifier lanes without relearning or resetting current cooldowns.
        for row in &self.effect_state.equipped.talents {
            match row.tag() {
                28 => {
                    if let Some(definition) = row.key(8).and_then(AbilityDefinition::by_key) {
                        if let Some(first) = self.abilities.first_mut() {
                            *first = RuntimeInstance::learned(definition);
                        }
                    }
                }
                27 => {
                    if let Some(definition) = row.key(8).and_then(AbilityDefinition::by_key) {
                        if !self
                            .abilities
                            .iter()
                            .any(|ability| ability.definition.key == definition.key)
                        {
                            self.abilities.push(RuntimeInstance::learned(definition));
                        }
                    }
                }
                _ => {}
            }
        }
        self.effect_state.seen.extend(
            self.abilities
                .iter()
                .map(|ability| (ability.definition.key.into(), 0)),
        );
        //145559c90 constructs the base talent prefix with remaining1.5.
        self.effect_state.timed = self
            .effect_state
            .equipped
            .talents
            .iter()
            .filter_map(|row| run_effects::actions::TimedCast::from_effect(row, 1.5))
            .collect();
        self.refresh_effects();
    }
    /// Jewelry and empowered amulets pass through the same refresh after a reward.
    pub(super) fn refresh_effects(&mut self) {
        let amulet = self
            .worn_amulet()
            .map(|item| (item.payload, item.rarity, item.picks));
        self.effect_state.equipped.rebuild(amulet);
        // Refresh Supremacy from current equipped stat32 after rebuilding
        // all effects; raw effect32 is the separate Legion Gate marker.
        let mut demon_config = self.demon_state.config;
        demon_config.supremacy = self.effect_state.equipped.sum(32) > 0.0;
        self.configure_demons(demon_config);
        //1454c9c50 retains base-talent slots, then rebuilds only the suffix at1.0.
        let base_timed = self
            .effect_state
            .equipped
            .talents
            .iter()
            .filter(|row| row.tag() == 26)
            .count();
        self.effect_state.timed.truncate(base_timed);
        self.effect_state.timed.extend(
            self.effect_state
                .equipped
                .rows
                .iter()
                .filter_map(|row| run_effects::actions::TimedCast::from_effect(row, 1.0))
                .skip(base_timed),
        );
        self.effect_state
            .meter_sources
            .clone_from(&self.effect_state.talent_meter_sources);
        self.effect_state
            .provenance
            .clone_from(&self.effect_state.talent_provenance);
        if let Some((definition, _, _)) = amulet {
            let generic_count = definition
                .effects
                .iter()
                .filter(|row| {
                    matches!(
                        row.effect,
                        azeroth_survivors_re::loot_rewards::amulets::Effect::Passive { .. }
                    )
                })
                .count();
            self.effect_state.meter_sources.extend(std::iter::repeat_n(
                azeroth_survivors_re::run_effects::healing::MeterSource {
                    name: definition.name.as_str(),
                    icon: definition.icon.as_str(),
                    talent: true,
                },
                generic_count,
            ));
            self.effect_state.provenance.extend(std::iter::repeat_n(
                definition.name.as_str(),
                generic_count,
            ));
        }
        debug_assert_eq!(
            self.effect_state.provenance.len(),
            self.effect_state.equipped.rows.len()
        );
        self.refresh_spell_display_names();
        let base_count = self.effect_state.equipped.generic_talent_count();
        let total_count = self.effect_state.equipped.rows.len();
        run_effects::milestones::refresh_slots(
            &mut self.effect_state.generic.deadlines,
            base_count,
            total_count,
        );
        run_effects::milestones::refresh_slots(
            &mut self.effect_state.generic.timestamps,
            base_count,
            total_count,
        );
        run_effects::milestones::refresh_slots(
            &mut self.effect_state.generic.counters,
            base_count,
            total_count,
        );
        self.effect_state
            .generic
            .temporary
            .retain_effect_prefix(base_count);
        let mut numeric = EffectsState::base_numeric(
            self.effect_state.base,
            self.level,
            self.effect_state.racial_progression,
        );
        numeric.move_speed = self.effect_state.base_movement;
        numeric.apply_gear(&self.effect_state.equipped.gear);
        for item in self.jewelry() {
            numeric.apply_jewelry(item.definition.tag, item.value.value, item.definition.base);
        }
        self.effect_state.pre_stats = numeric;
        let mut stats = self.effect_state.equipped.stats.clone();
        stats.extend(
            self.effect_state
                .generic
                .temporary
                .contributions(&self.effect_state.equipped.rows, self.clock),
        );
        if self.class.class_id == 9 {
            let reduction = self.demon_state.config.supremacy_damage_reduction();
            if reduction != 0.0 {
                stats.push((5, reduction));
            }
        }
        numeric.apply_stats(&stats);
        if let Some(luck) = self.active_cooperative_luck() {
            numeric.luck += luck;
        }
        numeric.finish();
        EffectsState::apply_health(
            &mut self.execution, &mut self.effect_state.incoming.soul_link_absorb, &numeric,
            &self.effect_state.equipped,
        );
        let base = self.effect_state.base;
        self.stats = EffectsState::player_stats(base, numeric, self.level);
        self.choice_state.luck_bonus = numeric.luck;
        for ability in &mut self.abilities {
            self.effect_state
                .equipped
                .spell_modifiers(ability.definition)
                .apply(ability);
        }
        if let Some(racial) = self.racial.as_mut() {
            self.effect_state
                .equipped
                .spell_modifiers(racial.definition)
                .apply(racial);
        }
        self.effect_state.base_leech = run_effects::healing::LeechBase {
            class: run_effects::catalog()
                .classes
                .iter()
                .find(|class| class.id == self.class.class_id)
                .map_or(0.0, |class| f32::from_bits(class.leech_bits)),
            jewelry: self.jewelry()
                .iter()
                .filter(|item| item.definition.tag == 17)
                .fold(-0.0, |sum, item| sum + item.value.value),
        };
        self.effect_state.leech = self.effect_state.base_leech.total(
            &stats[self.effect_state.equipped.stats.len()..],
            &self.effect_state.equipped.stats,
        );
        self.effect_state.numeric = numeric;
        self.refresh_player_run_speed();
        self.publish_player_auras();
    }
    pub(super) fn publish_player_auras(&mut self) {
        use azeroth_survivors_re::run_effects::player_auras::{
            PlayerAuraInputs, PlayerCooldownAura,
        };
        let mut cooldowns = self
            .abilities
            .iter()
            .filter(|row| row.definition.effect.tag == 11)
            .map(|row| PlayerCooldownAura {
                racial: false,
                remaining: row.remaining,
            })
            .collect::<Vec<_>>();
        if let Some(racial) = self
            .racial
            .as_ref()
            .filter(|row| row.definition.effect.tag == 11)
        {
            cooldowns.push(PlayerCooldownAura {
                racial: true,
                remaining: racial.remaining,
            });
        }
        let provenance = self
            .effect_state
            .display_provenance
            .iter()
            .map(String::as_str)
            .collect::<Vec<_>>();
        let fields = self
            .effect_state
            .generic
            .player_auras
            .publish(PlayerAuraInputs {
                now: self.clock,
                auras: &self.execution.auras,
                effects: &self.effect_state.equipped.rows,
                provenance: &provenance,
                temporary: &self.effect_state.generic.temporary.entries,
                absorb: self.execution.vitals.absorb,
                rescue_ready_at: self.effect_state.incoming.lethal_talent_ready_at,
                cooldowns: &cooldowns,
            });
        if !fields.is_empty() {
            self.events.push(RunEvent::Aura {
                target: self.player_guid,
                spell_id: 0,
                present: true,
                fields,
            });
        }
    }
    pub fn player_auras(
        &self,
    ) -> &[Option<azeroth_survivors_re::run_effects::player_auras::PlayerAura>; 48] {
        &self.effect_state.generic.player_auras.previous
    }
    pub fn effect_provenance(&self) -> &[&'static str] {
        &self.effect_state.provenance
    }
    pub fn set_base_movement_multiplier(&mut self, value: f32) {
        self.effect_state.base_movement = value;
        self.refresh_effects();
    }
    pub fn movement_multiplier(&self) -> f32 {
        //1454a71c5..71e0 adds the native spell23451 lane once per live aura,
        // before1454a7328 applies the same2.2 speed cap.
        aura_movement(
            self.effect_state.numeric.move_speed,
            &self.execution.auras,
            self.clock,
        )
    }
}
