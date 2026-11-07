#!/usr/bin/env python3
"""Check every explicitly hash-bound historical evidence range against current bytes.

Only installed selected-target bytes are read. Historical addresses/offsets are
hypotheses, never silently reused. Matching range bytes alone do not revalidate
its callers, data dependencies, producer/consumer contract or behavior.
"""
import argparse
from collections import Counter
import hashlib
import importlib.util
import json
import os
import re
import shutil
import sqlite3
import struct
import subprocess
import tempfile
import time
import zlib
from functools import lru_cache
from pathlib import Path
from coverage_common import ROOT, latest_target, target_bytes, load_json, json_text, file_sha256, project_path, artifact_path, same_artifact
from artifact_history import has_archived_artifact, iter_artifact_paths, read_artifact
from shared_analysis import SharedAnalysis, canonical, file_digest, require_primary_checkout

LEGACY_SEARCH_ALGORITHM='python-bytes-find-first-two-v1'
SEARCH_ALGORITHM='node-aho-corasick-anchor16-first-two-v1'
PREIMAGE_SCHEMA='historical-range-preimages-v2'
CACHE_SCHEMA='''
CREATE TABLE IF NOT EXISTS historical_range_search (
 target_sha256 TEXT NOT NULL, range_sha256 TEXT NOT NULL, byte_count INTEGER NOT NULL,
 algorithm TEXT NOT NULL, first_offset INTEGER NOT NULL, second_offset INTEGER NOT NULL,
 PRIMARY KEY(target_sha256,range_sha256,byte_count,algorithm)) WITHOUT ROWID;
CREATE TABLE IF NOT EXISTS historical_preimage_sets (
 identity_sha256 TEXT PRIMARY KEY, identity TEXT NOT NULL, payload_sha256 TEXT NOT NULL,
 payload_bytes INTEGER NOT NULL);
'''


class HistoricalCache:
    """Shared exact searches and source-bound preimages; never cached owners.

    Verification opens the existing catalog read-only and never creates a store,
    object, table or alias. --write publishes one compressed preimage bundle and
    batched search rows. Every cache result remains subordinate to exact hashes.
    """
    def __init__(self, target_sha256, root=None, write=False, algorithm=SEARCH_ALGORITHM):
        self.root=Path(root or ROOT).resolve();require_primary_checkout(self.root)
        self.target=target_sha256;self.algorithm=algorithm;self.write=write
        self.store=SharedAnalysis(self.root) if write else None
        self.connection=None;self.pending={};self.searches={};self.legacy_searches={};self.tables=set()
        self.image=None
        self.metrics=dict(search_hits=0,search_misses=0,legacy_search_hits=0,search_wall_seconds=0.0,
                          search_rows_published=0,search_publication_seconds=0.0,
                          preimage_hits=0,preimage_misses=0,preimage_wall_seconds=0.0)
        database=self.root/'runtime/analysis/knowledge.sqlite'
        if database.is_symlink():raise ValueError('Shared analysis catalog must not be redirected')
        if write:
            with self.store.connect() as connection:connection.executescript(CACHE_SCHEMA)
        if database.exists():
            self.connection=sqlite3.connect(database.as_uri()+'?mode=ro',uri=True,timeout=60)
            self.connection.execute('PRAGMA query_only=ON')
            self.tables={row[0] for row in self.connection.execute("SELECT name FROM sqlite_master WHERE type='table'")}
            if 'historical_range_search' in self.tables:
                self.searches={(digest,length):(first,second) for digest,length,first,second in self.connection.execute(
                    'SELECT range_sha256,byte_count,first_offset,second_offset FROM historical_range_search WHERE target_sha256=? AND algorithm=?',
                    (self.target,self.algorithm))}
                if self.algorithm==SEARCH_ALGORITHM:
                    self.legacy_searches={(digest,length):(first,second) for digest,length,first,second in self.connection.execute(
                        'SELECT range_sha256,byte_count,first_offset,second_offset FROM historical_range_search WHERE target_sha256=? AND algorithm=?',
                        (self.target,LEGACY_SEARCH_ALGORITHM))}

    def close(self):
        if self.connection is not None:self.connection.close();self.connection=None

    def verify_search(self,image,raw,value):
        if not isinstance(value,(tuple,list)) or len(value)!=2 or any(type(offset) is not int for offset in value):
            raise ValueError('Historical search cache offsets differ')
        first,second=value
        if first < -1 or second < -1 or (first<0 and second>=0) or (second>=0 and second<=first):
            raise ValueError('Historical search cache offsets differ')
        for offset in value:
            if offset>=0 and image[offset:offset+len(raw)]!=raw:
                raise ValueError('Historical search cache bytes differ')
        return first,second

    def search_many(self,image,ranges,image_path=None):
        """Search unique commitments once, publishing intrinsic facts before joins.

        Legacy producer rows remain under their original algorithm key. They can
        satisfy an exact query after target/digest/offset validation, but are
        never copied into the new producer namespace.
        """
        started=time.perf_counter()
        try:
            if image is not self.image:
                if not isinstance(image,bytes) or hashlib.sha256(image).hexdigest()!=self.target:
                    raise ValueError('Historical search image differs from selected target')
                self.image=image
            unique={}
            for raw,digest in ranges:
                if not raw or hashlib.sha256(raw).hexdigest()!=digest:
                    raise ValueError('Historical search preimage length/digest differs')
                unique[(digest,len(raw))]=raw
            result={};missing={}
            for key,raw in unique.items():
                value=self.searches.get(key)
                if value is None and key in self.legacy_searches:
                    value=self.legacy_searches[key];self.metrics['legacy_search_hits']+=1
                if value is None:missing[key]=raw;self.metrics['search_misses']+=1
                else:result[key]=self.verify_search(image,raw,value);self.metrics['search_hits']+=1
            bulk=None
            if missing and image_path is not None and self.algorithm==SEARCH_ALGORITHM:
                fallback={}
                bulk=bulk_search(image_path,self.target,len(image),missing,fallback)
                if fallback:self.metrics['bulk_search_fallback']=fallback
            if bulk is not None:
                values,metrics=bulk;self.metrics['bulk_search']=metrics
                for key,raw in missing.items():
                    result[key]=self.verify_search(image,raw,values[key]);self.searches[key]=result[key]
                    if self.write:self.pending[(*key,SEARCH_ALGORITHM)]=result[key]
                self.publish_searches()
            else:
                # Installed Node is optional. Native bytes.find remains the
                # exact fallback, and keeps its own producer identity.
                published_at=time.perf_counter()
                for key,raw in missing.items():
                    first=image.find(raw);value=(first,image.find(raw,first+1) if first>=0 else -1)
                    result[key]=value;self.searches[key]=value
                    if self.write:self.pending[(*key,LEGACY_SEARCH_ALGORITHM)]=value
                    if len(self.pending)>=256 or time.perf_counter()-published_at>=1:
                        self.publish_searches();published_at=time.perf_counter()
                self.publish_searches()
            return result
        finally:self.metrics['search_wall_seconds']+=time.perf_counter()-started

    def search(self,image,raw,digest):
        return self.search_many(image,[(raw,digest)])[(digest,len(raw))]

    def publish_searches(self):
        """Durable exact facts do not depend on source revision or current owners."""
        if not self.write or not self.pending:return
        started=time.perf_counter()
        with self.store.lock(),self.store.connect() as connection:
            for (digest,length,algorithm),(first,second) in self.pending.items():
                args=(self.target,digest,length,algorithm)
                existing=connection.execute('SELECT first_offset,second_offset FROM historical_range_search WHERE target_sha256=? AND range_sha256=? AND byte_count=? AND algorithm=?',args).fetchone()
                if existing is not None and existing!=(first,second):raise ValueError('Historical exact-search publication differs')
                connection.execute('INSERT OR IGNORE INTO historical_range_search VALUES(?,?,?,?,?,?)',(*args,first,second))
        self.metrics['search_rows_published']+=len(self.pending);self.pending.clear()
        self.metrics['search_publication_seconds']+=time.perf_counter()-started

    def preimages(self,identity):
        started=time.perf_counter()
        try:
            key=hashlib.sha256(canonical(identity).encode()).hexdigest()
            row=None
            if self.connection is not None and 'historical_preimage_sets' in self.tables:
                row=self.connection.execute('SELECT identity,payload_sha256,payload_bytes FROM historical_preimage_sets WHERE identity_sha256=?',(key,)).fetchone()
            if row is None:
                self.metrics['preimage_misses']+=1;return None
            if row[0]!=canonical(identity):raise ValueError('Historical preimage identity differs')
            path=self.root/'runtime/analysis/objects'/row[1][:2]/row[1]
            if path.is_symlink() or not path.is_file() or path.stat().st_size!=row[2] or file_digest(path)!=row[1]:
                raise ValueError('Historical preimage object commitment differs')
            values=json.loads(zlib.decompress(path.read_bytes()))
            if values.get('schema')!=PREIMAGE_SCHEMA or values.get('identity')!=identity:
                raise ValueError('Historical preimage schema/input differs')
            result={}
            for key,value in values['preimages'].items():
                raw=bytes.fromhex(value[0]);record=json.loads(key)
                if len(raw)!=record[1] or hashlib.sha256(raw).hexdigest()!=record[2]:
                    raise ValueError('Historical cached preimage digest differs')
                result[key]=(raw,value[1])
            self.metrics['preimage_hits']+=1
            return result
        finally:self.metrics['preimage_wall_seconds']+=time.perf_counter()-started

    def publish(self,identity,preimages):
        if not self.write:return
        self.publish_searches()
        key=hashlib.sha256(canonical(identity).encode()).hexdigest()
        # One immutable packed object avoids a file/transaction per tiny range.
        # The evidence writer preserves field order. Keep each provenance map's
        # original order so cold and warm runs produce identical evidence bytes;
        # sort only the lookup keys and normalized identity of the packed index.
        bundle={'schema':PREIMAGE_SCHEMA,'identity':json.loads(canonical(identity)),
            'preimages':{key:[preimages[key][0].hex(),preimages[key][1]] for key in sorted(preimages)}}
        payload=zlib.compress(json.dumps(bundle,ensure_ascii=False,separators=(',',':'),allow_nan=False).encode(),9)
        receipt=self.store.put_bytes(payload,'historical-native-preimages',provenance=identity)
        with self.store.lock(),self.store.connect() as connection:
            previous=connection.execute('SELECT identity,payload_sha256,payload_bytes FROM historical_preimage_sets WHERE identity_sha256=?',(key,)).fetchone()
            value=(canonical(identity),receipt['sha256'],receipt['bytes'])
            if previous is not None and previous!=value:raise ValueError('Historical preimage publication differs for identical inputs')
            connection.execute('INSERT OR IGNORE INTO historical_preimage_sets VALUES(?,?,?,?)',(key,*value))


def bulk_search(image_path,target_sha256,size_bytes,ranges,fallback=None):
    """Use installed Node only; resource limits or absence use Python fallback."""
    node=os.environ.get('REA_NODE_BINARY')
    if not node:
        installed=Path.home()/'.nvm/versions/node/v22.22.3/bin/node'
        node=str(installed) if installed.is_file() else shutil.which('node')
    if not node:
        if fallback is not None:fallback['reason']='installed-node-unavailable'
        return None
    node=shutil.which(node) or node
    helper=ROOT/'scripts/search-historical-ranges.mjs'
    helper_digest=file_digest(helper)
    request={'schema':'historical-exact-search-v1',
        'target':{'path':str(Path(image_path).resolve()),'sha256':target_sha256,'size_bytes':size_bytes},
        'ranges':[{'sha256':digest,'byte_count':length,'hex':raw.hex()} for (digest,length),raw in ranges.items()]}
    try:
        process=subprocess.run([node,'--max-old-space-size=384',str(helper)],
            input=json.dumps(request,separators=(',',':')),text=True,capture_output=True,cwd=ROOT)
    except OSError:
        if fallback is not None:fallback['reason']='installed-node-launch-failed'
        return None
    if file_digest(helper)!=helper_digest:raise ValueError('Historical batched search helper changed during execution')
    if process.returncode==3 and process.stderr.startswith('SEARCH_LIMIT:'):
        if fallback is not None:fallback['reason']=process.stderr.strip()[:200]
        return None
    if process.returncode:raise ValueError('Historical batched search failed: '+process.stderr[:1000])
    response=json.loads(process.stdout)
    if response.get('schema')!=request['schema'] or response.get('target_sha256')!=target_sha256 or response.get('algorithm')!=SEARCH_ALGORITHM:
        raise ValueError('Historical batched search identity differs')
    values={}
    for row in response['results']:
        key=(row['sha256'],row['byte_count'])
        if key in values:raise ValueError('Historical batched search duplicate result')
        values[key]=(row['first_offset'],row['second_offset'])
    if values.keys()!=ranges.keys():raise ValueError('Historical batched search population differs')
    return values,{**response['metrics'],'algorithm':SEARCH_ALGORITHM,'helper_sha256':helper_digest,
        'node_executable_sha256':file_digest(Path(node).resolve()),'node_version':response['node_version']}


def publish_text(path,text,write):
    path=Path(path);raw=text.encode()
    if path.exists() and path.read_bytes()==raw:return False
    if not write:raise ValueError('Historical range artifact differs: '+str(path.relative_to(ROOT)))
    path.parent.mkdir(parents=True,exist_ok=True)
    fd,name=tempfile.mkstemp(prefix='.'+path.name+'-',dir=path.parent)
    try:
        with os.fdopen(fd,'wb') as stream:stream.write(raw)
        os.replace(name,path)
    finally:Path(name).unlink(missing_ok=True)
    return True


def preimage_identity(target,documents,document_hashes,string_sources):
    """Include all admitted inputs, missing candidates and extractor contracts."""
    inputs={str(path.relative_to(ROOT)):digest for path,digest in document_hashes.items()}
    candidates=set(string_sources)
    for path,document in documents:
        candidates.update(iter_artifact_paths(path.parent,'.asm'))
        values=[(document.get('assembly'),('docs/',))]
        for record in ranges(document):
            values.extend(((record.get('assembly'),('docs/',)),(record.get('raw_artifact'),('runtime/','docs/','assets/'))))
        for value,prefixes in values:
            if isinstance(value,dict):value=value.get('path')
            if not isinstance(value,str):continue
            candidate=(ROOT/value if value.startswith(prefixes) else path.parent/value).resolve()
            if candidate.is_relative_to(ROOT) and candidate.suffix.lower() not in ('.exe','.mpq'):candidates.add(candidate)
    candidates.update(ROOT/name for name in ('scripts/revalidate-historical-native-ranges.py','scripts/recover-talents.py',
        'scripts/recover-run-entry.py','scripts/recover-enemy-scaling-evidence.py','scripts/recover-notifications.py',
        'scripts/recover-balance-catalog.py','scripts/recover-pvp-gear.py'))
    for path in sorted(candidates):
        name=path.relative_to(ROOT).as_posix()
        if name not in inputs:inputs[name]=file_sha256(path) if path.is_file() or has_archived_artifact(path) else None
    # An imported Git object can make an archived asset recoverable. Changing
    # history must invalidate a cached negative preimage, even with equal docs.
    try:
        head=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,stderr=subprocess.DEVNULL,text=True).strip()
        refs=subprocess.check_output(['git','for-each-ref','--format=%(objectname)'],cwd=ROOT,stderr=subprocess.DEVNULL,text=True)
        history={'head':head,'refs':sorted(set(refs.splitlines()))}
    except (subprocess.CalledProcessError,OSError):history=None
    return {'schema':PREIMAGE_SCHEMA,'selected_target_sha256':target['sha256'],
            'inputs_sha256':hashlib.sha256(canonical(inputs).encode()).hexdigest(),'source_revision':history}

HASH=re.compile(r'[0-9a-fA-F]{64}')
def integer(value):
    if isinstance(value,int):return value
    if isinstance(value,str):return int(value,16) if value.lower().startswith('0x') else int(value)
    raise ValueError('not an encoded integer')

def target_digest(document):
    candidates=set()
    for key in ('target_sha256','reference_sha256','exe_sha256'):
        value=document.get(key)
        if isinstance(value,str) and HASH.fullmatch(value):candidates.add(value.lower())
    for key in ('target','current_target','reference_target','original_target','source_target','artifact'):
        value=document.get(key)
        if key=='artifact' and (not isinstance(value,dict) or not isinstance(value.get('path'),str) or not value['path'].lower().endswith('.exe')):continue
        if isinstance(value,dict) and isinstance(value.get('sha256'),str) and HASH.fullmatch(value['sha256']):candidates.add(value['sha256'].lower())
    subject=document.get('subject',{})
    if isinstance(subject,dict) and subject.get('format')=='pe' and isinstance(subject.get('digest'),dict):
        digest=subject['digest'].get('sha256')
        if isinstance(digest,str) and HASH.fullmatch(digest):candidates.add(digest.lower())
    result=document.get('result',{})
    if isinstance(result,dict) and result.get('format')=='pe' and result.get('kind')=='executable':
        digest=result.get('sha256')
        if isinstance(digest,str) and HASH.fullmatch(digest):candidates.add(digest.lower())
    for path_key,hash_key in (('original_target','original_sha256'),('target','artifact_sha256'),('target','sha256'),('artifact','artifact_sha256'),('artifact','sha256')):
        path,digest=document.get(path_key),document.get(hash_key)
        if isinstance(path,str) and path.lower().endswith('.exe') and isinstance(digest,str) and HASH.fullmatch(digest):candidates.add(digest.lower())
    return next(iter(candidates)) if len(candidates)==1 else None

def explicit_raw(value):
    for field in ('raw_hex','hex','bytes_hex'):
        text=value.get(field)
        if isinstance(text,str) and re.fullmatch(r'(?:[0-9a-fA-F]{2}[ \t\r\n]*)+',text):
            yield field,bytes.fromhex(text)

def json_strings(value,pointer=''):
    if isinstance(value,str):yield pointer or '/',value
    elif isinstance(value,dict):
        for key,child in value.items():yield from json_strings(child,pointer+'/'+key.replace('~','~0').replace('/','~1'))
    elif isinstance(value,list):
        for index,child in enumerate(value):yield from json_strings(child,pointer+'/'+str(index))

def manifest_target_bindings(documents):
    bindings={}
    def references(value,pointer=''):
        if isinstance(value,dict):
            for path_key,hash_key in (('path','sha256'),('output','output_sha256'),('extracted_file','sha256')):
                if isinstance(value.get(path_key),str) and value[path_key].endswith('.json') and isinstance(value.get(hash_key),str) and HASH.fullmatch(value[hash_key]):
                    yield value[path_key],value[hash_key],pointer or '/'
            for key,child in value.items():yield from references(child,pointer+'/'+key.replace('~','~0').replace('/','~1'))
        elif isinstance(value,list):
            for index,child in enumerate(value):yield from references(child,pointer+'/'+str(index))
    for manifest,document in documents:
        digest=target_digest(document)
        if not digest:continue
        for value,commitment,pointer in references(document):
            path=(ROOT/value if value.startswith(('docs/','assets/','runtime/')) else manifest.parent/value).resolve()
            if not path.is_relative_to(ROOT) or not (path.is_file() or has_archived_artifact(path)) or file_sha256(path)!=commitment:continue
            bindings.setdefault(path,{}).setdefault(digest,[]).append({'path':manifest.relative_to(ROOT).as_posix(),'sha256':file_sha256(manifest),'json_pointer':pointer})
    return bindings

def utf8_preimages(wanted,paths):
    result={};lengths={count for count,_ in wanted}
    for path in paths:
        try:document=load_json(path)
        except (ValueError,UnicodeDecodeError):continue
        digest=None
        for pointer,value in json_strings(document):
            raw=value.encode('utf8');key=(len(raw),hashlib.sha256(raw).hexdigest()) if len(raw) in lengths else None
            if key not in wanted or key in result:continue
            if digest is None:digest=file_sha256(path)
            result[key]=(raw,{'path':path.relative_to(ROOT).as_posix(),'sha256':digest,'json_pointer':pointer,
                'encoding':'literal-json-utf8','source_target_sha256':target_digest(document) if isinstance(document,dict) else None})
    return result


def json_objects(value,pointer=''):
    if isinstance(value,dict):
        yield pointer,value
        for key,child in value.items():yield from json_objects(child,pointer+'/'+key.replace('~','~0').replace('/','~1'))
    elif isinstance(value,list):
        for index,child in enumerate(value):yield from json_objects(child,pointer+'/'+str(index))


def serialized_json_candidates(document,path):
    """Only explicit bytes and layouts defined by the retained extractors.

    Labels cannot recover old pointers or padding. Rounded numeric displays do
    not stand in for bit fields. Every candidate still needs the caller's exact
    length and historical digest before it is admitted.
    """
    name=path.relative_to(ROOT).as_posix()
    for pointer,value in json_objects(document):
        for field in ('raw_hex','hex','bytes_hex','bytes','payload','native_record_hex'):
            text=value.get(field)
            if isinstance(text,str) and re.fullmatch(r'(?:[0-9a-fA-F]{2}[ \t\r\n]*)+',text):
                yield bytes.fromhex(text),pointer+'/'+field,'explicit-json-'+field
        effects=value.get('effects')
        if isinstance(effects,list) and effects and all(isinstance(effect,dict)
                and isinstance(effect.get('payload'),str)
                and re.fullmatch(r'(?:[0-9a-fA-F]{2}){64}',effect['payload']) for effect in effects):
            yield b''.join(bytes.fromhex(effect['payload']) for effect in effects),pointer+'/effects','ordered-verbatim-64-byte-effects'
        # recover-talents.py retains struct.unpack('<23i', ...).
        entries=value.get('relative_entries')
        if name=='docs/analysis/evidence/0.97.2/talents.json' and isinstance(entries,list) and len(entries)==23 and all(type(entry) is int and -(2**31)<=entry<2**31 for entry in entries):
            yield struct.pack('<'+'i'*len(entries),*entries),pointer+'/relative_entries','little-endian-i32-relative-entries'
    if name=='docs/analysis/evidence/0.100.1/run-effects/entry-inputs.json':
        for index,value in enumerate(document.get('constants',[])):
            bits=value.get('bits')
            if isinstance(bits,list) and bits and all(type(bit) is int and 0<=bit<2**32 for bit in bits):
                yield struct.pack('<'+'I'*len(bits),*bits),f'/constants/{index}/bits','little-endian-u32-bit-words'
    if name=='docs/analysis/evidence/0.97.2/enemies/scaling-evidence.json':
        # recover-enemy-scaling-evidence.py:70 retains every original u32.
        for index,value in enumerate(document.get('constants',[])):
            words=value.get('u32_words')
            if isinstance(words,list) and words and all(type(word) is int and 0<=word<2**32 for word in words):
                yield struct.pack('<'+'I'*len(words),*words),f'/constants/{index}/u32_words','little-endian-enemy-u32-words'
    if name=='docs/analysis/evidence/0.100.1/notifications/manifest.json':
        # recover-notifications.py reads a complete <14Q vtable
        # and stores each constant as raw(a, 4).hex(), not integer hex.
        entries=document.get('loading_plugin_vtable',{}).get('entries')
        if isinstance(entries,list) and len(entries)==14:
            try:raw=struct.pack('<14Q',*(integer(entry) for entry in entries))
            except (struct.error,OverflowError,TypeError,ValueError):pass
            else:yield raw,'/loading_plugin_vtable/entries','little-endian-notification-14Q'
        for index,value in enumerate(document.get('constants',[])):
            bits=value.get('bits')
            if isinstance(bits,str) and re.fullmatch(r'(?:[0-9a-fA-F]{2}){4}',bits):
                yield bytes.fromhex(bits),f'/constants/{index}/bits','verbatim-notification-constant-bytes'
    if name=='docs/analysis/evidence/0.105.0/balance-catalog/manifest.json':
        # recover-balance-catalog.py:315..322, five exact entries.
        for index,value in enumerate(document.get('ordinary_upgrade_tables',[])):
            if value.get('name') not in ('POWER','COOLDOWN','TARGETS','AREA','DURATION'):continue
            entries=value.get('values')
            if not isinstance(entries,list) or len(entries)!=5:continue
            fmt='I' if value['name']=='TARGETS' else 'f'
            try:raw=struct.pack('<'+fmt*5,*entries)
            except (struct.error,OverflowError,TypeError):continue
            yield raw,f'/ordinary_upgrade_tables/{index}/values','little-endian-upgrade-'+fmt
    if name=='docs/analysis/evidence/0.105.0/pvp-gear/data-evidence.json':
        # recover-pvp-gear.py:88,198; no inferred armor/weapon padding.
        for field,fmt in (('base_scale','6f'),('extra_scale','6f'),('global_scale','f'),('collection_order','6Q')):
            values=document.get(field)
            if values is None:continue
            if not isinstance(values,list):values=[values]
            try:raw=struct.pack('<'+fmt,*values)
            except (struct.error,OverflowError,TypeError):continue
            yield raw,'/'+field,'little-endian-pvp-'+fmt
    if name=='crates/azeroth-survivors-re/assets/pvp-gear-0.105.0.json':
        # recover-pvp-gear.py:169,189 retains ordered <12Q tiers.
        zones=document.get('zones')
        if isinstance(zones,list) and len(zones)==12:
            try:raw=struct.pack('<12Q',*(zone['tier'] for zone in zones))
            except (struct.error,OverflowError,TypeError,KeyError):pass
            else:yield raw,'/zones/*/tier','little-endian-pvp-12Q-zone-tiers'


@lru_cache(maxsize=32)
def committed_json_output(path,digest):
    """Recover a source asset only when its entire archived hash is exact.

    Never inspect historical EXE/MPQ paths, arbitrary Git expressions or files
    outside the checkout. Git objects are read without changing the worktree.
    """
    relative=Path(path)
    if relative.is_absolute() or '..' in relative.parts or not relative.as_posix().startswith('crates/azeroth-survivors-re/assets/') or relative.suffix!='.json' or not HASH.fullmatch(digest):return None
    try:
        commits=subprocess.check_output(
            ['git','log','--format=%H','HEAD','--glob=refs/provenance/*','--',relative.as_posix()],
            cwd=ROOT,text=True).split()
        for commit in commits:
            if not re.fullmatch(r'[0-9a-f]{40}',commit):continue
            try:raw=subprocess.check_output(['git','show',commit+':'+relative.as_posix()],cwd=ROOT,stderr=subprocess.DEVNULL)
            except subprocess.CalledProcessError:continue
            if hashlib.sha256(raw).hexdigest()!=digest:continue
            document=json.loads(raw)
            if isinstance(document,dict):return document,{'path':relative.as_posix(),'commit':commit,'sha256':digest}
    except (subprocess.CalledProcessError,OSError,ValueError,UnicodeDecodeError):return None
    return None


def serialized_preimages(wanted,documents,document_hashes):
    result={}
    layouts={
        'little-endian-i32-relative-entries':('scripts/recover-talents.py',"struct.unpack_from('<23i', ...); original relative_entries"),
        'little-endian-u32-bit-words':('scripts/recover-run-entry.py',"constants.bits from struct.unpack('<' + 'I' * count, raw)"),
        'little-endian-enemy-u32-words':('scripts/recover-enemy-scaling-evidence.py',"constants.u32_words from struct.unpack('<' + 'I' * (size // 4), raw)"),
        'little-endian-notification-14Q':('scripts/recover-notifications.py',"loading_plugin_vtable.entries from struct.unpack('<14Q', raw)"),
        'verbatim-notification-constant-bytes':('scripts/recover-notifications.py',"constants.bits from raw(address, 4).hex()"),
        'little-endian-upgrade-':('scripts/recover-balance-catalog.py',"five entries; TARGETS uses I; POWER/COOLDOWN/AREA/DURATION use f"),
        'little-endian-pvp-':('scripts/recover-pvp-gear.py',"base/extra <6f; global <f; collection <6Q; ordered zone tiers <12Q")}
    layout_sources={}
    for prefix,(name,schema) in layouts.items():
        raw=(ROOT/name).read_bytes();layout_sources[prefix]={'path':name,'sha256':hashlib.sha256(raw).hexdigest(),'schema':schema}
    def provenance(source,pointer,encoding):
        result={**source,'json_pointer':pointer,'encoding':encoding}
        if 'git_source' in source:
            result['git_source']={**source['git_source'],'json_pointer':pointer}
            result['json_pointer']='/output'
        layout=next((value for prefix,value in layout_sources.items() if encoding.startswith(prefix)),None)
        if layout is not None:result['extraction_layout']=layout
        return result
    def admit(document,path,source):
        for raw,pointer,encoding in serialized_json_candidates(document,path):
            key=(len(raw),hashlib.sha256(raw).hexdigest())
            if key in wanted and key not in result:
                result[key]=(raw,provenance(source,pointer,encoding))
        # Before/after deltas preserve whole effect arrays, without inventing
        # the surrounding old 104-byte pointer records.
        for pointer,value in json_objects(document):
            fields=value.get('fields',{})
            effects=fields.get('effects',{}) if isinstance(fields,dict) else {}
            if not isinstance(effects,dict):continue
            for side,entries in effects.items():
                if not isinstance(entries,list) or not entries or not all(isinstance(entry,dict) and isinstance(entry.get('payload'),str) and re.fullmatch(r'(?:[0-9a-fA-F]{2}){64}',entry['payload']) for entry in entries):continue
                raw=b''.join(bytes.fromhex(entry['payload']) for entry in entries);key=(len(raw),hashlib.sha256(raw).hexdigest())
                if key in wanted and key not in result:result[key]=(raw,provenance(source,pointer+'/fields/effects/'+side,'ordered-verbatim-64-byte-effects'))
    for path,document in documents:
        digest=target_digest(document)
        if digest is None:continue
        source={'path':path.relative_to(ROOT).as_posix(),'sha256':document_hashes[path],'source_target_sha256':digest}
        admit(document,path,source)
        output,commitment=document.get('output'),document.get('output_sha256')
        if not isinstance(output,str) or not isinstance(commitment,str):continue
        archived=committed_json_output(output,commitment)
        if archived is not None:
            asset,git_source=archived
            admit(asset,ROOT/output,{**source,'git_source':git_source})
    return result

def ranges(value,pointer=''):
    if isinstance(value,dict):
        if isinstance(value.get('sha256'),str) and HASH.fullmatch(value['sha256']):
            try:
                address=value.get('start') or value.get('address') or value.get('virtual_address') or value.get('va') or value.get('original_virtual_address')
                offset=integer(value.get('file_offset',value.get('source_file_offset'))) if 'file_offset' in value or 'source_file_offset' in value else None
                raw=list(explicit_raw(value))
                if 'byte_count' in value:count=integer(value['byte_count'])
                elif 'length_bytes' in value:count=integer(value['length_bytes'])
                elif 'end_exclusive' in value:count=integer(value['end_exclusive'])-integer(value['start'])
                elif raw:count=len(raw[0][1])
                else:raise ValueError('no explicit size')
                if (offset is None or offset>=0) and count>0 and (offset is not None or address is not None):
                    yield {'json_pointer':pointer or '/','file_offset':offset,'byte_count':count,'sha256':value['sha256'].lower(),
                        'address':address,'role':value.get('role') or value.get('name'),'assembly':value.get('assembly'),'raw_artifact':value.get('extracted_file') or value.get('path'),
                        'explicit_raw':[{ 'field':field,'hex':data.hex()} for field,data in raw]}
            except (ValueError,KeyError,TypeError):pass
        for key,child in value.items():yield from ranges(child,pointer+'/'+key.replace('~','~0').replace('/','~1'))
    elif isinstance(value,list):
        for index,child in enumerate(value):yield from ranges(child,pointer+'/'+str(index))


@lru_cache(maxsize=256)
def assembly_instructions(path):
    """Only explicit byte columns count; mnemonic-only listings stay unknown."""
    instructions={}
    for line in read_artifact(path).decode(errors='replace').splitlines():
        match=re.match(r'^\s*(?:0x)?([0-9a-fA-F]{8,16}):[ \t]+((?:[0-9a-fA-F]{2}[ \t]+)+|(?:[0-9a-fA-F]{2}){2,}[ \t]+)([A-Za-z][A-Za-z0-9_.]*)(?=[ \t]|$)',line)
        if match:
            # These x86 mnemonics/directives also happen to be even-length hex.
            # A mnemonic-only line cannot become an invented byte column.
            if match[2].strip().lower() in ('fadd','aadd','db','dd'):continue
            raw=bytes.fromhex(match[2]);address=int(match[1],16)
            if address in instructions and instructions[address]!=raw:return {}
            instructions[address]=raw
    return instructions

@lru_cache(maxsize=256)
def sibling_json_bytes(directory,digest):
    values={};conflicts=set();sources={}
    def spans(value):
        if isinstance(value,dict):
            address=value.get('start') or value.get('address') or value.get('virtual_address') or value.get('va')
            try:address=integer(address)
            except (ValueError,TypeError):address=None
            if address is not None:
                for _,raw in explicit_raw(value):
                    if 'byte_count' in value and integer(value['byte_count'])!=len(raw):continue
                    if 'sha256' in value and hashlib.sha256(raw).hexdigest()!=value['sha256']:continue
                    yield address,raw
            for child in value.values():yield from spans(child)
        elif isinstance(value,list):
            for child in value:yield from spans(child)
    for path in iter_artifact_paths(directory,'.json'):
        try:document=load_json(path)
        except (ValueError,UnicodeDecodeError):continue
        if not isinstance(document,dict) or target_digest(document)!=digest:continue
        for address,raw in spans(document):
            for index,byte in enumerate(raw):
                site=address+index
                if site in values and values[site]!=byte:conflicts.add(site)
                values[site]=byte;sources.setdefault(site,set()).add(path)
    return values,conflicts,sources


def reconstruct_range(record,manifest,document):
    for raw in record.get('explicit_raw',[]):
        data=bytes.fromhex(raw['hex'])
        if len(data)==record['byte_count'] and hashlib.sha256(data).hexdigest()==record['sha256']:
            return data,{'path':manifest.relative_to(ROOT).as_posix(),'sha256':file_sha256(manifest),
                'encoding':'explicit-json-'+raw['field'],'json_pointer':record['json_pointer']}
    value=record.get('raw_artifact')
    if isinstance(value,str):
        path=(ROOT/value if value.startswith(('runtime/','docs/','assets/')) else manifest.parent/value).resolve()
        # Extracts may be source text, not just .bin/.dat/.json. Former full
        # reference copies remain forbidden even when a historical row names one.
        allowed_sizes=(record['byte_count'],record['byte_count']+1)
        if path.is_relative_to(ROOT) and path.suffix.lower() not in ('.exe','.mpq') and (
                (path.is_file() and path.stat().st_size in allowed_sizes) or has_archived_artifact(path)):
            artifact=read_artifact(path)
            candidates=[(artifact,'committed-native-range-artifact')]
            if len(artifact)==record['byte_count']+1 and artifact.endswith(b'\n'):
                candidates.append((artifact[:-1],'native-range-artifact-with-added-terminal-LF'))
            for raw,encoding in candidates:
                if len(raw)==record['byte_count'] and hashlib.sha256(raw).hexdigest()==record['sha256']:
                    return raw,{'path':path.relative_to(ROOT).as_posix(),'sha256':hashlib.sha256(artifact).hexdigest(),'encoding':encoding}
    try:start=integer(record['address'])
    except (ValueError,TypeError):return None
    references=[]
    for value in (record.get('assembly'),document.get('assembly')):
        if isinstance(value,dict):value=value.get('path')
        if isinstance(value,str):
            path=(ROOT/value if value.startswith('docs/') else manifest.parent/value).resolve()
            if path.is_relative_to(ROOT) and (path.is_file() or has_archived_artifact(path)):references.append(path)
    references.extend(path for path in iter_artifact_paths(manifest.parent,'.asm') if path not in references)
    for path in references:
        instructions=assembly_instructions(str(path));cursor=start;raw=bytearray()
        while cursor in instructions and len(raw)<record['byte_count']:
            value=instructions[cursor];raw.extend(value);cursor+=len(value)
        raw=bytes(raw[:record['byte_count']])
        if len(raw)==record['byte_count'] and hashlib.sha256(raw).hexdigest()==record['sha256']:
            return raw,{'path':path.relative_to(ROOT).as_posix(),'sha256':file_sha256(path),'encoding':'assembly-byte-columns'}
    digest=target_digest(document)
    if digest:
        values,conflicts,sources=sibling_json_bytes(str(manifest.parent),digest)
        sites=range(start,start+record['byte_count'])
        if all(site in values and site not in conflicts for site in sites):
            raw=bytes(values[site] for site in sites)
            if hashlib.sha256(raw).hexdigest()==record['sha256']:
                inputs=sorted({path for site in sites for path in sources[site]})
                return raw,{'encoding':'contiguous-addressed-json-spans','sources':[{'path':path.relative_to(ROOT).as_posix(),'sha256':file_sha256(path)} for path in inputs]}
    return None


def current_census_path(target, requested=None):
    """A previous-target default cannot select the current native inventory."""
    if requested:
        return project_path(requested)
    previous=load_json(ROOT/'docs/analysis/coverage/historical-range-revalidation.json')
    if previous.get('target')!= {key:target[key] for key in ('version','path','sha256','size_bytes')}:
        raise ValueError('--census-summary is required for a newly selected target')
    selected=previous.get('current_native_body_census',{})
    if not selected.get('path') or not selected.get('sha256'):
        raise ValueError('--census-summary is required without a current census commitment')
    canonical=ROOT/'docs/analysis/coverage/full-image-selected.json'
    if canonical.is_file() and same_artifact(selected['path'],canonical,selected['sha256']):
        return canonical
    path=project_path(selected['path'])
    if file_sha256(path)!=selected['sha256']:
        raise ValueError('Selected native census commitment differs')
    return path


def current_match(entry,offset,pe,owner):
    """Rejoin current address/section/body ownership independently of search."""
    address=pe.offset_va(offset)
    whole_owner=owner(address) if address is not None else None
    if whole_owner is not None and any(owner(value)!=whole_owner for value in range(address,address+entry['byte_count'])):whole_owner=None
    section=next((row for row in pe.sections if row['raw_offset']<=offset<row['raw_offset']+row['raw_size']),None)
    return {'file_offset':hex(offset),'address':hex(address) if address is not None else None,
        'relocated_from_historical_offset':offset!=entry['file_offset'] if entry['file_offset'] is not None else None,
        'section':section['name'] if section else None,'whole_range_actual_native_owner':hex(whole_owner) if whole_owner is not None else None},whole_owner,section


def output_paths(target,inventory_output=None,summary_output=None):
    def output_path(value):
        project_path(value)  # Validate final alias and parent boundaries.
        path=Path(value)
        if not path.is_absolute():path=ROOT/path
        return path.parent.resolve()/path.name
    inventory=output_path(inventory_output or f"runtime/coverage/{target['sha256']}/historical-range-revalidation.json")
    summary=output_path(summary_output or 'docs/analysis/coverage/historical-range-revalidation.json')
    if not inventory.is_relative_to(ROOT/'runtime'):
        raise ValueError('Historical range inventory must stay in project runtime/')
    if inventory==summary:raise ValueError('Historical inventory and summary outputs must differ')
    return inventory,summary


def main():
    began=time.perf_counter()
    assembly_instructions.cache_clear();sibling_json_bytes.cache_clear();committed_json_output.cache_clear()
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write',action='store_true')
    parser.add_argument('--census-summary',help='Current verified census; required when changing selected target')
    parser.add_argument('--inventory-output',help='Project runtime path for range inventory; defaults to canonical selected-target inventory')
    parser.add_argument('--summary-output',help='Project path for compact summary; defaults to canonical tracked summary')
    args=parser.parse_args()
    target=latest_target();image=target_bytes(target)
    output,summary_output=output_paths(target,args.inventory_output,args.summary_output)
    spec=importlib.util.spec_from_file_location('historical_range_pe',ROOT/'scripts/inventory-current-target.py')
    helper=importlib.util.module_from_spec(spec);spec.loader.exec_module(helper);pe=helper.pe_parser(image)
    census_path=current_census_path(target,args.census_summary);native=load_json(census_path)
    if native.get('target')!={key:target[key] for key in ('version','path','sha256','size_bytes')} or not native['independent_instructions'].get('exact_source_bytes_verified'):raise ValueError('A current verified body census is required')
    body_path=project_path(Path(native['artifacts']['directory'])/'bodies.tsv.gz')
    if file_sha256(body_path)!=native['artifacts']['files']['bodies.tsv.gz']['sha256']:raise ValueError('Body inventory differs')
    spec=importlib.util.spec_from_file_location('historical_body_owners',ROOT/'scripts/summarize-native-image.py');native_helpers=importlib.util.module_from_spec(spec);spec.loader.exec_module(native_helpers)
    owner=native_helpers.owner_lookup([(int(row['start'],16),int(row['end'],16),int(row['entry'],16)) for row in native_helpers.rows(body_path) if row['external']=='false'])
    counts=Counter();by_target={};records=[];unique={};raw_bytes={};documents=[];document_hashes={};admitted_bindings=[]
    evidence_documents=iter_artifact_paths(ROOT/'docs/analysis/evidence','.json',recursive=True)
    for path in evidence_documents:
        try:
            source_bytes=read_artifact(path);document=json.loads(source_bytes)
        except (ValueError,UnicodeDecodeError):counts['non-json-or-utf8-evidence-files']+=1;continue
        if not isinstance(document,dict):continue
        documents.append((path,document));document_hashes[path]=hashlib.sha256(source_bytes).hexdigest()
    serialized_sources=list(documents)
    for path in sorted((ROOT/'crates/azeroth-survivors-re/assets').glob('*.json')):
        try:
            source_bytes=path.read_bytes();document=json.loads(source_bytes)
        except (ValueError,UnicodeDecodeError):continue
        if isinstance(document,dict):
            serialized_sources.append((path,document));document_hashes[path]=hashlib.sha256(source_bytes).hexdigest()
    string_sources=sorted(set(evidence_documents)|set((ROOT/'assets').rglob('*.json')))
    identity=preimage_identity(target,serialized_sources,document_hashes,string_sources)
    cache=HistoricalCache(target['sha256'],write=args.write)
    cached_preimages=cache.preimages(identity)
    preimage_began=time.perf_counter()
    bindings=manifest_target_bindings(documents)
    for path,document in documents:
        digest=target_digest(document)
        if digest is None:
            candidates=bindings.get(path,{})
            if len(candidates)==1:
                digest=next(iter(candidates));admitted_bindings.extend(candidates[digest]);counts['documents-admitted-by-exact-owning-manifest-hash']+=1
            else:
                counts['documents-with-ambiguous-owning-target-bindings' if candidates else 'documents-without-explicit-target-or-exact-manifest-binding']+=1;continue
        else:counts['documents-with-explicit-target-identity']+=1
        if digest==target['sha256']:counts['selected-target-documents-excluded-from-historical-audit']+=1;continue
        found=list(ranges(document))
        if not found:counts['historical-documents-without-supported-range-commitments']+=1;continue
        counts['historical-documents-with-range-commitments']+=1
        for record in found:
            key=(record['file_offset'],record['byte_count'],record['sha256'],record['address'])
            entry=unique.get(key)
            if entry is None:
                offset,count=record['file_offset'],record['byte_count']
                raw=image[offset:offset+count] if offset is not None else b''
                same_offset=(len(raw)==count and hashlib.sha256(raw).hexdigest()==record['sha256']) if offset is not None else None
                same_address=None
                if record['address'] is not None:
                    try:
                        address=integer(record['address']);current_offset=pe.rva_offset(address-pe.image_base)
                        raw=image[current_offset:current_offset+count]
                        same_address=len(raw)==count and hashlib.sha256(raw).hexdigest()==record['sha256']
                    except (ValueError,TypeError):same_address=False
                entry={**record,'same_file_offset_bytes_match':same_offset,'same_encoded_address_bytes_match':same_address,
                    'historical_targets':set(),'references':[],'behavioral_contract_revalidated':False}
                unique[key]=entry
            if key not in raw_bytes:
                recovered=(cached_preimages.get(canonical(key)) if cached_preimages is not None
                           else reconstruct_range(record,path,document))
                if recovered is not None:
                    raw_bytes[key]=recovered[0];entry['canonical_preimage']=recovered[1]
            entry['historical_targets'].add(digest)
            entry['references'].append({'manifest':path.relative_to(ROOT).as_posix(),'json_pointer':record['json_pointer'],'role':record['role']})
            by_target.setdefault(digest,Counter())['range-references']+=1
    wanted={(key[1],key[2]) for key in unique if key not in raw_bytes}
    field_preimages=serialized_preimages(wanted,serialized_sources,document_hashes) if cached_preimages is None else {}
    literal_preimages=utf8_preimages(wanted,string_sources) if cached_preimages is None else {}
    for key,entry in unique.items():
        if key not in raw_bytes and (key[1],key[2]) in field_preimages:
            raw_bytes[key],entry['canonical_preimage']=field_preimages[(key[1],key[2])]
        if key not in raw_bytes and (key[1],key[2]) in literal_preimages:
            raw_bytes[key],entry['canonical_preimage']=literal_preimages[(key[1],key[2])]
    searches=cache.search_many(image,[(raw,key[2]) for key,raw in raw_bytes.items()],artifact_path(target['path']))
    # Search publication precedes every source/owner join and final source
    # revision guard. An interrupted or invalidated report retains exact facts.
    for key,entry in unique.items():
        entry['historical_targets']=sorted(entry['historical_targets']);records.append(entry)
        kind='same-offset-byte-match' if entry['same_file_offset_bytes_match'] else 'same-address-byte-match' if entry['same_encoded_address_bytes_match'] else 'historical-location-not-revalidated'
        counts[kind]+=1
        raw=raw_bytes.get(key)
        if raw is None:
            entry['whole_image_exact_search']='raw-range-bytes-unavailable';counts['canonical-preimage-bytes-unavailable']+=1
        else:
            counts['canonical-preimage-bytes-hash-verified']+=1
            counts['preimage:'+entry['canonical_preimage'].get('encoding','assembly-byte-columns')]+=1
            first,second=searches[(entry['sha256'],len(raw))]
            if first<0:status='exact-bytes-not-found'
            elif second>=0:status='ambiguous-exact-bytes-at-least-two-locations'
            else:
                status='unique-exact-byte-range'
                entry['selected_target_exact_match'],whole_owner,section=current_match(entry,first,pe,owner)
                counts['unique-match:'+('whole-native-body-range' if whole_owner is not None else 'executable-without-complete-body-owner' if section and int(section['characteristics'],16)&0x20000000 else 'non-executable-data-or-headers')]+=1
            entry['whole_image_exact_search']=status;counts[status]+=1
    inputs={}
    for source in admitted_bindings:inputs[source['path']]=source['sha256']
    for entry in records:
        preimage=entry.get('canonical_preimage',{})
        if 'path' in preimage:inputs[preimage['path']]=preimage['sha256']
        for source in preimage.get('sources',[]):inputs[source['path']]=source['sha256']
        layout=preimage.get('extraction_layout')
        if layout is not None:inputs[layout['path']]=layout['sha256']
    payload={'target':{k:target[k] for k in ('version','path','sha256','size_bytes')},'records':records,'counts':dict(sorted(counts.items())),
        'preimage_inputs':[{'path':path,'sha256':digest} for path,digest in sorted(inputs.items())]}
    serialized=json_text(payload)
    summary={'schema_version':1,'target':payload['target'],'generator':{'path':'scripts/revalidate-historical-native-ranges.py','sha256':file_sha256(ROOT/'scripts/revalidate-historical-native-ranges.py')},
        'counts':dict(sorted(counts.items())),'unique_range_commitments':len(records),'historical_targets':{k:dict(v) for k,v in sorted(by_target.items())},
        'current_native_body_census':{'path':census_path.relative_to(ROOT).as_posix(),'sha256':file_sha256(census_path)},
        'unique_match_records_in_inventory':True,
        'matched_range_references':[{'file_offset':hex(row['file_offset']) if row['file_offset'] is not None else None,'byte_count':row['byte_count'],'sha256':row['sha256'],'references':row['references']} for row in records if row['same_file_offset_bytes_match'] or row['same_encoded_address_bytes_match']],
        'inventory':{'path':output.relative_to(ROOT).as_posix(),'sha256':hashlib.sha256(serialized.encode()).hexdigest()},
        'historical_behavior_revalidation_complete':False,'parity_verified':False,'gap_ids':[41],
        'limits':['Only explicit historical file-offset/byte-count or exclusive-address-range SHA-256 commitments are checked; unsupported formats and missing target identities remain counted unknowns.',
            'Unmatched old locations are not recovered addresses and cannot be reused. Canonical assembly bytes are reconstructed only when they match the historical range digest; unsupported/no-byte assembly remains unavailable. Verified old sequences are searched over the whole selected image.',
            'Retained raw payloads and extractor-defined integer/float arrays require exact length and historical SHA-256. Archived source assets require an exact whole-file output_sha256 Git witness and retain their original target identity; missing pointers or padding are never reconstructed.',
            'A byte-identical range is only that range: no source revision, dependency graph, data interpretation, runtime behavior or whole historical contract is promoted.',
            'No compilation, application execution or original/rebuilt comparison.']}
    cache.metrics.update(preimage_records_reused=len(unique) if cached_preimages is not None else 0,
        preimage_records_recovered=len(raw_bytes),preimage_records_unavailable=len(unique)-len(raw_bytes),
        recovery_and_join_wall_seconds=time.perf_counter()-preimage_began,wall_seconds=time.perf_counter()-began)
    cache.close()
    if any(file_sha256(path)!=digest for path,digest in document_hashes.items()) or preimage_identity(target,serialized_sources,document_hashes,string_sources)!=identity:
        raise ValueError('Historical preimage source inputs changed during recovery')
    cache.publish(identity,{canonical(key):(raw,unique[key]['canonical_preimage']) for key,raw in raw_bytes.items()})
    publish_text(output,serialized,args.write)
    publish_text(summary_output,json_text(summary),args.write)
    metrics=os.environ.get('REA_STAGE_METRICS_PATH')
    if metrics:
        path=Path(metrics)
        if not path.is_absolute():path=ROOT/path
        if not path.resolve().is_relative_to(ROOT/'runtime'):raise ValueError('Stage metrics must remain in project runtime/')
        publish_text(path,json_text({'stage':'historical-range-revalidation',**cache.metrics}),True)
    print(json_text({'unique_range_commitments':len(records),'counts':summary['counts']}))
if __name__=='__main__':main()
