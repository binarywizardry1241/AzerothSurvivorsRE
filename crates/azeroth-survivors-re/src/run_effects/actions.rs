//! Current timed freecast26 collector14553a530 and scheduler1454b0e66.
//! Native field ownership and bounded vectors: treasure-interface/timed-cast-native.json.
use super::{EffectRow, Effects};
use crate::player_abilities::{AbilityDefinition, RuntimeInstance};

///1454d08d0: clone a learned instance or build a neutral rank1 instance with
/// current selectors and mean learned power. Both generic0 and timed26 use it.
pub fn free_instance(key: &str, learned: &[RuntimeInstance<'_>], effects: &Effects) -> Option<RuntimeInstance<'static>> {
    let definition = AbilityDefinition::by_key(key)?;
    if let Some(instance) = learned.iter().find(|instance| instance.definition.key == key) {
        return Some(RuntimeInstance { definition, ..*instance });
    }
    let mut instance = RuntimeInstance::learned(definition);
    effects.spell_modifiers(definition).apply(&mut instance);
    if !learned.is_empty() {
        instance.power_multiplier = (learned.iter().fold(-0.0, |sum, row| sum + row.power_multiplier)
            / learned.len() as f32).max(1.0);
    }
    Some(instance)
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TimedCast {
    pub key: &'static str,
    pub remaining: f32,
    pub interval_override: f32,
}
impl TimedCast {
    /// The run constructor owns initial remaining; reward refresh preserves
    /// existing base slots. This decoder does not invent that initialization.
    pub fn from_effect(row: &EffectRow, remaining: f32) -> Option<Self> {
        (row.tag() == 26).then(|| Self {
            key: row.key(8).expect("native timed cast key"),
            remaining,
            interval_override: row.float(4),
        })
    }
    /// Native subtracts delta and skips only a strictly positive timer. Unordered
    /// input follows its due arm as well; no catch-up loop runs in this owner.
    pub fn elapse(&mut self, delta: f32) -> bool {
        self.remaining -= delta;
        !(self.remaining > 0.0)
    }
    /// Called after synchronous dispatch of the actual free instance. A failed
    /// targeting/cast result retries after.3 seconds, independently of cooldown.
    pub fn complete(&mut self, success: bool, instance: &RuntimeInstance<'_>, global: f32) {
        self.complete_after_cast(success, timed_fallback(instance, global), global);
    }
    /// The fallback is captured before dispatch. A positive override uses the
    /// global multiplier after dispatch, before the successful kind3 callback.
    pub fn complete_after_cast(&mut self, success: bool, captured_fallback: f32, global_after: f32) {
        self.remaining = if success {
            let interval = if self.interval_override > 0.0 {
                self.interval_override * global_after
            } else { captured_fallback };
            if interval > 0.25 { interval } else { 0.25 }
        } else {
            f32::from_bits(0x3e99999a)
        };
    }
}

/// Native1454b0f87..1019 uses the freshly constructed free instance. A positive
/// override replaces its cooldown before the shared global multiplier; zero,
/// negative and unordered overrides use the ordinary cooldown calculation.
pub fn timed_interval(instance: &RuntimeInstance<'_>, global: f32, override_seconds: f32) -> f32 {
    let mut row = TimedCast { key: instance.definition.key, remaining: 0.0, interval_override: override_seconds };
    row.complete_after_cast(true, timed_fallback(instance, global), global);
    row.remaining
}

pub fn timed_fallback(instance: &RuntimeInstance<'_>, global_before: f32) -> f32 {
    (((instance.definition.base_cooldown * 1.4) * instance.cooldown_multiplier)
        * instance.talent_cooldown_multiplier) * global_before
}

impl Effects {
    ///1454fb4a9..4f4 scans the current composed generic rows; an amulet and a
    /// talent use the same variant23 presence gate, with no rank/magnitude read.
    pub fn chain_no_decay(&self) -> bool {
        self.rows.iter().any(|row| row.tag() == 23)
    }
}

#[derive(Clone, Copy, Debug, PartialEq, serde::Deserialize)]
pub struct TemporaryStat {
    pub effect_index: usize,
    pub stacks: u32,
    pub expires: f32,
}
#[derive(Clone, Debug, Default)]
pub struct TemporaryStats {
    pub entries: Vec<TemporaryStat>,
}
impl TemporaryStats {
    /// Caller evaluates row condition16 before invoking the native update.
    /// New entries begin at1 even if maximum_stacks is zero. Existing entries
    /// reset at the exact expiration boundary, then wrap-add and cap their stack.
    pub fn activate(&mut self, effect_index: usize, row: &EffectRow, now: f32) -> bool {
        if row.tag() != 15 { return false; }
        if let Some(entry) = self.entries.iter_mut().find(|entry| entry.effect_index == effect_index) {
            if now >= entry.expires { entry.stacks = 0; }
            entry.stacks = entry.stacks.wrapping_add(1).min(row.word(8));
            entry.expires = now + row.float(12);
        } else {
            self.entries.push(TemporaryStat { effect_index, stacks:1, expires:now + row.float(12) });
        }
        true
    }
    ///1454a6bbe..6c63 resolves each active source index against the CURRENT
    /// composed rows, keeps only variant15, and adds stack_count*amount to its
    /// stat kind byte1. Expired/removed effect slots cannot contribute.
    pub fn contributions<'a>(&'a self, rows: &'a [EffectRow], now: f32) -> impl Iterator<Item=(u8,f32)> + 'a {
        self.entries.iter().filter_map(move |entry| {
            if now >= entry.expires { return None; }
            let row = rows.get(entry.effect_index)?;
            (row.tag() == 15).then(|| (row.bytes[1], entry.stacks as f32 * row.float(4)))
        })
    }
    /// Tick's stable expiry compaction triggers stat refresh if any row expired.
    pub fn expire(&mut self, now: f32) -> bool {
        let before = self.entries.len();
        self.entries.retain(|entry| !(now >= entry.expires));
        before != self.entries.len()
    }
    /// Current reward refresh retains only the generic talent prefix; temporary
    /// amulet entries expire immediately even when the replacement has a slot.
    pub fn retain_effect_prefix(&mut self, count: usize) {
        self.entries.retain(|entry| entry.effect_index < count);
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ShieldBurst {
    pub school: u8,
    pub radius: f32,
    pub spell_id: u32,
    pub power: f32,
}
impl EffectRow {
    /// Variant3 condition16 is evaluated by the caller. The native burst uses
    /// event request amount, the equipped fraction and global damage in order;
    /// synchronous area hits temporarily use source-kind3 to suppress recursion.
    pub fn shield_burst(&self, event_amount: f32, damage_multiplier: f32) -> Option<ShieldBurst> {
        (self.tag() == 3).then(|| ShieldBurst {
            school:self.bytes[1], radius:self.float(8), spell_id:self.word(12),
            power:(event_amount * self.float(4)) * damage_multiplier,
        })
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DeathExplosion {
    pub radius: f32,
    pub spell_id: u32,
    pub visual_spell_id: Option<u32>,
    pub power: f32,
    pub maximum_per_second: u32,
}
impl EffectRow {
    /// Caller first evaluates condition24. Native consumes a shared RNG draw
    /// even for chance1, then forwards the exact three status words to its owner.
    pub fn proc_status(&self, rng: &mut crate::enemies::NativeRng) -> Option<crate::player_abilities::StatusEffect> {
        if self.tag()!=8 || !(crate::player_abilities::behavior::unit24(rng)<self.float(4)) { return None; }
        Some(crate::player_abilities::StatusEffect { tag:self.word(8),value:self.float(12),duration:self.float(16) })
    }
    /// Only call with a death-event victim snapshot. The periodic arm checks
    /// stored spell IDs, without inventing a remaining-ticks or owner-kind gate.
    /// The all-spells selector also accepts a native variant9 condition that
    /// would add a DoT for the reconstructed hit event (kind0).
    pub fn death_explosion_matches<'a>(
        &self, event:&super::conditions::Event, killing_definition:Option<&crate::player_abilities::AbilityDefinition>,
        periodic_spells:impl IntoIterator<Item=u32>,
        resolve:impl Fn(u32)->Option<&'a crate::player_abilities::AbilityDefinition>,
        would_add_dot:bool,
    )->bool {
        if self.tag()!=11 || event.kind!=2 { return false; }
        if self.bytes[1]&1==0 { return self.matches_event(24,event,killing_definition); }
        if self.bytes[24]==0 { return periodic_spells.into_iter().next().is_some() || would_add_dot; }
        periodic_spells.into_iter().filter(|id|*id!=0).filter_map(resolve)
            .any(|definition| self.matches(24,definition))
    }
    /// The explosion power is a fraction of victim maximum HP, without global
    /// damage scaling. Zero visual spell uses native damage fallback13812.
    pub fn death_explosion(&self, maximum_health:f32)->Option<DeathExplosion> {
        (self.tag()==11).then(|| DeathExplosion { radius:self.float(8),
            spell_id:if self.word(12)==0 { 13812 } else { self.word(12) },
            visual_spell_id:(self.word(12)!=0).then(|| self.word(12)),
            power:self.float(4)*maximum_health, maximum_per_second:self.word(16) })
    }
}

/// Native indexed timestamp gate shared by explosions/splash callbacks. Zero
/// cap bypasses this state entirely. Entries exactly1 second old are removed;
/// retained timestamps preserve order and one accepted event appends now.
pub fn admit_per_second(timestamps:&mut Vec<f32>, maximum:u32, now:f32)->bool {
    if maximum==0 { return true; }
    timestamps.retain(|time| now-*time<1.0);
    if timestamps.len()>=maximum as usize { return false; }
    timestamps.push(now);
    true
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::player_abilities::AbilityDefinition;
    #[test]
    fn all_selected_target_timed_interval_vectors_match_bits() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/treasure-interface/timed-cast-native.json"
        )).unwrap();
        assert_eq!(fixture["target_sha256"], super::super::TARGET_SHA256);
        assert_eq!(fixture["cases"].as_array().unwrap().len(), 324);
        for case in fixture["cases"].as_array().unwrap() {
            let value = |key: &str| case[key].as_f64().unwrap() as f32;
            let mut definition = *AbilityDefinition::by_key("cleave").unwrap();
            definition.base_cooldown = value("base_cooldown");
            let mut instance = RuntimeInstance::learned(&definition);
            instance.cooldown_multiplier = value("ordinary_cooldown");
            instance.talent_cooldown_multiplier = value("talent_cooldown");
            assert_eq!(timed_interval(&instance, value("global_cooldown"), value("interval_override")).to_bits(),
                case["success_interval_bits"].as_u64().unwrap() as u32, "{case}");
        }
    }
    #[test]
    fn timed_live_due_and_split_global_snapshots_match_original_instructions() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/run-effects/timed-live-native.json"
        )).unwrap();
        assert_eq!(fixture["target_sha256"], super::super::TARGET_SHA256);
        for case in fixture["intervals"].as_array().unwrap() {
            let value = |key: &str| f32::from_bits(case[key].as_u64().unwrap() as u32);
            let mut definition = *AbilityDefinition::by_key("cleave").unwrap();
            definition.base_cooldown = value("base_bits");
            let mut instance = RuntimeInstance::learned(&definition);
            instance.cooldown_multiplier = value("ordinary_bits");
            instance.talent_cooldown_multiplier = value("talent_bits");
            let fallback = timed_fallback(&instance, value("global_before_bits"));
            assert_eq!(fallback.to_bits(), case["expected_fallback_bits"].as_u64().unwrap() as u32, "{case}");
            let mut row = TimedCast { key:"cleave", remaining:0.0, interval_override:value("override_bits") };
            row.complete_after_cast(true, fallback, value("global_after_bits"));
            assert_eq!(row.remaining.to_bits(), case["expected_interval_bits"].as_u64().unwrap() as u32, "{case}");
        }
        for case in fixture["due"].as_array().unwrap() {
            let value = |key: &str| f32::from_bits(case[key].as_u64().unwrap() as u32);
            let mut row = TimedCast { key:"cleave", remaining:value("remaining_bits"), interval_override:0.0 };
            assert_eq!(row.elapse(value("delta_bits")), case["due"].as_bool().unwrap(), "{case}");
            let expected = f32::from_bits(case["expected_bits"].as_u64().unwrap() as u32);
            assert!(row.remaining.to_bits()==expected.to_bits() || row.remaining.is_nan() && expected.is_nan(), "{case}");
        }
    }
    #[test]
    fn shared_free_instance_retains_learned_upgrades_and_uses_mean_only_for_unlearned() {
        let mut learned = RuntimeInstance::learned(AbilityDefinition::by_key("cleave").unwrap());
        learned.rank=5; learned.remaining=123.0; learned.power_multiplier=3.0;
        learned.cooldown_multiplier=0.7; learned.upgrade_counts=[4,3,2,1,0];
        learned.talent_area_multiplier=1.8;
        let mut other = RuntimeInstance::learned(AbilityDefinition::by_key("mortal_strike").unwrap());
        other.power_multiplier=5.0;
        let effects = Effects::default();
        let existing = free_instance("cleave", &[learned,other], &effects).unwrap();
        assert_eq!((existing.rank,existing.remaining,existing.power_multiplier,existing.cooldown_multiplier), (5,123.0,3.0,0.7));
        assert_eq!(existing.upgrade_counts,[4,3,2,1,0]);
        assert_eq!(existing.talent_area_multiplier,1.8);
        let fresh = free_instance("whirlwind", &[learned,other], &effects).unwrap();
        assert_eq!((fresh.rank,fresh.remaining,fresh.power_multiplier),(1,0.5,4.0));
        assert_eq!(fresh.upgrade_counts,[0;5]);
    }
    #[test]
    fn chain_decay_uses_composed_row_presence_for_every_native_vector() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/treasure-interface/chain-decay-native.json"
        )).unwrap();
        assert_eq!(fixture["target_sha256"], super::super::TARGET_SHA256);
        for case in fixture["cases"].as_array().unwrap() {
            let mut effects = Effects::default();
            effects.rows = case["tags"].as_array().unwrap().iter().map(|tag| {
                let mut row = EffectRow { bytes: [0;64], strings: &[], lists: &[] };
                row.bytes[0] = tag.as_u64().unwrap() as u8;
                row
            }).collect();
            let decay: f32 = if effects.chain_no_decay() { 1.0 } else { 0.92 };
            assert_eq!(decay.to_bits(), case["decay_bits"].as_u64().unwrap() as u32, "{case}");
        }
    }
    #[test]
    fn all_native_temporary_stat_state_vectors_match() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/treasure-interface/temporary-stat-native.json"
        )).unwrap();
        assert_eq!(fixture["target_sha256"], super::super::TARGET_SHA256);
        for case in fixture["cases"].as_array().unwrap() {
            let mut state=TemporaryStats { entries:serde_json::from_value(case["initial"].clone()).unwrap() };
            let mut row=EffectRow { bytes:[0;64], strings:&[], lists:&[] };
            row.bytes[0]=15;row.bytes[1]=14;
            row.bytes[4..8].copy_from_slice(&0.05_f32.to_le_bytes());
            row.bytes[8..12].copy_from_slice(&(case["maximum_stacks"].as_u64().unwrap() as u32).to_le_bytes());
            row.bytes[12..16].copy_from_slice(&(case["duration"].as_f64().unwrap() as f32).to_le_bytes());
            assert!(state.activate(case["effect_index"].as_u64().unwrap() as usize,&row,case["now"].as_f64().unwrap() as f32));
            let expected: Vec<TemporaryStat>=serde_json::from_value(case["expected"].clone()).unwrap();
            assert_eq!(state.entries,expected,"{case}");
        }
    }
    #[test]
    fn shield_burst_matches_current_native_scalar_vectors() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/treasure-interface/temporary-stat-native.json"
        )).unwrap();
        for case in fixture["shield_burst"].as_array().unwrap() {
            let value=|key:&str|case[key].as_f64().unwrap() as f32;
            let mut row=EffectRow { bytes:[0;64],strings:&[],lists:&[] };
            row.bytes[0]=3;row.bytes[1]=4;
            row.bytes[4..8].copy_from_slice(&value("fraction").to_le_bytes());
            row.bytes[8..12].copy_from_slice(&10_f32.to_le_bytes());
            row.bytes[12..16].copy_from_slice(&122_u32.to_le_bytes());
            let burst=row.shield_burst(value("event_amount"),value("damage_multiplier")).unwrap();
            assert_eq!(burst.power.to_bits(),case["power_bits"].as_u64().unwrap() as u32,"{case}");
            assert_eq!((burst.school,burst.spell_id,burst.radius),(4,122,10.));
        }
    }
    #[test]
    fn temporary_contributions_expire_and_follow_current_effect_indices() {
        let mut row=EffectRow { bytes:[0;64], strings:&[], lists:&[] };
        row.bytes[0]=15;row.bytes[1]=14;row.bytes[4..8].copy_from_slice(&0.05_f32.to_le_bytes());
        let rows=vec![row];
        let mut state=TemporaryStats { entries:vec![TemporaryStat { effect_index:0,stacks:2,expires:10. }] };
        assert_eq!(state.contributions(&rows,9.).collect::<Vec<_>>(),vec![(14,0.1)]);
        assert!(state.contributions(&rows,10.).next().is_none());
        assert!(state.expire(10.));
        assert!(!state.expire(10.));
    }
    fn status_explosion_fixture()->serde_json::Value {
        serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/treasure-interface/status-explosion-native.json"
        )).unwrap()
    }
    #[test]
    fn status_proc_matches_native_acceptance_and_shared_rng_transition() {
        let fixture=status_explosion_fixture();
        assert_eq!(fixture["target_sha256"],super::super::TARGET_SHA256);
        for case in fixture["status"].as_array().unwrap() {
            let seed: [u64;4]=serde_json::from_value(case["seed"].clone()).unwrap();
            let mut rng=crate::enemies::NativeRng { words:seed };
            let mut row=EffectRow { bytes:[0;64],strings:&[],lists:&[] };
            row.bytes[0]=8;
            row.bytes[4..8].copy_from_slice(&(case["chance"].as_f64().unwrap() as f32).to_le_bytes());
            row.bytes[8..12].copy_from_slice(&3_u32.to_le_bytes());
            row.bytes[12..16].copy_from_slice(&1.5_f32.to_le_bytes());
            let actual=row.proc_status(&mut rng);
            assert_eq!(actual.is_some(),case["accepted"].as_bool().unwrap(),"{case}");
            let expected: [u64;4]=serde_json::from_value(case["next_seed"].clone()).unwrap();
            assert_eq!(rng.words,expected,"{case}");
            if let Some(effect)=actual { assert_eq!((effect.tag,effect.value,effect.duration),(3,1.5,0.)); }
        }
    }
    #[test]
    fn explosion_timestamp_and_power_vectors_match_native() {
        let fixture=status_explosion_fixture();
        for case in fixture["rates"].as_array().unwrap() {
            let mut times:Vec<f32>=serde_json::from_value(case["initial"].clone()).unwrap();
            assert_eq!(admit_per_second(&mut times,case["maximum"].as_u64().unwrap() as u32,
                case["now"].as_f64().unwrap() as f32),case["accepted"].as_bool().unwrap(),"{case}");
            let expected:Vec<f32>=serde_json::from_value(case["expected"].clone()).unwrap();
            assert_eq!(times,expected,"{case}");
        }
        for case in fixture["death_powers"].as_array().unwrap() {
            let mut row=EffectRow { bytes:[0;64],strings:&[],lists:&[] };
            row.bytes[0]=11;row.bytes[4..8].copy_from_slice(&(case["fraction"].as_f64().unwrap() as f32).to_le_bytes());
            let action=row.death_explosion(case["maximum_health"].as_f64().unwrap() as f32).unwrap();
            assert_eq!(action.power.to_bits(),case["power_bits"].as_u64().unwrap() as u32,"{case}");
            assert_eq!(action.spell_id,13812);
            assert_eq!(action.visual_spell_id,None);
        }
    }
    #[test]
    fn death_explosion_uses_actual_selector_and_victim_periodic_spell_ids() {
        let amulet=crate::loot_rewards::amulets::catalog().by_key("legendary:rend").unwrap();
        let payload=amulet.effects.iter().find(|row|matches!(row.effect,crate::loot_rewards::amulets::Effect::Passive { tag:11 })).unwrap();
        let row=EffectRow::amulet(payload,1.0);
        let rend=crate::player_abilities::AbilityDefinition::by_key("rend").unwrap();
        let cleave=crate::player_abilities::AbilityDefinition::by_key("cleave").unwrap();
        let resolve=|id|crate::player_abilities::AbilityDefinition::by_spell_id(id);
        let event=super::super::conditions::Event { kind:2,spell_id:cleave.spell_id,..Default::default() };
        assert!(row.death_explosion_matches(&event,Some(cleave),[rend.spell_id],resolve,false));
        assert!(!row.death_explosion_matches(&event,Some(cleave),[cleave.spell_id],resolve,false));
        assert!(!row.death_explosion_matches(&event,Some(rend),[],resolve,false));
        let mut any=row.clone();any.bytes[24]=0;
        assert!(any.death_explosion_matches(&event,Some(cleave),[],resolve,true));
        assert!(any.death_explosion_matches(&event,Some(cleave),[0],resolve,false));
    }
    #[test]
    fn timed_cast_has_native_due_and_failure_gates() {
        let mut cast = TimedCast { key: "cleave", remaining: 1.0, interval_override: 3.0 };
        assert!(!cast.elapse(0.5));
        assert!(cast.elapse(0.5));
        let instance = RuntimeInstance::learned(AbilityDefinition::by_key("cleave").unwrap());
        cast.complete(false, &instance, 0.5);
        assert_eq!(cast.remaining.to_bits(), 0x3e99999a);
        cast.complete(true, &instance, 0.5);
        assert_eq!(cast.remaining, 1.5);
        cast.remaining = f32::NAN;
        assert!(cast.elapse(0.1));
    }
}
