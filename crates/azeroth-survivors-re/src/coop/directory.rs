//! Public lobby snapshots from the current directory service.
//!
//! The 0.115.0 receiver admits only `type: "lobbies"`, replaces the whole
//! snapshot and orders titled hosts before untitled hosts. See the hash-bound
//! parser and receiver evidence in docs/analysis/coop.md.
use serde_json::Value;

#[derive(Clone, Debug, PartialEq, Eq)]
pub struct DirectoryLobby {
    pub code: String,
    pub name: String,
    pub description: String,
    pub host_title: String,
    pub classes: Vec<u8>,
    pub hero: String,
    pub class: String,
    pub zone: String,
    /// Native signed JSON rank; absent/noninteger values use -1 (unknown).
    pub heroic: i64,
    pub difficulty: String,
    /// Native prerequisite explanation: "zone", "heroic", or empty.
    pub lacks: String,
    pub opened: bool,
    pub players: u64,
    pub max: u64,
    pub locked: bool,
    pub country: String,
}

impl DirectoryLobby {
    fn read(value: &Value) -> Self {
        let string = |key| value[key].as_str().unwrap_or_default().to_owned();
        Self {
            code: string("code"),
            name: string("name"),
            description: string("description"),
            host_title: string("hostTitle"),
            classes: value["classes"]
                .as_array()
                .into_iter()
                .flatten()
                .filter_map(Value::as_u64)
                .map(|class| class as u8)
                .collect(),
            hero: string("hero"),
            class: string("class"),
            zone: string("zone"),
            heroic: value["heroic"].as_i64().unwrap_or(-1),
            difficulty: string("difficulty"),
            lacks: string("lacks"),
            opened: value["opened"].as_bool().unwrap_or(true),
            players: value["players"].as_u64().unwrap_or(1),
            max: value["max"].as_u64().unwrap_or(5),
            locked: value["locked"].as_bool().unwrap_or(false),
            country: string("country"),
        }
    }
}

#[derive(Default)]
pub struct LobbyDirectory {
    /// None is the native initial state, before the first lobbies message.
    pub snapshot: Option<Vec<DirectoryLobby>>,
    pub revision: u64,
}

impl LobbyDirectory {
    /// Unrelated message types leave the last directory snapshot untouched.
    pub fn accept(&mut self, message: &Value) -> bool {
        if message["type"].as_str() != Some("lobbies") {
            return false;
        }
        let mut rows: Vec<_> = message["list"]
            .as_array()
            .into_iter()
            .flatten()
            .map(DirectoryLobby::read)
            .collect();
        // Stable sort: rows with equal title presence retain service order.
        rows.sort_by_key(|row| row.host_title.is_empty());
        self.snapshot = Some(rows);
        self.revision = self.revision.wrapping_add(1);
        true
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn directory_replaces_only_an_exact_received_snapshot() {
        let mut directory = LobbyDirectory::default();
        assert!(!directory.accept(&json!({"type": "party", "list": []})));
        assert!(directory.snapshot.is_none());
        assert!(directory.accept(&json!({"type": "lobbies", "list": [{"code": "A"}]})));
        assert!(!directory.accept(&json!({"type": "Lobbies", "list": []})));
        assert_eq!(directory.snapshot.as_ref().unwrap()[0].code, "A");
        assert!(directory.accept(&json!({"type": "lobbies", "list": null})));
        assert_eq!(directory.snapshot, Some(Vec::new()));
        assert_eq!(directory.revision, 2);
    }

    #[test]
    fn received_values_keep_native_defaults_width_and_stable_title_order() {
        let mut directory = LobbyDirectory::default();
        directory.accept(&json!({"type": "lobbies", "list": [
            {"code": "A"},
            {"code": "B", "hostTitle": "Host", "classes": [1, 257, -1, 1.0, "2"],
             "players": u64::MAX, "max": 0, "opened": false, "locked": true},
            null,
            {"code": "C", "hostTitle": "Host"}
        ]}));
        let rows = directory.snapshot.unwrap();
        assert_eq!(rows.iter().map(|row| row.code.as_str()).collect::<Vec<_>>(),
            ["B", "C", "A", ""]);
        assert_eq!(rows[0].classes, [1, 1]);
        assert_eq!(rows[0].players, u64::MAX);
        assert_eq!(rows[0].max, 0);
        assert!(!rows[0].opened);
        assert!(rows[0].locked);
        assert!(rows[3].opened);
        assert!(!rows[3].locked);
        assert_eq!((rows[3].players, rows[3].max), (1, 5));
        assert_eq!(rows[3].heroic, -1);
        assert!(rows[3].difficulty.is_empty());
        assert!(rows[3].lacks.is_empty());
    }

    #[test]
    fn received_difficulty_keeps_signed_rank_and_explicit_prerequisite() {
        let mut directory = LobbyDirectory::default();
        directory.accept(&json!({"type":"lobbies","list":[
            {"heroic":2,"difficulty":"Heroic II","lacks":"heroic","opened":false},
            {"heroic":-2}, {"heroic":u64::MAX}, {"heroic":1.5}
        ]}));
        let rows = directory.snapshot.unwrap();
        assert_eq!(rows.iter().map(|row| row.heroic).collect::<Vec<_>>(), [2,-2,-1,-1]);
        assert_eq!(rows[0].difficulty, "Heroic II");
        assert_eq!(rows[0].lacks, "heroic");
        assert!(!rows[0].opened);
    }
}
