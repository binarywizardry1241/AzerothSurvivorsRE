//! The selected 0.105.0 run command added to the ordinary client binding files.
//! Native patch owners: 0x1458e68a0 / 0x1458e6ea0; menu label: 0x1400f39a0.

pub(crate) const COMMAND: &str = "AZS_OPENLEVELS";
pub(crate) const XML: &str = include_str!("../assets/stored-level-bindings-0.105.0.xml");
pub(crate) const SKIP_COMMAND: &str = "AZS_SKIP";
pub(crate) const SKIP_CVAR: &str = "skipKey";
pub(crate) const DEFAULT_SKIP_KEY: &str = "X";

pub(crate) fn skip_keys(value: &str) -> Vec<String> {
    value
        .split_whitespace()
        .map(str::to_owned)
        .collect()
}

pub(crate) fn commands() -> Vec<benilla_ui::bindings_xml::Binding> {
    benilla_ui::bindings_xml::parse(XML).expect("recovered stored-level binding")
}

pub(crate) fn defaults() -> Vec<benilla_ui::script::keybind::KeyBinding> {
    vec![("Y".into(), COMMAND.into())]
}

pub(crate) fn label(name: &str) -> Option<&'static str> {
    match name {
        "BINDING_HEADER_AZS" => Some("Azeroth Survivors"),
        "BINDING_NAME_AZS_OPENLEVELS" => Some("Open Level-Ups"),
        _ => None,
    }
}
