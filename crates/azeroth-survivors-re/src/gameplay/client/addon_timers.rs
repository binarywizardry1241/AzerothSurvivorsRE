//! Current0.115.0 timer wire projection (1458f6040/1458e4220).

use crate::{gameplay::mechanics::Mechanics, localization::Localization};

pub(super) fn snapshot(game: &Mechanics, locale: &Localization) -> String {
    game.addon_timers()
        .into_iter()
        .map(|row| {
            let name = locale.amulet_name(row.name, row.generated_ability_key);
            line(&name, row.icon, row.kind, row.ready, row.wait)
        })
        .collect::<Vec<_>>()
        .join(";")
}

fn line(name: &str, icon: &str, kind: &str, ready: f32, wait: f32) -> String {
    // The native formatter skips missing metadata before this step, cleans the
    // localized name, preserves icon/kind, and applies MAXSS(ready, +0).
    // Its one-decimal fields are absolute readiness and full wait, never time left.
    let ready = if ready > 0.0 { ready } else { 0.0 };
    format!("{},{},{},{:.1},{:.1}", super::addon_feed::field(name), icon, kind, ready, wait)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn wire_cleans_only_name_and_clamps_absolute_readiness() {
        assert_eq!(line("A\tB,C;D=É", "Icon", "cooldown", -2.0, 2.25),
            "A B C D É,Icon,cooldown,0.0,2.2");
        assert_eq!(line("Butcher", "icon", "summon", 43.25, 13.0),
            "Butcher,icon,summon,43.2,13.0");
        assert_eq!(line("", "", "cooldown", f32::NAN, -0.0),
            ",,cooldown,0.0,-0.0");
    }
}
