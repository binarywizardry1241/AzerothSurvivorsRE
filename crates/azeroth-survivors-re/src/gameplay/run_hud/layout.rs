//! Current 0.109.0 `hud.txt` rows (1402836b0 / 140286ca0).
//! Stored coordinates are logical window pixels, before custom HUD UiScale.

use bevy::prelude::*;
use std::path::Path;

pub(super) const PARTS: [&str; 2] = ["tally", "build"];

pub(super) fn parse(text: &str) -> [Option<Vec2>; 2] {
    let mut positions = [None; 2];
    for line in text.lines() {
        let mut words = line.split_whitespace();
        let (Some(part), Some(x), Some(y), None) =
            (words.next(), words.next(), words.next(), words.next())
        else {
            continue;
        };
        let Some(index) = PARTS.iter().position(|key| *key == part) else {
            continue;
        };
        let (Ok(x), Ok(y)) = (x.parse::<f32>(), y.parse::<f32>()) else {
            continue;
        };
        if x.is_finite() && y.is_finite() {
            positions[index] = Some(Vec2::new(x, y));
        }
    }
    positions
}

pub(super) fn read(path: &Path) -> [Option<Vec2>; 2] {
    std::fs::read_to_string(path).map_or([None; 2], |text| parse(&text))
}

pub(super) fn text(positions: &[Option<Vec2>; 2]) -> String {
    let mut output = String::new();
    for (part, position) in PARTS.into_iter().zip(positions) {
        if let Some(position) = position {
            output.push_str(&format!("{part} {} {}\n", position.x, position.y));
        }
    }
    output
}

pub(super) fn write(path: &Path, positions: &[Option<Vec2>; 2]) -> Result<(), String> {
    if let Some(parent) = path.parent() {
        std::fs::create_dir_all(parent).map_err(|error| error.to_string())?;
    }
    std::fs::write(path, text(positions)).map_err(|error| error.to_string())
}

/// Current1402892c0 clamps display without rewriting the retained position.
/// An oversized panel can only fit at the upper/left edge.
pub(super) fn clamp(position: Vec2, viewport: Vec2, size: Vec2) -> Vec2 {
    position
        .max(Vec2::ZERO)
        .min((viewport - size).max(Vec2::ZERO))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_rows_reject_malformed_and_keep_the_last_valid_position() {
        let positions = parse("tally 1 2\nbuild -3 4\ntally 5 6\ntally NaN 8\nbuild 9 inf\nclock 7 8\nbuild 1 2 extra\n");
        assert_eq!(
            positions,
            [Some(Vec2::new(5., 6.)), Some(Vec2::new(-3., 4.))]
        );
        assert_eq!(parse(&text(&positions)), positions);
    }

    #[test]
    fn display_clamp_does_not_change_stored_coordinates() {
        let stored = Vec2::new(-10., 900.);
        assert_eq!(
            clamp(stored, Vec2::new(800., 600.), Vec2::new(200., 100.)),
            Vec2::new(0., 500.)
        );
        assert_eq!(stored, Vec2::new(-10., 900.));
        assert_eq!(
            clamp(Vec2::splat(50.), Vec2::splat(100.), Vec2::splat(200.)),
            Vec2::ZERO
        );
    }
}
