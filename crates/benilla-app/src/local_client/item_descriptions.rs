//! Embedding text registered by the native item-template serializer. These are
//! tooltip-only spell rows, consumed by the ordinary item/spell tooltip path.
use bevy::prelude::*;
pub use benilla_protocol::{messages::ItemSpellEntry, ItemInfo};

#[derive(Resource, Default)]
pub struct LocalItemDescriptions(pub Vec<(u32, String)>);

impl LocalItemDescriptions {
    /// Exact byte identity shared by item templates and item-set callbacks.
    /// Entries are append-only so cached templates keep their synthetic IDs.
    pub fn intern(&mut self, text: &str) -> u32 {
        if let Some((id, _)) = self.0.iter().find(|(_, old)| old == text) {
            return *id;
        }
        let id = 0x00f0_0000u32.wrapping_add(self.0.len() as u32);
        self.0.push((id, text.to_owned()));
        id
    }
}

pub(super) fn install(app: &mut App) {
    app.init_resource::<LocalItemDescriptions>().add_systems(
        Update,
        publish.before(super::events::LocalPresentationDispatch),
    );
}

fn publish(
    descriptions: Res<LocalItemDescriptions>,
    spells: Option<ResMut<crate::ui_action::Spells>>,
    mut published: Local<usize>,
) {
    let Some(mut spells) = spells else { return };
    if spells.is_added() { *published = 0; }
    // The resource and catalog outlive the Lua VM and local run. ReloadUI must
    // retain the same synthetic IDs as the already cached item templates.
    for (id, text) in descriptions.0.iter().skip(*published) {
        spells.catalog.insert_tooltip_description(*id, text.clone());
    }
    *published = descriptions.0.len();
}

#[cfg(test)]
mod tests {
    use super::LocalItemDescriptions;

    #[test]
    fn interning_preserves_exact_bytes_and_prior_ids() {
        let mut descriptions = LocalItemDescriptions::default();
        for (index, text) in ["", "a\0b", "é", "e\u{301}"].into_iter().enumerate() {
            assert_eq!(descriptions.intern(text), 0x00f0_0000 + index as u32);
        }
        assert_eq!(descriptions.intern("a\0b"), 0x00f0_0001);
        assert_eq!(descriptions.intern("é"), 0x00f0_0002);
        assert_eq!(descriptions.0.len(), 4);
    }
}
