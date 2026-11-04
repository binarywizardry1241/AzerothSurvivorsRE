//! Current0.121.0 helper145ac9f90 and constructor145bdcc01/33.
//! Weeks are Unix-epoch 604800-second intervals; they have no calendar offset.

pub fn current_week() -> u32 {
    std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map_or(0, |duration| (duration.as_secs() / 604_800) as u32)
}

///145a9c190 maps exact authored zone keys, including the unknown-key zero.
/// Run initialization and difficulty presentation use the same rotation seed.
pub fn zone_selector(zone: &str, week: u32) -> u64 {
    let zone = crate::zones::index(zone).unwrap_or(0) as u64;
    super::selector_from_inputs(zone, week)
}
