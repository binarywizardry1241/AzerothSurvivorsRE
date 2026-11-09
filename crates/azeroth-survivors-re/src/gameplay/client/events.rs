//! Recovered run packet intents enter the real offline client presentation.
//! Native owners145466ab0 (spell-go),14545f6d0 (direct damage),
//!145464140 (periodic damage) and the existing recovered object field rows.
//! SpellGo also carries the original projectile display for the three ammo-bearing shots.

use std::collections::HashSet;

use azeroth_survivors_re::{
    bosses::abilities::{CastTarget, SpellCast},
    enemies::Position,
    floor_recovery::map::NativeTerrain,
};
use benilla_app::local_client::events::{
    EntityKind, JumpInfo, LocalPresentationEvents, MonsterMoveFacing, ObjectFields, ObjectType, SessionEvent,
    AttackerState,ChatMessage,CombatTextAttribution,PeriodicAuraLog, PeriodicTick, SpellDamageLog, SpellHealLog,
};
use bevy::prelude::*;

use super::super::{mechanics::RunEvent, RunSession};
use crate::{localization::Localization,menu_state::MenuState};

pub(super) fn install(app: &mut App) {
    // Native Server::update drains the Game's packet/banner queues before
    // polling addon snapshots. Preserve that order in the shared inbound queue.
    app.add_systems(First, collect.after(crate::coop_runtime::CoopSet::Apply).before(super::sync_to_client))
        .add_systems(First,receive_coop.after(super::super::coop::publication::publish_units));
}

fn position(value: Position) -> [f32;3] { [value.x,value.y,value.z] }

pub(in crate::gameplay) fn system_message(text:String)->SessionEvent {
    SessionEvent::Chat(ChatMessage {chat_type:0x0a,language:0,
        sender_guid:0,target_guid:0,sender_name:None,channel:None,text,chat_tag:0})
}

/// Current145b0cb70/145b0e8d0 choose integer text only within1e-4 of a whole
/// displayed mark. Keep native f32 rounding, including the saved-u32 conversion.
fn mark_number(value:f32)->String {
    let value=(value*10.).round()/10.;
    let integer=value.round();
    if (value-integer).abs()<0.0001 { (integer as i64).to_string() } else { value.to_string() }
}

fn gear_receipt(id:u32,race:u8,is_new:bool,marks_tenths:u32,
    catalog:&crate::catalog::MenuCatalog,label:&impl Fn(&str)->String)->Option<SessionEvent> {
    static GEAR:std::sync::OnceLock<crate::armory::ArmoryCatalog>=std::sync::OnceLock::new();
    let gear=GEAR.get_or_init(crate::armory::ArmoryCatalog::embedded);
    let piece=gear.piece(id)?;
    // Native rarity4 uses legendary orange only for weapons; PvP uses purple.
    let quality=match piece.rarity {
        0=>"ffffffff",1=>"ff1eff00",2=>"ff0070dd",
        4 if piece.item_class==2=>"ffff8000",_=>"ffa335ee",
    };
    let name=crate::armory::piece_name(catalog,piece,race);
    let suffix=if is_new {
        format!(" |cff40ff40{}|r",label("New in your collection!"))
    } else if marks_tenths!=0 {
        let gained=label("marks.gained").replace("{n}",&mark_number(marks_tenths as f32/10.));
        format!(" |cff9d9d9d({})|r |cffffd100{gained}|r",label("already collected"))
    } else {
        format!(" |cff9d9d9d({})|r",label("already collected"))
    };
    Some(system_message(format!("{} |c{quality}[{name}]|r{suffix}",label("You receive loot:"))))
}

fn marks_earned(earned:f32,total_tenths:u32,label:&impl Fn(&str)->String)->SessionEvent {
    let earned=(earned*10.+0.001).floor()/10.;
    let text=label("marks.earned").replace("{n}",&mark_number(earned))
        .replace("{total}",&mark_number(total_tenths as f32/10.));
    system_message(format!("|cffffd100{text}|r"))
}

/// The same native producer is called by terminal refresh and explicit logout.
/// Build its notice/request once for both the ordinary collector and teardown.
fn talent_message(gain:u32,before:u32,total:u32,class_key:&str,parts:[i64;7],
                  label:&impl Fn(&str)->String)->(serde_json::Value,SessionEvent) {
    let class_name=label(&format!("class.{class_key}.name"));
    let parts=["Time survived","Kills","Bosses slain","Victory","Zone bonus",
        "Heroic","Veteran's Lessons"].into_iter().zip(parts)
        .map(|(name,xp)|(label(name),xp)).collect::<Vec<_>>();
    let value=crate::talent_context::request(gain,before,total,&class_name,&parts);
    let points=value["gained"].as_u64().unwrap_or(0) as u32;
    let template=match points {
        0=>"Your {class}s earn {xp} talent experience.",
        1=>"Your {class}s earn {xp} talent experience: 1 new talent point! Spend it in the armory.",
        _=>"Your {class}s earn {xp} talent experience: {n} new talent points! Spend them in the armory.",
    };
    let notice=label(template).replace("{class}",&class_name)
        .replace("{xp}",&gain.to_string()).replace("{n}",&points.to_string());
    (value,system_message(format!("|cff71d5ff{notice}|r")))
}

pub(super) fn terminal_talent_messages(game:&mut super::super::mechanics::Mechanics,
    catalog:&crate::catalog::MenuCatalog,locale:Option<&Localization>)->Vec<SessionEvent> {
    settlement_messages(&mut game.events, None, catalog, locale, None, 0.)
}

/// Current0.119.0 145b13d30 publishes newly earned achievements before the
/// guest connection is replaced. The same formatter serves ordinary delivery.
pub(super) fn guest_account_messages(events:&mut Vec<RunEvent>, player_guid: Option<u64>,
    catalog:&crate::catalog::MenuCatalog,locale:Option<&Localization>,
    notifications:&mut super::super::notifications::Notifications,now:f32)->Vec<SessionEvent> {
    settlement_messages(events, player_guid, catalog, locale, Some(notifications), now)
}

fn achievement_messages(key:&str, player_guid: Option<u64>, catalog:&crate::catalog::MenuCatalog,
    label:&impl Fn(&str)->String)->Option<(Vec<SessionEvent>,String)> {
    let event=crate::progression::achievement_notification(key,catalog)?;
    let text=label("Achievement earned: {name} (+{n})")
        .replace("{name}",&event.name).replace("{n}",&event.points.to_string());
    let mut messages=vec![system_message(event.system_line),SessionEvent::PlaySound {sound_id:888}];
    if let Some(guid) = player_guid {
        messages.push(super::addon_banners::packet(guid, "achievement", false, &event.name, &text));
    }
    Some((messages,text))
}

fn settlement_messages(events:&mut Vec<RunEvent>, player_guid: Option<u64>, catalog:&crate::catalog::MenuCatalog,
    locale:Option<&Localization>,mut notifications:Option<&mut super::super::notifications::Notifications>,
    now:f32)->Vec<SessionEvent> {
    let mut messages=Vec::new();
    let label=|key:&str|locale.map_or_else(||catalog.label(key).to_owned(),|locale|locale.label(key).to_owned());
    for event in std::mem::take(events) {
        if let RunEvent::TalentXp {gain,before,total,class_key,parts}=event {
            let (_,notice)=talent_message(gain,before,total,class_key,parts,&label);
            messages.push(notice);
        } else if let RunEvent::HeroicProgress {class,zone_key,rank,open}=event {
            messages.push(system_message(super::super::heroic_progress::message(
                class,zone_key,rank,open,catalog,&label)));
        } else if let RunEvent::Achievement(key)=&event {
            if let Some(notifications)=notifications.as_deref_mut() {
                if let Some((packets,text))=achievement_messages(key,player_guid,catalog,&label) {
                    messages.extend(packets);
                    notifications.account_toast(text,now);
                }
            } else {events.push(event);}
        } else { events.push(event); }
    }
    messages
}

struct SharedBanner<'a> {
    kind: &'a str,
    name: super::super::mechanics::AnnouncementLabel,
    template: &'static str,
}

impl SharedBanner<'_> {
    fn render(&self, locale: &Localization, language: Option<&[u8]>) -> (String, String) {
        let label = |key: &str| match language {
            Some(language) => locale.label_for_language(key, language).to_owned(),
            None => locale.label(key).to_owned(),
        };
        let name = self.name.render(&label);
        let text = label(self.template).replace("{name}", &name);
        (name, text)
    }
}

fn publish_shared_banner(
    packets: &mut LocalPresentationEvents,
    coop: Option<&mut crate::coop_runtime::CoopRuntime>,
    notifications: &mut super::super::notifications::Notifications,
    now: f32,
    source_slot: u8,
    player_guid: u64,
    banner: SharedBanner<'_>,
    locale: &Localization,
    party: Option<&super::super::coop::CoopGame>,
) {
    let id = super::addon_banners::next_id();
    let (name, text) = banner.render(locale, None);
    let mut origin = None;
    if let Some(coop) = coop {
        let record = |name: &str, text: &str| serde_json::json!({
            "type": "banner", "id": id, "kind": banner.kind, "text": text, "name": name, "boss": true,
        });
        let localized = coop.actor_clients.iter().filter_map(|(&slot, &client)| {
            let language = party?.member_language(client)?;
            if language == locale.code().as_bytes() {
                return None;
            }
            let translated = banner.render(locale, Some(language));
            let value = record(&translated.0, &translated.1);
            if slot == source_slot {
                origin = Some(translated);
            }
            Some((client, value))
        }).collect();
        coop.send_value_localized_from(source_slot, &record(&name, &text), localized);
    }
    // The local frontend consumes the same record directly. A borrowed hero's
    // record reaches its own frontend and the host through the co-op route.
    if source_slot == 0 {
        notifications.banner(text.clone(), true, now);
    }
    let (name, text) = origin.unwrap_or((name, text));
    packets.0.push(super::addon_banners::packet_with_id(
        player_guid, id, banner.kind, true, &name, &text,
    ));
}

fn receive_coop(mut coop: Option<ResMut<crate::coop_runtime::CoopRuntime>>,
                mut terminal: ResMut<super::super::terminal::TerminalState>,
                mut markers: ResMut<super::super::raid_markers::MarkerInbox>,
                mut notifications: ResMut<super::super::notifications::Notifications>,
                time: Res<Time>) {
    let Some(coop) = coop.as_mut() else { return };
    for text in coop.take_events() {
        let Ok(value) = serde_json::from_str::<serde_json::Value>(&text) else { continue };
        match value.get("type").and_then(serde_json::Value::as_str) {
            Some("talentxp") => terminal.queue_talent(value),
            Some("hz" | "hzt" | "hzend" | "atk" | "atku" | "atkl" | "atka" | "atkx") => {
                markers.0.push(value);
            }
            Some("banner") => notifications.receive_banner(&value, time.elapsed_secs()),
            _ => {}
        }
    }
}

fn linear_move(guid:u64,start:Position,to:Position,duration_ms:u32,serial:u32)->SessionEvent {
    SessionEvent::MonsterMove {guid,transport:None,start:position(start),spline_id:serial,
        path:vec![position(start),position(to)],facing:MonsterMoveFacing::None,
        stop:false,duration_ms,flying:false,run_mode:true}
}

/// Current1458c3d4c normalizes a zero millisecond pet move to1.
fn pet_move(guid:u64,start:Position,to:Position,duration:f32,serial:u32)->SessionEvent {
    linear_move(guid,start,to,((duration*1000.) as u32).max(1),serial)
}

pub(super) fn player_mover(event: super::super::mechanics::PlayerMoverEvent) -> SessionEvent {
    use super::super::mechanics::PlayerMoverEvent;
    match event {
        PlayerMoverEvent::RunSpeed {counter,speed} => SessionEvent::ForceSpeedChange {
            guid:1,kind:benilla_app::local_client::events::SpeedKind::Run,counter,speed,
        },
        PlayerMoverEvent::Teleport {counter,position,facing} => SessionEvent::Teleport {
            guid:1,counter,position,orientation:facing,
        },
        PlayerMoverEvent::Root {counter,apply} => SessionEvent::MoveMode {
            guid:1,counter,mode:benilla_app::local_client::events::MoveMode::Root,apply,
        },
        PlayerMoverEvent::Knockback {counter,angle,speed} => SessionEvent::KnockBack {
            guid:1, counter, launch: JumpInfo {
                zspeed:-7., cos_angle:angle.cos(), sin_angle:angle.sin(), xy_speed:speed,
            },
        },
    }
}

/// Use the actual hero identity for the ordinary recovered mover fields.
fn player_mover_for(guid:u64,event:super::super::mechanics::PlayerMoverEvent)->SessionEvent {
    let mut event=player_mover(event);
    match &mut event {
        SessionEvent::ForceSpeedChange{guid:id,..}|SessionEvent::Teleport{guid:id,..}
        |SessionEvent::MoveMode{guid:id,..}|SessionEvent::KnockBack{guid:id,..}=>*id=guid,
        _=>{},
    }
    event
}

///14545c690 owns these exact ordinary swing fields. Its native caller has
/// already converted the chosen damage before entering the serializer.
fn melee(source:u64,target:u64,amount:u32,critical:bool)->SessionEvent {
    SessionEvent::AttackerState(AttackerState {attacker:source,victim:target,
        hit_info:2|(u32::from(critical)<<7),damage:amount,victim_state:1,
        absorb:0,resist:0,blocked:0,melee_spell_id:0,school:0})
}

///1454e75f0 sends exactly the supplied display and scale descriptor fields.
fn appearance(target:u64,model:u32,scale:f32)->SessionEvent {
    SessionEvent::ObjectValues {guid:target,fields:ObjectFields::from_pairs(&[(131,model),(4,scale.to_bits())])}
}

///14545ff20 emits opcode0xdd: packedGUID, XYZ, the supplied spline serial,
/// then moveType1. A stop has no facing, flags, duration or path payload.
fn stopped(target:u64,point:Position,serial:u32)->SessionEvent {
    SessionEvent::MonsterMove {guid:target,transport:None,start:position(point),spline_id:serial,
        path:Vec::new(),facing:MonsterMoveFacing::None,stop:true,duration_ms:0,flying:false,run_mode:false}
}

fn choice_movement(source: u64, from: Position, continuation: Option<(Position, f32)>,
    serial: u32, terrain: Option<&NativeTerrain>) -> SessionEvent {
    let resolve_height = |mut point: Position| {
        if let Some(z) = terrain.and_then(|floor| floor.actor_movement_height([point.x, point.y])) {
            point.z = z;
        }
        point
    };
    let start = resolve_height(from);
    match continuation {
        Some((to, remaining)) => {
            let duration_ms = ((remaining * 1000.0) as u32).max(1);
            linear_move(source, start, resolve_height(to), duration_ms, serial)
        }
        None => stopped(source, start, serial),
    }
}

/// The 0.140.0 serializer sends type 3, a raw target GUID, flags 0x100,
/// one millisecond and one destination equal to the supplied start.
fn stationary_facing(source:u64,point:Position,serial:u32,target:u64)->SessionEvent {
    let start=position(point);
    SessionEvent::MonsterMove {guid:source,transport:None,start,spline_id:serial,
        path:vec![start,start],facing:MonsterMoveFacing::Target(target),stop:false,
        duration_ms:1,flying:false,run_mode:true}
}

/// Current actor-hit1454d57e4..5815 changes only the logged spell identity.
fn logged_spell(spell_id:u32)->u32 {
    match spell_id { 16038=>8349,14186=>2098,5308=>20647,_=>spell_id }
}

/// 0.141.1 projectile publication reads the resolved ranged appearance's weapon kind.
fn shot_ammo(spell_id: u32, ranged_gun: bool) -> Option<u32> {
    matches!(spell_id, 75 | 2643 | 19434).then_some(if ranged_gun { 5998 } else { 5996 })
}

/// Native 0.141.1 145f16880 writes the source twice, then the hit list, target and optional ammo.
fn spell_go(cast: SpellCast, ammo_display_id: Option<u32>) -> SessionEvent {
    let (target,dest)=match cast.target {
        CastTarget::None=>(None,None),
        CastTarget::Unit(guid)=>(Some(guid),None),
        CastTarget::Ground(point)=>(None,Some(position(point))),
    };
    SessionEvent::SpellGo { caster:cast.source_guid,unit_caster:cast.source_guid,spell_id:cast.spell_id,
        cast_flags:0x100 | if ammo_display_id.is_some() { 0x20 } else { 0 },
        hits:cast.hit_targets.into_iter().take(255).collect(),
        misses:Vec::new(),target,go_target:None,dest,ammo_display_id,
        ammo_inventory_type:ammo_display_id.map(|_| 24),item_caster:None,
        target_mask: azeroth_survivors_re::coop::engine_packets::spell_target_mask(target, None, dest), source: None }
}

fn object(guid:u64,kind:EntityKind,point:Position,orientation:f32,
          rows:&[(u16,u32)])->SessionEvent {
    let object_type=match kind {
        EntityKind::Unit=>ObjectType::Unit,
        EntityKind::GameObject=>ObjectType::GameObject,
        EntityKind::DynamicObject=>ObjectType::DynamicObject,
        _=>unreachable!("run object packet has an explicit recovered type"),
    };
    let raw=|key|rows.iter().find_map(|&(field,value)|(field==key).then_some(value));
    let fields=ObjectFields::from_pairs(rows).into_created(object_type);
    let display_id=match kind {
        EntityKind::Unit=>raw(131).filter(|id|*id!=0),
        EntityKind::GameObject=>raw(8).filter(|id|*id!=0),
        _=>None,
    };
    let scale=raw(4).map_or(1.,f32::from_bits);
    SessionEvent::ObjectCreate { guid,kind,display_id,position:position(point),orientation,
        scale,speeds:None,mover:None,transport_progress:None,transport:None,spline:None,fields }
}

fn route_run_event(
    coop: &mut crate::coop_runtime::CoopRuntime,
    party: Option<&super::super::coop::CoopGame>,
    locale: &Localization,
    source: u8,
    event: &SessionEvent,
) -> bool {
    use azeroth_survivors_re::coop::engine_packets::encode;
    let packet = match encode(event, None) {
        Ok(Some(packet)) => packet,
        Ok(None) => return false,
        Err(error) => {
            if source != 0 {
                warn!("Co-op event encoding incomplete: {error:?}");
            }
            return false;
        }
    };
    let (Some(party), SessionEvent::Chat(chat)) = (party, event) else {
        return coop.route_engine(source, packet);
    };
    if !matches!(chat.chat_type, 0x0c | 0x5a) {
        return coop.route_engine(source, packet);
    }
    let localized = coop.actor_clients.values().filter_map(|&client| {
        let language = party.member_language(client)?;
        let speaker = chat.sender_name.as_deref().unwrap_or("");
        let name = locale.translate_announcement(speaker, language);
        let text = locale.translate_announcement(&chat.text, language);
        if name == speaker && text == chat.text {
            return None;
        }
        let mut chat = chat.clone();
        chat.sender_name = Some(name.to_owned());
        chat.text = text.to_owned();
        let packet = encode(&SessionEvent::Chat(chat), None).ok().flatten()?;
        Some((client, packet))
    }).collect();
    coop.route_engine_localized(source, packet, localized)
}

fn collect(mut session:ResMut<RunSession>,menu:Res<MenuState>,
           mut terminal:ResMut<super::super::terminal::TerminalState>,
           mut packets:ResMut<LocalPresentationEvents>,mut unsupported:Local<HashSet<&'static str>>,
           mut notifications:ResMut<super::super::notifications::Notifications>,
           mut loot:ResMut<super::super::run_hud::LootNotices>,
           mut markers:ResMut<super::super::raid_markers::MarkerInbox>,
           time:Res<Time>,locale:Res<Localization>,catalog:Res<crate::catalog::MenuCatalog>,
           mut coop:Option<ResMut<crate::coop_runtime::CoopRuntime>>,
           mut party:Option<ResMut<super::super::coop::CoopGame>>,
           floor:Option<Res<super::super::world::NativeFloor>>) {
    let RunSession { mechanics, recovery, .. } = &mut *session;
    let Some(game)=mechanics.as_mut() else { return };
    // Taking the buffer exactly once also handles a run paused immediately
    // after a cast or choice. It does not replay its last tick every frame.
    if menu.in_run { game.publish_party_fall_banners(); }
    let events=std::mem::take(&mut game.events);
    if !menu.in_run { return; }
    let player_guid=game.player_guid;
    let remote=game.take_party_events();
    let mut local=LocalPresentationEvents::default();
    project(events,player_guid,game.uses_ranged_gun(player_guid),0,&mut local,&mut unsupported,&mut notifications,&mut loot,&mut markers,
        time.elapsed_secs(),&locale,&catalog,coop.as_deref_mut(),Some(&mut terminal),None,party.as_deref(),
        floor.as_deref().and_then(|floor| floor.terrain_ref()));
    for event in local.0 {
        if let SessionEvent::Teleport { position, counter, .. } = &event {
            recovery.bind_teleport_counter(*position, *counter);
        }
        if let Some(coop)=coop.as_deref_mut() {
            route_run_event(coop, party.as_deref(), &locale, 0, &event);
        }
        packets.0.push(event);
    }
    for (_,guid,events) in remote {
        // World identity is independent of transport membership. Resolve the
        // stable source GUID before selecting a private recipient.
        let Some(slot)=game.party_slot(guid) else { continue };
        let client = coop.as_deref().and_then(|runtime| runtime.actor_clients.get(&slot)).copied();
        let language = client.and_then(|client| party.as_deref()?.member_language(client));
        let mut projected=LocalPresentationEvents::default();
        project(events,guid,game.uses_ranged_gun(guid),slot,&mut projected,&mut unsupported,&mut Default::default(),&mut Default::default(),
            &mut Default::default(),time.elapsed_secs(),&locale,&catalog,coop.as_deref_mut(),None,language,party.as_deref(),None);
        for event in projected.0 {
            if let (Some(client), Some(party), SessionEvent::Teleport { position, counter, .. }) =
                (client, party.as_deref_mut(), &event)
            {
                party.bind_remote_teleport(client, *position, *counter);
            }
            if let Some(coop)=coop.as_deref_mut() {
                if route_run_event(coop, party.as_deref(), &locale, slot, &event) {
                    packets.0.push(event);
                }
            }
        }
    }
}

fn project(events:Vec<RunEvent>,player_guid:u64,ranged_gun:bool,source_slot:u8,packets:&mut LocalPresentationEvents,
    unsupported:&mut HashSet<&'static str>,notifications:&mut super::super::notifications::Notifications,
    loot:&mut super::super::run_hud::LootNotices,markers:&mut super::super::raid_markers::MarkerInbox,
    now:f32,locale:&Localization,catalog:&crate::catalog::MenuCatalog,
    mut coop:Option<&mut crate::coop_runtime::CoopRuntime>,
    mut terminal:Option<&mut super::super::terminal::TerminalState>,
    recipient_language:Option<&[u8]>, party:Option<&super::super::coop::CoopGame>,
    terrain:Option<&NativeTerrain>) {
    for event in events {
        let missing=match event {
            RunEvent::TalentXp {gain,before,total,class_key,parts}=>{
                let (value,notice)=talent_message(gain,before,total,class_key,parts,
                    &|key|locale.label(key).to_owned());
                packets.0.push(notice);
                if let Some(coop)=coop.as_mut() { coop.send_value_from(source_slot,&value); }
                if let Some(terminal)=terminal.as_mut() { terminal.queue_talent(value); }
                None
            },
            RunEvent::ActorMovement{source,movement,serial}=>{
                packets.0.push(linear_move(source,movement.from,movement.to,
                    ((movement.duration*1000.) as u32).max(1),serial));None
            },
            RunEvent::ChoiceMovement {source,from,continuation,serial}=>{
                packets.0.push(choice_movement(source,from,continuation,serial,terrain));None
            },
            RunEvent::ActorFields {target,fields}=>{
                packets.0.push(SessionEvent::ObjectValues {guid:target,fields:ObjectFields::from_pairs(&fields)});None
            },
            RunEvent::ActorHealing {target,spell_id,amount,fields}=>{
                packets.0.push(SessionEvent::ObjectValues {guid:target,fields:ObjectFields::from_pairs(&fields)});
                if spell_id != 0 {
                    packets.0.push(SessionEvent::SpellHealLog(SpellHealLog {target,healer:target,
                        spell_id,amount:amount as u32,critical:false}));
                }
                None
            },
            RunEvent::ActorCast {source,spell_id,seconds}=>{
                packets.0.push(SessionEvent::SpellStart {caster:source,spell_id,cast_flags:2,
                    cast_time_ms:(seconds*1000.) as u32,target:Some(player_guid),ammo_display_id:None});
                None
            },
            RunEvent::RaidCast {source,spell_id,seconds}=>{
                if let Some(cast_time_ms)=azeroth_survivors_re::raid_markers::windup_millis(spell_id,seconds) {
                    packets.0.push(SessionEvent::SpellStart {caster:source,spell_id,cast_flags:2,
                        cast_time_ms,target:None,ammo_display_id:None});
                }
                None
            },
            RunEvent::RaidTransformCast {source,spell_id,seconds}=>{
                if let Some(cast_time_ms)=azeroth_survivors_re::raid_markers::windup_millis(spell_id,seconds) {
                    packets.0.push(SessionEvent::SpellStart {caster:source,spell_id,cast_flags:2,
                        cast_time_ms,target:None,ammo_display_id:None});
                    packets.0.push(spell_go(SpellCast {source_guid:source,spell_id,
                        target:CastTarget::None,hit_targets:Vec::new()},None));
                }
                None
            },
            RunEvent::RaidSpellGo(cast)=>{
                packets.0.push(spell_go(cast,None));None
            },
            RunEvent::RaidMarker(value)=>{
                if let Some(coop)=coop.as_mut() { coop.send_value_from(source_slot,&value); }
                markers.0.push(value);None
            },
            RunEvent::RaidFacing {source,position:point,serial,angle}=>{
                let start=position(point);
                packets.0.push(SessionEvent::MonsterMove {guid:source,transport:None,start,
                    spline_id:serial,path:vec![start],facing:MonsterMoveFacing::Angle(angle),
                    stop:false,duration_ms:1,flying:false,run_mode:true});None
            },
            RunEvent::RaidCharge {source,movement,serial,duration_ms}=>{
                packets.0.push(SessionEvent::MonsterMove {guid:source,transport:None,
                    start:position(movement.from),spline_id:serial,path:vec![position(movement.to)],
                    facing:MonsterMoveFacing::None,stop:false,duration_ms:duration_ms.max(1),
                    flying:false,run_mode:true});None
            },
            RunEvent::EquipmentLoot {id,is_new}=>{loot.push(id,is_new,now);None},
            RunEvent::GearReceipt {id,race,is_new,marks_tenths}=>{
                if let Some(message)=gear_receipt(id,race,is_new,marks_tenths,catalog,
                    &|key|locale.label(key).to_owned()) { packets.0.push(message); }
                None
            },
            RunEvent::MarksEarned {earned,total_tenths}=>{
                packets.0.push(marks_earned(earned,total_tenths,&|key|locale.label(key).to_owned()));None
            },
            RunEvent::GuardianFlag {position,enemy}=>{
                let name=enemy.map_or_else(String::new,|(id,fallback,held)|{
                    let name=super::addon_scalars::localized(&locale,format!("enemy.{id}"),fallback);
                    if held { format!("{name} (Guardian)") } else { format!("{name}'s lair (empty)") }
                });
                packets.0.push(SessionEvent::GossipPoi(benilla_app::local_client::events::GossipPoi {
                    flags:99,pos:[position.x,position.y],icon:6,data:0,name,
                }));None
            },
            RunEvent::PlayerMover(event)=>{packets.0.push(player_mover_for(player_guid,event));None},
            RunEvent::StationaryFacing {source,position,serial,target}=>{
                packets.0.push(stationary_facing(source,position,serial,target));None
            },
            RunEvent::Achievement(key)=>{
                if let Some((messages,text))=achievement_messages(&key,Some(player_guid),catalog,&|key|locale.label(key).to_owned()) {
                    packets.0.extend(messages);
                    notifications.toast(text,now);
                }
                None
            },
            RunEvent::Spell(cast)=>{
                let ammo = if cast.source_guid == player_guid {
                    shot_ammo(cast.spell_id, ranged_gun)
                } else {
                    None
                };
                packets.0.push(spell_go(cast,ammo));
                None
            },
            RunEvent::Ground(row)=>{ packets.0.push(object(row.guid,EntityKind::DynamicObject,
                row.position,0.,&row.fields));None },
            RunEvent::ScriptedUnit(row) => {
                let mut event = object(row.guid, EntityKind::Unit, row.position, row.orientation, &row.fields);
                if let SessionEvent::ObjectCreate { speeds, .. } = &mut event {
                    *speeds = Some(benilla_app::local_client::events::MoveSpeeds {
                        walk: 2.5, run: 7., run_back: 4.5, swim: f32::from_bits(0x40971c71),
                        swim_back: 2.5, turn_rate: std::f32::consts::PI,
                    });
                }
                packets.0.push(event);
                None
            }
            RunEvent::GroundMoved {target,position:point}=>{
                packets.0.push(SessionEvent::ObjectMove {guid:target,position:position(point),orientation:0.});
                packets.0.push(SessionEvent::ObjectValues {guid:target,fields:ObjectFields::from_pairs(&[
                    (11,point.x.to_bits()),(12,point.y.to_bits()),(13,point.z.to_bits()),
                ])});None
            },
            RunEvent::Totem(row)=>{ packets.0.push(object(row.guid,EntityKind::Unit,
                row.position,0.,&row.fields));None },
            RunEvent::Pet(row)=>{ packets.0.push(object(row.guid,EntityKind::Unit,
                row.position,0.,&row.fields));None },
            RunEvent::LootCompanion {object:row,run_speed}=>{
                let mut event=object(row.guid,EntityKind::Unit,row.position,0.,&row.fields);
                if let SessionEvent::ObjectCreate {speeds,..}=&mut event {
                    *speeds=Some(benilla_app::local_client::events::MoveSpeeds {walk:2.5,run:run_speed,run_back:4.5,
                        swim:f32::from_bits(0x40971c71),swim_back:2.5,turn_rate:std::f32::consts::PI});
                }
                packets.0.push(event);None
            },
            RunEvent::PetMove {guid,start,to,duration,serial}=>{
                packets.0.push(pet_move(guid,start,to,duration,serial));None
            },
            RunEvent::PickupMove {guid,start,to,duration,serial}=>{
                packets.0.push(linear_move(guid,start,to,(duration*1000.) as u32,serial));None
            },
            RunEvent::Lightwell(row)|RunEvent::BoundaryPillar(row)|RunEvent::PickupObject(row)=>{ packets.0.push(object(row.guid,
                match row.object_type { 3=>EntityKind::Unit,5=>EntityKind::GameObject,_=>unreachable!("recovered pickup object kind") },
                row.position,row.orientation,&row.fields));None },
            RunEvent::RemoveObject(guid)=>{ packets.0.push(SessionEvent::ObjectDestroyed(guid));None },
            RunEvent::PassiveStarted(row)=>{
                // Native opcode135 follows the duration-bearing cooldown packet.
                packets.0.push(SessionEvent::SpellCooldowns { caster:row.player_guid,
                    cooldowns:vec![(row.spell_id,row.cooldown_milliseconds)] });
                packets.0.push(SessionEvent::CooldownEvent { spell_id:row.spell_id,caster:row.player_guid });
                None
            },
            RunEvent::ResourceBar(_)=>None, // Same authoritative player descriptor in client.rs.
            RunEvent::Account {kind,name}=>{
                let key = match kind {
                    "bossdown" => Some("{name} is defeated!"),
                    "guardian" => Some("{name} is slain! Its hoard and a level."),
                    _ => None,
                };
                if let Some(key) = key {
                    publish_shared_banner(
                        packets, coop.as_deref_mut(), notifications, now,
                        source_slot, player_guid, SharedBanner { kind, name, template: key }, locale, party,
                    );
                }
                None
            },
            RunEvent::BossBanner {id,name,final_boss}=>{
                let name=super::super::mechanics::AnnouncementLabel::boss(id, name);
                let (kind,key)=if final_boss { ("finalboss","{name} has come!") }
                    else { ("boss","{name} approaches!") };
                publish_shared_banner(
                    packets, coop.as_deref_mut(), notifications, now,
                    source_slot, player_guid, SharedBanner { kind, name, template: key }, locale, party,
                );
                None
            },
            RunEvent::ZoneUnlocked {key,name}=>{
                let name=super::addon_scalars::localized(&locale,key,&name);
                packets.0.push(super::addon_banners::packet(player_guid,"unlocked",false,&name,
                    &locale.label("{zone} is now open!").replace("{zone}",&name)));None
            },
            RunEvent::Magnet(_)=>None, // Recovered pickup flight is rendered from the live collection.
            RunEvent::MissingPassiveBinding { owner,.. }=>Some(owner),
            RunEvent::Damage { source,causal_source,target,spell_id,school,amount,critical,periodic,emit_log,meter_attribution,.. }=>{
                let attribution = meter_attribution.map(|(descriptor, source_key)| CombatTextAttribution {
                    source_name: super::super::addon_meters::source_name(descriptor, locale),
                    source_key,
                });
                if emit_log {
                    packets.0.push(SessionEvent::SpellDamageLog(SpellDamageLog { target,attacker:source,
                        spell_id:logged_spell(spell_id),damage:amount as u32,school,absorb:0,resist:0,
                        periodic,blocked:0,hit_info:if critical {2} else {0} }));
                }
                if let Some(attribution) = attribution {
                    let matches = |packet: &SessionEvent| match packet {
                        SessionEvent::SpellDamageLog(hit) => emit_log && hit.attacker == source && hit.target == target,
                        SessionEvent::AttackerState(hit) => matches!(spell_id, 0 | 883)
                            && hit.attacker == causal_source && hit.victim == target,
                        SessionEvent::PeriodicAuraLog(hit) => !emit_log && hit.spell_id == spell_id
                            && hit.caster == source && hit.target == target,
                        _ => false,
                    };
                    if packets.0.last().is_some_and(matches) {
                        let hit = Box::new(packets.0.pop().expect("matched latest hit"));
                        packets.0.push(SessionEvent::AttributedCombatHit { hit, attribution });
                    }
                }
                None
            },
            RunEvent::Melee {source,target,amount,critical}=>{
                packets.0.push(melee(source,target,amount,critical));None
            },
            RunEvent::PeriodicDamage { source,target,spell_id,school,amount }=>{
                packets.0.push(SessionEvent::PeriodicAuraLog(PeriodicAuraLog { target,caster:source,
                    spell_id,ticks:vec![PeriodicTick::Damage { amount:amount as u32,
                        school:u32::from(school),absorb:0,resist:0 }] }));
                None
            },
            RunEvent::Healing { amount,context,emit_log,fields }=>{
                if emit_log {
                    let context=context.expect("native heal log admitted with a spell identity");
                    packets.0.push(SessionEvent::SpellHealLog(SpellHealLog { target:context.target,
                        healer:context.source,spell_id:context.spell_id,amount:amount as u32,
                        critical:context.critical }));
                }
                packets.0.push(SessionEvent::ObjectValues { guid:player_guid,fields:ObjectFields::from_pairs(&fields) });
                None
            },
            RunEvent::PlayerDamage {fields,..}=>{
                packets.0.push(SessionEvent::ObjectValues {guid:player_guid,fields:ObjectFields::from_pairs(&fields)});None
            },
            RunEvent::EnemyDied { .. }=>None, // Current actor descriptor/rig owns death.
            RunEvent::Aura { target,fields,.. }=>{
                if !fields.is_empty() {
                    packets.0.push(SessionEvent::ObjectValues { guid:target,fields:ObjectFields::from_pairs(&fields) });
                    None
                } else if target==player_guid { Some("native_player_aura_descriptor") }
                else { None }
            },
            RunEvent::Appearance {target,model,scale}=>{packets.0.push(appearance(target,model,scale));None},
            RunEvent::RestoreAppearance {target,appearance:row}=>{
                packets.0.push(appearance(target,row.metadata_word_36,row.actor_float_264));None
            },
            RunEvent::StoppedMovement {target,position,serial}=>{packets.0.push(stopped(target,position,serial));None},
            RunEvent::Announcement(event)=>{
                packets.0.push(SessionEvent::Chat(event.chat(&|key|locale.lookup(key).map(str::to_owned))));None
            },
            RunEvent::LevelUp(level)=>{
                packets.0.push(SessionEvent::ObjectValues {guid:player_guid,
                    fields:ObjectFields::from_pairs(&[(34,level)])});None
            },
            RunEvent::PlayerValues(fields)=>{
                packets.0.push(SessionEvent::ObjectValues {guid:player_guid,
                    fields:ObjectFields::from_pairs(&fields)});None
            },
            RunEvent::CacheNotice(message)=>{
                use azeroth_survivors_re::treasure_chests::ChestMessage;
                let text=match message {
                    ChestMessage::NeedsGold {n}=>locale.label("This cache needs {n} gold.")
                        .replace("{n}",&n.to_string()),
                    ChestMessage::ClickRequired=>locale.label("Right-click a cache to buy it.").to_owned(),
                };
                if matches!(message,ChestMessage::NeedsGold {..}) {
                    packets.0.push(SessionEvent::Notification {text:text.clone()});
                }
                packets.0.push(super::addon_banners::packet(player_guid,"cache",false,"",&text));
                notifications.toast(text,now);None
            },
            RunEvent::Toast {kind,name,text}=>{
                let label=|key:&str|locale.label(key).to_owned();
                let text=text.render(&label);
                packets.0.push(super::addon_banners::packet(player_guid,kind,false,&name.render(&label),&text));
                notifications.toast(text,now);None
            },
            RunEvent::PartyBanner(banner) => {
                let recipient_locale = recipient_language
                    .map(|code| locale.for_code(std::str::from_utf8(code).unwrap_or("")));
                packets.0.push(super::addon_banners::party_packet(
                    player_guid, banner, recipient_locale.as_ref().unwrap_or(locale),
                ));
                None
            },
            RunEvent::PlaySound(sound_id)=>{packets.0.push(SessionEvent::PlaySound {sound_id});None},
            RunEvent::Notification(text)=>{
                packets.0.push(SessionEvent::Notification {text:text.render(&|key|locale.label(key).to_owned())});None
            },
            RunEvent::SystemMessage(text)=>{
                packets.0.push(system_message(text.render(&|key|locale.label(key).to_owned())));None
            },
            RunEvent::HeroicProgress {class,zone_key,rank,open}=>{
                packets.0.push(system_message(super::super::heroic_progress::message(
                    class,zone_key,rank,open,catalog,&|key|locale.label(key).to_owned())));None
            },
            RunEvent::PlayerDied|RunEvent::Victory=>None, // Run lifecycle owns these states.
        };
        if let Some(owner)=missing {
            if unsupported.insert(owner) { warn!("Recovered run presentation still needs {owner}"); }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn shared_banner_renders_for_the_recipient_before_publication() {
        let banner = SharedBanner {
            kind: "boss",
            name: super::super::super::mechanics::AnnouncementLabel::literal("The Example"),
            template: "{name} approaches!",
        };
        let locale = Localization::english_for_tests();
        assert_eq!(banner.render(&locale, Some(b"pl")),
            ("The Example".to_owned(), "The Example nadciąga!".to_owned()));
        assert_eq!(banner.render(&locale, Some(b"unknown")), banner.render(&locale, None));
    }

    #[test]
    fn currency_receipts_keep_native_fractional_text_and_colored_suffixes() {
        let catalog=crate::catalog::MenuCatalog::embedded();
        let label=|key:&str|match key {
            "marks.gained"=>"+{n} marks".to_owned(),
            "marks.earned"=>"You earn {n} marks ({total} in all).".to_owned(),
            _=>key.to_owned(),
        };
        let Some(SessionEvent::Chat(chat))=gear_receipt(101000,1,false,5,&catalog,&label) else { panic!() };
        assert!(chat.text.starts_with("You receive loot: |cffffffff["));
        assert!(chat.text.ends_with(" |cff9d9d9d(already collected)|r |cffffd100+0.5 marks|r"));
        assert!(!chat.text.contains("|H"));
        let SessionEvent::Chat(chat)=marks_earned(1.49,25,&label) else { panic!() };
        assert_eq!(chat.text,"|cffffd100You earn 1.4 marks (2.5 in all).|r");
        assert!(gear_receipt(1,1,true,0,&catalog,&label).is_none());
    }
    #[test]
    fn shared_mover_packets_keep_the_native_counter_and_existing_client_consumers() {
        use super::super::super::mechanics::PlayerMoverEvent as M;
        assert!(matches!(player_mover(M::RunSpeed {counter:7,speed:8.0}),
            SessionEvent::ForceSpeedChange {guid:1,counter:7,speed,
                kind:benilla_app::local_client::events::SpeedKind::Run} if speed==8.0));
        assert!(matches!(player_mover(M::Teleport {counter:8,position:[1.0,2.0,3.0],facing:0.5}),
            SessionEvent::Teleport {guid:1,counter:8,position,orientation}
                if position==[1.0,2.0,3.0] && orientation==0.5));
        for (counter,apply) in [(u32::MAX,true),(0,false)] {
            assert!(matches!(player_mover(M::Root {counter,apply}),
                SessionEvent::MoveMode {guid:1,counter:actual,apply:enabled,
                    mode:benilla_app::local_client::events::MoveMode::Root}
                    if actual==counter && enabled==apply));
        }
    }
    #[test]
    fn stationary_facing_preserves_the_current_native_packet_contract() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/mob-movement/stationary-facing-fixtures.json"
        )).unwrap();
        for row in fixture["cases"].as_array().unwrap() {
            let point=Position{x:row["from_point"][0].as_f64().unwrap() as f32,
                y:row["from_point"][1].as_f64().unwrap() as f32,
                z:row["from_point"][2].as_f64().unwrap() as f32};
            let source=row["source_guid"].as_u64().unwrap();
            let target=row["target_guid"].as_u64().unwrap();
            let serial=row["serial"].as_u64().unwrap() as u32;
            let SessionEvent::MonsterMove {guid,transport,start,spline_id,path,facing,
                stop,duration_ms,flying,run_mode}=stationary_facing(source,point,serial,target)
                else {panic!("stationary facing")};
            assert_eq!((guid,spline_id),(source,serial));
            assert_eq!(start,position(point));
            assert_eq!(path,[start,start]);
            assert!(matches!(facing,MonsterMoveFacing::Target(guid) if guid==target));
            assert_eq!(duration_ms,row["duration_ms"].as_u64().unwrap() as u32);
            assert!(transport.is_none() && !stop && !flying && run_mode);
        }
    }
    #[test]
    fn spell_packet_preserves_ground_target_hit_order_and_native_hit_limit() {
        let SessionEvent::SpellGo { caster,unit_caster,spell_id,cast_flags,hits,target,dest,.. }=spell_go(SpellCast {
            source_guid:17,spell_id:133,target:CastTarget::Ground(Position{x:1.,y:2.,z:3.}),
            hit_targets:(1000..1300).collect(),
        },None) else { panic!("spell go") };
        assert_eq!((caster,spell_id,cast_flags),(17,133,0x100));
        assert_eq!(unit_caster,caster);
        assert_eq!(hits,(1000..1255).collect::<Vec<_>>());
        assert_eq!(target,None);assert_eq!(dest,Some([1.,2.,3.]));
    }
    #[test]
    fn native_hunter_shots_carry_the_equipped_weapon_ammo() {
        for (spell_id, ranged_gun, expected) in [
            (75, true, Some(5998)),
            (2643, true, Some(5998)),
            (19434, true, Some(5998)),
            (75, false, Some(5996)),
            (2643, false, Some(5996)),
            (19434, false, Some(5996)),
            (3044, true, None),
            (1978, true, None),
        ] {
            let cast = SpellCast {
                source_guid: 1,
                spell_id,
                target: CastTarget::Unit(2),
                hit_targets: vec![2],
            };
            let SessionEvent::SpellGo { cast_flags, ammo_display_id, ammo_inventory_type, .. } =
                spell_go(cast, shot_ammo(spell_id, ranged_gun))
            else { panic!("spell go") };
            assert_eq!(ammo_display_id, expected);
            assert_eq!(ammo_inventory_type, expected.map(|_| 24));
            assert_eq!(cast_flags, if expected.is_some() { 0x120 } else { 0x100 });
        }
    }

    #[test]
    fn recovered_dynamic_object_rows_reach_the_normal_descriptor_without_filling_key_five() {
        let mut serial=0u32;
        let row=azeroth_survivors_re::bosses::abilities::ground_object(&mut serial,1,10,8.,
            Position{x:1.,y:2.,z:3.});
        let SessionEvent::ObjectCreate { kind,fields,position,display_id,.. }=object(row.guid,
            EntityKind::DynamicObject,row.position,0.,&row.fields) else { panic!("object create") };
        assert_eq!(kind,EntityKind::DynamicObject);assert_eq!(position,[1.,2.,3.]);
        assert_eq!(display_id,None);assert_eq!(fields.dynamicobject_spell_id(),Some(10));
        assert!(!fields.raw_fields().any(|(key,_)|key==5));
    }
    #[test]
    fn appearance_preserves_exact_native_rows_and_stop_preserves_its_serial_and_position() {
        let scale=f32::from_bits(0x7fc01234);
        let SessionEvent::ObjectValues {guid,fields}=appearance(17,856,scale) else {panic!("appearance")};
        assert_eq!(guid,17);assert_eq!(fields.raw_fields().collect::<Vec<_>>(),[(4,scale.to_bits()),(131,856)]);
        let SessionEvent::MonsterMove {guid,start,spline_id,path,facing,stop,duration_ms,..}=
            stopped(18,Position{x:1.,y:2.,z:3.},u32::MAX) else {panic!("stop")};
        assert_eq!((guid,start,spline_id),(18,[1.,2.,3.],u32::MAX));assert!(path.is_empty());
        assert!(matches!(facing,MonsterMoveFacing::None));assert!(stop);assert_eq!(duration_ms,0);
    }
    #[test]
    fn native_melee_packet_preserves_callsite_identity_and_chosen_integer_damage() {
        for (critical,hit_info) in [(false,2),(true,0x82)] {
            let SessionEvent::AttackerState(log)=melee(17,1,u32::MAX,critical) else {panic!("melee")};
            assert_eq!((log.attacker,log.victim,log.damage,log.hit_info),(17,1,u32::MAX,hit_info));
            assert_eq!((log.victim_state,log.absorb,log.resist,log.blocked,log.melee_spell_id,log.school),
                (1,0,0,0,0,0));
        }
    }
    #[test]
    fn companion_attribution_wraps_the_matching_melee_packet() {
        for (spell_id, name, icon, key) in [
            (0, "Doomguard", "Spell_Shadow_SummonDoomGuard", "demon:cleave"),
            (883, "Wolf", "Ability_Hunter_BeastTaming", "demon:wolf_bite"),
        ] {
            let mut packets = LocalPresentationEvents::default();
            let source = azeroth_survivors_re::run_effects::healing::MeterSource {
                name, icon, talent: false,
            };
            project(
                vec![
                    RunEvent::Melee { source: 17, target: 19, amount: 8, critical: false },
                    RunEvent::Damage {
                        source: 1, causal_source: 17, target: 19, spell_id, school: 0,
                        raw_power: 8.0, amount: 8.0, critical: false, source_kind: 2,
                        meter_attribution: Some((source, key.into())),
                        periodic: false, emit_log: false,
                    },
                ],
                1,
                false,
                0,
                &mut packets,
                &mut HashSet::new(),
                &mut Default::default(),
                &mut Default::default(),
                &mut Default::default(),
                1.0,
                &Localization::english_for_tests(),
                &crate::catalog::MenuCatalog::embedded(),
                None,
                None,
                None,
                None,
                None,
            );
            let [SessionEvent::AttributedCombatHit { hit, attribution }] = packets.0.as_slice() else {
                panic!("expected one attributed melee packet");
            };
            assert!(matches!(hit.as_ref(), SessionEvent::AttackerState(hit)
                if hit.attacker == 17 && hit.victim == 19 && hit.damage == 8));
            assert_eq!(attribution.source_name, name);
            assert_eq!(attribution.source_key, key);
        }
    }
    #[test]
    fn current_pet_movement_packet_preserves_native_duration_boundaries() {
        let fixture:serde_json::Value=serde_json::from_str(include_str!(
            "../../../../../docs/analysis/evidence/demon-movement/native-cases.json"
        )).unwrap();
        for row in fixture["move"]["cases"].as_array().unwrap() {
            let Some(packet)=row["packet"].as_object() else {continue};
            let point=|key:&str| {
                let values=packet[key].as_array().unwrap();
                Position{x:f32::from_bits(values[0].as_u64().unwrap() as u32),
                    y:f32::from_bits(values[1].as_u64().unwrap() as u32),
                    z:f32::from_bits(values[2].as_u64().unwrap() as u32)}
            };
            let from=point("start_bits");let to=point("to_bits");
            let duration=f32::from_bits(row["state_bits"][7].as_u64().unwrap() as u32);
            let guid=packet["guid"].as_u64().unwrap();
            let serial=packet["serial"].as_u64().unwrap() as u32;
            let SessionEvent::MonsterMove{guid:actual,start,spline_id,path,facing,stop,duration_ms,flying,run_mode,..}=
                pet_move(guid,from,to,duration,serial) else {panic!("pet movement")};
            assert_eq!((actual,start,spline_id),(guid,position(from),serial));
            assert_eq!(path,vec![position(from),position(to)]);
            assert_eq!(duration_ms,(packet["raw_duration_ms"].as_u64().unwrap() as u32).max(1));
            assert!(matches!(facing,MonsterMoveFacing::None));
            assert!(!stop && !flying && run_mode);
        }
    }
}
