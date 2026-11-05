//! Self-contained menu definitions recovered from the selected executable.
//!
//! `menu.json` is source data, so building or opening the menu never requires the
//! reference executable. See the adjacent asset provenance for binary identity,
//! record addresses, and limits on provisional numeric interpretations.

use std::collections::BTreeMap;

use bevy::prelude::Resource;
use serde::Deserialize;

#[derive(Resource, Clone, Debug, Deserialize)]
pub struct MenuCatalog {
    #[serde(skip)]
    pub build_revision: String,
    pub title: String,
    pub labels: BTreeMap<String, String>,
    pub classes: Vec<ClassDef>,
    pub races: Vec<RaceDef>,
    pub zones: Vec<ZoneDef>,
    pub abilities: Vec<AbilityDef>,
}

#[derive(Deserialize)]
struct MenuIdentity {
    build_revision: String,
}

impl MenuCatalog {
    /// Parse the catalog compiled into this launcher.
    pub fn embedded() -> Self {
        let mut catalog: Self = serde_json::from_str(include_str!("../assets/menu.json"))
            .expect("the bundled menu catalog must contain valid definitions");
        // A target bump must supply the EXE-derived revision for that release.
        let identity: MenuIdentity = serde_json::from_str(include_str!(concat!(
            "../assets/menu-identity/",
            env!("CARGO_PKG_VERSION"),
            ".json"
        )))
        .expect("verified picker footer identity for this package version");
        catalog.build_revision = identity.build_revision;
        catalog.labels = serde_json::from_str(include_str!("../assets/locales/en.json"))
            .expect("the SHA-bound selected-target English catalog");
        let stormstrike =
            azeroth_survivors_re::player_abilities::AbilityDefinition::by_key("stormstrike")
                .expect("recovered Shaman Stormstrike");
        let shaman = catalog
            .classes
            .iter_mut()
            .find(|class| class.key == "shaman")
            .expect("embedded Shaman class");
        let replaced = shaman
            .spell_keys
            .iter()
            .position(|key| key == "call_of_flame")
            .expect("retained Call of Flame slot");
        shaman.spell_keys[replaced] = stormstrike.key.into();
        shaman.spell_names[replaced] = stormstrike.name.into();
        let rockbiter =
            azeroth_survivors_re::player_abilities::AbilityDefinition::by_key("rockbiter")
                .expect("recovered Shaman Rockbiter Weapon");
        shaman.spell_keys.push(rockbiter.key.into());
        shaman.spell_names.push(rockbiter.name.into());
        for ability in [stormstrike, rockbiter] {
            catalog.abilities.push(AbilityDef {
                key: ability.key.into(),
                name: ability.name.into(),
                icon: ability.icon.into(),
                description: String::new(),
            });
        }
        use azeroth_survivors_re::player_abilities::catalog::{
            AbilityDefinition, KILL_COMMAND_DESCRIPTION,
        };
        let kill_command = AbilityDefinition::by_key("kill_command")
            .expect("recovered Hunter Kill Command");
        let hunter = catalog.classes.iter_mut().find(|class| class.key == "hunter")
            .expect("embedded Hunter class");
        let slot = hunter.spell_keys.iter().position(|key| key == "explosive_trap")
            .expect("retained Hunter Explosive Trap slot");
        hunter.spell_keys[slot] = kill_command.key.into();
        hunter.spell_names[slot] = kill_command.name.into();
        catalog.abilities.push(AbilityDef {
            key: kill_command.key.into(),
            name: kill_command.name.into(),
            icon: kill_command.icon.into(),
            description: KILL_COMMAND_DESCRIPTION.into(),
        });
        catalog
    }

    /// Return an embedded English label, falling back to the supplied key.
    pub fn label<'a>(&'a self, key: &'a str) -> &'a str {
        self.labels.get(key).map(String::as_str).unwrap_or(key)
    }
}

impl Default for MenuCatalog {
    fn default() -> Self {
        Self::embedded()
    }
}

#[derive(Clone, Debug, Deserialize)]
pub struct ClassDef {
    pub key: String,
    pub name: String,
    pub blurb: String,
    /// Original icon basename, resolved against the user's Interface/Icons data.
    pub icon: String,
    /// Stored class-record float; native application is still being traced.
    pub base_health: f32,
    pub starting_spell: String,
    pub spell_names: Vec<String>,
    pub spell_keys: Vec<String>,
    pub starting_spell_key: String,
    /// Stored class color, normalized sRGB (not linear RGB).
    pub color: [f32; 3],
}

#[derive(Clone, Debug, Deserialize)]
pub struct RaceDef {
    pub key: String,
    pub name: String,
    pub blurb: String,
    /// Menu grouping; this does not constrain class/race gameplay eligibility.
    pub faction: String,
}

#[derive(Clone, Debug, Deserialize)]
pub struct ZoneDef {
    pub key: String,
    pub name: String,
    pub subtitle: String,
    pub boss: String,
    pub minute: u32,
    /// Original loading-screen basename from the zone definition.
    pub icon: String,
    pub blurb: String,
    pub bosses: Vec<ZoneBoss>,
}

#[derive(Clone, Debug, Deserialize)]
pub struct ZoneBoss {
    #[serde(default)]
    pub key: String,
    pub name: String,
    pub minute: f32,
}

#[derive(Clone, Debug, Deserialize)]
pub struct AbilityDef {
    pub key: String,
    pub name: String,
    pub icon: String,
    pub description: String,
}
