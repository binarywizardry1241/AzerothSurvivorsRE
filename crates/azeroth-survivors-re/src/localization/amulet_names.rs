//! Current 0.115.0 generated-name constructor 14583d3e0 and its shared consumers.
//! Native cases and consumer limits: docs/analysis/amulet-names-0.115.0.md.

pub(super) fn localized(
    name: &str,
    generated_ability_key: Option<&str>,
    mut lookup: impl FnMut(&str) -> Option<String>,
) -> String {
    let key = match generated_ability_key {
        // These constructors return complete names rather than prefix/spell pairs.
        None | Some("demonic_empowerment" | "kill_command" | "rockbiter" | "stormstrike" | "fire_nova") => {
            return lookup(name).unwrap_or_else(|| name.to_owned());
        }
        Some(key) => key,
    };
    let (prefix, fallback) = name.split_once(": ")
        .expect("current generated amulet prefix and ability name");
    let prefix = lookup(prefix).unwrap_or_else(|| prefix.to_owned());
    // The two healing constructors use these literal keys in their common tail.
    let ability_key = match key {
        "renew" => "Vampiric Renew".to_owned(),
        "rejuvenation" => "Vampiric Rejuvenation".to_owned(),
        _ => format!("ability.{key}.name"),
    };
    let ability = lookup(&ability_key).unwrap_or_else(|| fallback.to_owned());
    format!("{prefix}: {ability}")
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn generated_names_match_current_native_constructor_cases() {
        let proof: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/0.115.0/amulet-names.json"
        )).unwrap();
        for case in proof["constructor_cases"].as_array().unwrap() {
            let translations = case["translations"].as_object().unwrap();
            let actual = localized(case["source_name"].as_str().unwrap(),
                Some(case["ability"].as_str().unwrap()),
                |key| translations.get(key).map(|value| value.as_str().unwrap().to_owned()));
            assert_eq!(actual, case["name"].as_str().unwrap(), "{}", case["ability"]);
        }
    }

    #[test]
    fn ordinary_effect_names_preserve_literal_lookup_and_empty_values() {
        assert_eq!(localized("Cheat Death", None, |_| None), "Cheat Death");
        assert_eq!(localized("Cheat Death", None,
            |key| (key == "Cheat Death").then(|| "Trompe-la-mort".to_owned())), "Trompe-la-mort");
        assert_eq!(localized("Cheat Death", None, |_| Some(String::new())), "");
    }
}
