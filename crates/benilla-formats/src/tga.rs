//! TGA decoding for Azeroth Survivors UI artwork. The 0.113.2 decoder at
//! `0x145c30ed0` admits truecolour depths 24/32 independently of the descriptor's alpha count;
//! 32-bit pixels retain their fourth byte as alpha. Both origin bits orient the output.
//! See `docs/analysis/addon-gold-texture-0.113.2.md` for the hash-bound native contract.
//!
//! The separate texture-size gate uses the current 1..=8192 dimension range. Its header/id/map
//! probe and the caller's failure fallback retain their historical Vanilla evidence; the
//! current decoder's depth/alpha rules are recovered independently.
//!
//! [`tga_to_rgba`] checks the header before the pixels, so it can serve as the fallback after a
//! failed `BLP2` sniff: TGA has no magic.

use anyhow::{bail, Result};

/// A colour-map entry's bytes as the reference sizes it (`0x5a3b40`, `0x5a36e1`-`0x5a3760`).
fn reference_map_entry_bytes(bits: u8) -> usize {
    (usize::from(bits) / 3).min(8) * 3 / 8
}

/// How much of a file [`tga_texture_size`] needs: it answers the same for this many leading bytes
/// as for the whole, since it asks only that the 18-byte header, an id of at most 255 bytes and one
/// byte after it are there.
pub const TGA_GATE_PREFIX: usize = 18 + 255 + 1;

/// The TGA header size used by interface-texture admission. The selected Azeroth Survivors
/// 0.113.2 loader decodes TGA directly
/// (`0x142207c15` into `0x145c30ed0`), admitting every nonzero dimension through 8192
/// (`0x145c31088`-`0x145c310aa`). The original Vanilla power-of-two / below-1024 device gate
/// is not this target's contract: it rejects the addon's 1024-wide rims and 2048-wide rail.
/// See `docs/analysis/jewelry-texture-admission-0.113.2.md` for the hash-bound recovery.
/// Header/id/map handling and the caller's opaque-white fallback retain their historical
/// Vanilla contracts (`0x5a3660`, `0x44a260`); those are separate from the dimension repair.
pub fn tga_texture_size(bytes: &[u8]) -> Option<(u32, u32)> {
    let header = bytes.get(..18)?;
    let id_length = usize::from(header[0]);
    let map_bytes = if header[1] != 0 {
        reference_map_entry_bytes(header[7])
            * usize::from(u16::from_le_bytes([header[5], header[6]]))
    } else {
        0
    };
    let after_header = bytes.len() - 18;
    if id_length > 0 && after_header == 0 {
        return None;
    }
    if map_bytes > 0 && after_header.saturating_sub(id_length) == 0 {
        return None;
    }
    let width = u32::from(u16::from_le_bytes([header[12], header[13]]));
    let height = u32::from(u16::from_le_bytes([header[14], header[15]]));
    let fits = |n: u32| (1..=8192).contains(&n);
    (fits(width) && fits(height)).then_some((width, height))
}

/// Decode a TGA to RGBA8 `(width, height, pixels)`, rows top-down like [`crate::blp_to_rgba`].
pub fn tga_to_rgba(bytes: &[u8]) -> Result<(u32, u32, Vec<u8>)> {
    let Some(header) = bytes.get(..18) else {
        bail!("TGA: truncated header ({} bytes)", bytes.len());
    };
    let id_length = header[0] as usize;
    let color_map_type = header[1];
    let image_type = header[2];
    let color_map_origin = u16::from_le_bytes([header[3], header[4]]) as usize;
    let color_map_len = u16::from_le_bytes([header[5], header[6]]) as usize;
    let color_map_entry_bits = header[7] as usize;
    let width = u16::from_le_bytes([header[12], header[13]]) as u32;
    let height = u16::from_le_bytes([header[14], header[15]]) as u32;
    let bpp = header[16];
    let descriptor = header[17];

    let rle = match image_type {
        1..=3 => false,
        9..=11 => true,
        t => bail!("TGA: unknown image type {t}"),
    };
    let paletted = matches!(image_type, 1 | 9);
    let grayscale = matches!(image_type, 3 | 11);
    // Current native admission uses the depth, without subtracting descriptor alpha bits
    // (`0x145c31008..0x145c31088`). A colour-mapped pixel is an index into its own entry width.
    let bytes_per_pixel = match (bpp, paletted, grayscale) {
        (8, true, _) => 1,
        (24, false, false) => 3,
        (32, false, false) => 4,
        (8, false, true) => 1,
        _ => bail!("TGA: unsupported depth {bpp} for image type {image_type}"),
    };
    if paletted && color_map_type != 1 {
        bail!("TGA: image type {image_type} is colour-mapped but declares no colour map");
    }
    let map_entry_bytes = color_map_entry_bits.div_ceil(8);
    if paletted && !matches!(color_map_entry_bits, 15 | 16 | 24 | 32) {
        bail!("TGA: unsupported colour-map entry width {color_map_entry_bits}");
    }
    if width == 0 || height == 0 || width > 8192 || height > 8192 {
        bail!("TGA: implausible dimensions {width}x{height}");
    }

    // The pixels start after the id field and any colour map, which a colour-mapped image reads
    // on the way (`0x5a3b40`: `entryBytes * colorMapLength + idLength + 0x12`).
    let map_bytes = if color_map_type == 1 {
        color_map_len * map_entry_bytes
    } else {
        0
    };
    let palette = if paletted {
        let Some(p) = bytes.get(18 + id_length..18 + id_length + map_bytes) else {
            bail!("TGA: truncated colour map");
        };
        p
    } else {
        &[][..]
    };
    let data_start = 18 + id_length + map_bytes;
    let Some(data) = bytes.get(data_start..) else {
        bail!("TGA: truncated before pixel data");
    };

    let pixel_count = (width as usize) * (height as usize);
    let mut pixels = Vec::with_capacity(pixel_count * bytes_per_pixel);
    if rle {
        // An RLE packet's bit 7 marks a run of one pixel, else `count` raw pixels follow; `count`
        // is the low 7 bits plus 1.
        let mut at = 0usize;
        while pixels.len() < pixel_count * bytes_per_pixel {
            let Some(&packet) = data.get(at) else {
                bail!("TGA: RLE stream truncated");
            };
            at += 1;
            let count = ((packet & 0x7f) as usize) + 1;
            if packet & 0x80 != 0 {
                let Some(px) = data.get(at..at + bytes_per_pixel) else {
                    bail!("TGA: RLE run truncated");
                };
                at += bytes_per_pixel;
                for _ in 0..count {
                    pixels.extend_from_slice(px);
                }
            } else {
                let n = count * bytes_per_pixel;
                let Some(px) = data.get(at..at + n) else {
                    bail!("TGA: RLE raw packet truncated");
                };
                at += n;
                pixels.extend_from_slice(px);
            }
        }
        pixels.truncate(pixel_count * bytes_per_pixel);
    } else {
        let n = pixel_count * bytes_per_pixel;
        let Some(px) = data.get(..n) else {
            bail!("TGA: pixel data truncated");
        };
        pixels.extend_from_slice(px);
    }

    // BGR(A) or gray → RGBA, top-left first. Native row selection uses bit 5 and column
    // selection uses bit 4 (`0x145c317ba..0x145c3181a` for 32-bit truecolour).
    let top_down = descriptor & 0x20 != 0;
    let right_to_left = descriptor & 0x10 != 0;
    let mut rgba = vec![0u8; pixel_count * 4];
    for y in 0..height as usize {
        let src_y = if top_down { y } else { height as usize - 1 - y };
        for x in 0..width as usize {
            let src_x = if right_to_left {
                width as usize - 1 - x
            } else {
                x
            };
            let s = (src_y * width as usize + src_x) * bytes_per_pixel;
            let d = (y * width as usize + x) * 4;
            if paletted {
                // `0x5a3820`: `palette + (index - firstIndex) * entryBytes`, `firstIndex` being
                // the header's colour-map origin (almost always 0).
                let idx = (pixels[s] as usize).wrapping_sub(color_map_origin);
                let e = idx * map_entry_bytes;
                let Some(entry) = palette.get(e..e + map_entry_bytes) else {
                    bail!("TGA: colour index {} is outside the map", pixels[s]);
                };
                rgba[d..d + 4].copy_from_slice(&match map_entry_bytes {
                    // 15/16-bit entries are `ARRRRRGG GGGBBBBB` little-endian, the top bit alpha
                    // only at 16; the high bits replicate down so a full channel reads 0xff.
                    2 => {
                        let v = u16::from_le_bytes([entry[0], entry[1]]);
                        let c = |shift: u32| {
                            let f = ((v >> shift) & 0x1f) as u8;
                            (f << 3) | (f >> 2)
                        };
                        let a = if color_map_entry_bits == 16 && v & 0x8000 == 0 {
                            0
                        } else {
                            0xff
                        };
                        [c(10), c(5), c(0), a]
                    }
                    4 => [entry[2], entry[1], entry[0], entry[3]],
                    _ => [entry[2], entry[1], entry[0], 0xff],
                });
                continue;
            }
            match bytes_per_pixel {
                1 => {
                    let g = pixels[s];
                    rgba[d..d + 4].copy_from_slice(&[g, g, g, 0xff]);
                }
                3 => {
                    rgba[d..d + 4].copy_from_slice(&[pixels[s + 2], pixels[s + 1], pixels[s], 0xff])
                }
                _ => {
                    rgba[d..d + 4].copy_from_slice(&[
                        pixels[s + 2],
                        pixels[s + 1],
                        pixels[s],
                        pixels[s + 3],
                    ]);
                }
            }
        }
    }
    Ok((width, height, rgba))
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A minimal colour-mapped TGA: header, palette, index stream.
    fn tga_paletted(
        image_type: u8,
        w: u16,
        h: u16,
        palette: &[u8],
        entry_bits: u8,
        idx: &[u8],
    ) -> Vec<u8> {
        let mut out = vec![0u8; 18];
        out[1] = 1; // colour-map type: present
        out[2] = image_type;
        out[5..7].copy_from_slice(
            &((palette.len() / (entry_bits as usize).div_ceil(8)) as u16).to_le_bytes(),
        );
        out[7] = entry_bits;
        out[12..14].copy_from_slice(&w.to_le_bytes());
        out[14..16].copy_from_slice(&h.to_le_bytes());
        out[16] = 8; // 8-bit indices
        out[17] = 0x20; // top-origin, so the test reads in file order
        out.extend_from_slice(palette);
        out.extend_from_slice(idx);
        out
    }

    /// Types 1 and 9, which the reference sends to `0x5a39d0`, in the addons' shape: 8-bit
    /// indices into a 24-bit palette.
    #[test]
    fn colour_mapped_images_decode_through_the_palette() {
        // Palette as BGR: entry 0 red, entry 1 green, entry 2 blue.
        let pal = [
            0, 0, 255, /* red */ 0, 255, 0, /* green */ 255, 0, 0, /* blue */
        ];
        let raw = tga_paletted(1, 2, 2, &pal, 24, &[0, 1, 2, 0]);
        let (w, h, rgba) = tga_to_rgba(&raw).unwrap();
        assert_eq!((w, h), (2, 2));
        assert_eq!(
            rgba,
            vec![
                255, 0, 0, 255, 0, 255, 0, 255, //
                0, 0, 255, 255, 255, 0, 0, 255,
            ]
        );

        // Type 9 is the same image RLE'd; the runs are over index bytes, not expanded pixels.
        let rle = tga_paletted(9, 2, 2, &pal, 24, &[0x02, 0, 1, 2, 0x80, 0]);
        assert_eq!(tga_to_rgba(&rle).unwrap().2, rgba);

        // An index outside the map is an error, not a black pixel.
        let bad = tga_paletted(1, 1, 1, &pal, 24, &[9]);
        assert!(tga_to_rgba(&bad)
            .unwrap_err()
            .to_string()
            .contains("outside the map"));
    }

    /// The module's second Deviation: maps of 15, 16 and 32 bits decode at the width the file
    /// declares. The reference sizes their entries 1, 1 and 3 bytes (`0x5a3b40`).
    #[test]
    fn colour_maps_of_15_16_and_32_bits_decode_at_their_own_width() {
        // 16 bits, `ARRRRRGG GGGBBBBB` little-endian: opaque red, opaque green, clear blue.
        let pal16 = [0x00, 0xfc, 0xe0, 0x83, 0x1f, 0x00];
        let raw = tga_paletted(1, 3, 1, &pal16, 16, &[0, 1, 2]);
        assert_eq!(
            tga_to_rgba(&raw).unwrap().2,
            vec![255, 0, 0, 255, 0, 255, 0, 255, 0, 0, 255, 0]
        );
        // 15 bits: the top bit is no alpha, so the blue is opaque.
        let raw = tga_paletted(1, 3, 1, &pal16, 15, &[0, 1, 2]);
        assert_eq!(
            tga_to_rgba(&raw).unwrap().2,
            vec![255, 0, 0, 255, 0, 255, 0, 255, 0, 0, 255, 255]
        );
        // 32 bits, BGRA: byte 3 is alpha.
        let pal32 = [0, 0, 255, 255, 0, 255, 0, 128];
        let raw = tga_paletted(9, 2, 1, &pal32, 32, &[0x01, 0, 1]);
        assert_eq!(
            tga_to_rgba(&raw).unwrap().2,
            vec![255, 0, 0, 255, 0, 255, 0, 128]
        );
    }

    /// The module's third Deviation: alpha bits in a colour-mapped image's descriptor change
    /// nothing, where the reference garbles it (`0x5a3820`, `0x5a3b80`).
    #[test]
    fn colour_mapped_images_with_alpha_bits_decode_as_the_picture() {
        let pal = [0, 0, 255, 0, 255, 0, 255, 0, 0];
        let plain = tga_paletted(1, 3, 1, &pal, 24, &[0, 1, 2]);
        let want = tga_to_rgba(&plain).unwrap().2;
        assert_eq!(want, vec![255, 0, 0, 255, 0, 255, 0, 255, 0, 0, 255, 255]);
        for descriptor in [0x28, 0x08, 0x21, 0x2f] {
            let mut raw = plain.clone();
            raw[17] = descriptor;
            assert_eq!(
                tga_to_rgba(&raw).unwrap().2,
                want,
                "descriptor {descriptor:#04x}"
            );
        }
        // The run-length type is expanded the same way.
        let mut rle = tga_paletted(9, 3, 1, &pal, 24, &[0x02, 0, 1, 2]);
        rle[17] = 0x28;
        assert_eq!(tga_to_rgba(&rle).unwrap().2, want);
    }

    /// A minimal TGA: an 18-byte header and pixels.
    fn tga(image_type: u8, w: u16, h: u16, bpp: u8, descriptor: u8, data: &[u8]) -> Vec<u8> {
        let mut out = vec![0u8; 18];
        out[2] = image_type;
        out[12..14].copy_from_slice(&w.to_le_bytes());
        out[14..16].copy_from_slice(&h.to_le_bytes());
        out[16] = bpp;
        out[17] = descriptor;
        out.extend_from_slice(data);
        out
    }

    #[test]
    fn uncompressed_32bit_bottom_origin_flips_and_swizzles() {
        // Bottom-up rows, as BGRA: blue, green at the bottom; red, half-alpha white on top.
        let px = [
            255, 0, 0, 255, /* blue */ 0, 255, 0, 255, /* green */
            0, 0, 255, 255, /* red */ 255, 255, 255, 128, /* white a=128 */
        ];
        let (w, h, rgba) = tga_to_rgba(&tga(2, 2, 2, 32, 8, &px)).unwrap();
        assert_eq!((w, h), (2, 2));
        // Top-down output, as RGBA: red, white, then blue, green.
        assert_eq!(
            rgba,
            vec![
                255, 0, 0, 255, 255, 255, 255, 128, //
                0, 0, 255, 255, 0, 255, 0, 255,
            ]
        );
    }

    #[test]
    fn uncompressed_24bit_top_origin_gets_opaque_alpha() {
        let px = [255, 0, 0, /* blue */ 0, 0, 255 /* red */];
        let (w, h, rgba) = tga_to_rgba(&tga(2, 2, 1, 24, 0x20, &px)).unwrap();
        assert_eq!((w, h), (2, 1));
        assert_eq!(rgba, vec![0, 0, 255, 255, 255, 0, 0, 255]);
    }

    #[test]
    fn rle_run_and_raw_packets_expand() {
        // 4×1 top-origin: a run of 3 red and a raw packet of 1 green (BGR, 24-bit).
        let data = [0x82, 0, 0, 255, 0x00, 0, 255, 0];
        let (w, _, rgba) = tga_to_rgba(&tga(10, 4, 1, 24, 0x20, &data)).unwrap();
        assert_eq!(w, 4);
        assert_eq!(
            rgba,
            vec![
                255, 0, 0, 255, 255, 0, 0, 255, 255, 0, 0, 255, //
                0, 255, 0, 255,
            ]
        );
    }

    #[test]
    fn grayscale_replicates_channels() {
        let (_, _, rgba) = tga_to_rgba(&tga(3, 1, 1, 8, 0x20, &[7])).unwrap();
        assert_eq!(rgba, vec![7, 7, 7, 255]);
    }

    /// Current native orientation uses both descriptor origin bits, after raw/RLE expansion.
    #[test]
    fn descriptor_bit_4_mirrors_each_row_after_expansion() {
        // 2×2, 24-bit, blue and red over green and white.
        let px = [
            255, 0, 0, /* blue */ 0, 0, 255, /* red */
            0, 255, 0, /* green */ 255, 255, 255, /* white */
        ];
        for origin in [0x00, 0x20] {
            let plain = tga_to_rgba(&tga(2, 2, 2, 24, origin, &px)).unwrap();
            let bit4 = tga_to_rgba(&tga(2, 2, 2, 24, origin | 0x10, &px)).unwrap();
            let mut mirrored = plain.2.clone();
            for row in mirrored.chunks_exact_mut(8) {
                for channel in 0..4 {
                    row.swap(channel, channel + 4);
                }
            }
            assert_eq!(bit4, (plain.0, plain.1, mirrored), "origin bits {origin:#04x}");
        }
        // Top-origin/right-origin: red and blue over white and green.
        let (_, _, rgba) = tga_to_rgba(&tga(2, 2, 2, 24, 0x30, &px)).unwrap();
        assert_eq!(
            rgba,
            vec![
                255, 0, 0, 255, 0, 0, 255, 255, //
                255, 255, 255, 255, 0, 255, 0, 255,
            ]
        );
        // The run-length reader orients the same way.
        let rle = [0x80, 255, 0, 0, 0x80, 0, 0, 255];
        assert_eq!(
            tga_to_rgba(&tga(10, 2, 1, 24, 0x30, &rle)).unwrap().2,
            vec![255, 0, 0, 255, 0, 0, 255, 255]
        );
    }

    /// Current native 24/32-bit admission ignores all sixteen descriptor alpha declarations.
    /// In particular the unchanged gold atlas has 32-bit pixels and descriptor 0x20.
    #[test]
    fn truecolour_depth_admission_preserves_alpha_independent_of_descriptor() {
        let bgr = [255, 0, 0];
        let bgra = [255, 0, 0, 77];
        for alpha_bits in 0..16 {
            for (bpp, data, want) in [(24, &bgr[..], 255), (32, &bgra[..], 77)] {
                for image_type in [2, 10] {
                    let rle = [&[0x80][..], data].concat();
                    let data = if image_type == 10 { rle.as_slice() } else { data };
                    let (_, _, rgba) =
                        tga_to_rgba(&tga(image_type, 1, 1, bpp, 0x20 | alpha_bits, data)).unwrap();
                    assert_eq!(rgba, vec![0, 0, 255, want]);
                }
            }
            for bpp in [0, 8, 16, 25, 28, 31, 33, 39] {
                assert!(tga_to_rgba(&tga(2, 1, 1, bpp, 0x20 | alpha_bits, &bgra)).is_err());
            }
        }
    }

    /// Changing only the alpha declaration cannot change a supported truecolour image's pixels.
    #[test]
    fn addon_tgas_follow_the_references_descriptor_rules() {
        let corpus = crate::addon_corpus_or_skip!();
        fn walk(dir: &std::path::Path, out: &mut Vec<std::path::PathBuf>) {
            let Ok(entries) = std::fs::read_dir(dir) else {
                return;
            };
            for entry in entries.flatten() {
                let path = entry.path();
                if path.is_dir() {
                    walk(&path, out);
                } else if path
                    .extension()
                    .is_some_and(|e| e.eq_ignore_ascii_case("tga"))
                {
                    out.push(path);
                }
            }
        }
        let mut files = Vec::new();
        walk(&corpus, &mut files);
        assert!(
            files.len() > 100,
            "only {} TGAs under {corpus:?}",
            files.len()
        );
        let (mut decoded, mut refused) = (0usize, 0usize);
        for path in files {
            let Ok(mut bytes) = std::fs::read(&path) else {
                continue;
            };
            if bytes.len() < 18 {
                continue;
            }
            let (image_type, bpp) = (bytes[2], bytes[16]);
            let result = tga_to_rgba(&bytes);
            if matches!(image_type, 2 | 10) && !matches!(bpp, 24 | 32) {
                assert!(result.is_err(), "{path:?}: unsupported {bpp}-bit truecolour");
                refused += 1;
            }
            if let Ok(decoded_plain) = result {
                if matches!(image_type, 2 | 10) {
                    bytes[17] ^= 0xf;
                    assert_eq!(tga_to_rgba(&bytes).unwrap(), decoded_plain, "{path:?}");
                }
                decoded += 1;
            }
        }
        assert!(decoded > 100, "only {decoded} TGAs decoded");
        eprintln!("{decoded} corpus TGAs decode, {refused} are refused by depth");
    }

    /// `0x44a140` has a texture once the header opens (`0x5a3660`), at the header's size
    /// (`0x448450`): whether the pixels decode is `0x44a260`'s question, later.
    #[test]
    fn a_header_that_opens_makes_a_texture_at_its_size() {
        // Unsupported pixels still have a header size; zero declared alpha alone is valid.
        let refused = tga(99, 4, 2, 32, 0x20, &[0; 32]);
        assert!(tga_to_rgba(&refused).is_err());
        assert_eq!(tga_texture_size(&refused), Some((4, 2)));
        assert_eq!(tga_texture_size(&tga(2, 4, 2, 32, 0x20, &[])), Some((4, 2)));
        assert_eq!(
            tga_texture_size(&tga(99, 512, 1, 7, 0xff, &[])),
            Some((512, 1))
        );

        // The selected 0.113.2 TGA route accepts both large addon atlases and non-power-of-two
        // images. Zero and dimensions past the decoder's 8192 ceiling fail on either axis.
        for (w, h) in [(1, 1), (3, 2), (6, 6), (1024, 256), (2048, 256), (8192, 4), (4, 8192)] {
            assert_eq!(
                tga_texture_size(&tga(2, w, h, 32, 0x28, &[])),
                Some((u32::from(w), u32::from(h))),
                "{w}x{h}"
            );
        }
        for (w, h) in [(0, 4), (4, 0), (4, 8193), (8193, 4), (65535, 2)] {
            assert_eq!(
                tga_texture_size(&tga(2, w, h, 32, 0x28, &[0; 8])),
                None,
                "{w}x{h}"
            );
        }
        assert_eq!(tga_texture_size(&[0; 17]), None);
        assert_eq!(tga_texture_size(b"BLP2"), None);
    }

    /// The gate's prefix: nothing past `TGA_GATE_PREFIX` bytes changes the answer.
    #[test]
    fn the_gate_answers_the_same_for_its_prefix_as_for_the_file() {
        for id_length in [0usize, 1, 17, 254, 255] {
            for map_len in [0u16, 3] {
                for tail in [0usize, 1, 2, 300, 2000] {
                    for map_type in [0u8, 1] {
                        let mut file = tga(1, 8, 4, 8, 0x20, &[]);
                        file[0] = id_length as u8;
                        file[1] = map_type;
                        file[5..7].copy_from_slice(&map_len.to_le_bytes());
                        file[7] = 24;
                        file.extend(vec![0; id_length + usize::from(map_len) * 3 + tail]);
                        for cut in [0, 1, id_length, id_length + 1, 300, file.len()] {
                            let file = &file[..file.len().saturating_sub(cut)];
                            let prefix = &file[..file.len().min(TGA_GATE_PREFIX)];
                            assert_eq!(
                                tga_texture_size(prefix),
                                tga_texture_size(file),
                                "id {id_length}, map {map_type}/{map_len}, {} bytes",
                                file.len()
                            );
                        }
                    }
                }
            }
        }
    }

    /// The id and the colour map are read after the header, and a read that gets any byte
    /// succeeds (`0x64853b`-`0x64854a`); one that gets none fails the open. The map is sized as
    /// the reference sizes it (`0x5a3b40`): 32-bit entries count 3 bytes.
    #[test]
    fn the_id_and_map_reads_fail_the_open_only_with_no_bytes() {
        let mut with_id = tga(2, 4, 2, 24, 0x20, &[]);
        with_id[0] = 5;
        assert_eq!(tga_texture_size(&with_id), None, "no id byte");
        with_id.push(0);
        assert_eq!(tga_texture_size(&with_id), Some((4, 2)), "a short id");

        let mut with_map = tga(1, 4, 2, 8, 0x20, &[]);
        with_map[1] = 1; // colour-map type: present
        with_map[5..7].copy_from_slice(&4u16.to_le_bytes());
        with_map[7] = 32;
        assert_eq!(tga_texture_size(&with_map), None, "no map byte");
        with_map.push(0);
        assert_eq!(tga_texture_size(&with_map), Some((4, 2)), "a short map");
        // Past an id of 2, one byte reaches the map.
        with_map[0] = 2;
        assert_eq!(tga_texture_size(&with_map), None, "the id took the byte");
        with_map.extend([0, 0]);
        assert_eq!(tga_texture_size(&with_map), Some((4, 2)));
        // No map type, no read, whatever the length field says.
        with_map[1] = 0;
        assert_eq!(tga_texture_size(&tga(2, 4, 2, 24, 0x20, &[])), Some((4, 2)));
        assert_eq!(tga_texture_size(&with_map), Some((4, 2)));
    }

    #[test]
    fn garbage_and_unsupported_types_are_loud_misses() {
        assert!(tga_to_rgba(b"BLP2xxxxxxxxxxxxxxxxxx").is_err()); // a BLP is not a TGA
        assert!(tga_to_rgba(&[0u8; 4]).is_err()); // truncated header
        assert!(tga_to_rgba(&tga(1, 2, 2, 8, 0, &[0; 32])).is_err()); // colour-mapped, no map
        assert!(tga_to_rgba(&tga(2, 2, 2, 16, 0, &[0; 32])).is_err()); // 16-bit
        assert!(tga_to_rgba(&tga(2, 2, 2, 32, 8, &[0; 4])).is_err()); // truncated pixels
    }
}
