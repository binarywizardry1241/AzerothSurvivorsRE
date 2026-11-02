//! Hero name production and selected-target validation.
//! Current Unicode validation/input: docs/analysis/hero-names-0.127.0.md.
//! Random fragments retain their separately recovered historical provenance.
use serde::Deserialize;
use std::{
    sync::OnceLock,
    time::{SystemTime, UNIX_EPOCH},
};

#[derive(Deserialize)]
struct Fragments {
    prefix: Vec<String>,
    middle: Vec<String>,
    suffix: Vec<String>,
}
fn fragments() -> &'static Fragments {
    static DATA: OnceLock<Fragments> = OnceLock::new();
    DATA.get_or_init(|| {
        serde_json::from_str(include_str!("../assets/hero-name.json"))
            .expect("native name fragments")
    })
}
fn next(state: &mut u64) -> u64 {
    *state ^= *state << 13;
    *state ^= *state >> 7;
    *state ^= *state << 17;
    *state
}
/// The native generator is independent of class, race and sex.
pub fn random() -> String {
    let seed = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|duration| duration.as_nanos() as u64 ^ 0x9e3779b97f4a7c15)
        .unwrap_or(0x9e3779b97f4a7c12);
    from_seed(seed)
}
/// Apply the target's integer operations to a clock-derived seed; useful for deterministic proof.
fn from_seed(mut seed: u64) -> String {
    let data = fragments();
    let prefix = &data.prefix[(next(&mut seed) % 20) as usize];
    let middle = &data.middle[(next(&mut seed) & 15) as usize];
    let suffix = &data.suffix[(next(&mut seed) % 10) as usize];
    format!("{prefix}{middle}{suffix}")
        .chars()
        .take(12)
        .collect()
}
/// Selected0.127.0 names accept 2..20 supported Unicode scalar values and
/// at most one interior ASCII space, after Unicode whitespace is trimmed.
pub fn normalize(value: &str) -> Option<String> {
    normalize_roster(value).ok()
}

/// Preserve the validator's rejection order and the packet36 result table.
/// A bad character takes precedence over length; repeated spaces precede the
/// two-word limit, which in turn precedes the 2..20-character check.
pub fn normalize_roster(value: &str) -> Result<String, u8> {
    let value = value.trim();
    if value.is_empty() {
        return Err(0x45);
    }
    if !value.chars().all(|ch| is_name_letter(ch) || ch == ' ') {
        return Err(0x48);
    }
    if value.contains("  ") {
        return Err(0x50);
    }
    if value.bytes().filter(|byte| *byte == b' ').count() > 1 {
        return Err(0x4f);
    }
    match value.chars().count() {
        1 => Err(0x46),
        21.. => Err(0x47),
        _ => Ok(titlecase(value)),
    }
}
/// Selected0.127.0 145b20ed0 changes Unicode case one scalar at a time.
/// A case expansion (such as uppercase sharp-s or lowercase dotted-I) keeps
/// the original scalar; spaces restart the first-letter uppercase rule.
pub fn titlecase(value: &str) -> String {
    let mut result = String::with_capacity(value.len());
    let mut capitalize = true;
    for ch in value.chars() {
        result.push(if capitalize { single_case(ch, ch.to_uppercase()) }
            else { single_case(ch, ch.to_lowercase()) });
        capitalize = ch == ' ';
    }
    result
}

fn single_case(original: char, mut mapped: impl Iterator<Item = char>) -> char {
    let first = mapped.next().unwrap_or(original);
    if mapped.next().is_none() { first } else { original }
}

/// Exact selected0.127.0 145b20840 Unicode Alphabetic/script intersection.
/// Store the native admitted intervals so host Unicode updates cannot widen
/// the naming rule. This list is exhaustively checked against the BMP predicate.
fn is_name_letter(ch: char) -> bool {
    let scalar = u32::from(ch);
    NAME_LETTER_RANGES.iter().any(|&(start, end)| (start..=end).contains(&scalar))
}

const NAME_LETTER_RANGES: &[(u32, u32)] = &[
    (0x41, 0x5a),
    (0x61, 0x7a),
    (0xc0, 0xd6),
    (0xd8, 0xf6),
    (0xf8, 0xff),
    (0x102, 0x107),
    (0x10c, 0x10f),
    (0x118, 0x11b),
    (0x11e, 0x11f),
    (0x130, 0x130),
    (0x141, 0x144),
    (0x147, 0x148),
    (0x152, 0x153),
    (0x158, 0x15b),
    (0x15e, 0x161),
    (0x164, 0x165),
    (0x16e, 0x16f),
    (0x178, 0x17e),
    (0x218, 0x21b),
    (0x401, 0x401),
    (0x404, 0x404),
    (0x406, 0x407),
    (0x410, 0x44f),
    (0x451, 0x451),
    (0x454, 0x454),
    (0x456, 0x457),
    (0x490, 0x491),
    (0x3005, 0x3005),
    (0x3041, 0x3096),
    (0x309d, 0x309f),
    (0x30a1, 0x30fa),
    (0x30fc, 0x30ff),
    (0x3400, 0x4dbf),
    (0x4e00, 0x9fff),
    (0xac00, 0xd7a3),
    (0xf900, 0xfa6d),
    (0xfa70, 0xfad9),
];

/// Selected0.127.0 1401e0ba0 admits supported letters below 20 scalars, plus
/// a single non-leading space while enough room remains for the next word.
pub fn append(name: &mut String, text: &str) {
    for ch in text.chars() {
        let count = name.chars().count();
        if is_name_letter(ch) && count < 20
            || ch == ' ' && (1..=18).contains(&count) && !name.contains(' ')
        {
            name.push(ch);
        }
    }
}
#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn normalization_matches_native_validator() {
        assert_eq!(normalize(" changed ").as_deref(), Some("Changed"));
        assert_eq!(normalize("ARyaTH").as_deref(), Some("Aryath"));
        assert_eq!(normalize("\u{2003}aRyA sTaR\u{3000}").as_deref(), Some("Arya Star"));
        assert_eq!(normalize("abcdefghijklmnopqrst").as_deref(), Some("Abcdefghijklmnopqrst"));
        for input in ["A", "123", "A B C", "A  B", "Αβ", "e\u{301}", "abcdefghijklmnopqrstu"] {
            assert!(normalize(input).is_none());
        }
    }
    #[test]
    fn selected_native_unicode_name_vectors() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.127.0/hero-names/native-cases.json"
        )).unwrap();
        for case in proof["normalizations"].as_array().unwrap() {
            let value = case["value"].as_str().unwrap();
            assert_eq!(normalize(value).as_deref(), case["normalized"].as_str());
            let status = case["status"].as_u64().unwrap() as usize;
            if status != 255 {
                assert_eq!(normalize_roster(value), Err([0x45,0x46,0x47,0x48,0x4f,0x50][status]));
            }
        }
        for case in proof["titlecase"].as_array().unwrap() {
            assert_eq!(titlecase(case[0].as_str().unwrap()), case[1].as_str().unwrap());
        }
        for case in proof["appends"].as_array().unwrap() {
            let mut value = case[0].as_str().unwrap().to_owned();
            append(&mut value, case[1].as_str().unwrap());
            assert_eq!(value, case[2].as_str().unwrap());
        }
        let mut value = "汉".repeat(19);
        append(&mut value, "字文😀");
        assert_eq!(value, format!("{}字", "汉".repeat(19)),
            "a committed IME batch applies native admission to each scalar");
        assert_eq!(titlecase("ßA Iİ"), "ßa Iİ");
    }
    #[test]
    fn fragment_generator_matches_native_integer_trace() {
        assert_eq!(from_seed(0), "Aran");
        assert_eq!(from_seed(1), "Belokos");
        assert_eq!(from_seed(0x9e3779b97f4a7c15), "Toris");
    }
    #[test]
    fn typing_filters_supported_letters_and_caps_twenty_scalars() {
        let mut name = String::new();
        append(&mut name, "Ab1-éCdefghijklmnop");
        assert_eq!(name, "AbéCdefghijklmnop");
        append(&mut name, " qrstuvwxyz");
        assert_eq!(name, "AbéCdefghijklmnop qr");
        let mut name = String::new();
        append(&mut name, " ab cd ef");
        assert_eq!(name, "ab cdef");
    }
}
