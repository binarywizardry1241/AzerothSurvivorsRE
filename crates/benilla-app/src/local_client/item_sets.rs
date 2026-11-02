//! Item-set metadata supplied by an embedding game's item-query callback.
//! The ordinary FrameXML tooltip still owns equipped counts and presentation.

use std::collections::HashMap;

use benilla_ui::script::ItemSetView;
use bevy::prelude::*;

/// Local counterpart of the normal `ItemSet.dbc` lookup. IDs and complete
/// member/bonus records belong to the embedding; absent IDs use the DBC path.
#[derive(Resource, Default)]
pub struct LocalItemSets {
    pub records: HashMap<u32, ItemSetView>,
    /// Optional identity aliases from the embedding's original query callback.
    pub normalize: Option<fn(u32) -> Option<u32>>,
    /// Opt in when the embedding's set callback interns bonus text in the same
    /// persistent registry as item-template spell descriptions.
    pub intern_bonus_descriptions: bool,
}

impl LocalItemSets {
    pub fn lookup(&self, id: u32) -> Option<&ItemSetView> {
        self.records.get(&id).or_else(|| {
            let canonical = (self.normalize?)(id)?;
            self.records.get(&canonical)
        })
    }

    pub(crate) fn intern_asked_bonuses(
        &self,
        asked: &[u32],
        descriptions: &mut super::LocalItemDescriptions,
    ) {
        if !self.intern_bonus_descriptions {
            return;
        }
        // The callback interns only accepted demands, in their request order.
        // Each record retains the native four-piece then optional eight-piece order.
        for &id in asked {
            if let Some(view) = self.lookup(id) {
                for (_, text) in &view.bonuses {
                    descriptions.intern(text);
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::local_client::LocalItemDescriptions;

    #[test]
    fn set_demands_share_item_ids_in_request_order_without_warming_other_sets() {
        let mut sets = LocalItemSets::default();
        sets.intern_bonus_descriptions = true;
        sets.normalize = Some(|id| (id == 99).then_some(2));
        sets.records.insert(
            1,
            ItemSetView {
                bonuses: vec![(4, "first".into())],
                ..Default::default()
            },
        );
        sets.records.insert(
            2,
            ItemSetView {
                bonuses: vec![(4, "shared".into()), (8, "second".into())],
                ..Default::default()
            },
        );
        sets.records.insert(
            3,
            ItemSetView {
                bonuses: vec![(4, "unasked".into())],
                ..Default::default()
            },
        );
        let mut descriptions = LocalItemDescriptions::default();
        assert_eq!(descriptions.intern("shared"), 0x00f0_0000);
        sets.intern_asked_bonuses(&[99, 0, 1, 2], &mut descriptions);
        assert_eq!(
            descriptions.0,
            vec![
                (0x00f0_0000, "shared".into()),
                (0x00f0_0001, "second".into()),
                (0x00f0_0002, "first".into())
            ]
        );
        assert_eq!(descriptions.intern("second"), 0x00f0_0001);
        sets.intern_asked_bonuses(&[1, 99], &mut descriptions);
        assert_eq!(descriptions.0.len(), 3);
    }

    #[test]
    fn ordinary_embedding_set_metadata_does_not_intern_without_opt_in() {
        let mut sets = LocalItemSets::default();
        sets.records.insert(
            1,
            ItemSetView {
                bonuses: vec![(4, "ordinary".into())],
                ..Default::default()
            },
        );
        let mut descriptions = LocalItemDescriptions::default();
        sets.intern_asked_bonuses(&[1], &mut descriptions);
        assert!(descriptions.0.is_empty());
    }
}
