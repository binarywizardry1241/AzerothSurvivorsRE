140269d70: push      rbp
140269d71: push      r15
140269d73: push      r14
140269d75: push      r13
140269d77: push      r12
140269d79: push      rsi
140269d7a: push      rdi
140269d7b: push      rbx
140269d7c: sub       rsp, 0xa68
140269d83: lea       rbp, [rsp + 0x80]
140269d8b: movaps    xmmword ptr [rbp + 0x9d0], xmm15
140269d93: movaps    xmmword ptr [rbp + 0x9c0], xmm14
140269d9b: movaps    xmmword ptr [rbp + 0x9b0], xmm13
140269da3: movaps    xmmword ptr [rbp + 0x9a0], xmm12
140269dab: movaps    xmmword ptr [rbp + 0x990], xmm11
140269db3: movaps    xmmword ptr [rbp + 0x980], xmm10
140269dbb: movaps    xmmword ptr [rbp + 0x970], xmm9
140269dc3: movaps    xmmword ptr [rbp + 0x960], xmm8
140269dcb: movaps    xmmword ptr [rbp + 0x950], xmm7
140269dd2: movaps    xmmword ptr [rbp + 0x940], xmm6
140269dd9: mov       qword ptr [rbp + 0x938], 0xfffffffffffffffe
140269de4: mov       rsi, rdx
140269de7: mov       r12, qword ptr [rcx]
140269dea: mov       rax, qword ptr [rcx + 0x28]
140269dee: mov       qword ptr [rbp + 0x758], r12
140269df5: movups    xmm0, xmmword ptr [rcx + 8]
140269df9: movups    xmmword ptr [rbp + 0x760], xmm0
140269e00: mov       qword ptr [rbp + 0x850], rcx
140269e07: movdqu    xmm0, xmmword ptr [rcx + 0x18]
140269e0c: movdqu    xmmword ptr [rbp + 0x770], xmm0
140269e14: mov       qword ptr [rbp + 0x780], rax
140269e1b: mov       rdx, qword ptr [rdx]
140269e1e: imul      r8, qword ptr [rsi + 8], 0x78
140269e23: add       r8, rdx
140269e26: lea       rcx, [rbp + 0x8c0]
140269e2d: call      0x1400a2ea0
140269e32: mov       rdi, qword ptr [rbp + 0x8c8]
140269e39: mov       rax, qword ptr [rbp + 0x8d0]
140269e40: lea       r13, [rdi + rax*8]
140269e44: mov       rbx, qword ptr [rsi + 0x10]
140269e48: mov       rax, qword ptr [rsi + 0x18]
140269e4c: mov       qword ptr [rbp + 0x818], rax
140269e53: mov       rax, qword ptr [rsi + 0x20]
140269e57: mov       qword ptr [rbp + 0x840], rax
140269e5e: inc       rax
140269e61: mov       qword ptr [rbp + 0x848], rax
140269e68: xorps     xmm6, xmm6
140269e6b: movdqa    xmm13, xmmword ptr [rip + 0x5b3334c]
140269e74: movdqa    xmm8, xmmword ptr [rip + 0x5b33353]
140269e7d: movdqa    xmm10, xmmword ptr [rip + 0x5b3335a]
140269e86: xor       eax, eax
140269e88: lea       r14, [rip + 0x5b85d11]
140269e8f: mov       qword ptr [rbp + 0x820], rbx
140269e96: cmp       rdi, r13
140269e99: je        0x14026ab70
140269e9f: mov       rsi, rdi
140269ea2: add       rdi, 8
140269ea6: lea       rcx, [rax + 1]
140269eaa: mov       qword ptr [rbp + 0x888], rcx
140269eb1: mov       rdx, qword ptr [rbp + 0x8d0]
140269eb8: test      rax, rax
140269ebb: je        0x140269ef0
140269ebd: lea       rcx, [rax - 1]
140269ec1: cmp       rcx, rdx
140269ec4: jae       0x14026abfb
140269eca: mov       rcx, qword ptr [rbp + 0x8c8]
140269ed1: mov       rax, qword ptr [rcx + rax*8 - 8]
140269ed6: movzx     r9d, byte ptr [rax + 0x70]
140269edb: mov       r8, qword ptr [rsi]
140269ede: mov       rax, qword ptr [rbp + 0x888]
140269ee5: cmp       r9b, byte ptr [r8 + 0x70]
140269ee9: je        0x140269e96
140269eeb: jmp       0x140269efa
140269eed: nop       dword ptr [rax]
140269ef0: mov       rcx, qword ptr [rbp + 0x8c8]
140269ef7: mov       r8, qword ptr [rsi]
140269efa: mov       qword ptr [rbp + 0x810], rdi
140269f01: lea       rax, [rcx + rdx*8]
140269f05: mov       qword ptr [rbp + 0x4f0], rcx
140269f0c: mov       qword ptr [rbp + 0x4f8], rax
140269f13: mov       qword ptr [rbp + 0x500], r8
140269f1a: lea       rcx, [rbp + 0x7e8]
140269f21: lea       rdx, [rbp + 0x4f0]
140269f28: call      0x1400a2d20
140269f2d: nop
140269f2e: mov       rcx, qword ptr [rbp + 0x7f0]
140269f35: mov       rdi, qword ptr [rbp + 0x7f8]
140269f3c: lea       rax, [rcx + rdi*8]
140269f40: mov       qword ptr [rbp + 0x918], rax
140269f47: mov       qword ptr [rbp + 0x920], rcx
140269f4e: nop
140269f50: mov       r15, rcx
140269f53: cmp       rcx, qword ptr [rbp + 0x918]
140269f5a: je        0x140269f78
140269f5c: mov       rax, qword ptr [r15]
140269f5f: mov       rdx, qword ptr [rax + 0x20]
140269f63: mov       r8, qword ptr [rax + 0x28]
140269f67: mov       rcx, rbx
140269f6a: call      0x14590fa20
140269f6f: nop
140269f70: lea       rcx, [r15 + 8]
140269f74: test      al, al
140269f76: je        0x140269f50
140269f78: lea       rcx, [rbp + 0x290]
140269f7f: mov       rdx, qword ptr [rbp + 0x920]
140269f86: mov       r8, qword ptr [rbp + 0x918]
140269f8d: call      0x1400a9710
140269f92: nop
140269f93: mov       rdx, qword ptr [rbp + 0x298]
140269f9a: mov       r8, qword ptr [rbp + 0x2a0]
140269fa1: mov       qword ptr [rsp + 0x20], 3
140269faa: lea       rcx, [rbp + 0x4f0]
140269fb1: mov       qword ptr [rbp + 0x928], rdx
140269fb8: mov       r9, r14
140269fbb: call      0x14008e420
140269fc0: nop
140269fc1: mov       rax, qword ptr [rbp + 0x500]
140269fc8: mov       qword ptr [rbp + 0x880], rax
140269fcf: movups    xmm0, xmmword ptr [rbp + 0x4f0]
140269fd6: movaps    xmmword ptr [rbp + 0x870], xmm0
140269fdd: mov       rdx, qword ptr [rbp + 0x290]
140269fe4: test      rdx, rdx
140269fe7: je        0x140269fff
140269fe9: shl       rdx, 4
140269fed: mov       r8d, 8
140269ff3: mov       rcx, qword ptr [rbp + 0x928]
140269ffa: call      0x1400021d0
140269fff: lea       rax, [rbp + 0x2a4]
14026a006: movups    xmmword ptr [rax + 0x8c], xmm6
14026a00d: movups    xmmword ptr [rax + 0x7c], xmm6
14026a011: movups    xmmword ptr [rax + 0x6c], xmm6
14026a015: movups    xmmword ptr [rax + 0x5c], xmm6
14026a019: movups    xmmword ptr [rax + 0x4c], xmm6
14026a01d: mov       qword ptr [rax + 0x9c], 0
14026a028: movups    xmm0, xmmword ptr [rip + 0x5b81999]
14026a02f: movups    xmmword ptr [rax + 0xb4], xmm0
14026a036: movups    xmm0, xmmword ptr [rip + 0x5b8197b]
14026a03d: movups    xmmword ptr [rax + 0xa4], xmm0
14026a044: movups    xmm12, xmmword ptr [rip + 0x5b8199c]
14026a04c: movups    xmmword ptr [rax + 0xd4], xmm12
14026a054: movups    xmm14, xmmword ptr [rip + 0x5b8197c]
14026a05c: movups    xmmword ptr [rax + 0xc4], xmm14
14026a064: movups    xmm0, xmmword ptr [rip + 0x5b8199d]
14026a06b: movups    xmmword ptr [rax + 0xf4], xmm0
14026a072: movups    xmm0, xmmword ptr [rip + 0x5b8197f]
14026a079: movups    xmmword ptr [rax + 0xe4], xmm0
14026a080: movups    xmm0, xmmword ptr [rip + 0x5b819a1]
14026a087: movups    xmmword ptr [rax + 0x114], xmm0
14026a08e: movups    xmm0, xmmword ptr [rip + 0x5b81983]
14026a095: movups    xmmword ptr [rax + 0x104], xmm0
14026a09c: movups    xmm15, xmmword ptr [rip + 0x5b8185c]
14026a0a4: movaps    xmmword ptr [rbp + 0x290], xmm15
14026a0ac: mov       qword ptr [rbp + 0x2a0], 0
14026a0b7: movups    xmm9, xmmword ptr [rip + 0x5b81859]
14026a0bf: movups    xmmword ptr [rax + 4], xmm9
14026a0c4: mov       qword ptr [rax + 0x14], 0
14026a0cc: movups    xmm7, xmmword ptr [rip + 0x5b8185d]
14026a0d3: movups    xmmword ptr [rax + 0x1c], xmm7
14026a0d7: mov       qword ptr [rax + 0x2c], 0
14026a0df: movups    xmm11, xmmword ptr [rip + 0x5b81861]
14026a0e7: movups    xmmword ptr [rax + 0x34], xmm11
14026a0ec: mov       qword ptr [rax + 0x44], 0
14026a0f4: mov       r8d, 0x138
14026a0fa: lea       rcx, [rbp + 0x4f8]
14026a101: lea       rdx, [rbp + 0x290]
14026a108: call      0x145bfa0e7
14026a10d: movaps    xmm0, xmmword ptr [rip + 0x5b3315c]
14026a114: movups    xmmword ptr [rbp + 0x630], xmm0
14026a11b: mov       dword ptr [rbp + 0x640], 1
14026a125: movd      xmm0, dword ptr [rip + 0x5b33353]
14026a12d: movq      qword ptr [rbp + 0x644], xmm0
14026a135: mov       byte ptr [rbp + 0x64c], 1
14026a13c: mov       qword ptr [rbp + 0x650], 0
14026a147: mov       dword ptr [rbp + 0x658], 0x3f800000
14026a151: mov       word ptr [rbp + 0x65c], 0
14026a15a: lea       rax, [rbp + 0x558]
14026a161: mov       dword ptr [rax + 0x106], 0x10000
14026a16b: mov       word ptr [rax + 0x10a], 0
14026a174: mov       word ptr [rax + 0x110], 0
14026a17d: mov       dword ptr [rax + 0x10c], 0x10000
14026a187: mov       qword ptr [rbp + 0x66a], 0
14026a192: mov       dword ptr [rbp + 0x672], 5
14026a19c: mov       qword ptr [rbp + 0x4f0], r12
14026a1a3: lea       rcx, [rbp + 0x7b8]
14026a1aa: lea       rdx, [rbp + 0x760]
14026a1b1: lea       r8, [rbp + 0x4f0]
14026a1b8: call      0x1401de510
14026a1bd: nop
14026a1be: mov       rsi, qword ptr [rsi]
14026a1c1: mov       rcx, qword ptr [rbp + 0x7b8]
14026a1c8: mov       rdx, qword ptr [rbp + 0x7d0]
14026a1cf: mov       rax, qword ptr [rbp + 0x7e0]
14026a1d6: mov       r8, qword ptr [rbp + 0x7d8]
14026a1dd: mov       qword ptr [rbp + 0x928], rcx
14026a1e4: mov       qword ptr [rbp + 0x788], rcx
14026a1eb: mov       rcx, qword ptr [rbp + 0x7c8]
14026a1f2: mov       qword ptr [rbp + 0x808], rcx
14026a1f9: movdqu    xmm0, xmmword ptr [rbp + 0x7c0]
14026a201: movdqu    xmmword ptr [rbp + 0x790], xmm0
14026a209: mov       qword ptr [rbp + 0x800], rdx
14026a210: mov       qword ptr [rbp + 0x7a0], rdx
14026a217: mov       qword ptr [rbp + 0x828], r8
14026a21e: mov       qword ptr [rbp + 0x7a8], r8
14026a225: mov       qword ptr [rbp + 0x7b0], rax
14026a22c: test      rdi, rdi
14026a22f: je        0x14026a8f0
14026a235: mov       rdi, qword ptr [rbp + 0x920]
14026a23c: mov       rax, qword ptr [rdi]
14026a23f: mov       rdx, qword ptr [rax + 0x20]
14026a243: mov       r8, qword ptr [rax + 0x28]
14026a247: mov       rcx, rbx
14026a24a: call      0x14590fa20
14026a24f: nop
14026a250: mov       r8d, eax
14026a253: mov       word ptr [rbp + 0x654], 0
14026a25c: mov       byte ptr [rbp + 0x644], 1
14026a263: lea       rax, [rbp + 0x558]
14026a26a: movups    xmmword ptr [rax + 0x10], xmm6
14026a26e: movups    xmmword ptr [rax], xmm6
14026a271: movaps    xmm0, xmmword ptr [rip + 0x5b80b48]
14026a278: movups    xmmword ptr [rbp + 0x578], xmm0
14026a27f: mov       qword ptr [rbp + 0x550], 0
14026a28a: movups    xmmword ptr [rax + 0x40], xmm6
14026a28e: movups    xmmword ptr [rax + 0x30], xmm6
14026a292: mov       word ptr [rax + 0x114], 0
14026a29b: mov       dword ptr [rax + 0x110], 0
14026a2a5: movups    xmm0, xmmword ptr [rip + 0x5b8171c]
14026a2ac: movups    xmmword ptr [rax + 0x60], xmm0
14026a2b0: movups    xmm0, xmmword ptr [rip + 0x5b81701]
14026a2b7: movups    xmmword ptr [rax + 0x50], xmm0
14026a2bb: movups    xmmword ptr [rax + 0x70], xmm14
14026a2c0: movups    xmmword ptr [rax + 0x80], xmm12
14026a2c8: movaps    xmm0, xmmword ptr [rip + 0x5b32fe1]
14026a2cf: movups    xmmword ptr [rbp + 0x5e8], xmm0
14026a2d6: movups    xmmword ptr [rbp + 0x5f8], xmm0
14026a2dd: movaps    xmm0, xmmword ptr [rip + 0x5b32f7c]
14026a2e4: movups    xmmword ptr [rbp + 0x608], xmm0
14026a2eb: movups    xmmword ptr [rbp + 0x618], xmm0
14026a2f2: mov       word ptr [rbp + 0x666], 0
14026a2fb: mov       dword ptr [rbp + 0x662], 0
14026a305: mov       qword ptr [rbp + 0x648], 0
14026a310: mov       dword ptr [rbp + 0x650], 0
14026a31a: movaps    xmm0, xmmword ptr [rip + 0x5b32f4f]
14026a321: movups    xmmword ptr [rbp + 0x628], xmm0
14026a328: mov       dword ptr [rbp + 0x638], 1
14026a332: mov       qword ptr [rbp + 0x63c], 0
14026a33d: movaps    xmmword ptr [rbp + 0x4f0], xmm15
14026a345: mov       qword ptr [rbp + 0x500], 0
14026a350: movups    xmmword ptr [rax - 0x50], xmm9
14026a355: mov       qword ptr [rax - 0x40], 0
14026a35d: movups    xmmword ptr [rax - 0x38], xmm7
14026a361: mov       qword ptr [rax - 0x28], 0
14026a369: movups    xmmword ptr [rax - 0x20], xmm11
14026a36e: mov       qword ptr [rax - 0x10], 0
14026a376: mov       dword ptr [rax + 0xfe], 0x10000
14026a380: mov       word ptr [rax + 0x102], 0
14026a389: mov       word ptr [rax + 0x108], 0
14026a392: mov       dword ptr [rax + 0x104], 0x10000
14026a39c: test      r8b, r8b
14026a39f: je        0x14026a3b0
14026a3a1: movups    xmm0, xmmword ptr [rip + 0x5b8375c]
14026a3a8: jmp       0x14026a3b7
14026a3aa: nop       word ptr [rax + rax]
14026a3b0: movups    xmm0, xmmword ptr [rip + 0x5b818c1]
14026a3b7: movaps    xmmword ptr [rbp + 0x8e0], xmm0
14026a3be: mov       dword ptr [rbp + 0x8f0], 0x3f800000
14026a3c8: lea       rcx, [rbp + 0x2a4]
14026a3cf: mov       eax, dword ptr [rbp + 0x8f0]
14026a3d5: mov       dword ptr [rbp + 0x2a0], eax
14026a3db: movaps    xmm0, xmmword ptr [rbp + 0x8e0]
14026a3e2: movaps    xmmword ptr [rbp + 0x290], xmm0
14026a3e9: mov       dword ptr [rcx + 0x10], eax
14026a3ec: movups    xmmword ptr [rcx], xmm0
14026a3ef: mov       eax, dword ptr [rbp + 0x8f0]
14026a3f5: mov       dword ptr [rcx + 0x24], eax
14026a3f8: movaps    xmm0, xmmword ptr [rbp + 0x8e0]
14026a3ff: movups    xmmword ptr [rcx + 0x14], xmm0
14026a403: mov       eax, dword ptr [rbp + 0x8f0]
14026a409: mov       dword ptr [rcx + 0x38], eax
14026a40c: movdqa    xmm0, xmmword ptr [rbp + 0x8e0]
14026a414: movdqu    xmmword ptr [rcx + 0x28], xmm0
14026a419: mov       rax, qword ptr [rdi]
14026a41c: mov       rbx, qword ptr [rax + 0x48]
14026a420: test      rbx, rbx
14026a423: mov       rdx, rdi
14026a426: mov       rdi, rbx
14026a429: mov       ecx, 0x15
14026a42e: cmove     rdi, rcx
14026a432: test      rdi, rdi
14026a435: js        0x14026ab5c
14026a43b: mov       byte ptr [rbp + 0x936], r8b
14026a442: mov       qword ptr [rbp + 0x838], rdx
14026a449: mov       qword ptr [rbp + 0x830], rsi
14026a450: mov       qword ptr [rbp + 0x890], r13
14026a457: mov       r14, r12
14026a45a: mov       r12, qword ptr [rax + 0x40]
14026a45e: call      0x140002200
14026a463: mov       r13d, 1
14026a469: mov       edx, 1
14026a46e: mov       rcx, rdi
14026a471: call      0x1400021c0
14026a476: test      rax, rax
14026a479: je        0x14026ab5f
14026a47f: mov       rsi, rax
14026a482: test      rbx, rbx
14026a485: lea       rax, [rip + 0x5b6c2b8]
14026a48c: cmove     r12, rax
14026a490: mov       rcx, rsi
14026a493: mov       rdx, r12
14026a496: mov       r8, rdi
14026a499: call      0x145bfa0e7
14026a49e: cmp       rdi, 8
14026a4a2: jae       0x14026a4d0
14026a4a4: xor       eax, eax
14026a4a6: mov       r12, r14
14026a4a9: mov       r13, qword ptr [rbp + 0x890]
14026a4b0: lea       rbx, [rbp + 0x900]
14026a4b7: movzx     r14d, byte ptr [rbp + 0x936]
14026a4bf: jmp       0x14026a5f0
14026a4c4: nop       word ptr cs:[rax + rax]
14026a4d0: cmp       rdi, 0x20
14026a4d4: mov       r12, r14
14026a4d7: mov       r13, qword ptr [rbp + 0x890]
14026a4de: movdqa    xmm5, xmmword ptr [rip + 0x5b32d2a]
14026a4e6: lea       rbx, [rbp + 0x900]
14026a4ed: jae       0x14026a4fe
14026a4ef: xor       eax, eax
14026a4f1: movzx     r14d, byte ptr [rbp + 0x936]
14026a4f9: jmp       0x14026a58c
14026a4fe: mov       rax, rdi
14026a501: movabs    rcx, 0x7fffffffffffffe0
14026a50b: and       rax, rcx
14026a50e: xor       ecx, ecx
14026a510: movzx     r14d, byte ptr [rbp + 0x936]
14026a518: nop       dword ptr [rax + rax]
14026a520: movdqu    xmm0, xmmword ptr [rsi + rcx]
14026a525: movdqu    xmm1, xmmword ptr [rsi + rcx + 0x10]
14026a52b: movdqa    xmm2, xmm0
14026a52f: paddb     xmm2, xmm13
14026a534: movdqa    xmm3, xmm1
14026a538: paddb     xmm3, xmm13
14026a53d: movdqa    xmm4, xmm2
14026a541: pminub    xmm4, xmm8
14026a546: pcmpeqb   xmm4, xmm2
14026a54a: pand      xmm4, xmm10
14026a54f: movdqa    xmm2, xmm3
14026a553: pminub    xmm2, xmm8
14026a558: pcmpeqb   xmm2, xmm3
14026a55c: pand      xmm2, xmm10
14026a561: por       xmm4, xmm0
14026a565: por       xmm2, xmm1
14026a569: movdqu    xmmword ptr [rsi + rcx], xmm4
14026a56e: movdqu    xmmword ptr [rsi + rcx + 0x10], xmm2
14026a574: add       rcx, 0x20
14026a578: cmp       rax, rcx
14026a57b: jne       0x14026a520
14026a57d: cmp       rdi, rax
14026a580: je        0x14026a60d
14026a586: test      dil, 0x18
14026a58a: je        0x14026a5f0
14026a58c: mov       rcx, rax
14026a58f: mov       rax, rdi
14026a592: movabs    rdx, 0x7ffffffffffffff8
14026a59c: and       rax, rdx
14026a59f: movdqa    xmm3, xmmword ptr [rip + 0x5b32c49]
14026a5a7: movdqa    xmm4, xmmword ptr [rip + 0x5b32c51]
14026a5af: nop
14026a5b0: movq      xmm0, qword ptr [rsi + rcx]
14026a5b5: movdqa    xmm1, xmm0
14026a5b9: paddb     xmm1, xmm3
14026a5bd: movdqa    xmm2, xmm1
14026a5c1: pmaxub    xmm2, xmm4
14026a5c5: pcmpeqb   xmm2, xmm1
14026a5c9: pandn     xmm2, xmm5
14026a5cd: por       xmm2, xmm0
14026a5d1: movq      qword ptr [rsi + rcx], xmm2
14026a5d6: add       rcx, 8
14026a5da: cmp       rax, rcx
14026a5dd: jne       0x14026a5b0
14026a5df: jmp       0x14026a608
14026a5e1: nop       word ptr cs:[rax + rax]
14026a5f0: movzx     ecx, byte ptr [rsi + rax]
14026a5f4: lea       edx, [rcx - 0x41]
14026a5f7: cmp       dl, 0x1a
14026a5fa: setb      dl
14026a5fd: shl       dl, 5
14026a600: or        dl, cl
14026a602: mov       byte ptr [rsi + rax], dl
14026a605: inc       rax
14026a608: cmp       rdi, rax
14026a60b: jne       0x14026a5f0
14026a60d: mov       qword ptr [rbp + 0x900], rdi
14026a614: mov       qword ptr [rbp + 0x908], rsi
14026a61b: mov       qword ptr [rbp + 0x910], rdi
14026a622: mov       qword ptr [rbp + 0x858], rbx
14026a629: lea       rax, [rip - 0x268550]
14026a630: mov       qword ptr [rbp + 0x860], rax
14026a637: lea       rcx, [rbp + 0x8a0]
14026a63e: lea       rdx, [rip + 0x5b6c114]
14026a645: lea       rsi, [rbp + 0x858]
14026a64c: mov       r8, rsi
14026a64f: call      0x145bcce30
14026a654: nop
14026a655: mov       rdx, qword ptr [rbp + 0x900]
14026a65c: test      rdx, rdx
14026a65f: je        0x14026a673
14026a661: mov       rcx, qword ptr [rbp + 0x908]
14026a668: mov       r8d, 1
14026a66e: call      0x1400021d0
14026a673: mov       rax, qword ptr [rbp + 0x8b0]
14026a67a: mov       qword ptr [rbp + 0x910], rax
14026a681: movdqu    xmm0, xmmword ptr [rbp + 0x8a0]
14026a689: movdqa    xmmword ptr [rbp + 0x900], xmm0
14026a691: lea       rax, [rip + 0x5b6e5c0]
14026a698: mov       qword ptr [rsp + 0x20], rax
14026a69d: mov       r9d, 1
14026a6a3: mov       rcx, rsi
14026a6a6: mov       rdx, qword ptr [rbp + 0x818]
14026a6ad: mov       r8, rbx
14026a6b0: call      0x140125ff0
14026a6b5: nop
14026a6b6: lea       rdi, [rbp + 0x208]
14026a6bd: mov       rcx, rdi
14026a6c0: mov       rdx, rsi
14026a6c3: call      0x1426eca60
14026a6c8: nop
14026a6c9: xor       eax, eax
14026a6cb: test      r14b, r14b
14026a6ce: setne     al
14026a6d1: mov       dword ptr [rbp + 0x240], eax
14026a6d7: lea       rcx, [rip + 0x5b81072]
14026a6de: movss     xmm0, dword ptr [rcx + rax*4]
14026a6e3: movaps    xmm1, xmmword ptr [rip + 0x5b32d56]
14026a6ea: movss     xmm1, xmm0
14026a6ee: shufps    xmm1, xmm1, 0x40
14026a6f2: movups    xmmword ptr [rbp + 0x244], xmm1
14026a6f9: mov       r8d, 0x180
14026a6ff: lea       rsi, [rbp - 0x50]
14026a703: mov       rcx, rsi
14026a706: lea       rdx, [rbp + 0x4f0]
14026a70d: call      0x145bfa0e7
14026a712: movaps    xmm0, xmmword ptr [rbp + 0x290]
14026a719: movdqa    xmm1, xmmword ptr [rbp + 0x2a0]
14026a721: movdqa    xmm2, xmmword ptr [rbp + 0x2b0]
14026a729: movdqa    xmm3, xmmword ptr [rbp + 0x2c0]
14026a731: lea       rax, [rbp + 0x130]
14026a738: movups    xmmword ptr [rax], xmm0
14026a73b: movdqu    xmmword ptr [rax + 0x10], xmm1
14026a740: movdqu    xmmword ptr [rax + 0x20], xmm2
14026a745: movdqu    xmmword ptr [rax + 0x30], xmm3
14026a74a: movdqa    xmm0, xmmword ptr [rbp + 0x2d0]
14026a752: movdqu    xmmword ptr [rax + 0x40], xmm0
14026a757: mov       r8d, 0x88
14026a75d: lea       rcx, [rbp + 0x180]
14026a764: mov       rdx, rdi
14026a767: call      0x145bfa0e7
14026a76c: mov       r8d, 0x258
14026a772: lea       rcx, [rbp + 0x298]
14026a779: mov       rdx, rsi
14026a77c: call      0x145bfa0e7
14026a781: mov       rax, qword ptr [rbp + 0x928]
14026a788: mov       qword ptr [rbp + 0x290], rax
14026a78f: mov       byte ptr [rbp + 0x937], 1
14026a796: mov       rcx, qword ptr [rbp + 0x808]
14026a79d: call      0x144e1e910
14026a7a2: nop
14026a7a3: mov       rbx, qword ptr [rbp + 0x800]
14026a7aa: mov       rsi, rax
14026a7ad: test      rbx, rbx
14026a7b0: lea       r14, [rbp + 0x290]
14026a7b7: mov       qword ptr [rbp + 0x898], r12
14026a7be: mov       r12, r13
14026a7c1: mov       r8d, 0x260
14026a7c7: lea       rcx, [rbp + 0x4f0]
14026a7ce: mov       rdx, r14
14026a7d1: je        0x14026a7fe
14026a7d3: call      0x145bfa0e7
14026a7d8: mov       qword ptr [rbp + 0x750], rsi
14026a7df: mov       rax, qword ptr [rbx]
14026a7e2: mov       rdi, qword ptr [rbx + 0x10]
14026a7e6: sub       rax, rdi
14026a7e9: cmp       rax, 0x26f
14026a7ef: jbe       0x14026a899
14026a7f5: mov       r13, rbx
14026a7f8: mov       rbx, qword ptr [rbx + 8]
14026a7fc: jmp       0x14026a82c
14026a7fe: call      0x145bfa0e7
14026a803: mov       qword ptr [rbp + 0x750], rsi
14026a80a: mov       r13, qword ptr [rbp + 0x828]
14026a811: mov       rax, qword ptr [r13]
14026a815: mov       rdi, qword ptr [r13 + 0x10]
14026a819: sub       rax, rdi
14026a81c: cmp       rax, 0x26f
14026a822: jbe       0x14026a8bf
14026a828: mov       rbx, qword ptr [r13 + 8]
14026a82c: lea       rax, [rip + 0xe89d]
14026a833: mov       qword ptr [rbx + rdi], rax
14026a837: lea       rcx, [rbx + rdi]
14026a83b: add       rcx, 8
14026a83f: mov       r8d, 0x260
14026a845: mov       rdx, r14
14026a848: call      0x145bfa0e7
14026a84d: mov       qword ptr [rbx + rdi + 0x268], rsi
14026a855: add       rdi, 0x270
14026a85c: mov       qword ptr [r13 + 0x10], rdi
14026a860: mov       r13, r12
14026a863: mov       r12, qword ptr [rbp + 0x898]
14026a86a: mov       rdi, qword ptr [rbp + 0x838]
14026a871: add       rdi, 8
14026a875: cmp       rdi, qword ptr [rbp + 0x918]
14026a87c: mov       rbx, qword ptr [rbp + 0x820]
14026a883: lea       r14, [rip + 0x5b85316]
14026a88a: mov       rsi, qword ptr [rbp + 0x830]
14026a891: jne       0x14026a23c
14026a897: jmp       0x14026a8f0
14026a899: mov       qword ptr [rsp + 0x20], 1
14026a8a2: mov       r8d, 0x270
14026a8a8: mov       r9d, 1
14026a8ae: mov       rcx, rbx
14026a8b1: mov       rdx, rdi
14026a8b4: call      0x145bfa970
14026a8b9: nop
14026a8ba: jmp       0x14026a7f5
14026a8bf: mov       qword ptr [rsp + 0x20], 1
14026a8c8: mov       r8d, 0x270
14026a8ce: mov       r9d, 1
14026a8d4: mov       rcx, r13
14026a8d7: mov       rdx, rdi
14026a8da: call      0x145bfa970
14026a8df: nop
14026a8e0: jmp       0x14026a828
14026a8e5: nop       word ptr cs:[rax + rax]
14026a8f0: cmp       r15, qword ptr [rbp + 0x918]
14026a8f7: je        0x14026a903
14026a8f9: movdqu    xmm0, xmmword ptr [rip + 0x5b81e47]
14026a901: jmp       0x14026a90b
14026a903: movdqu    xmm0, xmmword ptr [rip + 0x5b80fb1]
14026a90b: movdqa    xmmword ptr [rbp + 0x8a0], xmm0
14026a913: mov       dword ptr [rbp + 0x8b0], 0x3f800000
14026a91d: mov       edx, 0x14
14026a922: lea       rcx, [rip + 0x5b831ef]
14026a929: call      0x1458ec450
14026a92e: nop
14026a92f: mov       r8, rdx
14026a932: movzx     ecx, byte ptr [rsi + 0x70]
14026a936: lea       ecx, [rcx + rcx*4]
14026a939: mov       dword ptr [rbp + 0x8dc], ecx
14026a93f: lea       rcx, [rip + 0x5b819de]
14026a946: mov       qword ptr [rbp + 0x290], rcx
14026a94d: mov       qword ptr [rbp + 0x298], 1
14026a958: lea       rcx, [rbp + 0x8dc]
14026a95f: mov       qword ptr [rbp + 0x2a0], rcx
14026a966: lea       rcx, [rip + 0x5b811e3]
14026a96d: mov       qword ptr [rbp + 0x2a8], rcx
14026a974: lea       rcx, [rip + 0x5b814c4]
14026a97b: mov       qword ptr [rbp + 0x2b0], rcx
14026a982: mov       qword ptr [rbp + 0x2b8], 4
14026a98d: lea       rcx, [rbp + 0x870]
14026a994: mov       qword ptr [rbp + 0x2c0], rcx
14026a99b: lea       rcx, [rip + 0x5b8144e]
14026a9a2: mov       qword ptr [rbp + 0x2c8], rcx
14026a9a9: mov       qword ptr [rsp + 0x20], 2
14026a9b2: lea       rcx, [rbp - 0x50]
14026a9b6: mov       rdx, rax
14026a9b9: lea       r9, [rbp + 0x290]
14026a9c0: call      0x1458ec8b0
14026a9c5: nop
14026a9c6: mov       rdx, qword ptr [rbp + 0x840]
14026a9cd: cmp       byte ptr [rdx], 1
14026a9d0: jne       0x14026a9f6
14026a9d2: mov       rcx, qword ptr [rbp + 0x848]
14026a9d9: mov       eax, dword ptr [rcx]
14026a9db: mov       ecx, dword ptr [rcx + 3]
14026a9de: mov       dword ptr [rbp + 0x85b], ecx
14026a9e4: mov       dword ptr [rbp + 0x858], eax
14026a9ea: mov       rax, qword ptr [rdx + 8]
14026a9ee: movzx     edx, byte ptr [rdx + 0x10]
14026a9f2: mov       cl, 1
14026a9f4: jmp       0x14026aa06
14026a9f6: mov       rax, qword ptr [rdx + 8]
14026a9fa: lock inc  qword ptr [rax]
14026a9fe: jle       0x14026ac08
14026aa04: xor       ecx, ecx
14026aa06: mov       r8, qword ptr [rbp - 0x40]
14026aa0a: lea       r9, [rbp + 0x4f8]
14026aa11: mov       qword ptr [r9 + 0x10], r8
14026aa15: movups    xmm0, xmmword ptr [rbp - 0x50]
14026aa19: movups    xmmword ptr [r9], xmm0
14026aa1d: mov       r8d, dword ptr [rbp + 0x858]
14026aa24: mov       r9d, dword ptr [rbp + 0x85b]
14026aa2b: lea       r10, [rbp + 0x558]
14026aa32: mov       dword ptr [r10 - 0x2c], r9d
14026aa36: mov       dword ptr [r10 - 0x2f], r8d
14026aa3a: mov       r8d, dword ptr [rbp + 0x8b0]
14026aa41: lea       r9, [rbp + 0x901]
14026aa48: mov       dword ptr [r9 + 0x10], r8d
14026aa4c: movaps    xmm0, xmmword ptr [rbp + 0x8a0]
14026aa53: movups    xmmword ptr [r9], xmm0
14026aa57: mov       qword ptr [rbp + 0x510], 0
14026aa62: mov       qword ptr [rbp + 0x518], 4
14026aa6d: mov       qword ptr [rbp + 0x520], 0
14026aa78: mov       byte ptr [rbp + 0x528], cl
14026aa7e: mov       qword ptr [rbp + 0x530], rax
14026aa85: mov       qword ptr [rbp + 0x538], rdx
14026aa8c: mov       dword ptr [rbp + 0x540], 0x41400000
14026aa96: mov       word ptr [rbp + 0x544], 0x190
14026aa9f: mov       byte ptr [rbp + 0x546], 1
14026aaa6: mov       rax, qword ptr [rbp + 0x90d]
14026aaad: mov       qword ptr [r10 - 4], rax
14026aab1: movups    xmm0, xmmword ptr [rbp + 0x900]
14026aab8: movups    xmmword ptr [r10 - 0x11], xmm0
14026aabd: mov       eax, dword ptr [rip + 0x5b6afdd]
14026aac3: mov       dword ptr [r10 + 0x14], eax
14026aac7: movups    xmm0, xmmword ptr [rip + 0x5b6afc2]
14026aace: movups    xmmword ptr [r10 + 4], xmm0
14026aad3: movq      xmm0, qword ptr [rip + 0x5b329c5]
14026aadb: movq      qword ptr [rbp + 0x570], xmm0
14026aae3: mov       rax, qword ptr [rbp + 0x928]
14026aaea: mov       qword ptr [rbp + 0x4f0], rax
14026aaf1: lea       rcx, [rbp - 0x50]
14026aaf5: lea       rdx, [rbp + 0x790]
14026aafc: lea       r8, [rbp + 0x4f0]
14026ab03: call      0x1401f2bf0
14026ab08: nop
14026ab09: mov       rdx, qword ptr [rbp + 0x870]
14026ab10: test      rdx, rdx
14026ab13: je        0x14026ab27
14026ab15: mov       rcx, qword ptr [rbp + 0x878]
14026ab1c: mov       r8d, 1
14026ab22: call      0x1400021d0
14026ab27: mov       rdx, qword ptr [rbp + 0x7e8]
14026ab2e: test      rdx, rdx
14026ab31: mov       rdi, qword ptr [rbp + 0x810]
14026ab38: je        0x14026ab50
14026ab3a: shl       rdx, 3
14026ab3e: mov       r8d, 8
14026ab44: mov       rcx, qword ptr [rbp + 0x920]
14026ab4b: call      0x1400021d0
14026ab50: mov       rax, qword ptr [rbp + 0x888]
14026ab57: jmp       0x140269e96
14026ab5c: xor       r13d, r13d
14026ab5f: mov       rcx, r13
14026ab62: mov       rdx, rdi
14026ab65: call      0x145d992bb
14026ab6a: nop
14026ab6b: jmp       0x14026ac08
14026ab70: mov       rdx, qword ptr [rbp + 0x8c0]
14026ab77: test      rdx, rdx
14026ab7a: je        0x14026ab92
14026ab7c: mov       rcx, qword ptr [rbp + 0x8c8]
14026ab83: shl       rdx, 3
14026ab87: mov       r8d, 8
14026ab8d: call      0x1400021d0
14026ab92: mov       rax, qword ptr [rbp + 0x850]
14026ab99: movaps    xmm6, xmmword ptr [rbp + 0x940]
14026aba0: movaps    xmm7, xmmword ptr [rbp + 0x950]
14026aba7: movaps    xmm8, xmmword ptr [rbp + 0x960]
14026abaf: movaps    xmm9, xmmword ptr [rbp + 0x970]
14026abb7: movaps    xmm10, xmmword ptr [rbp + 0x980]
14026abbf: movaps    xmm11, xmmword ptr [rbp + 0x990]
14026abc7: movaps    xmm12, xmmword ptr [rbp + 0x9a0]
14026abcf: movaps    xmm13, xmmword ptr [rbp + 0x9b0]
14026abd7: movaps    xmm14, xmmword ptr [rbp + 0x9c0]
14026abdf: movaps    xmm15, xmmword ptr [rbp + 0x9d0]
14026abe7: add       rsp, 0xa68
14026abee: pop       rbx
14026abef: pop       rdi
14026abf0: pop       rsi
14026abf1: pop       r12
14026abf3: pop       r13
14026abf5: pop       r14
14026abf7: pop       r15
14026abf9: pop       rbp
14026abfa: ret
14026abfb: lea       r8, [rip + 0x5b84f86]
14026ac02: call      0x145d99653
14026ac07: nop
14026ac08: ud2
