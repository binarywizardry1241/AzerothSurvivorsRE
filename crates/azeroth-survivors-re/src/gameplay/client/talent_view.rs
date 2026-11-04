//! Custom talent overlay state over the native core FrameXML patch.
//! The core owns talent functions, counter initialization and micro buttons
//! before addons load. Publication owns only the custom overlay's input guard.

/// Publish the overlay state without replacing core functions or addon hooks.
pub(in crate::gameplay) fn publication(active: bool, open: bool) -> String {
    format!(
        "AZS_TALENT_ACTIVE = {}; AZS_TALENT_VIEW_OPEN = {};\n{}",
        if active { "true" } else { "false" },
        if active && open { "true" } else { "false" },
        BRIDGE,
    )
}

const BRIDGE: &str = r#"
-- The custom screen is drawn by the game's overlay. A transparent real VM
-- frame owns its covered pointer region so clicks cannot reach FrameXML below.
-- Keyboard close handling belongs to the recovered custom screen's key path.
if AZS_TALENT_VIEW_OPEN and UIParent then
    if not AZSTalentInputGuard then
        AZSTalentInputGuard = CreateFrame("Frame", "AZSTalentInputGuard", UIParent);
        AZSTalentInputGuard:SetAllPoints(UIParent);
        AZSTalentInputGuard:SetFrameStrata("FULLSCREEN_DIALOG");
        AZSTalentInputGuard:EnableMouse(true);
        -- Wheel dispatch walks its own input list, independently of mouse hits.
        AZSTalentInputGuard:EnableMouseWheel(true);
        AZSTalentInputGuard:SetScript("OnMouseWheel", function() end);
    end
    AZSTalentInputGuard:Show();
elseif AZSTalentInputGuard then
    AZSTalentInputGuard:Hide();
end
"#;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn publication_preserves_core_functions_addon_hooks_and_counter() {
        let mut script = benilla_ui::script::UiScript::new().unwrap();
        script.run(r#"
            AZS_TALENT_TOGGLES = '7';
            function ToggleTalentFrame()
                AZS_TALENT_TOGGLES = tostring(tonumber(AZS_TALENT_TOGGLES) + 1);
            end
            function UpdateTalentButton() if TalentMicroButton then TalentMicroButton:Hide(); end end
            local core_toggle, core_update = ToggleTalentFrame, UpdateTalentButton;
            hook_calls = 0;
            hook_toggle = function() hook_calls = hook_calls + 1; core_toggle(); end;
            hook_update = function() core_update(); end;
            ToggleTalentFrame, UpdateTalentButton = hook_toggle, hook_update;
            UIParent = CreateFrame("Frame", "UIParent");
            CharacterMicroButton = CreateFrame("Button", "CharacterMicroButton", UIParent);
            TalentMicroButton = CreateFrame("Button", "TalentMicroButton", UIParent);
            WorldMapMicroButton = CreateFrame("Button", "WorldMapMicroButton", UIParent);
            TalentMicroButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 19, 2);
            WorldMapMicroButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 45, 2);
            TalentMicroButton:Hide();
        "#).unwrap();
        script.run(&publication(true, false)).unwrap();
        script
            .run(
                r#"
            assert(AZS_TALENT_TOGGLES == "7");
            assert(ToggleTalentFrame == hook_toggle and UpdateTalentButton == hook_update);
            UpdateTalentButton();
            assert(not TalentMicroButton:IsShown());
            ToggleTalentFrame(); ToggleTalentFrame();
            assert(AZS_TALENT_TOGGLES == "9" and hook_calls == 2);
        "#,
            )
            .unwrap();
        script.run(&publication(true, true)).unwrap();
        script
            .run("assert(AZS_TALENT_TOGGLES == '9'); assert(AZSTalentInputGuard:IsShown())")
            .unwrap();
        script.set_screen_size(1024., 768.);
        script.run("UIParent:SetAllPoints()").unwrap();
        script.resolve();
        assert_eq!(
            script.mouse_wheel(512., 384., -1.),
            benilla_ui::script::WheelWalk::Frame,
            "the overlay guard must consume the separate wheel input sweep",
        );
        script.run(&publication(false, false)).unwrap();
        script
            .run(
                r#"
            assert(not AZSTalentInputGuard:IsShown());
            assert(not TalentMicroButton:IsShown());
            assert(ToggleTalentFrame == hook_toggle and UpdateTalentButton == hook_update);
            ToggleTalentFrame(); assert(hook_calls == 3 and AZS_TALENT_TOGGLES == '10');
            local point, relative, relativePoint, x, y = TalentMicroButton:GetPoint(1);
            assert(point == "BOTTOMLEFT" and x == 19 and y == 2);
            local _, _, _, mx, my = WorldMapMicroButton:GetPoint(1);
            assert(mx == 45 and my == 2);
        "#,
            )
            .unwrap();
    }
}
