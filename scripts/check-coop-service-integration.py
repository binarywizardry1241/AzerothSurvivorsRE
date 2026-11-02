#!/usr/bin/env python3
"""Verify bounded service lifecycle bytes, clock branches and source consumers.

No Rust compilation, sockets, ECS/game execution or parity comparison. Native
clock branch checks execute original compare/jump instructions only; source
connectivity checks are textual guards, not executed Rust tests.
"""
import hashlib
import json
import math
from pathlib import Path
import re
import struct

from coverage_common import ROOT, latest_target, target_bytes
from script_sources import load_script

shared = load_script('coop_service_integrity', ROOT/'scripts/check-coop-ui.py')
SHA = '0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c'
target = latest_target(verify=True)
assert target['sha256'] == SHA
data = target_bytes(target)
pe = load_script('pe', ROOT/'scripts/inventory-executable.py').PE(data)
path = ROOT/'docs/analysis/evidence/0.115.0/coop-forms/lifecycle.json'
manifest = json.loads(path.read_text())
assert manifest['target']['sha256'] == SHA
for row in manifest['functions'] + manifest.get('canonical_owner_refs', []):
    start, end = int(row['start'],16), int(row['end_exclusive'],16)
    offset = pe.rva_offset(start-pe.image_base)
    assert hashlib.sha256(data[offset:offset+end-start]).hexdigest() == row['sha256'], row['start']
for name, digest in manifest['extracts'].items():
    assert hashlib.sha256((path.parent/name).read_bytes()).hexdigest() == digest, name

class Branch(shared.Native):
    def hook(self, cpu, pc, size, context):
        if pc in self.destinations:
            self.destination = pc
            cpu.emu_stop()
            return
        super().hook(cpu, pc, size, context)

cases=[]
for pc, yes, no, threshold, strict in [
    (0x145816E48,0x145816E51,0x145816E5E,8.0,True),
    (0x145817E94,0x145817EA1,0x145817F43,30.0,False),
]:
    for value in [0., threshold-0.000003814697265625, threshold,
                  threshold+0.000003814697265625, float('inf'), float('nan')]:
        probe=Branch(data,pe,[(0x145816DB0,0x145817F6D)])
        probe.destinations=(yes,no);probe.destination=None
        probe.reg('XMM1',int.from_bytes(struct.pack('<f',value),'little'))
        probe.cpu.emu_start(pc,0,count=3)
        chosen=not math.isnan(value) and (value>threshold if strict else value>=threshold)
        assert probe.destination==(yes if chosen else no),(pc,value,probe.destination)
        cases.append({'site':hex(pc),'elapsed':str(value),'branch':hex(probe.destination)})

base=ROOT/'crates/azeroth-survivors-re/src'
files={name:(base/name).read_text() for name in [
    'coop_directory.rs','coop_runtime.rs','coop_profile.rs','gameplay/coop.rs',
    'coop/session.rs','main.rs','coop_ui.rs','coop_forms.rs','coop/service.rs']}
compact=lambda value:re.sub(r'\s+','',value)
guards={
 'coop_directory.rs':[
  'DirectorySocket::connect(&url)','socket.send_binary(bytes)','SocketEvent::Binary(bytes)',
  'state.load(Ordering::Acquire) == 1','Worker::connected','socket.should_sleep()',
  'view.bypass_change_detection().take_requests()',
  'menu.commit_pick(&catalog);','menu.drain_backend_commands(&catalog);',
  'menu.in_run || runtime.driver.is_some()',
  'ClientMessage::Host','ClientMessage::Join','Session::service_host','Session::service_join',
  'driver.service_party_closed()','driver.service_lost()',
  'ClientMessage::ProfileRequest { guid, name }','DirectoryResponse::Structured29',
  'service.worker.is_some() && view.code.as_ref().is_some_and(|code| !code.is_empty())',
  'Worker::open(url)','ClientMessage::Authenticate','ClientMessage::Heartbeat',
  'last.elapsed().as_secs_f32() >= 30.0','started.elapsed().as_secs_f32() > 8.0',
  'if service.secondary.is_none()','secondary.submit(message)',
  'secondary.submit(ClientMessage::Kick(id))','service.worker = None',
  'menu.backend_save.unlock_value(menu.backend_pick().hero.class)',
  'staff_key_path','WOW_ROGUE_STAFF_KEY','XDG_DATA_HOME','staff.key',
 ],
 'coop_runtime.rs':['roster_profile','CoopSet::Flush','driver.denial.is_none()',
                     'view.status = "refused"','view.status = "joined"'],
 'coop_profile.rs':['profile.value_60 == world_guid','profile.bytes_18.as_slice() == pick.clone().normalized().name.as_bytes()'],
 'gameplay/coop.rs':['runtime.roster_profile.clone()'],
 'coop/session.rs':['Arc<Mutex<HashMap<u32, RelayEndpoint>>>','pub fn service_party_closed',
                    'pub fn service_peer_open','pub fn service_receive','pub fn take_service_commands'],
 'main.rs':['mod coop_directory;','.add_plugins(coop_directory::CoopDirectoryPlugin)'],
 'coop_ui.rs':['FormRequest::Refresh','Click::Submit','self.forms.join()','self.forms.host(',
               'Field::JoinPassword','pub role: String','pub code: Option<String>'],
 'coop_forms.rs':['Self::Description => 120','Self::Code => 5','character.is_control()',
                  'character.is_ascii_alphanumeric()','value.pop()'],
 'coop/service.rs':['Self::ProfileRequest','Self::Heartbeat => out.push(9)','out.push(10)',
                    'Self::Authenticate','out.push(11)'],
}
count=0
for name,tokens in guards.items():
    source=compact(files[name])
    for token in tokens:
        assert compact(token) in source,(name,token)
        count+=1
assert files['coop_directory.rs'].index('directory_lifetime::idle_due(') < files['coop_directory.rs'].index('let requests =')
assert files['coop_directory.rs'].index('for (from_secondary, event) in received') < files['coop_directory.rs'].index('let requests =')
assert files['coop_directory.rs'].index('for (from_secondary, event) in received') < files['coop_directory.rs'].index('let now = Instant::now();')
assert files['coop_directory.rs'].index('for command in driver.take_service_commands()') < files['coop_directory.rs'].index('service.send(ClientMessage::ProfileRequest')
assert 'service_guest_active' in files['coop/session.rs']
assert 'if secondary && !host' in files['coop_directory.rs']
assert 'driver.service_peer_closed(0)' in files['coop_directory.rs']
assert 'std::mem::take(&mut runtime.service_commands)' in files['coop_directory.rs']
assert 'service_commands' in files['coop_runtime.rs']
assert 'runtime.close_lost_driver()' in files['gameplay/coop.rs']
assert 'runtime.transport_lost && !runtime.is_guest()' in files['gameplay/coop.rs']
assert files['gameplay/coop.rs'].index('for incoming in std::mem::take(&mut runtime.incoming)') < files['gameplay/coop.rs'].index('// Native guest receive dispatches its final buffered frames')
assert 'self.local_events.extend(driver.take_events())' in files['coop_runtime.rs']
assert 'self.service_commands.extend(driver.take_service_commands())' in files['coop_runtime.rs']


assert files['gameplay/coop.rs'].count('runtime.roster_profile.clone()')==2
assert not files['coop_profile.rs'].startswith('/Users/')
for forbidden in ['DirectTcp::Host','DirectTcp::Join','TcpConnection::connect','send_text(']:
    assert forbidden not in files['coop_directory.rs'],forbidden
out=ROOT/'runtime/coop-service-integration-0.115.0';out.mkdir(exist_ok=True)
(out/'checks.json').write_text(json.dumps({'target_sha256':SHA,'native_clock_cases':cases,
    'source_guards':count,'source_executed':False,'compiled':False,'network_executed':False,
    'parity':'unverified'},indent=2)+'\n')
print(f'PASS {len(cases)} native clock boundaries, {count} source guards and current lifecycle hashes; Rust/network/game/parity unverified')
