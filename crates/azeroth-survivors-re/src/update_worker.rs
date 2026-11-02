//! Native0.92 updater lifecycle and adapters:113bf0/0e8d80/119320/01c280/113110.
//! Production I/O is gated by the exact shipped executable rule. Tests use injected hosts only.

use super::install::{
    self,
    parts::{PartHost, PartReader, PartResponse, WireProgress, WireSnapshot},
    ApplyBackend, ReadyDelay, ReadyPlan,
};
use super::{automatic, eligible_executable, Download, UpdatePlan, USER_AGENT};
use std::{
    ffi::OsString,
    fs::OpenOptions,
    io::{self, Read},
    path::{Path, PathBuf},
    sync::{Arc, Mutex},
    time::{Duration, Instant},
};

#[derive(Clone, Debug, Default, PartialEq)]
pub enum State {
    #[default]
    Empty,
    Available(UpdatePlan),
    Downloading {
        progress: WireSnapshot,
        plan: UpdatePlan,
    },
    Ready(UpdatePlan),
    Failed {
        error: String,
        plan: UpdatePlan,
    },
}
impl State {
    pub fn kind(&self) -> u8 {
        match self {
            Self::Empty => 0,
            Self::Available(_) => 1,
            Self::Downloading { .. } => 2,
            Self::Ready(_) => 3,
            Self::Failed { .. } => 4,
        }
    }
    pub fn plan(&self) -> Option<&UpdatePlan> {
        match self {
            Self::Empty => None,
            Self::Available(p)
            | Self::Ready(p)
            | Self::Downloading { plan: p, .. }
            | Self::Failed { plan: p, .. } => Some(p),
        }
    }
    /// 1ab20: active work bypasses dismissal and menu lifecycle checks.
    pub fn modal(&self, dismissed: bool, menu_context: bool) -> bool {
        match self {
            Self::Downloading { .. } | Self::Ready(_) => true,
            Self::Available(_) | Self::Failed { .. } => !dismissed && menu_context,
            Self::Empty => false,
        }
    }
    pub fn banner(&self, dismissed: bool, menu_context: bool) -> bool {
        matches!(self, Self::Available(_) | Self::Failed { .. }) && dismissed && menu_context
    }
}

#[derive(Clone, Default)]
pub struct Shared(Arc<Mutex<State>>);
impl Shared {
    pub fn snapshot(&self) -> State {
        self.0.lock().unwrap().clone()
    }
    pub fn publish(&self, state: State) {
        *self.0.lock().unwrap() = state;
    }
    pub fn start(&self) {
        let state = self.snapshot();
        begin_with(&mut NativeStart(self.clone()), &state);
    }
    pub fn checked(&self, plan: Option<UpdatePlan>) {
        if let Some(plan) = plan {
            self.publish(State::Available(plan));
            if automatic(std::env::var("WOW_ROGUE_UPDATE_AUTO").ok().as_deref()) {
                self.start();
            }
        }
    }
}

pub trait StartHost {
    fn shipped_executable(&mut self) -> Option<PathBuf>;
    fn publish(&mut self, state: State);
    /// Native discards the thread-spawn Result; failure leaves the published Downloading state.
    fn spawn(&mut self, executable: PathBuf, plan: UpdatePlan);
}
pub fn begin_with(host: &mut impl StartHost, state: &State) -> bool {
    let plan = match state {
        State::Available(p) | State::Failed { plan: p, .. } => p.clone(),
        _ => return false,
    };
    let Some(executable) = host.shipped_executable() else {
        return false;
    };
    host.publish(State::Downloading {
        progress: WireSnapshot {
            done: 0,
            total: plan.wire_size(),
            bytes_per_second: 0.,
        },
        plan: plan.clone(),
    });
    host.spawn(executable, plan);
    true
}
fn shipped_executable() -> Option<PathBuf> {
    let setting = std::env::var("WOW_ROGUE_UPDATE").ok();
    if setting.as_deref() == Some("0") {
        return None;
    }
    let path = std::env::current_exe().ok()?;
    eligible_executable(&path, setting.as_deref()).then_some(path)
}
struct NativeStart(Shared);
impl StartHost for NativeStart {
    fn shipped_executable(&mut self) -> Option<PathBuf> {
        shipped_executable()
    }
    fn publish(&mut self, state: State) {
        self.0.publish(state);
    }
    fn spawn(&mut self, executable: PathBuf, plan: UpdatePlan) {
        let state = self.0.clone();
        let _ = std::thread::Builder::new()
            .name("rogue-update".into())
            .spawn(move || {
                let mut host = NativeStage {
                    state,
                    plan: &plan,
                    //0e8dc9: one origin before path/agent construction; no plan clone follows it.
                    clock: Instant::now(),
                };
                stage_with(&mut host, &executable, &plan);
            });
    }
}

pub trait StageHost {
    fn now(&mut self) -> Duration;
    fn download(
        &mut self,
        download: &Download,
        path: &Path,
        progress: &mut WireProgress,
    ) -> Result<(), String>;
    fn remove_file(&mut self, path: &Path);
    fn log(&mut self, message: &str);
    fn publish(&mut self, state: State);
}
/// 0e8d80: record every attempted path before download, patches first, EXE last.
pub fn stage_with(host: &mut impl StageHost, executable: &Path, plan: &UpdatePlan) {
    let mut progress = WireProgress::new(plan.wire_size(), host.now());
    let paths = install::staging_paths(
        executable,
        &plan
            .patches
            .iter()
            .map(|p| p.name.clone())
            .collect::<Vec<_>>(),
    );
    let mut attempted = Vec::new();
    let artifacts = plan
        .patches
        .iter()
        .zip(paths.patches.iter().map(|p| p.staged.as_path()))
        .chain(
            plan.executable
                .iter()
                .map(|p| (p, paths.executable_staged.as_path())),
        );
    for (download, path) in artifacts {
        attempted.push(path.to_owned());
        if let Err(error) = host.download(download, path, &mut progress) {
            for path in &attempted {
                host.remove_file(path);
            }
            host.log(&format!("update: download failed: {error}"));
            host.publish(State::Failed {
                error,
                plan: plan.clone(),
            });
            return;
        }
    }
    host.publish(State::Ready(plan.clone()));
}

struct NativeStage<'a> {
    state: Shared,
    clock: Instant,
    plan: &'a UpdatePlan,
}
struct NativeParts<'a> {
    agent: ureq::Agent,
    download: &'a Download,
    state: Shared,
    clock: Instant,
    plan: &'a UpdatePlan,
}
fn range_header(offset: u64) -> Option<String> {
    (offset != 0).then(|| format!("bytes={offset}-"))
}

///140061fe7..140062081: caller-level HTTP failure policy, outside TLS internals.
fn request_error(error: ureq::Error) -> io::Error {
    let kind = match &error {
        ureq::Error::Status(status, _) if *status != 429 && *status < 500 => {
            io::ErrorKind::NotFound
        }
        _ => io::ErrorKind::Other,
    };
    io::Error::new(kind, error)
}

impl PartHost for NativeParts<'_> {
    type Reader = Box<dyn Read + Send + Sync>;
    fn part_size(&self, index: usize) -> u64 {
        self.download.parts[index].size
    }
    fn open_part(&mut self, index: usize, offset: u64) -> io::Result<PartResponse<Self::Reader>> {
        let mut request = self.agent.get(&self.download.parts[index].url);
        if let Some(range) = range_header(offset) {
            request = request.set("Range", &range);
        }
        let response = request.call().map_err(request_error)?;
        Ok(PartResponse {
            partial: response.status() == 206,
            reader: response.into_reader(),
        })
    }
    fn retry_wait(&mut self, error: &io::Error, delay: Duration) {
        println!(
            "update: download interrupted: {error}; retrying in {}s",
            delay.as_secs()
        );
        std::thread::sleep(delay);
    }
    fn now(&mut self) -> Duration {
        self.clock.elapsed()
    }
    fn publish(&mut self, progress: WireSnapshot) {
        self.state.publish(State::Downloading {
            progress,
            plan: (*self.plan).clone(),
        });
    }
}
impl StageHost for NativeStage<'_> {
    fn now(&mut self) -> Duration {
        //StageHost requests only the initial timestamp. The origin was captured once
        //above; zero represents that Instant, without a second Instant::now/elapsed.
        Duration::ZERO
    }
    fn download(
        &mut self,
        download: &Download,
        path: &Path,
        progress: &mut WireProgress,
    ) -> Result<(), String> {
        //119320 builds a new agent per artifact, before constructing the gzip reader or file.
        let agent = ureq::AgentBuilder::new()
            .timeout_connect(Duration::from_secs(10))
            .timeout_read(Duration::from_secs(30))
            .user_agent(USER_AGENT)
            .build();
        let mut parts = NativeParts {
            agent,
            download,
            state: self.state.clone(),
            clock: self.clock,
            plan: self.plan,
        };
        let reader = PartReader::new(download.parts.len(), &mut parts, progress);
        install::decode_verified_with(
            reader,
            || {
                OpenOptions::new()
                    .write(true)
                    .create(true)
                    .truncate(true)
                    .open(path)
            },
            download.size,
            &download.sha256,
        )
        .map_err(|e| e.to_string())
    }
    fn remove_file(&mut self, path: &Path) {
        let _ = std::fs::remove_file(path);
    }
    fn log(&mut self, message: &str) {
        println!("{message}");
    }
    fn publish(&mut self, state: State) {
        self.state.publish(state);
    }
}

pub struct NativeApply;
impl ApplyBackend for NativeApply {
    type Error = io::Error;
    fn shipped_executable(&mut self) -> io::Result<Option<PathBuf>> {
        Ok(shipped_executable())
    }
    fn remove_file(&mut self, path: &Path) -> io::Result<()> {
        std::fs::remove_file(path)
    }
    fn rename(&mut self, source: &Path, destination: &Path) -> io::Result<()> {
        std::fs::rename(source, destination)
    }
    fn spawn(&mut self, executable: &Path, _argument_tail: &[OsString]) -> io::Result<()> {
        //1136fa reads argv only after replacements and preserves every argument after argv0.
        let _ = std::process::Command::new(executable)
            .args(std::env::args_os().skip(1))
            .spawn()?;
        Ok(())
    }
}
/// On true the owner emits AppExit::Success. Failure retains the same plan for Try again.
pub fn advance_ready_with<B: ApplyBackend>(
    host: &mut B,
    state: &State,
    delay: &mut ReadyDelay,
    elapsed: f32,
    arguments: &[OsString],
    translate: impl FnOnce(&str) -> String,
) -> Option<Result<(), State>>
where
    B::Error: std::fmt::Display,
{
    let State::Ready(plan) = state else {
        delay.due(false, elapsed);
        return None;
    };
    if !delay.due(true, elapsed) {
        return None;
    }
    let ready = ReadyPlan {
        patch_names: plan.patches.iter().map(|p| p.name.clone()).collect(),
        replace_executable: plan.executable.is_some(),
    };
    Some(
        install::apply(host, Some(&ready), arguments).map_err(|error| State::Failed {
            error: translate(&error.to_string()),
            plan: plan.clone(),
        }),
    )
}

/// 1c4b0 refresh and easing. There is no progress clamp or completion inferred from byte total.
pub fn target_ratio(state: &State) -> Option<f32> {
    match state {
        State::Downloading { progress, .. } => {
            Some(progress.done as f32 / progress.total.max(1) as f32)
        }
        State::Ready(_) => Some(1.),
        _ => None,
    }
}
pub fn smooth_ratio(value: f32, target: f32, delta: f32) -> f32 {
    let next = value + (target - value) * (1. - (-8. * delta).exp());
    if (target - next).abs() < 0.001 {
        target
    } else {
        next
    }
}

#[cfg(test)]
mod tests {
    use super::super::Part;
    use super::*;
    use std::{cell::RefCell, collections::VecDeque, io::Write, rc::Rc};
    const SHA: &str = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";
    fn download(name: &str) -> Download {
        Download {
            name: name.into(),
            size: 3,
            sha256: SHA.into(),
            parts: vec![Part {
                url: name.into(),
                size: 26,
            }],
        }
    }
    fn plan() -> UpdatePlan {
        UpdatePlan {
            version: "0.94.1".into(),
            notes: "native".into(),
            patches: vec![download("patch-A.mpq"), download("patch-b.mpq")],
            executable: Some(download("game")),
        }
    }
    fn gzip() -> Vec<u8> {
        vec![
            31, 139, 8, 0, 0, 0, 0, 0, 0, 255, 1, 3, 0, 252, 255, 97, 98, 99, 194, 65, 36, 53, 3,
            0, 0, 0,
        ]
    }
    #[derive(Default)]
    struct Start {
        allowed: bool,
        calls: Vec<&'static str>,
        states: Vec<State>,
    }
    impl StartHost for Start {
        fn shipped_executable(&mut self) -> Option<PathBuf> {
            self.calls.push("gate");
            self.allowed
                .then(|| PathBuf::from("fixture/AzerothSurvivors.exe"))
        }
        fn publish(&mut self, state: State) {
            self.calls.push("publish");
            self.states.push(state);
        }
        fn spawn(&mut self, _: PathBuf, _: UpdatePlan) {
            self.calls.push("spawn-discarded-result");
        }
    }
    #[test]
    fn native_start_accepts_available_or_failed_and_regates_before_publication_or_spawn() {
        let p = plan();
        let mut host = Start::default();
        for state in [
            State::Empty,
            State::Ready(p.clone()),
            State::Downloading {
                progress: WireSnapshot {
                    done: 0,
                    total: 0,
                    bytes_per_second: 0.,
                },
                plan: p.clone(),
            },
        ] {
            assert!(!begin_with(&mut host, &state));
        }
        assert!(host.calls.is_empty());
        assert!(!begin_with(&mut host, &State::Available(p.clone())));
        assert_eq!(host.calls, ["gate"]);
        host.calls.clear();
        host.allowed = true;
        assert!(begin_with(
            &mut host,
            &State::Failed {
                error: "old".into(),
                plan: p.clone()
            }
        ));
        assert_eq!(host.calls, ["gate", "publish", "spawn-discarded-result"]);
        assert_eq!(
            host.states,
            [State::Downloading {
                progress: WireSnapshot {
                    done: 0,
                    total: 78,
                    bytes_per_second: 0.
                },
                plan: p
            }]
        );
    }
    type Trace = Rc<RefCell<Vec<String>>>;
    struct Parts {
        trace: Trace,
        name: String,
        published: Rc<RefCell<Vec<State>>>,
        plan: UpdatePlan,
        time: u64,
        disconnect_once: bool,
        terminal_open: bool,
    }
    struct Response {
        bytes: io::Cursor<Vec<u8>>,
        disconnect: bool,
    }
    impl Read for Response {
        fn read(&mut self, into: &mut [u8]) -> io::Result<usize> {
            if self.disconnect && self.bytes.position() >= 12 {
                return Err(io::Error::new(
                    io::ErrorKind::ConnectionReset,
                    "fixture disconnect",
                ));
            }
            let capacity = if self.disconnect {
                into.len().min((12 - self.bytes.position()) as usize)
            } else {
                into.len()
            };
            self.bytes.read(&mut into[..capacity])
        }
    }
    impl PartHost for Parts {
        type Reader = Response;
        fn part_size(&self, _index: usize) -> u64 {
            gzip().len() as u64
        }
        fn open_part(
            &mut self,
            index: usize,
            offset: u64,
        ) -> io::Result<PartResponse<Self::Reader>> {
            self.trace
                .borrow_mut()
                .push(format!("part:{}:{index}", self.name));
            if self.terminal_open {
                return Err(io::Error::new(io::ErrorKind::NotFound, "fixture HTTP404"));
            }
            let mut bytes = io::Cursor::new(gzip());
            bytes.set_position(offset);
            let disconnect = std::mem::take(&mut self.disconnect_once);
            Ok(PartResponse {
                reader: Response { bytes, disconnect },
                partial: true,
            })
        }
        fn retry_wait(&mut self, _error: &io::Error, delay: Duration) {
            self.trace
                .borrow_mut()
                .push(format!("retry:{}:{}", self.name, delay.as_secs()));
        }
        fn now(&mut self) -> Duration {
            self.trace.borrow_mut().push("sample-now".into());
            self.time += 250;
            Duration::from_millis(self.time)
        }
        fn publish(&mut self, progress: WireSnapshot) {
            self.published.borrow_mut().push(State::Downloading {
                progress,
                plan: self.plan.clone(),
            });
        }
    }
    struct Output {
        trace: Trace,
        name: String,
        bytes: Rc<RefCell<Vec<u8>>>,
    }
    impl Write for Output {
        fn write(&mut self, b: &[u8]) -> io::Result<usize> {
            self.trace
                .borrow_mut()
                .push(format!("write:{}:{}", self.name, b.len()));
            self.bytes.borrow_mut().extend_from_slice(b);
            Ok(b.len())
        }
        fn flush(&mut self) -> io::Result<()> {
            self.trace.borrow_mut().push(format!("flush:{}", self.name));
            Ok(())
        }
    }
    struct Stage {
        trace: Trace,
        states: Rc<RefCell<Vec<State>>>,
        plan: UpdatePlan,
        fail: Option<String>,
        disconnect: bool,
        fail_download: Option<String>,
        outputs: Vec<Rc<RefCell<Vec<u8>>>>,
    }
    impl StageHost for Stage {
        fn now(&mut self) -> Duration {
            self.trace.borrow_mut().push("initial-now".into());
            Duration::ZERO
        }
        fn download(
            &mut self,
            d: &Download,
            path: &Path,
            progress: &mut WireProgress,
        ) -> Result<(), String> {
            self.trace.borrow_mut().push(format!("agent:{}", d.name));
            let mut parts = Parts {
                trace: self.trace.clone(),
                name: d.name.clone(),
                published: self.states.clone(),
                plan: self.plan.clone(),
                time: 0,
                disconnect_once: self.disconnect,
                terminal_open: self.fail_download.as_ref() == Some(&d.name),
            };
            let input = PartReader::new(d.parts.len(), &mut parts, progress);
            let trace = self.trace.clone();
            let name = d.name.clone();
            let fail = self.fail.as_ref() == Some(&d.name);
            let bytes = Rc::new(RefCell::new(Vec::new()));
            self.outputs.push(bytes.clone());
            install::decode_verified_with(
                input,
                || {
                    trace.borrow_mut().push(format!("open:{}", path.display()));
                    if fail {
                        return Err(io::Error::other("fixture open"));
                    }
                    Ok(Output { trace, name, bytes })
                },
                d.size,
                &d.sha256,
            )
            .map_err(|e| e.to_string())
        }
        fn remove_file(&mut self, p: &Path) {
            self.trace
                .borrow_mut()
                .push(format!("remove:{}", p.display()));
        }
        fn log(&mut self, m: &str) {
            self.trace.borrow_mut().push(format!("log:{m}"));
        }
        fn publish(&mut self, state: State) {
            self.states.borrow_mut().push(state);
        }
    }
    fn stage(p: UpdatePlan, fail: Option<&str>) -> Stage {
        Stage {
            trace: Default::default(),
            states: Default::default(),
            plan: p,
            fail: fail.map(str::to_owned),
            disconnect: false,
            fail_download: None,
            outputs: Vec::new(),
        }
    }
    #[test]
    fn native_worker_connects_part_decode_write_and_shared_progress_then_ready() {
        let p = plan();
        let mut host = stage(p.clone(), None);
        stage_with(&mut host, Path::new("fixture/AzerothSurvivors.exe"), &p);
        assert_eq!(host.outputs.len(), 3);
        for output in &host.outputs {
            assert_eq!(output.borrow().as_slice(), b"abc");
        }
        let calls = host.trace.borrow();
        assert_eq!(
            &calls[..6],
            [
                "initial-now",
                "agent:patch-A.mpq",
                "part:patch-A.mpq:0",
                "sample-now",
                "sample-now",
                "open:fixture/Data/patch-A.mpq.update"
            ]
        );
        assert_eq!(
            calls
                .iter()
                .filter(|call| call.as_str() == "initial-now")
                .count(),
            1
        );
        assert_eq!(
            calls
                .iter()
                .filter(|c| c.starts_with("agent:"))
                .cloned()
                .collect::<Vec<_>>(),
            ["agent:patch-A.mpq", "agent:patch-b.mpq", "agent:game"]
        );
        assert!(!calls.iter().any(|c| c.starts_with("remove:")));
        let states = host.states.borrow();
        assert!(matches!(states.last(),Some(State::Ready(q)) if q==&p));
        let dones = states
            .iter()
            .filter_map(|s| {
                if let State::Downloading { progress, .. } = s {
                    Some(progress.done)
                } else {
                    None
                }
            })
            .collect::<Vec<_>>();
        assert_eq!(dones.last(), Some(&78));
    }
    #[test]
    fn native_worker_cleans_every_attempt_in_order_before_failed_and_keeps_plan() {
        let p = plan();
        let mut host = stage(p.clone(), Some("patch-b.mpq"));
        stage_with(&mut host, Path::new("fixture/AzerothSurvivors.exe"), &p);
        assert_eq!(host.outputs.len(), 2);
        let calls = host.trace.borrow();
        assert_eq!(
            &calls[calls.len() - 3..],
            [
                "remove:fixture/Data/patch-A.mpq.update",
                "remove:fixture/Data/patch-b.mpq.update",
                "log:update: download failed: fixture open"
            ]
        );
        assert_eq!(
            host.states.borrow().last(),
            Some(&State::Failed {
                error: "fixture open".into(),
                plan: p
            })
        );
        assert!(host.outputs[1].borrow().is_empty());
    }
    #[test]
    fn resumed_compressed_body_reaches_verified_staging_and_ready_without_duplicate_progress() {
        let p = plan();
        let mut host = stage(p.clone(), None);
        host.disconnect = true;
        stage_with(&mut host, Path::new("fixture/AzerothSurvivors.exe"), &p);
        assert_eq!(host.outputs.len(), 3);
        assert!(
            host.outputs
                .iter()
                .all(|output| output.borrow().as_slice() == b"abc")
        );
        assert_eq!(
            host.trace
                .borrow()
                .iter()
                .filter(|call| call.starts_with("retry:"))
                .count(),
            3
        );
        let states = host.states.borrow();
        assert!(matches!(states.last(), Some(State::Ready(value)) if value == &p));
        let done = states
            .iter()
            .filter_map(|state| match state {
                State::Downloading { progress, .. } => Some(progress.done),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(done.last(), Some(&78));
        assert!(done.windows(2).all(|pair| pair[0] < pair[1]));
        assert!(
            !host
                .trace
                .borrow()
                .iter()
                .any(|call| call.starts_with("remove:"))
        );
    }

    #[test]
    fn terminal_part_error_reaches_existing_attempted_stage_cleanup_and_failed_state() {
        let p = plan();
        let mut host = stage(p.clone(), None);
        host.fail_download = Some("patch-b.mpq".into());
        stage_with(&mut host, Path::new("fixture/AzerothSurvivors.exe"), &p);
        let calls = host.trace.borrow();
        let removed = calls
            .iter()
            .filter(|call| call.starts_with("remove:"))
            .map(String::as_str)
            .collect::<Vec<_>>();
        assert_eq!(
            removed,
            [
                "remove:fixture/Data/patch-A.mpq.update",
                "remove:fixture/Data/patch-b.mpq.update"
            ]
        );
        assert!(
            !calls
                .iter()
                .any(|call| call == "agent:game" || call.starts_with("retry:"))
        );
        assert_eq!(
            host.states.borrow().last(),
            Some(&State::Failed {
                error: "fixture HTTP404".into(),
                plan: p
            })
        );
    }

    #[test]
    fn range_header_and_http_status_errors_follow_current_caller_policy() {
        assert_eq!(range_header(0), None);
        assert_eq!(range_header(17).as_deref(), Some("bytes=17-"));
        assert_eq!(
            range_header(u64::MAX).as_deref(),
            Some("bytes=18446744073709551615-")
        );
        for status in [400, 401, 404, 408, 429, 499, 500, 503, 599] {
            let response = ureq::Response::new(status, "fixture", "").unwrap();
            let error = request_error(ureq::Error::Status(status, response));
            assert_eq!(
                error.kind(),
                if status == 429 || status >= 500 {
                    io::ErrorKind::Other
                } else {
                    io::ErrorKind::NotFound
                }
            );
        }
    }

    #[derive(Default)]
    struct Apply {
        calls: Vec<&'static str>,
        fail: bool,
    }
    impl ApplyBackend for Apply {
        type Error = &'static str;
        fn shipped_executable(&mut self) -> Result<Option<PathBuf>, Self::Error> {
            self.calls.push("gate");
            Ok(Some("fixture/AzerothSurvivors.exe".into()))
        }
        fn remove_file(&mut self, _: &Path) -> Result<(), Self::Error> {
            self.calls.push("remove");
            Ok(())
        }
        fn rename(&mut self, _: &Path, _: &Path) -> Result<(), Self::Error> {
            self.calls.push("rename");
            if self.fail {
                Err("fixture rename")
            } else {
                Ok(())
            }
        }
        fn spawn(&mut self, _: &Path, _: &[OsString]) -> Result<(), Self::Error> {
            self.calls.push("spawn");
            Ok(())
        }
    }
    #[test]
    fn native_ready_apply_failure_localizes_and_retains_retry_plan_while_success_exits() {
        let p = plan();
        let ready = State::Ready(p.clone());
        let mut delay = ReadyDelay::default();
        let mut host = Apply {
            fail: true,
            ..Default::default()
        };
        assert!(
            advance_ready_with(&mut host, &ready, &mut delay, 10., &[], str::to_owned).is_none()
        );
        assert!(host.calls.is_empty());
        let result = advance_ready_with(&mut host, &ready, &mut delay, 11.2, &[], |error| {
            format!("localized:{error}")
        });
        assert_eq!(
            result,
            Some(Err(State::Failed {
                error: "localized:fixture rename".into(),
                plan: p.clone()
            }))
        );
        assert_eq!(host.calls, ["gate", "remove", "rename"]);
        host.calls.clear();
        host.fail = false;
        assert!(advance_ready_with(
            &mut host,
            &State::Empty,
            &mut delay,
            12.,
            &[],
            str::to_owned
        )
        .is_none());
        assert!(
            advance_ready_with(&mut host, &ready, &mut delay, 13., &[], str::to_owned).is_none()
        );
        assert_eq!(
            advance_ready_with(&mut host, &ready, &mut delay, 14.2, &[], str::to_owned),
            Some(Ok(()))
        );
        assert_eq!(host.calls.last(), Some(&"spawn"));
    }
    #[test]
    fn native_work_modal_bypasses_context_and_dismissal_and_progress_does_not_clamp() {
        let p = plan();
        let mut s = State::Downloading {
            progress: WireSnapshot {
                done: 3,
                total: 0,
                bytes_per_second: 0.,
            },
            plan: p.clone(),
        };
        assert!(s.modal(true, false));
        assert!(!s.banner(true, true));
        assert_eq!(target_ratio(&s), Some(3.));
        s = State::Ready(p.clone());
        assert!(s.modal(true, false));
        assert_eq!(target_ratio(&s), Some(1.));
        for s in [
            State::Available(p.clone()),
            State::Failed {
                error: "bad".into(),
                plan: p,
            },
        ] {
            assert!(!s.modal(true, true));
            assert!(!s.modal(false, false));
            assert!(s.modal(false, true));
            assert!(s.banner(true, true));
        }
        assert_eq!(smooth_ratio(0., 1., 0.), 0.);
        assert_eq!(smooth_ratio(0.9999, 1., 0.), 1.);
        assert!(smooth_ratio(0., 1., 0.1) > 0.5);
    }
}
