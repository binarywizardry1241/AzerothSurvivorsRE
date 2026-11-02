//! AS 0.119.0's CreatureSoundData replacement, before the shared voice cache.
//! See docs/analysis/creature-death-sound-0.119.0.md for native bounds and proof.

pub(super) fn patch(bytes: &[u8]) -> Option<Vec<u8>> {
    if bytes.len() < 16 || &bytes[..4] != b"WDBC" {
        return None;
    }
    let word = |at| u32::from_le_bytes(bytes[at..at + 4].try_into().unwrap());
    let rows = word(4);
    let fields = word(8);
    let stride = word(12);
    if fields < 7
        || u64::from(fields) * 4 > u64::from(stride)
        || 20 + u64::from(rows) * u64::from(stride) > bytes.len() as u64
    {
        return None;
    }
    let mut output = bytes.to_vec();
    for row in 0..rows {
        let offset = (20 + u64::from(row) * u64::from(stride) + 24) as usize;
        let death = output.get_mut(offset..offset + 4)?;
        if u32::from_le_bytes([death[0], death[1], death[2], death[3]]) == 8449 {
            death.fill(0);
        }
    }
    Some(output)
}

#[cfg(test)]
mod tests {
    use super::patch;

    #[test]
    fn only_matching_death_columns_change_and_trailing_bytes_survive() {
        let mut bytes = b"WDBC".to_vec();
        for word in [2u32, 7, 32, u32::MAX] {
            bytes.extend_from_slice(&word.to_le_bytes());
        }
        bytes.extend_from_slice(&[0xa5; 64]);
        bytes.extend_from_slice(b"unchanged strings and tail");
        for offset in [20, 44, 76] {
            bytes[offset..offset + 4].copy_from_slice(&8449u32.to_le_bytes());
        }
        let mut expected = bytes.clone();
        expected[44..48].fill(0);
        expected[76..80].fill(0);
        assert_eq!(patch(&bytes), Some(expected));
        assert_eq!(&bytes[44..48], &8449u32.to_le_bytes());
    }

    #[test]
    fn header_and_record_bounds_admit_no_partial_replacement() {
        assert!(patch(b"WDBC").is_none());
        let mut bytes = b"WDBC".to_vec();
        for word in [1u32, 7, 28, 0] {
            bytes.extend_from_slice(&word.to_le_bytes());
        }
        bytes.extend_from_slice(&[0; 28]);
        assert!(patch(&bytes).is_some());
        assert!(patch(&bytes[..47]).is_none());
        bytes[8..12].copy_from_slice(&8u32.to_le_bytes());
        assert!(patch(&bytes).is_none());
        bytes[8..12].copy_from_slice(&6u32.to_le_bytes());
        assert!(patch(&bytes).is_none());
    }
}
