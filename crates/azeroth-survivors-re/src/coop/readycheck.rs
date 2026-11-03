//! Authoritative lobby admission and the 0.139.2 wire26 snapshot.

pub const SECONDS: u8 = 30;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Answer {
    Pending,
    Ready,
    NotReady,
    Unknown(u8),
}

impl Answer {
    pub(super) fn from_wire(value: u8) -> Self {
        match value {
            0 => Self::Pending,
            1 => Self::Ready,
            2 => Self::NotReady,
            other => Self::Unknown(other),
        }
    }

    pub(super) fn wire(self) -> u8 {
        match self {
            Self::Pending => 0,
            Self::Ready => 1,
            Self::NotReady => 2,
            Self::Unknown(value) => value,
        }
    }
}

#[repr(u8)]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Status {
    Running = 0,
    Ready = 1,
    Declined = 2,
    Expired = 3,
    Cancelled = 4,
}

impl Status {
    pub(super) fn from_wire(value: u8) -> Self {
        match value {
            1 => Self::Ready,
            2 => Self::Declined,
            3 => Self::Expired,
            4 => Self::Cancelled,
            _ => Self::Running,
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Snapshot {
    pub status: Status,
    pub left: u8,
    pub answers: Vec<(u64, Answer)>,
}

pub struct Check {
    started: f64,
    answers: Vec<(u64, Answer)>,
    last: Option<Snapshot>,
}

impl Check {
    /// The native roster iterator yields the host first, followed by joined
    /// nonclosing members with an admitted profile. The host starts ready.
    pub fn begin(now: f64, members: &[u64]) -> Option<Self> {
        let (host, guests) = members.split_first()?;
        if guests.is_empty() {
            return None;
        }
        let answers = std::iter::once((*host, Answer::Ready))
            .chain(guests.iter().map(|id| (*id, Answer::Pending)))
            .collect();
        Some(Self {
            started: now,
            answers,
            last: None,
        })
    }

    /// 0x145e73190 matches the admitted profile identity and consumes the first answer.
    pub fn answer(&mut self, id: u64, ready: bool) {
        if let Some((_, answer)) = self
            .answers
            .iter_mut()
            .find(|(member, answer)| *member == id && *answer == Answer::Pending)
        {
            *answer = if ready {
                Answer::Ready
            } else {
                Answer::NotReady
            };
        }
    }

    /// 0x145e73240 compares the full ordered roster before scanning replies.
    /// A changed roster or host cancellation takes precedence over all replies.
    pub fn update(&mut self, now: f64, members: &[u64], cancel: bool) -> Option<Snapshot> {
        let elapsed = now - self.started;
        let status = if cancel
            || !self
                .answers
                .iter()
                .map(|(id, _)| *id)
                .eq(members.iter().copied())
        {
            Status::Cancelled
        } else if self
            .answers
            .iter()
            .any(|(_, answer)| *answer == Answer::NotReady)
        {
            Status::Declined
        } else if self
            .answers
            .iter()
            .all(|(_, answer)| *answer == Answer::Ready)
        {
            Status::Ready
        } else if elapsed >= f64::from(SECONDS) {
            Status::Expired
        } else {
            Status::Running
        };
        let left = if status == Status::Running {
            (f64::from(SECONDS) - elapsed)
                .ceil()
                .clamp(0., f64::from(SECONDS)) as u8
        } else {
            0
        };
        if self.last.as_ref().is_some_and(|last| {
            last.status == status && last.left == left && last.answers == self.answers
        }) {
            return None;
        }
        let snapshot = Snapshot {
            status,
            left,
            answers: self.answers.clone(),
        };
        self.last = Some(snapshot.clone());
        Some(snapshot)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn only_the_first_answer_from_a_snapshotted_guest_is_recorded() {
        let mut check = Check::begin(10., &[1, 2, 3]).unwrap();
        let initial = check.update(10., &[1, 2, 3], false).unwrap();
        assert_eq!(initial.left, 30);
        assert_eq!(
            initial.answers,
            [
                (1, Answer::Ready),
                (2, Answer::Pending),
                (3, Answer::Pending)
            ]
        );
        assert_eq!(check.update(10.5, &[1, 2, 3], false), None);
        check.answer(99, true);
        check.answer(1, false);
        check.answer(2, false);
        check.answer(2, true);
        let result = check.update(11., &[1, 2, 3], false).unwrap();
        assert_eq!(result.status, Status::Declined);
        assert_eq!(
            result.answers,
            [
                (1, Answer::Ready),
                (2, Answer::NotReady),
                (3, Answer::Pending)
            ]
        );
    }

    #[test]
    fn cancellation_precedes_answers_and_all_ready_precedes_the_deadline() {
        let mut check = Check::begin(10., &[1, 2]).unwrap();
        assert_eq!(check.update(39.9, &[1, 2], false).unwrap().left, 1);
        assert_eq!(
            check.update(40., &[1, 2], false).unwrap().status,
            Status::Expired
        );
        let mut check = Check::begin(10., &[1, 2]).unwrap();
        check.answer(2, true);
        assert_eq!(
            check.update(40., &[1, 2], false).unwrap().status,
            Status::Ready
        );
        let mut check = Check::begin(10., &[1, 2]).unwrap();
        check.answer(2, true);
        assert_eq!(
            check.update(40., &[1, 3], false).unwrap().status,
            Status::Cancelled
        );
        let mut check = Check::begin(10., &[1, 2]).unwrap();
        assert_eq!(
            check.update(11., &[1, 2], true).unwrap().status,
            Status::Cancelled
        );
    }
}
