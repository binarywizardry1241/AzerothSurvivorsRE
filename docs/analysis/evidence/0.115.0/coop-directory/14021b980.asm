0x14021b980: push rbp
0x14021b981: push r15
0x14021b983: push r14
0x14021b985: push r13
0x14021b987: push r12
0x14021b989: push rsi
0x14021b98a: push rdi
0x14021b98b: push rbx
0x14021b98c: sub rsp, 0x228
0x14021b993: lea rbp, [rsp + 0x80]
0x14021b99b: mov qword ptr [rbp + 0x1a0], 0xfffffffffffffffe
0x14021b9a6: mov rcx, qword ptr [rdx]
0x14021b9a9: cmp qword ptr [rcx + 0x10], 0
0x14021b9ae: je 0x14021c59b
0x14021b9b4: mov rax, qword ptr [rbp + 0x210]
0x14021b9bb: mov r10, qword ptr [rdx + 0x10]
0x14021b9bf: mov edx, dword ptr [rdx + 0x1c]
0x14021b9c2: mov r12, qword ptr [r8]
0x14021b9c5: mov r13, qword ptr [r8 + 0x10]
0x14021b9c9: mov ebx, dword ptr [r8 + 0x1c]
0x14021b9cd: mov r8, qword ptr [r9]
0x14021b9d0: mov qword ptr [rbp + 0xe8], r8
0x14021b9d7: mov r14, qword ptr [rax]
0x14021b9da: mov r8, qword ptr [rax + 0x10]
0x14021b9de: mov qword ptr [rbp + 0xe0], r8
0x14021b9e5: mov eax, dword ptr [rax + 0x1c]
0x14021b9e8: mov dword ptr [rbp + 0x13c], eax
0x14021b9ee: mov dword ptr [r10], edx
0x14021b9f1: mov rax, qword ptr [rcx + 8]
0x14021b9f5: mov r15, qword ptr [rcx + 0x10]
0x14021b9f9: mov qword ptr [rcx + 0x10], 0
0x14021ba01: mov qword ptr [rbp + 0xd0], r15
0x14021ba08: shl r15, 5
0x14021ba0c: add r15, rax
0x14021ba0f: mov qword ptr [rbp + 0xd8], 0
0x14021ba1a: mov qword ptr [rbp + 0xb8], rax
0x14021ba21: mov qword ptr [rbp + 0xc0], r15
0x14021ba28: mov qword ptr [rbp + 0xc8], rcx
0x14021ba2f: lea rcx, [r12 + 0x78]
0x14021ba34: mov qword ptr [rbp + 0x140], rcx
0x14021ba3b: lea rsi, [rip + 0x5cf51d6]
0x14021ba42: cmp rax, r15
0x14021ba45: je 0x14021c58e
0x14021ba4b: nop dword ptr [rax + rax]
0x14021ba50: lea rdi, [rax + 0x20]
0x14021ba54: mov qword ptr [rbp + 0xb8], rdi
0x14021ba5b: movups xmm0, xmmword ptr [rax]
0x14021ba5e: movups xmm1, xmmword ptr [rax + 0x10]
0x14021ba62: movaps xmmword ptr [rbp + 0x90], xmm0
0x14021ba69: movaps xmmword ptr [rbp + 0xa0], xmm1
0x14021ba70: movaps xmmword ptr [rbp + 0x120], xmm1
0x14021ba77: movaps xmmword ptr [rbp + 0x110], xmm0
0x14021ba7e: mov edx, 4
0x14021ba83: mov rcx, rsi
0x14021ba86: lea r8, [rbp + 0x110]
0x14021ba8d: call 0x142a769a0
0x14021ba92: nop
0x14021ba93: test rax, rax
0x14021ba96: jne 0x14021ba9f
0x14021ba98: mov rax, qword ptr [rip + 0x7fce771]
0x14021ba9f: cmp byte ptr [rax], 3
0x14021baa2: jne 0x14021bc50
0x14021baa8: mov rcx, qword ptr [rax + 0x10]
0x14021baac: mov rax, qword ptr [rax + 0x18]
0x14021bab0: cmp rax, 7
0x14021bab4: je 0x14021bc2f
0x14021baba: cmp rax, 5
0x14021babe: je 0x14021bb6e
0x14021bac4: cmp rax, 4
0x14021bac8: jne 0x14021bc50
0x14021bace: cmp dword ptr [rcx], 0x706f6f63
0x14021bad4: jne 0x14021bc50
0x14021bada: mov edx, 5
0x14021badf: lea rcx, [rip + 0x5cf5141]
0x14021bae6: lea r8, [rbp + 0x110]
0x14021baed: call 0x142a769a0
0x14021baf2: nop
0x14021baf3: test rax, rax
0x14021baf6: jne 0x14021baff
0x14021baf8: mov rax, qword ptr [rip + 0x7fce711]
0x14021baff: cmp byte ptr [rax], 3
0x14021bb02: jne 0x14021bd68
0x14021bb08: mov rcx, qword ptr [rax + 0x18]
0x14021bb0c: test rcx, rcx
0x14021bb0f: js 0x14021c5af
0x14021bb15: mov qword ptr [rbp + 0x198], rcx
0x14021bb1c: mov qword ptr [rbp + 0x178], r14
0x14021bb23: je 0x14021bd6f
0x14021bb29: mov r14, qword ptr [rax + 0x10]
0x14021bb2d: call 0x140002200
0x14021bb32: mov edx, 1
0x14021bb37: mov rcx, qword ptr [rbp + 0x198]
0x14021bb3e: call 0x1400021c0
0x14021bb43: mov qword ptr [rbp + 0x188], rax
0x14021bb4a: test rax, rax
0x14021bb4d: je 0x14021c613
0x14021bb53: mov rcx, qword ptr [rbp + 0x188]
0x14021bb5a: mov rdx, r14
0x14021bb5d: mov r8, qword ptr [rbp + 0x198]
0x14021bb64: call 0x145d145fb
0x14021bb69: jmp 0x14021bd86
0x14021bb6e: mov eax, dword ptr [rcx]
0x14021bb70: mov edx, 0x74726170
0x14021bb75: xor eax, edx
0x14021bb77: movzx ecx, byte ptr [rcx + 4]
0x14021bb7b: xor ecx, 0x79
0x14021bb7e: or ecx, eax
0x14021bb80: jne 0x14021bc50
0x14021bb86: mov edx, 7
0x14021bb8b: lea rcx, [rip + 0x5cf508a]
0x14021bb92: lea r8, [rbp + 0x110]
0x14021bb99: call 0x142a769a0
0x14021bb9e: nop
0x14021bb9f: test rax, rax
0x14021bba2: jne 0x14021bbab
0x14021bba4: mov rax, qword ptr [rip + 0x7fce665]
0x14021bbab: cmp byte ptr [rax], 4
0x14021bbae: jne 0x14021bd13
0x14021bbb4: mov qword ptr [rbp + 0x178], r14
0x14021bbbb: mov dword ptr [rbp + 0x190], ebx
0x14021bbc1: mov rbx, r13
0x14021bbc4: mov r14, qword ptr [rax + 0x18]
0x14021bbc8: imul r13, r14, 0x70
0x14021bbcc: movabs rcx, 0x124924924924924
0x14021bbd6: cmp r14, rcx
0x14021bbd9: ja 0x14021c5d0
0x14021bbdf: mov qword ptr [rbp + 0x180], r12
0x14021bbe6: mov rcx, qword ptr [rax + 0x10]
0x14021bbea: test r13, r13
0x14021bbed: je 0x14021bfb6
0x14021bbf3: mov qword ptr [rbp + 0x198], rcx
0x14021bbfa: mov r12, rsi
0x14021bbfd: call 0x140002200
0x14021bc02: mov esi, 8
0x14021bc07: mov edx, 8
0x14021bc0c: mov rcx, r13
0x14021bc0f: call 0x1400021c0
0x14021bc14: test rax, rax
0x14021bc17: je 0x14021c5d2
0x14021bc1d: mov rdx, r14
0x14021bc20: mov rsi, r12
0x14021bc23: mov rcx, qword ptr [rbp + 0x198]
0x14021bc2a: jmp 0x14021bfbd
0x14021bc2f: mov eax, dword ptr [rcx]
0x14021bc31: mov edx, 0x62626f6c
0x14021bc36: xor eax, edx
0x14021bc38: mov ecx, dword ptr [rcx + 3]
0x14021bc3b: mov edx, 0x73656962
0x14021bc40: xor ecx, edx
0x14021bc42: or ecx, eax
0x14021bc44: je 0x14021bc6e
0x14021bc46: nop word ptr cs:[rax + rax]
0x14021bc50: lea rcx, [rbp + 0x90]
0x14021bc57: call 0x140023810
0x14021bc5c: nop
0x14021bc5d: mov rax, rdi
0x14021bc60: cmp rax, r15
0x14021bc63: jne 0x14021ba50
0x14021bc69: jmp 0x14021c58e
0x14021bc6e: mov dword ptr [r13], ebx
0x14021bc72: mov byte ptr [r12 + 0x12d], 1
0x14021bc7b: mov edx, 4
0x14021bc80: lea rcx, [rip + 0x5cf4f9c]
0x14021bc87: lea r8, [rbp + 0x110]
0x14021bc8e: call 0x142a769a0
0x14021bc93: nop
0x14021bc94: test rax, rax
0x14021bc97: jne 0x14021bca0
0x14021bc99: mov rax, qword ptr [rip + 0x7fce570]
0x14021bca0: cmp byte ptr [rax], 4
0x14021bca3: mov qword ptr [rbp + 0x180], r12
0x14021bcaa: jne 0x14021bd41
0x14021bcb0: mov qword ptr [rbp + 0x178], r14
0x14021bcb7: mov dword ptr [rbp + 0x190], ebx
0x14021bcbd: mov rbx, r13
0x14021bcc0: mov r14, qword ptr [rax + 0x18]
0x14021bcc4: imul r13, r14, 0xf0
0x14021bccb: movabs rcx, 0x88888888888888
0x14021bcd5: cmp r14, rcx
0x14021bcd8: ja 0x14021c5c0
0x14021bcde: mov r12, qword ptr [rax + 0x10]
0x14021bce2: test r13, r13
0x14021bce5: je 0x14021c0a8
0x14021bceb: call 0x140002200
0x14021bcf0: mov esi, 8
0x14021bcf5: mov edx, 8
0x14021bcfa: mov rcx, r13
0x14021bcfd: call 0x1400021c0
0x14021bd02: test rax, rax
0x14021bd05: je 0x14021c5c2
0x14021bd0b: mov rcx, r14
0x14021bd0e: jmp 0x14021c0af
0x14021bd13: mov qword ptr [rbp + 0x180], r12
0x14021bd1a: mov eax, 8
0x14021bd1f: mov qword ptr [rbp + 0x198], rax
0x14021bd26: mov qword ptr [rbp + 0x168], 0
0x14021bd31: mov qword ptr [rbp + 0x170], 0
0x14021bd3c: jmp 0x14021c03b
0x14021bd41: mov eax, 8
0x14021bd46: mov qword ptr [rbp + 0x198], rax
0x14021bd4d: mov qword ptr [rbp + 0x168], 0
0x14021bd58: mov qword ptr [rbp + 0x170], 0
0x14021bd63: jmp 0x14021c137
0x14021bd68: mov qword ptr [rbp + 0x178], r14
0x14021bd6f: mov eax, 1
0x14021bd74: mov qword ptr [rbp + 0x188], rax
0x14021bd7b: mov qword ptr [rbp + 0x198], 0
0x14021bd86: mov edx, 3
0x14021bd8b: lea rcx, [rip + 0x5cf4e9a]
0x14021bd92: lea r8, [rbp + 0x110]
0x14021bd99: call 0x142a769a0
0x14021bd9e: nop
0x14021bd9f: test rax, rax
0x14021bda2: jne 0x14021bdab
0x14021bda4: mov rax, qword ptr [rip + 0x7fce465]
0x14021bdab: cmp byte ptr [rax], 3
0x14021bdae: jne 0x14021be01
0x14021bdb0: mov r14, qword ptr [rax + 0x18]
0x14021bdb4: test r14, r14
0x14021bdb7: js 0x14021c5e0
0x14021bdbd: mov dword ptr [rbp + 0x190], ebx
0x14021bdc3: mov rbx, r12
0x14021bdc6: je 0x14021c516
0x14021bdcc: mov r12, qword ptr [rax + 0x10]
0x14021bdd0: call 0x140002200
0x14021bdd5: mov edx, 1
0x14021bdda: mov rcx, r14
0x14021bddd: call 0x1400021c0
0x14021bde2: test rax, rax
0x14021bde5: je 0x14021c628
0x14021bdeb: mov rsi, rax
0x14021bdee: mov rcx, rax
0x14021bdf1: mov rdx, r12
0x14021bdf4: mov r8, r14
0x14021bdf7: call 0x145d145fb
0x14021bdfc: jmp 0x14021c51e
0x14021be01: mov esi, 1
0x14021be06: xor r14d, r14d
0x14021be09: mov dword ptr [r13], ebx
0x14021be0d: mov rdx, qword ptr [r12 + 0x18]
0x14021be12: test rdx, rdx
0x14021be15: je 0x14021be27
0x14021be17: mov rcx, qword ptr [r12 + 0x20]
0x14021be1c: mov r8d, 1
0x14021be22: call 0x1400021d0
0x14021be27: mov qword ptr [r12 + 0x18], r14
0x14021be2c: mov qword ptr [rbp + 0xf8], rsi
0x14021be33: mov qword ptr [r12 + 0x20], rsi
0x14021be38: mov qword ptr [r12 + 0x28], r14
0x14021be3d: mov edx, 3
0x14021be42: lea rcx, [rip + 0x5cf4de6]
0x14021be49: lea r8, [rbp + 0x110]
0x14021be50: call 0x142a769a0
0x14021be55: nop
0x14021be56: test rax, rax
0x14021be59: jne 0x14021be62
0x14021be5b: mov rax, qword ptr [rip + 0x7fce3ae]
0x14021be62: mov cl, 5
0x14021be64: cmp byte ptr [rax], 2
0x14021be67: jne 0x14021be74
0x14021be69: cmp qword ptr [rax + 8], 0
0x14021be6e: jne 0x14021be74
0x14021be70: movzx ecx, byte ptr [rax + 0x10]
0x14021be74: mov dword ptr [r13], ebx
0x14021be78: mov byte ptr [r12 + 0x134], cl
0x14021be80: mov edx, 4
0x14021be85: lea rcx, [rip + 0x5cf4da6]
0x14021be8c: lea r8, [rbp + 0x110]
0x14021be93: call 0x142a769a0
0x14021be98: nop
0x14021be99: test rax, rax
0x14021be9c: jne 0x14021bea5
0x14021be9e: mov rax, qword ptr [rip + 0x7fce36b]
0x14021bea5: cmp byte ptr [rax], 3
0x14021bea8: jne 0x14021befb
0x14021beaa: mov r14, qword ptr [rax + 0x18]
0x14021beae: test r14, r14
0x14021beb1: js 0x14021c5f1
0x14021beb7: mov dword ptr [rbp + 0x190], ebx
0x14021bebd: mov rbx, r12
0x14021bec0: je 0x14021c53e
0x14021bec6: mov r12, qword ptr [rax + 0x10]
0x14021beca: call 0x140002200
0x14021becf: mov edx, 1
0x14021bed4: mov rcx, r14
0x14021bed7: call 0x1400021c0
0x14021bedc: test rax, rax
0x14021bedf: je 0x14021c636
0x14021bee5: mov rsi, rax
0x14021bee8: mov rcx, rax
0x14021beeb: mov rdx, r12
0x14021beee: mov r8, r14
0x14021bef1: call 0x145d145fb
0x14021bef6: jmp 0x14021c546
0x14021befb: mov esi, 1
0x14021bf00: xor r14d, r14d
0x14021bf03: mov dword ptr [r13], ebx
0x14021bf07: mov rdx, qword ptr [r12 + 0x30]
0x14021bf0c: test rdx, rdx
0x14021bf0f: je 0x14021bf21
0x14021bf11: mov rcx, qword ptr [r12 + 0x38]
0x14021bf16: mov r8d, 1
0x14021bf1c: call 0x1400021d0
0x14021bf21: mov qword ptr [r12 + 0x30], r14
0x14021bf26: mov qword ptr [rbp + 0x100], rsi
0x14021bf2d: mov qword ptr [r12 + 0x38], rsi
0x14021bf32: mov qword ptr [r12 + 0x40], r14
0x14021bf37: mov edx, 4
0x14021bf3c: lea rcx, [rip + 0x5cf484d]
0x14021bf43: lea r8, [rbp + 0x110]
0x14021bf4a: call 0x142a769a0
0x14021bf4f: nop
0x14021bf50: test rax, rax
0x14021bf53: jne 0x14021bf5c
0x14021bf55: mov rax, qword ptr [rip + 0x7fce2b4]
0x14021bf5c: cmp byte ptr [rax], 3
0x14021bf5f: jne 0x14021c220
0x14021bf65: mov r14, qword ptr [rax + 0x18]
0x14021bf69: test r14, r14
0x14021bf6c: js 0x14021c602
0x14021bf72: mov dword ptr [rbp + 0x190], ebx
0x14021bf78: mov rbx, r12
0x14021bf7b: je 0x14021c566
0x14021bf81: mov r12, qword ptr [rax + 0x10]
0x14021bf85: call 0x140002200
0x14021bf8a: mov edx, 1
0x14021bf8f: mov rcx, r14
0x14021bf92: call 0x1400021c0
0x14021bf97: test rax, rax
0x14021bf9a: je 0x14021c644
0x14021bfa0: mov rsi, rax
0x14021bfa3: mov rcx, rax
0x14021bfa6: mov rdx, r12
0x14021bfa9: mov r8, r14
0x14021bfac: call 0x145d145fb
0x14021bfb1: jmp 0x14021c56e
0x14021bfb6: mov eax, 8
0x14021bfbb: xor edx, edx
0x14021bfbd: shl r14, 5
0x14021bfc1: add r14, rcx
0x14021bfc4: mov qword ptr [rbp + 0x148], rdx
0x14021bfcb: mov qword ptr [rbp + 0x150], rax
0x14021bfd2: mov qword ptr [rbp + 0x158], 0
0x14021bfdd: mov qword ptr [rbp - 0x48], rax
0x14021bfe1: lea rax, [rbp + 0x158]
0x14021bfe8: mov qword ptr [rbp - 0x58], rax
0x14021bfec: mov qword ptr [rbp - 0x50], 0
0x14021bff4: mov rdx, r14
0x14021bff7: lea r8, [rbp - 0x58]
0x14021bffb: call 0x140074260
0x14021c000: nop
0x14021c001: mov r13, rbx
0x14021c004: mov rax, qword ptr [rbp + 0x148]
0x14021c00b: mov qword ptr [rbp + 0x168], rax
0x14021c012: mov rax, qword ptr [rbp + 0x150]
0x14021c019: mov qword ptr [rbp + 0x198], rax
0x14021c020: mov rax, qword ptr [rbp + 0x158]
0x14021c027: mov qword ptr [rbp + 0x170], rax
0x14021c02e: mov ebx, dword ptr [rbp + 0x190]
0x14021c034: mov r14, qword ptr [rbp + 0x178]
0x14021c03b: mov rcx, qword ptr [rbp + 0x140]
0x14021c042: mov dword ptr [r13], ebx
0x14021c046: call 0x1400f1030
0x14021c04b: nop
0x14021c04c: mov rax, qword ptr [rbp + 0x140]
0x14021c053: mov rax, qword ptr [rax]
0x14021c056: test rax, rax
0x14021c059: mov r12, qword ptr [rbp + 0x180]
0x14021c060: je 0x14021c079
0x14021c062: mov rcx, qword ptr [r12 + 0x80]
0x14021c06a: imul rdx, rax, 0x70
0x14021c06e: mov r8d, 8
0x14021c074: call 0x1400021d0
0x14021c079: mov rax, qword ptr [rbp + 0x168]
0x14021c080: mov qword ptr [r12 + 0x78], rax
0x14021c085: mov rax, qword ptr [rbp + 0x198]
0x14021c08c: mov qword ptr [r12 + 0x80], rax
0x14021c094: mov rax, qword ptr [rbp + 0x170]
0x14021c09b: mov qword ptr [r12 + 0x88], rax
0x14021c0a3: jmp 0x14021c202
0x14021c0a8: mov eax, 8
0x14021c0ad: xor ecx, ecx
0x14021c0af: shl r14, 5
0x14021c0b3: add r14, r12
0x14021c0b6: mov qword ptr [rbp + 0x148], rcx
0x14021c0bd: mov qword ptr [rbp + 0x150], rax
0x14021c0c4: mov qword ptr [rbp + 0x158], 0
0x14021c0cf: mov qword ptr [rbp - 0x48], rax
0x14021c0d3: lea rax, [rbp + 0x158]
0x14021c0da: mov qword ptr [rbp - 0x58], rax
0x14021c0de: mov qword ptr [rbp - 0x50], 0
0x14021c0e6: mov rcx, r12
0x14021c0e9: mov rdx, r14
0x14021c0ec: lea r8, [rbp - 0x58]
0x14021c0f0: call 0x1400749a0
0x14021c0f5: nop
0x14021c0f6: mov r13, rbx
0x14021c0f9: mov rax, qword ptr [rbp + 0x148]
0x14021c100: mov qword ptr [rbp + 0x170], rax
0x14021c107: mov rax, qword ptr [rbp + 0x150]
0x14021c10e: mov qword ptr [rbp + 0x198], rax
0x14021c115: mov rax, qword ptr [rbp + 0x158]
0x14021c11c: mov qword ptr [rbp + 0x168], rax
0x14021c123: mov r12, qword ptr [rbp + 0x180]
0x14021c12a: mov ebx, dword ptr [rbp + 0x190]
0x14021c130: mov r14, qword ptr [rbp + 0x178]
0x14021c137: mov dword ptr [r13], ebx
0x14021c13b: mov rcx, qword ptr [r12 + 0x68]
0x14021c140: mov rax, qword ptr [r12 + 0x70]
0x14021c145: mov qword ptr [rbp + 0x190], rax
0x14021c14c: mov qword ptr [rbp + 0xf0], rcx
0x14021c153: mov qword ptr [rbp + 0x178], 0
0x14021c15e: nop
0x14021c160: mov rax, qword ptr [rbp + 0x178]
0x14021c167: cmp qword ptr [rbp + 0x190], rax
0x14021c16e: je 0x14021c18c
0x14021c170: inc rax
0x14021c173: mov qword ptr [rbp + 0x178], rax
0x14021c17a: lea rsi, [rcx + 0xf0]
0x14021c181: call 0x1400cd080
0x14021c186: nop
0x14021c187: mov rcx, rsi
0x14021c18a: jmp 0x14021c160
0x14021c18c: mov r12, qword ptr [rbp + 0x180]
0x14021c193: mov rax, qword ptr [r12 + 0x60]
0x14021c198: test rax, rax
0x14021c19b: je 0x14021c1b4
0x14021c19d: mov rcx, qword ptr [r12 + 0x68]
0x14021c1a2: imul rdx, rax, 0xf0
0x14021c1a9: mov r8d, 8
0x14021c1af: call 0x1400021d0
0x14021c1b4: mov rax, qword ptr [rbp + 0x170]
0x14021c1bb: mov qword ptr [r12 + 0x60], rax
0x14021c1c0: mov rax, qword ptr [rbp + 0x198]
0x14021c1c7: mov qword ptr [r12 + 0x68], rax
0x14021c1cc: mov rax, qword ptr [rbp + 0x168]
0x14021c1d3: mov qword ptr [r12 + 0x70], rax
0x14021c1d8: mov dword ptr [r13], ebx
0x14021c1dc: mov rcx, qword ptr [r12 + 0x68]
0x14021c1e1: mov rdx, qword ptr [r12 + 0x70]
0x14021c1e6: lea rax, [rbp + 0x167]
0x14021c1ed: mov qword ptr [rbp - 0x58], rax
0x14021c1f1: cmp rdx, 2
0x14021c1f5: lea rsi, [rip + 0x5cf4a1c]
0x14021c1fc: jae 0x14021c4f7
0x14021c202: mov dword ptr [r13], ebx
0x14021c206: inc qword ptr [r12 + 0x120]
0x14021c20e: lea rcx, [rbp + 0x110]
0x14021c215: call 0x140023810
0x14021c21a: nop
0x14021c21b: jmp 0x14021bc5d
0x14021c220: mov esi, 1
0x14021c225: xor r14d, r14d
0x14021c228: mov dword ptr [r13], ebx
0x14021c22c: mov rdx, qword ptr [r12 + 0x48]
0x14021c231: test rdx, rdx
0x14021c234: je 0x14021c246
0x14021c236: mov rcx, qword ptr [r12 + 0x50]
0x14021c23b: mov r8d, 1
0x14021c241: call 0x1400021d0
0x14021c246: mov qword ptr [r12 + 0x48], r14
0x14021c24b: mov qword ptr [rbp + 0x108], rsi
0x14021c252: mov qword ptr [r12 + 0x50], rsi
0x14021c257: mov qword ptr [r12 + 0x58], r14
0x14021c25c: mov rsi, qword ptr [rbp + 0x198]
0x14021c263: lea rax, [rsi - 3]
0x14021c267: cmp rax, 8
0x14021c26b: ja 0x14021c464
0x14021c271: lea rcx, [rip + 0x5cf82ec]
0x14021c278: movsxd rax, dword ptr [rcx + rax*4]
0x14021c27c: add rax, rcx
0x14021c27f: mov rsi, qword ptr [rbp + 0x198]
0x14021c286: jmp rax
0x14021c288: mov rcx, qword ptr [rbp + 0x188]
0x14021c28f: movzx eax, word ptr [rcx]
0x14021c292: xor eax, 0x666f
0x14021c297: movzx ecx, byte ptr [rcx + 2]
0x14021c29b: xor ecx, 0x66
0x14021c29e: mov esi, 3
0x14021c2a3: or cx, ax
0x14021c2a6: jne 0x14021c464
0x14021c2ac: jmp 0x14021c358
0x14021c2b1: mov rcx, qword ptr [rbp + 0x188]
0x14021c2b8: mov eax, dword ptr [rcx]
0x14021c2ba: mov edx, 0x736f6c63
0x14021c2bf: xor eax, edx
0x14021c2c1: movzx ecx, word ptr [rcx + 4]
0x14021c2c5: xor ecx, 0x6465
0x14021c2cb: or ecx, eax
0x14021c2cd: jne 0x14021c429
0x14021c2d3: jmp 0x14021c358
0x14021c2d8: mov rcx, qword ptr [rbp + 0x188]
0x14021c2df: mov eax, dword ptr [rcx]
0x14021c2e1: mov edx, 0x65646e65
0x14021c2e6: xor eax, edx
0x14021c2e8: movzx ecx, byte ptr [rcx + 4]
0x14021c2ec: xor ecx, 0x64
0x14021c2ef: or ecx, eax
0x14021c2f1: jne 0x14021c407
0x14021c2f7: jmp 0x14021c358
0x14021c2f9: mov rcx, qword ptr [rbp + 0x188]
0x14021c300: mov eax, dword ptr [rcx]
0x14021c302: mov edx, 0x75666572
0x14021c307: xor eax, edx
0x14021c309: mov ecx, dword ptr [rcx + 3]
0x14021c30c: mov edx, 0x64657375
0x14021c311: xor ecx, edx
0x14021c313: mov esi, 7
0x14021c318: or ecx, eax
0x14021c31a: jne 0x14021c464
0x14021c320: jmp 0x14021c358
0x14021c322: mov rcx, qword ptr [rbp + 0x188]
0x14021c329: mov rax, qword ptr [rcx]
0x14021c32c: movabs rdx, 0x616c696176616e75
0x14021c336: xor rax, rdx
0x14021c339: mov rcx, qword ptr [rcx + 3]
0x14021c33d: movabs rdx, 0x656c62616c696176
0x14021c347: xor rcx, rdx
0x14021c34a: or rcx, rax
0x14021c34d: mov esi, 0xb
0x14021c352: jne 0x14021c464
0x14021c358: mov dword ptr [r13], ebx
0x14021c35c: mov rsi, qword ptr [r12 + 0x80]
0x14021c364: mov r14, qword ptr [r12 + 0x88]
0x14021c36c: mov qword ptr [r12 + 0x88], 0
0x14021c378: test r14, r14
0x14021c37b: je 0x14021c3ed
0x14021c37d: add rsi, 0x50
0x14021c381: jmp 0x14021c38c
0x14021c383: add rsi, 0x70
0x14021c387: dec r14
0x14021c38a: je 0x14021c3ed
0x14021c38c: mov rdx, qword ptr [rsi - 0x50]
0x14021c390: test rdx, rdx
0x14021c393: je 0x14021c3a4
0x14021c395: mov rcx, qword ptr [rsi - 0x48]
0x14021c399: mov r8d, 1
0x14021c39f: call 0x1400021d0
0x14021c3a4: mov rdx, qword ptr [rsi - 0x38]
0x14021c3a8: test rdx, rdx
0x14021c3ab: je 0x14021c3bc
0x14021c3ad: mov rcx, qword ptr [rsi - 0x30]
0x14021c3b1: mov r8d, 1
0x14021c3b7: call 0x1400021d0
0x14021c3bc: mov rdx, qword ptr [rsi - 0x20]
0x14021c3c0: test rdx, rdx
0x14021c3c3: je 0x14021c3d4
0x14021c3c5: mov rcx, qword ptr [rsi - 0x18]
0x14021c3c9: mov r8d, 1
0x14021c3cf: call 0x1400021d0
0x14021c3d4: mov rdx, qword ptr [rsi - 8]
0x14021c3d8: test rdx, rdx
0x14021c3db: je 0x14021c383
0x14021c3dd: mov rcx, qword ptr [rsi]
0x14021c3e0: mov r8d, 1
0x14021c3e6: call 0x1400021d0
0x14021c3eb: jmp 0x14021c383
0x14021c3ed: cmp qword ptr [rbp + 0x198], 6
0x14021c3f5: je 0x14021c429
0x14021c3f7: mov rax, qword ptr [rbp + 0x198]
0x14021c3fe: mov rsi, rax
0x14021c401: cmp rax, 5
0x14021c405: jne 0x14021c464
0x14021c407: mov rcx, qword ptr [rbp + 0x188]
0x14021c40e: mov eax, dword ptr [rcx]
0x14021c410: mov edx, 0x65646e65
0x14021c415: xor eax, edx
0x14021c417: movzx ecx, byte ptr [rcx + 4]
0x14021c41b: xor ecx, 0x64
0x14021c41e: or ecx, eax
0x14021c420: mov esi, 5
0x14021c425: jne 0x14021c464
0x14021c427: jmp 0x14021c44c
0x14021c429: mov rcx, qword ptr [rbp + 0x188]
0x14021c430: mov eax, dword ptr [rcx]
0x14021c432: mov edx, 0x736f6c63
0x14021c437: xor eax, edx
0x14021c439: movzx ecx, word ptr [rcx + 4]
0x14021c43d: xor ecx, 0x6465
0x14021c443: mov esi, 6
0x14021c448: or ecx, eax
0x14021c44a: jne 0x14021c464
0x14021c44c: mov dword ptr [rbp - 0x58], 0x14
0x14021c453: mov rcx, qword ptr [rbp + 0xe8]
0x14021c45a: lea rdx, [rbp - 0x58]
0x14021c45e: call 0x14012c6a0
0x14021c463: nop
0x14021c464: cmp qword ptr [r12 + 0x28], 7
0x14021c46a: mov r14, qword ptr [rbp + 0x178]
0x14021c471: jb 0x14021c4b2
0x14021c473: mov rax, qword ptr [r12 + 0x20]
0x14021c478: mov ecx, dword ptr [rax]
0x14021c47a: mov edx, 0x6b636f6c
0x14021c47f: xor ecx, edx
0x14021c481: mov eax, dword ptr [rax + 3]
0x14021c484: mov edx, 0x3a64656b
0x14021c489: xor eax, edx
0x14021c48b: or eax, ecx
0x14021c48d: jne 0x14021c4b2
0x14021c48f: mov dword ptr [r13], ebx
0x14021c493: mov byte ptr [r12 + 0x12c], 1
0x14021c49c: mov rax, qword ptr [rbp + 0xe0]
0x14021c4a3: mov ecx, dword ptr [rbp + 0x13c]
0x14021c4a9: mov dword ptr [rax], ecx
0x14021c4ab: mov dword ptr [r14], 0
0x14021c4b2: mov dword ptr [r13], ebx
0x14021c4b6: mov rdx, qword ptr [r12]
0x14021c4ba: test rdx, rdx
0x14021c4bd: je 0x14021c4cf
0x14021c4bf: mov rcx, qword ptr [r12 + 8]
0x14021c4c4: mov r8d, 1
0x14021c4ca: call 0x1400021d0
0x14021c4cf: mov rax, qword ptr [rbp + 0x198]
0x14021c4d6: mov qword ptr [r12], rax
0x14021c4da: mov rax, qword ptr [rbp + 0x188]
0x14021c4e1: mov qword ptr [r12 + 8], rax
0x14021c4e6: mov qword ptr [r12 + 0x10], rsi
0x14021c4eb: lea rsi, [rip + 0x5cf4726]
0x14021c4f2: jmp 0x14021c202
0x14021c4f7: cmp rdx, 0x15
0x14021c4fb: jae 0x14021c507
0x14021c4fd: call 0x1401f67f0
0x14021c502: jmp 0x14021c202
0x14021c507: lea r8, [rbp - 0x58]
0x14021c50b: call 0x14006c3c0
0x14021c510: nop
0x14021c511: jmp 0x14021c202
0x14021c516: mov esi, 1
0x14021c51b: xor r14d, r14d
0x14021c51e: mov r12, rbx
0x14021c521: mov ebx, dword ptr [rbp + 0x190]
0x14021c527: mov dword ptr [r13], ebx
0x14021c52b: mov rdx, qword ptr [r12 + 0x18]
0x14021c530: test rdx, rdx
0x14021c533: jne 0x14021be17
0x14021c539: jmp 0x14021be27
0x14021c53e: mov esi, 1
0x14021c543: xor r14d, r14d
0x14021c546: mov r12, rbx
0x14021c549: mov ebx, dword ptr [rbp + 0x190]
0x14021c54f: mov dword ptr [r13], ebx
0x14021c553: mov rdx, qword ptr [r12 + 0x30]
0x14021c558: test rdx, rdx
0x14021c55b: jne 0x14021bf11
0x14021c561: jmp 0x14021bf21
0x14021c566: mov esi, 1
0x14021c56b: xor r14d, r14d
0x14021c56e: mov r12, rbx
0x14021c571: mov ebx, dword ptr [rbp + 0x190]
0x14021c577: mov dword ptr [r13], ebx
0x14021c57b: mov rdx, qword ptr [r12 + 0x48]
0x14021c580: test rdx, rdx
0x14021c583: jne 0x14021c236
0x14021c589: jmp 0x14021c246
0x14021c58e: lea rcx, [rbp + 0xb8]
0x14021c595: call 0x1400e61a0
0x14021c59a: nop
0x14021c59b: add rsp, 0x228
0x14021c5a2: pop rbx
0x14021c5a3: pop rdi
0x14021c5a4: pop rsi
0x14021c5a5: pop r12
0x14021c5a7: pop r13
0x14021c5a9: pop r14
0x14021c5ab: pop r15
0x14021c5ad: pop rbp
0x14021c5ae: ret
0x14021c5af: xor ecx, ecx
0x14021c5b1: mov rdx, qword ptr [rbp + 0x188]
0x14021c5b8: call 0x145eb6fcb
0x14021c5bd: nop
0x14021c5be: jmp 0x14021c611
0x14021c5c0: xor esi, esi
0x14021c5c2: mov rcx, rsi
0x14021c5c5: mov rdx, r13
0x14021c5c8: call 0x145eb6fcb
0x14021c5cd: nop
0x14021c5ce: jmp 0x14021c611
0x14021c5d0: xor esi, esi
0x14021c5d2: mov rcx, rsi
0x14021c5d5: mov rdx, r13
0x14021c5d8: call 0x145eb6fcb
0x14021c5dd: nop
0x14021c5de: jmp 0x14021c611
0x14021c5e0: xor ecx, ecx
0x14021c5e2: mov rdx, qword ptr [rbp + 0xf8]
0x14021c5e9: call 0x145eb6fcb
0x14021c5ee: nop
0x14021c5ef: jmp 0x14021c611
0x14021c5f1: xor ecx, ecx
0x14021c5f3: mov rdx, qword ptr [rbp + 0x100]
0x14021c5fa: call 0x145eb6fcb
0x14021c5ff: nop
0x14021c600: jmp 0x14021c611
0x14021c602: xor ecx, ecx
0x14021c604: mov rdx, qword ptr [rbp + 0x108]
0x14021c60b: call 0x145eb6fcb
0x14021c610: nop
0x14021c611: ud2
0x14021c613: mov rax, qword ptr [rbp + 0x198]
0x14021c61a: mov qword ptr [rbp + 0x188], rax
0x14021c621: mov ecx, 1
0x14021c626: jmp 0x14021c5b1
0x14021c628: mov qword ptr [rbp + 0xf8], r14
0x14021c62f: mov ecx, 1
0x14021c634: jmp 0x14021c5e2
0x14021c636: mov qword ptr [rbp + 0x100], r14
0x14021c63d: mov ecx, 1
0x14021c642: jmp 0x14021c5f3
0x14021c644: mov qword ptr [rbp + 0x108], r14
0x14021c64b: mov ecx, 1
0x14021c650: jmp 0x14021c604
