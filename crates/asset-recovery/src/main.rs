//! Inventories local MPQs without assuming that listfiles enumerate every member. The JSON
//! preserves every archive match and reports the existing source chain separately from target
//! fidelity. Extracted game assets are local runtime material, never source deliverables.

use std::collections::{BTreeMap, BTreeSet};
use std::fs::{self, File, OpenOptions};
use std::io::{Read, Write};
use std::path::{Component, Path, PathBuf};

use anyhow::{bail, Context, Result};
use benilla_formats::Chain;
use benilla_mpq::{Archive, Error as MpqError};
use serde::Serialize;

const HELP: &str = "asset-recovery --data-dir <Data> --output <report.json> [--paths <paths.txt>] [--extract <directory>] [--extract-requested-only]\n\
All input/output paths must stay inside this checkout. --extract writes readable known members\n\
into separate archive directories without overwriting existing files. .MPQ.update files are\n\
inventoried separately and never activated in the source patch chain. Without --extract, member\n\
bytes are still read and hashed to distinguish missing paths from unsupported/corrupt content.";

#[derive(Default)]
struct Args {
    data_dir: PathBuf,
    paths: Option<PathBuf>,
    output: PathBuf,
    extract: Option<PathBuf>,
    requested_only: bool,
}

#[derive(Serialize)]
struct Report {
    schema_version: u32,
    data_dir: String,
    path_sources: BTreeMap<String, Vec<String>>,
    limitations: Vec<&'static str>,
    chain_status: String,
    chain_error: Option<String>,
    source_chain_resolution: BTreeMap<String, ChainResolution>,
    archives: Vec<ArchiveReport>,
    requested_paths: Vec<RequestedPath>,
    scan_warnings: Vec<String>,
    summary: Summary,
}

#[derive(Default, Serialize)]
struct Summary {
    active_archives: usize,
    staged_archives: usize,
    known_paths: usize,
    member_matches: usize,
    readable_members: usize,
    unsupported_members: usize,
    errored_members: usize,
    delete_markers: usize,
    extracted_members: usize,
    extraction_errors: usize,
    extracted_bytes: u64,
    requested_paths: usize,
    requested_absent: usize,
}

#[derive(Serialize)]
struct ArchiveReport {
    archive_id: String,
    path: String,
    size_bytes: u64,
    sha256: Option<String>,
    hash_error: Option<String>,
    staged_update: bool,
    source_chain_role: String,
    open_status: String,
    open_error: Option<String>,
    listfile_status: String,
    listfile_error: Option<String>,
    listfile_utf8: Option<bool>,
    listed_paths: Vec<String>,
    members: Vec<Member>,
}

#[derive(Serialize)]
struct Member {
    path: String,
    size_bytes: Option<u32>,
    status: String,
    error: Option<String>,
    sha256: Option<String>,
    extraction_status: String,
    extracted_path: Option<String>,
    extraction_error: Option<String>,
}

#[derive(Serialize)]
struct RequestedPath {
    input: String,
    lookup_path: Option<String>,
    status: String,
    error: Option<String>,
    archive_matches: Vec<String>,
    active_archive_matches: Vec<String>,
    staged_archive_matches: Vec<String>,
    source_chain_winner: Option<String>,
    source_chain_status: String,
}

#[derive(Serialize)]
struct ChainResolution {
    winner_archive: Option<String>,
    status: String,
}

struct OpenArchive {
    archive: Option<Archive>,
    report: ArchiveReport,
}

fn main() {
    if let Err(error) = run() {
        eprintln!("asset-recovery: {error:#}");
        std::process::exit(1);
    }
}

fn parse_args() -> Result<Option<Args>> {
    let mut args = Args::default();
    let mut values = std::env::args().skip(1);
    while let Some(flag) = values.next() {
        match flag.as_str() {
            "--help" | "-h" => {
                println!("{HELP}");
                return Ok(None);
            }
            "--extract-requested-only" => args.requested_only = true,
            "--data-dir" | "--paths" | "--output" | "--extract" => {
                let value = PathBuf::from(values.next().context(format!("{flag} needs a path"))?);
                match flag.as_str() {
                    "--data-dir" => args.data_dir = value,
                    "--paths" => args.paths = Some(value),
                    "--output" => args.output = value,
                    _ => args.extract = Some(value),
                }
            }
            _ => bail!("unknown argument {flag}\n{HELP}"),
        }
    }
    if args.data_dir.as_os_str().is_empty() || args.output.as_os_str().is_empty() {
        bail!("--data-dir and --output are required\n{HELP}");
    }
    if args.requested_only && (args.extract.is_none() || args.paths.is_none()) {
        bail!("--extract-requested-only requires --extract and --paths");
    }
    Ok(Some(args))
}

fn run() -> Result<()> {
    let Some(args) = parse_args()? else {
        return Ok(());
    };
    let root = Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .unwrap()
        .parent()
        .unwrap()
        .canonicalize()?;
    let data = checked_path(&root, &args.data_dir)?;
    if !data.is_dir() {
        bail!("data directory does not exist: {}", data.display());
    }
    let output = checked_path(&root, &args.output)?;
    if output
        .extension()
        .is_none_or(|extension| extension != "json")
    {
        bail!("inventory output must have a .json extension");
    }
    let extraction = args
        .extract
        .as_ref()
        .map(|p| checked_path(&root, p))
        .transpose()?;
    let mut requested_inputs = Vec::new();
    if let Some(paths) = &args.paths {
        let paths = checked_path(&root, paths)?;
        for line in fs::read_to_string(&paths)?.lines() {
            let line = line.trim();
            if !line.is_empty() && !line.starts_with('#') {
                requested_inputs.push(line.to_owned());
            }
        }
    }
    let mut warnings = Vec::new();
    let mut archive_paths = Vec::new();
    walk_mpqs(&data, &mut archive_paths, &mut warnings)?;
    archive_paths.sort();
    if archive_paths.is_empty() {
        bail!(
            "no .MPQ or .MPQ.update files found below {}",
            data.display()
        );
    }

    // Chain::open follows top-level symlinks in its own directory walk. Refuse that comparison
    // when discovery skipped any symlink, before it can read a path outside this checkout.
    let chain = if warnings.is_empty() {
        Chain::open(&data)
    } else {
        Err(anyhow::anyhow!(
            "source chain comparison skipped because input discovery encountered symlinks"
        ))
    };
    let chain_error = chain.as_ref().err().map(|e| format!("{e:#}"));
    let mut known: BTreeMap<String, BTreeSet<String>> = BTreeMap::new();
    known
        .entry("(listfile)".into())
        .or_default()
        .insert("(listfile)".into());
    let mut requested_keys = BTreeSet::new();
    let mut requested_paths = Vec::new();
    for input in requested_inputs {
        let normalized = normalize_lookup(&input);
        let (lookup, status, error) = match normalized {
            Ok(name) => {
                requested_keys.insert(path_key(&name));
                known
                    .entry(path_key(&name))
                    .or_default()
                    .insert(name.clone());
                (Some(name), "pending", None)
            }
            Err(error) => (None, "invalid_path", Some(error.to_string())),
        };
        requested_paths.push(RequestedPath {
            input,
            lookup_path: lookup,
            status: status.into(),
            error,
            archive_matches: Vec::new(),
            active_archive_matches: Vec::new(),
            staged_archive_matches: Vec::new(),
            source_chain_winner: None,
            source_chain_status: "unavailable".into(),
        });
    }

    let mut archives = Vec::new();
    for (index, path) in archive_paths.into_iter().enumerate() {
        checked_path(&root, &path)?;
        let name = path.file_name().unwrap().to_string_lossy();
        let staged_update = name.to_ascii_lowercase().ends_with(".mpq.update");
        let archive_id = format!("{index:04}-{}", safe_archive_label(&name));
        eprintln!("inventory {}", relative(&root, &path));
        let hash = hash_file(&path);
        let archive = Archive::open(&path);
        let mut report = ArchiveReport {
            archive_id,
            path: relative(&root, &path),
            size_bytes: path.metadata()?.len(),
            sha256: hash.as_ref().ok().cloned(),
            hash_error: hash.err().map(|e| e.to_string()),
            staged_update,
            source_chain_role: if staged_update {
                "excluded_staged_update"
            } else if path.parent() == Some(data.as_path()) {
                "candidate_existing_source_rule"
            } else {
                "outside_top_level_source_chain"
            }
            .into(),
            open_status: if archive.is_ok() { "opened" } else { "error" }.into(),
            open_error: archive.as_ref().err().map(ToString::to_string),
            listfile_status: "unavailable".into(),
            listfile_error: None,
            listfile_utf8: None,
            listed_paths: Vec::new(),
            members: Vec::new(),
        };
        if let Ok(archive) = &archive {
            match archive.read_file("(listfile)") {
                Ok(bytes) => {
                    report.listfile_status = "readable".into();
                    report.listfile_utf8 = Some(std::str::from_utf8(&bytes).is_ok());
                    // Invalid UTF-8 names cannot be represented faithfully by the existing
                    // reader's &str lookup. Record that fact, retaining the lossless ASCII lines.
                    for raw in bytes.split(|b| matches!(b, b';' | b'\r' | b'\n')) {
                        let Ok(raw) = std::str::from_utf8(raw) else {
                            continue;
                        };
                        let name = raw.trim();
                        if name.is_empty() {
                            continue;
                        }
                        report.listed_paths.push(name.to_owned());
                        known
                            .entry(path_key(name))
                            .or_default()
                            .insert(name.to_owned());
                    }
                }
                Err(error) => {
                    report.listfile_status = error_status(&error).into();
                    report.listfile_error = Some(error.to_string());
                }
            }
        }
        archives.push(OpenArchive {
            archive: archive.ok(),
            report,
        });
    }
    let mut summary = Summary {
        known_paths: known.len(),
        requested_paths: requested_paths.len(),
        ..Summary::default()
    };
    if let Some(dir) = &extraction {
        safe_create_dir(&root, dir)?;
    }
    for item in &mut archives {
        if item.report.staged_update {
            summary.staged_archives += 1;
        } else {
            summary.active_archives += 1;
        }
        let Some(archive) = &item.archive else {
            continue;
        };
        let mut claimed = BTreeSet::new();
        let mut inspected = 0;
        for (key, aliases) in &known {
            let name = aliases.first().unwrap();
            if !archive.contains(name) {
                continue;
            }
            summary.member_matches += 1;
            inspected += 1;
            if inspected % 1000 == 0 {
                eprintln!("{}: read {} known members", item.report.path, inspected);
            }
            let mut member = Member {
                path: name.clone(),
                size_bytes: archive.file_size(name),
                status: "pending".into(),
                error: None,
                sha256: None,
                extraction_status: "not_requested".into(),
                extracted_path: None,
                extraction_error: None,
            };
            if archive.is_delete_marker(name) {
                member.status = "delete_marker".into();
                summary.delete_markers += 1;
            } else {
                match archive.read_file(name) {
                    Ok(bytes) => {
                        member.status = "readable".into();
                        member.sha256 = Some(hash_bytes(&bytes));
                        summary.readable_members += 1;
                        if let Some(dir) = &extraction {
                            if !args.requested_only || requested_keys.contains(key) {
                                match extract_member(
                                    &root,
                                    dir,
                                    &item.report.archive_id,
                                    name,
                                    &bytes,
                                    &mut claimed,
                                ) {
                                    Ok(out) => {
                                        member.extraction_status = "extracted".into();
                                        member.extracted_path = Some(relative(&root, &out));
                                        summary.extracted_members += 1;
                                        summary.extracted_bytes += bytes.len() as u64;
                                    }
                                    Err(error) => {
                                        member.extraction_status = "error".into();
                                        member.extraction_error = Some(format!("{error:#}"));
                                        summary.extraction_errors += 1;
                                    }
                                }
                            }
                        }
                    }
                    Err(error) => {
                        member.status = error_status(&error).into();
                        member.error = Some(error.to_string());
                        if matches!(error, MpqError::Unsupported(_)) {
                            summary.unsupported_members += 1;
                        } else {
                            summary.errored_members += 1;
                        }
                    }
                }
            }
            item.report.members.push(member);
        }
        eprintln!(
            "{}: {} listed paths, {} known member matches",
            item.report.path,
            item.report.listed_paths.len(),
            item.report.members.len()
        );
    }
    for request in &mut requested_paths {
        let Some(name) = &request.lookup_path else {
            continue;
        };
        for item in &archives {
            if item.archive.as_ref().is_some_and(|a| a.contains(name)) {
                request.archive_matches.push(item.report.archive_id.clone());
                if item.report.staged_update {
                    request
                        .staged_archive_matches
                        .push(item.report.archive_id.clone());
                } else {
                    request
                        .active_archive_matches
                        .push(item.report.archive_id.clone());
                }
            }
        }
        request.status = if request.archive_matches.is_empty() {
            summary.requested_absent += 1;
            if archives.iter().any(|a| a.archive.is_none()) {
                "unresolved_with_unreadable_archive"
            } else {
                "absent_from_available_archives"
            }
        } else if request.active_archive_matches.is_empty() {
            "staged_only"
        } else {
            "matched"
        }
        .into();
        if let Ok(chain) = &chain {
            if let Some(path) = chain.find_file_archive(name) {
                request.source_chain_winner = Some(relative(&root, path));
                request.source_chain_status = match chain.archive_for(name) {
                    Ok(_) => "resolved_by_existing_source_rule",
                    Err(_) => "deleted_by_existing_source_rule",
                }
                .into();
            } else {
                request.source_chain_status = "not_in_existing_source_chain".into();
            }
        }
    }
    let source_chain_resolution = known
        .iter()
        .map(|(key, aliases)| {
            let name = aliases.first().unwrap();
            let mut resolution = ChainResolution {
                winner_archive: None,
                status: "chain_unavailable".into(),
            };
            if let Ok(chain) = &chain {
                if let Some(path) = chain.find_file_archive(name) {
                    resolution.winner_archive = Some(relative(&root, path));
                    resolution.status = if chain.archive_for(name).is_ok() {
                        "resolved"
                    } else {
                        "delete_marker"
                    }
                    .into();
                } else {
                    resolution.status = "absent".into();
                }
            }
            (key.clone(), resolution)
        })
        .collect();
    let report = Report {
        schema_version: 1, data_dir: relative(&root, &data),
        path_sources: known.into_iter().map(|(k, v)| (k, v.into_iter().collect())).collect(),
        limitations: vec![
            "Known paths are the union of readable archive listfiles and supplied path probes; MPQ hashes cannot enumerate unknown names.",
            "The existing benilla-formats Chain rule is reported for comparison only; its mount order has not been verified against the selected 0.97.2 EXE.",
            "The MPQ reader supports stored/zlib sectored V1/V2 data; encrypted, single-unit, implode, PTCH and other codecs remain explicit errors.",
            "Staged .MPQ.update files are independently inventoried/extracted but are never activated in the source chain.",
            "Archive locales/hash-table collisions follow the existing MPQ reader; exhaustive locale variant recovery is not established.",
            "Extraction refuses unsafe paths, symlinks and existing files; it assumes no concurrent replacement of output directories.",
        ],
        chain_status: if chain.is_ok() { "opened_existing_source_chain" } else { "error" }.into(),
        chain_error, source_chain_resolution,
        archives: archives.into_iter().map(|a| a.report).collect(), requested_paths,
        scan_warnings: warnings, summary,
    };
    safe_create_dir(&root, output.parent().context("output has no parent")?)?;
    checked_path(&root, &output)?;
    let mut file = OpenOptions::new()
        .write(true)
        .create(true)
        .truncate(true)
        .open(&output)?;
    serde_json::to_writer_pretty(&mut file, &report)?;
    file.write_all(b"\n")?;
    println!("{}", serde_json::to_string(&report.summary)?);
    println!("report {}", relative(&root, &output));
    Ok(())
}

fn path_key(name: &str) -> String {
    name.replace('/', "\\").to_ascii_lowercase()
}

fn normalize_lookup(input: &str) -> Result<String> {
    let input = input.strip_prefix("mpq://").unwrap_or(input);
    safe_member_path(input)?;
    Ok(input.replace('/', "\\"))
}

fn safe_member_path(name: &str) -> Result<PathBuf> {
    if name.is_empty() || name.starts_with(['/', '\\']) {
        bail!("empty or absolute member path");
    }
    let mut result = PathBuf::new();
    for part in name.split(['/', '\\']) {
        if part.is_empty()
            || matches!(part, "." | "..")
            || part.ends_with(['.', ' '])
            || part
                .chars()
                .any(|c| c.is_control() || matches!(c, ':' | '*' | '?' | '"' | '<' | '>' | '|'))
        {
            bail!("unsafe member path component {part:?}");
        }
        let stem = part.split('.').next().unwrap_or("").to_ascii_uppercase();
        if matches!(stem.as_str(), "CON" | "PRN" | "AUX" | "NUL")
            || ((stem.starts_with("COM") || stem.starts_with("LPT"))
                && stem.len() == 4
                && stem.as_bytes()[3].is_ascii_digit())
        {
            bail!("reserved device path component {part:?}");
        }
        result.push(part);
    }
    Ok(result)
}

fn safe_archive_label(name: &str) -> String {
    name.chars()
        .map(|c| {
            if c.is_ascii_alphanumeric() || matches!(c, '.' | '-' | '_') {
                c
            } else {
                '_'
            }
        })
        .collect()
}

/// Resolve lexical paths first, then reject every existing symlink component before any I/O.
fn checked_path(root: &Path, input: &Path) -> Result<PathBuf> {
    let candidate = if input.is_absolute() {
        input.to_owned()
    } else {
        std::env::current_dir()?.join(input)
    };
    let mut clean = PathBuf::new();
    for component in candidate.components() {
        match component {
            Component::ParentDir => {
                clean.pop();
            }
            Component::CurDir => {}
            _ => clean.push(component.as_os_str()),
        }
    }
    let suffix = clean
        .strip_prefix(root)
        .context("path escapes project workspace")?;
    let mut cursor = root.to_owned();
    for component in suffix.components() {
        cursor.push(component);
        match fs::symlink_metadata(&cursor) {
            Ok(meta) if meta.file_type().is_symlink() => {
                bail!("symlink path refused: {}", cursor.display())
            }
            Ok(_) => {}
            Err(error) if error.kind() == std::io::ErrorKind::NotFound => {}
            Err(error) => return Err(error.into()),
        }
    }
    Ok(clean)
}

fn safe_create_dir(root: &Path, path: &Path) -> Result<()> {
    let path = checked_path(root, path)?;
    let mut cursor = root.to_owned();
    for component in path.strip_prefix(root)?.components() {
        cursor.push(component);
        if fs::symlink_metadata(&cursor).is_err() {
            reject_existing_case_alias(&cursor)?;
        }
        match fs::create_dir(&cursor) {
            Ok(()) => {}
            Err(error) if error.kind() == std::io::ErrorKind::AlreadyExists => {
                let metadata = fs::symlink_metadata(&cursor)?;
                if !metadata.is_dir() || metadata.file_type().is_symlink() {
                    bail!("unsafe output directory {}", cursor.display());
                }
            }
            Err(error) => return Err(error.into()),
        }
    }
    Ok(())
}

fn reject_existing_case_alias(path: &Path) -> Result<()> {
    let parent = path.parent().context("path has no parent")?;
    let name = path
        .file_name()
        .context("path has no filename")?
        .to_string_lossy();
    for entry in fs::read_dir(parent)? {
        let actual = entry?.file_name();
        let actual = actual.to_string_lossy();
        if actual != name && actual.eq_ignore_ascii_case(&name) {
            bail!(
                "case-insensitive output alias already exists: {}",
                parent.join(actual.as_ref()).display()
            );
        }
    }
    Ok(())
}

fn walk_mpqs(dir: &Path, found: &mut Vec<PathBuf>, warnings: &mut Vec<String>) -> Result<()> {
    for entry in fs::read_dir(dir)? {
        let entry = entry?;
        let kind = entry.file_type()?;
        if kind.is_symlink() {
            warnings.push(format!("symlink input skipped: {}", entry.path().display()));
        } else if kind.is_dir() {
            walk_mpqs(&entry.path(), found, warnings)?;
        } else if kind.is_file() {
            let lower = entry.file_name().to_string_lossy().to_ascii_lowercase();
            if lower.ends_with(".mpq") || lower.ends_with(".mpq.update") {
                found.push(entry.path());
            }
        }
    }
    Ok(())
}

fn extract_member(
    root: &Path,
    output: &Path,
    archive_id: &str,
    name: &str,
    bytes: &[u8],
    claimed: &mut BTreeSet<String>,
) -> Result<PathBuf> {
    let relative_path = safe_member_path(name)?;
    if !claimed.insert(path_key(name)) {
        bail!("case-insensitive output alias already claimed");
    }
    let path = output.join(archive_id).join(relative_path);
    checked_path(root, &path)?;
    safe_create_dir(root, path.parent().context("member has no parent")?)?;
    reject_existing_case_alias(&path)?;
    let mut file = OpenOptions::new()
        .write(true)
        .create_new(true)
        .open(&path)
        .with_context(|| {
            format!(
                "creating {} (existing files are never overwritten)",
                path.display()
            )
        })?;
    if let Err(error) = file.write_all(bytes).and_then(|()| file.flush()) {
        drop(file);
        let _ = fs::remove_file(&path);
        return Err(error.into());
    }
    Ok(path)
}

fn error_status(error: &MpqError) -> &'static str {
    match error {
        MpqError::NotFound(_) => "not_found",
        MpqError::Unsupported(_) => "unsupported",
        MpqError::Io(_) => "io_error",
        MpqError::NotMpq => "not_mpq",
        MpqError::Decompress(_) => "decompression_error",
        MpqError::Corrupt(_) => "corrupt",
    }
}

fn relative(root: &Path, path: &Path) -> String {
    path.strip_prefix(root)
        .unwrap_or(path)
        .to_string_lossy()
        .into_owned()
}

fn hash_file(path: &Path) -> Result<String> {
    let mut file = File::open(path)?;
    let mut hash = ring::digest::Context::new(&ring::digest::SHA256);
    let mut buffer = [0_u8; 65536];
    loop {
        let count = file.read(&mut buffer)?;
        if count == 0 {
            break;
        }
        hash.update(&buffer[..count]);
    }
    Ok(hex(hash.finish().as_ref()))
}

fn hash_bytes(bytes: &[u8]) -> String {
    hex(ring::digest::digest(&ring::digest::SHA256, bytes).as_ref())
}
fn hex(bytes: &[u8]) -> String {
    bytes.iter().map(|byte| format!("{byte:02x}")).collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::sync::atomic::{AtomicUsize, Ordering};

    struct Fixture(PathBuf);
    impl Fixture {
        fn new() -> Self {
            static COUNT: AtomicUsize = AtomicUsize::new(0);
            let root = Path::new(env!("CARGO_MANIFEST_DIR"))
                .parent()
                .unwrap()
                .parent()
                .unwrap();
            let path = root.join("runtime/tmp").join(format!(
                "asset-recovery-{}-{}",
                std::process::id(),
                COUNT.fetch_add(1, Ordering::Relaxed)
            ));
            fs::create_dir_all(&path).unwrap();
            Self(path.canonicalize().unwrap())
        }
    }
    impl Drop for Fixture {
        fn drop(&mut self) {
            let _ = fs::remove_dir_all(&self.0);
        }
    }

    #[test]
    fn rejects_traversal_absolute_and_windows_aliases() {
        for name in [
            "",
            "../a",
            "a/../b",
            "a\\..\\b",
            "/a",
            "\\a",
            "C:\\a",
            "//host/share",
            "a//b",
            "a/./b",
            "a.txt:stream",
            "a. /x",
            "a./x",
            "CON.txt",
            "aux",
            "LPT1.bin",
            "x\0y",
            "a?b",
        ] {
            assert!(safe_member_path(name).is_err(), "accepted {name:?}");
        }
    }

    #[test]
    fn retains_case_and_normalizes_only_mpq_separators() {
        assert_eq!(
            safe_member_path("Interface\\Glues/x.blp").unwrap(),
            Path::new("Interface/Glues/x.blp")
        );
        assert_eq!(
            normalize_lookup("mpq://Interface/Glues/x.blp").unwrap(),
            "Interface\\Glues\\x.blp"
        );
        assert_eq!(
            path_key("INTERFACE/Glues/x.blp"),
            path_key("interface\\glues\\X.BLP")
        );
    }

    #[test]
    fn extraction_never_overwrites_and_keeps_archive_copies_separate() {
        let f = Fixture::new();
        let mut claimed = BTreeSet::new();
        let a = extract_member(
            &f.0,
            &f.0.join("out"),
            "0000-a.MPQ",
            "Interface/X",
            b"first",
            &mut claimed,
        )
        .unwrap();
        assert!(extract_member(
            &f.0,
            &f.0.join("out"),
            "0000-a.MPQ",
            "interface/x",
            b"second",
            &mut claimed
        )
        .is_err());
        assert!(extract_member(
            &f.0,
            &f.0.join("out"),
            "0000-a.MPQ",
            "Interface/X",
            b"second",
            &mut BTreeSet::new()
        )
        .is_err());
        assert!(extract_member(
            &f.0,
            &f.0.join("out"),
            "0000-a.MPQ",
            "interface/x",
            b"second",
            &mut BTreeSet::new()
        )
        .is_err());
        let b = extract_member(
            &f.0,
            &f.0.join("out"),
            "0001-b.MPQ",
            "Interface/X",
            b"patch",
            &mut BTreeSet::new(),
        )
        .unwrap();
        assert_eq!(fs::read(a).unwrap(), b"first");
        assert_eq!(fs::read(b).unwrap(), b"patch");
    }

    #[cfg(unix)]
    #[test]
    fn refuses_symlink_ancestors_and_final_files() {
        let f = Fixture::new();
        fs::create_dir_all(f.0.join("real")).unwrap();
        std::os::unix::fs::symlink(f.0.join("real"), f.0.join("link")).unwrap();
        assert!(checked_path(&f.0, &f.0.join("link/x")).is_err());
        assert!(safe_create_dir(&f.0, &f.0.join("link/sub")).is_err());
        fs::create_dir_all(f.0.join("out/archive")).unwrap();
        std::os::unix::fs::symlink(f.0.join("real/missing"), f.0.join("out/archive/file")).unwrap();
        assert!(extract_member(
            &f.0,
            &f.0.join("out"),
            "archive",
            "file",
            b"x",
            &mut BTreeSet::new()
        )
        .is_err());
        assert!(!f.0.join("real/missing").exists());
    }

    #[test]
    fn distinguishes_mpq_errors_and_hashes_known_bytes() {
        assert_eq!(error_status(&MpqError::NotFound("x".into())), "not_found");
        assert_eq!(
            error_status(&MpqError::Unsupported("codec".into())),
            "unsupported"
        );
        assert_eq!(error_status(&MpqError::Corrupt("header".into())), "corrupt");
        assert_eq!(
            hash_bytes(b"abc"),
            "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
        );
    }

    #[test]
    fn lexical_escape_is_rejected() {
        let f = Fixture::new();
        assert!(checked_path(&f.0, &f.0.join("../outside")).is_err());
        assert_eq!(
            checked_path(&f.0, &f.0.join("dir/../safe")).unwrap(),
            f.0.join("safe")
        );
    }

    #[test]
    fn recursive_inventory_retains_staged_update_and_ignores_unrelated_files() {
        let f = Fixture::new();
        fs::create_dir_all(f.0.join("nested")).unwrap();
        for name in [
            "patch.MPQ",
            "patch-3.MPQ.update",
            "nested/Other.mpq",
            "save.txt",
            "old.MPQ.bak",
        ] {
            fs::write(f.0.join(name), b"fixture").unwrap();
        }
        let mut found = Vec::new();
        walk_mpqs(&f.0, &mut found, &mut Vec::new()).unwrap();
        found.sort();
        assert_eq!(
            found,
            [
                f.0.join("nested/Other.mpq"),
                f.0.join("patch-3.MPQ.update"),
                f.0.join("patch.MPQ")
            ]
        );
    }
}
