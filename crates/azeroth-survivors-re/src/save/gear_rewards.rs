//! Current0.121.0 marks, misses and successful equipment receipt.
//! Native recipients145b0e8d0/145b0cb70 and miss mutation145aaf300.

use super::{Save, gear::{self, Records}};
use super::gear_progression::replace;

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct EquipmentReceipt {
    pub id: u32,
    pub is_new: bool,
    pub marks_tenths: u32,
}

/// Recipient-owned duplicate currency. Spending the saved balance does not
/// reduce these run totals, and delayed grants retain their producing boss.
#[derive(Clone, Debug, Default)]
pub struct DuplicateMarks {
    total: f32,
    bosses: Vec<(u32, f32)>,
}

impl DuplicateMarks {
    pub fn record(&mut self, grant: &azeroth_survivors_re::coop::replication::EquipmentGrant,
        earned_tenths: u32)
    {
        if earned_tenths == 0 { return; }
        let earned = earned_tenths as f32 / 10.0;
        self.total += earned;
        if let Some((_, marks)) = self.bosses.iter_mut().find(|(key, _)| *key == grant.boss_key) {
            *marks += earned;
        } else {
            self.bosses.push((grant.boss_key, f32::from_bits(grant.boss_marks_bits) + earned));
        }
    }

    pub fn run_marks(&self, base: f32) -> f32 { self.total + base }

    pub fn max_boss_marks(&self, base: f32) -> f32 {
        self.bosses.iter().fold(base, |maximum, (_, marks)| maximum.max(*marks))
    }

    pub fn apply(&self, snapshot: &mut azeroth_survivors_re::account_progression::RunSnapshot) {
        snapshot.run_marks = self.run_marks(snapshot.run_marks);
        snapshot.max_boss_marks = self.max_boss_marks(snapshot.max_boss_marks);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn delayed_duplicates_add_to_their_own_boss_without_reusing_the_base_award() {
        use azeroth_survivors_re::coop::replication::EquipmentGrant;
        let mut marks = DuplicateMarks::default();
        let first = EquipmentGrant { item_id: 101040, boss_key: 1,
            boss_marks_bits: 40.0_f32.to_bits() };
        let second = EquipmentGrant { boss_key: 2, boss_marks_bits: 30.0_f32.to_bits(), ..first };
        marks.record(&first, 80);
        marks.record(&second, 80);
        marks.record(&first, 80);
        assert_eq!(marks.run_marks(70.0), 94.0);
        assert_eq!(marks.max_boss_marks(40.0), 56.0);
        // A newly owned piece gives no duplicate currency or extra boss base.
        marks.record(&first, 0);
        assert_eq!(marks.run_marks(70.0), 94.0);
        assert_eq!(marks.max_boss_marks(40.0), 56.0);
    }

    #[test]
    fn failed_rolls_saturate_then_success_clears_and_duplicates_convert() {
        let mut save = Save::default();
        save.lines = ["pity|101000:254,101010:3", "marks|1|4294967294", "stat|marks=3"]
            .map(str::to_owned).to_vec();
        assert_eq!(save.record_boss_rewards(1, 1.49, &[101000, 101000]), 14);
        assert_eq!(save.class_marks_tenths(1), u32::MAX);
        assert_eq!(save.statistics()["marks"], 17);
        let records = Records::read(save.plaintext().lines());
        assert_eq!(records.pity, [(101000, 255), (101010, 3)]);
        let received = save.receive_equipment(&[101000, 101000], 0);
        assert_eq!(received, [EquipmentReceipt { id: 101000, is_new: true, marks_tenths: 0 },
            EquipmentReceipt { id: 101000, is_new: false, marks_tenths: 5 }]);
        assert_eq!(save.statistics()["marks"], 22);
        assert_eq!(Records::read(save.plaintext().lines()).pity, [(101010, 3)]);
    }

    #[test]
    fn currency_quantization_and_statistic_do_not_lose_saturated_awards() {
        let mut save = Save::default();
        save.lines = ["marks|1|1", "stat|marks=18446744073709551615"].map(str::to_owned).to_vec();
        assert_eq!(save.record_boss_rewards(1, 0.5, &[]), 5);
        assert_eq!(save.class_marks_tenths(1), 6);
        assert_eq!(save.statistics()["marks"], u64::MAX);
        let before = save.plaintext();
        assert_eq!(save.record_boss_rewards(1, f32::NAN, &[]), 0);
        assert_eq!(save.plaintext(), before);
    }
}

impl Save {
    /// Current successful-item recipient clears that exact saved pity key,
    /// then either retains ownership or converts the duplicate to class marks.
    pub fn receive_equipment(&mut self, ids: &[u32], heroic_rank: u8) -> Vec<EquipmentReceipt> {
        let mut receipts = Vec::new();
        for &id in ids {
            let Some(piece) = gear::decode(id) else { continue };
            let mut records = Records::read(self.lines.iter().map(String::as_str));
            records.pity.retain(|(key, _)| *key != id);
            let is_new = records.owned.insert(id);
            replace(self, &records);
            let marks_tenths = if is_new { 0 } else {
                let base = [1., 2., 3., 5., 8., 6., 6., 7.][usize::from(piece.rarity_digit)];
                self.grant_class_marks(piece.class, azeroth_survivors_re::heroic::marks_multiplier(heroic_rank) * base)
            };
            receipts.push(EquipmentReceipt { id, is_new, marks_tenths });
        }
        receipts
    }

    /// Current mark recipient's positive-amount gate and SSE operation order.
    /// Return the quantized award for callers that publish a notification.
    pub(crate) fn grant_class_marks(&mut self, class: u8, amount: f32) -> u32 {
        if !(amount > 0.) { return 0; }
        let tenths = ((((amount.max(0.) * 10. + 0.001).floor() / 10.) * 10.).round()) as u32;
        let mut records = Records::read(self.lines.iter().map(String::as_str));
        if let Some((_, balance)) = records.marks.iter_mut().find(|(key, _)| *key == class) {
            *balance = balance.saturating_add(tenths);
        } else if tenths != 0 {
            records.marks.push((class, tenths));
        }
        replace(self, &records);
        self.add_statistics([("marks", u64::from(tenths))]);
        tenths
    }

    /// Current tag20/local recipient: IDs are missed equipment rolls, not
    /// ownership grants. Apply every occurrence before processing the marks.
    pub fn record_boss_rewards(&mut self, class: u8, marks: f32, missed_ids: &[u32]) -> u32 {
        if !missed_ids.is_empty() {
            let mut records = Records::read(self.lines.iter().map(String::as_str));
            for &id in missed_ids {
                if gear::decode(id).is_none() { continue; }
                match records.pity.binary_search_by_key(&id, |(key, _)| *key) {
                    Ok(index) => records.pity[index].1 = records.pity[index].1.saturating_add(1),
                    Err(index) => records.pity.insert(index, (id, 1)),
                }
            }
            replace(self, &records);
        }
        self.grant_class_marks(class, marks)
    }
}
