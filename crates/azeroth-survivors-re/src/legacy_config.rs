//! First-start Windows configuration migration, selected EXE 0.113.2.
//! Native owners and file-operation contract: docs/analysis/legacy-config-0.113.2.md.

use std::{
    collections::BTreeMap,
    fs, io,
    path::{Path, PathBuf},
};

/// Called before any boot CVar, addon or UI consumer can create the new home.
pub(crate) fn migrate() {
    #[cfg(target_os = "windows")]
    {
        let Some(destination) = benilla_app::config_dir() else {
            return;
        };
        let Ok(executable) = std::env::current_exe() else {
            return;
        };
        let Some(parent) = executable.parent() else {
            return;
        };
        // Explicit BENILLA_HOME and unattended/capture homes must stay isolated.
        if destination != parent.join("benilla-config") || fs::metadata(&destination).is_ok() {
            return;
        }
        let legacy = Path::new(r"C:\Git\wenilla");
        let mut roots = vec![legacy.join("benilla-config")];
        let mut worktrees: Vec<_> = fs::read_dir(legacy.join(".claude/worktrees"))
            .into_iter()
            .flatten()
            .flatten()
            .map(|entry| entry.path().join("benilla-config"))
            .collect();
        worktrees.sort();
        roots.extend(worktrees);
        roots.retain(|root| root.is_dir());
        if roots.is_empty() {
            return;
        }
        match merge(&destination, &roots) {
            Ok(files) => eprintln!(
                "settings: {files} files from {} brought to {}",
                roots
                    .iter()
                    .map(|root| root.display().to_string())
                    .collect::<Vec<_>>()
                    .join(", "),
                destination.display()
            ),
            Err(error) => eprintln!(
                "settings: the old folders could not be copied to {}: {error}",
                destination.display()
            ),
        }
    }
}

#[derive(Debug)]
struct Copy {
    modified: i64,
    path: PathBuf,
}

/// Enumeration failures are skipped; copy/create/rename failures abort publication.
/// The target follows directory roots, but skips symlinks/junctions encountered within them.
fn collect(root: &Path, relative: &Path, files: &mut BTreeMap<PathBuf, Vec<Copy>>) {
    let Ok(entries) = fs::read_dir(root) else {
        return;
    };
    for entry in entries.flatten() {
        let Ok(metadata) = entry.metadata() else {
            continue;
        };
        if metadata.file_type().is_symlink() {
            continue;
        }
        let name = entry.file_name();
        let next = relative.join(&name);
        if metadata.is_dir() {
            if relative.as_os_str().is_empty() && (name == "cache" || name == "Diagnostics") {
                continue;
            }
            collect(&entry.path(), &next, files);
        } else {
            files.entry(next).or_default().push(Copy {
                modified: modification_time(&metadata),
                path: entry.path(),
            });
        }
    }
}

#[cfg(target_os = "windows")]
fn modification_time(metadata: &fs::Metadata) -> i64 {
    use std::os::windows::fs::MetadataExt;
    metadata.last_write_time() as i64
}

// A portable fixture seam only; production migration is Windows-only.
#[cfg(not(target_os = "windows"))]
fn modification_time(metadata: &fs::Metadata) -> i64 {
    metadata
        .modified()
        .ok()
        .and_then(|time| time.duration_since(std::time::UNIX_EPOCH).ok())
        .map_or(0, |time| time.as_nanos() as i64)
}

fn merge(destination: &Path, roots: &[PathBuf]) -> io::Result<usize> {
    let mut files = BTreeMap::<PathBuf, Vec<Copy>>::new();
    for root in roots {
        collect(root, Path::new(""), &mut files)
    }
    let staging = destination.with_extension("part");
    if fs::metadata(&staging).is_ok() {
        fs::remove_dir_all(&staging)?
    }
    fs::create_dir_all(&staging)?;
    for (relative, copies) in &mut files {
        copies.sort_by(|a, b| {
            a.modified
                .cmp(&b.modified)
                .then_with(|| a.path.cmp(&b.path))
        });
        let target = staging.join(relative);
        if let Some(parent) = target.parent() {
            fs::create_dir_all(parent)?
        }
        if relative == Path::new("config.toml") {
            if let Some(text) = merged_config(copies) {
                fs::write(&target, text)?;
                continue;
            }
        }
        fs::copy(&copies.last().expect("a file has a copy").path, &target)?;
    }
    fs::rename(staging, destination)?;
    Ok(files.len())
}

/// Native parses generic TOML, merges only [cvars], and retains the contiguous
/// initial '#' lines from the last successfully parsed candidate. Keys retain
/// their spelling/case and values retain their TOML type; latest values win.
fn merged_config(copies: &[Copy]) -> Option<String> {
    let mut cvars = toml::map::Map::new();
    let mut header = String::new();
    for copy in copies {
        let Ok(text) = fs::read_to_string(&copy.path) else {
            continue;
        };
        let Ok(document) = text.parse::<toml::Value>() else {
            continue;
        };
        if let Some(table) = document.get("cvars").and_then(toml::Value::as_table) {
            cvars.extend(table.clone());
        }
        header.clear();
        for line in text.lines().take_while(|line| line.starts_with('#')) {
            header.push_str(line);
            header.push('\n');
        }
    }
    let document = toml::Value::Table(toml::map::Map::from_iter([(
        "cvars".into(),
        toml::Value::Table(cvars),
    )]));
    Some(format!("{header}{}", toml::to_string(&document).ok()?))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn first_start_merges_settings_and_publishes_all_files_together() {
        let root =
            Path::new(env!("CARGO_MANIFEST_DIR")).join("../../runtime/legacy-config-fixture");
        let _ = fs::remove_dir_all(&root);
        let old = root.join("old");
        let recent = root.join("recent");
        fs::create_dir_all(old.join("saved/Realm-Hero")).unwrap();
        fs::create_dir_all(recent.join("AddOns/Example")).unwrap();
        fs::create_dir_all(old.join("cache")).unwrap();
        fs::write(old.join("cache/skip"), "cache").unwrap();
        fs::write(old.join("saved/Realm-Hero/Example.lua"), "saved").unwrap();
        fs::write(recent.join("AddOns/Example/Example.toc"), "addon").unwrap();
        fs::write(
            old.join("config.toml"),
            "# old\n[cvars]\nOld = 'kept'\nBoth = 'old'\n",
        )
        .unwrap();
        fs::write(recent.join("config.toml"), "# new\n[cvars]\nBoth = 'new'\n").unwrap();
        // Explicit candidate ordering avoids timing assumptions in this policy fixture.
        let config = merged_config(&[
            Copy {
                modified: 1,
                path: old.join("config.toml"),
            },
            Copy {
                modified: 2,
                path: recent.join("config.toml"),
            },
        ])
        .unwrap();
        let parsed: toml::Value = config.parse().unwrap();
        assert!(config.starts_with("# new\n"));
        assert_eq!(parsed["cvars"]["Old"].as_str(), Some("kept"));
        assert_eq!(parsed["cvars"]["Both"].as_str(), Some("new"));
        let destination = root.join("benilla-config");
        assert_eq!(merge(&destination, &[old, recent]).unwrap(), 3);
        assert!(destination.join("saved/Realm-Hero/Example.lua").is_file());
        assert!(destination.join("AddOns/Example/Example.toc").is_file());
        assert!(!destination.join("cache").exists());
        assert!(!destination.with_extension("part").exists());
        fs::remove_dir_all(root).unwrap();
    }
}
