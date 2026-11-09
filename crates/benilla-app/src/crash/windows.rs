//! The Windows process fault path recovered from the 0.143.0 client.

use std::backtrace::Backtrace;
use std::fmt::Write as _;
use std::fs::{self, File};
use std::io::Write as _;
use std::os::windows::io::AsRawHandle;
use std::path::{Path, PathBuf};
use std::ptr::{null, null_mut};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{mpsc, OnceLock};
use std::time::{Duration, SystemTime, UNIX_EPOCH};

use windows_sys::Win32::Foundation::{
    EXCEPTION_ACCESS_VIOLATION, EXCEPTION_ILLEGAL_INSTRUCTION, EXCEPTION_INT_DIVIDE_BY_ZERO,
    EXCEPTION_IN_PAGE_ERROR, EXCEPTION_STACK_OVERFLOW, STATUS_FAIL_FAST_EXCEPTION,
    STATUS_HEAP_CORRUPTION, STATUS_STACK_BUFFER_OVERRUN,
};
use windows_sys::Win32::System::Diagnostics::Debug::{
    MiniDumpWithIndirectlyReferencedMemory, MiniDumpWithThreadInfo, MiniDumpWriteDump,
    SetUnhandledExceptionFilter, EXCEPTION_CONTINUE_SEARCH, EXCEPTION_POINTERS, EXCEPTION_RECORD,
    LPTOP_LEVEL_EXCEPTION_FILTER, MINIDUMP_EXCEPTION_INFORMATION,
};
use windows_sys::Win32::System::LibraryLoader::{
    GetModuleFileNameW, GetModuleHandleExW, GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS,
    GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
};
use windows_sys::Win32::System::Threading::{
    GetCurrentProcess, GetCurrentProcessId, GetCurrentThreadId,
};

use crate::BuildId;

struct Reporter {
    directory: PathBuf,
    build: String,
    previous: LPTOP_LEVEL_EXCEPTION_FILTER,
}

static REPORTER: OnceLock<Reporter> = OnceLock::new();
static REPORTING: AtomicBool = AtomicBool::new(false);

pub(crate) fn install(directory: PathBuf, build: BuildId) {
    REPORTER.get_or_init(|| {
        let build = format!("{} (sha {})", build.summary(), build.sha);
        // SAFETY: the callback has the required ABI and static lifetime.
        let previous = unsafe { SetUnhandledExceptionFilter(Some(filter)) };
        Reporter {
            directory,
            build,
            previous,
        }
    });
}

unsafe extern "system" fn filter(exceptions: *const EXCEPTION_POINTERS) -> i32 {
    let Some(reporter) = REPORTER.get() else {
        return EXCEPTION_CONTINUE_SEARCH;
    };
    if !REPORTING.swap(true, Ordering::SeqCst) {
        // SAFETY: Windows supplies this exception record for the duration of the callback.
        let record = unsafe {
            exceptions
                .as_ref()
                .and_then(|pointers| pointers.ExceptionRecord.as_ref())
        };
        reporter.report(exceptions, record);
    }
    if let Some(previous) = reporter.previous {
        // SAFETY: Windows returned this filter with the same ABI and argument contract.
        unsafe { previous(exceptions) }
    } else {
        EXCEPTION_CONTINUE_SEARCH
    }
}

impl Reporter {
    fn report(&self, exceptions: *const EXCEPTION_POINTERS, record: Option<&EXCEPTION_RECORD>) {
        let unix = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs();
        let _ = fs::create_dir_all(&self.directory);
        let dump = self.directory.join(format!("fault-{unix}.dmp"));
        // SAFETY: takes no arguments.
        let thread_id = unsafe { GetCurrentThreadId() };
        let dump_written = write_dump(&dump, thread_id, exceptions);

        let code = record.map_or(0, |record| record.ExceptionCode);
        let address = record.map_or(0, |record| record.ExceptionAddress as usize);
        let module = module_at(address);
        let thread = std::thread::current();
        let diagnostics = (code != EXCEPTION_STACK_OVERFLOW).then(|| {
            let backtrace = Backtrace::force_capture().to_string();
            (backtrace, read_log())
        });

        let mut text = String::from("benilla fault report\n");
        let _ = writeln!(text, "build:     {}", self.build);
        let _ = writeln!(text, "time:      {unix} unix");
        let _ = writeln!(text, "platform:  windows {}", std::env::consts::ARCH);
        let _ = writeln!(
            text,
            "thread:    {} (id {thread_id})",
            thread.name().unwrap_or("<unnamed>")
        );
        let _ = writeln!(
            text,
            "exception: {:#010x} {}",
            code as u32,
            exception_label(code)
        );
        let _ = writeln!(text, "address:   {address:#018x}");
        if let Some((path, offset)) = module {
            let _ = writeln!(text, "module:    {path} +{offset:#x}");
        } else {
            text.push_str("module:    <none>\n");
        }
        if let Some(record) =
            record.filter(|r| code == EXCEPTION_ACCESS_VIOLATION && r.NumberParameters >= 2)
        {
            let target = record.ExceptionInformation[1];
            let label = match record.ExceptionInformation[0] {
                0 => "read",
                1 => "write",
                8 => "execute",
                _ => "access",
            };
            let _ = writeln!(text, "access:    {label} of {target:#018x}");
        }
        if dump_written {
            let _ = writeln!(text, "dump:      {}", dump.display());
        } else {
            text.push_str("dump:      <not written>\n");
        }
        let log = diagnostics.and_then(|(backtrace, log)| {
            let _ = writeln!(text, "\nbacktrace:\n{backtrace}");
            log
        });
        if let Some(lines) = log {
            let _ = writeln!(text, "last {} log lines (oldest first):", lines.len());
            for line in lines {
                let _ = writeln!(text, "{line}");
            }
        } else {
            text.push_str("log: <not read>\n");
        }

        let path = self.directory.join(format!("fault-{unix}.txt"));
        if fs::write(&path, text).is_ok() {
            let _ = writeln!(
                std::io::stderr(),
                "fault report written to {}",
                path.display()
            );
        }
    }
}

fn write_dump(path: &Path, thread_id: u32, exceptions: *const EXCEPTION_POINTERS) -> bool {
    let Ok(file) = File::create(path) else {
        return false;
    };
    let info = MINIDUMP_EXCEPTION_INFORMATION {
        ThreadId: thread_id,
        ExceptionPointers: exceptions.cast_mut(),
        ClientPointers: 0,
    };
    // SAFETY: the current-process pseudo handle and open file are valid. The exception record
    // and its context remain live in the calling Windows filter during this synchronous call.
    let written = unsafe {
        MiniDumpWriteDump(
            GetCurrentProcess(),
            GetCurrentProcessId(),
            file.as_raw_handle(),
            MiniDumpWithIndirectlyReferencedMemory | MiniDumpWithThreadInfo,
            &info,
            null(),
            null(),
        ) != 0
    };
    drop(file);
    if !written {
        let _ = fs::remove_file(path);
    }
    written
}

fn module_at(address: usize) -> Option<(String, usize)> {
    let mut module = null_mut();
    // SAFETY: FROM_ADDRESS treats the argument as an address, never as a string pointer.
    let found = unsafe {
        GetModuleHandleExW(
            GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
            address as _,
            &mut module,
        )
    };
    if found == 0 || module.is_null() {
        return None;
    }
    let mut path = [0; 520];
    // SAFETY: the output buffer is writable for its full advertised length.
    let len = unsafe { GetModuleFileNameW(module, path.as_mut_ptr(), path.len() as u32) };
    let name = String::from_utf16_lossy(&path[..(len as usize).min(path.len())]);
    Some((name, address.wrapping_sub(module as usize)))
}

fn read_log() -> Option<Vec<String>> {
    // The faulting thread can own the log lock. A detached worker bounds the wait.
    let (send, receive) = mpsc::channel();
    std::thread::Builder::new()
        .name("fault-report".to_owned())
        .spawn(move || {
            let _ = send.send(benilla_world::log_ring::recent());
        })
        .ok()?;
    receive.recv_timeout(Duration::from_secs(2)).ok()
}

fn exception_label(code: i32) -> &'static str {
    match code {
        EXCEPTION_ACCESS_VIOLATION => "access violation",
        EXCEPTION_STACK_OVERFLOW => "stack overflow",
        EXCEPTION_ILLEGAL_INSTRUCTION => "illegal instruction",
        EXCEPTION_IN_PAGE_ERROR => "in-page error",
        EXCEPTION_INT_DIVIDE_BY_ZERO => "integer divide by zero",
        STATUS_STACK_BUFFER_OVERRUN => "stack buffer overrun / fail-fast",
        STATUS_HEAP_CORRUPTION => "heap corruption",
        STATUS_FAIL_FAST_EXCEPTION => "unhandled C++ exception",
        _ if code as u32 == 0xe06d7363 => "C++ exception",
        _ => "exception",
    }
}
