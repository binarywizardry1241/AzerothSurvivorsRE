//! Pure 0.92 data-manifest validation and pending-file selection.
//!
//! Native owners: 0x140118e40, 0x140150850 and 0x140158bd0. The caller supplies
//! parsed JSON and a metadata-length callback. This module performs no requests
//! or filesystem operations and is not connected to the update check worker.

use std::path::Path;

use serde_json::Value;

use super::Download;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct DataManifest {
    patches: Vec<Download>,
}

impl DataManifest {
    /// 0x140118e40 / 0x14013a7d0: an array is required; an empty one is valid.
    /// Collecting stops at the first error and never yields a partial manifest.
    pub fn from_json(value: &Value, manifest_url: &str) -> Result<Self, String> {
        let entries = value
            .get("patches")
            .and_then(Value::as_array)
            .ok_or_else(|| "no patches".to_owned())?;
        let base = manifest_url
            .rfind('/')
            .map(|position| &manifest_url[..=position])
            .unwrap_or("");
        let patches = entries
            .iter()
            .map(|entry| {
                // 0x14015097d parses the download before inspecting its name.
                let download = Download::from_json(entry, base).map_err(str::to_owned)?;
                let name = download.name.to_ascii_lowercase();
                let bytes = name.as_bytes();
                if bytes.len() != 11
                    || &bytes[..6] != b"patch-"
                    || &bytes[7..] != b".mpq"
                    || !bytes[6].is_ascii_alphanumeric()
                {
                    return Err(format!("{} is not a data patch's name", download.name));
                }
                // Validation uses a lowercase copy; the original name survives.
                Ok(download)
            })
            .collect::<Result<Vec<_>, _>>()?;
        Ok(Self { patches })
    }

    pub fn patches(&self) -> &[Download] {
        &self.patches
    }

    /// 0x140158bd0: retain metadata errors and lengths unequal to decoded size.
    /// A matching length is sufficient; the native selection owner does not hash.
    /// Ordering, duplicates and filename spelling remain as listed in the manifest.
    pub fn into_pending<E>(
        self,
        data_directory: &Path,
        mut metadata_len: impl FnMut(&Path) -> Result<u64, E>,
    ) -> Vec<Download> {
        self.patches
            .into_iter()
            .filter(
                |patch| match metadata_len(&data_directory.join(&patch.name)) {
                    Ok(length) => length != patch.size,
                    Err(_) => true,
                },
            )
            .collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn patch(name: &str, size: u64) -> Value {
        serde_json::json!({
            "name": name, "size": size, "sha256": "A".repeat(64),
            "parts": [{ "url": "part.gz", "size": 7 }]
        })
    }

    #[test]
    fn array_required_but_empty_manifest_is_valid() {
        for value in [
            Value::Null,
            serde_json::json!({}),
            serde_json::json!({"patches": false}),
        ] {
            assert_eq!(
                DataManifest::from_json(&value, "m.json").unwrap_err(),
                "no patches"
            );
        }
        let empty = DataManifest::from_json(&serde_json::json!({"patches": []}), "m.json").unwrap();
        assert!(empty.patches().is_empty());
    }

    #[test]
    fn exact_ascii_name_shape_preserves_original_case_and_order() {
        let value =
            serde_json::json!({"patches": [patch("PaTcH-Z.MpQ", 12), patch("patch-0.mpq", 0)]});
        let manifest = DataManifest::from_json(&value, "https://host/data/patches.json").unwrap();
        assert_eq!(manifest.patches()[0].name, "PaTcH-Z.MpQ");
        assert_eq!(manifest.patches()[1].name, "patch-0.mpq");
        assert_eq!(manifest.patches()[0].sha256, "a".repeat(64));
        assert_eq!(
            manifest.patches()[0].parts[0].url,
            "https://host/data/part.gz"
        );
        let bare = DataManifest::from_json(&value, "patches.json").unwrap();
        assert_eq!(bare.patches()[0].parts[0].url, "part.gz");
        for name in [
            "",
            "patch-aa.mpq",
            "patch-_.mpq",
            "patch-ä.mpq",
            "../patch-a.mpq",
            "patch-a.mpq ",
            "PATCH-/.MPQ",
        ] {
            assert_eq!(
                DataManifest::from_json(&serde_json::json!({"patches": [patch(name, 1)]}), "")
                    .unwrap_err(),
                format!("{name} is not a data patch's name")
            );
        }
    }

    #[test]
    fn download_errors_precede_name_validation_and_first_entry_error_wins() {
        assert_eq!(
            DataManifest::from_json(&serde_json::json!({"patches": [{"name": "invalid"}]}), "")
                .unwrap_err(),
            "no parts"
        );
        assert_eq!(
            DataManifest::from_json(
                &serde_json::json!({"patches": [{"name": "invalid", "parts": []}]}),
                ""
            )
            .unwrap_err(),
            "a download is listed incomplete"
        );
        let value = serde_json::json!({"patches": [patch("BAD.mpq", 1), false]});
        assert_eq!(
            DataManifest::from_json(&value, "").unwrap_err(),
            "BAD.mpq is not a data patch's name"
        );
    }

    #[test]
    fn metadata_selection_uses_only_length_and_keeps_errors_duplicates_and_order() {
        let value = serde_json::json!({"patches": [
            patch("patch-A.mpq", 10), patch("patch-b.mpq", 20),
            patch("patch-c.mpq", 30), patch("patch-b.mpq", 20), patch("patch-0.mpq", 0)
        ]});
        let manifest = DataManifest::from_json(&value, "").unwrap();
        let mut observed = Vec::new();
        let pending = manifest.into_pending(Path::new("fixture/Data"), |path| {
            observed.push(path.to_path_buf());
            match path.file_name().unwrap().to_str().unwrap() {
                "patch-A.mpq" => Ok(10),
                "patch-b.mpq" => Ok(21),
                "patch-c.mpq" => Err("unreadable"),
                "patch-0.mpq" => Ok(0),
                _ => unreachable!(),
            }
        });
        assert_eq!(observed.len(), 5);
        assert_eq!(observed[0], Path::new("fixture/Data/patch-A.mpq"));
        assert_eq!(
            pending
                .iter()
                .map(|patch| patch.name.as_str())
                .collect::<Vec<_>>(),
            ["patch-b.mpq", "patch-c.mpq", "patch-b.mpq"]
        );
    }
}
