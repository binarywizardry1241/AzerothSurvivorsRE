//! Embedding-owned spell-radius overrides. Ordinary clients have an empty map.
use bevy::prelude::*;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LocalSpellScale {
    pub spell_id: u32,
    pub scale: f32,
    pub attached: bool,
}

#[derive(Resource, Default)]
pub struct LocalSpellScales(pub Vec<LocalSpellScale>);

impl LocalSpellScales {
    /// 1407e00a0: absent, nonpositive and unordered scales are rejected.
    pub(crate) fn get(&self, spell_id: u32, ground: bool) -> Option<f32> {
        self.0
            .iter()
            .find(|row| row.spell_id == spell_id)
            .filter(|row| (ground || row.attached) && row.scale > 0.0)
            .map(|row| row.scale)
    }
}

pub(crate) fn ground_scale(scale: Option<f32>) -> f32 {
    scale.filter(|value| *value > 0.0).unwrap_or(1.0)
}

pub(crate) fn shard_density(scale: f32) -> f32 {
    let squared = scale * scale;
    if squared < 4.0 { squared } else { 4.0 }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn ground_admission_and_density_preserve_native_boundaries() {
        for scale in [None, Some(0.0), Some(-1.0), Some(f32::NAN)] {
            assert_eq!(ground_scale(scale), 1.0);
        }
        for (scale, density) in [(0.5, 0.25), (2.0, 4.0), (4.0, 4.0), (8.0, 4.0)] {
            assert_eq!(ground_scale(Some(scale)), scale);
            assert_eq!(shard_density(scale), density);
        }
    }
    #[test]
    fn the_attached_flag_and_positive_scale_gate_are_independent() {
        let rows = LocalSpellScales(vec![LocalSpellScale {
            spell_id: 10,
            scale: 2.0,
            attached: false,
        }]);
        assert_eq!(rows.get(10, true), Some(2.0));
        assert_eq!(rows.get(10, false), None);
        assert_eq!(rows.get(11, true), None);
    }
}
