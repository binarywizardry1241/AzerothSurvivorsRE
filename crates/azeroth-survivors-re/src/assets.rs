//! Menu fonts/icons are read at runtime from the user's MPQ patch chain.
//! No MPQ contents are embedded in the source or executable.

use std::collections::BTreeMap;
use std::path::PathBuf;

use bevy::asset::RenderAssetUsages;
use bevy::prelude::*;
use bevy::render::render_resource::{Extent3d, TextureDimension, TextureFormat};

use crate::catalog::MenuCatalog;

pub(crate) const RACE_ATLAS: &str = "race.atlas";

#[derive(Resource, Default)]
pub struct MenuArt {
    pub font: Handle<Font>,
    pub heading_font: Handle<Font>,
    pub icons: BTreeMap<String, Handle<Image>>,
    pub data_status: String,
    pub appearance_ranges: BTreeMap<(u8, u8), [u8; 5]>,
}

pub fn data_directory() -> Option<PathBuf> {
    benilla_formats::wow_data()
}

fn texture_path(icon: &str) -> String {
    let mut path = icon.replace('/', "\\");
    if !path.contains('\\') {
        path = format!("Interface\\Icons\\{path}");
    }
    if path.to_ascii_lowercase().ends_with(".blp") {
        path
    } else {
        format!("{path}.blp")
    }
}

fn menu_images(catalog: &MenuCatalog) -> Vec<(&str, String)> {
    catalog
        .classes
        .iter()
        .map(|class| (class.key.as_str(), texture_path(&class.icon)))
        .chain(catalog.zones.iter().map(|zone| {
            let path = format!("Interface\\Glues\\LoadingScreens\\{}", zone.icon);
            (zone.key.as_str(), texture_path(&path))
        }))
        .chain(
            catalog
                .abilities
                .iter()
                .map(|ability| (ability.key.as_str(), texture_path(&ability.icon))),
        )
        .chain(std::iter::once((
            RACE_ATLAS,
            "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Races.blp".to_owned(),
        )))
        .chain(std::iter::once((crate::gameplay::stored_hud::CLASS_ATLAS,
            crate::gameplay::stored_hud::CLASS_ATLAS.to_owned())))
        .chain(azeroth_survivors_re::loot_rewards::JEWELRY.iter().map(|item| {
            (item.icon, texture_path(item.icon))
        }))
        .chain({
            let amulets = azeroth_survivors_re::loot_rewards::amulets::catalog();
            amulets.shared.iter().chain(&amulets.generated).map(|item| {
                (item.icon.as_str(), texture_path(&item.icon))
            })
        })
        .collect()
}

pub(crate) fn read_image(chain: &mut benilla_formats::Chain, path: &str) -> Result<Image, String> {
    let bytes = chain.read_file(path).map_err(|error| error.to_string())?;
    let texture =
        benilla_formats::blp_bytes_to_mip_chain(&bytes).map_err(|error| error.to_string())?;
    let rgba = texture
        .mips
        .into_iter()
        .next()
        .ok_or("Texture has no mip level")?;
    Ok(Image::new(
        Extent3d {
            width: texture.width,
            height: texture.height,
            depth_or_array_layers: 1,
        },
        TextureDimension::D2,
        rgba,
        TextureFormat::Rgba8UnormSrgb,
        RenderAssetUsages::default(),
    ))
}

pub fn load_menu_art(
    catalog: Res<MenuCatalog>,
    mut art: ResMut<MenuArt>,
    mut fonts: ResMut<Assets<Font>>,
    mut images: ResMut<Assets<Image>>,
) {
    art.icons.insert(
        "community".into(),
        images.add(crate::community_icon::image()),
    );
    let Some(directory) = data_directory() else {
        art.data_status = "Supply your MPQs with WOW_DATA or --data-dir.".into();
        return;
    };
    let mut chain = match benilla_formats::open_chain(&directory) {
        Ok(chain) => chain,
        Err(error) => {
            art.data_status = format!("MPQs could not be opened: {error}");
            return;
        }
    };
    let mut has_font = false;
    if let Ok(creation) = benilla_formats::CharCreateCatalog::load(&mut chain) {
        for race in 1..=8 {
            for sex in 0..=1 {
                if let Some(range) = creation.ranges(race, sex) {
                    art.appearance_ranges.insert(
                        (race, sex),
                        [
                            range.skin,
                            range.face,
                            range.hair_style,
                            range.hair_color,
                            range.facial_hair,
                        ],
                    );
                }
            }
        }
        // Current145500d30 uses an optional cache: absence preserves saved
        // bytes. Filling it does not itself authorize a persistent save write.
        crate::save::appearance::install_ranges(art.appearance_ranges.clone());
    }
    for name in ["Fonts\\FRIZQT__.TTF", "Fonts\\ARIALN.TTF"] {
        if let Ok(bytes) = crate::menu_fonts::read_font(&mut chain, name) {
            if let Ok(font) = Font::try_from_bytes(bytes) {
                art.font = fonts.add(font);
                has_font = true;
                break;
            }
        }
    }
    art.heading_font = crate::menu_fonts::read_font(&mut chain, "Fonts\\MORPHEUS.TTF")
        .ok()
        .and_then(|bytes| Font::try_from_bytes(bytes).ok())
        .map(|font| fonts.add(font))
        .unwrap_or_else(|| art.font.clone());
    if let Ok(image) = read_image(
        &mut chain,
        "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes.blp",
    ) {
        art.icons.insert("class.atlas".into(), images.add(image));
    }
    for slot in [
        "Head",
        "Shoulder",
        "Chest",
        "Hands",
        "Waist",
        "Legs",
        "Wrist",
        "Feet",
        "MainHand",
        "SecondaryHand",
        "Ranged",
    ] {
        let native_slot = if slot == "Wrist" { "Wrists" } else { slot };
        let path = format!("Interface\\PaperDoll\\UI-PaperDoll-Slot-{native_slot}.blp");
        if let Ok(image) = read_image(&mut chain, &path) {
            art.icons.insert(format!("slot.{slot}"), images.add(image));
        }
    }
    if let Ok(image) = read_image(&mut chain, "Interface\\Icons\\INV_Misc_Coin_02.blp") {
        art.icons.insert("native_gold_choice".into(), images.add(image));
    }
    if let Ok(image) = read_image(&mut chain, "Interface\\Icons\\INV_Misc_QuestionMark.blp") {
        art.icons.insert("native_hud_questionmark".into(), images.add(image));
    }
    for (key, path) in menu_images(&catalog) {
        if let Ok(image) = read_image(&mut chain, &path) {
            art.icons.insert(key.to_string(), images.add(image));
        }
    }
    art.data_status = format!(
        "MPQs loaded · {} menu images · {}",
        art.icons.len(),
        if has_font {
            "game font"
        } else {
            "fallback font"
        },
    );
    info!("{} from {}", art.data_status, directory.display());
}

pub fn check_data(catalog: &MenuCatalog) -> Result<(), String> {
    let directory =
        data_directory().ok_or("Set WOW_DATA or pass --data-dir to your MPQ Data directory.")?;
    let mut chain = benilla_formats::open_chain(&directory).map_err(|error| error.to_string())?;
    let mut missing = Vec::new();
    let font = crate::menu_fonts::read_font(&mut chain, "Fonts\\FRIZQT__.TTF")
        .map_err(|error| error.to_string())?;
    Font::try_from_bytes(font).map_err(|error| format!("Game font: {error}"))?;
    for (key, path) in menu_images(catalog) {
        match read_image(&mut chain, &path) {
            Ok(_) => {}
            Err(error) => missing.push(format!("{key}: {error}")),
        }
    }
    if !missing.is_empty() {
        return Err(missing.join("\n"));
    }
    println!(
        "Menu data OK: v{}, {} classes, {} races, {} zones; font and all menu images read from {}.",
        env!("CARGO_PKG_VERSION"),
        catalog.classes.len(),
        catalog.races.len(),
        catalog.zones.len(),
        directory.display()
    );
    Ok(())
}
