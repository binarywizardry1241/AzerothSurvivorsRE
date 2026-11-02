//! Pad/touch arithmetic and state; owning reports record each target contract.
use bevy::prelude::*;

pub const NAV_THRESHOLD: f32 = 0.6;
pub const MODE_THRESHOLD: f32 = 0.5;
pub const FIRST_REPEAT: f32 = 0.38;
pub const NEXT_REPEAT: f32 = 0.11;

pub fn speed(value: f32) -> f32 {
    // Current native MAXSS(value, +0) selects +0 for NaN and either zero sign.
    if value > 0. {
        value
    } else {
        0.
    }
}

pub fn stick(value: Vec2, dead_zone: f32) -> Vec2 {
    if value.length() < dead_zone {
        Vec2::ZERO
    } else {
        value
    }
}

pub fn direction(delta: Vec2) -> f32 {
    delta.x.atan2(delta.y)
}

/// Native candidate score: no wrap; reject <=4px forward, penalize lateral
/// distance twice. Coordinates are logical window pixels, positive Y down.
pub fn focus_score(from: Vec2, to: Vec2, direction: Vec2) -> Option<f32> {
    let delta = to - from;
    let forward = delta.dot(direction);
    (forward > 4.0).then(|| forward + 2.0 * (delta - direction * forward).length())
}

pub fn reveal_offset(target: Rect, viewport: Rect, offset: f32, ratio: f32, maximum: f32) -> Option<f32> {
    let delta = if target.min.y < viewport.min.y {
        target.min.y - viewport.min.y - 8.
    } else if target.max.y > viewport.max.y {
        target.max.y - viewport.max.y + 8.
    } else {
        return None;
    };
    Some((offset + delta / ratio).clamp(0., maximum))
}

#[derive(Default)]
pub struct Repeat {
    direction: IVec2,
    next: f32,
}
impl Repeat {
    pub fn tick(&mut self, direction: IVec2, now: f32) -> bool {
        if direction == IVec2::ZERO {
            self.direction = direction;
            return false;
        }
        if direction != self.direction {
            self.direction = direction;
            self.next = now + FIRST_REPEAT;
            true
        } else if now >= self.next {
            self.next = now + NEXT_REPEAT;
            true
        } else {
            false
        }
    }
}

#[derive(Default)]
pub struct TouchState {
    pub enabled: bool,
    pub movement: Option<(u64, Vec2, Vec2)>,
    previous: Vec<(u64, Vec2)>,
}

#[derive(Default, Debug)]
pub struct TouchMotion {
    pub movement: Option<f32>,
    pub look: Vec2,
    pub zoom: f32,
}

impl TouchState {
    pub fn clear(&mut self) {
        self.movement = None;
        self.previous.clear();
    }

    pub fn step(
        &mut self,
        held: &[(u64, Vec2)],
        width: Option<f32>,
        admitted: bool,
    ) -> TouchMotion {
        let mut out = TouchMotion::default();
        if !admitted {
            self.clear();
            return out;
        }
        if self
            .movement
            .is_some_and(|(id, _, _)| !held.iter().any(|t| t.0 == id))
        {
            self.movement = None;
        }
        let mut camera = Vec::new();
        // The native map's order is not a promise. Preserve the existing ID,
        // and sort the camera pair before comparing its successive positions.
        for &(id, point) in held {
            if self.movement.is_some_and(|t| t.0 == id) {
                continue;
            }
            if self.movement.is_none() && point.x < width.map_or(576.0, |w| w * 0.45) {
                self.movement = Some((id, point, point));
            } else if camera.len() < 2 {
                camera.push((id, point));
            }
        }
        if let Some((id, mut base, _)) = self.movement {
            if let Some(&(_, point)) = held.iter().find(|t| t.0 == id) {
                let delta = point - base;
                if delta.length() > 64.0 {
                    base = point - delta.normalize() * 64.0;
                }
                let delta = (point - base) / 64.0;
                if delta.length() > 0.22 {
                    out.movement = Some(direction(Vec2::new(delta.x, -delta.y)));
                }
                self.movement = Some((id, base, point));
            }
        }
        camera.sort_by_key(|t| t.0);
        // Changing the number/identity of camera fingers establishes a new
        // baseline; it must never become a large orbit/pinch on that frame.
        if camera
            .iter()
            .map(|t| t.0)
            .eq(self.previous.iter().map(|t| t.0))
        {
            if camera.len() == 1 {
                let delta = camera[0].1 - self.previous[0].1;
                out.look = Vec2::new(-delta.x * 0.009, -delta.y * 0.006);
            } else if camera.len() == 2 {
                out.zoom = (self.previous[0].1.distance(self.previous[1].1)
                    - camera[0].1.distance(camera[1].1))
                    / 36.0;
            }
        }
        self.previous = camera;
        out
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn radial_boundary_retains_magnitude_and_navigation_does_not_wrap() {
        assert_eq!(stick(Vec2::new(0.15, 0.2), 0.25), Vec2::new(0.15, 0.2));
        assert_eq!(stick(Vec2::new(0.1, 0.2), 0.25), Vec2::ZERO);
        assert_eq!(focus_score(Vec2::ZERO, Vec2::new(4., 0.), Vec2::X), None);
        assert_eq!(
            focus_score(Vec2::ZERO, Vec2::new(10., 3.), Vec2::X),
            Some(16.)
        );
    }
    #[test]
    fn repeat_and_release_are_stateful() {
        let mut repeat = Repeat::default();
        assert!(repeat.tick(IVec2::X, 0.));
        assert!(!repeat.tick(IVec2::X, 0.37));
        assert!(repeat.tick(IVec2::X, 0.38));
        assert!(!repeat.tick(IVec2::X, 0.48));
        assert!(repeat.tick(IVec2::X, 0.49));
        assert!(!repeat.tick(IVec2::ZERO, 0.5));
        assert!(repeat.tick(IVec2::X, 0.51));
    }
    #[test]
    fn touch_cancellation_count_changes_and_floating_base() {
        let mut touch = TouchState::default();
        touch.step(&[(1, Vec2::new(40., 200.))], Some(1000.), true);
        let out = touch.step(
            &[(1, Vec2::new(140., 200.)), (2, Vec2::new(800., 200.))],
            Some(1000.),
            true,
        );
        assert!(out.movement.is_some());
        assert_eq!(touch.movement.unwrap().1, Vec2::new(76., 200.));
        assert_eq!(out.look, Vec2::ZERO);
        assert_eq!(touch.step(&[], Some(1000.), true).movement, None);
        touch.step(&[(3, Vec2::new(30., 20.))], Some(1000.), true);
        assert_eq!(
            touch
                .step(&[(3, Vec2::new(30., 100.))], Some(1000.), false)
                .movement,
            None
        );
        assert!(touch.movement.is_none());
    }
}
