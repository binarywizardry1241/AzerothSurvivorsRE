//! Native0/1/2/32 recurring-list replacement and UNIT presentation changes.
//! Current0.112.0 helper145915340 publishes display/scale/mount, equipment and
//! sheath fields; raid-hazards and raid-boss-lifecycle proofs own its contracts.
use super::raid_native_catalog::ACTIONS;

const KIRTONOS_HUMANOID: [u32; 7] = [0, 0, 0, 21341, 0x10a, 0, 0];
const KIRTONOS_WINGED: [u32; 7] = [7534, 1.6_f32.to_bits(), 0, 0, 0, 0, 0];

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum KirtonosForm {
    Humanoid,
    Winged,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum KirtonosBeat {
    Form(KirtonosForm),
    Attack(u8),
}

impl KirtonosForm {
    pub fn fields(self, base_display: u32, base_scale: f32) -> TransformFields {
        let descriptor = match self {
            Self::Humanoid => &KIRTONOS_HUMANOID,
            Self::Winged => &KIRTONOS_WINGED,
        };
        form_fields(descriptor, base_display, base_scale)
    }
}

#[derive(Clone, Copy, Debug, Default)]
pub struct KirtonosForms {
    winged_phase_started: bool,
    final_phase_started_at: Option<f32>,
    next_step: u32,
}

impl KirtonosForms {
    /// 0.140.0 phase callback 0x145eeb730 checks the final phase bit first.
    /// Its fixed loop at 0x147af3b4c advances one deadline per update.
    pub fn advance_beat(
        &mut self,
        health: f32,
        maximum_health: f32,
        now: f32,
    ) -> Option<KirtonosBeat> {
        if let Some(started_at) = self.final_phase_started_at {
            const OFFSETS: [f32; 6] = [5.0, 12.0, 20.0, 25.0, 32.0, 40.0];
            const BEATS: [KirtonosBeat; 6] = [
                KirtonosBeat::Attack(1),
                KirtonosBeat::Attack(2),
                KirtonosBeat::Form(KirtonosForm::Winged),
                KirtonosBeat::Attack(3),
                KirtonosBeat::Attack(4),
                KirtonosBeat::Form(KirtonosForm::Humanoid),
            ];
            let index = (self.next_step % 6) as usize;
            let deadline = (self.next_step / 6) as f32 * 42.0 + OFFSETS[index];
            if deadline <= now - started_at {
                self.next_step = self.next_step.wrapping_add(1);
                return Some(BEATS[index]);
            }
            return None;
        }
        let denominator = if maximum_health <= 1.0 {
            1.0
        } else {
            maximum_health
        };
        let fraction = health / denominator;
        if fraction <= 0.3 {
            self.final_phase_started_at = Some(now);
            Some(KirtonosBeat::Form(KirtonosForm::Humanoid))
        } else if !self.winged_phase_started && fraction <= 0.65 {
            self.winged_phase_started = true;
            Some(KirtonosBeat::Form(KirtonosForm::Winged))
        } else {
            None
        }
    }

    pub fn fixed_cycle(self) -> bool {
        self.final_phase_started_at.is_some()
    }

    pub fn advance(&mut self, health: f32, maximum_health: f32, now: f32) -> Option<KirtonosForm> {
        match self.advance_beat(health, maximum_health, now)? {
            KirtonosBeat::Form(form) => Some(form),
            KirtonosBeat::Attack(_) => None,
        }
    }
}

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

/// Native constructors apply these forms before arrival
/// announcements. They do not cast, hold movement or replace recurring moves.
pub fn initial_boss_fields(
    boss_id: u32,
    base_display: u32,
    base_scale: f32,
) -> Option<TransformFields> {
    let descriptor = match boss_id {
        693 => [0, 0, 0, 1390, 0, 0, 0],
        1091 => [0, 1.0_f32.to_bits(), 9806, 0, 0, 0, 0],
        // 0.140.0 constructor 0x145f58508 selects this appearance record.
        10506 => KIRTONOS_HUMANOID,
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn kirtonos_final_phase_wins_when_one_hit_crosses_both_thresholds() {
        let mut state = KirtonosForms::default();
        assert_eq!(
            state.advance(30.0, 100.0, 10.0),
            Some(KirtonosForm::Humanoid)
        );
        assert_eq!(state.advance_beat(70.0, 100.0, 14.99), None);
        assert_eq!(
            state.advance_beat(70.0, 100.0, 22.0),
            Some(KirtonosBeat::Attack(1))
        );
        assert_eq!(
            state.advance_beat(70.0, 100.0, 22.0),
            Some(KirtonosBeat::Attack(2))
        );
        assert_eq!(state.advance(70.0, 100.0, 30.0), Some(KirtonosForm::Winged));
        assert_eq!(
            state.advance_beat(70.0, 100.0, 35.0),
            Some(KirtonosBeat::Attack(3))
        );
        assert_eq!(
            state.advance_beat(70.0, 100.0, 42.0),
            Some(KirtonosBeat::Attack(4))
        );
        assert_eq!(
            state.advance(70.0, 100.0, 50.0),
            Some(KirtonosForm::Humanoid)
        );
        assert_eq!(
            state.advance_beat(70.0, 100.0, 57.0),
            Some(KirtonosBeat::Attack(1))
        );

        let mut state = KirtonosForms::default();
        assert_eq!(state.advance(65.0, 100.0, 1.0), Some(KirtonosForm::Winged));
        assert_eq!(state.advance(65.0, 100.0, 2.0), None);
    }
}
