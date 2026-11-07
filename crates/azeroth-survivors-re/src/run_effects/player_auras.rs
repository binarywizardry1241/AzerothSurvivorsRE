//! Player aura projection, distinct from target slot mutation.
//! Active spell grouping: 0.119.0 145b8bd60; index/alias proof retains
//! its 0.112.0 provenance in player-aura-indices-0.112.0.md.
use crate::player_abilities::behavior::buffs;
use super::{actions::TemporaryStat,EffectRow};

/// Current14585c570 maps the actor's stored Game+850 metadata name. Metadata
/// localization precedes both world and resource aliases; unrecognized names
/// use the native kind fallback. A recipient title cannot change this input.
pub fn player_aura_alias(name:&str,kind:u8)->u32 {
    match (name,kind) {
        ("Fortified"|"Shield Mastery",0)=>871,
        ("Last Stand",0)=>2565,
        ("Soul Link",0)=>19028,
        ("Ardent Defender"|"Blessed Life",0)=>27778,
        ("Flurry",1)=>16280,
        ("Last Stand",2)=>12975,
        ("Divine Intervention",2)=>19753,
        ("Cheat Death",2)=>5384,
        ("Reincarnation",2)=>20608,
        (_,0)=>27779,(_,1)=>26635,(_,2)=>25771,
        _=>panic!("native aura alias kind outside0..2"),
    }
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PlayerAura {
    pub spell_id:u32,
    pub expires_at:f32,
    pub count:u32,
}

/// Only instances whose definition.effect.tag==11 enter this input. The
/// current publisher gives a learned instance25771 and the racial instance6788.
#[derive(Clone, Copy, Debug)]
pub struct PlayerCooldownAura {
    pub racial:bool,
    pub remaining:f32,
}

pub struct PlayerAuraInputs<'a> {
    pub now:f32,
    pub auras:&'a [buffs::Aura],
    pub effects:&'a [EffectRow],
    pub provenance:&'a [&'a str],
    pub temporary:&'a [TemporaryStat],
    pub absorb:f32,
    pub rescue_ready_at:f32,
    pub cooldowns:&'a [PlayerCooldownAura],
}

impl PlayerAuraInputs<'_> {
    ///0.119.0 145b8bd9c groups active auras by spell in first encounter order,
    /// retaining application count and latest expiry. Later producers remain
    /// distinct: the first generic shield, temporary rows and permanent25 rows.
    /// Rescue/cooldown markers occupy the separate harmful16-slot partition.
    pub fn slots(&self)->[Option<PlayerAura>;48] {
        assert_eq!(self.effects.len(),self.provenance.len(),"native effect provenance length");
        let mut helpful=Vec::<PlayerAura>::new();
        for aura in self.auras.iter().filter(|aura|aura.expires_at>self.now) {
            if let Some(row)=helpful.iter_mut().find(|row|row.spell_id==aura.spell_id) {
                row.count=row.count.wrapping_add(1);
                // Native MAXSS chooses the incoming value on equality, including
                // signed zero. The active filter already excludes NaN expiry.
                if aura.expires_at>=row.expires_at {row.expires_at=aura.expires_at;}
            } else {
                helpful.push(PlayerAura {spell_id:aura.spell_id,expires_at:aura.expires_at,count:1});
            }
        }
        let mut harmful=Vec::new();
        let alias=|index,kind|player_aura_alias(self.provenance[index],kind);
        let shield_active=self.auras.iter().any(|aura|aura.effect.tag==7&&aura.expires_at>self.now);
        if self.absorb>0. && !shield_active {
            if let Some(index)=self.effects.iter().position(|row|matches!(row.tag(),18|20)
                || (row.tag()==253&&row.bytes[63]==31)) {
                helpful.push(PlayerAura {spell_id:alias(index,0),expires_at:f32::INFINITY,count:1});
            }
        }
        if self.now<self.rescue_ready_at {
            if let Some(index)=self.effects.iter().position(|row|row.tag()==19) {
                harmful.push(PlayerAura {spell_id:alias(index,2),expires_at:self.rescue_ready_at,count:1});
            }
        }
        for (index,_) in self.effects.iter().enumerate().filter(|(_,row)|row.tag()==15) {
            if let Some(state)=self.temporary.iter().find(|entry|entry.effect_index==index
                &&entry.stacks!=0&&entry.expires>self.now) {
                helpful.push(PlayerAura {spell_id:alias(index,1),expires_at:state.expires,count:state.stacks});
            }
        }
        for row in self.cooldowns {
            if row.remaining>0. && row.remaining!=1000. {
                harmful.push(PlayerAura {spell_id:if row.racial {6788} else {25771},
                    expires_at:self.now+row.remaining,count:1});
            }
        }
        helpful.extend(self.effects.iter().filter(|row|row.tag()==25).map(|row|
            PlayerAura {spell_id:row.word(4),expires_at:f32::INFINITY,count:1}));
        std::array::from_fn(|index| if index<32 {helpful.get(index).copied()}
            else {harmful.get(index-32).copied()})
    }
}

#[derive(Clone, Debug)]
pub struct PlayerAuraState {
    pub previous:[Option<PlayerAura>;48],
    initialized:bool,
}
impl Default for PlayerAuraState {
    fn default()->Self {Self {previous:[None;48],initialized:false}}
}
impl PlayerAuraState {
    ///1458e2350: helpful presence uses nibble9, harmful presence nibble8.
    pub fn flags(slots:&[Option<PlayerAura>;48],group:usize)->u32 {
        slots[group*8..group*8+8].iter().enumerate().fold(0,|word,(bit,row)|
            word|if row.is_some() {(if group<4 {9} else {8})<<(bit*4)} else {0})
    }
    ///1458eafbf..1458eb0bd stores min(count,255)-1, with0 for zero applications.
    pub fn applications(slots:&[Option<PlayerAura>;48],group:usize)->u32 {
        slots[group*4..group*4+4].iter().enumerate().fold(0,|word,(byte,row)|
            word|row.map_or(0,|row|row.count.min(255).saturating_sub(1))<<(byte*8))
    }
    pub fn publish(&mut self,input:PlayerAuraInputs<'_>)->Vec<(u16,u32)> {
        self.publish_slots(input.slots())
    }
    pub fn publish_slots(&mut self,slots:[Option<PlayerAura>;48])->Vec<(u16,u32)> {
        let mut fields=Vec::new();
        for index in 0..48 {
            let id=slots[index].map_or(0,|row|row.spell_id);
            if !self.initialized||id!=self.previous[index].map_or(0,|row|row.spell_id) {
                fields.push((47+index as u16,id));
            }
        }
        for group in 0..6 {
            let word=Self::flags(&slots,group);
            if !self.initialized||word!=Self::flags(&self.previous,group) {fields.push((95+group as u16,word));}
        }
        for group in 0..12 {
            let word=Self::applications(&slots,group);
            if !self.initialized||word!=Self::applications(&self.previous,group) {fields.push((113+group as u16,word));}
        }
        self.previous=slots;self.initialized=true;
        fields
    }
}


#[cfg(test)]
mod tests {
    use super::*;
    fn aura(spell_id:u32,expires_at:f32)->buffs::Aura {
        buffs::Aura{source_guid:0,effect:crate::player_abilities::catalog::StatusEffect{tag:0,value:0.,duration:0.},
            spell_id,expires_at,healing_power:0.}
    }
    fn input(auras:&[buffs::Aura],now:f32)->PlayerAuraInputs<'_> {
        PlayerAuraInputs{now,auras,effects:&[],provenance:&[],temporary:&[],
            absorb:0.,rescue_ready_at:0.,cooldowns:&[]}
    }
    #[test]
    fn active_spells_group_in_first_encounter_order_with_latest_expiry() {
        let auras=[aura(774,11.),aura(7,8.),aura(871,12.),aura(774,15.),
            aura(774,13.),aura(871,10.),aura(774,f32::NAN)];
        let slots=input(&auras,10.).slots();
        assert_eq!(slots[0],Some(PlayerAura{spell_id:774,expires_at:15.,count:3}));
        assert_eq!(slots[1],Some(PlayerAura{spell_id:871,expires_at:12.,count:1}));
        assert!(slots[2..].iter().all(Option::is_none));
        assert!(input(&auras,f32::NAN).slots().iter().all(Option::is_none));
        for (first,last) in [(0.,-0.),(-0.,0.)] {
            let slots=input(&[aura(774,first),aura(774,last)],-1.).slots();
            assert_eq!(slots[0].unwrap().expires_at.to_bits(),last.to_bits());
        }
        let slots=input(&[aura(774,11.),aura(774,f32::INFINITY),aura(774,12.)],10.).slots();
        assert_eq!(slots[0].unwrap().expires_at,f32::INFINITY);
    }
    #[test]
    fn grouping_precedes_helpful_truncation_and_does_not_merge_later_producers() {
        let mut bytes=[0;64];bytes[0]=25;bytes[4..8].copy_from_slice(&774u32.to_le_bytes());
        let mut shield=[0;64];shield[0]=18;let mut temporary=[0;64];temporary[0]=15;
        let effects=[EffectRow{bytes:shield,strings:&[],lists:&[]},
            EffectRow{bytes:temporary,strings:&[],lists:&[]},EffectRow{bytes,strings:&[],lists:&[]}];
        let auras=[aura(774,12.),aura(774,14.),aura(871,12.),aura(16280,12.),aura(6788,12.)];
        let temporary=[TemporaryStat{effect_index:1,stacks:4,expires:15.}];
        let cooldowns=[PlayerCooldownAura{racial:true,remaining:2.}];
        let slots=PlayerAuraInputs{effects:&effects,provenance:&["Fortified","Flurry","Permanent"],
            temporary:&temporary,absorb:1.,cooldowns:&cooldowns,
            ..input(&auras,10.)}.slots();
        assert_eq!(slots[..7].iter().flatten().map(|row|row.spell_id).collect::<Vec<_>>(),
            [774,871,16280,6788,871,16280,774]);
        assert_eq!(slots[..7].iter().flatten().map(|row|row.count).collect::<Vec<_>>(),[2,1,1,1,1,4,1]);
        assert_eq!(slots[6],Some(PlayerAura{spell_id:774,expires_at:f32::INFINITY,count:1}));
        assert_eq!(slots[32].unwrap().spell_id,6788);
        let mut auras=(1..=33).map(|spell|aura(spell,11.)).collect::<Vec<_>>();
        auras.extend((0..300).map(|_|aura(1,15.)));
        let slots=PlayerAuraInputs{cooldowns:&cooldowns,..input(&auras,10.)}.slots();
        assert_eq!(slots[..32].iter().flatten().map(|row|row.spell_id).collect::<Vec<_>>(),
            (1..=32).collect::<Vec<_>>());
        assert_eq!(slots[0].unwrap().count,301);
        assert_eq!(PlayerAuraState::applications(&slots,0),254);
        assert_eq!(slots[32].unwrap().spell_id,6788);
    }
    #[test]
    fn active_group_changes_reach_application_words_without_duplicate_icons() {
        let mut state=PlayerAuraState::default();
        let auras=[aura(774,12.),aura(774,15.)];
        state.publish(input(&auras[..1],10.));
        assert_eq!(state.publish(input(&auras,10.)),[(113,1)]);
        assert_eq!(state.previous[0].unwrap().expires_at,15.);
        assert!(state.previous[1..].iter().all(Option::is_none));
        assert!(state.publish(input(&auras,11.)).is_empty());
        assert_eq!(state.publish(input(&auras,12.)),[(113,0)]);
        assert_eq!(state.previous[0].unwrap().count,1);
        assert_eq!(state.publish(input(&auras,15.)),[(47,0),(95,0)]);
    }
    #[test]
    fn current_native_aura_sources_preserve_first_shield_order_and_aliases() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/player-aura-indices/contracts.json")).unwrap();
        assert_eq!(fixture["target"]["sha256"],"dc10453398ceb398076f6d3b6ac7859470de2ff7ccd68ac1d00a02f9f1e5209a");
        for case in fixture["alias_cases"].as_array().unwrap().iter().chain(
            fixture["actual_producer_aliases"]["actual_aura_source_rows"].as_array().unwrap()) {
            assert_eq!(player_aura_alias(case["name"].as_str().unwrap(),case["kind"].as_u64().unwrap() as u8),
                case["spell_id"].as_u64().unwrap() as u32,"{case}");
        }
        for case in fixture["index_cases"].as_array().unwrap() {
            let tags=case["native_generic_tags"].as_array().unwrap();
            let effects=tags.iter().map(|tag| {
                let tag=tag.as_u64().unwrap() as u8;let mut bytes=[0;64];
                if (29..=35).contains(&tag) {bytes[0]=253;bytes[63]=tag;} else {bytes[0]=tag;}
                EffectRow{bytes,strings:&[],lists:&[]}
            }).collect::<Vec<_>>();
            let names=case["provenance"].as_array().unwrap().iter().map(|name|name.as_str().unwrap()).collect::<Vec<_>>();
            for gate in fixture["shield_publication_cases"].as_array().unwrap() {
                let active=[buffs::Aura{source_guid:0,effect:crate::player_abilities::catalog::StatusEffect{tag:7,value:1.,duration:1.},
                    spell_id:7,expires_at:11.,healing_power:0.}];
                let has_active=gate["active_shield"].as_bool().unwrap();
                let slots=PlayerAuraInputs{now:10.,auras:if has_active {&active} else {&[]},effects:&effects,
                    provenance:&names,temporary:&[],absorb:f32::from_bits(gate["absorb_bits"].as_u64().unwrap() as u32),
                    rescue_ready_at:0.,cooldowns:&[]}.slots();
                let mut expected=if has_active {vec![7]} else {vec![]};
                if !gate["published"].as_array().unwrap().is_empty() {
                    if let Some(index)=case["native_shield_index"].as_u64() {
                        let native=fixture["alias_cases"].as_array().unwrap().iter().find(|row|
                            row["name"].as_str()==Some(names[index as usize])&&row["kind"].as_u64()==Some(0)).unwrap();
                        expected.push(native["spell_id"].as_u64().unwrap() as u32);
                    }
                }
                expected.extend(tags.iter().filter(|tag|tag.as_u64()==Some(25)).map(|_|0));
                assert_eq!(slots[..32].iter().flatten().map(|row|row.spell_id).collect::<Vec<_>>(),expected,"{case} {gate}");
                assert!(slots[32..].iter().all(Option::is_none));
            }
        }
    }

    #[test]
    fn original_player_aura_alias_flag_and_application_words_match() {
        // Historical inputs retain their target. The current aura-index checker
        // replays every flags/applications case against the 0.112.0 publisher.
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/run-presentation/player-aura-native.json")).unwrap();
        assert_eq!(fixture["target_sha256"],super::super::TARGET_SHA256);
        for case in fixture["aliases"].as_array().unwrap() {
            assert_eq!(player_aura_alias(case["name"].as_str().unwrap(),case["kind"].as_u64().unwrap() as u8),
                case["expected"].as_u64().unwrap() as u32,"{case}");
        }
        for case in fixture["flags"].as_array().unwrap() {
            let group=case["group"].as_u64().unwrap() as usize;
            let mask=case["mask"].as_u64().unwrap();let mut slots=[None;48];
            for bit in 0..8 {if mask&(1<<bit)!=0 {slots[group*8+bit]=Some(PlayerAura{spell_id:1,expires_at:0.,count:1});}}
            assert_eq!(PlayerAuraState::flags(&slots,group),case["expected"].as_u64().unwrap() as u32,"{case}");
        }
        for case in fixture["applications"].as_array().unwrap() {
            let group=case["group"].as_u64().unwrap() as usize;
            let mask=case["present"].as_u64().unwrap();let mut slots=[None;48];
            for bit in 0..4 {if mask&(1<<bit)!=0 {slots[group*4+bit]=Some(PlayerAura {spell_id:1,
                expires_at:0.,count:case["counts"][bit].as_u64().unwrap() as u32});}}
            assert_eq!(PlayerAuraState::applications(&slots,group),case["expected"].as_u64().unwrap() as u32,"{case}");
        }
    }
    #[test]
    fn player_aura_publication_tracks_flags_and_stacks_without_repeating_unchanged_fields() {
        let mut state=PlayerAuraState::default();assert_eq!(state.publish_slots([None;48]).len(),66);
        assert!(state.publish_slots([None;48]).is_empty());
        let mut rows=[None;48];rows[0]=Some(PlayerAura {spell_id:871,expires_at:8.,count:2});
        rows[32]=Some(PlayerAura {spell_id:5384,expires_at:60.,count:1});
        assert_eq!(state.publish_slots(rows),[(47,871),(79,5384),(95,9),(99,8),(113,1)]);
        rows[0].as_mut().unwrap().expires_at=10.;assert!(state.publish_slots(rows).is_empty());
        rows[0].as_mut().unwrap().count=3;assert_eq!(state.publish_slots(rows),[(113,2)]);
    }
    #[test]
    fn native_partitions_preserve_producer_order_and_exact_expiry_boundaries() {
        use crate::player_abilities::catalog::StatusEffect;
        let row=|tag,spell:u32| {let mut bytes=[0;64];bytes[0]=tag;
            bytes[4..8].copy_from_slice(&spell.to_le_bytes());EffectRow{bytes,strings:&[],lists:&[]}};
        let rows=[row(18,0),row(20,0),row(19,0),row(15,0),row(15,0),row(25,123)];
        let names=["Fortified","Other","Cheat Death","Flurry","Other","Permanent"];
        let active=[buffs::Aura{source_guid:0,effect:StatusEffect{tag:0,value:0.,duration:0.},spell_id:7,
            expires_at:11.,healing_power:0.},buffs::Aura{source_guid:0,effect:StatusEffect{tag:0,value:0.,duration:0.},
            spell_id:8,expires_at:10.,healing_power:0.}];
        let temporary=[TemporaryStat{effect_index:3,stacks:2,expires:12.},
            TemporaryStat{effect_index:4,stacks:9,expires:10.}];
        let cooldowns=[PlayerCooldownAura{racial:false,remaining:0.},
            PlayerCooldownAura{racial:false,remaining:1000.},PlayerCooldownAura{racial:true,remaining:2.}];
        let input=PlayerAuraInputs{now:10.,auras:&active,effects:&rows,provenance:&names,
            temporary:&temporary,absorb:1.,rescue_ready_at:15.,cooldowns:&cooldowns};
        let slots=input.slots();
        assert_eq!(slots[..4].iter().map(|r|r.unwrap().spell_id).collect::<Vec<_>>(),[7,871,16280,123]);
        assert_eq!(slots[2].unwrap().count,2);assert!(slots[4..32].iter().all(Option::is_none));
        assert_eq!(slots[32].unwrap().spell_id,5384);assert_eq!(slots[33].unwrap().spell_id,6788);
        assert!(slots[34..].iter().all(Option::is_none));
        let active_shield=[buffs::Aura{source_guid:0,effect:StatusEffect{tag:7,value:0.,duration:0.},..active[0]}];
        let slots=PlayerAuraInputs{auras:&active_shield,..input}.slots();
        assert_eq!(slots[1].unwrap().spell_id,16280);
    }
}
