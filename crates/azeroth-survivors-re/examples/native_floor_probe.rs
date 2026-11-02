//! Developer diagnostic: cargo run -p azeroth-survivors-re --example
//! native_floor_probe -- --data-dir <compatible Data directory> --zone sm
//! It opens MPQs only. Building/running requires neither the reference EXE nor a save.
use azeroth_survivors_re::floor_recovery::{map::NativeTerrain, Terrain};
use serde::Deserialize;
use serde_json::json;
use std::{path::PathBuf, time::Instant};

#[derive(Deserialize)]
struct Catalog {
    zones: Vec<Entry>,
}
#[derive(Deserialize)]
struct Entry {
    key: String,
    map_id: u32,
    spawn: [f32; 3],
}
fn main() -> anyhow::Result<()> {
    let mut args = std::env::args().skip(1);
    let mut data = None;
    let mut zone = "elwynn".to_owned();
    while let Some(argument) = args.next() {
        match argument.as_str() {
            "--data-dir" => {
                data = Some(PathBuf::from(args.next().ok_or_else(|| {
                    anyhow::anyhow!("--data-dir requires a directory")
                })?))
            }
            "--zone" => {
                zone = args
                    .next()
                    .ok_or_else(|| anyhow::anyhow!("--zone requires a key or all"))?
            }
            _ => {
                anyhow::bail!("unknown argument {argument}; use --data-dir <Data> --zone <key|all>")
            }
        }
    }
    let data = data.ok_or_else(|| anyhow::anyhow!("--data-dir is required"))?;
    let mut chain = benilla_formats::Chain::open(&data)?;
    let maps = benilla_formats::load_map_catalog(&mut chain)?;
    let catalog: Catalog = serde_json::from_str(include_str!("../assets/run-entry-0.100.1.json"))?;
    let mut rows = Vec::new();
    for entry in catalog
        .zones
        .into_iter()
        .filter(|entry| zone == "all" || zone == entry.key)
    {
        let map = maps
            .directory(entry.map_id)
            .ok_or_else(|| anyhow::anyhow!("no map{}", entry.map_id))?;
        let started = Instant::now();
        let mut terrain = NativeTerrain::load(&mut chain, &entry.key, map, entry.spawn)?;
        let build_seconds = started.elapsed().as_secs_f64();
        let center = [entry.spawn[0], entry.spawn[1]];
        let primary_center = terrain.height(center);
        let adt_center = terrain.adt(center);
        let secondary_center = terrain.nearest_floor(center);
        let minimum_center = terrain.minimum_floor(center);
        let (mut samples, mut primary, mut secondary, mut blocked) =
            (0usize, 0usize, 0usize, 0usize);
        let extent = terrain.zone.radius as i32;
        for x in (-extent..=extent).step_by(8) {
            for y in (-extent..=extent).step_by(8) {
                let xy = [center[0] + x as f32, center[1] + y as f32];
                if terrain.zone.outside(xy) {
                    continue;
                }
                samples += 1;
                primary += usize::from(terrain.height(xy).is_some());
                secondary += usize::from(terrain.nearest_floor(xy).is_some());
                blocked += usize::from(terrain.blocked(xy));
            }
        }
        rows.push(json!({"zone":entry.key,"map_id":entry.map_id,"map":map,"spawn":entry.spawn,
            "build_seconds":build_seconds,"tiles":terrain.tiles.len(),
            "primary_center":primary_center,"adt_center":adt_center,"secondary_center":secondary_center,"minimum_center":minimum_center,
            "indoor_reached_cells":terrain.primary.indoor.as_ref().map(|grid|grid.heights.iter().filter(|h|!h.is_nan()).count()),
            "indoor_total_cells":terrain.primary.indoor.as_ref().map(|grid|grid.heights.len()),
            "occupancy_blocked_cells":terrain.occupancy.as_ref().map(|grid|grid.cells.iter().filter(|cell|**cell!=0).count()),
            "occupancy_total_cells":terrain.occupancy.as_ref().map(|grid|grid.cells.len()),
            "raised_cells":terrain.primary.raised.as_ref().map(|grid|grid.heights.iter().filter(|h|!h.is_nan()).count()),
            "probe":{"spacing":8,"samples":samples,"primary":primary,"secondary":secondary,"blocked_footprint":blocked}}));
    }
    anyhow::ensure!(!rows.is_empty(), "unknown zone {zone}");
    println!(
        "{}",
        serde_json::to_string_pretty(
            &json!({"source_target":"0.100.1","reference_exe_required":false,
        "validation":"reconstructed MPQ cache diagnostic; original/rebuilt parity is unverified","zones":rows})
        )?
    );
    Ok(())
}
