//! Recovered 0.121.0 Heroic rank descriptors, names and affix selection.
//!
//! These helpers own the exact bounded contracts in
//! `docs/analysis/heroic-source-0.121.0.md`. Rank admission, the selector input
//! producers and affix gameplay effects belong to their live callers.

#[path = "heroic/affix_calendar.rs"]
mod affix_calendar;
pub use self::affix_calendar::{current_week, zone_selector};

pub const MAX_RANK: u8 = 5;
/// The saved Champion of Naxxramas key unlocks both Crusader and Hyper Mode.
pub const HYPER_ACHIEVEMENT: &str = "heroic:naxx5";

/// Current Pick rank fields parse an ASCII u8 before clamping to I–V.
/// A leading `+` is accepted; empty, signed-negative, non-decimal and u8
/// overflow inputs become Normal. In particular a legacy four-modifier CSV
/// becomes Normal rather than being interpreted as a rank or partially read.
pub fn parse_rank(text: &str) -> u8 {
    let bytes = text.as_bytes();
    let digits = bytes.strip_prefix(b"+").unwrap_or(bytes);
    let mut value = 0_u8;
    for &byte in digits {
        let digit = byte.wrapping_sub(b'0');
        if digit > 9 {
            return 0;
        }
        let Some(next) = value
            .checked_mul(10)
            .and_then(|value| value.checked_add(digit))
        else {
            return 0;
        };
        value = next;
    }
    value.min(MAX_RANK)
}

/// The first two scalar fields in the five native 48-byte Heroic descriptors
/// feed the current guardian health/damage consumers. The final two fields
/// feed the current mark and loot/talent-experience reward consumers.
#[derive(Clone, Copy, Debug)]
pub struct Descriptor {
    pub twists: [&'static str; 2],
    pub health_multiplier: f32,
    pub damage_multiplier: f32,
    pub marks_multiplier: f32,
    pub reward_multiplier: f32,
}

pub static DESCRIPTORS: [Descriptor; 5] = [
    Descriptor {
        twists: [
            "Boss attacks give 15% less warning.",
            "Elite packs: elites come in pairs.",
        ],
        health_multiplier: 1.79,
        damage_multiplier: 1.65,
        marks_multiplier: 1.0,
        reward_multiplier: 1.3,
    },
    Descriptor {
        twists: [
            "Relentless: bosses fight enraged from the start, and fiercer below 30% health.",
            "Wardens: each guardian slain makes the others twice as tough, and lairs refill sooner.",
        ],
        health_multiplier: 1.97,
        damage_multiplier: 1.77,
        marks_multiplier: 1.25,
        reward_multiplier: 1.4,
    },
    Descriptor {
        twists: [
            "Lean purse: one free reroll, and caches cost a quarter more.",
            "Affix: the horde has Bolstering, Sanguine or Explosive.",
        ],
        health_multiplier: 2.16,
        damage_multiplier: 1.88,
        marks_multiplier: 1.5,
        reward_multiplier: 1.5,
    },
    Descriptor {
        twists: [
            "Old mechanics: boss towers and gazes are back.",
            "Unforgiving: a failed boss mechanic hits three times as hard.",
        ],
        health_multiplier: 2.45,
        damage_multiplier: 2.01,
        marks_multiplier: 2.0,
        reward_multiplier: 1.6,
    },
    Descriptor {
        twists: [
            "Withering: regeneration, heals and leech are halved, and revives are slower and weaker.",
            "Council: two affixes, and the final boss brings one of the zone's earlier bosses.",
        ],
        health_multiplier: 2.72,
        damage_multiplier: 2.16,
        marks_multiplier: 2.5,
        reward_multiplier: 1.7,
    },
];

pub fn descriptor(rank: u8) -> Option<&'static Descriptor> {
    rank.checked_sub(1)
        .and_then(|index| DESCRIPTORS.get(usize::from(index)))
}

/// The current scalar consumers use 1 for rank 0 and out-of-domain byte ranks;
/// unlike the rank-name helper, these consumers do not take a bounds failure.
pub fn health_multiplier(rank: u8) -> f32 {
    descriptor(rank).map_or(1.0, |value| value.health_multiplier)
}

pub fn damage_multiplier(rank: u8) -> f32 {
    descriptor(rank).map_or(1.0, |value| value.damage_multiplier)
}

/// This raw helper defaults to Normal's half mark rate outside ranks I–V.
pub fn marks_multiplier(rank: u8) -> f32 {
    descriptor(rank).map_or(0.5, |value| value.marks_multiplier)
}

/// The helper's invalid-byte default differs from callers that first clamp a
/// rank to V. Callers retain their own recovered normalization before use.
pub fn reward_multiplier(rank: u8) -> f32 {
    descriptor(rank).map_or(1.0, |value| value.reward_multiplier)
}

pub fn healing_factor(rank: u8) -> f32 {
    if rank >= 5 {
        0.5
    } else {
        1.0
    }
}

pub fn warning_factor(rank: u8) -> f32 {
    if rank != 0 {
        0.85
    } else {
        1.0
    }
}

pub fn revive_seconds(rank: u8) -> f32 {
    if rank >= 5 {
        9.0
    } else {
        6.0
    }
}

pub fn revive_health(rank: u8) -> f32 {
    if rank >= 5 {
        0.3
    } else {
        0.5
    }
}

pub fn guardian_health_per_kill(rank: u8) -> f32 {
    if rank >= 2 {
        0.35
    } else {
        0.25
    }
}

pub fn guardian_damage_per_kill(rank: u8) -> f32 {
    if rank >= 2 {
        0.07
    } else {
        0.05
    }
}

pub fn guardian_respawn_seconds(rank: u8) -> f32 {
    if rank >= 2 {
        150.0
    } else {
        180.0
    }
}

pub fn boss_repeat_factor(rank: u8, enraged: bool) -> f32 {
    if rank >= 2 {
        if enraged {
            0.6
        } else {
            0.8
        }
    } else if enraged {
        0.7
    } else {
        1.0
    }
}

/// Selected by the positive aggregate raid-hazard damage consumer after its
/// marker/time publication. Callers retain that admission and ordering.
pub fn raid_damage_factor(rank: u8, endless: bool) -> f32 {
    if rank >= 4 {
        3.0
    } else if endless {
        1.0
    } else {
        2.0
    }
}

pub fn free_rerolls_base(rank: u8) -> u32 {
    if rank >= 3 {
        1
    } else {
        3
    }
}

pub fn cache_initial_price(rank: u8) -> u32 {
    if rank >= 3 {
        25
    } else {
        20
    }
}

pub fn cache_cost_increment(rank: u8) -> f32 {
    if rank >= 3 {
        6.25
    } else {
        5.0
    }
}

/// The native naming helper accepts Normal and Heroic I–V, and fails its
/// six-entry bounds check for any other rank. Localization is supplied by the
/// existing catalog, including its original-key fallback.
pub fn rank_name(rank: u8, normal: &str, heroic: &str) -> String {
    const ROMAN: [&str; 6] = ["", "I", "II", "III", "IV", "V"];
    if rank == 0 {
        normal.to_owned()
    } else {
        format!("{heroic} {}", ROMAN[usize::from(rank)])
    }
}

/// Preserve the observed u64 arithmetic at the current run-construction
/// callsite. The meaning and production of both inputs are caller contracts.
pub fn selector_from_inputs(input_hash: u64, discriminator: u32) -> u64 {
    input_hash.wrapping_add(u64::from(discriminator) * 7)
}

/// Return the native numeric affix IDs in their selected order. The helper
/// itself consumes a byte rank: below III is empty, III/IV selects one, and
/// every rank at least V selects two distinct IDs. The displayed rank domain
/// is separately bounded by `rank_name` and the menu/save admission policy.
pub fn affix_ids(rank: u8, selector: u64) -> Vec<u8> {
    if rank < 3 {
        return Vec::new();
    }
    let first = (selector % 3) as u8;
    if rank < 5 {
        vec![first]
    } else {
        let second = (first + ((selector / 3) & 1) as u8 + 1) % 3;
        vec![first, second]
    }
}
