//! AS packet-delay adapter recovered from 0.123.0. The resulting packets still
//! use the existing benilla movement/spline consumer.

use super::replication::EnginePacket;
use std::collections::{HashMap, VecDeque};

#[derive(Clone, Copy, Debug)]
struct Spline {
    duration_ms: f64,
    started: f64,
    start: [f32; 3],
    end: [f32; 3],
}

impl Spline {
    fn position(self, now: f64) -> [f32; 3] {
        let fraction = if self.duration_ms > 0.0 {
            (((now - self.started) * 1000.0 / self.duration_ms).max(0.0).min(1.0)) as f32
        } else { 1.0 };
        lerp(self.start, self.end, fraction)
    }
}

/// The monotone sample queue retains the minimum host/local offset over ten
/// seconds. Its excess over that baseline is packet delay, not round-trip time.
#[derive(Debug, Default)]
pub struct Smooth {
    samples: VecDeque<(f64, f64)>,
    delay_ms: f64,
    splines: HashMap<u64, Spline>,
}

impl Smooth {
    pub fn sample(&mut self, host_ms: u32, now: f64) {
        let offset = now * 1000.0 - f64::from(host_ms);
        while self.samples.front().is_some_and(|(at, _)| now - *at > 10.0) {
            self.samples.pop_front();
        }
        while self.samples.back().is_some_and(|(_, previous)| *previous >= offset) {
            self.samples.pop_back();
        }
        self.samples.push_back((now, offset));
        self.delay_ms = (offset - self.samples.front().unwrap().1).max(0.0);
    }

    fn admitted_delay(&self) -> f64 {
        if self.delay_ms < 40.0 { 0.0 } else { self.delay_ms }
    }

    pub fn packet(&mut self, mut packet: EnginePacket, now: f64) -> EnginePacket {
        match packet.opcode {
            0xaa => {
                if let Some(bytes) = packet.payload.get(..8) {
                    self.splines.remove(&u64::from_le_bytes(bytes.try_into().unwrap()));
                }
            }
            0xdd => return self.spline(packet, now),
            opcode if movement_opcode(opcode) => {
                let delay = self.admitted_delay();
                if delay != 0.0 {
                    if let Some((_, offset)) = packed_guid(&packet.payload) {
                        if let Some(body) = packet.payload.get_mut(offset..offset + 24) {
                            let flags = word(body, 0);
                            let forward = u8::from(flags & 1 != 0) as f32 - u8::from(flags & 2 != 0) as f32;
                            let left = u8::from(flags & 4 != 0) as f32 - u8::from(flags & 8 != 0) as f32;
                            let length = forward.hypot(left);
                            if length != 0.0 {
                                let angle = float(body, 20);
                                let cosine = angle.cos();
                                let sine = angle.sin();
                                let distance = ((delay / 1000.0).min(1.0) as f32 * 7.0) / length;
                                let x = float(body, 8) + (forward * cosine - left * sine) * distance;
                                let y = float(body, 12) + (left * cosine + sine * forward) * distance;
                                body[8..12].copy_from_slice(&x.to_le_bytes());
                                body[12..16].copy_from_slice(&y.to_le_bytes());
                            }
                        }
                    }
                }
            }
            _ => {}
        }
        packet
    }

    fn spline(&mut self, packet: EnginePacket, now: f64) -> EnginePacket {
        let Some((guid, offset)) = packed_guid(&packet.payload) else { return packet };
        let Some(body) = packet.payload.get(offset..) else { return packet };
        if body.len() < 17 { return packet; }
        let raw = point(body, 0);
        let id = word(body, 12);
        let prior = self.splines.get(&guid).map(|spline| spline.position(now));
        if body[16] != 0 {
            let start = prior.filter(|position| distance(*position, raw) <= 20.0).unwrap_or(raw);
            let length = distance(start, raw);
            if prior.is_some() && !(length <= 1.0) {
                let duration_ms = f64::from(length / 7.0) * 1000.0;
                self.remember(guid, start, raw, duration_ms, now);
                return spline_packet(guid, start, raw, id, duration_ms);
            }
            self.remember(guid, raw, raw, 0.0, now);
            return packet;
        }
        if body.len() < 41 || word(body, 25) != 1 { return packet; }
        let duration_ms = word(body, 21).max(1);
        let end = point(body, 29);
        let delay = self.admitted_delay();
        let delayed = lerp(raw, end, (delay / f64::from(duration_ms)).min(1.0) as f32);
        let start = prior.filter(|position| distance(*position, delayed) <= 20.0).unwrap_or(delayed);
        if delay == 0.0 && distance(start, raw) < 0.25 {
            self.remember(guid, raw, end, f64::from(duration_ms), now);
            return packet;
        }
        let speed = (distance(raw, end) / (duration_ms as f32 / 1000.0)).max(1.0);
        let duration = (f64::from(distance(start, end) / (speed * 1.6)) * 1000.0)
            .max((f64::from(duration_ms) - delay).max(0.0)).max(1.0);
        self.remember(guid, start, end, duration, now);
        spline_packet(guid, start, end, id, duration)
    }

    fn remember(&mut self, guid: u64, start: [f32; 3], end: [f32; 3], duration_ms: f64, now: f64) {
        self.splines.insert(guid, Spline { duration_ms, started: now, start, end });
    }
}

pub fn movement_opcode(opcode: u16) -> bool {
    ((0xb5..=0xcb).contains(&opcode) && opcode != 0xc7) || matches!(opcode, 0xda | 0xdb | 0xee)
}

fn packed_guid(body: &[u8]) -> Option<(u64, usize)> {
    let mask = *body.first()?;
    let mut offset = 1;
    let mut guid = 0;
    for lane in 0..8 {
        if mask & (1 << lane) != 0 {
            guid |= u64::from(*body.get(offset)?) << (lane * 8);
            offset += 1;
        }
    }
    Some((guid, offset))
}

fn word(body: &[u8], offset: usize) -> u32 {
    u32::from_le_bytes(body[offset..offset + 4].try_into().unwrap())
}
fn float(body: &[u8], offset: usize) -> f32 { f32::from_bits(word(body, offset)) }
fn point(body: &[u8], offset: usize) -> [f32; 3] {
    [float(body, offset), float(body, offset + 4), float(body, offset + 8)]
}
fn distance(a: [f32; 3], b: [f32; 3]) -> f32 { (a[0] - b[0]).hypot(a[1] - b[1]) }
fn lerp(start: [f32; 3], end: [f32; 3], fraction: f32) -> [f32; 3] {
    std::array::from_fn(|axis| fraction * (end[axis] - start[axis]) + start[axis])
}

fn spline_packet(guid: u64, start: [f32; 3], end: [f32; 3], id: u32, duration_ms: f64) -> EnginePacket {
    let mut payload = Vec::new();
    benilla_protocol::wire::write_packed_guid(guid, &mut payload).expect("Vec writes are infallible");
    for coordinate in start { payload.extend_from_slice(&coordinate.to_le_bytes()); }
    payload.extend_from_slice(&id.to_le_bytes());
    payload.push(0);
    payload.extend_from_slice(&0x100u32.to_le_bytes());
    payload.extend_from_slice(&(duration_ms as u32).max(1).to_le_bytes());
    payload.extend_from_slice(&1u32.to_le_bytes());
    for coordinate in end { payload.extend_from_slice(&coordinate.to_le_bytes()); }
    EnginePacket { opcode: 0xdd, payload }
}
