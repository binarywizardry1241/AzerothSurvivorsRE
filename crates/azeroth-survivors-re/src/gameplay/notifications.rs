//! Current native custom banners: JSON140062b50, update1400925b0,
//! row1401034a0. These named events are presentation, not Save counters.
//! Producer140061430 mirrors the actual engine LoadingScreen covering flag;
//! loading defers expiry independently of run pause.

use bevy::{picking::Pickable, prelude::*};
use benilla_app::local_client::LocalClientInput;

use crate::{assets::MenuArt, localization::Localization};

use super::{RunSet, RunSession};

#[derive(Clone, Debug)]
struct Row {
    text: String,
    born: f32,
    account: bool,
}

#[derive(Resource, Default)]
pub(crate) struct Notifications {
    rows: Vec<Row>,
    /// Native one-byte resource registered by1401d92d0, updated by140061430.
    defer_expiry: bool,
    root: Option<Entity>,
    rendered_key: Option<u64>,
}

impl Notifications {
    /// Current toast arm1400637e5..1400646f8 appends kind0 directly.
    pub fn toast(&mut self, text: String, now: f32) {
        self.rows.push(Row { text, born: now, account: false });
    }
    /// Guest account delivery sends its frontend toast even without an active
    /// world (0.119.0 145b13d30). Retain that notice across the teardown.
    pub fn account_toast(&mut self, text: String, now: f32) {
        self.rows.push(Row { text, born: now, account: true });
    }
    /// Names are already localized by the death owner. The native JSON
    /// consumer localizes the template before substituting that name.
    pub fn named(&mut self, kind: &str, name: &str, now: f32, locale: &Localization) -> Option<String> {
        let key = match kind {
            "bossdown" => "{name} is defeated!",
            "guardian" => "{name} is slain! Its hoard and a level.",
            _ => return None,
        };
        let text = locale.label(key).replace("{name}", name);
        self.rows.push(Row {
            text: text.clone(),
            born: now,
            account: false,
        });
        Some(text)
    }

    fn update(&mut self, now: f32) {
        if self.defer_expiry {
            for row in &mut self.rows {
                row.born = now;
            }
        }
        // Current UCOMISS/JBE removes equal or unordered ages too.
        self.rows.retain(|row| now - row.born < 3.);
    }

    fn key(&self) -> u64 {
        (self.rows.len() as u64).wrapping_add(
            self.rows.last().map_or(0, |row| (row.born * 1000.) as u64),
        )
    }
}

#[derive(Component)]
struct Born(f32);

pub(super) struct NotificationsPlugin;
impl Plugin for NotificationsPlugin {
    fn build(&self, app: &mut App) {
        app.init_resource::<Notifications>()
            .add_systems(Update, (sync, animate).chain().in_set(RunSet::Present));
    }
}

fn alpha(age: f32) -> f32 {
    let progress = age / 3.;
    let value = if progress < 0.1 {
        progress / 0.1
    } else if progress > 0.75 {
        (1. - progress) * 4.
    } else {
        1.
    };
    value.clamp(0., 1.)
}

fn sync(mut commands: Commands, time: Res<Time>, session: Res<RunSession>,
        art: Res<MenuArt>, input: Res<LocalClientInput>, mut state: ResMut<Notifications>,
        settings: Res<super::run_hud::HudSettings>) {
    let now = time.elapsed_secs();
    state.defer_expiry = input.loading_screen_covering;
    state.update(now);
    let in_run = session.mechanics.is_some();
    if !state.rows.iter().any(|row| in_run || row.account) {
        if let Some(root) = state.root.take() {
            commands.entity(root).despawn();
        }
        state.rendered_key = None;
        return;
    }
    let visibility = if settings.shown("banners") && !input.loading_screen_covering {
        Visibility::Inherited
    } else { Visibility::Hidden };
    if let Some(root) = state.root { commands.entity(root).insert(visibility); }
    let key = state.key().wrapping_mul(2).wrapping_add(u64::from(in_run));
    if state.root.is_some() && state.rendered_key == Some(key) {
        return;
    }
    if let Some(root) = state.root.take() {
        commands.entity(root).despawn();
    }
    state.root = Some(commands.spawn((
        Node {
            position_type: PositionType::Absolute,
            top: Val::Percent(27.),
            width: Val::Percent(100.),
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            row_gap: Val::Px(5.),
            ..default()
        },
        GlobalZIndex(4100),
        visibility,
        Pickable::IGNORE,
    )).with_children(|root| {
        for row in state.rows.iter().filter(|row| in_run || row.account) {
            root.spawn((
                Born(row.born),
                Text::new(&row.text),
                TextFont { font: art.heading_font.clone(), font_size: 24., ..default() },
                TextColor(Color::srgba(0.973, 0.824, 0.416, alpha(now - row.born))),
                TextShadow { color: Color::srgba(0., 0., 0., 0.85), offset: Vec2::new(0., 1.5) },
            ));
        }
    }).id());
    state.rendered_key = Some(key);
}

fn animate(time: Res<Time>, mut rows: Query<(&Born, &mut TextColor)>) {
    for (born, mut color) in &mut rows {
        color.0 = Color::srgba(0.973, 0.824, 0.416, alpha(time.elapsed_secs() - born.0));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn fade_uses_the_native_three_second_clock_boundaries() {
        let vectors: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/notifications/native-clock-fixtures.json"
        )).unwrap();
        let bits = |value: &str| u32::from_le_bytes(std::array::from_fn(|index| {
            u8::from_str_radix(&value[index*2..index*2+2], 16).unwrap()
        }));
        for row in vectors["fades"].as_array().unwrap() {
            let age = f32::from_bits(bits(row["age_bits"].as_str().unwrap()));
            assert_eq!(alpha(age).to_bits(), bits(row["alpha_bits"].as_str().unwrap()));
        }
    }

    #[test]
    fn equal_and_unordered_expiry_and_loading_cover_deferral() {
        let mut state = Notifications::default();
        state.rows = vec![Row { text: "first".into(), born: 10., account: false },
            Row { text: "second".into(), born: 11., account: false },
            Row { text: "invalid".into(), born: f32::NAN, account: false }];
        state.update(13.);
        assert_eq!(state.rows.iter().map(|row| row.text.as_str()).collect::<Vec<_>>(), ["second"]);
        state.defer_expiry = true;
        state.update(100.);
        assert_eq!(state.rows.len(), 1);
        assert_eq!(state.rows[0].born, 100.);
        assert_eq!(state.key(), 100001);
        state.defer_expiry = false;
        state.update(103.);
        assert!(state.rows.is_empty());
    }
}
