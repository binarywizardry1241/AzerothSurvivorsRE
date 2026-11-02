//! Current 0.109.0 typed menu/account persistence and sealed file operations.
//! Typed schema, duplicate rules and serialization: docs/analysis/save-schema-0.109.0.md.
//! Historical reports retain their original target provenance.
//! Current race ownership/eligibility: docs/analysis/race-account-0.120.0.md.

use std::collections::BTreeMap;
use std::ffi::OsString;
use std::fmt;
use std::fs;
use std::io;
use std::path::{Path, PathBuf};

use base64::Engine;
use sha1::{Digest, Sha1};

#[path = "save/achievements.rs"]
mod achievements;
#[path = "save/coop_history.rs"]
mod coop_history;
#[path = "save/appearance.rs"]
pub mod appearance;
#[path = "save/backup.rs"]
mod backup;
#[path = "save/gear.rs"]
pub mod gear;
#[path = "save/gear_progression.rs"]
pub mod gear_progression;
#[path = "save/gear_rewards.rs"]
pub mod gear_rewards;
#[path = "save/progress.rs"]
mod progress;
#[path = "save/heroic.rs"]
mod heroic;
#[path = "save/talents.rs"]
pub mod talents;
#[path = "save/weapon_glow.rs"]
mod weapon_glow;
#[path = "save/schema.rs"]
mod schema;
pub use backup::timestamp;

pub const CLASS_IDS: [u8; 9] = [1, 2, 3, 4, 5, 7, 8, 9, 11];

/// Base class eligibility, before the account's permanent race purchases.
pub fn allowed_races(class: u8) -> &'static [u8] {
    match class {
        1 => &[1, 2, 3, 4, 5, 6, 7, 8],
        2 => &[1, 3],
        3 => &[3, 4, 2, 6, 8],
        4 => &[1, 3, 4, 7, 2, 5, 8],
        5 => &[1, 3, 4, 5, 8],
        7 => &[2, 6, 8],
        8 => &[1, 7, 5, 8],
        9 => &[1, 7, 2, 5],
        11 => &[4, 6],
        _ => &[],
    }
}

/// 0.120.0 `145a97aa0`: preserve the base order, then append unseen purchases.
fn expanded_races(class: u8, purchased: &[u8]) -> Vec<u8> {
    let mut races = allowed_races(class).to_vec();
    for race in purchased {
        if !races.contains(race) {
            races.push(*race);
        }
    }
    races
}

/// Native appearance order: skin, face, hair style, hair color, facial hair.
#[derive(Clone, Debug, Default, PartialEq, Eq)]
pub struct Hero {
    pub class: u8,
    pub race: u8,
    pub sex: u8,
    pub features: [u8; 5],
}

/// Native percentage order: density, health, damage, speed.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct RunMods(pub [u16; 4]);

impl Default for RunMods {
    fn default() -> Self {
        Self([100; 4])
    }
}

impl RunMods {
    pub const MAX: [u16; 4] = [500, 500, 300, 150];
    pub const STEP: [u16; 4] = [25, 25, 10, 5];

    /// Current14590e190 filters malformed tokens before requiring four u16s.
    pub fn parse_csv(value: &str) -> Option<Self> {
        let mut values = value.split(',').filter_map(|token| token.parse::<u16>().ok());
        let (Some(density), Some(health), Some(damage), Some(speed)) =
            (values.next(), values.next(), values.next(), values.next())
        else { return None; };
        if values.next().is_some() { return None; }
        Some(Self([density, health, damage, speed]).normalized())
    }

    /// Current14590e420 uses the direction's sign and the descriptor step.
    pub fn adjust(&mut self, index: usize, direction: i16) {
        let value = i32::from(self.0[index])
            + i32::from(direction.signum()) * i32::from(Self::STEP[index]);
        self.0[index] = value.clamp(100, i32::from(Self::MAX[index])) as u16;
    }

    pub fn normalized(self) -> Self {
        Self(std::array::from_fn(|i| {
            let value = self.0[i].clamp(100, Self::MAX[i]);
            100 + (value - 100) / Self::STEP[i] * Self::STEP[i]
        }))
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Pick {
    pub hero: Hero,
    pub name: String,
    pub zone: String,
    pub heroic_rank: u8,
    pub mods: RunMods,
}

impl Pick {
    /// Retained temporary row for custom-mode result bookkeeping.
    /// Its fixed GUID is a legacy marker; 0.121.0 runtime login identity comes
    /// from the process seed (see docs/analysis/ward-target-guid-0.121.0.md).
    pub fn custom_character(&self) -> Character {
        Character {
            guid: 0x00ff_fffe,
            name: self.name.clone(),
            race: self.hero.race,
            class: self.hero.class,
            sex: self.hero.sex,
            features: self.hero.features,
            best_level: 1,
            best_seconds: 0,
            runs: 0,
            wins: 0,
        }
    }

    /// Current Pick normalization145a98160; account eligibility is a separate operation.
    pub fn normalized(mut self) -> Self {
        if !CLASS_IDS.contains(&self.hero.class) {
            self.hero.class = 1;
        }
        // 0.120.0 `145a98160` accepts every ordinary race independently of
        // class/account ownership. The picker applies purchase eligibility.
        if !(1..=8).contains(&self.hero.race) {
            self.hero.race = allowed_races(self.hero.class)[0];
        }
        self.hero.sex = u8::from(self.hero.sex != 0);
        self.hero.features =
            appearance::normalize_features(self.hero.race, self.hero.sex, self.hero.features);
        self.name = crate::hero_name::normalize(&self.name).unwrap_or_else(|| "Hero".into());
        self.zone = progress::normalized_zone(&self.zone).to_owned();
        self.heroic_rank = self.heroic_rank.min(azeroth_survivors_re::heroic::MAX_RANK);
        self.mods = self.mods.normalized();
        self
    }
}

/// Current 0.109.0 56-byte typed roster row; separate from per-class `hero|` appearance.
/// Current serializer1458a4340 emits four u32 result fields after the appearance bytes.
#[derive(Clone, Debug, PartialEq)]
pub struct Character {
    pub guid: u64,
    pub name: String,
    pub race: u8,
    pub class: u8,
    pub sex: u8,
    pub features: [u8; 5],
    pub best_level: u32,
    pub best_seconds: u32,
    pub runs: u32,
    pub wins: u32,
}

#[derive(Clone, Debug, Default)]
pub struct Save {
    /// Canonical typed rows; mutators preserve their owning native family semantics.
    lines: Vec<String>,
}

#[derive(Debug)]
pub enum SaveError {
    Io(io::Error),
    Damaged,
    NotASave,
    InvalidRecord(&'static str),
    Random(String),
}

impl fmt::Display for SaveError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Io(error) => error.fmt(f),
            Self::Damaged => f.write_str("The save is damaged or its seal does not match."),
            Self::NotASave => f.write_str("That is not an Azeroth Survivors save file."),
            Self::InvalidRecord(record) => write!(f, "Invalid {record} save record."),
            Self::Random(error) => write!(f, "Cannot generate a save nonce: {error}"),
        }
    }
}

impl From<io::Error> for SaveError {
    fn from(error: io::Error) -> Self {
        Self::Io(error)
    }
}

impl Save {
    /// The current loader's sorted, unique permanent race ownership vector.
    pub fn purchased_races(&self) -> Vec<u8> {
        schema::purchased_races(&self.lines)
    }

    pub fn allowed_races(&self, class: u8) -> Vec<u8> {
        expanded_races(class, &self.purchased_races())
    }

    /// Current account fallback `145a8bf80` keeps an eligible race, otherwise
    /// chooses the first eligible race in its faction, then the first race.
    fn class_race(&self, class: u8, current: u8) -> Option<u8> {
        let allowed = self.allowed_races(class);
        let first = *allowed.first()?;
        let alliance = |race: u8| race < 8 && (0x9a_u8 >> race) & 1 != 0;
        Some(if allowed.contains(&current) {
            current
        } else {
            allowed.iter().copied()
                .find(|race| alliance(*race) == alliance(current))
                .unwrap_or(first)
        })
    }

    /// `145a8b4c0` applies ownership after typed loading, and only reclamps
    /// appearance when the account fallback changes the race.
    pub fn clamp_hero(&self, mut hero: Hero) -> Hero {
        if let Some(race) = self.class_race(hero.class, hero.race) {
            if race != hero.race {
                hero.race = race;
                hero.features = appearance::normalize_features(race, hero.sex, hero.features);
            }
        }
        hero
    }

    /// Current145a8c0f0 restores a saved class hero or starts in the current faction.
    /// A fresh class retains sex and clears every appearance byte, even if race stays valid.
    pub fn select_class_hero(&self, current: &Hero, class: u8) -> Option<Hero> {
        if !CLASS_IDS.contains(&class) {
            return None;
        }
        if let Some(hero) = self.heroes().into_iter().find(|hero| hero.class == class) {
            return Some(self.clamp_hero(hero));
        }
        let race = self.class_race(class, current.race)?;
        Some(Hero {
            class,
            race,
            sex: current.sex,
            features: [0; 5],
        })
    }

    pub fn parse(input: &str) -> Result<Self, SaveError> {
        let plain = if input.trim().starts_with("RSE1:") {
            open(input)?
        } else {
            input.to_owned()
        };
        Ok(Self {
            lines: schema::normalize(&plain.lines().map(str::to_owned).collect::<Vec<_>>(), true),
        })
    }

    /// Current145427ff0 imports must be sealed; plaintext is accepted only by the active-save
    /// loader for compatibility with older native files.
    pub fn import(input: &str) -> Result<Self, SaveError> {
        if !input.trim().starts_with("RSE1:") {
            return Err(SaveError::NotASave);
        }
        Self::parse(input)
    }

    pub fn load(path: &Path) -> Result<Self, SaveError> {
        // Current14541e3c0 accepts a missing read result as a fresh Save.
        let Ok(input) = fs::read_to_string(path) else {
            return Ok(Self::default());
        };
        let base = path.parent();
        if input.trim().starts_with("RSE1:") {
            match Self::parse(&input) {
                Ok(save) => Ok(save),
                Err(_) => {
                    // Current14541d190 chooses the first unreadable/identical backup,
                    // or overwrites slot32 when all32 contain different readable text.
                    let slot = (1..=32)
                        .find(|slot| {
                            let stem = format!("characters.unreadable.{slot}");
                            read_auxiliary(base, &stem).is_none_or(|old| old == input)
                        })
                        .unwrap_or(32);
                    let stem = format!("characters.unreadable.{slot}");
                    write_auxiliary(base, &stem, &input);
                    eprintln!(
                        "rogue: the save does not open; starting fresh, the old one kept as {stem}"
                    );
                    Ok(Self::default())
                }
            }
        } else {
            if !input.trim().is_empty() && read_auxiliary(base, "characters.legacy").is_none() {
                write_auxiliary(base, "characters.legacy", &input);
            }
            Self::parse(&input)
        }
    }

    pub fn plaintext(&self) -> String {
        let mut output = schema::normalize(&self.lines, false).join("\n");
        if !output.is_empty() {
            output.push('\n');
        }
        output
    }

    /// Replace records after a validated in-memory mutation. Loading a file has
    /// additional normalization (including dropping zero-rank purchases), which
    /// must not run again for unrelated account commands before the next reload.
    pub(crate) fn replace_runtime_records(
        &mut self,
        owns: impl Fn(&str) -> bool,
        records: impl IntoIterator<Item = String>,
    ) {
        self.lines.retain(|line| !owns(line));
        self.lines.extend(records);
    }

    /// Current14589fc7b parses quality as u8, clamps to4 and merges duplicate keys by max.
    pub fn seen(&self) -> BTreeMap<String, u8> {
        gear::seen(self.lines.iter().map(String::as_str))
    }

    pub fn heroes(&self) -> Vec<Hero> {
        schema::heroes(&self.lines, false)
    }

    pub fn pick(&self) -> Option<Pick> {
        schema::pick(&self.lines, false)
    }

    pub fn characters(&self) -> Vec<Character> {
        schema::characters(&self.lines)
    }

    /// Current packet36 (1458b3a84/1458b5e6c) validates the name, checks the
    /// factory roster for duplicates, then appends to the permanent roster.
    /// Appearance bytes are those already selected by the real create screen.
    pub fn create_roster_character(
        &mut self, name: &str, race: u8, class: u8, sex: u8, features: [u8; 5],
        startup: Option<&Character>,
    ) -> u8 {
        let name = match crate::hero_name::normalize_roster(name) {
            Ok(name) => name,
            Err(code) => return code,
        };
        let rows = self.characters();
        // Native1458b5ec1 checks the projected roster, including the optional
        // startup row. Its later ten-row limit counts only permanent rows.
        if startup.into_iter().chain(rows.iter()).any(|row| row.name.eq_ignore_ascii_case(&name)) {
            return 0x31;
        }
        if rows.len() >= 10 { return 0x34; }
        // Native145890550 uses the maximum saved GUID, never a count or the
        // current selection; the release build's u64 increment wraps.
        let guid = rows.iter().map(|row| row.guid).max().map_or(1, |guid| guid.wrapping_add(1));
        self.lines.push(format!("{guid}|{name}|{race}|{class}|{sex}|{}|1|0|0|0", joined(&features)));
        0x2e
    }

    pub fn set_hero(&mut self, hero: &Hero) -> Result<(), SaveError> {
        validate_hero(hero)?;
        let sex = u8::from(hero.sex != 0);
        let features = appearance::normalize_features(hero.race, sex, hero.features);
        let prefix = format!("hero|{}|", hero.class);
        self.lines.retain(|line| !line.trim().starts_with(&prefix));
        self.lines.push(format!(
            "hero|{}|{}|{}|{}",
            hero.class,
            hero.race,
            sex,
            joined(&features)
        ));
        Ok(())
    }

    pub fn set_pick(&mut self, pick: &Pick) -> Result<(), SaveError> {
        let pick = pick.clone().normalized();
        self.lines.retain(|line| !line.trim().starts_with("pick|"));
        self.lines.push(format!(
            "pick|{}|{}|{}|{}|{}|{}|{}",
            pick.hero.class,
            pick.hero.race,
            u8::from(pick.hero.sex != 0),
            pick.zone,
            pick.name,
            joined(&pick.hero.features),
            pick.heroic_rank,
        ));
        Ok(())
    }

    /// Preserve every unrelated native progression row while removing a roster character.
    pub fn remove_character(&mut self, guid: u64) {
        self.lines.retain(|line| {
            let fields: Vec<_> = line.trim().split('|').collect();
            fields.len() != 10 || fields[0].parse::<u64>() != Ok(guid)
        });
    }

    /// Current count after legacy migration, duplicate maxima and beaten-zone restoration.
    pub fn unlock_value(&self, class: u8) -> Option<u64> {
        progress::values(&self.lines)
            .into_iter()
            .find_map(|(id, value)| (id == class).then_some(value))
    }

    /// Native145421430 creates the parent directory and writes directly to the active path.
    /// Native1456ba4c0 opens with write/create/truncate then writes all bytes and closes.
    /// Current 0.100.1 ordinary persistence also creates an hourly progress backup.
    pub fn write(&self, path: &Path) -> Result<(), SaveError> {
        self.write_with_clock(path, || {
            std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .map_or(0, |elapsed| elapsed.as_secs())
        })
    }

    pub fn write_at(&self, path: &Path, seconds: u64) -> Result<(), SaveError> {
        self.write_with_clock(path, || seconds)
    }

    fn write_with_clock(&self, path: &Path, clock: impl FnOnce() -> u64) -> Result<(), SaveError> {
        let payload = self.payload()?;
        let result = Self::write_payload(path, &payload);
        // Current 0.115.0 145831e10 samples time only after active persistence
        // and the typed-default gate, including when the active write failed.
        backup::after_write(self, path, &payload, clock);
        result
    }

    /// Exports use the same envelope without touching the active save's backup timer.
    pub fn write_export(&self, path: &Path) -> Result<(), SaveError> {
        Self::write_payload(path, &self.export_payload()?)
    }

    /// Current 0.115.0 export 145836bb0 serializes/seals before the UI reads
    /// its clock. The ordinary writer's reopen/plaintext fallback is separate.
    pub(crate) fn export_payload(&self) -> Result<String, SaveError> {
        seal(&self.plaintext())
    }

    fn payload(&self) -> Result<String, SaveError> {
        let plain = self.plaintext();
        let sealed = seal(&plain)?;
        // Current145423790 verifies its new envelope before choosing the bytes to persist.
        let payload = if open(&sealed).is_ok_and(|decoded| decoded == plain) {
            sealed
        } else {
            eprintln!("Save seal round trip failed; writing plaintext.");
            plain
        };
        Ok(payload)
    }

    pub(crate) fn write_payload(path: &Path, payload: &str) -> Result<(), SaveError> {
        if let Some(parent) = path
            .parent()
            .filter(|parent| !parent.as_os_str().is_empty())
        {
            // Native145421430 drops parent-creation errors and still attempts the file write.
            let _ = fs::create_dir_all(parent);
        }
        fs::write(path, payload)?;
        Ok(())
    }
}

fn read_auxiliary(base: Option<&Path>, stem: &str) -> Option<String> {
    fs::read_to_string(base?.join(format!("{stem}.txt"))).ok()
}

fn write_auxiliary(base: Option<&Path>, stem: &str, text: &str) {
    if let Some(base) = base {
        // Native145420cf0 ignores both directory-creation and backup-write errors.
        let _ = fs::create_dir_all(base);
        let _ = fs::write(base.join(format!("{stem}.txt")), text);
    }
}

fn validate_hero(hero: &Hero) -> Result<(), SaveError> {
    if CLASS_IDS.contains(&hero.class) && (1..=8).contains(&hero.race) {
        Ok(())
    } else {
        Err(SaveError::InvalidRecord("hero"))
    }
}

fn valid_field(value: &str) -> bool {
    !value.contains(['|', '\r', '\n'])
}

/// Current full Save parser14589e380 filters malformed/overflowing u8 tokens before requiring five.
fn parse_features(value: &str) -> Option<[u8; 5]> {
    value
        .split(',')
        .filter_map(|value| value.parse().ok())
        .collect::<Vec<_>>()
        .try_into()
        .ok()
}

fn joined<T: fmt::Display>(values: &[T]) -> String {
    values
        .iter()
        .map(ToString::to_string)
        .collect::<Vec<_>>()
        .join(",")
}

/// Native145420f30: save-data directory, independent of benilla configuration/capture.
pub fn native_base_directory() -> Option<PathBuf> {
    native_base_directory_with(|key| std::env::var_os(key))
}
fn native_base_directory_with(
    mut environment: impl FnMut(&str) -> Option<OsString>,
) -> Option<PathBuf> {
    if let Some(path) = environment("WOW_ROGUE_SAVE") {
        return PathBuf::from(path).parent().map(Path::to_path_buf);
    }
    let base = environment("APPDATA")
        .map(PathBuf::from)
        .or_else(|| environment("XDG_DATA_HOME").map(PathBuf::from))
        .or_else(|| environment("HOME").map(|path| PathBuf::from(path).join(".local/share")))?;
    Some(base.join("wenilla-rogue"))
}
/// Native145421220: override directly, otherwise the save-data directory/characters.txt.
pub fn native_path() -> Option<PathBuf> {
    native_path_with(|key| std::env::var_os(key))
}
fn native_path_with(mut environment: impl FnMut(&str) -> Option<OsString>) -> Option<PathBuf> {
    if let Some(path) = environment("WOW_ROGUE_SAVE") {
        return Some(path.into());
    }
    native_base_directory_with(environment).map(|base| base.join("characters.txt"))
}

// This is the reference format's embedded compatibility constant, not an account credential.
const FORMAT_KEY: &[u8] =
    b"azeroth-survivors/save/v1/\x9c\x4e\x27\xd1\x6a\xf0\x13\xb8\x5d\xe2\x71\x0c\xa9\x36\xc4\x8f";

fn mac(parts: &[&[u8]]) -> [u8; 20] {
    let mut ipad = [0x36_u8; 64];
    let mut opad = [0x5c_u8; 64];
    for (index, byte) in FORMAT_KEY.iter().enumerate() {
        ipad[index] ^= byte;
        opad[index] ^= byte;
    }
    let mut inner = Sha1::new();
    inner.update(ipad);
    for part in parts {
        inner.update(part);
    }
    let mut outer = Sha1::new();
    outer.update(opad);
    outer.update(inner.finalize());
    outer.finalize().into()
}

fn crypt(nonce: &[u8], bytes: &mut [u8]) {
    for (block, chunk) in bytes.chunks_mut(20).enumerate() {
        let stream = mac(&[b"ks", nonce, &(block as u64).to_le_bytes()]);
        for (byte, key) in chunk.iter_mut().zip(stream) {
            *byte ^= key;
        }
    }
}

pub fn open(input: &str) -> Result<String, SaveError> {
    let encoded = input
        .trim()
        .strip_prefix("RSE1:")
        .ok_or(SaveError::Damaged)?;
    let blob = base64::engine::general_purpose::STANDARD
        .decode(encoded)
        .map_err(|_| SaveError::Damaged)?;
    if blob.len() < 36 {
        return Err(SaveError::Damaged);
    }
    let (body, tag) = blob.split_at(blob.len() - 20);
    let (nonce, ciphertext) = body.split_at(16);
    let expected = mac(&[b"tag", nonce, ciphertext]);
    if expected
        .iter()
        .zip(tag)
        .fold(0_u8, |different, (a, b)| different | (a ^ b))
        != 0
    {
        return Err(SaveError::Damaged);
    }
    let mut plain = ciphertext.to_vec();
    crypt(nonce, &mut plain);
    String::from_utf8(plain).map_err(|_| SaveError::Damaged)
}

pub fn seal(input: &str) -> Result<String, SaveError> {
    let mut nonce = [0_u8; 16];
    getrandom::fill(&mut nonce).map_err(|error| SaveError::Random(error.to_string()))?;
    Ok(seal_with_nonce(input, nonce))
}

pub fn seal_with_nonce(input: &str, nonce: [u8; 16]) -> String {
    let mut ciphertext = input.as_bytes().to_vec();
    crypt(&nonce, &mut ciphertext);
    let tag = mac(&[b"tag", &nonce, &ciphertext]);
    let mut blob = Vec::with_capacity(ciphertext.len() + 36);
    blob.extend_from_slice(&nonce);
    blob.extend_from_slice(&ciphertext);
    blob.extend_from_slice(&tag);
    format!(
        "RSE1:{}",
        base64::engine::general_purpose::STANDARD.encode(blob)
    )
}

#[cfg(test)]
mod native_startup {
    use super::*;
    use serde_json::Value;

    fn directory(label: &str) -> PathBuf {
        let unique = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_nanos();
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join(format!("../../runtime/menu-startup-tests/{label}-{unique}"))
    }

    #[test]
    fn damaged_startup_matches_recorded_native_slot_selection() {
        let fixtures: Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.92/save/startup-recovery-fixtures.json"
        ))
        .unwrap();
        for case in fixtures["cases"].as_array().unwrap() {
            let directory = directory(case["label"].as_str().unwrap());
            fs::create_dir_all(&directory).unwrap();
            let path = directory.join("custom-active.txt");
            for (stem, text) in case["backups"].as_object().unwrap() {
                fs::write(
                    directory.join(format!("{stem}.txt")),
                    text.as_str().unwrap(),
                )
                .unwrap();
            }
            if let Some(input) = case["input"].as_str() {
                fs::write(&path, input).unwrap();
            } else {
                fs::create_dir(&path).unwrap();
            }
            let save = Save::load(&path).unwrap();
            assert_eq!(save.plaintext(), "");
            assert!(!case["native_pick_present"].as_bool().unwrap());
            assert_eq!(
                save.heroes().len(),
                case["native_hero_count"].as_u64().unwrap() as usize
            );
            if let Some(event) = case["native_events"]
                .as_array()
                .unwrap()
                .iter()
                .find(|event| event.get("write_backup").is_some())
            {
                let expected =
                    directory.join(format!("{}.txt", event["write_backup"].as_str().unwrap()));
                assert_eq!(
                    fs::read_to_string(expected).unwrap(),
                    event["raw_text"].as_str().unwrap()
                );
                assert_eq!(
                    fs::read_to_string(&path).unwrap(),
                    case["input"].as_str().unwrap()
                );
            }
            fs::remove_dir_all(directory).unwrap();
        }
    }

    #[test]
    fn invalid_utf8_read_has_no_backup_and_invalid_utf8_backup_is_replaced() {
        let directory = directory("invalid-utf8");
        fs::create_dir_all(&directory).unwrap();
        let path = directory.join("characters.txt");
        fs::write(&path, [0xff, 0xfe]).unwrap();
        assert!(Save::load(&path).unwrap().plaintext().is_empty());
        assert_eq!(fs::read_dir(&directory).unwrap().count(), 1);
        let backup = directory.join("characters.unreadable.1.txt");
        fs::write(&backup, [0xff]).unwrap();
        fs::write(&path, "RSE1:broken").unwrap();
        assert!(Save::load(&path).unwrap().plaintext().is_empty());
        assert_eq!(fs::read_to_string(backup).unwrap(), "RSE1:broken");
        fs::remove_dir_all(directory).unwrap();
    }

    #[test]
    fn failed_damaged_backup_still_returns_fresh_state() {
        let directory = directory("backup-failure");
        fs::create_dir_all(directory.join("characters.unreadable.1.txt")).unwrap();
        let path = directory.join("characters.txt");
        fs::write(&path, "RSE1:broken").unwrap();
        assert!(Save::load(&path).unwrap().plaintext().is_empty());
        assert_eq!(fs::read_to_string(path).unwrap(), "RSE1:broken");
        fs::remove_dir_all(directory).unwrap();
    }

    #[test]
    fn plaintext_backup_preserves_the_first_readable_legacy_copy() {
        let directory = directory("legacy");
        fs::create_dir_all(&directory).unwrap();
        let path = directory.join("characters.txt");
        let backup = directory.join("characters.legacy.txt");
        fs::write(&path, " \n\t").unwrap();
        Save::load(&path).unwrap();
        assert!(!backup.exists());
        fs::write(&path, "unlock|1|3\n").unwrap();
        assert_eq!(Save::load(&path).unwrap().unlock_value(1), Some(3));
        assert_eq!(fs::read_to_string(&backup).unwrap(), "unlock|1|3\n");
        fs::write(&path, "unlock|1|4\n").unwrap();
        assert_eq!(Save::load(&path).unwrap().unlock_value(1), Some(5));
        assert_eq!(fs::read_to_string(&backup).unwrap(), "unlock|1|3\n");
        fs::write(&backup, "").unwrap();
        Save::load(&path).unwrap();
        assert_eq!(fs::read_to_string(&backup).unwrap(), "");
        fs::write(&backup, [0xff]).unwrap();
        Save::load(&path).unwrap();
        assert_eq!(fs::read_to_string(&backup).unwrap(), "unlock|1|4\n");
        fs::remove_dir_all(directory).unwrap();
    }
}

#[cfg(test)]
mod native_paths {
    use super::*;
    fn environment(entries: &[(&str, PathBuf)]) -> impl FnMut(&str) -> Option<OsString> {
        let entries: BTreeMap<String, OsString> = entries
            .iter()
            .map(|(key, path)| (key.to_string(), path.as_os_str().to_owned()))
            .collect();
        move |key| entries.get(key).cloned()
    }
    fn fixture() -> PathBuf {
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("../../runtime/native-path-fixtures")
    }
    #[test]
    fn custom_active_path_controls_base_and_keeps_its_exact_filename() {
        let root = fixture();
        let active = root.join("override/custom-active.data");
        let entries = [
            ("WOW_ROGUE_SAVE", active.clone()),
            ("APPDATA", root.join("other")),
        ];
        assert_eq!(native_path_with(environment(&entries)), Some(active));
        assert_eq!(
            native_base_directory_with(environment(&entries)),
            Some(root.join("override"))
        );
        let empty = [
            ("WOW_ROGUE_SAVE", PathBuf::new()),
            ("APPDATA", root.join("other")),
        ];
        assert_eq!(native_path_with(environment(&empty)), Some(PathBuf::new()));
        assert_eq!(native_base_directory_with(environment(&empty)), None);
    }
    #[test]
    fn saves_ignore_config_home_and_capture_exception() {
        let root = fixture();
        let entries = [
            ("APPDATA", root.join("appdata")),
            ("XDG_DATA_HOME", root.join("xdg")),
            ("HOME", root.join("home")),
            ("BENILLA_HOME", root.join("config")),
            ("WOW_CAPTURE", root.join("capture")),
        ];
        let base = root.join("appdata/wenilla-rogue");
        assert_eq!(
            native_base_directory_with(environment(&entries)),
            Some(base.clone())
        );
        assert_eq!(
            native_path_with(environment(&entries)),
            Some(base.join("characters.txt"))
        );
    }
    #[test]
    fn native_platform_precedence_and_missing_directory() {
        let root = fixture();
        let entries = [
            ("XDG_DATA_HOME", root.join("xdg")),
            ("HOME", root.join("home")),
        ];
        assert_eq!(
            native_base_directory_with(environment(&entries)),
            Some(root.join("xdg/wenilla-rogue"))
        );
        let entries = [("HOME", root.join("home"))];
        assert_eq!(
            native_base_directory_with(environment(&entries)),
            Some(root.join("home/.local/share/wenilla-rogue"))
        );
        let absent = [
            ("BENILLA_HOME", root.join("config")),
            ("WOW_CAPTURE", root.join("capture")),
        ];
        assert_eq!(native_base_directory_with(environment(&absent)), None);
        assert_eq!(native_path_with(environment(&absent)), None);
    }
}

#[cfg(test)]
mod custom_roster_tests {
    use super::*;
    #[test]
    fn temporary_character_matches_current_native_factory_without_save_mutation() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/../../docs/analysis/evidence/0.100.1/custom-roster/fixtures.json"
        )))
        .unwrap();
        for row in fixture["cases"].as_array().unwrap() {
            let input = &row["input"];
            let expected = &row["output"];
            let byte = |key: &str| input[key].as_u64().unwrap() as u8;
            let pick = Pick {
                hero: Hero {
                    class: byte("class_id"),
                    race: byte("race"),
                    sex: byte("sex"),
                    features: std::array::from_fn(|i| input["features"][i].as_u64().unwrap() as u8),
                },
                name: input["name"].as_str().unwrap().into(),
                zone: "elwynn".into(),
                heroic_rank: 0,
                mods: RunMods::default(),
            };
            let character = pick.custom_character();
            assert_eq!(character.guid, expected["guid"].as_u64().unwrap());
            assert_eq!(character.name, expected["name"].as_str().unwrap());
            assert_eq!(
                [character.race, character.class, character.sex],
                [
                    expected["race"].as_u64().unwrap() as u8,
                    expected["class_id"].as_u64().unwrap() as u8,
                    expected["sex"].as_u64().unwrap() as u8
                ]
            );
            assert_eq!(character.features, pick.hero.features);
            assert_eq!(
                [
                    character.best_level,
                    character.best_seconds,
                    character.runs,
                    character.wins
                ],
                std::array::from_fn(|i| expected["statistics"][i].as_u64().unwrap() as u32)
            );
        }
    }
    #[test]
    fn runmods_parser_and_steps_match_current_native_vectors() {
        let vectors: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/0.109.0/runmods/native-vectors.json"
        )).unwrap();
        for row in vectors["parsed"].as_array().unwrap() {
            let actual = RunMods::parse_csv(row["input"].as_str().unwrap()).unwrap_or_default();
            let expected: [u16; 4] = std::array::from_fn(|index| row["values"][index].as_u64().unwrap() as u16);
            assert_eq!(actual.0, expected,"{}",row["input"]);
        }
        for row in vectors["steps"].as_array().unwrap() {
            let mut actual = RunMods(std::array::from_fn(|index| row["before"][index].as_u64().unwrap() as u16));
            actual.adjust(row["index"].as_u64().unwrap() as usize, row["direction"].as_i64().unwrap() as i16);
            let expected: [u16; 4] = std::array::from_fn(|index| row["after"][index].as_u64().unwrap() as u16);
            assert_eq!(actual.0,expected);
        }
    }

}
