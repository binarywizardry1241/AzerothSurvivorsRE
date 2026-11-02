//! Selected-target Options globals: the flat FrameXML file and Lua literals.
//! Current 0.112.0 file/VM contracts: docs/analysis/options-vm-0.112.0.md.
//! Current read/store/matcher/VM owners:1405694b0/14056a710/140dee8f0/140569e00.

use std::{collections::BTreeMap, path::Path};

const HEADER: &str = "-- benilla saved variables: the UI's own remembered settings.";

pub fn literal(storage: u8, value: &str) -> String {
    if storage == 2 {
        if value == "1" { "1" } else { "nil" }.into()
    } else {
        // All descriptor values are numeric text. The target uses Debug on
        // that text, preserving the string type instead of assigning a number.
        format!("{value:?}")
    }
}

/// Current native reader 1405694b0 takes the first column-zero assignment and
/// returns its trimmed literal. This Options path never parses or executes Lua.
fn flat_literal<'a>(previous: &'a str, name: &str) -> Option<&'a str> {
    previous.lines().find_map(|line| {
        line.strip_prefix(name)?.trim_start().strip_prefix('=').map(str::trim)
    })
}

fn read_values<'a>(previous: &str, rows: impl Iterator<Item = (&'a str, u8)>) -> BTreeMap<String, String> {
    rows.filter_map(|(name, storage)| {
        let literal = flat_literal(previous, name);
        let value = if storage == 2 {
            // Current 14012bc73: only exact nil/false are false; this is a
            // literal test, so even an empty RHS or a Lua expression is true.
            if literal.is_some_and(|value| value != "nil" && value != "false") { "1" } else { "0" }.into()
        } else {
            // Current 14012bd32 strips boundary quotes only, without unescaping.
            literal?.trim_matches('"').to_owned()
        };
        Some((format!("{storage}:{}", name.to_ascii_lowercase()), value))
    }).collect()
}

pub fn read<'a>(home: &Path, rows: impl Iterator<Item = (&'a str, u8)>) -> BTreeMap<String, String> {
    // Unreadable/invalid-UTF8 input has no literal, and controls use defaults.
    let previous = std::fs::read_to_string(home.join("saved-variables.lua")).unwrap_or_default();
    read_values(&previous, rows)
}

pub fn compose(previous: &str, name: &str, literal: &str) -> String {
    let replacement = format!("{name} = {literal}");
    let mut found = false;
    let mut lines: Vec<String> = previous.lines().map(|line| {
        // Native matching is case sensitive and starts at column zero. Only
        // whitespace between the complete name and '=' is ignored. Replace
        // every matching assignment, preserving unrelated names and lines.
        if line.strip_prefix(name).is_some_and(|rest| rest.trim_start().starts_with('=')) {
            found = true;
            replacement.clone()
        } else { line.to_owned() }
    }).collect();
    if !found {
        if lines.is_empty() { lines.push(HEADER.into()); }
        lines.push(replacement);
    }
    lines.join("\n") + "\n"
}

pub fn write(home: &Path, name: &str, literal: &str) -> Result<(), String> {
    let path = home.join("saved-variables.lua");
    // The current native owner treats any failed UTF-8 read as an empty file.
    let previous = std::fs::read_to_string(&path).unwrap_or_default();
    crate::options_config::write_atomic(&path, compose(&previous, name, literal).as_bytes())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn first_literal_read_does_not_apply_lua_parser_rules() {
        let rows = [("VALUE", 1), ("NAMEPLATES_ON", 2)];
        let before = " VALUE = ignored\nVALUE_EXTRA = ignored\nVALUE = \"first\\n\"\nVALUE = \"last\"\nNAMEPLATES_ON = nil -- a comment\n";
        let values = read_values(before, rows.into_iter());
        assert_eq!(values["1:value"], "first\\n");
        assert_eq!(values["2:nameplates_on"], "1");
        for (literal, expected) in [("nil", "0"), ("false", "0"), ("", "1"), ("0", "1"), ("FALSE", "1")] {
            let text = format!("NAMEPLATES_ON = {literal}\n");
            assert_eq!(read_values(&text, [("NAMEPLATES_ON", 2)].into_iter())["2:nameplates_on"], expected);
        }
        assert_eq!(read_values("", rows.into_iter())["2:nameplates_on"], "0");
        assert!(!read_values("", rows.into_iter()).contains_key("1:value"));
        assert_eq!(flat_literal("VALUE\u{2003}=\u{00a0}\"a\"\u{3000}\r\n", "VALUE"), Some("\"a\""));
    }

    #[test]
    fn assignment_update_preserves_unrelated_lines_and_replaces_every_exact_name() {
        let before = "-- kept\r\nSHOW_COMBAT_TEXT = \"0\"\r\nSHOW_COMBAT_TEXT_EXTRA = 4\r\n SHOW_COMBAT_TEXT = 5\r\nSHOW_COMBAT_TEXT\t= nil\r\n";
        assert_eq!(compose(before, "SHOW_COMBAT_TEXT", "\"1\""),
            "-- kept\nSHOW_COMBAT_TEXT = \"1\"\nSHOW_COMBAT_TEXT_EXTRA = 4\n SHOW_COMBAT_TEXT = 5\nSHOW_COMBAT_TEXT = \"1\"\n");
        assert_eq!(compose("", "NAMEPLATES_ON", "nil"),
            format!("{HEADER}\nNAMEPLATES_ON = nil\n"));
    }
}
