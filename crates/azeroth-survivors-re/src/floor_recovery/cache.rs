//! Connected indoor floor production from current14552b670/145530800.
//! Input triangles must already have the native map-placement transform. Actual
//! ADT/WMO decoding, placement filtering and residency remain engine boundaries.
use super::HeightGrid;
use std::collections::VecDeque;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Candidate {
    pub cell: usize,
    pub height: f32,
}

#[derive(Clone, Debug)]
pub struct IndoorCache {
    pub origin: [f32; 2],
    pub side: usize,
    pub heights: Vec<f32>,
    // Current indoor construction keeps the connected floor for navigation and
    // also publishes a separate, locally raised surface for actor paths.
    surface_heights: Option<Vec<f32>>,
}
impl IndoorCache {
    pub fn grid(&self) -> HeightGrid<'_> {
        HeightGrid {
            origin: self.origin,
            side: self.side,
            cells: &self.heights,
        }
    }
    /// The original connected half-yard floor, used by occupancy and recovery.
    /// Actor publication uses the independently raised surface through PrimaryCache.
    pub fn height(&self, xy: [f32; 2]) -> Option<f32> {
        self.height_in(xy, &self.heights)
    }
    fn surface_height(&self, xy: [f32; 2]) -> Option<f32> {
        self.height_in(xy, self.surface_heights.as_deref().unwrap_or(&self.heights))
    }
    fn height_in(&self, xy: [f32; 2], heights: &[f32]) -> Option<f32> {
        let x = (xy[0] - self.origin[0]) * 2.0;
        let y = (xy[1] - self.origin[1]) * 2.0;
        // The native negative/upper-bound branches admit unordered coordinates;
        // Rust's saturating float conversion then selects row/column zero.
        if x < 0.0 || y < 0.0 || x >= self.side as f32 || y >= self.side as f32 {
            return None;
        }
        let height = heights[y as usize * self.side + x as usize];
        (!height.is_nan()).then_some(height)
    }
}

#[cfg(test)]
mod primary_query_tests {
    use super::{IndoorCache, PrimaryCache, raised_indoor_surface};

    #[test]
    fn actor_surface_preserves_the_connected_floor_and_missing_cells() {
        let heights = vec![10.0, 11.0, 11.5, f32::NAN];
        let grid = IndoorCache {
            origin: [0.0; 2],
            side: 2,
            surface_heights: Some(raised_indoor_surface(2, &heights)),
            heights,
        };
        assert_eq!(grid.height([0.25; 2]), Some(10.0));
        assert_eq!(grid.surface_height([0.25; 2]), Some(11.5));
        assert_eq!(grid.surface_height([0.75; 2]), None);
        let primary = PrimaryCache { indoor: Some(grid), ..Default::default() };
        assert_eq!(primary.height([0.25; 2], |_| panic!("indoor owns the query")), Some(11.5));
    }

    #[test]
    fn actor_surface_reads_original_neighbours_and_keeps_the_native_step_limit() {
        let heights = vec![1.5, 1.0, 0.5, 1.5, 1.0, 0.5, 1.5, 1.0, 0.5];
        assert_eq!(raised_indoor_surface(3, &heights), vec![1.5, 1.5, 1.0, 1.5, 1.5, 1.0, 1.5, 1.5, 1.0]);
        let above = f32::from_bits(1.6f32.to_bits() + 1);
        assert_eq!(raised_indoor_surface(2, &[0.0, 1.6, above, f32::NAN])[0], 1.6);
        assert!(raised_indoor_surface(0, &[]).is_empty());
    }

    #[test]
    fn primary_queries_keep_native_unordered_cell_selection_and_precedence() {
        let grid = IndoorCache {
            origin: [0.0; 2],
            side: 2,
            heights: vec![11.0, 12.0, 21.0, f32::NAN],
            surface_heights: None,
        };
        assert_eq!(grid.height([f32::NAN, 0.0]), Some(11.0));
        assert_eq!(grid.height([0.75, f32::NAN]), Some(12.0));
        assert_eq!(grid.height([f32::NAN, 0.75]), Some(21.0));
        assert_eq!(grid.height([f32::NAN; 2]), Some(11.0));
        assert_eq!(grid.height([0.75; 2]), None);
        for xy in [[-0.01, 0.0], [1.0, 0.0], [0.0, f32::INFINITY]] {
            assert_eq!(grid.height(xy), None);
        }
        let mut primary = PrimaryCache {
            indoor: Some(grid.clone()),
            ..Default::default()
        };
        assert_eq!(primary.height([f32::NAN, 0.75], |_| panic!("indoor owns the query")), Some(21.0));
        primary.indoor = None;
        primary.raised = Some(grid);
        assert_eq!(primary.height([f32::NAN, 0.75], |_| Some(10.0)), Some(21.0));
        assert_eq!(primary.height([f32::NAN, 0.75], |_| Some(30.0)), Some(30.0));
        assert_eq!(primary.height([f32::NAN, 0.75], |_| None), None);
        primary.flat = Some(99.0);
        assert_eq!(primary.height([f32::NAN; 2], |_| panic!("flat owns the query")), Some(99.0));
    }
}

/// Current14552a140 priority. The raised cache does not create a floor when the
/// underlying ADT column is absent; an indoor cache never falls back to ADT.
#[derive(Clone, Debug, Default)]
pub struct PrimaryCache {
    pub flat: Option<f32>,
    pub indoor: Option<IndoorCache>,
    pub raised: Option<IndoorCache>,
}
impl PrimaryCache {
    pub fn height(
        &self,
        xy: [f32; 2],
        mut terrain: impl FnMut([f32; 2]) -> Option<f32>,
    ) -> Option<f32> {
        if let Some(height) = self.flat {
            return Some(height);
        }
        if let Some(indoor) = &self.indoor {
            return indoor.surface_height(xy);
        }
        let height = terrain(xy)?;
        Some(
            self.raised
                .as_ref()
                .and_then(|raised| raised.height(xy))
                .filter(|raised| *raised > height)
                .unwrap_or(height),
        )
    }
}

/// Outdoor WMO floor overlay in145526fa0. All admitted unique MODF placements
/// feed triangles in world coordinates. ADT lookup must follow1455264f0.
#[derive(Clone, Debug)]
pub struct RaisedBuilder {
    pub origin: [f32; 2],
    pub side: usize,
    candidates: Vec<Candidate>,
}
impl RaisedBuilder {
    pub fn new(center: [f32; 2], radius: f32) -> Self {
        Self {
            origin: [center[0] - radius, center[1] - radius],
            side: (radius * 4.0).ceil() as usize,
            candidates: Vec::new(),
        }
    }
    pub fn triangle(&mut self, vertices: [[f32; 3]; 3]) {
        rasterize(
            &mut self.candidates,
            self.origin,
            self.side,
            vertices,
            f32::MAX,
        );
    }
    /// Returns no cache when no candidate survives the strict .1 lower bound
    /// and inclusive3 upper bound above actual terrain.
    pub fn finish(self, mut terrain: impl FnMut([f32; 2]) -> Option<f32>) -> Option<IndoorCache> {
        let mut heights = vec![f32::NAN; self.side * self.side];
        let mut any = false;
        for candidate in self.candidates {
            let xy = [
                ((candidate.cell % self.side) as f32 + 0.5) * 0.5 + self.origin[0],
                ((candidate.cell / self.side) as f32 + 0.5) * 0.5 + self.origin[1],
            ];
            let Some(ground) = terrain(xy) else {
                continue;
            };
            if candidate.height > ground + 0.1 && candidate.height <= ground + 3.0 {
                let height = &mut heights[candidate.cell];
                if height.is_nan() || candidate.height > *height {
                    *height = candidate.height;
                    any = true;
                }
            }
        }
        any.then_some(IndoorCache {
            origin: self.origin,
            side: self.side,
            heights,
            surface_heights: None,
        })
    }
}

/// Side/coordinates match14552b670. The factory passes zone.radius+20 as radius.
#[derive(Clone, Debug)]
pub struct IndoorBuilder {
    pub origin: [f32; 2],
    pub side: usize,
    pub center: [f32; 3],
    candidates: Vec<Candidate>,
}
impl IndoorBuilder {
    pub fn new(center: [f32; 3], radius: f32) -> Self {
        Self {
            origin: [center[0] - radius, center[1] - radius],
            side: (radius * 4.0).ceil() as usize,
            center,
            candidates: Vec::new(),
        }
    }
    pub fn point(&self, cell: usize) -> [f32; 2] {
        [
            ((cell % self.side) as f32 + 0.5) * 0.5 + self.origin[0],
            ((cell / self.side) as f32 + 0.5) * 0.5 + self.origin[1],
        ]
    }
    /// Feed actual14568f2e0-compatible ADT heights at cell centers; the target
    /// visits only each loaded chunk's XY bounds. A missing sample adds nothing.
    pub fn terrain_sample(&mut self, cell: usize, height: Option<f32>) {
        if let Some(height) = height.filter(|height| *height <= self.center[2] + 8.0) {
            assert!(cell < self.side * self.side);
            self.candidates.push(Candidate { cell, height });
        }
    }
    /// Current triangle rasterizer145530800: abs(normal.z)/length >=.7,
    /// barycentric tolerance[-.0001,1.0001], and centerZ+8 upper cap.
    pub fn triangle(&mut self, vertices: [[f32; 3]; 3]) {
        rasterize(
            &mut self.candidates,
            self.origin,
            self.side,
            vertices,
            self.center[2] + 8.0,
        );
    }
    pub fn candidates(&self) -> &[Candidate] {
        &self.candidates
    }
    pub fn finish(mut self) -> IndoorCache {
        //145507780 and the large-sort path use (cell, total-order height).
        self.candidates
            .sort_unstable_by(|a, b| a.cell.cmp(&b.cell).then(a.height.total_cmp(&b.height)));
        connect(self.origin, self.side, self.center, &self.candidates)
    }
}

fn rasterize(
    output: &mut Vec<Candidate>,
    origin: [f32; 2],
    side: usize,
    vertices: [[f32; 3]; 3],
    maximum: f32,
) {
    let [a, b, c] = vertices;
    let u = [b[0] - a[0], b[1] - a[1], b[2] - a[2]];
    let v = [c[0] - a[0], c[1] - a[1], c[2] - a[2]];
    let determinant = v[1] * u[0] - u[1] * v[0];
    let normal_x = v[2] * u[1] - u[2] * v[1];
    let normal_y = u[2] * v[0] - u[0] * v[2];
    let length = (normal_x * normal_x + normal_y * normal_y + determinant * determinant).sqrt();
    if !(length >= 0.000_001 && determinant.abs() / length >= 0.7) {
        return;
    }
    if !(a[2].min(b[2]).min(c[2]) <= maximum) {
        return;
    }
    let minimum = [a[0].min(b[0]).min(c[0]), a[1].min(b[1]).min(c[1])];
    let maximum_xy = [a[0].max(b[0]).max(c[0]), a[1].max(b[1]).max(c[1])];
    let start = [
        ((minimum[0] - origin[0]) * 2.0 - 0.5).ceil().max(0.0) as usize,
        ((minimum[1] - origin[1]) * 2.0 - 0.5).ceil().max(0.0) as usize,
    ];
    let end = [
        (((maximum_xy[0] - origin[0]) * 2.0 - 0.5).floor() + 1.0)
            .max(0.0)
            .min(side as f32) as usize,
        (((maximum_xy[1] - origin[1]) * 2.0 - 0.5).floor() + 1.0)
            .max(0.0)
            .min(side as f32) as usize,
    ];
    for row in start[1]..end[1] {
        let dy = (row as f32 + 0.5) * 0.5 + origin[1] - a[1];
        let first = v[0] * dy;
        let second = dy * u[0];
        for col in start[0]..end[0] {
            let dx = (col as f32 + 0.5) * 0.5 + origin[0] - a[0];
            let bary_c = (second - dx * u[1]) / determinant;
            let bary_b = (v[1] * dx - first) / determinant;
            if bary_b >= -0.0001 && bary_c >= -0.0001 && bary_b + bary_c <= 1.0001 {
                let height = (bary_b * u[2] + a[2]) + bary_c * v[2];
                if height <= maximum {
                    output.push(Candidate {
                        cell: row * side + col,
                        height,
                    });
                }
            }
        }
    }
}

fn closest(candidates: &[Candidate], previous: f32) -> Option<f32> {
    let mut result = None;
    let mut best = f32::INFINITY;
    for candidate in candidates {
        let delta = (candidate.height - previous).abs();
        if delta <= 1.6 && delta < best {
            result = Some(candidate.height);
            best = delta;
        }
    }
    result
}
fn connect(
    origin: [f32; 2],
    side: usize,
    center: [f32; 3],
    candidates: &[Candidate],
) -> IndoorCache {
    let mut heights = vec![f32::NAN; side * side];
    let mut offsets = vec![0usize; side * side + 1];
    for candidate in candidates {
        offsets[candidate.cell + 1] += 1;
    }
    for index in 1..offsets.len() {
        offsets[index] += offsets[index - 1];
    }
    let center_cell = [
        ((center[0] - origin[0]) * 2.0) as i32,
        ((center[1] - origin[1]) * 2.0) as i32,
    ];
    let mut seed = None;
    let mut best = i32::MAX;
    for dy in -16i32..=16 {
        for dx in -16i32..=16 {
            let x = center_cell[0] + dx;
            let y = center_cell[1] + dy;
            if x < 0 || y < 0 || x >= side as i32 || y >= side as i32 {
                continue;
            }
            let squared = dx * dx + dy * dy;
            if squared >= best {
                continue;
            }
            let cell = y as usize * side + x as usize;
            if let Some(height) = closest(&candidates[offsets[cell]..offsets[cell + 1]], center[2])
            {
                seed = Some((cell, height));
                best = squared;
            }
        }
    }
    let Some((seed, height)) = seed else {
        return IndoorCache {
            origin,
            side,
            heights,
            surface_heights: Some(vec![f32::NAN; side * side]),
        };
    };
    heights[seed] = height;
    let mut queue = VecDeque::from([seed]);
    while let Some(cell) = queue.pop_front() {
        let x = cell % side;
        let y = cell / side;
        let neighbors = [
            (x > 0).then(|| cell - 1),
            (x + 1 < side).then_some(cell + 1),
            (y > 0).then(|| cell - side),
            (y + 1 < side).then_some(cell + side),
        ];
        for next in neighbors.into_iter().flatten() {
            if heights[next].is_nan() {
                if let Some(height) =
                    closest(&candidates[offsets[next]..offsets[next + 1]], heights[cell])
                {
                    heights[next] = height;
                    queue.push_back(next);
                }
            }
        }
    }
    let surface_heights = raised_indoor_surface(side, &heights);
    IndoorCache {
        origin,
        side,
        heights,
        surface_heights: Some(surface_heights),
    }
}

/// 0.127.0/145ba2c8e..145ba2e55. Read every neighbour from the unchanged
/// connected grid, so a raised answer cannot cascade into the next cell.
fn raised_indoor_surface(side: usize, heights: &[f32]) -> Vec<f32> {
    let mut surface = heights.to_vec();
    for row in 0..side {
        for col in 0..side {
            let cell = row * side + col;
            let original = heights[cell];
            if original.is_nan() {
                continue;
            }
            for nearby_row in row.saturating_sub(1)..=(row + 1).min(side - 1) {
                for nearby_col in col.saturating_sub(1)..=(col + 1).min(side - 1) {
                    let height = heights[nearby_row * side + nearby_col];
                    if height - original <= 1.6 && height > surface[cell] {
                        surface[cell] = height;
                    }
                }
            }
        }
    }
    surface
}

/// Current one-yard obstacle mask. Baseline heights are the terrain constructor's
/// primary query at one-yard cell centers, independently of collision rays.
#[derive(Clone, Debug)]
pub struct OccupancyBuilder {
    pub origin: [f32; 2],
    pub side: usize,
    pub floor_heights: Vec<f32>,
    pub cells: Vec<u8>,
}
impl OccupancyBuilder {
    pub fn new(origin: [f32; 2], side: usize, floor_heights: Vec<f32>) -> Self {
        assert_eq!(floor_heights.len(), side * side);
        Self {
            origin,
            side,
            floor_heights,
            cells: vec![0; side * side],
        }
    }
    ///145526fa0's one-yard baseline. Indoors pass the connected indoor cache's
    /// direct query; outdoors pass raw1455264f0 terrain, without the raised cache.
    pub fn sample(
        center: [f32; 2],
        radius: f32,
        mut floor: impl FnMut([f32; 2]) -> Option<f32>,
    ) -> Self {
        let side = (radius * 2.0).ceil() as usize;
        let origin = [center[0] - radius, center[1] - radius];
        let floor_heights = (0..side * side)
            .map(|cell| {
                floor([
                    (cell % side) as f32 + 0.5 + origin[0],
                    (cell / side) as f32 + 0.5 + origin[1],
                ])
                .unwrap_or(f32::NAN)
            })
            .collect();
        Self::new(origin, side, floor_heights)
    }
    pub fn grid(&self) -> super::BlockedGrid<'_> {
        super::BlockedGrid {
            origin: self.origin,
            side: self.side,
            cells: &self.cells,
        }
    }
    ///145524fa0 after the placement transform: triangles with abs(normal.z)
    /// at most.7 are sampled at edge subdivisions ceil(longest/.4), capped400.
    /// A sample blocks its cell only strictly between floor+.35 and floor+2.4.
    pub fn triangle(&mut self, vertices: [[f32; 3]; 3]) {
        let [a, b, c] = vertices;
        let maximum = [a[0].max(b[0]).max(c[0]), a[1].max(b[1]).max(c[1])];
        let minimum = [a[0].min(b[0]).min(c[0]), a[1].min(b[1]).min(c[1])];
        if maximum[0] < self.origin[0]
            || maximum[1] < self.origin[1]
            || minimum[0] > self.origin[0] + self.side as f32
            || minimum[1] > self.origin[1] + self.side as f32
        {
            return;
        }
        let u = [b[0] - a[0], b[1] - a[1], b[2] - a[2]];
        let v = [c[0] - a[0], c[1] - a[1], c[2] - a[2]];
        let cross = [
            v[2] * u[1] - u[2] * v[1],
            u[2] * v[0] - u[0] * v[2],
            v[1] * u[0] - u[1] * v[0],
        ];
        let normal_length =
            (cross[0] * cross[0] + cross[1] * cross[1] + cross[2] * cross[2]).sqrt();
        if !(normal_length >= 0.000_001 && cross[2].abs() / normal_length <= 0.7) {
            return;
        }
        let length =
            |edge: [f32; 3]| (edge[2] * edge[2] + edge[1] * edge[1] + edge[0] * edge[0]).sqrt();
        let edge = [c[0] - b[0], c[1] - b[1], c[2] - b[2]];
        let subdivisions = (length(u).max(length(v)).max(length(edge)) / 0.4).ceil() as usize;
        let subdivisions = subdivisions.clamp(1, 400);
        for row in 0..=subdivisions {
            let first = row as f32 / subdivisions as f32;
            for col in 0..=subdivisions - row {
                let second = col as f32 / subdivisions as f32;
                let xy = [
                    (second * v[0] + first * u[0] + a[0]) - self.origin[0],
                    (second * v[1] + first * u[1] + a[1]) - self.origin[1],
                ];
                if !(xy[0] >= 0.0 && xy[1] >= 0.0) {
                    continue;
                }
                let x = xy[0] as usize;
                let y = xy[1] as usize;
                if x >= self.side || y >= self.side {
                    continue;
                }
                let cell = y * self.side + x;
                let height = self.floor_heights[cell];
                let z = second * v[2] + first * u[2] + a[2];
                if z > height + 0.35 && z < height + 2.4 {
                    self.cells[cell] = 1;
                }
            }
        }
    }
}
