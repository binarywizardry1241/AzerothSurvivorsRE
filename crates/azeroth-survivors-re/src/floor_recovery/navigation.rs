//! 0.110.0 distance field1459a7c90, descent1459a79b0, segment1459a3a00,
//! and actor chase1459a8280. Occupancy coordinates are one yard per cell.
use super::BlockedGrid;
use std::collections::VecDeque;
const OFFSETS: [[i32; 2]; 8] = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1],
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1],
];
#[derive(Clone, Debug)]
pub struct DistanceField {
    pub distances: Vec<u16>,
    pub start: usize,
    pub populated_cells: usize,
}
pub fn index(grid: BlockedGrid<'_>, xy: [f32; 2]) -> Option<usize> {
    let x = xy[0] - grid.origin[0];
    let y = xy[1] - grid.origin[1];
    // Native rejects negative offsets before saturating float-to-usize casts.
    // Unordered offsets reach that cast and become zero, as in the current
    // distance-field constructor and its actor-side cache-identity reader.
    if x < 0.0 || y < 0.0 {
        return None;
    }
    let col = x as usize;
    let row = y as usize;
    (col < grid.side && row < grid.side).then(|| row * grid.side + col)
}
impl DistanceField {
    pub fn build(grid: BlockedGrid<'_>, xy: [f32; 2]) -> Option<Self> {
        let start = index(grid, xy)?;
        let mut distances = vec![u16::MAX; grid.side * grid.side];
        distances[start] = 0;
        let mut queue = VecDeque::from([start]);
        let mut populated_cells = 1;
        while let Some(cell) = queue.pop_front() {
            let x = (cell % grid.side) as i32;
            let y = (cell / grid.side) as i32;
            let distance = distances[cell].wrapping_add(1);
            for [dx, dy] in OFFSETS {
                let nx = x + dx;
                let ny = y + dy;
                if nx < 0 || ny < 0 || nx >= grid.side as i32 || ny >= grid.side as i32 {
                    continue;
                }
                let next = ny as usize * grid.side + nx as usize;
                if grid.cells[next] != 0 || distances[next] != u16::MAX {
                    continue;
                }
                if dx != 0
                    && dy != 0
                    && (grid.cells[y as usize * grid.side + nx as usize] != 0
                        || grid.cells[ny as usize * grid.side + x as usize] != 0)
                {
                    continue;
                }
                distances[next] = distance;
                queue.push_back(next);
                populated_cells += 1;
            }
        }
        Some(Self {
            distances,
            start,
            populated_cells,
        })
    }
    pub fn descend(&self, side: usize, cell: usize) -> Option<usize> {
        let x = (cell % side) as i32;
        let y = (cell / side) as i32;
        let mut best: Option<usize> = None;
        for [dx, dy] in OFFSETS {
            let nx = x + dx;
            let ny = y + dy;
            if nx < 0 || ny < 0 || nx >= side as i32 || ny >= side as i32 {
                continue;
            }
            let next = ny as usize * side + nx as usize;
            let value = self.distances[next];
            if value != u16::MAX && best.is_none_or(|previous| value < self.distances[previous]) {
                best = Some(next);
            }
        }
        best.filter(|next| {
            self.distances[cell] == u16::MAX || self.distances[*next] < self.distances[cell]
        })
    }
    pub fn chase(
        &self,
        grid: BlockedGrid<'_>,
        from: [f32; 2],
        to: [f32; 2],
        search: f32,
    ) -> Option<[f32; 2]> {
        if segment_fraction(grid, from, to) >= 1.0 {
            return None;
        }
        let mut cell = index(grid, from)?;
        if self.distances[cell] == u16::MAX {
            cell = self.descend(grid.side, cell)?;
        }
        let center = |cell| {
            [
                (cell % grid.side) as f32 + 0.5 + grid.origin[0],
                (cell / grid.side) as f32 + 0.5 + grid.origin[1],
            ]
        };
        let mut best = center(cell);
        if cell == self.start {
            return Some(best);
        }
        let Some(mut next) = self.descend(grid.side, cell) else {
            return Some(best);
        };
        for _ in 0..40 {
            let point = center(next);
            let dx = point[0] - from[0];
            let dy = point[1] - from[1];
            if (dy * dy + dx * dx).sqrt() > search || segment_fraction(grid, from, point) < 1.0 {
                break;
            }
            best = point;
            if next == self.start {
                break;
            }
            let Some(following) = self.descend(grid.side, next) else {
                break;
            };
            next = following;
        }
        Some(best)
    }
}
pub fn segment_fraction(grid: BlockedGrid<'_>, from: [f32; 2], to: [f32; 2]) -> f32 {
    let delta = [to[0] - from[0], to[1] - from[1]];
    let length = (delta[1] * delta[1] + delta[0] * delta[0]).sqrt();
    if length < 0.001 {
        return 1.0;
    }
    let steps = (length / 0.3).ceil() as usize;
    let mut in_initial_block = index(grid, from).is_some_and(|cell| grid.cells[cell] != 0);
    let mut previous = 0.0;
    for step in 1..=steps {
        let fraction = step as f32 / steps as f32;
        let point = [delta[0] * fraction + from[0], delta[1] * fraction + from[1]];
        let blocked = index(grid, point).is_some_and(|cell| grid.cells[cell] != 0);
        if blocked && !in_initial_block {
            return previous;
        }
        in_initial_block &= blocked;
        previous = fraction;
    }
    1.0
}

///145b98c90 in0.127.0: a victim standing in a blocked cell first uses the
///existing nearest-open query with radius2.5. Its failure admits sight; an
///available correction is tested from the original launch/caster position.
pub fn sight_clear(grid: BlockedGrid<'_>, from: [f32; 2], mut to: [f32; 2]) -> bool {
    if index(grid, to).is_some_and(|cell| grid.cells[cell] == 1) {
        let Some(open) = super::nearest_open(grid, to, 2.5) else { return true; };
        to = open;
    }
    segment_fraction(grid, from, to) >= 1.0
}
