#!/usr/bin/env node
/** Non-compiling guards for bounded anchor matching and exact fallback. */
import assert from 'node:assert/strict';
import {createHash} from 'node:crypto';
import {searchRanges, LIMITS, ALGORITHM} from './search-historical-ranges.mjs';
const row = raw => ({sha256:createHash('sha256').update(raw).digest('hex'),byte_count:raw.length,hex:raw.toString('hex')});
const prefix = Buffer.from('0123456789abcdef'), image = Buffer.from(('0123456789abcdef' + 'a'.repeat(64) + 'YY').repeat(40));
const raws = [Buffer.concat([prefix,Buffer.from('a'.repeat(64)+'XX')]),
  Buffer.concat([prefix,Buffer.from('a'.repeat(64)+'YY')]), Buffer.from('aaaaa'), Buffer.from('aaa')];
const result = searchRanges(image,raws.map(row),{...LIMITS,candidates:5});
assert.equal(result.algorithm,ALGORITHM);
assert.ok(result.metrics.fallback_patterns > 0);
for (let index=0;index<raws.length;index++) {
  const first=image.indexOf(raws[index]),second=first<0?-1:image.indexOf(raws[index],first+1);
  assert.deepEqual([result.results[index].first_offset,result.results[index].second_offset],[first,second]);
}
assert.throws(()=>searchRanges(image,raws.map(row),{...LIMITS,states:2}),/Anchor state limit/);
assert.throws(()=>searchRanges(image,raws.map(row),{...LIMITS,patterns:2}),/population limit/);
assert.throws(()=>searchRanges(image,raws.map(row),{...LIMITS,rawBytes:2}),/Range byte limit/);
assert.throws(()=>searchRanges(image,[row(raws[0]),row(raws[0])]),/Duplicate/);
assert.throws(()=>searchRanges(image,[{...row(raws[0]),hex:'zz'}]),/Invalid range hex/);
assert.throws(()=>searchRanges(image,[{...row(raws[0]),sha256:'0'.repeat(64)}]),/digest differs/);
const empty=searchRanges(Buffer.alloc(0),[row(Buffer.from('abc'))]);
assert.deepEqual([empty.results[0].first_offset,empty.results[0].second_offset],[-1,-1]);
console.log('Historical bounded anchor search checks passed');
