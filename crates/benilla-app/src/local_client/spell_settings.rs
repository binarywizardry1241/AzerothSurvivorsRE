//! 0.105.0 14003de60 -> 1407e0430: live effect-creation admission.
//! This gates new visual requests, never combat packets or existing effects.
pub(crate) fn hidden(cvars: Option<&crate::cvars::Cvars>) -> bool {
    cvars
        .and_then(|cvars| cvars.get("noSpellEffects"))
        .is_some_and(|value| value.trim() == "1")
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn current_toggle_accepts_only_trimmed_one() {
        assert!(!hidden(None));
        for value in ["1", " 1 ", "\u{a0}1\u{a0}"] {
            assert!(hidden(Some(&crate::cvars::Cvars::with_value(
                "noSpellEffects",
                value
            ))));
        }
        for value in ["", "0", "01", "1.0", "true", "-1", "11"] {
            assert!(!hidden(Some(&crate::cvars::Cvars::with_value(
                "noSpellEffects",
                value
            ))));
        }
    }
}
