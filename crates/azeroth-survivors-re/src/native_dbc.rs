//! Current custom-game DBC dictionaries, distinct from the ordinary client's
//! localized/full-schema loaders. See custom-dbc-0.105.0.md for native owners.

use std::{collections::BTreeMap, sync::OnceLock};

#[derive(Clone, Debug, PartialEq, Eq)]
pub(crate) struct SpellMetadata {
    pub(crate) name: String,
    pub(crate) icon: String,
    pub(crate) dispel: &'static str,
}

pub(crate) type SpellMetadataMap = BTreeMap<u32, SpellMetadata>;

// The selected getters build outside their Once state, then publish only the
// first successful dictionary (145d4d1d7/145d4d231). Failures leave it unset,
// including a missing data directory; a successful empty dictionary is final.
static SPELLS: OnceLock<SpellMetadataMap> = OnceLock::new();
static ITEM_ICONS: OnceLock<BTreeMap<u32, String>> = OnceLock::new();

fn get_or_try_publish<T>(
    cache: &OnceLock<T>,
    load: impl FnOnce() -> Result<T, String>,
) -> Result<&T, String> {
    if let Some(value) = cache.get() {
        return Ok(value);
    }
    // Loading before set preserves the native concurrent-first-success law.
    // OnceLock owns publication/waiting; another successful caller can win.
    let value = load()?;
    let _ = cache.set(value);
    Ok(cache.get().expect("successful native DBC publication"))
}

fn open_chain() -> Result<benilla_formats::Chain, String> {
    let directory = crate::assets::data_directory().ok_or("data directory unavailable")?;
    benilla_formats::open_chain(&directory).map_err(|error| error.to_string())
}

///1458c0250; process lifetime, first-success cache and per-getter failed-open retry.
pub(crate) fn spell(id: u32) -> Option<&'static SpellMetadata> {
    get_or_try_publish(&SPELLS, || load_spell_metadata(&mut open_chain()?))
        .ok()?
        .get(&id)
}

///1458bef90; all 540 native requested IDs share one process-lifetime dictionary.
pub(crate) fn item_icon_dictionary() -> Option<&'static BTreeMap<u32, String>> {
    get_or_try_publish(&ITEM_ICONS, || {
        let ids: Vec<u32> = serde_json::from_str(include_str!(
            "../assets/native-dbc-display-ids-0.105.0.json"
        ))
        .expect("selected native DBC display IDs");
        load_item_icons(&mut open_chain()?, ids)
    })
    .ok()
}

struct Table<'a> {
    bytes: &'a [u8],
    rows: u32,
    stride: u32,
    string_base: usize,
}

impl<'a> Table<'a> {
    /// Current 1458c036e / 1458c0457: WDBC, at least 20 bytes, and a complete
    /// declared record/string extent. Column count is stored but not enforced.
    fn parse(bytes: &'a [u8]) -> Result<Self, String> {
        if bytes.len() < 20 || &bytes[..4] != b"WDBC" {
            return Err("invalid DBC header".into());
        }
        let word = |at| u32::from_le_bytes(bytes[at..at + 4].try_into().unwrap());
        let rows = word(4);
        let stride = word(12);
        let string_base = 20 + rows.wrapping_mul(stride) as usize;
        if string_base + word(16) as usize > bytes.len() {
            return Err("incomplete DBC records or strings".into());
        }
        Ok(Self {
            bytes,
            rows,
            stride,
            string_base,
        })
    }

    fn word(&self, row: u32, field: u32) -> u32 {
        let index = row
            .wrapping_mul(self.stride)
            .wrapping_add(field.wrapping_mul(4));
        let start = 20 + index as usize;
        // Native out-of-file fields panic rather than silently substituting 0.
        u32::from_le_bytes(
            self.bytes
                .get(start..start + 4)
                .expect("native DBC field outside file")
                .try_into()
                .unwrap(),
        )
    }

    fn string(&self, row: u32, field: u32) -> &'a str {
        let start = self.string_base + self.word(row, field) as usize;
        let tail = self
            .bytes
            .get(start..)
            .expect("native DBC string outside file");
        let end = tail
            .iter()
            .position(|byte| *byte == 0)
            .unwrap_or(tail.len());
        std::str::from_utf8(&tail[..end]).unwrap_or("")
    }
}

fn spell_metadata(spells: &[u8], icons: &[u8]) -> Result<SpellMetadataMap, String> {
    let spells = Table::parse(spells)?;
    let icons = Table::parse(icons)?;
    // 1458b9140 retains every row, including ID 0 and empty strings. Repeated
    // keys replace the prior value before the Spell map copies its icon.
    let mut icon_map = BTreeMap::new();
    for row in 0..icons.rows {
        icon_map.insert(icons.word(row, 0), icons.string(row, 1));
    }
    let mut output = BTreeMap::new();
    for row in 0..spells.rows {
        let dispel = match spells.word(row, 4) {
            1 => "Magic",
            2 => "Curse",
            3 => "Disease",
            4 => "Poison",
            _ => "",
        };
        output.insert(
            spells.word(row, 0),
            SpellMetadata {
                // 1459b2e30 uses base column 120 directly, without locale fallback.
                name: spells.string(row, 120).into(),
                icon: icon_map
                    .get(&spells.word(row, 117))
                    .copied()
                    .unwrap_or("")
                    .into(),
                dispel,
            },
        );
    }
    Ok(output)
}

fn load_spell_metadata(chain: &mut benilla_formats::Chain) -> Result<SpellMetadataMap, String> {
    let spells = chain
        .read_file("DBFilesClient\\Spell.dbc")
        .map_err(|error| error.to_string())?;
    // Native validates Spell before opening SpellIcon, so failed headers retry
    // without touching the second table.
    Table::parse(&spells)?;
    let icons = chain
        .read_file("DBFilesClient\\SpellIcon.dbc")
        .map_err(|error| error.to_string())?;
    spell_metadata(&spells, &icons)
}

fn item_icons(
    bytes: &[u8],
    requested: impl IntoIterator<Item = u32>,
) -> Result<BTreeMap<u32, String>, String> {
    let table = Table::parse(bytes)?;
    let mut output = BTreeMap::new();
    for id in requested {
        // 1459ad750 stops at the first matching ID even when that row is empty.
        if let Some(row) = (0..table.rows).find(|row| table.word(*row, 0) == id) {
            let icon = table.string(row, 5);
            if !icon.is_empty() {
                output.insert(id, icon.into());
            }
        }
    }
    Ok(output)
}

fn load_item_icons(
    chain: &mut benilla_formats::Chain,
    requested: impl IntoIterator<Item = u32>,
) -> Result<BTreeMap<u32, String>, String> {
    let bytes = chain
        .read_file("DBFilesClient\\ItemDisplayInfo.dbc")
        .map_err(|error| error.to_string())?;
    item_icons(&bytes, requested)
}
