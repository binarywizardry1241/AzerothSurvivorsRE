//! Current AS race/class/realm presentation in the real GlueStrings core file.
//! Native145859140/14585a400; see q41-glue-strings-0.115.0.md.

use benilla_app::local_client::{LocalClientExtension, LocalCoreScriptTransform};

use crate::{catalog::MenuCatalog, localization::Localization};

const PATH: &str = r"Interface\GlueXML\GlueStrings.lua";
const CLASS_TEMPLATE: &str =
    "{blurb} Starts with {spell}; every level offers three of its spells. {hp} health.";

pub(super) fn configure(extension: &mut LocalClientExtension, locale: &Localization) {
    let replacement = LocalCoreScriptTransform {
        path: PATH.into(),
        payload: source(locale),
        apply: patch,
    };
    if let Some(current) = extension
        .glue_transforms
        .iter_mut()
        .find(|row| row.path == PATH)
    {
        *current = replacement;
    } else {
        extension.glue_transforms.push(replacement);
    }
}

fn quoted(value: &str) -> String {
    // Native145858680 performs these three replacements in this exact order.
    value
        .replace('\\', "\\\\")
        .replace('"', "\\\"")
        .replace('\n', "\\n")
}

fn source(locale: &Localization) -> String {
    let catalog = MenuCatalog::embedded();
    let localized = locale.menu_catalog();
    let mut output = String::from("\n-- Azeroth Survivors\n");
    for race in &catalog.races {
        for (index, raw) in race.blurb.lines().enumerate() {
            let ordinal = index + 1;
            let key = format!("race.{}.line{ordinal}", race.key);
            // The source catalog already stores the native fallback after its
            // leading "- " prefix; current table correspondence is checked.
            let line = locale.lookup(&key).unwrap_or(raw);
            output.push_str(&format!(
                "ABILITY_INFO_{}{ordinal} = \"- {}\";\n",
                race.key.to_ascii_uppercase(),
                quoted(line),
            ));
        }
    }
    for class in &catalog.classes {
        let ability = catalog
            .abilities
            .iter()
            .find(|ability| ability.key == class.starting_spell_key)
            .expect("native class starting ability");
        let spell_key = format!("ability.{}.name", ability.key);
        let spell = locale.lookup(&spell_key).unwrap_or(&ability.name);
        let blurb_key = format!("class.{}.blurb", class.key);
        let blurb = locale.lookup(&blurb_key).unwrap_or(&class.blurb);
        let description = crate::localization::format(
            &localized,
            CLASS_TEMPLATE,
            &[
                ("blurb", blurb.into()),
                ("spell", spell.into()),
                ("hp", class.base_health.to_string()),
            ],
        );
        output.push_str(&format!(
            "CLASS_{} = \"        {}\";\n",
            class.key.to_ascii_uppercase(),
            quoted(&description),
        ));
    }
    for (name, label) in [
        ("SERVER_SELECTION", "Choose a Zone"),
        ("REALM_NAME", "Zone"),
        ("CHANGE_REALM", "Change Zone"),
        ("REALM_LIST_IN_PROGRESS", "Gathering the zones"),
        ("REALM_LIST_SUCCESS", "Zones found"),
    ] {
        output.push_str(&format!("{name} = \"{}\";\n", quoted(locale.label(label))));
    }
    output
}

fn patch(original: &[u8], payload: &str) -> Vec<u8> {
    let original = String::from_utf8_lossy(original);
    let mut output = String::new();
    // Native14583b470 retains original line contents while removing every
    // trimmed ABILITY_INFO_ assignment, including unused stock racial rows.
    for line in original
        .lines()
        .filter(|line| !line.trim().starts_with("ABILITY_INFO_"))
    {
        output.push_str(line);
        output.push('\n');
    }
    output.push_str(payload);
    output.into_bytes()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn unused_stock_racial_rows_are_removed_before_the_recovered_rows() {
        let original = b"KEEP = 1;\r\n  ABILITY_INFO_ORC3 = 'stock';\r\n\tABILITY_INFO_ORC4 = 'stock';\n-- ABILITY_INFO_ORC5 = 'comment';\n";
        let output = patch(original, "ABILITY_INFO_ORC1 = 'AS';\n");
        assert_eq!(
            String::from_utf8(output).unwrap(),
            "KEEP = 1;\n-- ABILITY_INFO_ORC5 = 'comment';\nABILITY_INFO_ORC1 = 'AS';\n"
        );
    }

    #[test]
    fn locale_refresh_replaces_the_payload_without_duplicate_transforms() {
        let locale = Localization::english_for_tests();
        let mut extension = LocalClientExtension::default();
        configure(&mut extension, &locale);
        let english = extension.glue_transforms[0].payload.clone();
        assert!(english.contains("SERVER_SELECTION = \"Choose a Zone\";"));
        configure(&mut extension, &locale.for_code("pl"));
        assert_eq!(extension.glue_transforms.len(), 1);
        assert_ne!(extension.glue_transforms[0].payload, english);
        configure(&mut extension, &locale);
        assert_eq!(extension.glue_transforms.len(), 1);
        assert_eq!(extension.glue_transforms[0].payload, english);
    }
}
