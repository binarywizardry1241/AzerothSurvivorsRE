//! Generated 0.100.1 zone geometry and enemy chest flags.
//! Owning byte spans: docs/analysis/evidence/0.100.1/treasure-chests/catalog.json.
//! Regenerate: python3 scripts/recover-treasure-0.100.1-catalog.py --write-source-catalog
//! The build uses these constants and never reads the reference executable.

use super::{EnemyDefinition, Position, ZoneDefinition};

pub const ZONES: [ZoneDefinition; 12] = [
    ZoneDefinition {
        key: "elwynn",
        center: Position::new(-9396.0, -633.0, 68.0),
        radius: 120.0,
        enemies: &[
            EnemyDefinition {
                id: 600,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Kobold Vermin
            EnemyDefinition {
                id: 601,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Young Wolf
            EnemyDefinition {
                id: 602,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Murloc Streamrunner
            EnemyDefinition {
                id: 603,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Kobold Geomancer
            EnemyDefinition {
                id: 604,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Defias Thug
            EnemyDefinition {
                id: 605,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Riverpaw Brute
            EnemyDefinition {
                id: 606,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Prowler
            EnemyDefinition {
                id: 607,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Defias Rogue Wizard
            EnemyDefinition {
                id: 608,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Defias Enforcer
            EnemyDefinition {
                id: 609,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Kobold Taskmaster
            EnemyDefinition {
                id: 610,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Gruff Swiftbite
            EnemyDefinition {
                id: 611,
                base_experience: 30,
                death_accumulator: 14.0,
                chest_flag: 1,
            }, // Bellygrub
        ],
    },
    ZoneDefinition {
        key: "duskwood",
        center: Position::new(-10540.0, 180.0, 30.299999237060547),
        radius: 120.0,
        enemies: &[
            EnemyDefinition {
                id: 700,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Skeletal Raider
            EnemyDefinition {
                id: 701,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Plague Spreader
            EnemyDefinition {
                id: 702,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Black Widow Hatchling
            EnemyDefinition {
                id: 703,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Nightbane Shadow Weaver
            EnemyDefinition {
                id: 704,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Rotting Horror
            EnemyDefinition {
                id: 705,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Nightbane Dark Runner
            EnemyDefinition {
                id: 706,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Fleshripper
            EnemyDefinition {
                id: 707,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Restless Shade
            EnemyDefinition {
                id: 708,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Bone Chewer
            EnemyDefinition {
                id: 709,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Nightbane Worgen Alpha
            EnemyDefinition {
                id: 710,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Carrion Recluse
            EnemyDefinition {
                id: 711,
                base_experience: 30,
                death_accumulator: 14.0,
                chest_flag: 1,
            }, // Flesh Eating Abomination
        ],
    },
    ZoneDefinition {
        key: "wsg",
        center: Position::new(1230.0, 1450.0, 310.0),
        radius: 120.0,
        enemies: &[
            EnemyDefinition {
                id: 100,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Burning Imp
            EnemyDefinition {
                id: 101,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Felhound
            EnemyDefinition {
                id: 108,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Fel Bat
            EnemyDefinition {
                id: 103,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Satyr Shadowcaster
            EnemyDefinition {
                id: 102,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Satyr Trickster
            EnemyDefinition {
                id: 104,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Voidwalker
            EnemyDefinition {
                id: 105,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Succubus
            EnemyDefinition {
                id: 109,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Fire Imp
            EnemyDefinition {
                id: 110,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Mana Fiend
            EnemyDefinition {
                id: 106,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Felguard Elite
            EnemyDefinition {
                id: 107,
                base_experience: 30,
                death_accumulator: 14.0,
                chest_flag: 1,
            }, // Infernal
            EnemyDefinition {
                id: 111,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Doomguard
        ],
    },
    ZoneDefinition {
        key: "ungoro",
        center: Position::new(-6720.0, -1920.0, -272.20001220703125),
        radius: 120.0,
        enemies: &[
            EnemyDefinition {
                id: 1200,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Ravasaur Runner
            EnemyDefinition {
                id: 1201,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Young Ravasaur
            EnemyDefinition {
                id: 1202,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Fledgling Pterrordax
            EnemyDefinition {
                id: 1203,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Gorishi Stinger
            EnemyDefinition {
                id: 1204,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Bloodpetal Lasher
            EnemyDefinition {
                id: 1205,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Un'Goro Stomper
            EnemyDefinition {
                id: 1206,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Venomhide Ravasaur
            EnemyDefinition {
                id: 1207,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Frenzied Pterrordax
            EnemyDefinition {
                id: 1208,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Elder Diemetradon
            EnemyDefinition {
                id: 1209,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Ravasaur Hunter
            EnemyDefinition {
                id: 1210,
                base_experience: 30,
                death_accumulator: 14.0,
                chest_flag: 1,
            }, // Un'Goro Thunderer
            EnemyDefinition {
                id: 1211,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Devilsaur
        ],
    },
    ZoneDefinition {
        key: "ab",
        center: Position::new(975.0, 1030.0, -45.0),
        radius: 127.5,
        enemies: &[
            EnemyDefinition {
                id: 1500,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Witherbark Troll
            EnemyDefinition {
                id: 1501,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Plains Creeper
            EnemyDefinition {
                id: 1502,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Mesa Buzzard
            EnemyDefinition {
                id: 1503,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Witherbark Shadowcaster
            EnemyDefinition {
                id: 1504,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Syndicate Mercenary
            EnemyDefinition {
                id: 1505,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Boulderfist Ogre
            EnemyDefinition {
                id: 1506,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Feral Mountain Lion
            EnemyDefinition {
                id: 1507,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Boulderfist Magus
            EnemyDefinition {
                id: 1508,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Boulderfist Brute
            EnemyDefinition {
                id: 1509,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Witherbark Headhunter
            EnemyDefinition {
                id: 1510,
                base_experience: 30,
                death_accumulator: 14.0,
                chest_flag: 1,
            }, // Rumbling Exile
            EnemyDefinition {
                id: 1511,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Boulderfist Enforcer
        ],
    },
    ZoneDefinition {
        key: "feralas",
        center: Position::new(-4680.0, 1300.0, 95.19999694824219),
        radius: 120.0,
        enemies: &[
            EnemyDefinition {
                id: 800,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Woodpaw Mongrel
            EnemyDefinition {
                id: 801,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Longtooth Runner
            EnemyDefinition {
                id: 802,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Sprite Darter
            EnemyDefinition {
                id: 803,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Woodpaw Mystic
            EnemyDefinition {
                id: 804,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Gordunni Ogre
            EnemyDefinition {
                id: 805,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Wildspawn Satyr
            EnemyDefinition {
                id: 806,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Ironfur Bear
            EnemyDefinition {
                id: 807,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Gordunni Ogre-Mage
            EnemyDefinition {
                id: 808,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Feral Scar Yeti
            EnemyDefinition {
                id: 809,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Gordunni Brute
            EnemyDefinition {
                id: 810,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Warpwood Treant
            EnemyDefinition {
                id: 811,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Ironbark Protector
        ],
    },
    ZoneDefinition {
        key: "arena",
        center: Position::new(-13204.0, 274.0, 21.899999618530273),
        radius: 32.0,
        enemies: &[
            EnemyDefinition {
                id: 900,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Gurubashi Scout
            EnemyDefinition {
                id: 901,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Razzashi Raptor
            EnemyDefinition {
                id: 902,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Bloodseeker Bat
            EnemyDefinition {
                id: 903,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Hakkari Shadowcaster
            EnemyDefinition {
                id: 904,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Gurubashi Axe Thrower
            EnemyDefinition {
                id: 905,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Zulian Tiger
            EnemyDefinition {
                id: 906,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Razzashi Serpent
            EnemyDefinition {
                id: 907,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Hakkari Witch Doctor
            EnemyDefinition {
                id: 908,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Son of Hakkar
            EnemyDefinition {
                id: 909,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Gurubashi Berserker
            EnemyDefinition {
                id: 910,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Zulian Crocolisk
            EnemyDefinition {
                id: 911,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Gurubashi Champion
        ],
    },
    ZoneDefinition {
        key: "sm",
        center: Position::new(1045.0, 1396.0, 27.0),
        radius: 150.0,
        enemies: &[
            EnemyDefinition {
                id: 1300,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Scarlet Monk
            EnemyDefinition {
                id: 1301,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Scarlet Tracking Hound
            EnemyDefinition {
                id: 1302,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Scarlet Scout
            EnemyDefinition {
                id: 1303,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Scarlet Adept
            EnemyDefinition {
                id: 1304,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Scarlet Centurion
            EnemyDefinition {
                id: 1305,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Scarlet Defender
            EnemyDefinition {
                id: 1306,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Scarlet Gallant
            EnemyDefinition {
                id: 1307,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Scarlet Wizard
            EnemyDefinition {
                id: 1308,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Scarlet Protector
            EnemyDefinition {
                id: 1309,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Scarlet Myrmidon
            EnemyDefinition {
                id: 1310,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Scarlet Champion
            EnemyDefinition {
                id: 1311,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Scarlet Abbot
        ],
    },
    ZoneDefinition {
        key: "av",
        center: Position::new(-230.0, -290.0, 7.0),
        radius: 135.0,
        enemies: &[
            EnemyDefinition {
                id: 300,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Trogg Tunneler
            EnemyDefinition {
                id: 301,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Starving Frostwolf
            EnemyDefinition {
                id: 308,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Winterax Axe Thrower
            EnemyDefinition {
                id: 303,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Crushridge Ogre Mage
            EnemyDefinition {
                id: 302,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Snowfall Wendigo
            EnemyDefinition {
                id: 304,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Crushridge Brute
            EnemyDefinition {
                id: 305,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Ice Revenant
            EnemyDefinition {
                id: 309,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Winterax Shadow Hunter
            EnemyDefinition {
                id: 310,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Frostwolf Packleader
            EnemyDefinition {
                id: 306,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Alterac Yeti Lord
            EnemyDefinition {
                id: 307,
                base_experience: 30,
                death_accumulator: 14.0,
                chest_flag: 1,
            }, // Mountain Giant
            EnemyDefinition {
                id: 311,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Winterax Warlord
        ],
    },
    ZoneDefinition {
        key: "brm",
        center: Position::new(-7760.0, -1800.0, 132.8000030517578),
        radius: 120.0,
        enemies: &[
            EnemyDefinition {
                id: 1000,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Dark Iron Slaver
            EnemyDefinition {
                id: 1001,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Black Broodling
            EnemyDefinition {
                id: 1002,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Blackrock Grunt
            EnemyDefinition {
                id: 1003,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Dark Iron Geomancer
            EnemyDefinition {
                id: 1004,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Anvilrage Guardsman
            EnemyDefinition {
                id: 1005,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Blazing Elemental
            EnemyDefinition {
                id: 1006,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Firegut Ogre
            EnemyDefinition {
                id: 1007,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Black Wyrmkin
            EnemyDefinition {
                id: 1008,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Fireguard Destroyer
            EnemyDefinition {
                id: 1009,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Core Hound
            EnemyDefinition {
                id: 1010,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Black Drake
            EnemyDefinition {
                id: 1011,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Molten Giant
        ],
    },
    ZoneDefinition {
        key: "aq",
        center: Position::new(-7800.0, 1500.0, 1.5),
        radius: 120.0,
        enemies: &[
            EnemyDefinition {
                id: 1100,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Silithid Swarmer
            EnemyDefinition {
                id: 1101,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Silithid Creeper
            EnemyDefinition {
                id: 1102,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Hive'Zara Stinger
            EnemyDefinition {
                id: 1103,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Twilight Geolord
            EnemyDefinition {
                id: 1104,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Qiraji Gladiator
            EnemyDefinition {
                id: 1105,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Stonelash Scorpid
            EnemyDefinition {
                id: 1106,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Silithid Ravager
            EnemyDefinition {
                id: 1107,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Qiraji Mindslayer
            EnemyDefinition {
                id: 1108,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Dust Stormer
            EnemyDefinition {
                id: 1109,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Qiraji Champion
            EnemyDefinition {
                id: 1110,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Anubisath Sentinel
            EnemyDefinition {
                id: 1111,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Obsidian Destroyer
        ],
    },
    ZoneDefinition {
        key: "naxx",
        center: Position::new(3716.0, -5106.0, 141.3000030517578),
        radius: 44.0,
        enemies: &[
            EnemyDefinition {
                id: 1400,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Plagued Ghoul
            EnemyDefinition {
                id: 1401,
                base_experience: 1,
                death_accumulator: 1.0,
                chest_flag: 0,
            }, // Dread Creeper
            EnemyDefinition {
                id: 1402,
                base_experience: 1,
                death_accumulator: 1.2000000476837158,
                chest_flag: 0,
            }, // Soldier of the Frozen Wastes
            EnemyDefinition {
                id: 1403,
                base_experience: 2,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Naxxramas Cultist
            EnemyDefinition {
                id: 1404,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Carrion Spinner
            EnemyDefinition {
                id: 1405,
                base_experience: 4,
                death_accumulator: 3.0,
                chest_flag: 0,
            }, // Bile Retcher
            EnemyDefinition {
                id: 1406,
                base_experience: 2,
                death_accumulator: 1.5,
                chest_flag: 0,
            }, // Stoneskin Gargoyle
            EnemyDefinition {
                id: 1407,
                base_experience: 3,
                death_accumulator: 2.0,
                chest_flag: 0,
            }, // Naxxramas Acolyte
            EnemyDefinition {
                id: 1408,
                base_experience: 5,
                death_accumulator: 3.5,
                chest_flag: 0,
            }, // Living Monstrosity
            EnemyDefinition {
                id: 1409,
                base_experience: 25,
                death_accumulator: 12.0,
                chest_flag: 1,
            }, // Soul Weaver
            EnemyDefinition {
                id: 1410,
                base_experience: 28,
                death_accumulator: 13.0,
                chest_flag: 1,
            }, // Unstoppable Abomination
            EnemyDefinition {
                id: 1411,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Guardian of Icecrown
            EnemyDefinition {
                id: 1412,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Highlord Mograine
            EnemyDefinition {
                id: 1413,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Thane Korth'azz
            EnemyDefinition {
                id: 1414,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Lady Blaumeux
            EnemyDefinition {
                id: 1415,
                base_experience: 32,
                death_accumulator: 15.0,
                chest_flag: 1,
            }, // Sir Zeliek
        ],
    },
];
