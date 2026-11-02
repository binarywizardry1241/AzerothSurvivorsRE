//! Guest Engine text rewrite recovered from the 0.120.0 trust owner.
//! See docs/analysis/coop-trust-0.120.0.md for wire guards and native evidence.

/// Apply only after guest opcode/body-length and receiving-port admission.
pub fn guest_engine_payload(opcode: u16, payload: Vec<u8>) -> Vec<u8> {
    match opcode {
        0x51 => name(payload),
        0x96 => chat(payload),
        _ => payload,
    }
}

fn name(payload: Vec<u8>) -> Vec<u8> {
    let Some(end) = payload
        .get(8..)
        .and_then(|name| name.iter().position(|byte| *byte == 0))
    else {
        return payload;
    };
    let end = 8 + end;
    let mut output = Vec::with_capacity(payload.len());
    output.extend_from_slice(&payload[..8]);
    output.extend(payload[8..end].iter().copied().filter(|byte| *byte != b'|'));
    output.extend_from_slice(&payload[end..]);
    output
}

fn chat(payload: Vec<u8>) -> Vec<u8> {
    if payload.len() < 5 {
        return payload;
    }
    let length_offset = match payload[0] {
        0 | 1 | 5 => 21,
        6 if payload[1..5] != [0xff; 4] => 21,
        8 => 13,
        _ => return payload,
    };
    let text_offset = length_offset + 4;
    let Some(length_bytes) = payload.get(length_offset..text_offset) else {
        return payload;
    };
    let declared = u32::from_le_bytes(length_bytes.try_into().unwrap()) as usize;
    let text_end = text_offset + declared.saturating_sub(1);
    let Some(text) = payload.get(text_offset..text_end) else {
        return payload;
    };
    if std::str::from_utf8(text).is_err() {
        return payload;
    }
    let mut normalized = Vec::with_capacity(text.len());
    let mut bytes = text.iter().copied().peekable();
    while let Some(byte) = bytes.next() {
        normalized.push(byte);
        if byte == b'|' {
            normalized.push(b'|');
            if bytes.peek() == Some(&b'|') {
                bytes.next();
            }
        }
    }
    let mut output = Vec::with_capacity(payload.len() + normalized.len());
    output.extend_from_slice(&payload[..length_offset]);
    // Admitted bodies are shorter than 0xfffe, including the length field.
    output.extend_from_slice(&((normalized.len() + 1) as u32).to_le_bytes());
    output.extend_from_slice(&normalized);
    output.push(0);
    // The native owner neither checks nor requires a terminal NUL. For zero
    // declared length the entire tail survives after the newly inserted NUL.
    output.extend_from_slice(&payload[(text_offset + declared).min(payload.len())..]);
    output
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn matches_original_instruction_vectors() {
        let vectors: serde_json::Value =
            serde_json::from_str(include_str!("../../tests/fixtures/guest-engine-trust.json"))
                .unwrap();
        for vector in vectors.as_array().unwrap() {
            let bytes = |key: &str| {
                vector[key]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|byte| byte.as_u64().unwrap() as u8)
                    .collect::<Vec<_>>()
            };
            assert_eq!(
                guest_engine_payload(vector["opcode"].as_u64().unwrap() as u16, bytes("input")),
                bytes("output"),
                "{}",
                vector["case"]
            );
        }
    }
}
