//! The run HUD visibility keys and the independent minimap clock.
//! The real client registry owns addon writes and their persistence.

use benilla_app::local_client::{LocalClientExtension, LocalClientInput};
use bevy::prelude::*;

use crate::options::OptionsState;

pub(crate) const PARTS: [(&str, &str); 11] = [
    ("clock", "hudClock"),
    ("bosses", "hudBosses"),
    ("tally", "hudTally"),
    ("build", "hudBuild"),
    ("banners", "hudBanners"),
    ("loot", "hudLoot"),
    ("meter", "hudMeter"),
    ("levels", "hudLevels"),
    ("flag", "hudFlag"),
    ("revive", "hudRevive"),
    ("localClock", "hudLocalClock"),
];

pub(crate) fn defaults() -> impl Iterator<Item = (String, String)> {
    std::iter::once(("hudScale".into(), "1".into()))
        .chain(PARTS.into_iter().map(|(_, cvar)| (cvar.into(), "1".into())))
}

pub(crate) fn owns_cvar(name: &str) -> bool {
    name.eq_ignore_ascii_case("hudScale")
        || PARTS.iter().any(|(_, key)| key.eq_ignore_ascii_case(name))
}

pub(super) fn scale(value: &str) -> f32 {
    value
        .trim()
        .parse::<f32>()
        .ok()
        .filter(|value| value.is_finite())
        .map_or(1., |value| value.clamp(0.5, 2.))
}

pub(super) fn shown(value: &str) -> bool {
    value.trim() != "0"
}

#[derive(Resource)]
pub(crate) struct HudSettings {
    pub scale: f32,
    visible: [bool; PARTS.len()],
    pub(super) positions: [Option<Vec2>; 2],
}

impl Default for HudSettings {
    fn default() -> Self {
        Self {
            scale: 1.,
            visible: [true; PARTS.len()],
            positions: [None; 2],
        }
    }
}

impl HudSettings {
    pub(super) fn apply(&self, part: &str, node: &mut Node) {
        // Current placement1402892c0 keeps default offsets in logical window
        // pixels when the HUD itself is scaled.
        if part == "tally" {
            node.left = Val::Auto;
            node.right = Val::Px(200. / self.scale);
            node.top = Val::Px(10. / self.scale);
        } else if part == "build" {
            node.left = Val::Px(10. / self.scale);
            node.right = Val::Auto;
            node.top = Val::Px(120. / self.scale);
        }
        if let Some(position) = super::layout::PARTS
            .iter()
            .position(|key| *key == part)
            .and_then(|index| self.positions[index])
        {
            node.left = Val::Px(position.x / self.scale);
            node.top = Val::Px(position.y / self.scale);
            node.right = Val::Auto;
            node.bottom = Val::Auto;
        }
    }

    pub fn shown(&self, part: &str) -> bool {
        PARTS
            .iter()
            .position(|(name, _)| *name == part)
            .is_some_and(|index| self.visible[index])
    }
}

#[derive(Default)]
pub(super) struct Mirror {
    initialized: bool,
    menu: Option<String>,
    client: Option<String>,
    effective: String,
}

/// Menu edits and addon SetCVar writes meet in the ordinary client registry.
/// A pending menu write takes precedence over the preceding VM snapshot.
pub(super) fn sync(
    mut settings: ResMut<HudSettings>,
    mut ui_scale: ResMut<UiScale>,
    input: Res<LocalClientInput>,
    mut options: ResMut<OptionsState>,
    mut extension: ResMut<LocalClientExtension>,
    mut mirrors: Local<[Mirror; PARTS.len() + 1]>,
) {
    for (index, (name, default)) in defaults().enumerate() {
        let mirror = &mut mirrors[index];
        let menu = options.cvar(&name).map(str::to_owned);
        let client = input
            .cvars
            .iter()
            .find(|(key, _)| key.eq_ignore_ascii_case(&name))
            .map(|(_, value)| value.clone());
        let menu_changed = menu != mirror.menu;
        let pending = extension
            .cvar_writes
            .iter()
            .any(|(key, _)| key.eq_ignore_ascii_case(&name));
        if !mirror.initialized {
            if let Some(value) = &client {
                mirror.effective.clone_from(value);
                options.observe_hud_cvar(&name, value, &default);
                mirror.initialized = true;
            } else {
                mirror.effective = menu.clone().unwrap_or_else(|| default.clone());
            }
        } else if menu_changed {
            if let Some(value) = &menu {
                if client.as_ref() != Some(value) {
                    extension.cvar_writes.push((name.clone(), value.clone()));
                }
                mirror.effective.clone_from(value);
                options.observe_hud_cvar(&name, value, &default);
            }
        } else if !pending && client != mirror.client {
            if let Some(value) = &client {
                mirror.effective.clone_from(value);
                options.observe_hud_cvar(&name, value, &default);
            }
        }
        if mirror.effective.is_empty() && menu.is_none() && client.is_none() {
            mirror.effective = default;
        }
        mirror.menu = options.cvar(&name).map(str::to_owned);
        mirror.client = client;
        if index == 0 {
            settings.scale = scale(&mirror.effective);
            if ui_scale.0 != settings.scale {
                ui_scale.0 = settings.scale;
            }
        } else {
            settings.visible[index - 1] = shown(&mirror.effective);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn current_scale_and_visibility_boundaries() {
        for (input, expected) in [
            ("bad", 1.),
            ("NaN", 1.),
            ("inf", 1.),
            ("-inf", 1.),
            ("0", 0.5),
            ("-1", 0.5),
            ("3", 2.),
            (" 1.25 ", 1.25),
        ] {
            assert_eq!(scale(input), expected);
        }
        for hidden in ["0", " 0 ", "\u{a0}0\u{a0}"] {
            assert!(!shown(hidden));
        }
        for visible in ["", "00", "0.0", "false", "1"] {
            assert!(shown(visible));
        }
    }
}
