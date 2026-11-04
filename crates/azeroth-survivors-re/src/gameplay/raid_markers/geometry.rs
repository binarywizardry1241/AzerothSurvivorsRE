//! Native marker geometry over the real world's decal receivers.
//! Current 0.109.0 projection, arc, annulus and line-fill recovery is retained
//! in docs/analysis/raid-markers-0.109.0.md, with native replay limits.
use azeroth_survivors_re::raid_markers::{Kind, Marker, Shape};
use benilla_assets::coords::wow_to_bevy;
use benilla_world::{
    decal::{DecalFrame, WorldDecal},
    particles::buffer::EffectVertex,
};
use bevy::prelude::*;
use std::f32::consts::{FRAC_PI_2, PI, TAU};

pub(super) struct Group {
    pub vertices: Vec<EffectVertex>,
    pub style: u8,
    pub mask: usize,
    pub overlay: bool,
}

struct Builder<'a, 'w, 's> {
    ground: &'a WorldDecal<'w, 's>,
    groups: Vec<Group>,
}

fn frame(position: [f32; 3], facing: f32, bounds: [f32; 4], depth: f32) -> DecalFrame {
    let (sin, cos) = (facing + FRAC_PI_2).sin_cos();
    DecalFrame {
        center: wow_to_bevy(position),
        sin,
        cos,
        min_x: bounds[0],
        max_x: bounds[1],
        min_z: bounds[2],
        max_z: bounds[3],
        min_y: -depth,
        max_y: depth,
    }
}

/// Current140147dd0 interpolates nine scalar attributes, then unrolls a fan.
fn clip(vertices: &[EffectVertex], origin: [f32; 3], planes: &[[f32; 3]]) -> Vec<EffectVertex> {
    let distance = |v: &EffectVertex, plane: [f32; 3]| {
        (-v.pos[2] - origin[0]) * plane[0] + (-v.pos[0] - origin[1]) * plane[1] - plane[2]
    };
    let mix = |a: EffectVertex, b: EffectVertex, t: f32| EffectVertex {
        pos: std::array::from_fn(|i| a.pos[i] + (b.pos[i] - a.pos[i]) * t),
        uv: std::array::from_fn(|i| a.uv[i] + (b.uv[i] - a.uv[i]) * t),
        color: std::array::from_fn(|i| a.color[i] + (b.color[i] - a.color[i]) * t),
    };
    let mut result = Vec::new();
    for triangle in vertices.chunks_exact(3) {
        let mut polygon = triangle.to_vec();
        for &plane in planes {
            let mut next = Vec::new();
            for i in 0..polygon.len() {
                let (a, b) = (polygon[i], polygon[(i + 1) % polygon.len()]);
                let (da, db) = (distance(&a, plane), distance(&b, plane));
                if da >= 0. {
                    next.push(a);
                }
                if (da >= 0.) != (db >= 0.) {
                    next.push(mix(a, b, da / (da - db)));
                }
            }
            polygon = next;
            if polygon.len() < 3 {
                break;
            }
        }
        for i in 1..polygon.len().saturating_sub(1) {
            result.extend_from_slice(&[polygon[0], polygon[i], polygon[i + 1]]);
        }
    }
    result
}

fn segments(radius: f32, angle: f32) -> usize {
    let step = (2. * (1. - 0.02 / radius.max(0.04)).acos()).min(PI / 8.);
    ((angle.abs() / step).ceil() as usize).clamp(3, 160)
}

fn wedge(facing: f32, arc: f32) -> Vec<[[f32; 3]; 2]> {
    let first = facing - arc * 0.5;
    let last = facing + arc * 0.5;
    let pair = |a: f32, b: f32| [[-a.sin(), a.cos(), 0.], [b.sin(), -b.cos(), 0.]];
    if arc <= PI {
        vec![pair(first, last)]
    } else {
        vec![pair(first, facing), pair(facing, last)]
    }
}

impl Builder<'_, '_, '_> {
    fn project(
        &mut self,
        frame: DecalFrame,
        origin: [f32; 3],
        planes: &[[f32; 3]],
        style: u8,
        mask: usize,
    ) {
        let mut vertices = Vec::new();
        self.ground
            .project(&mut vertices, &frame, |_| 1., |x, z| frame.rect_uv(x, z));
        if !planes.is_empty() {
            vertices = clip(&vertices, origin, planes);
        }
        self.groups.push(Group {
            vertices,
            style,
            mask,
            overlay: style == 1,
        });
    }

    fn disc(
        &mut self,
        position: [f32; 3],
        radius: f32,
        projection_radius: f32,
        style: u8,
        mask: usize,
        cone: Option<(f32, f32)>,
    ) {
        let bounds = [-radius, radius, -radius, radius];
        let depth = projection_radius * 0.25 + 4.;
        if let Some((angle, arc)) = cone {
            for planes in wedge(angle, arc) {
                self.project(
                    frame(position, 0., bounds, depth),
                    position,
                    &planes,
                    style,
                    mask,
                );
            }
        } else {
            self.project(
                frame(position, 0., bounds, depth),
                position,
                &[],
                style,
                mask,
            );
        }
    }

    fn arc(
        &mut self,
        position: [f32; 3],
        radius: f32,
        start: f32,
        end: f32,
        width: f32,
        style: u8,
        mask: usize,
    ) {
        let count = segments(radius, end - start);
        for i in 0..count {
            let a = (i as f32 * (end - start)) / count as f32 + start;
            let b = ((i + 1) as f32 * (end - start)) / count as f32 + start;
            let p = [
                a.cos() * radius + position[0],
                a.sin() * radius + position[1],
                position[2],
            ];
            let q = [
                b.cos() * radius + position[0],
                b.sin() * radius + position[1],
                position[2],
            ];
            let delta = Vec2::new(q[0] - p[0], q[1] - p[1]);
            let planes = [
                [-a.min(b).sin(), a.min(b).cos(), 0.],
                [a.max(b).sin(), -a.max(b).cos(), 0.],
            ];
            self.project(
                frame(
                    p,
                    delta.y.atan2(delta.x),
                    [-width, delta.length() + width, -width, width],
                    radius * 0.25 + 4.,
                ),
                position,
                &planes,
                style,
                mask,
            );
        }
    }

    /// Current14013e2a0: reject wholly inner triangles, retain conservatively distant
    /// triangles, then split boundary triangles into non-overlapping sectors.
    fn donut(&mut self, position: [f32; 3], inner: f32, outer: f32, style: u8) {
        let mut remaining = Vec::new();
        let f = frame(
            position,
            0.,
            [-outer, outer, -outer, outer],
            outer * 0.25 + 4.,
        );
        self.ground
            .project(&mut remaining, &f, |_| 1., |x, z| f.rect_uv(x, z));
        let count = segments(inner, TAU);
        let apothem = (TAU / count as f32 * 0.5).cos() * inner;
        let mut vertices = Vec::new();
        for triangle in remaining.chunks_exact(3) {
            let points: Vec<Vec2> = triangle
                .iter()
                .map(|v| Vec2::new(-v.pos[2] - position[0], -v.pos[0] - position[1]))
                .collect();
            let radii: Vec<f32> = points.iter().map(|p| p.length()).collect();
            if radii.iter().copied().fold(0., f32::max) <= apothem {
                continue;
            }
            let edge = (points[0] - points[1])
                .length()
                .max((points[1] - points[2]).length())
                .max((points[2] - points[0]).length());
            if radii.iter().copied().fold(f32::INFINITY, f32::min)
                >= inner + edge * edge / (inner.max(0.1) * 8.)
            {
                vertices.extend_from_slice(triangle);
                continue;
            }
            for i in 0..count {
                let a = i as f32 * TAU / count as f32;
                let b = (i + 1) as f32 * TAU / count as f32;
                let mid = (a + b) * 0.5;
                vertices.extend(clip(
                    triangle,
                    position,
                    &[
                        [-a.sin(), a.cos(), 0.],
                        [b.sin(), -b.cos(), 0.],
                        [mid.cos(), mid.sin(), apothem],
                    ],
                ));
            }
        }
        self.groups.push(Group {
            vertices,
            style,
            mask: if style == 0 { 0 } else { 1 },
            overlay: false,
        });
    }

    fn rectangle(
        &mut self,
        row: &Marker,
        length: f32,
        width: f32,
        depth: f32,
        style: u8,
        mask: usize,
    ) {
        self.project(
            frame(
                row.position,
                row.facing,
                [0., length, -width * 0.5, width * 0.5],
                depth,
            ),
            row.position,
            &[],
            style,
            mask,
        );
    }

    fn line_outline(&mut self, row: &Marker, length: f32, width: f32, scale: f32) {
        let thickness = (width * 0.3).min(0.9) * scale;
        let depth = length * 0.25 + 4.;
        // Current140166bf0: side strips end at 0 and length; caps share endpoints.
        // Extending the side-strip frames past them recreates the old |-| bug.
        for z in [-width * 0.5, width * 0.5] {
            self.project(
                frame(
                    row.position,
                    row.facing,
                    [0., length, z - thickness, z + thickness],
                    depth,
                ),
                row.position,
                &[],
                1,
                4,
            );
        }
        for x in [0., length] {
            let mut position = row.position;
            position[0] += x * row.facing.cos();
            position[1] += x * row.facing.sin();
            self.project(
                frame(
                    position,
                    row.facing + FRAC_PI_2,
                    [-width * 0.5, width * 0.5, -thickness, thickness],
                    depth,
                ),
                row.position,
                &[],
                1,
                4,
            );
        }
    }
}

pub(super) fn outline(ground: &WorldDecal, row: &Marker) -> Vec<Group> {
    let mut b = Builder {
        ground,
        groups: Vec::new(),
    };
    let p = row.position;
    match row.shape {
        Shape::Circle { radius } => {
            b.disc(p, radius, radius, 0, 0, None);
            b.arc(p, radius, 0., TAU, (radius * 0.3).min(0.9), 1, 4);
        }
        Shape::Donut { inner, outer } => {
            b.donut(p, inner, outer, 0);
            let width = ((outer - inner) * 0.3).min(0.9);
            b.arc(p, outer, 0., TAU, width, 1, 4);
            b.arc(p, inner, 0., TAU, width, 1, 4);
        }
        Shape::Line { length, width } => {
            b.rectangle(row, length, width, length * 0.25 + 4., 0, 2);
            b.line_outline(row, length, width, 1.);
        }
        Shape::Cone { radius, arc } if arc >= 6.2731853 => {
            b.disc(p, radius, radius, 0, 0, None);
            b.arc(p, radius, 0., TAU, (radius * 0.3).min(0.9), 1, 4);
        }
        Shape::Cone { radius, arc } => {
            b.disc(p, radius, radius, 0, 0, Some((row.facing, arc)));
            let width = (radius * 0.3).min(0.9);
            b.arc(
                p,
                radius,
                row.facing - arc * 0.5,
                row.facing + arc * 0.5,
                width,
                1,
                4,
            );
            for (angle, side) in [(row.facing - arc * 0.5, -1.), (row.facing + arc * 0.5, 1.)] {
                // Each radial stroke stays on its own side of the centerline.
                // A forward-facing half-plane incorrectly erases wide cones.
                let plane = [-row.facing.sin() * side, row.facing.cos() * side, 0.];
                b.project(
                    frame(p, angle, [0., radius, -width, width], radius * 0.25 + 4.),
                    p,
                    &[plane],
                    1,
                    4,
                );
            }
        }
    }
    if row.kind == Kind::Tower {
        b.arc(p, 0.67499995, 0., TAU, 0.3, 4, 4);
        b.project(frame(p, 0., [-0.9, 0.9, -0.9, 0.9], 4.225), p, &[], 5, 1);
    }
    b.groups
}

pub(super) fn fill(ground: &WorldDecal, row: &Marker, progress: f32) -> Vec<Group> {
    let mut b = Builder {
        ground,
        groups: Vec::new(),
    };
    if progress <= 0.01 {
        return b.groups;
    }
    let p = row.position;
    match row.shape {
        Shape::Circle { radius }
        | Shape::Cone {
            radius,
            arc: 6.2731853..,
        } => {
            let filled = progress * radius;
            b.disc(p, filled, radius, 2, 1, None);
            if row.winding() {
                b.arc(p, filled, 0., TAU, (radius * 0.3).min(1.2), 3, 5);
            }
        }
        Shape::Donut { inner, outer } => {
            let filled = outer - progress * (outer - inner);
            b.donut(p, filled, outer, 2);
            if row.winding() && progress < 0.995 {
                b.arc(p, filled, TAU, 0., ((outer - inner) * 0.3).min(1.2), 3, 5);
            }
        }
        Shape::Line { length, width } => {
            let filled = length * progress;
            b.rectangle(row, filled, width, length * 0.25 + 4., 2, 3);
            if row.winding() {
                // 0.109.0 1401688fc..14016899d: the head clips and maps UVs
                // to the same trailing 1.8-unit strip, shortened at the start.
                let begin = (filled - 1.8).max(0.);
                b.project(
                    frame(
                        p,
                        row.facing,
                        [begin, filled, -width * 0.5, width * 0.5],
                        length * 0.25 + 4.,
                    ),
                    p,
                    &[],
                    3,
                    6,
                );
            }
        }
        Shape::Cone { radius, arc } => {
            let filled = radius * progress;
            b.disc(p, filled, radius, 2, 1, Some((row.facing, arc)));
            if row.winding() {
                b.arc(
                    p,
                    filled,
                    row.facing - arc * 0.5,
                    row.facing + arc * 0.5,
                    (radius * 0.3).min(1.2),
                    3,
                    5,
                );
            }
        }
    }
    b.groups
}

/// Current140164000 /140147a50: 32 segments per band, additive and depth-tested.
pub(super) fn columns(row: &Marker, progress: f32, now: f32) -> Vec<EffectVertex> {
    let (Kind::Tower, Shape::Circle { radius }) = (row.kind, row.shape) else {
        return Vec::new();
    };
    let center = wow_to_bevy(row.position);
    let brighten = if row.fade_end.is_some() { 1.6 } else { 1. };
    let rgb = row.color().map(|c| (c * brighten).min(1.));
    let gain = row.fade(now) * if row.occupied { 1.5 } else { 1. };
    let base = center.y - 0.5;
    let height = radius + 8.;
    let mut vertices = Vec::new();
    let mut band = |radius: f32, yaw: f32, lower: f32, upper: f32, bottom: f32, top: f32| {
        for i in 0..32 {
            let u = i as f32 * 0.03125;
            let v = (i + 1) as f32 * 0.03125;
            let a = u * TAU + yaw;
            let b = v * TAU + yaw;
            let vertex = |angle: f32, y: f32, u: f32, alpha: f32| EffectVertex {
                pos: [
                    angle.cos() * radius + center.x,
                    y,
                    angle.sin() * radius + center.z,
                ],
                uv: [u, 0.5],
                color: [rgb[0], rgb[1], rgb[2], alpha],
            };
            let a0 = vertex(a, lower, u, bottom);
            let b0 = vertex(b, lower, v, bottom);
            let a1 = vertex(a, upper, u, top);
            let b1 = vertex(b, upper, v, top);
            vertices.extend_from_slice(&[a0, b0, b1, a0, b1, a1]);
        }
    };
    band(radius, now * 0.35, base, base + height, gain * 0.22, 0.);
    if progress > 0.01 {
        band(
            radius * 0.97,
            -now * 0.35,
            base,
            base + height * progress,
            gain * 0.5,
            gain * 0.12,
        );
    }
    for i in 0..2 {
        let phase = (i as f32 * 0.5 + now * 0.45).fract();
        let y = base + phase * height;
        let alpha = (1. - phase) * gain * 0.55;
        band(radius * 1.01, now * 0.35, y - 0.3, y, 0., alpha);
        band(radius * 1.01, now * 0.35, y, y + 0.3, alpha, 0.);
    }
    vertices
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn current_native_clipper_interpolates_height_uv_and_alpha_on_the_boundary() {
        let v = |pos, uv, alpha| EffectVertex {
            pos,
            uv,
            color: [1., 1., 1., alpha],
        };
        let triangle = [
            v([0., 1., 1.], [0., 0.], 1.),
            v([0., 2., -1.], [1., 0.], 0.5),
            v([-2., 3., 0.], [0.5, 1.], 0.),
        ];
        let result = clip(&triangle, [0.; 3], &[[1., 0., 0.]]);
        // Current140147dd0 retains the boundary duplicate and emits its degenerate
        // final fan triangle; silently deduplicating changes native topology.
        assert_eq!(result.len(), 6);
        assert_eq!(result[0].pos, [0., 1.5, 0.]);
        assert_eq!(result[0].uv, [0.5, 0.]);
        assert_eq!(result[0].color[3], 0.75);
        assert_eq!(result[4].pos, result[5].pos);
    }

    #[test]
    fn corrected_line_side_projection_stops_at_both_end_caps() {
        let side = frame([100., 200., 3.], 0., [0., 20., 2.1, 3.9], 9.);
        assert_eq!((side.min_x, side.max_x), (0., 20.));
        assert_eq!(side.center, Vec3::new(-200., 3., -100.));
        assert!((side.sin - 1.).abs() < 0.000001);
        assert!(side.cos.abs() < 0.000001);
    }
}

/// 0.140.0 shape 9 triangulates the arena contour, then clips the projected
/// ground to the danger area outside the authored safe square.
fn field(
    ground: &WorldDecal,
    polygon: &[[f32; 2]],
    [left, bottom, right, top]: [f32; 4],
    [low, high]: [f32; 2],
) -> Group {
    let points: Vec<_> = polygon.iter().map(|&[x, y]| Vec2::new(x, y)).collect();
    let min = points
        .iter()
        .copied()
        .fold(Vec2::splat(f32::MAX), Vec2::min);
    let max = points
        .iter()
        .copied()
        .fold(Vec2::splat(f32::MIN), Vec2::max);
    let center = (min + max) * 0.5;
    let half = (max - min).max_element() * 0.5;
    let origin = [center.x, center.y, low];
    let mut frame = frame(origin, 0., [-half, half, -half, half], 0.);
    frame.max_y = high - low;
    let mut ground_vertices = Vec::new();
    ground.project(
        &mut ground_vertices,
        &frame,
        |_| 1.,
        |x, z| frame.rect_uv(x, z),
    );

    let area: f32 = points
        .iter()
        .zip(points.iter().cycle().skip(1))
        .map(|(a, b)| a.perp_dot(*b))
        .sum();
    let mut contour = points.clone();
    if area < 0. {
        contour.reverse();
    }
    let origin_xy = Vec2::new(origin[0], origin[1]);
    let plane = |a: Vec2, b: Vec2| {
        let edge = b - a;
        let normal = Vec2::new(-edge.y, edge.x);
        [normal.x, normal.y, normal.dot(a - origin_xy)]
    };
    let mut vertices = Vec::new();
    let regions: [&[[f32; 3]]; 4] = [
        &[[-1., 0., center.x - left]],
        &[[1., 0., right - center.x]],
        &[
            [1., 0., left - center.x],
            [-1., 0., center.x - right],
            [0., -1., center.y - bottom],
        ],
        &[
            [1., 0., left - center.x],
            [-1., 0., center.x - right],
            [0., 1., top - center.y],
        ],
    ];
    // Each clipped ear is convex and the ears only share their boundary.
    while contour.len() >= 3 {
        let len = contour.len();
        let Some(index) = (0..len).find(|&i| {
            let a = contour[(i + len - 1) % len];
            let b = contour[i];
            let c = contour[(i + 1) % len];
            (b - a).perp_dot(c - a) > 0.0001
                && !contour.iter().copied().any(|p| {
                    p != a
                        && p != b
                        && p != c
                        && (b - a).perp_dot(p - a) >= 0.
                        && (c - b).perp_dot(p - b) >= 0.
                        && (a - c).perp_dot(p - c) >= 0.
                })
        }) else {
            break;
        };
        let a = contour[(index + len - 1) % len];
        let b = contour[index];
        let c = contour[(index + 1) % len];
        let in_contour = clip(
            &ground_vertices,
            origin,
            &[plane(a, b), plane(b, c), plane(c, a)],
        );
        for planes in regions {
            vertices.extend(clip(&in_contour, origin, planes));
        }
        contour.remove(index);
    }
    Group {
        vertices,
        style: 7,
        mask: 8,
        overlay: false,
    }
}

pub(super) fn scripted_body(
    ground: &WorldDecal,
    row: &super::scripted::Part,
    scale: f32,
) -> Vec<Group> {
    use super::scripted::Shape;
    let mut builder = Builder {
        ground,
        groups: Vec::new(),
    };
    match &row.shape {
        Shape::Field {
            polygon,
            square,
            z_range,
        } => {
            vec![field(ground, polygon, *square, *z_range)]
        }
        Shape::Circle { radius } => {
            builder.disc(row.position, *radius, *radius, 0, 0, None);
            builder.arc(
                row.position,
                *radius,
                0.,
                TAU,
                (radius * 0.3).min(0.9) * scale,
                1,
                4,
            );
            builder.groups
        }
        Shape::Rect { length, width } => {
            let marker = row.rectangle_marker(*length, *width);
            builder.rectangle(&marker, *length, *width, length * 0.25 + 4., 0, 2);
            builder.line_outline(&marker, *length, *width, scale);
            builder.groups
        }
    }
}

pub(super) fn scripted_fill(
    ground: &WorldDecal,
    row: &super::scripted::Part,
    clock: f32,
) -> Vec<Group> {
    use super::scripted::Shape;
    let mut builder = Builder {
        ground,
        groups: Vec::new(),
    };
    let progress = row.progress();
    if progress <= 0.01 {
        return builder.groups;
    }
    match &row.shape {
        Shape::Field { .. } => {}
        Shape::Circle { radius } => {
            let filled = progress * radius;
            builder.disc(row.position, filled, *radius, 2, 1, None);
            if row.winding(clock) {
                builder.arc(row.position, filled, 0., TAU, (radius * 0.3).min(1.2), 3, 5);
            }
        }
        Shape::Rect { length, width } => {
            let filled = length * progress;
            let depth = length * 0.25 + 4.;
            builder.rectangle(
                &row.rectangle_marker(*length, *width),
                filled,
                *width,
                depth,
                2,
                3,
            );
            if row.winding(clock) {
                builder.project(
                    frame(
                        row.position,
                        row.angle,
                        [(filled - 1.8).max(0.), filled, -width * 0.5, width * 0.5],
                        depth,
                    ),
                    row.position,
                    &[],
                    3,
                    6,
                );
            }
        }
    }
    builder.groups
}
