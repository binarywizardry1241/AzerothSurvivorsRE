//! Pure gain conversion shared by the mixer and device-free native fixtures.

use kira::Decibels;

/// Linear category amplitude to Kira dB. The supplied 0.92 controller binds the
/// same 0.001 floor, −60 dB silence and 20×log10f constants (140901907/140902107).
pub(crate) fn amp_to_db(amp: f32) -> Decibels {
    if amp <= 1e-3 {
        Decibels::SILENCE
    } else {
        Decibels(20.0 * amp.log10())
    }
}
