//! Off-thread construction of the native fixed-region floor caches.
use azeroth_survivors_re::floor_recovery::map::NativeTerrain;
use benilla_assets::WorldAssets;
use bevy::prelude::*;
use std::sync::{
    mpsc::{self, Receiver, TryRecvError},
    Mutex,
};

#[derive(Resource, Default)]
pub struct NativeFloor {
    key: Option<(String, [f32; 3])>,
    pending: Option<Mutex<Receiver<Result<NativeTerrain, String>>>>,
    terrain: Option<NativeTerrain>,
    pub error: Option<String>,
}
impl NativeFloor {
    /// Match14544f710's cache identity by native map name and exact center XYZ.
    /// Every call polls completion; a different map/center starts a new resource.
    pub fn ensure(&mut self, zone_key: &str, map_dir: &str, spawn: [f32; 3], assets: &WorldAssets) {
        let key = (map_dir.to_owned(), spawn);
        if self.key.as_ref() != Some(&key) {
            self.key = Some(key);
            self.terrain = None;
            self.error = None;
            let (sender, receiver) = mpsc::channel();
            self.pending = Some(Mutex::new(receiver));
            let chain = assets.chain.clone();
            let zone = zone_key.to_owned();
            let map = map_dir.to_owned();
            std::thread::spawn(move || {
                // Chain clones share immutable archive indices. Release the UI's
                // Mutex before any MPQ decoding or connected-floor construction.
                let result = chain
                    .lock()
                    .map_err(|_| "floor MPQ chain lock poisoned".to_owned())
                    .map(|chain| chain.clone())
                    .and_then(|mut chain| {
                        NativeTerrain::load(&mut chain, &zone, &map, spawn)
                            .map_err(|error| error.to_string())
                    });
                let _ = sender.send(result);
            });
        }
        let result = self.pending.as_ref().and_then(|pending| {
            pending
                .lock()
                .ok()
                .and_then(|pending| match pending.try_recv() {
                    Ok(result) => Some(result),
                    Err(TryRecvError::Empty) => None,
                    Err(TryRecvError::Disconnected) => {
                        Some(Err("floor cache worker disconnected".to_owned()))
                    }
                })
        });
        if let Some(result) = result {
            self.pending = None;
            match result {
                Ok(terrain) => self.terrain = Some(terrain),
                Err(error) => self.error = Some(error),
            }
        }
    }
    pub fn terrain(&mut self) -> Option<&mut NativeTerrain> {
        self.terrain.as_mut()
    }
    pub fn terrain_ref(&self) -> Option<&NativeTerrain> {
        self.terrain.as_ref()
    }
}
