; 0.115.0 selected UI resource/dispatch/toggle/cycle/capacity/lifetime ranges.
; Other ECS acquisition and excluded host/join branches are omitted.
0x000000014021a1c0: push rbp
0x000000014021a1c1: push r15
0x000000014021a1c3: push r14
0x000000014021a1c5: push r13
0x000000014021a1c7: push r12
0x000000014021a1c9: push rsi
0x000000014021a1ca: push rdi
0x000000014021a1cb: push rbx
0x000000014021a1cc: sub rsp, 0x308
0x000000014021a1d3: lea rbp, [rsp + 0x80]
0x000000014021a1db: mov qword ptr [rbp + 0x280], 0xfffffffffffffffe
0x000000014021a1e6: mov rax, qword ptr [rbp + 0x2f8]
0x000000014021a1ed: mov rcx, qword ptr [rbp + 0x2f0]
0x000000014021a1f4: mov r13, qword ptr [rdx]
0x000000014021a1f7: mov r12, qword ptr [rdx + 8]
0x000000014021a1fb: mov r10d, dword ptr [rdx + 0x14]
0x000000014021a1ff: mov r15, qword ptr [r8]
0x000000014021a202: mov rdi, qword ptr [r8 + 0x10]
0x000000014021a206: mov r8d, dword ptr [r8 + 0x1c]
0x000000014021a20a: mov dword ptr [rbp + 0x278], r8d
0x000000014021a211: mov r8, qword ptr [r9]
0x000000014021a214: mov rcx, qword ptr [rcx]
0x000000014021a217: mov qword ptr [rbp + 0x250], rcx
0x000000014021a21e: mov rax, qword ptr [rax]
0x000000014021a221: mov qword ptr [rbp + 0x110], rax
0x000000014021a690: mov dword ptr [rbp + 0x26c], r10d
0x000000014021a697: mov rcx, qword ptr [rbp + 0x240]
0x000000014021a69e: add rcx, r9
0x000000014021a6a1: shl r9, 4
0x000000014021a6a5: add r9, qword ptr [rbp + 0x248]
0x000000014021a6ac: test rcx, rcx
0x000000014021a6af: je 0x14021b3ee
0x000000014021a6b5: cmp byte ptr [rcx], 0
0x000000014021a6b8: jne 0x14021a2f0
0x000000014021a6be: mov qword ptr [rbp + 0x270], r11
0x000000014021a6c5: movzx ecx, byte ptr [r9]
0x000000014021a6c9: lea rdx, [rip + 0x5cf9e5c]
0x000000014021a6d0: movsxd rcx, dword ptr [rdx + rcx*4]
0x000000014021a6d4: add rcx, rdx
0x000000014021a6d7: jmp rcx
0x000000014021a710: movzx eax, byte ptr [r15 + 0x12e]
0x000000014021a718: mov ebx, dword ptr [rbp + 0x278]
0x000000014021a71e: mov dword ptr [rdi], ebx
0x000000014021a720: xor al, 1
0x000000014021a722: mov byte ptr [r15 + 0x12e], al
0x000000014021a729: jmp 0x14021ae00
0x000000014021a754: movzx eax, byte ptr [r15 + 0x12f]
0x000000014021a75c: mov ebx, dword ptr [rbp + 0x278]
0x000000014021a762: mov dword ptr [rdi], ebx
0x000000014021a764: xor al, 1
0x000000014021a766: mov byte ptr [r15 + 0x12f], al
0x000000014021a76d: jmp 0x14021ae00
0x000000014021a869: movzx eax, byte ptr [r15 + 0x130]
0x000000014021a871: mov ebx, dword ptr [rbp + 0x278]
0x000000014021a877: mov dword ptr [rdi], ebx
0x000000014021a879: xor al, 1
0x000000014021a87b: mov byte ptr [r15 + 0x130], al
0x000000014021a882: jmp 0x14021ae00
0x000000014021a887: mov ebx, dword ptr [rbp + 0x278]
0x000000014021a88d: mov dword ptr [rdi], ebx
0x000000014021a88f: mov byte ptr [r15 + 0x12c], 0
0x000000014021a897: jmp 0x14021ae00
0x000000014021a8d9: mov qword ptr [rbp + 0x230], r13
0x000000014021a8e0: mov rbx, qword ptr [r15 + 0x68]
0x000000014021a8e4: imul rax, qword ptr [r15 + 0x70], 0xf0
0x000000014021a8ec: mov qword ptr [rbp + 0x180], 0
0x000000014021a8f7: mov qword ptr [rbp + 0x188], 8
0x000000014021a902: mov qword ptr [rbp + 0x190], 0
0x000000014021a90d: add rax, rbx
0x000000014021a910: mov qword ptr [rbp + 0x220], rax
0x000000014021a917: xor r14d, r14d
0x000000014021a91a: jmp 0x14021a946
0x000000014021a91c: nop dword ptr [rax]
0x000000014021a920: mov rax, qword ptr [rbp + 0x188]
0x000000014021a927: lea rcx, [r14 + r14*2]
0x000000014021a92b: mov rdx, qword ptr [rbp - 0x48]
0x000000014021a92f: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x000000014021a934: movups xmm0, xmmword ptr [rbp - 0x58]
0x000000014021a938: movups xmmword ptr [rax + rcx*8], xmm0
0x000000014021a93c: inc r14
0x000000014021a93f: mov qword ptr [rbp + 0x190], r14
0x000000014021a946: mov rdi, qword ptr [rbp + 0x188]
0x000000014021a94d: mov qword ptr [rbp + 0x218], r14
0x000000014021a954: lea rax, [r14*8]
0x000000014021a95c: lea r13, [rax + rax*2]
0x000000014021a960: mov r14, rbx
0x000000014021a963: cmp r14, qword ptr [rbp + 0x220]
0x000000014021a96a: je 0x14021abbc
0x000000014021a970: lea rbx, [r14 + 0xf0]
0x000000014021a977: cmp qword ptr [rbp + 0x218], 0
0x000000014021a97f: je 0x14021aa3f
0x000000014021a985: mov qword ptr [rbp + 0x258], rbx
0x000000014021a98c: mov r12, qword ptr [r14 + 0x98]
0x000000014021a993: mov rbx, qword ptr [r14 + 0xa0]
0x000000014021a99a: xor r15d, r15d
0x000000014021a99d: jmp 0x14021a9a9
0x000000014021a99f: nop
0x000000014021a9a0: add r15, 0x18
0x000000014021a9a4: cmp r13, r15
0x000000014021a9a7: je 0x14021a9f0
0x000000014021a9a9: cmp qword ptr [rdi + r15 + 0x10], rbx
0x000000014021a9ae: jne 0x14021a9a0
0x000000014021a9b0: mov rcx, qword ptr [rdi + r15 + 8]
0x000000014021a9b5: mov rdx, r12
0x000000014021a9b8: mov r8, rbx
0x000000014021a9bb: call 0x145d14601
0x000000014021a9c0: test eax, eax
0x000000014021a9c2: jne 0x14021a9a0
0x000000014021a9c4: mov r14, qword ptr [rbp + 0x258]
0x000000014021a9cb: mov r12, qword ptr [rbp + 0x200]
0x000000014021a9d2: mov r15, qword ptr [rbp + 0x228]
0x000000014021a9d9: cmp r14, qword ptr [rbp + 0x220]
0x000000014021a9e0: jne 0x14021a970
0x000000014021a9e2: jmp 0x14021abbc
0x000000014021a9e7: nop word ptr [rax + rax]
0x000000014021a9f0: add r14, 0x90
0x000000014021a9f7: mov r12, qword ptr [rbp + 0x200]
0x000000014021a9fe: mov r15, qword ptr [rbp + 0x228]
0x000000014021aa05: mov rbx, qword ptr [rbp + 0x258]
0x000000014021aa0c: lea rcx, [rbp - 0x58]
0x000000014021aa10: mov rdx, r14
0x000000014021aa13: call 0x145ce7810
0x000000014021aa18: nop
0x000000014021aa19: mov r14, qword ptr [rbp + 0x190]
0x000000014021aa20: cmp r14, qword ptr [rbp + 0x180]
0x000000014021aa27: jne 0x14021a920
0x000000014021aa2d: lea rcx, [rbp + 0x180]
0x000000014021aa34: call 0x145d47c30
0x000000014021aa39: nop
0x000000014021aa3a: jmp 0x14021a920
0x000000014021aa3f: add r14, 0x90
0x000000014021aa46: jmp 0x14021aa0c
0x000000014021ab6e: movzx eax, byte ptr [r9 + 1]
0x000000014021ab73: mov ebx, dword ptr [rbp + 0x278]
0x000000014021ab79: mov dword ptr [rdi], ebx
0x000000014021ab7b: mov byte ptr [r15 + 0x133], al
0x000000014021ab82: jmp 0x14021ae00
0x000000014021abbc: mov rax, qword ptr [rbp + 0x190]
0x000000014021abc3: mov qword ptr [rbp + 0x1f0], rax
0x000000014021abca: movups xmm0, xmmword ptr [rbp + 0x180]
0x000000014021abd1: movaps xmmword ptr [rbp + 0x1e0], xmm0
0x000000014021abd8: cmp qword ptr [r15 + 0x108], -1
0x000000014021abe0: je 0x14021ac8e
0x000000014021abe6: mov rbx, qword ptr [rbp + 0x1f0]
0x000000014021abed: mov r14, 0xffffffffffffffff
0x000000014021abf4: test rbx, rbx
0x000000014021abf7: mov r13, qword ptr [rbp + 0x230]
0x000000014021abfe: je 0x14021ad39
0x000000014021ac04: mov r14, qword ptr [rbp + 0x1e8]
0x000000014021ac0b: lea rax, [rbx*8]
0x000000014021ac13: lea rdi, [rax + rax*2]
0x000000014021ac17: mov r12, qword ptr [r15 + 0x118]
0x000000014021ac1e: add r14, 0x18
0x000000014021ac22: mov r15d, 1
0x000000014021ac28: jmp 0x14021ac41
0x000000014021ac2a: nop word ptr [rax + rax]
0x000000014021ac30: add r14, 0x18
0x000000014021ac34: inc r15
0x000000014021ac37: add rdi, -0x18
0x000000014021ac3b: je 0x14021ad14
0x000000014021ac41: cmp qword ptr [r14 - 8], r12
0x000000014021ac45: jne 0x14021ac30
0x000000014021ac47: mov rcx, qword ptr [r14 - 0x10]
0x000000014021ac4b: mov rax, qword ptr [rbp + 0x148]
0x000000014021ac52: mov rdx, qword ptr [rax]
0x000000014021ac55: mov r8, r12
0x000000014021ac58: call 0x145d14601
0x000000014021ac5d: test eax, eax
0x000000014021ac5f: jne 0x14021ac30
0x000000014021ac61: cmp r15, rbx
0x000000014021ac64: mov r12, qword ptr [rbp + 0x200]
0x000000014021ac6b: mov rdi, qword ptr [rbp + 0x260]
0x000000014021ac72: jae 0x14021b118
0x000000014021ac78: lea rcx, [rbp - 0x58]
0x000000014021ac7c: mov rdx, r14
0x000000014021ac7f: call 0x145ce7810
0x000000014021ac84: nop
0x000000014021ac85: mov r15, qword ptr [rbp + 0x228]
0x000000014021ac8c: jmp 0x14021acbd
0x000000014021ac8e: mov rbx, qword ptr [rbp + 0x1f0]
0x000000014021ac95: test rbx, rbx
0x000000014021ac98: mov r13, qword ptr [rbp + 0x230]
0x000000014021ac9f: je 0x14021ad32
0x000000014021aca5: mov rdx, qword ptr [rbp + 0x1e8]
0x000000014021acac: lea rcx, [rbp - 0x58]
0x000000014021acb0: call 0x145ce7810
0x000000014021acb5: nop
0x000000014021acb6: mov rdi, qword ptr [rbp + 0x260]
0x000000014021acbd: mov r14, qword ptr [rbp - 0x58]
0x000000014021acc1: lea rax, [rbp - 0x50]
0x000000014021acc5: movups xmm0, xmmword ptr [rax]
0x000000014021acc8: movaps xmmword ptr [rbp + 0x90], xmm0
0x000000014021accf: jmp 0x14021ad42
0x000000014021ad14: mov r12, qword ptr [rbp + 0x200]
0x000000014021ad1b: mov r15, qword ptr [rbp + 0x228]
0x000000014021ad22: mov rdi, qword ptr [rbp + 0x260]
0x000000014021ad29: mov r14, 0xffffffffffffffff
0x000000014021ad30: jmp 0x14021ad42
0x000000014021ad32: mov r14, 0xffffffffffffffff
0x000000014021ad39: xor ebx, ebx
0x000000014021ad3b: mov rdi, qword ptr [rbp + 0x260]
0x000000014021ad42: mov eax, dword ptr [rbp + 0x278]
0x000000014021ad48: mov dword ptr [rdi], eax
0x000000014021ad4a: mov rdx, qword ptr [r15 + 0x108]
0x000000014021ad51: cmp rdx, -1
0x000000014021ad55: je 0x14021ad71
0x000000014021ad57: test rdx, rdx
0x000000014021ad5a: je 0x14021ad71
0x000000014021ad5c: mov rax, qword ptr [rbp + 0x148]
0x000000014021ad63: mov rcx, qword ptr [rax]
0x000000014021ad66: mov r8d, 1
0x000000014021ad6c: call 0x1400021d0
0x000000014021ad71: mov qword ptr [r15 + 0x108], r14
0x000000014021ad78: movaps xmm0, xmmword ptr [rbp + 0x90]
0x000000014021ad7f: mov rax, qword ptr [rbp + 0x148]
0x000000014021ad86: movups xmmword ptr [rax], xmm0
0x000000014021ad89: mov r14, qword ptr [rbp + 0x1e8]
0x000000014021ad90: test rbx, rbx
0x000000014021ad93: je 0x14021adc2
0x000000014021ad95: lea rdi, [r14 + 8]
0x000000014021ad99: jmp 0x14021ada9
0x000000014021ad9b: nop dword ptr [rax + rax]
0x000000014021ada0: add rdi, 0x18
0x000000014021ada4: dec rbx
0x000000014021ada7: je 0x14021adc2
0x000000014021ada9: mov rdx, qword ptr [rdi - 8]
0x000000014021adad: test rdx, rdx
0x000000014021adb0: je 0x14021ada0
0x000000014021adb2: mov rcx, qword ptr [rdi]
0x000000014021adb5: mov r8d, 1
0x000000014021adbb: call 0x1400021d0
0x000000014021adc0: jmp 0x14021ada0
0x000000014021adc2: mov rax, qword ptr [rbp + 0x1e0]
0x000000014021adc9: test rax, rax
0x000000014021adcc: je 0x14021ade4
0x000000014021adce: shl rax, 3
0x000000014021add2: lea rdx, [rax + rax*2]
0x000000014021add6: mov r8d, 8
0x000000014021addc: mov rcx, r14
0x000000014021addf: call 0x1400021d0
0x000000014021ade4: mov rdi, qword ptr [rbp + 0x260]
0x000000014021adeb: mov ebx, dword ptr [rbp + 0x278]
0x000000014021adf1: nop word ptr cs:[rax + rax]
0x000000014021ae00: mov r11, qword ptr [rbp + 0x270]
0x000000014021ae07: mov dword ptr [rdi], ebx
0x000000014021ae09: inc qword ptr [r15 + 0x120]
0x000000014021ae10: mov rbx, qword ptr [rbp + 0x140]
0x000000014021ae17: jmp 0x14021a2f0
0x000000014021b118: mov r15, qword ptr [rbp + 0x228]
0x000000014021b11f: mov r14, 0xffffffffffffffff
0x000000014021b126: jmp 0x14021ad42
