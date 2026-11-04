//! Native geometry and stateful hazard families.
//! The raw input registry retains its 0.109.0 provenance; current contracts
//! are in docs/analysis/raid-lifecycles-0.112.0.md and raid-stateful-0.112.0.md.
//! Mark timing and two-position admission: mograine-marks-0.127.0.md.
use super::{Area, Pending, ground};
use crate::bosses::{
    NativeRng, Position, RawBossAbility,
    abilities::{CastTarget, CombatContext, CombatPort, SpellCast},
    raid_native_catalog::ACTIONS,
    raid_warnings::RaidWarning,
};
use crate::enemies::ai::Math;

#[derive(Clone, Debug)]
pub(super) enum Extra {
    Periodic {
        expires: f32,
        interval: f32,
        angular_speed: f32,
        drift_speed: f32,
        next_tick: f32,
        active: bool,
    },
    Aftershock {
        expires: f32,
        tick_damage: f32,
        visual: u32,
        object: Option<u64>,
        active: bool,
        next_tick: f32,
    },
    Tether {
        break_range: f32,
        expires: f32,
        interval: f32,
        next_tick: f32,
        active: bool,
    },
    Gaze {
        arms: f32,
    },
    Crystal {
        exposure: f32,
    },
    Spawn {
        kind: u32,
        index: u32,
    },
    Root {
        duration: f32,
    },
}

impl Pending {
    pub(super) fn push_periodic(
        &mut self,
        mut row: Area,
        expires: f32,
        interval: f32,
        angular_speed: f32,
        drift_speed: f32,
    ) {
        row.extra = Some(Extra::Periodic {
            expires,
            interval,
            angular_speed,
            drift_speed,
            next_tick: 0.,
            active: false,
        });
        self.push(row);
    }

    pub(super) fn dispatch_extra(
        &mut self,
        record: &RawBossAbility,
        c: CombatContext,
        port: &mut impl CombatPort,
        rng: &mut NativeRng,
        math: &impl Math,
    ) -> bool {
        if record.words[0] == 18 {
            port.raid_transform(c.source_guid, record.words[1] as usize);
            return true;
        }
        if record.words[0] != 17 {
            return false;
        }
        let native = ACTIONS[record.words[1] as usize];
        let w = native.words;
        let f = |i: usize| f32::from_bits(w[i]);
        let angle = (c.player.y - c.source.y).atan2(c.player.x - c.source.x);
        if !crate::guardians::signatures::nonblocking(native.native_tag) {
            port.raid_block(c.source_guid, native.blocking_duration());
        }
        match native.native_tag {
            8 => {
                let visual_z = port.primary_height([c.player.x, c.player.y])
                    .unwrap_or(c.player.z);
                port.raid_hold_facing(c.source_guid, f(3) + 0.3, angle);
                port.raid_cast(c.source_guid, w[0], f(3));
                let mut row = Area::danger(
                    c,
                    ground(port, c.source),
                    f(1),
                    f(3),
                    c.effective_damage * f(4),
                    port.heroic_rank(),
                );
                row.cone = Some((angle, f(2) * f32::from_bits(0x3c8efa35) * 0.5));
                self.push(row);
                if w[0] != 0 {
                    let point = Position {
                        x: (f(1) * math.cos(angle)) * 0.5 + c.source.x,
                        y: (f(1) * math.sin(angle)) * 0.5 + c.source.y,
                        z: visual_z,
                    };
                    self.queue_action_visual(c.source_guid, w[0], c.now + f(3), point);
                }
            }
            9 => {
                port.raid_hold_facing(c.source_guid, f(3), angle);
                port.raid_cast(c.source_guid, w[0], f(3));
                let mut row = Area::danger(
                    c,
                    ground(port, c.source),
                    f(1),
                    f(3),
                    c.effective_damage * f(4),
                    port.heroic_rank(),
                );
                row.line = Some((angle, f(2)));
                row.impact_spell = w[0];
                self.push(row);
            }
            10 | 31 => {
                let shift = usize::from(native.native_tag == 31) * 2;
                let spell = w[shift];
                let count = w[shift + 1];
                let radius = f(shift + 2);
                let spread = f(shift + 3);
                let windup = f(shift + 4);
                let damage = c.effective_damage * f(shift + 5);
                port.raid_cast(c.source_guid, spell, windup);
                if count > 0 {
                    let max = spread.max(radius + 1.);
                    let initial = if native.native_tag == 31 {
                        rng.range_f32(0., std::f32::consts::TAU)
                    } else {
                        0.
                    };
                    for i in 0..count {
                        let point = if i == 0 {
                            c.player
                        } else {
                            let a = rng.range_f32(0., std::f32::consts::TAU);
                            let d = rng.range_f32(radius, max);
                            Position {
                                x: c.player.x + d * math.cos(a),
                                y: c.player.y + d * math.sin(a),
                                z: c.player.z,
                            }
                        };
                        let point = if native.native_tag == 31 {
                            clamp_zone(point, port)
                        } else {
                            point
                        };
                        let step = if native.native_tag == 31 { 0.45 } else { 0.35 };
                        let delay = i as f32 * step + windup;
                        let mut row = Area::danger(c, ground(port, point), radius, delay, damage, port.heroic_rank());
                        row.impact_spell = spell;
                        if native.native_tag == 31 {
                            row.extra = Some(Extra::Spawn {
                                kind: w[0],
                                index: w[1],
                            });
                        }
                        if i > 0 {
                            row.warning_lead = windup.max(1.4);
                        }
                        let _ = initial;
                        self.push(row);
                    }
                }
            }
            11 => {
                // 0.127.0 reserves radius/7 + 0.5 seconds after tracking stops,
                // including the Heroic shortening of the actual impact time.
                let escape = f(2) / 7.0 + 0.5;
                let windup = f(4).max(escape / crate::heroic::warning_factor(port.heroic_rank()));
                port.raid_cast(c.source_guid, w[0], windup);
                let mut row = Area::danger(
                    c,
                    ground(port, c.player),
                    f(2),
                    windup,
                    c.effective_damage * f(5),
                    port.heroic_rank(),
                );
                row.follow_player_until = (c.now + f(3)).min(row.end - escape).max(c.now);
                row.impact_spell = w[0];
                if f(6) > 0. {
                    row.extra = Some(Extra::Aftershock {
                        expires: (c.now + windup) + f(6),
                        tick_damage: c.effective_damage * f(7),
                        visual: w[1],
                        object: None,
                        active: false,
                        next_tick: 0.,
                    });
                }
                self.push(row);
            }
            13 => {
                port.raid_hold(c.source_guid, f(3));
                port.raid_cast(c.source_guid, w[0], f(3));
                let mut row = Area::danger(
                    c,
                    ground(port, c.source),
                    f(2),
                    f(3),
                    c.effective_damage * f(4),
                    port.heroic_rank(),
                );
                if f(1) > 0. {
                    row.inner_radius = Some(f(1));
                }
                row.follow = true;
                row.impact_spell = w[0];
                self.push(row);
            }
            14 => {
                port.raid_hold(c.source_guid, 1.);
                port.raid_cast(c.source_guid, w[0], 1.);
                let expires = (c.now + 1.) + f(2);
                port.raid_whirlwind(c.source_guid, expires);
                let mut row = Area::danger(
                    c,
                    ground(port, c.source),
                    f(1),
                    1.,
                    c.effective_damage * f(3),
                    port.heroic_rank(),
                );
                row.follow = true;
                row.impact_spell = w[0];
                self.push_periodic(row, expires, 0.5, 0., 0.);
            }
            15 => {
                port.raid_hold_facing(c.source_guid, f(3) + f(4), angle);
                port.raid_cast(c.source_guid, w[0], f(3));
                port.raid_warning(c.source_guid, RaidWarning::SweepingGaze);
                let direction = if rng.next_u64() >> 63 == 0 {
                    -std::f32::consts::PI
                } else {
                    std::f32::consts::PI
                };
                let mut row = Area::danger(
                    c,
                    ground(port, c.source),
                    f(1),
                    f(3),
                    c.effective_damage * f(5),
                    port.heroic_rank(),
                );
                row.line = Some((angle, f(2)));
                row.follow = true;
                row.impact_spell = w[0];
                self.push_periodic(row, (c.now + f(3)) + f(4), 0.25, direction / f(4), 0.);
            }
            16 => {
                port.raid_hold(c.source_guid, f(3));
                port.raid_cast(c.source_guid, w[0], f(3));
                for offset in [
                    0.,
                    std::f32::consts::FRAC_PI_2,
                    std::f32::consts::PI,
                    3. * std::f32::consts::FRAC_PI_2,
                ] {
                    let mut row = Area::danger(
                        c,
                        ground(port, c.source),
                        f(1),
                        f(3),
                        c.effective_damage * f(4),
                        port.heroic_rank(),
                    );
                    row.line = Some((angle + offset, f(2)));
                    row.impact_spell = if offset == 0. { w[0] } else { 0 };
                    self.push(row);
                }
            }
            17 => {
                port.raid_cast(c.source_guid, w[0], f(4));
                let a = rng.range_f32(0., std::f32::consts::TAU);
                let step = 1.6 * f(3);
                let spacing = 2.6 * f(3);
                let half = w[2] as f32 * 0.5 * step;
                for lane in 0..w[1] {
                    let across = (lane as f32 - (w[1] as f32 - 1.) * 0.5) * spacing;
                    for i in 0..w[2] {
                        let mut along = step * i as f32 - half;
                        if lane & 1 != 0 {
                            along = -along;
                        }
                        let center = Position {
                            x: (along * math.cos(a) + c.player.x) - across * math.sin(a),
                            y: along * math.sin(a) + c.player.y + across * math.cos(a),
                            z: c.player.z,
                        };
                        let mut row = Area::danger(
                            c,
                            ground(port, center),
                            f(3),
                            i as f32 * f(5) + f(4),
                            c.effective_damage * f(6),
                            port.heroic_rank(),
                        );
                        row.impact_spell = w[0];
                        if i > 0 {
                            row.warning_lead = 1.4;
                        }
                        self.push(row);
                    }
                }
            }
            19 => {
                let delay = 1.3;
                port.raid_hold(c.source_guid, delay);
                port.raid_cast(c.source_guid, w[0], delay);
                let mut row = Area::danger(
                    c,
                    ground(port, c.source),
                    f(1),
                    delay,
                    c.effective_damage * f(2),
                    port.heroic_rank(),
                );
                row.follow = true;
                row.knockback = f(3);
                row.impact_spell = w[0];
                self.push(row);
            }
            20 => {
                // 0.112.0 at 1459218c0 rounds each squared lane before sqrt and
                // rejects only an ordered distance greater than 30.
                let dx = c.source.x - c.player.x;
                let dy = c.source.y - c.player.y;
                let distance = (dy * dy + dx * dx).sqrt();
                if !(distance > 30.) {
                    port.raid_hold_facing(c.source_guid, f(1) + 0.4, angle);
                    port.raid_cast(c.source_guid, w[0], f(1));
                    self.lines.pull_at(c.source_guid, c.now + f(1));
                }
            }
            21 => {
                let requested = Position {
                    x: c.player.x + f(1) * math.cos(angle),
                    y: c.player.y + f(1) * math.sin(angle),
                    z: port
                        .primary_height([c.player.x, c.player.y])
                        .unwrap_or(c.player.z),
                };
                let mut destination = requested;
                if let Some(fraction) = port.ray_fraction(c.player, requested).filter(|v| !(*v >= 1.)) {
                    let dx = requested.x - c.player.x;
                    let dy = requested.y - c.player.y;
                    let length = (dy * dy + dx * dx).sqrt().max(0.5);
                    let t = (fraction - 0.5 / length).max(0.);
                    destination = Position {
                        x: dx * t + c.player.x,
                        y: dy * t + c.player.y,
                        z: (requested.z - c.player.z) * t + c.player.z,
                    };
                }
                destination = clamp_zone(destination, port);
                destination.z = port
                    .primary_height([destination.x, destination.y])
                    .unwrap_or(destination.z);
                for point in [c.source, destination] {
                    port.cast_spell(SpellCast {
                        source_guid: c.source_guid,
                        spell_id: w[0],
                        target: CastTarget::Ground(point),
                        hit_targets: Vec::new(),
                    });
                }
                let facing = (c.player.y - destination.y).atan2(c.player.x - destination.x);
                port.raid_teleport(c.source_guid, destination, facing);
                port.raid_hold_facing(c.source_guid, 0.5, facing);
            }
            23 => {
                let removal = crate::bosses::raid_shields::dispatch_payload(w[0], f(1), c, port);
                self.lines.remove_aura_at(removal.source, removal.spell, removal.at);
            }
            25 => {
                port.raid_cast(c.source_guid, w[0], f(2));
                port.raid_warning(c.source_guid, RaidWarning::Tether);
                let length = (c.player.x - c.source.x)
                    .hypot(c.player.y - c.source.y)
                    .max(1.);
                let mut row = Area::danger(
                    c,
                    ground(port, c.source),
                    length,
                    f(2),
                    c.effective_damage * f(4),
                    port.heroic_rank(),
                );
                row.line = Some((angle, 1.6));
                row.follow = true;
                row.impact_spell = w[0];
                row.extra = Some(Extra::Tether {
                    break_range: f(1),
                    expires: (c.now + f(2)) + f(3),
                    interval: f(5),
                    next_tick: 0.,
                    active: false,
                });
                self.push(row);
            }
            26 => {
                port.raid_cast(c.source_guid, w[0], f(1));
                port.raid_warning(c.source_guid, RaidWarning::Gaze);
                let mut row = Area::danger(
                    c,
                    ground(port, c.player),
                    2.5,
                    f(1),
                    c.effective_damage * f(2),
                    port.heroic_rank(),
                );
                row.follow_player_until = c.now + 0.8;
                row.impact_spell = w[0];
                row.extra = Some(Extra::Gaze { arms: c.now + 0.8 });
                self.push(row);
            }
            29 => {
                port.raid_cast(c.source_guid, w[0], f(3));
                let a = rng.range_f32(0., std::f32::consts::TAU);
                for wave in 0..w[5].max(1) {
                    let mut lane = wave & 1;
                    while lane < w[1].max(1) {
                        let across = (lane as f32 - (w[1] as f32 - 1.) * 0.5) * f(2);
                        let center = Position {
                            x: (c.player.x - 30. * math.cos(a)) - across * math.sin(a),
                            y: (c.player.y - 30. * math.sin(a)) + across * math.cos(a),
                            z: c.player.z,
                        };
                        let mut row = Area::danger(
                            c,
                            ground(port, center),
                            60.,
                            f(3) + wave as f32 * f(4),
                            c.effective_damage * f(6),
                            port.heroic_rank(),
                        );
                        row.line = Some((a, f(2)));
                        row.impact_spell = w[0];
                        if wave > 0 {
                            row.warning_lead = (f(4) * 0.9).min(1.4);
                        }
                        self.push(row);
                        lane += 2;
                    }
                }
            }
            33 => {
                let start = rng.range_f32(0., std::f32::consts::TAU);
                port.raid_cast(c.source_guid, w[0], f(4));
                port.raid_warning(c.source_guid, RaidWarning::Crystals);
                for i in 0..w[1].max(1) {
                    let d = rng.range_f32(0.7, 1.) * f(3);
                    let a = i as f32 / w[1].max(1) as f32 * std::f32::consts::TAU + start;
                    let point = clamp_zone(
                        Position {
                            x: c.player.x + d * math.cos(a),
                            y: c.player.y + d * math.sin(a),
                            z: c.player.z,
                        },
                        port,
                    );
                    let mut row = Area::danger(c, ground(port, point), f(2), f(4), 0., port.heroic_rank());
                    row.impact_spell = w[0];
                    row.extra = Some(Extra::Crystal { exposure: f(5) });
                    self.push(row);
                }
            }
            _ => return false,
        }
        true
    }
}
fn clamp_zone(mut point: Position, port: &impl CombatPort) -> Position {
    if let Some((center, radius)) = port.raid_zone_bounds() {
        let x = point.x - center[0];
        let y = point.y - center[1];
        let distance = x.hypot(y);
        let maximum = radius - 4.;
        if distance >= 0.01 && maximum < distance {
            point.x = center[0] + x / distance * maximum;
            point.y = center[1] + y / distance * maximum;
        }
    }
    point
}

impl Area {
    /// Native145950134 admits drift for any state and angular movement only
    /// for kind3, including its unordered/nonzero angular-speed predicate.
    pub(super) fn extra_moves(&self) -> bool {
        matches!(&self.extra, Some(Extra::Periodic { drift_speed, angular_speed, .. })
            if *drift_speed > 0. || *angular_speed != 0.)
    }

    /// Returns None for plain rows; Some(remove,damage) for extension-owned rows.
    pub(super) fn advance_extra(
        &mut self,
        now: f32,
        elapsed: f32,
        player: Position,
        projected: Position,
        port: &mut impl CombatPort,
    ) -> Option<(
        bool,
        f32,
        bool,
        Option<f32>,
        Option<f32>,
        Option<(u32, u32, Position)>,
    )> {
        let mut state = self.extra.take()?;
        let mut damage = 0.;
        let mut remove = false;
        let mut replaced = false;
        let mut heal = None;
        let mut expose = None;
        let mut spawn = None;
        match &mut state {
            Extra::Root { .. } => {
                self.extra = Some(state);
                return None;
            }
            Extra::Periodic {
                expires,
                interval,
                angular_speed,
                drift_speed,
                next_tick,
                active,
            } => {
                if *active {
                    if let Some((a, _)) = self.line.as_mut() {
                        *a += *angular_speed * elapsed;
                    }
                    if *drift_speed > 0. {
                        let dx = player.x - self.center.x;
                        let dy = player.y - self.center.y;
                        let d = dx.hypot(dy);
                        if d > 0.05 {
                            let step = (*drift_speed * elapsed).min(d);
                            self.center = ground(
                                port,
                                Position {
                                    x: self.center.x + dx / d * step,
                                    y: self.center.y + dy / d * step,
                                    z: self.center.z,
                                },
                            );
                        }
                    }
                }
                if now >= self.end {
                    if !*active {
                        *active = true;
                        *next_tick = now;
                        replaced = true;
                    }
                    if now >= *expires {
                        remove = true;
                    } else if now >= *next_tick {
                        *next_tick += *interval;
                        if self.damage_contains(player, projected) {
                            damage = self.damage;
                        }
                    }
                }
            }
            Extra::Aftershock {
                expires,
                tick_damage,
                active,
                next_tick,
                ..
            } => {
                if now >= self.end {
                    if !*active {
                        if self.damage_contains(player, projected) {
                            damage = self.damage;
                        }
                        *active = true;
                        *next_tick = now + 1.;
                        replaced = true;
                    }
                    if now >= *expires {
                        remove = true;
                    } else if now >= *next_tick {
                        *next_tick += 1.;
                        if self.damage_contains(player, projected) {
                            damage += *tick_damage;
                        }
                    }
                }
            }
            Extra::Tether {
                break_range,
                expires,
                interval,
                next_tick,
                active,
            } => {
                let dx = player.x - self.center.x;
                let dy = player.y - self.center.y;
                let distance = dx.hypot(dy);
                self.radius = distance.max(1.);
                self.line = Some((dy.atan2(dx), 1.6));
                if now >= self.end {
                    if !*active {
                        *active = true;
                        *next_tick = now;
                        replaced = true;
                    }
                    if distance > *break_range || now >= *expires {
                        remove = true;
                    } else if now >= *next_tick {
                        *next_tick += 0.5;
                        damage = self.damage;
                        heal = Some(*interval);
                    }
                }
            }
            Extra::Gaze { arms } => {
                if now >= self.end {
                    remove = true;
                } else if now >= *arms && !self.contains(player) {
                    damage = self.damage;
                    self.center = player;
                    replaced = true;
                    remove = true;
                }
            }
            Extra::Spawn { kind, index } => {
                if now >= self.end {
                    damage = if self.damage_contains(player, projected) {
                        self.damage
                    } else {
                        0.
                    };
                    spawn = Some((*kind, *index, self.center));
                    remove = true;
                    replaced = true;
                }
            }
            Extra::Crystal { exposure } => {
                if now >= self.end {
                    replaced = true;
                    if self.contains(player) || self.contains(projected) {
                        expose = Some(now + *exposure);
                    }
                    remove = true;
                }
            }
        }
        self.extra = Some(state);
        Some((remove, damage, replaced, heal, expose, spawn))
    }
}
