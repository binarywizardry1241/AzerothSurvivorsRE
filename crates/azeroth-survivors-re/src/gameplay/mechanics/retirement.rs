//! Current0.123.0 Game object collector145b1dd80 and command6 delivery.
//! Keep the client alive while retiring the taken Game's actual objects.

use super::*;

#[derive(Default)]
pub(in crate::gameplay) struct Retirement {
    pub before_items: Vec<u64>,
    pub after_items: Vec<u64>,
}

#[derive(Default)]
pub(super) struct PrivateObjects {
    ground: Vec<u64>,
    totems: Vec<u64>,
    followers: Vec<(u64, u64)>,
    lightwells: Vec<u64>,
    companions: Vec<u64>,
}

impl PrivateObjects {
    pub(super) fn capture(
        execution: &ExecutionState<'_>,
        pets: &pets::State,
        demons: &demons::State,
        passives: &PassiveTickState,
        companions: &loot_companions::State,
    ) -> Self {
        Self {
            ground: execution.ground.iter().map(|row| row.object_guid)
                .filter(|guid| *guid != 0).collect(),
            totems: execution.totems.iter().map(|row| row.guid).collect(),
            followers: pets.rows.iter().map(|row| (row.allocation_order, row.guid))
                .chain(demons.rows.iter().map(|row| (row.allocation_order, row.guid)))
                .collect(),
            lightwells: passives.lightwells.iter().map(|row| row.object_guid).collect(),
            companions: companions.actors.iter().map(|row| row.guid).collect(),
        }
    }
}

impl Mechanics {
    /// Enumerate logical owners rather than guessing which ECS entities belong
    /// to this Game. Player GUIDs and static MPQ world objects are excluded.
    pub(in crate::gameplay) fn retirement_objects(&self) -> Retirement {
        let current = self.counter.sequence();
        let age = |order: u64| std::cmp::Reverse(current.wrapping_sub(order));
        let mut actors: Vec<_> = self.actors.iter().map(|row| (row.allocation_order, row.guid))
            .chain(self.bosses.iter().map(|row| (row.allocation_order, row.guid)))
            .chain(self.boss_state.wards.actors.iter()
                .map(|row| (row.allocation_order, row.guid))).collect();
        actors.sort_by_key(|(order, _)| age(*order));
        let mut before_items = actors.into_iter().map(|(_, guid)| guid).collect::<Vec<_>>();
        // Native660/668 primaries precede the separate flattened auxiliary pass.
        // Cache GUIDs use this ordinary pickup owner even after their create
        // event has left the Game's pending queue.
        before_items.extend(self.pickups.iter().map(|row| row.id));
        before_items.extend(self.pickups.iter().flat_map(|row| row.auxiliary)
            .flatten());
        let mut private = vec![PrivateObjects::capture(&self.execution, &self.pet_state,
            &self.demon_state, &self.passive_state, &self.loot_companion_state)];
        private.extend(self.remote_retirement_objects());
        before_items.extend(private.iter().flat_map(|row| row.ground.iter().copied()));
        before_items.extend(self.boss_state.retirement_ground_objects());
        before_items.extend(private.iter().flat_map(|row| row.totems.iter().copied()));
        let mut followers: Vec<_> = private.iter().flat_map(|row| row.followers.iter().copied()).collect();
        followers.sort_by_key(|(order, _)| age(*order));
        before_items.extend(followers.into_iter().map(|(_, guid)| guid));
        before_items.extend(private.iter().flat_map(|row| row.lightwells.iter().copied()));
        let mut after_items = private.iter().flat_map(|row| row.companions.iter().copied())
            .collect::<Vec<_>>();
        // Currenta10/a18 stores the exact IDs returned by Begin's9013 creator.
        after_items.extend(self.boundary_objects.iter().copied());
        Retirement { before_items, after_items }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use super::super::rng_integration::{class_run, TerrainFixture};

    #[test]
    fn restart_retires_delivered_cache_primaries_then_auxiliaries_and_pillars() {
        let mut game = class_run("priest", 0);
        for (id, auxiliary) in [(11, [Some(101), None]), (12, [Some(102), Some(103)])] {
            game.pickups.push(RunPickup { id, created_at: 0.,
                drop: PickupDrop::Cache { position: Default::default() },
                flight: None, facing: 0., auxiliary });
        }
        game.begin_boundary(&mut TerrainFixture);
        let pillars = game.events.iter().filter_map(|event| match event {
            RunEvent::BoundaryPillar(object) => Some(object.guid), _ => None,
        }).collect::<Vec<_>>();
        assert!(!pillars.is_empty());
        game.events.clear(); // All creates were delivered in an earlier frame.
        let retired = game.retirement_objects();
        assert_eq!(retired.before_items, [11, 12, 101, 102, 103]);
        assert_eq!(retired.after_items, pillars);
        assert!(!retired.before_items.contains(&game.player_guid));
    }
}
