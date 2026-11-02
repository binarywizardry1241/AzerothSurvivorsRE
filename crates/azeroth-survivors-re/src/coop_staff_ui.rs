//! Current StaffName marker updates only the actual name TextColor.
use bevy::prelude::*;

#[derive(Component)]
pub(super) struct Name;

pub(super) fn animate(time: Res<Time>, mut names: Query<(Entity, &mut TextColor), With<Name>>) {
    for (entity, mut color) in &mut names {
        if entity.to_bits() as u32 == 0 { continue; }
        let [r, g, b, a] = azeroth_survivors_re::coop::staff::name_color(
            entity.to_bits(), time.elapsed_secs());
        let next = Color::srgba(r, g, b, a);
        if color.0 != next { color.0 = next; }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use bevy::ecs::system::RunSystemOnce;

    #[test]
    fn only_marked_name_text_changes_and_full_generation_bits_affect_its_phase() {
        let mut world = World::new();
        world.insert_resource(Time::<()>::default());
        let name = world.spawn((Name, Text::new("Guide"), TextColor(Color::WHITE))).id();
        let body = world.spawn((Text::new("message body"), TextColor(Color::WHITE))).id();
        world.run_system_once(animate).unwrap();
        let expected = azeroth_survivors_re::coop::staff::name_color(name.to_bits(), 0.);
        assert_eq!(world.get::<TextColor>(name).unwrap().0,
            Color::srgba(expected[0], expected[1], expected[2], expected[3]));
        assert_eq!(world.get::<TextColor>(body).unwrap().0, Color::WHITE);
        assert_ne!(azeroth_survivors_re::coop::staff::name_color(1, 0.),
            azeroth_survivors_re::coop::staff::name_color(1 | (1u64 << 32), 0.));
    }
}
