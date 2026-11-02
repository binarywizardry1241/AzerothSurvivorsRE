//! Critical floor-selection regressions; these fixture heights are not a map
//! provider used by the application, which queries actual ADT/WMO geometry.

#[path = "../src/gameplay/world/ground.rs"]
mod ground;

#[test]
fn cave_terrain_and_upper_storey_cannot_replace_nearby_floor() {
    let feet = 147.0;
    assert_eq!(
        ground::choose_floor(feet, Some(195.0), Some(147.0)),
        Some(147.0)
    );
    assert_eq!(ground::choose_floor(feet, None, Some(153.0)), None);
    assert_eq!(
        ground::choose_floor(feet, Some(147.0), Some(153.0)),
        Some(147.0)
    );
}

#[test]
fn bridge_floor_wins_only_in_the_existing_mover_vertical_window() {
    assert_eq!(
        ground::choose_floor(100.0, Some(99.0), Some(100.5)),
        Some(100.5)
    );
    assert_eq!(ground::choose_floor(100.0, Some(80.0), None), None);
    assert_eq!(ground::choose_floor(100.0, None, None), None);
    assert_eq!(
        ground::choose_floor(100.0, Some(f32::NAN), Some(99.75)),
        Some(99.75)
    );
}
