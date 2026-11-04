//! Gandling's hit geometry from 0.140.0 `0x145ee1e90`.

const EDGE_INSET: f32 = 0.05;

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
}

impl Shape {
    pub fn hits(self, [x, y]: [f32; 2], radius: f32) -> bool {
        match self {
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
            Self::Rect {
                start: [start_x, start_y],
                end: [end_x, end_y],
                width,
            } => {
                let dx = end_x - start_x;
                let dy = end_y - start_y;
                let length = dx.hypot(dy);
                if length < 0.0001 {
                    return false;
                }
                let along_x = dx / length;
                let along_y = dy / length;
                let x = x - start_x;
                let y = y - start_y;
                let along = y * along_y + x * along_x;
                let across = (y * along_x - x * along_y).abs();
                along > EDGE_INSET
                    && along < length - EDGE_INSET
                    && across < radius + width * 0.5 - EDGE_INSET
            }
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
}
