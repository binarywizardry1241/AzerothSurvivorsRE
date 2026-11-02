//! Sequential updater parts and compressed-body progress, connected by update_worker.
//! The current retry/resume contract is recovered from 0.123.0 owner140061b50;
//! the host supplies HTTP responses, monotonic timestamps, retry waits and publication.

use std::{
    io::{self, Read},
    time::Duration,
};

#[derive(Clone, Copy, Debug, PartialEq)]
pub struct WireSnapshot {
    /// Response-reader bytes before payload gzip decoding, excluding HTTP headers/framing.
    pub done: u64,
    pub total: u64,
    pub bytes_per_second: f64,
}

/// The caller initializes this once before all patch/EXE downloads, not once per part reader.
pub struct WireProgress {
    snapshot: WireSnapshot,
    sampled_done: u64,
    sampled_at: Duration,
}

impl WireProgress {
    pub fn new(total: u64, initialized_at: Duration) -> Self {
        Self {
            snapshot: WireSnapshot {
                done: 0,
                total,
                bytes_per_second: 0.,
            },
            sampled_done: 0,
            sampled_at: initialized_at,
        }
    }

    pub fn snapshot(&self) -> WireSnapshot {
        self.snapshot
    }

    fn record(&mut self, count: usize, host: &mut impl PartHost) {
        self.snapshot.done = self.snapshot.done.wrapping_add(count as u64);
        // Native elapsed calls now once and saturates a backwards timestamp to zero.
        let elapsed = host.now().saturating_sub(self.sampled_at);
        let seconds = elapsed.as_secs() as f64 + f64::from(elapsed.subsec_nanos()) / 1_000_000_000.;
        if seconds >= 0.25 {
            let instantaneous = self.snapshot.done.wrapping_sub(self.sampled_done) as f64 / seconds;
            self.snapshot.bytes_per_second = if self.snapshot.bytes_per_second == 0. {
                instantaneous
            } else {
                0.3 * instantaneous + 0.7 * self.snapshot.bytes_per_second
            };
            // 12b9cd performs a second now(), rather than reusing the elapsed timestamp.
            self.sampled_at = host.now();
            self.sampled_done = self.snapshot.done;
        }
        // A positive read always publishes, even below the speed-sampling threshold.
        host.publish(self.snapshot);
    }
}

/// A206 response starts at the requested offset. Other successful statuses replay
/// the complete body; the part reader discards the prefix before accounting bytes.
pub struct PartResponse<R> {
    pub reader: R,
    pub partial: bool,
}

pub trait PartHost {
    type Reader: Read;
    fn part_size(&self, index: usize) -> u64;
    /// Supply the native-converted I/O error and preserve the requested part/offset.
    fn open_part(&mut self, index: usize, offset: u64) -> io::Result<PartResponse<Self::Reader>>;
    /// Log the recoverable failure and wait without publishing download progress.
    fn retry_wait(&mut self, error: &io::Error, delay: Duration);
    /// Monotonic timestamp represented as seconds/nanoseconds, matching the native time lane.
    fn now(&mut self) -> Duration;
    /// Native owner clones the retained plan, then publishes Downloading2 before read returns.
    fn publish(&mut self, snapshot: WireSnapshot);
}

struct ActivePart {
    index: usize,
    length: u64,
    offset: u64,
}

pub struct PartReader<'a, H: PartHost> {
    host: &'a mut H,
    progress: &'a mut WireProgress,
    count: usize,
    next: usize,
    active: Option<ActivePart>,
    current: Option<H::Reader>,
    failures: u32,
}

fn premature_eof() -> io::Error {
    io::Error::new(
        io::ErrorKind::UnexpectedEof,
        "the connection closed before the part's end",
    )
}

/// The bounded Read interface at1402131e0 retries Interrupted and never consumes
/// beyond the retained offset. Replayed bytes do not reach WireProgress or gzip.
fn discard_prefix(reader: &mut impl Read, mut remaining: u64) -> io::Result<()> {
    let mut buffer = [0; 8192];
    while remaining != 0 {
        let length = remaining.min(buffer.len() as u64) as usize;
        match reader.read(&mut buffer[..length]) {
            Ok(0) => return Err(premature_eof()),
            Ok(count) => remaining -= count as u64,
            Err(error) if error.kind() == io::ErrorKind::Interrupted => continue,
            Err(error) => return Err(error),
        }
    }
    Ok(())
}

impl<'a, H: PartHost> PartReader<'a, H> {
    pub fn new(count: usize, host: &'a mut H, progress: &'a mut WireProgress) -> Self {
        Self {
            host,
            progress,
            count,
            next: 0,
            active: None,
            current: None,
            failures: 0,
        }
    }

    fn reopen(&mut self) -> io::Result<()> {
        let active = self.active.as_ref().unwrap();
        let mut response = self.host.open_part(active.index, active.offset)?;
        if active.offset != 0 && !response.partial {
            discard_prefix(&mut response.reader, active.offset)?;
        }
        self.current = Some(response.reader);
        Ok(())
    }

    fn recover(&mut self, error: io::Error) -> io::Result<()> {
        //140062194 retains the response and budget on Interrupted.
        if error.kind() == io::ErrorKind::Interrupted {
            return Ok(());
        }
        self.current = None;
        self.failures += 1;
        if self.failures > 8 || error.kind() == io::ErrorKind::NotFound {
            return Err(error);
        }
        let delay = Duration::from_secs((1_u64 << self.failures).min(20));
        self.host.retry_wait(&error, delay);
        Ok(())
    }
}

impl<H: PartHost> Read for PartReader<'_, H> {
    fn read(&mut self, into: &mut [u8]) -> io::Result<usize> {
        // No empty-buffer shortcut: premature zero follows the same native error path.
        loop {
            if self.active.is_none() {
                if self.next == self.count {
                    return Ok(0);
                }
                let index = self.next;
                self.next += 1;
                self.active = Some(ActivePart {
                    index,
                    length: self.host.part_size(index),
                    offset: 0,
                });
            }
            if self.current.is_none() {
                if let Err(error) = self.reopen() {
                    self.recover(error)?;
                    continue;
                }
            }
            match self.current.as_mut().unwrap().read(into) {
                Ok(0) => {
                    let active = self.active.as_ref().unwrap();
                    if active.offset < active.length {
                        self.recover(premature_eof())?;
                    } else {
                        self.active = None;
                        self.current = None;
                    }
                }
                Ok(count) => {
                    self.failures = 0;
                    let active = self.active.as_mut().unwrap();
                    active.offset = active.offset.wrapping_add(count as u64);
                    self.progress.record(count, self.host);
                    return Ok(count);
                }
                Err(error) => self.recover(error)?,
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::{cell::RefCell, collections::VecDeque, rc::Rc};

    #[derive(Clone, Debug, PartialEq)]
    enum Event {
        Open(usize, u64),
        Wait(io::ErrorKind, Duration),
        Read(usize, usize),
        Drop(usize),
        Now(Duration),
        Publish(WireSnapshot),
    }
    enum Step {
        Data(VecDeque<u8>),
        Error(io::ErrorKind),
    }
    fn data(value: &[u8]) -> Step {
        Step::Data(value.iter().copied().collect())
    }
    enum Part {
        Stream(Vec<Step>),
        Full(Vec<Step>),
        Error(io::ErrorKind),
    }
    struct Reader {
        index: usize,
        steps: VecDeque<Step>,
        trace: Rc<RefCell<Vec<Event>>>,
    }
    impl Read for Reader {
        fn read(&mut self, into: &mut [u8]) -> io::Result<usize> {
            self.trace
                .borrow_mut()
                .push(Event::Read(self.index, into.len()));
            if into.is_empty() {
                return Ok(0);
            }
            match self.steps.front_mut() {
                Some(Step::Data(bytes)) => {
                    let count = bytes.len().min(into.len());
                    for byte in &mut into[..count] {
                        *byte = bytes.pop_front().unwrap();
                    }
                    if bytes.is_empty() {
                        self.steps.pop_front();
                    }
                    Ok(count)
                }
                Some(Step::Error(kind)) => {
                    let kind = *kind;
                    self.steps.pop_front();
                    Err(io::Error::new(kind, "fixture read"))
                }
                None => Ok(0),
            }
        }
    }
    impl Drop for Reader {
        fn drop(&mut self) {
            self.trace.borrow_mut().push(Event::Drop(self.index));
        }
    }
    struct Host {
        parts: Vec<VecDeque<Part>>,
        sizes: Vec<u64>,
        times: VecDeque<Duration>,
        trace: Rc<RefCell<Vec<Event>>>,
    }
    impl Host {
        fn new(parts: Vec<Part>, times: Vec<Duration>) -> Self {
            let sizes = parts
                .iter()
                .map(|part| match part {
                    Part::Stream(steps) | Part::Full(steps) => steps
                        .iter()
                        .map(|step| match step {
                            Step::Data(bytes) => bytes.len() as u64,
                            Step::Error(_) => 0,
                        })
                        .sum(),
                    Part::Error(_) => 0,
                })
                .collect();
            Self::attempts(
                sizes,
                parts.into_iter().map(|part| vec![part]).collect(),
                times,
            )
        }
        fn attempts(sizes: Vec<u64>, parts: Vec<Vec<Part>>, times: Vec<Duration>) -> Self {
            Self {
                parts: parts.into_iter().map(Into::into).collect(),
                sizes,
                times: times.into(),
                trace: Rc::new(RefCell::new(Vec::new())),
            }
        }
        fn snapshots(&self) -> Vec<WireSnapshot> {
            self.trace
                .borrow()
                .iter()
                .filter_map(|event| match event {
                    Event::Publish(value) => Some(*value),
                    _ => None,
                })
                .collect()
        }
    }
    impl PartHost for Host {
        type Reader = Reader;
        fn part_size(&self, index: usize) -> u64 {
            self.sizes[index]
        }
        fn open_part(&mut self, index: usize, offset: u64) -> io::Result<PartResponse<Reader>> {
            self.trace.borrow_mut().push(Event::Open(index, offset));
            let (steps, partial) = match self.parts[index].pop_front().expect("unexpected reopen") {
                Part::Stream(steps) => (steps, true),
                Part::Full(steps) => (steps, false),
                Part::Error(kind) => return Err(io::Error::new(kind, "fixture open")),
            };
            Ok(PartResponse {
                reader: Reader {
                    index,
                    steps: steps.into(),
                    trace: self.trace.clone(),
                },
                partial,
            })
        }
        fn retry_wait(&mut self, error: &io::Error, delay: Duration) {
            self.trace
                .borrow_mut()
                .push(Event::Wait(error.kind(), delay));
        }
        fn now(&mut self) -> Duration {
            let time = self.times.pop_front().expect("unexpected clock sample");
            self.trace.borrow_mut().push(Event::Now(time));
            time
        }
        fn publish(&mut self, snapshot: WireSnapshot) {
            self.trace.borrow_mut().push(Event::Publish(snapshot));
        }
    }

    #[test]
    fn native_short_reads_do_not_fill_and_empty_parts_drop_before_next_open() {
        let mut host = Host::new(
            vec![
                Part::Stream(vec![data(b"ab")]),
                Part::Stream(vec![]),
                Part::Stream(vec![data(b"cde")]),
            ],
            vec![
                Duration::ZERO,
                Duration::from_millis(250),
                Duration::from_millis(251),
            ],
        );
        let mut progress = WireProgress::new(4, Duration::ZERO);
        {
            let mut reader = PartReader::new(3, &mut host, &mut progress);
            let mut buffer = [0; 8];
            assert_eq!(reader.read(&mut buffer).unwrap(), 2);
            assert_eq!(&buffer[..2], b"ab");
            assert_eq!(reader.read(&mut buffer).unwrap(), 3);
            assert_eq!(&buffer[..3], b"cde");
            assert_eq!(reader.read(&mut buffer).unwrap(), 0);
        }
        let snapshots = host.snapshots();
        assert_eq!(snapshots.len(), 2);
        assert_eq!(
            snapshots[0],
            WireSnapshot {
                done: 2,
                total: 4,
                bytes_per_second: 0.
            }
        );
        assert_eq!(
            snapshots[1],
            WireSnapshot {
                done: 5,
                total: 4,
                bytes_per_second: 20.
            }
        );
        let trace = host.trace.borrow();
        let dropped = trace
            .iter()
            .position(|event| event == &Event::Drop(0))
            .unwrap();
        assert_eq!(
            &trace[dropped..dropped + 5],
            &[
                Event::Drop(0),
                Event::Open(1, 0),
                Event::Read(1, 8),
                Event::Drop(1),
                Event::Open(2, 0)
            ]
        );
        assert!(matches!(trace.last(), Some(Event::Drop(2))));
    }

    #[test]
    fn native_quarter_second_sampling_uses_first_rate_then_blend_and_second_now_reset() {
        let mut host = Host::new(
            vec![Part::Stream(vec![
                data(&[1; 10]),
                data(&[2; 10]),
                data(&[3; 20]),
                data(&[4; 10]),
            ])],
            vec![
                Duration::from_millis(100),
                Duration::from_nanos(349_999_999),
                Duration::from_millis(350),
                Duration::from_millis(360),
                Duration::from_millis(610),
                Duration::from_millis(620),
            ],
        );
        let mut progress = WireProgress::new(50, Duration::from_millis(100));
        {
            let mut reader = PartReader::new(1, &mut host, &mut progress);
            let mut buffer = [0; 20];
            for count in [10, 10, 20, 10] {
                assert_eq!(reader.read(&mut buffer).unwrap(), count);
            }
        }
        let values = host.snapshots();
        assert_eq!(
            values.iter().map(|value| value.done).collect::<Vec<_>>(),
            [10, 20, 40, 50]
        );
        assert_eq!(
            values
                .iter()
                .map(|value| value.bytes_per_second)
                .collect::<Vec<_>>(),
            [0., 0., 160., 124.]
        );
        assert_eq!(progress.sampled_at, Duration::from_millis(620));
        assert_eq!(progress.sampled_done, 50);
        assert!(host.times.is_empty());
    }

    #[test]
    fn native_zero_or_backwards_elapsed_publishes_without_sampling_or_dividing() {
        let mut host = Host::new(
            vec![Part::Stream(vec![data(b"abc")])],
            vec![
                Duration::ZERO,
                Duration::from_secs(1),
                Duration::from_nanos(1_249_999_999),
            ],
        );
        let mut progress = WireProgress::new(3, Duration::from_secs(1));
        {
            let mut reader = PartReader::new(1, &mut host, &mut progress);
            for _ in 0..3 {
                assert_eq!(reader.read(&mut [0]).unwrap(), 1);
            }
        }
        assert_eq!(host.snapshots().len(), 3);
        assert_eq!(progress.snapshot().done, 3);
        assert_eq!(
            progress.snapshot().bytes_per_second.to_bits(),
            0_f64.to_bits()
        );
        assert_eq!(progress.sampled_done, 0);
        assert_eq!(progress.sampled_at, Duration::from_secs(1));
        assert!(host.times.is_empty());
    }

    #[test]
    fn interrupted_keeps_response_and_budget_then_positive_read_resets_failures() {
        let mut host = Host::attempts(
            vec![1],
            vec![vec![
                Part::Error(io::ErrorKind::ConnectionReset),
                Part::Stream(vec![Step::Error(io::ErrorKind::Interrupted), data(b"a")]),
            ]],
            vec![Duration::ZERO],
        );
        let mut progress = WireProgress::new(1, Duration::ZERO);
        {
            let mut reader = PartReader::new(1, &mut host, &mut progress);
            assert_eq!(reader.read(&mut [0]).unwrap(), 1);
            assert_eq!(reader.next, 1);
            assert_eq!(reader.failures, 0);
            assert_eq!(reader.read(&mut [0]).unwrap(), 0);
        }
        assert_eq!(host.snapshots().len(), 1);
        assert_eq!(
            host.trace
                .borrow()
                .iter()
                .filter(|event| matches!(event, Event::Wait(_, _)))
                .count(),
            1
        );
        assert_eq!(
            host.trace
                .borrow()
                .iter()
                .filter(|event| matches!(event, Event::Open(_, _)))
                .count(),
            2
        );
    }

    #[test]
    fn lost_connection_resumes_same_part_at_offset_and_partial_response_is_not_discarded() {
        let mut host = Host::attempts(
            vec![4, 1],
            vec![
                vec![
                    Part::Stream(vec![
                        data(b"ab"),
                        Step::Error(io::ErrorKind::ConnectionReset),
                    ]),
                    Part::Stream(vec![data(b"cd")]),
                ],
                vec![Part::Stream(vec![data(b"e")])],
            ],
            vec![Duration::ZERO; 3],
        );
        let mut progress = WireProgress::new(5, Duration::ZERO);
        {
            let mut reader = PartReader::new(2, &mut host, &mut progress);
            let mut result = Vec::new();
            reader.read_to_end(&mut result).unwrap();
            assert_eq!(result, b"abcde");
        }
        let opens = host
            .trace
            .borrow()
            .iter()
            .filter_map(|event| match event {
                Event::Open(index, offset) => Some((*index, *offset)),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(opens, [(0, 0), (0, 2), (1, 0)]);
        assert_eq!(
            host.snapshots()
                .iter()
                .map(|value| value.done)
                .collect::<Vec<_>>(),
            [2, 4, 5]
        );
    }

    #[test]
    fn ignored_range_replays_prefix_without_counting_it_and_short_replay_retries() {
        let mut host = Host::attempts(
            vec![4],
            vec![vec![
                Part::Stream(vec![data(b"ab")]), // premature EOF at2
                Part::Full(vec![data(b"a")]),    // short discarded prefix
                Part::Full(vec![
                    data(b"a"),
                    Step::Error(io::ErrorKind::Interrupted),
                    data(b"bcd"),
                ]),
            ]],
            vec![Duration::ZERO; 2],
        );
        let mut progress = WireProgress::new(4, Duration::ZERO);
        {
            let mut reader = PartReader::new(1, &mut host, &mut progress);
            let mut result = Vec::new();
            reader.read_to_end(&mut result).unwrap();
            assert_eq!(result, b"abcd");
        }
        assert_eq!(
            host.snapshots()
                .iter()
                .map(|value| value.done)
                .collect::<Vec<_>>(),
            [2, 4]
        );
        let waits = host
            .trace
            .borrow()
            .iter()
            .filter_map(|event| match event {
                Event::Wait(kind, delay) => Some((*kind, delay.as_secs())),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(
            waits,
            [
                (io::ErrorKind::UnexpectedEof, 2),
                (io::ErrorKind::UnexpectedEof, 4)
            ]
        );
    }

    #[test]
    fn retry_budget_is_eight_capped_waits_then_error_without_consuming_next_part() {
        let attempts = (0..9)
            .map(|_| Part::Error(io::ErrorKind::ConnectionReset))
            .collect();
        let mut host = Host::attempts(
            vec![4, 1],
            vec![attempts, vec![Part::Stream(vec![data(b"e")])]],
            vec![],
        );
        let mut progress = WireProgress::new(5, Duration::ZERO);
        {
            let mut reader = PartReader::new(2, &mut host, &mut progress);
            assert_eq!(
                reader.read(&mut [0]).unwrap_err().kind(),
                io::ErrorKind::ConnectionReset
            );
            assert_eq!(reader.next, 1);
            assert_eq!(reader.active.as_ref().unwrap().index, 0);
            assert_eq!(reader.failures, 9);
        }
        let waits = host
            .trace
            .borrow()
            .iter()
            .filter_map(|event| match event {
                Event::Wait(_, delay) => Some(delay.as_secs()),
                _ => None,
            })
            .collect::<Vec<_>>();
        assert_eq!(waits, [2, 4, 8, 16, 20, 20, 20, 20]);
        assert!(host.snapshots().is_empty());
    }

    #[test]
    fn not_found_is_terminal_and_empty_buffer_is_premature_eof_for_unfinished_part() {
        let mut host = Host::attempts(
            vec![1],
            vec![vec![Part::Error(io::ErrorKind::NotFound)]],
            vec![],
        );
        let mut progress = WireProgress::new(1, Duration::ZERO);
        assert_eq!(
            PartReader::new(1, &mut host, &mut progress)
                .read(&mut [0])
                .unwrap_err()
                .kind(),
            io::ErrorKind::NotFound
        );
        assert!(
            !host
                .trace
                .borrow()
                .iter()
                .any(|event| matches!(event, Event::Wait(_, _)))
        );
        let mut host = Host::attempts(
            vec![1],
            vec![(0..9).map(|_| Part::Stream(vec![data(b"a")])).collect()],
            vec![],
        );
        let error = PartReader::new(1, &mut host, &mut progress)
            .read(&mut [])
            .unwrap_err();
        assert_eq!(error.kind(), io::ErrorKind::UnexpectedEof);
        assert_eq!(
            error.to_string(),
            "the connection closed before the part's end"
        );
        assert!(host.snapshots().is_empty());
    }

    #[test]
    fn native_progress_spans_artifact_readers_and_u64_counters_wrap_without_total_clamp() {
        let mut progress = WireProgress::new(10, Duration::ZERO);
        let mut first = Host::new(
            vec![Part::Stream(vec![data(b"1234")])],
            vec![Duration::ZERO],
        );
        {
            let mut reader = PartReader::new(1, &mut first, &mut progress);
            assert_eq!(reader.read(&mut [0; 16]).unwrap(), 4);
        }
        let mut second = Host::new(
            vec![Part::Stream(vec![data(b"567890")])],
            vec![Duration::from_millis(250), Duration::from_millis(260)],
        );
        {
            let mut reader = PartReader::new(1, &mut second, &mut progress);
            assert_eq!(reader.read(&mut [0; 16]).unwrap(), 6);
        }
        assert_eq!(
            progress.snapshot(),
            WireSnapshot {
                done: 10,
                total: 10,
                bytes_per_second: 40.
            }
        );
        progress.snapshot.done = u64::MAX - 1;
        progress.sampled_done = u64::MAX - 1;
        progress.snapshot.bytes_per_second = 0.;
        progress.sampled_at = Duration::ZERO;
        let mut host = Host::new(
            vec![Part::Stream(vec![data(b"abc")])],
            vec![Duration::from_millis(250), Duration::from_millis(250)],
        );
        {
            let mut reader = PartReader::new(1, &mut host, &mut progress);
            assert_eq!(reader.read(&mut [0; 3]).unwrap(), 3);
        }
        assert_eq!(
            progress.snapshot(),
            WireSnapshot {
                done: 1,
                total: 10,
                bytes_per_second: 12.
            }
        );
    }
}
