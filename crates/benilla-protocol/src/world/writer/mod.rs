//! The world session's write half: [`WorldWriter`] and one method per thing the player can do.
//! Each family module mirrors its namesake in `crate::messages`, which builds the bodies.

use std::net::TcpStream;

use anyhow::Result;
use benilla_srp::vanilla_header::EncrypterHalf;

use super::send_packet;

mod account_data;
mod action_bar;
mod area_trigger;
mod attack;
mod auction;
mod bank;
mod battlefield;
mod binder;
mod channel;
mod chat;
mod console_commands;
mod death;
mod duel;
mod gameobject;
mod gm_ticket;
mod gossip;
mod group;
mod guild;
mod instance;
mod items;
mod lifecycle;
mod loot;
mod mail;
mod meeting_stone;
mod names;
mod pet;
mod petition;
mod player_flags;
mod pose;
mod progression;
mod pvp;
mod quest;
mod reputation;
mod selection;
mod self_movement;
mod skills;
mod social;
mod spells;
mod stable;
mod summon;
mod tabard;
mod taxi;
mod trade;
mod trainer;
mod tutorial;
mod unserved;
mod vendor;

/// Write half of a split [`WorldSession`](super::WorldSession): a cloned socket and the encrypter.
/// Movement sends need the active player confirmed as mover first
/// ([`WorldSession::set_active_mover`](super::WorldSession::set_active_mover)). Positions are raw
/// WoW yards; `orientation` is radians.
pub struct WorldWriter {
    pub(super) transport: WriterTransport,
    /// The character's faction language, set at login from its race, which a chat send naming no
    /// language carries. vmangos drops the whole message, dot-commands included, when the
    /// character does not know the language.
    pub(super) chat_language: u32,
    pub(super) traffic: std::sync::Arc<super::LinkTraffic>,
}

pub(super) enum WriterTransport {
    Socket { stream: TcpStream, encrypter: EncrypterHalf },
    /// An embedding owns framing; retain the ordinary verb/body encoders.
    Packets(Box<dyn FnMut(u16, &[u8]) -> Result<()> + Send>),
}

impl WorldWriter {
    /// Deliver ordinary CMSG bodies to an embedding transport without a socket,
    /// authentication, encryption or WoW TCP header. AS's tag7 supplies framing.
    pub fn packets(chat_language: u32,
        sink: impl FnMut(u16, &[u8]) -> Result<()> + Send + 'static) -> Self {
        Self { transport: WriterTransport::Packets(Box::new(sink)), chat_language,
            traffic: std::sync::Arc::new(super::LinkTraffic::new()) }
    }

    /// Frame, encrypt and write one packet: the sole write path every verb goes through.
    fn send(&mut self, opcode: u16, body: &[u8]) -> Result<()> {
        match &mut self.transport {
            WriterTransport::Socket { stream, encrypter } =>
                send_packet(stream, Some(encrypter), &self.traffic, opcode, body),
            WriterTransport::Packets(sink) => sink(opcode, body),
        }
    }
}
