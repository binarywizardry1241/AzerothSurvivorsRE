//! Native lobby-list refresh gate: 14021c940, current 0.115.0 target.
/// `last` is shared with explicit refresh/tab-to-list requests. Closing the
/// screen retains it, just as the native resource retains its filter state.
pub fn due(open: bool, list_tab: bool, role: &str, status: &str, now: f32, last: &mut f32) -> bool {
    if !open
        || !list_tab
        || (!role.is_empty() && matches!(status, "hosting" | "joining" | "joined" | "left"))
    {
        return false;
    }
    // Ordered comparison: native UCOMISS/JB retains the previous timestamp on
    // NaN elapsed values. Zero is the special initial timestamp.
    if *last != 0.0 && !(now - *last >= 5.0) {
        return false;
    }
    // x86 MAXSS returns its second operand when now is NaN, as f32::max does.
    *last = now.max(0.001);
    true
}
