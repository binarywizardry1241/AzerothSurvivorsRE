//! Current native Achievements sidebar flow; see achievements-menu-0.109.0.md.
use super::*;

pub(super) fn draw(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    labels: &MenuCatalog,
    points: u32,
    total_points: u32,
    earned: usize,
    total: usize,
    counts: &[(usize, usize, u32, u32)],
    category: Option<usize>,
    inspection: bool,
) {
    crate::codex::section_heading(ui, art, labels.label("Achievements"));
    ui.spawn(Node {
        width: Val::Percent(100.),
        height: Val::Px(150.),
        align_items: AlignItems::Center,
        justify_content: JustifyContent::Center,
        ..default()
    })
    .with_children(|medallion| {
        for flip_x in [false, true] {
            medallion.spawn((
                ImageNode {
                    image: images.dragon.clone(),
                    color: Color::srgba(1., 1., 1., 0.85),
                    flip_x,
                    ..default()
                },
                Node {
                    position_type: PositionType::Absolute,
                    left: if flip_x { Val::Auto } else { Val::Px(18.) },
                    right: if flip_x { Val::Px(18.) } else { Val::Auto },
                    top: Val::Px(30.),
                    width: Val::Px(84.),
                    height: Val::Px(84.),
                    ..default()
                },
            ));
        }
        medallion
            .spawn((
                Node {
                    width: Val::Px(128.),
                    height: Val::Px(128.),
                    border: UiRect::all(Val::Px(3.)),
                    border_radius: BorderRadius::all(Val::Px(f32::MAX)),
                    flex_direction: FlexDirection::Column,
                    align_items: AlignItems::Center,
                    justify_content: JustifyContent::Center,
                    ..default()
                },
                BackgroundGradient::from(RadialGradient {
                    position: UiPosition::CENTER.at_y(Val::Percent(-15.)),
                    shape: RadialGradientShape::FarthestCorner,
                    stops: vec![
                        ColorStop::new(Color::linear_rgba(0.42, 0.27, 0.07, 1.), Val::Percent(0.)),
                        ColorStop::new(Color::linear_rgba(0.16, 0.09, 0.02, 1.), Val::Percent(75.)),
                    ],
                    ..default()
                }),
                BorderColor::all(GOLD),
                BoxShadow::new(
                    Color::srgba(0.973, 0.824, 0.416, 0.45),
                    Val::Px(0.),
                    Val::Px(0.),
                    Val::Px(2.),
                    Val::Px(26.),
                ),
            ))
            .with_children(|circle| {
                text(
                    circle,
                    art,
                    points.to_string(),
                    if points < 1000 { 48. } else { 40. },
                    GOLD,
                );
                text(
                    circle,
                    art,
                    label(labels, "of {total}", &[("total", total_points.to_string())]),
                    11.,
                    Color::srgb(0.69, 0.541, 0.227),
                );
            });
    });
    ui.spawn(Node {
        flex_direction: FlexDirection::Column,
        row_gap: Val::Px(4.),
        margin: UiRect::bottom(Val::Px(8.)),
        ..default()
    })
    .with_children(|progress| {
        progress
            .spawn(Node {
                justify_content: JustifyContent::SpaceBetween,
                ..default()
            })
            .with_children(|row| {
                text(row, art, labels.label("Account progress"), 12., PAPER);
                text(
                    row,
                    art,
                    format!("{}%", points.wrapping_mul(100) / total_points.max(1)),
                    12.,
                    GOLD,
                );
            });
        bar_flow(
            progress,
            images,
            10.,
            points as f32 / total_points.max(1) as f32,
        );
    });
    control(
        ui,
        art,
        images,
        labels.label("Summary"),
        "INV_Misc_Note_01",
        AchievementCategory { category: None, inspection },
        None,
        category.is_none(),
    );
    for (index, (have, all, _, _)) in counts.iter().copied().enumerate() {
        control(
            ui,
            art,
            images,
            labels.label(CATEGORIES[index]),
            CATEGORY_ICONS[index],
            AchievementCategory { category: Some(index), inspection },
            Some((have, all)),
            category == Some(index),
        );
    }
    ui.spawn(Node {
        flex_direction: FlexDirection::Column,
        row_gap: Val::Px(4.),
        margin: UiRect::top(Val::Auto),
        ..default()
    })
    .with_children(|footer| {
        text(footer, art, label(labels, "{earned} of {total} earned",
             &[("earned", earned.to_string()), ("total", total.to_string())]), 13., PAPER);
        text(footer, art, labels.label("Every hero of every class earns them for the whole account. Spend the points on the Rewards tab."),
             12., MUTED);
    });
}

fn control(
    ui: &mut ChildSpawnerCommands,
    art: &MenuArt,
    images: &Art,
    value: &str,
    icon: &str,
    control: AchievementCategory,
    counts: Option<(usize, usize)>,
    selected: bool,
) {
    let resting = if selected {
        GOLD
    } else {
        Color::srgb(0.169, 0.129, 0.071)
    };
    let colors = if selected {
        [
            Color::srgba(0.36, 0.22, 0.06, 0.75),
            Color::srgba(0.12, 0.07, 0.02, 0.55),
        ]
    } else {
        [
            Color::srgba(0., 0., 0., 0.45),
            Color::srgba(0., 0., 0., 0.25),
        ]
    };
    ui.spawn((
        Button,
        control,
        Node {
            padding: UiRect::axes(Val::Px(8.), Val::Px(6.)),
            border: UiRect::all(Val::Px(1.)),
            border_radius: BorderRadius::all(Val::Px(6.)),
            align_items: AlignItems::Center,
            column_gap: Val::Px(10.),
            ..default()
        },
        BorderColor::all(resting),
        BackgroundGradient::from(LinearGradient {
            angle: std::f32::consts::FRAC_PI_2,
            stops: colors.into_iter().map(ColorStop::from).collect(),
            ..default()
        }),
        crate::hover::NativeHover::new(resting, PAPER, 0.),
        UiTransform::default(),
    ))
    .with_children(|row| {
        if let Some(image) = images.icons.get(icon) {
            row.spawn((
                ImageNode::new(image.clone()),
                Node {
                    width: Val::Px(30.),
                    height: Val::Px(30.),
                    flex_shrink: 0.,
                    border: UiRect::all(Val::Px(1.)),
                    border_radius: BorderRadius::all(Val::Px(4.)),
                    ..default()
                },
                BorderColor::all(if selected { GOLD } else { EDGE }),
            ));
        }
        row.spawn(Node {
            flex_grow: 1.,
            min_width: Val::Px(0.),
            flex_direction: FlexDirection::Column,
            row_gap: Val::Px(4.),
            ..default()
        })
        .with_children(|body| {
            body.spawn(Node {
                justify_content: JustifyContent::SpaceBetween,
                ..default()
            })
            .with_children(|line| {
                text(line, art, value, 15., if selected { PAPER } else { GOLD });
                if let Some((have, total)) = counts {
                    text(
                        line,
                        art,
                        format!("{have} / {total}"),
                        12.,
                        if have == total { GREEN } else { MUTED },
                    );
                }
            });
            if let Some((have, total)) = counts {
                bar_flow(body, images, 4., have as f32 / total.max(1) as f32);
            }
        });
    });
}
