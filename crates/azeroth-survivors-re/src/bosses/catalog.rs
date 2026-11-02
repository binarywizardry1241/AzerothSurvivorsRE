//! Canonical boss semantic headers, revalidated against installed0.109.0.
//! Current proof: docs/analysis/evidence/0.109.0/boss-inputs/manifest.json.
//! The live current action graph is owned by raid_area_catalog and
//! raid_native_catalog; old seven-word fixture abilities retain their provenance.
//! Normal builds require no EXE.
pub use crate::guardians::catalog::{BossDefinition, RawBossAbility, ZoneDefinition, ZONES};

pub fn boss_by_id(zone: &ZoneDefinition, id: u32) -> Option<&'static BossDefinition> {
    zone.bosses.iter().find(|boss| boss.id == id)
}

pub fn spawn_points(zone_key: &str) -> &'static [[f32; 2]] {
    match zone_key {
        "sm" => {
            const POINTS: &[[f32; 2]] = &[
                [f32::from_bits(0x44906000), f32::from_bits(0x44ae8000)],
                [f32::from_bits(0x448fc000), f32::from_bits(0x44b58000)],
                [f32::from_bits(0x448fc000), f32::from_bits(0x44a74000)],
                [f32::from_bits(0x44624000), f32::from_bits(0x44af0000)],
            ];
            POINTS
        },
        "naxx" => {
            const POINTS: &[[f32; 2]] = &[
                [f32::from_bits(0x456b499a), f32::from_bits(0xc59e9333)],
                [f32::from_bits(0x4569019a), f32::from_bits(0xc59dca66)],
                [f32::from_bits(0x45664666), f32::from_bits(0xc59e0b33)],
                [f32::from_bits(0x45653666), f32::from_bits(0xc5a08ccd)],
                [f32::from_bits(0x45677e66), f32::from_bits(0xc5a1559a)],
                [f32::from_bits(0x456a399a), f32::from_bits(0xc5a114cd)],
            ];
            POINTS
        },
        _ => &[],
    }
}
