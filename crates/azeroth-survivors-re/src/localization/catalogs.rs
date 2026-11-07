//! Selected 0.109.0 i18n loader and flat string-object parser.
//! Native owners, original-instruction fixtures and limits: localization-0.109.0.md.

use std::{collections::BTreeMap, path::Path};

pub(super) fn load(save_directory: Option<&Path>) -> Vec<BTreeMap<String, String>> {
    let executable = std::env::current_exe().ok();
    load_from(executable.as_deref().and_then(Path::parent), save_directory)
}

fn load_from(
    executable_directory: Option<&Path>,
    save_directory: Option<&Path>,
) -> Vec<BTreeMap<String, String>> {
    super::LANGUAGES
        .iter()
        .zip(super::CATALOGS)
        .map(|((code, _), embedded)| {
            let mut catalog = parse(embedded).unwrap_or_else(|error| {
                eprintln!("{code}: {error}");
                BTreeMap::new()
            });
            // Native1458eb8a0 appends both roots in this order, even if equal.
            // Worker1459d19a0 inserts each parsed entry into the embedded map.
            for root in [executable_directory, save_directory].into_iter().flatten() {
                let path = root.join("lang").join(format!("{code}.json"));
                let Ok(text) = std::fs::read_to_string(&path) else {
                    continue;
                };
                match parse(&text) {
                    Ok(entries) => catalog.extend(entries),
                    Err(error) => eprintln!("{}: {error}", path.display()),
                }
            }
            catalog
        })
        .collect()
}

/// Native1458ed780 accepts a flat string object, ignoring trailing input and
/// underscore-prefixed entries. Its string decoder is deliberately permissive.
fn parse(text: &str) -> Result<BTreeMap<String, String>, String> {
    let mut parser = Parser {
        bytes: text.trim_start_matches('\u{feff}').as_bytes(),
        cursor: 0,
    };
    let mut entries = BTreeMap::new();
    parser.whitespace();
    parser.expect(b'{')?;
    parser.whitespace();
    if parser.bytes.get(parser.cursor) == Some(&b'}') {
        return Ok(entries);
    }
    loop {
        parser.whitespace();
        let key = parser.string()?;
        parser.whitespace();
        parser.expect(b':')?;
        parser.whitespace();
        let value = parser.string()?;
        if !key.starts_with('_') {
            entries.insert(key, value);
        }
        parser.whitespace();
        match parser.next() {
            Some(b'}') => return Ok(entries),
            Some(b',') => {}
            _ => return Err(parser.error("expected , or }")),
        }
    }
}

struct Parser<'a> {
    bytes: &'a [u8],
    cursor: usize,
}

impl Parser<'_> {
    fn next(&mut self) -> Option<u8> {
        let byte = self.bytes.get(self.cursor).copied();
        self.cursor += 1;
        byte
    }

    fn whitespace(&mut self) {
        while matches!(
            self.bytes.get(self.cursor),
            Some(b' ' | b'\t' | b'\n' | b'\r')
        ) {
            self.cursor += 1;
        }
    }

    fn error(&self, message: &str) -> String {
        let line = 1 + self.bytes[..self.cursor.min(self.bytes.len())]
            .iter()
            .filter(|byte| **byte == b'\n')
            .count();
        format!("line {line}: {message}")
    }

    fn expect(&mut self, expected: u8) -> Result<(), String> {
        if self.next() == Some(expected) {
            Ok(())
        } else {
            Err(self.error(&format!("expected {}", char::from(expected))))
        }
    }

    fn hex(&mut self) -> Result<u32, String> {
        // Native1458e9020 uses Rust's radix parser on exactly four UTF-8 bytes;
        // it even accepts a leading '+' within that four-byte field.
        let value = self
            .bytes
            .get(self.cursor..self.cursor + 4)
            .and_then(|bytes| std::str::from_utf8(bytes).ok())
            .and_then(|text| u32::from_str_radix(text, 16).ok());
        if let Some(value) = value {
            self.cursor += 4;
            Ok(value)
        } else {
            Err(self.error("bad \\u escape"))
        }
    }

    fn string(&mut self) -> Result<String, String> {
        self.expect(b'"')?;
        let mut output = Vec::new();
        loop {
            match self.next() {
                None => return Err(self.error("unterminated string")),
                Some(b'"') => return Ok(String::from_utf8_lossy(&output).into_owned()),
                Some(b'\\') => match self.next() {
                    Some(byte @ (b'"' | b'\\' | b'/')) => output.push(byte),
                    Some(b'b') => output.push(8),
                    Some(b'f') => output.push(12),
                    Some(b'n') => output.push(b'\n'),
                    Some(b'r') => output.push(b'\r'),
                    Some(b't') => output.push(b'\t'),
                    Some(b'u') => {
                        let mut scalar = self.hex()?;
                        if (0xd800..=0xdbff).contains(&scalar)
                            && self.bytes.get(self.cursor..self.cursor + 2) == Some(b"\\u")
                        {
                            self.cursor += 2;
                            // The native decoder masks the next value without
                            // requiring a low surrogate. Preserve that behavior.
                            scalar = 0x10000 + ((scalar - 0xd800) << 10) + (self.hex()? & 0x3ff);
                        }
                        let character = char::from_u32(scalar).unwrap_or('\u{fffd}');
                        output.extend_from_slice(character.encode_utf8(&mut [0; 4]).as_bytes());
                    }
                    _ => return Err(self.error("bad escape")),
                },
                // Native1458e96e0 copies raw control characters too.
                Some(byte) => output.push(byte),
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parser_matches_original_instruction_fixtures() {
        let fixtures: serde_json::Value = serde_json::from_str(include_str!(
            "../../../../docs/analysis/evidence/localization/native-vectors.json"
        ))
        .unwrap();
        for case in fixtures["parser"]["cases"].as_array().unwrap() {
            let result = parse(case["input"].as_str().unwrap());
            if let Some(error) = case.get("error") {
                assert_eq!(result.unwrap_err(), error.as_str().unwrap(), "{case}");
            } else {
                assert_eq!(
                    serde_json::to_value(result.unwrap()).unwrap(),
                    case["entries"],
                    "{case}"
                );
            }
        }
    }
}
