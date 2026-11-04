//! Native0.115.0 engine login/bootstrap packets. Owners145822670,
//! 14597e330 and their packet writers; see coop-bootstrap-0.115.0.md.
use super::replication::EnginePacket;

/// Current native zone table146cc0d10, stride0xf0; the normal zone resolver
/// keeps its row0 fallback for unsupported runtime keys.
#[derive(Clone, Copy, Debug)]
pub struct ZoneEnvironment {
    pub map_id: u32,
    pub zone_id: u32,
    pub position: [f32; 3],
    pub facing: f32,
    pub hour: u32,
    pub weather_kind: u32,
    pub weather_intensity: f32,
}

pub fn zone_environment(key: &str) -> ZoneEnvironment {
    use crate::zones::scholomance as school;
    if key == school::KEY {
        return ZoneEnvironment {
            map_id: school::MAP,
            zone_id: school::AREA,
            position: school::SPAWN,
            facing: school::FACING,
            hour: school::HOUR,
            weather_kind: school::WEATHER,
            weather_intensity: school::WEATHER_INTENSITY,
        };
    }
    let (map_id, zone_id, hour, weather_kind, weather_bits, position, facing) =
        match crate::zones::resolve(key).key {
            "elwynn" => (
                0,
                12,
                10,
                0,
                0x00000000,
                [0xc612d000, 0xc41e4000, 0x42880000],
                0x3fcccccd,
            ),
            "duskwood" => (
                0,
                10,
                0,
                1,
                0x3e800000,
                [0xc624b000, 0x43340000, 0x41f26666],
                0x00000000,
            ),
            "wsg" => (
                489,
                3277,
                20,
                0,
                0x00000000,
                [0x4499c000, 0x44b54000, 0x439b0000],
                0x3fc8f5c3,
            ),
            "ungoro" => (
                1,
                490,
                11,
                1,
                0x3e19999a,
                [0xc5d20000, 0xc4f00000, 0xc388199a],
                0x3fcccccd,
            ),
            "ab" => (
                529,
                3358,
                19,
                1,
                0x3eb33333,
                [0x4473c000, 0x4480c000, 0xc2340000],
                0x40800000,
            ),
            "feralas" => (
                1,
                357,
                8,
                1,
                0x3e4ccccd,
                [0xc5924000, 0x44a28000, 0x42be6666],
                0x40c1999a,
            ),
            "arena" => (
                0,
                33,
                16,
                0,
                0x00000000,
                [0xc64e5000, 0x43890000, 0x41af3333],
                0x00000000,
            ),
            "sm" => (
                189,
                796,
                12,
                0,
                0x00000000,
                [0x4482a000, 0x44ae8000, 0x41d80000],
                0x00000000,
            ),
            "av" => (
                30,
                2597,
                14,
                2,
                0x3f19999a,
                [0xc3660000, 0xc3910000, 0x40e00000],
                0x3f800000,
            ),
            "brm" => (
                0,
                46,
                21,
                0,
                0x00000000,
                [0xc5f28000, 0xc4e10000, 0x4304cccd],
                0x3fcccccd,
            ),
            "aq" => (
                1,
                1377,
                13,
                3,
                0x3ee66666,
                [0xc5f3c000, 0x44bb8000, 0x3fc00000],
                0x4048f5c3,
            ),
            "naxx" => (
                533,
                3456,
                0,
                0,
                0x00000000,
                [0x45684000, 0xc59f9000, 0x430d4ccd],
                0x00000000,
            ),
            _ => unreachable!("all recovered zone definitions have bootstrap metadata"),
        };
    ZoneEnvironment {
        map_id,
        zone_id,
        position: position.map(f32::from_bits),
        facing: f32::from_bits(facing),
        hour,
        weather_kind,
        weather_intensity: f32::from_bits(weather_bits),
    }
}

fn packet(opcode: u16, payload: Vec<u8>) -> EnginePacket {
    EnginePacket { opcode, payload }
}
fn words(values: impl IntoIterator<Item = u32>) -> Vec<u8> {
    values.into_iter().flat_map(u32::to_le_bytes).collect()
}

///14590e290 supplies all six living movement speeds; run_speed is the actual
/// hero's Game+4a4 multiplier times7, supplied by its mechanics owner.
pub fn living_speeds(run_speed: f32) -> [f32; 6] {
    [
        2.5,
        run_speed,
        4.5,
        f32::from_bits(0x40971c71),
        2.5,
        f32::from_bits(0x40490fdb),
    ]
}

/// The caller supplies the actual zone definition and already-built native
/// inventory/self-unit/name packets. No world object or zone field is inferred
/// from an accepted connection slot or a lobby row.
pub struct InitialWorld {
    pub map_id: u32,
    pub zone_id: u32,
    pub position: [f32; 3],
    pub facing: f32,
    pub zone_hour: u32,
    pub weather_kind: u32,
    pub weather_intensity: f32,
    /// Native class pool spells, followed by the separate Game+420 racial.
    pub known_spells: Vec<u32>,
    pub inventory_object: Option<EnginePacket>,
    pub self_object: EnginePacket,
    pub hero_name: EnginePacket,
}

impl InitialWorld {
    ///145822670's complete ordered local packet list. Party bootstrap appends
    /// every other hero's object/name pair and actual raid targets afterwards.
    pub fn packets(self) -> Vec<EnginePacket> {
        let [x, y, z] = self.position.map(f32::to_bits);
        let mut factions = 64u32.to_le_bytes().to_vec();
        factions.extend_from_slice(&[0; 64 * 5]);
        let mut known = vec![0];
        known.extend_from_slice(&(self.known_spells.len() as u16).to_le_bytes());
        for spell in self.known_spells {
            known.extend_from_slice(&(spell as u16).to_le_bytes());
            known.extend_from_slice(&0u16.to_le_bytes());
        }
        known.extend_from_slice(&0u16.to_le_bytes());
        let mut out = vec![
            packet(0x236, words([self.map_id, x, y, z, self.facing.to_bits()])),
            packet(0x209, vec![0; 128]),
            packet(0xfd, vec![0xff; 32]),
            packet(0x155, words([x, y, z, self.map_id, self.zone_id])),
            packet(0x12a, known),
            packet(0x122, factions),
            packet(
                0x42,
                words([(self.zone_hour << 6) | 0x06539800, 0x3c888889]),
            ),
        ];
        out.extend(self.inventory_object);
        out.push(self.self_object);
        let mut world_states = words([self.map_id, self.zone_id]);
        world_states.extend_from_slice(&0u16.to_le_bytes());
        out.push(packet(0x2c2, world_states));
        let mut weather = words([self.weather_kind, self.weather_intensity.to_bits(), 0]);
        weather.push(0);
        out.push(packet(0x2f4, weather));
        out.push(self.hero_name);
        out
    }
}

///14597e330/1459acf50 publish all120 action slots, including Game+420's racial
/// in slot11. This is distinct from the initial spellbook0x12a above.
pub fn action_buttons(learned_spells: &[u32], slot11_spell: u32) -> EnginePacket {
    let mut buttons = [0u32; 120];
    for (index, spell) in learned_spells.iter().take(120).enumerate() {
        buttons[index] = *spell;
    }
    buttons[11] = slot11_spell;
    packet(0x129, words(buttons))
}

///1459d6f30 resolves the selected class's complete pool keys into native spell
/// IDs;145822670 appends Game+420's current racial. The existing pool keys and
/// every selected spell ID are independently revalidated against0.115.0 here.
pub fn class_spellbook(class_id: u8, extra_spell: u32) -> Option<Vec<u32>> {
    use crate::player_abilities::{AbilityDefinition, CLASSES};
    let class = CLASSES.iter().find(|class| class.class_id == class_id)?;
    let mut spells = class
        .pool
        .iter()
        .map(|key| AbilityDefinition::by_key(key).map(|row| row.spell_id))
        .collect::<Option<Vec<_>>>()?;
    spells.push(extra_spell);
    Some(spells)
}

///1459b5590: actual GUID, NUL-terminated name and empty realm, then race/sex/class
/// as u32s. The caller already holds a normalized Hero name.
pub fn name_response(guid: u64, name: &[u8], race: u8, sex: u8, class: u8) -> EnginePacket {
    let mut body = guid.to_le_bytes().to_vec();
    body.extend_from_slice(name);
    body.extend_from_slice(&[0, 0]);
    body.extend(words([u32::from(race), u32::from(sex), u32::from(class)]));
    packet(0x51, body)
}
