//! Offline entry into the ordinary loading cover, without manufacturing network events.

use bevy::prelude::*;

#[derive(Default)]
pub(super) struct Entry {
    pub(super) map: u32,
    pub(super) raised: bool,
    pub(super) ready: bool,
}

/// The embedding's world-entry half of the existing client loading screen.
/// Begin before blocking setup, wait for `presented`, then publish destination readiness.
/// The screen still owns art, input, UI/pipeline gates, progress and reveal.
#[derive(Resource, Default)]
pub struct LocalLoadingScreen {
    pub(super) entry: Option<Entry>,
    pub(super) presented: bool,
    pub(super) covering: bool,
}

impl LocalLoadingScreen {
    /// Each call starts a new entry, including a retry into the same map.
    pub fn begin(&mut self, map: u32) {
        self.entry = Some(Entry { map, ..default() });
        self.presented = false;
        self.covering = true;
    }

    pub fn pending(&self) -> bool {
        self.entry.is_some()
    }

    /// Two covered renders have been allowed to commit before blocking work starts.
    pub fn presented(&self) -> bool {
        self.presented
    }

    /// Includes the initial request frame, before the cover's presentation system runs.
    pub fn covering(&self) -> bool {
        self.covering
    }

    /// Additional readiness owned by the embedding (for example its native terrain cache).
    pub fn set_ready(&mut self, ready: bool) {
        if let Some(entry) = self.entry.as_mut() {
            entry.ready = ready;
        }
    }

    /// Failed/cancelled admission must not leave a cover waiting for a nonexistent world.
    pub fn cancel(&mut self) {
        self.entry = None;
        self.presented = false;
    }
}
