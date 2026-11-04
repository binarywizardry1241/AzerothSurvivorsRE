//! Historical 0.105.0 combat-pet descriptors and their recovered creation contract.
//! Current ordinary contracts: docs/analysis/ordinary-weapons-pets-0.110.0.md.
//!
//! Native constructor 145928bd0; raw29 collector 14599cd90. The immutable
//! descriptor does not imply that special Demonology dispatch is implemented.

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PetDefinition {
    pub key: &'static str,
    pub name: &'static str,
    pub icon: Option<&'static str>,
    pub entry: u32,
    pub model: u32,
    pub scale: f32,
    pub damage: f32,
    pub period: f32,
    pub spell_id: u32,
    pub school: u8,
    pub special: u8,
    pub native_address: u64,
}

pub const TARGET_SHA256: &str = "8dfa009f6915e68898d18bb631ddfad1606c20f92f7ec3109dff9d4769f8eeb7";

/// 0.139.2 presentation at 0x147374370. The address field identifies the
/// retained 0.105.0 source payload for this same entry.
pub const DREAD_LORD: PetDefinition = PetDefinition {
    key: "dread_lord",
    name: "Dread Lord",
    icon: Some("Spell_Shadow_UnholyStrength"),
    entry: 9523,
    model: 11658,
    scale: f32::from_bits(0x3e99999a),
    damage: f32::from_bits(0x3fcccccd),
    period: f32::from_bits(0x400ccccd),
    spell_id: 5676,
    school: 2,
    special: 8,
    native_address: 0x146e75178,
};

pub static DEFINITIONS: [PetDefinition; 15] = [
    PetDefinition {
        key: "wolf",
        name: "Wolf",
        icon: None,
        entry: 9510,
        model: 165,
        scale: f32::from_bits(0x3f800000),
        damage: f32::from_bits(0x42860000),
        period: f32::from_bits(0x3f99999a),
        spell_id: 0,
        school: 0,
        special: 0,
        native_address: 0x146e75008,
    },
    PetDefinition {
        key: "raptor",
        name: "Raptor",
        icon: None,
        entry: 9511,
        model: 1959,
        scale: f32::from_bits(0x3f800000),
        damage: f32::from_bits(0x42540000),
        period: f32::from_bits(0x3f99999a),
        spell_id: 0,
        school: 0,
        special: 0,
        native_address: 0x146e75058,
    },
    PetDefinition {
        key: "imp",
        name: "Imp",
        icon: Some("Spell_Shadow_SummonImp"),
        entry: 9512,
        model: 4449,
        scale: f32::from_bits(0x3f333333),
        damage: f32::from_bits(0x41b00000),
        period: f32::from_bits(0x40000000),
        spell_id: 133,
        school: 2,
        special: 1,
        native_address: 0x146e74fc0,
    },
    PetDefinition {
        key: "felguard",
        name: "Felguard",
        icon: Some("Ability_Warrior_Cleave"),
        entry: 9514,
        model: 5047,
        scale: f32::from_bits(0x3f400000),
        damage: f32::from_bits(0x42400000),
        period: f32::from_bits(0x40200000),
        spell_id: 0,
        school: 0,
        special: 5,
        native_address: 0x146e750e8,
    },
    PetDefinition {
        key: "treant",
        name: "Treant",
        icon: None,
        entry: 9515,
        model: 2078,
        scale: f32::from_bits(0x3e99999a),
        damage: f32::from_bits(0x429a0000),
        period: f32::from_bits(0x3fc00000),
        spell_id: 0,
        school: 3,
        special: 0,
        native_address: 0x146e750a0,
    },
    PetDefinition {
        key: "spirit_wolf",
        name: "Spirit Wolf",
        icon: None,
        entry: 9516,
        model: 776,
        scale: f32::from_bits(0x3f666666),
        damage: f32::from_bits(0x41e00000),
        period: f32::from_bits(0x3fb33333),
        spell_id: 0,
        school: 3,
        special: 0,
        native_address: 0x146e5b268,
    },
    PetDefinition {
        key: "water_elemental",
        name: "Water Elemental",
        icon: None,
        entry: 9517,
        model: 110,
        scale: f32::from_bits(0x3f0ccccd),
        damage: f32::from_bits(0x42480000),
        period: f32::from_bits(0x400ccccd),
        spell_id: 116,
        school: 4,
        special: 0,
        native_address: 0x146e74f78,
    },
    PetDefinition {
        key: "felhunter",
        name: "Felhunter",
        icon: Some("Spell_Shadow_SummonFelHunter"),
        entry: 9518,
        model: 850,
        scale: f32::from_bits(0x3f0ccccd),
        damage: f32::from_bits(0x41d00000),
        period: f32::from_bits(0x3fe66666),
        spell_id: 0,
        school: 5,
        special: 2,
        native_address: 0x146e75260,
    },
    PetDefinition {
        key: "voidwalker",
        name: "Voidwalker",
        icon: Some("Spell_Shadow_SummonVoidWalker"),
        entry: 9519,
        model: 1130,
        scale: f32::from_bits(0x3f19999a),
        damage: f32::from_bits(0x41600000),
        period: f32::from_bits(0x40133333),
        spell_id: 0,
        school: 5,
        special: 3,
        native_address: 0x146e5b1f8,
    },
    PetDefinition {
        key: "succubus",
        name: "Succubus",
        icon: Some("Spell_Shadow_SummonSuccubus"),
        entry: 9520,
        model: 4162,
        scale: f32::from_bits(0x3f800000),
        damage: f32::from_bits(0x41b00000),
        period: f32::from_bits(0x40000000),
        spell_id: 0,
        school: 5,
        special: 4,
        native_address: 0x146e751c0,
    },
    PetDefinition {
        key: "infernal",
        name: "Infernal",
        icon: Some("Spell_Shadow_SummonInfernal"),
        entry: 9521,
        model: 169,
        scale: f32::from_bits(0x3f19999a),
        damage: f32::from_bits(0x42480000),
        period: f32::from_bits(0x40200000),
        spell_id: 0,
        school: 2,
        special: 6,
        native_address: 0x146e75130,
    },
    PetDefinition {
        key: "doomguard",
        name: "Doomguard",
        icon: Some("Spell_Shadow_AntiMagicShell"),
        entry: 9522,
        model: 433,
        scale: f32::from_bits(0x3f400000),
        damage: f32::from_bits(0x3f99999a),
        period: f32::from_bits(0x4019999a),
        spell_id: 686,
        school: 5,
        special: 7,
        native_address: 0x146e75210,
    },
    DREAD_LORD,
    // 0.140.0 visual descriptors. The active pet retains its original combat
    // descriptor, including the Wolf or Raptor identity used by Kill Command.
    PetDefinition {
        key: "white_devilsaur",
        name: "White Devilsaur",
        icon: None,
        entry: 9530,
        model: 5239,
        scale: f32::from_bits(0x3e99999a),
        damage: 67.0,
        period: f32::from_bits(0x3f99999a),
        spell_id: 0,
        school: 0,
        special: 0,
        native_address: 0x1473e6c78,
    },
    PetDefinition {
        key: "white_devilsaur_raptor",
        name: "White Devilsaur",
        icon: None,
        entry: 9531,
        model: 5239,
        scale: f32::from_bits(0x3e99999a),
        damage: 53.0,
        period: f32::from_bits(0x3f99999a),
        spell_id: 0,
        school: 0,
        special: 0,
        native_address: 0x1473e6428,
    },
];

pub fn definition(entry: u32) -> Option<&'static PetDefinition> {
    DEFINITIONS
        .iter()
        .find(|definition| definition.entry == entry)
}

/// Current 0.112.0 descriptor identities, SHA-256 dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a.
/// Keep historical native_address fields with their original table provenance.
pub fn definition_at_current_address(address: u64) -> Option<&'static PetDefinition> {
    let entry = match address {
        0x14723ec08 => 9510, 0x14723ec58 => 9511, 0x14723ebc0 => 9512,
        0x14723ece8 => 9514, 0x14723eca0 => 9515, 0x1472218e8 => 9516,
        0x14723eb78 => 9517, 0x14723ee60 => 9518, 0x147221848 => 9519,
        0x14723edc0 => 9520, 0x14723ed30 => 9521, 0x14723ee10 => 9522,
        0x14723ed78 => 9523,
        0x1472c3a40 => 9530, 0x1472c3a00 => 9531,
        _ => return None,
    };
    definition(entry)
}

/// Resolve the source catalog's raw29 payloads, retaining each table's original
/// provenance. These addresses are source-data identities, not runtime pointers
/// or a claim that historical native addresses belong to the installed EXE.
pub fn raw29_definition(bytes: &[u8; 64]) -> Option<&'static PetDefinition> {
    if bytes[0] != 29 {
        return None;
    }
    let address = u64::from_le_bytes(bytes[8..16].try_into().unwrap());
    // talents.json (0.100.1) remains the live ordinary-effect source. Its
    // descriptors predate the 0.105.0 table used by DEFINITIONS; normalize only
    // the five established ordinary identities at this source-data boundary.
    let source_entry = match address {
        0x1469f1ec0 => Some(9510),
        0x1469f1f00 => Some(9511),
        0x1469f1f38 => Some(9515),
        0x1469da5d8 => Some(9516),
        0x1469f1e50 => Some(9517),
        _ => None,
    };
    if let Some(entry) = source_entry {
        return definition(entry);
    }
    DEFINITIONS
        .iter()
        .find(|definition| definition.native_address == address)
}

/// 0.140.0 uses this substitution for the spawned unit's identity and model.
pub fn white_devilsaur_appearance(combat: &'static PetDefinition) -> &'static PetDefinition {
    match combat.entry {
        9510 => definition(9530).expect("recovered White Devilsaur Wolf appearance"),
        9511 => definition(9531).expect("recovered White Devilsaur Raptor appearance"),
        _ => combat,
    }
}

#[cfg(test)]
mod white_devilsaur_tests {
    use super::*;

    #[test]
    fn independent_white_appearances_keep_combat_packet_fields() {
        for (combat_entry, visual_entry) in [(9510, 9530), (9511, 9531)] {
            let combat = definition(combat_entry).unwrap();
            let appearance = white_devilsaur_appearance(combat);
            assert_eq!(appearance.entry, visual_entry);
            assert_eq!(appearance.damage, combat.damage);
            assert_eq!(appearance.period, combat.period);
            let fields = object_fields(combat, appearance, 1, 2, 1, 1);
            for (field, value) in [
                (3, visual_entry),
                (4, 0.3_f32.to_bits()),
                (126, 1200),
                (129, 0.5_f32.to_bits()),
                (130, 1.5_f32.to_bits()),
                (131, 5239),
                (132, 5239),
            ] {
                assert!(fields.contains(&(field, value)), "missing field {field}");
            }
        }
        let treant = definition(9515).unwrap();
        assert!(std::ptr::eq(white_devilsaur_appearance(treant), treant));
    }
}

/// Current ordinary raw29 grants, preserving repeated rows. New Demonology
/// keys have special consumers and are deliberately left to those consumers.
pub fn followers(talent_key: &str) -> &'static [u32] {
    match talent_key {
        "tame_beast" => &[9510],
        "bestial_wrath" => &[9511],
        "stormstrike" => &[9516, 9516],
        "water_elemental" => &[9517],
        "force_of_nature" => &[9515, 9515],
        _ => &[],
    }
}

/// Showcase Begin1459187ae asks1458e62c0 for every possible class companion,
/// deduplicates descriptor identity and keeps special!=0. The current class
/// tables admit these eight Warlock demons; other classes' pets are special0.
/// Existing permanent/granted rows do not suppress these additional summons.
pub fn showcase_followers(class_id: u8) -> &'static [u32] {
    match class_id {
        9 => &[9512, 9518, 9519, 9520, 9521, 9522, 9523, 9514],
        _ => &[],
    }
}

/// Game begin145918520 assigns this angle after collecting all raw29 rows.
/// The index counts rows, so repeated grants receive distinct ring positions.
pub fn initial_relative_angle(index: usize, follower_count: usize) -> f32 {
    ((index as f32 * 0.5) / follower_count.max(1) as f32 + 0.75) * std::f32::consts::PI
}

/// The constructor samples terrain after calculating these horizontal inputs.
/// The caller supplies the native terrain/floor result for the final position.
pub fn spawn_xy(player_position: [f32; 3], player_facing: f32, relative_angle: f32) -> [f32; 2] {
    let angle = player_facing + relative_angle;
    [
        angle.cos() * 2.5 + player_position[0],
        angle.sin() * 2.5 + player_position[1],
    ]
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct TemporaryOrigin {
    pub expires_at: f32,
    pub effect_index: usize,
}

/// Native row+0..+0x17 is an optional temporary origin. The constructor copies
/// it without replacing an admitted deadline or the originating effect index.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct InitialState {
    pub guid: u64,
    pub allocation_order: u64,
    pub entry: u32,
    pub origin: Option<TemporaryOrigin>,
    pub position: [f32; 3],
    pub relative_angle: f32,
    pub movement_started_at: f32,
    pub movement_duration: f32,
    pub next_update: f32,
    pub next_attack: f32,
    pub power_multiplier: f32,
    pub target_guid: Option<u64>,
}

pub fn initial_state(
    definition: &PetDefinition,
    origin: Option<TemporaryOrigin>,
    position: [f32; 3],
    relative_angle: f32,
    now: f32,
    counter: &mut dyn crate::native_counter::NativeCounter,
) -> InitialState {
    let (guid, allocation_order) =
        crate::native_counter::creature_guid_with_order(definition.entry, counter);
    InitialState {
        guid,
        allocation_order,
        entry: definition.entry,
        origin,
        position,
        relative_angle,
        movement_started_at: now,
        movement_duration: 0.0,
        next_update: now + 1.0,
        next_attack: now,
        power_multiplier: 1.0,
        target_guid: None,
    }
}

/// The 0.139.2 constructor uses an indexed display multiplier. Collision
/// radius and reach use the descriptor scale independently.
pub fn display_scale(definition: &PetDefinition) -> f32 {
    let factor = match definition.special {
        1..=4 => 1.2,
        5..=7 => 1.5,
        8 => 3.6,
        _ => 1.0,
    };
    definition.scale * factor
}

/// Native Unit update fields. Current display scaling is revalidated in the
/// constructor; other fields retain their separately stated catalog provenance.
pub fn object_fields(
    definition: &PetDefinition,
    appearance: &PetDefinition,
    guid: u64,
    player_guid: u64,
    player_level: u32,
    player_race: u8,
) -> Vec<(u16, u32)> {
    let faction = match player_race {
        2 => 2,
        3 => 3,
        4 => 4,
        5 => 5,
        6 => 6,
        7 => 115,
        8 => 116,
        _ => 1,
    };
    vec![
        (0, guid as u32),
        (1, (guid >> 32) as u32),
        (2, 9),
        (3, appearance.entry),
        (4, display_scale(appearance).to_bits()),
        (12, player_guid as u32),
        (13, (player_guid >> 32) as u32),
        (14, player_guid as u32),
        (15, (player_guid >> 32) as u32),
        (22, 100),
        (28, 100),
        (34, player_level),
        (35, faction),
        (46, 2),
        (126, (definition.period * 1000.0) as u32),
        (129, (definition.scale * 0.5).to_bits()),
        (130, (definition.scale * 1.5).to_bits()),
        (131, appearance.model),
        (132, appearance.model),
        (145, 1.0f32.to_bits()),
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn showcase_followers_match_current_native_class_selector() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/follower-lifecycle/native-vectors.json"
        )).unwrap();
        for row in fixture["class_selector"].as_array().unwrap() {
            let expected = row["showcase_entries"].as_array().unwrap().iter()
                .map(|entry| entry.as_u64().unwrap() as u32).collect::<Vec<_>>();
            assert_eq!(showcase_followers(row["class_id"].as_u64().unwrap() as u8), expected);
        }
    }

    #[test]
    fn descriptors_match_selected_target_bytes() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/pet-creation/definitions.json"
        ))
        .unwrap();
        assert_eq!(fixture["target_sha256"], TARGET_SHA256);
        let current: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.139.2/nathrezim-summon.json"
        ))
        .unwrap();
        for row in fixture["definitions"].as_array().unwrap() {
            let value = definition(row["entry"].as_u64().unwrap() as u32).unwrap();
            let presentation = if value.entry == DREAD_LORD.entry {
                &current["summon"]
            } else {
                row
            };
            assert_eq!(value.key, presentation["key"].as_str().unwrap());
            assert_eq!(value.name, presentation["name"].as_str().unwrap());
            assert_eq!(value.icon, row["icon"].as_str());
            assert_eq!(value.model, presentation["model"].as_u64().unwrap() as u32);
            assert_eq!(
                value.scale.to_bits(),
                row["scale_bits"].as_u64().unwrap() as u32
            );
            assert_eq!(
                value.damage.to_bits(),
                row["damage_bits"].as_u64().unwrap() as u32
            );
            assert_eq!(
                value.period.to_bits(),
                row["period_bits"].as_u64().unwrap() as u32
            );
            assert_eq!(value.spell_id, row["spell_id"].as_u64().unwrap() as u32);
            assert_eq!(value.school, row["school"].as_u64().unwrap() as u8);
            assert_eq!(value.special, row["special"].as_u64().unwrap() as u8);
        }
        for talent in fixture["selected_talent_producers"].as_array().unwrap() {
            let native = talent["effects"]
                .as_array()
                .unwrap()
                .iter()
                .filter_map(|row| {
                    let text = row["raw_hex"].as_str().unwrap();
                    let bytes = std::array::from_fn(|i| {
                        u8::from_str_radix(&text[i * 2..i * 2 + 2], 16).unwrap()
                    });
                    raw29_definition(&bytes)
                        .filter(|definition| definition.special == 0)
                        .map(|definition| definition.entry)
                })
                .collect::<Vec<_>>();
            assert_eq!(followers(talent["key"].as_str().unwrap()), native);
        }
    }

    #[test]
    fn initialization_matches_unchanged_native_instructions() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.105.0/pet-creation/construction-native.json"
        ))
        .unwrap();
        assert_eq!(fixture["target_sha256"], TARGET_SHA256);
        for row in fixture["angles"].as_array().unwrap() {
            assert_eq!(
                initial_relative_angle(
                    row["index"].as_u64().unwrap() as usize,
                    row["count"].as_u64().unwrap() as usize
                )
                .to_bits(),
                row["bits"].as_u64().unwrap() as u32
            );
        }
        for row in fixture["states"].as_array().unwrap() {
            let f = |key: &str| f32::from_bits(row[key].as_u64().unwrap() as u32);
            let origin = row["temporary"]
                .as_bool()
                .unwrap()
                .then(|| TemporaryOrigin {
                    expires_at: f("expires_bits"),
                    effect_index: row["effect_index"].as_u64().unwrap() as usize,
                });
            let position = std::array::from_fn(|i| {
                f32::from_bits(row["position_bits"][i].as_u64().unwrap() as u32)
            });
            let value = initial_state(
                definition(9510).unwrap(),
                origin,
                position,
                f("relative_angle_bits"),
                f("now_bits"),
                &mut 0u32,
            );
            assert_eq!(value.origin, origin);
            assert_eq!(value.position, position);
            let words = [
                value.movement_started_at.to_bits(),
                value.movement_duration.to_bits(),
                value.next_update.to_bits(),
                value.next_attack.to_bits(),
                value.relative_angle.to_bits(),
                value.power_multiplier.to_bits(),
                0,
                0,
            ];
            let expected: [u32; 8] =
                std::array::from_fn(|i| row["initial_words"][i].as_u64().unwrap() as u32);
            assert_eq!(words, expected);
        }
        for row in fixture["guids"].as_array().unwrap() {
            let mut counter = row["previous"].as_u64().unwrap() as u32;
            let value = initial_state(
                definition(row["entry"].as_u64().unwrap() as u32).unwrap(),
                None,
                [0.0; 3],
                0.0,
                0.0,
                &mut counter,
            );
            assert_eq!(value.guid, row["guid"].as_u64().unwrap());
            assert_eq!(counter, row["next"].as_u64().unwrap() as u32);
        }
    }
    #[test]
    fn current_native_demon_display_and_collision_scales() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.112.0/demon-actors/native-scale-cases.json"
        )).unwrap();
        let current: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.139.2/nathrezim-summon.json"
        ))
        .unwrap();
        for row in fixture["cases"].as_array().unwrap() {
            let definition = definition(row["entry"].as_u64().unwrap() as u32).unwrap();
            let fields = object_fields(definition, definition, 1, 2, 1, 1);
            for (field, key) in [(4, "display_bits"), (129, "radius_bits"), (130, "reach_bits")] {
                let actual = fields.iter().find(|(index, _)| *index == field).unwrap().1;
                let evidence = if field == 4 && definition.entry == DREAD_LORD.entry {
                    &current["summon"]
                } else {
                    row
                };
                assert_eq!(actual, evidence[key].as_u64().unwrap() as u32, "{row}");
            }
        }
    }

}
