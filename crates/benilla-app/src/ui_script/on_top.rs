//! The embedding's named subtrees share the ordinary hit test and quad conversion.
//! Current AS boundary: evidence/0.127.0/ontop-interface/manifest.json.

use crate::ui_pass::UiQuad;
use benilla_ui::script::UiScript;
use benilla_ui::widget::FrameHandle;

/// Read the active VM on every pass: ReloadUI and clearing the global must not
/// leave registrations attached to an old VM. Native splitting drops empty
/// pieces, but preserves whitespace, duplicates and order.
pub(super) fn registered_names(script: &UiScript, global: Option<&str>) -> Vec<String> {
    global
        .and_then(|name| script.lua().globals().get::<String>(name).ok())
        .map(|names| {
            names
                .split(',')
                .filter(|name| !name.is_empty())
                .map(str::to_owned)
                .collect()
        })
        .unwrap_or_default()
}

/// Anonymous frames and named descendants both keep walking: the registered
/// ancestor need not be the nearest named owner. Regions start at their owner.
pub(super) fn registered_ancestor(
    script: &UiScript,
    mut frame: Option<FrameHandle>,
    names: &[String],
) -> bool {
    if names.is_empty() {
        return false;
    }
    while let Some(current) = frame {
        if script
            .frame_name(current)
            .is_some_and(|name| names.contains(&name))
        {
            return true;
        }
        frame = script.frame_parent(current);
    }
    false
}

/// Reclassify the exact converted spans, including all text glyphs and region
/// fragments. Reused spans must follow registration/reparenting changes even
/// when their geometry is settled. A trailing capture cursor stays in base.
pub(super) fn apply_promotions(quads: &mut [UiQuad], spans: &[u32], promoted: &[bool]) -> bool {
    debug_assert_eq!(spans.len(), promoted.len());
    let mut changed = false;
    let mut start = 0;
    for (&end, &above) in spans.iter().zip(promoted) {
        let end = end as usize;
        for quad in &mut quads[start..end] {
            changed |= quad.above_screens != above;
            quad.above_screens = above;
        }
        start = end;
    }
    for quad in &mut quads[start..] {
        changed |= quad.above_screens;
        quad.above_screens = false;
    }
    changed
}

#[cfg(test)]
mod tests {
    use super::*;

    fn script() -> UiScript {
        let mut script = UiScript::new().unwrap();
        script.set_screen_size(1024.0, 768.0);
        script
            .run(
                r#"
            Root = CreateFrame('Frame', 'Root')
            Root:SetPoint('BOTTOMLEFT', 0, 0); Root:SetWidth(200); Root:SetHeight(200)
            Child = CreateFrame('Frame', 'Child', Root)
            Child:SetAllPoints(Root); Child:EnableMouse(1)
            local anonymous = CreateFrame('Frame', nil, Child)
            anonymous:SetAllPoints(Child)
            local region = anonymous:CreateTexture(nil, 'ARTWORK')
            region:SetAllPoints(anonymous); region:SetTexture(1, 0, 0)
            ON_TOP = 'Root'
        "#,
            )
            .unwrap();
        script
    }

    #[test]
    fn actual_hit_walks_past_named_children_and_preserves_hit_gates() {
        let mut script = script();
        script.resolve();
        let names = registered_names(&script, Some("ON_TOP"));
        assert!(registered_ancestor(
            &script,
            script.hit_test_frame(50.0, 50.0),
            &names
        ));
        assert!(!registered_ancestor(
            &script,
            script.hit_test_frame(300.0, 50.0),
            &names
        ));
        script.run("Child:EnableMouse(nil)").unwrap();
        assert!(!registered_ancestor(
            &script,
            script.hit_test_frame(50.0, 50.0),
            &names
        ));
        script.run("Child:EnableMouse(1); Root:Hide()").unwrap();
        assert!(!registered_ancestor(
            &script,
            script.hit_test_frame(50.0, 50.0),
            &names
        ));
    }

    #[test]
    fn regions_in_anonymous_descendants_use_all_ancestors_and_current_global() {
        let mut script = script();
        script.resolve();
        let region = script
            .extract()
            .into_iter()
            .find(|q| matches!(q.target, benilla_ui::order::ZTarget::Region(_)))
            .unwrap();
        let names = registered_names(&script, Some("ON_TOP"));
        assert!(registered_ancestor(
            &script,
            script.target_frame(region.target),
            &names
        ));
        script.run("ON_TOP = ', Root,,Root,Root,'").unwrap();
        assert_eq!(
            registered_names(&script, Some("ON_TOP")),
            [" Root", "Root", "Root"]
        );
        script.run("ON_TOP = ''").unwrap();
        assert!(registered_names(&script, Some("ON_TOP")).is_empty());
        script.run("ON_TOP = nil").unwrap();
        assert!(registered_names(&script, Some("ON_TOP")).is_empty());
        assert!(registered_names(&script, None).is_empty());
    }

    #[test]
    fn all_fragments_follow_their_span_and_keep_paint_data_when_reclassified() {
        let mut quads: Vec<UiQuad> = (0..6)
            .map(|z| UiQuad {
                z_key: z,
                ..Default::default()
            })
            .collect();
        let original = quads.clone();
        // Three glyphs/fragments, an empty entry, two region fragments, cursor.
        assert!(apply_promotions(
            &mut quads,
            &[3, 3, 5],
            &[true, false, false]
        ));
        assert!(quads[..3].iter().all(|q| q.above_screens));
        assert!(quads[3..].iter().all(|q| !q.above_screens));
        assert!(!apply_promotions(
            &mut quads,
            &[3, 3, 5],
            &[true, false, false]
        ));
        assert!(apply_promotions(
            &mut quads,
            &[3, 3, 5],
            &[false, false, false]
        ));
        assert!(
            quads == original,
            "promotion changes no paint/material/clip data"
        );
    }
}
