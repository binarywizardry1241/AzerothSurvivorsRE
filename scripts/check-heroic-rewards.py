#!/usr/bin/env python3
"""Check current Heroic terminal XP and party-feat rank input without compiling."""
import argparse
import hashlib
import itertools
import json
import platform
import re
import struct
import subprocess

from coverage_common import ROOT, latest_target, target_bytes
from native_terminal import NativeReplay
from script_sources import load_script

PROOF = ROOT / 'docs/analysis/evidence/0.121.0/heroic-rewards/manifest.json'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write', action='store_true')
    args = parser.parse_args()
    proof = json.loads(PROOF.read_text())
    target = latest_target(verify=True)
    assert proof['target'] == {k: target[k] for k in ('version', 'path', 'sha256', 'size_bytes')}
    image = target_bytes(target)
    pe = load_script('reward_pe', ROOT / 'scripts/inventory-executable.py').PE(image)
    query = load_script('reward_subjects', ROOT / 'scripts/check-boss-prediction.py')
    query.verify(proof, image, pe)
    math = load_script('reward_math', ROOT / 'scripts/recover-terminal-contracts.py')
    native = NativeReplay(image, pe)
    u, reg, state = native.machine, native.registers, native.context
    def seam(address):
        if address == 0x145a9c190:
            u.reg_write(reg.UC_X86_REG_RAX, state['zone'])
        elif address == 0x145febc75:
            value = struct.unpack('<f', (u.reg_read(reg.UC_X86_REG_XMM0) & 0xffffffff).to_bytes(4, 'little'))[0]
            native.scalar(reg.UC_X86_REG_XMM0, math.rnd(value))
        elif address == 0x145c88590:
            native.put(u.reg_read(reg.UC_X86_REG_RCX), '<3Q', 0, 4, 0)
        else:
            return False
        native.return_seam()
        return True
    native.seam = seam
    def model(case):
        # Reuse retained float operations/base arithmetic, not old RVAs or
        # old Run Options semantics. The current consumer uses raw kills.
        parts = math.model(dict(case, mods=[100] * 4))
        rank = min(case['rank'], 5)
        reward = 1.0
        if rank:
            offset = pe.rva_offset(0x146fca2e0 - pe.image_base) + rank * 48 - 4
            reward = struct.unpack_from('<f', image, offset)[0]
        base = math.signed(sum(parts[:5]))
        parts[5] = math.cast(math.rnd(math.mul(math.add(reward, -1.0), math.f32(base))), -(1 << 63), (1 << 63) - 1)
        parts[6] = math.cast(math.rnd(math.mul(math.f32(math.signed(base + parts[5])), case['veteran'])), -(1 << 63), (1 << 63) - 1)
        return parts
    profiles = [(0, 0, 0.0), (5, 0, 2.5), (100, 1, 60.0),
                (0, 0, 375.0), (16777217, 3, 125.0),
                (0, 107374184, 0.0), (0xffffffff, 0xffffffff, 7200.0)]
    vectors = []
    for rank, zone, (kills, bosses, seconds), won, veteran in itertools.product(
            [0, 1, 2, 3, 4, 5, 6, 255], range(12), profiles, [False, True], [0.0, 0.2, 0.4]):
        case = dict(kills=kills, bosses=bosses, seconds=seconds, won=won, zone=zone,
                    rank=rank, veteran=math.f32(veteran))
        native.reset('heroic-xp', [(0x145b2852b, 0x145b28746)], {0x145b28746})
        state['zone'] = zone
        u.reg_write(reg.UC_X86_REG_R14, int(won))
        u.reg_write(reg.UC_X86_REG_RDI, 200)
        native.scalar(reg.UC_X86_REG_XMM6, seconds)
        native.scalar(reg.UC_X86_REG_XMM8, 0.0)
        # This incoming bound is the largest f32 below 2**32, not f32(u32::MAX).
        at = pe.rva_offset(0x1461aae70 - pe.image_base)
        native.scalar(reg.UC_X86_REG_XMM10, struct.unpack_from('<f', image, at)[0])
        native.put(native.bp + 0x50, '<I', kills)
        native.put(native.bp + 0x5c, '<I', bosses)
        native.put(native.bp + 0x74, '<I', rank)
        native.put(native.bp + 0x280, '<Q', native.app)
        native.put(native.app + 0x1a40, '<f', case['veteran'])
        native.run(0x145b2852b)
        actual = list(native.get(native.bp + 0xc0, '<7q'))
        assert actual == model(case), (case, actual, model(case))
        vectors.append(dict(inputs=case, parts=actual))
    conversions = []
    for bits in [0x00000000, 0x80000000, 0x3f000000, 0xbf800000,
                 0x4f7ffffe, 0x4f7fffff, 0x4f800000, 0x4f800001,
                 0x7f7fffff, 0x7f800000, 0xff800000, 0x7fc00000]:
        value = struct.unpack('<f', struct.pack('<I', bits))[0]
        native.reset('u32-conversion', [(0x145b2863a, 0x145b28657)], {0x145b28657})
        u.reg_write(reg.UC_X86_REG_XMM0, bits)
        native.scalar(reg.UC_X86_REG_XMM8, 0.0)
        at = pe.rva_offset(0x1461aae70 - pe.image_base)
        native.scalar(reg.UC_X86_REG_XMM10, struct.unpack_from('<f', image, at)[0])
        native.run(0x145b2863a)
        actual = u.reg_read(reg.UC_X86_REG_RAX)
        # Rust `as u32` saturates at u32::MAX. Native compares against the
        # preceding representable float, then selects MAX (it does not clamp
        # the float to that preceding value). NaN/negative results select 0.
        assert actual == math.cast(value, 0, 0xffffffff), (hex(bits), actual)
        conversions.append((hex(bits), actual))
    party = []
    for rank, enabled, remotes in itertools.product(range(256), [0, 1, 2], [0, 1, 5]):
        native.reset('party-rank', [(0x145bc28c0, 0x145bc2a09)], {native.done})
        u.reg_write(reg.UC_X86_REG_RCX, native.mem + 0x8000)
        u.reg_write(reg.UC_X86_REG_RDX, native.app)
        native.put(native.app + 0xd2a, '<B', enabled)
        native.put(native.app + 0xa18, '<Q', remotes)
        native.put(native.app + 0x36f, '<B', rank)
        native.run(0x145bc28c0)
        present = native.get(native.mem + 0x8000, '<q')[0] != -1
        assert present == (enabled == 1 and remotes != 0)
        if present:
            assert bool(native.get(native.mem + 0x8034, '<B')[0]) == (rank >= 3)
        party.append((rank, enabled, remotes, present))
    source = lambda path: (ROOT / 'crates/azeroth-survivors-re/src' / path).read_text()
    compact = lambda value: re.sub(r'\s+', '', value)
    summary = compact(source('gameplay/mechanics/progression.rs'))
    assert 'pubfnheroic_rank(&self)->u8' in summary
    assert 'self.replica_state().map_or(self.rules.heroic_rank,|state|state.heroic_rank)' in summary
    assert 'Some(run_progression::talent_experience_parts_heroic(' in summary
    assert 'full_reward:state.heroic_rank>=3' in summary
    assert 'normalized_kills:self.kills' in summary
    cached = compact(source('gameplay/guest_settlement.rs'))
    assert 'run_progression::talent_experience_parts_heroic(' in cached
    assert 'full_reward:projection.heroic_rank>=3' in cached
    assert 'normalized_kills:projection.kills' in cached
    assert 'flag_34:self.heroic_rank()>=3' in compact(source('gameplay/mechanics/coop.rs'))
    assert '"Heroic","Veteran\'sLessons"' in compact(source('gameplay/client/events.rs'))
    assert 'crate::heroic::reward_multiplier(rank.min(5))' in compact(source('run_progression.rs'))
    assert 'full_reward:heroic_rank>=3' in compact(source('account_progression.rs'))
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin', ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    rustfmt = query.shared_root() / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    for path in proof['source_paths']:
        parsed = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'], input=(ROOT / path).read_text(), text=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, (path, parsed.stderr)
    digest = lambda rows: hashlib.sha256(json.dumps(rows, sort_keys=True, separators=(',', ':')).encode()).hexdigest()
    result = dict(target_sha256=target['sha256'], xp_cases=len(vectors), xp_vectors_sha256=digest(vectors),
                  party_rank_cases=len(party), party_vectors_sha256=digest(party), original_instruction_steps=native.instructions,
                  u32_conversion_cases=len(conversions), u32_conversion_vectors=conversions,
                  retained_queries_verified=len(proof['queries']), rust_syntax_paths=len(proof['source_paths']),
                  live_source_connections='pass', compilation='not_run', runtime='not_run', parity='unverified',
                  seams=['zone-key ordinal', 'Windows CRT roundf', 'empty party-event clone'])
    if args.write:
        (PROOF.parent / 'static-check.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
