#!/usr/bin/env node
/** Bounded exact first-two searches. Anchors are only candidate filters. */
import {readFileSync, readSync, statSync} from 'node:fs';
import {createHash} from 'node:crypto';
import {performance} from 'node:perf_hooks';
import {pathToFileURL} from 'node:url';

export const ALGORITHM = 'node-aho-corasick-anchor16-first-two-v1';
export const LIMITS = {patterns: 32768, states: 262144, rawBytes: 64 * 1024 * 1024,
  imageBytes: 512 * 1024 * 1024, inputBytes: 160 * 1024 * 1024, candidates: 4000000};
class SearchLimit extends Error {}
const digest = raw => createHash('sha256').update(raw).digest('hex');
const validHash = value => typeof value === 'string' && /^[a-f0-9]{64}$/.test(value);
function requireValue(condition, message) {if (!condition) throw new Error(message);}

// Inspect a bounded set of windows. Diverse bytes avoid common padding and
// instruction prefixes; this choice affects speed only, never match admission.
function anchor(raw) {
  if (raw.length <= 16) return {bytes: raw, offset: 0};
  const last = raw.length - 16;
  let best = -1, offset = 0;
  for (let sample = 0; sample <= 32; sample++) {
    const start = Math.floor(last * sample / 32), seen = new Set();
    let variation = 0, nonzero = 0;
    for (let index = start; index < start + 16; index++) {
      seen.add(raw[index]);
      if (raw[index] !== 0 && raw[index] !== 255) nonzero++;
      if (index > start && raw[index] !== raw[index - 1]) variation++;
    }
    const score = seen.size * 32 + variation + nonzero;
    if (score > best) {best = score; offset = start;}
  }
  return {bytes: raw.subarray(offset, offset + 16), offset};
}

export function searchRanges(image, ranges, limits = LIMITS) {
  const started = performance.now();
  requireValue(Buffer.isBuffer(image), 'Image must be bytes');
  requireValue(Array.isArray(ranges), 'Ranges must be an array');
  if (image.length > limits.imageBytes || ranges.length > limits.patterns) throw new SearchLimit('Search population limit');
  const records = [], keys = new Set();
  let totalBytes = 0;
  for (const row of ranges) {
    requireValue(row && validHash(row.sha256) && Number.isSafeInteger(row.byte_count) && row.byte_count > 0,
      'Invalid range commitment');
    requireValue(typeof row.hex === 'string' && row.hex.length === row.byte_count * 2 && /^[a-f0-9]+$/.test(row.hex),
      'Invalid range hex/length');
    totalBytes += row.byte_count;
    if (totalBytes > limits.rawBytes) throw new SearchLimit('Range byte limit');
    const raw = Buffer.from(row.hex, 'hex');
    requireValue(digest(raw) === row.sha256, 'Range digest differs');
    const key = `${row.sha256}:${row.byte_count}`;
    requireValue(!keys.has(key), 'Duplicate range commitment'); keys.add(key);
    records.push({raw, sha256: row.sha256, byte_count: raw.length, offsets: [-1, -1], offset: 0});
  }
  const nodes = [{edges: new Map(), fail: 0, output: -1, matches: []}], root = new Int32Array(256);
  const short = [];
  for (let id = 0; id < records.length; id++) {
    const row = records[id];
    // Tiny ranges use native indexOf; enumerating every matching byte is wasteful.
    if (row.raw.length <= 4) {short.push(id); continue;}
    const selected = anchor(row.raw); row.offset = selected.offset;
    let state = 0;
    for (const byte of selected.bytes) {
      let next = nodes[state].edges.get(byte);
      if (next === undefined) {
        if (nodes.length >= limits.states) throw new SearchLimit('Anchor state limit');
        next = nodes.length; nodes[state].edges.set(byte, next);
        nodes.push({edges: new Map(), fail: 0, output: -1, matches: []});
      }
      state = next;
    }
    nodes[state].matches.push(id);
  }
  const queue = [];
  for (const [byte, state] of nodes[0].edges) {root[byte] = state; queue.push(state);}
  for (let cursor = 0; cursor < queue.length; cursor++) {
    const state = queue[cursor];
    for (const [byte, child] of nodes[state].edges) {
      queue.push(child);
      let fail = nodes[state].fail;
      while (fail && !nodes[fail].edges.has(byte)) fail = nodes[fail].fail;
      nodes[child].fail = nodes[fail].edges.get(byte) ?? 0;
      const parent = nodes[child].fail;
      nodes[child].output = nodes[parent].matches.length ? parent : nodes[parent].output;
    }
  }
  let candidates = 0, state = 0, limited = false;
  const buildSeconds = (performance.now() - started) / 1000, scanStarted = performance.now();
  for (let position = 0; position < image.length; position++) {
    const byte = image[position];
    if (!state) state = root[byte];
    else {
      let next = nodes[state].edges.get(byte);
      while (next === undefined && state) {state = nodes[state].fail; next = state ? nodes[state].edges.get(byte) : root[byte];}
      state = next ?? 0;
    }
    for (let terminal = state; terminal > 0; terminal = nodes[terminal].output) {
      const matches = nodes[terminal].matches;
      for (let index = matches.length - 1; index >= 0; index--) {
        if (++candidates > limits.candidates) {limited = true; break;}
        const row = records[matches[index]], start = position + 1 - Math.min(16, row.raw.length) - row.offset;
        if (start < 0 || start + row.raw.length > image.length ||
            !image.subarray(start, start + row.raw.length).equals(row.raw)) continue;
        if (row.offsets[0] < 0) row.offsets[0] = start;
        else {
          row.offsets[1] = start;
          matches[index] = matches[matches.length - 1]; matches.pop();
        }
      }
      if (limited) break;
    }
    if (limited) break;
  }
  // A pathological shared anchor has bounded candidate work. Native full-range
  // search recomputes BOTH positions, so partial AC results cannot skip overlaps.
  const fallback = limited ? records.map((_, id) => id).filter(id => records[id].offsets[1] < 0) : short;
  for (const id of fallback) {
    const row = records[id], first = image.indexOf(row.raw);
    row.offsets = [first, first < 0 ? -1 : image.indexOf(row.raw, first + 1)];
  }
  return {algorithm: ALGORITHM, results: records.map(row => ({sha256: row.sha256,
    byte_count: row.byte_count, first_offset: row.offsets[0], second_offset: row.offsets[1]})),
    metrics: {patterns: records.length, states: nodes.length, candidates, short_patterns: short.length,
      fallback_patterns: limited ? fallback.length : 0, build_seconds: buildSeconds,
      scan_seconds: (performance.now() - scanStarted) / 1000,
      wall_seconds: (performance.now() - started) / 1000, peak_rss_bytes: process.resourceUsage().maxRSS * 1024}};
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  try {
    const chunks = []; let inputBytes = 0, count;
    do {
      const chunk = Buffer.allocUnsafe(65536); count = readSync(0, chunk, 0, chunk.length);
      inputBytes += count;
      if (inputBytes > LIMITS.inputBytes) throw new SearchLimit('Search input limit');
      if (count) chunks.push(chunk.subarray(0, count));
    } while (count);
    const request = JSON.parse(Buffer.concat(chunks));
    requireValue(request.schema === 'historical-exact-search-v1' && request.target &&
      typeof request.target.path === 'string' && validHash(request.target.sha256) &&
      Number.isSafeInteger(request.target.size_bytes) && request.target.size_bytes >= 0, 'Invalid target commitment');
    if (request.target.size_bytes > LIMITS.imageBytes) throw new SearchLimit('Image byte limit');
    requireValue(statSync(request.target.path).size === request.target.size_bytes, 'Target bytes differ');
    const image = readFileSync(request.target.path);
    requireValue(image.length === request.target.size_bytes && digest(image) === request.target.sha256, 'Target bytes differ');
    const result = searchRanges(image, request.ranges);
    process.stdout.write(JSON.stringify({schema: request.schema, target_sha256: request.target.sha256,
      node_version: process.versions.node, ...result}) + '\n');
  } catch (error) {
    process.stderr.write(`${error instanceof SearchLimit ? 'SEARCH_LIMIT' : 'SEARCH_INVALID'}: ${error.message}\n`);
    process.exitCode = error instanceof SearchLimit ? 3 : 2;
  }
}
