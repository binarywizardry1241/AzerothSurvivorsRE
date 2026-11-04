use super::*;
use crate::gameplay::detailed_meter::{
    Actor as MeterActor, Credit, CreditKind, Ledger, Metric, Owner, Portrait, School, Source,
};
use azeroth_survivors_re::run_effects::pets::PetDefinition;

pub(super) fn note_companion(
    ledger: &mut Ledger,
    owner: u64,
    guid: u64,
    definition: &PetDefinition,
) {
    let (id, kind) = if definition.special == 0 {
        (format!("P{}", guid as u32), "pet")
    } else {
        (format!("D{}:{}", owner as u32, definition.key), "summon")
    };
    let mut actor = MeterActor::companion(id, kind, definition.name, owner, Some(definition.entry));
    if definition.special == 0 {
        actor.pet_family_key = Some(definition.key);
    } else {
        actor.summon_key = Some(definition.key);
    }
    ledger.note_guid_actor(guid, actor);
}

impl Mechanics {
    pub(super) fn detailed_hero(&self, name: String) -> MeterActor {
        MeterActor::hero(
            self.player_guid,
            name,
            self.class.key,
            self.stats.native_race,
            self.stats.packed_player_field.to_le_bytes()[2],
        )
    }

    pub(in crate::gameplay) fn note_detailed_hero(&mut self, name: String) {
        let actor = self.detailed_hero(name);
        self.detailed_meter.note_guid_actor(self.player_guid, actor);
    }

    pub(super) fn mark_detailed_departure(&mut self) {
        if let Some(mut hero) = self.detailed_meter.actor(self.player_guid).cloned() {
            hero.state = "departed";
            self.detailed_meter.note_actor(hero);
        }
    }

    pub(super) fn record_detailed_heal(
        &mut self,
        caster: u64,
        spell: u32,
        meter: MeterSource,
        actual: f32,
        periodic: bool,
    ) {
        if !actual.is_finite() || actual <= 0.0 {
            return;
        }
        let recipient = self
            .detailed_meter
            .actor(self.player_guid)
            .cloned()
            .unwrap_or_else(|| self.detailed_hero(String::new()));
        let definition = self.meter_definition(spell);
        let rank = definition.and_then(|definition| {
            self.abilities
                .iter()
                .find(|row| std::ptr::eq(row.definition, definition))
                .map(|row| row.rank)
        });
        let source = heal_source(meter, spell, definition, rank, self.recap_spells.as_deref());
        record_heal(
            &mut self.detailed_meter,
            self.clock,
            self.player_guid,
            recipient,
            caster,
            source,
            actual,
            periodic,
            CreditKind::Healing,
        );
    }

    pub(super) fn record_detailed_soul_link(&mut self, actual: f32) {
        if !actual.is_finite() || actual <= 0.0 {
            return;
        }
        let recipient = self
            .detailed_meter
            .actor(self.player_guid)
            .cloned()
            .unwrap_or_else(|| self.detailed_hero(String::new()));
        let source = source_with_meter(
            "soul_link".into(),
            "effect",
            "known",
            azeroth_survivors_re::run_effects::healing::SOUL_LINK,
            0,
        );
        record_heal(
            &mut self.detailed_meter,
            self.clock,
            self.player_guid,
            recipient,
            self.player_guid,
            source,
            actual,
            false,
            CreditKind::Absorb,
        );
    }
}

fn source_with_meter(
    key: String,
    kind: &'static str,
    attribution: &'static str,
    meter: MeterSource,
    spell: u32,
) -> Source {
    let mut source = Source::new(key, kind, attribution, meter.name);
    source.icon = (!meter.icon.is_empty()).then(|| meter.icon.into());
    source.spell_id = (spell != 0).then_some(spell);
    source
}

fn spell_source(spell: u32, spells: Option<&benilla_formats::SpellCatalog>) -> Source {
    if let Some(row) = spells
        .and_then(|spells| spells.get(spell))
        .filter(|row| !row.name.is_empty())
    {
        let mut source = Source::new(
            format!("spell:{spell}"),
            "effect",
            "known",
            row.name.clone(),
        );
        source.icon.clone_from(&row.icon);
        source.spell_id = Some(spell);
        source
    } else {
        Source::new("other".into(), "generic", "unknown", "Other")
    }
}

fn heal_source(
    meter: MeterSource,
    spell: u32,
    definition: Option<&AbilityDefinition>,
    rank: Option<u32>,
    spells: Option<&benilla_formats::SpellCatalog>,
) -> Source {
    if let Some(definition) = definition.filter(|row| row.name == meter.name) {
        return Source::ability(definition, rank, definition.spell_id != spell);
    }
    let fixed = match meter.name {
        "Leech" => Some(("leech", "generic")),
        "Regeneration" => Some(("regen", "generic")),
        "Healing on Kill" => Some(("heal_on_kill", "generic")),
        "Level Up" => Some(("level_up", "system")),
        "Restoration" => Some(("restoration", "system")),
        _ => None,
    };
    if let Some((key, kind)) = fixed {
        return source_with_meter(key.into(), kind, "known", meter, spell);
    }
    spell_source(spell, spells)
}

fn record_heal(
    ledger: &mut Ledger,
    clock: f32,
    recipient_guid: u64,
    recipient: MeterActor,
    caster: u64,
    source: Source,
    actual: f32,
    periodic: bool,
    kind: CreditKind,
) {
    let (actor, owner) = if caster == 0 || caster == recipient_guid {
        (Some(recipient.clone()), Owner::Known(recipient_guid))
    } else if let Some(actor) = ledger.actor(caster).cloned() {
        let owner = Owner::Known(actor.owner.unwrap_or(caster));
        (Some(actor), owner)
    } else if periodic {
        (Some(recipient.clone()), Owner::Known(recipient_guid))
    } else {
        (None, Owner::Unknown)
    };
    let other_owner = match owner {
        Owner::Known(guid) if guid != recipient_guid => Some(guid),
        _ => None,
    };
    let proc = matches!(source.kind, "talent" | "item");
    ledger.record(
        clock,
        Credit {
            actor,
            source,
            origins: Vec::new(),
            source_owner: owner,
            recipient_actor: Some(recipient),
            recipient_owner: Owner::Known(recipient_guid),
            metric: Metric::Healing,
            kind,
            school: School::NotApplicable,
            periodic,
            reflected: false,
            proc,
            amount: f64::from(actual),
        },
        std::iter::once(recipient_guid).chain(other_owner),
        None,
    );
}

impl<W: RunWorld> CombatAdapter<'_, W> {
    pub(super) fn note_detailed_boss(
        &mut self,
        guid: u64,
        definition: &azeroth_survivors_re::bosses::catalog::BossDefinition,
    ) {
        if self.detailed_meter.actor(guid).is_some() {
            return;
        }
        self.detailed_meter.note_guid_actor(
            guid,
            MeterActor {
                id: format!("E{}", guid as u32),
                kind: "enemy",
                name: definition.name.into(),
                name_is_localized: true,
                state: "present",
                portrait: Portrait {
                    key: "pt:monster".into(),
                    path: Some("Interface\\CharacterFrame\\TemporaryPortrait-Monster".into()),
                },
                class_key: None,
                parent: None,
                owner: None,
                creature_entry: Some(definition.id),
                pet_family_key: None,
                summon_key: None,
                totem_key: None,
            },
        );
    }

    pub(super) fn note_detailed_totem(&mut self, guid: u64, definition: &AbilityDefinition) {
        let mut actor = MeterActor::companion(
            format!("T{}", guid as u32),
            "totem",
            definition.name,
            self.player_guid,
            Some(9500),
        );
        actor.totem_key = Some(definition.key);
        self.detailed_meter.note_guid_actor(guid, actor);
    }

    fn detailed_hero(&self) -> MeterActor {
        self.detailed_meter
            .actor(self.player_guid)
            .cloned()
            .unwrap_or_else(|| {
                let class = player_abilities::CLASSES
                    .iter()
                    .find(|row| row.class_id == self.class_id)
                    .map_or("", |row| row.key);
                MeterActor::hero(
                    self.player_guid,
                    String::new(),
                    class,
                    self.stats.native_race,
                    self.stats.packed_player_field.to_le_bytes()[2],
                )
            })
    }

    fn detailed_ability(&self, spell: u32) -> Option<Source> {
        let definition = azeroth_survivors_re::run_meter::source_definition(
            spell,
            self.meter_abilities.iter().map(|row| row.0),
            self.meter_racial,
        )?;
        let rank = self
            .meter_abilities
            .iter()
            .find(|row| std::ptr::eq(row.0, definition))
            .map(|row| row.1);
        Some(Source::ability(
            definition,
            rank,
            definition.spell_id != spell,
        ))
    }

    fn detailed_effect(&self, index: usize) -> Option<Source> {
        let key = self.effect_meter_key(index)?;
        let meter = *self.meter_sources.get(index)?;
        if let Some(&(talent, rank)) = self.equipped.meter_talents.get(index) {
            if let Some(definition) = azeroth_survivors_re::run_effects::catalog()
                .classes
                .iter()
                .find(|class| class.id == self.class_id)
                .and_then(|class| class.talents.iter().find(|row| row.key == talent))
            {
                return Some(Source::talent(definition, rank));
            }
            let mut source = source_with_meter(key, "talent", "known", meter, 0);
            source.talent_key = Some(talent.into());
            source.rank = Some(u32::from(rank));
            return Some(source);
        }
        if key.starts_with("set:") {
            return Some(source_with_meter(key, "item", "known", meter, 0));
        }
        let mut source = source_with_meter(key, "item", "known", meter, 0);
        if let Some((key, rank)) = self.equipped.meter_amulet {
            if let Some(definition) =
                azeroth_survivors_re::loot_rewards::amulets::catalog().by_key(key)
            {
                return Some(Source::amulet(definition, rank));
            }
            source.item_key = Some(format!("amulet:{key}"));
            source.rank = Some(rank);
        }
        Some(source)
    }

    pub(super) fn detailed_effect_index(&self) -> Option<usize> {
        use azeroth_survivors_re::run_effects::healing::meter_effect_index;
        if self.is_resonant_damage() {
            return None;
        }
        meter_effect_index(
            self.attribution.source_kind,
            self.attribution.source_words,
            self.attribution.cast_words,
            self.generic.source,
        )
    }

    pub(super) fn record_detailed_self_heal(
        &mut self,
        spell: u32,
        meter: MeterSource,
        actual: f32,
        effect: Option<usize>,
    ) {
        if !actual.is_finite() || actual <= 0.0 {
            return;
        }
        let hero = self.detailed_hero();
        let source = effect
            .and_then(|index| self.detailed_effect(index))
            .filter(|effect| effect.name == meter.name)
            .or_else(|| {
                self.detailed_ability(spell)
                    .filter(|ability| ability.name == meter.name)
            })
            .unwrap_or_else(|| heal_source(meter, spell, None, None, self.meter_spells));
        record_heal(
            self.detailed_meter,
            self.now,
            self.player_guid,
            hero,
            self.player_guid,
            source,
            actual,
            false,
            CreditKind::Healing,
        );
    }

    pub(super) fn record_detailed_voidwalker_heal(&mut self, caster: u64, actual: f32) {
        if !actual.is_finite() || actual <= 0.0 {
            return;
        }
        let hero = self.detailed_hero();
        let source = source_with_meter(
            "leech".into(),
            "generic",
            "known",
            azeroth_survivors_re::run_effects::healing::LEECH,
            0,
        );
        record_heal(
            self.detailed_meter,
            self.now,
            self.player_guid,
            hero,
            caster,
            source,
            actual,
            false,
            CreditKind::Healing,
        );
    }

    pub(super) fn record_detailed_damage(
        &mut self,
        hit: &PendingHit,
        amount: f32,
        meter: MeterSource,
        primary_key: Option<&str>,
        attack: Option<CapturedAttack>,
        shares: DamageShares,
        boss: Option<u64>,
    ) {
        if !amount.is_finite() || amount <= 0.0 {
            return;
        }
        let source_guid = hit.context.meter_actor.unwrap_or(hit.source_guid);
        let (actor, owner) = if let Some(actor) = self.detailed_meter.actor(source_guid).cloned() {
            let owner = actor.owner.unwrap_or(source_guid);
            (actor, owner)
        } else {
            (self.detailed_hero(), self.player_guid)
        };
        let ability = self.detailed_ability(hit.spell_id);
        let effect = self
            .detailed_effect_index()
            .and_then(|index| self.detailed_effect(index));
        let mut origins = Vec::new();
        let source = match primary_key {
            Some(key) if effect.as_ref().is_some_and(|source| source.key == key) => {
                if self.attribution.source_kind == 0 {
                    origins.extend(ability);
                }
                effect.unwrap()
            }
            Some(key) if ability.as_ref().is_some_and(|source| source.key == key) => {
                if self.attribution.source_kind == 0 {
                    origins.extend(effect);
                }
                ability.unwrap()
            }
            Some(key) if key.starts_with("demon:") => {
                source_with_meter(key.into(), "ability", "known", meter, hit.spell_id)
            }
            Some(key) if key.starts_with("spell:") => spell_source(hit.spell_id, self.meter_spells),
            Some("other") | None => spell_source(hit.spell_id, self.meter_spells),
            Some(key) => source_with_meter(key.into(), "generic", "known", meter, hit.spell_id),
        };
        let proc =
            meter.talent || self.attribution.source_kind == 3 || self.generic.source.is_some();
        let school = 1u8
            .checked_shl(u32::from(hit.school))
            .map_or(School::Unknown, School::Known);
        // The ordinary reducer widens and separates the capped Howl share before
        // the raw-71 maximum-health share. Use the same allocations for typed rows.
        let (base, effect_amount, howl_amount) = shares.amounts(amount);
        let health_share = effect_amount.and_then(|amount| {
            self.equipped
                .rows
                .iter()
                .position(|row| row.tag() == 71)
                .and_then(|index| self.detailed_effect(index))
                .map(|source| (source, amount))
        });
        let howl = shares.howl.filter(|_| howl_amount > 0.0).map(|share| {
            let wolf = self
                .generic
                .packlord_howl_at(hit.target_guid, self.party_healing.source_slot, self.now)
                .and_then(|howl| self.detailed_meter.actor(howl.source))
                .cloned();
            (wolf, companion_attack("Howl", share.source, 24604))
        });
        let mut record = |actor: Option<MeterActor>, source, origins, proc, amount| {
            self.detailed_meter.record(
                self.now,
                Credit {
                    actor,
                    source,
                    origins,
                    source_owner: Owner::Known(owner),
                    recipient_actor: None,
                    recipient_owner: Owner::Unowned,
                    metric: Metric::Damage,
                    kind: CreditKind::Damage,
                    school,
                    periodic: hit.context.meter_periodic,
                    reflected: hit.context.meter_reflected,
                    proc,
                    amount,
                },
                [owner],
                boss,
            );
        };
        let companion_rows = attack
            .map(|attack| attack.components(2, base))
            .unwrap_or_default();
        if companion_rows.is_empty() {
            record(Some(actor.clone()), source, origins, proc, base);
        } else {
            for row in companion_rows {
                record(
                    Some(actor.clone()),
                    companion_attack(row.name, meter, hit.spell_id),
                    Vec::new(),
                    proc,
                    row.total,
                );
            }
        }
        if let Some((source, amount)) = health_share {
            record(Some(actor), source, Vec::new(), true, amount);
        }
        if let Some((wolf, source)) = howl {
            record(wolf, source, Vec::new(), true, howl_amount);
        }
    }
}

fn companion_attack(name: &'static str, meter: MeterSource, spell: u32) -> Source {
    let key = CapturedAttack::single(name)
        .source_key()
        .expect("an admitted companion label");
    source_with_meter(
        key,
        "ability",
        "known",
        MeterSource { name, ..meter },
        spell,
    )
}
