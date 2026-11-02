//! Complete current0.109.0 recurring boss schedules and health phases.
//! Generated semantic connections are not the native48-byte ability ABI.
//! Native input graph: docs/analysis/evidence/0.109.0/raid-native/catalog.json.
//! Summon phases retain their existing public helper and shared original latch.
//! Compilation, gameplay and native parity remain unverified.

use super::RawBossAbility;

#[derive(Clone, Copy, Debug)]
pub struct ScheduledMove {
    pub native_slot: u8,
    pub native_tag: u8,
    pub ability: RawBossAbility,
}

#[derive(Clone, Copy, Debug)]
pub struct BossSchedule {
    pub boss_id: u32,
    pub moves: &'static [ScheduledMove],
}

/// Current recovered phase records retain their index in the complete native
/// phase list, so they share the existing once-per-instance latch bits.
#[derive(Clone, Copy, Debug)]
pub struct RaidPhase {
    pub boss_id: u32,
    pub phase_index: u8,
    pub threshold: f32,
    pub yell: &'static str,
    pub native_tag: u8,
    pub ability: RawBossAbility,
}

#[rustfmt::skip]
pub const CURRENT_PHASES: &[RaidPhase] = &[
// BEGIN CURRENT RAID PHASES
    RaidPhase { boss_id: 690, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "Hogger is enraged! Grrrr!", native_tag: 19, ability: RawBossAbility { words: [0x00000011, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 693, phase_index: 0, threshold: f32::from_bits(0x3f28f5c3), yell: "You landlubbers are tougher than I thought! I'll have to improvise!", native_tag: 0, ability: RawBossAbility { words: [0x00000012, 0x00000016, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 693, phase_index: 1, threshold: f32::from_bits(0x3ea8f5c3), yell: "D'ah! Now you're making me angry!", native_tag: 0, ability: RawBossAbility { words: [0x00000012, 0x00000017, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 694, phase_index: 1, threshold: f32::from_bits(0x3e800000), yell: "The Brotherhood shall prevail!", native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000021, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 794, phase_index: 0, threshold: f32::from_bits(0x3ecccccd), yell: "Rise, servants of darkness!", native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000003d, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 193, phase_index: 0, threshold: f32::from_bits(0x3e99999a), yell: "All mortals will perish!", native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000054, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1294, phase_index: 0, threshold: f32::from_bits(0x3ecccccd), yell: "King Mosh roars, and the crater shakes!", native_tag: 17, ability: RawBossAbility { words: [0x00000011, 0x0000006c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1294, phase_index: 1, threshold: f32::from_bits(0x3f333333), yell: "The crater erupts around you!", native_tag: 28, ability: RawBossAbility { words: [0x0000000b, 0x00004cef, 0x41600000, 0x40000000, 0x40c00000, 0x3f000000, 0x00000000] } },
    RaidPhase { boss_id: 1594, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "Kneel before your rightful lord!", native_tag: 12, ability: RawBossAbility { words: [0x0000000d, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1594, phase_index: 1, threshold: f32::from_bits(0x3f400000), yell: "Guards! Protect your lord!", native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 891, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "The beast within awakens!", native_tag: 0, ability: RawBossAbility { words: [0x00000012, 0x00000091, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 991, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "Let the coils of hate unfurl!", native_tag: 0, ability: RawBossAbility { words: [0x00000012, 0x000000b0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1391, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "Burn in righteous fire!", native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x000000cd, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1393, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "You will not have my life so easily!", native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x000000d9, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 393, phase_index: 0, threshold: f32::from_bits(0x3ecccccd), yell: "Such is the price of curiosity!", native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x000000fa, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1090, phase_index: 0, threshold: f32::from_bits(0x3ecccccd), yell: "Alarms! Alarms! Intruders in the halls!", native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000101, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1091, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "I'll crush you myself!", native_tag: 0, ability: RawBossAbility { words: [0x00000012, 0x0000010a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1093, phase_index: 1, threshold: f32::from_bits(0x3f400000), yell: "Flamewakers, shield your master!", native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1094, phase_index: 0, threshold: f32::from_bits(0x3f19999a), yell: "Let the games begin!", native_tag: 17, ability: RawBossAbility { words: [0x00000011, 0x00000121, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1192, phase_index: 0, threshold: f32::from_bits(0x3e99999a), yell: "Princess Huhuran goes into a berserker rage!", native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000130, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1491, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "Rise, my soldiers! Rise and fight once more!", native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000014b, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1493, phase_index: 0, threshold: f32::from_bits(0x3f000000), yell: "Sapphiron lifts off into the air!", native_tag: 12, ability: RawBossAbility { words: [0x0000000d, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1494, phase_index: 0, threshold: f32::from_bits(0x3f333333), yell: "Your soul is bound to me now!", native_tag: 17, ability: RawBossAbility { words: [0x00000011, 0x00000160, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
    RaidPhase { boss_id: 1494, phase_index: 2, threshold: f32::from_bits(0x3e800000), yell: "Enough! I tire of these distractions!", native_tag: 12, ability: RawBossAbility { words: [0x0000000d, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000] } },
// END CURRENT RAID PHASES
];

#[rustfmt::skip]
pub const CURRENT_SCHEDULES: &[BossSchedule] = &[
// BEGIN CURRENT RAID SCHEDULES
    BossSchedule { boss_id: 690, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 1, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 691, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00000153, 0x41000000, 0x3f99999a, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 2, native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41900000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41800000] } },
    ] },
    BossSchedule { boss_id: 692, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 693, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00001920, 0x41100000, 0x3fe66666, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 694, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000001c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 1, native_tag: 3, ability: RawBossAbility { words: [0x00000005, 0x0000166c, 0x000035f4, 0x41100000, 0x3fc00000, 0x40266666, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000001e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 790, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00000153, 0x41000000, 0x3f99999a, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000023, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41880000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
    ] },
    BossSchedule { boss_id: 791, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 14, ability: RawBossAbility { words: [0x00000011, 0x00000027, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 2, native_tag: 24, ability: RawBossAbility { words: [0x00000010, 0x00000028, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
    ] },
    BossSchedule { boss_id: 792, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40c00000] } },
        ScheduledMove { native_slot: 1, native_tag: 27, ability: RawBossAbility { words: [0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 2, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x000018c7, 0x41100000, 0x3fe66666, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 793, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000031, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 1, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00001fba, 0x41200000, 0x3fcccccd, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 794, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x00000037, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000038, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 25, ability: RawBossAbility { words: [0x00000011, 0x00000039, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 190, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 31, ability: RawBossAbility { words: [0x00000011, 0x0000003e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x0000003f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
    ] },
    BossSchedule { boss_id: 191, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x0000079d, 0x41100000, 0x3fc00000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41900000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
    ] },
    BossSchedule { boss_id: 192, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x00000045, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 30, ability: RawBossAbility { words: [0x0000000c, 0x00004ffb, 0x40e00000, 0x40a00000, 0x3fe66666, 0x41700000, 0x41600000] } },
        ScheduledMove { native_slot: 2, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 194, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x40900000] } },
        ScheduledMove { native_slot: 1, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000004d, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 193, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x40900000] } },
        ScheduledMove { native_slot: 1, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000051, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 30, ability: RawBossAbility { words: [0x0000000c, 0x00005240, 0x40e00000, 0x40a00000, 0x3fe66666, 0x41900000, 0x41900000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1290, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000057, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000058, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
    ] },
    BossSchedule { boss_id: 1291, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x0000005b, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 2, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 1292, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00001b05, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000061, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 2, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x00000062, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 1293, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
        ScheduledMove { native_slot: 1, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 1294, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 27, ability: RawBossAbility { words: [0x00000008, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 2, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40c00000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
    ] },
    BossSchedule { boss_id: 1590, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000009, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x0000006f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 1591, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000071, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 1, native_tag: 14, ability: RawBossAbility { words: [0x00000011, 0x00000072, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 2, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 1592, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000074, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000075, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 24, ability: RawBossAbility { words: [0x00000010, 0x00000076, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 1593, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000007a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 1, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00000690, 0x41200000, 0x40000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 2, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
    ] },
    BossSchedule { boss_id: 1594, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 2, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000080, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 3, native_tag: 13, ability: RawBossAbility { words: [0x00000011, 0x00000081, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 890, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x00000086, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 2, native_tag: 25, ability: RawBossAbility { words: [0x00000011, 0x00000087, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 891, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 3, ability: RawBossAbility { words: [0x00000005, 0x00004212, 0x00000153, 0x41100000, 0x3fcccccd, 0x400ccccd, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 3, ability: RawBossAbility { words: [0x00000005, 0x00000000, 0x00000153, 0x40c00000, 0x40333333, 0x40000000, 0x41400000] } },
        ScheduledMove { native_slot: 2, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00001438, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 892, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x000015c0, 0x41200000, 0x40000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 9, ability: RawBossAbility { words: [0x00000011, 0x00000093, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 2, native_tag: 3, ability: RawBossAbility { words: [0x00000005, 0x00004212, 0x00000153, 0x41200000, 0x3fc00000, 0x400ccccd, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 893, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x40900000] } },
        ScheduledMove { native_slot: 1, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00003cbe, 0x41200000, 0x3fe66666, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 24, ability: RawBossAbility { words: [0x00000010, 0x00000098, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 894, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 1, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000009d, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 2, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x0000000b, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40c00000] } },
        ScheduledMove { native_slot: 3, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x0000009f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 4, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 5, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 990, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000085, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x000000a4, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 29, ability: RawBossAbility { words: [0x00000011, 0x000000a5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
        ScheduledMove { native_slot: 3, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00005d6e, 0x41100000, 0x3fcccccd, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 991, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000193, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x000000a9, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 27, ability: RawBossAbility { words: [0x00000008, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 992, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 14, ability: RawBossAbility { words: [0x00000011, 0x000000b2, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 26, ability: RawBossAbility { words: [0x00000011, 0x000000b3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 993, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x000000b6, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41e00000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 994, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00001fba, 0x41300000, 0x40000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 2, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x000000bb, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 3, native_tag: 16, ability: RawBossAbility { words: [0x00000011, 0x000000bc, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
        ScheduledMove { native_slot: 4, native_tag: 25, ability: RawBossAbility { words: [0x00000011, 0x000000bd, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41900000] } },
        ScheduledMove { native_slot: 5, native_tag: 12, ability: RawBossAbility { words: [0x0000000d, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41c00000] } },
        ScheduledMove { native_slot: 6, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
    ] },
    BossSchedule { boss_id: 1390, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x000000c2, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 1, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 2, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
    ] },
    BossSchedule { boss_id: 1391, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000085, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x000005a9, 0x41200000, 0x3fe66666, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x000000c9, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 1392, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x0000000d, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40c00000] } },
        ScheduledMove { native_slot: 1, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 14, ability: RawBossAbility { words: [0x00000011, 0x000000d0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 1393, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x000000d4, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x0000000e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1394, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00001c65, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 17, ability: RawBossAbility { words: [0x00000011, 0x000000db, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
        ScheduledMove { native_slot: 2, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x000000dc, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 3, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x000000dd, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41800000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
    ] },
    BossSchedule { boss_id: 390, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 14, ability: RawBossAbility { words: [0x00000011, 0x000000e1, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 2, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x0000000f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 391, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 3, ability: RawBossAbility { words: [0x00000005, 0x00004212, 0x00000153, 0x41100000, 0x3fcccccd, 0x400ccccd, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00001438, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 2, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x000000e6, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
        ScheduledMove { native_slot: 3, native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41980000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 392, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x000000e9, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 13, ability: RawBossAbility { words: [0x00000011, 0x000000ea, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 2, native_tag: 24, ability: RawBossAbility { words: [0x00000010, 0x000000eb, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 3, native_tag: 17, ability: RawBossAbility { words: [0x00000011, 0x000000ec, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 394, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000011, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 28, ability: RawBossAbility { words: [0x0000000b, 0x0000000a, 0x41500000, 0x40000000, 0x40c00000, 0x3f000000, 0x41800000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 393, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000074, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000012, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x000000f6, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 27, ability: RawBossAbility { words: [0x00000008, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41800000] } },
        ScheduledMove { native_slot: 4, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x000000f8, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 5, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1090, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 14, ability: RawBossAbility { words: [0x00000011, 0x000000fc, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000013, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 1091, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000014, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 15, ability: RawBossAbility { words: [0x00000011, 0x00000103, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 2, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000015, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 1092, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000085, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x0000010c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 13, ability: RawBossAbility { words: [0x00000011, 0x0000010d, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 16, ability: RawBossAbility { words: [0x00000011, 0x0000010e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 4, native_tag: 22, ability: RawBossAbility { words: [0x0000000f, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41a00000] } },
        ScheduledMove { native_slot: 5, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 1093, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000085, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000114, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 27, ability: RawBossAbility { words: [0x00000008, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 3, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000116, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1094, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000016, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 2, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000011e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 29, ability: RawBossAbility { words: [0x00000011, 0x0000011f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41800000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
    ] },
    BossSchedule { boss_id: 1190, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x00000123, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000124, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 2, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
    ] },
    BossSchedule { boss_id: 1191, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x00000017, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 1, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000018, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1192, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000065c5, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x00000019, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x0000012e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1193, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 23, ability: RawBossAbility { words: [0x0000000e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41f00000] } },
        ScheduledMove { native_slot: 1, native_tag: 33, ability: RawBossAbility { words: [0x00000011, 0x00000132, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41700000] } },
        ScheduledMove { native_slot: 2, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00006264, 0x41200000, 0x400ccccd, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 3, native_tag: 24, ability: RawBossAbility { words: [0x00000010, 0x00000134, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1194, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000009, 0x00000000, 0x00000000, 0x00000000, 0x40900000] } },
        ScheduledMove { native_slot: 1, native_tag: 17, ability: RawBossAbility { words: [0x00000011, 0x00000137, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 2, native_tag: 6, ability: RawBossAbility { words: [0x00000006, 0x00001fba, 0x41400000, 0x400ccccd, 0x00000000, 0x00000000, 0x41100000] } },
        ScheduledMove { native_slot: 3, native_tag: 31, ability: RawBossAbility { words: [0x00000011, 0x00000139, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41600000] } },
        ScheduledMove { native_slot: 4, native_tag: 15, ability: RawBossAbility { words: [0x00000011, 0x0000013a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41a00000] } },
        ScheduledMove { native_slot: 5, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
    ] },
    BossSchedule { boss_id: 1490, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 9, ability: RawBossAbility { words: [0x00000011, 0x0000013f, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 1, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000140, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
        ScheduledMove { native_slot: 2, native_tag: 14, ability: RawBossAbility { words: [0x00000011, 0x00000141, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41800000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
    ] },
    BossSchedule { boss_id: 1491, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x000002ae, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 3, ability: RawBossAbility { words: [0x00000005, 0x0000000a, 0x0000007a, 0x41100000, 0x3fc00000, 0x40200000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x00000147, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1492, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 8, ability: RawBossAbility { words: [0x0000000a, 0x0000001a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 1, native_tag: 9, ability: RawBossAbility { words: [0x00000011, 0x0000014d, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 2, native_tag: 19, ability: RawBossAbility { words: [0x0000000a, 0x0000001b, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41300000] } },
        ScheduledMove { native_slot: 3, native_tag: 7, ability: RawBossAbility { words: [0x00000009, 0x00000064, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1493, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 10, ability: RawBossAbility { words: [0x00000011, 0x00000151, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41000000] } },
        ScheduledMove { native_slot: 1, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000074, 0x00000007, 0x00000000, 0x00000000, 0x00000000, 0x40a00000] } },
        ScheduledMove { native_slot: 2, native_tag: 25, ability: RawBossAbility { words: [0x00000011, 0x00000153, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41800000] } },
        ScheduledMove { native_slot: 3, native_tag: 12, ability: RawBossAbility { words: [0x0000000d, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41c00000] } },
        ScheduledMove { native_slot: 4, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41400000] } },
    ] },
    BossSchedule { boss_id: 1494, moves: &[
        ScheduledMove { native_slot: 0, native_tag: 4, ability: RawBossAbility { words: [0x00000001, 0x00000074, 0x00000009, 0x00000000, 0x00000000, 0x00000000, 0x40900000] } },
        ScheduledMove { native_slot: 1, native_tag: 11, ability: RawBossAbility { words: [0x00000011, 0x0000015a, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x40e00000] } },
        ScheduledMove { native_slot: 2, native_tag: 18, ability: RawBossAbility { words: [0x00000010, 0x0000015b, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
        ScheduledMove { native_slot: 3, native_tag: 16, ability: RawBossAbility { words: [0x00000011, 0x0000015c, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41500000] } },
        ScheduledMove { native_slot: 4, native_tag: 3, ability: RawBossAbility { words: [0x00000005, 0x00000000, 0x00006ca2, 0x40a00000, 0x40333333, 0x40400000, 0x41700000] } },
        ScheduledMove { native_slot: 5, native_tag: 30, ability: RawBossAbility { words: [0x0000000c, 0x00006cab, 0x40e00000, 0x40a00000, 0x40000000, 0x41a00000, 0x41800000] } },
        ScheduledMove { native_slot: 6, native_tag: 5, ability: RawBossAbility { words: [0x00000002, 0x0000000e, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x41200000] } },
    ] },
// END CURRENT RAID SCHEDULES
];

pub fn current_schedule(boss_id: u32) -> Option<&'static BossSchedule> {
    CURRENT_SCHEDULES.iter().find(|row| row.boss_id == boss_id)
}

#[derive(Clone, Debug, Default, PartialEq)]
pub struct ScheduleState {
    pub cooldowns: Vec<f32>,
    pub replacement: Option<usize>,
}

impl ScheduleState {
    pub fn new(boss_id: u32) -> Self {
        Self { replacement: None, cooldowns: current_schedule(boss_id).map(|schedule| schedule.moves.iter()
            .map(|row| f32::from_bits(row.ability.words[6]) * 0.6).collect()).unwrap_or_default() }
    }

    /// Native0/1/2/32 replaces the active recurring list and initializes
    /// timers using repeat*.5+1, independently of constructor initial timers.
    pub fn replace_moves(&mut self, action_index: usize) {
        let row = super::raid_native_catalog::ACTIONS[action_index];
        self.replacement = Some(action_index);
        self.cooldowns = row.children.iter().map(|&index|
            super::raid_native_catalog::ACTIONS[index].repeat * 0.5 + 1.).collect();
    }

    /// Called after common actor admission and current phase requests. The
    /// current+48 cast deadline is separate from the actor+1c4 movement hold.
    /// Every timer is decremented; a blocked request keeps its overdue timer.
    /// One blocking circle per actor/tick is admitted in native slot order;
    /// minions do not consume that gate and still run during a cast deadline.
    pub fn advance(&mut self, boss_id: u32, elapsed: f32, enraged: bool,
        cast_active: bool) -> Vec<RawBossAbility> {
        self.advance_with_phases(boss_id, elapsed, enraged, cast_active, false)
    }

    pub fn advance_with_phases(&mut self, boss_id: u32, elapsed: f32, enraged: bool,
        cast_active: bool, blocking_queued: bool) -> Vec<RawBossAbility> {
        self.advance_with_phases_for_rank(boss_id, elapsed, enraged, cast_active, blocking_queued, 0)
    }

    pub fn advance_with_phases_for_rank(&mut self, boss_id: u32, elapsed: f32, enraged: bool,
        cast_active: bool, mut blocking_queued: bool, heroic_rank: u8) -> Vec<RawBossAbility> {
        let dynamic;
        let moves = if let Some(index) = self.replacement {
            dynamic = super::raid_native_catalog::ACTIONS[index].children.iter().enumerate().map(|(slot,&index)| {
                let action = super::raid_native_catalog::ACTIONS[index];
                ScheduledMove { native_slot: slot as u8, native_tag: action.native_tag, ability: action.ability }
            }).collect::<Vec<_>>();
            dynamic.as_slice()
        } else {
            let Some(schedule) = current_schedule(boss_id) else { return Vec::new() };
            schedule.moves
        };
        assert_eq!(self.cooldowns.len(), moves.len(), "native selected schedule bounds failure");
        let scale = crate::heroic::boss_repeat_factor(heroic_rank, enraged);
        let mut due = Vec::new();
        for (row, timer) in moves.iter().zip(&mut self.cooldowns) {
            *timer -= elapsed;
            if *timer <= 0.0 {
                let blocking = !crate::guardians::signatures::nonblocking(row.native_tag);
                if !blocking || (!cast_active && !blocking_queued) {
                    let repeat = f32::from_bits(row.ability.words[6]);
                    *timer = repeat * scale;
                    blocking_queued |= blocking;
                    due.push(row.ability);
                }
            }
        }
        due
    }
}
