//! Current actor aura publication1454e3550 and application-byte1454506a0.
//! State belongs to one actor lifetime; these16 slots are native debuffs32..47.

use crate::player_abilities::behavior::periodic::ActorPeriodic;
#[derive(Clone, Debug, Default)]
pub struct AuraSlots {
    pub spells: [u32;16],
}

impl AuraSlots {
    /// Current actor periodic compaction1454db6c0 /14553e800 keeps the ID
    /// while another periodic row remains, publishing only its application word.
    pub fn update_applications(&self,spell_id:u32,periodic:&[ActorPeriodic])->Option<Vec<(u16,u32)>> {
        let index=self.spells.iter().position(|spell|*spell==spell_id)?;
        Some(vec![(121+(index/4) as u16,self.applications(index/4,periodic))])
    }
    /// Duplicate/full additions and unmatched removals do not publish. The
    /// actual event-time periodic rows supply the native application count.
    pub fn apply(&mut self, spell_id:u32, present:bool,
                 periodic:&[ActorPeriodic])->Option<Vec<(u16,u32)>> {
        let index=if present {
            if self.spells.contains(&spell_id) { return None; }
            self.spells.iter().position(|spell|*spell==0)?
        } else { self.spells.iter().position(|spell|*spell==spell_id)? };
        self.spells[index]=if present {spell_id} else {0};
        let flag_base=index/8*8;
        let flags=self.spells[flag_base..flag_base+8].iter().enumerate()
            .fold(0u32,|flags,(bit,spell)|flags | (u32::from(*spell!=0)*2 << (bit*4)));
        Some(vec![(79+index as u16,self.spells[index]),
            (99+(index/8) as u16,flags),
            (121+(index/4) as u16,self.applications(index/4,periodic))])
    }

    /// Prefer all active player-owned rows of this spell; only when that count
    /// is0 does the native helper count other owners. It stores min(count,255)-1.
    pub fn applications(&self, group:usize, periodic:&[ActorPeriodic])->u32 {
        self.spells[group*4..group*4+4].iter().enumerate().fold(0,|word,(byte,spell)| {
            if *spell==0 { return word; }
            let count=periodic.iter().filter(|row|row.spell_id==*spell
                && row.ticks_remaining!=0 && row.owner_kind==0).count();
            let count=if count!=0 {count} else {periodic.iter().filter(|row|
                row.spell_id==*spell && row.ticks_remaining!=0 && row.owner_kind!=0).count()};
            word | (count.min(255).saturating_sub(1) as u32) << (byte*8)
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    fn periodic(spell_id:u32,owner_kind:u64,ticks_remaining:u32)->ActorPeriodic {
        ActorPeriodic { owner_kind,owner_guid:0,effect_owner:None,spell_id,power_per_tick:1.,interval:1.,
            next_tick_at:0.,ticks_remaining,initial_ticks:1,leech_fraction:0.,school:0 }
    }
    #[test]
    fn original_actor_aura_slot_and_application_vectors_match() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.100.1/run-presentation/aura-native.json")).unwrap();
        assert_eq!(fixture["target_sha256"],super::super::TARGET_SHA256);
        for case in fixture["slots"].as_array().unwrap() {
            let mut slots=AuraSlots { spells:serde_json::from_value(case["initial"].clone()).unwrap() };
            let actual=slots.apply(case["spell"].as_u64().unwrap() as u32,
                case["present"].as_bool().unwrap(),&[]);
            assert_eq!(actual.is_some(),case["changed"].as_bool().unwrap(),"{case}");
            let expected:[u32;16]=serde_json::from_value(case["expected"].clone()).unwrap();
            assert_eq!(slots.spells,expected,"{case}");
        }
        for case in fixture["applications"].as_array().unwrap() {
            let slots=AuraSlots { spells:serde_json::from_value(case["spells"].clone()).unwrap() };
            let rows=case["periodic"].as_array().unwrap().iter().map(|row| periodic(
                row["spell"].as_u64().unwrap() as u32,row["owner_kind"].as_u64().unwrap(),
                row["remaining"].as_u64().unwrap() as u32)).collect::<Vec<_>>();
            assert_eq!(slots.applications(case["group"].as_u64().unwrap() as usize,&rows),
                case["expected"].as_u64().unwrap() as u32,"{case}");
        }
        for case in fixture["application_updates"].as_array().unwrap() {
            let slots=AuraSlots {spells:serde_json::from_value(case["initial"].clone()).unwrap()};
            let result=slots.update_applications(case["spell"].as_u64().unwrap() as u32,&[]);
            let expected=case["group"].as_u64().map(|group|vec![(121+group as u16,0)]);
            assert_eq!(result,expected,"{case}");
        }
    }
    #[test]
    fn published_native_debuff_fields_preserve_both_flag_groups() {
        let mut slots=AuraSlots::default();
        for spell in 1..=9 { slots.apply(spell,true,&[]).unwrap(); }
        assert_eq!(slots.apply(8,false,&[]).unwrap(),[(86,0),(99,0x02222222),(122,0)]);
        assert_eq!(slots.apply(10,true,&[periodic(10,0,1),periodic(10,0,1)]).unwrap(),
            [(86,10),(99,0x22222222),(122,0x01000000)]);
    }

}
