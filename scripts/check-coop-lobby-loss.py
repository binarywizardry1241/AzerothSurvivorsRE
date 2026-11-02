#!/usr/bin/env python3
"""Replay bounded native lobby-retention gates and inspect live source; no builds.

Transport-state and ordinary lock seams are covered by the canonical predicate
fixture. This replay stops before native cleanup calls. Rust is parsed only;
queue-only Rust regressions are authored but are not compiled or executed.
"""
import hashlib
import itertools
import json
import platform
from pathlib import Path
import re
import struct
import subprocess
import sys

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

sys.path.insert(0, str(ROOT / 'runtime/armory-recovery/python-libs'))
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn import x86_const as reg

SHA = '291c281bd0a4255fdb3d04b2e442121e2df144f388f16de086b430e875aaad08'
PROOF = ROOT / 'docs/analysis/evidence/0.120.0/coop-correspondence/manifest.json'
DIR = 'crates/azeroth-survivors-re/src/coop_directory.rs'
SESSION = 'crates/azeroth-survivors-re/src/coop/session.rs'


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def block(text, marker):
    start = text.index('{', text.index(marker))
    depth = 1
    for end in range(start + 1, len(text)):
        depth += (text[end] == '{') - (text[end] == '}')
        if not depth:
            return text[start + 1:end]
    raise AssertionError(marker)


def compact(text):
    return re.sub(r'\s+', '', re.sub(r'//[^\n]*', '', text))


def native(target, blob, pe):
    proof = json.loads(PROOF.read_text())
    assert proof['target']['sha256'] == target['sha256'] == SHA
    for role in ('selected-relay-closed', 'selected-relay-alive', 'run-retention-gates', 'service-pump'):
        row = next(row for row in proof['ranges'] if row['role'] == role)
        start, end = int(row['start'], 16), int(row['end_exclusive'], 16)
        off = pe.rva_offset(start - pe.image_base)
        assert off == int(row['file_offset'], 16)
        assert digest(blob[off:off + end - start]) == row['sha256']
        assert digest((ROOT / row['assembly']['path']).read_bytes()) == row['assembly']['sha256']
    for role in ('relay-closed', 'relay-alive', 'frame-lifetimes'):
        row = next(row for row in proof['queries'] if row['role'] == role)
        raw = (ROOT / row['result']['path']).read_bytes()
        assert digest(raw) == row['result']['sha256']
        result = json.loads(raw)['structuredContent']
        assert result['subject']['digest']['sha256'] == SHA
        assert result['evidence_id'] == row['evidence_id']
        assert digest(result['normalized_result'].encode()) == row['normalized_text_sha256']
    # Reuse the canonical original-instruction predicate cases, not an inferred
    # replacement of their mutex/optional-field and state-byte contracts.
    from script_sources import current_path, recorded_input_matches
    replay = current_path(ROOT / proof['replay_tool']['path'])
    assert recorded_input_matches(replay, proof['replay_tool']['sha256'])
    result = subprocess.run([sys.executable, '-B', str(replay)], cwd=ROOT,
                            text=True, capture_output=True, check=True, timeout=60)
    predicates = json.loads(result.stdout)
    assert predicates['native_cases'] == 36 and predicates['native_instructions'] == 1458

    cpu = Uc(UC_ARCH_X86, UC_MODE_64)
    page = 0x145b08000
    cpu.mem_map(page, 0x2000)
    off = pe.rva_offset(page - pe.image_base)
    cpu.mem_write(page, blob[off:off + 0x2000])
    base = 0x200000000
    cpu.mem_map(base, 0x10000)
    stack, game = base + 0x4000, base + 0x8000
    put = lambda address, value: cpu.mem_write(address, struct.pack('<Q', value))
    stops = {0x145b08a15: 'relay_failure', 0x145b08ad0: 'service_failure',
             0x145b09235: 'retain', 0x145b08b5d: 'retain'}
    observed = []
    instructions = 0
    present, secondary_state = False, 0

    def hook(machine, pc, size, unused):
        nonlocal instructions
        if pc in stops:
            observed.append(stops[pc])
            machine.emu_stop()
            return
        if pc in (0x145b08a07, 0x145b08ac2):
            assert machine.reg_read(reg.UC_X86_REG_RCX) == stack + 0xb30
            closed = pc == 0x145b08a07
            answer = present and ((secondary_state == 2) if closed else (secondary_state != 2))
            machine.reg_write(reg.UC_X86_REG_RAX, int(answer))
            machine.reg_write(reg.UC_X86_REG_RIP, pc + 5)
            return
        assert 0x145b08972 <= pc < 0x145b08b5d, hex(pc)
        instructions += 1

    cpu.hook_add(UC_HOOK_CODE, hook)
    cases = []
    for failed, role, present, secondary_state in itertools.product(
            (False, True), (0, 1, 2, 3, 4, 255), (False, True), (0, 1, 2)):
        put(stack + 0xc80, game)
        put(game + 0xca0, role)
        cpu.reg_write(reg.UC_X86_REG_RBP, stack)
        cpu.reg_write(reg.UC_X86_REG_RSP, stack - 0x1000)
        cpu.reg_write(reg.UC_X86_REG_RSI, 0)
        observed.clear()
        cpu.emu_start(0x145b089d7 if failed else 0x145b08972, 0, count=100)
        expected = ('relay_failure' if role == 3 and present and secondary_state == 2
                    else 'service_failure' if failed and (role == 2 or not present or secondary_state == 2)
                    else 'retain')
        assert observed == [expected], (failed, role, present, secondary_state, observed, expected)
        cases.append(dict(primary_failed=failed, native_role=role, secondary_present=present,
                          secondary_state=secondary_state, result=expected))
    return dict(predicate_cases=36, predicate_instructions=1458, gate_cases=len(cases),
                gate_instructions=instructions, callback_seams='verified selected-secondary predicates; stops before cleanup',
                cases=cases)


def source():
    directory = compact((ROOT / DIR).read_text())
    session = compact((ROOT / SESSION).read_text())
    close = block(directory, 'fntransport_closed(')
    gate = close[:close.index('letsecondary=')]
    assert 'if!secondary&&(host||runtime.is_guest())&&runtime.driver.as_ref().is_some_and(|driver|driver.is_service())&&service.secondary.as_ref().is_some_and(|worker|!worker.closed()){return;}' in gate
    assert 'Worker::connected' not in gate
    assert close.index('return;') < close.index('service.worker=None;') < close.index('driver.service_lost();')
    assert 'secondary||(host&&service.secondary.as_ref().is_some_and(Worker::closed))' in close
    guest = block(close, 'ifsecondary&&!host')
    assert 'driver.service_peer_closed(0);' in guest
    assert 'runtime.transport_lost=true;' in block(close, 'ifhost')
    heartbeat = block(directory, 'fnheartbeat(')
    assert 'self.worker.as_ref().filter(|worker|worker.connected())' in heartbeat
    assert 'self.secondary.as_ref().filter(|worker|worker.connected())' in heartbeat
    assert heartbeat.count('worker.submit(ClientMessage::Heartbeat);') == 1
    assert heartbeat.count('secondary.submit(ClientMessage::Heartbeat);') == 1
    poll = block(directory, 'fnpoll(')
    deadline = block(poll[poll.index('letnow=Instant::now();'):], 'ifservice.worker.is_some()')
    assert 'last.elapsed().as_secs_f32()>=30.0' in deadline and 'service.heartbeat();' in deadline
    assert 'secondary.take().into_iter().map(|event|(true,event))' in poll
    assert 'driver.is_hosting())&&service.secondary.as_ref().is_some_and(Worker::closed)' in poll
    sending = block(directory, 'fnsend_relay(')
    assert 'ifservice.secondary.is_none(){service.send(message.clone());}' in sending
    assert 'secondary.submit(message);' in sending
    assert 'service.secondary=None;' in block(sending, 'RelayCommand::Leave=>')
    assert 'service_alive' not in session and 'relay_alive:bool' in session
    assert 'self.service&&self.relay_alive&&self.is_hosting()' in block(session, 'pubfnconnected(')
    assert 'self.relay_alive' in block(session, 'pubfnservice_peer_open(')
    assert 'self.relay_alive=false;' in block(session, 'pubfnservice_lost(')
    assert 'self.relay_alive=false;' in block(session, 'pubfnclose(')
    # Real failure and explicit departure still flow into gameplay settlement.
    runtime = compact((ROOT / 'crates/azeroth-survivors-re/src/coop_runtime.rs').read_text())
    assert 'if!driver.is_hosting()&&!driver.connected()' in runtime
    assert 'runtime.transport_lost=true;' in runtime
    leave = block(poll, 'FormRequest::Leave=>')
    assert leave.index('driver.close();') < leave.index('send_relay(&mutservice,command);')
    assert 'runtime.shared_running=false;' in leave and 'view.status="off".into();' in leave
    syntax_files = [DIR, SESSION]
    host = {('Darwin', 'arm64'): 'aarch64-apple-darwin', ('Darwin', 'x86_64'): 'x86_64-apple-darwin',
            ('Linux', 'aarch64'): 'aarch64-unknown-linux-gnu', ('Linux', 'x86_64'): 'x86_64-unknown-linux-gnu'}
    parser = ROOT / '.tools/rust' / ('1.98.1-' + host[(platform.system(), platform.machine())]) / 'bin/rustfmt'
    assert parser.is_file()
    for path in syntax_files:
        parsed = subprocess.run([str(parser), '--edition', '2024', '--emit', 'stdout', '--config', 'skip_children=true'],
                                input=(ROOT / path).read_text(), cwd=ROOT, text=True,
                                stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=30)
        assert parsed.returncode == 0, (path, parsed.stderr)
    return dict(live_source_guards=True, rust_syntax_files=len(syntax_files),
                authored_uncompiled_unrun_regressions=5)


def main():
    target = latest_target(verify=True)
    blob = target_bytes(target)
    pe = load_script('lobby_loss_pe', ROOT / 'scripts/inventory-executable.py').PE(blob)
    result = native(target, blob, pe)
    heartbeat = load_script('lobby_loss_heartbeat', ROOT / 'scripts/check-coop-heartbeat.py').replay()
    result['heartbeat'] = heartbeat
    result.update(source())
    receipt_path = ROOT / 'docs/analysis/evidence/0.120.0/coop-lobby-loss/manifest.json'
    if receipt_path.exists():
        proof = json.loads(receipt_path.read_text())
        assert proof['target_sha256'] == SHA
        for row in proof['files']:
            assert digest((ROOT / row['path']).read_bytes()) == row['sha256'], row['path']
        assert proof['native_cases'] == result['predicate_cases'] + result['gate_cases'] + heartbeat['native_cases']
        assert proof['native_instructions'] == result['predicate_instructions'] + result['gate_instructions'] + heartbeat['native_instructions']
    result.update(target_sha256=SHA, compilation=False, rust_executed=False,
                  game_network_server_executed=False, parity_verified=False)
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
