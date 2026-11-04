//! Talent definitions/allocation rules shared by persistence, gameplay and UI.
//! Current 0.112.0 Warlock and selected Warrior definitions, with shared
//! allocation/persistence rules. Other records retain 0.109.0 provenance. See
//! docs/analysis/talent-allocations-0.112.0.md for current native evidence.
use azeroth_survivors_re::run_effects::{self, demon_talents::{PACT_DESCRIPTION, PACT_KEY, PACT_NAME}};
use serde::Deserialize;
use std::{collections::BTreeMap, sync::OnceLock};
pub const MAX_POINTS: u32 = 51;
#[derive(Deserialize)]
pub struct Catalog {
    pub classes: Vec<TalentClass>,
}

#[derive(Deserialize)]
struct WarriorReplacements {
    talents: Vec<Talent>,
}

impl Catalog {
    pub fn embedded() -> Self {
        let mut catalog: Self =
            serde_json::from_str(include_str!("../../assets/talents-menu-0.109.0.json"))
                .expect("recovered 0.109.0 talent menu definitions");
        *catalog
            .classes
            .iter_mut()
            .find(|class| class.id == 9)
            .expect("native Warlock class") = serde_json::from_str(include_str!(
            "../../assets/warlock-talents-0.112.0.json"
        ))
        .expect("recovered 0.112.0 Warlock talent definitions");
        let warlock = catalog
            .classes
            .iter_mut()
            .find(|class| class.id == 9)
            .expect("native Warlock class");
        for talent in warlock
            .trees
            .iter_mut()
            .flat_map(|tree| tree.talents.iter_mut())
        {
            match talent.key.as_str() {
                PACT_KEY => {
                    talent.name = PACT_NAME.into();
                    talent.description = PACT_DESCRIPTION.into();
                }
                "butcher" => {
                    talent.description = talent
                        .description
                        .replace("Pact of the Annihilan", PACT_NAME);
                }
                _ => {}
            }
        }
        let replacements: WarriorReplacements = serde_json::from_str(include_str!(
            "../../assets/warrior-talents-0.112.0.json"
        ))
        .expect("recovered 0.112.0 Warrior replacements");
        let warrior = catalog.classes.iter_mut().find(|class| class.id == 1)
            .expect("native Warrior class");
        for replacement in replacements.talents {
            let talent = warrior.trees.iter_mut().flat_map(|tree| tree.talents.iter_mut())
                .find(|talent| talent.key == replacement.key)
                .expect("retained Warrior save key");
            *talent = replacement;
        }
        // Selected0.127.0 definition147054e40 names the shared enemy
        // amplification; retained older catalogs preserve their own wording.
        warrior.trees.iter_mut().flat_map(|tree| tree.talents.iter_mut())
            .find(|talent| talent.key == "imp_demo_shout").unwrap().description =
            "Enemies hit by Demoralizing Shout take {v}% more damage from you and your allies for 6 sec.".into();
        // Selected0.127.0 definition147069b48 updates the shared capacity;
        // the embedded0.112.0 catalog keeps its historical evidence intact.
        catalog.classes.iter_mut().find(|class| class.id == 9).unwrap()
            .trees.iter_mut().flat_map(|tree| tree.talents.iter_mut())
            .find(|talent| talent.key == "soul_link").unwrap().description =
            "Milestone. Permanently summons a Voidwalker that hits 2 enemies. Gains 3% damage per 1% Damage Reduction and 2% per 1% bonus max health.\nYour Voidwalkers shield you for {v}% of their damage, up to 10% of your max health.\nRules out Soul Devourer.".into();
        // The selected 0.140.0 descriptor supplies a fixed per-rank explanation.
        let improved_mind_blast = catalog
            .classes
            .iter_mut()
            .find(|class| class.id == 5)
            .and_then(|priest| {
                priest.trees.iter_mut().flat_map(|tree| &mut tree.talents)
                    .find(|talent| talent.key == "imp_mind_blast")
            })
            .expect("retained Priest talent");
        improved_mind_blast.description =
            "Mind Blast's cooldown is 6% shorter and its damage is 6% higher per rank.".into();
        improved_mind_blast.numeric_values.clear();
        // Current Hunter descriptions share the live effect catalog; keep the
        // historical menu asset's point, tree and allocation data intact.
        let effects = run_effects::catalog().classes.iter()
            .find(|class| class.id == 3).expect("native Hunter effects");
        let hunter = catalog.classes.iter_mut().find(|class| class.id == 3)
            .expect("native Hunter class");
        for talent in hunter.trees.iter_mut().flat_map(|tree| tree.talents.iter_mut())
            .filter(|talent| matches!(talent.key.as_str(), "rapid_fire" | "wyvern_sting"))
        {
            let current = effects.talents.iter().find(|effect| effect.key == talent.key)
                .expect("native Hunter talent");
            talent.description.clone_from(&current.description);
        }
        catalog
    }
    pub fn class(&self, id: u8) -> &TalentClass {
        self.classes
            .iter()
            .find(|class| class.id == id)
            .expect("native class")
    }
}

#[derive(Deserialize)]
pub struct TalentClass {
    pub id: u8,
    pub trees: Vec<TalentTree>,
}

#[derive(Deserialize)]
pub struct TalentTree {
    pub name: String,
    pub background: String,
    pub icon: String,
    pub talents: Vec<Talent>,
}

#[derive(Deserialize)]
pub struct Talent {
    pub key: String,
    pub name: String,
    pub icon: String,
    pub description: String,
    pub row: u8,
    pub column: u8,
    pub max_rank: u8,
    pub prerequisite: Option<String>,
    pub alternative_prerequisite: Option<String>,
    pub exclusive: bool,
    pub numeric_values: Vec<Option<String>>,
    #[serde(default)]
    pub secondary_numeric_values: Vec<Option<String>>,
    #[serde(default)]
    pub supremacy_description: Option<String>,
    #[serde(default)]
    pub supremacy_numeric_values: Vec<Option<String>>,
    pub milestone: bool,
}

pub type Allocation = BTreeMap<String, u8>;

/// 0.117.0 stores this Hunter switch outside the ordinary rank vector (+0x18).
/// The source map carries its serialized key, but tree/point calculations only
/// visit catalog talents and therefore never spend a point on the switch.
pub const WHITE_DEVILSAUR: &str = "white_devilsaur";
pub const WHITE_DEVILSAUR_ACHIEVEMENT: &str = "coop:jurassic";

pub fn white_devilsaur(allocation: &Allocation) -> bool {
    allocation.get(WHITE_DEVILSAUR).copied().unwrap_or(0) != 0
}

/// Current1458d3210: next point costs 80 + 15 * points already earned.
pub fn budget(xp: u64) -> (u32, u64, u32) {
    let mut into = xp;
    let mut earned = 0;
    while earned < MAX_POINTS {
        let cost = 80 + 15 * earned;
        if into < u64::from(cost) {
            break;
        }
        into -= u64::from(cost);
        earned += 1;
    }
    (earned, into, 80 + 15 * earned)
}

pub fn rank(allocation: &Allocation, talent: &Talent) -> u8 {
    allocation
        .get(&talent.key)
        .copied()
        .unwrap_or(0)
        .min(talent.max_rank)
}

pub fn tree_spent(tree: &TalentTree, allocation: &Allocation) -> u32 {
    tree.talents
        .iter()
        .map(|talent| u32::from(rank(allocation, talent)))
        .sum()
}

pub fn spent(class: &TalentClass, allocation: &Allocation) -> u32 {
    class
        .trees
        .iter()
        .map(|tree| tree_spent(tree, allocation))
        .sum()
}

pub fn previous_rows(tree: &TalentTree, allocation: &Allocation, row: u8) -> u32 {
    tree.talents
        .iter()
        .filter(|talent| talent.row < row)
        .map(|talent| u32::from(rank(allocation, talent)))
        .sum()
}

pub fn requirements_met(tree: &TalentTree, talent: &Talent, allocation: &Allocation) -> bool {
    previous_rows(tree, allocation, talent.row) >= u32::from(talent.row) * 5
        && (talent.prerequisite.is_none()
            || talent
                .prerequisite
                .iter()
                .chain(&talent.alternative_prerequisite)
                .any(|key| {
                    tree.talents
                        .iter()
                        .find(|required| &required.key == key)
                        .is_some_and(|required| rank(allocation, required) >= required.max_rank)
                }))
}

/// Current14599f210: same-tree row-6 nodes and flagged same-row choices exclude.
pub fn exclusive_choice<'a>(
    tree: &'a TalentTree,
    talent: &Talent,
    allocation: &Allocation,
) -> Option<&'a Talent> {
    (talent.row == 6 || talent.exclusive)
        .then(|| {
            tree.talents.iter().find(|other| {
                other.row == talent.row
                    && other.key != talent.key
                    && (talent.row == 6 || other.exclusive)
                    && rank(allocation, other) > 0
            })
        })
        .flatten()
}

pub fn can_learn(
    class: &TalentClass,
    tree: &TalentTree,
    talent: &Talent,
    allocation: &Allocation,
    earned: u32,
) -> bool {
    spent(class, allocation) < earned
        && rank(allocation, talent) < talent.max_rank
        && requirements_met(tree, talent, allocation)
        && exclusive_choice(tree, talent, allocation).is_none()
}

/// Current14599fe20 and collector1459cf2a0.
/// Resolving and clamping precede row/tree/column ordering, then each point must
/// pass the native learning gates. This also prevents two imported capstones.
/// Removed keys refund their allocation without changing XP; retained keys keep
/// their ranks only as far as the current tree, prerequisites and budget allow.
pub fn normalize(class: &TalentClass, raw: &[(String, u8)], earned: u32) -> Allocation {
    let mut candidates = raw
        .iter()
        .filter_map(|(key, requested)| {
            class.trees.iter().enumerate().find_map(|(index, tree)| {
                tree.talents
                    .iter()
                    .find(|talent| &talent.key == key)
                    .map(|talent| (index, tree, talent, (*requested).min(talent.max_rank)))
            })
        })
        .collect::<Vec<_>>();
    candidates.sort_unstable_by_key(|(index, _, talent, _)| (talent.row, *index, talent.column));
    let mut allocation = Allocation::new();
    // Native145a87320 initializes this lane before ordinary admission, even
    // with an empty vector or no earned points. Achievement gating belongs to
    // the account reader/writer, not this allocation normalizer.
    if class.id == 3 && raw.iter().any(|(key, value)| key == WHITE_DEVILSAUR && *value != 0) {
        allocation.insert(WHITE_DEVILSAUR.into(), 1);
    }
    for (_, tree, talent, requested) in candidates {
        for _ in 0..requested {
            if can_learn(class, tree, talent, &allocation, earned) {
                let next = rank(&allocation, talent) + 1;
                allocation.insert(talent.key.clone(), next);
            }
        }
    }
    allocation
}

pub fn can_refund(class: &TalentClass, talent: &Talent, allocation: &Allocation) -> bool {
    if rank(allocation, talent) == 0 {
        return false;
    }
    let mut candidate = allocation.clone();
    let old = candidate.get(&talent.key).copied().unwrap_or(0);
    if old <= 1 {
        candidate.remove(&talent.key);
    } else {
        candidate.insert(talent.key.clone(), old - 1);
    }
    // Current14599f500 normalizes with an unlimited budget, then compares totals.
    let raw = candidate
        .iter()
        .map(|(key, rank)| (key.clone(), *rank))
        .collect::<Vec<_>>();
    spent(class, &normalize(class, &raw, u32::MAX)) == spent(class, &candidate)
}

pub fn catalog() -> &'static Catalog {
    static CATALOG: OnceLock<Catalog> = OnceLock::new();
    CATALOG.get_or_init(Catalog::embedded)
}

pub(crate) fn decode_allocation(value: &str) -> Vec<(String, u8)> {
    value
        .split(',')
        .filter_map(|entry| {
            // Native1459d6f70 splits at the first colon and trims both lanes
            // before lookup/parse. This matters for preserved keys in imports
            // and all three saved specs, including Felfire Training/Aftermath.
            let (key, rank) = entry.split_once(':')?;
            let key = key.trim();
            // Native145a86450's independent bool parser is deliberately not
            // numeric: only the exact trimmed character "0" disables a token.
            // A later enabling duplicate wins over an earlier zero token.
            if key == WHITE_DEVILSAUR {
                return (rank.trim() != "0").then(|| (key.to_owned(), 1));
            }
            let rank = rank.trim().parse::<u8>().ok()?;
            (!key.is_empty() && rank != 0).then(|| (key.to_owned(), rank))
        })
        .collect()
}

pub(crate) fn encode_allocation(values: &[(String, u8)]) -> String {
    values
        .iter()
        .filter(|(key, rank)| if key == WHITE_DEVILSAUR { *rank == 1 } else { *rank != 0 })
        .map(|(key, rank)| format!("{key}:{rank}"))
        .collect::<Vec<_>>()
        .join(",")
}

fn normalized(class: u8, values: &[(String, u8)], xp: u64) -> Vec<(String, u8)> {
    let Some(class) = catalog().classes.iter().find(|row| row.id == class) else {
        return Vec::new();
    };
    let mut values = normalize(class, values, budget(xp).0)
        .into_iter()
        .collect::<Vec<_>>();
    // Native normalization's insertion order is row, then tree, then column.
    // The BTreeMap is only a lookup representation; the saved vector keeps that order.
    values.sort_by_key(|(key, _)| {
        if key == WHITE_DEVILSAUR {
            // Native145a871d0 appends the independent token after rank tokens.
            return (u8::MAX, usize::MAX, u8::MAX);
        }
        class
            .trees
            .iter()
            .enumerate()
            .find_map(|(tree_index, tree)| {
                tree.talents
                    .iter()
                    .find(|talent| &talent.key == key)
                    .map(|talent| (talent.row, tree_index, talent.column))
            })
            .expect("normalized talent")
    });
    values
}

#[derive(Clone, Debug, Default, PartialEq, Eq)]
struct Specs {
    active: u8,
    allocations: [Vec<(String, u8)>; 3],
}

#[derive(Clone)]
struct TalentRow {
    class: u8,
    xp: u32,
    values: Vec<(String, u8)>,
}

fn talent_fields(line: &str) -> Option<(u8, u32, &str)> {
    let mut fields = line.trim().split('|');
    if fields.next()? != "talent" {
        return None;
    }
    let class = fields.next()?.parse::<u8>().ok()?;
    let xp = fields.next()?.parse::<u32>().ok()?;
    let allocation = fields.next()?;
    fields.next().is_none().then_some((class, xp, allocation))
}

fn parse_talent(line: &str) -> Option<TalentRow> {
    let (class, xp, allocation) = talent_fields(line)?;
    Some(TalentRow {
        class,
        xp,
        values: normalized(class, &decode_allocation(allocation), u64::from(xp)),
    })
}

fn parse_spec(line: &str, xp: impl Fn(u8) -> u64) -> Option<(u8, Specs)> {
    let fields = line.trim().split('|').collect::<Vec<_>>();
    if fields.len() < 3 || fields[0] != "spec" {
        return None;
    }
    let class = fields[1].parse::<u8>().ok()?;
    let active = fields[2].parse::<u8>().ok()?;
    if active >= 3 {
        return None;
    }
    Some((
        class,
        Specs {
            active,
            allocations: std::array::from_fn(|i| {
                fields
                    .get(i + 3)
                    .map(|value| normalized(class, &decode_allocation(value), xp(class)))
                    .unwrap_or_default()
            }),
        },
    ))
}

fn talent_text(row: &TalentRow) -> String {
    format!(
        "talent|{}|{}|{}",
        row.class,
        row.xp,
        encode_allocation(&row.values)
    )
}

fn spec_text(class: u8, specs: &Specs) -> String {
    format!(
        "spec|{class}|{}|{}|{}|{}",
        specs.active,
        encode_allocation(&specs.allocations[0]),
        encode_allocation(&specs.allocations[1]),
        encode_allocation(&specs.allocations[2])
    )
}

/// Current1458d45c0 parses all talent rows before specs. Talent duplicates remain
/// ordered; specs replace the earlier class row and append the last valid one.
/// Unknown numeric classes retain XP/slots, with empty normalized allocations.
pub(super) fn normalized_rows(lines: &[String]) -> (Vec<String>, Vec<String>) {
    let talents = lines
        .iter()
        .filter_map(|line| parse_talent(line))
        .collect::<Vec<_>>();
    let mut specs = Vec::<(u8, Specs)>::new();
    for line in lines {
        if let Some((class, value)) = parse_spec(line, |class| {
            talents
                .iter()
                .find(|row| row.class == class)
                .map_or(0, |row| u64::from(row.xp))
        }) {
            specs.retain(|(previous, _)| *previous != class);
            specs.push((class, value));
        }
    }
    (
        talents.iter().map(talent_text).collect(),
        specs
            .iter()
            .map(|(class, value)| spec_text(*class, value))
            .collect(),
    )
}

impl super::Save {
    /// Current1458d2fe0 changes only XP in the first matching talent row.
    /// Allocation edits and spec synchronization use their separate owner.
    pub(super) fn add_terminal_talent_xp(
        &mut self,
        class: u8,
        amount: u32,
    ) -> Result<(), super::SaveError> {
        if !super::CLASS_IDS.contains(&class) {
            return Err(super::SaveError::InvalidRecord("talent"));
        }
        for line in &mut self.lines {
            if let Some((row_class, xp, allocation)) = talent_fields(line) {
                if row_class == class {
                    *line = format!("talent|{class}|{}|{allocation}", xp.saturating_add(amount));
                    return Ok(());
                }
            }
        }
        self.lines.push(format!("talent|{class}|{amount}|"));
        Ok(())
    }

    /// Current1458d4160 uses the first valid class row, including duplicates.
    pub fn talent_xp(&self, class: u8) -> u64 {
        self.lines
            .iter()
            .filter_map(|line| parse_talent(line))
            .find(|row| row.class == class)
            .map_or(0, |row| u64::from(row.xp))
    }

    pub fn talent_allocation(&self, class: u8) -> Vec<(String, u8)> {
        let mut values = self.lines
            .iter()
            .filter_map(|line| parse_talent(line))
            .find(|row| row.class == class)
            .map_or_else(Vec::new, |row| row.values);
        if !self.earned_achievements().contains(WHITE_DEVILSAUR_ACHIEVEMENT) {
            values.retain(|(key, _)| key != WHITE_DEVILSAUR);
        }
        values
    }

    fn specs(&self, class: u8) -> Option<Specs> {
        self.lines
            .iter()
            .filter_map(|line| parse_spec(line, |class| self.talent_xp(class)))
            .filter(|(id, _)| *id == class)
            .map(|(_, specs)| specs)
            .last()
    }

    /// Current1458d2340: the selected spec always reads the live talent row.
    pub fn talent_spec(&self, class: u8) -> u8 {
        self.specs(class).map_or(0, |specs| specs.active)
    }

    pub fn talent_spec_allocation(&self, class: u8, slot: u8) -> Vec<(String, u8)> {
        if slot >= 3 {
            return Vec::new();
        }
        let specs = self.specs(class).unwrap_or_default();
        if slot == specs.active {
            self.talent_allocation(class)
        } else {
            specs.allocations[usize::from(slot)].clone()
        }
    }

    fn store_specs(&mut self, class: u8, specs: Specs) {
        let line = spec_text(class, &specs);
        if let Some(index) = self.lines.iter().position(|line| {
            parse_spec(line, |class| self.talent_xp(class)).is_some_and(|(id, _)| id == class)
        }) {
            self.lines[index] = line;
        } else {
            self.lines.push(line);
        }
    }

    /// Current1458d2770 saves the outgoing live allocation before changing slots.
    /// An old save first gains a spec row here, with its old allocation in slot 0.
    pub fn select_talent_spec(&mut self, class: u8, slot: u8) -> Result<bool, super::SaveError> {
        if !super::CLASS_IDS.contains(&class) || slot >= 3 {
            return Err(super::SaveError::InvalidRecord("talent spec"));
        }
        let mut specs = self.specs(class).unwrap_or_default();
        if specs.active == slot {
            return Ok(false);
        }
        let next = self.talent_spec_allocation(class, slot);
        specs.allocations[usize::from(specs.active)] = self.talent_allocation(class);
        specs.allocations[usize::from(slot)] = next.clone();
        specs.active = slot;
        self.store_specs(class, specs);
        self.set_talent_allocation(class, self.talent_xp(class) as u32, &next)?;
        Ok(true)
    }

    /// Current1458dda90 normalizes the live allocation and mirrors it into the selected slot.
    pub fn set_talent_allocation(
        &mut self,
        class: u8,
        xp: u32,
        values: &[(String, u8)],
    ) -> Result<(), super::SaveError> {
        if !super::CLASS_IDS.contains(&class)
            || values.iter().any(|(key, _)| {
                key.is_empty() || !super::valid_field(key) || key.contains([',', ':'])
            })
        {
            return Err(super::SaveError::InvalidRecord("talent"));
        }
        let mut values = normalized(class, values, u64::from(xp));
        // Native145acf5b0 masks both the live row and the selected stored slot.
        if !self.earned_achievements().contains(WHITE_DEVILSAUR_ACHIEVEMENT) {
            values.retain(|(key, _)| key != WHITE_DEVILSAUR);
        }
        if let Some(mut specs) = self.specs(class) {
            specs.allocations[usize::from(specs.active)] = values.clone();
            self.store_specs(class, specs);
        }
        let line = talent_text(&TalentRow { class, xp, values });
        if let Some(index) = self
            .lines
            .iter()
            .position(|line| parse_talent(line).is_some_and(|row| row.class == class))
        {
            self.lines[index] = line;
        } else {
            self.lines.push(line);
        }
        Ok(())
    }
}

#[cfg(test)]
mod spec_tests {
    use super::super::Save;

    #[test]
    fn terminal_xp_preserves_live_allocation_and_all_saved_specs() {
        let fixture: serde_json::Value = serde_json::from_str(include_str!(concat!(
            env!("CARGO_MANIFEST_DIR"),
            "/../../docs/analysis/evidence/0.112.0/achievement-terminal/native-vectors.json"
        )))
        .unwrap();
        for case in fixture["typed_xp_save_cases"].as_array().unwrap() {
            let mut save = Save::parse(case["input"].as_str().unwrap()).unwrap();
            assert_eq!(save.plaintext(), case["before"].as_str().unwrap());
            save.grant_terminal_xp(
                case["class_id"].as_u64().unwrap() as u8,
                case["amount"].as_u64().unwrap() as u32,
            )
            .unwrap();
            assert_eq!(save.plaintext(), case["after"].as_str().unwrap());
        }

        let mut save = Save::parse("talent|1|80|imp_heroic:1\n").unwrap();
        // The XP owner preserves the retained payload even when its talent
        // catalog provenance differs; only a real load/allocation edit normalizes.
        save.lines.push("talent|2|4294967294|retained:7".into());
        save.grant_terminal_xp(2, 80).unwrap();
        assert!(save.lines.contains(&"talent|2|4294967295|retained:7".into()));
        let before_insert = save.lines.clone();
        save.grant_terminal_xp(9, 80).unwrap();
        assert_eq!(&save.lines[..before_insert.len()], &before_insert);
        assert_eq!(save.lines.last().unwrap(), "talent|9|80|");
    }

    #[test]
    fn old_allocation_migrates_only_when_switching_and_survives_return() {
        let mut save = Save::parse("talent|1|175|imp_heroic:2\nstat|wins=1\n").unwrap();
        assert_eq!(save.talent_spec(1), 0);
        assert!(!save.plaintext().contains("spec|"));
        assert!(!save.select_talent_spec(1, 0).unwrap());
        assert!(save.select_talent_spec(1, 1).unwrap());
        assert_eq!(save.talent_allocation(1), []);
        assert_eq!(
            save.talent_spec_allocation(1, 0),
            [("imp_heroic".into(), 2)]
        );
        save.set_talent_allocation(1, 175, &[("deflection".into(), 2)])
            .unwrap();
        let mut reopened = Save::parse(&save.plaintext()).unwrap();
        assert_eq!(reopened.talent_spec(1), 1);
        reopened.select_talent_spec(1, 0).unwrap();
        assert_eq!(reopened.talent_allocation(1), [("imp_heroic".into(), 2)]);
        assert_eq!(
            reopened.talent_spec_allocation(1, 1),
            [("deflection".into(), 2)]
        );
        assert!(reopened.plaintext().contains("stat|wins=1"));
    }

    #[test]
    fn spec_import_uses_class_budget_and_live_selected_row() {
        let save = Save::parse(
            "talent|1|80|imp_heroic:1\nspec|1|2|imp_heroic:255|unknown:4|deflection:4\n",
        )
        .unwrap();
        assert_eq!(
            save.talent_spec_allocation(1, 0),
            [("imp_heroic".into(), 1)]
        );
        assert_eq!(save.talent_spec_allocation(1, 1), []);
        assert_eq!(
            save.talent_spec_allocation(1, 2),
            [("imp_heroic".into(), 1)]
        );
        assert_eq!(save.talent_xp(1), 80);
    }

    #[test]
    fn invalid_slot_never_mutates_and_classes_are_independent() {
        let mut save =
            Save::parse("talent|1|80|imp_heroic:1\ntalent|2|80|divine_strength:1\n").unwrap();
        let before = save.plaintext();
        assert!(save.select_talent_spec(1, 3).is_err());
        assert_eq!(save.plaintext(), before);
        save.select_talent_spec(1, 2).unwrap();
        assert_eq!(save.talent_spec(2), 0);
        assert_eq!(save.talent_xp(2), 80);
    }
}

#[cfg(test)]
mod white_devilsaur_tests {
    use super::*;
    use super::super::Save;

    #[test]
    fn independent_switch_does_not_spend_points_and_is_hunter_only() {
        let values = vec![(WHITE_DEVILSAUR.into(), 1)];
        let hunter = catalog().class(3);
        let allocation = normalize(hunter, &values, 0);
        assert!(white_devilsaur(&allocation));
        assert_eq!(spent(hunter, &allocation), 0);
        assert!(normalize(catalog().class(9), &values, 51).is_empty());
    }

    #[test]
    fn bool_codec_rejects_only_exact_zero_and_preserves_enabling_duplicates() {
        for value in ["1", "2", "00", "false", "", " 1 ", "0:1"] {
            let text = format!("white_devilsaur:0, white_devilsaur : {value},white_devilsaur:0");
            assert_eq!(normalized(3, &decode_allocation(&text), 0), [(WHITE_DEVILSAUR.into(), 1)]);
        }
        assert!(normalized(3, &decode_allocation("white_devilsaur: 0 "), 0).is_empty());
        assert_eq!(encode_allocation(&[(WHITE_DEVILSAUR.into(), 1)]), "white_devilsaur:1");
        assert_eq!(encode_allocation(&[(WHITE_DEVILSAUR.into(), 2)]), "");
    }

    #[test]
    fn earned_gate_live_slots_roundtrip_and_switch_keep_independent_flags() {
        let mut save = Save::parse(
            "talent|3|0|white_devilsaur:1\nspec|3|0|white_devilsaur:1||white_devilsaur:1\nach|coop:jurassic\n",
        ).unwrap();
        assert_eq!(save.talent_allocation(3), [(WHITE_DEVILSAUR.into(), 1)]);
        save.select_talent_spec(3, 1).unwrap();
        assert!(save.talent_allocation(3).is_empty());
        assert_eq!(save.talent_spec_allocation(3, 0), [(WHITE_DEVILSAUR.into(), 1)]);
        save.select_talent_spec(3, 2).unwrap();
        let mut reopened = Save::parse(&save.plaintext()).unwrap();
        assert_eq!(reopened.talent_allocation(3), [(WHITE_DEVILSAUR.into(), 1)]);
        reopened.lines.retain(|line| !line.starts_with("ach|"));
        assert!(reopened.talent_allocation(3).is_empty());
        // Inactive stored allocations are normalized, but only live reads and
        // writes apply the achievement gate (145ac2ed0/145ac4bd0/145acf5b0).
        assert_eq!(reopened.talent_spec_allocation(3, 0), [(WHITE_DEVILSAUR.into(), 1)]);
        reopened.set_talent_allocation(3, 0, &[(WHITE_DEVILSAUR.into(), 1)]).unwrap();
        assert!(reopened.talent_allocation(3).is_empty());
        assert!(!reopened.plaintext().contains("talent|3|0|white_devilsaur"));
    }
}

#[cfg(test)]
mod warrior_replacement_tests {
    use super::Catalog;

    #[test]
    fn menu_and_gameplay_share_current_warrior_replacements() {
        let definitions: serde_json::Value = serde_json::from_str(include_str!(
            "../../assets/warrior-talents-0.112.0.json"
        )).unwrap();
        let menu = Catalog::embedded();
        for expected in definitions["talents"].as_array().unwrap() {
            let key = expected["key"].as_str().unwrap();
            let talent = menu.class(1).trees.iter().flat_map(|tree| &tree.talents)
                .find(|talent| talent.key == key).unwrap();
            assert_eq!(talent.name, expected["name"].as_str().unwrap());
            assert_eq!(talent.icon, expected["icon"].as_str().unwrap());
            assert_eq!(talent.description, expected["description"].as_str().unwrap());
            for rank in 0..5 {
                assert_eq!(talent.numeric_values[rank].as_deref(),
                           expected["numeric_values"][rank].as_str());
            }
            let live = azeroth_survivors_re::run_effects::catalog().classes.iter()
                .find(|class| class.id == 1).unwrap().talents.iter()
                .find(|talent| talent.key == key).unwrap();
            assert_eq!(live.name, talent.name);
            assert_eq!(live.icon, talent.icon);
        }
    }
}
