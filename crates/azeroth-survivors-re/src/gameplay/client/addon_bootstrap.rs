//! Recovered addon API, installed in each real client VM.
//!
//! The exact 0.127.0 API, including the recovered affix/totem and screen-frame accessors.
//! The ordinary core-file load installs it in WorldStateFrame.lua before addons.

use benilla_app::local_client::LocalClientExtension;

mod creature_sound;

const SOURCE: &str =
    include_str!("../../../../../docs/analysis/evidence/0.127.0/embedded-api.lua");
const LOCAL_CLOCK_API: &str =
    include_str!("../../../../../docs/analysis/evidence/0.139.1/embedded-api.lua");
const COMBAT_TEXT_FRAME_HANDLERS: &str =
    include_str!("../../../../../docs/analysis/evidence/0.139.2/combat-text/frame-handlers.lua");
const STATS_PARSER: &str = include_str!(
    "../../../../../docs/analysis/evidence/0.105.0/addon-bridge/native-stats-parser.lua"
);

pub(super) fn extension() -> LocalClientExtension {
    let cvar_defaults = [
        ("storeLevels".into(), "0".into()),
        ("spendLevels".into(), "0".into()),
        (
            crate::native_bindings::SKIP_CVAR.into(),
            crate::native_bindings::DEFAULT_SKIP_KEY.into(),
        ),
    ]
    .into_iter()
    .chain(super::super::run_hud::defaults())
    .collect::<Vec<(String, String)>>();
    let parts = super::super::run_hud::PARTS
        .into_iter()
        .map(|(part, name)| format!("{part} = '{name}'"))
        .collect::<Vec<_>>()
        .join(", ");
    let clock_start = LOCAL_CLOCK_API.find("function AZS_GetLocalTime()").unwrap();
    let clock = &LOCAL_CLOCK_API[clock_start..];
    let (clock, _) = clock.split_once("-- Outgoing combat text").unwrap();
    assert_eq!(SOURCE.matches("HUD_CVARS_LUA").count(), 1);
    let mut source = SOURCE.replace("HUD_CVARS_LUA", &parts);
    source.push('\n');
    source.push_str(clock);
    source.push_str(COMBAT_TEXT_FRAME_HANDLERS);
    LocalClientExtension {
        creature_sound_data_patch: Some(creature_sound::patch),
        on_top_frames_global: Some("AZS_ON_TOP_FRAMES".into()),
        cvar_defaults,
        binding_commands: crate::native_bindings::commands(),
        binding_defaults: crate::native_bindings::defaults(),
        script_initializer: Some(super::super::run_hud::local_clock::install_lua),
        world_frame_callback: Some("AZS_CombatTextFrame"),
        script_postlude: super::run_stats::source(None),
        // The character-pane owns this parser. Keep it available before the
        // WorldStateFrame API registers its CHAT_MSG_ADDON handler.
        script_prelude: STATS_PARSER.into(),
        // Native1458915c0 patches this core file once at startup. Its ordinary
        // FrameXML load registers the API on fresh and replacement VMs, after
        // stock core files and before external addons.
        framexml_appends: vec![(
            r"Interface\FrameXML\WorldStateFrame.lua".into(),
            source,
        )],
        ..Default::default()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use benilla_ui::script::{ScriptValue, UiScript};

    fn vm() -> UiScript {
        let script = UiScript::new().unwrap();
        let extension = extension();
        for (name, default) in extension.cvar_defaults {
            script
                .run(&format!("RegisterCVar('{name}', '{default}')"))
                .unwrap();
        }
        script.run(&extension.script_prelude).unwrap();
        for (_, source) in extension.framexml_appends {
            script.run(&source).unwrap();
        }
        script
    }

    #[test]
    fn full_bootstrap_receives_real_addon_events_and_numeric_legacy_stats() {
        let mut script = vm();
        script.fire_event(
            "CHAT_MSG_ADDON",
            vec![
                ScriptValue::Str("AZSRUN".into()),
                ScriptValue::Str("t=4;ph=paused;sl=2;proc=3;pv=4;pm=5".into()),
            ],
        );
        script.fire_event(
            "CHAT_MSG_ADDON",
            vec![
                ScriptValue::Str("AZS".into()),
                ScriptValue::Str("hp=12;unknown=text".into()),
            ],
        );
        script
            .run(
                r#"
            assert(AZS_GetRunTime() == 4 and AZS_GetStoredLevels() == 2);
            assert(AZS_RUN.proc == 3 and AZS_RUN.pv == 4 and AZS_RUN.pm == 5);
            assert(AZS_STATS.hp == 12 and AZS_STATS.unknown == 0);
            AZS_SetHudShown('all', false);
            assert(GetCVar('hudClock') == '0' and GetCVar('hudFlag') == '0');
            assert(GetCVar('hudScale') == '1');
        "#,
            )
            .unwrap();
    }

    #[test]
    fn affixes_and_totems_reach_the_actual_bootstrap_accessors() {
        let mut script = vm();
        script.fire_event("CHAT_MSG_ADDON", vec![ScriptValue::Str("AZSZONE".into()),
            ScriptValue::Str("heroic=5;affixes=sanguine,explosive".into())]);
        script.fire_event("CHAT_MSG_ADDON", vec![ScriptValue::Str("AZSRUN".into()),
            ScriptValue::Str("t=20;ph=paused".into())]);
        script.fire_event("CHAT_MSG_ADDON", vec![ScriptValue::Str("AZSTOTEMS".into()),
            ScriptValue::Str("magma_totem,8190,2,30,25.5,16.8,Interface\\Icons\\Spell_Fire_SelfDestruct,Magma Totem".into())]);
        script.run("assert(AZS_ZONE.heroic == 5 and AZS_ZONE.affixes == 'sanguine,explosive'); \
            local rows = AZS_GetTotems('magma_totem'); assert(table.getn(rows) == 1); \
            assert(rows[1].count == 2 and rows[1].cap == 30 and rows[1].remaining == 5.5); \
            rows[1].count = 999; assert(AZS_GetTotemCount() == 2)").unwrap();
        script.fire_event("CHAT_MSG_ADDON", vec![ScriptValue::Str("AZSTOTEMS".into()),
            ScriptValue::Str(String::new())]);
        script.run("assert(AZS_GetTotemCount() == 0)").unwrap();
    }

    #[test]
    fn screen_frame_registry_is_installed_before_addons_and_reset_in_a_new_vm() {
        let script = vm();
        assert_eq!(extension().on_top_frames_global.as_deref(), Some("AZS_ON_TOP_FRAMES"));
        script.run("AZS_SetOnTopOfScreens('Fixture', true); \
            assert(AZS_IsOnTopOfScreens('Fixture') and AZS_ON_TOP_FRAMES == 'Fixture'); \
            AZS_SetOnTopOfScreens('Fixture', false); assert(AZS_ON_TOP_FRAMES == '')").unwrap();
        script.run("AZS_SetOnTopOfScreens('OldVm', true)").unwrap();
        vm().run("assert(AZS_ON_TOP_FRAMES == '' and not AZS_IsOnTopOfScreens('OldVm'))").unwrap();
    }

    #[test]
    fn revive_visibility_and_receipts_are_independent_in_each_vm() {
        let mut script = vm();
        script.run(
            "assert(GetCVar('hudRevive') == '1' and AZS_IsHudShown('revive')); \
             assert(AZS_GetRevive() == AZS_REVIVE and next(AZS_GetRevive()) == nil); \
             assert(AZS_REVIVE_UPDATED == nil); \
             AZS_SetHudShown('all', false); \
             assert(GetCVar('hudRevive') == '0' and not AZS_IsHudShown('revive')); \
             old_revive = AZS_GetRevive()"
        ).unwrap();
        script.fire_event("CHAT_MSG_ADDON", vec![
            ScriptValue::Str("AZSREVIVE".into()),
            ScriptValue::Str("down=1;share=0.50;by=Ada".into()),
        ]);
        script.run(
            "local r = AZS_GetRevive(); \
             assert(r ~= old_revive and r == AZS_REVIVE); \
             assert(r.down == 1 and r.share == 0.5 and r.by == 'Ada'); \
             assert(r.reviving == nil and r.rshare == nil); \
             assert(type(AZS_REVIVE_UPDATED) == 'number'); \
             assert(GetCVar('hudRevive') == '0'); old_revive = r"
        ).unwrap();
        script.fire_event("CHAT_MSG_ADDON", vec![
            ScriptValue::Str("AZSREVIVE".into()), ScriptValue::Str(String::new()),
        ]);
        script.run(
            "assert(next(AZS_GetRevive()) == nil and AZS_GetRevive() ~= old_revive); \
             assert(old_revive.down == 1); AZS_SetHudShown('revive', true); \
             assert(AZS_IsHudShown('revive') and next(AZS_GetRevive()) == nil)"
        ).unwrap();
        let reloaded = vm();
        reloaded.run(
            "assert(next(AZS_GetRevive()) == nil and AZS_REVIVE_UPDATED == nil)"
        ).unwrap();
    }

    #[test]
    fn current_banner_callbacks_receive_events_and_reload_starts_empty() {
        let mut script = vm();
        script.run("seen = {}; handler = function(b) table.insert(seen,b) end; \
                    AZS_RegisterBannerHandler(handler); AZS_RegisterBannerHandler(handler)").unwrap();
        for (id, kind) in [(1, "boss"), (2, "bossdown")] {
            script.fire_event("CHAT_MSG_ADDON", vec![ScriptValue::Str("AZSBANNER".into()),
                ScriptValue::Str(format!("id={id};kind={kind};boss=1;name=Boss;text=Boss,;=🙂"))]);
        }
        script.run("assert(table.getn(seen)==2 and table.getn(AZS_BANNERS)==2); \
                    assert(AZS_BANNER.kind=='bossdown' and AZS_BANNER.text=='Boss,;=🙂'); \
                    assert(table.getn(AZS_BANNER_HANDLERS)==1); \
                    AZS_UnregisterBannerHandler(handler)").unwrap();
        let reloaded = vm();
        reloaded.run("assert(table.getn(AZS_BANNERS)==0 and table.getn(AZS_BANNER_HANDLERS)==0); \
                      assert(AZS_BANNER==nil and AZS_BANNER_UPDATED==nil)").unwrap();
    }

    #[test]
    fn stored_level_command_is_press_only_and_respects_saved_key_sets() {
        let extension = extension();
        for saved in [None, Some(vec![("F8".into(), crate::native_bindings::COMMAND.into())])] {
            // The real host seeds defaults, resolves persisted sets, then
            // appends core commands before addons. Repeat for a replacement VM.
            for _ in 0..2 {
                let mut script = vm();
                script.set_default_bindings(extension.binding_defaults.clone());
                let keys = saved.clone().unwrap_or_else(|| script.default_bindings());
                script.seed_binding_set(1, Some(keys));
                script.load_binding_set(1);
                script.register_bindings(&extension.binding_commands);
                let key = if saved.is_some() { "F8" } else { "Y" };
                script.run(&format!(
                    "assert(GetBindingKey('AZS_OPENLEVELS') == '{key}'); \
                     assert(GetNumBindings() == 2); \
                     assert(GetBinding(1) == 'HEADER_AZS'); \
                     SetCVar('spendLevels', '0')"
                )).unwrap();
                assert!(script.execute_binding(crate::native_bindings::COMMAND, true).unwrap());
                script.run("assert(GetCVar('spendLevels') == '1'); SetCVar('spendLevels', '0')").unwrap();
                assert!(!script.execute_binding(crate::native_bindings::COMMAND, false).unwrap());
                script.run("assert(GetCVar('spendLevels') == '0')").unwrap();
                script.run(
                    "for _, key in ipairs({GetBindingKey('AZS_OPENLEVELS')}) do SetBinding(key) end; \
                     SetBinding('F9', 'AZS_OPENLEVELS'); \
                     SaveBindings(GetCurrentBindingSet()); \
                     assert(GetBindingKey('AZS_OPENLEVELS') == 'F9'); \
                     LoadBindings(0); assert(GetBindingKey('AZS_OPENLEVELS') == 'Y')"
                ).unwrap();
                assert!(!script.take_keybind_requests().is_empty());
            }
        }
    }
}
