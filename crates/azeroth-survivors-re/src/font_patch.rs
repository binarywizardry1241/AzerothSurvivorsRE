//! TrueType augmentation recovered from 0.100.1 function 0x1455181d0.
//! Existing mappings are retained; missing accents, mirrored glyphs and aliases follow
//! the target's three tables. Evidence: docs/analysis/mixed-script-fonts.md.

use std::collections::BTreeMap;

type Tables = BTreeMap<[u8; 4], Vec<u8>>;
const COMPOSITES: [(u16, u16, u16, u8); 41] = [
    (0x61, 0x105, 0x2db, 1),
    (0x41, 0x104, 0x2db, 1),
    (0x65, 0x119, 0x2db, 1),
    (0x45, 0x118, 0x2db, 1),
    (0x63, 0x107, 0xb4, 0),
    (0x43, 0x106, 0xb4, 0),
    (0x6e, 0x144, 0xb4, 0),
    (0x4e, 0x143, 0xb4, 0),
    (0x73, 0x15b, 0xb4, 0),
    (0x53, 0x15a, 0xb4, 0),
    (0x7a, 0x17a, 0xb4, 0),
    (0x5a, 0x179, 0xb4, 0),
    (0x7a, 0x17c, 0x2d9, 0),
    (0x5a, 0x17b, 0x2d9, 0),
    (0x6f, 0xf3, 0xb4, 0),
    (0x4f, 0xd3, 0xb4, 0),
    (0x67, 0x11f, 0x2d8, 0),
    (0x47, 0x11e, 0x2d8, 0),
    (0x73, 0x15f, 0xb8, 2),
    (0x53, 0x15e, 0xb8, 2),
    (0x49, 0x130, 0x2d9, 0),
    (0x61, 0x103, 0x2d8, 0),
    (0x41, 0x102, 0x2d8, 0),
    (0x73, 0x219, 0x2c, 3),
    (0x53, 0x218, 0x2c, 3),
    (0x74, 0x21b, 0x2c, 3),
    (0x54, 0x21a, 0x2c, 3),
    (0x63, 0x10d, 0x2c7, 0),
    (0x43, 0x10c, 0x2c7, 0),
    (0x65, 0x11b, 0x2c7, 0),
    (0x45, 0x11a, 0x2c7, 0),
    (0x6e, 0x148, 0x2c7, 0),
    (0x4e, 0x147, 0x2c7, 0),
    (0x72, 0x159, 0x2c7, 0),
    (0x52, 0x158, 0x2c7, 0),
    (0x44, 0x10e, 0x2c7, 0),
    (0x54, 0x164, 0x2c7, 0),
    (0x64, 0x10f, 0x2019, 4),
    (0x74, 0x165, 0x2019, 4),
    (0x75, 0x16f, 0x2da, 0),
    (0x55, 0x16e, 0x2da, 0),
];
const MIRRORS: [(u16, u16); 2] = [(0x454, 0x44d), (0x404, 0x42d)];
const ALIASES: [(u16, u16); 6] = [
    (0x456, 0x69),
    (0x406, 0x49),
    (0x457, 0xef),
    (0x407, 0xcf),
    (0x491, 0x433),
    (0x490, 0x413),
];
fn u16_at(data: &[u8], at: usize) -> Result<u16, String> {
    data.get(at..at + 2)
        .map(|v| u16::from_be_bytes([v[0], v[1]]))
        .ok_or_else(|| "Truncated TrueType u16".into())
}
fn i16_at(data: &[u8], at: usize) -> Result<i16, String> {
    Ok(u16_at(data, at)? as i16)
}
fn u32_at(data: &[u8], at: usize) -> Result<u32, String> {
    data.get(at..at + 4)
        .map(|v| u32::from_be_bytes([v[0], v[1], v[2], v[3]]))
        .ok_or_else(|| "Truncated TrueType u32".into())
}
fn put16(data: &mut [u8], at: usize, value: u16) {
    data[at..at + 2].copy_from_slice(&value.to_be_bytes());
}
fn put32(data: &mut [u8], at: usize, value: u32) {
    data[at..at + 4].copy_from_slice(&value.to_be_bytes());
}
fn word(data: &mut Vec<u8>, value: u16) {
    data.extend_from_slice(&value.to_be_bytes());
}
fn dword(data: &mut Vec<u8>, value: u32) {
    data.extend_from_slice(&value.to_be_bytes());
}
fn table<'a>(tables: &'a Tables, tag: &[u8; 4]) -> Result<&'a [u8], String> {
    tables
        .get(tag)
        .map(Vec::as_slice)
        .ok_or_else(|| format!("Missing TrueType {}", String::from_utf8_lossy(tag)))
}
fn checksum(data: &[u8]) -> u32 {
    data.chunks(4).fold(0u32, |sum, chunk| {
        let mut word = [0; 4];
        word[..chunk.len()].copy_from_slice(chunk);
        sum.wrapping_add(u32::from_be_bytes(word))
    })
}
fn read_tables(data: &[u8]) -> Result<(u32, Tables), String> {
    let scaler = u32_at(data, 0)?;
    if !matches!(scaler, 0x00010000 | 0x74727565) {
        return Err("Native augmentation requires a TrueType outline font".into());
    }
    let mut tables = Tables::new();
    for row in 0..usize::from(u16_at(data, 4)?) {
        let at = 12 + row * 16;
        let tag = data
            .get(at..at + 4)
            .ok_or("Truncated TrueType directory")?
            .try_into()
            .unwrap();
        let offset = u32_at(data, at + 8)? as usize;
        let size = u32_at(data, at + 12)? as usize;
        tables.insert(
            tag,
            data.get(offset..offset.checked_add(size).ok_or("TrueType table overflow")?)
                .ok_or("Truncated TrueType table")?
                .to_vec(),
        );
    }
    Ok((scaler, tables))
}
fn cmap(data: &[u8]) -> Result<BTreeMap<u32, u16>, String> {
    let mut map = BTreeMap::new();
    // Native base fonts use Unicode BMP mappings. Keep format12 mappings as well when present.
    for format in [4, 12] {
        for row in 0..usize::from(u16_at(data, 2)?) {
            let at = 4 + row * 8;
            let platform = u16_at(data, at)?;
            let encoding = u16_at(data, at + 2)?;
            if platform != 0 && !(platform == 3 && matches!(encoding, 1 | 10)) {
                continue;
            }
            let off = u32_at(data, at + 4)? as usize;
            if u16_at(data, off)? != format {
                continue;
            }
            if format == 4 {
                let count = usize::from(u16_at(data, off + 6)?) / 2;
                for i in 0..count {
                    let end = u16_at(data, off + 14 + i * 2)?;
                    let start = u16_at(data, off + 16 + count * 2 + i * 2)?;
                    let delta = u16_at(data, off + 16 + count * 4 + i * 2)?;
                    let range_at = off + 16 + count * 6 + i * 2;
                    let range = usize::from(u16_at(data, range_at)?);
                    for code in start..=end {
                        if code == 0xffff {
                            continue;
                        }
                        let glyph = if range == 0 {
                            code.wrapping_add(delta)
                        } else {
                            let id =
                                u16_at(data, range_at + range + usize::from(code - start) * 2)?;
                            if id == 0 { 0 } else { id.wrapping_add(delta) }
                        };
                        if glyph != 0 {
                            map.insert(u32::from(code), glyph);
                        }
                    }
                }
            } else {
                for i in 0..u32_at(data, off + 12)? as usize {
                    let at = off + 16 + i * 12;
                    let start = u32_at(data, at)?;
                    let end = u32_at(data, at + 4)?;
                    let glyph = u32_at(data, at + 8)?;
                    if end > 0x10ffff || end < start {
                        return Err("Invalid TrueType cmap range".into());
                    }
                    for code in start..=end {
                        let id = glyph + code - start;
                        if id <= u32::from(u16::MAX) && id != 0 {
                            map.insert(code, id as u16);
                        }
                    }
                }
            }
        }
    }
    if map.is_empty() {
        return Err("No supported Unicode TrueType cmap".into());
    }
    Ok(map)
}
fn write_cmap(map: &BTreeMap<u32, u16>) -> Vec<u8> {
    // Format12 represents each retained mapping without changing glyph selection. A BMP
    // format4 table is also supplied for consumers that do not use the UCS-4 record.
    let bmp: Vec<_> = map.iter().filter(|(code, _)| **code < 0xffff).collect();
    let count = bmp.len() + 1;
    let mut format4 = Vec::new();
    word(&mut format4, 4);
    word(&mut format4, (16 + count * 8) as u16);
    word(&mut format4, 0);
    word(&mut format4, (count * 2) as u16);
    let power = 1usize << count.ilog2();
    word(&mut format4, (power * 2) as u16);
    word(&mut format4, count.ilog2() as u16);
    word(&mut format4, ((count - power) * 2) as u16);
    for (code, _) in &bmp {
        word(&mut format4, **code as u16);
    }
    word(&mut format4, 0xffff);
    word(&mut format4, 0);
    for (code, _) in &bmp {
        word(&mut format4, **code as u16);
    }
    word(&mut format4, 0xffff);
    for (code, glyph) in &bmp {
        word(&mut format4, (**glyph).wrapping_sub(**code as u16));
    }
    word(&mut format4, 1);
    for _ in 0..count {
        word(&mut format4, 0);
    }
    let mut format12 = Vec::new();
    word(&mut format12, 12);
    word(&mut format12, 0);
    dword(&mut format12, (16 + map.len() * 12) as u32);
    dword(&mut format12, 0);
    dword(&mut format12, map.len() as u32);
    for (&code, &glyph) in map {
        dword(&mut format12, code);
        dword(&mut format12, code);
        dword(&mut format12, u32::from(glyph));
    }
    let mut output = Vec::new();
    word(&mut output, 0);
    word(&mut output, 2);
    word(&mut output, 3);
    word(&mut output, 1);
    dword(&mut output, 20);
    word(&mut output, 3);
    word(&mut output, 10);
    dword(&mut output, (20 + format4.len()) as u32);
    output.extend(format4);
    output.extend(format12);
    output
}
fn glyph_box(glyph: &[u8]) -> Option<[i16; 4]> {
    if glyph.len() < 10 {
        return None;
    }
    Some([
        i16_at(glyph, 2).ok()?,
        i16_at(glyph, 4).ok()?,
        i16_at(glyph, 6).ok()?,
        i16_at(glyph, 8).ok()?,
    ])
}
fn coordinate(value: f32) -> i16 {
    value.round().clamp(-32768.0, 32767.0) as i16
}
fn composite(
    base_id: u16,
    mark_id: u16,
    base: [i16; 4],
    mark: [i16; 4],
    mode: u8,
    units: f32,
) -> (Vec<u8>, i16) {
    let x = if mode == 1 {
        (f32::from(base[2]) - f32::from(mark[2]))
            + (f32::from(mark[2]) - f32::from(mark[0])) * -0.15
    } else if mode == 4 {
        f32::from(base[2]) + units * 0.02 - f32::from(mark[0])
    } else {
        (f32::from(base[0]) + f32::from(base[2])) * 0.5
            - (f32::from(mark[0]) + f32::from(mark[2])) * 0.5
    };
    let y = match mode {
        0 => f32::from(base[3]) + units * 0.05 - f32::from(mark[1]),
        1 => units * 0.01 - f32::from(mark[3]),
        3 => units * -0.06 - f32::from(mark[3]),
        4 => f32::from(base[3]) - f32::from(mark[3]),
        _ => units * 0.02 - f32::from(mark[3]),
    };
    let (x, y) = (coordinate(x), coordinate(y));
    let bounds = [
        base[0].min(mark[0].saturating_add(x)),
        base[1].min(mark[1].saturating_add(y)),
        base[2].max(mark[2].saturating_add(x)),
        base[3].max(mark[3].saturating_add(y)),
    ];
    let mut bytes = Vec::new();
    word(&mut bytes, 0xffff);
    for value in bounds {
        word(&mut bytes, value as u16);
    }
    for value in [0x227, base_id, 0, 0, 7, mark_id, x as u16, y as u16] {
        word(&mut bytes, value);
    }
    (bytes, bounds[0])
}

fn mirrored(donor: u16, bounds: [i16; 4]) -> Vec<u8> {
    let mut bytes = Vec::new();
    word(&mut bytes, 0xffff);
    for value in bounds {
        word(&mut bytes, value as u16);
    }
    for value in [
        0x1247,
        donor,
        bounds[0].saturating_add(bounds[2]) as u16,
        0,
        0xc000,
        0x4000,
    ] {
        word(&mut bytes, value);
    }
    bytes
}

fn composite_advance(base: u16, mark: [i16; 4], mode: u8, units: f32) -> u16 {
    if mode == 4 {
        // Native0.109.0 1458f9f77: the side apostrophe widens ď/ť by
        // its own outline width plus spacing, independently of x placement.
        let extra = (f32::from(mark[2]) - f32::from(mark[0]) + units * 0.02)
            .round().clamp(0.0, 65535.0) as u16;
        base.saturating_add(extra)
    } else {
        base
    }
}

pub fn augment(data: Vec<u8>) -> Result<Vec<u8>, String> {
    let (scaler, mut tables) = read_tables(&data)?;
    let mut mapping = cmap(table(&tables, b"cmap")?)?;
    let count = usize::from(u16_at(table(&tables, b"maxp")?, 4)?);
    let units = f32::from(u16_at(table(&tables, b"head")?, 18)?);
    let long_loca = i16_at(table(&tables, b"head")?, 50)? != 0;
    let mut glyphs = Vec::with_capacity(count + COMPOSITES.len() + MIRRORS.len());
    let loca = table(&tables, b"loca")?;
    let glyf = table(&tables, b"glyf")?;
    let offset = |i: usize| -> Result<usize, String> {
        if long_loca {
            Ok(u32_at(loca, i * 4)? as usize)
        } else {
            Ok(usize::from(u16_at(loca, i * 2)?) * 2)
        }
    };
    for i in 0..count {
        glyphs.push(
            glyf.get(offset(i)?..offset(i + 1)?)
                .ok_or("Invalid TrueType glyph offset")?
                .to_vec(),
        );
    }
    let metric_count = usize::from(u16_at(table(&tables, b"hhea")?, 34)?);
    if metric_count == 0 || metric_count > count {
        return Err("Invalid TrueType horizontal metric count".into());
    }
    let hmtx = table(&tables, b"hmtx")?;
    let mut metrics = Vec::with_capacity(count + COMPOSITES.len());
    for i in 0..count {
        let advance = u16_at(hmtx, i.min(metric_count - 1) * 4)?;
        let bearing = i16_at(
            hmtx,
            if i < metric_count {
                i * 4 + 2
            } else {
                metric_count * 4 + (i - metric_count) * 2
            },
        )?;
        metrics.push((advance, bearing));
    }
    for (base, target, mark, mode) in COMPOSITES {
        if mapping.contains_key(&u32::from(target)) {
            continue;
        }
        let Some((&base_id, &mark_id)) = mapping
            .get(&u32::from(base))
            .zip(mapping.get(&u32::from(mark)))
        else {
            continue;
        };
        let Some(base_box) = glyphs.get(usize::from(base_id)).and_then(|v| glyph_box(v)) else {
            continue;
        };
        let Some(mark_box) = glyphs.get(usize::from(mark_id)).and_then(|v| glyph_box(v)) else {
            continue;
        };
        let id = u16::try_from(glyphs.len()).map_err(|_| "Too many TrueType glyphs")?;
        let (glyph, bearing) = composite(base_id, mark_id, base_box, mark_box, mode, units);
        glyphs.push(glyph);
        metrics.push((composite_advance(metrics[usize::from(base_id)].0, mark_box, mode, units), bearing));
        mapping.insert(u32::from(target), id);
    }
    for (target, donor) in MIRRORS {
        if mapping.contains_key(&u32::from(target)) {
            continue;
        }
        let Some(&donor_id) = mapping.get(&u32::from(donor)) else {
            continue;
        };
        let Some(bounds) = glyphs.get(usize::from(donor_id)).and_then(|v| glyph_box(v)) else {
            continue;
        };
        let id = u16::try_from(glyphs.len()).map_err(|_| "Too many TrueType glyphs")?;
        glyphs.push(mirrored(donor_id, bounds));
        metrics.push((metrics[usize::from(donor_id)].0, bounds[0]));
        mapping.insert(u32::from(target), id);
    }
    let mut aliases_added = false;
    for (target, donor) in ALIASES {
        if !mapping.contains_key(&u32::from(target)) {
            if let Some(&id) = mapping.get(&u32::from(donor)) {
                mapping.insert(u32::from(target), id);
                aliases_added = true;
            }
        }
    }
    if glyphs.len() == count && !aliases_added {
        return Ok(data);
    }
    // Native 0.121.0 omits these original tables after changing glyphs/mappings.
    // Their signatures and glyph-dependent caches do not describe the new font.
    for tag in [b"DSIG", b"LTSH", b"VDMX", b"hdmx"] {
        tables.remove(tag);
    }
    let mut glyf = Vec::new();
    let mut loca = Vec::new();
    let mut hmtx = Vec::new();
    for glyph in &glyphs {
        dword(&mut loca, glyf.len() as u32);
        glyf.extend(glyph);
        while glyf.len() % 4 != 0 {
            glyf.push(0);
        }
    }
    dword(&mut loca, glyf.len() as u32);
    for &(advance, bearing) in &metrics {
        word(&mut hmtx, advance);
        word(&mut hmtx, bearing as u16);
    }
    let head = tables.get_mut(b"head").unwrap();
    put16(head, 50, 1);
    put32(head, 8, 0);
    let maxp = tables.get_mut(b"maxp").unwrap();
    put16(maxp, 4, glyphs.len() as u16);
    if maxp.len() >= 32 {
        // Native 0x145506958 onward raises these existing maxima for two components.
        let points = u16_at(maxp, 10)?.max(u16_at(maxp, 6)?.saturating_mul(2));
        let contours = u16_at(maxp, 12)?.max(u16_at(maxp, 8)?.saturating_mul(2));
        let components = u16_at(maxp, 28)?.max(2);
        let depth = u16_at(maxp, 30)?.max(1);
        put16(maxp, 10, points);
        put16(maxp, 12, contours);
        put16(maxp, 28, components);
        put16(maxp, 30, depth);
    }
    put16(tables.get_mut(b"hhea").unwrap(), 34, glyphs.len() as u16);
    let post = tables.get_mut(b"post").ok_or("Missing TrueType post")?;
    if post.len() < 32 {
        return Err("Truncated TrueType post".into());
    }
    post.truncate(32);
    put32(post, 0, 0x00030000);
    tables.insert(*b"glyf", glyf);
    tables.insert(*b"loca", loca);
    tables.insert(*b"hmtx", hmtx);
    tables.insert(*b"cmap", write_cmap(&mapping));
    let count = tables.len();
    let mut output = vec![0u8; 12 + count * 16];
    put32(&mut output, 0, scaler);
    put16(&mut output, 4, count as u16);
    let power = 1usize << count.ilog2();
    put16(&mut output, 6, (power * 16) as u16);
    put16(&mut output, 8, count.ilog2() as u16);
    put16(&mut output, 10, ((count - power) * 16) as u16);
    let mut head_offset = 0;
    for (i, (tag, bytes)) in tables.iter().enumerate() {
        let at = 12 + i * 16;
        let offset = output.len();
        output[at..at + 4].copy_from_slice(tag);
        put32(&mut output, at + 4, checksum(bytes));
        put32(&mut output, at + 8, offset as u32);
        put32(&mut output, at + 12, bytes.len() as u32);
        if tag == b"head" {
            head_offset = offset;
        }
        output.extend(bytes);
        while output.len() % 4 != 0 {
            output.push(0);
        }
    }
    let adjustment = 0xb1b0afbau32.wrapping_sub(checksum(&output));
    put32(&mut output, head_offset + 8, adjustment);
    Ok(output)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn native_components_have_recovered_positions_and_flags() {
        let (bytes, left) = composite(12, 31, [10, -20, 410, 600], [50, 100, 150, 200], 0, 1000.0);
        assert_eq!(left, 10);
        assert_eq!(i16_at(&bytes, 22).unwrap(), 110);
        assert_eq!(i16_at(&bytes, 24).unwrap(), 550);
        assert_eq!(u16_at(&bytes, 10).unwrap(), 0x227);
        assert_eq!(u16_at(&bytes, 18).unwrap(), 7);
        let (ogonek, _) = composite(12, 31, [10, -20, 410, 600], [50, 100, 150, 200], 1, 1000.0);
        assert_eq!(i16_at(&ogonek, 22).unwrap(), 245);
        assert_eq!(i16_at(&ogonek, 24).unwrap(), -190);
        let (comma, _) = composite(12, 31, [10, -20, 410, 600], [50, 100, 150, 200], 3, 1000.0);
        assert_eq!(i16_at(&comma, 22).unwrap(), 110);
        assert_eq!(i16_at(&comma, 24).unwrap(), -260);
    }
    #[test]
    fn czech_apostrophe_is_right_of_stem_and_aligned_at_top() {
        let (bytes, _) = composite(12, 31, [10, -20, 410, 600], [50, 100, 150, 200], 4, 1000.0);
        assert_eq!(i16_at(&bytes, 22).unwrap(), 380);
        assert_eq!(i16_at(&bytes, 24).unwrap(), 400);
        assert_eq!(glyph_box(&bytes), Some([10, -20, 530, 600]));
    }

    #[test]
    fn side_apostrophe_advance_matches_current_native_width_and_saturation() {
        let evidence: serde_json::Value = serde_json::from_str(include_str!(
            "../../../docs/analysis/evidence/menu-fonts/manifest.json"
        )).unwrap();
        for case in evidence["contracts"]["native_cases"]["advance"].as_array().unwrap() {
            let mark = [case["mark_xmin"].as_i64().unwrap() as i16, 0,
                case["mark_xmax"].as_i64().unwrap() as i16, 0];
            assert_eq!(composite_advance(case["base_advance"].as_u64().unwrap() as u16,
                mark, case["mode"].as_u64().unwrap() as u8, case["units"].as_f64().unwrap() as f32),
                case["native_advance"].as_u64().unwrap() as u16);
        }
    }

    #[test]
    fn native_ukrainian_mirror_retains_bounds_and_uses_recovered_transform() {
        let bytes = mirrored(17, [10, -20, 410, 600]);
        assert_eq!(glyph_box(&bytes), Some([10, -20, 410, 600]));
        assert_eq!(u16_at(&bytes, 10).unwrap(), 0x1247);
        assert_eq!(u16_at(&bytes, 12).unwrap(), 17);
        assert_eq!(i16_at(&bytes, 14).unwrap(), 420);
        assert_eq!(i16_at(&bytes, 16).unwrap(), 0);
        assert_eq!(u16_at(&bytes, 18).unwrap(), 0xc000);
        assert_eq!(u16_at(&bytes, 20).unwrap(), 0x4000);
    }
}
