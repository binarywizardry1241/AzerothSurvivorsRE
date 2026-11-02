//! Current 0.121.0 gear currency and star transaction owners.
//! Price/admission145aa4ea0, discount145aa52e0, debit145ab44d0;
//! mark recipient145b0e8d0. See docs/analysis/gear-progression-0.121.0.md.

use super::{Save, gear::{self, Records}};

const ZONE_TIERS: [u8; 12] = [0, 0, 1, 1, 2, 2, 3, 3, 5, 5, 4, 4];
const STAR_COSTS: [f32; 6] = [1., 2., 3., 4., 6., 5.];

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum StarUpgradeError {
    Unavailable,
    Maximum,
    HeroicLocked,
    InsufficientMarks,
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct StarOffer {
    pub rank: u8,
    /// Displayed marks, already rounded upward to the native tenth.
    pub cost: f32,
}

fn count(records: &Records, id: u32) -> u8 {
    let id = gear::canonical_id(id);
    records.stars.binary_search_by_key(&id, |(key, _)| *key).ok()
        .map_or(0, |index| records.stars[index].1)
}

fn discount_classes(records: &Records, class: u8, tier: u8, rank: u8) -> u8 {
    super::CLASS_IDS.iter().copied().filter(|other| *other != class)
        .filter(|other| (0..8u32).all(|slot| {
            let id = 100_000 + u32::from(*other) * 1000 + slot * 100 + u32::from(tier.min(5)) * 10;
            records.owned.contains(&id) && count(records, id) >= rank
        })).count() as u8
}

pub(super) fn replace(save: &mut Save, records: &Records) {
    let mut rows = Vec::new();
    records.append(&mut rows);
    save.replace_runtime_records(gear::is_record, rows);
}

impl Save {
    pub fn star_count(&self, id: u32) -> u8 {
        count(&Records::read(self.lines.iter().map(String::as_str)), id)
    }

    pub fn class_marks_tenths(&self, class: u8) -> u32 {
        Records::read(self.lines.iter().map(String::as_str)).marks.iter()
            .find(|(key, _)| *key == class).map_or(0, |(_, amount)| *amount)
    }

    pub fn class_marks(&self, class: u8) -> f32 {
        self.class_marks_tenths(class) as f32 / 10.
    }

    /// Current set-zone membership, shared by admission and Armory help text.
    pub fn star_zone_indices(tier: u8) -> impl Iterator<Item = usize> {
        ZONE_TIERS.iter().enumerate()
            .filter_map(move |(index, zone_tier)| (*zone_tier == tier).then_some(index))
    }

    pub fn star_cap(&self, class: u8, tier: u8) -> u8 {
        if tier >= 6 { return 0; }
        super::heroic::clears(&self.lines).into_iter()
            .filter(|((owner, zone), _)| *owner == class
                && ZONE_TIERS.get(*zone).copied() == Some(tier))
            .map(|(_, rank)| rank).max().unwrap_or(0).min(5)
    }

    pub fn star_discount_classes(&self, class: u8, tier: u8, rank: u8) -> u8 {
        discount_classes(&Records::read(self.lines.iter().map(String::as_str)), class, tier, rank)
    }

    /// Native admission and price do not debit marks. In particular an owned
    /// weapon shares its set's unlock and other classes' eight-armor discount.
    pub fn star_offer(&self, id: u32) -> Result<StarOffer, StarUpgradeError> {
        let id = gear::canonical_id(id);
        let piece = gear::decode(id).ok_or(StarUpgradeError::Unavailable)?;
        let records = Records::read(self.lines.iter().map(String::as_str));
        if !records.owned.contains(&id) { return Err(StarUpgradeError::Unavailable); }
        let rank = count(&records, id) + 1;
        if rank > 5 { return Err(StarUpgradeError::Maximum); }
        let tier = piece.rarity_digit.min(5);
        if rank > self.star_cap(piece.class, tier) { return Err(StarUpgradeError::HeroicLocked); }
        let base = if rank == 5 && tier <= 3 { 6. } else { STAR_COSTS[usize::from(tier)] };
        let discount = (discount_classes(&records, piece.class, tier, rank) as f32 * 0.05).min(0.4);
        let cost = ((((1. - discount) * f32::from(rank)) * base) * 10. - 0.001).ceil() / 10.;
        Ok(StarOffer { rank, cost })
    }

    /// Current145ab44d0: all failures leave both currency and rank untouched.
    /// Debit uses the offer's rounded tenths, then replaces/inserts one sorted ID.
    pub fn upgrade_star(&mut self, id: u32) -> Result<u8, StarUpgradeError> {
        let id = gear::canonical_id(id);
        let offer = self.star_offer(id)?;
        let piece = gear::decode(id).ok_or(StarUpgradeError::Unavailable)?;
        let debit = (offer.cost * 10.).round() as u32;
        let mut records = Records::read(self.lines.iter().map(String::as_str));
        let Some((_, balance)) = records.marks.iter_mut().find(|(class, _)| *class == piece.class) else {
            return Err(StarUpgradeError::InsufficientMarks);
        };
        if *balance < debit { return Err(StarUpgradeError::InsufficientMarks); }
        *balance -= debit;
        match records.stars.binary_search_by_key(&id, |(key, _)| *key) {
            Ok(index) => records.stars[index].1 = offer.rank,
            Err(index) => records.stars.insert(index, (id, offer.rank)),
        }
        replace(self, &records);
        Ok(offer.rank)
    }


}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn star_purchase_guards_and_debit_are_atomic() {
        let mut save = Save::default();
        save.lines = ["items|101000", "hbeat|1|elwynn:5", "marks|1|99"].map(str::to_owned).to_vec();
        assert_eq!(save.star_offer(101000), Ok(StarOffer { rank: 1, cost: 1. }));
        assert_eq!(save.upgrade_star(101000), Ok(1));
        assert_eq!(save.class_marks_tenths(1), 89);
        save.lines.push("stars|101000:4".into());
        // Native loader preserves the lower duplicate rank; replace the row to
        // exercise the actual fifth-star price without changing that contract.
        save.lines.retain(|row| !row.starts_with("stars|"));
        save.lines.push("stars|101000:4".into());
        assert_eq!(save.star_offer(101000), Ok(StarOffer { rank: 5, cost: 30. }));
        let before = save.plaintext();
        assert_eq!(save.upgrade_star(101000), Err(StarUpgradeError::InsufficientMarks));
        assert_eq!(save.plaintext(), before);
    }

    #[test]
    fn set_cap_uses_cleared_rank_and_other_classes_full_armor() {
        let mut save = Save::default();
        save.lines = ["items|101000", "hbeat|1|duskwood:2", "marks|1|100"].map(str::to_owned).to_vec();
        assert_eq!(save.star_cap(1, 0), 2);
        assert_eq!(save.star_cap(1, 1), 0);
        assert_eq!(save.star_offer(101000).unwrap().cost, 1.);
        for slot in 0..8 {
            save.lines.push(format!("items|{}", 102000 + slot * 100));
            save.lines.push(format!("stars|{}:1", 102000 + slot * 100));
        }
        assert_eq!(save.star_discount_classes(1, 0, 1), 1);
        assert_eq!(save.star_offer(101000).unwrap().cost, 1.);
        assert_eq!(save.star_discount_classes(1, 0, 2), 0);
    }
}
