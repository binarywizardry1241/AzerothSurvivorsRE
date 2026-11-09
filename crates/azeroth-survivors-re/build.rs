fn main() {
    if std::env::var("CARGO_CFG_TARGET_OS").as_deref() == Ok("windows") {
        benilla_buildstamp::emit();
    } else {
        println!("cargo::rerun-if-changed=build.rs");
    }
}
