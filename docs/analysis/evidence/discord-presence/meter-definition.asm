;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14599cb60..0x14599db10 SHA256 9ec1ece25c82f59998e7fa9bb584bef114f7f99a8c74aed75707e0db4dbd3062
0x14599cb60: push rbp
0x14599cb61: push r15
0x14599cb63: push r14
0x14599cb65: push r13
0x14599cb67: push r12
0x14599cb69: push rsi
0x14599cb6a: push rdi
0x14599cb6b: push rbx
0x14599cb6c: sub rsp, 0x218
0x14599cb73: lea rbp, [rsp + 0x80]
0x14599cb7b: movapd xmmword ptr [rbp + 0x180], xmm9
0x14599cb84: movapd xmmword ptr [rbp + 0x170], xmm8
0x14599cb8d: movdqa xmmword ptr [rbp + 0x160], xmm7
0x14599cb95: movapd xmmword ptr [rbp + 0x150], xmm6
0x14599cb9d: mov qword ptr [rbp + 0x148], 0xfffffffffffffffe
0x14599cba8: mov rdi, rcx
0x14599cbab: lea r8, [r8 + r8*4]
0x14599cbaf: shl r8, 4
0x14599cbb3: add r8, rdx
0x14599cbb6: lea rcx, [rbp - 0x28]
0x14599cbba: call 0x1459bc980
0x14599cbbf: mov rax, qword ptr [rbp - 0x20]
0x14599cbc3: mov qword ptr [rbp + 0x90], rax
0x14599cbca: mov rsi, qword ptr [rbp - 0x18]
0x14599cbce: lea rax, [rbp + 0x107]
0x14599cbd5: mov qword ptr [rbp + 0x110], rax
0x14599cbdc: cmp rsi, 2
0x14599cbe0: jae 0x14599da0c
0x14599cbe6: mov qword ptr [rbp + 8], rdi
0x14599cbea: call 0x140002200
0x14599cbef: mov r14d, 1
0x14599cbf5: mov ecx, 1
0x14599cbfa: mov edx, 1
0x14599cbff: call 0x1400021c0
0x14599cc04: test rax, rax
0x14599cc07: je 0x14599dad4
0x14599cc0d: mov rdi, rax
0x14599cc10: mov byte ptr [rax], 0x5b
0x14599cc13: mov rax, qword ptr [rbp - 0x28]
0x14599cc17: mov qword ptr [rbp + 0x48], rax
0x14599cc1b: mov rdx, qword ptr [rbp + 0x90]
0x14599cc22: lea rcx, [rdx + rsi*8]
0x14599cc26: mov qword ptr [rbp], rcx
0x14599cc2a: lea r12, [rbp + 0x129]
0x14599cc31: mov bl, 1
0x14599cc33: lea r15, [rbp + 0x110]
0x14599cc3a: lea rsi, [rbp + 0xc0]
0x14599cc41: movdqa xmm7, xmmword ptr [rip + 0x506c17]
0x14599cc49: movsd xmm8, qword ptr [rip + 0x11f5bee]
0x14599cc52: movsd xmm9, qword ptr [rip + 0x430345]
0x14599cc5b: mov ecx, 1
0x14599cc60: mov qword ptr [rbp + 0x70], rcx
0x14599cc64: cmp rdx, qword ptr [rbp]
0x14599cc68: mov qword ptr [rbp + 0x30], rdi
0x14599cc6c: je 0x14599d94f
0x14599cc72: nop word ptr cs:[rax + rax]
0x14599cc80: mov qword ptr [rbp - 8], rdx
0x14599cc84: mov rdi, qword ptr [rdx]
0x14599cc87: call 0x140002200
0x14599cc8c: mov ecx, 1
0x14599cc91: mov edx, 1
0x14599cc96: call 0x1400021c0
0x14599cc9b: test rax, rax
0x14599cc9e: je 0x14599da9b
0x14599cca4: mov byte ptr [rbp + 0x140], bl
0x14599ccaa: mov byte ptr [rax], 0x7b
0x14599ccad: mov qword ptr [rbp + 0x110], 1
0x14599ccb8: mov qword ptr [rbp + 0x118], rax
0x14599ccbf: mov qword ptr [rbp + 0x120], 1
0x14599ccca: mov byte ptr [rbp + 0x128], 1
0x14599ccd1: movups xmm0, xmmword ptr [rdi + 0x20]
0x14599ccd5: mov byte ptr [rbp + 0x147], 1
0x14599ccdc: movups xmmword ptr [rsp + 0x20], xmm0
0x14599cce1: mov r9d, 4
0x14599cce7: lea rcx, [rbp + 0xe0]
0x14599ccee: mov rdx, r15
0x14599ccf1: lea r8, [rip + 0x188da1b]
0x14599ccf8: call 0x1458eb720
0x14599ccfd: nop
0x14599ccfe: movups xmm0, xmmword ptr [rdi + 0x30]
0x14599cd02: mov byte ptr [rbp + 0x147], 1
0x14599cd09: movups xmmword ptr [rsp + 0x20], xmm0
0x14599cd0e: mov r9d, 4
0x14599cd14: mov rcx, r15
0x14599cd17: lea rdx, [rbp + 0xe0]
0x14599cd1e: lea r8, [rip + 0x188d9f2]
0x14599cd25: call 0x1458eb720
0x14599cd2a: nop
0x14599cd2b: movsd xmm0, qword ptr [rdi + 0x40]
0x14599cd30: call 0x145bfa14d
0x14599cd35: mov byte ptr [rbp + 0x147], 1
0x14599cd3c: movsd qword ptr [rsp + 0x20], xmm0
0x14599cd42: mov r9d, 3
0x14599cd48: mov rcx, rsi
0x14599cd4b: mov rdx, r15
0x14599cd4e: lea r8, [rip + 0x188ec5b]
0x14599cd55: call 0x1458e6610
0x14599cd5a: nop
0x14599cd5b: mov bl, byte ptr [rdi + 0x48]
0x14599cd5e: mov r8d, 4
0x14599cd64: mov rcx, rsi
0x14599cd67: lea rdx, [rip + 0x188fc6a]
0x14599cd6e: call 0x1458eb470
0x14599cd73: nop
0x14599cd74: movzx esi, bl
0x14599cd77: xor rsi, 5
0x14599cd7b: mov rax, qword ptr [rbp + 0xc0]
0x14599cd82: mov rcx, qword ptr [rbp + 0xd0]
0x14599cd89: sub rax, rcx
0x14599cd8c: cmp rsi, rax
0x14599cd8f: ja 0x14599d87e
0x14599cd95: test bl, bl
0x14599cd97: lea rdx, [rip + 0x1254c1a]
0x14599cd9e: lea rax, [rip + 0x1254c18]
0x14599cda5: cmovne rdx, rax
0x14599cda9: add rcx, qword ptr [rbp + 0xc8]
0x14599cdb0: mov r8, rsi
0x14599cdb3: call 0x145bfa0e7
0x14599cdb8: add qword ptr [rbp + 0xd0], rsi
0x14599cdbf: mov r9, qword ptr [rbp + 0xc0]
0x14599cdc6: mov r10, qword ptr [rbp + 0xc8]
0x14599cdcd: lea rax, [rbp + 0xd0]
0x14599cdd4: movdqu xmm0, xmmword ptr [rax]
0x14599cdd8: movdqa xmmword ptr [rbp + 0x10], xmm0
0x14599cddd: mov r8, qword ptr [rdi + 0x10]
0x14599cde1: test r8, r8
0x14599cde4: je 0x14599d640
0x14599cdea: mov rdx, qword ptr [rdi + 8]
0x14599cdee: shl r8, 5
0x14599cdf2: add r8, rdx
0x14599cdf5: mov qword ptr [rbp + 0xb0], r10
0x14599cdfc: mov qword ptr [rbp + 0x88], r10
0x14599ce03: mov qword ptr [rbp + 0xb8], r9
0x14599ce0a: mov qword ptr [rbp + 0x80], r9
0x14599ce11: mov byte ptr [rbp + 0x146], 1
0x14599ce18: mov byte ptr [rbp + 0x145], 1
0x14599ce1f: lea rcx, [rbp - 0x40]
0x14599ce23: call 0x1459bd110
0x14599ce28: nop
0x14599ce29: mov rdi, qword ptr [rbp - 0x38]
0x14599ce2d: mov rsi, qword ptr [rbp - 0x30]
0x14599ce31: lea rax, [rbp + 0x107]
0x14599ce38: mov qword ptr [rbp + 0x110], rax
0x14599ce3f: cmp rsi, 2
0x14599ce43: jae 0x14599d8dd
0x14599ce49: mov qword ptr [rbp + 0x78], r14
0x14599ce4d: call 0x140002200
0x14599ce52: mov ecx, 1
0x14599ce57: mov edx, 1
0x14599ce5c: call 0x1400021c0
0x14599ce61: test rax, rax
0x14599ce64: je 0x14599dab4
0x14599ce6a: mov r15, rax
0x14599ce6d: mov byte ptr [rax], 0x5b
0x14599ce70: mov rax, qword ptr [rbp - 0x40]
0x14599ce74: mov qword ptr [rbp + 0x38], rax
0x14599ce78: test rsi, rsi
0x14599ce7b: mov qword ptr [rbp + 0x40], rdi
0x14599ce7f: je 0x14599d650
0x14599ce85: lea rax, [rdi + rsi*8]
0x14599ce89: mov qword ptr [rbp - 0x10], rax
0x14599ce8d: mov r13b, 1
0x14599ce90: mov r10d, 1
0x14599ce96: mov esi, 1
0x14599ce9b: mov rbx, rdi
0x14599ce9e: jmp 0x14599ced0
0x14599cea0: mov rbx, r12
0x14599cea3: add rbx, 8
0x14599cea7: add rsi, rdi
0x14599ceaa: mov eax, dword ptr [rbp + 0x110]
0x14599ceb0: mov ecx, dword ptr [rbp + 0x113]
0x14599ceb6: mov dword ptr [rbp + 0xa0], eax
0x14599cebc: mov dword ptr [rbp + 0xa3], ecx
0x14599cec2: cmp rbx, qword ptr [rbp - 0x10]
0x14599cec6: mov r10, qword ptr [rbp + 0x28]
0x14599ceca: je 0x14599d65e
0x14599ced0: mov r14, qword ptr [rbx]
0x14599ced3: mov qword ptr [rbp + 0xc0], r10
0x14599ceda: mov qword ptr [rbp + 0xc8], r15
0x14599cee1: mov qword ptr [rbp + 0xd0], rsi
0x14599cee8: mov byte ptr [rbp + 0xd8], r13b
0x14599ceef: mov eax, dword ptr [rbp + 0xa0]
0x14599cef5: mov ecx, dword ptr [rbp + 0xa3]
0x14599cefb: lea rdx, [rbp + 0xd0]
0x14599cf02: mov dword ptr [rdx + 0xc], ecx
0x14599cf05: mov dword ptr [rdx + 9], eax
0x14599cf08: call 0x140002200
0x14599cf0d: mov ecx, 1
0x14599cf12: mov edx, 1
0x14599cf17: call 0x1400021c0
0x14599cf1c: test rax, rax
0x14599cf1f: je 0x14599da70
0x14599cf25: mov rdi, rax
0x14599cf28: mov byte ptr [rax], 0x7b
0x14599cf2b: mov qword ptr [rbp + 0x110], 1
0x14599cf36: mov qword ptr [rbp + 0x118], rax
0x14599cf3d: mov qword ptr [rbp + 0x120], 1
0x14599cf48: mov r13, qword ptr [r14 + 8]
0x14599cf4c: mov r15, qword ptr [r14 + 0x10]
0x14599cf50: mov byte ptr [rbp + 0x128], 0
0x14599cf57: mov r8d, 4
0x14599cf5d: lea rcx, [rbp + 0xe0]
0x14599cf64: lea rdx, [rip + 0x188d7a8]
0x14599cf6b: call 0x1458ee120
0x14599cf70: nop
0x14599cf71: mov rax, qword ptr [rbp + 0xe8]
0x14599cf78: mov qword ptr [rbp + 0x108], rax
0x14599cf7f: mov r12, qword ptr [rbp + 0xf0]
0x14599cf86: mov esi, 1
0x14599cf8b: test r12, r12
0x14599cf8e: jne 0x14599d3e5
0x14599cf94: add rsi, r12
0x14599cf97: mov qword ptr [rbp + 0x120], rsi
0x14599cf9e: mov rdx, qword ptr [rbp + 0xe0]
0x14599cfa5: test rdx, rdx
0x14599cfa8: je 0x14599cfbc
0x14599cfaa: mov r8d, 1
0x14599cfb0: mov rcx, qword ptr [rbp + 0x108]
0x14599cfb7: call 0x1400021d0
0x14599cfbc: cmp qword ptr [rbp + 0x110], rsi
0x14599cfc3: je 0x14599d42f
0x14599cfc9: mov byte ptr [rdi + rsi], 0x3a
0x14599cfcd: inc rsi
0x14599cfd0: mov qword ptr [rbp + 0x120], rsi
0x14599cfd7: lea rcx, [rbp + 0xe0]
0x14599cfde: mov rdx, r13
0x14599cfe1: mov r8, r15
0x14599cfe4: call 0x1458ee120
0x14599cfe9: nop
0x14599cfea: mov r15, qword ptr [rbp + 0xe8]
0x14599cff1: mov rdi, qword ptr [rbp + 0xf0]
0x14599cff8: mov rax, qword ptr [rbp + 0x110]
0x14599cfff: sub rax, rsi
0x14599d002: cmp rdi, rax
0x14599d005: ja 0x14599d460
0x14599d00b: test rdi, rdi
0x14599d00e: lea r12, [rbp + 0x110]
0x14599d015: je 0x14599d02c
0x14599d017: mov rcx, qword ptr [rbp + 0x118]
0x14599d01e: add rcx, rsi
0x14599d021: mov rdx, r15
0x14599d024: mov r8, rdi
0x14599d027: call 0x145bfa0e7
0x14599d02c: add rsi, rdi
0x14599d02f: mov qword ptr [rbp + 0x120], rsi
0x14599d036: mov rdx, qword ptr [rbp + 0xe0]
0x14599d03d: test rdx, rdx
0x14599d040: je 0x14599d050
0x14599d042: mov r8d, 1
0x14599d048: mov rcx, r15
0x14599d04b: call 0x1400021d0
0x14599d050: movups xmm0, xmmword ptr [rbp + 0x110]
0x14599d057: mov rax, qword ptr [rbp + 0x120]
0x14599d05e: mov qword ptr [rbp + 0xf0], rax
0x14599d065: mov rax, qword ptr [rbp + 0x128]
0x14599d06c: mov qword ptr [rbp + 0xf8], rax
0x14599d073: movaps xmmword ptr [rbp + 0xe0], xmm0
0x14599d07a: movq xmm0, qword ptr [r14 + 0x18]
0x14599d080: call 0x145bfa14d
0x14599d085: movdqa xmm6, xmm0
0x14599d089: mov rsi, qword ptr [rbp + 0xf0]
0x14599d090: cmp byte ptr [rbp + 0xf8], 0
0x14599d097: jne 0x14599d0bb
0x14599d099: cmp qword ptr [rbp + 0xe0], rsi
0x14599d0a0: je 0x14599d5cb
0x14599d0a6: mov rax, qword ptr [rbp + 0xe8]
0x14599d0ad: mov byte ptr [rax + rsi], 0x2c
0x14599d0b1: inc rsi
0x14599d0b4: mov qword ptr [rbp + 0xf0], rsi
0x14599d0bb: mov byte ptr [rbp + 0xf8], 0
0x14599d0c2: mov r8d, 3
0x14599d0c8: mov rcx, r12
0x14599d0cb: lea rdx, [rip + 0x188e8de]
0x14599d0d2: call 0x1458ee120
0x14599d0d7: nop
0x14599d0d8: mov r14, qword ptr [rbp + 0x118]
0x14599d0df: mov rdi, qword ptr [rbp + 0x120]
0x14599d0e6: mov rax, qword ptr [rbp + 0xe0]
0x14599d0ed: sub rax, rsi
0x14599d0f0: cmp rdi, rax
0x14599d0f3: ja 0x14599d49f
0x14599d0f9: test rdi, rdi
0x14599d0fc: je 0x14599d113
0x14599d0fe: mov rcx, qword ptr [rbp + 0xe8]
0x14599d105: add rcx, rsi
0x14599d108: mov rdx, r14
0x14599d10b: mov r8, rdi
0x14599d10e: call 0x145bfa0e7
0x14599d113: add rsi, rdi
0x14599d116: mov qword ptr [rbp + 0xf0], rsi
0x14599d11d: mov rdx, qword ptr [rbp + 0x110]
0x14599d124: test rdx, rdx
0x14599d127: je 0x14599d137
0x14599d129: mov r8d, 1
0x14599d12f: mov rcx, r14
0x14599d132: call 0x1400021d0
0x14599d137: cmp qword ptr [rbp + 0xe0], rsi
0x14599d13e: je 0x14599d4db
0x14599d144: mov r15, qword ptr [rbp + 0xe8]
0x14599d14b: mov byte ptr [r15 + rsi], 0x3a
0x14599d150: inc rsi
0x14599d153: mov qword ptr [rbp + 0xf0], rsi
0x14599d15a: movq qword ptr [rbp - 0x48], xmm6
0x14599d15f: movq rax, xmm6
0x14599d164: movabs rcx, 0x7fffffffffffffff
0x14599d16e: and rax, rcx
0x14599d171: movabs rcx, 0x7ff0000000000000
0x14599d17b: cmp rax, rcx
0x14599d17e: jl 0x14599d1e0
0x14599d180: call 0x140002200
0x14599d185: mov ecx, 1
0x14599d18a: mov edx, 1
0x14599d18f: call 0x1400021c0
0x14599d194: test rax, rax
0x14599d197: je 0x14599da89
0x14599d19d: mov rdi, rax
0x14599d1a0: mov byte ptr [rax], 0x30
0x14599d1a3: mov qword ptr [rbp + 0x110], 1
0x14599d1ae: mov qword ptr [rbp + 0x118], rax
0x14599d1b5: mov qword ptr [rbp + 0x120], 1
0x14599d1c0: mov r13d, 1
0x14599d1c6: cmp qword ptr [rbp + 0xe0], rsi
0x14599d1cd: jne 0x14599d2a1
0x14599d1d3: jmp 0x14599d505
0x14599d1d8: nop dword ptr [rax + rax]
0x14599d1e0: movdqa xmm0, xmm6
0x14599d1e4: pand xmm0, xmm7
0x14599d1e8: ucomisd xmm8, xmm0
0x14599d1ed: jbe 0x14599d250
0x14599d1ef: cvttsd2si rax, xmm6
0x14599d1f4: ucomisd xmm6, xmm9
0x14599d1f9: movabs rcx, 0x7fffffffffffffff
0x14599d203: cmova rax, rcx
0x14599d207: ucomisd xmm6, xmm6
0x14599d20b: mov ecx, 0
0x14599d210: cmovp rax, rcx
0x14599d214: mov qword ptr [rbp - 0x50], rax
0x14599d218: lea rax, [rbp - 0x50]
0x14599d21c: mov qword ptr [rbp + 0x50], rax
0x14599d220: lea rax, [rip + 0x242679]
0x14599d227: mov qword ptr [rbp + 0x58], rax
0x14599d22b: mov rcx, r12
0x14599d22e: lea rdx, [rip + 0x125482b]
0x14599d235: lea r8, [rbp + 0x50]
0x14599d239: call 0x145bcce30
0x14599d23e: nop
0x14599d23f: jmp 0x14599d277
0x14599d241: nop word ptr cs:[rax + rax]
0x14599d250: lea rax, [rbp - 0x48]
0x14599d254: mov qword ptr [rbp + 0x50], rax
0x14599d258: lea rax, [rip + 0x241211]
0x14599d25f: mov qword ptr [rbp + 0x58], rax
0x14599d263: mov rcx, r12
0x14599d266: lea rdx, [rip + 0x1533413]
0x14599d26d: lea r8, [rbp + 0x50]
0x14599d271: call 0x145bcce30
0x14599d276: nop
0x14599d277: mov rdi, qword ptr [rbp + 0x118]
0x14599d27e: mov r13, qword ptr [rbp + 0x120]
0x14599d285: mov rax, qword ptr [rbp + 0xe0]
0x14599d28c: sub rax, rsi
0x14599d28f: cmp r13, rax
0x14599d292: ja 0x14599d505
0x14599d298: test r13, r13
0x14599d29b: je 0x14599d3dd
0x14599d2a1: add r15, rsi
0x14599d2a4: mov rcx, r15
0x14599d2a7: mov rdx, rdi
0x14599d2aa: mov r8, r13
0x14599d2ad: call 0x145bfa0e7
0x14599d2b2: add r13, rsi
0x14599d2b5: mov qword ptr [rbp + 0xf0], r13
0x14599d2bc: mov rdx, qword ptr [rbp + 0x110]
0x14599d2c3: test rdx, rdx
0x14599d2c6: je 0x14599d2d6
0x14599d2c8: mov r8d, 1
0x14599d2ce: mov rcx, rdi
0x14599d2d1: call 0x1400021d0
0x14599d2d6: movdqa xmm0, xmmword ptr [rbp + 0xe0]
0x14599d2de: mov rax, qword ptr [rbp + 0xf0]
0x14599d2e5: mov rcx, qword ptr [rbp + 0xf8]
0x14599d2ec: movdqa xmmword ptr [rbp + 0x110], xmm0
0x14599d2f4: mov qword ptr [rbp + 0x120], rax
0x14599d2fb: mov qword ptr [rbp + 0x128], rcx
0x14599d302: mov r15, qword ptr [rbp + 0x120]
0x14599d309: mov r14, qword ptr [rbp + 0x110]
0x14599d310: cmp r14, r15
0x14599d313: je 0x14599d548
0x14599d319: mov rcx, qword ptr [rbp + 0x118]
0x14599d320: mov byte ptr [rcx + r15], 0x7d
0x14599d325: mov rdx, qword ptr [rbp + 0xc0]
0x14599d32c: mov rsi, qword ptr [rbp + 0xd0]
0x14599d333: cmp byte ptr [rbp + 0xd8], 0
0x14599d33a: mov qword ptr [rbp + 0x108], rcx
0x14599d341: jne 0x14599d361
0x14599d343: cmp rdx, rsi
0x14599d346: je 0x14599d5f5
0x14599d34c: mov rax, qword ptr [rbp + 0xc8]
0x14599d353: mov byte ptr [rax + rsi], 0x2c
0x14599d357: inc rsi
0x14599d35a: mov qword ptr [rbp + 0xd0], rsi
0x14599d361: lea rdi, [r15 + 1]
0x14599d365: mov byte ptr [rbp + 0xd8], 0
0x14599d36c: mov rax, rdx
0x14599d36f: sub rax, rsi
0x14599d372: cmp r15, rax
0x14599d375: jae 0x14599d579
0x14599d37b: mov qword ptr [rbp + 0x28], rdx
0x14599d37f: mov r12, rbx
0x14599d382: xor r13d, r13d
0x14599d385: mov rax, qword ptr [rbp + 0xc8]
0x14599d38c: mov r15, rax
0x14599d38f: lea rcx, [rax + rsi]
0x14599d393: mov rbx, qword ptr [rbp + 0x108]
0x14599d39a: mov rdx, rbx
0x14599d39d: mov r8, rdi
0x14599d3a0: call 0x145bfa0e7
0x14599d3a5: lea rcx, [rbp + 0xd0]
0x14599d3ac: mov eax, dword ptr [rcx + 9]
0x14599d3af: mov ecx, dword ptr [rcx + 0xc]
0x14599d3b2: mov dword ptr [rbp + 0x110], eax
0x14599d3b8: mov dword ptr [rbp + 0x113], ecx
0x14599d3be: test r14, r14
0x14599d3c1: je 0x14599cea0
0x14599d3c7: mov r8d, 1
0x14599d3cd: mov rcx, rbx
0x14599d3d0: mov rdx, r14
0x14599d3d3: call 0x1400021d0
0x14599d3d8: jmp 0x14599cea0
0x14599d3dd: xor r13d, r13d
0x14599d3e0: jmp 0x14599d2b2
0x14599d3e5: mov qword ptr [rsp + 0x20], 1
0x14599d3ee: mov edx, 1
0x14599d3f3: mov r9d, 1
0x14599d3f9: lea rcx, [rbp + 0x110]
0x14599d400: mov r8, r12
0x14599d403: call 0x145bfa970
0x14599d408: nop
0x14599d409: mov rdi, qword ptr [rbp + 0x118]
0x14599d410: mov rsi, qword ptr [rbp + 0x120]
0x14599d417: lea rcx, [rdi + rsi]
0x14599d41b: mov rdx, qword ptr [rbp + 0x108]
0x14599d422: mov r8, r12
0x14599d425: call 0x145bfa0e7
0x14599d42a: jmp 0x14599cf94
0x14599d42f: mov qword ptr [rsp + 0x20], 1
0x14599d438: mov r8d, 1
0x14599d43e: mov r9d, 1
0x14599d444: lea rcx, [rbp + 0x110]
0x14599d44b: mov rdx, rsi
0x14599d44e: call 0x145bfa970
0x14599d453: nop
0x14599d454: mov rdi, qword ptr [rbp + 0x118]
0x14599d45b: jmp 0x14599cfc9
0x14599d460: mov qword ptr [rbp + 0x108], r15
0x14599d467: mov qword ptr [rsp + 0x20], 1
0x14599d470: mov r9d, 1
0x14599d476: lea r12, [rbp + 0x110]
0x14599d47d: mov rcx, r12
0x14599d480: mov rdx, rsi
0x14599d483: mov r8, rdi
0x14599d486: call 0x145bfa970
0x14599d48b: nop
0x14599d48c: mov rsi, qword ptr [rbp + 0x120]
0x14599d493: mov r15, qword ptr [rbp + 0x108]
0x14599d49a: jmp 0x14599d017
0x14599d49f: mov qword ptr [rbp + 0x108], r14
0x14599d4a6: mov qword ptr [rsp + 0x20], 1
0x14599d4af: mov r9d, 1
0x14599d4b5: lea rcx, [rbp + 0xe0]
0x14599d4bc: mov rdx, rsi
0x14599d4bf: mov r8, rdi
0x14599d4c2: call 0x145bfa970
0x14599d4c7: nop
0x14599d4c8: mov rsi, qword ptr [rbp + 0xf0]
0x14599d4cf: mov r14, qword ptr [rbp + 0x108]
0x14599d4d6: jmp 0x14599d0fe
0x14599d4db: mov qword ptr [rsp + 0x20], 1
0x14599d4e4: mov r8d, 1
0x14599d4ea: mov r9d, 1
0x14599d4f0: lea rcx, [rbp + 0xe0]
0x14599d4f7: mov rdx, rsi
0x14599d4fa: call 0x145bfa970
0x14599d4ff: nop
0x14599d500: jmp 0x14599d144
0x14599d505: mov qword ptr [rbp + 0x108], rdi
0x14599d50c: mov qword ptr [rsp + 0x20], 1
0x14599d515: mov r9d, 1
0x14599d51b: lea rcx, [rbp + 0xe0]
0x14599d522: mov rdx, rsi
0x14599d525: mov r8, r13
0x14599d528: call 0x145bfa970
0x14599d52d: nop
0x14599d52e: mov r15, qword ptr [rbp + 0xe8]
0x14599d535: mov rsi, qword ptr [rbp + 0xf0]
0x14599d53c: mov rdi, qword ptr [rbp + 0x108]
0x14599d543: jmp 0x14599d2a1
0x14599d548: mov qword ptr [rsp + 0x20], 1
0x14599d551: mov r8d, 1
0x14599d557: mov r9d, 1
0x14599d55d: lea rcx, [rbp + 0x110]
0x14599d564: mov rdx, r15
0x14599d567: call 0x145bfa970
0x14599d56c: nop
0x14599d56d: mov r14, qword ptr [rbp + 0x110]
0x14599d574: jmp 0x14599d319
0x14599d579: mov qword ptr [rbp + 0x98], r14
0x14599d580: mov qword ptr [rsp + 0x20], 1
0x14599d589: mov r9d, 1
0x14599d58f: lea rcx, [rbp + 0xc0]
0x14599d596: mov rdx, rsi
0x14599d599: mov r8, rdi
0x14599d59c: call 0x145bfa970
0x14599d5a1: nop
0x14599d5a2: mov r12, rbx
0x14599d5a5: mov rax, qword ptr [rbp + 0xc0]
0x14599d5ac: mov qword ptr [rbp + 0x28], rax
0x14599d5b0: mov rsi, qword ptr [rbp + 0xd0]
0x14599d5b7: movzx r13d, byte ptr [rbp + 0xd8]
0x14599d5bf: mov r14, qword ptr [rbp + 0x98]
0x14599d5c6: jmp 0x14599d385
0x14599d5cb: mov qword ptr [rsp + 0x20], 1
0x14599d5d4: mov r8d, 1
0x14599d5da: mov r9d, 1
0x14599d5e0: lea rcx, [rbp + 0xe0]
0x14599d5e7: mov rdx, rsi
0x14599d5ea: call 0x145bfa970
0x14599d5ef: nop
0x14599d5f0: jmp 0x14599d0a6
0x14599d5f5: mov qword ptr [rbp + 0x98], r14
0x14599d5fc: mov qword ptr [rsp + 0x20], 1
0x14599d605: mov r8d, 1
0x14599d60b: mov r9d, 1
0x14599d611: lea rcx, [rbp + 0xc0]
0x14599d618: mov rdx, rsi
0x14599d61b: call 0x145bfa970
0x14599d620: nop
0x14599d621: mov rdx, qword ptr [rbp + 0xc0]
0x14599d628: mov r14, qword ptr [rbp + 0x98]
0x14599d62f: jmp 0x14599d34c
0x14599d634: nop word ptr cs:[rax + rax]
0x14599d640: movzx ebx, byte ptr [rbp + 0x140]
0x14599d647: jmp 0x14599d770
0x14599d64c: nop dword ptr [rax]
0x14599d650: mov r13b, 1
0x14599d653: mov r10d, 1
0x14599d659: mov esi, 1
0x14599d65e: mov rdx, qword ptr [rbp + 0x38]
0x14599d662: test rdx, rdx
0x14599d665: je 0x14599d680
0x14599d667: shl rdx, 3
0x14599d66b: mov r8d, 8
0x14599d671: mov rcx, qword ptr [rbp + 0x40]
0x14599d675: mov rdi, r10
0x14599d678: call 0x1400021d0
0x14599d67d: mov r10, rdi
0x14599d680: mov rax, qword ptr [rbp + 0xb8]
0x14599d687: mov qword ptr [rbp + 0xe0], rax
0x14599d68e: mov rax, qword ptr [rbp + 0xb0]
0x14599d695: mov qword ptr [rbp + 0xe8], rax
0x14599d69c: movdqa xmm0, xmmword ptr [rbp + 0x10]
0x14599d6a1: lea rax, [rbp + 0xf0]
0x14599d6a8: movdqu xmmword ptr [rax], xmm0
0x14599d6ac: mov qword ptr [rbp + 0x110], r10
0x14599d6b3: mov qword ptr [rbp + 0x118], r15
0x14599d6ba: mov qword ptr [rbp + 0x120], rsi
0x14599d6c1: mov byte ptr [rbp + 0x128], r13b
0x14599d6c8: mov eax, dword ptr [rbp + 0xa0]
0x14599d6ce: mov ecx, dword ptr [rbp + 0xa3]
0x14599d6d4: lea r12, [rbp + 0x129]
0x14599d6db: mov dword ptr [r12 + 3], ecx
0x14599d6e0: mov dword ptr [r12], eax
0x14599d6e4: cmp r10, rsi
0x14599d6e7: movzx ebx, byte ptr [rbp + 0x140]
0x14599d6ee: je 0x14599d8fc
0x14599d6f4: mov byte ptr [r15 + rsi], 0x5d
0x14599d6f9: inc rsi
0x14599d6fc: mov qword ptr [rbp + 0x60], rsi
0x14599d700: mov rax, qword ptr [rbp + 0x110]
0x14599d707: mov qword ptr [rbp + 0x50], rax
0x14599d70b: mov rax, qword ptr [rbp + 0x118]
0x14599d712: mov qword ptr [rbp + 0x58], rax
0x14599d716: mov byte ptr [rbp + 0x13e], 0
0x14599d71d: lea rax, [rbp + 0x50]
0x14599d721: mov qword ptr [rsp + 0x20], rax
0x14599d726: mov r9d, 5
0x14599d72c: lea rcx, [rbp + 0xc0]
0x14599d733: lea rdx, [rbp + 0xe0]
0x14599d73a: lea r8, [rip + 0x188f29b]
0x14599d741: call 0x1458eb5e0
0x14599d746: nop
0x14599d747: mov r9, qword ptr [rbp + 0xc0]
0x14599d74e: mov r10, qword ptr [rbp + 0xc8]
0x14599d755: lea rax, [rbp + 0xd0]
0x14599d75c: movdqu xmm0, xmmword ptr [rax]
0x14599d760: movdqa xmmword ptr [rbp + 0x10], xmm0
0x14599d765: mov r14, qword ptr [rbp + 0x78]
0x14599d769: lea r15, [rbp + 0x110]
0x14599d770: mov rax, qword ptr [rbp + 0x70]
0x14599d774: mov qword ptr [rbp + 0xe0], rax
0x14599d77b: mov rax, qword ptr [rbp + 0x30]
0x14599d77f: mov qword ptr [rbp + 0xe8], rax
0x14599d786: mov qword ptr [rbp + 0xf0], r14
0x14599d78d: mov byte ptr [rbp + 0xf8], bl
0x14599d793: mov eax, dword ptr [rbp + 0xa8]
0x14599d799: mov ecx, dword ptr [rbp + 0xab]
0x14599d79f: lea rdx, [rbp + 0xf0]
0x14599d7a6: mov dword ptr [rdx + 0xc], ecx
0x14599d7a9: mov dword ptr [rdx + 9], eax
0x14599d7ac: mov qword ptr [rbp + 0x110], r9
0x14599d7b3: mov qword ptr [rbp + 0x118], r10
0x14599d7ba: movdqa xmm0, xmmword ptr [rbp + 0x10]
0x14599d7bf: movdqu xmmword ptr [r12 - 9], xmm0
0x14599d7c6: mov rsi, qword ptr [rbp + 0x120]
0x14599d7cd: mov qword ptr [rbp + 0xb0], r10
0x14599d7d4: mov rax, r10
0x14599d7d7: mov qword ptr [rbp + 0xb8], r9
0x14599d7de: cmp r9, rsi
0x14599d7e1: je 0x14599d8ac
0x14599d7e7: mov byte ptr [rax + rsi], 0x7d
0x14599d7eb: inc rsi
0x14599d7ee: mov qword ptr [rbp + 0x60], rsi
0x14599d7f2: mov rax, qword ptr [rbp + 0x110]
0x14599d7f9: mov qword ptr [rbp + 0x50], rax
0x14599d7fd: mov rax, qword ptr [rbp + 0x118]
0x14599d804: mov qword ptr [rbp + 0x58], rax
0x14599d808: mov byte ptr [rbp + 0x13d], 0
0x14599d80f: lea rsi, [rbp + 0xc0]
0x14599d816: mov rcx, rsi
0x14599d819: lea rdx, [rbp + 0xe0]
0x14599d820: lea r8, [rbp + 0x50]
0x14599d824: call 0x1458eb220
0x14599d829: nop
0x14599d82a: mov rdx, qword ptr [rbp - 8]
0x14599d82e: add rdx, 8
0x14599d832: mov rax, qword ptr [rbp + 0xc0]
0x14599d839: mov qword ptr [rbp + 0x70], rax
0x14599d83d: mov rdi, qword ptr [rbp + 0xc8]
0x14599d844: mov r14, qword ptr [rbp + 0xd0]
0x14599d84b: movzx ebx, byte ptr [rbp + 0xd8]
0x14599d852: lea rcx, [rbp + 0xd0]
0x14599d859: mov eax, dword ptr [rcx + 9]
0x14599d85c: mov ecx, dword ptr [rcx + 0xc]
0x14599d85f: mov dword ptr [rbp + 0xa8], eax
0x14599d865: mov dword ptr [rbp + 0xab], ecx
0x14599d86b: cmp rdx, qword ptr [rbp]
0x14599d86f: mov qword ptr [rbp + 0x30], rdi
0x14599d873: jne 0x14599cc80
0x14599d879: jmp 0x14599d94f
0x14599d87e: mov qword ptr [rsp + 0x20], 1
0x14599d887: mov r9d, 1
0x14599d88d: mov rdx, rcx
0x14599d890: lea rcx, [rbp + 0xc0]
0x14599d897: mov r8, rsi
0x14599d89a: call 0x145bfa970
0x14599d89f: nop
0x14599d8a0: mov rcx, qword ptr [rbp + 0xd0]
0x14599d8a7: jmp 0x14599cd95
0x14599d8ac: mov qword ptr [rsp + 0x20], 1
0x14599d8b5: mov r8d, 1
0x14599d8bb: mov r9d, 1
0x14599d8c1: mov rcx, r15
0x14599d8c4: mov rdx, qword ptr [rbp + 0xb8]
0x14599d8cb: call 0x145bfa970
0x14599d8d0: nop
0x14599d8d1: mov rax, qword ptr [rbp + 0x118]
0x14599d8d8: jmp 0x14599d7e7
0x14599d8dd: cmp rsi, 0x15
0x14599d8e1: jae 0x14599d92d
0x14599d8e3: mov r8d, 1
0x14599d8e9: mov rcx, rdi
0x14599d8ec: mov rdx, rsi
0x14599d8ef: mov r9, r15
0x14599d8f2: call 0x1459aedf0
0x14599d8f7: jmp 0x14599ce49
0x14599d8fc: mov qword ptr [rsp + 0x20], 1
0x14599d905: mov r8d, 1
0x14599d90b: mov r9d, 1
0x14599d911: lea rcx, [rbp + 0x110]
0x14599d918: mov rdx, r10
0x14599d91b: call 0x145bfa970
0x14599d920: nop
0x14599d921: mov r15, qword ptr [rbp + 0x118]
0x14599d928: jmp 0x14599d6f4
0x14599d92d: mov byte ptr [rbp + 0x144], 1
0x14599d934: mov byte ptr [rbp + 0x143], 1
0x14599d93b: mov rcx, rdi
0x14599d93e: mov rdx, rsi
0x14599d941: mov r8, r15
0x14599d944: call 0x1459dde90
0x14599d949: nop
0x14599d94a: jmp 0x14599ce49
0x14599d94f: mov rdx, qword ptr [rbp + 0x48]
0x14599d953: test rdx, rdx
0x14599d956: je 0x14599d96e
0x14599d958: shl rdx, 3
0x14599d95c: mov r8d, 8
0x14599d962: mov rcx, qword ptr [rbp + 0x90]
0x14599d969: call 0x1400021d0
0x14599d96e: mov rdx, qword ptr [rbp + 0x70]
0x14599d972: mov qword ptr [rbp + 0x110], rdx
0x14599d979: mov qword ptr [rbp + 0x118], rdi
0x14599d980: mov qword ptr [rbp + 0x120], r14
0x14599d987: mov byte ptr [rbp + 0x128], bl
0x14599d98d: mov eax, dword ptr [rbp + 0xa8]
0x14599d993: mov ecx, dword ptr [rbp + 0xab]
0x14599d999: mov dword ptr [rbp + 0x129], eax
0x14599d99f: mov dword ptr [rbp + 0x12c], ecx
0x14599d9a5: cmp rdx, r14
0x14599d9a8: je 0x14599da37
0x14599d9ae: mov byte ptr [rdi + r14], 0x5d
0x14599d9b3: inc r14
0x14599d9b6: mov qword ptr [rbp + 0x120], r14
0x14599d9bd: mov rcx, qword ptr [rbp + 8]
0x14599d9c1: mov qword ptr [rcx + 0x10], r14
0x14599d9c5: mov rax, qword ptr [rbp + 0x110]
0x14599d9cc: mov qword ptr [rcx], rax
0x14599d9cf: mov rax, qword ptr [rbp + 0x118]
0x14599d9d6: mov qword ptr [rcx + 8], rax
0x14599d9da: movaps xmm6, xmmword ptr [rbp + 0x150]
0x14599d9e1: movaps xmm7, xmmword ptr [rbp + 0x160]
0x14599d9e8: movaps xmm8, xmmword ptr [rbp + 0x170]
0x14599d9f0: movaps xmm9, xmmword ptr [rbp + 0x180]
0x14599d9f8: add rsp, 0x218
0x14599d9ff: pop rbx
0x14599da00: pop rdi
0x14599da01: pop rsi
0x14599da02: pop r12
0x14599da04: pop r13
0x14599da06: pop r14
0x14599da08: pop r15
0x14599da0a: pop rbp
0x14599da0b: ret
0x14599da0c: cmp rsi, 0x15
0x14599da10: jae 0x14599daed
0x14599da16: lea r9, [rbp + 0x110]
0x14599da1d: mov r8d, 1
0x14599da23: mov rcx, qword ptr [rbp + 0x90]
0x14599da2a: mov rdx, rsi
0x14599da2d: call 0x1459aeca0
0x14599da32: jmp 0x14599cbe6
0x14599da37: mov qword ptr [rsp + 0x20], 1
0x14599da40: lea rcx, [rbp + 0x110]
0x14599da47: mov r8d, 1
0x14599da4d: mov r9d, 1
0x14599da53: mov qword ptr [rbp + 0x78], r14
0x14599da57: mov rdx, r14
0x14599da5a: call 0x145bfa970
0x14599da5f: nop
0x14599da60: mov rdi, qword ptr [rbp + 0x118]
0x14599da67: mov r14, qword ptr [rbp + 0x78]
0x14599da6b: jmp 0x14599d9ae
0x14599da70: mov byte ptr [rbp + 0x142], 1
0x14599da77: mov ecx, 1
0x14599da7c: mov edx, 1
0x14599da81: call 0x145d992bb
0x14599da86: nop
0x14599da87: jmp 0x14599daeb
0x14599da89: mov ecx, 1
0x14599da8e: mov edx, 1
0x14599da93: call 0x145d992bb
0x14599da98: nop
0x14599da99: jmp 0x14599daeb
0x14599da9b: mov byte ptr [rbp + 0x147], 1
0x14599daa2: mov ecx, 1
0x14599daa7: mov edx, 1
0x14599daac: call 0x145d992bb
0x14599dab1: nop
0x14599dab2: jmp 0x14599daeb
0x14599dab4: mov byte ptr [rbp + 0x144], 1
0x14599dabb: mov byte ptr [rbp + 0x143], 1
0x14599dac2: mov ecx, 1
0x14599dac7: mov edx, 1
0x14599dacc: call 0x145d992bb
0x14599dad1: nop
0x14599dad2: jmp 0x14599daeb
0x14599dad4: mov byte ptr [rbp + 0x141], 1
0x14599dadb: mov ecx, 1
0x14599dae0: mov edx, 1
0x14599dae5: call 0x145d992bb
0x14599daea: nop
0x14599daeb: ud2
0x14599daed: mov byte ptr [rbp + 0x141], 1
0x14599daf4: lea r8, [rbp + 0x110]
0x14599dafb: mov rcx, qword ptr [rbp + 0x90]
0x14599db02: mov rdx, rsi
0x14599db05: call 0x1459dd9b0
0x14599db0a: nop
0x14599db0b: jmp 0x14599cbe6
