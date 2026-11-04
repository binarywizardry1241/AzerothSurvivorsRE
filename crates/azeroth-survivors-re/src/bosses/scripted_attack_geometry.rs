//! Scholomance scripted hit geometry from the shared attack sampler.

const EDGE_INSET: f32 = 0.05;
const SEGMENT_EPSILON: f32 = 0.0001;

#[derive(Clone, Copy, Debug)]
pub struct Grid {
    pub origin: [f32; 2],
    pub angle: f32,
    pub pitch: f32,
    pub rows: u8,
    pub columns: u8,
    pub valid: [u64; 2],
    pub danger: [u64; 2],
}

impl Grid {
    pub fn contains_danger(self, row: i32, column: i32) -> bool {
        if !(0..i32::from(self.rows)).contains(&row)
            || !(0..i32::from(self.columns)).contains(&column)
        {
            return false;
        }
        let index = row as usize * usize::from(self.columns) + column as usize;
        let bit = 1_u64 << (index % 64);
        self.valid
            .get(index / 64)
            .zip(self.danger.get(index / 64))
            .is_some_and(|(valid, danger)| valid & danger & bit != 0)
    }

    pub fn tile_center(self, row: i32, column: i32) -> [f32; 2] {
        let [x, y] = [
            (column as f32 + 0.5) * self.pitch,
            (row as f32 + 0.5) * self.pitch,
        ];
        let (sin, cos) = self.angle.sin_cos();
        [
            self.origin[0] + x * cos - y * sin,
            self.origin[1] + x * sin + y * cos,
        ]
    }

    fn hits(self, point: [f32; 2], radius: f32) -> bool {
        let [x, y] = [point[0] - self.origin[0], point[1] - self.origin[1]];
        let (sin, cos) = self.angle.sin_cos();
        let [x, y] = [x * cos + y * sin, y * cos - x * sin];
        if !x.is_finite() || !y.is_finite() {
            return false;
        }
        let index = |coord: f32| (coord / self.pitch).floor() as i32;
        if self.contains_danger(index(y), index(x)) {
            return true;
        }
        let radius = (radius - EDGE_INSET).max(0.0);
        for row in index(y - radius).max(0)..=index(y + radius).min(i32::from(self.rows) - 1) {
            for column in
                index(x - radius).max(0)..=index(x + radius).min(i32::from(self.columns) - 1)
            {
                if self.contains_danger(row, column) {
                    let left = column as f32 * self.pitch;
                    let bottom = row as f32 * self.pitch;
                    let dx = x - x.clamp(left, left + self.pitch);
                    let dy = y - y.clamp(bottom, bottom + self.pitch);
                    if dx.hypot(dy) < radius {
                        return true;
                    }
                }
            }
        }
        false
    }
}

#[derive(Clone, Copy, Debug)]
pub enum Shape {
    Circle {
        center: [f32; 2],
        radius: f32,
    },
    /// An attack field whose safe bounds are `[min_x, min_y, max_x, max_y]`.
    Field {
        safe: [f32; 4],
    },
    Rect {
        start: [f32; 2],
        end: [f32; 2],
        width: f32,
    },
    Cone {
        origin: [f32; 2],
        angle: f32,
        length: f32,
        half_angle: f32,
    },
    Capsule {
        start: [f32; 2],
        end: [f32; 2],
        radius: f32,
    },
    Donut {
        center: [f32; 2],
        inner: f32,
        outer: f32,
    },
    /// The original segment translates by `span` over the part's active interval.
    Sweep {
        start: [f32; 2],
        end: [f32; 2],
        width: f32,
        span: [f32; 2],
    },
    Grid(Grid),
}

fn rectangle_hits(
    [x, y]: [f32; 2],
    radius: f32,
    [start_x, start_y]: [f32; 2],
    [end_x, end_y]: [f32; 2],
    width: f32,
) -> bool {
    let dx = end_x - start_x;
    let dy = end_y - start_y;
    let length = dx.hypot(dy);
    if length < SEGMENT_EPSILON {
        return false;
    }
    let along_x = dx / length;
    let along_y = dy / length;
    let x = x - start_x;
    let y = y - start_y;
    let along = y * along_y + x * along_x;
    let across = (y * along_x - x * along_y).abs();
    along > EDGE_INSET && along < length - EDGE_INSET && across < radius + width * 0.5 - EDGE_INSET
}

impl Shape {
    pub fn hits(self, point: [f32; 2], radius: f32) -> bool {
        self.hits_at(point, radius, 0.0)
    }

    pub fn hits_at(self, [x, y]: [f32; 2], radius: f32, progress: f32) -> bool {
        match self {
            Self::Grid(grid) => grid.hits([x, y], radius),
            Self::Cone {
                origin,
                angle,
                length,
                half_angle,
            } => {
                let [dx, dy] = [x - origin[0], y - origin[1]];
                let distance = dx.hypot(dy);
                if distance > length + radius - EDGE_INSET {
                    return false;
                }
                if half_angle < std::f32::consts::FRAC_PI_2
                    && dx * angle.cos() + dy * angle.sin() < 0.0
                {
                    return false;
                }
                if distance < SEGMENT_EPSILON {
                    return true;
                }
                let inset = (radius / distance.max(radius.max(SEGMENT_EPSILON)))
                    .clamp(0.0, 1.0)
                    .asin();
                let difference = (dy.atan2(dx) - angle + std::f32::consts::PI)
                    .rem_euclid(std::f32::consts::TAU)
                    - std::f32::consts::PI;
                difference.abs() < half_angle + inset
            }
            Self::Capsule {
                start,
                end,
                radius: capsule_radius,
            } => {
                let [dx, dy] = [end[0] - start[0], end[1] - start[1]];
                let len_sq = dx * dx + dy * dy;
                let t = if len_sq < 0.000001 {
                    0.0
                } else {
                    (((x - start[0]) * dx + (y - start[1]) * dy) / len_sq).clamp(0.0, 1.0)
                };
                (x - (start[0] + dx * t)).hypot(y - (start[1] + dy * t))
                    < radius + capsule_radius - EDGE_INSET
            }
            Self::Donut {
                center,
                inner,
                outer,
            } => {
                let distance = (x - center[0]).hypot(y - center[1]);
                distance < radius + outer - EDGE_INSET
                    && (inner <= 0.0 || distance > inner - radius + EDGE_INSET)
            }
            Self::Sweep {
                start,
                end,
                width,
                span,
            } => {
                let offset = [span[0] * progress, span[1] * progress];
                rectangle_hits(
                    [x, y],
                    radius,
                    [start[0] + offset[0], start[1] + offset[1]],
                    [end[0] + offset[0], end[1] + offset[1]],
                    width,
                )
            }
            Self::Circle {
                center: [center_x, center_y],
                radius: circle_radius,
            } => {
                (x - center_x).hypot(y - center_y) < (radius + circle_radius - EDGE_INSET).max(0.0)
            }
            Self::Field {
                safe: [min_x, min_y, max_x, max_y],
            } => {
                let inset = (radius - EDGE_INSET).max(0.0);
                // The native safe square includes every edge. Unordered points count as hits.
                !(x >= min_x + inset
                    && x <= max_x - inset
                    && y >= min_y + inset
                    && y <= max_y - inset)
            }
            Self::Rect { start, end, width } => rectangle_hits([x, y], radius, start, end, width),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::Shape;

    #[test]
    fn office_field_includes_all_safe_edges_after_the_radius_inset() {
        let shape = Shape::Field {
            safe: [122.0, 159.0, 138.0, 175.0],
        };
        assert!(!shape.hits([122.0, 167.0], 0.05));
        assert!(!shape.hits([138.0, 167.0], 0.05));
        assert!(!shape.hits([130.0, 159.0], 0.05));
        assert!(!shape.hits([130.0, 175.0], 0.05));
        assert!(shape.hits([122.0, 167.0], 0.389));
        assert!(shape.hits([130.0, 159.0], 0.389));
        assert!(!shape.hits([122.5, 167.0], 0.389));
    }

    #[test]
    fn examination_strip_extends_across_but_has_open_ends() {
        let shape = Shape::Rect {
            start: [130.0, 0.0],
            end: [130.0, 56.0],
            width: 1.0,
        };
        assert!(!shape.hits([130.0, 0.05], 0.05));
        assert!(shape.hits([130.0, 0.051], 0.05));
        assert!(shape.hits([130.0, 55.949], 0.05));
        assert!(!shape.hits([130.0, 55.951], 0.05));
        assert!(!shape.hits([130.5, 20.0], 0.05));
        assert!(shape.hits([130.5, 20.0], 0.389));
    }

    #[test]
    fn pop_quiz_circle_uses_the_recipient_radius() {
        let shape = Shape::Circle {
            center: [0.0, 0.0],
            radius: 1.0,
        };
        assert!(shape.hits([0.999, 0.0], 0.05));
        assert!(!shape.hits([1.0, 0.0], 0.05));
        assert!(shape.hits([1.2, 0.0], 0.389));
    }

    #[test]
    fn sweep_translates_both_open_ends_of_the_segment() {
        let shape = Shape::Sweep {
            start: [0.0, 0.0],
            end: [2.0, 0.0],
            width: 2.0,
            span: [0.0, 8.0],
        };
        assert!(shape.hits_at([1.0, 4.0], 0.389, 0.5));
        assert!(!shape.hits_at([1.0, 4.0], 0.389, 0.0));
        assert!(!shape.hits_at([0.01, 4.0], 0.389, 0.5));
    }

    #[test]
    fn semicircle_can_hit_a_hero_whose_radius_overlaps_the_edge() {
        let shape = Shape::Cone {
            origin: [0.0, 0.0],
            angle: 0.0,
            length: 13.0,
            half_angle: std::f32::consts::FRAC_PI_2,
        };
        assert!(shape.hits([-0.1, 5.0], 0.389));
        assert!(!shape.hits([-0.5, 5.0], 0.389));
    }
}
