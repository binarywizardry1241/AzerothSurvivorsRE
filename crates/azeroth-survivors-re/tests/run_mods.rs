#[path = "../src/run_mods.rs"]
mod run_mods;

#[test]
fn native_density_reward_and_cap_do_not_cap_difficulty() {
    assert_eq!(run_mods::reward([100; 4]), 1.0);
    assert_eq!(run_mods::reward([500, 100, 100, 100]), 1.2);
    assert_eq!(run_mods::reward([100, 100, 100, 150]), 2.0);
    assert_eq!(run_mods::reward([500, 500, 300, 150]), 2.0);
    assert_eq!(run_mods::difficulty([500, 500, 300, 150]), 5.0);
}
