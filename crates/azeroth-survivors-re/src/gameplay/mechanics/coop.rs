//! Native party context ownership (145920ed0) over one shared world.
//! Remote state contains no actor, boss, pickup, RNG or spawn scheduler copy.
use super::*;
use azeroth_survivors_re::coop::client_state::{RunPhase, RunProjection};
use azeroth_survivors_re::coop::game_party::{Party, PartyHero, PartySpell};
use azeroth_survivors_re::mob_loot::EquipmentRoll;
use std::collections::HashMap;

///145983f40: damage-sorted JSON rows, optional ordered breakdown objects.
fn hud_meter(
    entries: &[azeroth_survivors_re::run_effects::healing::MeterEntry],
    locale: &crate::localization::Localization,
) -> Vec<serde_json::Value> {
    let mut rows: Vec<(String, &str, bool, f64, Vec<(String, f64)>)> = Vec::new();
    for entry in entries {
        let name = super::super::addon_meters::source_name(entry.source, locale);
        let index = if let Some(index) = rows
            .iter()
            .position(|row| row.0 == name && row.2 == entry.source.talent)
        {
            index
        } else {
            rows.push((
                name,
                entry.source.icon,
                entry.source.talent,
                0.0,
                Vec::new(),
            ));
            rows.len() - 1
        };
        rows[index].3 += entry.total;
        for part in &entry.breakdown {
            let name = locale.label(part.name).to_owned();
            if let Some(row) = rows[index].4.iter_mut().find(|row| row.0 == name) {
                row.1 += part.total;
            } else {
                rows[index].4.push((name, part.total));
            }
        }
    }
    rows.sort_by(|left, right| right.3.total_cmp(&left.3));
    rows.into_iter()
        .map(|(name, icon, proc, total, mut parts)| {
            let mut row =
                serde_json::json!({"name":name,"icon":icon,"dmg":total.round(),"proc":proc});
            if !parts.is_empty() {
                parts.sort_by(|left, right| right.1.total_cmp(&left.1));
                row["parts"] = serde_json::json!(
                    parts
                        .into_iter()
                        .map(|(name, total)| serde_json::json!({"name":name,"dmg":total.round()}))
                        .collect::<Vec<_>>()
                );
            }
            row
        })
        .collect()
}

/// Current145901720..17a4 uses positive HP admission and SSE min/max order.
fn rescaled_health_fields(
    health: &mut f32,
    maximum: &mut f32,
    ratio: f32,
) -> Option<Vec<(u16, u32)>> {
    if !(*health > 0.0) {
        return None;
    }
    let scaled_maximum = *maximum * ratio;
    *maximum = if scaled_maximum > 1.0 {
        scaled_maximum
    } else {
        1.0
    };
    let scaled_health = *health * ratio;
    let scaled_health = if 1.0 > scaled_health {
        1.0
    } else {
        scaled_health
    };
    *health = if *maximum < scaled_health {
        *maximum
    } else {
        scaled_health
    };
    Some(vec![
        (28, maximum.ceil() as u32),
        (22, health.ceil() as u32),
    ])
}

macro_rules! hero_state {
    ($($field:ident : $kind:ty),* $(,)?) => {
        #[derive(Debug)]
        struct HeroState {
            $( $field: $kind, )*
            boss_player_override: Option<(Position, f32)>,
            boss_aim_report: Option<azeroth_survivors_re::bosses::prediction::MovementReport>,
            boss_aim_flags: u32,
            boss_death: azeroth_survivors_re::bosses::death::BossDeathState,
            equipment_drops: progression::EquipmentDrops,
            completion_run_state: u8,
            completion_victories: u32,
            guardian_strength: u32,
            guardian_kills: u32,
            guardian_jewelry: u32,
            guardian_rewards: Vec<guardians::GuardianRewardEvent>,
        }
        impl HeroState {
            fn from_template(template: Mechanics) -> Self {
                Self { $( $field: template.$field, )*
                    boss_player_override: template.boss_state.player_override,
                    boss_aim_report: template.boss_state.aim_report,
                    boss_aim_flags: template.boss_state.aim_flags,
                    boss_death: template.boss_state.death,
                    equipment_drops: template.boss_state.equipment,
                    completion_run_state: template.boss_state.completion.run_state,
                    completion_victories: template.boss_state.completion.victories,
                    guardian_strength: template.guardian_state.pending_strength,
                    guardian_kills: template.guardian_state.personal_kills,
                    guardian_jewelry: template.guardian_state.pending_jewelry,
                    guardian_rewards: template.guardian_state.reward_events,
                }
            }
            fn swap(&mut self, game: &mut Mechanics) {
                // These maps belong to the shared actors, although the solo
                // adapter historically grouped them with perhero callbacks.
                std::mem::swap(&mut self.effect_state.generic.aura_slots, &mut game.effect_state.generic.aura_slots);
                std::mem::swap(&mut self.effect_state.generic.frost_shock_durations, &mut game.effect_state.generic.frost_shock_durations);
                std::mem::swap(&mut self.effect_state.generic.reduction_spells, &mut game.effect_state.generic.reduction_spells);
                std::mem::swap(&mut self.effect_state.generic.reduction_durations, &mut game.effect_state.generic.reduction_durations);
                std::mem::swap(&mut self.effect_state.generic.actor_weakening, &mut game.effect_state.generic.actor_weakening);
                std::mem::swap(&mut self.effect_state.generic.demoralizing_amplification, &mut game.effect_state.generic.demoralizing_amplification);
                std::mem::swap(&mut self.effect_state.generic.appearance_overrides, &mut game.effect_state.generic.appearance_overrides);
                std::mem::swap(&mut self.effect_state.generic.packlord_howl, &mut game.effect_state.generic.packlord_howl);
                self.chest_state.swap_world(&mut game.chest_state);
                $( std::mem::swap(&mut self.$field, &mut game.$field); )*
                std::mem::swap(&mut self.boss_player_override, &mut game.boss_state.player_override);
                std::mem::swap(&mut self.boss_aim_report, &mut game.boss_state.aim_report);
                std::mem::swap(&mut self.boss_aim_flags, &mut game.boss_state.aim_flags);
                std::mem::swap(&mut self.boss_death, &mut game.boss_state.death);
                std::mem::swap(&mut self.equipment_drops, &mut game.boss_state.equipment);
                std::mem::swap(&mut self.completion_run_state, &mut game.boss_state.completion.run_state);
                std::mem::swap(&mut self.completion_victories, &mut game.boss_state.completion.victories);
                std::mem::swap(&mut self.guardian_strength, &mut game.guardian_state.pending_strength);
                std::mem::swap(&mut self.guardian_kills, &mut game.guardian_state.personal_kills);
                std::mem::swap(&mut self.guardian_jewelry, &mut game.guardian_state.pending_jewelry);
                std::mem::swap(&mut self.guardian_rewards, &mut game.guardian_state.reward_events);
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::rng_integration::{TerrainFixture, class_run, fixture_enemies};
    use super::*;

    fn pair() -> Mechanics {
        let mut local = class_run("warrior", 1);
        local.player_guid = 100;
        local.set_party_local_name("Local".into());
        local.set_store_levels(true);
        let mut remote = class_run("priest", 1);
        remote.set_store_levels(true);
        local
            .admit_party_hero(
                1,
                200,
                "Remote".into(),
                remote,
                local.zone.center.into(),
                1.0,
            )
            .unwrap();
        local.party_input(
            0,
            PartyInput {
                position: local.zone.center.into(),
                facing: 0.,
                velocity: [0.; 2],
            },
        );
        local
    }

    #[test]
    fn downed_addon_rows_use_world_identity_and_exclude_the_borrowed_recipient() {
        let mut game = pair();
        let point = Position::from([1.5, -2.5, 3.0]);
        game.party_input(1, PartyInput { position: point, facing: 0.0, velocity: [0.0; 2] });
        game.clock = 12.5;
        game.with_party_hero(1, |hero| {
            hero.dead = true;
            hero.fall_epoch = hero.clock;
        }).unwrap();
        assert_eq!(game.party_downed_payload(), "u200,Remote,1.5,-2.5,3.0,12.5,down");
        assert!(game.with_party_hero(1, |hero| hero.party_downed_payload()).unwrap().is_empty());

        game.with_party_hero(1, |hero| hero.apply_party_revive(
            azeroth_survivors_re::coop::game_party::Revived {
                slot: 1, health: 60.0, immunity_spell: 1020, immunity_expires: 14.5,
            },
        )).unwrap();
        assert!(game.party_downed_payload().is_empty());

        game.clock = 15.0;
        assert!(game.leave_party_hero(1));
        assert_eq!(game.party_downed_payload(), "u200,Remote,1.5,-2.5,3.0,15.0,left");
    }

    #[test]
    fn party_fall_banners_seat_the_affected_hero_and_notify_other_recipients_once() {
        let mut game = pair();
        game.with_party_hero(1, |hero| {
            let point = hero.zone.center.into();
            hero.damage_player(150.0, false, 0, point, 0.0, &mut TerrainFixture);
        }).unwrap();
        game.publish_party_fall_banners();
        game.publish_party_fall_banners();
        let banners = |events: Vec<RunEvent>| {
            events.into_iter().filter_map(|event| match event {
                RunEvent::PartyBanner(banner) => Some(banner),
                _ => None,
            }).collect::<Vec<_>>()
        };
        assert!(matches!(
            banners(std::mem::take(&mut game.events)).as_slice(),
            [PartyBanner::FriendDown(name)] if name == "Remote"
        ));
        let remote_banners = |game: &mut Mechanics| {
            game.take_party_events().into_iter()
                .flat_map(|(_, guid, events)| banners(events).into_iter().map(move |banner| (guid, banner)))
                .collect::<Vec<_>>()
        };
        assert!(matches!(
            remote_banners(&mut game).as_slice(), [(200, PartyBanner::Downed)]
        ));

        game.with_party_hero(1, |hero| hero.apply_party_revive(
            azeroth_survivors_re::coop::game_party::Revived {
                slot: 1, health: 60.0, immunity_spell: 1020, immunity_expires: 14.5,
            },
        )).unwrap();
        assert!(matches!(
            remote_banners(&mut game).as_slice(), [(200, PartyBanner::Revived)]
        ));
        assert!(game.leave_party_hero(1));
        game.publish_party_fall_banners();
        assert!(matches!(
            banners(std::mem::take(&mut game.events)).as_slice(),
            [PartyBanner::FriendDown(name)] if name == "Remote"
        ));
        assert!(!remote_banners(&mut game).iter()
            .any(|(_, banner)| matches!(banner, PartyBanner::Downed)));
    }

    #[test]
    fn missing_card_request_keeps_each_heros_offer_and_progress() {
        let mut game = pair();
        for slot in [0, 1] {
            game.with_party_hero(slot, |hero| {
                hero.choice_state.offer = 17 + u32::from(slot);
                hero.pending_levels = 3;
            });
        }
        for slot in [0, 1] {
            let before = game.with_party_hero(slot, |hero|
                (hero.choice_offer(), hero.pending_levels, hero.choices.len())).unwrap();
            assert!(game.party_control(slot, 10, 255, u32::MAX, |_| {
                panic!("choice response request does not query terrain")
            }));
            let after = game.with_party_hero(slot, |hero|
                (hero.choice_offer(), hero.pending_levels, hero.choices.len())).unwrap();
            assert_eq!(after, before);
        }
    }

    #[test]
    fn hero_context_retains_one_actor_world_and_actual_private_event_identity() {
        let mut game = pair();
        let mut terrain = TerrainFixture;
        game.with_party_hero(1, |remote| {
            assert_eq!(remote.player_guid, 200);
            remote.execution.vitals.health = 40.;
            fixture_enemies(remote, &[10.], &mut terrain);
            remote.events.push(RunEvent::PlayerValues(vec![(22, 40)]));
        })
        .unwrap();
        assert_eq!(game.player_guid, 100);
        assert_eq!(game.health(), 100.);
        assert_eq!(
            game.actors.len(),
            1,
            "the actor added in remote context belongs to the shared world"
        );
        assert_eq!(game.with_party_hero(1, |remote| remote.health()), Some(40.));
        let packets = game.take_party_events();
        assert!(
            packets
                .iter()
                .all(|(slot, guid, _)| (*slot, *guid) == (1, 200))
        );
        assert!(packets.iter().any(|(_, _, rows)| rows.iter().any(
            |row| matches!(row, RunEvent::PlayerValues(fields) if fields.contains(&(22, 40)))
        )));
        assert!(
            game.party_meter_payload().is_empty(),
            "no cached rows before the native one-second gate"
        );
    }

    #[test]
    fn ordinary_boss_credit_captures_either_killer_and_reaches_a_downed_recipient_once() {
        use azeroth_survivors_re::account_progression::{BossKillingBlow, killing_spell, killing_blow_is_melee};
        for killer in 0..=1 {
            for (spell_id, school, kind) in [(16038, 2, 0), (116, 4, 2), (0, 0, 0)] {
                let mut game = pair();
                let player = game.zone.center.into();
                let mut terrain = TerrainFixture;
                game.clock = 1.0;
                game.spawn_showcase_bosses(player, [0.0; 2], &mut terrain);
                game.bosses[0].health = 1.0;
                let guid = game.bosses[0].guid;
                let boss_id = game.bosses[0].definition.id;
                for slot in 0..=1 {
                    game.with_party_hero(slot, |hero| {
                        hero.abilities[0].remaining = f32::INFINITY;
                        hero.effect_state.generic.killing_blows.push((1, 2));
                        hero.effect_state.generic.damaged_by_bosses = vec![u32::from(slot) + 10];
                        if slot != killer {
                            hero.dead = true;
                            hero.execution.vitals.health = 0.0;
                        }
                    });
                }
                game.with_party_hero(killer, |hero| {
                    hero.execution.pending.0.push(PendingHit {
                        context: HitContext { captured_source_kind: Some(kind),
                            pet_entry: (kind == 2).then_some(9517), ..Default::default() },
                        target_guid: guid, source_guid: 9517,
                        effect: player_abilities::StatusEffect { tag: 0, value: 0.0, duration: 0.0 },
                        resolves_at: hero.clock, spell_id, damage: 100.0,
                        critical: false, damages_player: false, school,
                    });
                    hero.tick_stage(0.01, player, [0.0; 2], 0.0, &mut terrain, true);
                }).unwrap();
                let expected = BossKillingBlow { boss_id, spell_id: killing_spell(spell_id),
                    school, source_kind: kind, melee: killing_blow_is_melee(kind, spell_id) };
                assert_eq!(game.boss_state.shared_killing_blows, vec![(killer, expected)]);
                for _ in 0..2 {
                    game.distribute_party_rewards();
                    for slot in 0..=1 {
                        game.with_party_hero(slot, |hero| {
                            assert_eq!(hero.killing_blows(), &[(1, 2), (boss_id, expected.spell_id)]);
                            assert_eq!(hero.boss_killing_blows(), &[expected]);
                            assert_eq!(hero.damaged_by_bosses(), &[u32::from(slot) + 10]);
                            let state = hero.native_state();
                            assert_eq!(state.pairs, vec![[1, 2], [boss_id, expected.spell_id]]);
                            assert_eq!(state.rows.len(), 1);
                            assert_eq!(state.words, vec![u32::from(slot) + 10]);
                        });
                    }
                }
                assert!(game.boss_state.shared_killing_blows.is_empty());
            }
        }
    }

    #[test]
    fn ordinary_boss_credit_preserves_order_and_excludes_only_killer_and_abandoned() {
        use azeroth_survivors_re::account_progression::BossKillingBlow;
        let first = BossKillingBlow { boss_id: 694, spell_id: 133, school: 2,
            source_kind: 0, melee: false };
        let second = BossKillingBlow { boss_id: 1493, spell_id: 116, school: 4,
            source_kind: 2, melee: false };
        for abandoned in [false, true] {
            for dead in [false, true] {
                let mut game = pair();
                game.with_party_hero(1, |hero| { hero.abandoned = abandoned; hero.dead = dead; });
                game.boss_state.shared_killing_blows = vec![(0, first), (0, second), (0, first)];
                game.distribute_party_rewards();
                assert!(game.killing_blows().is_empty(), "the killer keeps its producer-owned credit");
                game.with_party_hero(1, |hero| {
                    let expected = if abandoned { vec![] } else { vec![first, second, first] };
                    assert_eq!(hero.boss_killing_blows(), expected);
                    assert_eq!(hero.killing_blows(), expected.iter()
                        .map(|hit| (hit.boss_id, hit.spell_id)).collect::<Vec<_>>());
                });
                game.distribute_party_rewards();
                assert!(game.boss_state.shared_killing_blows.is_empty());
            }
        }
    }

    #[test]
    fn private_boss_rewards_read_shared_clear_phase_and_latest_counter() {
        let mut game=pair();
        let zone=azeroth_survivors_re::bosses::catalog::ZONES.iter()
            .position(|zone|zone.key==game.zone.key).unwrap();
        let definition=&azeroth_survivors_re::bosses::catalog::ZONES[zone].bosses[4];
        let collector=game.party_guid(0).unwrap();
        game.boss_state.completion.phase=1;
        game.boss_state.shared_equipment.as_mut().unwrap().push((collector,definition));
        game.distribute_party_rewards();
        let base=(zone/2+1) as f32*0.5;
        game.with_party_hero(1,|hero| {
            // Killer already changed the shared clear phase. Native remote
            // delivery reads that phase and max(shared counter0,1).
            assert_eq!(hero.drain_boss_rewards().0,base);
            assert_eq!(hero.endless_boss_kills(),0);
        });
        game.boss_state.endless_bosses=1;
        game.boss_state.shared_equipment.as_mut().unwrap().push((collector,definition));
        game.distribute_party_rewards();
        game.with_party_hero(1,|hero| {
            assert_eq!(hero.drain_boss_rewards().0,base);
            assert_eq!(hero.endless_boss_kills(),1);
        });
        game.boss_state.endless_bosses=3;
        game.boss_state.shared_equipment.as_mut().unwrap()
            .extend([(collector,definition),(collector,definition)]);
        game.distribute_party_rewards();
        game.with_party_hero(1,|hero| {
            assert_eq!(hero.drain_boss_rewards().0,base*6.);
            assert_eq!(hero.endless_boss_kills(),3);
            hero.abandoned=true;
        });
        game.boss_state.endless_bosses=4;
        game.boss_state.shared_equipment.as_mut().unwrap().push((collector,definition));
        game.distribute_party_rewards();
        game.with_party_hero(1,|hero| {
            assert_eq!(hero.drain_boss_rewards().0,0.);
            assert_eq!(hero.endless_boss_kills(),4);
        });
    }

    #[test]
    fn shared_final_clear_persists_while_party_and_choices_still_run_without_summary_awards() {
        let mut game = pair();
        game.refresh_party_feat_members();
        game.boss_state.completion.phase = 1;
        game.clock = 1200.;
        game.kills = 2500;
        game.capture_party(false);
        assert!(game.victory_reached() && game.party_shared_running());
        assert!(!game.completed);
        let mut state = game.native_state();
        assert!(state.flag_8d && !state.flag_8c);
        let mut menu = crate::menu_state::MenuState::from_save_path(None);
        crate::gameplay::persist_run_at(&mut game, &mut menu, Some(42), [0; 19], false, true, 100, false);
        assert!(menu.backend_save.beaten_zones().contains(&(1, 0)));
        assert!(menu.backend_save.cooperative_beaten_zones().is_empty());
        assert!(!menu.backend_save.earned_achievements().contains("coop:together"));
        assert!(menu.backend_save.statistics().is_empty());
        assert_eq!(menu.backend_save.talent_xp(1), 0);
        let before = menu.backend_save.plaintext();
        crate::gameplay::persist_run_at(&mut game, &mut menu, Some(42), [0; 19], false, true, 200, false);
        assert_eq!(menu.backend_save.plaintext(), before);
        for (guid, showcase, started) in [(None, false, true),
            (Some(crate::startup::TESTER_GUID), false, true),
            (Some(42), true, true), (Some(42), false, false)]
        {
            let mut excluded = crate::menu_state::MenuState::from_save_path(None);
            crate::gameplay::persist_run_at(&mut game, &mut excluded, guid, [0; 19], showcase, started, 300, false);
            assert!(!excluded.backend_save.beaten_zones().contains(&(1, 0)));
        }
        // A guest may still be displaying its queued choice projection while
        // the same independent won latch reaches the accepted State15 route.
        state.byte_8f = 2;
        let mut guest = class_run("warrior", 1);
        guest.apply_replica_native(&state);
        assert!(guest.is_paused_for_choice() && guest.victory_reached());
        assert_eq!(guest.party_terminal_phase(), None);

        game.completed = true;
        game.with_party_hero(1, |hero| hero.completed = true);
        game.capture_party(false);
        assert!(!game.party_shared_running());
        crate::gameplay::persist_run_at(&mut game, &mut menu, Some(42), [0; 19], false, true, 400, false);
        assert!(menu.backend_save.cooperative_beaten_zones().contains(&0));
        assert_eq!(menu.backend_save.achievement_dates().get("coop:together"), Some(&400));
    }

    #[test]
    fn shared_boss_count_keeps_killer_credit_and_includes_dead_but_not_abandoned() {
        for killer in 0..=1 {
            for (old, expected) in [(99, 101), (u32::MAX, 1)] {
                for abandoned in [false, true] {
                    for dead in [false, true] {
                        let mut game = pair();
                        let recipient = 1 - killer;
                        let collector = game.party_guid(killer).unwrap();
                        let definition = &azeroth_survivors_re::bosses::catalog::ZONES.iter()
                            .find(|zone| zone.key == game.zone.key).unwrap().bosses[0];
                        game.with_party_hero(killer, |hero| hero.boss_state.death.boss_kills = 7);
                        game.with_party_hero(recipient, |hero| {
                            hero.boss_state.death.boss_kills = old;
                            hero.abandoned = abandoned;
                            hero.dead = dead;
                            // A guaranteed empty equipment roll still credits the boss.
                            hero.effect_state.equipped.equipment_chance = f32::NEG_INFINITY;
                        });
                        game.boss_state.shared_equipment.as_mut().unwrap()
                            .extend([(collector, definition), (collector, definition)]);
                        for _ in 0..2 {
                            game.distribute_party_rewards();
                            assert_eq!(game.with_party_hero(killer, |hero| hero.boss_kills()), Some(7));
                            game.with_party_hero(recipient, |hero| {
                                let count = if abandoned { old } else { expected };
                                assert_eq!(hero.boss_kills(), count);
                                assert_eq!(hero.native_state().words_70[3], count);
                                assert!(hero.queued_equipment().is_empty());
                            });
                        }
                    }
                }
            }
        }
    }

    #[test]
    fn raw_reward_transfer_excludes_collector_and_combines_before_recipient_rounding() {
        let mut game = pair();
        game.stats.gold_multiplier = 2.;
        game.with_party_hero(1, |remote| {
            remote.credit_pickup_gold(1);
            remote.credit_pickup_gold(1);
            remote.credit_pickup_experience(4, false);
        })
        .unwrap();
        game.distribute_party_rewards();
        assert_eq!(game.gold, 3, "recipient rounds the combined raw2 at2/1.2184");
        assert_eq!(game.xp, 3);
        assert_eq!(
            game.with_party_hero(1, |remote| (remote.gold, remote.xp)),
            Some((2, 3)),
            "the collector keeps its two immediate rounded credits and receives no duplicate"
        );
        game.distribute_party_rewards();
        assert_eq!((game.gold, game.xp), (3, 3), "transfers are drained once");
    }

    #[test]
    fn shared_actor_melee_scales_both_recipients_and_targets_their_real_guids() {
        for recipient in [0, 1] {
            let mut game = pair();
            let mut terrain = TerrainFixture;
            let near: Position = game.zone.center.into();
            let far = Position { x: near.x + 50., ..near };
            game.party_input(1 - recipient, PartyInput {
                position: far, facing: 0., velocity: [0.; 2],
            });
            fixture_enemies(&mut game, &[1.], &mut terrain);
            game.actors[0].actor.damage = 10.;
            game.actors[0].actor.attack_delay = 0.;
            game.clock = 1.;
            game.refresh_party_live_heroes();
            game.refresh_party_targets();
            let host = if recipient == 0 { near } else { far };
            game.tick_actor_frame(0.1, host, 0., &mut terrain);

            let health = game.with_party_hero(recipient, |hero| hero.health()).unwrap();
            assert!((health - (100. - 10. * 0.83584)).abs() < 0.0001);
            assert_eq!(game.with_party_hero(1 - recipient, |hero| hero.health()), Some(100.));
            let target = game.party_guid(recipient).unwrap();
            let published = if recipient == 0 {
                std::mem::take(&mut game.events)
            } else {
                game.take_party_events().into_iter()
                    .find(|(slot, guid, _)| (*slot, *guid) == (recipient, target))
                    .unwrap().2
            };
            assert!(published.iter().any(|row| matches!(row, RunEvent::Melee {
                target: guid, ..
            } if *guid == target)));
        }
    }

    #[test]
    fn validated_guest_down_state_retains_history_and_waits_for_shared_terminal() {
        let mut state = pair().native_state();
        state.byte_8f = 4;
        state.flag_8c = false;
        state.pairs = vec![[894, 585], [894, 585]];
        state.words = vec![894];
        let mut guest = class_run("priest", 1);
        guest.apply_replica_native(&state);
        assert!(guest.dead && guest.has_party() && guest.party_shared_running());
        assert_eq!(guest.party_terminal_phase(), None);
        assert_eq!(guest.killing_blows(), &[(894, 585), (894, 585)]);
        assert_eq!(guest.damaged_by_bosses(), &[894]);
        state.byte_8f = 5;
        state.flag_8c = true;
        state.flag_8d = true;
        guest.apply_replica_native(&state);
        assert!(!guest.party_shared_running() && guest.completed && guest.victory_reached());
        assert_eq!(guest.party_terminal_phase(), Some(5));
        state.byte_8f = 4;
        guest.apply_replica_native(&state);
        assert_eq!(
            guest.party_terminal_phase(),
            Some(4),
            "endless death keeps won latch but returns dead phase"
        );
        assert!(guest.dead && !guest.completed && guest.victory_reached());
    }

    #[test]
    fn shared_endless_resumes_living_heroes_and_restores_zero_health_down_state() {
        let mut game = pair();
        game.completed = true;
        game.with_party_hero(1, |remote| {
            remote.completed = true;
            remote.execution.vitals.health = 0.0;
        });
        game.capture_party(false);
        assert_eq!(game.party_terminal_phase(), Some(5));
        assert!(game.continue_endless());
        assert!(!game.completed && !game.dead && game.rules.endless);
        assert_eq!(
            game.with_party_hero(1, |remote| (remote.completed, remote.dead)),
            Some((false, true))
        );
        assert!(game.party_shared_running());
        assert!(
            !game.continue_endless(),
            "only a shared victory accepts continuation"
        );
    }

    #[test]
    fn leaving_retains_native_indices_reward_owners_and_world_admission_capacity() {
        let mut game = pair();
        for slot in 2..=4 {
            let remote = class_run("priest", 1);
            game.admit_party_hero(
                slot,
                200 + u64::from(slot),
                format!("Hero{slot}"),
                remote,
                game.zone.center.into(),
                0.0,
            )
            .unwrap();
        }
        game.coop.shared_experience.push((2, 7));
        game.coop
            .events
            .push((2, 202, vec![RunEvent::PlayerValues(vec![(22, 30)])]));
        assert!(game.leave_party_hero(1));
        assert_eq!(game.party_guid(1), Some(200));
        assert_eq!(game.party_guid(2), Some(202));
        assert_eq!(game.coop.shared_experience, vec![(2, 7)]);
        assert_eq!(game.coop.events[0].0, 2);
        assert_eq!(
            game.with_party_hero(1, |hero| (hero.dead, hero.abandoned)),
            Some((true, true))
        );
        let replacement = class_run("priest", 1);
        assert!(
            game.admit_party_hero(
                5,
                300,
                "Replacement".into(),
                replacement,
                game.zone.center.into(),
                0.
            )
            .is_err(),
            "native900890 caps retained world rows, independently of accepted TCP peers"
        );
    }

    #[test]
    fn permanent_departure_ends_only_the_last_active_host_run() {
        let mut game = pair();
        game.admit_party_hero(
            2, 202, "Second guest".into(), class_run("priest", 1), game.zone.center.into(), 0.0,
        ).unwrap();
        game.boundary_started = true;
        game.with_party_hero(2, |hero| hero.dead = true).unwrap();

        assert!(game.leave_party_hero(1));
        assert!(game.party_shared_running(), "a downed guest still occupies a party slot");
        assert!(game.leave_party_hero(1));
        assert!(!game.dead, "a repeated departure cannot retire another slot");
        assert!(game.leave_party_hero(2));
        assert!(game.dead && !game.completed);
        assert_eq!(game.party_terminal_phase(), Some(4));
        assert_eq!(game.party_guid(2), Some(202));
        assert_eq!(game.native_state().byte_8f, 4);
    }

    #[test]
    fn party_scaling_survives_the_single_remote_swap_and_departure() {
        use azeroth_survivors_re::coop::scaling::PartyScaling;

        fn assert_contexts(game: &mut Mechanics, live_heroes: usize) {
            assert_eq!(game.coop.remotes.len(), 1);
            assert_eq!(game.coop.live_heroes, live_heroes);
            let expected = PartyScaling::new(live_heroes, 0, true);
            assert_eq!(game.party_scaling(), Some(expected));
            let guest = game.with_party_hero(1, |hero| {
                assert!(hero.coop.remotes.is_empty(), "the sole remote is borrowed");
                assert_eq!(hero.coop.active_slot, 1);
                hero.party_scaling()
            }).unwrap();
            assert_eq!(guest, Some(expected), "both recipients use the retained party");
            assert_eq!(game.party_scaling(), guest, "restoration keeps host factors");
        }

        assert!(class_run("warrior", 1).party_scaling().is_none());
        let mut game = pair();
        assert_contexts(&mut game, 2);
        game.with_party_hero(1, |hero| hero.dead = true).unwrap();
        game.refresh_party_live_heroes();
        assert_contexts(&mut game, 1);
        assert!(game.leave_party_hero(1));
        assert!(game.coop.remotes[0].state.abandoned);
        assert_contexts(&mut game, 1);
    }

    #[test]
    fn party_spawning_and_disconnect_rescale_real_actors_once_in_world_order() {
        let mut solo = class_run("warrior", 1);
        let mut game = pair();
        fixture_enemies(&mut solo, &[10., 20.], &mut TerrainFixture);
        fixture_enemies(&mut game, &[10., 20.], &mut TerrainFixture);
        let solo_player = solo.zone.center.into();
        solo.spawn_showcase_bosses(solo_player, [0.; 2], &mut TerrainFixture);
        let player = game.zone.center.into();
        game.spawn_showcase_bosses(player, [0.; 2], &mut TerrainFixture);
        let factors = game.party_health_factors();
        assert_eq!(factors, [(0.7 * 0.72 + 1.) * 0.8, (0.7 * 1.04 + 1.) * 0.8]);
        assert_eq!(
            game.actors[0].maximum_health,
            solo.actors[0].maximum_health * factors[0]
        );
        assert_eq!(
            game.bosses[0].maximum_health,
            solo.bosses[0].maximum_health * factors[1]
        );
        assert_eq!(game.actors[0].actor.damage, solo.actors[0].actor.damage);
        game.actors[0].health *= 0.5;
        game.bosses[0].health *= 0.4;
        game.actors[1].health = 0.;
        game.actors[1].actor.dead = true;
        let corpse_maximum = game.actors[1].maximum_health;
        let parent = game.bosses[0].guid;
        let ward_health = game.bosses[0].maximum_health * 0.03;
        let ward = game
            .boss_state
            .wards
            .spawn(
                azeroth_survivors_re::bosses::raid_wards::Spawn {
                    parent,
                    player_guid: game.player_guid,
                    template: 0,
                    config: [0; 4],
                    position: player,
                    maximum_health: ward_health,
                    lifetime: 10.,
                },
                game.clock,
                game.level,
                &game.zone.enemies[0],
                player,
                &mut game.counter,
            )
            .guid;
        assert_eq!(
            game.ward_actors()[0].maximum_health,
            ward_health,
            "ward creation copies the already scaled parent contribution"
        );
        let ordinary = game.actors[0].guid;
        game.events.clear();
        assert!(game.leave_party_hero(1));
        let scaled = |value: f32, factor: f32| value * (0.8 / factor);
        assert_eq!(
            game.actors[0].maximum_health,
            scaled(solo.actors[0].maximum_health * factors[0], factors[0])
        );
        assert_eq!(
            game.actors[0].health,
            scaled(solo.actors[0].maximum_health * factors[0] * 0.5, factors[0])
        );
        assert_eq!(
            game.bosses[0].maximum_health,
            scaled(solo.bosses[0].maximum_health * factors[1], factors[1])
        );
        assert_eq!(
            game.ward_actors()[0].maximum_health,
            scaled(ward_health, factors[0])
        );
        assert_eq!(
            (game.actors[1].health, game.actors[1].maximum_health),
            (0., corpse_maximum)
        );
        let updates: Vec<_> = game
            .events
            .iter()
            .filter_map(|event| match event {
                RunEvent::ActorFields { target, fields } => Some((*target, fields)),
                _ => None,
            })
            .collect();
        assert_eq!(updates.first().unwrap().0, ordinary);
        assert_eq!(updates.last().unwrap().0, ward);
        assert!(
            updates
                .iter()
                .all(|(_, fields)| fields[0].0 == 28 && fields[1].0 == 22)
        );
        assert!(!updates.iter().any(|(guid, _)| *guid == game.actors[1].guid));
        game.events.clear();
        assert!(game.leave_party_hero(1));
        assert!(
            !game
                .events
                .iter()
                .any(|event| matches!(event, RunEvent::ActorFields { .. })),
            "unchanged live count must not scale or publish the world twice"
        );
    }

    #[test]
    fn disconnect_health_rescale_keeps_dead_rows_and_native_one_hp_floor() {
        for health in [0., -1., f32::NAN] {
            let (mut actual, mut maximum) = (health, 100.);
            assert!(rescaled_health_fields(&mut actual, &mut maximum, 0.5).is_none());
            assert_eq!(maximum, 100.);
        }
        let (mut health, mut maximum) = (0.4, 0.8);
        assert_eq!(
            rescaled_health_fields(&mut health, &mut maximum, 0.5),
            Some(vec![(28, 1), (22, 1)])
        );
        assert_eq!((health, maximum), (1., 1.));
        let (mut health, mut maximum) = (40.8, 100.2);
        assert_eq!(
            rescaled_health_fields(&mut health, &mut maximum, 0.5),
            Some(vec![(28, 51), (22, 21)])
        );
    }

    #[test]
    fn first_party_fall_survives_remote_swap_and_later_fall() {
        let mut game = pair();
        game.refresh_party_feat_members();
        game.clock = 2399.0;
        let remote_state = game.with_party_hero(1, |hero| {
            hero.record_party_fall();
            hero.native_state()
        }).unwrap();
        game.clock = 2401.0;
        game.record_party_fall();
        let context = game.cooperative_feat_context().unwrap();
        assert_eq!(context.initial_member_count, 2);
        assert_eq!(f32::from_bits(context.first_fall_bits), 2399.0);
        let mut guest = class_run("warrior", 1);
        guest.apply_replica_native(&remote_state);
        assert_eq!(guest.cooperative_feat_context(), Some(context));
    }

    #[test]
    fn revived_hero_uses_source_immunity_semantics_and_native_rounded_health_fields() {
        let mut game = pair();
        game.clock = 10.;
        game.execution.vitals.maximum_health = 101.;
        game.dead = true;
        game.apply_party_revive(azeroth_survivors_re::coop::game_party::Revived {
            slot: 0,
            health: 50.5,
            immunity_spell: 1020,
            immunity_expires: 12.,
        });
        let mut state = behavior::incoming::IncomingState::default();
        assert!(behavior::incoming::apply_damage(
            &mut game.execution.vitals,
            &mut game.execution.shield,
            &mut game.execution.auras,
            &mut state,
            11.9,
            10.,
            0.
        )
        .is_none());
        assert!(behavior::incoming::apply_damage(
            &mut game.execution.vitals,
            &mut game.execution.shield,
            &mut game.execution.auras,
            &mut state,
            12.,
            10.,
            0.
        )
        .is_some());
        assert!(game
            .events
            .iter()
            .any(|event| matches!(event,RunEvent::PlayerValues(fields)
            if fields.contains(&(22,51)) && fields.contains(&(28,101)))));
    }

    #[test]
    fn hud_arrays_keep_native_shapes_and_guest_vitals_without_stat_refresh() {
        let mut game = pair();
        let locale = crate::localization::Localization::english_for_tests();
        game.xp = 3;
        game.gold = 17;
        game.execution.vitals.health = 37.;
        let hud = game.coop_hud(&locale);
        assert_eq!(hud["abilities"][0]["key"], "cleave");
        assert!(
            hud["meter"].is_array() && hud["jewelry"].is_array() && hud["partyMeter"].is_array()
        );
        game.with_party_hero(1, |remote| {
            assert_eq!(remote.party_guid(0), Some(100));
            assert_eq!(remote.party_guid(1), Some(200));
            assert_eq!(remote.party_slot_for_source(200), 1);
        });
        let mut guest = class_run("warrior", 1);
        guest.apply_replica_native(&game.native_state());
        guest.apply_replica_hud(&hud);
        assert_eq!((guest.xp, guest.gold, guest.health()), (3, 17, 37.));
        assert_eq!(guest.max_health(), game.max_health());
        assert_eq!(guest.replica_hud(), Some(&hud));
    }

    #[test]
    fn remote_revive_hud_retains_progress_during_recipient_swap() {
        let mut game = pair();
        let locale = crate::localization::Localization::english_for_tests();
        game.coop.local_revive = 1.0;
        game.coop.remotes[0].state.dead = true;
        game.coop.remotes[0].revive = 3.0;
        game.capture_party(false);
        let hud = game.with_party_hero(1, |remote| {
            assert!(remote.coop.remotes.is_empty(), "publication borrows the recipient");
            let hud = remote.coop_hud(&locale);
            assert_eq!(hud["revive"], serde_json::json!(0.5));
            hud
        }).unwrap();
        assert_eq!(game.coop.remotes[0].revive, 3.0);
        assert_eq!(game.coop.local_revive, 1.0);
        let mut guest = class_run("warrior", 1);
        guest.apply_replica_native(&game.native_state());
        guest.apply_replica_hud(&hud);
        assert_eq!(guest.replica_hud().unwrap()["revive"], serde_json::json!(0.5));
    }

    #[test]
    fn party_feat_context_survives_the_single_remote_swap_and_departure() {
        let mut rolled_back = pair();
        assert!(rolled_back.remove_party_hero(1));
        assert!(rolled_back.coop.remotes.is_empty());
        assert!(rolled_back.native_state().coop.is_some());

        let mut game = pair();
        game.refresh_party_feat_members();
        let expected = game.cooperative_feat_context().unwrap();
        assert_eq!(expected.members.len(), 2);
        let remote = game.with_party_hero(1, |game| {
            assert!(game.coop.remotes.is_empty(), "the active row is temporarily borrowed");
            game.native_state().coop
        }).unwrap();
        assert_eq!(remote, Some(expected), "every recipient retains the shared context");
        assert!(game.leave_party_hero(1));
        game.refresh_party_feat_members();
        let context = game.cooperative_feat_context().unwrap();
        assert_eq!(context.members.len(), 1, "abandoned rows leave current membership");
        assert_eq!(game.party_guid(1), Some(200), "the native world still retains the row");
    }

}

// The native swap deliberately omits Game+570's actor vector, the shared
// pickup/world queues, run RNG, shared clock, and global schedule cursors.
hero_state! {
    player_guid: u64, class: &'static player_abilities::ClassAbilities,
    equipment_ids: [u32; 19],
    addon_flag: Option<usize>, world_flag: addon_lists::WorldFlag,
    stats: RunPlayerStats, abilities: Vec<RuntimeInstance<'static>>,
    racial: Option<RuntimeInstance<'static>>, racial_cooldown: Option<RunCooldown>,
    execution: ExecutionState<'static>, level: u32, xp: u32,
    gold: u32, gold_earned: u32, kills: u32, elite_kills: u32,
    choices: Vec<RunChoice>, dead: bool, completed: bool, abandoned: bool,
    alive_since: f32, fall_epoch: f32,
    taken_damage: super::super::addon_meters::TakenLedger,
    damage_history: super::super::death_recap::DamageHistory,
    death_recap: Option<super::super::death_recap::DeathRecap>,
    death_recap_generation: u64,
    published_cooldowns: Vec<(u32, RunCooldown)>, pending_healing: Vec<PendingHealing>,
    pending_absorb: Vec<f32>, pending_levels: u32, passive_state: PassiveTickState,
    player_mover: player_mover::PlayerMover, native_7e4: u32,
    choice_state: choices::ChoiceState, chest_state: chests::ChestState,
    treasure_state: treasure::TreasureState, effect_state: effects::EffectsState,
    weapon_state: azeroth_survivors_re::run_effects::weapon::State,
    pet_state: pets::State, loot_companion_state: loot_companions::State,
    demon_state: demons::State,
}

#[derive(Clone, Copy, Debug)]
pub struct PartyInput {
    pub position: Position,
    pub facing: f32,
    pub velocity: [f32; 2],
}

#[derive(Clone, Debug)]
pub enum PartyBanner {
    Downed,
    FriendDown(String),
    Revived,
}

#[derive(Debug)]
struct RemoteHero {
    slot: u8,
    name: String,
    input: PartyInput,
    state: HeroState,
    revive: f32,
    departed: bool,
}

#[derive(Debug, Default)]
pub(super) struct CoopSimulation {
    enabled: bool,
    remotes: Vec<RemoteHero>,
    local_guid: u64,
    local_name: String,
    local_input: Option<PartyInput>,
    pub(super) active_slot: u8,
    snapshot: Party,
    meter: HashMap<
        u64,
        (
            f64,
            Vec<azeroth_survivors_re::run_effects::healing::MeterEntry>,
        ),
    >,
    meter_clock: f32,
    pub(super) targets: HashMap<u64, u8>,
    local_revive: f32,
    events: Vec<(u8, u64, Vec<RunEvent>)>,
    fall_notices: Vec<(u8, u64)>,
    replica: Option<RunProjection>,
    guest_notice_ready: bool,
    replica_feats: Option<azeroth_survivors_re::coop::replication::NativeCoopFeats>,
    hud: Option<serde_json::Value>,
    live_heroes: usize,
    shared_experience: Vec<(u8, u32)>,
    shared_gold: Vec<(u8, u32)>,
    forced_positions: Vec<(u8, Position)>,
    healing_events: Vec<super::shared_healing::Event>,
    healing_heroes: Vec<super::shared_healing::AdmissionHero>,
    raw_options: HashMap<u64, [u8; 2]>,
    schedule_slot: u8,
}

impl CoopSimulation {
    pub(super) fn healing_port(&mut self) -> super::shared_healing::Port<'_> {
        super::shared_healing::Port {
            enabled: self.enabled,
            source_slot: self.active_slot,
            heroes: &self.healing_heroes,
            events: &mut self.healing_events,
        }
    }
}

impl Mechanics {
    /// Current Game+10c5 is set by the local-client sync owner. A received
    /// State15 alone cannot authorize the Heroic clear system-chat packet.
    pub fn set_guest_notice_ready(&mut self, ready: bool) {
        self.coop.guest_notice_ready = ready;
    }

    pub fn guest_notice_ready(&self) -> bool {
        self.coop.guest_notice_ready
    }

    fn capture_healing_snapshot(&mut self) {
        use super::shared_healing::AdmissionHero;
        let position = self.coop.local_input.map_or(Position { x: 0.0, y: 0.0, z: 0.0 },
            |input| input.position);
        let mut rows = vec![AdmissionHero::capture(0, position, self.active_run_state(),
            self.health(), self.max_health())];
        for hero in &self.coop.remotes {
            let state = &hero.state;
            rows.push(AdmissionHero::capture(hero.slot, hero.input.position,
                !state.dead && !state.completed && state.choices.is_empty(),
                state.execution.vitals.health, state.execution.vitals.maximum_health));
        }
        self.coop.healing_heroes = rows;
    }

    fn distribute_party_healing(&mut self) {
        let events = std::mem::take(&mut self.coop.healing_events);
        if events.is_empty() { return; }
        for (slot, _) in self.party_members() {
            let Some(input) = self.party_input_for(slot) else { continue; };
            self.with_party_hero(slot, |game| game.receive_party_healing(&events, input));
        }
    }

    pub fn is_party_replica(&self) -> bool {
        self.coop.replica.is_some()
    }

    pub(super) fn refresh_party_feat_members(&mut self) {
        use super::party_achievements::member;
        let mut members = Vec::new();
        if !self.abandoned {
            members.push(member(self.class.class_id, &self.abilities,
                &self.effect_state.spell_display_talents,
                self.effect_state.set_descriptor.map_or(0, |set| set.tier + 1)));
        }
        for hero in &self.coop.remotes {
            if !hero.state.abandoned {
                members.push(member(hero.state.class.class_id, &hero.state.abilities,
                    &hero.state.effect_state.spell_display_talents,
                    hero.state.effect_state.set_descriptor.map_or(0, |set| set.tier + 1)));
            }
        }
        if self.boss_state.party_feats.initial_member_count == 0 {
            self.boss_state.party_feats.initial_member_count =
                u8::try_from(members.len()).unwrap_or(u8::MAX);
        }
        self.boss_state.party_feats.members = members;
    }

    /// The authoritative first phase-4 transition survives a revive or later
    /// fall. Party membership is captured on the first shared run tick.
    pub(super) fn record_party_fall(&mut self) {
        let feats = &mut self.boss_state.party_feats;
        if feats.initial_member_count != 0 {
            feats.first_fall.get_or_insert(self.clock);
        }
    }

    pub(super) fn queue_party_fall_banner(&mut self) {
        if !self.has_party() {
            return;
        }
        if !self.abandoned {
            self.events.push(RunEvent::PartyBanner(PartyBanner::Downed));
        }
        self.coop.fall_notices.push((self.coop.active_slot, self.player_guid));
    }

    /// Fan out each newly fallen hero once after borrowed heroes return to
    /// the roster. The affected hero receives only its own Downed event.
    pub(in crate::gameplay) fn publish_party_fall_banners(&mut self) {
        for (source_slot, source_guid) in std::mem::take(&mut self.coop.fall_notices) {
            let name = if source_slot == 0 {
                &self.coop.local_name
            } else {
                let Some(source) = self.coop.remotes.iter()
                    .find(|hero| hero.state.player_guid == source_guid)
                else {
                    continue;
                };
                self.events.push(RunEvent::PartyBanner(PartyBanner::FriendDown(
                    source.name.clone(),
                )));
                &source.name
            };
            self.coop.events.extend(
                self.coop.remotes.iter()
                    .filter(|hero| hero.slot != source_slot)
                    .map(|hero| (
                        hero.slot,
                        hero.state.player_guid,
                        vec![RunEvent::PartyBanner(PartyBanner::FriendDown(name.clone()))],
                    )),
            );
        }
    }

    /// The 0.141.0 snapshot gates the shared context on cooperative mode.
    /// Prior shared lethal snapshots survive a member's death or departure.
    pub fn cooperative_feat_context(&self) -> Option<azeroth_survivors_re::coop::replication::NativeCoopFeats> {
        if self.replica_state().is_some() {
            return self.coop.replica_feats.clone();
        }
        if !self.has_party() {
            return None;
        }
        Some(azeroth_survivors_re::coop::replication::NativeCoopFeats {
            members: self.boss_state.party_feats.members.clone(),
            word_30: self.boss_state.party_feats.deaths,
            heroic_rank: self.heroic_rank(),
            initial_member_count: self.boss_state.party_feats.initial_member_count,
            first_fall_bits: self.boss_state.party_feats.first_fall.unwrap_or(-1.0).to_bits(),
            events: self.boss_state.party_feats.events.clone(),
        })
    }

    pub fn set_equipment_ids(&mut self, ids: [u32; 19]) {
        self.equipment_ids = ids;
    }
    pub fn configure_party_options(&mut self, flags: [u8; 3]) {
        self.set_cache_on_click(flags[0] != 0);
        self.set_store_levels(flags[1] != 0);
        self.coop
            .raw_options
            .insert(self.player_guid, [flags[0], flags[2]]);
    }

    pub(in crate::gameplay) fn native_state_terminal(&self) -> bool {
        if self.has_party() {
            self.party_terminal_phase().is_some()
        } else {
            self.completed || self.dead
        }
    }

    pub fn native_state(&self) -> azeroth_survivors_re::coop::replication::NativeState {
        use azeroth_survivors_re::coop::{
            replication::{NativeState, StateRow},
        };
        let phase = if self.completed {
            RunPhase::Victory
        } else if self.dead {
            RunPhase::Dead
        } else if self.is_paused_for_choice() {
            RunPhase::Choosing
        } else if self.boundary_started {
            RunPhase::Playing
        } else {
            RunPhase::Ready
        };
        NativeState {
            float_68_bits: self.clock.to_bits(),
            byte_8f: phase.native(),
            flag_8c: self.native_state_terminal(),
            word_6c: self.level,
            flag_8d: self.victory_reached(),
            words_70: [
                self.kills,
                self.gold_earned,
                self.guardian_kills(),
                self.boss_kills(),
                self.caches_bought(),
            ],
            heroic_rank: self.rules.heroic_rank,
            boss_counter: self.endless_boss_kills(),
            max_equipment_stars: self.equipment_stars().into_iter().max().unwrap_or(0),
            active_set: self.effect_state.set_descriptor.map_or(0, |set| set.tier + 1),
            float_84_bits: self.base_run_marks().to_bits(),
            float_88_bits: self.base_max_boss_marks().to_bits(),
            flag_8e: self.equipment_ids.iter().all(|id| *id == 0),
            byte_90: self.class.class_id,
            text: self.zone.key.into(),
            pairs: self
                .killing_blows()
                .iter()
                .map(|&(id, spell)| [id, spell])
                .collect(),
            rows: self.boss_killing_blows().iter().map(StateRow::from).collect(),
            words: self.damaged_by_bosses().to_vec(),
            secondary_rows: self.personal_boss_killing_blows().iter().map(StateRow::from).collect(),
            enhancement: self.graduation_enhancement(),
            boss_flags: self.boss_flags().to_vec(),
            coop: self.cooperative_feat_context(),
        }
    }
    /// Metadata from the validated host tag15 producer. Health, powers, actors
    /// and spell/action state continue to come from native engine packets.
    pub fn apply_replica_state(&mut self, state: &RunProjection) {
        let entering_party = !self.has_party();
        self.clock = state.clock;
        self.rules.heroic_rank = state.heroic_rank;
        self.level = state.level;
        self.kills = state.kills;
        self.gold_earned = state.gold_earned;
        self.dead = state.phase == RunPhase::Dead;
        self.completed = state.phase == RunPhase::Victory;
        self.coop.enabled = true;
        self.coop.replica = Some(state.clone());
        if entering_party {
            self.refresh_effects();
        }
    }
    /// Consume only a NativeState already accepted by the native host-state
    /// validator. Retain its ordered/duplicate history rows for real feat and
    /// account consumers; never infer those rows from HUD totals.
    pub fn apply_replica_native(
        &mut self,
        state: &azeroth_survivors_re::coop::replication::NativeState,
    ) {
        self.apply_replica_state(&RunProjection::read(state));
        self.effect_state.generic.killing_blows =
            state.pairs.iter().map(|row| (row[0], row[1])).collect();
        use azeroth_survivors_re::account_progression::BossKillingBlow;
        self.effect_state.generic.boss_killing_blows =
            state.rows.iter().map(BossKillingBlow::from).collect();
        self.effect_state.generic.personal_boss_killing_blows =
            state.secondary_rows.iter().map(BossKillingBlow::from).collect();
        self.effect_state.graduation_enhancement = state.enhancement;
        self.effect_state
            .generic
            .damaged_by_bosses
            .clone_from(&state.words);
        self.effect_state.generic.boss_flags.clone_from(&state.boss_flags);
        self.effect_state.victory_reached = state.flag_8d;
        self.coop.replica_feats.clone_from(&state.coop);
    }
    pub fn apply_replica_vitals(
        &mut self,
        health: u32,
        maximum_health: u32,
        experience: u32,
        copper: u32,
    ) {
        if self.replica_state().is_none() {
            return;
        }
        self.execution.vitals.health = health as f32;
        self.execution.vitals.maximum_health = maximum_health as f32;
        self.xp = experience;
        self.gold = copper / 10_000;
    }
    /// The existing current partyMeter JSON projection, shared by HUD publication
    /// and the custom meter. Uncaptured heroes remain absent from these rows.
    pub fn party_meter_hud(&self, locale: &crate::localization::Localization) -> Vec<serde_json::Value> {
        if !self.has_party() {
            return Vec::new();
        }
        let party = self.localized_party_snapshot(locale);
        let mut rows: Vec<_>=party.heroes.iter().filter_map(|hero| {
            let guid=self.party_guid(hero.slot as u8)?;
            let (_,entries)=self.coop.meter.get(&guid)?;
            let top:Vec<_>=hud_meter(entries,locale).into_iter().map(|row|
                serde_json::json!({"name":row["name"],"icon":row["icon"],"dmg":row["dmg"]})).collect();
            Some((hero.damage,serde_json::json!({"name":hero.name,
                "class":azeroth_survivors_re::coop::game_party::class_key(hero.class),
                "color":azeroth_survivors_re::coop::game_party::class_color(hero.class),
                "dmg":hero.damage.round(),"top":top})))
        }).collect();
        rows.sort_by(|left, right| right.0.total_cmp(&left.0));
        rows.into_iter().map(|row| row.1).collect()
    }

    /// Current14590f0f0 JSON, using real perhero state and native collection
    /// shapes. This is distinct from the delimited addon streams.
    pub fn coop_hud(&self, locale: &crate::localization::Localization) -> serde_json::Value {
        use azeroth_survivors_re::loot_rewards::{amulets, prose};
        let phase = if self.completed {
            "victory"
        } else if self.dead {
            "dead"
        } else if self.is_paused_for_choice() {
            "choosing"
        } else if self.boundary_started {
            "playing"
        } else {
            "ready"
        };
        let cooldown = self.current_cooldown_multiplier();
        let abilities: Vec<_> = self.abilities.iter().map(|row| {
            let definition = row.definition;
            let interval = if definition.kind == 11 {
                if matches!(definition.key, "redemption" | "faerie_fire") {0.0}
                else {behavior::totem_passives::passive_interval(row, cooldown)}
            } else {
                let interval = damage::base_interval(row, cooldown);
                if definition.key == "hellfire" {interval.max(0.5)} else {interval}
            };
            serde_json::json!({"key":definition.key,"spell":definition.spell_id,
                "name":locale.lookup(&format!("ability.{}.name",definition.key)).unwrap_or(definition.name),
                "icon":definition.icon,"rank":row.rank,"cd":row.remaining.max(0.0),"cdMax":interval})
        }).collect();
        let mut jewelry = Vec::new();
        let translate = |key: &str| locale.label(key).to_owned();
        for slot in [0, 1] {
            for row in self
                .jewelry()
                .iter()
                .filter(|row| row.definition.slot == slot)
            {
                let definition = row.definition;
                let text = if definition.tag == 15 {
                    locale
                        .label("{n} lives left")
                        .replace("{n}", &self.remaining_lives().to_string())
                } else {
                    prose::jewelry_description(definition, row.value.value).render(&translate)
                };
                jewelry.push(serde_json::json!({"name":locale.lookup(&format!("jewel.{}",definition.key)).unwrap_or(definition.name),
                    "icon":definition.icon,"slot":if slot==0 {"ring"} else {"trinket"},
                    "rank":row.value.upgrades,"rarity":row.rarity,"text":text}));
            }
        }
        if let Some(row) = self.worn_amulet() {
            let text = amulets::description_lines(row.payload, row.rarity, row.picks)
                .unwrap_or_default()
                .iter()
                .map(|line| line.render(&translate))
                .collect::<Vec<_>>()
                .join(", ");
            jewelry.push(serde_json::json!({"name":locale.amulet_name(&row.payload.name,row.payload.ability_key.as_deref()),
                "icon":row.payload.icon,"slot":"amulet","rank":row.picks,"rarity":row.rarity,"text":text}));
        }
        let buffs: Vec<_> = self
            .execution
            .auras
            .iter()
            .filter(|row| row.expires_at > self.clock)
            .map(|row| serde_json::json!({"spell":row.spell_id,"left":row.expires_at-self.clock}))
            .collect();
        // The custom HUD deliberately lists only recurring generic34 clocks;
        // the separate tag12/AZSTIMERS API includes the other timer variants.
        let timers: Vec<_> = self
            .addon_timers()
            .into_iter()
            .filter(|timer| {
                self.effect_state
                    .equipped
                    .rows
                    .get(timer.index)
                    .is_some_and(|row| row.tag() == 34 || (row.tag() == 253 && row.bytes[63] == 34))
            })
            .map(|row| {
                serde_json::json!({"name":locale.amulet_name(row.name,row.generated_ability_key),
                "icon":row.icon,"left":(row.ready-self.clock).max(0.0)})
            })
            .collect();
        let boss_meter = self.boss_meter_timing().map_or_else(|| serde_json::json!({}), |timing|
            serde_json::json!({"dealt":self.boss_meter().iter().map(|row|row.total).sum::<f64>().round(),
                "secs":timing.seconds,"live":timing.live,"lines":hud_meter(self.boss_meter(),locale)}));
        let mut boss_rows: Vec<_> = self.bosses.iter().filter(|row| !row.actor.dead)
            .map(|row| (row.allocation_order,serde_json::json!({"name":locale.lookup(&format!("boss.{}.name",row.definition.id))
                .unwrap_or(row.definition.name),"hp":row.health.max(0.0),"hpMax":row.maximum_health}))).collect();
        boss_rows.sort_by_key(|row| row.0);
        let mut bosses: Vec<_> = boss_rows.into_iter().map(|row| row.1).collect();
        let boss = bosses.first().cloned();
        bosses.extend(self.actors.iter().filter(|row| !row.actor.dead && self.guardian_awake(row.guid))
            .map(|row|serde_json::json!({"name":locale.lookup(&format!("enemy.{}",row.definition.id)).unwrap_or(row.definition.name),
                "hp":row.health.max(0.0),"hpMax":row.maximum_health})));
        let footer = self.choice_footer();
        let mut hud = serde_json::json!({"type":"hud", "phase":phase, "time":self.clock,
            "level":self.level, "xp":self.xp, "xpNext":self.xp_required(),
            "hp":self.health().max(0.0), "hpMax":self.max_health(), "shield":self.execution.vitals.absorb,
            "gold":self.gold, "chestCost":self.cache_price(), "kills":self.kills,
            "enemies":self.actors.len()+self.bosses.len()+self.boss_state.wards.actors.len(),
            "rerolls":footer.rerolls, "rerollCost":footer.reroll_cost, "storedLevels":self.stored_levels(),
            "damage":self.current_damage_multiplier(), "cooldown":cooldown,
            "crit":self.effect_state.numeric.crit, "speed":self.movement_multiplier(),
            "armor":self.effect_state.numeric.armor, "regen":self.stats.regeneration,
            "pickup":self.stats.pickup_radius, "endless":self.rules.endless,
            "abilities":abilities,"jewelry":jewelry,"buffs":buffs,"timers":timers,
            "dealt":self.effective_damage().round(),"meter":hud_meter(self.damage_meter(),locale),"healed":self.total_healing().round(),
            "healing":hud_meter(self.healing_meter(),locale),"bossMeter":boss_meter,
            "bosses":bosses,"boss":boss,"nextBoss":self.hud_next_boss()});
        if self.has_party() {
            hud["partyMeter"] = serde_json::json!(self.party_meter_hud(locale));
            let slot = usize::from(self.coop.active_slot);
            if self.dead && !self.abandoned && self.party_shared_running() {
                let elapsed = if slot == 0 {
                    self.coop.local_revive
                } else {
                    // Publication temporarily removes the selected remote in
                    // with_party_hero; its stable snapshot retains the timer.
                    self.coop
                        .snapshot
                        .heroes
                        .iter()
                        .find(|hero| hero.slot == slot)
                        .map_or(0.0, |hero| hero.revive_elapsed)
                };
                hud["revive"] = serde_json::json!((elapsed / azeroth_survivors_re::heroic::revive_seconds(self.rules.heroic_rank)).max(0.0).min(1.0));
                if let Some(row) = self
                    .coop
                    .snapshot
                    .interactions
                    .iter()
                    .find(|row| row.target == slot)
                {
                    hud["revivedBy"] = serde_json::json!(row.helper_name);
                }
            }
            if !self.dead && !self.completed {
                if let Some(row) = self
                    .coop
                    .snapshot
                    .interactions
                    .iter()
                    .filter(|row| row.helper == slot)
                    .max_by(|left, right| left.share.total_cmp(&right.share))
                {
                    hud["rescue"] = serde_json::json!({"name":row.target_name,"share":row.share});
                }
            }
        }
        hud
    }
    pub fn apply_replica_hud(&mut self, hud: &serde_json::Value) {
        if hud.get("type").and_then(serde_json::Value::as_str) != Some("hud") {
            return;
        }
        self.coop.hud = Some(hud.clone());
        if self.replica_state().is_none() {
            return;
        }
        let integer = |key: &str| {
            hud.get(key)
                .and_then(serde_json::Value::as_u64)
                .and_then(|value| u32::try_from(value).ok())
        };
        let scalar = |key: &str| {
            hud.get(key)
                .and_then(serde_json::Value::as_f64)
                .filter(|value| value.is_finite())
                .map(|value| value as f32)
        };
        if let Some(value) = integer("xp") {
            self.xp = value;
        }
        if let Some(value) = integer("gold") {
            self.gold = value;
        }
        if let Some(value) = scalar("hp") {
            self.execution.vitals.health = value;
        }
        if let Some(value) = scalar("hpMax") {
            self.execution.vitals.maximum_health = value;
        }
        if let Some(value) = scalar("shield") {
            self.execution.vitals.absorb = value;
        }
        if let Some(value) = integer("rerolls") {
            self.choice_state.controls.free_rerolls = value;
        }
        if let Some(value) = hud.get("endless").and_then(serde_json::Value::as_bool) {
            self.rules.endless = value;
        }
        if let Some(rows) = hud.get("abilities").and_then(serde_json::Value::as_array) {
            self.abilities = rows
                .iter()
                .filter_map(|row| {
                    let definition = AbilityDefinition::by_key(row.get("key")?.as_str()?)?;
                    let mut instance = RuntimeInstance::learned(definition);
                    instance.rank = u32::try_from(row.get("rank")?.as_u64()?).ok()?;
                    instance.remaining = row.get("cd")?.as_f64()? as f32;
                    Some(instance)
                })
                .collect();
        }
    }
    pub fn replica_hud(&self) -> Option<&serde_json::Value> {
        self.coop.hud.as_ref()
    }
    pub fn replica_phase(&self) -> Option<RunPhase> {
        self.coop.replica.as_ref().map(|state| state.phase)
    }
    pub(super) fn replica_state(&self) -> Option<&RunProjection> {
        self.coop.replica.as_ref()
    }

    ///1458ee600's native tag8 switch. The fourth variant has no action;
    /// continuation is an ordinary engine command and is not subtype4.
    pub fn party_control(
        &mut self,
        slot: u8,
        kind: u8,
        argument: u8,
        offer: u32,
        mut height: impl FnMut([f32; 2]) -> Option<f32>,
    ) -> bool {
        self.with_party_hero(slot, |game| {
            if !azeroth_survivors_re::coop::pick::admits(kind, offer, game.choice_offer()) {
                return false;
            }
            match kind {
            0 => game.choose(usize::from(argument)),
            1 => game.reroll_choices(),
            2 => game.banish_choice(usize::from(argument)),
            3 => game.skip_choices(),
            // Control10 requests the authoritative choice response without
            // changing the offer or applying another selection.
            4 | 10 => true,
            5 => {
                game.abandon(&mut height);
                true
            }
            6 => {
                if game.dead
                    || game.completed
                    || !game.choices.is_empty()
                    || game.pending_levels == 0
                {
                    return false;
                }
                game.open_stored_levels();
                !game.choices.is_empty()
            }
            7 => {
                game.coop
                    .raw_options
                    .entry(game.player_guid)
                    .or_insert([0, 1])[0] = argument;
                game.set_cache_on_click(argument != 0);
                true
            }
            8 => {
                game.set_store_levels(argument & 1 != 0);
                true
            }
            9 => {
                //145981fe0: guardian POI tracking; retain the full stored
                // byte, while its consumer tests only zero/nonzero.
                game.coop
                    .raw_options
                    .entry(game.player_guid)
                    .or_insert([0, 1])[1] = argument;
                true
            }
            _ => false,
            }
        })
        .unwrap_or(false)
    }

    pub fn update_party_world_flags(&mut self) {
        for (slot, guid) in self.party_members() {
            let shown = self
                .coop
                .raw_options
                .get(&guid)
                .map_or(true, |options| options[1] != 0);
            let Some(input) = self.party_input_for(slot) else {
                continue;
            };
            self.with_party_hero(slot, |game| {
                game.update_addon_flag(input.position);
                game.update_world_flag(input.position, shown);
            });
        }
    }

    // 0.121.0 145ae3124/145ae60a4 and shared queue consumers use the
    // reciprocal of the current density factor for private XP/gold grants.
    fn party_reward_factor(&self) -> f32 {
        self.party_scaling().map_or(1.0, |scaling| scaling.reward())
    }
    pub(super) fn credit_pickup_experience(&mut self, raw: u32, solo_minimum: bool) {
        if self.has_party() {
            self.coop
                .shared_experience
                .push((self.coop.active_slot, raw));
        }
        let amount = ((raw as f32 * self.stats.experience_multiplier) * self.party_reward_factor())
            .round() as u32;
        self.add_experience(if solo_minimum && !self.has_party() {
            amount.max(1)
        } else {
            amount
        });
    }
    pub(super) fn credit_pickup_gold(&mut self, raw: u32) {
        if self.has_party() {
            self.coop.shared_gold.push((self.coop.active_slot, raw));
        }
        let amount =
            ((raw as f32 * self.stats.gold_multiplier) * self.party_reward_factor()).round() as u32;
        self.credit_scaled_gold(amount);
    }
    fn credit_scaled_gold(&mut self, amount: u32) {
        self.gold = self.gold.wrapping_add(amount);
        self.gold_earned = self.gold_earned.wrapping_add(amount);
        self.events.push(RunEvent::PlayerValues(vec![(
            1176,
            self.gold.wrapping_mul(10_000),
        )]));
    }
    fn distribute_party_rewards(&mut self) {
        let experience = std::mem::take(&mut self.coop.shared_experience);
        let gold = std::mem::take(&mut self.coop.shared_gold);
        let equipment = self
            .boss_state
            .shared_equipment
            .as_mut()
            .map(std::mem::take)
            .unwrap_or_default();
        let strength = std::mem::take(&mut self.guardian_state.shared_strength);
        let killing_blows = std::mem::take(&mut self.boss_state.shared_killing_blows);
        let boss_flags = std::mem::take(&mut self.boss_state.shared_boss_flags);
        for (slot, _) in self.party_members() {
            self.with_party_hero(slot, |game| {
                // Native1458fa70e includes downed heroes for equipment unless
                // they deliberately left; each class consumes its own RNG rolls.
                if !game.abandoned {
                    let zone_index = azeroth_survivors_re::bosses::catalog::ZONES
                        .iter()
                        .position(|zone| zone.key == game.zone.key);
                    for &(collector, definition) in &equipment {
                        if collector == game.player_guid {
                            continue;
                        }
                        let loot = zone_index.and_then(|zone_index| {
                            azeroth_survivors_re::bosses::catalog::ZONES[zone_index]
                                .bosses.iter().position(|row| std::ptr::eq(row, definition))
                                .map(|index| (zone_index, index))
                        });
                        if let Some((zone_index, index)) = loot {
                            game.boss_state.equipment.roll_boss(
                                game.class.class_id,
                                zone_index,
                                index,
                                EquipmentRoll {
                                    extra_pickup_mode: false,
                                    additive_chance: game.effect_state.equipped.equipment_chance,
                                    run_options: [
                                        game.rules.density_percent,
                                        game.rules.hp_percent,
                                        game.rules.damage_percent,
                                        game.rules.speed_percent,
                                    ],
                                },
                                game.rules.heroic_rank,
                                (game.boss_state.completion.phase != 0)
                                    .then_some(game.boss_state.endless_bosses),
                                &mut game.rng,
                            );
                        }
                        // 0.120.2 credits every admitted boss-death record,
                        // independently of loot output and the later dead gate.
                        game.boss_state.death.boss_kills = game.boss_state.death.boss_kills.wrapping_add(1);
                    }
                }
                // 0.120.2 ordinary boss credit is independent of HP/phase.
                // Each recipient keeps its own incoming-boss damage history.
                if !game.abandoned {
                    for &(killer, hit) in &killing_blows {
                        if killer == slot {
                            continue;
                        }
                        game.effect_state.generic.killing_blows.push((hit.boss_id, hit.spell_id));
                        game.effect_state.generic.boss_killing_blows.push(hit);
                    }
                    game.effect_state.generic.boss_flags.extend(
                        boss_flags.iter().filter_map(|&(killer, result)| (killer != slot).then_some(result)),
                    );
                }
                if game.dead {
                    return;
                }
                let raw = experience
                    .iter()
                    .filter(|(collector, _)| *collector != slot)
                    .fold(0u32, |sum, (_, amount)| sum.wrapping_add(*amount));
                if raw != 0 {
                    let amount = ((raw as f32 * game.stats.experience_multiplier)
                        * game.party_reward_factor())
                    .round() as u32;
                    game.add_experience(amount);
                }
                let raw = gold
                    .iter()
                    .filter(|(collector, _)| *collector != slot)
                    .fold(0u32, |sum, (_, amount)| sum.wrapping_add(*amount));
                if raw != 0 {
                    let amount = ((raw as f32 * game.stats.gold_multiplier)
                        * game.party_reward_factor())
                    .round() as u32;
                    game.credit_scaled_gold(amount);
                }
                game.guardian_state.pending_strength =
                    game.guardian_state.pending_strength.wrapping_add(strength);
                game.drain_guardian_strength();
            });
        }
    }
    /// Invoked only after the actual native Hero sanitizer and world identity
    /// producer succeed. A lobby roster/Hello is not an admission input.
    pub fn admit_party_hero(
        &mut self,
        slot: u8,
        guid: u64,
        name: String,
        mut template: Mechanics,
        position: Position,
        facing: f32,
    ) -> Result<(), String> {
        if usize::from(slot) != self.coop.remotes.len() + 1
            || guid == 0
            || guid == self.player_guid
            || self.coop.remotes.len() >= 4
            || self
                .coop
                .remotes
                .iter()
                .any(|hero| hero.slot == slot || hero.state.player_guid == guid)
        {
            return Err("Invalid or duplicate native party identity".into());
        }
        if self.clock != 0.0 || self.dead || self.completed || !self.choices.is_empty() {
            return Err("Native party hero admission requires the pre-start phase".into());
        }
        if !template.actors.is_empty()
            || !template.bosses.is_empty()
            || !template.pickups.is_empty()
            || !template.coop.remotes.is_empty()
            || template.zone.key != self.zone.key
        {
            return Err(
                "Party template must contain only the configured hero for this world".into(),
            );
        }
        template.player_guid = guid;
        self.detailed_meter.note_guid_actor(guid, template.detailed_hero(name.clone()));
        if let Some(options) = template.coop.raw_options.get(&guid).copied() {
            self.coop.raw_options.insert(guid, options);
        }
        self.coop.remotes.push(RemoteHero {
            slot,
            name,
            input: PartyInput {
                position,
                facing,
                velocity: [0.0; 2],
            },
            state: HeroState::from_template(template),
            revive: 0.0,
            departed: false,
        });
        self.coop.local_guid = self.player_guid;
        self.coop.enabled = true;
        self.refresh_effects();
        let _ = self.with_party_hero(slot, |game| game.refresh_effects());
        self.boss_state
            .shared_equipment
            .get_or_insert_with(Vec::new);
        self.refresh_party_live_heroes();
        Ok(())
    }

    pub fn set_party_local_name(&mut self, name: String) {
        self.coop.local_name = name;
    }
    pub fn next_party_slot(&self) -> u8 {
        (self.coop.remotes.len() + 1) as u8
    }
    pub fn party_members(&self) -> Vec<(u8, u64)> {
        std::iter::once((0, self.player_guid))
            .chain(
                self.coop
                    .remotes
                    .iter()
                    .map(|hero| (hero.slot, hero.state.player_guid)),
            )
            .collect()
    }
    pub fn has_party(&self) -> bool {
        self.coop.enabled
    }

    pub(in crate::gameplay) fn detailed_owners(
        &self,
        armory: &crate::armory::ArmoryCatalog,
    ) -> Vec<crate::gameplay::detailed_meter::DetailedOwner> {
        use super::detailed_loadout::LoadoutView;
        use crate::gameplay::detailed_meter::{Actor, DetailedOwner};

        let capture = |loadout: LoadoutView<'_>, active: bool, name: &str, sex: u8| {
            let mut actor = self.detailed_meter.actor(loadout.guid).cloned().unwrap_or_else(|| {
                Actor::hero(loadout.guid, name.to_owned(), loadout.class.key, loadout.race, sex)
            });
            actor.state = if active { "present" } else { "departed" };
            DetailedOwner { guid: loadout.guid, active, actor, loadout: loadout.capture(armory) }
        };
        let mut owners = Vec::with_capacity(1 + self.coop.remotes.len());
        owners.push(capture(LoadoutView {
            guid: self.player_guid, race: self.stats.native_race, class: self.class,
            equipment: &self.equipment_ids, learned: &self.abilities, racial: self.racial.as_ref(),
            effects: &self.effect_state, treasure: &self.treasure_state,
            credits: self.detailed_meter.owner(self.player_guid),
        }, !self.abandoned, &self.coop.local_name, self.stats.packed_player_field.to_le_bytes()[2]));
        for remote in &self.coop.remotes {
            let state = &remote.state;
            owners.push(capture(LoadoutView {
                guid: state.player_guid, race: state.stats.native_race, class: state.class,
                equipment: &state.equipment_ids, learned: &state.abilities, racial: state.racial.as_ref(),
                effects: &state.effect_state, treasure: &state.treasure_state,
                credits: self.detailed_meter.owner(state.player_guid),
            }, !remote.departed, &remote.name, state.stats.packed_player_field.to_le_bytes()[2]));
        }
        owners
    }

    /// 0.139.2 permanent peer removal retains the world row and its reward
    /// ownership. The singleton check counts departures independently of phase.
    pub fn leave_party_hero(&mut self, slot: u8) -> bool {
        let Some(row) = self.coop.remotes.iter_mut().find(|hero| hero.slot == slot) else {
            return false;
        };
        if std::mem::replace(&mut row.departed, true) {
            return true;
        }
        self.refresh_party_live_heroes();
        let previous = self.party_health_factors();
        if self
            .with_party_hero(slot, |game| {
                game.completed = false;
                game.abandon(|_| None);
                game.abandoned = true;
                game.discard_choice_offers();
            })
            .is_none()
        {
            return false;
        }
        if self.coop.remotes.iter().all(|hero| hero.departed)
            && !self.abandoned
            && (self.boundary_started || self.is_paused_for_choice())
        {
            self.abandon(|_| None);
        }
        self.refresh_party_live_heroes();
        self.rescale_party_actor_health(previous);
        true
    }

    ///1458ff450: count every actual hero phase except down, clamped to one.
    fn refresh_party_live_heroes(&mut self) {
        self.capture_party(false);
        self.coop.live_heroes = self
            .coop
            .snapshot
            .heroes
            .iter()
            .filter(|hero| hero.state != 4)
            .count()
            .max(1);
    }

    pub(super) fn party_scaling(&self) -> Option<azeroth_survivors_re::coop::scaling::PartyScaling> {
        if !self.has_party() {
            return None;
        }
        let zone = azeroth_survivors_re::guardians::catalog::ZONES
            .iter()
            .position(|row| row.key == self.zone.key)
            .unwrap_or(0);
        // The selected remote is temporarily removed during its private tick.
        let has_other_heroes = !self.coop.remotes.is_empty() || self.coop.active_slot != 0;
        Some(azeroth_survivors_re::coop::scaling::PartyScaling::new(
            self.coop.live_heroes, zone, has_other_heroes,
        ))
    }

    /// Current 0.127.0 c09c26/c09d8b and creature constructors share these
    /// factors; lane one is for native boss/guardian membership. Retained party
    /// rows keep the0.8 reduction even when the live count falls back to one.
    pub(super) fn party_health_factors(&self) -> [f32; 2] {
        self.party_scaling().map_or([1.0; 2], |scaling| scaling.health)
    }

    ///145901658..189e preserves health proportion, with a one-HP floor.
    /// Native special membership is Actor+18 or+58 Some: boss or guardian.
    fn rescale_party_actor_health(&mut self, previous: [f32; 2]) {
        let current = self.party_health_factors();
        let ratio = [current[0] / previous[0], current[1] / previous[1]];
        if ratio.iter().all(|value| (*value - 1.0).abs() < 0.0001) {
            return;
        }
        let mut values = Vec::new();
        for row in &mut self.actors {
            let factor = ratio[usize::from(self.guardian_state.contains(row.guid))];
            if let Some(fields) =
                rescaled_health_fields(&mut row.health, &mut row.maximum_health, factor)
            {
                values.push((row.allocation_order, row.guid, fields));
            }
        }
        for row in &mut self.bosses {
            if let Some(fields) =
                rescaled_health_fields(&mut row.health, &mut row.maximum_health, ratio[1])
            {
                values.push((row.allocation_order, row.guid, fields));
            }
        }
        // Native wards have neither special membership option, although their
        // initial HP already inherits the scaled parent's maximum health.
        for row in &mut self.boss_state.wards.actors {
            if let Some(fields) =
                rescaled_health_fields(&mut row.health, &mut row.maximum_health, ratio[0])
            {
                values.push((row.allocation_order, row.guid, fields));
            }
        }
        values.sort_by_key(|row| row.0);
        self.events.extend(
            values
                .into_iter()
                .map(|(_, guid, fields)| RunEvent::ActorFields {
                    target: guid,
                    fields,
                }),
        );
    }
    /// Roll back an insertion before the server commits world admission.
    /// A live disconnect uses leave_party_hero and never compacts these rows.
    pub fn remove_party_hero(&mut self, slot: u8) -> bool {
        let before = self.coop.remotes.len();
        self.coop.remotes.retain(|hero| hero.slot != slot);
        let removed = before != self.coop.remotes.len();
        if removed {
            for hero in &mut self.coop.remotes {
                if hero.slot > slot {
                    hero.slot -= 1;
                }
            }
            self.coop.targets.retain(|_, target| *target != slot);
            for target in self.coop.targets.values_mut() {
                if *target > slot {
                    *target -= 1;
                }
            }
            self.capture_party(false);
        }
        removed
    }
    pub fn party_input(&mut self, slot: u8, input: PartyInput) -> bool {
        if slot == 0 {
            self.coop.local_input = Some(input);
            return true;
        }
        let Some(hero) = self.coop.remotes.iter_mut().find(|hero| hero.slot == slot) else {
            return false;
        };
        hero.input = input;
        true
    }
    pub fn party_pose(&self, slot: u8) -> Option<PartyInput> {
        self.party_input_for(slot)
    }
    /// Actual remote forced-position publications, in their production order.
    /// The host adapter installs the same pending-report gate as local moves.
    pub fn take_party_forced_positions(&mut self) -> Vec<(u8, Position)> {
        std::mem::take(&mut self.coop.forced_positions)
    }
    pub fn party_snapshot(&self) -> &Party {
        &self.coop.snapshot
    }

    pub fn party_downed_payload(&self) -> String {
        self.coop.snapshot.downed_payload(
            usize::from(self.coop.active_slot),
            self.party_terminal_phase() == Some(4),
        )
    }

    pub fn localized_party_snapshot(&self, locale: &crate::localization::Localization) -> Party {
        let mut party = self.coop.snapshot.clone();
        for hero in &mut party.heroes {
            let Some(guid) = self.party_guid(hero.slot as u8) else {
                continue;
            };
            let Some((_, entries)) = self.coop.meter.get(&guid) else {
                continue;
            };
            let mut rows: Vec<(String, bool, f64)> = Vec::new();
            for entry in entries {
                let name = super::super::addon_meters::source_name(entry.source, locale);
                if let Some(row) = rows
                    .iter_mut()
                    .find(|row| row.0 == name && row.1 == entry.source.talent)
                {
                    row.2 += entry.total;
                } else {
                    rows.push((name, entry.source.talent, entry.total));
                }
            }
            rows.sort_by(|left, right| right.2.total_cmp(&left.2));
            hero.spells = rows
                .into_iter()
                .map(|(name, _, damage)| PartySpell { name, damage })
                .collect();
        }
        party
    }
    pub fn party_guid(&self, slot: u8) -> Option<u64> {
        if slot == self.coop.active_slot {
            Some(self.player_guid)
        } else if slot == 0 {
            Some(self.coop.local_guid)
        } else {
            self.coop
                .remotes
                .iter()
                .find(|hero| hero.slot == slot)
                .map(|hero| hero.state.player_guid)
        }
    }
    pub fn party_slot(&self, guid: u64) -> Option<u8> {
        if guid == self.player_guid {
            Some(self.coop.active_slot)
        } else if guid == self.coop.local_guid {
            Some(0)
        } else {
            self.coop
                .remotes
                .iter()
                .find(|hero| hero.state.player_guid == guid)
                .map(|hero| hero.slot)
        }
    }
    pub(super) fn party_slot_for_source(&self, guid: u64) -> u8 {
        if let Some(slot) = self.detailed_meter.actor(guid).and_then(|actor| actor.owner)
            .and_then(|owner| self.party_slot(owner))
        {
            return slot;
        }
        if guid == self.player_guid
            || self.pet_state.rows.iter().any(|pet| pet.guid == guid)
            || self.demon_state.rows.iter().any(|demon| demon.guid == guid)
        {
            return self.coop.active_slot;
        }
        self.coop
            .remotes
            .iter()
            .find(|hero| {
                hero.state.player_guid == guid
                    || hero.state.pet_state.rows.iter().any(|pet| pet.guid == guid)
                    || hero
                        .state
                        .demon_state
                        .rows
                        .iter()
                        .any(|demon| demon.guid == guid)
            })
            .map_or(0, |hero| hero.slot)
    }
    pub fn party_meter_payload(&self) -> String {
        if self.coop.meter.is_empty() {
            String::new()
        } else {
            self.coop.snapshot.meter_payload(self.clock)
        }
    }
    pub fn party_shared_running(&self) -> bool {
        self.coop.replica.as_ref().map_or_else(
            || {
                self.coop
                    .snapshot
                    .heroes
                    .iter()
                    .any(|hero| hero.can_revive())
            },
            |state| !state.terminal,
        )
    }
    pub fn party_terminal_phase(&self) -> Option<u8> {
        if let Some(state) = self.replica_state() {
            return state
                .terminal
                .then_some(if state.phase == RunPhase::Victory {
                    5
                } else {
                    4
                });
        }
        if !self.has_party() || self.party_shared_running() {
            None
        } else {
            Some(
                if self.coop.snapshot.heroes.iter().any(|hero| hero.state == 5) {
                    5
                } else {
                    4
                },
            )
        }
    }
    pub fn take_party_events(&mut self) -> Vec<(u8, u64, Vec<RunEvent>)> {
        std::mem::take(&mut self.coop.events)
    }

    pub(super) fn remote_retirement_objects(&self) -> Vec<super::retirement::PrivateObjects> {
        self.coop.remotes.iter().map(|hero| {
            let state = &hero.state;
            super::retirement::PrivateObjects::capture(&state.execution, &state.pet_state,
                &state.demon_state, &state.passive_state, &state.loot_companion_state)
        }).collect()
    }

    ///1458e8b60 and145920ed0: remove one remote row, use its ordinary player
    /// owners against the shared world, restore the local context, reinsert.
    pub fn with_party_hero<R>(
        &mut self,
        slot: u8,
        action: impl FnOnce(&mut Mechanics) -> R,
    ) -> Option<R> {
        if slot == 0 {
            return Some(action(self));
        }
        let index = self
            .coop
            .remotes
            .iter()
            .position(|hero| hero.slot == slot)?;
        let mut hero = self.coop.remotes.remove(index);
        let previous_slot = self.coop.active_slot;
        self.coop.active_slot = slot;
        hero.state.swap(self);
        let start = self.events.len();
        let result = action(self);
        let events = self.events.split_off(start);
        if !events.is_empty() {
            self.coop.events.push((slot, self.player_guid, events));
        }
        hero.state.swap(self);
        self.coop.active_slot = previous_slot;
        self.coop.remotes.insert(index, hero);
        self.capture_party(false);
        Some(result)
    }

    pub(super) fn party_target(&mut self, actor: u64, position: Position) -> (u8, PartyInput) {
        let selected = self
            .coop
            .snapshot
            .select_target(
                [position.x, position.y, position.z],
                self.coop.targets.get(&actor).copied().map(usize::from),
            )
            .unwrap_or(0) as u8;
        self.coop.targets.insert(actor, selected);
        let input = if selected == 0 {
            self.coop.local_input
        } else {
            self.coop
                .remotes
                .iter()
                .find(|hero| hero.slot == selected)
                .map(|hero| hero.input)
        };
        (
            selected,
            input.unwrap_or(PartyInput {
                position,
                facing: 0.0,
                velocity: [0.0; 2],
            }),
        )
    }
    pub(super) fn active_scripted_targets(&self) -> impl Iterator<Item = (u64, Position)> + '_ {
        self.coop.snapshot.heroes.iter()
            .filter(|row| row.state == 1 && !row.finished)
            .map(|row| (row.guid, row.position.into()))
    }

    pub(super) fn party_input_for(&self, slot: u8) -> Option<PartyInput> {
        if slot == 0 {
            self.coop.local_input
        } else {
            self.coop
                .remotes
                .iter()
                .find(|hero| hero.slot == slot)
                .map(|hero| hero.input)
        }
    }

    fn refresh_party_targets(&mut self) {
        let sources: Vec<_> = self
            .actors
            .iter()
            .map(|row| (row.guid, row.actor.movement.position_at(self.clock)))
            .chain(
                self.bosses
                    .iter()
                    .map(|row| (row.guid, row.actor.movement.position_at(self.clock))),
            )
            .chain(
                self.boss_state
                    .wards
                    .actors
                    .iter()
                    .map(|row| (row.guid, row.actor.movement.position_at(self.clock))),
            )
            .collect();
        for (guid, point) in sources {
            let previous = self.coop.targets.get(&guid).copied();
            let (slot, _) = self.party_target(guid, point);
            if previous != Some(slot) {
                let actor = self
                    .actors
                    .iter_mut()
                    .find(|row| row.guid == guid)
                    .map(|row| &mut row.actor)
                    .or_else(|| {
                        self.bosses
                            .iter_mut()
                            .find(|row| row.guid == guid)
                            .map(|row| &mut row.actor)
                    })
                    .or_else(|| {
                        self.boss_state
                            .wards
                            .actors
                            .iter_mut()
                            .find(|row| row.guid == guid)
                            .map(|row| &mut row.actor)
                    });
                if let Some(actor) = actor {
                    actor.next_movement_at = actor.next_movement_at.min(self.clock);
                }
            }
        }
    }

    ///1458f90b2..1458f917f rotates to the next phase1 hero before the one
    /// world scheduling stage. A downed host cannot anchor all future spawns.
    fn schedule_party_world(&mut self, delta: f32, world: &mut impl RunWorld) {
        let count = self.coop.remotes.len() + 1;
        let selected = (1..=count)
            .map(|step| (usize::from(self.coop.schedule_slot) + step) % count)
            .find(|slot| {
                self.coop
                    .snapshot
                    .heroes
                    .iter()
                    .any(|hero| hero.slot == *slot && hero.state == 1)
            });
        let Some(slot) = selected.map(|slot| slot as u8) else {
            return;
        };
        self.coop.schedule_slot = slot;
        let Some(input) = self.party_input_for(slot) else {
            return;
        };
        self.with_party_hero(slot, |game| {
            game.spawn_scheduled_world(delta, input.position, input.velocity, world)
        });
    }

    fn capture_party(&mut self, capture_meter: bool) {
        fn spells(
            rows: &[azeroth_survivors_re::run_effects::healing::MeterEntry],
        ) -> Vec<PartySpell> {
            let mut rows: Vec<_> = rows
                .iter()
                .map(|row| PartySpell {
                    name: row.source.name.into(),
                    damage: row.total,
                })
                .collect();
            rows.sort_by(|a, b| b.damage.total_cmp(&a.damage));
            rows
        }
        let local_position = self.coop.local_input.map_or([0.0; 3], |input| {
            [input.position.x, input.position.y, input.position.z]
        });
        let mut rows = vec![PartyHero {
            slot: 0,
            guid: self.player_guid,
            name: self.coop.local_name.clone(),
            class: self.class.class_id,
            position: local_position,
            fall_epoch: self.fall_epoch,
            state: if self.completed {
                5
            } else if self.dead {
                4
            } else if self.is_paused_for_choice() {
                2
            } else {
                1
            },
            finished: self.abandoned,
            health: self.health(),
            max_health: self.max_health(),
            revive_elapsed: self.coop.local_revive,
            ..Default::default()
        }];
        if capture_meter {
            let damage = self.effective_damage();
            let spell_rows = self.damage_meter().to_vec();
            self.coop
                .meter
                .insert(self.player_guid, (damage, spell_rows));
        }
        for hero in &self.coop.remotes {
            let state = &hero.state;
            rows.push(PartyHero {
                slot: usize::from(hero.slot),
                guid: state.player_guid,
                name: hero.name.clone(),
                class: state.class.class_id,
                position: [
                    hero.input.position.x,
                    hero.input.position.y,
                    hero.input.position.z,
                ],
                fall_epoch: state.fall_epoch,
                state: if state.completed {
                    5
                } else if state.dead {
                    4
                } else if !state.choices.is_empty() {
                    2
                } else {
                    1
                },
                finished: state.abandoned,
                health: state.execution.vitals.health,
                max_health: state.execution.vitals.maximum_health,
                revive_elapsed: hero.revive,
                ..Default::default()
            });
            if capture_meter {
                self.coop.meter.insert(
                    state.player_guid,
                    (
                        state.effect_state.generic.damage_meters.total,
                        state
                            .effect_state
                            .generic
                            .damage_meters
                            .damage
                            .entries
                            .clone(),
                    ),
                );
            }
        }
        for row in &mut rows {
            if let Some((damage, entries)) = self.coop.meter.get(&row.guid) {
                row.damage = *damage;
                row.spells = spells(entries);
            }
        }
        self.coop.snapshot.active = self.has_party();
        self.coop.snapshot.heroic_rank = self.rules.heroic_rank;
        self.coop.snapshot.meter_captured = !self.coop.meter.is_empty();
        self.coop.snapshot.heroes = rows;
    }

    /// All heroes cast against one actor world; actor AI/spawning/clock execute
    /// once. Calling the solo tick once for every peer would duplicate those.
    pub fn tick_party(
        &mut self,
        delta: f32,
        player: Position,
        velocity: [f32; 2],
        facing: f32,
        world: &mut impl RunWorld,
    ) -> Option<Position> {
        if !self.has_party() {
            return self.tick(delta, player, velocity, facing, world);
        }
        if delta <= 0.0 {
            return None;
        }
        let delta = if delta > 0.1 { 0.1 } else { delta };
        self.party_input(
            0,
            PartyInput {
                position: player,
                facing,
                velocity,
            },
        );
        self.refresh_party_live_heroes();
        if !self.party_shared_running() {
            return None;
        }
        self.events
            .retain(|event| matches!(event, RunEvent::PlayerMover(_)));
        self.begin_boundary(world);
        self.clock += delta;
        self.capture_healing_snapshot();
        self.refresh_party_feat_members();
        self.refresh_party_targets();
        let mut forced = self.tick_stage(delta, player, velocity, facing, world, true);
        let inputs: Vec<_> = self
            .coop
            .remotes
            .iter()
            .map(|hero| (hero.slot, hero.input))
            .collect();
        for (slot, input) in inputs {
            let point = self
                .with_party_hero(slot, |game| {
                    game.tick_stage(
                        delta,
                        input.position,
                        input.velocity,
                        input.facing,
                        world,
                        true,
                    )
                })
                .flatten();
            if let Some(point) = point {
                if let Some(hero) = self.coop.remotes.iter_mut().find(|hero| hero.slot == slot) {
                    hero.input.position = point;
                    self.coop.forced_positions.push((slot, point));
                }
            }
        }
        self.distribute_party_healing();
        self.capture_party(false);
        self.resolve_boss_effects(delta, player, facing, world);
        let inputs: Vec<_> = self
            .coop
            .remotes
            .iter()
            .map(|hero| (hero.slot, hero.input))
            .collect();
        for (slot, input) in inputs {
            self.with_party_hero(slot, |game| {
                game.resolve_boss_effects(delta, input.position, input.facing, world)
            });
        }
        self.expire_scripted_attacks(world);
        self.tick_actor_frame(delta, player, facing, world);
        self.capture_party(false);
        self.schedule_party_world(delta, world);
        if self.active_run_state() {
            self.finish_boss_completion(world);
        }
        let slots: Vec<_> = self.coop.remotes.iter().map(|hero| hero.slot).collect();
        for slot in slots {
            self.with_party_hero(slot, |game| {
                if game.active_run_state() {
                    game.finish_boss_completion(world);
                }
            });
        }
        self.capture_party(false);
        if self.party_terminal_phase() == Some(5) {
            for (slot, _) in self.party_members() {
                self.with_party_hero(slot, |game| {
                    if game.dead {
                        game.dead = false;
                        game.completed = true;
                    }
                });
            }
        }
        self.distribute_party_rewards();
        let revived = self.coop.snapshot.update_revives(delta, self.clock);
        for row in &self.coop.snapshot.heroes {
            if row.slot == 0 {
                self.coop.local_revive = row.revive_elapsed;
            } else if let Some(hero) = self
                .coop
                .remotes
                .iter_mut()
                .find(|hero| usize::from(hero.slot) == row.slot)
            {
                hero.revive = row.revive_elapsed;
            }
        }
        for row in revived {
            self.with_party_hero(row.slot as u8, |game| game.apply_party_revive(row));
        }
        if self.clock - self.coop.meter_clock >= 1.0 {
            self.coop.meter_clock = self.clock;
            self.capture_party(true);
        } else {
            self.capture_party(false);
        }
        if let Some((point, _)) = self.boss_state.player_override.take() {
            forced = Some(point);
        }
        for hero in &mut self.coop.remotes {
            if let Some((point, facing)) = hero.state.boss_player_override.take() {
                hero.input.position = point;
                hero.input.facing = facing;
                self.coop.forced_positions.push((hero.slot, point));
            }
        }
        self.update_party_world_flags();
        forced
    }

    fn apply_party_revive(&mut self, row: azeroth_survivors_re::coop::game_party::Revived) {
        self.dead = false;
        self.death_recap = None;
        // Current145c084fe..145c08506: successful revival samples shared time.
        self.alive_since = self.clock;
        self.execution.vitals.health = row.health;
        self.execution
            .auras
            .retain(|aura| aura.spell_id != row.immunity_spell);
        self.execution.auras.push(buffs::Aura {
            source_guid: 0,
            spell_id: row.immunity_spell,
            // Native0.115 raw12 maps to the existing source's semantic11.
            effect: player_abilities::StatusEffect {
                tag: 11,
                value: 0.0,
                duration: 2.0,
            },
            expires_at: row.immunity_expires,
            healing_power: 0.0,
        });
        self.events
            .push(RunEvent::PlayerValues(self.player_vital_fields().to_vec()));
        self.publish_player_auras();
        self.events.push(RunEvent::PartyBanner(PartyBanner::Revived));
    }
}
