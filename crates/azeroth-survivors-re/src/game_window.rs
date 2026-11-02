//! Current native `window::GameWindowPlugin` title publication (14018d8e0).
use bevy::prelude::*;

pub struct GameWindowPlugin;

impl Plugin for GameWindowPlugin {
    fn build(&self, app: &mut App) {
        app.add_systems(Update, publish_title);
    }
}

fn publish_title(mut windows: Query<&mut Window>) {
    for mut window in &mut windows {
        if window.title != "Azeroth Survivors" {
            window.title = "Azeroth Survivors".to_owned();
        }
    }
}
