# benilla 0.3.0 source integration

The vendored engine advances from [0367a2c2](https://github.com/samwhosung/benilla/commit/0367a2c2180d777392470860693009465495a30d)
to [e2aeaecf](https://github.com/samwhosung/benilla/commit/e2aeaecffcfcaea27f762f61901ec4046587b843),
the head of benilla's main branch on 2026-11-03. GitHub's comparison reports
285 upstream commits in the interval. The AS package and reconstruction target
remain 0.139.1. This import records a source dependency revision and leaves
native revision equivalence and gameplay parity open.

The previous archive matched all 2,041 file hashes in the prior manifest. The
merge compared that archive, the actual AS checkout and the new archive. It
resolved overlaps against the current checkout, including overrides added
after the previous import. The [vendor manifest](benilla-vendor.json) records
the new archive and the pristine hashes of 2,393 selected files, with 110
working-tree overrides. The Vulkan presentation fix and its licensed
`wgpu-hal` source form a separate dependency change. The engine import groups
the new protocol, VM, input, renderer and resource interfaces with their AS
adapters because those interfaces change together.

## AS integration

- The local and socket transports share the updated command writer. AS keeps
  its movement-report timestamp, pause-aware spline age and paused root
  handling. Original guest wire events keep their packet boundaries, while
  synthetic object updates still receive the completion events they require.
- The AS action producer writes the new slot store. The live action, spell and
  aura readers take authoritative AS timers or supplied snapshots where the
  embedding owns them. Item set requests preserve demand order for description
  ID allocation. Synchronous session and aura verbs forward to the local owner.
- The entry loader keeps its sliced progress, addon transforms, bindings,
  FrameXML extensions and private VM. It also runs the updated account-data
  registrations and preserves the ordered shutdown before a replacement VM.
- The input collector retains AS Escape routing, binding capture and touch
  records in the upstream ordered input pass. Interface hit tests use the same
  screen transform as rendering. AS retains its TGA admission through 8192,
  including non-power-of-two addon textures and the existing alpha rules.

## Validation

Pinned rustfmt parsed the changed Rust files. TOML parsing, offline locked
Cargo dependency resolution for Apple Silicon, direct include paths, vendor
index coverage, portability and Git whitespace checks passed. The addon
bootstrap, timer and totem Lua harnesses passed with stub hosts.

The reconstruction coverage and EXE-bound regression scripts stopped at the
unregistered installed 0.139.2 identity. Existing native evidence retains its
recorded target and source-review fingerprints. Compilation, Rust tests, actual
FrameXML and rendering, client/game execution, co-op execution and comparison
with the original EXE remain open. [Verification register](../verification-needed.md#gap-36).
