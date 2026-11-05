//! Scripted encounter marker rows and their independent warning clock.
//! The 0.141.0 client decoder at 1400c1a30 shares the hzt clock, but keeps
//! each scripted part separate from the older marker IDs.
use azeroth_survivors_re::bosses::scripted_attack_geometry::Grid;
use azeroth_survivors_re::raid_markers::{self as native, smooth};
use serde_json::Value;
use std::collections::HashSet;

#[derive(Clone, Debug)]
pub(super) enum Shape {
    Circle {
        radius: f32,
    },
    Rect {
        length: f32,
        width: f32,
    },
    Cone {
        radius: f32,
        arc: f32,
    },
    Donut {
        inner: f32,
        outer: f32,
    },
    Capsule {
        length: f32,
        width: f32,
    },
    Sweep {
        length: f32,
        width: f32,
        span: [f32; 2],
    },
    Rotor {
        length: f32,
        width: f32,
        angles: [f32; 2],
    },
    Polygon(Vec<[f32; 2]>),
    Grid(Grid),
    Field {
        polygon: Vec<[f32; 2]>,
        square: [f32; 4],
        z_range: [f32; 2],
    },
}

pub(super) enum MovingFill {
    Preview(f32),
    Lead(f32),
    Active(f32),
}

#[derive(Clone, Debug)]
pub(super) struct Part {
    pub key: (u64, u8),
    pub shape: Shape,
    pub position: [f32; 3],
    pub angle: f32,
    pub revision: u64,
    color: [f32; 3],
    fill_start: f32,
    impact: f32,
    end: f32,
    fade: f32,
    safe: bool,
    tower: bool,
    tracked: bool,
    locked_at: Option<f32>,
    fade_end: Option<f32>,
    cancelled: bool,
    progress: f32,
}

fn number(value: &Value) -> f32 {
    value.as_f64().unwrap_or_default() as f32
}

fn numbers<const N: usize>(value: &Value) -> Option<[f32; N]> {
    let rows = value.as_array()?;
    if rows.len() != N {
        return None;
    }
    let array = std::array::from_fn(|i| number(&rows[i]));
    array.iter().all(|n| n.is_finite()).then_some(array)
}

fn grid_mask(value: &Value) -> Option<[u64; 2]> {
    let words = value.as_array()?;
    if words.len() > 2 {
        return None;
    }
    let mut mask = [0; 2];
    for (slot, value) in mask.iter_mut().zip(words) {
        let word = value.as_str()?;
        *slot = u64::from_str_radix(word.strip_prefix("0x").unwrap_or(word), 16).ok()?;
    }
    Some(mask)
}

impl Part {
    fn read(attack: u64, locked: bool, value: &Value, revision: u64) -> Option<Self> {
        let shape = match value["s"].as_str()? {
            "circle" => Shape::Circle {
                radius: number(&value["r"]),
            },
            "rect" => Shape::Rect {
                length: number(&value["len"]),
                width: number(&value["w"]),
            },
            "cone" => Shape::Cone {
                radius: number(&value["r"]),
                arc: number(&value["arc"]),
            },
            "donut" => Shape::Donut {
                inner: number(&value["inner"]),
                outer: number(&value["r"]),
            },
            "capsule" => Shape::Capsule {
                length: number(&value["len"]),
                width: number(&value["w"]),
            },
            "sweep" => Shape::Sweep {
                length: number(&value["len"]),
                width: number(&value["w"]),
                span: [number(&value["dx"]), number(&value["dy"])],
            },
            "rotor" => Shape::Rotor {
                length: number(&value["len"]),
                width: number(&value["w"]),
                angles: [number(&value["a0"]), number(&value["a1"])],
            },
            "poly" => Shape::Polygon(
                value["v"]
                    .as_array()
                    .map_or(&[][..], Vec::as_slice)
                    .chunks_exact(2)
                    .map(|point| [number(&point[0]), number(&point[1])])
                    .collect(),
            ),
            "grid" => {
                let rows = u8::try_from(value["rows"].as_u64()?).ok()?;
                let columns = u8::try_from(value["cols"].as_u64()?).ok()?;
                let pitch = number(&value["cell"]);
                let origin = [number(&value["bx"]), number(&value["by"])];
                let angle = number(&value["a"]);
                if rows == 0
                    || columns == 0
                    || u16::from(rows) * u16::from(columns) > 128
                    || pitch <= 0.0
                    || !pitch.is_finite()
                    || !angle.is_finite()
                    || !origin.iter().all(|coordinate| coordinate.is_finite())
                {
                    return None;
                }
                Shape::Grid(Grid {
                    origin,
                    angle,
                    pitch,
                    rows,
                    columns,
                    danger: grid_mask(&value["danger"])?,
                    valid: grid_mask(&value["valid"])?,
                })
            }
            "field" => {
                let polygon = value["v"]
                    .as_array()?
                    .iter()
                    .map(numbers::<2>)
                    .collect::<Option<Vec<_>>>()?;
                let square = numbers(&value["sq"])?;
                let z_range = numbers(&value["zr"])?;
                if polygon.len() < 3
                    || square[0] >= square[2]
                    || square[1] >= square[3]
                    || z_range[0] >= z_range[1]
                {
                    return None;
                }
                Shape::Field {
                    polygon,
                    square,
                    z_range,
                }
            }
            _ => return None,
        };
        match shape {
            Shape::Circle { radius } if !radius.is_finite() || radius <= 0. => return None,
            Shape::Rect { length, width }
                if !length.is_finite() || !width.is_finite() || length <= 0. || width <= 0. =>
            {
                return None;
            }
            Shape::Capsule { length, width } | Shape::Sweep { length, width, .. }
                if !length.is_finite() || !width.is_finite() || length < 0. || width <= 0. =>
            {
                return None
            }
            Shape::Cone { radius, arc }
                if !radius.is_finite() || !arc.is_finite() || radius <= 0. || arc <= 0. =>
            {
                return None
            }
            Shape::Donut { inner, outer }
                if !inner.is_finite() || !outer.is_finite() || inner < 0. || inner >= outer =>
            {
                return None
            }
            _ => {}
        }
        let index = value["i"].as_u64().unwrap_or_default() as u8;
        let color = match value["c"].as_str() {
            Some("violet") => [0.68, 0.3, 1.],
            Some("blue") => [0.3, 0.6, 1.],
            Some("red") => [1., 0.16, 0.1],
            Some("pale") => [0.82, 0.88, 0.92],
            Some("tower") => [0.35, 0.78, 1.],
            _ => [1., 0.5, 0.12],
        };
        Some(Self {
            key: (attack, index),
            shape,
            position: [
                number(&value["x"]),
                number(&value["y"]),
                number(&value["z"]),
            ],
            angle: number(&value["a"]),
            revision,
            color,
            fill_start: number(&value["f0"]),
            impact: number(&value["t1"]),
            end: number(&value["t2"]),
            fade: number(&value["fade"]),
            safe: value["safe"].as_bool() == Some(true),
            tower: value["c"].as_str() == Some("tower"),
            tracked: !locked && value["trk"].as_bool() == Some(true),
            locked_at: None,
            fade_end: None,
            cancelled: false,
            progress: 0.,
        })
    }

    fn finish(&mut self, deadline: f32, cancelled: bool) {
        if self.fade_end.is_none() {
            self.fade_end = Some(deadline);
            self.cancelled = cancelled;
        }
    }

    fn advance(&mut self, clock: f32, now: f32) {
        if clock >= self.end {
            self.finish(now + self.fade.max(0.05), false);
        }
        // The native field freezes its last displayed extent on cancellation.
        if self.cancelled && matches!(self.shape, Shape::Field { .. }) {
            return;
        }
        self.progress = if self.fade_end.is_some() {
            1.
        } else {
            ((clock - self.fill_start) / (self.impact - self.fill_start).max(0.05)).clamp(0., 1.)
        };
    }

    pub fn progress(&self) -> f32 {
        self.progress
    }

    pub fn is_safe(&self) -> bool {
        self.safe
    }

    pub fn rectangle_marker(&self, length: f32, width: f32) -> native::Marker {
        self.marker(native::Shape::Line { length, width })
    }

    pub fn marker(&self, shape: native::Shape) -> native::Marker {
        native::Marker {
            id: self.key.0,
            shape,
            kind: if self.tower {
                native::Kind::Tower
            } else {
                native::Kind::Danger
            },
            position: self.position,
            facing: self.angle,
            start: self.fill_start,
            end: self.end,
            occupied: false,
            fade_end: self.fade_end,
            revision: self.revision,
        }
    }

    pub fn tower_marker(&self) -> Option<native::Marker> {
        let Shape::Circle { radius } = self.shape else {
            return None;
        };
        self.tower
            .then(|| self.marker(native::Shape::Circle { radius }))
    }

    pub fn moving_fill(&self, clock: f32) -> Option<MovingFill> {
        if self.safe || self.is_fading() {
            return None;
        }
        if clock >= self.impact {
            return (clock < self.end).then(|| {
                let progress = (clock - self.impact) / (self.end - self.impact).max(0.05);
                MovingFill::Active(progress.clamp(0., 1.))
            });
        }
        if clock < self.fill_start {
            return None;
        }
        let lead = ((self.impact - self.fill_start) * 0.5).min(1.);
        let remaining = self.impact - clock;
        Some(if remaining > lead {
            MovingFill::Preview(((clock - self.fill_start) / 0.9).fract())
        } else {
            MovingFill::Lead(1. - remaining / lead)
        })
    }

    /// Field paint remaps UV around the authored safe center as the danger
    /// edge closes. The static mesh already excludes the final safe square.
    pub fn field_uv(&self) -> Option<([f32; 2], f32)> {
        let Shape::Field {
            polygon,
            square: [left, bottom, right, top],
            ..
        } = &self.shape
        else {
            return None;
        };
        let center = [(left + right) * 0.5, (bottom + top) * 0.5];
        let outer = polygon
            .iter()
            .map(|&[x, y]| (x - center[0]).abs().max((y - center[1]).abs()))
            .fold(0_f32, f32::max)
            / 0.72;
        let inner = ((right - left).max(top - bottom)) * 0.5;
        let scale = 0.5 / (outer + (inner - outer) * self.progress).max(0.01);
        Some((center, scale))
    }

    pub fn is_fading(&self) -> bool {
        self.fade_end.is_some()
    }

    pub fn outline_scale(&self, clock: f32) -> f32 {
        if !self.safe && clock >= self.fill_start {
            1.
        } else {
            0.45
        }
    }

    pub fn paint(&self, style: u8, now: f32) -> ([f32; 3], f32, f32) {
        let fade = self
            .fade_end
            .map_or(1., |end| (4. * (end - now)).clamp(0., 1.));
        let brighten = if self.is_fading() && style != 7 {
            1.6
        } else {
            1.
        };
        let lock = self
            .locked_at
            .map_or(0., |at| (1. - (now - at) / 0.35).clamp(0., 1.));
        let pulse = if self.tracked {
            (now * 9.).sin() * 0.3 + 0.7
        } else {
            (now * 3.).sin() * 0.15 + 0.85
        };
        let burst = smooth((self.progress - 0.7) / 0.3);
        let (white, alpha, glow) = match style {
            0 => (0., if self.is_fading() { 2. } else { 1. }, 0.),
            1 => (0.2, 1., 0.3 + burst * 0.5 + lock),
            2 => (0.25, 0.24, 0.),
            3 => (0.4, 0.9, 0.35),
            4 => (0.2, 0.7, 0.3),
            5 => (0.25, 0.35, 0.),
            6 => (0.25, 0.6 * self.progress, 0.),
            7 => (0., 0.74, 0.),
            8 => (0.35, 0.3, 0.15),
            9 => (0.4, 0.8, 0.4),
            _ => (0., 0., 0.),
        };
        let rgb = self
            .color
            .map(|v| ((v + (1. - v) * white) * brighten).min(1.));
        let gain = if style == 6 { fade } else { fade * pulse };
        (rgb, alpha * gain, glow * gain)
    }

    pub fn winding(&self, clock: f32) -> bool {
        !self.is_fading() && clock >= self.fill_start && self.progress < 1.
    }
}

#[derive(Default)]
pub(super) struct Markers {
    pub parts: Vec<Part>,
    retired: HashSet<u64>,
    clock: f32,
    received_at: f32,
    revision: u64,
}

impl Markers {
    pub fn receive(&mut self, value: &Value, now: f32) -> bool {
        let attack = value["id"].as_u64().unwrap_or_default();
        match value["type"].as_str() {
            Some("hz" | "hzt") => {
                self.clock = number(&value["t"]);
                self.received_at = now;
                return false;
            }
            Some("atk") => {
                self.clock = number(&value["t"]);
                self.received_at = now;
                if !self.retired.contains(&attack) {
                    self.revision = self.revision.wrapping_add(1);
                    for part in value["parts"].as_array().into_iter().flatten() {
                        let Some(row) = Part::read(
                            attack,
                            value["locked"].as_bool() == Some(true),
                            part,
                            self.revision,
                        ) else {
                            continue;
                        };
                        if let Some(old) = self.parts.iter_mut().find(|old| old.key == row.key) {
                            *old = row;
                        } else {
                            self.parts.push(row);
                        }
                    }
                }
            }
            Some("atku") => {
                for update in value["m"].as_array().into_iter().flatten() {
                    let index = update[0].as_u64().unwrap_or_default() as u8;
                    if let Some(row) = self.parts.iter_mut().find(|row| row.key == (attack, index))
                    {
                        row.position = [number(&update[1]), number(&update[2]), number(&update[3])];
                        row.angle = number(&update[4]);
                        if let Shape::Rect { length, .. } | Shape::Capsule { length, .. } =
                            &mut row.shape
                        {
                            *length = number(&update[5]);
                        }
                        row.locked_at = None;
                        self.revision = self.revision.wrapping_add(1);
                        row.revision = self.revision;
                    }
                }
            }
            Some("atkl") => {
                for row in self.parts.iter_mut().filter(|row| row.key.0 == attack) {
                    row.tracked = false;
                    row.locked_at.get_or_insert(now);
                }
            }
            Some("atka") => {
                if let Some(row) = self
                    .parts
                    .iter_mut()
                    .find(|row| ((1_u64 << 40) | (row.key.0 << 8) | u64::from(row.key.1)) == attack)
                {
                    row.finish(now + 0.25, false);
                }
            }
            Some("atkx") => {
                let part = value["part"].as_u64();
                if part.is_none() {
                    self.retired.insert(attack);
                }
                let cancelled = !matches!(value["why"].as_str(), Some("ad" | "done"));
                for row in self.parts.iter_mut().filter(|row| {
                    row.key.0 == attack && part.is_none_or(|i| i == u64::from(row.key.1))
                }) {
                    row.finish(now + 0.25, cancelled);
                }
            }
            _ => return false,
        }
        true
    }

    pub fn update(&mut self, now: f32) -> f32 {
        let clock = self.clock + (now - self.received_at).clamp(0., 0.1);
        for row in &mut self.parts {
            row.advance(clock, now);
        }
        self.parts
            .retain(|row| row.fade_end.is_none_or(|end| end > now));
        clock
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn atk_decodes_polygon_pairs_and_rotor_warning_phases() {
        let mut markers = Markers::default();
        assert!(markers.receive(
            &json!({
                "type": "atk", "id": 1, "parts": [
                    { "i": 0, "s": "poly", "v": [1, 2, 3, 4, 5, 6, 7] },
                    { "i": 1, "s": "rotor", "len": 10, "w": 2,
                      "a0": -1, "a1": 1, "f0": 2, "t1": 6, "t2": 8 },
                ],
            }),
            0.,
        ));
        assert!(matches!(&markers.parts[0].shape, Shape::Polygon(points)
            if points == &[[1., 2.], [3., 4.], [5., 6.]]));
        let rotor = &mut markers.parts[1];
        assert!(
            matches!(&rotor.shape, Shape::Rotor { length, width, angles }
                if *length == 10. && *width == 2. && *angles == [-1., 1.])
        );
        assert!(rotor.moving_fill(1.9).is_none());
        assert!(matches!(rotor.moving_fill(2.), Some(MovingFill::Preview(p)) if p == 0.));
        assert!(matches!(rotor.moving_fill(5.5), Some(MovingFill::Lead(p)) if p == 0.5));
        assert!(matches!(rotor.moving_fill(7.), Some(MovingFill::Active(p)) if p == 0.5));
        assert!(rotor.moving_fill(8.).is_none());
        rotor.finish(8.25, true);
        assert!(rotor.moving_fill(7.).is_none());
    }
}
