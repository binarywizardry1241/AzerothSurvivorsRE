//! Native AS framing above TCP: nineteen tags recovered from 0.115.0,
//! with the current0.117.0 State15 party-feat extension.
//! Ordinary WoW opcode payloads retain their existing engine codec boundary.

use super::server_party::{self, LifecyclePacket, PacketError};
use flate2::{Compression, read::DeflateDecoder, write::DeflateEncoder};
use std::io::{Read, Write};

pub const MAX_INFLATED_BATCH: usize = 0x40_0000;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct EnginePacket {
    pub opcode: u16,
    pub payload: Vec<u8>,
}
impl EnginePacket {
    pub fn into_message(self) -> NativeMessage {
        NativeMessage::Lifecycle(LifecyclePacket::EngineCommand {
            opcode: self.opcode,
            payload: self.payload,
        })
    }

    /// Reuse the actual public Vanilla packet parser and presentation decoder.
    /// The custom AS envelope supplies the opcode/body directly; adding a WoW
    /// socket/encryption header here would corrupt that body.
    pub fn decode_server(&self) -> std::io::Result<Vec<benilla_protocol::SessionEvent>> {
        let packet = benilla_protocol::messages::parse_server(self.opcode, &self.payload)?;
        Ok(benilla_protocol::decode(packet))
    }
}

/// Preserve the initial-world ordering in145892220 around the existing engine
/// producers: local snapshot, two packets for every other actor in slot order,
/// then the current raid-target list. The caller performs the real world-owner
/// finalization before declaring synchronization complete; no actor is invented
/// or marked synchronized by this codec.
pub fn initial_world_messages(
    snapshot: impl IntoIterator<Item = EnginePacket>,
    actors: &[[EnginePacket; 2]],
    local_slot: usize,
    raid_targets: EnginePacket,
) -> Vec<NativeMessage> {
    let mut messages = snapshot
        .into_iter()
        .map(EnginePacket::into_message)
        .collect::<Vec<_>>();
    for (slot, packets) in actors.iter().enumerate() {
        if slot != local_slot {
            messages.extend(packets.iter().cloned().map(EnginePacket::into_message));
        }
    }
    messages.push(raid_targets.into_message());
    messages
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ResourceRow {
    pub id: u32,
    pub name: String,
    /// Native fields +48/+60/+78/+90: each flag is followed by a string even
    /// when absent. Meaning belongs to the existing resource/UI consumers.
    pub optional: [Option<String>; 4],
    pub text_18: String,
    pub text_30: String,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct TimerRow {
    pub id: u32,
    pub value_bits: u32,
    pub flag: bool,
}
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct StateRow {
    pub word_00: u32,
    pub word_04: u32,
    pub byte_08: u8,
    pub kind_09: u8,
    pub flag_0a: bool,
}
/// Current0.121.0 party-feat member record, native eight-byte stride.
/// The wire retains class, trait flags and active-set byte without normalization.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeFeatMember {
    pub class: u8,
    pub word: u32,
    pub byte: u8,
    pub active_set: u8,
}
/// Current0.117.0 lethal-event record carries the entire party snapshot,
/// independently of the recipient's own killing-blow history.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeFeatEvent {
    pub word_18: u32,
    pub word_1c: u32,
    pub byte_20: u8,
    pub kind_21: u8,
    pub flag_22: bool,
    pub members: Vec<NativeFeatMember>,
}
/// Optional current0.117.0 State15 party context. Native absence is -1.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeCoopFeats {
    pub members: Vec<NativeFeatMember>,
    pub word_30: u32,
    pub flag_34: bool,
    pub events: Vec<NativeFeatEvent>,
}
/// Tag15 state: legacy scalar names retain their0.115.0 record offsets;
/// the optional party-feat context is the current0.117.0 extension.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct NativeState {
    pub float_68_bits: u32,
    pub byte_8f: u8,
    pub flag_8c: bool,
    pub word_6c: u32,
    pub flag_8d: bool,
    pub words_70: [u32; 5],
    pub heroic_rank: u8,
    /// Shared post-clear boss counter (Game+cd8), excluded from hero swaps.
    pub boss_counter: u32,
    /// Raw boss-mark sum; duplicate conversion remains recipient-owned.
    pub float_84_bits: u32,
    /// Raw maximum single-boss marks, excluding duplicate currency.
    pub float_88_bits: u32,
    pub max_equipment_stars: u8,
    /// Zero means no active set; otherwise tier index plus one.
    pub active_set: u8,
    /// Current State+c0: latest revival clock, or -1 while phase4 is exported.
    pub alive_since_bits: u32,
    pub flag_8e: bool,
    pub byte_90: u8,
    pub text: String,
    pub pairs: Vec<[u32; 2]>,
    pub rows: Vec<StateRow>,
    pub words: Vec<u32>,
    pub coop: Option<NativeCoopFeats>,
}
/// Current tag13 preserves the producing hero's boss serial and base payout.
/// Float bits remain exact until the guest's admitted reward sanitizer.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct EquipmentGrant {
    pub item_id: u32,
    pub boss_key: u32,
    pub boss_marks_bits: u32,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum NativeMessage {
    Lifecycle(LifecyclePacket),
    ZoneKey(String),                    //5
    /// Select and skip carry the viewed offer; other subtypes have no offer word.
    Control { kind: u8, argument: u8, offer: u32 }, //8
    HudJson(String),                    //10; native client bound65536
    Resources(Vec<ResourceRow>),        //11
    Timers(Vec<TimerRow>),              //12
    EquipmentGrants(Vec<EquipmentGrant>), //13
    StringRanks(Vec<(String, u8)>),     //14
    State(NativeState),                 //15
    End,                                //18
    Compressed(Vec<u8>),                //19; raw DEFLATE
    /// 0.121.0 tag20 carries marks and failed piece rolls. Equipment grants
    /// retain their separate tag13 route; these IDs increment private pity.
    MarksAndPity { marks_bits: u32, missed_items: Vec<u32> }, //20
    /// Host application-clock milliseconds, sampled before its queued packets.
    Time(u32), //21, recovered from the 0.123.0 serializer
    /// Current0.127.0 wire25: ordinary opcode0x58 body plus five registry texts.
    /// The guest replaces spell IDs with its local interner before engine delivery.
    ItemTemplate { payload: Vec<u8>, descriptions: Vec<String> }, //25
}
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum WireError {
    Packet(PacketError),
    InvalidControl,
    Deflate,
    InflatedLimit,
}
impl From<PacketError> for WireError {
    fn from(value: PacketError) -> Self {
        Self::Packet(value)
    }
}

fn push_bytes(out: &mut Vec<u8>, bytes: &[u8]) -> Result<(), WireError> {
    let length = u32::try_from(bytes.len()).map_err(|_| PacketError::LengthOverflow)?;
    out.extend_from_slice(&length.to_le_bytes());
    out.extend_from_slice(bytes);
    Ok(())
}
fn push_count(out: &mut Vec<u8>, count: usize) -> Result<(), WireError> {
    let count = u32::try_from(count).map_err(|_| PacketError::LengthOverflow)?;
    out.extend_from_slice(&count.to_le_bytes());
    Ok(())
}
fn push_feat_members(out: &mut Vec<u8>, members: &[NativeFeatMember]) -> Result<(), WireError> {
    push_count(out, members.len().min(5))?;
    for member in members.iter().take(5) {
        out.push(member.class);
        out.extend_from_slice(&member.word.to_le_bytes());
        out.push(member.byte);
        out.push(member.active_set);
    }
    Ok(())
}

fn push_words(out: &mut Vec<u8>, words: &[u32]) -> Result<(), WireError> {
    push_count(out, words.len())?;
    for word in words {
        out.extend_from_slice(&word.to_le_bytes());
    }
    Ok(())
}

fn control_argument(kind: u8, argument: u8) -> u8 {
    match kind {
        0 | 2 => argument,
        7..=9 => argument & 1,
        _ => 0,
    }
}

pub fn encode_message(message: &NativeMessage) -> Result<Vec<u8>, WireError> {
    let mut out = Vec::new();
    match message {
        NativeMessage::Lifecycle(value) => return Ok(server_party::encode_lifecycle(value)?),
        NativeMessage::ZoneKey(value) => {
            out.push(5);
            push_bytes(&mut out, value.as_bytes())?;
        }
        NativeMessage::Control { kind, argument, offer } => {
            if *kind > 10 {
                return Err(WireError::InvalidControl);
            }
            out.extend_from_slice(&[8, *kind, control_argument(*kind, *argument)]);
            if matches!(*kind, 0 | 3) {
                out.extend_from_slice(&offer.to_le_bytes());
            }
        }
        NativeMessage::HudJson(value) => {
            out.push(10);
            push_bytes(&mut out, value.as_bytes())?;
        }
        NativeMessage::Resources(rows) => {
            out.push(11);
            push_count(&mut out, rows.len())?;
            for row in rows {
                out.extend_from_slice(&row.id.to_le_bytes());
                push_bytes(&mut out, row.name.as_bytes())?;
                for optional in &row.optional {
                    out.push(u8::from(optional.is_some()));
                    push_bytes(&mut out, optional.as_deref().unwrap_or("").as_bytes())?;
                }
                push_bytes(&mut out, row.text_18.as_bytes())?;
                push_bytes(&mut out, row.text_30.as_bytes())?;
            }
        }
        NativeMessage::ItemTemplate { payload, descriptions } => {
            out.push(25);
            push_bytes(&mut out, payload)?;
            push_count(&mut out, descriptions.len())?;
            for text in descriptions {
                push_bytes(&mut out, text.as_bytes())?;
            }
        }
        NativeMessage::Timers(rows) => {
            out.push(12);
            push_count(&mut out, rows.len())?;
            for row in rows {
                out.extend_from_slice(&row.id.to_le_bytes());
                out.extend_from_slice(&row.value_bits.to_le_bytes());
                out.push(u8::from(row.flag));
            }
        }
        NativeMessage::EquipmentGrants(rows) => {
            out.push(13);
            push_count(&mut out, rows.len())?;
            for row in rows {
                out.extend_from_slice(&row.item_id.to_le_bytes());
                out.extend_from_slice(&row.boss_key.to_le_bytes());
                out.extend_from_slice(&row.boss_marks_bits.to_le_bytes());
            }
        }
        NativeMessage::StringRanks(rows) => {
            out.push(14);
            push_count(&mut out, rows.len())?;
            for (text, rank) in rows {
                push_bytes(&mut out, text.as_bytes())?;
                out.push(*rank);
            }
        }
        NativeMessage::State(state) => {
            out.push(15);
            out.extend_from_slice(&state.float_68_bits.to_le_bytes());
            out.extend_from_slice(&[state.byte_8f, u8::from(state.flag_8c)]);
            out.extend_from_slice(&state.word_6c.to_le_bytes());
            out.push(u8::from(state.flag_8d));
            for word in state.words_70 {
                out.extend_from_slice(&word.to_le_bytes());
            }
            out.push(state.heroic_rank);
            out.extend_from_slice(&state.boss_counter.to_le_bytes());
            out.extend_from_slice(&state.float_84_bits.to_le_bytes());
            out.extend_from_slice(&state.float_88_bits.to_le_bytes());
            out.extend_from_slice(&[state.max_equipment_stars, state.active_set]);
            out.extend_from_slice(&state.alive_since_bits.to_le_bytes());
            out.extend_from_slice(&[u8::from(state.flag_8e), state.byte_90]);
            push_bytes(&mut out, state.text.as_bytes())?;
            push_count(&mut out, state.pairs.len())?;
            for pair in &state.pairs {
                for word in pair {
                    out.extend_from_slice(&word.to_le_bytes());
                }
            }
            push_count(&mut out, state.rows.len())?;
            for row in &state.rows {
                out.extend_from_slice(&row.word_00.to_le_bytes());
                out.extend_from_slice(&row.word_04.to_le_bytes());
                out.extend_from_slice(&[row.byte_08, row.kind_09, u8::from(row.flag_0a)]);
            }
            push_words(&mut out, &state.words)?;
            out.push(u8::from(state.coop.is_some()));
            if let Some(coop) = &state.coop {
                push_feat_members(&mut out, &coop.members)?;
                out.extend_from_slice(&coop.word_30.to_le_bytes());
                out.push(u8::from(coop.flag_34));
                push_count(&mut out, coop.events.len())?;
                for event in &coop.events {
                    out.extend_from_slice(&event.word_18.to_le_bytes());
                    out.extend_from_slice(&event.word_1c.to_le_bytes());
                    out.extend_from_slice(&[event.byte_20, event.kind_21, u8::from(event.flag_22)]);
                    push_feat_members(&mut out, &event.members)?;
                }
            }
        }
        NativeMessage::End => out.push(18),
        NativeMessage::Compressed(bytes) => {
            out.push(19);
            push_bytes(&mut out, bytes)?;
        }
        NativeMessage::MarksAndPity { marks_bits, missed_items } => {
            out.push(20);
            out.extend_from_slice(&marks_bits.to_le_bytes());
            push_words(&mut out, missed_items)?;
        }
        NativeMessage::Time(milliseconds) => {
            out.push(21);
            out.extend_from_slice(&milliseconds.to_le_bytes());
        }
    }
    Ok(out)
}

struct Reader<'a> {
    bytes: &'a [u8],
    cursor: usize,
}
impl<'a> Reader<'a> {
    fn take(&mut self, count: usize) -> Result<&'a [u8], WireError> {
        let end = self
            .cursor
            .checked_add(count)
            .ok_or(PacketError::LengthOverflow)?;
        let bytes = self
            .bytes
            .get(self.cursor..end)
            .ok_or(PacketError::Truncated)?;
        self.cursor = end;
        Ok(bytes)
    }
    fn byte(&mut self) -> Result<u8, WireError> {
        Ok(self.take(1)?[0])
    }
    fn word(&mut self) -> Result<u32, WireError> {
        Ok(u32::from_le_bytes(
            self.take(4)?.try_into().expect("four bytes"),
        ))
    }
    fn count(&mut self, minimum_size: usize) -> Result<usize, WireError> {
        let count = self.word()? as usize;
        if count > (self.bytes.len() - self.cursor) / minimum_size.max(1) {
            return Err(PacketError::Truncated.into());
        }
        Ok(count)
    }
    fn bytes(&mut self) -> Result<Vec<u8>, WireError> {
        let length = self.word()? as usize;
        Ok(self.take(length)?.to_vec())
    }
    fn text(&mut self) -> Result<String, WireError> {
        Ok(String::from_utf8_lossy(&self.bytes()?).into_owned())
    }
    fn flag(&mut self) -> Result<bool, WireError> {
        Ok(self.byte()? != 0)
    }
    fn feat_members(&mut self) -> Result<Vec<NativeFeatMember>, WireError> {
        // Native caps before consuming rows; it does not skip excess rows.
        let count = self.count(7)?.min(5);
        (0..count).map(|_| Ok(NativeFeatMember {
            class: self.byte()?,
            word: self.word()?,
            byte: self.byte()?,
            active_set: self.byte()?,
        })).collect()
    }
    fn words(&mut self) -> Result<Vec<u32>, WireError> {
        let count = self.count(4)?;
        (0..count).map(|_| self.word()).collect()
    }
}

/// Decode one message, leaving any native tolerated trailing bytes unconsumed.
pub fn decode_message(bytes: &[u8]) -> Result<(NativeMessage, usize), WireError> {
    let mut reader = Reader { bytes, cursor: 0 };
    let tag = reader.byte()?;
    let message = match tag {
        1..=4 | 6 | 7 | 9 | 16 | 17 | 22..=24 => {
            let (mut value, used) = server_party::decode_lifecycle(bytes)?;
            // The native c600 reader owns lossy String decoding; c940 engine
            // command and compressed payload readers retain arbitrary bytes.
            let normalize = |text: &mut Vec<u8>| {
                *text = String::from_utf8_lossy(text).into_owned().into_bytes();
            };
            let profile = |profile: &mut Option<server_party::NativeRosterProfile>| {
                if let Some(profile) = profile {
                    normalize(&mut profile.bytes_00);
                    normalize(&mut profile.bytes_18);
                    normalize(&mut profile.bytes_30);
                    // Native staff-vouch signature: exactly64 raw bytes.
                }
            };
            match &mut value {
                LifecyclePacket::EventBytes(text) | LifecyclePacket::Denied(text) => {
                    normalize(text);
                }
                LifecyclePacket::Join(request) => {
                    normalize(&mut request.version);
                    normalize(&mut request.password);
                }
                LifecyclePacket::Hero(hero) => {
                    normalize(&mut hero.name);
                    normalize(&mut hero.bytes_18);
                    normalize(&mut hero.key_150);
                    normalize(&mut hero.key_160);
                    normalize(&mut hero.bytes_30);
                    profile(&mut hero.profile);
                    // Native14583ed80 resolves the descriptor, with NULL for
                    // an unknown key; b6fd..b73a clamps instincts>=4 to0.
                    for (key, rank) in [
                        (&mut hero.key_150, &mut hero.rank_158),
                        (&mut hero.key_160, &mut hero.rank_168),
                    ] {
                        if crate::run_effects::loot_companions::definitions()
                            .iter()
                            .any(|row| row.key.as_bytes() == key.as_slice())
                        {
                            if *rank >= 4 {
                                *rank = 0;
                            }
                        } else {
                            key.clear();
                            *rank = 0;
                        }
                    }
                }
                LifecyclePacket::Roster(roster) => {
                    roster.entries.truncate(5);
                    roster.zone = crate::zones::resolve(&roster.zone).key.into();
                    roster.heroic_rank = roster.heroic_rank.min(5);
                    for row in &mut roster.entries {
                        normalize(&mut row.name);
                        normalize(&mut row.country);
                        profile(&mut row.profile);
                    }
                }
                LifecyclePacket::LobbyChat(chat) => {
                    normalize(&mut chat.name);
                    normalize(&mut chat.text);
                }
                _ => {}
            }
            return Ok((NativeMessage::Lifecycle(value), used));
        }
        5 => NativeMessage::ZoneKey(reader.text()?),
        8 => {
            let kind = reader.byte()?;
            let argument = reader.byte()?;
            if kind > 10 {
                return Err(WireError::InvalidControl);
            }
            NativeMessage::Control {
                kind,
                argument: control_argument(kind, argument),
                offer: if matches!(kind, 0 | 3) { reader.word()? } else { 0 },
            }
        }
        10 => NativeMessage::HudJson(reader.text()?),
        25 => {
            let payload = reader.bytes()?;
            let count = reader.count(4)?;
            let mut descriptions = Vec::with_capacity(count);
            for _ in 0..count {
                descriptions.push(reader.text()?);
            }
            NativeMessage::ItemTemplate { payload, descriptions }
        }
        11 => {
            let count = reader.count(24)?;
            let mut rows = Vec::with_capacity(count);
            for _ in 0..count {
                let id = reader.word()?;
                let name = reader.text()?;
                let mut optional = [None, None, None, None];
                for slot in &mut optional {
                    let present = reader.flag()?;
                    let text = reader.text()?;
                    *slot = present.then_some(text);
                }
                rows.push(ResourceRow {
                    id,
                    name,
                    optional,
                    text_18: reader.text()?,
                    text_30: reader.text()?,
                });
            }
            NativeMessage::Resources(rows)
        }
        12 => {
            let count = reader.count(9)?;
            let mut rows = Vec::with_capacity(count);
            for _ in 0..count {
                rows.push(TimerRow {
                    id: reader.word()?,
                    value_bits: reader.word()?,
                    flag: reader.flag()?,
                });
            }
            NativeMessage::Timers(rows)
        }
        13 => {
            let count = reader.count(12)?;
            let mut rows = Vec::with_capacity(count);
            for _ in 0..count {
                rows.push(EquipmentGrant { item_id: reader.word()?, boss_key: reader.word()?,
                    boss_marks_bits: reader.word()? });
            }
            NativeMessage::EquipmentGrants(rows)
        },
        14 => {
            let count = reader.count(5)?;
            let mut rows = Vec::with_capacity(count);
            for _ in 0..count {
                rows.push((reader.text()?, reader.byte()?));
            }
            NativeMessage::StringRanks(rows)
        }
        15 => {
            let float_68_bits = reader.word()?;
            let byte_8f = reader.byte()?;
            let flag_8c = reader.flag()?;
            let word_6c = reader.word()?;
            let flag_8d = reader.flag()?;
            let mut words_70 = [0; 5];
            for word in &mut words_70 {
                *word = reader.word()?;
            }
            let heroic_rank = reader.byte()?;
            let boss_counter = reader.word()?;
            let float_84_bits = reader.word()?;
            let float_88_bits = reader.word()?;
            let max_equipment_stars = reader.byte()?;
            let active_set = reader.byte()?;
            let alive_since_bits = reader.word()?;
            let flag_8e = reader.flag()?;
            let byte_90 = reader.byte()?;
            let text = reader.text()?;
            let count = reader.count(8)?;
            let mut pairs = Vec::with_capacity(count);
            for _ in 0..count {
                pairs.push([reader.word()?, reader.word()?]);
            }
            let count = reader.count(11)?;
            let mut rows = Vec::with_capacity(count);
            for _ in 0..count {
                let word_00 = reader.word()?;
                let word_04 = reader.word()?;
                let byte_08 = reader.byte()?;
                let kind_09 = reader.byte()?;
                rows.push(StateRow {
                    word_00,
                    word_04,
                    byte_08,
                    kind_09: if kind_09 < 4 { kind_09 } else { 0 },
                    flag_0a: reader.flag()?,
                });
            }
            let words = reader.words()?;
            let coop = if reader.flag()? {
                let members = reader.feat_members()?;
                let word_30 = reader.word()?;
                let flag_34 = reader.flag()?;
                let count = reader.count(12)?;
                let mut events = Vec::with_capacity(count);
                for _ in 0..count {
                    let word_18 = reader.word()?;
                    let word_1c = reader.word()?;
                    let byte_20 = reader.byte()?;
                    let kind_21 = reader.byte()?;
                    let flag_22 = reader.flag()?;
                    events.push(NativeFeatEvent {
                        word_18, word_1c, byte_20,
                        kind_21: if kind_21 < 4 { kind_21 } else { 0 },
                        flag_22,
                        members: reader.feat_members()?,
                    });
                }
                Some(NativeCoopFeats { members, word_30, flag_34, events })
            } else {
                None
            };
            NativeMessage::State(NativeState {
                float_68_bits,
                byte_8f,
                flag_8c,
                word_6c,
                flag_8d,
                words_70,
                heroic_rank, boss_counter, max_equipment_stars, active_set, alive_since_bits,
                float_84_bits,
                float_88_bits,
                flag_8e,
                byte_90,
                text,
                pairs,
                rows,
                words,
                coop,
            })
        }
        18 => NativeMessage::End,
        19 => NativeMessage::Compressed(reader.bytes()?),
        20 => NativeMessage::MarksAndPity {
            marks_bits: reader.word()?,
            missed_items: reader.words()?,
        },
        21 => NativeMessage::Time(reader.word()?),
        tag => return Err(PacketError::UnsupportedTag(tag).into()),
    };
    Ok((message, reader.cursor))
}

/// Native queue flush: no frame for empty queues, one direct frame for a single
/// message, raw-DEFLATE compressed tag19 for two or more messages.
pub fn encode_batch(messages: &[NativeMessage]) -> Result<Option<Vec<u8>>, WireError> {
    match messages {
        [] => Ok(None),
        [message] => Ok(Some(encode_message(message)?)),
        _ => {
            let mut plain = Vec::new();
            push_count(&mut plain, messages.len())?;
            for message in messages {
                push_bytes(&mut plain, &encode_message(message)?)?;
            }
            let mut deflate = DeflateEncoder::new(Vec::new(), Compression::new(1));
            deflate.write_all(&plain).map_err(|_| WireError::Deflate)?;
            let compressed = deflate.finish().map_err(|_| WireError::Deflate)?;
            Ok(Some(encode_message(&NativeMessage::Compressed(
                compressed,
            ))?))
        }
    }
}

/// Expand one transport payload. Invalid batch contents are skipped and nested
/// compressed envelopes are discarded, as in native1459c4ae0; outer inflate
/// failure/over-four-MiB returns no accepted messages to the session caller.
pub fn decode_frame(bytes: &[u8]) -> Result<Vec<NativeMessage>, WireError> {
    let (message, _) = decode_message(bytes)?;
    let NativeMessage::Compressed(compressed) = message else {
        return Ok(vec![message]);
    };
    let mut plain = Vec::new();
    DeflateDecoder::new(compressed.as_slice())
        .take((MAX_INFLATED_BATCH + 1) as u64)
        .read_to_end(&mut plain)
        .map_err(|_| WireError::Deflate)?;
    if plain.len() > MAX_INFLATED_BATCH {
        return Err(WireError::InflatedLimit);
    }
    let mut reader = Reader {
        bytes: &plain,
        cursor: 0,
    };
    let count = reader.count(4)?;
    let mut accepted = Vec::new();
    for _ in 0..count {
        let bytes = reader.bytes()?;
        if let Ok((message, _)) = decode_message(&bytes) {
            if !matches!(message, NativeMessage::Compressed(_)) {
                accepted.push(message);
            }
        }
    }
    Ok(accepted)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn native_state_scalar_layout_and_invalid_row_kind_are_exact() {
        let mut bytes = vec![15];
        bytes.extend_from_slice(&1.0_f32.to_le_bytes());
        bytes.extend_from_slice(&[2, 1]);
        bytes.extend_from_slice(&3_u32.to_le_bytes());
        bytes.push(1);
        for value in 4_u32..=8 {
            bytes.extend_from_slice(&value.to_le_bytes());
        }
        bytes.push(5); // Heroic rank, followed by current boss counter.
        bytes.extend_from_slice(&17_u32.to_le_bytes());
        bytes.extend_from_slice(&1.5_f32.to_le_bytes());
        bytes.extend_from_slice(&2.0_f32.to_le_bytes());
        bytes.extend_from_slice(&[4, 6]);
        bytes.extend_from_slice(&12.5_f32.to_le_bytes());
        bytes.extend_from_slice(&[0, 8]);
        bytes.extend_from_slice(&1_u32.to_le_bytes());
        bytes.push(b'z');
        bytes.extend_from_slice(&1_u32.to_le_bytes());
        bytes.extend_from_slice(&11_u32.to_le_bytes());
        bytes.extend_from_slice(&12_u32.to_le_bytes());
        bytes.extend_from_slice(&1_u32.to_le_bytes());
        bytes.extend_from_slice(&13_u32.to_le_bytes());
        bytes.extend_from_slice(&14_u32.to_le_bytes());
        bytes.extend_from_slice(&[15, 255, 2]);
        bytes.extend_from_slice(&1_u32.to_le_bytes());
        bytes.extend_from_slice(&16_u32.to_le_bytes());
        bytes.push(0); // Current optional party-feat context is absent.
        let (NativeMessage::State(state), used) = decode_message(&bytes).unwrap() else {
            panic!("state");
        };
        assert_eq!(used, bytes.len());
        assert_eq!(state.words_70, [4, 5, 6, 7, 8]);
        assert_eq!(state.alive_since_bits, 12.5_f32.to_bits());
        assert_eq!((state.heroic_rank, state.boss_counter, state.max_equipment_stars, state.active_set), (5,17,4,6));
        assert_eq!(state.pairs, [[11, 12]]);
        assert_eq!(
            state.rows,
            [StateRow {
                word_00: 13,
                word_04: 14,
                byte_08: 15,
                kind_09: 0,
                flag_0a: true
            }]
        );
        assert_eq!(state.words, [16]);
        assert_eq!(state.text, "z");
        assert_eq!(
            decode_message(&[8, 7, 255]).unwrap(),
            (
                NativeMessage::Control {
                    kind: 7,
                    argument: 1,
                    offer: 0,
                },
                3
            )
        );
    }

    #[test]
    fn current_party_context_has_exact_wire_order_and_native_byte_rules() {
        // Empty legacy State15 prefix: fixed scalars, empty zone and histories.
        let mut bytes = vec![0; 69];
        bytes[0] = 15;
        bytes.push(2); // Nonzero optional-context flag.
        bytes.extend_from_slice(&1_u32.to_le_bytes());
        bytes.push(11);
        bytes.extend_from_slice(&0x1122_3344_u32.to_le_bytes());
        bytes.push(254); // Member byte is not a native bool.
        bytes.push(6); // Active-set tier plus one.
        bytes.extend_from_slice(&500_u32.to_le_bytes());
        bytes.push(2);
        bytes.extend_from_slice(&1_u32.to_le_bytes());
        bytes.extend_from_slice(&42_u32.to_le_bytes());
        bytes.extend_from_slice(&777_u32.to_le_bytes());
        bytes.extend_from_slice(&[6, 255, 2]);
        bytes.extend_from_slice(&1_u32.to_le_bytes());
        bytes.push(2);
        bytes.extend_from_slice(&888_u32.to_le_bytes());
        bytes.push(253);
        bytes.push(5);
        let (NativeMessage::State(state), used) = decode_message(&bytes).unwrap() else {
            panic!("state");
        };
        assert_eq!(used, bytes.len());
        let coop = state.coop.as_ref().unwrap();
        assert_eq!(coop.members, [NativeFeatMember { class: 11, word: 0x1122_3344, byte: 254, active_set: 6 }]);
        assert_eq!((coop.word_30, coop.flag_34), (500, true));
        assert_eq!(coop.events, [NativeFeatEvent {
            word_18: 42, word_1c: 777, byte_20: 6, kind_21: 0, flag_22: true,
            members: vec![NativeFeatMember { class: 2, word: 888, byte: 253, active_set: 5 }],
        }]);
        let encoded = encode_message(&NativeMessage::State(state)).unwrap();
        // Native bool bytes normalize; source-kind>=4 normalizes only on read.
        for index in [69, 85, 100] { bytes[index] = 1; }
        bytes[99] = 0;
        assert_eq!(encoded, bytes);
    }

    #[test]
    fn party_member_counts_cap_before_consumption_and_absence_requires_flag() {
        let mut bytes = vec![0; 69];
        bytes[0] = 15;
        assert!(decode_message(&bytes).is_err());
        bytes.push(0);
        let (NativeMessage::State(state), _) = decode_message(&bytes).unwrap() else {
            panic!("state");
        };
        assert!(state.coop.is_none());
        bytes[69] = 1;
        bytes.extend_from_slice(&6_u32.to_le_bytes());
        for class in 1..=5 {
            bytes.push(class);
            bytes.extend_from_slice(&100_u32.to_le_bytes());
            bytes.push(255);
            bytes.push(0); // Active-set tier plus one.
        }
        // Only the first five rows are consumed despite advertised count6.
        bytes.extend_from_slice(&123_u32.to_le_bytes());
        bytes.push(0);
        bytes.extend_from_slice(&0_u32.to_le_bytes());
        let (NativeMessage::State(state), used) = decode_message(&bytes).unwrap() else {
            panic!("state");
        };
        assert_eq!(used, bytes.len());
        let coop = state.coop.unwrap();
        assert_eq!(coop.members.len(), 5);
        assert_eq!(coop.word_30, 123);
        assert!(coop.members.iter().all(|member| member.byte == 255));
    }

    #[test]
    fn equipment_grants_keep_boss_serial_base_marks_and_raw_float_bits() {
        let rows = vec![EquipmentGrant { item_id: 101000, boss_key: 7,
            boss_marks_bits: 45.5_f32.to_bits() },
            EquipmentGrant { item_id: 101000, boss_key: u32::MAX,
                boss_marks_bits: 0x7fc01234 }];
        let value = NativeMessage::EquipmentGrants(rows.clone());
        let bytes = encode_message(&value).unwrap();
        let mut expected = vec![13];
        expected.extend_from_slice(&2_u32.to_le_bytes());
        for row in rows {
            expected.extend_from_slice(&row.item_id.to_le_bytes());
            expected.extend_from_slice(&row.boss_key.to_le_bytes());
            expected.extend_from_slice(&row.boss_marks_bits.to_le_bytes());
        }
        assert_eq!(bytes, expected);
        assert_eq!(decode_message(&bytes).unwrap(), (value, bytes.len()));
        assert!(decode_message(&bytes[..bytes.len() - 1]).is_err());
    }

    #[test]
    fn engine_packets_keep_exact_opcode_and_binary_body() {
        let packet = EnginePacket {
            opcode: 0x2d2,
            payload: 888_u32.to_le_bytes().to_vec(),
        };
        let encoded = encode_message(&packet.clone().into_message()).unwrap();
        assert_eq!(encoded, [7, 0xd2, 2, 4, 0, 0, 0, 0x78, 3, 0, 0]);
        assert_eq!(
            decode_message(&encoded).unwrap(),
            (packet.clone().into_message(), encoded.len())
        );
        assert!(matches!(
            packet.decode_server().unwrap().as_slice(),
            [benilla_protocol::SessionEvent::PlaySound { sound_id: 888 }]
        ));
    }

    #[test]
    fn item_template_text_carrier_keeps_binary_payload_and_ordered_lossy_strings() {
        let value = NativeMessage::ItemTemplate { payload: vec![0, 255],
            descriptions: vec!["a".into(), "".into(), "é".into()] };
        let expected = [25, 2, 0, 0, 0, 0, 255, 3, 0, 0, 0,
            1, 0, 0, 0, b'a', 0, 0, 0, 0, 2, 0, 0, 0, 0xc3, 0xa9];
        assert_eq!(encode_message(&value).unwrap(), expected);
        let mut tail = expected.to_vec();
        tail.push(77);
        assert_eq!(decode_message(&tail).unwrap(), (value, expected.len()));
        for count in 0..expected.len() {
            assert!(decode_message(&expected[..count]).is_err(), "truncated at {count}");
        }
    }

    #[test]
    fn all_remaining_wire_tags_and_empty_collections_have_known_vectors() {
        let cases = [
            (
                NativeMessage::ZoneKey("deadmines".into()),
                b"\x05\x09\0\0\0deadmines".to_vec(),
            ),
            (
                NativeMessage::Control {
                    kind: 9,
                    argument: 1,
                    offer: 0,
                },
                vec![8, 9, 1],
            ),
            (
                NativeMessage::Control { kind: 10, argument: 0, offer: 0 },
                vec![8, 10, 0],
            ),
            (
                NativeMessage::HudJson("a".into()),
                vec![10, 1, 0, 0, 0, b'a'],
            ),
            (NativeMessage::Resources(vec![]), vec![11, 0, 0, 0, 0]),
            (NativeMessage::Timers(vec![]), vec![12, 0, 0, 0, 0]),
            (NativeMessage::EquipmentGrants(vec![]), vec![13, 0, 0, 0, 0]),
            (NativeMessage::StringRanks(vec![]), vec![14, 0, 0, 0, 0]),
            (NativeMessage::End, vec![18]),
            (NativeMessage::Time(0x12345678), vec![21, 0x78, 0x56, 0x34, 0x12]),
            (
                NativeMessage::Compressed(vec![0xff]),
                vec![19, 1, 0, 0, 0, 0xff],
            ),
        ];
        for (message, expected) in cases {
            assert_eq!(encode_message(&message).unwrap(), expected);
            assert_eq!(
                decode_message(&expected).unwrap(),
                (message, expected.len())
            );
        }
        assert_eq!(decode_message(&[8, 11, 0]), Err(WireError::InvalidControl));
        assert!(decode_message(&[13, 255, 255, 255, 255]).is_err());
    }

    #[test]
    fn select_and_skip_bind_their_offer_with_exact_control_lengths() {
        for (kind, argument, expected_argument) in [(0, 255, 255), (3, 255, 0)] {
            let message = NativeMessage::Control { kind, argument, offer: 0x1122_3344 };
            let expected = vec![8, kind, expected_argument, 0x44, 0x33, 0x22, 0x11];
            assert_eq!(encode_message(&message).unwrap(), expected);
            assert_eq!(decode_message(&expected).unwrap(), (
                NativeMessage::Control { kind, argument: expected_argument, offer: 0x1122_3344 }, 7,
            ));
            for length in 0..expected.len() {
                assert!(decode_message(&expected[..length]).is_err());
            }
        }
        for kind in [1, 2, 4, 5, 6, 7, 8, 9, 10] {
            for argument in [0, 1, 2, 255] {
                let expected_argument = match kind { 2 => argument, 7..=9 => argument & 1, _ => 0 };
                let message = NativeMessage::Control { kind, argument, offer: u32::MAX };
                let expected = vec![8, kind, expected_argument];
                assert_eq!(encode_message(&message).unwrap(), expected);
                assert_eq!(decode_message(&expected).unwrap(), (
                    NativeMessage::Control { kind, argument: expected_argument, offer: 0 }, 3,
                ));
            }
        }
    }

    #[test]
    fn optional_resource_strings_consume_their_wire_string_when_false() {
        let mut bytes = vec![11, 1, 0, 0, 0, 42, 0, 0, 0, 1, 0, 0, 0, b'n'];
        bytes.extend_from_slice(&[0, 1, 0, 0, 0, b'x']); //absent but still consumed
        bytes.extend_from_slice(&[2, 1, 0, 0, 0, b'y']); //any nonzero bool
        bytes.extend_from_slice(&[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
        bytes.extend_from_slice(&[1, 0, 0, 0, b'a', 1, 0, 0, 0, b'b']);
        let (message, used) = decode_message(&bytes).unwrap();
        assert_eq!(used, bytes.len());
        assert_eq!(
            message,
            NativeMessage::Resources(vec![ResourceRow {
                id: 42,
                name: "n".into(),
                optional: [None, Some("y".into()), None, None],
                text_18: "a".into(),
                text_30: "b".into(),
            }])
        );
    }

    #[test]
    fn batches_bound_inflate_skip_invalid_and_nested_envelopes_and_keep_order() {
        let a = NativeMessage::ZoneKey("deadmines".into());
        let b = NativeMessage::End;
        assert_eq!(encode_batch(&[]).unwrap(), None);
        assert_eq!(encode_batch(&[b.clone()]).unwrap(), Some(vec![18]));
        let frame = encode_batch(&[a.clone(), b.clone()]).unwrap().unwrap();
        assert_eq!(frame[0], 19);
        assert_eq!(decode_frame(&frame).unwrap(), [a.clone(), b.clone()]);
        let nested = NativeMessage::Compressed(vec![0xff]);
        let frame = encode_batch(&[a.clone(), nested, b.clone()])
            .unwrap()
            .unwrap();
        assert_eq!(decode_frame(&frame).unwrap(), [a, b]);
        let mut deflate = DeflateEncoder::new(Vec::new(), Compression::new(1));
        deflate.write_all(&vec![0; MAX_INFLATED_BATCH + 1]).unwrap();
        let outer = encode_message(&NativeMessage::Compressed(deflate.finish().unwrap())).unwrap();
        assert_eq!(decode_frame(&outer), Err(WireError::InflatedLimit));
    }

    #[test]
    fn initial_world_order_omits_receiving_actor_and_ends_with_raid_targets() {
        let packet = |opcode| EnginePacket {
            opcode,
            payload: vec![],
        };
        let actors = [
            [packet(10), packet(11)],
            [packet(20), packet(21)],
            [packet(30), packet(31)],
        ];
        let messages = initial_world_messages([packet(1), packet(2)], &actors, 1, packet(0x321));
        let opcodes = messages
            .iter()
            .map(|message| match message {
                NativeMessage::Lifecycle(LifecyclePacket::EngineCommand { opcode, .. }) => *opcode,
                _ => unreachable!(),
            })
            .collect::<Vec<_>>();
        assert_eq!(opcodes, [1, 2, 10, 11, 30, 31, 0x321]);
    }
}
