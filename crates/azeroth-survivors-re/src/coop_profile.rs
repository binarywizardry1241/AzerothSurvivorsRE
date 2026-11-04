//! 0.121.0 account/party Hero bridge; current builder145af4ae0 and
//! sanitizer145b4c110. See coop-heroic-wire-0.121.0.md.
use crate::{
    armory::{self, ArmoryCatalog},
    gameplay::mechanics::Mechanics,
    progression,
    save::{self, Pick, Save},
};
use azeroth_survivors_re::{
    coop::server_party::{
        validate_hero_identity, HeroIdentityError, NativeHero, NativeRosterProfile,
    },
    run_effects::loot_companions,
    run_progression::AccountGrants,
};

///1458e1530 accepts these exact two-byte language codes. Invalid input has no
/// locale override; it does not silently select the host's locale.
fn language(value: &[u8]) -> Vec<u8> {
    const CODES: [&[u8]; 14] = [
        b"en", b"pl", b"cs", b"de", b"pt", b"es", b"fr", b"ro", b"tr", b"ru", b"uk", b"zh", b"ja",
        b"ko",
    ];
    if CODES.contains(&value) {
        value.to_vec()
    } else {
        Vec::new()
    }
}

/// The world GUID comes from native_world_identity(startup_seed), independently
/// of the saved roster GUID. The caller supplies the three current option bytes
/// and any actual cached profile;145893fc0 overlays these on145816520's account.
pub(crate) fn build(
    save: &Save,
    pick: &Pick,
    world_guid: u64,
    locale: &str,
    flags: [u8; 3],
    profile: Option<NativeRosterProfile>,
) -> NativeHero {
    let (equipped, looks) = armory::coop_loadout(save, pick.hero.class, pick.hero.race);
    let rewards = progression::RewardPlan::read(save);
    let rank = |key: &str| rewards.perks.get(key).copied().unwrap_or(0);
    let companions = progression::account_loot_companions(save);
    let companion = |slot: usize| {
        companions
            .slots
            .get(slot)
            .map(|slot| (slot.definition.key.as_bytes().to_vec(), slot.instinct))
            .unwrap_or_default()
    };
    let (key_150, rank_158) = companion(0);
    let (key_160, rank_168) = companion(1);
    let gear = armory::GearSave::read_for(save, pick.hero.class, pick.hero.race);
    let plain = save.plaintext();
    let records = save::gear::Records::read(plain.lines());
    NativeHero {
        guid: world_guid,
        name: pick.name.as_bytes().to_vec(),
        class: pick.hero.class,
        race: pick.hero.race,
        sex: pick.hero.sex,
        features: pick.hero.features,
        words_188: equipped,
        optional_words_b8: looks,
        equipment_stars: gear.equipment_stars(pick.hero.class),
        pity: records.pity.into_iter().filter(|(id, _)| {
            save::gear::decode(*id).is_some_and(|piece| piece.class == pick.hero.class)
        }).collect(),
        heroic_unlocks: azeroth_survivors_re::guardians::catalog::ZONES.iter()
            .map(|zone| save.max_heroic_rank(pick.hero.class, zone.key)).collect(),
        weapon_glow: save.weapon_glow(pick.hero.class),
        bytes_18: save::talents::encode_allocation(&save.talent_allocation(pick.hero.class))
            .into_bytes(),
        words_170: [u32::from(rank("rerolls")), u32::from(rank("banish"))],
        bytes_17e: [u8::from(rank("skip") != 0), u8::from(rank("opening") != 0)],
        float_178_bits: (f32::from(rank("keen")) * 0.05).to_bits(),
        key_150,
        rank_158,
        key_160,
        rank_168,
        bytes_17c: [companions.leash, companions.paws],
        cooperative_luck_bits: azeroth_survivors_re::run_progression::cooperative_luck(
            save.earned_achievements().contains("coop:team"),
        ).to_bits(),
        bytes_1d8: flags,
        //1458916c0 admits the cached service profile only for this world and
        // the normalized current Pick name; a title from another hero is stale.
        profile: profile.filter(|profile| profile.value_60 == world_guid
            && profile.bytes_18.as_slice() == pick.clone().normalized().name.as_bytes()),
        achievement_points: progression::earned_points(save),
        byte_1e3: save.unlock_value(pick.hero.class).unwrap_or(1).clamp(1, 12) as u8,
        bytes_30: language(locale.as_bytes()),
    }
}

/// The recovered Hero sanitizer admits valid class IDs with any race1..8, independently of
/// the host's purchases, then normalizes identity/appearance and relative gear
/// and the complete talent allocation against a fixed51-point budget. The
/// connection owner checks duplicate world identities at profile admission.
pub(crate) fn sanitize(mut hero: NativeHero) -> Result<NativeHero, HeroIdentityError> {
    validate_hero_identity(&hero, &[1, 2, 3, 4, 5, 6, 7, 8], None, None, [])?;
    // Native String decoding has already replaced malformed UTF-8 before this
    // owner; retain the same replacement semantics at this binary boundary.
    let pick = Pick {
        hero: save::Hero {
            class: hero.class,
            race: hero.race,
            sex: hero.sex,
            features: hero.features,
        },
        name: String::from_utf8_lossy(&hero.name).into_owned(),
        zone: "elwynn".into(),
        // This temporary Pick normalizes identity only, independently of run Config.
        heroic_rank: 0,
        mods: Default::default(),
    }
    .normalized();
    hero.name = pick.name.into_bytes();
    hero.sex = pick.hero.sex;
    hero.features = pick.hero.features;
    armory::sanitize_coop_loadout(
        hero.class,
        hero.race,
        &mut hero.words_188,
        &mut hero.optional_words_b8,
    );
    for (stars, id) in hero.equipment_stars.iter_mut().zip(hero.words_188) {
        *stars = if id == 0 { 0 } else { (*stars).min(5) };
    }
    hero.pity = hero.pity.into_iter().filter(|(id, _)| {
        save::gear::decode(*id).is_some_and(|piece| piece.class == hero.class)
    }).take(64).map(|(id, count)| (id, count.min(40))).collect();
    hero.heroic_unlocks.truncate(12);
    hero.heroic_unlocks.resize(12, 0);
    for rank in &mut hero.heroic_unlocks { *rank = (*rank).min(5); }
    hero.weapon_glow = match hero.weapon_glow { 0 | 803 | 1894 | 1900 => hero.weapon_glow, _ => 0 };
    let raw = save::talents::decode_allocation(&String::from_utf8_lossy(&hero.bytes_18));
    let talents = save::talents::normalize(save::talents::catalog().class(hero.class), &raw, 51);
    hero.bytes_18 =
        save::talents::encode_allocation(&talents.into_iter().collect::<Vec<_>>()).into_bytes();
    hero.words_170 = hero.words_170.map(|value| value.min(3));
    hero.bytes_17c = hero.bytes_17c.map(|value| value.min(3));
    let keen = f32::from_bits(hero.float_178_bits);
    // Current MAXSS(0, x) followed by MINSS(0.1, x) retains x's NaN
    // payload and negative zero. Rust's min/max helpers discard NaNs.
    hero.float_178_bits = (if keen < 0.0 {
        0.0
    } else if keen > 0.1 {
        0.1
    } else {
        keen
    }).to_bits();
    hero.achievement_points = hero
        .achievement_points
        .min(progression::maximum_achievement_points());
    hero.byte_1e3 = hero.byte_1e3.clamp(1, 12);
    hero.bytes_30 = language(&hero.bytes_30);
    Ok(hero)
}

///1458162b0 projects the sanitized Hero into run-entry data. Mechanics owns the
/// shared-world insertion; this configures only its isolated per-hero template.
pub(crate) fn configure(game: &mut Mechanics, hero: &NativeHero, catalog: &ArmoryCatalog) {
    let allocation = save::talents::decode_allocation(&String::from_utf8_lossy(&hero.bytes_18));
    let gear = armory::coop_gear(
        hero.class,
        hero.race,
        &hero.words_188,
        &hero.optional_words_b8,
        &hero.equipment_stars,
    );
    game.configure_armor_set(hero.words_188, hero.equipment_stars);
    game.set_equipment_pity(&hero.pity);
    game.configure_effects(&allocation, &gear.effects(catalog, hero.class));
    game.set_account_grants(AccountGrants {
        free_rerolls: 3 + hero.words_170[0],
        banishes: hero.words_170[1],
        skip: hero.bytes_17e[0] != 0,
        opening: hero.bytes_17e[1] != 0,
        equipment_chance: f32::from_bits(hero.float_178_bits),
        // Veteran is awarded to the account owner at terminal delivery. There
        // is no selected/highest saved class XP field in the remote Hero wire.
        veteran_bonus: 0.0,
        cooperative_luck: f32::from_bits(hero.cooperative_luck_bits),
    });
    let slots = [
        (&hero.key_150, hero.rank_158),
        (&hero.key_160, hero.rank_168),
    ]
    .into_iter()
    .filter_map(|(key, instinct)| {
        loot_companions::definitions()
            .iter()
            .find(|row| row.key.as_bytes() == key.as_slice())
            .map(|definition| loot_companions::Slot {
                definition,
                instinct,
            })
    })
    .collect();
    game.set_loot_companions(loot_companions::Config {
        slots,
        leash: hero.bytes_17c[0],
        paws: hero.bytes_17c[1],
    });
    game.set_cache_on_click(hero.bytes_1d8[0] != 0);
    game.set_store_levels(hero.bytes_1d8[1] != 0);
}

/// Native paperdoll appearance, including starter fallbacks, faction IDs,
/// cosmetics/hidden slots and the two-handed offhand restriction.
pub(crate) fn outfit(hero: &NativeHero, catalog: &ArmoryCatalog) -> Vec<(u8, u32)> {
    armory::coop_gear(
        hero.class,
        hero.race,
        &hero.words_188,
        &hero.optional_words_b8,
        &hero.equipment_stars,
    )
    .outfit(catalog, hero.class, hero.race)
    .into_iter()
    .enumerate()
    .filter(|(_, id)| catalog.appearance(*id, hero.race).is_some())
    .map(|(slot, id)| (slot as u8 + 1, id))
    .collect()
}
