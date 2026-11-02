//! Semantic guardian/lair projections from the selected 0.97.2 addon producer.
//! Native wire formatting, delivery cadence and the Lua VM remain owner ports.
//! Evidence: docs/analysis/evidence/0.97.2/guardians/guardian-addon.json.

use super::{Lair, Position};

/// Already-produced AZSUNITS fields. This adapter does not manufacture the
/// native upstream actor-selection order, alive filter or localized name.
#[derive(Clone, Copy, Debug)]
pub struct UnitView<'a> {
    pub kind: &'a str,
    pub id: u32,
    pub name: &'a str,
    pub hp: f32,
    pub hpm: f32,
    pub state: u8,
}

#[derive(Clone, Debug)]
pub struct GuardianView<'a, D> {
    pub id: u32,
    pub name: &'a str,
    pub hp: f32,
    pub hpm: f32,
    pub awake: bool,
    pub debuffs: D,
}

/// Exact embedded AZS_GetGuardians row selection; debuffs remain supplied by
/// the actual shared AZS_GetDebuffs-equivalent owner and are queried lazily.
pub fn guardian_from_unit<'a, D>(
    unit: UnitView<'a>,
    debuffs: impl FnOnce(u32) -> D,
) -> Option<GuardianView<'a, D>> {
    if unit.kind != "guardian" {
        return None;
    }
    Some(GuardianView {
        id: unit.id,
        name: unit.name,
        hp: unit.hp,
        hpm: unit.hpm,
        awake: unit.state == 1,
        debuffs: debuffs(unit.id),
    })
}

#[derive(Clone, Copy, Debug)]
pub struct LairActorView<'a> {
    pub guid: u64,
    /// Native Actor+68==1 excludes a matching actor from a lair's holder.
    pub dead: bool,
    /// Native Actor+40 guardian option; None follows the asleep branch.
    pub guardian_awake: Option<u8>,
    pub localized_name: &'a str,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum LairState {
    Empty,
    Asleep,
    Awake,
}

impl LairState {
    pub const fn wire_name(self) -> &'static str {
        match self {
            Self::Empty => "empty",
            Self::Asleep => "asleep",
            Self::Awake => "awake",
        }
    }

    /// Exact embedded AZS_GetLairs postprocessing.
    pub const fn active(self) -> bool {
        !matches!(self, Self::Empty)
    }
}

#[derive(Clone, Copy, Debug)]
pub struct LairView<'a> {
    pub index: usize,
    pub state: LairState,
    pub name: &'a str,
    pub id: u32,
    pub left: f32,
    pub position: Position,
    /// Normalized native map coordinates; no invented clamp is applied.
    pub map_xy: [f32; 2],
}

/// The four raw f32 map bounds consumed by the native projection. This keeps
/// their original lane ordering without assigning unrecovered field names.
pub fn map_coordinates(position: Position, raw_bounds: Option<[f32; 4]>) -> [f32; 2] {
    let Some([a, b, c, d]) = raw_bounds else {
        return [-1.0, -1.0];
    };
    [(a - position.y) / (a - b), (c - position.x) / (c - d)]
}

/// Native145515b10: one row per lair in original order, using its HOME
/// position even while its live holder moves. No holder means id0/empty and
/// the remaining respawn delay; a live holder means left=-1.
pub fn project_lair<'a>(
    zero_based_index: usize,
    lair: Lair,
    actors: &'a [LairActorView<'a>],
    localized_enemy_name: &'a str,
    now: f32,
    raw_bounds: Option<[f32; 4]>,
) -> LairView<'a> {
    let holder = lair.active_guid.and_then(|guid| {
        actors.iter().find(|actor| actor.guid == guid && !actor.dead)
    });
    let (state, name, id, left) = if let Some(actor) = holder {
        let state = if actor.guardian_awake.unwrap_or(0) != 0 {
            LairState::Awake
        } else {
            LairState::Asleep
        };
        (state, actor.localized_name, actor.guid as u32, -1.0)
    } else {
        let remaining = lair.respawn_at - now;
        let left = if remaining > 0.0 { remaining } else { 0.0 };
        (LairState::Empty, localized_enemy_name, 0, left)
    };
    LairView {
        index: zero_based_index.wrapping_add(1),
        state,
        name,
        id,
        left,
        position: lair.home,
        map_xy: map_coordinates(lair.home, raw_bounds),
    }
}
