0x14014bdd0: push rbp
0x14014bdd1: push r15
0x14014bdd3: push r14
0x14014bdd5: push r13
0x14014bdd7: push r12
0x14014bdd9: push rsi
0x14014bdda: push rdi
0x14014bddb: push rbx
0x14014bddc: sub rsp, 0x378
0x14014bde3: lea rbp, [rsp + 0x80]
0x14014bdeb: movaps xmmword ptr [rbp + 0x2e0], xmm15
0x14014bdf3: movaps xmmword ptr [rbp + 0x2d0], xmm14
0x14014bdfb: movaps xmmword ptr [rbp + 0x2c0], xmm13
0x14014be03: movaps xmmword ptr [rbp + 0x2b0], xmm12
0x14014be0b: movaps xmmword ptr [rbp + 0x2a0], xmm11
0x14014be13: movaps xmmword ptr [rbp + 0x290], xmm10
0x14014be1b: movaps xmmword ptr [rbp + 0x280], xmm9
0x14014be23: movaps xmmword ptr [rbp + 0x270], xmm8
0x14014be2b: movaps xmmword ptr [rbp + 0x260], xmm7
0x14014be32: movaps xmmword ptr [rbp + 0x250], xmm6
0x14014be39: mov qword ptr [rbp + 0x248], 0xfffffffffffffffe
0x14014be44: mov qword ptr [rbp - 0x10], r9
0x14014be48: mov qword ptr [rbp + 0x1b8], r8
0x14014be4f: mov qword ptr [rbp + 0x240], rdx
0x14014be56: mov qword ptr [rbp + 0x238], rcx
0x14014be5d: mov rsi, qword ptr [rbp + 0x368]
0x14014be64: mov r13, qword ptr [rbp + 0x360]
0x14014be6b: test rsi, rsi
0x14014be6e: je 0x14014beaf
0x14014be70: mov edi, dword ptr [r13 + 0x38]
0x14014be74: movzx r15d, byte ptr [r13 + 0x30]
0x14014be79: mov rbx, qword ptr [r13 + 0x20]
0x14014be7d: mov r14, qword ptr [r13 + 0x28]
0x14014be81: mov rcx, rbx
0x14014be84: mov rdx, r14
0x14014be87: call 0x145aaef50
0x14014be8c: mov rcx, rsi
0x14014be8f: mov edx, r15d
0x14014be92: mov r8, rax
0x14014be95: call 0x145aca320
0x14014be9a: movzx eax, al
0x14014be9d: cmp al, dil
0x14014bea0: cmovb edi, eax
0x14014bea3: mov ecx, edi
0x14014bea5: call 0x145be05d0
0x14014beaa: mov r12d, eax
0x14014bead: jmp 0x14014bebf
0x14014beaf: movzx r15d, byte ptr [r13 + 0x30]
0x14014beb4: mov rbx, qword ptr [r13 + 0x20]
0x14014beb8: mov r14, qword ptr [r13 + 0x28]
0x14014bebc: xor r12d, r12d
0x14014bebf: mov ecx, r15d
0x14014bec2: call 0x145aaf610
0x14014bec7: mov rdi, rax
0x14014beca: lea rcx, [rip + 0x607926e]
0x14014bed1: mov edx, 8
0x14014bed6: call 0x145bbfea0
0x14014bedb: mov qword ptr [rbp - 8], rax
0x14014bedf: mov rsi, rdx
0x14014bee2: mov rcx, rdi
0x14014bee5: call 0x145aaa940
0x14014beea: mov qword ptr [rbp + 0x1d0], rax
0x14014bef1: mov qword ptr [rbp + 0x1d8], rdx
0x14014bef8: mov qword ptr [rbp + 0x30], r13
0x14014befc: lea rax, [rip - 0x149e23]
0x14014bf03: mov qword ptr [rbp + 0x38], rax
0x14014bf07: lea rax, [rbp + 0x1d0]
0x14014bf0e: mov qword ptr [rbp + 0x40], rax
0x14014bf12: lea rax, [rip - 0x149e59]
0x14014bf19: mov qword ptr [rbp + 0x48], rax
0x14014bf1d: lea rdx, [rip + 0x6079223]
0x14014bf24: mov rcx, rbp
0x14014bf27: lea r8, [rbp + 0x30]
0x14014bf2b: call 0x145fd7da0
0x14014bf30: nop 
0x14014bf31: mov rcx, rbx
0x14014bf34: mov rdx, r14
0x14014bf37: call 0x145aaf080
0x14014bf3c: nop 
0x14014bf3d: mov rcx, rax
0x14014bf40: call 0x145aac2d0
0x14014bf45: nop 
0x14014bf46: test rdx, rdx
0x14014bf49: jns 0x14014bf5c
0x14014bf4b: xor r14d, r14d
0x14014bf4e: mov rcx, r14
0x14014bf51: call 0x1461add5b
0x14014bf56: nop 
0x14014bf57: jmp 0x14014ca0f
0x14014bf5c: test rdx, rdx
0x14014bf5f: mov qword ptr [rbp + 0x1c0], rdx
0x14014bf66: je 0x14014bfa5
0x14014bf68: mov rdi, rdx
0x14014bf6b: mov rbx, rax
0x14014bf6e: call 0x140002200
0x14014bf73: mov r14d, 1
0x14014bf79: mov edx, 1
0x14014bf7e: mov rcx, rdi
0x14014bf81: call 0x1400021c0
0x14014bf86: test rax, rax
0x14014bf89: mov rdx, rdi
0x14014bf8c: je 0x14014bf4e
0x14014bf8e: mov qword ptr [rbp + 0x1c8], rax
0x14014bf95: mov rcx, rax
0x14014bf98: mov r8, rdx
0x14014bf9b: mov rdx, rbx
0x14014bf9e: call 0x14600504b
0x14014bfa3: jmp 0x14014bfb1
0x14014bfa5: mov eax, 1
0x14014bfaa: mov qword ptr [rbp + 0x1c8], rax
0x14014bfb1: lea rdi, [rbp + 0x30]
0x14014bfb5: lea rcx, [rbp + 0x1d0]
0x14014bfbc: mov edx, r12d
0x14014bfbf: call 0x145be05e0
0x14014bfc4: nop 
0x14014bfc5: mov byte ptr [rbp + 0x78], 1
0x14014bfc9: mov byte ptr [rbp + 0x79], r15b
0x14014bfcd: movups xmm0, xmmword ptr [rbp]
0x14014bfd1: movaps xmmword ptr [rbp + 0x30], xmm0
0x14014bfd5: mov rax, qword ptr [rbp + 0x10]
0x14014bfd9: mov qword ptr [rbp + 0x40], rax
0x14014bfdd: mov rax, qword ptr [rbp + 0x1c0]
0x14014bfe4: mov qword ptr [rbp + 0x48], rax
0x14014bfe8: mov rcx, qword ptr [rbp + 0x1c8]
0x14014bfef: mov qword ptr [rbp + 0x50], rcx
0x14014bff3: mov qword ptr [rbp + 0x58], rax
0x14014bff7: mov byte ptr [rbp + 0x7b], r12b
0x14014bffb: movups xmm0, xmmword ptr [rbp + 0x1d0]
0x14014c002: movaps xmmword ptr [rbp + 0x60], xmm0
0x14014c006: mov rax, qword ptr [rbp + 0x1e0]
0x14014c00d: mov qword ptr [rbp + 0x70], rax
0x14014c011: mov byte ptr [rbp + 0x7a], 1
0x14014c015: mov qword ptr [rsp + 0x28], rdi
0x14014c01a: mov qword ptr [rsp + 0x20], rsi
0x14014c01f: mov rcx, qword ptr [rbp + 0x238]
0x14014c026: mov rdx, qword ptr [rbp + 0x240]
0x14014c02d: mov r8, qword ptr [rbp + 0x1b8]
0x14014c034: mov r9, qword ptr [rbp - 8]
0x14014c038: call 0x14014ba40
0x14014c03d: lea rcx, [rip + 0x607910b]
0x14014c044: mov edx, 0xc
0x14014c049: call 0x145bbfea0
0x14014c04e: mov r8, rdx
0x14014c051: lea rcx, [rip + 0x6079103]
0x14014c058: mov qword ptr [rbp + 0x30], rcx
0x14014c05c: mov qword ptr [rbp + 0x38], 4
0x14014c064: mov qword ptr [rbp + 0x40], r13
0x14014c068: lea rcx, [rip + 0x6078739]
0x14014c06f: mov qword ptr [rbp + 0x48], rcx
0x14014c073: mov qword ptr [rsp + 0x20], 1
0x14014c07c: lea rcx, [rbp - 0x28]
0x14014c080: lea r9, [rbp + 0x30]
0x14014c084: mov rdx, rax
0x14014c087: call 0x145bc0330
0x14014c08c: nop 
0x14014c08d: lea rcx, [rip + 0x60790cb]
0x14014c094: mov edx, 0xa
0x14014c099: call 0x145bbfea0
0x14014c09e: nop 
0x14014c09f: mov rdi, qword ptr [rbp - 0x10]
0x14014c0a3: movups xmm0, xmmword ptr [rdi + 0xd8]
0x14014c0aa: mov r8, qword ptr [rbp - 0x20]
0x14014c0ae: mov rcx, qword ptr [rbp - 0x18]
0x14014c0b2: mov r12b, byte ptr [rdi + 0x172]
0x14014c0b9: mov qword ptr [rsp + 0x48], rcx
0x14014c0be: mov qword ptr [rbp + 0x1b8], r8
0x14014c0c5: mov qword ptr [rsp + 0x40], r8
0x14014c0ca: movups xmmword ptr [rsp + 0x30], xmm0
0x14014c0cf: mov qword ptr [rsp + 0x28], rdx
0x14014c0d4: mov qword ptr [rsp + 0x20], rax
0x14014c0d9: mov byte ptr [rsp + 0x50], 0
0x14014c0de: mov rcx, qword ptr [rbp + 0x238]
0x14014c0e5: mov rdx, qword ptr [rbp + 0x240]
0x14014c0ec: mov r8d, r12d
0x14014c0ef: mov r9b, 1
0x14014c0f2: call 0x140147860
0x14014c0f7: nop 
0x14014c0f8: lea rcx, [rip + 0x607906a]
0x14014c0ff: mov edx, 0x16
0x14014c104: call 0x145bbfea0
0x14014c109: nop 
0x14014c10a: mov rsi, rax
0x14014c10d: mov rbx, rdx
0x14014c110: mov r14, qword ptr [rdi + 0x108]
0x14014c117: mov r15, qword ptr [rdi + 0x110]
0x14014c11e: lea rcx, [rip + 0x607905a]
0x14014c125: mov edx, 0x15
0x14014c12a: call 0x145bbfea0
0x14014c12f: nop 
0x14014c130: mov qword ptr [rsp + 0x48], rdx
0x14014c135: mov qword ptr [rsp + 0x40], rax
0x14014c13a: mov qword ptr [rsp + 0x38], r15
0x14014c13f: mov qword ptr [rsp + 0x30], r14
0x14014c144: mov qword ptr [rsp + 0x28], rbx
0x14014c149: mov qword ptr [rsp + 0x20], rsi
0x14014c14e: mov byte ptr [rsp + 0x50], 0
0x14014c153: mov rcx, qword ptr [rbp + 0x238]
0x14014c15a: mov rdx, qword ptr [rbp + 0x240]
0x14014c161: mov r8d, r12d
0x14014c164: mov r9b, 2
0x14014c167: call 0x140147860
0x14014c16c: nop 
0x14014c16d: movups xmm6, xmmword ptr [rip + 0x6077f9c]
0x14014c174: movaps xmmword ptr [rbp + 0x1d0], xmm6
0x14014c17b: mov qword ptr [rbp + 0x1e0], 0
0x14014c186: movups xmm0, xmmword ptr [rip + 0x6077f9b]
0x14014c18d: movups xmmword ptr [rbp + 0x1e8], xmm0
0x14014c194: mov qword ptr [rbp + 0x1f8], 0
0x14014c19f: movups xmm7, xmmword ptr [rip + 0x6077f9a]
0x14014c1a6: movaps xmmword ptr [rbp + 0x200], xmm7
0x14014c1ad: mov qword ptr [rbp + 0x210], 0
0x14014c1b8: movups xmm0, xmmword ptr [rip + 0x6077f99]
0x14014c1bf: movups xmmword ptr [rbp + 0x218], xmm0
0x14014c1c6: mov qword ptr [rbp + 0x228], 0
0x14014c1d1: mov rax, qword ptr [rbp + 0x238]
0x14014c1d8: mov r13, qword ptr [rax]
0x14014c1db: lea r15, [rax + 8]
0x14014c1df: mov rax, qword ptr [rbp + 0x220]
0x14014c1e6: mov qword ptr [rbp + 0x88], rax
0x14014c1ed: mov rax, qword ptr [rbp + 0x228]
0x14014c1f4: mov qword ptr [rbp + 0x90], rax
0x14014c1fb: mov rax, qword ptr [rbp + 0x210]
0x14014c202: mov qword ptr [rbp + 0x78], rax
0x14014c206: mov rax, qword ptr [rbp + 0x218]
0x14014c20d: mov qword ptr [rbp + 0x80], rax
0x14014c214: movups xmmword ptr [rbp + 0x68], xmm7
0x14014c218: movaps xmm0, xmmword ptr [rbp + 0x1f0]
0x14014c21f: movups xmmword ptr [rbp + 0x58], xmm0
0x14014c223: movaps xmm0, xmmword ptr [rbp + 0x1e0]
0x14014c22a: movups xmmword ptr [rbp + 0x48], xmm0
0x14014c22e: movups xmmword ptr [rbp + 0x38], xmm6
0x14014c232: xorps xmm0, xmm0
0x14014c235: movups xmmword ptr [rbp + 0x98], xmm0
0x14014c23c: movups xmmword ptr [rbp + 0xa8], xmm0
0x14014c243: movups xmmword ptr [rbp + 0xb8], xmm0
0x14014c24a: movups xmmword ptr [rbp + 0xc8], xmm0
0x14014c251: movups xmmword ptr [rbp + 0xd8], xmm0
0x14014c258: mov qword ptr [rbp + 0xe8], 0
0x14014c263: movups xmm0, xmmword ptr [rip + 0x6077f6e]
0x14014c26a: movups xmmword ptr [rbp + 0x100], xmm0
0x14014c271: movups xmm0, xmmword ptr [rip + 0x6077f50]
0x14014c278: movups xmmword ptr [rbp + 0xf0], xmm0
0x14014c27f: movups xmm12, xmmword ptr [rip + 0x6077f71]
0x14014c287: movups xmmword ptr [rbp + 0x120], xmm12
0x14014c28f: movups xmm13, xmmword ptr [rip + 0x6077f51]
0x14014c297: movups xmmword ptr [rbp + 0x110], xmm13
0x14014c29f: movups xmm14, xmmword ptr [rip + 0x6077f71]
0x14014c2a7: movups xmmword ptr [rbp + 0x140], xmm14
0x14014c2af: movups xmm15, xmmword ptr [rip + 0x6077f51]
0x14014c2b7: movups xmmword ptr [rbp + 0x130], xmm15
0x14014c2bf: movups xmm8, xmmword ptr [rip + 0x6077f71]
0x14014c2c7: movups xmmword ptr [rbp + 0x160], xmm8
0x14014c2cf: movups xmm9, xmmword ptr [rip + 0x6077f51]
0x14014c2d7: movups xmmword ptr [rbp + 0x150], xmm9
0x14014c2df: movaps xmm10, xmmword ptr [rip + 0x6065f09]
0x14014c2e7: movups xmmword ptr [rbp + 0x170], xmm10
0x14014c2ef: mov dword ptr [rbp + 0x180], 1
0x14014c2f9: movss xmm11, dword ptr [rip + 0x606612e]
0x14014c302: movlps qword ptr [rbp + 0x184], xmm11
0x14014c30a: mov byte ptr [rbp + 0x18c], 1
0x14014c311: mov qword ptr [rbp + 0x190], 0
0x14014c31c: mov dword ptr [rbp + 0x198], 0x3f800000
0x14014c326: mov word ptr [rbp + 0x19c], 0
0x14014c32f: mov word ptr [rbp + 0x1a2], 0
0x14014c338: mov dword ptr [rbp + 0x19e], 0x10000
0x14014c342: mov word ptr [rbp + 0x1a8], 0
0x14014c34b: mov dword ptr [rbp + 0x1a4], 0x10000
0x14014c355: mov qword ptr [rbp + 0x1aa], 0
0x14014c360: mov dword ptr [rbp + 0x1b2], 5
0x14014c36a: mov qword ptr [rbp + 0x30], r13
0x14014c36e: lea r9, [rip + 0x60779b3]
0x14014c375: mov rcx, rbp
0x14014c378: lea r8, [rbp + 0x30]
0x14014c37c: mov rdx, r15
0x14014c37f: call 0x1402441d0
0x14014c384: nop 
0x14014c385: mov rcx, rbp
0x14014c388: mov rdx, qword ptr [rbp + 0x240]
0x14014c38f: mov r8, rdi
0x14014c392: call 0x14028a170
0x14014c397: nop 
0x14014c398: movaps xmmword ptr [rbp + 0x1d0], xmm6
0x14014c39f: mov qword ptr [rbp + 0x1e0], 0
0x14014c3aa: movups xmm0, xmmword ptr [rip + 0x6077d77]
0x14014c3b1: movups xmmword ptr [rbp + 0x1e8], xmm0
0x14014c3b8: mov qword ptr [rbp + 0x1f8], 0
0x14014c3c3: movaps xmmword ptr [rbp + 0x200], xmm7
0x14014c3ca: mov qword ptr [rbp + 0x210], 0
0x14014c3d5: movups xmm0, xmmword ptr [rip + 0x6077d7c]
0x14014c3dc: movups xmmword ptr [rbp + 0x218], xmm0
0x14014c3e3: mov qword ptr [rbp + 0x228], 0
0x14014c3ee: mov rax, qword ptr [rbp + 0x220]
0x14014c3f5: mov qword ptr [rbp + 0x88], rax
0x14014c3fc: mov rax, qword ptr [rbp + 0x228]
0x14014c403: mov qword ptr [rbp + 0x90], rax
0x14014c40a: mov rax, qword ptr [rbp + 0x210]
0x14014c411: mov qword ptr [rbp + 0x78], rax
0x14014c415: mov rax, qword ptr [rbp + 0x218]
0x14014c41c: mov qword ptr [rbp + 0x80], rax
0x14014c423: movups xmmword ptr [rbp + 0x68], xmm7
0x14014c427: mov rax, qword ptr [rbp + 0x1f0]
0x14014c42e: mov qword ptr [rbp + 0x58], rax
0x14014c432: mov rax, qword ptr [rbp + 0x1f8]
0x14014c439: mov qword ptr [rbp + 0x60], rax
0x14014c43d: movaps xmm0, xmmword ptr [rbp + 0x1e0]
0x14014c444: movups xmmword ptr [rbp + 0x48], xmm0
0x14014c448: movups xmmword ptr [rbp + 0x38], xmm6
0x14014c44c: xorps xmm0, xmm0
0x14014c44f: movups xmmword ptr [rbp + 0x98], xmm0
0x14014c456: movups xmmword ptr [rbp + 0xa8], xmm0
0x14014c45d: movups xmmword ptr [rbp + 0xb8], xmm0
0x14014c464: movups xmmword ptr [rbp + 0xc8], xmm0
0x14014c46b: movups xmmword ptr [rbp + 0xd8], xmm0
0x14014c472: mov qword ptr [rbp + 0xe8], 0
0x14014c47d: movups xmm0, xmmword ptr [rip + 0x6077d54]
0x14014c484: movups xmmword ptr [rbp + 0x100], xmm0
0x14014c48b: movups xmm0, xmmword ptr [rip + 0x6077d36]
0x14014c492: movups xmmword ptr [rbp + 0xf0], xmm0
0x14014c499: movups xmmword ptr [rbp + 0x120], xmm12
0x14014c4a1: movups xmmword ptr [rbp + 0x110], xmm13
0x14014c4a9: movups xmmword ptr [rbp + 0x140], xmm14
0x14014c4b1: movups xmmword ptr [rbp + 0x130], xmm15
0x14014c4b9: movups xmmword ptr [rbp + 0x160], xmm8
0x14014c4c1: movups xmmword ptr [rbp + 0x150], xmm9
0x14014c4c9: movups xmmword ptr [rbp + 0x170], xmm10
0x14014c4d1: mov dword ptr [rbp + 0x180], 1
0x14014c4db: movlps qword ptr [rbp + 0x184], xmm11
0x14014c4e3: mov byte ptr [rbp + 0x18c], 1
0x14014c4ea: mov qword ptr [rbp + 0x190], 0
0x14014c4f5: mov dword ptr [rbp + 0x198], 0x3f800000
0x14014c4ff: mov word ptr [rbp + 0x19c], 0
0x14014c508: mov word ptr [rbp + 0x1a2], 0
0x14014c511: mov dword ptr [rbp + 0x19e], 0x10000
0x14014c51b: mov word ptr [rbp + 0x1a8], 0
0x14014c524: mov dword ptr [rbp + 0x1a4], 0x10000
0x14014c52e: mov qword ptr [rbp + 0x1aa], 0
0x14014c539: mov dword ptr [rbp + 0x1b2], 5
0x14014c543: mov qword ptr [rbp + 0x30], r13
0x14014c547: lea r9, [rip + 0x60777da]
0x14014c54e: mov rcx, rbp
0x14014c551: lea r8, [rbp + 0x30]
0x14014c555: mov rdx, r15
0x14014c558: call 0x1402441d0
0x14014c55d: nop 
0x14014c55e: mov rcx, rbp
0x14014c561: mov rdx, qword ptr [rbp + 0x240]
0x14014c568: mov r8, rdi
0x14014c56b: call 0x140289c00
0x14014c570: nop 
0x14014c571: lea rcx, [rip + 0x6078c1c]
0x14014c578: mov edx, 0x13
0x14014c57d: call 0x145bbfea0
0x14014c582: nop 
0x14014c583: mov rsi, rax
0x14014c586: mov rbx, rdx
0x14014c589: mov r14, qword ptr [rdi + 0xf0]
0x14014c590: mov rdi, qword ptr [rdi + 0xf8]
0x14014c597: lea rcx, [rip + 0x6078c09]
0x14014c59e: mov edx, 4
0x14014c5a3: call 0x145bbfea0
0x14014c5a8: nop 
0x14014c5a9: mov qword ptr [rsp + 0x48], rdx
0x14014c5ae: mov qword ptr [rsp + 0x40], rax
0x14014c5b3: mov qword ptr [rsp + 0x38], rdi
0x14014c5b8: mov qword ptr [rsp + 0x30], r14
0x14014c5bd: mov qword ptr [rsp + 0x28], rbx
0x14014c5c2: mov qword ptr [rsp + 0x20], rsi
0x14014c5c7: mov byte ptr [rsp + 0x50], 1
0x14014c5cc: mov rcx, qword ptr [rbp + 0x238]
0x14014c5d3: mov rdx, qword ptr [rbp + 0x240]
0x14014c5da: mov r8d, r12d
0x14014c5dd: mov r9b, 3
0x14014c5e0: call 0x140147860
0x14014c5e5: nop 
0x14014c5e6: lea rcx, [rip + 0x6078bbe]
0x14014c5ed: mov edx, 0x70
0x14014c5f2: call 0x145bbfea0
0x14014c5f7: nop 
0x14014c5f8: mov rsi, rdx
0x14014c5fb: test rdx, rdx
0x14014c5fe: jns 0x14014c614
0x14014c600: xor r12d, r12d
0x14014c603: mov rcx, r12
0x14014c606: mov rdx, rsi
0x14014c609: call 0x1461add5b
0x14014c60e: nop 
0x14014c60f: jmp 0x14014ca0f
0x14014c614: test rsi, rsi
0x14014c617: je 0x14014c674
0x14014c619: mov r14, rax
0x14014c61c: call 0x140002200
0x14014c621: mov r12d, 1
0x14014c627: mov edx, 1
0x14014c62c: mov rcx, rsi
0x14014c62f: call 0x1400021c0
0x14014c634: test rax, rax
0x14014c637: je 0x14014c603
0x14014c639: mov rbx, rax
0x14014c63c: mov rcx, rax
0x14014c63f: mov rdx, r14
0x14014c642: mov r8, rsi
0x14014c645: call 0x14600504b
0x14014c64a: mov rdx, qword ptr [rbp + 0x240]
0x14014c651: cmp byte ptr [rdx], 1
0x14014c654: jne 0x14014c685
0x14014c656: mov eax, dword ptr [rdx + 1]
0x14014c659: mov ecx, dword ptr [rdx + 4]
0x14014c65c: mov dword ptr [rbp + 0x233], ecx
0x14014c662: mov dword ptr [rbp + 0x230], eax
0x14014c668: mov rax, qword ptr [rdx + 8]
0x14014c66c: movzx ecx, byte ptr [rdx + 0x10]
0x14014c670: mov dl, 1
0x14014c672: jmp 0x14014c695
0x14014c674: mov ebx, 1
0x14014c679: mov rdx, qword ptr [rbp + 0x240]
0x14014c680: cmp byte ptr [rdx], 1
0x14014c683: je 0x14014c656
0x14014c685: mov rax, qword ptr [rdx + 8]
0x14014c689: lock inc qword ptr [rax]
0x14014c68d: jle 0x14014ca0f
0x14014c693: xor edx, edx
0x14014c695: movups xmm0, xmmword ptr [rip + 0x60786b4]
0x14014c69c: movups xmmword ptr [rbp + 1], xmm0
0x14014c6a0: mov dword ptr [rbp + 0x11], 0x3f800000
0x14014c6a7: mov qword ptr [rbp + 0x38], rsi
0x14014c6ab: mov qword ptr [rbp + 0x40], rbx
0x14014c6af: mov qword ptr [rbp + 0x48], rsi
0x14014c6b3: mov qword ptr [rbp + 0x50], 0
0x14014c6bb: mov qword ptr [rbp + 0x58], 4
0x14014c6c3: mov qword ptr [rbp + 0x60], 0
0x14014c6cb: mov byte ptr [rbp + 0x68], dl
0x14014c6ce: mov edx, dword ptr [rbp + 0x230]
0x14014c6d4: mov r8d, dword ptr [rbp + 0x233]
0x14014c6db: mov dword ptr [rbp + 0x69], edx
0x14014c6de: mov dword ptr [rbp + 0x6c], r8d
0x14014c6e2: mov qword ptr [rbp + 0x70], rax
0x14014c6e6: mov qword ptr [rbp + 0x78], rcx
0x14014c6ea: mov dword ptr [rbp + 0x80], 0x41500000
0x14014c6f4: mov word ptr [rbp + 0x84], 0x190
0x14014c6fd: mov byte ptr [rbp + 0x86], 1
0x14014c704: movups xmm0, xmmword ptr [rbp]
0x14014c708: movups xmmword ptr [rbp + 0x87], xmm0
0x14014c70f: mov rax, qword ptr [rbp + 0xd]
0x14014c713: mov qword ptr [rbp + 0x94], rax
0x14014c71a: movups xmm0, xmmword ptr [rip + 0x6077b6f]
0x14014c721: movups xmmword ptr [rbp + 0x9c], xmm0
0x14014c728: mov dword ptr [rbp + 0xac], 0x3f59999a
0x14014c732: movsd xmm0, qword ptr [rip + 0x6065db6]
0x14014c73a: movsd qword ptr [rbp + 0xb0], xmm0
0x14014c742: mov qword ptr [rbp + 0x30], r13
0x14014c746: lea r9, [rip + 0x60775db]
0x14014c74d: lea rcx, [rbp + 0x1d0]
0x14014c754: lea r8, [rbp + 0x30]
0x14014c758: mov rdx, r15
0x14014c75b: call 0x14025a890
0x14014c760: nop 
0x14014c761: movaps xmmword ptr [rbp + 0x1d0], xmm6
0x14014c768: mov qword ptr [rbp + 0x1e0], 0
0x14014c773: movups xmm0, xmmword ptr [rip + 0x60779ae]
0x14014c77a: movups xmmword ptr [rbp + 0x1e8], xmm0
0x14014c781: mov qword ptr [rbp + 0x1f8], 0
0x14014c78c: movaps xmmword ptr [rbp + 0x200], xmm7
0x14014c793: mov qword ptr [rbp + 0x210], 0
0x14014c79e: movups xmm0, xmmword ptr [rip + 0x60779b3]
0x14014c7a5: movups xmmword ptr [rbp + 0x218], xmm0
0x14014c7ac: mov qword ptr [rbp + 0x228], 0
0x14014c7b7: mov rax, qword ptr [rbp + 0x220]
0x14014c7be: mov qword ptr [rbp + 0x88], rax
0x14014c7c5: mov rax, qword ptr [rbp + 0x228]
0x14014c7cc: mov qword ptr [rbp + 0x90], rax
0x14014c7d3: mov rax, qword ptr [rbp + 0x210]
0x14014c7da: mov qword ptr [rbp + 0x78], rax
0x14014c7de: mov rax, qword ptr [rbp + 0x218]
0x14014c7e5: mov qword ptr [rbp + 0x80], rax
0x14014c7ec: movups xmmword ptr [rbp + 0x68], xmm7
0x14014c7f0: mov rax, qword ptr [rbp + 0x1f0]
0x14014c7f7: mov qword ptr [rbp + 0x58], rax
0x14014c7fb: mov rax, qword ptr [rbp + 0x1f8]
0x14014c802: mov qword ptr [rbp + 0x60], rax
0x14014c806: movaps xmm0, xmmword ptr [rbp + 0x1e0]
0x14014c80d: movups xmmword ptr [rbp + 0x48], xmm0
0x14014c811: movups xmmword ptr [rbp + 0x38], xmm6
0x14014c815: xorps xmm0, xmm0
0x14014c818: movups xmmword ptr [rbp + 0x98], xmm0
0x14014c81f: movups xmmword ptr [rbp + 0xa8], xmm0
0x14014c826: movups xmmword ptr [rbp + 0xb8], xmm0
0x14014c82d: movups xmmword ptr [rbp + 0xc8], xmm0
0x14014c834: movups xmmword ptr [rbp + 0xd8], xmm0
0x14014c83b: mov qword ptr [rbp + 0xe8], 0
0x14014c846: movups xmm0, xmmword ptr [rip + 0x607798b]
0x14014c84d: movups xmmword ptr [rbp + 0x100], xmm0
0x14014c854: movups xmm0, xmmword ptr [rip + 0x607796d]
0x14014c85b: movups xmmword ptr [rbp + 0xf0], xmm0
0x14014c862: movups xmmword ptr [rbp + 0x120], xmm12
0x14014c86a: movups xmmword ptr [rbp + 0x110], xmm13
0x14014c872: movups xmmword ptr [rbp + 0x140], xmm14
0x14014c87a: movups xmmword ptr [rbp + 0x130], xmm15
0x14014c882: movups xmmword ptr [rbp + 0x160], xmm8
0x14014c88a: movups xmmword ptr [rbp + 0x150], xmm9
0x14014c892: movups xmmword ptr [rbp + 0x170], xmm10
0x14014c89a: mov dword ptr [rbp + 0x180], 1
0x14014c8a4: mov qword ptr [rbp + 0x184], 0
0x14014c8af: mov byte ptr [rbp + 0x18c], 1
0x14014c8b6: mov qword ptr [rbp + 0x190], 0
0x14014c8c1: mov dword ptr [rbp + 0x198], 0x3f800000
0x14014c8cb: mov word ptr [rbp + 0x19c], 0
0x14014c8d4: mov word ptr [rbp + 0x1a2], 0
0x14014c8dd: mov dword ptr [rbp + 0x19e], 0x10000
0x14014c8e7: mov word ptr [rbp + 0x1a8], 0
0x14014c8f0: mov dword ptr [rbp + 0x1a4], 0x10000
0x14014c8fa: mov dword ptr [rbp + 0x1b1], 0
0x14014c904: mov qword ptr [rbp + 0x1aa], 0
0x14014c90f: mov byte ptr [rbp + 0x1b5], 5
0x14014c916: mov qword ptr [rbp + 0x30], r13
0x14014c91a: lea r9, [rip + 0x6077407]
0x14014c921: mov rcx, rbp
0x14014c924: lea r8, [rbp + 0x30]
0x14014c928: mov rdx, r15
0x14014c92b: call 0x1402441d0
0x14014c930: nop 
0x14014c931: mov rax, qword ptr [rbp]
0x14014c935: mov rcx, qword ptr [rbp + 0x28]
0x14014c939: mov qword ptr [rbp + 0x30], rax
0x14014c93d: movups xmm0, xmmword ptr [rbp + 8]
0x14014c941: movups xmmword ptr [rbp + 0x38], xmm0
0x14014c945: movups xmm0, xmmword ptr [rbp + 0x18]
0x14014c949: movups xmmword ptr [rbp + 0x48], xmm0
0x14014c94d: mov qword ptr [rbp + 0x58], rcx
0x14014c951: mov byte ptr [rbp + 0x1d0], 3
0x14014c958: lea rcx, [rip + 0x60c534f]
0x14014c95f: mov edx, 0xe
0x14014c964: call 0x145bbfea0
0x14014c969: nop 
0x14014c96a: mov qword ptr [rsp + 0x20], rdx
0x14014c96f: mov dword ptr [rsp + 0x28], 0x41900000
0x14014c977: lea rcx, [rbp + 0x30]
0x14014c97b: lea r8, [rbp + 0x1d0]
0x14014c982: mov rdx, qword ptr [rbp + 0x240]
0x14014c989: mov r9, rax
0x14014c98c: call 0x1401488f0
0x14014c991: nop 
0x14014c992: mov rdx, qword ptr [rbp - 0x28]
0x14014c996: test rdx, rdx
0x14014c999: je 0x14014c9ad
0x14014c99b: mov r8d, 1
0x14014c9a1: mov rcx, qword ptr [rbp + 0x1b8]
0x14014c9a8: call 0x1400021d0
0x14014c9ad: movaps xmm6, xmmword ptr [rbp + 0x250]
0x14014c9b4: movaps xmm7, xmmword ptr [rbp + 0x260]
0x14014c9bb: movaps xmm8, xmmword ptr [rbp + 0x270]
0x14014c9c3: movaps xmm9, xmmword ptr [rbp + 0x280]
0x14014c9cb: movaps xmm10, xmmword ptr [rbp + 0x290]
0x14014c9d3: movaps xmm11, xmmword ptr [rbp + 0x2a0]
0x14014c9db: movaps xmm12, xmmword ptr [rbp + 0x2b0]
0x14014c9e3: movaps xmm13, xmmword ptr [rbp + 0x2c0]
0x14014c9eb: movaps xmm14, xmmword ptr [rbp + 0x2d0]
0x14014c9f3: movaps xmm15, xmmword ptr [rbp + 0x2e0]
0x14014c9fb: add rsp, 0x378
0x14014ca02: pop rbx
0x14014ca03: pop rdi
0x14014ca04: pop rsi
0x14014ca05: pop r12
0x14014ca07: pop r13
0x14014ca09: pop r14
0x14014ca0b: pop r15
0x14014ca0d: pop rbp
0x14014ca0e: ret 
0x14014ca0f: ud2 
