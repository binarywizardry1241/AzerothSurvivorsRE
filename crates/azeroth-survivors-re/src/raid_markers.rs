//! Raid-marker transport and presentation contracts, revalidated for 0.109.0.
//! Current 0.115.0 hzt keep/occupancy gate: 1401116e0, bounded under
//! docs/analysis/coop-markers-0.115.0.md; other contracts retain their provenance.
//!
//! Native input: 140165430; geometry: 140166bf0; paint: 140164000 /
//! 14013b920; texture alpha: 14013d050. Encounter selection/damage is a
//! separate owner. See docs/analysis/raid-markers-0.109.0.md for replay limits.

use serde_json::Value;

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Shape {
    Circle { radius: f32 },
    Donut { inner: f32, outer: f32 },
    Line { length: f32, width: f32 },
    Cone { radius: f32, arc: f32 },
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Kind {
    Danger,
    Tower,
    Pool,
    Live,
}

#[derive(Clone, Debug, PartialEq)]
pub struct Marker {
    pub id: u64,
    pub shape: Shape,
    pub kind: Kind,
    /// Raw WoW coordinates; convert once at the renderer boundary.
    pub position: [f32; 3],
    pub facing: f32,
    pub start: f32,
    pub end: f32,
    pub occupied: bool,
    pub fade_end: Option<f32>,
    /// Changes on replacement/movement, including an identical-ID replacement.
    pub revision: u64,
}

fn number(value: &Value) -> f32 {
    value.as_f64().unwrap_or(0.) as f32
}
fn id(value: &Value) -> u64 {
    value.as_u64().unwrap_or(0)
}

#[derive(Default, Debug)]
pub struct Markers {
    pub rows: Vec<Marker>,
    clock: f32,
    received_at: f32,
    revision: u64,
}

impl Markers {
    pub fn clear(&mut self) {
        self.rows.clear();
    }

    /// The native decoder receives only the marker channel's messages. Unknown
    /// channel messages reset it; ordinary HUD/packet messages must not enter it.
    pub fn receive(&mut self, value: &Value, now: f32) {
        match value["type"].as_str() {
            Some("hz") => {
                let shape = match value["shape"].as_str() {
                    Some("donut") => Shape::Donut {
                        inner: number(&value["inner"]),
                        outer: number(&value["r"]),
                    },
                    Some("line") => Shape::Line {
                        length: number(&value["len"]),
                        width: number(&value["w"]),
                    },
                    Some("cone") => Shape::Cone {
                        radius: number(&value["r"]),
                        arc: number(&value["arc"]),
                    },
                    _ => Shape::Circle {
                        radius: number(&value["r"]),
                    },
                };
                let kind = match value["kind"].as_str() {
                    Some("tower") => Kind::Tower,
                    Some("pool") => Kind::Pool,
                    Some("live") => Kind::Live,
                    _ => Kind::Danger,
                };
                self.clock = number(&value["t"]);
                self.received_at = now;
                self.revision = self.revision.wrapping_add(1);
                let row = Marker {
                    id: id(&value["id"]),
                    shape,
                    kind,
                    position: [
                        number(&value["x"]),
                        number(&value["y"]),
                        number(&value["z"]),
                    ],
                    facing: number(&value["a"]),
                    start: number(&value["t0"]),
                    end: number(&value["t1"]),
                    occupied: false,
                    fade_end: None,
                    revision: self.revision,
                };
                if let Some(old) = self.rows.iter_mut().find(|old| old.id == row.id) {
                    *old = row;
                } else {
                    self.rows.push(row);
                }
            }
            Some("hzt") => {
                self.clock = number(&value["t"]);
                self.received_at = now;
                if let Some(moves) = value["m"].as_array() {
                    for movement in moves {
                        if let Some(row) =
                            self.rows.iter_mut().find(|row| row.id == id(&movement[0]))
                        {
                            let position = [
                                number(&movement[1]),
                                number(&movement[2]),
                                number(&movement[3]),
                            ];
                            let facing = number(&movement[4]);
                            if row.position != position || row.facing != facing {
                                self.revision = self.revision.wrapping_add(1);
                                row.revision = self.revision;
                                row.position = position;
                                row.facing = facing;
                            }
                        }
                    }
                }
                // Native 140111b60..140111b9e checks an actual JSON bool.
                // A shared hzt still advances clock/movement; keep:true skips
                // the local-input occupancy replacement even if in is present.
                if value["keep"].as_bool() != Some(true) {
                    for row in &mut self.rows {
                        if row.fade_end.is_none() {
                            row.occupied = value["in"]
                                .as_array()
                                .is_some_and(|ids| ids.iter().any(|v| v.as_u64() == Some(row.id)));
                        }
                    }
                }
            }
            Some("hzend") => {
                if let Some(row) = self.rows.iter_mut().find(|row| row.id == id(&value["id"])) {
                    row.fade_end = Some(now + 0.25);
                }
            }
            _ => self.clear(),
        }
    }

    /// Extrapolate only the first 100ms after the last clock message.
    pub fn time(&self, now: f32) -> f32 {
        self.clock + (now - self.received_at).clamp(0., 0.1)
    }

    /// Expiry belongs to hzend, not the telegraph's impact timestamp.
    pub fn reap(&mut self, now: f32) {
        self.rows
            .retain(|row| row.fade_end.is_none_or(|end| end > now));
    }
}

impl Marker {
    pub fn winding(&self) -> bool {
        matches!(self.kind, Kind::Danger | Kind::Tower) && self.fade_end.is_none()
    }
    pub fn progress(&self, time: f32) -> f32 {
        if self.winding() {
            ((time - self.start) / (self.end - self.start).max(0.05)).clamp(0., 1.)
        } else {
            1.
        }
    }
    pub fn color(&self) -> [f32; 3] {
        if self.occupied {
            [0.45, 1., 0.55]
        } else {
            match self.kind {
                Kind::Danger => [1., 0.5, 0.12],
                Kind::Tower => [0.35, 0.78, 1.],
                Kind::Pool => [0.72, 0.32, 1.],
                Kind::Live => [1., 0.28, 0.08],
            }
        }
    }
    pub fn fade(&self, now: f32) -> f32 {
        self.fade_end
            .map_or(1., |end| ((end - now) * 4.).clamp(0., 1.))
    }
}

pub fn smooth(value: f32) -> f32 {
    let x = value.clamp(0., 1.);
    x * x * (3. - 2. * x)
}

/// One of the six native group styles. RGB brightness, ordinary alpha and
/// additive alpha are independent. The adapter submits both blend passes.
pub fn paint(row: &Marker, style: u8, progress: f32, now: f32) -> Option<([f32; 3], f32, f32)> {
    let burst = if matches!(row.kind, Kind::Danger | Kind::Tower) {
        smooth((progress - 0.7) / 0.3)
    } else {
        0.
    };
    let (white, alpha, glow) = match style {
        0 => (0., if row.fade_end.is_none() { 1. } else { 2. }, 0.),
        1 => (0.2, 1., 0.3 + burst * 0.5),
        2 => (0.25, 0.24, 0.),
        3 => (0.4, 0.9, 0.35),
        4 if !row.occupied => (0.3, 1., 0.3),
        5 if row.occupied => (0.3, 0.9, 0.4),
        _ => return None,
    };
    let pulse = if matches!(row.kind, Kind::Danger | Kind::Tower) {
        1.
    } else {
        (now * 3.).sin() * 0.15 + 0.85
    };
    let brighten = if row.fade_end.is_some() { 1.6 } else { 1. };
    let rgb = row
        .color()
        .map(|c| ((c + (1. - c) * white) * brighten).min(1.));
    let gain = row.fade(now) * pulse;
    Some((rgb, alpha * gain, glow * gain))
}

/// 145950b00 skips spell 0 and truncates/saturates seconds*1000 to the wire u32.
pub fn windup_millis(spell_id: u32, seconds: f32) -> Option<u32> {
    (spell_id != 0).then_some((seconds * 1000.) as u32)
}

pub const MASK_SIZES: [(u32, u32); 9] = [
    (512, 512),
    (512, 512),
    (8, 256),
    (8, 256),
    (8, 256),
    (8, 256),
    (256, 8),
    (256, 4),
    (256, 256),
];

/// 1400ebdc0. Samples are texel centers and quantized to 8-bit alpha at startup.
/// These are authored formulas, not extracted pictures or a runtime EXE dependency.
pub fn mask(kind: usize, u: f32, v: f32, edge: f32) -> f32 {
    let x = u * 2. - 1.;
    let y = v * 2. - 1.;
    let radial = x.hypot(y);
    let trail = |distance: f32| {
        let core = if distance > 0. {
            (-7. * distance).exp() * 0.45
        } else {
            (1. - smooth((-0.03 - distance) / 0.04)).max((2.4 * distance).exp() * 0.4)
        };
        core * (1. - smooth((distance.abs() - 0.8) / 0.19999999))
    };
    match kind {
        0 => (0.1 + 0.22 * radial.min(1.).powi(3)) * ((1. - radial) / edge).clamp(0., 1.),
        1 => ((1. - radial) / edge).clamp(0., 1.),
        2 => 0.1 + 0.22 * y.abs().powi(3),
        3 => 1.,
        4 => {
            ((-3. * y.abs()).exp() * 0.5).max(1. - smooth((y.abs() - 0.06) / 0.05))
                * (1. - smooth((y.abs() - 0.8) / 0.19999999))
        }
        5 => trail(y),
        6 => trail(u - 1.),
        7 => {
            0.45 + 0.55
                * ((u * 43.9823).sin() * 0.5 + 0.5)
                * ((u * 18.849556 + 1.3).sin() * 0.5 + 0.5)
        }
        // 0.140.0 field warning mask, 1400a93a5 and 1400a959b.
        8 => {
            let distance = x.abs().max(y.abs());
            if distance < 0.82 {
                (0.34 + 0.4 * smooth((distance - 0.72) / (0.82 - 0.72))) / 0.74
            } else {
                (0.74 - f32::from_bits(0x3df5c290) * smooth((distance - 0.82) / (0.98 - 0.82))) / 0.74
            }
        }
        _ => 0.,
    }
    .clamp(0., 1.)
}

/// Native startup retains a complete float-averaged mip chain. Quantization of
/// one level must not feed the next level (1401b76c0 / 140116c00).
pub fn mask_pixels(kind: usize) -> (Vec<u8>, u32) {
    let (mut width, mut height) = MASK_SIZES[kind];
    let edge = 1. / width.min(height) as f32;
    let mut values: Vec<f32> = (0..height)
        .flat_map(|y| {
            (0..width).map(move |x| {
                mask(
                    kind,
                    (x as f32 + 0.5) / width as f32,
                    (y as f32 + 0.5) / height as f32,
                    edge,
                )
            })
        })
        .collect();
    let mut pixels = Vec::new();
    let mut levels = 0;
    loop {
        for &alpha in &values {
            pixels.extend_from_slice(&[
                255,
                255,
                255,
                (alpha * 255.).round().clamp(0., 255.) as u8,
            ]);
        }
        levels += 1;
        if width == 1 && height == 1 {
            break;
        }
        let (next_width, next_height) = ((width / 2).max(1), (height / 2).max(1));
        let mut next = Vec::with_capacity((next_width * next_height) as usize);
        for y in 0..next_height {
            for x in 0..next_width {
                let at = |x: u32, y: u32| {
                    values[(y.min(height - 1) * width + x.min(width - 1)) as usize]
                };
                next.push(
                    (at(x * 2, y * 2)
                        + at(x * 2 + 1, y * 2)
                        + at(x * 2, y * 2 + 1)
                        + at(x * 2 + 1, y * 2 + 1))
                        * 0.25,
                );
            }
        }
        values = next;
        (width, height) = (next_width, next_height);
    }
    (pixels, levels)
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    fn create() -> Value {
        json!({"type":"hz","id":7,"shape":"line","kind":"tower","x":100,"y":200,"z":3,"a":0.5,"len":20,"w":6,"t":10,"t0":10,"t1":12})
    }

    #[test]
    fn native_clock_moves_occupancy_end_and_replacement_share_one_identity() {
        let mut state = Markers::default();
        state.receive(&create(), 50.);
        assert_eq!(state.rows[0].progress(state.time(50.)), 0.);
        assert!((state.time(99.) - 10.1).abs() < 0.00001);
        state.receive(
            &json!({"type":"hzt","t":11,"m":[[7,110,210,4,1.25],[99,0,0,0,0]],"in":[7]}),
            51.,
        );
        let row = &state.rows[0];
        assert_eq!(
            (row.position, row.facing, row.occupied),
            ([110., 210., 4.], 1.25, true)
        );
        assert_eq!(row.progress(state.time(51.)), 0.5);
        state.receive(&json!({"type":"hzend","id":7}), 52.);
        assert_eq!(state.rows[0].progress(0.), 1.);
        assert_eq!(state.rows[0].fade(52.125), 0.5);
        state.receive(&create(), 52.2);
        assert_eq!(state.rows.len(), 1);
        assert!(!state.rows[0].occupied);
        assert!(state.rows[0].fade_end.is_none());
        state.receive(&json!({"type":"hzend","id":7}), 53.);
        state.reap(53.249);
        assert_eq!(state.rows.len(), 1);
        state.reap(53.25);
        assert!(state.rows.is_empty());
    }

    #[test]
    fn native_defaults_reset_and_missing_occupancy_do_not_guess_geometry() {
        let mut state = Markers::default();
        state.receive(&json!({"type":"hz"}), 0.);
        assert_eq!(state.rows[0].shape, Shape::Circle { radius: 0. });
        assert_eq!(state.rows[0].kind, Kind::Danger);
        state.receive(&json!({"type":"hzt","in":[0]}), 0.);
        assert!(state.rows[0].occupied);
        state.receive(&json!({"type":"hzt"}), 0.);
        assert!(!state.rows[0].occupied);
        state.receive(&json!({"type":"reset"}), 0.);
        assert!(state.rows.is_empty());
    }

    #[test]
    fn forwarded_hazard_tick_keeps_local_occupancy_but_moves_and_advances_clock() {
        let mut state = Markers::default();
        state.receive(&create(), 50.);
        let mut second = create();
        second["id"] = json!(8);
        state.receive(&second, 50.);
        state.receive(&json!({"type":"hzt","t":10,"in":[7]}), 50.);
        let revision = state.rows[0].revision;

        let original = r#"{"type":"hzt","t":11,"m":[[7,110,210,4,1.25]],"in":[8]}"#;
        let forwarded = crate::coop::route::forward_to_peers(original).unwrap();
        let value: Value = serde_json::from_str(&forwarded).unwrap();
        assert!(value.get("in").is_none());
        state.receive(&value, 51.);

        assert_eq!(state.rows[0].position, [110., 210., 4.]);
        assert_eq!(state.rows[0].facing, 1.25);
        assert_ne!(state.rows[0].revision, revision);
        assert_eq!(state.time(51.), 11.);
        assert_eq!(
            state
                .rows
                .iter()
                .map(|row| row.occupied)
                .collect::<Vec<_>>(),
            [true, false]
        );
        // Bool(true) wins even when a packet explicitly includes conflicting in.
        state.receive(&json!({"type":"hzt","keep":true,"in":[8]}), 52.);
        assert_eq!(
            state
                .rows
                .iter()
                .map(|row| row.occupied)
                .collect::<Vec<_>>(),
            [true, false]
        );
    }

    #[test]
    fn occupancy_keep_requires_json_true_and_retains_fading_row_exclusion() {
        for keep in [
            json!(false),
            json!(null),
            json!(1),
            json!("true"),
            json!([]),
            json!({}),
        ] {
            let mut state = Markers::default();
            state.receive(&create(), 0.);
            state.receive(&json!({"type":"hzt","in":[7]}), 0.);
            assert!(state.rows[0].occupied);
            state.receive(&json!({"type":"hzt","keep":keep}), 0.);
            assert!(!state.rows[0].occupied);
        }
        let mut state = Markers::default();
        state.receive(&create(), 0.);
        state.receive(&json!({"type":"hzt","in":[7]}), 0.);
        state.receive(&json!({"type":"hzend","id":7}), 0.);
        state.receive(&json!({"type":"hzt","keep":false,"in":[]}), 0.);
        assert!(state.rows[0].occupied);
    }

    #[test]
    fn native_paint_keeps_the_two_blends_and_occupancy_admission_distinct() {
        let mut state = Markers::default();
        state.receive(&create(), 0.);
        let row = &mut state.rows[0];
        let (_, alpha, glow) = paint(row, 1, 1., 0.).unwrap();
        assert_eq!(alpha, 1.);
        assert_eq!(glow, 0.8);
        assert!(paint(row, 4, 1., 0.).is_some());
        assert!(paint(row, 5, 1., 0.).is_none());
        row.occupied = true;
        assert_eq!(row.color(), [0.45, 1., 0.55]);
        assert!(paint(row, 4, 1., 0.).is_none());
        assert!(paint(row, 5, 1., 0.).is_some());
        row.kind = Kind::Pool;
        assert_eq!(paint(row, 1, 1., 0.).unwrap().2, 0.3);
    }

    #[test]
    fn windup_uses_native_truncation_and_spell_zero_gate() {
        assert_eq!(windup_millis(0, 2.), None);
        assert_eq!(windup_millis(133, 1.999), Some(1999));
        assert_eq!(windup_millis(133, -1.), Some(0));
        assert_eq!(windup_millis(133, f32::INFINITY), Some(u32::MAX));
    }
}
