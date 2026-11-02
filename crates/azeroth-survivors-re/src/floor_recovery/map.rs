//! Fixed-region MPQ geometry for current145526fa0. No streamed collision ray is
//! used as a cache substitute. Source geometry comes from the shared MPQ chain.
use super::{
    cache::{IndoorBuilder, OccupancyBuilder, PrimaryCache, RaisedBuilder},
    placement, Terrain, Zone,
};
use benilla_formats::{
    adt_to_floor_mesh, load_m2_collision_hull, load_wmo_collision_tris, terrain_height_at,
    world_to_tile, Chain, CollisionMesh, TileMesh, WdtReader, WowVersion,
};
use std::{
    collections::{HashMap, HashSet, VecDeque},
    io::Cursor,
};

pub struct NativeTerrain {
    pub zone: Zone,
    pub primary: PrimaryCache,
    pub occupancy: Option<OccupancyBuilder>,
    pub tiles: Vec<TileMesh>,
    pub fallback: f32,
    pub navigation: Option<super::navigation::DistanceField>,
    navigation_updated_at: f32,
}
struct Building {
    unique_id: u32,
    position: [f32; 3],
    triangles: Vec<[[f32; 3]; 3]>,
}

impl NativeTerrain {
    ///14568ed20 reads the WDT-admitted3x3 tile region in row/column order.
    ///14546cf80 suppresses repeated placement IDs in each construction pass.
    pub fn load(
        chain: &mut Chain,
        zone_key: &str,
        map: &str,
        spawn: [f32; 3],
    ) -> anyhow::Result<Self> {
        let zone = Zone::for_key(zone_key)
            .ok_or_else(|| anyhow::anyhow!("unknown floor zone {zone_key}"))?
            .clone();
        let bytes = chain.read(&format!("World\\Maps\\{map}\\{map}.wdt"))?;
        let wdt = WdtReader::new(Cursor::new(bytes), WowVersion::Classic)
            .read()
            .map_err(|error| anyhow::anyhow!("floor WDT: {error}"))?;
        let (cx, cy) = world_to_tile(spawn[0], spawn[1]);
        let mut tiles = Vec::new();
        for dy in -1..=1 {
            for dx in -1..=1 {
                let x = cx as i32 + dx;
                let y = cy as i32 + dy;
                if !(0..64).contains(&x)
                    || !(0..64).contains(&y)
                    || !wdt
                        .get_tile(x as usize, y as usize)
                        .is_some_and(|tile| tile.has_adt)
                {
                    continue;
                }
                if let Ok(bytes) = chain.read(&format!("World\\Maps\\{map}\\{map}_{x}_{y}.adt")) {
                    if let Ok(tile) = adt_to_floor_mesh(&bytes) {
                        tiles.push(tile);
                    }
                }
            }
        }
        let mut result = Self {
            zone,
            primary: PrimaryCache::default(),
            occupancy: None,
            tiles,
            fallback: spawn[2],
            navigation: None,
            navigation_updated_at: 0.0,
        };
        // The target returns absent caches when its region has no readable tiles.
        if result.tiles.is_empty() {
            return Ok(result);
        }
        let radius = result.zone.radius + 20.0;
        let mut seen = HashSet::new();
        let mut meshes: HashMap<String, CollisionMesh> = HashMap::new();
        let mut buildings = Vec::new();
        for tile in &result.tiles {
            for wmo in &tile.wmos {
                if !seen.insert(wmo.unique_id) {
                    continue;
                }
                let key = wmo.model.to_ascii_lowercase();
                let mesh = meshes
                    .entry(key.clone())
                    .or_insert_with(|| load_wmo_collision_tris(chain, &key).unwrap_or_default());
                buildings.push(Building {
                    unique_id: wmo.unique_id,
                    position: wmo.position,
                    triangles: placed(mesh, wmo.position, wmo.rotation, 1.0),
                });
            }
        }
        if result.zone.indoor {
            let mut builder = IndoorBuilder::new(spawn, radius);
            for building in &buildings {
                for triangle in &building.triangles {
                    builder.triangle(*triangle);
                }
            }
            for cell in 0..builder.side * builder.side {
                let xy = builder.point(cell);
                // Each ADT contributes its own candidate. Tile-seam duplicates are
                // sorted by the native(cell,total-height) comparator before flooding.
                for tile in &result.tiles {
                    builder
                        .terrain_sample(cell, terrain_height_at(&tile.chunks, [xy[0], xy[1], 0.0]));
                }
            }
            result.primary.indoor = Some(builder.finish());
        }
        let mut occupancy = OccupancyBuilder::sample([spawn[0], spawn[1]], radius, |xy| {
            result
                .primary
                .indoor
                .as_ref()
                .map_or_else(|| result.adt(xy), |cache| cache.height(xy))
        });
        let mut seen = HashSet::new();
        let mut meshes: HashMap<String, CollisionMesh> = HashMap::new();
        for tile in &result.tiles {
            for doodad in &tile.doodads {
                let reach = radius + doodad.scale.max(1.0) * 40.0;
                if (doodad.position[0] - spawn[0]).abs() >= reach
                    || (doodad.position[1] - spawn[1]).abs() >= reach
                    || !seen.insert(doodad.unique_id)
                {
                    continue;
                }
                let key = doodad.model.to_ascii_lowercase();
                let mesh = meshes
                    .entry(key.clone())
                    .or_insert_with(|| load_m2_collision_hull(chain, &key).unwrap_or_default());
                for triangle in placed(mesh, doodad.position, doodad.rotation, doodad.scale) {
                    occupancy.triangle(triangle);
                }
            }
        }
        for building in &buildings {
            if (building.position[0] - spawn[0]).abs() >= radius + 400.0
                || (building.position[1] - spawn[1]).abs() >= radius + 400.0
                || !seen.insert(building.unique_id)
            {
                continue;
            }
            for triangle in &building.triangles {
                occupancy.triangle(*triangle);
            }
        }
        // A supplied indoor polygon also excludes invalid baseline columns and
        // outside cells, then retains only the center's four-connected component.
        if result.zone.indoor && !result.zone.polygon.is_empty() {
            for cell in 0..occupancy.cells.len() {
                let xy = [
                    (cell % occupancy.side) as f32 + 0.5 + occupancy.origin[0],
                    (cell / occupancy.side) as f32 + 0.5 + occupancy.origin[1],
                ];
                if occupancy.floor_heights[cell].is_nan() || result.zone.outside(xy) {
                    occupancy.cells[cell] = 1;
                }
            }
            retain_center(&mut occupancy, [spawn[0], spawn[1]]);
        }
        result.occupancy = Some(occupancy);
        if !result.zone.indoor {
            let mut raised = RaisedBuilder::new([spawn[0], spawn[1]], radius);
            for building in buildings {
                for triangle in building.triangles {
                    raised.triangle(triangle);
                }
            }
            result.primary.raised = raised.finish(|xy| result.adt(xy));
        }
        Ok(result)
    }
    /// Current1455264f0 tries exact XY, then both+.07, then both−.07.
    pub fn adt(&self, xy: [f32; 2]) -> Option<f32> {
        for offset in [0.0, 0.07, -0.07] {
            for tile in &self.tiles {
                if let Some(height) =
                    terrain_height_at(&tile.chunks, [xy[0] + offset, xy[1] + offset, 0.0])
                {
                    return Some(height);
                }
            }
        }
        None
    }
    pub fn height(&self, xy: [f32; 2]) -> Option<f32> {
        self.primary.height(xy, |xy| self.adt(xy))
    }
    /// Current actor owner1459404a0 reuses the same player cell. A changed cell
    /// rebuilds only after .2 seconds; an absent field builds immediately.
    pub fn refresh_navigation(&mut self, xy: [f32; 2], now: f32) {
        let Some(grid) = self.occupancy.as_ref().map(|grid| grid.grid()) else {
            return;
        };
        if let Some(field) = &self.navigation {
            if super::navigation::index(grid, xy) == Some(field.start)
                // UCOMISS/JB also retains the cache for an unordered delta.
                || !(now - self.navigation_updated_at >= 0.2)
            {
                return;
            }
        }
        self.navigation = super::navigation::DistanceField::build(grid, xy);
        self.navigation_updated_at = now;
    }
}
fn placed(
    mesh: &CollisionMesh,
    position: [f32; 3],
    rotation: [f32; 3],
    scale: f32,
) -> Vec<[[f32; 3]; 3]> {
    let matrix = placement::matrix(rotation);
    let vertices = mesh
        .positions
        .iter()
        .map(|p| placement::transform(matrix, *p, position, scale))
        .collect::<Vec<_>>();
    mesh.indices
        .chunks_exact(3)
        .filter_map(|tri| {
            Some([
                *vertices.get(tri[0] as usize)?,
                *vertices.get(tri[1] as usize)?,
                *vertices.get(tri[2] as usize)?,
            ])
        })
        .collect()
}
fn retain_center(grid: &mut OccupancyBuilder, center: [f32; 2]) {
    let x = center[0] - grid.origin[0];
    let y = center[1] - grid.origin[1];
    let mut reached = vec![false; grid.cells.len()];
    let mut queue = VecDeque::new();
    if x >= 0.0 && y >= 0.0 && x < grid.side as f32 && y < grid.side as f32 {
        let cell = y as usize * grid.side + x as usize;
        if grid.cells[cell] == 0 {
            reached[cell] = true;
            queue.push_back(cell);
        }
    }
    while let Some(cell) = queue.pop_front() {
        let x = cell % grid.side;
        let y = cell / grid.side;
        for next in [
            (x > 0).then(|| cell - 1),
            (x + 1 < grid.side).then_some(cell + 1),
            (y > 0).then(|| cell - grid.side),
            (y + 1 < grid.side).then_some(cell + grid.side),
        ]
        .into_iter()
        .flatten()
        {
            if grid.cells[next] == 0 && !reached[next] {
                reached[next] = true;
                queue.push_back(next);
            }
        }
    }
    for (cell, reached) in grid.cells.iter_mut().zip(reached) {
        if !reached {
            *cell = 1;
        }
    }
}
impl Terrain for NativeTerrain {
    fn height(&mut self, xy: [f32; 2]) -> Option<f32> {
        NativeTerrain::height(self, xy)
    }
    fn nearby_height(&mut self, xy: [f32; 2], radius: f32) -> Option<f32> {
        let limit = radius as i32;
        let mut best: Option<f32> = None;
        for x in -limit..=limit {
            for y in -limit..=limit {
                if (x as f32).hypot(y as f32) > radius {
                    continue;
                }
                if let Some(height) = self.height([xy[0] + x as f32, xy[1] + y as f32]) {
                    best = Some(best.map_or(height, |best| best.min(height)));
                }
            }
        }
        best
    }
    fn nearest_floor(&mut self, xy: [f32; 2]) -> Option<[f32; 3]> {
        self.primary.indoor.as_ref()?.grid().nearest(xy)
    }
    fn minimum_floor(&mut self, xy: [f32; 2]) -> Option<f32> {
        self.primary.indoor.as_ref()?.grid().minimum(xy)
    }
    fn blocked(&mut self, xy: [f32; 2]) -> bool {
        self.occupancy
            .as_ref()
            .is_some_and(|grid| super::completely_blocked(grid.grid(), xy))
    }
    fn has_blocked_grid(&self) -> bool {
        self.occupancy.is_some()
    }
    fn nearest_open(&mut self, xy: [f32; 2], radius: f32) -> Option<[f32; 2]> {
        super::nearest_open(self.occupancy.as_ref()?.grid(), xy, radius)
    }
    fn nearest_valid(&mut self, xy: [f32; 2], radius: f32, clearance: f32) -> Option<[f32; 3]> {
        let mut ring = 1.0;
        while ring <= radius {
            let count = (ring * std::f32::consts::TAU).ceil() as usize;
            for index in 0..count {
                let angle = index as f32 * std::f32::consts::TAU / count as f32;
                let point = [angle.cos() * ring + xy[0], angle.sin() * ring + xy[1]];
                if self.zone.outside(point) {
                    continue;
                }
                if let Some(height) = self.height(point) {
                    if clearance <= 0.0
                        || [
                            [clearance, 0.0],
                            [-clearance, 0.0],
                            [0.0, clearance],
                            [0.0, -clearance],
                        ]
                        .iter()
                        .all(|offset| {
                            self.height([point[0] + offset[0], point[1] + offset[1]])
                                .is_some()
                        })
                    {
                        return Some([point[0], point[1], height]);
                    }
                }
            }
            ring += 1.0;
        }
        None
    }
    fn fallback_height(&self) -> f32 {
        self.fallback
    }
}
