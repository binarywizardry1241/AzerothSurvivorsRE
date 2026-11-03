//! Current addon debuff projection reads the same slots published to the real
//! client, including periodic ownership and the original application order.

use super::*;

pub struct AddonAura {
    pub spell: u32,
    pub stacks: u32,
    pub duration: f32,
    pub ends: f32,
}

/// One row of the native combat-follower vector. Totems and loot companions
/// belong to separate collections and do not participate in AZSPETS.
pub struct AddonSummon {
    pub id: u32,
    pub entry: u32,
    pub ends: f32,
    pub duration: f32,
}

/// Retained 0.125.0 selected-hero projection. Order and captured duration come
/// from the first live encounter; the deadline is the minimum for that key.
pub struct AddonTotem {
    pub captured: RuntimeInstance<'static>,
    pub count: usize,
    pub ends: f32,
}

#[cfg(test)]
mod totem_tests {
    use super::*;
    use super::super::rng_integration::class_run;

    #[test]
    fn selected_hero_groups_live_totems_in_first_encounter_order() {
        let mut game = class_run("shaman", 0);
        game.clock = 10.0;
        let totem = |key, ends, duration| {
            let mut captured = RuntimeInstance::learned(AbilityDefinition::by_key(key).unwrap());
            captured.duration_multiplier = duration;
            totems::Totem { captured, guid: 1, position: Position::default(),
                expires_at: ends, next_tick_at: 0.0, interval: 0.0 }
        };
        game.execution.totems = vec![
            totem("magma_totem", 30.0, 2.0),
            totem("searing_totem", 10.0, 1.0),
            totem("searing_totem", 25.0, 1.0),
            totem("magma_totem", 20.0, 3.0),
            totem("magma_totem", f32::NAN, 1.0),
        ];
        let rows = game.addon_totems();
        assert_eq!(rows.len(), 2);
        assert_eq!(rows[0].captured.definition.key, "magma_totem");
        assert_eq!((rows[0].count, rows[0].ends), (2, 20.0));
        assert_eq!(rows[0].captured.duration_multiplier, 2.0);
        assert_eq!(rows[1].captured.definition.key, "searing_totem");
        assert_eq!((rows[1].count, rows[1].ends), (1, 25.0));
        game.clock = 30.0;
        assert!(game.addon_totems().is_empty());
    }
}

/// Current 1459074be..145907826: marker publication is independent of AZSLAIRS.
/// See docs/analysis/raid-lair-marker-0.112.0.md for AS fields and client-port limits.
#[derive(Debug, Default)]
pub(super) struct WorldFlag {
    selected: Option<usize>,
    visible: bool,
    last_sent: f32,
}

impl Mechanics {
    /// Capture the actual recipient mover before with_party_hero temporarily
    /// removes that row. Snapshot presentation must not borrow the host pose.
    pub fn addon_party_pose(&self, slot: u8) -> Option<(Position, f32)> {
        self.party_input_for(slot).map(|input| (input.position, input.facing))
    }

    pub fn addon_totems(&self) -> Vec<AddonTotem> {
        let mut groups: Vec<AddonTotem> = Vec::new();
        for row in &self.execution.totems {
            // The original ordered comparison excludes expired and NaN ends.
            if !(row.expires_at > self.clock) {
                continue;
            }
            if let Some(group) = groups.iter_mut()
                .find(|group| group.captured.definition.key == row.captured.definition.key)
            {
                group.count += 1;
                group.ends = group.ends.min(row.expires_at);
            } else {
                groups.push(AddonTotem {
                    captured: row.captured, count: 1, ends: row.expires_at,
                });
            }
        }
        groups
    }

    pub fn addon_summons(&self) -> Vec<AddonSummon> {
        // The native list is append-ordered. The port separates ordinary pets
        // and special demons, retaining each allocation's full chronology.
        let mut followers = self
            .pet_state
            .rows
            .iter()
            .map(|row| (row.allocation_order, row.guid, row.definition.entry, None))
            .chain(self.demon_state.rows.iter().map(|row| {
                (
                    row.allocation_order,
                    row.guid,
                    row.definition.entry,
                    row.tick.expires_at.map(|ends| (ends, row.born_at)),
                )
            }))
            .collect::<Vec<_>>();
        let current = self.counter.sequence();
        followers.sort_by_key(|(order, _, _, _)| std::cmp::Reverse(current.wrapping_sub(*order)));
        followers
            .into_iter()
            .map(|(_, guid, entry, lifetime)| {
                let (ends, duration) = lifetime.map_or((-1.0, -1.0), |(ends, born)| (ends, ends - born));
                // Native row+0x20 is the GUID. Its low word retains the low
                // entry byte as well as the masked object serial.
                AddonSummon { id: guid as u32, entry, ends, duration }
            })
            .collect()
    }

    /// Current 1459073c5..1459074be and 1459076e9..14590775c select the lair.
    /// A held lair beats every empty one. Use home XY
    ///distance with f32 total ordering; when none is held use the earliest
    ///respawn deadline. Equal keys retain the first lair in original order.
    pub fn addon_flagged_lair(&self) -> Option<usize> {
        self.addon_flag
    }

    pub fn update_addon_flag(&mut self, player: Position) {
        if !self.is_showcase() {
            self.addon_flag = self.select_addon_flag(player);
        }
    }

    pub fn update_world_flag(&mut self, player: Position, shown: bool) {
        let Some(index) = self.addon_flag else { return };
        let previous = self.world_flag.selected;
        self.world_flag.selected = Some(index);
        if !shown {
            if self.world_flag.visible {
                self.world_flag.visible = false;
                self.events.push(RunEvent::GuardianFlag { position: player, enemy: None });
            }
            return;
        }
        // The native ordered comparison admits only age >300; unordered
        // ages take the same retained-marker branch as an equal deadline.
        if previous == Some(index) && self.world_flag.visible
            && !(self.clock - self.world_flag.last_sent > 300.) { return; }
        let Some(lair) = self.guardian_lairs().get(index) else { return };
        let Some(enemy) = self.zone.enemies.get(lair.enemy_index) else { return };
        let position = Position { x: lair.home.x, y: lair.home.y, z: lair.home.z };
        let enemy = Some((enemy.id, enemy.name, lair.active_guid.is_some()));
        self.world_flag.visible = true;
        self.world_flag.last_sent = self.clock;
        self.events.push(RunEvent::GuardianFlag { position, enemy });
    }

    pub(super) fn invalidate_world_flag(&mut self) {
        // Current 145907244 clears the selected option when a guardian spawns. The
        // later selector must publish again even if it chooses the same index.
        self.addon_flag = None;
        self.world_flag.selected = None;
    }

    fn select_addon_flag(&self, player: Position) -> Option<usize> {
        let lairs = self.guardian_lairs();
        let choose = |rows: Vec<(usize, f32)>| {
            rows.into_iter()
                .reduce(|left, right| {
                    if left.1.total_cmp(&right.1).is_le() {
                        left
                    } else {
                        right
                    }
                })
                .map(|(index, _)| index)
        };
        choose(
            lairs
                .iter()
                .enumerate()
                .filter(|(_, lair)| lair.active_guid.is_some())
                .map(|(index, lair)| {
                    let x = lair.home.x - player.x;
                    let y = lair.home.y - player.y;
                    (index, (y * y + x * x).sqrt())
                })
                .collect(),
        )
        .or_else(|| {
            choose(
                lairs
                    .iter()
                    .enumerate()
                    .map(|(index, lair)| (index, lair.respawn_at))
                    .collect(),
            )
        })
    }

    pub fn addon_guardian_awake(&self, guid: u64) -> Option<u8> {
        self.guardian_state.passive_awake(guid)
    }

    ///1458df590 chooses the latest periodic end before reduction/polymorph/
    ///control fallbacks. Unknown timing remains -1; it is not guessed from DBC.
    pub fn addon_debuffs(&self, guid: u64) -> Vec<AddonAura> {
        let (actor, control, periodic) =
            if let Some(row) = self.bosses.iter().find(|row| row.guid == guid) {
                (&row.actor, &row.control, row.periodic.as_slice())
            } else if let Some(row) = self.actors.iter().find(|row| row.guid == guid) {
                (&row.actor, &row.control, row.periodic.as_slice())
            } else if let Some(row) = self
                .boss_state
                .wards
                .actors
                .iter()
                .find(|row| row.guid == guid)
            {
                (&row.actor, &row.control, row.periodic.as_slice())
            } else {
                return Vec::new();
            };
        let Some(slots) = self.effect_state.generic.aura_slots.get(&guid) else {
            return Vec::new();
        };
        slots
            .spells
            .iter()
            .copied()
            .enumerate()
            .filter_map(|(index, spell)| {
                if spell == 0 {
                    return None;
                }
                let stack_byte =
                    (slots.applications(index / 4, periodic) >> ((index % 4) * 8)) & 255;
                let period = periodic
                    .iter()
                    .filter(|row| row.spell_id == spell && row.ticks_remaining != 0)
                    .max_by(|a, b| {
                        let ends = |row: &&ActorPeriodic| {
                            (row.ticks_remaining - 1) as f32 * row.interval + row.next_tick_at
                        };
                        ends(a).total_cmp(&ends(b))
                    });
                let (duration, ends) = if let Some(row) = period {
                    (
                        row.initial_ticks.saturating_sub(1) as f32 * row.interval,
                        (row.ticks_remaining - 1) as f32 * row.interval + row.next_tick_at,
                    )
                } else if spell == super::callbacks::FROST_SHOCK_AURA && actor.slow.until > self.clock
                    && let Some(duration) = self.effect_state.generic.frost_shock_durations.get(&guid)
                {
                    (*duration, actor.slow.until)
                } else if self.effect_state.generic.reduction_spells.get(&guid) == Some(&spell)
                    && actor.damage_reduction.until > self.clock
                {
                    (
                        self.effect_state
                            .generic
                            .reduction_durations
                            .get(&guid)
                            .copied()
                            .unwrap_or(-1.),
                        actor.damage_reduction.until,
                    )
                } else if spell == 118 && actor.fear_until > self.clock {
                    (control.polymorph_duration, actor.fear_until)
                } else if actor.stun_until > self.clock {
                    (actor.stun_until - control.started_at, actor.stun_until)
                } else {
                    (-1., -1.)
                };
                Some(AddonAura {
                    spell,
                    stacks: stack_byte + 1,
                    duration,
                    ends,
                })
            })
            .collect()
    }
}
