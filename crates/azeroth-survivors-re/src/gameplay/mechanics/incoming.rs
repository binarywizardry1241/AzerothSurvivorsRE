//! Native incoming-player staging with synchronous shared hit/death consumers.
use super::super::death_recap::{DamageRecord, DamageSource, DeathRecap};
use super::*;
use behavior::incoming::{self as native, ReactiveHit, ReactivePort};

#[derive(Clone, Copy)]
pub(super) enum DamageKind {
    Melee,
    Spell(u32),
    Mechanic(u32),
}

#[derive(Clone, Copy)]
enum IncomingAction {
    Hit(ReactiveHit),
    Event { kind: u8, amount: f32, guid: u64 },
}
impl Mechanics {
    pub fn damage_taken(&self) -> &std::collections::BTreeMap<&'static str, f64> {
        &self.taken_damage.categories
    }

    pub fn taken_total(&self) -> f64 {
        self.taken_damage.total
    }

    pub(in crate::gameplay) fn death_recap(&self) -> Option<&DeathRecap> {
        self.death_recap.as_ref()
    }

    pub(in crate::gameplay) fn death_recap_generation(&self) -> u64 {
        self.death_recap_generation
    }

    fn recap_damage_source(&self, guid: u64, kind: DamageKind) -> DamageSource {
        let locale = self.effect_state.display_locale.as_ref();
        let label = |key: &str| locale.map_or(key, |locale| locale.label(key)).to_owned();
        let (who, rank) = if let Some(boss) = self.bosses.iter().find(|row| row.guid == guid) {
            (
                AnnouncementLabel::boss(boss.definition.id, boss.definition.name).render(&label),
                "boss",
            )
        } else if let Some(row) = self.actors.iter().find(|row| row.guid == guid) {
            let rank = if row.definition.flag_4c != 0 || self.guardian_state.contains(guid) {
                "elite"
            } else {
                "mob"
            };
            (
                AnnouncementLabel::enemy(row.definition.id, row.definition.name).render(&label),
                rank,
            )
        } else if let Some(ward) = self.boss_state.wards.actors.iter().find(|row| row.guid == guid) {
            let key = format!("object.{}.name", ward.template.entry);
            let name = locale
                .and_then(|locale| locale.lookup(&key))
                .unwrap_or(ward.template.name);
            (name.to_owned(), "object")
        } else {
            (String::new(), "none")
        };
        let (spell_id, fallback, fallback_icon) = match kind {
            DamageKind::Melee => (0, "Melee", "INV_Sword_04"),
            DamageKind::Spell(id) => (id, "Spell", "Spell_Shadow_ShadowBolt"),
            DamageKind::Mechanic(id) => (id, "Boss mechanic", "Spell_Fire_SelfDestruct"),
        };
        let display = self.recap_spells.as_ref().and_then(|spells| {
            let spell = spells.get(spell_id)?;
            let name = spells.base_name(spell);
            (spell_id != 0 && !name.is_empty()).then_some((
                name,
                spell.icon
                    .as_deref()
                    .filter(|path| !path.is_empty())
                    .unwrap_or("INV_Misc_QuestionMark"),
            ))
        });
        let (what, icon) = display.map_or_else(
            || (label(fallback), fallback_icon.to_owned()),
            |(name, icon)| (name.to_owned(), icon.to_owned()),
        );
        DamageSource {
            who,
            rank: rank.to_owned(),
            what,
            icon,
            mechanic: matches!(kind, DamageKind::Mechanic(_)),
        }
    }

    /// Current1458f3794..3ac9 uses source categories rather than actor names.
    /// Guardian creation supplies the same nonzero elite lane as its native
    /// shared actor constructor; an absent/despawned source is `area`.
    fn taken_category(&self, source_guid: u64, physical: bool) -> &'static str {
        if self.bosses.iter().any(|row| row.guid == source_guid) {
            if physical { "boss melee" } else { "boss spell" }
        } else if let Some(row) = self.actors.iter().find(|row| row.guid == source_guid) {
            if row.definition.flag_4c != 0 || self.guardian_state.contains(source_guid) {
                "elite"
            } else if physical {
                "mob melee"
            } else {
                "mob spell"
            }
        } else {
            "area"
        }
    }

    pub(super) fn damage_player(
        &mut self,
        raw: f32,
        physical: bool,
        source_guid: u64,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let kind = if physical {
            DamageKind::Melee
        } else {
            DamageKind::Spell(0)
        };
        self.damage_player_from(raw, kind, source_guid, player, facing, world);
    }

    pub(super) fn damage_player_from(
        &mut self,
        raw: f32,
        kind: DamageKind,
        source_guid: u64,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let physical = matches!(kind, DamageKind::Melee);
        // Current1458ec44d..1458ec46a admits mode1 without showcase before
        // armor, absorption, meters, reactive effects or lethal protection.
        if !self.active_run_state() || self.is_showcase() {
            return;
        }
        // The 0.140.0 scripted boss hit compensates before entering the common
        // damage owner. Its ordinary armor, crowd reduction and absorbs follow.
        let raw = if matches!(kind, DamageKind::Mechanic(_)) && self.bosses.iter().any(|row| {
            row.guid == source_guid && matches!(row.definition.id, 10506 | 10508 | 11261 | 10504 | 1853)
        }) {
            let armor = self.effective_armor().min(0.95);
            let softened = if armor < 0.4 { armor } else { (armor - 0.4) * 0.5 + 0.4 };
            let compensation = (1.0 - softened) / (1.0 - armor);
            raw * compensation
        } else {
            raw
        };
        // 0.121.0 145bcdd7b..145bcdde8 scales the original incoming amount
        // before immunity/armor/absorption and retains it for reactive effects.
        let raw = raw * self.party_scaling().map_or(1.0, |scaling| scaling.incoming_damage);
        let health_before = self.execution.vitals.health;
        // Current145bcde50..145bce155: five live shared actors within inclusive
        // squared XY distance64. Sample the existing movement interpolation;
        // bosses and wards occupy the same native actor pool as ordinary mobs.
        let crowd_reduction = self.effect_state.numeric.crowd_armor;
        let crowd_reduction = if crowd_reduction > 0.0 && self.actors.iter()
            .map(|row| &row.actor)
            .chain(self.bosses.iter().map(|row| &row.actor))
            .chain(self.boss_state.wards.actors.iter().map(|row| &row.actor))
            .filter(|actor| !actor.dead && behavior::execution::distance_squared(
                actor.movement.position_at(self.clock), player) <= 64.0)
            .nth(4).is_some()
        { crowd_reduction } else { 0.0 };
        let armor = self.effective_armor();
        let Some(applied) = native::apply_damage_with_crowd(
            &mut self.execution.vitals,
            &mut self.execution.shield,
            &mut self.execution.auras,
            &mut self.effect_state.incoming,
            self.clock,
            raw,
            armor,
            crowd_reduction,
        ) else {
            return;
        };
        self.effect_state.generic.healing_meter.record(
            azeroth_survivors_re::run_effects::healing::SOUL_LINK,
            applied.soul_link_absorbed,
        );
        self.execution.vitals.health = health_before;
        let refresh = !applied.removed_auras.is_empty() || applied.completed_absorption.is_some();
        // Native aura removal refreshes stats before retaliation and lethal gates.
        if refresh {
            self.refresh_effects();
        }
        if let Some(credit) = applied.completed_absorption {
            //1454a0b85..0bd6 completes absorption callbacks before subtracting HP.
            self.publish_player_event(6, credit, 0, player, facing, world);
        }
        self.record_incoming_boss(source_guid);
        self.execution.vitals.health -= applied.amount;
        // Native1458f3774 widens post-armor/post-absorb damage once, including
        // zero and overkill, before any synchronous reactive hit can despawn
        // its source or change the run state.
        let category = self.taken_category(source_guid, physical);
        self.taken_damage.record(category, applied.amount);
        // 0.139.2 145ef16eb..195d samples the resolved source and signed HP
        // before any retaliation or lethal rescue can mutate them.
        let source = self.recap_damage_source(source_guid, kind);
        self.damage_history.record(DamageRecord {
            source,
            time: self.clock,
            amount: applied.amount,
            absorbed: applied.absorbed,
            health: self.execution.vitals.health,
            max_health: self.max_health(),
        });
        let mut rng = self.rng;
        native::reactive_effects(
            self.clock,
            raw,
            source_guid,
            physical,
            &mut rng,
            &mut IncomingPort {
                game: self,
                player,
                facing,
                world,
            },
        );
        self.rng = rng;
        //1454a1034..10bd publishes general damage, then strict low-health gates.
        self.publish_player_event(4, applied.amount, source_guid, player, facing, world);
        self.publish_player_event(5, applied.amount, source_guid, player, facing, world);
        if self.execution.vitals.health > 0.0 {
            self.publish_player_damage(applied.amount);
            return;
        }
        if self.try_lethal_racial(player, facing, world) {
            self.publish_player_damage(applied.amount);
            return;
        }
        if let Some(rescue) = native::rescue_with_talent(
            self.effect_state.equipped.lethal_protection(),
            self.clock,
            &mut self.execution.vitals,
            &mut self.execution.auras,
            &mut self.effect_state.incoming,
        ) {
            if rescue.aura_changed {
                self.publish_player_auras();
            }
            self.events.push(RunEvent::Spell(SpellCast {
                source_guid: self.player_guid,
                spell_id: rescue.visual_spell,
                target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(self.player_guid),
                hit_targets: vec![self.player_guid],
            }));
            self.publish_player_event(7, 0.0, 0, player, facing, world);
            self.publish_player_damage(applied.amount);
            return;
        }
        if self.remaining_lives() > 0 && self.consume_life() {
            self.execution.vitals.health = self.max_health() * 0.5;
            self.events.push(RunEvent::Spell(SpellCast {
                source_guid: self.player_guid,
                spell_id: 21169,
                target: azeroth_survivors_re::bosses::abilities::CastTarget::Unit(self.player_guid),
                hit_targets: vec![self.player_guid],
            }));
            // Current145c13684..13720 replaces spell1020 and refreshes the
            // recipient's live immunity before any synchronous burst hit.
            native::soulstone_grace(&mut self.execution.auras, self.clock);
            self.refresh_effects();
            let targets = actor_targets(
                &self.actors,
                &self.bosses,
                &self.boss_state.wards,
                self.counter.sequence(),
            )
            .into_iter()
            .map(|row| row.actor)
            .collect::<Vec<_>>();
            let targets = native::soulstone_targets(&targets, self.clock, player);
            for target_guid in targets {
                let damage = self.current_damage_multiplier() * 200.0;
                self.resolve_effect_hit(
                    ReactiveHit {
                        target_guid,
                        spell_id: 15237,
                        school: 1,
                        damage,
                        passive_source: false,
                    },
                    player,
                    facing,
                    world,
                );
            }
            self.publish_player_damage(applied.amount);
            return;
        }
        self.death_recap = self.damage_history.recap(self.clock);
        self.death_recap_generation = self.death_recap_generation.wrapping_add(1);
        self.execution.vitals.health = 0.0;
        self.dead = true;
        self.fall_epoch = self.clock;
        self.record_party_fall();
        // Current145b95bf0 counts irreversible deaths across every swapped
        // hero. Abandon/disconnect sets finished first and does not count.
        if self.has_party() && !self.abandoned {
            self.boss_state.party_feats.deaths = self.boss_state.party_feats.deaths.wrapping_add(1);
        }
        self.publish_player_damage(applied.amount);
        self.events.push(RunEvent::PlayerDied);
    }
    fn publish_player_damage(&mut self, amount: f32) {
        self.events.push(RunEvent::PlayerDamage {
            amount,
            fields: azeroth_survivors_re::run_effects::healing::vital_fields(
                &self.execution.vitals,
            ),
        });
    }
    fn resolve_effect_hit(
        &mut self,
        hit: ReactiveHit,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        self.resolve_incoming_action(IncomingAction::Hit(hit), player, facing, world);
    }
    fn publish_player_event(
        &mut self,
        kind: u8,
        amount: f32,
        guid: u64,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        if !self.effect_state.equipped.rows.is_empty() {
            self.resolve_incoming_action(
                IncomingAction::Event { kind, amount, guid },
                player,
                facing,
                world,
            );
        }
    }
    fn resolve_incoming_action(
        &mut self,
        action: IncomingAction,
        player: Position,
        facing: f32,
        world: &mut impl RunWorld,
    ) {
        let context = self.cast_context(player, facing);
        let passive_context = behavior::passive_tick::TickContext {
            now: self.clock,
            delta: 0.0,
            player_guid: self.player_guid,
            player,
            power: context.power,
            global_cooldown: self.current_cooldown_multiplier(),
            global_area: context.global_area,
            global_target_bonus: context.global_target_bonus,
        };
        let extra_cast_factor =
            self.effect_state.numeric.extra_cast - self.effect_state.equipped.sum(13);
        let cooperative_luck = self.active_cooperative_luck();
        let mut port = CombatAdapter {
            party_healing: self.coop.healing_port(),
            player_guid: self.player_guid,
            showcase: self.showcase.enabled,
            actors: &mut self.actors,
            bosses: &mut self.bosses,
            pets: &mut self.pet_state.rows,
            hunter_mark: self.passive_state.hunters_mark.guid,
            boss_state: &mut self.boss_state,
            guardian_state: &mut self.guardian_state,
            affixes: &mut self.affixes,
            pickups: &mut self.pickups,
            object_counter: self.counter.clone(),
            loot: &mut self.loot,
            kills: &mut self.kills,
            elite_kills: &mut self.elite_kills,
            events: &mut self.events,
            healing: &mut self.pending_healing,
            absorbs: &mut self.pending_absorb,
            now: self.clock,
            run_level: self.level,
            player,
            zone: self.zone,
            rules: self.rules,
            stats: RunPlayerStats {
                maximum_health: self.execution.vitals.maximum_health,
                ..self.stats
            },
            class_id: self.class.class_id,
            player_absorb: self.execution.vitals.absorb,
            equipped: &self.effect_state.equipped,
            meter_sources: &self.effect_state.meter_sources,
            meter_definitions: self
                .abilities
                .iter()
                .map(|instance| instance.definition)
                .collect(),
            meter_racial: self.racial.as_ref().map(|instance| instance.definition),
            aura_provenance: &self.effect_state.display_provenance,
            rescue_ready_at: self.effect_state.incoming.lethal_talent_ready_at,
            soul_link_absorb: &mut self.effect_state.incoming.soul_link_absorb,
            special_demons: self.demon_state.rows.len(),
            racial_cooldown: self
                .racial
                .as_ref()
                .filter(|row| row.definition.effect.tag == 11)
                .map(|row| row.remaining),
            movement_counter: &mut self.movement_counter,
            numeric: &mut self.effect_state.numeric,
            stats_recomputed: false,
            pre_stats: self.effect_state.pre_stats,
            cooperative_luck,
            base_stats: self.effect_state.base,
            base_leech: self.effect_state.base_leech,
            generic: &mut self.effect_state.generic,
            extra_cast: false,
            extra_cast_factor: extra_cast_factor,
            leech: self.effect_state.leech,
            world,
            attribution: PassiveAttribution {
                source_kind: if matches!(action,IncomingAction::Hit(hit) if hit.passive_source) {
                    3
                } else {
                    0
                },
                source_words: [0; 4],
                cast_words: [0; 4],
            },
        };
        let mut passive = passives::PassiveCombat {
            core: &mut port,
            learned: &mut self.abilities,
            state: &mut self.passive_state,
            context: passive_context,
            cast_context: context,
            first_periodic: false,
            native_7e4: &mut self.native_7e4,
            object_counter: None,
            native_30: false,
        };
        match action {
            IncomingAction::Hit(hit) => passive.hit_with_execution(
                PendingHit {
                    context: HitContext::default(),
                    target_guid: hit.target_guid,
                    source_guid: self.player_guid,
                    effect: player_abilities::StatusEffect {
                        tag: 0,
                        value: 0.0,
                        duration: 0.0,
                    },
                    resolves_at: self.clock,
                    spell_id: hit.spell_id,
                    damage: hit.damage,
                    critical: false,
                    damages_player: false,
                    school: hit.school,
                },
                &mut self.rng,
                &mut self.execution,
                &mut self.counter,
            ),
            IncomingAction::Event { kind, amount, guid } => passive.generic_event(
                azeroth_survivors_re::run_effects::conditions::Event {
                    kind,
                    ..Default::default()
                },
                amount,
                guid,
                &mut self.execution,
                &mut self.rng,
                &mut self.counter,
            ),
        }
        port.flush_vitals(&mut self.execution.vitals);
        let refreshed = port.stats_recomputed.then_some((port.stats, port.leech));
        drop(port);
        if let Some((stats, leech)) = refreshed {
            self.accept_refreshed_stats(stats, leech);
        }
    }
}
struct IncomingPort<'a, W> {
    game: &'a mut Mechanics,
    player: Position,
    facing: f32,
    world: &'a mut W,
}
impl<W: RunWorld> ReactivePort for IncomingPort<'_, W> {
    fn auras(&self) -> &[buffs::Aura] {
        &self.game.execution.auras
    }
    fn thorns_bonus(&self) -> f32 {
        self.game.effect_state.numeric.buff_bonus
    }
    fn damage_multiplier(&self) -> f32 {
        self.game.current_damage_multiplier()
    }
    fn gear22_sum(&self) -> f32 {
        self.game.effect_state.equipped.sum(22)
    }
    fn run_active(&self) -> bool {
        !self.game.dead && !self.game.completed
    }
    fn hit(&mut self, hit: ReactiveHit, rng: &mut NativeRng) {
        self.game.rng = *rng;
        self.game
            .resolve_effect_hit(hit, self.player, self.facing, self.world);
        *rng = self.game.rng;
    }
}
