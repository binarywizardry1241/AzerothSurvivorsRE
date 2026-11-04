//! Current kind14 healing-event producer and party recipient interface.
use super::*;
use azeroth_survivors_re::{run_effects::healing, run_meter};

#[derive(Clone, Copy, Debug)]
pub(super) struct AdmissionHero {
    slot: u8,
    position: Position,
    eligible: bool,
    health_share: f32,
}

impl AdmissionHero {
    pub fn capture(slot: u8, position: Position, eligible: bool, health: f32, maximum: f32) -> Self {
        let denominator = if maximum > 1.0 { maximum } else { 1.0 };
        Self { slot, position, eligible, health_share: health / denominator }
    }
}

#[derive(Clone, Copy, Debug)]
pub(super) enum Payload {
    Healing(buffs::SharedHealing),
    Aura(buffs::SharedAura),
}

#[derive(Clone, Copy, Debug)]
pub(super) struct Event {
    pub source_slot: u8,
    pub source_guid: u64,
    pub position: Position,
    pub payload: Payload,
}

pub(super) struct Port<'a> {
    pub enabled: bool,
    pub source_slot: u8,
    pub heroes: &'a [AdmissionHero],
    pub events: &'a mut Vec<Event>,
}

fn within_range(source: Position, recipient: Position) -> bool {
    let dx = source.x - recipient.x;
    let dy = source.y - recipient.y;
    dx * dx + dy * dy <= 900.0
}

impl Port<'_> {
    /// Current145b85e70 reads the fixed tick-start snapshot. Only state1
    /// neighbours admit a cast; its health-share comparison is strict.
    pub fn needs_healing(&self, player: Position) -> bool {
        self.heroes.iter().any(|hero| hero.slot != self.source_slot
            && hero.eligible && hero.health_share < 0.85
            && within_range(player, hero.position))
    }

    pub fn enqueue(&mut self, source_guid: u64, position: Position, healing: buffs::SharedHealing) {
        if self.enabled {
            self.events.push(Event { source_slot: self.source_slot, source_guid, position,
                payload: Payload::Healing(healing) });
        }
    }

    pub fn enqueue_aura(&mut self, source_guid: u64, position: Position, aura: buffs::SharedAura) {
        if self.enabled {
            self.events.push(Event { source_slot: self.source_slot, source_guid, position,
                payload: Payload::Aura(aura) });
        }
    }
}

impl Mechanics {
    /// The party owner takes the event vector once after all hero simulation.
    /// Recipients retain local-first order; each event keeps its original
    /// source slot/GUID/position even after that caster's frame has ended.
    pub(super) fn receive_party_healing(&mut self, events: &[Event], input: PartyInput) {
        if !self.active_run_state() { return; }
        for event in events {
            if event.source_slot == self.coop.active_slot
                || !within_range(event.position, input.position) { continue; }
            let Payload::Healing(healing) = event.payload else {
                let Payload::Aura(aura) = event.payload else { unreachable!() };
                let source_guid = if aura.effect.tag == 7 {
                    let amount = self.execution.vitals.maximum_health * aura.effect.value;
                    self.execution.vitals.absorb += amount;
                    if self.execution.shield.spell_id == 0 {
                        self.execution.shield = buffs::ShieldReservation { spell_id: aura.spell_id, amount };
                    }
                    // Kind 15 uses one source-zero shield aura per spell.
                    0
                } else {
                    event.source_guid
                };
                buffs::refresh_aura(&mut self.execution.auras, buffs::Aura {
                    source_guid, effect: aura.effect, spell_id: aura.spell_id,
                    expires_at: self.clock + aura.duration, healing_power: 0.0,
                });
                self.publish_player_auras();
                continue;
            };
            if let Some(amount) = buffs::receive_shared_healing(
                &mut self.execution.auras, event.source_guid, healing,
                self.clock, self.execution.vitals.maximum_health,
            ) {
                // Native 145eda43b clamps the recipient's coefficient-based heal
                // directly, then credits the effective gain before the log gate.
                let result = healing::apply(
                    &mut self.execution.vitals, &[],
                    &mut healing::HealingState::default(), amount, healing.spell_id,
                );
                // The received-heal descriptor looks up the shared spell in the
                // static catalog. The recipient's loadout cannot pick its label.
                let definition = run_meter::source_definition(healing.spell_id, [], None);
                let source = healing::meter_source(
                    0, [0; 4], [0; 4], None, &[], healing.spell_id, definition,
                );
                self.effect_state.generic.healing_meter.record(source, result.actual);
                if result.emit_log {
                    self.events.push(RunEvent::Healing {
                        amount: result.actual, emit_log: true, fields: result.fields,
                        context: Some(HealingContext {
                            source: event.source_guid, target: self.player_guid,
                            spell_id: healing.spell_id, critical: false,
                        }),
                    });
                }
            } else {
                self.publish_player_auras();
            }
        }
    }
}
