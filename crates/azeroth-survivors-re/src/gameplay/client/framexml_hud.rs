//! The complete native WorldStateFrame patch, including its command, tooltip
//! and chat wrappers. The canonical bytes plus raid_targets' separately owned
//! popup fragment reproduce the 0.115.0 patch; see q41-data-contracts-0.115.0.md.
//! The 0.127.0 ReputationFrame append supplies the native run cap of120.
//!
//! The canonical full patch and the selected range are hash-bound by the
//! hud-framexml manifest. Keep this out of the postlude: addons must load after
//! it, and locale changes must not reinstall frames or shift managed positions.

const SOURCE: &str = include_str!(
    "../../../../../docs/analysis/evidence/hud-framexml/world-state-patch.lua"
);
const DEATH_POPUP: &str =
    include_str!("../../../../../docs/analysis/evidence/hud-framexml/death-popup.lua");
const RUN_LEVEL_CAP: &str =
    include_str!("../../../../../docs/analysis/evidence/hud-framexml/run-level-cap.lua");

pub(super) fn appends() -> Vec<(String, String)> {
    vec![
        (
            r"Interface\FrameXML\WorldStateFrame.lua".into(),
            SOURCE.into(),
        ),
        (
            r"Interface\FrameXML\StaticPopup.lua".into(),
            DEATH_POPUP.into(),
        ),
        (
            r"Interface\FrameXML\ReputationFrame.lua".into(),
            RUN_LEVEL_CAP.into(),
        ),
    ]
}
