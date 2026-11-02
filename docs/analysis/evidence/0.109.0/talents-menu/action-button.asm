14010ae50: push      r15
14010ae52: push      r14
14010ae54: push      rsi
14010ae55: push      rdi
14010ae56: push      rbp
14010ae57: push      rbx
14010ae58: sub       rsp, 0x3b8
14010ae5f: movaps    xmmword ptr [rsp + 0x3a0], xmm6
14010ae67: mov       rsi, r9
14010ae6a: mov       rbx, r8
14010ae6d: mov       rdi, rdx
14010ae70: mov       rdx, rcx
14010ae73: movzx     ebp, byte ptr [rsp + 0x410]
14010ae7b: movups    xmm0, xmmword ptr [rip + 0x5ccaeae]
14010ae82: movaps    xmmword ptr [rsp + 0x310], xmm0
14010ae8a: mov       qword ptr [rsp + 0x320], 0
14010ae96: movups    xmm0, xmmword ptr [rip + 0x5ccaeab]
14010ae9d: movups    xmmword ptr [rsp + 0x328], xmm0
14010aea5: mov       qword ptr [rsp + 0x338], 0
14010aeb1: movups    xmm0, xmmword ptr [rip + 0x5ccaea8]
14010aeb8: movaps    xmmword ptr [rsp + 0x340], xmm0
14010aec0: mov       qword ptr [rsp + 0x350], 0
14010aecc: movups    xmm0, xmmword ptr [rip + 0x5ccaea5]
14010aed3: movups    xmmword ptr [rsp + 0x358], xmm0
14010aedb: mov       qword ptr [rsp + 0x368], 0
14010aee7: test      bpl, bpl
14010aeea: je        0x14010aef5
14010aeec: movups    xmm0, xmmword ptr [rip + 0x5ccb83d]
14010aef3: jmp       0x14010aefc
14010aef5: movups    xmm0, xmmword ptr [rip + 0x5ccb3c8]
14010aefc: movaps    xmmword ptr [rsp + 0x90], xmm0
14010af04: mov       dword ptr [rsp + 0xa0], 0x3f800000
14010af0f: mov       eax, dword ptr [rsp + 0xa0]
14010af16: mov       dword ptr [rsp + 0xc0], eax
14010af1d: movaps    xmm0, xmmword ptr [rsp + 0x90]
14010af25: mov       dword ptr [rsp + 0xd4], eax
14010af2c: movups    xmmword ptr [rsp + 0xc4], xmm0
14010af34: mov       dword ptr [rsp + 0xe8], eax
14010af3b: movups    xmmword ptr [rsp + 0xd8], xmm0
14010af43: movups    xmmword ptr [rsp + 0xec], xmm0
14010af4b: mov       dword ptr [rsp + 0xfc], eax
14010af52: movups    xmmword ptr [rsp + 0x26], xmm0
14010af57: mov       rax, qword ptr [rsp + 0xf0]
14010af5f: mov       qword ptr [rsp + 0x66], rax
14010af64: mov       eax, dword ptr [rsp + 0xf8]
14010af6b: mov       dword ptr [rsp + 0x6e], eax
14010af6f: mov       eax, dword ptr [rsp + 0xfc]
14010af76: mov       dword ptr [rsp + 0x72], eax
14010af7a: mov       rax, qword ptr [rsp + 0xe0]
14010af82: mov       qword ptr [rsp + 0x56], rax
14010af87: mov       eax, dword ptr [rsp + 0xe8]
14010af8e: mov       dword ptr [rsp + 0x5e], eax
14010af92: mov       eax, dword ptr [rsp + 0xec]
14010af99: mov       dword ptr [rsp + 0x62], eax
14010af9d: movaps    xmm0, xmmword ptr [rsp + 0xd0]
14010afa5: movups    xmmword ptr [rsp + 0x46], xmm0
14010afaa: movaps    xmm0, xmmword ptr [rsp + 0xc0]
14010afb2: movups    xmmword ptr [rsp + 0x36], xmm0
14010afb7: mov       rax, qword ptr [rdx]
14010afba: add       rdx, 8
14010afbe: movaps    xmm0, xmmword ptr [rsp + 0x360]
14010afc6: movups    xmmword ptr [rsp + 0x108], xmm0
14010afce: movaps    xmm0, xmmword ptr [rsp + 0x350]
14010afd6: movups    xmmword ptr [rsp + 0xf8], xmm0
14010afde: movaps    xmm0, xmmword ptr [rsp + 0x310]
14010afe6: movaps    xmm1, xmmword ptr [rsp + 0x320]
14010afee: movaps    xmm2, xmmword ptr [rsp + 0x330]
14010aff6: movaps    xmm3, xmmword ptr [rsp + 0x340]
14010affe: movups    xmmword ptr [rsp + 0xe8], xmm3
14010b006: movups    xmmword ptr [rsp + 0xd8], xmm2
14010b00e: movups    xmmword ptr [rsp + 0xc8], xmm1
14010b016: movups    xmmword ptr [rsp + 0xb8], xmm0
14010b01e: xorps     xmm0, xmm0
14010b021: movups    xmmword ptr [rsp + 0x118], xmm0
14010b029: movups    xmmword ptr [rsp + 0x128], xmm0
14010b031: movups    xmmword ptr [rsp + 0x138], xmm0
14010b039: movups    xmmword ptr [rsp + 0x148], xmm0
14010b041: movups    xmmword ptr [rsp + 0x158], xmm0
14010b049: mov       qword ptr [rsp + 0x168], 0
14010b055: movups    xmm1, xmmword ptr [rip + 0x5ccad9c]
14010b05c: movups    xmmword ptr [rsp + 0x180], xmm1
14010b064: movups    xmm1, xmmword ptr [rip + 0x5ccad7d]
14010b06b: movups    xmmword ptr [rsp + 0x170], xmm1
14010b073: movaps    xmm1, xmmword ptr [rip + 0x5c925d6]
14010b07a: movups    xmmword ptr [rsp + 0x190], xmm1
14010b082: movaps    xmm1, xmmword ptr [rip + 0x5c921d7]
14010b089: movups    xmmword ptr [rsp + 0x1a0], xmm1
14010b091: movaps    xmm1, xmmword ptr [rip + 0x5c92218]
14010b098: movups    xmmword ptr [rsp + 0x1b0], xmm1
14010b0a0: movups    xmmword ptr [rsp + 0x1c0], xmm1
14010b0a8: movaps    xmm1, xmmword ptr [rip + 0x5cc2051]
14010b0af: movups    xmmword ptr [rsp + 0x1d0], xmm1
14010b0b7: movups    xmmword ptr [rsp + 0x1e0], xmm1
14010b0bf: movaps    xmm1, xmmword ptr [rip + 0x5c921aa]
14010b0c6: movups    xmmword ptr [rsp + 0x1f0], xmm1
14010b0ce: mov       dword ptr [rsp + 0x200], 1
14010b0d9: mov       qword ptr [rsp + 0x204], 0
14010b0e5: mov       byte ptr [rsp + 0x20c], 1
14010b0ed: mov       qword ptr [rsp + 0x210], 0
14010b0f9: mov       dword ptr [rsp + 0x218], 0x3f800000
14010b104: mov       word ptr [rsp + 0x21c], 0
14010b10e: mov       dword ptr [rsp + 0x21e], 0x10000
14010b119: mov       word ptr [rsp + 0x222], 0
14010b123: mov       word ptr [rsp + 0x228], 0
14010b12d: mov       dword ptr [rsp + 0x224], 0x10000
14010b138: mov       dword ptr [rsp + 0x232], 0
14010b143: mov       qword ptr [rsp + 0x22a], 0
14010b14f: movzx     ecx, word ptr [rsp + 0x74]
14010b154: mov       word ptr [rsp + 0x286], cx
14010b15c: movups    xmm1, xmmword ptr [rsp + 0x64]
14010b161: movups    xmmword ptr [rsp + 0x276], xmm1
14010b169: movups    xmm1, xmmword ptr [rsp + 0x24]
14010b16e: movups    xmm2, xmmword ptr [rsp + 0x34]
14010b173: movups    xmm3, xmmword ptr [rsp + 0x44]
14010b178: movups    xmm4, xmmword ptr [rsp + 0x54]
14010b17d: movups    xmmword ptr [rsp + 0x266], xmm4
14010b185: movups    xmmword ptr [rsp + 0x256], xmm3
14010b18d: movups    xmmword ptr [rsp + 0x246], xmm2
14010b195: movups    xmmword ptr [rsp + 0x236], xmm1
14010b19d: movups    xmmword ptr [rsp + 0x288], xmm0
14010b1a5: mov       dword ptr [rsp + 0x298], 0x3f000000
14010b1b0: mov       qword ptr [rsp + 0xb0], rax
14010b1b8: lea       r9, [rip + 0x5cca271]
14010b1bf: lea       rcx, [rsp + 0x370]
14010b1c7: lea       r8, [rsp + 0xb0]
14010b1cf: call      0x1401defd0
14010b1d4: test      bpl, bpl
14010b1d7: je        0x14010b403
14010b1dd: mov       r14, qword ptr [rsp + 0x418]
14010b1e5: movups    xmm0, xmmword ptr [rip + 0x5ccb544]
14010b1ec: movaps    xmmword ptr [rsp + 0x2a0], xmm0
14010b1f4: mov       dword ptr [rsp + 0x2b0], 0x3f800000
14010b1ff: movups    xmm0, xmmword ptr [rip + 0x5ccb606]
14010b206: movups    xmmword ptr [rsp + 0x2b4], xmm0
14010b20e: mov       dword ptr [rsp + 0x2c4], 0x3f800000
14010b219: lea       rcx, [rsp + 0xb0]
14010b221: call      0x140100690
14010b226: mov       rax, qword ptr [r14 + 0x10]
14010b22a: mov       qword ptr [rsp + 0x2e0], rax
14010b232: movups    xmm0, xmmword ptr [r14]
14010b236: movaps    xmmword ptr [rsp + 0x2d0], xmm0
14010b23e: movaps    xmm0, xmmword ptr [rsp + 0x2a0]
14010b246: movaps    xmm1, xmmword ptr [rsp + 0x2b0]
14010b24e: movups    xmmword ptr [rsp + 0x2e8], xmm0
14010b256: movups    xmmword ptr [rsp + 0x2f8], xmm1
14010b25e: mov       rax, qword ptr [rsp + 0x2c0]
14010b266: mov       qword ptr [rsp + 0x308], rax
14010b26e: movups    xmm0, xmmword ptr [rsp + 0xb0]
14010b276: movups    xmm1, xmmword ptr [rsp + 0xc0]
14010b27e: movups    xmm2, xmmword ptr [rsp + 0xd0]
14010b286: movups    xmm3, xmmword ptr [rsp + 0xe0]
14010b28e: movups    xmmword ptr [rsp + 0x27], xmm0
14010b293: movups    xmmword ptr [rsp + 0x37], xmm1
14010b298: movups    xmmword ptr [rsp + 0x47], xmm2
14010b29d: movups    xmmword ptr [rsp + 0x57], xmm3
14010b2a2: movups    xmm0, xmmword ptr [rsp + 0xf0]
14010b2aa: movups    xmmword ptr [rsp + 0x67], xmm0
14010b2af: movups    xmm0, xmmword ptr [rsp + 0x100]
14010b2b7: movups    xmmword ptr [rsp + 0x77], xmm0
14010b2bc: mov       rax, qword ptr [rsp + 0x110]
14010b2c4: mov       qword ptr [rsp + 0x87], rax
14010b2cc: movaps    xmm0, xmmword ptr [rsp + 0x2d0]
14010b2d4: movaps    xmm1, xmmword ptr [rsp + 0x2e0]
14010b2dc: movaps    xmm2, xmmword ptr [rsp + 0x2f0]
14010b2e4: mov       rax, qword ptr [rsp + 0x300]
14010b2ec: mov       qword ptr [rsp + 0xe0], rax
14010b2f4: mov       rax, qword ptr [rsp + 0x308]
14010b2fc: mov       qword ptr [rsp + 0xe8], rax
14010b304: movaps    xmmword ptr [rsp + 0xd0], xmm2
14010b30c: movaps    xmmword ptr [rsp + 0xc0], xmm1
14010b314: movaps    xmmword ptr [rsp + 0xb0], xmm0
14010b31c: mov       dword ptr [rsp + 0xf0], 0
14010b327: mov       byte ptr [rsp + 0xf4], 2
14010b32f: movups    xmm0, xmmword ptr [rsp + 0x24]
14010b334: movups    xmm1, xmmword ptr [rsp + 0x34]
14010b339: movups    xmm2, xmmword ptr [rsp + 0x44]
14010b33e: movups    xmm3, xmmword ptr [rsp + 0x54]
14010b343: movups    xmmword ptr [rsp + 0xf5], xmm0
14010b34b: movups    xmmword ptr [rsp + 0x105], xmm1
14010b353: movups    xmmword ptr [rsp + 0x115], xmm2
14010b35b: movups    xmmword ptr [rsp + 0x125], xmm3
14010b363: movups    xmm0, xmmword ptr [rsp + 0x64]
14010b368: movups    xmmword ptr [rsp + 0x135], xmm0
14010b370: movups    xmm0, xmmword ptr [rsp + 0x74]
14010b375: movups    xmmword ptr [rsp + 0x145], xmm0
14010b37d: movups    xmm0, xmmword ptr [rsp + 0x7f]
14010b382: movups    xmmword ptr [rsp + 0x150], xmm0
14010b38a: mov       byte ptr [rsp + 0x160], 0
14010b392: lea       rcx, [rsp + 0x370]
14010b39a: lea       rdx, [rsp + 0xb0]
14010b3a2: call      0x1401f8750
14010b3a7: movss     xmm6, dword ptr [rip + 0x5c91ef1]
14010b3af: test      rsi, rsi
14010b3b2: js        0x14010b410
14010b3b4: je        0x14010b420
14010b3b6: call      0x140002200
14010b3bb: mov       r15d, 1
14010b3c1: mov       edx, 1
14010b3c6: mov       rcx, rsi
14010b3c9: call      0x1400021c0
14010b3ce: test      rax, rax
14010b3d1: je        0x14010b413
14010b3d3: mov       r14, rax
14010b3d6: mov       rcx, rax
14010b3d9: mov       rdx, rbx
14010b3dc: mov       r8, rsi
14010b3df: call      0x145bfa0e7
14010b3e4: cmp       byte ptr [rdi], 1
14010b3e7: jne       0x14010b42b
14010b3e9: mov       eax, dword ptr [rdi + 1]
14010b3ec: mov       ecx, dword ptr [rdi + 4]
14010b3ef: mov       dword ptr [rsp + 0x27], ecx
14010b3f3: mov       dword ptr [rsp + 0x24], eax
14010b3f7: mov       rax, qword ptr [rdi + 8]
14010b3fb: movzx     ecx, byte ptr [rdi + 0x10]
14010b3ff: mov       dl, 1
14010b401: jmp       0x14010b43b
14010b403: movss     xmm6, dword ptr [rip + 0x5cc7a2d]
14010b40b: test      rsi, rsi
14010b40e: jns       0x14010b3b4
14010b410: xor       r15d, r15d
14010b413: mov       rcx, r15
14010b416: mov       rdx, rsi
14010b419: call      0x145d992bb
14010b41e: ud2
14010b420: mov       r14d, 1
14010b426: cmp       byte ptr [rdi], 1
14010b429: je        0x14010b3e9
14010b42b: mov       rax, qword ptr [rdi + 8]
14010b42f: lock inc  qword ptr [rax]
14010b433: jle       0x14010b533
14010b439: xor       edx, edx
14010b43b: mov       qword ptr [rsp + 0xb0], rsi
14010b443: mov       qword ptr [rsp + 0xb8], r14
14010b44b: mov       qword ptr [rsp + 0xc0], rsi
14010b453: mov       qword ptr [rsp + 0xc8], 0
14010b45f: mov       qword ptr [rsp + 0xd0], 4
14010b46b: mov       qword ptr [rsp + 0xd8], 0
14010b477: mov       byte ptr [rsp + 0xe0], dl
14010b47e: mov       edx, dword ptr [rsp + 0x24]
14010b482: mov       r8d, dword ptr [rsp + 0x27]
14010b487: mov       dword ptr [rsp + 0xe1], edx
14010b48e: mov       dword ptr [rsp + 0xe4], r8d
14010b496: mov       qword ptr [rsp + 0xe8], rax
14010b49e: mov       qword ptr [rsp + 0xf0], rcx
14010b4a6: mov       dword ptr [rsp + 0xf8], 0x41700000
14010b4b1: mov       word ptr [rsp + 0xfc], 0x190
14010b4bb: mov       byte ptr [rsp + 0xfe], 1
14010b4c3: movups    xmm0, xmmword ptr [rip + 0x5ccadce]
14010b4ca: movups    xmmword ptr [rsp + 0x100], xmm0
14010b4d2: movss     dword ptr [rsp + 0x110], xmm6
14010b4db: movups    xmm0, xmmword ptr [rip + 0x5cca5ae]
14010b4e2: movups    xmmword ptr [rsp + 0x114], xmm0
14010b4ea: mov       dword ptr [rsp + 0x124], 0x3f59999a
14010b4f5: movsd     xmm0, qword ptr [rip + 0x5c91fa3]
14010b4fd: movsd     qword ptr [rsp + 0x128], xmm0
14010b506: lea       rcx, [rsp + 0x370]
14010b50e: lea       rdx, [rsp + 0xb0]
14010b516: call      0x1401f9650
14010b51b: movaps    xmm6, xmmword ptr [rsp + 0x3a0]
14010b523: add       rsp, 0x3b8
14010b52a: pop       rbx
14010b52b: pop       rbp
14010b52c: pop       rdi
14010b52d: pop       rsi
14010b52e: pop       r14
14010b530: pop       r15
14010b532: ret
14010b533: ud2
