//! Font bytes supplied by an embedding game before the real FrameXML text engine starts.
//!
//! The original client path, metrics, shaping and compositor remain the owners. This
//! only supplies exact game-specific font bytes in place of a matching MPQ member.

use bevy::prelude::{Resource, SystemSet};
use std::collections::BTreeMap;

/// An embedding supplies its font bytes before the first FrameXML atlas opens.
/// Deferred resource insertion in this set is applied before atlas initialization.
#[derive(SystemSet, Clone, Debug, PartialEq, Eq, Hash)]
pub struct FontOverridesSet;

#[derive(Resource, Clone, Default)]
pub struct FontOverrides {
    bytes: BTreeMap<String, Vec<u8>>,
    fallbacks: Vec<(String, Vec<(u32, u32)>)>,
}

impl FontOverrides {
    pub fn insert(&mut self, path: &str, bytes: Vec<u8>) {
        self.bytes
            .insert(path.replace('/', "\\").to_ascii_lowercase(), bytes);
    }

    /// An embedding's ordered script fallback. The client still uses its
    /// requested face wherever that face has the character; these bytes are
    /// opened only for a missing character in one of the supplied ranges.
    pub fn insert_fallback(&mut self, path: &str, bytes: Vec<u8>, ranges: &[(u32, u32)]) {
        self.insert(path, bytes);
        let path = path.replace('/', "\\").to_ascii_lowercase();
        if let Some(row) = self.fallbacks.iter_mut().find(|row| row.0 == path) {
            row.1 = ranges.to_vec();
        } else {
            self.fallbacks.push((path, ranges.to_vec()));
        }
    }

    pub(crate) fn fallback_path(&self, ch: char) -> Option<&str> {
        self.fallbacks.iter().find(|(_, ranges)| ranges.iter()
            .any(|&(first, last)| (first..=last).contains(&(ch as u32))))
            .map(|(path, _)| path.as_str())
    }

    pub(crate) fn get(&self, path: &str) -> Option<Vec<u8>> {
        self.bytes
            .get(&path.replace('/', "\\").to_ascii_lowercase())
            .cloned()
    }
}
