#!/usr/bin/env python3
"""Recover bounded assets and path evidence from the selected SHA-bound EXE.

Analysis only: never executes the target and is never required by source builds.
Binary outputs stay in ignored runtime; only the JSON evidence is deliverable.
"""
from portable_paths import portable_json

import argparse
import bisect
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import struct
import zlib


ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("inventory_executable", ROOT / "scripts/inventory-executable.py")
inventory = importlib.util.module_from_spec(spec)
spec.loader.exec_module(inventory)
PE = inventory.PE

EXTENSIONS = "blp|m2|mdx|mdr|wmo|wdt|adt|wdl|dbc|db2|ttf|otf|woff2?|png|jpe?g|tga|dds|wav|mp3|ogg|flac|xml|lua|toc|trs|wlm|wlw|wlv|skin|anim|phys|bnk|wdb"
ROOT_NAMES = "interface|fonts|textures|character|creature|item|world|sound|dbfilesclient|tileset|cameras|environments|shaders"
PATH = re.compile(r"(?:(?:mpq://)?(?:" + ROOT_NAMES + r")[/\\])[^\x00-\x1f<>:\"|?*]{1,4000}?\.(?:" + EXTENSIONS + ")", re.I)
LITERAL_PATH = re.compile(rb"(?:(?:mpq://)?(?:" + ROOT_NAMES.encode() + rb")[/\\])[A-Za-z0-9_./\\() -]{1,4000}?\.(?:" + EXTENSIONS.encode() + rb")", re.I)
FILENAME = re.compile(r"[A-Za-z0-9_. -]+\.(?:" + EXTENSIONS + ")", re.I)
PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"
FONT_NAMES = {
    "AzS Names SC": "AZS_NAMES_SC.TTF", "AzS Names JP": "AZS_NAMES_JP.TTF",
    "AzS Names KR": "AZS_NAMES_KR.TTF", "Friz Quadrata TT": "FRIZQT__.TTF",
    "Morpheus": "MORPHEUS.TTF", "Skurri": "SKURRI.TTF",
    "Noto Sans SC Thin": "AZS_SC.TTF", "Noto Sans JP Thin": "AZS_JP.TTF",
    "Noto Sans KR Thin": "AZS_KR.TTF", "Fira Mono Medium": "FIRA_MONO_MEDIUM.TTF",
}


def sha(data):
    return hashlib.sha256(data).hexdigest()


def local(value):
    path = (ROOT / value).resolve()
    if not path.is_relative_to(ROOT):
        raise ValueError("all input and output paths must remain inside the checkout")
    return path


def relative(path):
    return str(path.relative_to(ROOT))


def archive_path(value):
    """Normalize a candidate for case-insensitive MPQ lookup, never filesystem use."""
    value = re.sub(r"^mpq://", "", value, flags=re.I).replace("\\", "/")
    if value.startswith("/") or any(part in ("", ".", "..") for part in value.split("/")):
        raise ValueError("unsafe or empty archive path component")
    return value.lower()


def mapped_end(pe, offset):
    for section in pe.sections:
        start = section["raw_offset"]
        if start <= offset < start + section["raw_size"]:
            return min(len(pe.data), start + section["raw_size"])
    return len(pe.data)


def location(pe, offset, length):
    address = pe.offset_va(offset)
    return dict(file_offset=hex(offset), virtual_address=hex(address) if address is not None else None,
                size_bytes=length, sha256=sha(pe.data[offset:offset + length]))


def pointer_slices(pe):
    """Find aligned pointer/u64-length pairs. This is a data-layout lead, not a type claim."""
    results = []
    for section in pe.sections:
        if int(section["characteristics"], 16) & 0x20000000:
            continue
        start, size = section["raw_offset"], section["raw_size"]
        for at in range((start + 7) & ~7, min(len(pe.data), start + size) - 15, 8):
            pointer, length = struct.unpack_from("<QQ", pe.data, at)
            if not 4 <= length <= 4096 or not pe.image_base <= pointer < pe.image_base + 0x80000000:
                continue
            try:
                offset = pe.rva_offset(pointer - pe.image_base)
            except ValueError:
                continue
            if offset + length > mapped_end(pe, offset):
                continue
            raw = pe.data[offset:offset + length]
            if not all(32 <= byte < 127 for byte in raw):
                continue
            text = raw.decode("ascii")
            if not (PATH.fullmatch(text) or FILENAME.fullmatch(text) or text.lower().startswith("mpq://")):
                continue
            results.append(dict(text=text, descriptor=location(pe, at, 16), string=location(pe, offset, length),
                                descriptor_kind="aligned pointer/u64 length candidate; native owning type not inferred"))
    return results


def path_evidence(pe, slices):
    records = {}

    def add(text, at, kind, descriptor=None):
        try:
            normalized = archive_path(text)
        except ValueError:
            return
        key = (at, text)
        row = records.setdefault(key, dict(text=text, normalized_archive_candidate=normalized,
                                           source=location(pe, at, len(text.encode("ascii"))), evidence_kinds=[],
                                           pointer_length_descriptors=[]))
        if kind not in row["evidence_kinds"]:
            row["evidence_kinds"].append(kind)
        if descriptor is not None and descriptor not in row["pointer_length_descriptors"]:
            row["pointer_length_descriptors"].append(descriptor)

    for section in pe.sections:
        if int(section["characteristics"], 16) & 0x20000000:
            continue
        start, size = section["raw_offset"], section["raw_size"]
        for match in LITERAL_PATH.finditer(pe.data, start, min(len(pe.data), start + size)):
            add(match[0].decode("ascii"), match.start(), "literal path-shaped bytes; boundary is a pattern candidate")
    for row in slices:
        if PATH.fullmatch(row["text"]):
            add(row["text"], int(row["string"]["file_offset"], 16), "exact pointer/length-bounded path", row["descriptor"])
    return sorted(records.values(), key=lambda row: (row["normalized_archive_candidate"], int(row["source"]["file_offset"], 16)))


def sum32(data):
    data += b"\0" * (-len(data) % 4)
    return sum(item[0] for item in struct.iter_unpack(">I", data)) & 0xFFFFFFFF


def sfnt_at(data, at, limit):
    """Validate an SFNT directory/table checksums and bound its canonical padded span."""
    if at + 12 > limit or data[at:at + 4] not in (b"\0\1\0\0", b"OTTO", b"true"):
        raise ValueError("not an SFNT header")
    count = struct.unpack_from(">H", data, at + 4)[0]
    if not 5 <= count <= 100 or at + 12 + count * 16 > limit:
        raise ValueError("invalid SFNT table count")
    tables, spans = {}, []
    for index in range(count):
        tag, checksum, offset, size = struct.unpack_from(">4sIII", data, at + 12 + index * 16)
        if not all(32 <= byte < 127 for byte in tag) or tag in tables or not size:
            raise ValueError("invalid/duplicate SFNT tag or empty table")
        if offset % 4 or offset < 12 + count * 16 or offset + size > 32 * 1024 * 1024 or at + offset + size > limit:
            raise ValueError("SFNT table outside bounded section")
        raw = data[at + offset:at + offset + size]
        if tag == b"head":
            if size < 54 or raw[12:16] != b"\x5f\x0f\x3c\xf5":
                raise ValueError("invalid SFNT head")
            raw = raw[:8] + b"\0" * 4 + raw[12:]
        if sum32(raw) != checksum:
            raise ValueError("SFNT table checksum mismatch")
        spans.append((offset, offset + size))
        tables[tag] = dict(offset=offset, size_bytes=size, checksum=hex(checksum))
    if not {b"head", b"maxp", b"name"}.issubset(tables):
        raise ValueError("missing required SFNT identity tables")
    spans.sort()
    if any(left[1] > right[0] for left, right in zip(spans, spans[1:])):
        raise ValueError("overlapping SFNT tables")
    extent = max(end for _, end in spans)
    size = (extent + 3) & ~3
    if at + size > limit or any(data[at + extent:at + size]):
        raise ValueError("invalid SFNT final table padding")
    if sum32(data[at:at + size]) != 0xB1B0AFBA:
        raise ValueError("SFNT global checksum mismatch")
    name_table = tables[b"name"]
    raw = data[at + name_table["offset"]:at + name_table["offset"] + name_table["size_bytes"]]
    if len(raw) < 6:
        raise ValueError("invalid SFNT name table")
    _, count, storage = struct.unpack_from(">HHH", raw)
    if 6 + 12 * count > len(raw) or storage < 6 + 12 * count:
        raise ValueError("SFNT name records outside table")
    names = []
    for index in range(count):
        platform, encoding, language, name_id, length, offset = struct.unpack_from(">6H", raw, 6 + index * 12)
        if storage + offset + length > len(raw):
            raise ValueError("SFNT name string outside table")
        if name_id in (1, 2, 4, 6):
            text = raw[storage + offset:storage + offset + length].decode("utf-16-be" if platform in (0, 3) else "mac_roman", errors="replace")
            names.append(dict(name_id=name_id, platform=platform, encoding=encoding, language=language, text=text))
    family = next((item["text"] for item in names if item["name_id"] == 1), "unnamed")
    return dict(format="sfnt", size_bytes=size, table_extent_bytes=extent, family=family,
                tables={tag.decode("ascii"): value for tag, value in sorted(tables.items())}, names=names,
                validation="Nonoverlapping bounded tables, all table checksums, head magic, bounded names, zero final padding, global checksum 0xb1b0afba")


def png_at(data, at, limit):
    if data[at:at + 8] != PNG_SIGNATURE:
        raise ValueError("not a PNG signature")
    cursor, chunks, idat = at + 8, [], []
    width = height = bit_depth = color = interlace = None
    while cursor + 12 <= limit:
        length = struct.unpack_from(">I", data, cursor)[0]
        kind = data[cursor + 4:cursor + 8]
        end = cursor + 12 + length
        if length > 64 * 1024 * 1024 or end > limit or not all(65 <= c <= 90 or 97 <= c <= 122 for c in kind):
            raise ValueError("invalid PNG chunk bounds or type")
        payload = data[cursor + 8:cursor + 8 + length]
        crc = struct.unpack_from(">I", data, cursor + 8 + length)[0]
        if zlib.crc32(kind + payload) & 0xFFFFFFFF != crc:
            raise ValueError("PNG CRC mismatch")
        if not chunks:
            if kind != b"IHDR" or length != 13:
                raise ValueError("PNG missing first IHDR")
            width, height, bit_depth, color, compression, filtering, interlace = struct.unpack(">IIBBBBB", payload)
            depths = {0: (1, 2, 4, 8, 16), 2: (8, 16), 3: (1, 2, 4, 8), 4: (8, 16), 6: (8, 16)}
            if not width or not height or width * height > 16 * 1024 * 1024 or bit_depth not in depths.get(color, ()) or compression or filtering or interlace not in (0, 1):
                raise ValueError("invalid PNG IHDR")
        elif kind == b"IHDR":
            raise ValueError("repeated PNG IHDR")
        if kind == b"IDAT":
            idat.append(payload)
        chunks.append(kind.decode("ascii"))
        cursor = end
        if kind == b"IEND":
            if length or not idat:
                raise ValueError("invalid PNG IEND or no image data")
            decoder = zlib.decompressobj()
            pixels = decoder.decompress(b"".join(idat), 256 * 1024 * 1024)
            if not decoder.eof or decoder.unused_data or decoder.unconsumed_tail:
                raise ValueError("invalid or oversized PNG DEFLATE stream")
            if interlace == 0:
                channels = {0: 1, 2: 3, 3: 1, 4: 2, 6: 4}[color]
                stride = (width * channels * bit_depth + 7) // 8 + 1
                if len(pixels) != stride * height or any(pixels[row * stride] > 4 for row in range(height)):
                    raise ValueError("PNG scanline size/filter mismatch")
            return dict(format="png", size_bytes=cursor - at, width=width, height=height,
                        bit_depth=bit_depth, color_type=color, interlace=interlace, chunks=chunks,
                        validation="Bounded IHDR/chunks/IEND, every chunk CRC, complete DEFLATE stream and noninterlaced scanline bounds/filters")
    raise ValueError("PNG has no bounded IEND")


def rip_font_references(pe, font_offsets):
    """Byte-pattern leads bounded by PE exception-directory function records."""
    targets = {pe.offset_va(at): at for at in font_offsets}
    functions = sorted(pe.functions())
    starts = [item[0] for item in functions]
    refs = {at: [] for at in font_offsets}
    for section in pe.sections:
        if not int(section["characteristics"], 16) & 0x20000000:
            continue
        start, size = section["raw_offset"], section["raw_size"]
        for match in re.finditer(rb"[\x48\x4c]\x8d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]....", pe.data[start:start + size], re.S):
            at = start + match.start()
            address = pe.offset_va(at)
            target = address + 7 + struct.unpack_from("<i", match[0], 3)[0]
            if target not in targets:
                continue
            record = dict(instruction=location(pe, at, 7), target_address=hex(target),
                          status="RIP-relative LEA byte candidate; instruction boundary/calling semantics require native analysis")
            if pe.data[at + 7:at + 9] == b"\x41\xb8":
                length = struct.unpack_from("<I", pe.data, at + 9)[0]
                record.update(following_mov_r8d_immediate=length, instruction=location(pe, at, 13))
            index = bisect.bisect_right(starts, address - pe.image_base) - 1
            if index >= 0 and functions[index][0] <= address - pe.image_base < functions[index][1]:
                record["runtime_function"] = [hex(pe.image_base + value) for value in functions[index][:2]]
            refs[targets[target]].append(record)
    return refs


def named_font_records(pe, fonts):
    """Recover native path/len + payload/len + u64-flag table rows by their bytes."""
    result = {at: [] for at in fonts}
    for font_at, font in fonts.items():
        pointer = struct.pack("<Q", pe.offset_va(font_at))
        start = 0
        while (at := pe.data.find(pointer, start)) >= 0:
            start = at + 1
            if at < 16 or at + 24 > mapped_end(pe, at):
                continue
            path_va, path_len = struct.unpack_from("<QQ", pe.data, at - 16)
            payload_len, flag = struct.unpack_from("<QQ", pe.data, at + 8)
            if not 4 <= path_len <= 512 or payload_len != font["size_bytes"] or flag not in (0, 1):
                continue
            try:
                path_at = pe.rva_offset(path_va - pe.image_base)
            except ValueError:
                continue
            raw = pe.data[path_at:path_at + path_len]
            if len(raw) != path_len or not all(32 <= byte < 127 for byte in raw):
                continue
            text = raw.decode("ascii")
            if not PATH.fullmatch(text) or not text.lower().endswith((".ttf", ".otf")):
                continue
            result[font_at].append(dict(record=location(pe, at - 16, 40), path=text,
                                       path_source=location(pe, path_at, path_len), payload_length=payload_len,
                                       trailing_u64_flag=flag, flag_semantics="not inferred by this extractor"))
    return result


def language_font_records(pe, slices):
    """Keep exact adjacent locale/path/filename string triples as data evidence."""
    result = []
    for row in slices:
        if not re.fullmatch(r"Fonts\\AZS_[A-Z]{2}\.TTF", row["text"]):
            continue
        at = int(row["descriptor"]["file_offset"], 16) - 16
        if at < 0 or at + 48 > mapped_end(pe, at):
            continue
        strings = []
        for offset in (0, 16, 32):
            pointer, length = struct.unpack_from("<QQ", pe.data, at + offset)
            if not 1 <= length <= 512:
                break
            try:
                string_at = pe.rva_offset(pointer - pe.image_base)
            except ValueError:
                break
            raw = pe.data[string_at:string_at + length]
            if len(raw) != length or not all(32 <= byte < 127 for byte in raw):
                break
            strings.append(dict(text=raw.decode("ascii"), source=location(pe, string_at, length)))
        if len(strings) != 3 or not re.fullmatch("[a-z]{2}", strings[0]["text"]):
            continue
        if strings[1]["text"].replace("\\", "/").split("/")[-1].lower() != strings[2]["text"]:
            continue
        result.append(dict(record=location(pe, at, 48), locale=strings[0], virtual_path=strings[1],
                           external_filename=strings[2], status="Exact three pointer/length pairs. Native loader selection and fallback semantics belong to asset-native.json."))
    return result


def recover_resource_icons(pe, resource_evidence, output):
    """Rebuild ICO containers from hash-checked REA RT_GROUP_ICON/RT_ICON records."""
    if resource_evidence["subject"]["digest"]["sha256"] != sha(pe.data):
        raise ValueError("PE-resource evidence target hash mismatch")
    result = resource_evidence["normalized_result"]
    resources = {row["index"]: row for row in result["resources"]}
    recovered = []
    for group in result["icon_groups"]:
        source = resources[group["resource_index"]]
        where = source["payload"]["location"]
        raw_group = pe.data[where["offset"]:where["offset"] + where["bytes"]]
        if sha(raw_group) != source["payload"]["sha256"]:
            raise ValueError("icon-group resource payload hash mismatch")
        count = len(group["images"])
        if len(raw_group) != 6 + count * 14 or struct.unpack_from("<HHH", raw_group) != (0, 1, count):
            raise ValueError("invalid icon group layout")
        group_path = output / f"resource-group-icon-{source['name'].get('id', group['resource_index'])}.bin"
        group_path.write_bytes(raw_group)
        header = bytearray(struct.pack("<HHH", 0, 1, count))
        payloads, images, offset = [], [], 6 + count * 16
        for index, image in enumerate(group["images"]):
            fields = struct.unpack_from("<BBBBHHIH", raw_group, 6 + index * 14)
            width, height, color_count, reserved, planes, depth, length, resource_id = fields
            resource = resources[image["same_language_resource_index"]]
            loc = resource["payload"]["location"]
            payload = pe.data[loc["offset"]:loc["offset"] + loc["bytes"]]
            if resource["type"].get("id") != 3 or resource["name"].get("id") != resource_id or length != len(payload) or sha(payload) != resource["payload"]["sha256"]:
                raise ValueError("icon resource id/size/hash mismatch")
            png = png_at(payload, 0, len(payload))
            if png["size_bytes"] != len(payload) or png["width"] != (width or 256) or png["height"] != (height or 256):
                raise ValueError("icon group dimensions disagree with PNG")
            header += struct.pack("<BBBBHHII", width, height, color_count, reserved, planes, depth, length, offset)
            payloads.append(payload)
            images.append(dict(resource_id=resource_id, source=location(pe, loc["offset"], length),
                               recovered_png_path=relative(output / f"image-{loc['offset']:x}.png"),
                               width=png["width"], height=png["height"], ico_file_offset=offset))
            offset += length
        payload = bytes(header) + b"".join(payloads)
        path = output / f"resource-icon-{source['name'].get('id', group['resource_index'])}.ico"
        path.write_bytes(payload)
        recovered.append(dict(output_path=relative(path), size_bytes=len(payload), sha256=sha(payload),
                              container="Reconstructed ICO directory; every image payload is exact native RT_ICON bytes.",
                              original_group_source=location(pe, where["offset"], where["bytes"]),
                              original_group_output_path=relative(group_path), images=images))
    return recovered


def recover(pe, output):
    output.mkdir(parents=True, exist_ok=True)
    slices = pointer_slices(pe)
    paths = path_evidence(pe, slices)
    fonts, images, rejected_png = {}, [], []
    for signature in (b"\0\1\0\0", b"OTTO", b"true"):
        cursor = 0
        while (at := pe.data.find(signature, cursor)) >= 0:
            cursor = at + 4
            # Embedded data only; opcode bytes are not treated as font containers.
            if any(s["raw_offset"] <= at < s["raw_offset"] + s["raw_size"] and int(s["characteristics"], 16) & 0x20000000 for s in pe.sections):
                continue
            try:
                fonts[at] = sfnt_at(pe.data, at, mapped_end(pe, at))
            except (ValueError, struct.error):
                pass
    references = rip_font_references(pe, fonts)
    named = named_font_records(pe, fonts)
    for at, font in sorted(fonts.items()):
        filename = FONT_NAMES.get(font["family"], f"font-{at:x}.ttf")
        path = output / filename
        path.write_bytes(pe.data[at:at + font["size_bytes"]])
        font.update(source=location(pe, at, font["size_bytes"]), output_path=relative(path),
                    native_named_table_records=named[at], code_reference_candidates=references[at],
                    output_filename_basis="Recovered SFNT family; user font-dir compatibility name. Only native_named_table_records establishes original asset path.")
        lengths = {r["following_mov_r8d_immediate"] for r in references[at] if "following_mov_r8d_immediate" in r}
        font["length_evidence"] = "native named data record matches canonical SFNT span" if named[at] else "LEA/mov-r8d byte candidate matches canonical SFNT span" if font["size_bytes"] in lengths else "canonical SFNT table span; no native slice length recovered"
    cursor = 0
    while (at := pe.data.find(PNG_SIGNATURE, cursor)) >= 0:
        cursor = at + len(PNG_SIGNATURE)
        try:
            image = png_at(pe.data, at, mapped_end(pe, at))
        except (ValueError, struct.error, zlib.error) as error:
            rejected_png.append(dict(file_offset=hex(at), reason=str(error)))
            continue
        path = output / f"image-{at:x}.png"
        path.write_bytes(pe.data[at:at + image["size_bytes"]])
        image.update(source=location(pe, at, image["size_bytes"]), output_path=relative(path))
        images.append(image)
    return dict(paths=paths, pointer_length_string_candidates=slices, language_font_data_records=language_font_records(pe, slices),
                fonts=list(fonts.values()), images=images,
                rejected_png_signatures=rejected_png)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", default="docs/analysis/target-refresh-0.97.2.json")
    parser.add_argument("--output-dir", default="runtime/asset-recovery-0.97.2/exe-assets")
    parser.add_argument("--report", default="docs/analysis/evidence/0.97.2/exe-assets.json")
    parser.add_argument("--path-candidates", default="runtime/asset-recovery-0.97.2/exe-paths.txt")
    parser.add_argument("--pe-resource-evidence", default="docs/analysis/evidence/0.97.2/pe-resources.json")
    args = parser.parse_args()
    manifest_path = local(args.manifest)
    manifest = json.loads(manifest_path.read_text())
    target = manifest["current_target"]
    binary = local(target["path"])
    data = binary.read_bytes()
    if sha(data) != target["sha256"] or len(data) != target["size_bytes"]:
        raise SystemExit("target SHA-256/size mismatch; no recovery outputs written")
    output, report_path, candidate_path = local(args.output_dir), local(args.report), local(args.path_candidates)
    report = recover(PE(data), output)
    resource_path = local(args.pe_resource_evidence)
    report["resource_evidence"] = dict(path=relative(resource_path), sha256=sha(resource_path.read_bytes()))
    report["reconstructed_icon_containers"] = recover_resource_icons(PE(data), json.loads(resource_path.read_text()), output)
    candidates = sorted({row["normalized_archive_candidate"] for row in report["paths"]})
    candidate_path.parent.mkdir(parents=True, exist_ok=True)
    candidate_path.write_text("".join(path + "\n" for path in candidates))
    report.update(schema_version=1, target=dict(version=target["version"], path=relative(binary), size_bytes=len(data), sha256=sha(data)),
                  target_manifest=relative(manifest_path), command="python3 scripts/recover-exe-assets.py",
                  counts=dict(path_occurrences=len(report["paths"]), unique_archive_candidates=len(candidates),
                              pointer_length_strings=len(report["pointer_length_string_candidates"]), sfnt_fonts=len(report["fonts"]),
                              language_font_records=len(report["language_font_data_records"]),
                              validated_pngs=len(report["images"]), reconstructed_ico_containers=len(report["reconstructed_icon_containers"]),
                              rejected_png_signatures=len(report["rejected_png_signatures"])),
                  limitations=[
                      "Paths are static candidates until an archive lookup verifies a member; static paths do not establish menu reachability or native fallback/precedence.",
                      "Literal patterns can be partial strings or concatenated neighbors. Pointer/u64-length rows retain exact string boundaries but inferred descriptor types remain unverified.",
                      "Font checksum/table validation establishes bounded payloads. Native named records or LEA/immediate byte candidates are retained separately from native decompilation semantics.",
                      "SFNT extent ends at the final table rounded to four bytes; arbitrary bytes outside that format span are not claimed as original font content.",
                      "Recovered embedded fonts/images remain ignored local analysis outputs; source builds neither require the reference EXE nor bundle these assets.",
                      "No game was launched. This inventory neither recovers every dynamic path nor proves visual/functional parity.",
                  ])
    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(portable_json(report, indent=2, ensure_ascii=False) + "\n")
    print(json.dumps(dict(report=relative(report_path), candidates=relative(candidate_path), output_dir=relative(output), counts=report["counts"])))


if __name__ == "__main__":
    main()
