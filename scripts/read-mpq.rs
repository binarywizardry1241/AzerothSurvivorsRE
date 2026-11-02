//! Small source-level asset probe, linked against the already-built project formats crate.
use std::io::Write;

fn main() {
    let mut arguments = std::env::args().skip(1);
    let directory = arguments.next().expect("usage: read-mpq Data member-path");
    let member = arguments.next().expect("usage: read-mpq Data member-path");
    let mut chain =
        benilla_formats::Chain::open(std::path::Path::new(&directory)).expect("open MPQ chain");
    let bytes = chain.read(&member).expect("read member");
    std::io::stdout().write_all(&bytes).expect("write member");
}
