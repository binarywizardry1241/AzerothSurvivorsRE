//! Selected 0.115.0 server-party contracts, recovered from the installed EXE.
//! Admission: 0x1458952f0; rejection/drain: 0x145894d00;
//! connection/removal pump: 0x145877810/0x145896390.
//! See docs/analysis/coop-server-party-0.115.0.md for the bounded native proof.

// 0.127.0 admission 0x145bd651f requires both exact fields.
pub const GAME_VERSION: &str = "0.127.0";
pub const PROTOCOL_VERSION: u32 = 8;
pub const MAX_PARTY_SIZE: u8 = 5;
pub const MAX_MESSAGES_PER_CLIENT_TICK: usize = 200;
pub const REJECTION_DRAIN_SECONDS: f64 = 10.0;

// 0.119.0 helper145ae0ce0 and its bounded329-cell table1472da60c.
// These are host-to-guest engine events, not guest-to-host commands.
const GUEST_ENGINE_OPCODES: &[u16] = &[
    0x42, 0x51, 0x58, 0x5f, 0x61, 0x7d, 0x96, 0xa9, 0xaa,
    0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf,
    0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb,
    0xda, 0xdb, 0xdd, 0xe2, 0xe8, 0xea, 0xee, 0xef, 0xfd, 0x103, 0x112,
    0x122, 0x129, 0x12a, 0x12b, 0x130, 0x131, 0x132, 0x134, 0x135, 0x137,
    0x143, 0x144, 0x14a, 0x150, 0x155, 0x17d, 0x17e, 0x180, 0x1cb, 0x1d0,
    0x1de, 0x1f3, 0x209, 0x224, 0x236, 0x24e, 0x250, 0x277, 0x2c2, 0x2d2,
    0x2f4, 0x321,
];

/// Native host-to-guest opcode/body admission, before any client observation.
/// Synchronization and the receiving engine port are checked by the caller.
pub fn guest_engine_packet_allowed(opcode: u16, payload_len: usize) -> bool {
    payload_len <= 0xfffd && GUEST_ENGINE_OPCODES.binary_search(&opcode).is_ok()
}

/// Server initializer145876a00 derives a network/world identity from its supplied
/// u64 seed, separately from saved roster and accepted connection identifiers.
pub fn native_world_identity(seed: u64) -> u64 {
    let mixed = (seed as u32)
        ^ ((seed >> 46) as u32)
        ^ ((seed >> 23) as u32)
        ^ ((seed.wrapping_mul(0x1e3779b97f4a7c15) >> 40) as u32);
    let value = u64::from(mixed & 0x7fffff);
    let candidate = value + 0x800000;
    if candidate < 0xffff00 { candidate } else { value + 0x7fff00 }
}

///14584a6e0 classifies engine packets before145877810 chooses recipients.
/// True goes only to the originating hero through145894fe0. False is offered
/// to every actor (with native locale rewriting where required).
pub fn owner_only_engine_packet(opcode: u16, payload: &[u8]) -> bool {
    match opcode {
        0xc7 | 0xe2 | 0xe8 | 0xea | 0xef | 0x112 | 0x129 | 0x12a | 0x12b
        | 0x130 | 0x134 | 0x135 | 0x137 | 0x150 | 0x17d | 0x17e | 0x180
        | 0x1cb | 0x1d0 | 0x1de | 0x224 | 0x24e | 0x250 | 0x277 => true,
        0x96 => payload.first().is_some_and(|kind| kind.wrapping_sub(6) & 0xfb == 0),
        0xaa => payload.get(6..8).is_some_and(|high| high == [0, 0x40]),
        0xa9 => {
            let (Some(&update), Some(&mask)) = (payload.get(5), payload.get(6)) else { return false };
            let mut cursor = 7;
            let mut high = 0u16;
            for bit in 0..8 {
                if mask & (1 << bit) == 0 { continue; }
                let Some(&byte) = payload.get(cursor) else { return false };
                cursor += 1;
                if bit >= 6 { high |= u16::from(byte) << ((bit - 6) * 8); }
            }
            high == 0x4000 || (update == 3 && payload.get(cursor + 1).is_some_and(|flags| flags & 1 != 0))
        }
        _ => false,
    }
}

/// Local connection handle. The separately assigned wire slot has native u8 wrapping.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub struct ClientId(pub u64);

#[derive(Clone, Debug)]
pub struct HostConfig {
    pub password: Vec<u8>,
    /// Host command admission clamps capacity to 1..=5, including the host.
    pub capacity: u8,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct JoinRequest {
    pub protocol: u32,
    pub version: Vec<u8>,
    pub password: Vec<u8>,
}
impl JoinRequest {
    pub fn current(password: Vec<u8>) -> Self {
        Self { protocol: PROTOCOL_VERSION, version: GAME_VERSION.as_bytes().to_vec(), password }
    }
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct JoinAccepted {
    pub slot: u8,
    pub capacity: u8,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum JoinRejected {
    NotHosting,
    DifferentVersion,
    WrongPassword,
    Full,
    RunUnderWay,
}
impl JoinRejected {
    pub fn reason(self) -> &'static str {
        match self {
            Self::NotHosting => "not hosting",
            Self::DifferentVersion => "a different version of the game",
            Self::WrongPassword => "wrong password",
            Self::Full => "the party is full",
            Self::RunUnderWay => "the run is under way",
        }
    }
}

/// Optional roster profile retained from the0.115.0 serializer145b7c260 recovery.
/// Current0.127 staff vouch binds00=party code,18=name,30=title,60=worldGUID,
///68=UNIX expiry seconds and48=raw64-byte signature. Offset names preserve the
/// existing wire interface; see coop-lobby-ui-0.127.0.md for validation gates.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeRosterProfile {
    pub bytes_00: Vec<u8>,
    pub value_60: u64,
    pub bytes_18: Vec<u8>,
    pub bytes_30: Vec<u8>,
    pub value_68: u64,
    pub bytes_48: Vec<u8>,
}

/// Current0.127 producer has0xb8-byte roster rows, independently of UI DTOs.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeRosterEntry {
    pub hero_identity: u64,
    pub name: Vec<u8>,
    pub class: u8,
    pub race: u8,
    pub profile: Option<NativeRosterProfile>,
    pub achievement_points: u32,
    /// Current tag17 final row flag: class can enter the host selection.
    pub eligible: bool,
    /// Current wire17 puts this u16 after eligibility; ffff means unavailable.
    pub ping_ms: Option<u16>,
    /// Country strings form an optional parallel suffix after zone/rank.
    pub country: Vec<u8>,
}

/// Current tag17 snapshot includes the host selection after its ordered rows.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeRoster {
    pub entries: Vec<NativeRosterEntry>,
    pub zone: String,
    pub heroic_rank: u8,
}

/// Current 0.127.0 lifecycle variant21 / wire22. The host replaces a guest's
/// claimed identity with its admitted Hero before publishing this record.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeLobbyChat {
    pub hero_identity: u64,
    pub name: Vec<u8>,
    pub class: u8,
    pub text: Vec<u8>,
}

/// Current145b53c70 splits on Unicode whitespace/control, rejoins with ASCII
/// spaces, then limits the normalized text to160 Unicode scalar values.
pub fn normalize_lobby_chat(text: &str) -> String {
    text.split(|c: char| c.is_whitespace() || c.is_control())
        .filter(|part| !part.is_empty()).collect::<Vec<_>>().join(" ")
        .chars().take(160).collect()
}

///145ec0790 is shared by service33 and the roster country appendix.
pub fn normalize_lobby_country(bytes: &[u8]) -> Vec<u8> {
    let country = String::from_utf8_lossy(bytes).trim().to_ascii_uppercase();
    if country.len() == 2 && country.bytes().all(|c| c.is_ascii_uppercase()) && country != "XX" {
        country.into_bytes()
    } else { Vec::new() }
}

/// Complete tag4 wire shape. Unnamed fields retain native record offsets;
/// their serialization is recovered independently of source-side sanitization.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeHero {
    pub guid: u64,
    pub name: Vec<u8>,
    pub class: u8,
    pub race: u8,
    pub sex: u8,
    pub features: [u8; 5],
    pub words_188: [u32; 19],
    pub optional_words_b8: [Option<u32>; 19],
    /// 0.121.0: private account inputs carried after appearance overrides.
    pub equipment_stars: [u8; 19],
    pub pity: Vec<(u32, u8)>,
    pub heroic_unlocks: Vec<u8>,
    pub weapon_glow: u32,
    pub bytes_18: Vec<u8>,
    pub words_170: [u32; 2],
    pub bytes_17e: [u8; 2],
    pub float_178_bits: u32,
    pub key_150: Vec<u8>,
    pub rank_158: u8,
    pub key_160: Vec<u8>,
    pub rank_168: u8,
    pub bytes_17c: [u8; 2],
    /// 0.117.0 adds the earned cooperative luck f32 after companion ranks.
    pub cooperative_luck_bits: u32,
    pub bytes_1d8: [u8; 3],
    pub profile: Option<NativeRosterProfile>,
    pub achievement_points: u32,
    pub byte_1e3: u8,
    pub bytes_30: Vec<u8>,
}

impl NativeHero {
    /// 0.121.0 145b35728..145b3574b: normal zone admission and the
    /// per-zone Heroic byte are checked for every submitted hero. Missing
    /// Heroic entries admit only normal; accepted transports grant no unlocks.
    pub fn permits_zone(&self, zone: usize, heroic_rank: u8) -> bool {
        zone < usize::from(self.byte_1e3)
            && heroic_rank <= self.heroic_unlocks.get(zone).copied().unwrap_or(0)
    }
    /// Current145b33b10 includes the effective host rank only for Heroic.
    pub fn locked_reason(zone: &str, heroic_rank: u8) -> Vec<u8> {
        if heroic_rank == 0 { format!("locked:{zone}").into_bytes() }
        else { format!("locked:{zone}:{heroic_rank}").into_bytes() }
    }

}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum HeroIdentityError { Guid, ClassRace, Name, Duplicate }

/// The admission identity portion of 0x14584b690 and 0x145891b70 only.
/// Successful validation does not replace native appearance/equipment/talent
/// normalization or assign a world actor; those contracts remain separate.
pub fn validate_hero_identity(
    hero: &NativeHero, allowed_races: &[u8], host_guid: Option<u64>, active_guid: Option<u64>,
    other_client_guids: impl IntoIterator<Item = u64>,
) -> Result<(), HeroIdentityError> {
    if !(0x800000..0xffff00).contains(&hero.guid) { return Err(HeroIdentityError::Guid); }
    // The caller owns the applicable race domain. Current0.120.0 remote Hero
    // admission accepts1..8 without consulting the host's account purchases.
    if !(1..=11).contains(&hero.class) || ((0x5df >> (hero.class - 1)) & 1) == 0
        || !allowed_races.contains(&hero.race) {
        return Err(HeroIdentityError::ClassRace);
    }
    if hero.name.is_empty() { return Err(HeroIdentityError::Name); }
    if host_guid == Some(hero.guid) || active_guid == Some(hero.guid)
        || other_client_guids.into_iter().any(|guid| guid == hero.guid)
    { return Err(HeroIdentityError::Duplicate); }
    Ok(())
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum LifecyclePacket {
    Join(JoinRequest),
    Accepted(JoinAccepted),
    Denied(Vec<u8>),
    /// Host engine event text: native variant8, wire tag9.
    EventBytes(Vec<u8>),
    /// Guest engine command, admitted only after native synchronization.
    EngineCommand { opcode: u16, payload: Vec<u8> },
    Synchronize,
    Disconnect,
    Roster(NativeRoster),
    Hero(Box<NativeHero>),
    LobbyChat(NativeLobbyChat),
    /// Wire23 carries the host's millisecond clock; wire24 echoes it unchanged.
    Ping(u32),
    Pong(u32),
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum PacketError {
    Truncated,
    UnsupportedTag(u8),
    LengthOverflow,
}

/// Native serializer 0x14581c690: tag:u8, u32 little-endian scalars and
/// u32 little-endian byte-string lengths. TCP supplies its separate frame header.
pub fn encode_lifecycle(packet: &LifecyclePacket) -> Result<Vec<u8>, PacketError> {
    fn bytes(out: &mut Vec<u8>, value: &[u8]) -> Result<(), PacketError> {
        let length = u32::try_from(value.len()).map_err(|_| PacketError::LengthOverflow)?;
        out.extend_from_slice(&length.to_le_bytes());
        out.extend_from_slice(value);
        Ok(())
    }
    fn profile(out: &mut Vec<u8>, value: &Option<NativeRosterProfile>) -> Result<(), PacketError> {
        out.push(u8::from(value.is_some()));
        if let Some(value) = value {
            bytes(out, &value.bytes_00)?;
            out.extend_from_slice(&value.value_60.to_le_bytes());
            bytes(out, &value.bytes_18)?;
            bytes(out, &value.bytes_30)?;
            out.extend_from_slice(&value.value_68.to_le_bytes());
            bytes(out, &value.bytes_48)?;
        }
        Ok(())
    }
    let mut out = Vec::new();
    match packet {
        LifecyclePacket::Join(request) => {
            out.push(1);
            out.extend_from_slice(&request.protocol.to_le_bytes());
            bytes(&mut out, &request.version)?;
            bytes(&mut out, &request.password)?;
        }
        LifecyclePacket::Accepted(accepted) => {
            out.extend_from_slice(&[2, accepted.slot, accepted.capacity]);
        }
        LifecyclePacket::Denied(reason) => {
            out.push(3);
            bytes(&mut out, reason)?;
        }
        LifecyclePacket::EventBytes(value) => {
            out.push(9);
            bytes(&mut out, value)?;
        }
        LifecyclePacket::EngineCommand { opcode, payload } => {
            out.push(7);
            out.extend_from_slice(&opcode.to_le_bytes());
            bytes(&mut out, payload)?;
        }
        LifecyclePacket::Synchronize => out.push(6),
        LifecyclePacket::Disconnect => out.push(16),
        LifecyclePacket::LobbyChat(chat) => {
            out.push(22);
            out.extend_from_slice(&chat.hero_identity.to_le_bytes());
            bytes(&mut out, &chat.name)?;
            out.push(chat.class);
            bytes(&mut out, &chat.text)?;
        }
        LifecyclePacket::Ping(stamp) | LifecyclePacket::Pong(stamp) => {
            out.push(if matches!(packet, LifecyclePacket::Ping(_)) { 23 } else { 24 });
            out.extend_from_slice(&stamp.to_le_bytes());
        }
        LifecyclePacket::Hero(hero) => {
            out.push(4);
            out.extend_from_slice(&hero.guid.to_le_bytes());
            bytes(&mut out, &hero.name)?;
            out.extend_from_slice(&[hero.class, hero.race, hero.sex]);
            out.extend_from_slice(&hero.features);
            for word in hero.words_188 { out.extend_from_slice(&word.to_le_bytes()); }
            for word in hero.optional_words_b8 {
                out.extend_from_slice(&word.unwrap_or(u32::MAX).to_le_bytes());
            }
            out.extend_from_slice(&hero.equipment_stars);
            out.extend_from_slice(&u32::try_from(hero.pity.len()).map_err(|_| PacketError::LengthOverflow)?.to_le_bytes());
            for &(id, misses) in &hero.pity {
                out.extend_from_slice(&id.to_le_bytes());
                out.push(misses);
            }
            bytes(&mut out, &hero.heroic_unlocks)?;
            out.extend_from_slice(&hero.weapon_glow.to_le_bytes());
            bytes(&mut out, &hero.bytes_18)?;
            for word in hero.words_170 { out.extend_from_slice(&word.to_le_bytes()); }
            out.extend_from_slice(&hero.bytes_17e);
            out.extend_from_slice(&hero.float_178_bits.to_le_bytes());
            bytes(&mut out, &hero.key_150)?;
            out.push(hero.rank_158);
            bytes(&mut out, &hero.key_160)?;
            out.push(hero.rank_168);
            out.extend_from_slice(&hero.bytes_17c);
            out.extend_from_slice(&hero.cooperative_luck_bits.to_le_bytes());
            out.extend_from_slice(&hero.bytes_1d8);
            profile(&mut out, &hero.profile)?;
            out.extend_from_slice(&hero.achievement_points.to_le_bytes());
            out.push(hero.byte_1e3);
            bytes(&mut out, &hero.bytes_30)?;
        }
        LifecyclePacket::Roster(roster) => {
            let entries = &roster.entries;
            out.push(17);
            out.extend_from_slice(&u32::try_from(entries.len())
                .map_err(|_| PacketError::LengthOverflow)?.to_le_bytes());
            for entry in entries {
                out.extend_from_slice(&entry.hero_identity.to_le_bytes());
                bytes(&mut out, &entry.name)?;
                out.extend_from_slice(&[entry.class, entry.race]);
                profile(&mut out, &entry.profile)?;
                out.extend_from_slice(&entry.achievement_points.to_le_bytes());
                out.push(u8::from(entry.eligible));
                out.extend_from_slice(&entry.ping_ms.unwrap_or(u16::MAX).to_le_bytes());
            }
            bytes(&mut out, roster.zone.as_bytes())?;
            out.push(roster.heroic_rank);
            for entry in entries { bytes(&mut out, &entry.country)?; }
        }
    }
    Ok(out)
}

/// Decode one recovered lifecycle message and return bytes consumed. Remaining
/// bytes are left to the caller; this does not treat unsupported game messages
/// as lifecycle frames or claim to implement their schemas.
pub fn decode_lifecycle(input: &[u8]) -> Result<(LifecyclePacket, usize), PacketError> {
    struct Reader<'a> { bytes: &'a [u8], cursor: usize }
    impl<'a> Reader<'a> {
        fn take(&mut self, count: usize) -> Result<&'a [u8], PacketError> {
            let end = self.cursor.checked_add(count).ok_or(PacketError::LengthOverflow)?;
            let value = self.bytes.get(self.cursor..end).ok_or(PacketError::Truncated)?;
            self.cursor = end;
            Ok(value)
        }
        fn u8(&mut self) -> Result<u8, PacketError> { Ok(self.take(1)?[0]) }
        fn u16(&mut self) -> Result<u16, PacketError> {
            Ok(u16::from_le_bytes(self.take(2)?.try_into().expect("two bytes")))
        }
        fn u32(&mut self) -> Result<u32, PacketError> {
            Ok(u32::from_le_bytes(self.take(4)?.try_into().expect("four bytes")))
        }
        fn u64(&mut self) -> Result<u64, PacketError> {
            Ok(u64::from_le_bytes(self.take(8)?.try_into().expect("eight bytes")))
        }
        fn profile(&mut self) -> Result<Option<NativeRosterProfile>, PacketError> {
            Ok(if self.u8()? != 0 {
                Some(NativeRosterProfile {
                    bytes_00: self.bytes()?, value_60: self.u64()?,
                    bytes_18: self.bytes()?, bytes_30: self.bytes()?,
                    value_68: self.u64()?, bytes_48: self.bytes()?,
                })
            } else { None })
        }
        fn bytes(&mut self) -> Result<Vec<u8>, PacketError> {
            let length = self.u32()? as usize;
            Ok(self.take(length)?.to_vec())
        }
    }
    let mut reader = Reader { bytes: input, cursor: 0 };
    let packet = match reader.u8()? {
        1 => LifecyclePacket::Join(JoinRequest {
            protocol: reader.u32()?, version: reader.bytes()?, password: reader.bytes()?,
        }),
        2 => LifecyclePacket::Accepted(JoinAccepted { slot: reader.u8()?, capacity: reader.u8()? }),
        3 => LifecyclePacket::Denied(reader.bytes()?),
        4 => {
            let guid = reader.u64()?;
            let name = reader.bytes()?;
            let class = reader.u8()?;
            let race = reader.u8()?;
            let sex = reader.u8()?;
            let features = reader.take(5)?.try_into().expect("five bytes");
            let mut words_188 = [0; 19];
            for word in &mut words_188 { *word = reader.u32()?; }
            let mut optional_words_b8 = [None; 19];
            for word in &mut optional_words_b8 {
                let value = reader.u32()?;
                *word = (value != u32::MAX).then_some(value);
            }
            let equipment_stars = reader.take(19)?.try_into().expect("nineteen star bytes");
            let count = reader.u32()? as usize;
            if count > reader.bytes.len().saturating_sub(reader.cursor) / 5 {
                return Err(PacketError::Truncated);
            }
            let mut pity = Vec::with_capacity(count);
            for _ in 0..count { pity.push((reader.u32()?, reader.u8()?)); }
            let heroic_unlocks = reader.bytes()?;
            let weapon_glow = reader.u32()?;
            LifecyclePacket::Hero(Box::new(NativeHero {
                guid, name, class, race, sex, features, words_188, optional_words_b8,
                equipment_stars, pity, heroic_unlocks, weapon_glow,
                bytes_18: reader.bytes()?, words_170: [reader.u32()?, reader.u32()?],
                bytes_17e: [reader.u8()?, reader.u8()?], float_178_bits: reader.u32()?,
                key_150: reader.bytes()?, rank_158: reader.u8()?,
                key_160: reader.bytes()?, rank_168: reader.u8()?,
                bytes_17c: [reader.u8()?, reader.u8()?],
                cooperative_luck_bits: reader.u32()?,
                bytes_1d8: [reader.u8()?, reader.u8()?, reader.u8()?],
                profile: reader.profile()?, achievement_points: reader.u32()?,
                byte_1e3: reader.u8()?, bytes_30: reader.bytes()?,
            }))
        }
        6 => LifecyclePacket::Synchronize,
        7 => LifecyclePacket::EngineCommand { opcode: reader.u16()?, payload: reader.bytes()? },
        9 => LifecyclePacket::EventBytes(reader.bytes()?),
        16 => LifecyclePacket::Disconnect,
        22 => LifecyclePacket::LobbyChat(NativeLobbyChat {
            hero_identity: reader.u64()?, name: reader.bytes()?,
            class: reader.u8()?, text: reader.bytes()?,
        }),
        23 => LifecyclePacket::Ping(reader.u32()?),
        24 => LifecyclePacket::Pong(reader.u32()?),
        17 => {
            let count = reader.u32()? as usize;
            // The current reader's allocation guard uses fifteen bytes per
            // row; actual field reads independently enforce the full record.
            if count > input.len().saturating_sub(reader.cursor) / 15 {
                return Err(PacketError::Truncated);
            }
            let mut entries = Vec::with_capacity(count);
            for _ in 0..count {
                let hero_identity = reader.u64()?;
                let name = reader.bytes()?;
                let class = reader.u8()?;
                let race = reader.u8()?;
                let profile = reader.profile()?;
                let achievement_points = reader.u32()?;
                let eligible = reader.u8()? != 0;
                let ping_ms = reader.u16()?;
                entries.push(NativeRosterEntry {
                    hero_identity, name, class, race, profile,
                    achievement_points, eligible,
                    ping_ms: (ping_ms != u16::MAX).then_some(ping_ms), country: Vec::new(),
                });
            }
            let zone = String::from_utf8_lossy(&reader.bytes()?).into_owned();
            let heroic_rank = reader.u8()?;
            for entry in &mut entries {
                if reader.cursor < reader.bytes.len() {
                    entry.country = normalize_lobby_country(&reader.bytes()?);
                }
            }
            LifecyclePacket::Roster(NativeRoster {
                entries, zone, heroic_rank,
            })
        }
        tag => return Err(PacketError::UnsupportedTag(tag)),
    };
    Ok((packet, reader.cursor))
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MembershipEvent {
    Joined { client: ClientId, slot: u8 },
    Left { client: ClientId, slot: u8 },
}

#[derive(Clone, Debug)]
pub struct ServerClient {
    pub id: ClientId,
    pub slot: u8,
    pub joined: bool,
    /// The native record discriminant becomes1 after actual world assignment.
    /// A connection byte or a decoded/sanitized profile is not that assignment.
    pub world_hero: Option<u64>,
    /// Native+0x471: only the completed initial-world stream grants command input.
    pub synchronized: bool,
    /// Rejected connections retain their queued denial for the native drain grace.
    pub closing_since: Option<f64>,
}

#[derive(Default)]
pub struct PartyServer {
    config: Option<HostConfig>,
    clients: Vec<ServerClient>,
    next_handle: u64,
    next_slot: u8,
    run_under_way: bool,
    membership_events: Vec<MembershipEvent>,
}
impl PartyServer {
    pub fn host(&mut self, mut config: HostConfig) {
        self.close();
        config.capacity = config.capacity.clamp(1, MAX_PARTY_SIZE);
        self.next_slot = 0;
        self.config = Some(config);
    }
    pub fn is_hosting(&self) -> bool { self.config.is_some() }
    pub fn capacity(&self) -> u8 {
        self.config.as_ref().map_or(MAX_PARTY_SIZE, |config| config.capacity.min(MAX_PARTY_SIZE))
    }
    pub fn set_run_under_way(&mut self, value: bool) { self.run_under_way = value; }
    pub fn clients(&self) -> &[ServerClient] { &self.clients }
    pub fn accept_connection(&mut self) -> ClientId {
        self.next_handle = self.next_handle.wrapping_add(1);
        self.next_slot = self.next_slot.wrapping_add(1).max(1);
        let id = ClientId(self.next_handle);
        self.clients.push(ServerClient { id, slot: self.next_slot, joined: false,
            world_hero: None, synchronized: false, closing_since: None });
        id
    }
    /// Completion port for the actual world/hero owner, after full sanitization
    /// and insertion. No packet handler calls this merely on tag2/tag4 receipt.
    pub fn world_hero_added(&mut self, client: ClientId, guid: u64) -> bool {
        let Some(entry) = self.clients.iter_mut().find(|row| row.id == client
            && row.joined && row.closing_since.is_none()) else { return false };
        entry.world_hero = Some(guid);
        entry.synchronized = false;
        true
    }
    /// The host's actual End/reset clears actor ownership and input admission
    /// while retaining the joined transport and lobby membership.
    pub fn world_hero_removed(&mut self, client: ClientId) -> bool {
        let Some(entry) = self.clients.iter_mut().find(|row| row.id == client) else { return false };
        entry.world_hero = None;
        entry.synchronized = false;
        true
    }
    ///145892220 publishes the real initial-world stream before this flag.
    pub fn world_synchronization_completed(&mut self, client: ClientId) -> bool {
        let Some(entry) = self.clients.iter_mut().find(|row| row.id == client
            && row.joined && row.world_hero.is_some() && row.closing_since.is_none())
            else { return false };
        entry.synchronized = true;
        true
    }
    /// Validate in native order: hosting, version/protocol, password, capacity,
    /// running-state gate. Root owns transport and sends the resulting packet.
    pub fn admit(&mut self, client: ClientId, request: &JoinRequest, now: f64)
        -> Option<Result<JoinAccepted, JoinRejected>>
    {
        let index = self.clients.iter().position(|entry| entry.id == client)?;
        if self.clients[index].closing_since.is_some() { return None; }
        let rejection = match self.config.as_ref() {
            None => Some(JoinRejected::NotHosting),
            Some(_) if request.protocol != PROTOCOL_VERSION || request.version != GAME_VERSION.as_bytes()
                => Some(JoinRejected::DifferentVersion),
            Some(config) if !config.password.is_empty() && config.password != request.password
                => Some(JoinRejected::WrongPassword),
            Some(_) if self.clients.iter().filter(|entry| entry.joined).count() + 1 >= self.capacity() as usize
                => Some(JoinRejected::Full),
            Some(_) if self.run_under_way => Some(JoinRejected::RunUnderWay),
            Some(_) => None,
        };
        let slot = self.clients[index].slot;
        if let Some(reason) = rejection {
            self.begin_closing(client, now);
            Some(Err(reason))
        } else {
            self.clients[index].joined = true;
            self.membership_events.push(MembershipEvent::Joined { client, slot });
            Some(Ok(JoinAccepted { slot, capacity: self.capacity() }))
        }
    }
    pub fn begin_closing(&mut self, client: ClientId, now: f64) {
        if let Some(entry) = self.clients.iter_mut().find(|entry| entry.id == client) {
            let was_joined = entry.joined;
            entry.joined = false;
            entry.synchronized = false;
            entry.closing_since = Some(now);
            if was_joined {
                self.membership_events.push(MembershipEvent::Left { client, slot: entry.slot });
            }
        }
    }
    /// Native removal preserves the order of the remaining connection vector.
    pub fn disconnect(&mut self, client: ClientId) {
        if let Some(index) = self.clients.iter().position(|entry| entry.id == client) {
            let entry = self.clients.remove(index);
            if entry.joined {
                self.membership_events.push(MembershipEvent::Left { client, slot: entry.slot });
            }
        }
    }
    pub fn expire_rejections(&mut self, now: f64) -> Vec<ClientId> {
        let expired = self.clients.iter().filter(|entry|
            entry.closing_since.is_some_and(|since| now - since > REJECTION_DRAIN_SECONDS))
            .map(|entry| entry.id).collect::<Vec<_>>();
        for client in &expired { self.disconnect(*client); }
        expired
    }
    pub fn take_membership_events(&mut self) -> Vec<MembershipEvent> {
        std::mem::take(&mut self.membership_events)
    }
    pub fn close(&mut self) {
        let ids = self.clients.iter().map(|entry| entry.id).collect::<Vec<_>>();
        for client in ids { self.disconnect(client); }
        self.config = None;
        self.run_under_way = false;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn lobby_text_normalizes_whitespace_and_controls_before_scalar_truncation() {
        assert_eq!(normalize_lobby_chat(" \u{2003}你好\0\t世界\u{85}again\n "), "你好 世界 again");
        assert_eq!(normalize_lobby_chat(&format!("{}\nEND", "友".repeat(159))),
            format!("{} ", "友".repeat(159)));
        assert_eq!(normalize_lobby_chat("\0\u{200b}"), "\u{200b}");
    }

    #[test]
    fn guest_engine_events_use_the_native_opcode_and_body_boundary() {
        for opcode in [0x58, 0xa9, 0xb5, 0xc7, 0xcb, 0xda, 0xdb, 0xee, 0x321] {
            assert!(guest_engine_packet_allowed(opcode, 0));
            assert!(guest_engine_packet_allowed(opcode, 0xfffd));
            assert!(!guest_engine_packet_allowed(opcode, 0xfffe));
            assert!(!guest_engine_packet_allowed(opcode, usize::MAX));
        }
        for opcode in [0, 0x3d, 0x57, 0xcc, 0xdc, 0xed, 0x1df, 0xffff] {
            assert!(!guest_engine_packet_allowed(opcode, 0));
        }
    }

    #[test]
    fn handshake_and_decoded_hero_never_grant_world_synchronization() {
        let mut server = PartyServer::default();
        server.host(HostConfig { password: Vec::new(), capacity: 5 });
        let client = server.accept_connection();
        assert!(!server.world_synchronization_completed(client));
        server.admit(client, &JoinRequest::current(Vec::new()), 0.0).unwrap().unwrap();
        assert!(!server.world_synchronization_completed(client));
        assert!(server.clients()[0].world_hero.is_none());
        assert!(!server.clients()[0].synchronized);
        // These completion ports are called by the real world owner only after
        // the corresponding insertion and initial-world publication succeed.
        assert!(server.world_hero_added(client, 0x800000));
        assert!(!server.clients()[0].synchronized);
        assert!(server.world_synchronization_completed(client));
        assert!(server.world_hero_removed(client));
        assert!(server.clients()[0].joined);
        assert!(server.clients()[0].world_hero.is_none());
        assert!(!server.world_synchronization_completed(client));
        server.begin_closing(client, 1.0);
        assert!(!server.clients()[0].synchronized);
        assert!(!server.world_synchronization_completed(client));
    }

    // Fixed vectors transcribed from native serializer append calls. These Rust
    // tests are retained for a separately authorized compiling validation run.
    fn hero_fixture() -> NativeHero {
        NativeHero {
            guid: 0x800000, name: b"A".to_vec(), class: 8, race: 1, sex: 0,
            features: [0; 5], words_188: [0; 19], optional_words_b8: [None; 19],
            equipment_stars: [0; 19], pity: Vec::new(), heroic_unlocks: vec![0; 12],
            weapon_glow: 1894,
            bytes_18: Vec::new(), words_170: [0; 2], bytes_17e: [0; 2],
            float_178_bits: 0, key_150: Vec::new(), rank_158: 0,
            key_160: Vec::new(), rank_168: 0, bytes_17c: [0; 2],
            cooperative_luck_bits: 0,
            bytes_1d8: [0; 3], profile: None, achievement_points: 0,
            byte_1e3: 1, bytes_30: Vec::new(),
        }
    }

    #[test]
    fn native_hero_identity_guard_and_structural_packet() {
        let mut hero = hero_fixture();
        let races = [1, 7, 5, 8];
        assert_eq!(validate_hero_identity(&hero, &races, None, None, []), Ok(()));
        assert_eq!(validate_hero_identity(&hero, &races, None, None, [hero.guid]),
            Err(HeroIdentityError::Duplicate));
        hero.guid = 0xfffffe; // Temporary custom picker row is not a saved hero.
        assert_eq!(validate_hero_identity(&hero, &races, None, None, []),
            Err(HeroIdentityError::Guid));
        hero.guid = 0x800000;
        let packet = LifecyclePacket::Hero(Box::new(hero));
        let encoded = encode_lifecycle(&packet).unwrap();
        assert_eq!(&encoded[..14], &[4, 0, 0, 128, 0, 0, 0, 0, 0, 1, 0, 0, 0, b'A']);
        assert_eq!(decode_lifecycle(&encoded).unwrap(), (packet, encoded.len()));
    }

    #[test]
    fn current_hero_fields_match_original_instruction_fixtures() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.121.0/coop-heroic-wire/static-check.json")).unwrap();
        for rich in [false, true] {
            let mut hero = hero_fixture();
            if rich {
                hero.words_188 = std::array::from_fn(|n| n as u32 + 1);
                hero.optional_words_b8 = std::array::from_fn(|n| match n % 3 {
                    0 => None, 1 => Some(0), _ => Some(1200 + n as u32),
                });
                hero.equipment_stars = std::array::from_fn(|n| n as u8);
                hero.pity = vec![(1001, 255), (1002, 40), (1001, 0)];
                hero.heroic_unlocks = vec![0,1,2,3,4,5,255,5,4,3,2,1];
                hero.weapon_glow = 1900;
                hero.bytes_18 = b"x,y".to_vec();
            }
            let expected = proof["wire_fixtures"][usize::from(rich)]["wire_hex"].as_str().unwrap();
            let expected = expected.as_bytes().chunks_exact(2).map(|pair|
                u8::from_str_radix(std::str::from_utf8(pair).unwrap(), 16).unwrap()).collect::<Vec<_>>();
            let packet = LifecyclePacket::Hero(Box::new(hero));
            assert_eq!(encode_lifecycle(&packet).unwrap(), expected);
            assert_eq!(decode_lifecycle(&expected).unwrap(), (packet, expected.len()));
        }
    }

    #[test]
    fn native_lifecycle_wire_vectors() {
        let hello = LifecyclePacket::Join(JoinRequest::current(b"pw".to_vec()));
        let expected = b"\x01\x08\x00\x00\x00\x07\x00\x00\x000.127.0\x02\x00\x00\x00pw";
        assert_eq!(encode_lifecycle(&hello).unwrap(), expected);
        assert_eq!(decode_lifecycle(expected).unwrap(), (hello, expected.len()));
        assert_eq!(encode_lifecycle(&LifecyclePacket::Accepted(JoinAccepted { slot: 7, capacity: 5 })).unwrap(), [2, 7, 5]);
        assert_eq!(encode_lifecycle(&LifecyclePacket::EventBytes(b"hz".to_vec())).unwrap(), b"\x09\x02\x00\x00\x00hz");
        assert_eq!(encode_lifecycle(&LifecyclePacket::EngineCommand { opcode: 0x321, payload: vec![3] }).unwrap(), [7, 0x21, 3, 1, 0, 0, 0, 3]);
        assert_eq!(encode_lifecycle(&LifecyclePacket::Synchronize).unwrap(), [6]);
        assert_eq!(encode_lifecycle(&LifecyclePacket::Disconnect).unwrap(), [16]);
    }

    #[test]
    fn hero_wire_retains_cooperative_luck_between_companion_ranks_and_options() {
        for bits in [0, 0x3dcc_cccd, 0x7fc0_1234] {
            let mut hero = hero_fixture();
            hero.bytes_17c = [2, 3];
            hero.cooperative_luck_bits = bits;
            hero.bytes_1d8 = [1, 0, 1];
            let packet = LifecyclePacket::Hero(Box::new(hero));
            let bytes = encode_lifecycle(&packet).unwrap();
            let suffix = &bytes[bytes.len() - 19..];
            assert_eq!(&suffix[..2], &[2, 3]);
            assert_eq!(&suffix[2..6], &bits.to_le_bytes());
            assert_eq!(&suffix[6..9], &[1, 0, 1]);
            assert_eq!(decode_lifecycle(&bytes).unwrap(), (packet, bytes.len()));
        }
    }

    #[test]
    fn native_roster_without_optional_profile() {
        let row = NativeRosterEntry { hero_identity: 1, name: b"A".to_vec(), class: 8,
            race: 1, profile: None, achievement_points: 50, eligible: true,
            ping_ms: None, country: Vec::new() };
        let expected = [17, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
            b'A', 8, 1, 0, 50, 0, 0, 0, 1, 255, 255, 2, 0, 0, 0, b's', b'm', 3,
            0, 0, 0, 0];
        let roster = NativeRoster { entries: vec![row], zone: "sm".into(), heroic_rank: 3 };
        assert_eq!(encode_lifecycle(&LifecyclePacket::Roster(roster.clone())).unwrap(), expected);
        assert_eq!(decode_lifecycle(&expected).unwrap(), (LifecyclePacket::Roster(roster), expected.len()));
        assert_eq!(decode_lifecycle(&[17, 255, 255, 255, 255]), Err(PacketError::Truncated));
    }

    #[test]
    fn lobby_chat_and_ping_keep_the_current_wire_tags_and_utf8_byte_lengths() {
        let chat = LifecyclePacket::LobbyChat(NativeLobbyChat {
            hero_identity: 0x0102_0304_0506_0708, name: "界".as_bytes().to_vec(),
            class: 8, text: "hi朋友".as_bytes().to_vec(),
        });
        let expected = [22, 8, 7, 6, 5, 4, 3, 2, 1, 3, 0, 0, 0,
            0xe7, 0x95, 0x8c, 8, 8, 0, 0, 0, b'h', b'i',
            0xe6, 0x9c, 0x8b, 0xe5, 0x8f, 0x8b];
        assert_eq!(encode_lifecycle(&chat).unwrap(), expected);
        assert_eq!(decode_lifecycle(&expected).unwrap(), (chat, expected.len()));
        for (packet, tag) in [(LifecyclePacket::Ping(0x1234_5678), 23),
            (LifecyclePacket::Pong(0x1234_5678), 24)] {
            let expected = [tag, 0x78, 0x56, 0x34, 0x12];
            assert_eq!(encode_lifecycle(&packet).unwrap(), expected);
            assert_eq!(decode_lifecycle(&expected).unwrap(), (packet, 5));
        }
    }

    #[test]
    fn staff_vouch_signature_stays_binary_through_hero_and_roster_replication() {
        use crate::coop::replication::{NativeMessage, encode_message, decode_message};
        let signature = vec![0xff; 64];
        let profile = NativeRosterProfile { bytes_00: vec![0xff], value_60: 1,
            bytes_18: b"A".to_vec(), bytes_30: b"Guide".to_vec(), value_68: 100,
            bytes_48: signature.clone() };
        let mut hero = hero_fixture(); hero.profile = Some(profile.clone());
        let row = NativeRosterEntry { hero_identity: 1, name: b"A".to_vec(), class: 8,
            race: 1, profile: Some(profile), achievement_points: 0, eligible: true,
            ping_ms: None, country: Vec::new() };
        for packet in [LifecyclePacket::Hero(Box::new(hero)), LifecyclePacket::Roster(
            NativeRoster { entries: vec![row], zone: "elwynn".into(), heroic_rank: 0 })] {
            let wire = encode_message(&NativeMessage::Lifecycle(packet)).unwrap();
            let (NativeMessage::Lifecycle(decoded), _) = decode_message(&wire).unwrap() else { panic!() };
            let profile = match decoded {
                LifecyclePacket::Hero(hero) => hero.profile.unwrap(),
                LifecyclePacket::Roster(mut roster) => roster.entries.remove(0).profile.unwrap(),
                _ => panic!(),
            };
            assert_eq!(profile.bytes_00, "\u{fffd}".as_bytes());
            assert_eq!(profile.bytes_48, signature);
        }
    }

    #[test]
    fn roster_country_suffix_can_end_between_rows_but_rtt_is_mandatory() {
        let row = NativeRosterEntry { hero_identity: 1, name: b"A".to_vec(), class: 8,
            race: 1, profile: None, achievement_points: 50, eligible: true,
            ping_ms: Some(42), country: b"GB".to_vec() };
        let mut second = row.clone();
        second.hero_identity = 2;
        second.country = b"JP".to_vec();
        let roster = NativeRoster { entries: vec![row, second], zone: "sm".into(), heroic_rank: 0 };
        let wire = encode_lifecycle(&LifecyclePacket::Roster(roster.clone())).unwrap();
        let last_country = wire.len() - 6;
        let mut partial = roster.clone();
        partial.entries[1].country.clear();
        assert_eq!(decode_lifecycle(&wire[..last_country]).unwrap(),
            (LifecyclePacket::Roster(partial), last_country));
        let mut absent = roster;
        absent.entries.iter_mut().for_each(|entry| entry.country.clear());
        assert_eq!(decode_lifecycle(&wire[..last_country - 6]).unwrap(),
            (LifecyclePacket::Roster(absent), last_country - 6));
        assert_eq!(decode_lifecycle(&wire[..last_country + 1]), Err(PacketError::Truncated));
        let old = [17, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
            b'A', 8, 1, 0, 50, 0, 0, 0, 1, 2, 0, 0, 0, b's', b'm', 0];
        assert_eq!(decode_lifecycle(&old), Err(PacketError::Truncated));
    }

    #[test]
    fn native_admission_order_and_drain_grace() {
        let mut server = PartyServer::default();
        server.host(HostConfig { password: b"pw".to_vec(), capacity: 2 });
        let first = server.accept_connection();
        let second = server.accept_connection();
        let hello = JoinRequest::current(b"pw".to_vec());
        assert_eq!(server.admit(first, &hello, 0.0), Some(Ok(JoinAccepted { slot: 1, capacity: 2 })));
        server.set_run_under_way(true);
        // Capacity is tested before the running-state gate.
        assert_eq!(server.admit(second, &hello, 1.0), Some(Err(JoinRejected::Full)));
        assert!(server.expire_rejections(11.0).is_empty());
        assert_eq!(server.expire_rejections(11.001), [second]);
        assert_eq!(server.clients()[0].id, first);
        server.disconnect(first);
        let third = server.accept_connection();
        assert_eq!(server.admit(third, &hello, 12.0), Some(Err(JoinRejected::RunUnderWay)));
    }

    #[test]
    fn protocol_and_password_rejection_precede_capacity() {
        let mut server = PartyServer::default();
        server.host(HostConfig { password: b"pw".to_vec(), capacity: 1 });
        let client = server.accept_connection();
        let mut hello = JoinRequest::current(b"bad".to_vec());
        hello.protocol = 3;
        assert_eq!(server.admit(client, &hello, 0.0), Some(Err(JoinRejected::DifferentVersion)));
        let client = server.accept_connection();
        hello.protocol = PROTOCOL_VERSION;
        assert_eq!(server.admit(client, &hello, 0.0), Some(Err(JoinRejected::WrongPassword)));
    }
}
