//! Current0.127.0 authenticated co-op staff titles.
//! Native vouch verification and UI consumers: coop-lobby-ui-0.127.0.md.
use super::server_party::{NativeRosterEntry, NativeRosterProfile};
use ed25519_dalek::{Signature, VerifyingKey};
use std::sync::OnceLock;

const DOMAIN: &[u8] = b"azeroth-coop vouch v1\0";
const PUBLIC_KEY: [u8; 32] = [
    0xbc, 0x6a, 0x6d, 0xd5, 0x54, 0x75, 0x67, 0x00,
    0x63, 0x2f, 0x16, 0xe2, 0x4d, 0xdb, 0xbd, 0xd3,
    0xec, 0xbe, 0x16, 0xf3, 0x0e, 0xe9, 0x64, 0x66,
    0x24, 0x2b, 0x2c, 0xcd, 0xfc, 0xcc, 0xfc, 0x0e,
];

fn message(profile: &NativeRosterProfile) -> Vec<u8> {
    let mut bytes = DOMAIN.to_vec();
    for field in [&profile.bytes_00, &profile.bytes_18, &profile.bytes_30] {
        bytes.extend(field.iter().copied().filter(|byte| *byte != 0));
        bytes.push(0);
    }
    bytes.extend_from_slice(&profile.value_60.to_le_bytes());
    bytes.extend_from_slice(&profile.value_68.to_le_bytes());
    bytes
}

fn title_with_key(row: &NativeRosterEntry, roster: &[NativeRosterEntry],
    service_code: Option<&str>, now: u64, key: &VerifyingKey) -> Option<String> {
    let code = service_code?;
    if code.is_empty() { return None; }
    let profile = row.profile.as_ref()?;
    if profile.bytes_00 != code.as_bytes() || profile.bytes_18 != row.name
        || profile.value_60 != row.hero_identity || now >= profile.value_68
        || profile.bytes_30.is_empty()
        || roster.iter().filter(|other| other.hero_identity == row.hero_identity).count() != 1 {
        return None;
    }
    // This lane is raw signature bytes, not a UTF-8/hex/base64 string.
    let signature = Signature::from_slice(&profile.bytes_48).ok()?;
    key.verify_strict(&message(profile), &signature).ok()?;
    Some(String::from_utf8_lossy(&profile.bytes_30).chars()
        .filter(|character| !character.is_control()).take(24).collect())
}

/// The caller supplies a code only while the actual service handle exists.
/// Presence, current party code, identity, expiry and strict signature checks
/// are independent; connection readiness is not a vouch gate.
pub fn title(row: &NativeRosterEntry, roster: &[NativeRosterEntry],
    service_code: Option<&str>, now: u64) -> Option<String> {
    static KEY: OnceLock<VerifyingKey> = OnceLock::new();
    let key = KEY.get_or_init(|| VerifyingKey::from_bytes(&PUBLIC_KEY)
        .expect("native staff public key"));
    title_with_key(row, roster, service_code, now, key)
}

///1402de390 uses the unwrapped Time elapsed seconds and complete entity bits.
pub fn name_color(entity_bits: u64, elapsed_secs: f32) -> [f32; 4] {
    let factor = (((entity_bits % 7) as f32 * 0.6 + elapsed_secs * 3.2).sin() * 0.5) + 0.5;
    let low = [0.56, 0.27, 0.98, 1.];
    let high = [0.86, 0.66, 1., 1.];
    std::array::from_fn(|index| low[index] * (1. - factor) + high[index] * factor)
}

#[cfg(test)]
mod tests {
    use super::*;
    use ed25519_dalek::{Signer, SigningKey};

    fn signed_row(title: &[u8]) -> (NativeRosterEntry, VerifyingKey) {
        let signing = SigningKey::from_bytes(&[7; 32]);
        let mut profile = NativeRosterProfile {
            bytes_00: b"PARTY".to_vec(), bytes_18: "朋友".as_bytes().to_vec(),
            bytes_30: title.to_vec(), value_60: 42, value_68: 100,
            bytes_48: Vec::new(),
        };
        profile.bytes_48 = signing.sign(&message(&profile)).to_bytes().to_vec();
        (NativeRosterEntry { hero_identity: 42, name: profile.bytes_18.clone(),
            class: 8, race: 1, profile: Some(profile), achievement_points: 0,
            eligible: true, ping_ms: None, country: Vec::new(), inspection: None }, signing.verifying_key())
    }

    #[test]
    fn authenticated_title_binds_service_code_identity_name_expiry_and_unique_roster_identity() {
        let (row, key) = signed_row(b"Guide");
        assert_eq!(title_with_key(&row, &[row.clone()], Some("PARTY"), 99, &key), Some("Guide".into()));
        for (code, now) in [(None, 99), (Some(""), 99), (Some("OTHER"), 99), (Some("PARTY"), 100)] {
            assert_eq!(title_with_key(&row, &[row.clone()], code, now, &key), None);
        }
        assert_eq!(title_with_key(&row, &[row.clone(), row.clone()], Some("PARTY"), 99, &key), None);
        for change in 0..4 {
            let mut bad = row.clone();
            match change {
                0 => bad.hero_identity = 43,
                1 => bad.name.push(b'x'),
                2 => bad.profile.as_mut().unwrap().bytes_30.push(b'x'),
                _ => { bad.profile.as_mut().unwrap().bytes_48.pop(); },
            }
            assert_eq!(title_with_key(&bad, &[bad.clone()], Some("PARTY"), 99, &key), None);
        }
    }

    #[test]
    fn preimage_strips_all_nuls_but_sanitization_counts_only_retained_unicode_scalars() {
        let (row, key) = signed_row(format!("\0\t{}", "友\u{7f}🐉\u{9f}".repeat(20)).as_bytes());
        let profile = row.profile.as_ref().unwrap();
        let mut expected = DOMAIN.to_vec();
        expected.extend_from_slice(b"PARTY\0");
        expected.extend_from_slice("朋友\0".as_bytes());
        expected.extend(profile.bytes_30.iter().copied().filter(|byte| *byte != 0));
        expected.push(0);
        expected.extend_from_slice(&42u64.to_le_bytes());
        expected.extend_from_slice(&100u64.to_le_bytes());
        assert_eq!(message(profile), expected);
        assert_eq!(title_with_key(&row, &[row.clone()], Some("PARTY"), 99, &key),
            Some("友🐉".repeat(12)));
    }

    #[test]
    fn strict_verification_rejects_a_weak_key_forgery() {
        let (mut row, _) = signed_row(b"Guide");
        let mut weak = [0; 32]; weak[0] = 1;
        let key = VerifyingKey::from_bytes(&weak).unwrap();
        let profile = row.profile.as_mut().unwrap();
        profile.bytes_48 = vec![0; 64]; profile.bytes_48[0] = 1;
        assert_eq!(title_with_key(&row, &[row.clone()], Some("PARTY"), 99, &key), None);
    }
}
