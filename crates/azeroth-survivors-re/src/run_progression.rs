//! Terminal arithmetic with the 0.121.0 Heroic reward consumer.
//! See docs/analysis/heroic-rewards-0.121.0.md. Historical seven-part and perk
//! proofs retain the target named in achievement-grants-0.112.0.md.
//! No save or menu dependency is required.

/// 0.127.0 run level cap (XP145c2b58e, recipient validation145b52b1a).
/// Account talent ranks and their XP remain an independent domain.
pub const RUN_LEVEL_CAP: u32 = 120;

#[derive(Clone, Debug, PartialEq)]
pub struct RunResult {
    pub class: u8,
    pub zone_key: &'static str,
    pub counts: [u32; 5],
    pub won: bool,
    pub talent_xp: u32,
    pub level: u32,
    pub seconds: u32,
}

/// One account transaction projected from cumulative terminal counters. Queries
/// do not acknowledge it; its owner advances snapshots only after saving it.
#[derive(Clone, Debug, PartialEq)]
pub struct TerminalDelivery {
    pub result: RunResult,
    pub delta_counts: [u32; 5],
    pub xp_parts: [i64; 7],
    pub delta_xp_parts: [i64; 7],
    pub talent_xp: u32,
    pub first_result: bool,
}
/// Historical0.100.1:14547ede0 projects the other saved ranks into run configuration.
/// Current0.112.0:1459b70c0 compares selected XP with the highest of nine classes
/// for Veteran; run-entry1458bff32 separately excludes the transient Tester.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AccountGrants {
    pub free_rerolls: u32,
    pub banishes: u32,
    pub skip: bool,
    pub opening: bool,
    pub equipment_chance: f32,
    pub veteran_bonus: f32,
    pub cooperative_luck: f32,
}
impl Default for AccountGrants {
    fn default() -> Self {
        Self {
            free_rerolls: 3,
            banishes: 0,
            skip: false,
            opening: false,
            equipment_chance: 0.0,
            veteran_bonus: 0.0,
            cooperative_luck: 0.0,
        }
    }
}
pub fn account_grants(
    class: u8,
    mut perk: impl FnMut(&str) -> u8,
    mut experience: impl FnMut(u8) -> u32,
) -> AccountGrants {
    let veteran = perk("veteran");
    let selected = experience(class);
    let highest = [1, 2, 3, 4, 5, 7, 8, 9, 11]
        .into_iter()
        .map(&mut experience)
        .max()
        .unwrap_or(0);
    AccountGrants {
        free_rerolls: 3 + u32::from(perk("rerolls")),
        banishes: u32::from(perk("banish")),
        skip: perk("skip") != 0,
        opening: perk("opening") != 0,
        equipment_chance: f32::from(perk("keen")) * 0.05,
        veteran_bonus: if veteran != 0 && selected < highest {
            f32::from(veteran) * 0.2
        } else {
            0.0
        },
        cooperative_luck: 0.0,
    }
}

/// 0.117.0 Save grant producer: an earned `coop:team` contributes this f32.
/// The live stat consumer separately requires cooperative mode.
pub fn cooperative_luck(earned: bool) -> f32 {
    if earned { 0.1 } else { 0.0 }
}
/// Historical0.112.0 1458ba062 parts, in serialized order: time, kills, bosses, victory,
/// zone, run options, veteran. Keep f32 operation order before each roundf;
/// zone is the residual after rounding, rather than independently rounded XP.
pub fn talent_experience_parts(
    kills: u32,
    bosses: u32,
    seconds: f32,
    won: bool,
    zone: usize,
    mods: [u16; 4],
    veteran_bonus: f32,
) -> [i64; 7] {
    let density = f32::from(mods[0]) / 100.0;
    let option = ((f32::from(mods[0]) - 100.0) / 100.0) * 0.05;
    let option = ((f32::from(mods[1]) - 100.0) / 100.0) * 0.4 + option;
    let option = ((f32::from(mods[2]) - 100.0) / 100.0) * 0.6 + option;
    let option = ((f32::from(mods[3]) - 100.0) / 100.0) * 2.0 + option;
    let option = (option + 1.0).min(2.0);
    talent_experience_parts_with_multipliers(kills, bosses, seconds, won, zone, density, option, veteran_bonus)
}

/// Current0.121.0 summary145b28410 uses raw kills and the captured Heroic
/// rank. Its consumer clamps the byte rank to V before reading reward+44.
/// The seven signed parts and subsequent Veteran calculation keep their order.
pub fn talent_experience_parts_heroic(
    kills: u32, bosses: u32, seconds: f32, won: bool, zone: usize,
    rank: u8, veteran_bonus: f32,
) -> [i64; 7] {
    // Scholomance sits between Blackrock Mountain and Ahn'Qiraj in the
    // 0.143.0 table. Its half step leaves Ahn'Qiraj and Naxxramas at 10/11.
    let zone_weight = match zone {
        0..=9 => zone as f32,
        10 => 9.5,
        11 => 10.0,
        _ => 11.0,
    };
    talent_experience_parts_for_zone_weight(kills, bosses, seconds, won, zone_weight,
        1.0, crate::heroic::reward_multiplier(rank.min(5)), veteran_bonus)
}

/// Shared seven-part arithmetic. Historical State15 callers supplied two
/// computed multipliers; current Heroic callers supply raw-kill density one
/// and the rank reward. This helper does not infer a current wire schema.
pub fn talent_experience_parts_with_multipliers(
    kills: u32, bosses: u32, seconds: f32, won: bool, zone: usize,
    density: f32, reward: f32, veteran_bonus: f32,
) -> [i64; 7] {
    talent_experience_parts_for_zone_weight(kills, bosses, seconds, won, zone as f32,
        density, reward, veteran_bonus)
}

fn talent_experience_parts_for_zone_weight(
    kills: u32, bosses: u32, seconds: f32, won: bool, zone_weight: f32,
    density: f32, reward: f32, veteran_bonus: f32,
) -> [i64; 7] {
    let normalized = (kills as f32 / density) as u32;
    let raw_kills = normalized as f32 * 0.1;
    let raw_time = (seconds / 60.0) * 12.0;
    let raw_bosses = bosses as f32 * 40.0;
    let raw_victory = if won { 200.0 } else { 0.0 };
    let zone = 1.0 + (zone_weight * 1.6) / 11.0;
    let base = (zone * ((raw_bosses + (raw_time + raw_kills)) + raw_victory)).round() as u32;
    let time = raw_time.round() as i64;
    let kills = raw_kills.round() as i64;
    let bosses = i64::from(bosses) * 40;
    let victory = i64::from(won) * 200;
    let first_four = time
        .wrapping_add(kills)
        .wrapping_add(bosses)
        .wrapping_add(victory);
    let zone = i64::from(base).wrapping_sub(first_four);
    let options = ((reward - 1.0) * base as f32).round() as i64;
    let ordinary = i64::from(base).wrapping_add(options);
    let veteran = (ordinary as f32 * veteran_bonus).round() as i64;
    [time, kills, bosses, victory, zone, options, veteran]
}

///1458ba3f5..4af wraps the signed part sum, clamps negative XP to zero, then keeps
/// the low32 bits. This is also the account delta conversion during endless.
pub fn talent_experience_total(parts: [i64; 7]) -> u32 {
    parts.into_iter().fold(0_i64, i64::wrapping_add).max(0) as u32
}

pub fn talent_experience(
    kills: u32,
    bosses: u32,
    seconds: f32,
    won: bool,
    zone: usize,
    mods: [u16; 4],
    veteran_bonus: f32,
) -> u32 {
    talent_experience_total(talent_experience_parts(
        kills,
        bosses,
        seconds,
        won,
        zone,
        mods,
        veteran_bonus,
    ))
}
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn current_heroic_xp_preserves_zone_weights_after_scholomance_insertion() {
        for (zone, zone_xp) in [(9, 144), (10, 152), (11, 160), (12, 176)] {
            let parts = talent_experience_parts_heroic(0, 0, 550.0, false, zone, 0, 0.0);
            assert_eq!(parts, [110, 0, 0, 0, zone_xp, 0, 0]);
        }
    }

    #[test]
    fn host_transmitted_factors_determine_guest_components() {
        assert_eq!(talent_experience_parts_with_multipliers(100,1,60.,true,0,2.,1.5,0.4),
            [12,5,40,200,0,129,154]);
    }
    #[test]
    fn terminal_parts_preserve_native_order_and_rounded_zone_residual() {
        assert_eq!(
            talent_experience_parts(100, 1, 60.0, false, 0, [100; 4], 0.0),
            [12, 10, 40, 0, 0, 0, 0]
        );
        assert_eq!(
            talent_experience_parts(5, 0, 2.5, false, 0, [100; 4], 0.0),
            [1, 1, 0, 0, -1, 0, 0]
        );
        assert_eq!(
            talent_experience_parts(100, 1, 60.0, true, 0, [100, 300, 300, 300], 0.4),
            [12, 10, 40, 200, 0, 262, 210]
        );
    }

    // Native instruction replay fixture cases in terminal/native-fixtures.json.
    // These reachable option values expose f32 addition order before roundf.
    #[test]
    fn terminal_parts_follow_native_float_order_at_reachable_modifiers() {
        assert_eq!(
            talent_experience_parts(0, 0, 375.0, false, 0, [100, 125, 110, 125], 0.0),
            [75, 0, 0, 0, 0, 49, 0]
        );
        assert_eq!(
            talent_experience_parts(0, 0, 125.0, false, 0, [100, 125, 120, 110], 0.0),
            [25, 0, 0, 0, 0, 11, 0]
        );
    }

    #[test]
    fn terminal_xp_wraps_signed_parts_before_clamping_and_narrowing() {
        assert_eq!(talent_experience_total([-1, 0, 0, 0, 0, 0, 0]), 0);
        assert_eq!(talent_experience_total([i64::MAX, 1, 0, 0, 0, 0, 0]), 0);
        assert_eq!(
            talent_experience_total([i64::from(u32::MAX) + 2, 0, 0, 0, 0, 0, 0]),
            1
        );
        assert_eq!(
            talent_experience(100, 1, 60.0, false, 0, [100, 100, 100, 0], 0.0),
            0,
            "negative run-option XP is clamped after the signed sum"
        );
    }

    #[test]
    fn density_normalization_precedes_kill_conversion_and_options_cap() {
        assert_eq!(talent_experience(100, 1, 60.0, false, 0, [100; 4], 0.0), 62);
        assert_eq!(
            talent_experience(100, 1, 60.0, false, 0, [200, 100, 100, 100], 0.0),
            60
        );
        assert_eq!(
            talent_experience(100, 1, 60.0, true, 0, [100, 300, 300, 300], 0.0),
            524
        );
        assert_eq!(
            talent_experience(100, 1, 60.0, false, 11, [100; 4], 0.0),
            161
        );
        assert_eq!(talent_experience(100, 1, 60.0, false, 0, [100; 4], 0.4), 87);
    }
    #[test]
    fn veteran_is_only_for_classes_below_the_current_best() {
        let perk = |key: &str| match key {
            "veteran" => 2,
            "rerolls" => 3,
            "banish" => 2,
            "keen" => 2,
            "skip" | "opening" => 1,
            _ => 0,
        };
        let xp = |class| if class == 1 { 100 } else { 20 };
        let grants = account_grants(2, perk, xp);
        assert_eq!(
            grants,
            AccountGrants {
                free_rerolls: 6,
                banishes: 2,
                skip: true,
                opening: true,
                equipment_chance: 0.1,
                veteran_bonus: 0.4,
                cooperative_luck: 0.0,
            }
        );
        assert_eq!(account_grants(1, perk, xp).veteran_bonus, 0.0);
        assert_eq!(account_grants(2, |_| 0, |_| 0).free_rerolls, 3);
    }
}
