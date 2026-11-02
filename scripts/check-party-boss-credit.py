#!/usr/bin/env python3
"""Check repaired boss-credit source against retained native proof; compile no code."""
import argparse
import hashlib
import json
from pathlib import Path
import platform
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
EVIDENCE = ROOT / 'docs/analysis/evidence/0.120.2/party-achievement-share'
PREFIX = 'crates/azeroth-survivors-re/src/'


def require(value, message):
    if not value:
        raise ValueError(message)


def compact(text):
    return re.sub(r'\s+', '', re.sub(r'//[^\n]*', '', text))


def body(text, name):
    text = compact(text)
    start = text.index('{', text.index('fn' + name + '(')) + 1
    end, depth = start, 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end - 1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output')
    args = parser.parse_args()
    proof = json.loads((EVIDENCE / 'source-repair.json').read_text())
    require(hashlib.sha256((ROOT / proof['checker']['path']).read_bytes()).hexdigest()
            == proof['checker']['sha256'], 'Source checker commitment changed')
    source = {}
    for path, expected in proof['source_sha256'].items():
        raw = (ROOT / path).read_bytes()
        require(hashlib.sha256(raw).hexdigest() == expected, 'Source review changed: ' + path)
        source[path] = raw.decode()
    native = subprocess.run([sys.executable, '-B', str(ROOT / 'scripts/check-party-achievement-share.py'),
        '--require-retained-queries', '--source-at', proof['pre_repair_commit']],
        cwd=ROOT, check=True, capture_output=True, text=True, timeout=60)
    native = json.loads(native.stdout)
    require(native['target_sha256'] == proof['target_sha256'], 'Target binding differs')
    bosses = compact(source[PREFIX + 'gameplay/mechanics/bosses.rs'])
    coop = compact(source[PREFIX + 'gameplay/mechanics/coop.rs'])
    distribute = body(coop, 'distribute_party_rewards')
    hit = body(bosses, 'hit_boss')
    capture = hit.index('letkilling_blow=')
    shared = hit.index('ifself.boss_state.shared_equipment.is_some(){', capture)
    require(hit.index('if!result.lethal{') < capture < shared < hit.index('row.actor.dead=true;'),
            'Lethal capture must precede death callbacks')
    for anchor in ['spell_id:azeroth_survivors_re::account_progression::killing_spell(hit.spell_id)',
                   'school:hit.school', 'source_kind:self.attribution.source_kind',
                   'killing_blow_is_melee(self.attribution.source_kind,hit.spell_id,)',
                   'self.generic.killing_blows.push((killing_blow.boss_id,killing_blow.spell_id))',
                   'self.generic.boss_killing_blows.push(killing_blow)',
                   'shared_killing_blows.push((self.party_healing.source_slot,killing_blow))',
                   'members:self.boss_state.party_feats.members.clone()']:
        require(anchor in hit, 'Lethal metadata/producer missing: ' + anchor)
    fields = coop[coop.index('hero_state!{'):coop.index('#[derive(Clone,Copy,Debug)]pubstructPartyInput')]
    require('shared_killing_blows' not in fields and 'shared_killing_blows:Vec<' in bosses,
            'Credit queue must belong to shared BossState')
    require('source_slot:self.active_slot' in body(coop, 'healing_port'), 'Killer slot producer changed')
    drain = distribute.index('letkilling_blows=std::mem::take(&mutself.boss_state.shared_killing_blows)')
    recipients = distribute.index('for(slot,_)inself.party_members()')
    receive = distribute.index('for&(killer,hit)in&killing_blows')
    dead = distribute.index('ifgame.dead{')
    require(drain < recipients < receive < dead, 'History drain/recipient/dead ordering changed')
    require('if!game.abandoned{for&(killer,hit)in&killing_blows{ifkiller==slot{continue;}' in distribute,
            'History admission must exclude killer/abandoned, independently of HP/phase')
    require('game.effect_state.generic.killing_blows.push((hit.boss_id,hit.spell_id))' in distribute
            and 'game.effect_state.generic.boss_killing_blows.push(hit)' in distribute
            and 'damaged_by_bosses' not in distribute, 'Recipient history copy changed')
    tick = body(coop, 'tick_party')
    require(tick.index('self.tick_actor_frame(') < tick.index('self.distribute_party_rewards();')
            < tick.rindex('self.capture_party('), 'Credit must follow simulation and precede publication')
    state = body(coop, 'native_state')
    for anchor in ['.killing_blows()', '.boss_killing_blows()', 'words:self.damaged_by_bosses().to_vec()', 'self.boss_kills()']:
        require(anchor in state, 'Recipient state consumer missing: ' + anchor)
    for path, anchors in proof['consumer_anchors'].items():
        text = compact(source[path])
        for anchor in anchors:
            require(compact(anchor) in text, 'Consumer connection changed: ' + path + ' ' + anchor)
    stages = proof['source_status']
    if stages['196'] == 'source_connected_static_checked':
        increment = distribute.index('game.boss_state.death.boss_kills=game.boss_state.death.boss_kills.wrapping_add(1)')
        require(recipients < distribute.index('if!game.abandoned{')
                < distribute.index('ifcollector==game.player_guid{continue;}') < increment < receive < dead,
                'Counter admission/order differs')
        require(distribute.count('boss_kills.wrapping_add(1)') == 1, 'Duplicate recipient increment')
    else:
        require('boss_kills.wrapping_add(1)' not in distribute, 'Counter repair status is stale')
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    rustfmt = ROOT / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    require(rustfmt.is_file(), 'Existing Rust syntax parser unavailable')
    for path in proof['rust_syntax_paths']:
        result = subprocess.run([str(rustfmt), '--edition', '2024', '--emit', 'stdout',
            '--config', 'skip_children=true'], input=source[path], cwd=ROOT, text=True,
            stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        require(result.returncode == 0, path + ': ' + result.stderr)
    result = dict(target_sha256=proof['target_sha256'], native_ranges=native['native_ranges'],
        native_instructions=native['native_instructions'], retained_queries_verified=native['retained_queries_verified'],
        native_counter_cases=native['counter_cases'], native_history_cases=native['history_cases'],
        source_status=stages, source_files=len(source), rust_syntax_files=len(proof['rust_syntax_paths']),
        authored_unrun_regressions=proof['authored_unrun_regressions'],
        limits=['Static source guards and syntax parsing do not execute Rust or prove compilation.',
                'Native windows use scratch memory, preallocated vectors and the recorded equipment callback seam.',
                'Original pre-repair observations remain bound to their exact historical Git source.',
                'No application compilation, Rust tests, client/game/server/network execution, save I/O or parity comparison.'])
    if args.output:
        output = (ROOT / args.output).resolve()
        require(output.is_relative_to(ROOT), 'Output leaves checkout')
        output.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
