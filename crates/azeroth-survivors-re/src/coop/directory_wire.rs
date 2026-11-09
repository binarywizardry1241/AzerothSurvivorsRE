//! Public directory Binary responses; base recovery is 0.115.0.
//! Current rank extension/eligibility: docs/analysis/coop-selection-0.123.0.md.
//!
//! Current 0.123.0 selection metadata: docs/analysis/coop-selection-0.123.0.md.
//! Wire owner145b7af90 and menu projection145997f80 are separate: `opened`
//! comes from the local selected class's zone progression, while `open` and
//! `locked` come from two independent service flags. See the hash-bound
//! `coop-directory-response` evidence; the protocol has no JSON envelope.

use serde_json::{Value, json};

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct WireLobby {
    pub code: String,
    pub name: String,
    pub description: String,
    pub hero: String,
    pub class_id: u8,
    pub zone_key: String,
    pub players: u8,
    pub locked: bool,
    pub open: bool,
    pub country: String,
    pub classes: Vec<u8>,
    pub host_title: String,
    pub max: u8,
    /// Optional current extension; legacy rows retain unknown difficulty.
    pub heroic_rank: Option<u8>,
    pub hyper: bool,
}

/// Positional payloads retain their native widths without assigning meanings
/// to fields whose service-policy consumer is owned separately.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum DirectoryResponse {
    Lobbies(Vec<WireLobby>),
    Text {
        tag: u8,
        text: String,
    },
    Number {
        tag: u8,
        value: u32,
    },
    Bytes {
        value: u32,
        bytes: Vec<u8>,
    },
    /// Current service33: country metadata keyed independently by service peer ID.
    Country { peer: u32, country: String },
    Unit,
    Structured29 {
        strings: [String; 3],
        numbers: [u64; 2],
        bytes: Vec<u8>,
    },
    Structured30 {
        strings: [String; 3],
        numbers: [u64; 2],
        value: u32,
        bytes: Vec<u8>,
    },
}

struct Reader<'a> {
    bytes: &'a [u8],
    at: usize,
}

impl<'a> Reader<'a> {
    fn take(&mut self, count: usize) -> Option<&'a [u8]> {
        let end = self.at.checked_add(count)?;
        let bytes = self.bytes.get(self.at..end)?;
        self.at = end;
        Some(bytes)
    }
    fn u8(&mut self) -> Option<u8> {
        Some(self.take(1)?[0])
    }
    fn u32(&mut self) -> Option<u32> {
        Some(u32::from_le_bytes(self.take(4)?.try_into().ok()?))
    }
    fn u64(&mut self) -> Option<u64> {
        Some(u64::from_le_bytes(self.take(8)?.try_into().ok()?))
    }
    fn bytes(&mut self) -> Option<Vec<u8>> {
        let length = self.u32()? as usize;
        Some(self.take(length)?.to_vec())
    }
    fn string(&mut self) -> Option<String> {
        Some(String::from_utf8_lossy(&self.bytes()?).into_owned())
    }
}

/// Decode one Binary message. Unknown tags and truncated mandatory fields are
/// rejected; the native decoder accepts unused trailing bytes.
pub fn decode_response(bytes: &[u8]) -> Option<DirectoryResponse> {
    let mut reader = Reader { bytes, at: 0 };
    let tag = reader.u8()?;
    Some(match tag {
        20 => {
            let count = reader.u32()? as usize;
            // Native's count guard uses a 30-byte lower bound before decoding
            // the variable records, and rejects rather than reserving blindly.
            if count > (bytes.len() - reader.at) / 30 {
                return None;
            }
            let mut rows = Vec::with_capacity(count);
            for _ in 0..count {
                rows.push(WireLobby {
                    code: reader.string()?,
                    name: reader.string()?,
                    description: reader.string()?,
                    hero: reader.string()?,
                    class_id: reader.u8()?,
                    zone_key: reader.string()?,
                    players: reader.u8()?,
                    locked: reader.u8()? != 0,
                    open: reader.u8()? != 0,
                    country: reader.string()?,
                    classes: reader.bytes()?,
                    host_title: reader.string()?,
                    max: 5,
                    heroic_rank: None,
                    hyper: false,
                });
            }
            // Optional extension after the ENTIRE row vector, not within rows.
            for row in &mut rows {
                if let Some(max) = reader.u8() {
                    row.max = max.clamp(1, 5);
                }
            }
            // Rank extensions follow the complete capacity extension vector.
            for row in &mut rows {
                if let Some(rank) = reader.u8() {
                    row.heroic_rank = Some(rank.min(5));
                }
            }
            for row in &mut rows {
                row.hyper = reader.u8().is_some_and(|value| value != 0);
            }
            DirectoryResponse::Lobbies(rows)
        }
        21 | 22 | 23 | 27 => DirectoryResponse::Text {
            tag,
            text: reader.string()?,
        },
        24 | 25 | 31 | 32 => DirectoryResponse::Number {
            tag,
            value: reader.u32()?,
        },
        26 => DirectoryResponse::Bytes {
            value: reader.u32()?,
            bytes: reader.bytes()?,
        },
        33 => DirectoryResponse::Country { peer: reader.u32()?, country: reader.string()? },
        28 => DirectoryResponse::Unit,
        29 => {
            let first = reader.string()?;
            let first_number = reader.u64()?;
            let second = reader.string()?;
            let third = reader.string()?;
            let second_number = reader.u64()?;
            DirectoryResponse::Structured29 {
                strings: [first, second, third],
                numbers: [first_number, second_number],
                bytes: reader.bytes()?,
            }
        }
        30 => {
            let prefix = reader.string()?;
            let first = reader.string()?;
            let first_number = reader.u64()?;
            let value = reader.u32()?;
            let second = reader.string()?;
            let second_number = reader.u64()?;
            DirectoryResponse::Structured30 {
                strings: [prefix, first, second],
                numbers: [first_number, second_number],
                value,
                bytes: reader.bytes()?,
            }
        }
        _ => return None,
    })
}

/// Project the received records at the session-to-menu boundary. The caller
/// supplies display names from its active locale and the selected local class's
/// saved unlock count. Player names, descriptions and country stay literal.
pub fn lobbies_message(
    rows: &[WireLobby],
    open_zones: u64,
    hyper_unlocked: bool,
    class_name: impl Fn(u8) -> String,
    zone_name: impl Fn(&str) -> String,
    heroic_cap: impl Fn(&str) -> u8,
    difficulty_name: impl Fn(u8, bool) -> String,
) -> Value {
    let zones = crate::guardians::catalog::ZONES;
    let list: Vec<_> = rows
        .iter()
        .map(|row| {
            let zone_index = zones.iter().position(|zone| zone.key == row.zone_key);
            let zone = if zone_index.is_some() {
                zone_name(&row.zone_key)
            } else {
                row.zone_key.clone()
            };
            // Native147339e20 rejects invalid class IDs rather than defaulting them
            // to warrior as the independently recovered party-meter path does.
            let class = if (1..=11).contains(&row.class_id)
                && (0x5df_u16 & (1 << (row.class_id - 1))) != 0
            {
                class_name(row.class_id)
            } else {
                String::new()
            };
            let zone_opened =
                (zone_index.unwrap_or(0) as u64) < open_zones.clamp(1, crate::zones::COUNT as u64);
            let rank_opened = row.heroic_rank.unwrap_or(0) <= heroic_cap(&row.zone_key);
            let mode_opened = !row.hyper || hyper_unlocked;
            let lacks = if !zone_opened { "zone" }
                else if !rank_opened { "heroic" }
                else if !mode_opened { "hyper" }
                else { "" };
            json!({
                "code": row.code, "name": row.name, "description": row.description,
                "hostTitle": row.host_title, "classes": row.classes, "hero": row.hero,
                "class": class, "zone": zone,
                "opened": zone_opened && rank_opened && mode_opened, "lacks": lacks,
                "heroic": row.heroic_rank.map_or(-1, i64::from),
                "difficulty": row.heroic_rank.map(|rank| difficulty_name(rank, row.hyper)).unwrap_or_default(),
                "players": row.players, "max": row.max,
                "locked": row.locked, "open": row.open, "country": row.country,
            })
        })
        .collect();
    json!({"type": "lobbies", "list": list})
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn country_updates_keep_the_peer_and_sized_utf8_string() {
        let wire = [33, 7, 0, 0, 0, 2, 0, 0, 0, b'G', b'B'];
        assert_eq!(decode_response(&wire), Some(DirectoryResponse::Country {
            peer: 7, country: "GB".into(),
        }));
        for length in 0..wire.len() { assert_eq!(decode_response(&wire[..length]), None); }
    }

    fn string(bytes: &mut Vec<u8>, text: &[u8]) {
        bytes.extend_from_slice(&(text.len() as u32).to_le_bytes());
        bytes.extend_from_slice(text);
    }
    fn row(bytes: &mut Vec<u8>, code: &[u8]) {
        for value in [code, b"Name", b"Description", b"Hero"] {
            string(bytes, value);
        }
        bytes.push(8);
        string(bytes, b"duskwood");
        bytes.extend_from_slice(&[255, 2, 0]);
        string(bytes, b"GB");
        string(bytes, &[1, 8, 255]);
        string(bytes, b"Title");
    }

    #[test]
    fn capacity_extension_follows_all_rows_and_legacy_default_is_five() {
        let mut bytes = vec![20, 2, 0, 0, 0];
        row(&mut bytes, b"A");
        row(&mut bytes, b"B");
        let DirectoryResponse::Lobbies(rows) = decode_response(&bytes).unwrap() else {
            panic!()
        };
        assert_eq!(rows.iter().map(|row| row.max).collect::<Vec<_>>(), [5, 5]);
        bytes.extend_from_slice(&[0, 255, 99, 2]);
        let DirectoryResponse::Lobbies(rows) = decode_response(&bytes).unwrap() else {
            panic!()
        };
        assert_eq!(rows.iter().map(|row| row.max).collect::<Vec<_>>(), [1, 5]);
        assert_eq!(rows.iter().map(|row| row.heroic_rank).collect::<Vec<_>>(), [Some(5), Some(2)]);
        assert!(rows.iter().all(|row| !row.hyper));
        assert_eq!(
            (rows[0].players, rows[0].locked, rows[0].open),
            (255, true, false)
        );
        bytes.push(2); // Nonzero Hyper byte for only the first row.
        let DirectoryResponse::Lobbies(rows) = decode_response(&bytes).unwrap() else {
            panic!()
        };
        assert_eq!(rows.iter().map(|row| row.hyper).collect::<Vec<_>>(), [true, false]);
    }

    #[test]
    fn mandatory_truncation_rejects_and_lossy_utf8_preserves_packet() {
        let mut bytes = vec![20, 1, 0, 0, 0];
        row(&mut bytes, &[0xff]);
        for end in 0..bytes.len() {
            assert!(decode_response(&bytes[..end]).is_none());
        }
        let DirectoryResponse::Lobbies(rows) = decode_response(&bytes).unwrap() else {
            panic!()
        };
        assert_eq!(rows[0].code, "\u{fffd}");
        assert!(decode_response(&[19]).is_none());
        assert_eq!(decode_response(&[28, 99]), Some(DirectoryResponse::Unit));
    }

    #[test]
    fn reconnection_controls_require_a_peer_and_accept_an_unused_suffix() {
        for tag in [31, 32] {
            for value in [0, 1, u32::MAX] {
                let mut bytes = vec![tag];
                bytes.extend_from_slice(&value.to_le_bytes());
                for end in 0..5 {
                    assert!(decode_response(&bytes[..end]).is_none());
                }
                let expected = Some(DirectoryResponse::Number { tag, value });
                assert_eq!(decode_response(&bytes), expected);
                bytes.extend_from_slice(&[0xff, 0, 99]);
                assert_eq!(decode_response(&bytes), expected);
            }
        }
    }

    #[test]
    fn eligibility_uses_local_unlocks_independently_of_service_open_and_lock() {
        let mut bytes = vec![20, 1, 0, 0, 0];
        row(&mut bytes, b"A");
        let DirectoryResponse::Lobbies(mut rows) = decode_response(&bytes).unwrap() else {
            panic!()
        };
        let message = lobbies_message(&rows, 1, false, |_| "Mage".into(), |_| "Duskwood".into(), |_| 0, |_, _| "Normal".into());
        assert_eq!(message["list"][0]["opened"], false);
        assert_eq!(message["list"][0]["locked"], true);
        assert_eq!(message["list"][0]["open"], false);
        assert_eq!(message["list"][0]["class"], "Mage");
        rows[0].zone_key = "unknown".into();
        rows[0].class_id = 6;
        let message = lobbies_message(&rows, 0, false, |_| panic!(), |_| panic!(), |_| 0, |_, _| "Normal".into());
        assert_eq!(message["list"][0]["opened"], true);
        assert_eq!(message["list"][0]["class"], "");
        assert_eq!(message["list"][0]["zone"], "unknown");
    }
    #[test]
    fn unknown_difficulty_and_each_class_unlock_denial_stay_distinct() {
        let mut bytes = vec![20, 1, 0, 0, 0];
        row(&mut bytes, b"A");
        let DirectoryResponse::Lobbies(mut rows) = decode_response(&bytes).unwrap() else { panic!() };
        assert_eq!(rows[0].heroic_rank, None);
        let project = |rows: &[WireLobby], zones, cap, earned| lobbies_message(
            rows, zones, earned, |_| "Mage".into(), |_| "Duskwood".into(), |_| cap,
            |rank, hyper| if hyper { format!("rank{rank} · Hyper") } else { format!("rank{rank}") });
        let unknown = project(&rows, 12, 0, false);
        assert_eq!(unknown["list"][0]["heroic"], -1);
        assert_eq!(unknown["list"][0]["difficulty"], "");
        rows[0].heroic_rank = Some(3);
        rows[0].hyper = true;
        let zone_lock = project(&rows, 1, 0, false);
        assert_eq!(zone_lock["list"][0]["lacks"], "zone");
        let rank_lock = project(&rows, 12, 2, false);
        assert_eq!(rank_lock["list"][0]["lacks"], "heroic");
        assert_eq!(rank_lock["list"][0]["opened"], false);
        let hyper_lock = project(&rows, 12, 3, false);
        assert_eq!(hyper_lock["list"][0]["lacks"], "hyper");
        assert_eq!(hyper_lock["list"][0]["opened"], false);
        let allowed = project(&rows, 12, 3, true);
        assert_eq!(allowed["list"][0]["lacks"], "");
        assert_eq!(allowed["list"][0]["opened"], true);
        assert_eq!(allowed["list"][0]["difficulty"], "rank3 · Hyper");
    }

}
