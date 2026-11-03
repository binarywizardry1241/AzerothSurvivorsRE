//! Target-bound AS co-op source. Individual contracts and remaining protocol
//! and gameplay obligations are recorded in docs/analysis/coop-0.115.0.md.

pub mod game_party;
pub mod party_frames;
pub mod scaling;
pub mod client_state;
pub mod engine_packets;
pub mod reconnection;
pub mod replication;
pub mod relay;
pub mod relay_lifetime;
pub mod route;
pub mod server_party;
pub mod session;
pub mod tcp;
pub mod trust;
pub mod smooth;
pub mod pick;
pub mod readycheck;
pub mod directory;
pub mod directory_wire;
pub mod directory_refresh;
pub mod directory_lifetime;
pub mod websocket;

pub mod bootstrap;
pub mod service;
pub mod staff;
