//! Native 14070f550's identity counter and monotonic residency latch.

use benilla_world::terrain_stream::WorldLoadProgress;

#[derive(Clone, Copy, PartialEq, Eq)]
pub(super) struct RequestIdentity {
    pub map: u32,
    pub zone: u32,
}

/// The original local request starts with enum tag 2, distinct from None. Keep
/// that initial state so the first observation, including None, starts at zero.
#[derive(Default)]
pub(super) struct Stabilization {
    observed: bool,
    identity: Option<RequestIdentity>,
    frames: u32,
    active: bool,
    ready: bool,
}

impl Stabilization {
    pub fn observe(&mut self, identity: Option<RequestIdentity>) {
        if !self.observed || identity != self.identity {
            self.observed = true;
            self.identity = identity;
            self.frames = 0;
            self.active = false;
            self.ready = false;
            return;
        }
        self.frames = self.frames.saturating_add(1);
        self.active = identity.is_some() && self.frames >= 3;
        if !self.active {
            self.ready = false;
        }
    }

    pub fn resolve(&mut self, progress: Option<&WorldLoadProgress>) {
        if !self.active {
            self.ready = false;
        } else if !self.ready && self.frames >= 18 {
            // Exact native offsets: booleans +3c/+3d; pending usize +10/+18/+28.
            // The placements-pending counter at +20 is not a separate gate.
            self.ready = progress.is_some_and(|progress| {
                progress.focus_resident
                    && progress.scene_ready
                    && progress.colliders_pending == 0
                    && progress.merge_pending == 0
                    && progress.gx_pending == 0
            });
        }
    }

    pub fn frames(&self) -> u32 {
        self.frames
    }

    pub fn active(&self) -> bool {
        self.active
    }

    pub fn ready(&self) -> bool {
        self.ready
    }
}
