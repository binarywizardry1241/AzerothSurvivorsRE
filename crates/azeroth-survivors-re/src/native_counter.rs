//! Current0.109.0 Game+a60: one wrapping32-bit stream for creatures and objects.
//! The historical Game+954 offset belongs to earlier target evidence.
//!
//! Live synchronous combat can allocate loot while a cast still holds its
//! summon port. Shared handles retain one owner without aliasing mutable Rust
//! references. The relaxed atomic only supplies Send+Sync for the app resource;
//! the native run still visits allocation sites in its recovered sequence.
use std::sync::{
    Arc,
    atomic::{AtomicU64, Ordering},
};

pub trait NativeCounter {
    fn next(&mut self) -> u32;

    /// Pair an allocation with adapter-only chronology. Leaf fixtures using a
    /// plain u32 retain their native counter; the live shared owner retains the
    /// full sequence across native counter and GUID wrap.
    fn next_ordered(&mut self) -> (u32, u64) {
        let value = self.next();
        (value, u64::from(value))
    }
}
impl NativeCounter for u32 {
    fn next(&mut self) -> u32 {
        *self = self.wrapping_add(1);
        *self
    }
}
#[derive(Clone, Debug, Default)]
pub struct SharedCounter(Arc<AtomicU64>);
impl SharedCounter {
    pub fn new(value: u32) -> Self {
        Self(Arc::new(AtomicU64::new(u64::from(value))))
    }
    pub fn value(&self) -> u32 {
        self.sequence() as u32
    }
    /// Internal chronology is never serialized into a native ID or packet.
    pub fn sequence(&self) -> u64 {
        self.0.load(Ordering::Relaxed)
    }
}
impl NativeCounter for SharedCounter {
    fn next(&mut self) -> u32 {
        self.next_ordered().0
    }
    fn next_ordered(&mut self) -> (u32, u64) {
        let sequence = self.0.fetch_add(1, Ordering::Relaxed).wrapping_add(1);
        (sequence as u32, sequence)
    }
}
pub fn creature_guid(entry: u32, counter: &mut dyn NativeCounter) -> u64 {
    creature_guid_with_order(entry, counter).0
}
/// Allocate once, retaining the same operation's chronology for split runtime
/// collections that correspond to one native append-ordered vector.
pub fn creature_guid_with_order(entry: u32, counter: &mut dyn NativeCounter) -> (u64, u64) {
    let (serial, order) = counter.next_ordered();
    let guid = 0xf130_0000_0000_0000
        | (u64::from(entry & 0x00ff_ffff) << 24)
        | u64::from(serial & 0x00ff_ffff);
    (guid, order)
}
pub fn gameobject_guid(entry: u32, counter: &mut dyn NativeCounter) -> u64 {
    0xf110_0000_0000_0000
        | (u64::from(entry & 0x00ff_ffff) << 24)
        | u64::from(counter.next() & 0x00ff_ffff)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn paired_chronology_survives_guid_and_native_counter_wrap() {
        for start in [0x00ff_fffe, 0xffff_fffe, u64::MAX - 1] {
            let mut run = SharedCounter(Arc::new(AtomicU64::new(start)));
            let mut shared = run.clone();
            let (first_guid, first_order) = creature_guid_with_order(600, &mut run);
            // Another allocation through the shared handle must not change
            // the stamp already paired with the first row.
            let second_guid = gameobject_guid(9001, &mut shared);
            let (third_guid, third_order) = creature_guid_with_order(600, &mut run);
            assert_eq!(first_order, start.wrapping_add(1));
            assert_eq!(third_order, start.wrapping_add(3));
            assert_eq!(first_guid & 0x00ff_ffff, first_order & 0x00ff_ffff);
            assert_eq!(second_guid & 0x00ff_ffff, start.wrapping_add(2) & 0x00ff_ffff);
            assert_eq!(third_guid & 0x00ff_ffff, third_order & 0x00ff_ffff);
            assert_eq!(run.value(), start.wrapping_add(3) as u32);
            assert_eq!(shared.sequence(), third_order);
        }
    }

    #[test]
    fn synchronous_loot_and_summon_ports_share_one_wrapping_stream() {
        let mut run=SharedCounter::new(u32::MAX-2);
        let mut loot=run.clone();
        assert_eq!(creature_guid(600,&mut run),0xf130_0002_58ff_fffe);
        assert_eq!(creature_guid(9001,&mut loot),0xf130_0023_29ff_ffff);
        assert_eq!(gameobject_guid(9005,&mut loot),0xf110_0023_2d00_0000);
        let ground=crate::bosses::abilities::ground_object(&mut run,1,10,2.0,crate::enemies::Position::default());
        assert_eq!(ground.guid,0xf100_0000_0000_0001);
        let instance=crate::player_abilities::RuntimeInstance::learned(
            crate::player_abilities::AbilityDefinition::by_key("searing_totem").unwrap());
        let totem=crate::player_abilities::behavior::totems::Totem::new(&instance,0.0,&mut run,crate::enemies::Position::default());
        assert_eq!(totem.guid,0xf130_0025_1c00_0002);
        assert_eq!((run.value(),loot.value()),(2,2));
    }
}
