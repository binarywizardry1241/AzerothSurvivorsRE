//! Selected 0.105.0 visual-radius publication (145924e50), separate from damage.
use super::RuntimeInstance;
use crate::bosses::abilities::native_spell_radius;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SpellScale {
    pub spell_id: u32,
    pub scale: f32,
    /// Native kind8 entries may also scale attached kits.
    pub attached: bool,
}

/// The caller supplies native order: learned, racial, then auxiliary instances.
/// The first recognized spell wins, including when definitions share an ID.
pub fn collect<'a, 'd: 'a>(
    instances: impl IntoIterator<Item = &'a RuntimeInstance<'d>>,
    global_area: f32,
) -> Vec<SpellScale> {
    collect_with_log1p(instances, global_area, f32::ln_1p)
}

pub fn collect_with_log1p<'a, 'd: 'a>(
    instances: impl IntoIterator<Item = &'a RuntimeInstance<'d>>,
    global_area: f32,
    mut log1p: impl FnMut(f32) -> f32,
) -> Vec<SpellScale> {
    let mut rows: Vec<SpellScale> = Vec::new();
    for instance in instances {
        let definition = instance.definition;
        let Some(base) = native_spell_radius(definition.spell_id) else {
            continue;
        };
        if rows.iter().any(|row| row.spell_id == definition.spell_id) {
            continue;
        }
        let attached = definition.kind == 8;
        let radius = if attached {
            definition.range
        } else {
            definition.radius
        };
        let radius = instance.area_multiplier * instance.talent_area_multiplier * radius;
        let radius = radius * global_area;
        let radius = if radius > 70.0 {
            log1p((radius - 70.0) / 10.0) * 10.0 + 70.0
        } else {
            radius
        };
        rows.push(SpellScale {
            spell_id: definition.spell_id,
            scale: radius / base,
            attached,
        });
    }
    rows
}
