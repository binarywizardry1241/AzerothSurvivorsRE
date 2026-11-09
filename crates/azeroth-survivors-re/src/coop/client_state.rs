//! Current native co-op state projection and client validation.
//! Current 0.140.0 State15 validator at 0x145e36520.

use super::replication::{NativeState, ResourceRow, TimerRow};

const MAX_GUEST_SPELL_ROWS: usize = 512;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum RunPhase {
    Ready,
    Playing,
    Choosing,
    Paused,
    Dead,
    Victory,
    Other(u8),
}
impl RunPhase {
    pub fn from_native(value: u8) -> Self {
        match value {
            0 => Self::Ready,
            1 => Self::Playing,
            2 => Self::Choosing,
            3 => Self::Paused,
            4 => Self::Dead,
            5 => Self::Victory,
            value => Self::Other(value),
        }
    }
    pub fn native(self) -> u8 {
        match self {
            Self::Ready => 0,
            Self::Playing => 1,
            Self::Choosing => 2,
            Self::Paused => 3,
            Self::Dead => 4,
            Self::Victory => 5,
            Self::Other(value) => value,
        }
    }
}

/// The semantic fields directly connected to the current AZSRUN producer.
/// The remaining lists stay in NativeState until their individual
/// wider producers/consumers have been recovered; applying this view preserves
/// them instead of generating empty snapshots over live state.
#[derive(Clone, Debug, PartialEq)]
pub struct RunProjection {
    pub clock: f32,
    pub phase: RunPhase,
    /// Native producer uses the effective local/shared phase's terminal bits.
    pub terminal: bool,
    pub level: u32,
    pub won: bool,
    pub bare: bool,
    pub kills: u32,
    pub gold_earned: u32,
    pub guardian_kills: u32,
    pub boss_kills: u32,
    pub caches_bought: u32,
    pub heroic_rank: u8,
    pub hyper: bool,
    pub boss_counter: u32,
    pub max_equipment_stars: u8,
    pub active_set: u8,
    pub run_marks: f32,
    pub max_boss_marks: f32,
    pub class: u8,
    pub zone: String,
}
impl RunProjection {
    pub fn read(state: &NativeState) -> Self {
        Self {
            clock: f32::from_bits(state.float_68_bits),
            phase: RunPhase::from_native(state.byte_8f),
            terminal: state.flag_8c,
            level: state.word_6c,
            won: state.flag_8d,
            bare: state.flag_8e,
            kills: state.words_70[0],
            gold_earned: state.words_70[1],
            guardian_kills: state.words_70[2],
            boss_kills: state.words_70[3],
            caches_bought: state.words_70[4],
            heroic_rank: state.heroic_rank, hyper: state.hyper, boss_counter: state.boss_counter,
            max_equipment_stars: state.max_equipment_stars, active_set: state.active_set,
            run_marks: f32::from_bits(state.float_84_bits),
            max_boss_marks: f32::from_bits(state.float_88_bits),
            class: state.byte_90,
            zone: state.text.clone(),
        }
    }
    pub fn write(&self, state: &mut NativeState) {
        state.float_68_bits = self.clock.to_bits();
        state.byte_8f = self.phase.native();
        state.flag_8c = self.terminal;
        state.word_6c = self.level;
        state.flag_8d = self.won;
        state.flag_8e = self.bare;
        state.words_70 = [
            self.kills,
            self.gold_earned,
            self.guardian_kills,
            self.boss_kills,
            self.caches_bought,
        ];
        state.heroic_rank = self.heroic_rank;
        state.hyper = self.hyper;
        state.boss_counter = self.boss_counter;
        state.max_equipment_stars = self.max_equipment_stars;
        state.active_set = self.active_set;
        state.float_84_bits = self.run_marks.to_bits();
        state.float_88_bits = self.max_boss_marks.to_bits();
        state.byte_90 = self.class;
        state.text.clone_from(&self.zone);
    }
}

/// Exact scalar portion of14581d7b0: Run Options percentages in native order
/// density, health, damage, speed. Keep f32 operation order for the wire bits.
pub fn run_modifiers(percentages: [u16; 4]) -> (f32, f32) {
    let [density, health, damage, speed] = percentages.map(f32::from);
    let density_part = ((density + -100.0) / 100.0) * 0.05;
    let health_part = ((health + -100.0) / 100.0) * 0.4;
    let damage_part = ((damage + -100.0) / 100.0) * 0.6;
    let speed_part = ((speed + -100.0) / 100.0) * 2.0;
    let reward = (((density_part + health_part) + damage_part) + speed_part) + 1.0;
    (density / 100.0, reward.min(2.0))
}

pub struct StateValidation<'a> {
    /// Caller resolves BOTH zone keys through the current native zone catalog;
    /// the native lookup canonicalizes unknown keys before comparing.
    pub canonical_zone_matches: bool,
    pub class: u8,
    pub seconds_since_zone_start: f64,
    /// Current zone's final-boss time in seconds, or1200 when none exists.
    /// Effective final-boss deadline for the received mode.
    pub zone_duration_seconds: f64,
    /// All five current zone boss IDs in native catalog order.
    pub boss_ids: &'a [u32],
}

/// Native 0x145e66210 rejects wrong class/zone or nonfinite run clocks, clamps
/// the scalar record and filters boss histories in their existing order.
pub fn validate_state(mut state: NativeState, context: StateValidation<'_>) -> Option<NativeState> {
    let clock = f32::from_bits(state.float_68_bits);
    let ceiling = context.seconds_since_zone_start + 30.0;
    if !context.canonical_zone_matches
        || state.byte_90 != context.class
        || !clock.is_finite()
        || ceiling < 0.0
        || ceiling.is_nan()
    {
        return None;
    }
    let clock = f64::from(clock).max(0.0).min(ceiling);
    // cvttsd2si after the native saturating-u32 bound, then add edi,5.
    let interval = f64::from(crate::bosses::spawning::endless_interval_seconds(state.hyper));
    let boss_limit = (1.0 + clock * (1.0 / interval)) as u32;
    let history_limit = boss_limit.wrapping_add(5);
    state.float_68_bits = (clock as f32).to_bits();
    // 0.127.0 validator145b52b13..145b52dc9 clamps the run level to120.
    state.word_6c = state.word_6c.min(crate::run_progression::RUN_LEVEL_CAP);
    state.flag_8d &= clock + 30.0 >= context.zone_duration_seconds;
    let caps = [
        (clock * 40.0 + 50.0) as u32,
        (clock * 500.0 + 1000.0) as u32,
        (clock * 0.05 + 1.0) as u32,
        history_limit,
        (clock * 0.1 + 2.0) as u32,
    ];
    for (word, cap) in state.words_70.iter_mut().zip(caps) {
        *word = (*word).min(cap);
    }
    state.heroic_rank = state.heroic_rank.min(5);
    state.boss_counter = state.boss_counter.min(boss_limit);
    state.max_equipment_stars = state.max_equipment_stars.min(5);
    state.active_set = state.active_set.min(8);
    let run_marks = f32::from_bits(state.float_84_bits);
    state.float_84_bits = if run_marks.is_finite() {
        run_marks.clamp(0.0, 4000.0)
    } else {
        0.0
    }
    .to_bits();
    let max_boss_marks = f32::from_bits(state.float_88_bits);
    state.float_88_bits = if max_boss_marks.is_finite() {
        max_boss_marks.clamp(0.0, 400.0)
    } else {
        0.0
    }
    .to_bits();
    state.pairs.retain(|row| context.boss_ids.contains(&row[0]));
    state.pairs.truncate(history_limit as usize);
    state
        .rows
        .retain(|row| context.boss_ids.contains(&row.word_00));
    state.rows.truncate(history_limit as usize);
    state.words.retain(|id| context.boss_ids.contains(id));
    state.words.truncate(context.boss_ids.len());
    state
        .secondary_rows
        .retain(|row| context.boss_ids.contains(&row.word_00));
    state.secondary_rows.truncate(history_limit as usize);
    state.enhancement &= context.class == 7;
    state
        .boss_flags
        .retain(|row| context.boss_ids.contains(&row.boss_id));
    state.boss_flags.truncate(history_limit as usize);
    if let Some(coop) = &mut state.coop {
        coop.events.retain(|event| context.boss_ids.contains(&event.word_18));
        coop.events.truncate(history_limit as usize);
        coop.word_30 = coop.word_30.min(clock as u32);
        coop.heroic_rank = coop.heroic_rank.min(state.heroic_rank);
        coop.initial_member_count = coop.initial_member_count.min(5);
        let first_fall = f32::from_bits(coop.first_fall_bits);
        coop.first_fall_bits = if first_fall >= 0.0 {
            let admitted_clock = clock as f32;
            if !first_fall.is_finite() {
                0.0
            } else if first_fall < admitted_clock {
                first_fall
            } else {
                admitted_clock
            }
        } else {
            -1.0
        }.to_bits();
    }
    Some(state)
}

/// Native client text sanitizer14583bab0 escapes clickable hyperlink and
/// texture introducers, then truncates to4096 bytes at a UTF8 boundary.
pub fn sanitize_text(text: &mut String) {
    for (needle, replacement) in [("|H", "||H"), ("|h", "||h"), ("|T", "||T"), ("|t", "||t")] {
        *text = text.replace(needle, replacement);
    }
    if text.len() > 4096 {
        let mut end = 4096;
        while !text.is_char_boundary(end) {
            end -= 1;
        }
        text.truncate(end);
    }
}

/// Tag 11 carries localized spell-display records. The 0.141.0 guest
/// keeps the first 512 records and sanitizes each retained text field.
pub fn sanitize_resources(rows: &mut Vec<ResourceRow>) {
    rows.truncate(MAX_GUEST_SPELL_ROWS);
    for row in rows {
        sanitize_text(&mut row.name);
        sanitize_text(&mut row.text_18);
        sanitize_text(&mut row.text_30);
        for text in row.optional.iter_mut().flatten() {
            sanitize_text(text);
        }
    }
}

/// Tag 12 carries spell visual-radius multipliers. The 0.141.0 guest
/// retains finite factors within the first 512 records and clamps them.
pub fn sanitize_timers(rows: &mut Vec<TimerRow>) {
    rows.truncate(MAX_GUEST_SPELL_ROWS);
    rows.retain(|row| f32::from_bits(row.value_bits).is_finite());
    for row in rows {
        row.value_bits = f32::from_bits(row.value_bits).clamp(0.1, 10.0).to_bits();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::coop::replication::StateRow;

    #[test]
    fn equipment_grants_retain_boss_identity_while_admitting_and_clamping_marks() {
        use crate::coop::replication::EquipmentGrant;
        let rows = [(-1.0, 0.0), (500.0, 400.0), (f32::NAN, 0.0), (17.5, 17.5)];
        let mut accepted = 61;
        let input: Vec<_> = rows.iter().enumerate().map(|(index, (marks, _))| EquipmentGrant {
            item_id: 101000, boss_key: index as u32 + 1, boss_marks_bits: marks.to_bits(),
        }).collect();
        let result = accept_equipment_grants(input, &[101000], &mut accepted);
        assert_eq!(accepted, 64);
        assert_eq!(result.len(), 3);
        for (index, row) in result.iter().enumerate() {
            assert_eq!(row.boss_key, index as u32 + 1);
            assert_eq!(f32::from_bits(row.boss_marks_bits), rows[index].1);
        }
    }

    fn state() -> NativeState {
        NativeState {
            float_68_bits: 60.0_f32.to_bits(),
            byte_8f: 2,
            flag_8c: false,
            word_6c: 7,
            flag_8d: true,
            words_70: [100, 200, 3, 4, 5],
            heroic_rank: 0, hyper: false, boss_counter: 0, max_equipment_stars: 0, active_set: 0,
            float_84_bits: 2.0_f32.to_bits(),
            float_88_bits: 1.5_f32.to_bits(),
            flag_8e: true,
            byte_90: 8,
            text: "elwynn".into(),
            pairs: vec![[1, 5], [99, 7]],
            rows: vec![StateRow {
                word_00: 1,
                word_04: 2,
                byte_08: 3,
                kind_09: 2,
                flag_0a: true,
            }],
            words: vec![1, 99, 1],
            secondary_rows: Vec::new(),
            enhancement: false,
            boss_flags: Vec::new(),
            coop: None,
        }
    }
    #[test]
    fn semantic_projection_preserves_unmapped_fields() {
        let mut source = state();
        let mut projection = RunProjection::read(&source);
        assert_eq!(projection.phase, RunPhase::Choosing);
        assert_eq!(
            (
                projection.kills,
                projection.gold_earned,
                projection.guardian_kills,
                projection.boss_kills,
                projection.caches_bought
            ),
            (100, 200, 3, 4, 5)
        );
        projection.level = 8;
        projection.phase = RunPhase::Victory;
        projection.write(&mut source);
        assert_eq!((source.word_6c, source.byte_8f), (8, 5));
        assert!(source.flag_8e && source.rows[0].flag_0a);
        assert_eq!(source.pairs, [[1, 5], [99, 7]]);
    }
    #[test]
    fn current_first_fall_validation_matches_native_option_and_signed_zero_rules() {
        use crate::coop::replication::NativeCoopFeats;
        for (clock, marker, expected) in [
            (0.0_f32, -0.0_f32, 0.0_f32), (30.0, -0.0, -0.0),
            (30.0, 12.0, 12.0), (30.0, 40.0, 30.0),
            (30.0, -1.0, -1.0), (30.0, f32::NAN, -1.0),
            (30.0, f32::INFINITY, 0.0), (30.0, f32::NEG_INFINITY, -1.0),
        ] {
            let mut source = state();
            source.float_68_bits = clock.to_bits();
            source.coop = Some(NativeCoopFeats {
                members: Vec::new(),
                word_30: 0,
                heroic_rank: 0,
                initial_member_count: 3,
                first_fall_bits: marker.to_bits(),
                events: Vec::new(),
            });
            let checked = validate_state(source, StateValidation {
                canonical_zone_matches: true, class: 8, seconds_since_zone_start: 0.0,
                zone_duration_seconds: 1200.0, boss_ids: &[],
            }).unwrap();
            assert_eq!(checked.coop.unwrap().first_fall_bits, expected.to_bits());
        }
    }

    #[test]
    fn native_state_validation_checks_context_and_bounds_counters() {
        let validate = |state, zone| {
            validate_state(
                state,
                StateValidation {
                    canonical_zone_matches: zone,
                    class: 8,
                    seconds_since_zone_start: 0.0,
                    zone_duration_seconds: 1200.0,
                    boss_ids: &[1, 2, 3, 4, 5],
                },
            )
        };
        assert!(validate(state(), false).is_none());
        let mut source = state();
        source.byte_90 = 7;
        assert!(validate(source, true).is_none());
        let mut source = state();
        source.float_68_bits = f32::NAN.to_bits();
        assert!(validate(source, true).is_none());
        let mut source = state();
        source.word_6c = u32::MAX;
        source.words_70 = [u32::MAX; 5];
        source.float_84_bits = f32::INFINITY.to_bits();
        source.float_88_bits = 9.0_f32.to_bits();
        let checked = validate(source, true).unwrap();
        assert_eq!(f32::from_bits(checked.float_68_bits), 30.0);
        assert_eq!(checked.word_6c, 120);
        for level in [0, 98, 99, 100, 119, 120, 121, u32::MAX] {
            let mut source = state();
            source.word_6c = level;
            assert_eq!(validate(source, true).unwrap().word_6c, level.min(120));
        }
        assert_eq!(checked.words_70, [1250, 16000, 2, 6, 5]);
        assert!(!checked.flag_8d);
        assert_eq!(checked.pairs, [[1, 5]]);
        assert_eq!(checked.words, [1, 1]);
        assert_eq!(f32::from_bits(checked.float_84_bits), 0.0);
        assert_eq!(f32::from_bits(checked.float_88_bits), 9.0);
    }
    #[test]
    fn current_party_history_filters_bosses_caps_events_and_preserves_member_bytes() {
        use crate::coop::replication::{NativeCoopFeats, NativeFeatEvent, NativeFeatMember};
        let member = NativeFeatMember { class: 255, word: u32::MAX, byte: 254, active_set: 253 };
        let event = |boss| NativeFeatEvent {
            word_18: boss, word_1c: 777, byte_20: 6, kind_21: 3, flag_22: true,
            members: vec![member.clone()],
        };
        let mut source = state();
        source.heroic_rank = 3;
        source.coop = Some(NativeCoopFeats {
            members: vec![member.clone()], word_30: u32::MAX, heroic_rank: 5,
            initial_member_count: 9, first_fall_bits: (-1.0_f32).to_bits(),
            events: std::iter::once(event(99)).chain((0..10).map(|_| event(1))).collect(),
        });
        let checked = validate_state(source, StateValidation {
            canonical_zone_matches: true, class: 8, seconds_since_zone_start: 0.0,
            zone_duration_seconds: 1200.0, boss_ids: &[1, 2, 3, 4, 5],
        }).unwrap();
        let coop = checked.coop.unwrap();
        assert_eq!(coop.members, [member.clone()]);
        assert_eq!((coop.word_30, coop.heroic_rank, coop.initial_member_count), (30, 3, 5));
        assert_eq!(coop.events.len(), 6);
        assert!(coop.events.iter().all(|event| event.word_18 == 1 && event.members == [member.clone()]));
    }

    #[test]
    fn native_modifiers_text_and_visual_scale_bounds_are_distinct() {
        assert_eq!(run_modifiers([100; 4]), (1.0, 1.0));
        assert_eq!(run_modifiers([500, 100, 100, 100]), (5.0, 1.2));
        assert_eq!(run_modifiers([100, 100, 100, 200]), (1.0, 2.0));
        let mut text = "|Hlink|h label|h |Ticon|t".to_string();
        sanitize_text(&mut text);
        assert_eq!(text, "||Hlink||h label||h ||Ticon||t");
        let mut utf8 = format!("{}é", "x".repeat(4095));
        sanitize_text(&mut utf8);
        assert_eq!(utf8.len(), 4095);
        let mut resources: Vec<_> = (0..513).map(|id| ResourceRow {
            id, name: "|Hname".into(), optional: [None, Some("|Ticon".into()), None, None],
            text_18: String::new(), text_30: String::new(),
        }).collect();
        sanitize_resources(&mut resources);
        assert_eq!(resources.len(), 512);
        let last = resources.last().unwrap();
        assert_eq!(last.id, 511);
        assert_eq!(last.name, "||Hname");
        assert_eq!(last.optional[1].as_deref(), Some("||Ticon"));
        let row = |value: f32| TimerRow {
            id: 1,
            value_bits: value.to_bits(),
            flag: true,
        };
        let mut checked = vec![row(-1.0), row(f32::NAN), row(25.0)];
        sanitize_timers(&mut checked);
        assert_eq!(
            checked
                .iter()
                .map(|r| f32::from_bits(r.value_bits))
                .collect::<Vec<_>>(),
            [0.1, 10.0]
        );
        let mut rows = vec![row(1.0); 513];
        rows[511] = row(f32::INFINITY);
        sanitize_timers(&mut rows);
        assert_eq!(rows.len(), 511);
        let mut invalid = vec![row(f32::NAN), row(f32::NEG_INFINITY)];
        sanitize_timers(&mut invalid);
        assert!(invalid.is_empty());
    }
}

/// Semantic spell tooltip projection of the native seven-string record.
/// Icons stay with the existing DBC spell entry identified by spell_id.
pub struct SpellTooltip<'a> {
    pub spell_id: u32,
    pub name: &'a str,
    pub description: &'a str,
    pub effect_description: &'a str,
    pub rank: Option<&'a str>,
    pub range: Option<&'a str>,
    pub automatic: Option<&'a str>,
    pub cooldown: Option<&'a str>,
}
impl ResourceRow {
    pub fn tooltip(&self) -> SpellTooltip<'_> {
        SpellTooltip {
            spell_id: self.id,
            name: &self.name,
            description: &self.text_18,
            effect_description: &self.text_30,
            rank: self.optional[0].as_deref(),
            range: self.optional[1].as_deref(),
            automatic: self.optional[2].as_deref(),
            cooldown: self.optional[3].as_deref(),
        }
    }
}

/// Native tag13 admission counts accepted rows cumulatively for one zone.
/// The caller supplies the real current class/zone equipment catalog; retaining
/// input order, duplicate rows and boss keys matches current145d0e000.
/// The attached base award is finite/clamped before recipient accounting.
pub fn accept_equipment_grants(
    rows: Vec<super::replication::EquipmentGrant>,
    allowed_ids: &[u32],
    accepted_this_zone: &mut usize,
) -> Vec<super::replication::EquipmentGrant> {
    let result = rows
        .into_iter()
        .filter(|row| allowed_ids.contains(&row.item_id))
        .map(|mut row| {
            let marks = f32::from_bits(row.boss_marks_bits);
            row.boss_marks_bits = if marks.is_finite() { marks.clamp(0.0, 400.0) } else { 0.0 }.to_bits();
            row
        })
        .take(16)
        .take(64_usize.saturating_sub(*accepted_this_zone))
        .collect::<Vec<_>>();
    *accepted_this_zone += result.len();
    result
}

/// Current145b4b4c0 and145b36d63 validate the private mark/pity award.
/// Pity rows retain order/duplicates and have a per-packet16-row budget.
pub fn accept_marks_and_pity(
    marks_bits: u32,
    ids: Vec<u32>,
    allowed_ids: &[u32],
    marks_received: &mut f32,
) -> (f32, Vec<u32>) {
    let marks = f32::from_bits(marks_bits);
    let marks = if marks.is_finite() { marks.clamp(0.0, 400.0) } else { 0.0 };
    let marks = marks.min((4000.0 - *marks_received).max(0.0));
    *marks_received += marks;
    let ids = ids.into_iter().filter(|id| allowed_ids.contains(id)).take(16).collect();
    (marks, ids)
}

const SEEN_PACKET_LIMIT: usize = 32;

/// Wire 14 keeps at most 32 valid discoveries per packet and 400 per zone.
pub fn accept_seen_grants(
    rows: Vec<(String, u8)>,
    mut recognized_key: impl FnMut(&str) -> bool,
    accepted_this_zone: &mut usize,
) -> Vec<(String, u8)> {
    let result = rows
        .into_iter()
        .filter(|(key, quality)| *quality <= 4 && recognized_key(key))
        .take(SEEN_PACKET_LIMIT)
        .take(400_usize.saturating_sub(*accepted_this_zone))
        .collect::<Vec<_>>();
    *accepted_this_zone += result.len();
    result
}

/// The native fixed class checks also accept two former Shaman legendaries
/// that the current Codex omits. The remaining accepted keys are Codex members.
pub fn recognized_seen_key(key: &str) -> bool {
    if matches!(key, "legendary:healing_wave" | "legendary:lightning_shield") {
        return true;
    }
    static CODEX_KEYS: std::sync::OnceLock<Vec<&'static str>> = std::sync::OnceLock::new();
    let keys = CODEX_KEYS.get_or_init(|| {
        let mut keys = crate::loot_rewards::codex_keys().collect::<Vec<_>>();
        keys.sort_unstable();
        keys
    });
    keys.binary_search(&key).is_ok()
}
