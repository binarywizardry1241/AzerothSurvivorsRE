//! Native0/1/2/32 recurring-list replacement and UNIT presentation changes.
//! Current0.112.0 helper145915340 publishes display/scale/mount, equipment and
//! sheath fields; raid-hazards and raid-boss-lifecycle proofs own its contracts.
use super::raid_native_catalog::ACTIONS;

#[derive(Clone, Debug)]
pub struct TransformFields {
    pub display: u32,
    pub scale: f32,
    pub fields: Vec<(u16, u32)>,
}

pub fn raid_transform_fields(index: usize, base_display: u32, base_scale: f32) -> TransformFields {
    let action = ACTIONS[index];
    form_fields(&action.words[5..12], base_display, base_scale)
}

/// Current0.112.0 constructor14593b8f5 applies these forms before arrival
/// announcements. They do not cast, hold movement or replace recurring moves.
pub fn initial_boss_fields(boss_id: u32, base_display: u32, base_scale: f32) -> Option<TransformFields> {
    let descriptor = match boss_id {
        693 => [0, 0, 0, 1390, 0, 0, 0],
        1091 => [0, 1.0_f32.to_bits(), 9806, 0, 0, 0, 0],
        _ => return None,
    };
    Some(form_fields(&descriptor, base_display, base_scale))
}

fn form_fields(w: &[u32], base_display: u32, base_scale: f32) -> TransformFields {
    let display = if w[0] == 0 { base_display } else { w[0] };
    let requested = f32::from_bits(w[1]);
    let scale = if requested > 0. {
        requested
    } else {
        base_scale
    };
    let mut fields = vec![(131, display), (4, scale.to_bits()), (133, w[2])];
    for (slot, raw) in [
        (u64::from(w[3]) | (u64::from(w[4]) << 32)),
        (u64::from(w[5]) | (u64::from(w[6]) << 32)),
    ]
    .into_iter()
    .enumerate()
    {
        let variant = (raw >> 40) & 0xff;
        if variant == 2 {
            continue;
        }
        let item = raw as u32;
        let (info, flags) = if item == 0 {
            (0, 0)
        } else {
            (
                ((raw >> 24) as u32 & 0xff00)
                    | if variant & 1 == 0 {
                        0x0d01_0002
                    } else {
                        0x1101_0002
                    },
                if variant & 1 == 0 { 3 } else { 1 },
            )
        };
        fields.extend([
            (37 + slot as u16, item),
            (40 + slot as u16 * 2, info),
            (41 + slot as u16 * 2, flags),
        ]);
    }
    fields.push((164, u32::from(w[3] != 0 || w[5] != 0)));
    fields.sort_unstable_by_key(|&(field, _)| field);
    TransformFields {
        display,
        scale,
        fields,
    }
}
