//! Current Windows IPC worker (140067fc0), frame I/O (14006af20/14006b080).
//! The installed Windows artifact does not specify Unix socket discovery.

use serde_json::{json, Value};
use std::{
    io::{self, Read, Write},
    sync::mpsc::{Receiver, RecvTimeoutError},
    thread,
    time::{Duration, Instant},
};

const CLIENT_ID: &str = "1559232589020012564";
const RECEIVE_INTERVAL: Duration = Duration::from_secs(1);
const SEND_INTERVAL: Duration = Duration::from_secs(4);
const RETRY_INTERVAL: Duration = Duration::from_secs(20);
const MAX_FRAME_BODY: usize = 1_048_576;

pub(super) fn start(receiver: Receiver<Option<Value>>) {
    // The caller starts this only after its first nonempty activity.
    let _ = thread::Builder::new()
        .name("discord-presence".into())
        .spawn(move || worker(receiver));
}

trait Pipe: Read + Write {}
impl<T: Read + Write> Pipe for T {}

fn worker(receiver: Receiver<Option<Value>>) {
    let mut latest = None;
    let mut last_sent = None;
    let mut pipe: Option<Box<dyn Pipe>> = None;
    let mut retry_at = Instant::now();
    let mut last_send: Option<Instant> = None;
    let mut nonce = 0_u64;
    loop {
        match receiver.recv_timeout(RECEIVE_INTERVAL) {
            Ok(activity) => latest = activity,
            Err(RecvTimeoutError::Timeout) => {}
            Err(RecvTimeoutError::Disconnected) => break,
        }
        // Coalesce every queued publication before considering a connection/send.
        for activity in receiver.try_iter() {
            latest = activity;
        }
        let Some(activity) = latest.as_ref() else {
            // Native opt-out closes the IPC connection; no null activity command.
            pipe = None;
            last_sent = None;
            continue;
        };
        if pipe.is_none() {
            if Instant::now() < retry_at {
                continue;
            }
            pipe = connect();
            if pipe.is_none() {
                retry_at = Instant::now() + RETRY_INTERVAL;
                continue;
            }
        }
        if last_sent.as_ref() == Some(activity) {
            continue;
        }
        if last_send.is_some_and(|sent| sent.elapsed().as_secs() < SEND_INTERVAL.as_secs()) {
            continue;
        }
        last_send = Some(Instant::now());
        nonce = nonce.wrapping_add(1);
        let payload = json!({
            "cmd": "SET_ACTIVITY",
            "args": { "pid": std::process::id(), "activity": activity },
            "nonce": nonce.to_string(),
        });
        let connected = pipe.as_mut().expect("connected pipe above");
        let result = write_frame(connected, 1, &payload).and_then(|()| read_frame(connected));
        match result {
            Ok((_opcode, body)) => {
                // An invalid JSON reply is treated like null. ERROR is logged;
                // either reply still records the submitted activity as sent.
                let response: Value = serde_json::from_slice(&body).unwrap_or(Value::Null);
                if response.get("evt").and_then(Value::as_str) == Some("ERROR") {
                    bevy::log::warn!("Discord presence error: {}", response["data"]);
                }
                last_sent = Some(activity.clone());
            }
            Err(_error) => {
                pipe = None;
                last_sent = None;
                retry_at = Instant::now() + RETRY_INTERVAL;
            }
        }
    }
}

fn connect() -> Option<Box<dyn Pipe>> {
    for index in 0..10 {
        let Ok(mut pipe) = open_pipe(index) else {
            continue;
        };
        let handshake = json!({"v": 1, "client_id": CLIENT_ID});
        if write_frame(&mut pipe, 0, &handshake).is_ok()
            && read_frame(&mut pipe).is_ok_and(|(opcode, _)| opcode == 1)
        {
            return Some(pipe);
        }
    }
    None
}

#[cfg(target_os = "windows")]
fn open_pipe(index: u8) -> io::Result<Box<dyn Pipe>> {
    std::fs::OpenOptions::new()
        .read(true)
        .write(true)
        .open(format!(r"\\.\pipe\discord-ipc-{index}"))
        .map(|file| Box::new(file) as Box<dyn Pipe>)
}

#[cfg(not(target_os = "windows"))]
fn open_pipe(_index: u8) -> io::Result<Box<dyn Pipe>> {
    Err(io::Error::new(
        io::ErrorKind::Unsupported,
        "Discord endpoint discovery is recovered for the supplied Windows target only",
    ))
}

fn write_frame(pipe: &mut impl Write, opcode: u32, value: &Value) -> io::Result<()> {
    let body = serde_json::to_vec(value).expect("JSON Value serialization");
    let mut frame = Vec::with_capacity(body.len() + 8);
    frame.extend_from_slice(&opcode.to_le_bytes());
    frame.extend_from_slice(&(body.len() as u32).to_le_bytes());
    frame.extend_from_slice(&body);
    pipe.write_all(&frame)
}

fn read_frame(pipe: &mut impl Read) -> io::Result<(u32, Vec<u8>)> {
    let mut header = [0_u8; 8];
    pipe.read_exact(&mut header)?;
    let opcode = u32::from_le_bytes(header[..4].try_into().expect("four header bytes"));
    let length = u32::from_le_bytes(header[4..].try_into().expect("four header bytes")) as usize;
    if length > MAX_FRAME_BODY {
        return Err(io::Error::new(
            io::ErrorKind::InvalidData,
            "Discord frame exceeds 1 MiB",
        ));
    }
    let mut body = vec![0_u8; length];
    pipe.read_exact(&mut body)?;
    if opcode == 2 {
        return Err(io::Error::new(
            io::ErrorKind::ConnectionAborted,
            "Discord closed IPC",
        ));
    }
    Ok((opcode, body))
}
