//! Pure 0.92 updater path/replace sequencing, recovered from113110/0e8d80/01c280.
//!
//! The injected backend permits operation/failure fixture checks without real installation.
//! The connected production adapters live in update_worker.rs; tests use memory-only hosts.

use std::{
    ffi::OsString,
    fmt,
    io::{self, BufWriter, Read, Write},
    path::{Path, PathBuf},
};

#[path = "update_parts.rs"]
pub mod parts;

#[derive(Debug)]
pub enum DecodeError {
    Io(io::Error),
    ChecksumMismatch,
}

impl fmt::Display for DecodeError {
    fn fmt(&self, out: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::Io(error) => error.fmt(out),
            Self::ChecksumMismatch => out.write_str("the download is damaged (checksum mismatch)"),
        }
    }
}

impl From<io::Error> for DecodeError {
    fn from(error: io::Error) -> Self {
        Self::Io(error)
    }
}

/// 119320/161480: the caller supplies concatenated compressed parts and a destination writer.
/// The public read decoder supplies the native32KiB private input buffer and single-member mode.
/// Explicit output flush precedes decoded-length/lowercase-SHA comparison. Errors leave output
/// already written; the separate outer worker owns attempted-stage cleanup.
pub fn decode_verified(
    input: impl Read,
    output: &mut impl Write,
    expected_size: u64,
    expected_sha256: &str,
) -> Result<(), DecodeError> {
    decode_verified_with(input, || Ok(output), expected_size, expected_sha256)
}

/// 11943b–119469 constructs the gzip reader (which can read its header), then opens the file.
/// Keep this ordering when the connected worker supplies the real OpenOptions closure.
pub fn decode_verified_with<W: Write>(
    input: impl Read,
    open_output: impl FnOnce() -> io::Result<W>,
    expected_size: u64,
    expected_sha256: &str,
) -> Result<(), DecodeError> {
    let mut decoder = flate2::read::GzDecoder::new(input);
    let mut writer = BufWriter::with_capacity(8192, open_output()?);
    // SHA256 is byte-bound to native4ae320; provider crate identity is not inferred from it.
    let mut hash = ring::digest::Context::new(&ring::digest::SHA256);
    let mut buffer = vec![0_u8; 65536];
    let mut decoded_size = 0_u64;
    loop {
        let count = decoder.read(&mut buffer)?;
        if count == 0 {
            break;
        }
        hash.update(&buffer[..count]);
        writer.write_all(&buffer[..count])?;
        decoded_size = decoded_size.wrapping_add(count as u64);
    }
    writer.flush()?;
    drop(writer);
    let digest = hash.finish();
    let sha256 = digest
        .as_ref()
        .iter()
        .map(|byte| format!("{byte:02x}"))
        .collect::<String>();
    if decoded_size != expected_size || sha256 != expected_sha256 {
        return Err(DecodeError::ChecksumMismatch);
    }
    Ok(())
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct PatchPaths {
    pub staged: PathBuf,
    pub destination: PathBuf,
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct StagingPaths {
    pub patches: Vec<PatchPaths>,
    pub executable_staged: PathBuf,
    pub executable_backup: PathBuf,
}

/// Native0e8e59/0e908e and1131b7: literal names and std::path operations.
/// The earlier manifest parser validates names; this owner performs no further sanitization.
pub fn staging_paths(executable: &Path, patch_names: &[String]) -> StagingPaths {
    let data = executable
        .parent()
        .unwrap_or_else(|| Path::new("."))
        .join("Data");
    StagingPaths {
        patches: patch_names
            .iter()
            .map(|name| PatchPaths {
                staged: data.join(format!("{name}.update")),
                destination: data.join(name),
            })
            .collect(),
        executable_staged: executable.with_extension("update"),
        executable_backup: executable.with_extension("old"),
    }
}

/// The retained Ready3 payload supplies both lanes independently; data-only updates still restart.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct ReadyPlan {
    pub patch_names: Vec<String>,
    pub replace_executable: bool,
}

pub trait ApplyBackend {
    type Error;

    /// Re-query current_exe and the exact update::eligible_executable/env rule at apply time.
    /// None represents the native `not the shipped exe` guard; actual path errors remain errors.
    fn shipped_executable(&mut self) -> Result<Option<PathBuf>, Self::Error>;
    fn remove_file(&mut self, path: &Path) -> Result<(), Self::Error>;
    fn rename(&mut self, source: &Path, destination: &Path) -> Result<(), Self::Error>;
    /// The already-decoded argument tail preserves the caller's native argv[1..] sequence.
    fn spawn(&mut self, executable: &Path, argument_tail: &[OsString]) -> Result<(), Self::Error>;
}

#[derive(Debug, PartialEq, Eq)]
pub enum ApplyError<E> {
    NotShippedExecutable,
    NothingDownloaded,
    Io(E),
}

impl<E: fmt::Display> fmt::Display for ApplyError<E> {
    fn fmt(&self, out: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::NotShippedExecutable => out.write_str("not the shipped exe"),
            Self::NothingDownloaded => out.write_str("nothing downloaded"),
            Self::Io(error) => error.fmt(out),
        }
    }
}

/// Native113110: data replacements precede executable backup/replacement, then respawn.
/// Errors from explicit removals and attempted rollback are ignored; rename/spawn errors propagate.
pub fn apply<B: ApplyBackend>(
    backend: &mut B,
    ready: Option<&ReadyPlan>,
    argument_tail: &[OsString],
) -> Result<(), ApplyError<B::Error>> {
    // Native113140 rechecks the shipped-executable gate before checking Ready3.
    let executable = backend
        .shipped_executable()
        .map_err(ApplyError::Io)?
        .ok_or(ApplyError::NotShippedExecutable)?;
    let ready = ready.ok_or(ApplyError::NothingDownloaded)?;
    let paths = staging_paths(&executable, &ready.patch_names);
    for patch in paths.patches {
        let _ = backend.remove_file(&patch.destination);
        backend
            .rename(&patch.staged, &patch.destination)
            .map_err(ApplyError::Io)?;
    }
    if ready.replace_executable {
        let _ = backend.remove_file(&paths.executable_backup);
        backend
            .rename(&executable, &paths.executable_backup)
            .map_err(ApplyError::Io)?;
        if let Err(error) = backend.rename(&paths.executable_staged, &executable) {
            let _ = backend.rename(&paths.executable_backup, &executable);
            return Err(ApplyError::Io(error));
        }
    }
    backend
        .spawn(&executable, argument_tail)
        .map_err(ApplyError::Io)
}

/// Native0e922b removes every attempted stage, including the currently failed artifact.
pub fn cleanup_attempted<B: ApplyBackend>(backend: &mut B, attempted: &[PathBuf]) {
    for path in attempted {
        let _ = backend.remove_file(path);
    }
}

/// Native01c280: Ready3 starts a1.2-second deadline; leaving Ready clears it.
#[derive(Default, Debug)]
pub struct ReadyDelay(Option<f32>);

impl ReadyDelay {
    pub fn due(&mut self, ready: bool, elapsed_secs: f32) -> bool {
        if !ready {
            self.0 = None;
            return false;
        }
        let deadline = *self.0.get_or_insert(elapsed_secs + 1.2);
        if deadline > elapsed_secs {
            return false;
        }
        self.0 = None;
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const ABC_SHA256: &str = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";

    // Independent, uncompressed DEFLATE framing. CRC/SHA constants were checked with
    // Python zlib/hashlib and the retained native compression replay, not this decoder.
    fn stored_gzip(payload: &[u8], crc32: u32) -> Vec<u8> {
        let mut result = vec![0x1f, 0x8b, 8, 0, 0, 0, 0, 0, 0, 0xff];
        let mut chunks = payload.chunks(65535).peekable();
        if payload.is_empty() {
            result.extend_from_slice(&[1, 0, 0, 0xff, 0xff]);
        }
        while let Some(chunk) = chunks.next() {
            result.push(u8::from(chunks.peek().is_none()));
            let count = chunk.len() as u16;
            result.extend_from_slice(&count.to_le_bytes());
            result.extend_from_slice(&(!count).to_le_bytes());
            result.extend_from_slice(chunk);
        }
        result.extend_from_slice(&crc32.to_le_bytes());
        result.extend_from_slice(&(payload.len() as u32).to_le_bytes());
        result
    }

    #[test]
    fn native_stream_accepts_every_two_part_boundary_and_one_byte_parts() {
        let gzip = stored_gzip(b"abc", 0x352441c2);
        for split in 0..=gzip.len() {
            let input = io::Cursor::new(&gzip[..split]).chain(io::Cursor::new(&gzip[split..]));
            let mut output = Vec::new();
            decode_verified(input, &mut output, 3, ABC_SHA256).unwrap();
            assert_eq!(output, b"abc");
        }
        let input: Box<dyn Read> = gzip
            .iter()
            .fold(Box::new(io::empty()) as Box<dyn Read>, |all, byte| {
                Box::new(all.chain(io::empty()).chain(io::Cursor::new(vec![*byte])))
            });
        let mut output = Vec::new();
        decode_verified(input, &mut output, 3, ABC_SHA256).unwrap();
        assert_eq!(output, b"abc");
        output.clear();
        decode_verified(
            io::Cursor::new(stored_gzip(b"", 0)),
            &mut output,
            0,
            "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
        )
        .unwrap();
        assert!(output.is_empty());
    }

    #[test]
    fn native_stream_crc_and_isize_fail_as_decoder_errors_and_keep_written_output() {
        for trailer_lane in [8, 4] {
            let mut gzip = stored_gzip(b"abc", 0x352441c2);
            let index = gzip.len() - trailer_lane;
            gzip[index] ^= 1;
            let mut output = Vec::new();
            let error =
                decode_verified(io::Cursor::new(gzip), &mut output, 3, ABC_SHA256).unwrap_err();
            match error {
                DecodeError::Io(error) => {
                    assert_eq!(error.kind(), io::ErrorKind::InvalidInput);
                    assert_eq!(
                        error.to_string(),
                        "corrupt gzip stream does not have a matching checksum"
                    );
                }
                _ => panic!("gzip trailer failure was replaced by a manifest mismatch"),
            }
            // Native BufWriter drop flushes buffered decoded bytes before outer cleanup.
            assert_eq!(output, b"abc");
        }
    }

    #[test]
    fn native_stream_size_and_sha_fail_after_decoding_without_extra_normalization() {
        let uppercase = ABC_SHA256.to_ascii_uppercase();
        for (size, sha256) in [
            (2, ABC_SHA256),
            (4, ABC_SHA256),
            (3, "bad"),
            (3, uppercase.as_str()),
        ] {
            let mut output = Vec::new();
            let error = decode_verified(
                io::Cursor::new(stored_gzip(b"abc", 0x352441c2)),
                &mut output,
                size,
                sha256,
            )
            .unwrap_err();
            assert!(matches!(error, DecodeError::ChecksumMismatch));
            assert_eq!(
                error.to_string(),
                "the download is damaged (checksum mismatch)"
            );
            assert_eq!(output, b"abc");
        }
    }

    #[test]
    fn native_stream_stops_after_first_member_even_when_second_is_corrupt() {
        let mut gzip = stored_gzip(b"abc", 0x352441c2);
        gzip.extend_from_slice(&stored_gzip(b"def", 0x0cc4e161));
        let mut output = Vec::new();
        decode_verified(io::Cursor::new(&gzip), &mut output, 3, ABC_SHA256).unwrap();
        assert_eq!(output, b"abc");
        output.clear();
        let error = decode_verified(
            io::Cursor::new(&gzip),
            &mut output,
            6,
            "bef57ec7f53a6d40beb640a780a639c83bc29ac8a9816f1fc6c5c6dcd93c4721",
        )
        .unwrap_err();
        assert!(matches!(error, DecodeError::ChecksumMismatch));
        let index = gzip.len() - 8;
        gzip[index] ^= 1;
        output.clear();
        decode_verified(io::Cursor::new(&gzip), &mut output, 3, ABC_SHA256).unwrap();
        assert_eq!(output, b"abc");
    }

    #[derive(Default)]
    struct StreamWriter {
        bytes: Vec<u8>,
        writes: Vec<usize>,
        flushes: usize,
        fail_write: bool,
        fail_flush: bool,
    }
    impl Write for StreamWriter {
        fn write(&mut self, bytes: &[u8]) -> io::Result<usize> {
            if self.fail_write {
                return Err(io::Error::other("fixture write"));
            }
            self.writes.push(bytes.len());
            self.bytes.extend_from_slice(bytes);
            Ok(bytes.len())
        }
        fn flush(&mut self) -> io::Result<()> {
            self.flushes += 1;
            if self.fail_flush {
                Err(io::Error::other("fixture flush"))
            } else {
                Ok(())
            }
        }
    }

    #[test]
    fn native_stream_reads_64k_and_flushes_8k_writer_before_success() {
        let payload = b"abc".repeat(21846);
        // Independent Python gzip/zlib fixture, compressed to100 bytes so input buffering
        // does not split the requested64KiB decoded read at a stored-block boundary.
        let wire_hex = "1f8b08000000000002ffedc2010900000002a0add5ff0f1d514c17555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555ed0e8252527302000100";
        let wire = wire_hex
            .as_bytes()
            .chunks_exact(2)
            .map(|pair| u8::from_str_radix(std::str::from_utf8(pair).unwrap(), 16).unwrap())
            .collect::<Vec<_>>();
        let mut output = StreamWriter::default();
        decode_verified(
            io::Cursor::new(wire),
            &mut output,
            65538,
            "d591ff05defe75c3c3624a82ef8590da060c0b931c320467c0b7d99078061b2c",
        )
        .unwrap();
        assert_eq!(output.bytes, payload);
        assert_eq!(output.writes, [65536, 2]);
        assert_eq!(output.flushes, 1);
    }

    #[test]
    fn native_stream_propagates_read_write_and_flush_errors_before_manifest_check() {
        struct BrokenReader;
        impl Read for BrokenReader {
            fn read(&mut self, _: &mut [u8]) -> io::Result<usize> {
                Err(io::Error::new(
                    io::ErrorKind::PermissionDenied,
                    "fixture read",
                ))
            }
        }
        let mut output = Vec::new();
        let error = decode_verified(BrokenReader, &mut output, 0, "").unwrap_err();
        assert!(
            matches!(&error,DecodeError::Io(error) if error.kind()==io::ErrorKind::PermissionDenied)
        );
        assert!(output.is_empty());
        let mut output = StreamWriter {
            fail_write: true,
            ..Default::default()
        };
        let error = decode_verified(
            io::Cursor::new(stored_gzip(b"abc", 0x352441c2)),
            &mut output,
            0,
            "",
        )
        .unwrap_err();
        assert_eq!(error.to_string(), "fixture write");
        let mut output = StreamWriter {
            fail_flush: true,
            ..Default::default()
        };
        let error = decode_verified(
            io::Cursor::new(stored_gzip(b"abc", 0x352441c2)),
            &mut output,
            0,
            "",
        )
        .unwrap_err();
        assert_eq!(error.to_string(), "fixture flush");
        assert_eq!(output.bytes, b"abc");
        assert_eq!(output.flushes, 1);
    }

    #[derive(Debug, PartialEq, Eq)]
    enum Op {
        Gate,
        Remove(PathBuf),
        Rename(PathBuf, PathBuf),
        Spawn(PathBuf, Vec<OsString>),
    }
    struct Fixture {
        ops: Vec<Op>,
        fail_renames: Vec<usize>,
        renames: usize,
        eligible: bool,
        remove_errors: bool,
        spawn_error: bool,
    }
    impl Default for Fixture {
        fn default() -> Self {
            Self {
                ops: vec![],
                fail_renames: vec![],
                renames: 0,
                eligible: true,
                remove_errors: false,
                spawn_error: false,
            }
        }
    }
    impl ApplyBackend for Fixture {
        type Error = String;
        fn shipped_executable(&mut self) -> Result<Option<PathBuf>, String> {
            self.ops.push(Op::Gate);
            Ok(self
                .eligible
                .then(|| PathBuf::from("/fixture/AzerothSurvivors.exe")))
        }
        fn remove_file(&mut self, p: &Path) -> Result<(), String> {
            self.ops.push(Op::Remove(p.into()));
            if self.remove_errors {
                Err("remove failed".into())
            } else {
                Ok(())
            }
        }
        fn rename(&mut self, a: &Path, b: &Path) -> Result<(), String> {
            self.ops.push(Op::Rename(a.into(), b.into()));
            self.renames += 1;
            if self.fail_renames.contains(&self.renames) {
                Err(format!("rename{} failed", self.renames))
            } else {
                Ok(())
            }
        }
        fn spawn(&mut self, p: &Path, args: &[OsString]) -> Result<(), String> {
            self.ops.push(Op::Spawn(p.into(), args.into()));
            if self.spawn_error {
                Err("spawn failed".into())
            } else {
                Ok(())
            }
        }
    }
    fn rename(a: &str, b: &str) -> Op {
        Op::Rename(a.into(), b.into())
    }
    fn plan() -> ReadyPlan {
        ReadyPlan {
            patch_names: vec!["patch-A.MPQ".into()],
            replace_executable: true,
        }
    }

    #[test]
    fn native_success_order_and_unmodified_argument_tail() {
        let mut io = Fixture {
            remove_errors: true,
            ..Default::default()
        };
        let args = [
            OsString::from("--data-dir"),
            OsString::from("/fixture/MPQ data"),
        ];
        assert_eq!(apply(&mut io, Some(&plan()), &args), Ok(()));
        assert_eq!(
            io.ops,
            vec![
                Op::Gate,
                Op::Remove("/fixture/Data/patch-A.MPQ".into()),
                rename(
                    "/fixture/Data/patch-A.MPQ.update",
                    "/fixture/Data/patch-A.MPQ"
                ),
                Op::Remove("/fixture/AzerothSurvivors.old".into()),
                rename(
                    "/fixture/AzerothSurvivors.exe",
                    "/fixture/AzerothSurvivors.old"
                ),
                rename(
                    "/fixture/AzerothSurvivors.update",
                    "/fixture/AzerothSurvivors.exe"
                ),
                Op::Spawn("/fixture/AzerothSurvivors.exe".into(), args.into())
            ]
        );
    }

    #[test]
    fn replacement_failure_attempts_rollback_and_preserves_original_error() {
        let mut io = Fixture {
            fail_renames: vec![3, 4],
            ..Default::default()
        };
        assert_eq!(
            apply(&mut io, Some(&plan()), &[]),
            Err(ApplyError::Io("rename3 failed".into()))
        );
        assert_eq!(
            io.ops.last(),
            Some(&rename(
                "/fixture/AzerothSurvivors.old",
                "/fixture/AzerothSurvivors.exe"
            ))
        );
        assert_eq!(io.renames, 4);
        assert!(!io.ops.iter().any(|op| matches!(op, Op::Spawn(..))));
    }

    #[test]
    fn earlier_rename_failure_stops_without_inventing_rollback() {
        for failed in [1, 2] {
            let mut io = Fixture {
                fail_renames: vec![failed],
                ..Default::default()
            };
            assert_eq!(
                apply(&mut io, Some(&plan()), &[]),
                Err(ApplyError::Io(format!("rename{failed} failed")))
            );
            assert_eq!(io.renames, failed);
            assert!(!io.ops.iter().any(|op| matches!(op, Op::Spawn(..))));
        }
    }

    #[test]
    fn spawn_failure_does_not_rollback_applied_files() {
        let mut io = Fixture {
            spawn_error: true,
            ..Default::default()
        };
        assert_eq!(
            apply(&mut io, Some(&plan()), &[]),
            Err(ApplyError::Io("spawn failed".into()))
        );
        assert_eq!(io.renames, 3);
        assert!(matches!(io.ops.last(), Some(Op::Spawn(..))));
        let mut data_only = Fixture::default();
        assert_eq!(
            apply(
                &mut data_only,
                Some(&ReadyPlan {
                    patch_names: vec![],
                    replace_executable: false
                }),
                &[]
            ),
            Ok(())
        );
        assert_eq!(
            data_only.ops,
            vec![
                Op::Gate,
                Op::Spawn("/fixture/AzerothSurvivors.exe".into(), vec![])
            ]
        );
    }

    #[test]
    fn guards_precede_mutations_and_cleanup_keeps_attempt_order() {
        let mut io = Fixture {
            eligible: false,
            ..Default::default()
        };
        assert_eq!(
            apply(&mut io, None, &[]),
            Err(ApplyError::NotShippedExecutable)
        );
        assert_eq!(io.ops, vec![Op::Gate]);
        io.eligible = true;
        io.ops.clear();
        assert_eq!(
            apply(&mut io, None, &[]),
            Err(ApplyError::NothingDownloaded)
        );
        assert_eq!(io.ops, vec![Op::Gate]);
        io.ops.clear();
        io.remove_errors = true;
        cleanup_attempted(
            &mut io,
            &["/fixture/a.update".into(), "/fixture/b.update".into()],
        );
        assert_eq!(
            io.ops,
            vec![
                Op::Remove("/fixture/a.update".into()),
                Op::Remove("/fixture/b.update".into())
            ]
        );
    }

    #[test]
    fn native_ready_deadline_resets_on_other_states() {
        let mut delay = ReadyDelay::default();
        assert!(!delay.due(true, 1.));
        assert!(!delay.due(true, 2.19));
        assert!(delay.due(true, 2.2));
        assert!(!delay.due(true, 3.));
        assert!(!delay.due(false, 4.));
        assert!(!delay.due(true, 8.));
        assert!(delay.due(true, 9.2));
    }
}
