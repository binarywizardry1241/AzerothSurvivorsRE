//! Current 0.112.0 initial companions, ordered Gate/build clocks and cast summons.
//! The current time-effect owner14592f2b0 shares per-effect timestamps/counters
//! with the HUD; raw34 is periodic, while only raw33 observes damaging casts.
use super::demons::State;
use super::*;
use azeroth_survivors_re::run_effects::{EffectRow, demons::SummonRequest, pets};

const IMP: u32 = 9512;
const FELHUNTER: u32 = 9518;
const VOIDWALKER: u32 = 9519;
const SUCCUBUS: u32 = 9520;
const INFERNAL: u32 = 9521;
const DOOMGUARD: u32 = 9522;

fn rank_power(rank: u8) -> f32 { 1.0 + f32::from(rank.saturating_sub(1)) * 0.2 }
fn request(entry: u32, lifetime: Option<f32>, power_multiplier: f32,
           relative_angle: Option<f32>) -> SummonRequest {
    SummonRequest { entry, lifetime, effect_index: entry as usize, power_multiplier, relative_angle }
}
fn interval(value: f32, minimum: f32) -> f32 {
    if value.is_nan() { value } else { value.max(minimum) }
}
pub(super) enum LifecycleAction {
    None,
    Gate { count: u32, lifetime: f32 },
    Summon(SummonRequest),
}
impl State {
    pub(super) fn initialize(&mut self, ordinary_grants: usize) {
        if self.started { return; }
        self.started = true;
        let c = self.config;
        let mut lesser = Vec::new();
        if !c.supremacy {
            if c.familiar_rank != 0 { lesser.push(IMP) }
            if c.devourer_rank != 0 { lesser.push(FELHUNTER) }
            if c.link_rank != 0 { lesser.push(VOIDWALKER) }
        }
        let count = ordinary_grants + lesser.len();
        for (index, entry) in lesser.into_iter().enumerate() {
            self.requests.push(request(entry, None, 1.0,
                Some(pets::initial_relative_angle(ordinary_grants + index, count))));
        }
        if c.supremacy {
            if c.infernal_rank != 0 {
                self.requests.push(request(INFERNAL, None, rank_power(c.infernal_rank), None));
            }
            // Doom Bringer now scales the focus consumer from its current rank;
            // its summon itself has no historical .2-per-rank power multiplier.
            if c.doomguard_rank != 0 {
                self.requests.push(request(DOOMGUARD, None, 1.0, None));
            }
        }
    }
    pub(super) fn temporary_lesser_count(&self) -> usize {
        self.rows.iter().filter(|d| d.tick.expires_at.is_some()
            && (1..=4).contains(&d.definition.special)).count()
        + self.requests.iter().filter(|r| r.lifetime.is_some()
            && pets::definition(r.entry).is_some_and(|d| (1..=4).contains(&d.special))).count()
    }
    /// Prepare one source row. The caller finishes its summons and recursive
    /// effects before evaluating the next native effect ordinal.
    pub(super) fn lifecycle_action(&mut self, row: &EffectRow, index: usize,
        now: f32, cooldown: f32, nearby35: bool,
        deadlines: &mut [f32], counters: &mut [u32]) -> LifecycleAction {
        if row.tag() != 253 { return LifecycleAction::None; }
        let timestamp = deadlines.get(index).copied().unwrap_or(0.0);
        let activity = counters.get(index).copied().unwrap_or(0);
        match row.bytes[63] {
            32 => {
                if timestamp > now { return LifecycleAction::None; }
                if self.config.supremacy {
                    if let Some(at) = deadlines.get_mut(index) { *at = now + 12.0; }
                    for demon in &mut self.rows {
                        if matches!(demon.definition.special, 6 | 7) { demon.greater_empowered = true; }
                    }
                    return LifecycleAction::None;
                }
                let period = (row.float(4) * cooldown).max(4.0);
                if timestamp == 0.0 && counters.get(index).is_some_and(|count| *count == 0) {
                    if let Some(at) = deadlines.get_mut(index) { *at = now + period; }
                    return LifecycleAction::None;
                }
                if !nearby35 { return LifecycleAction::None; }
                if let Some(at) = deadlines.get_mut(index) { *at = now + period; }
                if let Some(count) = counters.get_mut(index) { *count = count.wrapping_add(1); }
                LifecycleAction::Gate {
                    count: u32::from_le_bytes(row.bytes[8..12].try_into().unwrap()),
                    lifetime: row.float(if activity & 1 == 0 { 12 } else { 16 }),
                }
            }
            34 => {
                let due = if activity != 0 {
                    timestamp + interval(row.float(8) * cooldown, row.float(12))
                } else { now };
                if now < due { return LifecycleAction::None; }
                let present = self.rows.iter().filter(|d|
                    d.tick.expires_at.is_some() && d.origin_effect == Some(index)).count()
                    + self.requests.iter().filter(|r|
                        r.lifetime.is_some() && r.effect_index == index).count();
                if present > 1 { return LifecycleAction::None; }
                let Some(definition) = super::demons::effect_definition(row) else {
                    return LifecycleAction::None;
                };
                if let Some(at) = deadlines.get_mut(index) { *at = now; }
                if let Some(count) = counters.get_mut(index) { *count = count.wrapping_add(1); }
                LifecycleAction::Summon(SummonRequest {
                    entry: definition.entry, lifetime: Some(row.float(4)), effect_index: index,
                    power_multiplier: 1.0, relative_angle: None,
                })
            }
            _ => LifecycleAction::None,
        }
    }
    /// 0.127.0 145c707bf..145c709ed draws one candidate before its synchronous
    /// creation. A capped kind consumes that first roll, filters the original
    /// pool, then consumes another roll over the remaining admissible kinds.
    pub(super) fn gate_entry(&self, rng: &mut NativeRng) -> Option<u32> {
        let mut pool = vec![IMP, SUCCUBUS];
        if self.config.devourer_rank != 0 { pool.push(FELHUNTER) }
        if self.config.link_rank != 0 { pool.push(VOIDWALKER) }
        let choose = |pool: &[u32], rng: &mut NativeRng| {
            pool[azeroth_survivors_re::enemies::waves::uniform_index(pool.len(), rng)]
        };
        let entry = choose(&pool, rng);
        if self.gate_kind_available(entry) { return Some(entry); }
        pool.retain(|entry| self.gate_kind_available(*entry));
        if pool.is_empty() { None } else { Some(choose(&pool, rng)) }
    }
    fn gate_kind_available(&self, entry: u32) -> bool {
        let cap = match entry { VOIDWALKER => 4, FELHUNTER => 6, _ => 12 };
        // Native rows count temporary lesser demons. Permanent companions and
        // greater demons do not spend either population limit. Pending source
        // requests reserve the same capacity until creation finishes.
        let active = self.rows.iter().filter(|d| d.tick.expires_at.is_some()
            && (1..=4).contains(&d.definition.special)
            && d.definition.entry == entry).count();
        let pending = self.requests.iter().filter(|r| r.lifetime.is_some()
            && r.entry == entry && pets::definition(r.entry)
                .is_some_and(|d| (1..=4).contains(&d.special))).count();
        active + pending < cap
    }
    /// Only native33 belongs to ordinary successful damaging casts. Periodic
    /// ticks, demon attacks and current raw34 build effects do not enter here.
    pub(super) fn after_damaging_cast_for(&mut self, entry: u32, source_index: usize,
        definition: &AbilityDefinition, now: f32, _recovery: f32, rng: &mut NativeRng,
        mut spawn: impl FnMut(&mut Self, &mut NativeRng)) {
        if definition.spell_id == 0 || !(definition.base_power > 0.0) || definition.kind == 11 { return; }
        let rank = match entry { INFERNAL => self.config.infernal_rank,
            DOOMGUARD => self.config.doomguard_rank, _ => 0 };
        if rank == 0 || self.config.supremacy
            || self.rows.iter().any(|d| d.definition.entry == entry)
            || self.requests.iter().any(|r| r.entry == entry) { return; }
        if behavior::unit24(rng) < 0.05 {
            let mut summoned = request(entry, Some(15.0),
                if entry == DOOMGUARD { 1.0 } else { rank_power(rank) }, None);
            summoned.effect_index = source_index;
            self.requests.push(summoned);
            spawn(self, rng);
        }
        let _ = now; // The native clock is captured by the creation callback.
    }
}

impl<W: RunWorld> passives::PassiveCombat<'_, '_, '_, W> {
    /// Drain one request at a time: the native wrapper's angle, creation,
    /// landing hits and recursive effects finish before the next summon proc.
    pub(super) fn spawn_demons(
        &mut self,
        state: &mut State,
        facing: f32,
        execution: &mut ExecutionState<'_>,
        rng: &mut NativeRng,
        counter: &mut dyn NativeCounter,
    ) {
        for request in std::mem::take(&mut state.requests) {
            state.requests.push(request);
            let targets = actor_targets(
                self.core.actors,
                self.core.bosses,
                &self.core.boss_state.wards,
                self.core.object_counter.sequence(),
            );
            let created = super::demons::create(
                state,
                self.context.now,
                self.context.player,
                facing,
                self.core.run_level,
                self.core.stats.native_race,
                self.core.world,
                counter,
                self.core.events,
                rng,
                &targets,
                self.core.numeric.area,
            );
            self.core.special_demons = state.rows.len();
            for demon in created {
                detailed_credit::note_companion(
                    self.core.detailed_meter, self.context.player_guid, demon.guid, demon.definition,
                );
                if demon.definition.special != 6 {
                    continue;
                }
                let center = demon.tick.motion.position_at(self.context.now);
                let radius =
                    azeroth_survivors_re::run_effects::demon_effects::infernal_landing_radius(
                        self.core.numeric.area,
                    );
                let targets = behavior::targeting::radius_targets(
                    &actor_targets(
                        self.core.actors,
                        self.core.bosses,
                        &self.core.boss_state.wards,
                        self.core.object_counter.sequence(),
                    ),
                    self.context.now,
                    Position {
                        x: center[0],
                        y: center[1],
                        z: center[2],
                    },
                    radius,
                    &[],
                )
                .into_iter()
                .map(|row| (row.actor.guid, row.has_metadata, row.flagged))
                .collect::<Vec<_>>();
                let base = azeroth_survivors_re::run_effects::demons::common_base(
                    demon.definition,
                    self.core.run_level,
                    self.core
                        .current_context(self.cast_context, execution)
                        .power
                        .damage_multiplier,
                    2.25,
                );
                for (target, boss, elite) in targets {
                    let (power, critical) =
                        self.demon_critical(&demon, base, target, execution, rng);
                    let duration = azeroth_survivors_re::run_effects::demons::infernal_landing_stun(boss, elite);
                    self.hit_with_execution(
                        PendingHit {
                            context: HitContext {
                                captured_source_kind: Some(2),
                                pet_entry: Some(demon.definition.entry),
                                meter_attack: Some(
                                    azeroth_survivors_re::run_meter::CapturedAttack {
                                        primary: "Landing",
                                        secondary: None,
                                        bonus_bits: 0,
                                        suppressed: false,
                                    },
                                ),
                                ..Default::default()
                            },
                            target_guid: target,
                            source_guid: demon.guid,
                            effect: player_abilities::StatusEffect {
                                tag: 0,
                                value: 0.0,
                                duration: 0.0,
                            },
                            resolves_at: self.context.now,
                            spell_id: 1122,
                            damage: power,
                            critical,
                            damages_player: false,
                            school: demon.definition.school,
                        },
                        rng,
                        execution,
                        counter,
                    );
                    // Current wrapper applies control after damage and its callbacks.
                    self.apply_effect_status(target, player_abilities::StatusEffect {
                        tag: 3, value: duration, duration: 0.0,
                    }, 1122, power, execution);
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gate_caps_and_creation_draw_order_match_current_original_instructions() {
        let data: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.127.0/warlock-population/native-cases.json"
        )).unwrap();
        for row in data["gate"].as_array().unwrap() {
            let mut state = State::default();
            let talents = row["talents"].as_u64().unwrap();
            state.config.devourer_rank = u8::from(talents & 1 != 0);
            state.config.link_rank = u8::from(talents & 2 != 0);
            let present = row["present"].as_array().unwrap();
            for (entry, index) in [(VOIDWALKER, 0), (FELHUNTER, 1), (IMP, 3)] {
                for _ in 0..present[index].as_u64().unwrap() {
                    state.requests.push(request(entry, Some(16.0), 1.0, None));
                }
            }
            if present[2].as_u64().unwrap() != 0 {
                state.requests.push(request(VOIDWALKER, None, 1.0, None));
                state.requests.push(request(FELHUNTER, None, 1.0, None));
            }
            let words = row["seeds"].as_array().unwrap();
            let mut rng = NativeRng { words: std::array::from_fn(|i| words[i].as_u64().unwrap()) };
            let mut entries = Vec::new();
            let mut before = Vec::new();
            for _ in 0..4 {
                if state.temporary_lesser_count() >= 12 { break; }
                let Some(entry) = state.gate_entry(&mut rng) else { continue; };
                before.push(rng.words);
                entries.push(entry);
                state.requests.push(request(entry, Some(16.0), 1.0, None));
                if row["creation_rng"].as_bool().unwrap() { rng.next_u64(); }
            }
            assert_eq!(entries, row["entries"].as_array().unwrap().iter()
                .map(|entry| entry.as_u64().unwrap() as u32).collect::<Vec<_>>(), "{row}");
            let expected_before: Vec<[u64; 4]> = row["rng_before"].as_array().unwrap().iter()
                .map(|words| std::array::from_fn(|i| words[i].as_u64().unwrap())).collect();
            assert_eq!(before, expected_before, "{row}");
            let after = row["rng_after"].as_array().unwrap();
            assert_eq!(rng.words, std::array::from_fn(|i| after[i].as_u64().unwrap()), "{row}");
        }
    }

    #[test]
    fn current_native_build_clock_and_overlap_vectors() {
        let data: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/0.112.0/demon-actors/native-lifecycle-cases.json"
        )).unwrap();
        let talent = azeroth_survivors_re::run_effects::catalog().classes.iter()
            .flat_map(|class| &class.talents)
            .find(|talent| talent.key == "pact_of_the_annihilan").unwrap();
        let effect = EffectRow::talent(&talent.effects[0], 1);
        assert_eq!((effect.tag(), effect.bytes[63]), (253, 34));
        for row in data["builds"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(row[key].as_u64().unwrap() as u32);
            let mut state = State::default();
            for _ in 0..row["present"].as_u64().unwrap() {
                state.requests.push(SummonRequest { entry: 9523, lifetime: Some(20.0),
                    effect_index: 0, power_multiplier: 1.0, relative_angle: None });
            }
            let mut timestamps = [10.0];
            let mut counters = [row["activity"].as_u64().unwrap() as u32];
            let result = state.lifecycle_action(&effect, 0, f("now_bits"),
                f("cooldown_bits"), false, &mut timestamps, &mut counters);
            match (result, row["summons"].as_array().unwrap().first()) {
                (LifecycleAction::None, None) => {},
                (LifecycleAction::Summon(request), Some(native)) => {
                    let pointer = u64::from_str_radix(native["descriptor"].as_str()
                        .unwrap().trim_start_matches("0x"), 16).unwrap();
                    assert_eq!(request.entry, pets::definition_at_current_address(pointer).unwrap().entry);
                    assert_eq!(request.effect_index, native["origin"].as_u64().unwrap() as usize);
                    assert_eq!(request.lifetime.unwrap().to_bits(), native["lifetime_bits"].as_u64().unwrap() as u32);
                    assert_eq!(request.power_multiplier.to_bits(), native["power_bits"].as_u64().unwrap() as u32);
                },
                _ => panic!("native/source build admission differs: {row}"),
            }
            assert_eq!(timestamps[0].to_bits(), row["timestamp_bits"].as_u64().unwrap() as u32);
            assert_eq!(counters[0], row["activity_after"].as_u64().unwrap() as u32);
        }
    }
}
