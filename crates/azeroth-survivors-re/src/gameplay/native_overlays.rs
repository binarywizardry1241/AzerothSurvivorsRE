//! Choice overlays with selected-target 0.100.1 animation and reward recovery.
//! Current owners:14021aed0 (root),14021ce50 (animation),14021e120 (rays),
//!1401f47e0 (tile),1401f3210 (tooltip) and1401f9880 (replacement tooltip).
//! See docs/analysis/upgrade-flow-0.100.1.md and treasure-pipeline-0.100.1.md.
//! Base layout retains its recorded0.97.2 provenance until independently checked;
//! historical inline addresses below are not promoted to current addresses.
//! Card sizing, shared text font and bottom-pinned footer are revalidated against
//! 0.105.0; see docs/analysis/card-layout-0.105.0.md.
//! The 0.127.0 cardRays setting is connected in card-rays-0.127.0.md.
//! This module presents supplied choices; it never creates rewards or spends gold.

use crate::{assets::MenuArt, canvas::NativeCanvas, localization::Localization};
use bevy::prelude::*;
pub(super) mod tooltip;
pub(super) mod confirmation;

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum Reason {
    #[default]
    LevelUp,
    Guardian,
    Cache,
}

#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum CardKind {
    NewSpell,
    UpgradeSpell,
    Ring,
    Trinket,
    Amulet,
    Gold,
    #[default]
    Other,
}

/// These are presentation fields in the native JSON, not fabricated UI prose.
/// The current runtime's level-choice adapter can fill known identity/rank/slot
/// fields. A missing native description stays empty until its producer attaches.
#[derive(Clone, Debug, Default)]
pub struct Card {
    pub kind: CardKind,
    pub name: String,
    pub title: String,
    pub icon: Option<Handle<Image>>,
    pub rarity: usize,
    pub text: String,
    pub lines: Vec<String>,
    pub rank: Option<u64>,
    pub worn: u64,
    pub slot_count: Option<u64>,
    pub replaces: Option<String>,
    pub banish: bool,
    pub replacement: Option<ReplacementItem>,
}

#[derive(Clone, Debug)]
pub struct ReplacementItem {
    pub name: String,
    pub icon: Option<Handle<Image>>,
    pub rarity: usize,
    pub rank: u32,
    pub lines: Vec<String>,
}

#[derive(Clone, Debug)]
pub struct OverlayState {
    pub reason: Reason,
    pub level: u32,
    pub cards: Vec<Card>,
    pub rerolls: u64,
    pub reroll_cost: u64,
    pub gold: u64,
    pub banishes: u64,
    pub skip_gold: Option<u64>,
    pub skip_key: Option<String>,
    /// 0.127.0 CardsState+120 gates reroll in addition to its affordability.
    pub can_reroll: bool,
    /// Caller enforces native per-action timing and terminal/session gates;
    /// Reroll is admitted during entrance while other actions wait 0.45 seconds.
    pub inputs_enabled: bool,
    /// Native CardsState opening clock; preserve across the .32 input gate.
    pub opened_at: Option<f32>,
    pub ray_image: Option<Handle<Image>>,
}

impl Default for OverlayState {
    fn default() -> Self {
        Self {
            reason: Reason::LevelUp,
            level: 0,
            cards: Vec::new(),
            rerolls: 0,
            reroll_cost: u64::MAX,
            gold: 0,
            banishes: 0,
            skip_gold: None,
            skip_key: None,
            can_reroll: false,
            inputs_enabled: false,
            opened_at: None,
            ray_image: None,
        }
    }
}

impl Card {
    /// Native card JSON uses a string for `lines`, split into displayed lines.
    /// Icon decoding is supplied by the owning MPQ art loader.
    pub fn from_payload(
        value: &serde_json::Value,
        resolve_icon: impl FnOnce(&str) -> Option<Handle<Image>>,
    ) -> Self {
        let string = |key| {
            value
                .get(key)
                .and_then(serde_json::Value::as_str)
                .unwrap_or("")
                .to_owned()
        };
        let kind = match string("kind").as_str() {
            "new" => CardKind::NewSpell,
            "upgrade" => CardKind::UpgradeSpell,
            "ring" => CardKind::Ring,
            "trinket" => CardKind::Trinket,
            "amulet" => CardKind::Amulet,
            "gold" => CardKind::Gold,
            _ => CardKind::Other,
        };
        Self {
            kind,
            name: string("name"),
            title: string("title"),
            icon: resolve_icon(&string("icon")),
            rarity: value
                .get("rarity")
                .and_then(serde_json::Value::as_u64)
                .unwrap_or(0)
                .min(4) as usize,
            text: string("text"),
            lines: string("lines").lines().map(str::to_owned).collect(),
            rank: value.get("rank").and_then(serde_json::Value::as_u64),
            worn: value
                .get("worn")
                .and_then(serde_json::Value::as_u64)
                .unwrap_or(0),
            slot_count: None,
            replaces: value
                .get("replaces")
                .and_then(serde_json::Value::as_str)
                .map(str::to_owned),
            banish: value
                .get("banish")
                .and_then(serde_json::Value::as_bool)
                .unwrap_or(false),
            replacement: None,
        }
    }
}

#[derive(Component, Clone, Copy, Debug, PartialEq, Eq)]
pub enum OverlayAction {
    Select(usize),
    Banish(usize),
    Reroll,
    Skip,
    Confirm,
    Cancel,
}
#[derive(Component, Clone)]
pub(super) struct PresentedCard(pub Card);
#[derive(Component, Clone, Copy, Debug)]
pub struct Enabled(pub bool);
#[derive(Component)]
pub struct OverlayRoot;

// Native1400c1d40's switch at14590002c; original table loads, not standard WoW colors.
const TEXT: [[f32; 3]; 5] = [
    [0.910, 0.910, 0.910],
    [0.118, 1., 0.],
    [0.231, 0.612, 1.],
    [0.761, 0.486, 1.],
    [1., 0.604, 0.165],
];
const BORDER: [[f32; 3]; 5] = [
    [0.541, 0.541, 0.541],
    [0.075, 0.541, 0.],
    [0.039, 0.310, 0.612],
    [0.420, 0.122, 0.659],
    [0.698, 0.329, 0.],
];
const TINT: [[f32; 3]; 5] = [
    [0.165, 0.161, 0.145],
    [0.067, 0.161, 0.047],
    [0.047, 0.110, 0.200],
    [0.133, 0.063, 0.227],
    [0.227, 0.114, 0.020],
];
const GOLD: Color = Color::srgb(0.973, 0.824, 0.416);
const MUTED: Color = Color::srgb(0.725, 0.663, 0.510);
const PALE: Color = Color::srgb(1., 0.914, 0.659);
const CARD_BODY: Color = Color::srgb(0.949, 0.902, 0.788);
fn rgb(v: [f32; 3]) -> Color {
    Color::srgb(v[0], v[1], v[2])
}
fn linear(v: [f32; 3], alpha: f32) -> Color {
    Color::linear_rgba(v[0], v[1], v[2], alpha)
}

/// Native Card stores its stagger and an eased hover value. The first update
/// binds the existing root's opening time; changing only input availability must
/// retain the root rather than respawning its cards.
#[derive(Component)]
pub(super) struct CardAnimation {
    index: usize,
    opened_at: Option<f32>,
    hover: f32,
    color: [f32; 3],
}

#[derive(Component)]
pub(super) struct Breathe;

#[derive(Component)]
pub(super) struct Rim;
#[derive(Component)]
pub(super) struct Rays;

/// Current14021ce50 entrance, hover and selected-card exit transforms; the
/// original0.97.2 recovery remains a historical layout reference.
pub(super) fn animate(
    time: Res<Time>,
    selection: Res<super::ChoicePresentation>,
    options: Option<Res<crate::options::OptionsState>>,
    mut cards: Query<
        (
            &Interaction,
            &mut CardAnimation,
            &mut UiTransform,
            &mut BoxShadow,
        ),
        (Without<Breathe>, Without<Rays>),
    >,
    mut glows: Query<&mut UiTransform, (With<Breathe>, Without<CardAnimation>, Without<Rays>)>,
    mut rims: Query<&mut BorderGradient, With<Rim>>,
    mut rays: Query<(&mut UiTransform, &mut Visibility), (With<Rays>, Without<Breathe>, Without<CardAnimation>)>,
) {
    let now = time.elapsed_secs();
    let hover_blend = (time.delta_secs() * 14.).min(1.);
    for (interaction, mut card, mut transform, mut shadow) in &mut cards {
        let opened = *card.opened_at.get_or_insert(now);
        let t = ((now - opened - (card.index as f32 * 0.11 + 0.08)) / 0.55).clamp(0., 1.);
        let entrance = if t > 0. {
            let x = t - 1.;
            x * x * 1.4 + x * x * x * 2.4 + 1.
        } else {
            0.
        };
        let target = if selection.closing.is_none() && t >= 1. && *interaction != Interaction::None
        {
            1.
        } else {
            0.
        };
        card.hover = (target - card.hover) * hover_blend + card.hover;
        let hover_scale = card.hover * 0.035 + 1.;
        transform.scale = Vec2::new(
            hover_scale * entrance.clamp(0., 1.2),
            hover_scale * (entrance * 0.15 + 0.85),
        );
        let mut y = card.hover * -10. + (1. - entrance) * 80.;
        let selected = selection
            .closing
            .is_some_and(|(index, _)| index == card.index);
        if let Some((_, began)) = selection.closing {
            let progress = ((now - began) / super::CHOICE_EXIT_SECONDS).clamp(0., 1.);
            transform.scale *= 1. + progress * if selected { 0.1 } else { -0.12 };
            y += progress * if selected { -30. } else { 40. };
        }
        transform.translation = bevy::ui::Val2::px(0., y);
        let h = card.hover.max(if selected { 1. } else { 0. });
        *shadow = BoxShadow(vec![
            ShadowStyle {
                color: Color::linear_rgba(0., 0., 0., 0.75),
                x_offset: Val::Px(0.),
                y_offset: Val::Px(18. + 6. * h),
                spread_radius: Val::Px(0.),
                blur_radius: Val::Px(40.),
            },
            ShadowStyle {
                color: linear(card.color, h * 0.55),
                x_offset: Val::Px(0.),
                y_offset: Val::Px(0.),
                spread_radius: Val::Px(4.),
                blur_radius: Val::Px(34.),
            },
        ]);
    }
    for mut rim in &mut rims {
        *rim = BorderGradient::from(legendary_rim(now * 2.1));
    }
    // Native elapsed time (rather than opening age) is shared by every glow.
    let scale = (now * 2.6).sin() * 0.06 + 1.;
    for mut transform in &mut glows {
        transform.scale = Vec2::splat(scale);
    }
    let show_rays = options.as_ref().is_none_or(|options| options.card_rays_enabled());
    for (mut transform, mut visibility) in &mut rays {
        transform.rotation = Rot2::radians(now * 0.1);
        *visibility = if show_rays { Visibility::Inherited } else { Visibility::Hidden };
    }
}

/// Native rarity4 branch1400c1f77/1400c2c61 and rotating owner1400d98a6.
fn legendary_rim(angle: f32) -> ConicGradient {
    ConicGradient {
        start: angle,
        position: UiPosition::CENTER,
        stops: [
            Color::srgb(1., 0.871, 0.478),
            Color::srgb(1., 0.478, 0.),
            Color::srgb(1., 0.953, 0.690),
            Color::srgb(1., 0.604, 0.165),
            Color::srgb(1., 0.871, 0.478),
        ]
        .into_iter()
        .map(AngularColorStop::auto)
        .collect(),
        ..default()
    }
}

/// Spawn the native hierarchy and recovered animation state. The parent must despawn the returned root
/// when its choice payload changes and consume actions only when Enabled(true).
/// This uses the existing per-root canvas fit system, with the target's own
/// 1280x760 design and1.35 maximum scale (native140217c35 bundle).
pub fn spawn(
    commands: &mut Commands,
    art: &MenuArt,
    locale: &Localization,
    state: &OverlayState,
) -> Entity {
    let color = match state.reason {
        Reason::LevelUp => GOLD,
        Reason::Guardian => Color::srgb(0.64, 0.21, 0.93),
        Reason::Cache => Color::srgb(0.44, 0.83, 1.),
    };
    let (header, title, subtitle) = match state.reason {
        Reason::LevelUp => (
            locale
                .label("LEVEL {n}")
                .replace("{n}", &state.level.to_string()),
            "Level Up!",
            "Choose a spell. Its rarity decides how strong it is.",
        ),
        Reason::Guardian => (
            locale.label("GUARDIAN SLAIN").to_owned(),
            "Its Hoard!",
            "Its lair yields jewelry. Choose one.",
        ),
        Reason::Cache => (
            locale.label("BATTLEGROUND CACHE").to_owned(),
            "Treasure!",
            "Choose a ring, a trinket or an amulet.",
        ),
    };
    commands
        .spawn((
            OverlayRoot,
            Node {
                position_type: PositionType::Absolute,
                width: Val::Percent(100.),
                height: Val::Percent(100.),
                ..default()
            },
            GlobalZIndex(6000),
            Interaction::None,
            bevy::ui::FocusPolicy::Block,
            BackgroundGradient::from(RadialGradient {
                position: UiPosition::CENTER.at(Val::Px(0.), Val::Percent(-5.)),
                shape: RadialGradientShape::FarthestCorner,
                stops: vec![
                    ColorStop::new(Color::linear_rgba(0.16, 0.08, 0.02, 0.55), Val::Percent(0.)),
                    ColorStop::new(Color::linear_rgba(0., 0., 0., 0.88), Val::Percent(70.)),
                ],
                ..default()
            }),
        ))
        .with_children(|root| {
            if let Some(image) = &state.ray_image {
                root.spawn((
                    Rays,
                    UiTransform::default(),
                    Visibility::Inherited,
                    ImageNode {
                        image: image.clone(),
                        color: color.with_alpha(0.1),
                        ..default()
                    },
                    Node {
                        position_type: PositionType::Absolute,
                        left: Val::Vw(-30.),
                        top: Val::Vh(45.),
                        width: Val::Vw(160.),
                        height: Val::Vw(160.),
                        margin: UiRect::top(Val::Vw(-80.)),
                        ..default()
                    },
                ));
            }
            root.spawn((
                NativeCanvas {
                    design: Vec2::new(1280., 760.),
                    max_scale: 1.35,
                },
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Px(1280.),
                    height: Val::Px(760.),
                    ..default()
                },
            ))
            .with_children(|canvas| {
                canvas
                    .spawn(Node {
                        width: Val::Percent(100.),
                        height: Val::Percent(100.),
                        flex_direction: FlexDirection::Column,
                        align_items: AlignItems::Center,
                        justify_content: JustifyContent::Center,
                        row_gap: Val::Px(18.),
                        ..default()
                    })
                    .with_children(|ui| {
                        ui.spawn(Node {
                            flex_direction: FlexDirection::Column,
                            align_items: AlignItems::Center,
                            ..default()
                        })
                        .with_children(|ui| {
                            text(ui, art, header, 13., color, false, Node::default());
                            text(
                                ui,
                                art,
                                locale.label(title),
                                60.,
                                PALE,
                                true,
                                Node::default(),
                            );
                            text(
                                ui,
                                art,
                                locale.label(subtitle),
                                16.,
                                MUTED,
                                false,
                                Node::default(),
                            );
                        });
                        let show_banish = state.cards.iter().any(|card| card.banish);
                        ui.spawn(Node {
                            column_gap: Val::Px(26.),
                            align_items: AlignItems::Stretch,
                            ..default()
                        })
                        .with_children(|row| {
                            for (index, card) in state.cards.iter().enumerate() {
                                row.spawn(Node {
                                    flex_direction: FlexDirection::Column,
                                    align_items: AlignItems::Center,
                                    row_gap: Val::Px(10.),
                                    ..default()
                                })
                                .with_children(|column| {
                                    card_tile(
                                        column,
                                        art,
                                        locale,
                                        card,
                                        index,
                                        state.inputs_enabled,
                                        state.opened_at,
                                    );
                                    if show_banish {
                                        let enabled = state.inputs_enabled
                                            && card.banish
                                            && state.banishes > 0;
                                        footer_button(
                                            column,
                                            art,
                                            locale.label("Banish"),
                                            OverlayAction::Banish(index),
                                            enabled,
                                            true,
                                            Some(state.banishes),
                                        );
                                    }
                                });
                            }
                        });
                        ui.spawn(Node {
                            column_gap: Val::Px(20.),
                            align_items: AlignItems::Center,
                            ..default()
                        })
                        .with_children(|ui| {
                            if let Some(amount) = state.skip_gold {
                                ui.spawn((
                                    Button,
                                    OverlayAction::Skip,
                                    Enabled(state.inputs_enabled),
                                    button_node(false),
                                    button_gradient(),
                                    BorderColor::all(crate::menu::BUTTON_EDGE),
                                ))
                                .with_children(|ui| {
                                    text(
                                        ui,
                                        art,
                                        locale.label("Skip"),
                                        17.,
                                        GOLD,
                                        false,
                                        Node::default(),
                                    );
                                    text(
                                        ui,
                                        art,
                                        locale
                                            .label("+{g} gold")
                                            .replace("{g}", &amount.to_string()),
                                        14.,
                                        MUTED,
                                        false,
                                        Node::default(),
                                    );
                                    if let Some(key) = &state.skip_key {
                                        ui.spawn((
                                            Node {
                                                padding: UiRect::horizontal(Val::Px(5.)),
                                                border: UiRect::all(Val::Px(1.)),
                                                border_radius: BorderRadius::all(Val::Px(3.)),
                                                ..default()
                                            },
                                            BorderColor::all(Color::srgb(0.427, 0.333, 0.145)),
                                        )).with_children(|badge| {
                                            text(
                                                badge, art, key, 11.,
                                                Color::srgb(0.725, 0.663, 0.510), false,
                                                Node::default(),
                                            );
                                        });
                                    }
                                });
                            }
                            let enabled = state.inputs_enabled
                                && state.can_reroll
                                && (state.rerolls > 0 || state.reroll_cost <= state.gold);
                            ui.spawn((
                                Button,
                                OverlayAction::Reroll,
                                Enabled(enabled),
                                button_node(false),
                                button_gradient(),
                                BorderColor::all(crate::menu::BUTTON_EDGE),
                            ))
                            .with_children(|ui| {
                                text(
                                    ui,
                                    art,
                                    locale.label("Reroll"),
                                    17.,
                                    GOLD,
                                    false,
                                    Node::default(),
                                );
                                // The current native footer shows the count/price separately
                                // from Reroll, rather than appending our prior plain label.
                                if state.rerolls > 0 {
                                    text(
                                        ui,
                                        art,
                                        state.rerolls.to_string(),
                                        17.,
                                        PALE,
                                        false,
                                        Node::default(),
                                    );
                                } else {
                                    let c = if enabled {
                                        PALE
                                    } else {
                                        Color::srgb(1., 0.353, 0.235)
                                    };
                                    text(
                                        ui,
                                        art,
                                        state.reroll_cost.to_string(),
                                        17.,
                                        c,
                                        false,
                                        Node::default(),
                                    );
                                    text(
                                        ui,
                                        art,
                                        locale.label("gold"),
                                        14.,
                                        MUTED,
                                        false,
                                        Node::default(),
                                    );
                                }
                            });
                        });
                    });
            });
        })
        .id()
}

fn card_tile(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    locale: &Localization,
    card: &Card,
    index: usize,
    enabled: bool,
    opened_at: Option<f32>,
) {
    let rarity = card.rarity.min(4);
    let border = rgb(BORDER[rarity]);
    let text_color = rgb(TEXT[rarity]);
    let mut tile = ui.spawn((
        Button,
        OverlayAction::Select(index),
        PresentedCard(card.clone()),
        Enabled(enabled),
        CardAnimation {
            index,
            opened_at,
            hover: 0.,
            color: TEXT[rarity],
        },
        UiTransform::default(),
        Node {
            width: Val::Px(252.),
            // 0.108.0 1401360d5: min_height; height remains Auto.
            min_height: Val::Px(388.),
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            border: UiRect::all(Val::Px(2.)),
            border_radius: BorderRadius::all(Val::Px(14.)),
            ..default()
        },
        BorderColor::all(border),
        BackgroundGradient::from(LinearGradient {
            angle: f32::from_bits(0x403e2e93),
            stops: vec![
                ColorStop::new(linear(TINT[rarity], 1.), Val::Percent(0.)),
                ColorStop::new(
                    Color::linear_rgba(0.051, 0.039, 0.027, 1.),
                    Val::Percent(55.),
                ),
                ColorStop::new(
                    Color::linear_rgba(0.020, 0.016, 0.012, 1.),
                    Val::Percent(100.),
                ),
            ],
            ..default()
        }),
        BoxShadow::new(
            Color::linear_rgba(0., 0., 0., 0.75),
            Val::Px(0.),
            Val::Px(18.),
            Val::Px(0.),
            Val::Px(40.),
        ),
    ));
    if rarity == 4 {
        tile.insert((Rim, BorderGradient::from(legendary_rim(0.))));
    }
    tile.with_children(|ui| {
        ui.spawn((
            Node {
                position_type: PositionType::Absolute,
                left: Val::Px(10.),
                top: Val::Px(9.),
                width: Val::Px(26.),
                height: Val::Px(26.),
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Percent(50.)),
                align_items: AlignItems::Center,
                justify_content: JustifyContent::Center,
                ..default()
            },
            BorderColor::all(Color::srgba(1., 1., 1., 0.14)),
            BackgroundColor(Color::srgba(0., 0., 0., 0.6)),
        ))
        .with_children(|ui| {
            text(
                ui,
                art,
                (index + 1).to_string(),
                13.,
                MUTED,
                false,
                Node::default(),
            );
        });
        ui.spawn((
            Node {
                position_type: PositionType::Absolute,
                right: Val::Px(9.),
                top: Val::Px(10.),
                padding: UiRect::axes(Val::Px(7.), Val::Px(2.)),
                border: UiRect::all(Val::Px(1.)),
                border_radius: BorderRadius::all(Val::Px(3.)),
                ..default()
            },
            BorderColor::all(border),
            BackgroundColor(Color::srgba(0., 0., 0., 0.35)),
        ))
        .with_children(|ui| {
            text(
                ui,
                art,
                locale.label(&format!("rarity.{rarity}")),
                11.,
                text_color,
                false,
                Node::default(),
            );
        });
        ui.spawn(Node {
            width: Val::Px(108.),
            height: Val::Px(108.),
            margin: UiRect::top(Val::Px(40.)),
            align_items: AlignItems::Center,
            justify_content: JustifyContent::Center,
            ..default()
        })
        .with_children(|ui| {
            ui.spawn((
                Breathe,
                UiTransform::default(),
                Node {
                    position_type: PositionType::Absolute,
                    width: Val::Px(150.),
                    height: Val::Px(150.),
                    ..default()
                },
                BackgroundGradient::from(RadialGradient {
                    position: UiPosition::CENTER,
                    shape: RadialGradientShape::ClosestSide,
                    stops: vec![
                        ColorStop::new(linear(TEXT[rarity], 0.42), Val::Percent(0.)),
                        ColorStop::new(Color::linear_rgba(0., 0., 0., 0.), Val::Percent(100.)),
                    ],
                    ..default()
                }),
            ));
            if let Some(image) = &card.icon {
                ui.spawn((
                    ImageNode::new(image.clone()),
                    Node {
                        width: Val::Px(84.),
                        height: Val::Px(84.),
                        border: UiRect::all(Val::Px(2.)),
                        border_radius: BorderRadius::all(Val::Px(10.)),
                        ..default()
                    },
                    BorderColor::all(text_color),
                    BoxShadow::new(
                        linear(TEXT[rarity], 0.55),
                        Val::Px(0.),
                        Val::Px(0.),
                        Val::Px(1.),
                        Val::Px(18.),
                    ),
                ));
            }
        });
        let (caption, subtitle, footer) = card_annotations(card, locale);
        text(
            ui,
            art,
            caption,
            11.,
            text_color,
            false,
            Node {
                margin: UiRect::top(Val::Px(12.)),
                ..default()
            },
        );
        text(
            ui,
            art,
            if card.name.is_empty() {
                card.title.clone()
            } else {
                card.name.clone()
            },
            21.,
            text_color,
            // 0.108.0 140241555..14024164e preserves the ordinary body font.
            false,
            Node {
                margin: UiRect::horizontal(Val::Px(12.)),
                ..default()
            },
        );
        if !subtitle.is_empty() {
            text(ui, art, subtitle, 13., MUTED, false, Node::default());
        }
        ui.spawn((
            Node {
                width: Val::Percent(70.),
                height: Val::Px(1.),
                margin: UiRect::vertical(Val::Px(9.)),
                ..default()
            },
            BackgroundGradient::from(LinearGradient {
                angle: std::f32::consts::FRAC_PI_2,
                stops: vec![
                    linear(TEXT[rarity], 0.).into(),
                    linear(TEXT[rarity], 0.7).into(),
                    linear(TEXT[rarity], 0.).into(),
                ],
                ..default()
            }),
        ));
        ui.spawn(Node {
            flex_direction: FlexDirection::Column,
            align_items: AlignItems::Center,
            row_gap: Val::Px(4.),
            padding: UiRect {
                left: Val::Px(14.),
                right: Val::Px(14.),
                bottom: Val::Px(12.),
                ..default()
            },
            ..default()
        })
        .with_children(|ui| {
            // Native content keeps the plain 14px description and the 15px
            // highlighted upgrade lines as independent lanes.
            if !card.text.is_empty() {
                text(ui, art, &card.text, 14., CARD_BODY, false, Node::default());
            }
            for line in &card.lines {
                number_text(ui, art, line);
            }
        });
        let mut footer_row = ui.spawn((
            Node {
                width: Val::Percent(100.),
                // 0.108.0 140241ea0: Auto top margin keeps the note at the bottom
                // of the minimum-height card while long descriptions can grow it.
                margin: UiRect::top(Val::Auto),
                padding: UiRect::axes(Val::Px(10.), Val::Px(9.)),
                border: UiRect::top(Val::Px(1.)),
                border_radius: BorderRadius {
                    bottom_left: Val::Px(12.),
                    bottom_right: Val::Px(12.),
                    ..default()
                },
                align_items: AlignItems::Center,
                justify_content: JustifyContent::Center,
                column_gap: Val::Px(6.),
                ..default()
            },
            BorderColor::all(Color::srgba(1., 1., 1., 0.07)),
            BackgroundColor(Color::srgba(0., 0., 0., 0.35)),
        ));
        if let Some(replacement) = &card.replacement {
            // Current typed tuple (TipHost, Interaction, FocusPolicy) is
            //00/02/01: hover the footer and pass clicks to the parent card.
            footer_row.insert((
                tooltip::ReplacementTooltip(replacement.clone()),
                Interaction::None,
                bevy::ui::FocusPolicy::Pass,
            ));
        }
        footer_row.with_children(|ui| {
            if let Some(replacement) = &card.replacement {
                text(
                    ui,
                    art,
                    locale.label("Replaces"),
                    12.,
                    MUTED,
                    false,
                    Node::default(),
                );
                text(
                    ui,
                    art,
                    &replacement.name,
                    12.,
                    rgb(TEXT[replacement.rarity.min(4)]),
                    false,
                    Node::default(),
                );
            } else {
                text(ui, art, footer, 12., MUTED, false, Node::default());
            }
        });
    });
}

fn card_annotations(card: &Card, locale: &Localization) -> (String, String, String) {
    let fmt = |s: &str, n: u64| locale.label(s).replace("{n}", &n.to_string());
    match card.kind {
        CardKind::NewSpell => (
            locale.label("NEW").into(),
            locale.label("New spell").into(),
            card.slot_count
                .map(|n| fmt("Takes a spell slot · {n}/{max}", n).replace("{max}", "6"))
                .unwrap_or_default(),
        ),
        CardKind::UpgradeSpell => (
            fmt("RANK {n}", card.rank.unwrap_or(1)),
            String::new(),
            locale.label("Improves a spell you know").into(),
        ),
        CardKind::Gold => (
            locale.label("GOLD").into(),
            String::new(),
            locale.label("Nothing left to learn").into(),
        ),
        CardKind::Ring | CardKind::Trinket => {
            let ring = card.kind == CardKind::Ring;
            let footer = if card.rank.is_some() {
                locale
                    .label(if ring {
                        "Upgrades a ring you wear"
                    } else {
                        "Upgrades a trinket you wear"
                    })
                    .into()
            } else {
                card.slot_count
                    .map(|n| {
                        fmt(
                            if ring {
                                "Takes a ring slot · {n}/{max}"
                            } else {
                                "Takes a trinket slot · {n}/{max}"
                            },
                            n,
                        )
                        .replace("{max}", "2")
                    })
                    .unwrap_or_default()
            };
            (
                if card.rank.is_some() {
                    fmt("RANK {n}", card.rank.unwrap_or(1))
                } else {
                    locale.label(if ring { "RING" } else { "TRINKET" }).into()
                },
                String::new(),
                footer,
            )
        }
        CardKind::Amulet => {
            let footer = card
                .replaces
                .as_ref()
                .map(|name| locale.label("Replaces {name}").replace("{name}", name))
                .unwrap_or_else(|| {
                    locale
                        .label(if card.rank.is_some() {
                            "Empowers your amulet"
                        } else {
                            "Takes the amulet slot"
                        })
                        .into()
                });
            (
                if card.rank.is_some() {
                    fmt("RANK {n}", card.rank.unwrap_or(1))
                } else {
                    locale.label("AMULET").into()
                },
                String::new(),
                footer,
            )
        }
        CardKind::Other => (String::new(), String::new(), String::new()),
    }
}

fn text(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    value: impl Into<String>,
    size: f32,
    color: Color,
    heading: bool,
    node: Node,
) {
    ui.spawn((
        Text::new(value),
        TextFont {
            font: if heading {
                art.heading_font.clone()
            } else {
                art.font.clone()
            },
            font_size: size,
            ..default()
        },
        TextColor(color),
        TextLayout::new_with_justify(Justify::Center),
        crate::menu::native_text_shadow(),
        node,
    ));
}

fn number_text(ui: &mut ChildSpawnerCommands, art: &MenuArt, value: &str) {
    let spans = numeric_spans(value);
    let font = TextFont {
        font: art.font.clone(),
        font_size: 15.,
        ..default()
    };
    ui.spawn((
        Text::default(),
        font.clone(),
        TextColor(CARD_BODY),
        TextLayout::new_with_justify(Justify::Center),
        crate::menu::native_text_shadow(),
    ))
    .with_children(|ui| {
        for (span, numeric) in spans {
            ui.spawn((
                TextSpan::new(span),
                // TextSpan has its own required TextFont; it does not inherit
                // the parent's face/size (the default is 20px Fira Mono).
                font.clone(),
                TextColor(if numeric {
                    Color::srgb(0.302, 1., 0.416)
                } else {
                    CARD_BODY
                }),
            ));
        }
    });
}

/// Native1400c7270: decimal digits and an immediately preceding sign form the
/// emphasized run; subsequent digits, decimal points and percent signs stay in it.
pub fn numeric_spans(value: &str) -> Vec<(String, bool)> {
    let chars: Vec<char> = value.chars().collect();
    let mut rows: Vec<(String, bool)> = Vec::new();
    let mut i = 0;
    while i < chars.len() {
        let numeric = chars[i].is_ascii_digit()
            || (matches!(chars[i], '+' | '-')
                && chars.get(i + 1).is_some_and(char::is_ascii_digit));
        let start = i;
        i += 1;
        if numeric {
            while i < chars.len() && (chars[i].is_ascii_digit() || matches!(chars[i], '.' | '%')) {
                i += 1;
            }
        } else {
            while i < chars.len()
                && !chars[i].is_ascii_digit()
                && !(matches!(chars[i], '+' | '-')
                    && chars.get(i + 1).is_some_and(char::is_ascii_digit))
            {
                i += 1;
            }
        }
        rows.push((chars[start..i].iter().collect(), numeric));
    }
    rows
}

fn button_node(small: bool) -> Node {
    Node {
        padding: UiRect::axes(
            Val::Px(if small { 12. } else { 16. }),
            Val::Px(if small { 5. } else { 8. }),
        ),
        border: UiRect::all(Val::Px(1.)),
        border_radius: BorderRadius::all(Val::Px(if small { 5. } else { 6. })),
        align_items: AlignItems::Center,
        column_gap: Val::Px(if small { 6. } else { 8. }),
        ..default()
    }
}
fn button_gradient() -> BackgroundGradient {
    BackgroundGradient::from(LinearGradient {
        angle: std::f32::consts::PI,
        stops: vec![
            Color::linear_rgba(0.231, 0.051, 0.043, 1.).into(),
            Color::linear_rgba(0.102, 0.020, 0.020, 1.).into(),
        ],
        ..default()
    })
}
fn footer_button(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    label: &str,
    action: OverlayAction,
    enabled: bool,
    small: bool,
    remaining: Option<u64>,
) {
    ui.spawn((
        Button,
        action,
        Enabled(enabled),
        button_node(small),
        button_gradient(),
        BorderColor::all(crate::menu::BUTTON_EDGE),
    ))
    .with_children(|ui| {
        text(
            ui,
            art,
            label,
            if small { 13. } else { 17. },
            if enabled { GOLD } else { MUTED },
            false,
            Node::default(),
        );
        if enabled {
            if let Some(remaining) = remaining {
                text(
                    ui,
                    art,
                    remaining.to_string(),
                    13.,
                    MUTED,
                    false,
                    Node::default(),
                );
            }
        }
    });
}

/// Current14021e120's1024x1024 RGBA image payload. Native IAT thunks145756e37
/// and145756e3d bind atan2f/fmodf. The owner supplies the GPU image format and
/// recovered display node; this payload alone does not invent a placement.
/// Cross-platform libm bit identity has not been verified.
pub(super) fn ray_pixels() -> Vec<u8> {
    let mut rgba = vec![255u8; 1024 * 1024 * 4];
    let period = f32::from_bits(0x3e860a92); // Current native1458fce40.
    for y in 0..1024 {
        let other = -(y as f32 + 0.5 - 512.);
        for x in 0..1024 {
            let angle = (x as f32 + 0.5 - 512.).atan2(other);
            let mut phase = angle % period;
            if phase < 0. {
                phase += period;
            }
            let coverage = if phase < 0.02 {
                phase / 0.02
            } else if phase < 0.07 {
                1.
            } else if phase < 0.09 {
                (0.09 - phase) / 0.02
            } else {
                0.
            };
            rgba[(y * 1024 + x) * 4 + 3] = (coverage * 255.).round().clamp(0., 255.) as u8;
        }
    }
    rgba
}
