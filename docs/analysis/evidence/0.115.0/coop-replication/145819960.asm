0x145819960: push rbp
0x145819961: push r15
0x145819963: push r14
0x145819965: push r13
0x145819967: push r12
0x145819969: push rsi
0x14581996a: push rdi
0x14581996b: push rbx
0x14581996c: sub rsp, 0x538
0x145819973: lea rbp, [rsp + 0x80]
0x14581997b: movaps xmmword ptr [rbp + 0x4a0], xmm8
0x145819983: movaps xmmword ptr [rbp + 0x490], xmm7
0x14581998a: movaps xmmword ptr [rbp + 0x480], xmm6
0x145819991: mov qword ptr [rbp + 0x478], 0xfffffffffffffffe
0x14581999c: mov qword ptr [rbp + 0x168], rcx
0x1458199a3: mov qword ptr [rbp + 0x430], rdx
0x1458199aa: mov qword ptr [rbp + 0x438], r8
0x1458199b1: mov qword ptr [rbp + 0x440], 0
0x1458199bc: mov byte ptr [rbp + 0x448], 1
0x1458199c3: lea rcx, [rbp + 0x430]
0x1458199ca: call 0x145b7c560
0x1458199cf: movzx eax, al
0x1458199d2: dec eax
0x1458199d4: cmp eax, 0x12
0x1458199d7: ja 0x14581a7c9
0x1458199dd: lea rcx, [rip + 0x14b16f4]
0x1458199e4: movsxd rax, dword ptr [rcx + rax*4]
0x1458199e8: add rax, rcx
0x1458199eb: jmp rax
0x1458199ed: lea rsi, [rbp + 0x430]
0x1458199f4: mov rcx, rsi
0x1458199f7: call 0x145b7c850
0x1458199fc: mov dword ptr [rbp + 0x3d8], eax
0x145819a02: lea rcx, [rbp + 0x48]
0x145819a06: mov rdx, rsi
0x145819a09: call 0x145b7c600
0x145819a0e: nop
0x145819a0f: lea rcx, [rbp + 0x190]
0x145819a16: mov rdx, rsi
0x145819a19: call 0x145b7c600
0x145819a1e: nop
0x145819a1f: movzx edi, byte ptr [rbp + 0x48]
0x145819a23: movzx eax, byte ptr [rbp + 0x49]
0x145819a27: mov dword ptr [rbp + 0x460], eax
0x145819a2d: mov eax, dword ptr [rbp + 0x4a]
0x145819a30: movzx ecx, word ptr [rbp + 0x4e]
0x145819a34: shl rcx, 0x20
0x145819a38: or rcx, rax
0x145819a3b: mov rax, qword ptr [rbp + 0x50]
0x145819a3f: mov qword ptr [rbp + 0x428], rax
0x145819a46: mov r13, qword ptr [rbp + 0x58]
0x145819a4a: movzx eax, word ptr [rbp + 0x190]
0x145819a51: mov word ptr [rbp + 0x3f8], ax
0x145819a58: mov rax, qword ptr [rbp + 0x192]
0x145819a5f: mov qword ptr [rbp + 0x400], rax
0x145819a66: mov rax, qword ptr [rbp + 0x198]
0x145819a6d: mov qword ptr [rbp + 0x406], rax
0x145819a74: mov rax, qword ptr [rbp + 0x1a0]
0x145819a7b: mov qword ptr [rbp + 0x3f0], rax
0x145819a82: movabs rax, 0x8000000000000000
0x145819a8c: mov qword ptr [rbp + 0x468], rax
0x145819a93: mov dword ptr [rbp + 0x458], eax
0x145819a99: mov dword ptr [rbp + 0x450], eax
0x145819a9f: mov r12d, dword ptr [rbp + 0x3d8]
0x145819aa6: jmp 0x14581b1ce
0x145819aab: mov qword ptr [rbp + 0x400], 0
0x145819ab6: mov qword ptr [rbp + 0x408], 8
0x145819ac1: mov qword ptr [rbp + 0x410], 0
0x145819acc: lea rcx, [rbp + 0x430]
0x145819ad3: mov edx, 0xf
0x145819ad8: call 0x145b7ca30
0x145819add: mov qword ptr [rbp + 0x468], rax
0x145819ae4: mov ebx, 8
0x145819ae9: lea r12, [rbp + 0x1a8]
0x145819af0: xor r13d, r13d
0x145819af3: lea rdi, [rbp + 0x430]
0x145819afa: xor esi, esi
0x145819afc: jmp 0x145819b30
0x145819afe: nop
0x145819b00: inc rsi
0x145819b03: mov rbx, qword ptr [rbp + 0x408]
0x145819b0a: imul rcx, r13, 0x98
0x145819b11: add rcx, rbx
0x145819b14: mov r8d, 0x98
0x145819b1a: lea rdx, [rbp + 0x190]
0x145819b21: call 0x145d145fb
0x145819b26: inc r13
0x145819b29: mov qword ptr [rbp + 0x410], r13
0x145819b30: cmp rsi, qword ptr [rbp + 0x468]
0x145819b37: jae 0x14581afdd
0x145819b3d: mov rcx, rdi
0x145819b40: call 0x145b7c8a0
0x145819b45: nop
0x145819b46: mov r13, rax
0x145819b49: lea rcx, [rbp + 0x380]
0x145819b50: mov rdx, rdi
0x145819b53: call 0x145b7c600
0x145819b58: nop
0x145819b59: mov rcx, rdi
0x145819b5c: call 0x145b7c560
0x145819b61: nop
0x145819b62: mov r14b, al
0x145819b65: mov rcx, rdi
0x145819b68: call 0x145b7c560
0x145819b6d: nop
0x145819b6e: mov r15b, al
0x145819b71: mov rcx, rdi
0x145819b74: call 0x145b7c8f0
0x145819b79: nop
0x145819b7a: test al, al
0x145819b7c: je 0x145819b90
0x145819b7e: lea rcx, [rbp + 0x48]
0x145819b82: mov rdx, rdi
0x145819b85: call 0x145b7bf90
0x145819b8a: nop
0x145819b8b: jmp 0x145819b98
0x145819b8d: nop dword ptr [rax]
0x145819b90: mov qword ptr [rbp + 0x48], 0xffffffffffffffff
0x145819b98: mov rcx, rdi
0x145819b9b: call 0x145b7c850
0x145819ba0: nop
0x145819ba1: mov ebx, eax
0x145819ba3: mov rcx, rdi
0x145819ba6: call 0x145b7c8f0
0x145819bab: nop
0x145819bac: mov qword ptr [rbp + 0x218], r13
0x145819bb3: movups xmm0, xmmword ptr [rbp + 0x380]
0x145819bba: movaps xmmword ptr [rbp + 0x190], xmm0
0x145819bc1: mov rcx, qword ptr [rbp + 0x390]
0x145819bc8: mov qword ptr [rbp + 0x1a0], rcx
0x145819bcf: mov byte ptr [rbp + 0x225], r14b
0x145819bd6: mov byte ptr [rbp + 0x226], r15b
0x145819bdd: movups xmm0, xmmword ptr [rbp + 0xa8]
0x145819be4: movups xmmword ptr [r12 + 0x60], xmm0
0x145819bea: movups xmm0, xmmword ptr [rbp + 0x98]
0x145819bf1: movups xmmword ptr [r12 + 0x50], xmm0
0x145819bf7: movups xmm0, xmmword ptr [rbp + 0x88]
0x145819bfe: movups xmmword ptr [r12 + 0x40], xmm0
0x145819c04: movups xmm0, xmmword ptr [rbp + 0x48]
0x145819c08: movups xmm1, xmmword ptr [rbp + 0x58]
0x145819c0c: movups xmm2, xmmword ptr [rbp + 0x68]
0x145819c10: movups xmm3, xmmword ptr [rbp + 0x78]
0x145819c14: movups xmmword ptr [r12 + 0x30], xmm3
0x145819c1a: movups xmmword ptr [r12 + 0x20], xmm2
0x145819c20: movups xmmword ptr [r12 + 0x10], xmm1
0x145819c26: movups xmmword ptr [r12], xmm0
0x145819c2b: mov dword ptr [rbp + 0x220], ebx
0x145819c31: mov byte ptr [rbp + 0x224], al
0x145819c37: mov r13, qword ptr [rbp + 0x410]
0x145819c3e: cmp r13, qword ptr [rbp + 0x400]
0x145819c45: jne 0x145819b00
0x145819c4b: lea rcx, [rbp + 0x400]
0x145819c52: call 0x145d71a20
0x145819c57: nop
0x145819c58: jmp 0x145819b00
0x145819c5d: lea rsi, [rbp + 0x430]
0x145819c64: mov rcx, rsi
0x145819c67: call 0x145b7c5b0
0x145819c6c: movaps xmm6, xmm0
0x145819c6f: mov rcx, rsi
0x145819c72: call 0x145b7c560
0x145819c77: mov byte ptr [rbp + 0x468], al
0x145819c7d: mov rcx, rsi
0x145819c80: call 0x145b7c8f0
0x145819c85: mov byte ptr [rbp + 0x460], al
0x145819c8b: mov rcx, rsi
0x145819c8e: call 0x145b7c850
0x145819c93: mov dword ptr [rbp + 0x458], eax
0x145819c99: mov rcx, rsi
0x145819c9c: call 0x145b7c8f0
0x145819ca1: mov byte ptr [rbp + 0x450], al
0x145819ca7: mov rcx, rsi
0x145819caa: call 0x145b7c850
0x145819caf: mov dword ptr [rbp + 0x428], eax
0x145819cb5: mov rcx, rsi
0x145819cb8: call 0x145b7c850
0x145819cbd: mov r13d, eax
0x145819cc0: mov rcx, rsi
0x145819cc3: call 0x145b7c850
0x145819cc8: mov ebx, eax
0x145819cca: mov rcx, rsi
0x145819ccd: call 0x145b7c850
0x145819cd2: mov edi, eax
0x145819cd4: mov rcx, rsi
0x145819cd7: call 0x145b7c850
0x145819cdc: mov r14d, eax
0x145819cdf: mov rcx, rsi
0x145819ce2: call 0x145b7c5b0
0x145819ce7: movaps xmm7, xmm0
0x145819cea: mov rcx, rsi
0x145819ced: call 0x145b7c5b0
0x145819cf2: movaps xmm8, xmm0
0x145819cf6: mov rcx, rsi
0x145819cf9: call 0x145b7c8f0
0x145819cfe: mov r15b, al
0x145819d01: mov rcx, rsi
0x145819d04: call 0x145b7c560
0x145819d09: mov r12b, al
0x145819d0c: lea rcx, [rbp + 0x190]
0x145819d13: mov rdx, rsi
0x145819d16: call 0x145b7c600
0x145819d1b: movss dword ptr [rbp + 0x1f0], xmm6
0x145819d23: movzx eax, byte ptr [rbp + 0x468]
0x145819d2a: mov byte ptr [rbp + 0x217], al
0x145819d30: movzx eax, byte ptr [rbp + 0x460]
0x145819d37: mov byte ptr [rbp + 0x214], al
0x145819d3d: mov eax, dword ptr [rbp + 0x458]
0x145819d43: mov dword ptr [rbp + 0x1f4], eax
0x145819d49: movzx eax, byte ptr [rbp + 0x450]
0x145819d50: mov byte ptr [rbp + 0x215], al
0x145819d56: mov eax, dword ptr [rbp + 0x428]
0x145819d5c: mov dword ptr [rbp + 0x1f8], eax
0x145819d62: mov dword ptr [rbp + 0x1fc], r13d
0x145819d69: mov dword ptr [rbp + 0x200], ebx
0x145819d6f: mov dword ptr [rbp + 0x204], edi
0x145819d75: mov dword ptr [rbp + 0x208], r14d
0x145819d7c: movss dword ptr [rbp + 0x20c], xmm7
0x145819d84: movss dword ptr [rbp + 0x210], xmm8
0x145819d8d: mov byte ptr [rbp + 0x216], r15b
0x145819d94: mov byte ptr [rbp + 0x218], r12b
0x145819d9b: mov qword ptr [rbp + 0x1a8], 0
0x145819da6: mov qword ptr [rbp + 0x1b0], 4
0x145819db1: xorps xmm0, xmm0
0x145819db4: movups xmmword ptr [rbp + 0x1b8], xmm0
0x145819dbb: mov qword ptr [rbp + 0x1c8], 4
0x145819dc6: movups xmmword ptr [rbp + 0x1d0], xmm0
0x145819dcd: mov qword ptr [rbp + 0x1e0], 4
0x145819dd8: mov qword ptr [rbp + 0x1e8], 0
0x145819de3: mov edx, 8
0x145819de8: mov rcx, rsi
0x145819deb: call 0x145b7ca30
0x145819df0: nop
0x145819df1: mov rbx, rax
0x145819df4: lea r14, [rbp + 0x1a8]
0x145819dfb: xor edi, edi
0x145819dfd: lea r15, [rbp + 0x430]
0x145819e04: jmp 0x145819e2d
0x145819e06: nop word ptr cs:[rax + rax]
0x145819e10: inc rdi
0x145819e13: mov rax, qword ptr [rbp + 0x1b0]
0x145819e1a: mov dword ptr [rax + r13*8], r12d
0x145819e1e: mov dword ptr [rax + r13*8 + 4], esi
0x145819e23: inc r13
0x145819e26: mov qword ptr [rbp + 0x1b8], r13
0x145819e2d: cmp rdi, rbx
0x145819e30: jae 0x14581ae8b
0x145819e36: mov rcx, r15
0x145819e39: call 0x145b7c850
0x145819e3e: nop
0x145819e3f: mov r12d, eax
0x145819e42: mov rcx, r15
0x145819e45: call 0x145b7c850
0x145819e4a: nop
0x145819e4b: mov esi, eax
0x145819e4d: mov r13, qword ptr [rbp + 0x1b8]
0x145819e54: cmp r13, qword ptr [rbp + 0x1a8]
0x145819e5b: jne 0x145819e10
0x145819e5d: mov rcx, r14
0x145819e60: call 0x145d405c0
0x145819e65: nop
0x145819e66: jmp 0x145819e10
0x145819e68: mov qword ptr [rbp + 0x190], 0
0x145819e73: mov qword ptr [rbp + 0x198], 4
0x145819e7e: mov qword ptr [rbp + 0x1a0], 0
0x145819e89: lea rcx, [rbp + 0x430]
0x145819e90: mov edx, 9
0x145819e95: call 0x145b7ca30
0x145819e9a: nop
0x145819e9b: mov rsi, rax
0x145819e9e: xor r13d, r13d
0x145819ea1: lea rdi, [rbp + 0x430]
0x145819ea8: lea rbx, [rbp + 0x190]
0x145819eaf: xor r12d, r12d
0x145819eb2: jmp 0x145819eee
0x145819eb4: nop word ptr cs:[rax + rax]
0x145819ec0: inc r12
0x145819ec3: mov rax, qword ptr [rbp + 0x198]
0x145819eca: lea rcx, [r13*2]
0x145819ed2: add rcx, r13
0x145819ed5: mov dword ptr [rax + rcx*4], r14d
0x145819ed9: movss dword ptr [rax + rcx*4 + 4], xmm6
0x145819edf: mov byte ptr [rax + rcx*4 + 8], r15b
0x145819ee4: inc r13
0x145819ee7: mov qword ptr [rbp + 0x1a0], r13
0x145819eee: cmp r12, rsi
0x145819ef1: jae 0x14581af91
0x145819ef7: mov rcx, rdi
0x145819efa: call 0x145b7c850
0x145819eff: nop
0x145819f00: mov r14d, eax
0x145819f03: mov rcx, rdi
0x145819f06: call 0x145b7c5b0
0x145819f0b: nop
0x145819f0c: movaps xmm6, xmm0
0x145819f0f: mov rcx, rdi
0x145819f12: call 0x145b7c8f0
0x145819f17: nop
0x145819f18: mov r15d, eax
0x145819f1b: mov r13, qword ptr [rbp + 0x1a0]
0x145819f22: cmp r13, qword ptr [rbp + 0x190]
0x145819f29: jne 0x145819ec0
0x145819f2b: mov rcx, rbx
0x145819f2e: call 0x145d40470
0x145819f33: nop
0x145819f34: jmp 0x145819ec0
0x145819f36: lea rcx, [rbp + 0x190]
0x145819f3d: lea rdx, [rbp + 0x430]
0x145819f44: call 0x145b7c600
0x145819f49: movzx edi, byte ptr [rbp + 0x190]
0x145819f50: movzx eax, byte ptr [rbp + 0x191]
0x145819f57: mov dword ptr [rbp + 0x460], eax
0x145819f5d: mov eax, dword ptr [rbp + 0x192]
0x145819f63: movzx ecx, word ptr [rbp + 0x196]
0x145819f6a: shl rcx, 0x20
0x145819f6e: or rcx, rax
0x145819f71: mov rax, qword ptr [rbp + 0x198]
0x145819f78: mov qword ptr [rbp + 0x428], rax
0x145819f7f: mov r13, qword ptr [rbp + 0x1a0]
0x145819f86: movabs rax, 0x8000000000000004
0x145819f90: jmp 0x14581b1bb
0x145819f95: mov qword ptr [rbp + 0x190], 0
0x145819fa0: mov qword ptr [rbp + 0x198], 4
0x145819fab: mov qword ptr [rbp + 0x1a0], 0
0x145819fb6: lea rcx, [rbp + 0x430]
0x145819fbd: mov edx, 4
0x145819fc2: call 0x145b7ca30
0x145819fc7: nop
0x145819fc8: mov rsi, rax
0x145819fcb: xor r13d, r13d
0x145819fce: lea rdi, [rbp + 0x430]
0x145819fd5: lea rbx, [rbp + 0x190]
0x145819fdc: xor r15d, r15d
0x145819fdf: jmp 0x14581a008
0x145819fe1: nop word ptr cs:[rax + rax]
0x145819ff0: inc r15
0x145819ff3: mov rax, qword ptr [rbp + 0x198]
0x145819ffa: mov dword ptr [rax + r13*4], r14d
0x145819ffe: inc r13
0x14581a001: mov qword ptr [rbp + 0x1a0], r13
0x14581a008: cmp r15, rsi
0x14581a00b: jae 0x14581ae46
0x14581a011: mov rcx, rdi
0x14581a014: call 0x145b7c850
0x14581a019: nop
0x14581a01a: mov r14d, eax
0x14581a01d: mov r13, qword ptr [rbp + 0x1a0]
0x14581a024: cmp r13, qword ptr [rbp + 0x190]
0x14581a02b: jne 0x145819ff0
0x14581a02d: mov rcx, rbx
0x14581a030: call 0x145d19840
0x14581a035: nop
0x14581a036: jmp 0x145819ff0
0x14581a038: lea rcx, [rbp + 0x190]
0x14581a03f: lea rdx, [rbp + 0x430]
0x14581a046: call 0x145b7c600
0x14581a04b: movzx edi, byte ptr [rbp + 0x190]
0x14581a052: movzx eax, byte ptr [rbp + 0x191]
0x14581a059: mov dword ptr [rbp + 0x460], eax
0x14581a05f: mov eax, dword ptr [rbp + 0x192]
0x14581a065: movzx ecx, word ptr [rbp + 0x196]
0x14581a06c: shl rcx, 0x20
0x14581a070: or rcx, rax
0x14581a073: mov rax, qword ptr [rbp + 0x198]
0x14581a07a: mov qword ptr [rbp + 0x428], rax
0x14581a081: mov r13, qword ptr [rbp + 0x1a0]
0x14581a088: movabs rax, 0x8000000000000009
0x14581a092: jmp 0x14581b1bb
0x14581a097: lea rcx, [rbp + 0x190]
0x14581a09e: lea rdx, [rbp + 0x430]
0x14581a0a5: call 0x145b7c600
0x14581a0aa: movzx edi, byte ptr [rbp + 0x190]
0x14581a0b1: movzx eax, byte ptr [rbp + 0x191]
0x14581a0b8: mov dword ptr [rbp + 0x460], eax
0x14581a0be: mov eax, dword ptr [rbp + 0x192]
0x14581a0c4: movzx ecx, word ptr [rbp + 0x196]
0x14581a0cb: shl rcx, 0x20
0x14581a0cf: or rcx, rax
0x14581a0d2: mov rax, qword ptr [rbp + 0x198]
0x14581a0d9: mov qword ptr [rbp + 0x428], rax
0x14581a0e0: mov r13, qword ptr [rbp + 0x1a0]
0x14581a0e7: movabs rax, 0x8000000000000002
0x14581a0f1: jmp 0x14581b1bb
0x14581a0f6: movabs rax, 0x800000000000000f
0x14581a100: jmp 0x14581a827
0x14581a105: lea rsi, [rbp + 0x430]
0x14581a10c: mov rcx, rsi
0x14581a10f: call 0x145b7c8a0
0x14581a114: mov qword ptr [rbp + 0x38], rax
0x14581a118: lea rcx, [rbp + 0x190]
0x14581a11f: mov rdx, rsi
0x14581a122: call 0x145b7c600
0x14581a127: nop
0x14581a128: mov rcx, rsi
0x14581a12b: call 0x145b7c560
0x14581a130: nop
0x14581a131: mov dil, al
0x14581a134: lea rcx, [rbp + 0x430]
0x14581a13b: call 0x145b7c560
0x14581a140: nop
0x14581a141: mov bl, al
0x14581a143: lea rcx, [rbp + 0x430]
0x14581a14a: call 0x145b7c560
0x14581a14f: mov byte ptr [rbp + 0x41c], al
0x14581a155: mov rax, qword ptr [rbp + 0x190]
0x14581a15c: mov qword ptr [rbp + 0x468], rax
0x14581a163: mov rax, qword ptr [rbp + 0x198]
0x14581a16a: mov qword ptr [rbp + 0x3d8], rax
0x14581a171: mov r15, qword ptr [rbp + 0x1a0]
0x14581a178: mov byte ptr [rbp + 0x477], 1
0x14581a17f: lea rcx, [rbp + 0x430]
0x14581a186: call 0x145b7c560
0x14581a18b: mov byte ptr [rbp + 0x460], al
0x14581a191: mov byte ptr [rbp + 0x477], 1
0x14581a198: lea rcx, [rbp + 0x430]
0x14581a19f: call 0x145b7c560
0x14581a1a4: mov byte ptr [rbp + 0x3f8], al
0x14581a1aa: mov byte ptr [rbp + 0x477], 1
0x14581a1b1: lea rcx, [rbp + 0x430]
0x14581a1b8: call 0x145b7c560
0x14581a1bd: mov byte ptr [rbp + 0x3f0], al
0x14581a1c3: mov byte ptr [rbp + 0x477], 1
0x14581a1ca: lea rcx, [rbp + 0x430]
0x14581a1d1: call 0x145b7c560
0x14581a1d6: mov byte ptr [rbp + 0x3e4], al
0x14581a1dc: mov byte ptr [rbp + 0x477], 1
0x14581a1e3: lea rcx, [rbp + 0x430]
0x14581a1ea: call 0x145b7c560
0x14581a1ef: mov byte ptr [rbp + 0x427], al
0x14581a1f5: mov byte ptr [rbp + 0x477], 1
0x14581a1fc: lea rcx, [rbp + 0x430]
0x14581a203: call 0x145b7c850
0x14581a208: mov dword ptr [rbp + 0xc4], eax
0x14581a20e: mov byte ptr [rbp + 0x477], 1
0x14581a215: lea rcx, [rbp + 0x430]
0x14581a21c: call 0x145b7c850
0x14581a221: mov dword ptr [rbp + 0xc8], eax
0x14581a227: mov byte ptr [rbp + 0x477], 1
0x14581a22e: lea rcx, [rbp + 0x430]
0x14581a235: call 0x145b7c850
0x14581a23a: mov dword ptr [rbp + 0xcc], eax
0x14581a240: mov byte ptr [rbp + 0x477], 1
0x14581a247: lea rcx, [rbp + 0x430]
0x14581a24e: call 0x145b7c850
0x14581a253: mov dword ptr [rbp + 0xd0], eax
0x14581a259: mov byte ptr [rbp + 0x477], 1
0x14581a260: lea rcx, [rbp + 0x430]
0x14581a267: call 0x145b7c850
0x14581a26c: mov dword ptr [rbp + 0xd4], eax
0x14581a272: mov byte ptr [rbp + 0x477], 1
0x14581a279: lea rcx, [rbp + 0x430]
0x14581a280: call 0x145b7c850
0x14581a285: mov dword ptr [rbp + 0xd8], eax
0x14581a28b: mov byte ptr [rbp + 0x477], 1
0x14581a292: lea rcx, [rbp + 0x430]
0x14581a299: call 0x145b7c850
0x14581a29e: mov dword ptr [rbp + 0xdc], eax
0x14581a2a4: mov byte ptr [rbp + 0x477], 1
0x14581a2ab: lea rcx, [rbp + 0x430]
0x14581a2b2: call 0x145b7c850
0x14581a2b7: mov dword ptr [rbp + 0xe0], eax
0x14581a2bd: mov byte ptr [rbp + 0x477], 1
0x14581a2c4: lea rcx, [rbp + 0x430]
0x14581a2cb: call 0x145b7c850
0x14581a2d0: nop
0x14581a2d1: mov esi, eax
0x14581a2d3: mov byte ptr [rbp + 0x477], 1
0x14581a2da: lea rcx, [rbp + 0x430]
0x14581a2e1: call 0x145b7c850
0x14581a2e6: mov dword ptr [rbp + 0xe4], eax
0x14581a2ec: mov byte ptr [rbp + 0x477], 1
0x14581a2f3: lea rcx, [rbp + 0x430]
0x14581a2fa: call 0x145b7c850
0x14581a2ff: mov dword ptr [rbp + 0xe8], eax
0x14581a305: mov byte ptr [rbp + 0x477], 1
0x14581a30c: lea rcx, [rbp + 0x430]
0x14581a313: call 0x145b7c850
0x14581a318: mov dword ptr [rbp + 0xec], eax
0x14581a31e: mov byte ptr [rbp + 0x477], 1
0x14581a325: lea rcx, [rbp + 0x430]
0x14581a32c: call 0x145b7c850
0x14581a331: mov dword ptr [rbp + 0x148], eax
0x14581a337: mov byte ptr [rbp + 0x477], 1
0x14581a33e: lea rcx, [rbp + 0x430]
0x14581a345: call 0x145b7c850
0x14581a34a: mov dword ptr [rbp + 0x14c], eax
0x14581a350: mov byte ptr [rbp + 0x477], 1
0x14581a357: lea rcx, [rbp + 0x430]
0x14581a35e: call 0x145b7c850
0x14581a363: mov dword ptr [rbp + 0x150], eax
0x14581a369: mov byte ptr [rbp + 0x477], 1
0x14581a370: lea rcx, [rbp + 0x430]
0x14581a377: call 0x145b7c850
0x14581a37c: mov dword ptr [rbp + 0x154], eax
0x14581a382: mov byte ptr [rbp + 0x477], 1
0x14581a389: lea rcx, [rbp + 0x430]
0x14581a390: call 0x145b7c850
0x14581a395: mov dword ptr [rbp + 0x158], eax
0x14581a39b: mov byte ptr [rbp + 0x477], 1
0x14581a3a2: lea rcx, [rbp + 0x430]
0x14581a3a9: call 0x145b7c850
0x14581a3ae: mov dword ptr [rbp + 0x15c], eax
0x14581a3b4: mov byte ptr [rbp + 0x477], 1
0x14581a3bb: lea rcx, [rbp + 0x430]
0x14581a3c2: call 0x145b7c850
0x14581a3c7: mov dword ptr [rbp + 0x160], eax
0x14581a3cd: mov byte ptr [rbp + 0x477], 1
0x14581a3d4: lea rcx, [rbp + 0x430]
0x14581a3db: call 0x145b7c850
0x14581a3e0: mov dword ptr [rbp + 0x170], eax
0x14581a3e6: mov byte ptr [rbp + 0x477], 1
0x14581a3ed: lea rcx, [rbp + 0x430]
0x14581a3f4: call 0x145b7c850
0x14581a3f9: mov dword ptr [rbp + 0x178], eax
0x14581a3ff: mov byte ptr [rbp + 0x477], 1
0x14581a406: lea rcx, [rbp + 0x430]
0x14581a40d: call 0x145b7c850
0x14581a412: mov dword ptr [rbp + 0x3c8], eax
0x14581a418: mov byte ptr [rbp + 0x477], 1
0x14581a41f: lea rcx, [rbp + 0x430]
0x14581a426: call 0x145b7c850
0x14581a42b: mov dword ptr [rbp + 0x180], eax
0x14581a431: mov byte ptr [rbp + 0x477], 1
0x14581a438: lea rcx, [rbp + 0x430]
0x14581a43f: call 0x145b7c850
0x14581a444: mov dword ptr [rbp + 0x188], eax
0x14581a44a: mov byte ptr [rbp + 0x477], 1
0x14581a451: lea rcx, [rbp + 0x430]
0x14581a458: call 0x145b7c850
0x14581a45d: mov dword ptr [rbp + 0x3e8], eax
0x14581a463: mov byte ptr [rbp + 0x477], 1
0x14581a46a: lea rcx, [rbp + 0x430]
0x14581a471: call 0x145b7c850
0x14581a476: mov dword ptr [rbp + 0x3d0], eax
0x14581a47c: mov byte ptr [rbp + 0x477], 1
0x14581a483: lea rcx, [rbp + 0x430]
0x14581a48a: call 0x145b7c850
0x14581a48f: mov dword ptr [rbp + 0x39c], eax
0x14581a495: mov byte ptr [rbp + 0x477], 1
0x14581a49c: lea rcx, [rbp + 0x430]
0x14581a4a3: call 0x145b7c850
0x14581a4a8: mov dword ptr [rbp + 0x3a0], eax
0x14581a4ae: mov byte ptr [rbp + 0x477], 1
0x14581a4b5: lea rcx, [rbp + 0x430]
0x14581a4bc: call 0x145b7c850
0x14581a4c1: mov dword ptr [rbp + 0x3a4], eax
0x14581a4c7: mov byte ptr [rbp + 0x477], 1
0x14581a4ce: lea rcx, [rbp + 0x430]
0x14581a4d5: call 0x145b7c850
0x14581a4da: mov dword ptr [rbp + 0x3a8], eax
0x14581a4e0: mov byte ptr [rbp + 0x477], 1
0x14581a4e7: lea rcx, [rbp + 0x430]
0x14581a4ee: call 0x145b7c850
0x14581a4f3: mov dword ptr [rbp + 0x3ac], eax
0x14581a4f9: mov byte ptr [rbp + 0x477], 1
0x14581a500: lea rcx, [rbp + 0x430]
0x14581a507: call 0x145b7c850
0x14581a50c: mov dword ptr [rbp + 0x3b0], eax
0x14581a512: mov byte ptr [rbp + 0x477], 1
0x14581a519: lea rcx, [rbp + 0x430]
0x14581a520: call 0x145b7c850
0x14581a525: mov dword ptr [rbp + 0x3b4], eax
0x14581a52b: mov byte ptr [rbp + 0x477], 1
0x14581a532: lea rcx, [rbp + 0x430]
0x14581a539: call 0x145b7c850
0x14581a53e: mov dword ptr [rbp + 0x3b8], eax
0x14581a544: mov byte ptr [rbp + 0x477], 1
0x14581a54b: lea rcx, [rbp + 0x430]
0x14581a552: call 0x145b7c850
0x14581a557: mov dword ptr [rbp + 0x3bc], eax
0x14581a55d: mov byte ptr [rbp + 0x477], 1
0x14581a564: lea rcx, [rbp + 0x430]
0x14581a56b: call 0x145b7c850
0x14581a570: mov dword ptr [rbp + 0x3c0], eax
0x14581a576: mov byte ptr [rbp + 0x477], 1
0x14581a57d: lea rcx, [rbp + 0x430]
0x14581a584: call 0x145b7c850
0x14581a589: mov dword ptr [rbp + 0x3c4], eax
0x14581a58f: mov byte ptr [rbp + 0x477], 1
0x14581a596: lea rcx, [rbp + 0x430]
0x14581a59d: call 0x145b7c850
0x14581a5a2: nop
0x14581a5a3: mov r12d, eax
0x14581a5a6: mov byte ptr [rbp + 0x41d], dil
0x14581a5ad: lea rcx, [rbp + 0x380]
0x14581a5b4: lea rdx, [rbp + 0x430]
0x14581a5bb: call 0x145b7c600
0x14581a5c0: nop
0x14581a5c1: lea rcx, [rbp + 0x430]
0x14581a5c8: call 0x145b7c850
0x14581a5cd: mov dword ptr [rbp + 0xf0], eax
0x14581a5d3: lea rcx, [rbp + 0x430]
0x14581a5da: call 0x145b7c850
0x14581a5df: mov dword ptr [rbp + 0xf4], eax
0x14581a5e5: lea rcx, [rbp + 0x430]
0x14581a5ec: call 0x145b7c8f0
0x14581a5f1: nop
0x14581a5f2: mov r13b, al
0x14581a5f5: lea rcx, [rbp + 0x430]
0x14581a5fc: call 0x145b7c8f0
0x14581a601: mov byte ptr [rbp + 0x41e], al
0x14581a607: lea rcx, [rbp + 0x430]
0x14581a60e: call 0x145b7c5b0
0x14581a613: nop
0x14581a614: movaps xmm6, xmm0
0x14581a617: lea rcx, [rbp + 0x190]
0x14581a61e: lea rdx, [rbp + 0x430]
0x14581a625: call 0x145b7c600
0x14581a62a: nop
0x14581a62b: mov dword ptr [rbp + 0xf8], esi
0x14581a631: lea rcx, [rbp + 0x430]
0x14581a638: call 0x145b7c560
0x14581a63d: mov byte ptr [rbp + 0x458], al
0x14581a643: mov rsi, qword ptr [rbp + 0x190]
0x14581a64a: mov r14, qword ptr [rbp + 0x198]
0x14581a651: mov rdx, qword ptr [rbp + 0x1a0]
0x14581a658: mov rcx, r14
0x14581a65b: call 0x14583ed80
0x14581a660: mov qword ptr [rbp + 0xb8], rax
0x14581a667: test rsi, rsi
0x14581a66a: je 0x14581a67e
0x14581a66c: mov r8d, 1
0x14581a672: mov rcx, r14
0x14581a675: mov rdx, rsi
0x14581a678: call 0x1400021d0
0x14581a67d: nop
0x14581a67e: lea rcx, [rbp + 0x190]
0x14581a685: lea rdx, [rbp + 0x430]
0x14581a68c: call 0x145b7c600
0x14581a691: nop
0x14581a692: lea rcx, [rbp + 0x430]
0x14581a699: call 0x145b7c560
0x14581a69e: nop
0x14581a69f: mov esi, eax
0x14581a6a1: mov byte ptr [rbp + 0x41f], bl
0x14581a6a7: mov r14, qword ptr [rbp + 0x190]
0x14581a6ae: mov rbx, qword ptr [rbp + 0x198]
0x14581a6b5: mov rdx, qword ptr [rbp + 0x1a0]
0x14581a6bc: mov rcx, rbx
0x14581a6bf: call 0x14583ed80
0x14581a6c4: mov rdi, rax
0x14581a6c7: test r14, r14
0x14581a6ca: je 0x14581a6de
0x14581a6cc: mov r8d, 1
0x14581a6d2: mov rcx, rbx
0x14581a6d5: mov rdx, r14
0x14581a6d8: call 0x1400021d0
0x14581a6dd: nop
0x14581a6de: lea rcx, [rbp + 0x430]
0x14581a6e5: call 0x145b7c560
0x14581a6ea: nop
0x14581a6eb: mov bl, al
0x14581a6ed: mov r14d, r12d
0x14581a6f0: lea rcx, [rbp + 0x430]
0x14581a6f7: call 0x145b7c560
0x14581a6fc: mov byte ptr [rbp + 0x420], al
0x14581a702: lea rcx, [rbp + 0x430]
0x14581a709: call 0x145b7c8f0
0x14581a70e: mov byte ptr [rbp + 0x421], al
0x14581a714: lea rcx, [rbp + 0x430]
0x14581a71b: call 0x145b7c8f0
0x14581a720: mov byte ptr [rbp + 0x422], al
0x14581a726: lea rcx, [rbp + 0x430]
0x14581a72d: call 0x145b7c8f0
0x14581a732: mov byte ptr [rbp + 0x423], al
0x14581a738: lea rcx, [rbp + 0x430]
0x14581a73f: call 0x145b7c8f0
0x14581a744: nop
0x14581a745: test al, al
0x14581a747: je 0x14581b6a7
0x14581a74d: lea rcx, [rbp + 0x190]
0x14581a754: lea rdx, [rbp + 0x430]
0x14581a75b: call 0x145b7bf90
0x14581a760: nop
0x14581a761: jmp 0x14581b6b2
0x14581a766: lea rsi, [rbp + 0x430]
0x14581a76d: mov rcx, rsi
0x14581a770: call 0x145b7c560
0x14581a775: mov edi, eax
0x14581a777: mov rcx, rsi
0x14581a77a: call 0x145b7c560
0x14581a77f: cmp dil, 9
0x14581a783: ja 0x14581a7c9
0x14581a785: mov edx, eax
0x14581a787: movzx eax, dil
0x14581a78b: lea rcx, [rip + 0x14b0992]
0x14581a792: movsxd rax, dword ptr [rcx + rax*4]
0x14581a796: add rax, rcx
0x14581a799: jmp rax
0x14581a79b: mov dword ptr [rbp + 0x460], edx
0x14581a7a1: mov dword ptr [rbp + 0x458], eax
0x14581a7a7: mov dword ptr [rbp + 0x450], eax
0x14581a7ad: mov r11, rdi
0x14581a7b0: movabs rdi, 0x8000000000000007
0x14581a7ba: mov qword ptr [rbp + 0x468], rdi
0x14581a7c1: mov rdi, r11
0x14581a7c4: jmp 0x14581b1ce
0x14581a7c9: mov rax, qword ptr [rbp + 0x168]
0x14581a7d0: mov qword ptr [rax], 0xffffffffffffffff
0x14581a7d7: jmp 0x14581b676
0x14581a7dc: lea rsi, [rbp + 0x430]
0x14581a7e3: mov rcx, rsi
0x14581a7e6: call 0x145b7c560
0x14581a7eb: mov edi, eax
0x14581a7ed: mov rcx, rsi
0x14581a7f0: call 0x145b7c560
0x14581a7f5: mov dword ptr [rbp + 0x460], eax
0x14581a7fb: movabs rax, 0x8000000000000001
0x14581a805: mov qword ptr [rbp + 0x468], rax
0x14581a80c: jmp 0x14581afd8
0x14581a811: movabs rax, 0x8000000000000011
0x14581a81b: jmp 0x14581a827
0x14581a81d: movabs rax, 0x8000000000000005
0x14581a827: mov qword ptr [rbp + 0x468], rax
0x14581a82e: mov dword ptr [rbp + 0x458], eax
0x14581a834: mov dword ptr [rbp + 0x450], eax
0x14581a83a: mov dword ptr [rbp + 0x460], edi
0x14581a840: jmp 0x14581b1ce
0x14581a845: mov qword ptr [rbp + 0x48], 0
0x14581a84d: mov qword ptr [rbp + 0x50], 8
0x14581a855: mov qword ptr [rbp + 0x58], 0
0x14581a85d: lea rcx, [rbp + 0x430]
0x14581a864: mov edx, 5
0x14581a869: call 0x145b7ca30
0x14581a86e: nop
0x14581a86f: mov rsi, rax
0x14581a872: xor r13d, r13d
0x14581a875: lea rdi, [rbp + 0x190]
0x14581a87c: lea rbx, [rbp + 0x430]
0x14581a883: xor r12d, r12d
0x14581a886: jmp 0x14581a8c6
0x14581a888: nop dword ptr [rax + rax]
0x14581a890: inc r12
0x14581a893: mov rax, qword ptr [rbp + 0x50]
0x14581a897: mov rcx, r13
0x14581a89a: shl rcx, 5
0x14581a89e: mov rdx, qword ptr [rbp + 0x468]
0x14581a8a5: mov qword ptr [rax + rcx], rdx
0x14581a8a9: mov rdx, qword ptr [rbp + 0x460]
0x14581a8b0: mov qword ptr [rax + rcx + 8], rdx
0x14581a8b5: mov qword ptr [rax + rcx + 0x10], r14
0x14581a8ba: mov byte ptr [rax + rcx + 0x18], r15b
0x14581a8bf: inc r13
0x14581a8c2: mov qword ptr [rbp + 0x58], r13
0x14581a8c6: cmp r12, rsi
0x14581a8c9: jae 0x14581af5e
0x14581a8cf: mov rcx, rdi
0x14581a8d2: mov rdx, rbx
0x14581a8d5: call 0x145b7c600
0x14581a8da: nop
0x14581a8db: mov rcx, rbx
0x14581a8de: call 0x145b7c560
0x14581a8e3: nop
0x14581a8e4: mov r15d, eax
0x14581a8e7: mov rax, qword ptr [rbp + 0x190]
0x14581a8ee: mov qword ptr [rbp + 0x468], rax
0x14581a8f5: mov rax, qword ptr [rbp + 0x198]
0x14581a8fc: mov qword ptr [rbp + 0x460], rax
0x14581a903: mov r14, qword ptr [rbp + 0x1a0]
0x14581a90a: mov r13, qword ptr [rbp + 0x58]
0x14581a90e: cmp r13, qword ptr [rbp + 0x48]
0x14581a912: jne 0x14581a890
0x14581a918: lea rcx, [rbp + 0x48]
0x14581a91c: call 0x145d150f0
0x14581a921: nop
0x14581a922: jmp 0x14581a890
0x14581a927: lea rdi, [rbp + 0x430]
0x14581a92e: mov rcx, rdi
0x14581a931: call 0x145b7c800
0x14581a936: mov word ptr [rbp + 0x3f8], ax
0x14581a93d: lea rcx, [rbp + 0x190]
0x14581a944: mov rdx, rdi
0x14581a947: call 0x145b7c940
0x14581a94c: movzx edi, byte ptr [rbp + 0x190]
0x14581a953: movzx eax, byte ptr [rbp + 0x191]
0x14581a95a: mov dword ptr [rbp + 0x460], eax
0x14581a960: mov eax, dword ptr [rbp + 0x192]
0x14581a966: movzx ecx, word ptr [rbp + 0x196]
0x14581a96d: shl rcx, 0x20
0x14581a971: or rcx, rax
0x14581a974: mov rax, qword ptr [rbp + 0x198]
0x14581a97b: mov qword ptr [rbp + 0x428], rax
0x14581a982: mov r13, qword ptr [rbp + 0x1a0]
0x14581a989: movabs rax, 0x8000000000000006
0x14581a993: mov qword ptr [rbp + 0x468], rax
0x14581a99a: mov dword ptr [rbp + 0x458], eax
0x14581a9a0: mov dword ptr [rbp + 0x450], eax
0x14581a9a6: jmp 0x14581b1ce
0x14581a9ab: lea rcx, [rbp + 0x190]
0x14581a9b2: lea rdx, [rbp + 0x430]
0x14581a9b9: call 0x145b7c940
0x14581a9be: movzx edi, byte ptr [rbp + 0x190]
0x14581a9c5: movzx eax, byte ptr [rbp + 0x191]
0x14581a9cc: mov dword ptr [rbp + 0x460], eax
0x14581a9d2: mov eax, dword ptr [rbp + 0x192]
0x14581a9d8: movzx ecx, word ptr [rbp + 0x196]
0x14581a9df: shl rcx, 0x20
0x14581a9e3: or rcx, rax
0x14581a9e6: mov rax, qword ptr [rbp + 0x198]
0x14581a9ed: mov qword ptr [rbp + 0x428], rax
0x14581a9f4: mov r13, qword ptr [rbp + 0x1a0]
0x14581a9fb: movabs rax, 0x8000000000000012
0x14581aa05: jmp 0x14581b1bb
0x14581aa0a: mov qword ptr [rbp + 0x400], 0
0x14581aa15: mov qword ptr [rbp + 0x408], 8
0x14581aa20: mov qword ptr [rbp + 0x410], 0
0x14581aa2b: lea rcx, [rbp + 0x430]
0x14581aa32: mov edx, 0x18
0x14581aa37: call 0x145b7ca30
0x14581aa3c: mov qword ptr [rbp + 0x188], rax
0x14581aa43: lea r15, [rbp + 0x1a8]
0x14581aa4a: xor r12d, r12d
0x14581aa4d: lea rdi, [rbp + 0x430]
0x14581aa54: lea r14, [rbp + 0x190]
0x14581aa5b: jmp 0x14581aa89
0x14581aa5d: nop dword ptr [rax]
0x14581aa60: inc r12
0x14581aa63: imul rcx, rbx, 0xb0
0x14581aa6a: add rcx, qword ptr [rbp + 0x408]
0x14581aa71: mov r8d, 0xb0
0x14581aa77: mov rdx, r14
0x14581aa7a: call 0x145d145fb
0x14581aa7f: inc rbx
0x14581aa82: mov qword ptr [rbp + 0x410], rbx
0x14581aa89: cmp r12, qword ptr [rbp + 0x188]
0x14581aa90: jae 0x14581b174
0x14581aa96: mov rcx, rdi
0x14581aa99: call 0x145b7c850
0x14581aa9e: nop
0x14581aa9f: mov r13d, eax
0x14581aaa2: lea rcx, [rbp + 0x20]
0x14581aaa6: mov rdx, rdi
0x14581aaa9: call 0x145b7c600
0x14581aaae: nop
0x14581aaaf: mov rax, qword ptr [rbp + 0x20]
0x14581aab3: mov qword ptr [rbp + 0x3e8], rax
0x14581aaba: mov rax, qword ptr [rbp + 0x28]
0x14581aabe: mov qword ptr [rbp + 0x3d0], rax
0x14581aac5: mov byte ptr [rbp + 0x476], 1
0x14581aacc: mov rcx, rdi
0x14581aacf: call 0x145b7c8f0
0x14581aad4: nop
0x14581aad5: mov bl, al
0x14581aad7: mov byte ptr [rbp + 0x476], 1
0x14581aade: mov rcx, r14
0x14581aae1: mov rdx, rdi
0x14581aae4: call 0x145b7c600
0x14581aae9: nop
0x14581aaea: test bl, bl
0x14581aaec: je 0x14581ab20
0x14581aaee: mov rax, qword ptr [rbp + 0x190]
0x14581aaf5: mov qword ptr [rbp + 0x468], rax
0x14581aafc: mov rax, qword ptr [rbp + 0x198]
0x14581ab03: mov qword ptr [rbp + 0x428], rax
0x14581ab0a: mov rax, qword ptr [rbp + 0x1a0]
0x14581ab11: mov qword ptr [rbp + 0x170], rax
0x14581ab18: jmp 0x14581ab4a
0x14581ab1a: nop word ptr [rax + rax]
0x14581ab20: mov rdx, qword ptr [rbp + 0x190]
0x14581ab27: mov qword ptr [rbp + 0x468], 0xffffffffffffffff
0x14581ab32: test rdx, rdx
0x14581ab35: je 0x14581ab4a
0x14581ab37: mov rcx, qword ptr [rbp + 0x198]
0x14581ab3e: mov r8d, 1
0x14581ab44: call 0x1400021d0
0x14581ab49: nop
0x14581ab4a: mov rcx, rdi
0x14581ab4d: call 0x145b7c8f0
0x14581ab52: nop
0x14581ab53: mov bl, al
0x14581ab55: mov rcx, r14
0x14581ab58: mov rdx, rdi
0x14581ab5b: call 0x145b7c600
0x14581ab60: nop
0x14581ab61: test bl, bl
0x14581ab63: je 0x14581aba0
0x14581ab65: mov rax, qword ptr [rbp + 0x190]
0x14581ab6c: mov qword ptr [rbp + 0x460], rax
0x14581ab73: mov rax, qword ptr [rbp + 0x198]
0x14581ab7a: mov qword ptr [rbp + 0x3f8], rax
0x14581ab81: mov rax, qword ptr [rbp + 0x1a0]
0x14581ab88: mov qword ptr [rbp + 0x178], rax
0x14581ab8f: jmp 0x14581abca
0x14581ab91: nop word ptr cs:[rax + rax]
0x14581aba0: mov rdx, qword ptr [rbp + 0x190]
0x14581aba7: mov qword ptr [rbp + 0x460], 0xffffffffffffffff
0x14581abb2: test rdx, rdx
0x14581abb5: je 0x14581abca
0x14581abb7: mov rcx, qword ptr [rbp + 0x198]
0x14581abbe: mov r8d, 1
0x14581abc4: call 0x1400021d0
0x14581abc9: nop
0x14581abca: mov rcx, rdi
0x14581abcd: call 0x145b7c8f0
0x14581abd2: nop
0x14581abd3: mov bl, al
0x14581abd5: mov rcx, r14
0x14581abd8: mov rdx, rdi
0x14581abdb: call 0x145b7c600
0x14581abe0: nop
0x14581abe1: test bl, bl
0x14581abe3: je 0x14581ac20
0x14581abe5: mov rax, qword ptr [rbp + 0x190]
0x14581abec: mov qword ptr [rbp + 0x458], rax
0x14581abf3: mov rax, qword ptr [rbp + 0x198]
0x14581abfa: mov qword ptr [rbp + 0x3f0], rax
0x14581ac01: mov rax, qword ptr [rbp + 0x1a0]
0x14581ac08: mov qword ptr [rbp + 0x180], rax
0x14581ac0f: jmp 0x14581ac4a
0x14581ac11: nop word ptr cs:[rax + rax]
0x14581ac20: mov rdx, qword ptr [rbp + 0x190]
0x14581ac27: mov qword ptr [rbp + 0x458], 0xffffffffffffffff
0x14581ac32: test rdx, rdx
0x14581ac35: je 0x14581ac4a
0x14581ac37: mov rcx, qword ptr [rbp + 0x198]
0x14581ac3e: mov r8d, 1
0x14581ac44: call 0x1400021d0
0x14581ac49: nop
0x14581ac4a: mov rcx, rdi
0x14581ac4d: call 0x145b7c8f0
0x14581ac52: nop
0x14581ac53: mov bl, al
0x14581ac55: mov rcx, r14
0x14581ac58: mov rdx, rdi
0x14581ac5b: call 0x145b7c600
0x14581ac60: nop
0x14581ac61: test bl, bl
0x14581ac63: je 0x14581ac90
0x14581ac65: mov rax, qword ptr [rbp + 0x190]
0x14581ac6c: mov qword ptr [rbp + 0x450], rax
0x14581ac73: mov rax, qword ptr [rbp + 0x198]
0x14581ac7a: mov qword ptr [rbp + 0x3c8], rax
0x14581ac81: mov rbx, qword ptr [rbp + 0x1a0]
0x14581ac88: jmp 0x14581acbc
0x14581ac8a: nop word ptr [rax + rax]
0x14581ac90: mov rdx, qword ptr [rbp + 0x190]
0x14581ac97: mov qword ptr [rbp + 0x450], 0xffffffffffffffff
0x14581aca2: test rdx, rdx
0x14581aca5: je 0x14581acb9
0x14581aca7: mov rcx, qword ptr [rbp + 0x198]
0x14581acae: mov r8d, 1
0x14581acb4: call 0x1400021d0
0x14581acb9: mov rbx, rsi
0x14581acbc: lea rcx, [rbp + 0x380]
0x14581acc3: mov rdx, rdi
0x14581acc6: call 0x145b7c600
0x14581accb: nop
0x14581accc: lea rcx, [rbp + 0x48]
0x14581acd0: mov rdx, rdi
0x14581acd3: call 0x145b7c600
0x14581acd8: nop
0x14581acd9: mov dword ptr [rbp + 0x238], r13d
0x14581ace0: mov rax, qword ptr [rbp + 0x30]
0x14581ace4: mov qword ptr [rbp + 0x1a0], rax
0x14581aceb: movups xmm0, xmmword ptr [rbp + 0x20]
0x14581acef: movaps xmmword ptr [rbp + 0x190], xmm0
0x14581acf6: mov rax, qword ptr [rbp + 0x468]
0x14581acfd: mov qword ptr [rbp + 0x1d8], rax
0x14581ad04: mov rax, qword ptr [rbp + 0x428]
0x14581ad0b: mov qword ptr [rbp + 0x1e0], rax
0x14581ad12: mov rax, qword ptr [rbp + 0x170]
0x14581ad19: mov qword ptr [rbp + 0x1e8], rax
0x14581ad20: mov rax, qword ptr [rbp + 0x460]
0x14581ad27: mov qword ptr [rbp + 0x1f0], rax
0x14581ad2e: mov rax, qword ptr [rbp + 0x3f8]
0x14581ad35: mov qword ptr [rbp + 0x1f8], rax
0x14581ad3c: mov rax, qword ptr [rbp + 0x178]
0x14581ad43: mov qword ptr [rbp + 0x200], rax
0x14581ad4a: mov rax, qword ptr [rbp + 0x458]
0x14581ad51: mov qword ptr [rbp + 0x208], rax
0x14581ad58: mov rax, qword ptr [rbp + 0x3f0]
0x14581ad5f: mov qword ptr [rbp + 0x210], rax
0x14581ad66: mov rax, qword ptr [rbp + 0x180]
0x14581ad6d: mov qword ptr [rbp + 0x218], rax
0x14581ad74: mov rax, qword ptr [rbp + 0x450]
0x14581ad7b: mov qword ptr [rbp + 0x220], rax
0x14581ad82: mov rax, qword ptr [rbp + 0x3c8]
0x14581ad89: mov qword ptr [rbp + 0x228], rax
0x14581ad90: mov rsi, rbx
0x14581ad93: mov qword ptr [rbp + 0x230], rbx
0x14581ad9a: mov rax, qword ptr [rbp + 0x390]
0x14581ada1: mov qword ptr [r15 + 0x10], rax
0x14581ada5: movups xmm0, xmmword ptr [rbp + 0x380]
0x14581adac: movups xmmword ptr [r15], xmm0
0x14581adb0: mov rax, qword ptr [rbp + 0x58]
0x14581adb4: mov qword ptr [r15 + 0x28], rax
0x14581adb8: movups xmm0, xmmword ptr [rbp + 0x48]
0x14581adbc: movups xmmword ptr [r15 + 0x18], xmm0
0x14581adc1: mov rbx, qword ptr [rbp + 0x410]
0x14581adc8: cmp rbx, qword ptr [rbp + 0x400]
0x14581adcf: jne 0x14581aa60
0x14581add5: lea rcx, [rbp + 0x400]
0x14581addc: call 0x145d40d30
0x14581ade1: nop
0x14581ade2: jmp 0x14581aa60
0x14581ade7: lea rcx, [rbp + 0x190]
0x14581adee: lea rdx, [rbp + 0x430]
0x14581adf5: call 0x145b7c600
0x14581adfa: movzx edi, byte ptr [rbp + 0x190]
0x14581ae01: movzx eax, byte ptr [rbp + 0x191]
0x14581ae08: mov dword ptr [rbp + 0x460], eax
0x14581ae0e: mov eax, dword ptr [rbp + 0x192]
0x14581ae14: movzx ecx, word ptr [rbp + 0x196]
0x14581ae1b: shl rcx, 0x20
0x14581ae1f: or rcx, rax
0x14581ae22: mov rax, qword ptr [rbp + 0x198]
0x14581ae29: mov qword ptr [rbp + 0x428], rax
0x14581ae30: mov r13, qword ptr [rbp + 0x1a0]
0x14581ae37: movabs rax, 0x8000000000000008
0x14581ae41: jmp 0x14581b1bb
0x14581ae46: movzx edi, byte ptr [rbp + 0x190]
0x14581ae4d: movzx eax, byte ptr [rbp + 0x191]
0x14581ae54: mov dword ptr [rbp + 0x460], eax
0x14581ae5a: mov eax, dword ptr [rbp + 0x192]
0x14581ae60: movzx ecx, word ptr [rbp + 0x196]
0x14581ae67: shl rcx, 0x20
0x14581ae6b: or rcx, rax
0x14581ae6e: mov rax, qword ptr [rbp + 0x198]
0x14581ae75: mov qword ptr [rbp + 0x428], rax
0x14581ae7c: movabs rax, 0x800000000000000c
0x14581ae86: jmp 0x14581afd1
0x14581ae8b: lea rcx, [rbp + 0x430]
0x14581ae92: mov edx, 0xb
0x14581ae97: call 0x145b7ca30
0x14581ae9c: mov qword ptr [rbp + 0x460], rax
0x14581aea3: lea rdi, [rbp + 0x430]
0x14581aeaa: xor r15d, r15d
0x14581aead: jmp 0x14581aee4
0x14581aeaf: nop
0x14581aeb0: inc r15
0x14581aeb3: mov rax, qword ptr [rbp + 0x1c8]
0x14581aeba: lea rcx, [r14 + r14*2]
0x14581aebe: mov edx, dword ptr [rbp + 0x468]
0x14581aec4: mov dword ptr [rax + rcx*4], edx
0x14581aec7: mov dword ptr [rax + rcx*4 + 4], r12d
0x14581aecc: mov byte ptr [rax + rcx*4 + 8], r13b
0x14581aed1: mov byte ptr [rax + rcx*4 + 9], bl
0x14581aed5: mov byte ptr [rax + rcx*4 + 0xa], sil
0x14581aeda: inc r14
0x14581aedd: mov qword ptr [rbp + 0x1d0], r14
0x14581aee4: cmp r15, qword ptr [rbp + 0x460]
0x14581aeeb: jae 0x14581b02e
0x14581aef1: mov rcx, rdi
0x14581aef4: call 0x145b7c850
0x14581aef9: mov dword ptr [rbp + 0x468], eax
0x14581aeff: mov rcx, rdi
0x14581af02: call 0x145b7c850
0x14581af07: nop
0x14581af08: mov r12d, eax
0x14581af0b: mov rcx, rdi
0x14581af0e: call 0x145b7c560
0x14581af13: nop
0x14581af14: mov r13b, al
0x14581af17: mov rcx, rdi
0x14581af1a: call 0x145b7c560
0x14581af1f: nop
0x14581af20: cmp al, 4
0x14581af22: movzx ebx, al
0x14581af25: mov eax, 0
0x14581af2a: cmovae ebx, eax
0x14581af2d: mov rcx, rdi
0x14581af30: call 0x145b7c8f0
0x14581af35: nop
0x14581af36: mov esi, eax
0x14581af38: mov r14, qword ptr [rbp + 0x1d0]
0x14581af3f: cmp r14, qword ptr [rbp + 0x1c0]
0x14581af46: jne 0x14581aeb0
0x14581af4c: lea rcx, [rbp + 0x1c0]
0x14581af53: call 0x145d40470
0x14581af58: nop
0x14581af59: jmp 0x14581aeb0
0x14581af5e: movzx edi, byte ptr [rbp + 0x48]
0x14581af62: movzx eax, byte ptr [rbp + 0x49]
0x14581af66: mov dword ptr [rbp + 0x460], eax
0x14581af6c: mov eax, dword ptr [rbp + 0x4a]
0x14581af6f: movzx ecx, word ptr [rbp + 0x4e]
0x14581af73: shl rcx, 0x20
0x14581af77: or rcx, rax
0x14581af7a: mov rax, qword ptr [rbp + 0x50]
0x14581af7e: mov qword ptr [rbp + 0x428], rax
0x14581af85: movabs rax, 0x800000000000000d
0x14581af8f: jmp 0x14581afd1
0x14581af91: movzx edi, byte ptr [rbp + 0x190]
0x14581af98: movzx eax, byte ptr [rbp + 0x191]
0x14581af9f: mov dword ptr [rbp + 0x460], eax
0x14581afa5: mov eax, dword ptr [rbp + 0x192]
0x14581afab: movzx ecx, word ptr [rbp + 0x196]
0x14581afb2: shl rcx, 0x20
0x14581afb6: or rcx, rax
0x14581afb9: mov rax, qword ptr [rbp + 0x198]
0x14581afc0: mov qword ptr [rbp + 0x428], rax
0x14581afc7: movabs rax, 0x800000000000000b
0x14581afd1: mov qword ptr [rbp + 0x468], rax
0x14581afd8: jmp 0x14581b1c2
0x14581afdd: movzx edi, byte ptr [rbp + 0x400]
0x14581afe4: movzx eax, byte ptr [rbp + 0x401]
0x14581afeb: mov dword ptr [rbp + 0x460], eax
0x14581aff1: mov eax, dword ptr [rbp + 0x402]
0x14581aff7: movzx ecx, word ptr [rbp + 0x406]
0x14581affe: shl rcx, 0x20
0x14581b002: or rcx, rax
0x14581b005: movabs rax, 0x8000000000000010
0x14581b00f: mov qword ptr [rbp + 0x468], rax
0x14581b016: mov dword ptr [rbp + 0x458], eax
0x14581b01c: mov dword ptr [rbp + 0x450], eax
0x14581b022: mov qword ptr [rbp + 0x428], rbx
0x14581b029: jmp 0x14581b1ce
0x14581b02e: lea rcx, [rbp + 0x430]
0x14581b035: mov edx, 4
0x14581b03a: call 0x145b7ca30
0x14581b03f: nop
0x14581b040: mov rdi, rax
0x14581b043: xor r14d, r14d
0x14581b046: lea rbx, [rbp + 0x430]
0x14581b04d: jmp 0x14581b068
0x14581b04f: nop
0x14581b050: inc r14
0x14581b053: mov rax, qword ptr [rbp + 0x1e0]
0x14581b05a: mov dword ptr [rax + r15*4], esi
0x14581b05e: inc r15
0x14581b061: mov qword ptr [rbp + 0x1e8], r15
0x14581b068: cmp r14, rdi
0x14581b06b: jae 0x14581b097
0x14581b06d: mov rcx, rbx
0x14581b070: call 0x145b7c850
0x14581b075: nop
0x14581b076: mov esi, eax
0x14581b078: mov r15, qword ptr [rbp + 0x1e8]
0x14581b07f: cmp r15, qword ptr [rbp + 0x1d8]
0x14581b086: jne 0x14581b050
0x14581b088: lea rcx, [rbp + 0x1d8]
0x14581b08f: call 0x145d19840
0x14581b094: nop
0x14581b095: jmp 0x14581b050
0x14581b097: movzx edi, byte ptr [rbp + 0x190]
0x14581b09e: movzx eax, byte ptr [rbp + 0x191]
0x14581b0a5: mov dword ptr [rbp + 0x460], eax
0x14581b0ab: mov eax, dword ptr [rbp + 0x192]
0x14581b0b1: movzx ecx, word ptr [rbp + 0x196]
0x14581b0b8: shl rcx, 0x20
0x14581b0bc: or rcx, rax
0x14581b0bf: mov rax, qword ptr [rbp + 0x198]
0x14581b0c6: mov qword ptr [rbp + 0x428], rax
0x14581b0cd: mov r13, qword ptr [rbp + 0x1a0]
0x14581b0d4: movzx eax, word ptr [rbp + 0x1a8]
0x14581b0db: mov word ptr [rbp + 0x3f8], ax
0x14581b0e2: mov rax, qword ptr [rbp + 0x1aa]
0x14581b0e9: mov qword ptr [rbp + 0x400], rax
0x14581b0f0: mov rax, qword ptr [rbp + 0x1b0]
0x14581b0f7: mov qword ptr [rbp + 0x406], rax
0x14581b0fe: mov rax, qword ptr [rbp + 0x1b8]
0x14581b105: mov qword ptr [rbp + 0x3f0], rax
0x14581b10c: mov r12d, dword ptr [rbp + 0x1c0]
0x14581b113: movups xmm0, xmmword ptr [rbp + 0x1c4]
0x14581b11a: movaps xmmword ptr [rbp - 0x60], xmm0
0x14581b11e: movups xmm0, xmmword ptr [rbp + 0x1d4]
0x14581b125: movaps xmmword ptr [rbp - 0x50], xmm0
0x14581b129: movups xmm0, xmmword ptr [rbp + 0x1e4]
0x14581b130: movaps xmmword ptr [rbp - 0x40], xmm0
0x14581b134: movups xmm0, xmmword ptr [rbp + 0x1f4]
0x14581b13b: movaps xmmword ptr [rbp - 0x30], xmm0
0x14581b13f: movups xmm0, xmmword ptr [rbp + 0x204]
0x14581b146: movaps xmmword ptr [rbp - 0x20], xmm0
0x14581b14a: movups xmm0, xmmword ptr [rbp + 0x210]
0x14581b151: movups xmmword ptr [rbp - 0x14], xmm0
0x14581b155: movabs rax, 0x800000000000000e
0x14581b15f: mov qword ptr [rbp + 0x468], rax
0x14581b166: mov dword ptr [rbp + 0x458], eax
0x14581b16c: mov dword ptr [rbp + 0x450], eax
0x14581b172: jmp 0x14581b1ce
0x14581b174: movzx edi, byte ptr [rbp + 0x400]
0x14581b17b: movzx eax, byte ptr [rbp + 0x401]
0x14581b182: mov dword ptr [rbp + 0x460], eax
0x14581b188: mov eax, dword ptr [rbp + 0x402]
0x14581b18e: movzx ecx, word ptr [rbp + 0x406]
0x14581b195: shl rcx, 0x20
0x14581b199: or rcx, rax
0x14581b19c: mov rax, qword ptr [rbp + 0x408]
0x14581b1a3: mov qword ptr [rbp + 0x428], rax
0x14581b1aa: mov r13, qword ptr [rbp + 0x410]
0x14581b1b1: movabs rax, 0x800000000000000a
0x14581b1bb: mov qword ptr [rbp + 0x468], rax
0x14581b1c2: mov dword ptr [rbp + 0x458], eax
0x14581b1c8: mov dword ptr [rbp + 0x450], eax
0x14581b1ce: mov r11, qword ptr [rbp + 0x468]
0x14581b1d5: mov qword ptr [rbp + 0x190], r11
0x14581b1dc: mov byte ptr [rbp + 0x198], dil
0x14581b1e3: mov edi, dword ptr [rbp + 0x460]
0x14581b1e9: mov byte ptr [rbp + 0x199], dil
0x14581b1f0: mov dword ptr [rbp + 0x19a], ecx
0x14581b1f6: shr rcx, 0x20
0x14581b1fa: mov word ptr [rbp + 0x19e], cx
0x14581b201: mov rcx, qword ptr [rbp + 0x428]
0x14581b208: mov qword ptr [rbp + 0x1a0], rcx
0x14581b20f: mov qword ptr [rbp + 0x1a8], r13
0x14581b216: movzx ecx, word ptr [rbp + 0x3f8]
0x14581b21d: mov word ptr [rbp + 0x1b0], cx
0x14581b224: mov rcx, qword ptr [rbp + 0x400]
0x14581b22b: mov qword ptr [rbp + 0x1b2], rcx
0x14581b232: mov rcx, qword ptr [rbp + 0x406]
0x14581b239: mov qword ptr [rbp + 0x1b8], rcx
0x14581b240: mov rcx, qword ptr [rbp + 0x3f0]
0x14581b247: mov qword ptr [rbp + 0x1c0], rcx
0x14581b24e: mov dword ptr [rbp + 0x1c8], r12d
0x14581b255: movaps xmm1, xmmword ptr [rbp - 0x60]
0x14581b259: movaps xmm2, xmmword ptr [rbp - 0x50]
0x14581b25d: movaps xmm3, xmmword ptr [rbp - 0x40]
0x14581b261: movaps xmm4, xmmword ptr [rbp - 0x30]
0x14581b265: movups xmmword ptr [rbp + 0x1cc], xmm1
0x14581b26c: movups xmmword ptr [rbp + 0x1dc], xmm2
0x14581b273: movups xmmword ptr [rbp + 0x1ec], xmm3
0x14581b27a: movups xmmword ptr [rbp + 0x1fc], xmm4
0x14581b281: movaps xmm1, xmmword ptr [rbp - 0x20]
0x14581b285: movups xmmword ptr [rbp + 0x20c], xmm1
0x14581b28c: movaps xmm1, xmmword ptr [rbp - 0x10]
0x14581b290: movups xmmword ptr [rbp + 0x21c], xmm1
0x14581b297: movaps xmm1, xmmword ptr [rbp]
0x14581b29b: movups xmmword ptr [rbp + 0x22c], xmm1
0x14581b2a2: movups xmm1, xmmword ptr [rbp + 0xc]
0x14581b2a6: movups xmmword ptr [rbp + 0x238], xmm1
0x14581b2ad: mov ecx, dword ptr [rbp + 0xfc]
0x14581b2b3: mov dword ptr [rbp + 0x248], ecx
0x14581b2b9: mov ecx, dword ptr [rbp + 0x170]
0x14581b2bf: mov dword ptr [rbp + 0x24c], ecx
0x14581b2c5: mov ecx, dword ptr [rbp + 0x100]
0x14581b2cb: mov dword ptr [rbp + 0x250], ecx
0x14581b2d1: mov ecx, dword ptr [rbp + 0x178]
0x14581b2d7: mov dword ptr [rbp + 0x254], ecx
0x14581b2dd: mov ecx, dword ptr [rbp + 0x104]
0x14581b2e3: mov dword ptr [rbp + 0x258], ecx
0x14581b2e9: mov ecx, dword ptr [rbp + 0x3c8]
0x14581b2ef: mov dword ptr [rbp + 0x25c], ecx
0x14581b2f5: mov ecx, dword ptr [rbp + 0x108]
0x14581b2fb: mov dword ptr [rbp + 0x260], ecx
0x14581b301: mov ecx, dword ptr [rbp + 0x180]
0x14581b307: mov dword ptr [rbp + 0x264], ecx
0x14581b30d: mov ecx, dword ptr [rbp + 0x10c]
0x14581b313: mov dword ptr [rbp + 0x268], ecx
0x14581b319: mov ecx, dword ptr [rbp + 0x188]
0x14581b31f: mov dword ptr [rbp + 0x26c], ecx
0x14581b325: mov ecx, dword ptr [rbp + 0x110]
0x14581b32b: mov dword ptr [rbp + 0x270], ecx
0x14581b331: mov ecx, dword ptr [rbp + 0x3e8]
0x14581b337: mov dword ptr [rbp + 0x274], ecx
0x14581b33d: mov ecx, dword ptr [rbp + 0x114]
0x14581b343: mov dword ptr [rbp + 0x278], ecx
0x14581b349: mov ecx, dword ptr [rbp + 0x3d0]
0x14581b34f: mov dword ptr [rbp + 0x27c], ecx
0x14581b355: mov ecx, dword ptr [rbp + 0x118]
0x14581b35b: mov dword ptr [rbp + 0x280], ecx
0x14581b361: mov ecx, dword ptr [rbp + 0x39c]
0x14581b367: mov dword ptr [rbp + 0x284], ecx
0x14581b36d: mov ecx, dword ptr [rbp + 0x11c]
0x14581b373: mov dword ptr [rbp + 0x288], ecx
0x14581b379: mov ecx, dword ptr [rbp + 0x3a0]
0x14581b37f: mov dword ptr [rbp + 0x28c], ecx
0x14581b385: mov ecx, dword ptr [rbp + 0x120]
0x14581b38b: mov dword ptr [rbp + 0x290], ecx
0x14581b391: mov ecx, dword ptr [rbp + 0x3a4]
0x14581b397: mov dword ptr [rbp + 0x294], ecx
0x14581b39d: mov ecx, dword ptr [rbp + 0x124]
0x14581b3a3: mov dword ptr [rbp + 0x298], ecx
0x14581b3a9: mov ecx, dword ptr [rbp + 0x3a8]
0x14581b3af: mov dword ptr [rbp + 0x29c], ecx
0x14581b3b5: mov ecx, dword ptr [rbp + 0x128]
0x14581b3bb: mov dword ptr [rbp + 0x2a0], ecx
0x14581b3c1: mov ecx, dword ptr [rbp + 0x3ac]
0x14581b3c7: mov dword ptr [rbp + 0x2a4], ecx
0x14581b3cd: mov ecx, dword ptr [rbp + 0x12c]
0x14581b3d3: mov dword ptr [rbp + 0x2a8], ecx
0x14581b3d9: mov ecx, dword ptr [rbp + 0x3b0]
0x14581b3df: mov dword ptr [rbp + 0x2ac], ecx
0x14581b3e5: mov ecx, dword ptr [rbp + 0x130]
0x14581b3eb: mov dword ptr [rbp + 0x2b0], ecx
0x14581b3f1: mov ecx, dword ptr [rbp + 0x3b4]
0x14581b3f7: mov dword ptr [rbp + 0x2b4], ecx
0x14581b3fd: mov ecx, dword ptr [rbp + 0x134]
0x14581b403: mov dword ptr [rbp + 0x2b8], ecx
0x14581b409: mov ecx, dword ptr [rbp + 0x3b8]
0x14581b40f: mov dword ptr [rbp + 0x2bc], ecx
0x14581b415: mov ecx, dword ptr [rbp + 0x138]
0x14581b41b: mov dword ptr [rbp + 0x2c0], ecx
0x14581b421: mov ecx, dword ptr [rbp + 0x3bc]
0x14581b427: mov dword ptr [rbp + 0x2c4], ecx
0x14581b42d: mov ecx, dword ptr [rbp + 0x13c]
0x14581b433: mov dword ptr [rbp + 0x2c8], ecx
0x14581b439: mov ecx, dword ptr [rbp + 0x3c0]
0x14581b43f: mov dword ptr [rbp + 0x2cc], ecx
0x14581b445: mov ecx, dword ptr [rbp + 0x140]
0x14581b44b: mov dword ptr [rbp + 0x2d0], ecx
0x14581b451: mov ecx, dword ptr [rbp + 0x3c4]
0x14581b457: mov dword ptr [rbp + 0x2d4], ecx
0x14581b45d: mov ecx, dword ptr [rbp + 0x144]
0x14581b463: mov dword ptr [rbp + 0x2d8], ecx
0x14581b469: mov ecx, dword ptr [rbp + 0x3e4]
0x14581b46f: mov dword ptr [rbp + 0x2dc], ecx
0x14581b475: mov rcx, qword ptr [rbp + 0xb8]
0x14581b47c: mov qword ptr [rbp + 0x2e0], rcx
0x14581b483: mov ecx, dword ptr [rbp + 0x458]
0x14581b489: mov byte ptr [rbp + 0x2e8], cl
0x14581b48f: mov rcx, qword ptr [rbp + 0x40]
0x14581b493: mov qword ptr [rbp + 0x2f0], rcx
0x14581b49a: mov ecx, dword ptr [rbp + 0x450]
0x14581b4a0: mov byte ptr [rbp + 0x2f8], cl
0x14581b4a6: mov ecx, dword ptr [rbp + 0xf0]
0x14581b4ac: mov dword ptr [rbp + 0x300], ecx
0x14581b4b2: mov ecx, dword ptr [rbp + 0xf4]
0x14581b4b8: mov dword ptr [rbp + 0x304], ecx
0x14581b4be: movss dword ptr [rbp + 0x308], xmm0
0x14581b4c6: movzx ecx, byte ptr [rbp + 0x425]
0x14581b4cd: mov byte ptr [rbp + 0x30c], cl
0x14581b4d3: movzx ecx, byte ptr [rbp + 0x420]
0x14581b4da: mov byte ptr [rbp + 0x30d], cl
0x14581b4e0: movzx ecx, byte ptr [rbp + 0x424]
0x14581b4e7: mov byte ptr [rbp + 0x30e], cl
0x14581b4ed: movzx ecx, byte ptr [rbp + 0x41e]
0x14581b4f4: mov byte ptr [rbp + 0x30f], cl
0x14581b4fa: mov rcx, qword ptr [rbp + 0x38]
0x14581b4fe: mov qword ptr [rbp + 0x310], rcx
0x14581b505: mov ecx, dword ptr [rbp + 0xc4]
0x14581b50b: mov dword ptr [rbp + 0x318], ecx
0x14581b511: mov ecx, dword ptr [rbp + 0xc8]
0x14581b517: mov dword ptr [rbp + 0x31c], ecx
0x14581b51d: mov ecx, dword ptr [rbp + 0xcc]
0x14581b523: mov dword ptr [rbp + 0x320], ecx
0x14581b529: mov ecx, dword ptr [rbp + 0xd0]
0x14581b52f: mov dword ptr [rbp + 0x324], ecx
0x14581b535: mov ecx, dword ptr [rbp + 0xd4]
0x14581b53b: mov dword ptr [rbp + 0x328], ecx
0x14581b541: mov ecx, dword ptr [rbp + 0xd8]
0x14581b547: mov dword ptr [rbp + 0x32c], ecx
0x14581b54d: mov ecx, dword ptr [rbp + 0xdc]
0x14581b553: mov dword ptr [rbp + 0x330], ecx
0x14581b559: mov ecx, dword ptr [rbp + 0xe0]
0x14581b55f: mov dword ptr [rbp + 0x334], ecx
0x14581b565: mov ecx, dword ptr [rbp + 0xf8]
0x14581b56b: mov dword ptr [rbp + 0x338], ecx
0x14581b571: mov ecx, dword ptr [rbp + 0xe4]
0x14581b577: mov dword ptr [rbp + 0x33c], ecx
0x14581b57d: mov ecx, dword ptr [rbp + 0xe8]
0x14581b583: mov dword ptr [rbp + 0x340], ecx
0x14581b589: mov ecx, dword ptr [rbp + 0xec]
0x14581b58f: mov dword ptr [rbp + 0x344], ecx
0x14581b595: mov dword ptr [rbp + 0x348], r10d
0x14581b59c: mov dword ptr [rbp + 0x34c], edx
0x14581b5a2: mov dword ptr [rbp + 0x350], r8d
0x14581b5a9: mov dword ptr [rbp + 0x354], ebx
0x14581b5af: mov dword ptr [rbp + 0x358], r14d
0x14581b5b6: mov dword ptr [rbp + 0x35c], r9d
0x14581b5bd: mov dword ptr [rbp + 0x360], r15d
0x14581b5c4: mov dword ptr [rbp + 0x364], esi
0x14581b5ca: movzx ecx, byte ptr [rbp + 0x421]
0x14581b5d1: mov byte ptr [rbp + 0x368], cl
0x14581b5d7: movzx ecx, byte ptr [rbp + 0x422]
0x14581b5de: mov byte ptr [rbp + 0x369], cl
0x14581b5e4: movzx ecx, byte ptr [rbp + 0x423]
0x14581b5eb: mov byte ptr [rbp + 0x36a], cl
0x14581b5f1: movzx ecx, byte ptr [rbp + 0x41d]
0x14581b5f8: mov byte ptr [rbp + 0x36b], cl
0x14581b5fe: movzx ecx, byte ptr [rbp + 0x41f]
0x14581b605: mov byte ptr [rbp + 0x36c], cl
0x14581b60b: movzx ecx, byte ptr [rbp + 0x41c]
0x14581b612: mov byte ptr [rbp + 0x36d], cl
0x14581b618: mov rcx, rax
0x14581b61b: shr rcx, 0x20
0x14581b61f: mov byte ptr [rbp + 0x372], cl
0x14581b625: mov dword ptr [rbp + 0x36e], eax
0x14581b62b: movzx eax, byte ptr [rbp + 0x426]
0x14581b632: mov byte ptr [rbp + 0x373], al
0x14581b638: cmp byte ptr [rbp + 0x448], 0
0x14581b63f: je 0x14581b65c
0x14581b641: lea rdx, [rbp + 0x190]
0x14581b648: mov r8d, 0x1e8
0x14581b64e: mov rcx, qword ptr [rbp + 0x168]
0x14581b655: call 0x145d145fb
0x14581b65a: jmp 0x14581b676
0x14581b65c: mov rax, qword ptr [rbp + 0x168]
0x14581b663: mov qword ptr [rax], 0xffffffffffffffff
0x14581b66a: lea rcx, [rbp + 0x190]
0x14581b671: call 0x145812e60
0x14581b676: mov rax, qword ptr [rbp + 0x168]
0x14581b67d: movaps xmm6, xmmword ptr [rbp + 0x480]
0x14581b684: movaps xmm7, xmmword ptr [rbp + 0x490]
0x14581b68b: movaps xmm8, xmmword ptr [rbp + 0x4a0]
0x14581b693: add rsp, 0x538
0x14581b69a: pop rbx
0x14581b69b: pop rdi
0x14581b69c: pop rsi
0x14581b69d: pop r12
0x14581b69f: pop r13
0x14581b6a1: pop r14
0x14581b6a3: pop r15
0x14581b6a5: pop rbp
0x14581b6a6: ret
0x14581b6a7: mov qword ptr [rbp + 0x190], 0xffffffffffffffff
0x14581b6b2: mov qword ptr [rbp + 0x428], r15
0x14581b6b9: mov byte ptr [rbp + 0x425], bl
0x14581b6bf: mov byte ptr [rbp + 0x424], r13b
0x14581b6c6: lea rcx, [rbp + 0x430]
0x14581b6cd: call 0x145b7c850
0x14581b6d2: mov dword ptr [rbp + 0x164], eax
0x14581b6d8: lea rcx, [rbp + 0x430]
0x14581b6df: call 0x145b7c560
0x14581b6e4: mov byte ptr [rbp + 0x426], al
0x14581b6ea: lea rcx, [rbp + 0x48]
0x14581b6ee: lea rdx, [rbp + 0x430]
0x14581b6f5: call 0x145b7c600
0x14581b6fa: nop
0x14581b6fb: xor ecx, ecx
0x14581b6fd: cmp sil, 4
0x14581b701: movzx eax, sil
0x14581b705: cmovae eax, ecx
0x14581b708: mov qword ptr [rbp + 0x40], rdi
0x14581b70c: cmp rdi, 1
0x14581b710: mov edx, 0
0x14581b715: sbb edx, edx
0x14581b717: or dl, al
0x14581b719: mov dword ptr [rbp + 0x450], edx
0x14581b71f: movzx eax, byte ptr [rbp + 0x458]
0x14581b726: cmp al, 4
0x14581b728: movzx eax, al
0x14581b72b: cmovae eax, ecx
0x14581b72e: cmp qword ptr [rbp + 0xb8], 1
0x14581b736: sbb ecx, ecx
0x14581b738: or cl, al
0x14581b73a: mov dword ptr [rbp + 0x458], ecx
0x14581b740: xor eax, eax
0x14581b742: cmp r14d, -1
0x14581b746: setne al
0x14581b749: mov dword ptr [rbp + 0x144], eax
0x14581b74f: xor eax, eax
0x14581b751: cmp dword ptr [rbp + 0x3c4], -1
0x14581b758: setne al
0x14581b75b: mov dword ptr [rbp + 0x140], eax
0x14581b761: xor eax, eax
0x14581b763: cmp dword ptr [rbp + 0x3c0], -1
0x14581b76a: setne al
0x14581b76d: mov dword ptr [rbp + 0x13c], eax
0x14581b773: xor eax, eax
0x14581b775: cmp dword ptr [rbp + 0x3bc], -1
0x14581b77c: setne al
0x14581b77f: mov dword ptr [rbp + 0x138], eax
0x14581b785: xor eax, eax
0x14581b787: cmp dword ptr [rbp + 0x3b8], -1
0x14581b78e: setne al
0x14581b791: mov dword ptr [rbp + 0x134], eax
0x14581b797: xor eax, eax
0x14581b799: cmp dword ptr [rbp + 0x3b4], -1
0x14581b7a0: setne al
0x14581b7a3: mov dword ptr [rbp + 0x130], eax
0x14581b7a9: xor eax, eax
0x14581b7ab: cmp dword ptr [rbp + 0x3b0], -1
0x14581b7b2: setne al
0x14581b7b5: mov dword ptr [rbp + 0x12c], eax
0x14581b7bb: xor eax, eax
0x14581b7bd: cmp dword ptr [rbp + 0x3ac], -1
0x14581b7c4: setne al
0x14581b7c7: mov dword ptr [rbp + 0x128], eax
0x14581b7cd: xor eax, eax
0x14581b7cf: cmp dword ptr [rbp + 0x3a8], -1
0x14581b7d6: setne al
0x14581b7d9: mov dword ptr [rbp + 0x124], eax
0x14581b7df: xor eax, eax
0x14581b7e1: cmp dword ptr [rbp + 0x3a4], -1
0x14581b7e8: setne al
0x14581b7eb: mov dword ptr [rbp + 0x120], eax
0x14581b7f1: xor eax, eax
0x14581b7f3: cmp dword ptr [rbp + 0x3a0], -1
0x14581b7fa: setne al
0x14581b7fd: mov dword ptr [rbp + 0x11c], eax
0x14581b803: xor eax, eax
0x14581b805: cmp dword ptr [rbp + 0x39c], -1
0x14581b80c: setne al
0x14581b80f: mov dword ptr [rbp + 0x118], eax
0x14581b815: xor eax, eax
0x14581b817: cmp dword ptr [rbp + 0x3d0], -1
0x14581b81e: setne al
0x14581b821: mov dword ptr [rbp + 0x114], eax
0x14581b827: xor eax, eax
0x14581b829: cmp dword ptr [rbp + 0x3e8], -1
0x14581b830: setne al
0x14581b833: mov dword ptr [rbp + 0x110], eax
0x14581b839: xor eax, eax
0x14581b83b: cmp dword ptr [rbp + 0x188], -1
0x14581b842: setne al
0x14581b845: mov dword ptr [rbp + 0x10c], eax
0x14581b84b: xor eax, eax
0x14581b84d: cmp dword ptr [rbp + 0x180], -1
0x14581b854: setne al
0x14581b857: mov dword ptr [rbp + 0x108], eax
0x14581b85d: xor eax, eax
0x14581b85f: cmp dword ptr [rbp + 0x3c8], -1
0x14581b866: setne al
0x14581b869: mov dword ptr [rbp + 0x104], eax
0x14581b86f: xor eax, eax
0x14581b871: cmp dword ptr [rbp + 0x178], -1
0x14581b878: setne al
0x14581b87b: mov dword ptr [rbp + 0x100], eax
0x14581b881: xor eax, eax
0x14581b883: cmp dword ptr [rbp + 0x170], -1
0x14581b88a: setne al
0x14581b88d: mov dword ptr [rbp + 0xfc], eax
0x14581b893: movzx eax, byte ptr [rbp + 0x427]
0x14581b89a: shl rax, 0x20
0x14581b89e: movzx ecx, byte ptr [rbp + 0x3e4]
0x14581b8a5: shl ecx, 0x18
0x14581b8a8: or rcx, rax
0x14581b8ab: movzx eax, byte ptr [rbp + 0x3f0]
0x14581b8b2: shl eax, 0x10
0x14581b8b5: or rax, rcx
0x14581b8b8: movzx ecx, byte ptr [rbp + 0x3f8]
0x14581b8bf: shl ecx, 8
0x14581b8c2: or rcx, rax
0x14581b8c5: movzx eax, byte ptr [rbp + 0x460]
0x14581b8cc: or rax, rcx
0x14581b8cf: mov rcx, qword ptr [rbp + 0x38a]
0x14581b8d6: mov qword ptr [rbp + 0x400], rcx
0x14581b8dd: mov rcx, qword ptr [rbp + 0x390]
0x14581b8e4: mov qword ptr [rbp + 0x406], rcx
0x14581b8eb: movups xmm0, xmmword ptr [rbp + 0x190]
0x14581b8f2: movups xmm1, xmmword ptr [rbp + 0x1a0]
0x14581b8f9: movups xmm2, xmmword ptr [rbp + 0x1b0]
0x14581b900: movups xmm3, xmmword ptr [rbp + 0x1c0]
0x14581b907: movups xmmword ptr [rbp - 0x54], xmm0
0x14581b90b: movups xmmword ptr [rbp - 0x44], xmm1
0x14581b90f: movups xmmword ptr [rbp - 0x34], xmm2
0x14581b913: movups xmmword ptr [rbp - 0x24], xmm3
0x14581b917: movups xmm0, xmmword ptr [rbp + 0x1d0]
0x14581b91e: movups xmmword ptr [rbp - 0x14], xmm0
0x14581b922: movups xmm0, xmmword ptr [rbp + 0x1e0]
0x14581b929: movups xmmword ptr [rbp - 4], xmm0
0x14581b92d: movups xmm0, xmmword ptr [rbp + 0x1f0]
0x14581b934: movups xmmword ptr [rbp + 0xc], xmm0
0x14581b938: mov rcx, qword ptr [rbp + 0x54]
0x14581b93c: mov qword ptr [rbp - 0x60], rcx
0x14581b940: mov ecx, dword ptr [rbp + 0x5c]
0x14581b943: mov dword ptr [rbp - 0x58], ecx
0x14581b946: xorps xmm1, xmm1
0x14581b949: maxss xmm1, xmm6
0x14581b94d: movss xmm0, dword ptr [rip + 0x6c455b]
0x14581b955: minss xmm0, xmm1
0x14581b959: mov rdi, qword ptr [rbp + 0x3d8]
0x14581b960: mov ecx, edi
0x14581b962: shr ecx, 8
0x14581b965: mov dword ptr [rbp + 0x460], ecx
0x14581b96b: mov rcx, rdi
0x14581b96e: shr rcx, 0x10
0x14581b972: mov r13, qword ptr [rbp + 0x380]
0x14581b979: movzx edx, word ptr [rbp + 0x388]
0x14581b980: mov word ptr [rbp + 0x3f8], dx
0x14581b987: mov r11, qword ptr [rbp + 0x48]
0x14581b98b: mov qword ptr [rbp + 0x3f0], r11
0x14581b992: mov r12d, dword ptr [rbp + 0x50]
0x14581b996: mov dword ptr [rbp + 0x3e4], r14d
0x14581b99d: mov r10d, dword ptr [rbp + 0x148]
0x14581b9a4: mov edx, dword ptr [rbp + 0x14c]
0x14581b9aa: mov r8d, dword ptr [rbp + 0x150]
0x14581b9b1: mov ebx, dword ptr [rbp + 0x154]
0x14581b9b7: mov r14d, dword ptr [rbp + 0x158]
0x14581b9be: mov r9d, dword ptr [rbp + 0x15c]
0x14581b9c5: mov r15d, dword ptr [rbp + 0x160]
0x14581b9cc: mov esi, dword ptr [rbp + 0x164]
0x14581b9d2: jmp 0x14581b1ce
0x14581b9d7: test dl, dl
0x14581b9d9: setne al
0x14581b9dc: mov dword ptr [rbp + 0x460], eax
0x14581b9e2: mov dword ptr [rbp + 0x458], eax
0x14581b9e8: mov dword ptr [rbp + 0x450], eax
0x14581b9ee: movabs r11, 0x8000000000000007
0x14581b9f8: mov qword ptr [rbp + 0x468], r11
0x14581b9ff: mov dil, 9
0x14581ba02: jmp 0x14581b1ce
0x14581ba07: test dl, dl
0x14581ba09: setne al
0x14581ba0c: mov dword ptr [rbp + 0x460], eax
0x14581ba12: mov dword ptr [rbp + 0x458], eax
0x14581ba18: mov dword ptr [rbp + 0x450], eax
0x14581ba1e: movabs r11, 0x8000000000000007
0x14581ba28: mov qword ptr [rbp + 0x468], r11
0x14581ba2f: mov dil, 7
0x14581ba32: jmp 0x14581b1ce
0x14581ba37: test dl, dl
0x14581ba39: setne al
0x14581ba3c: mov dword ptr [rbp + 0x460], eax
0x14581ba42: mov dword ptr [rbp + 0x458], eax
0x14581ba48: mov dword ptr [rbp + 0x450], eax
0x14581ba4e: movabs r11, 0x8000000000000007
0x14581ba58: mov qword ptr [rbp + 0x468], r11
0x14581ba5f: mov dil, 8
0x14581ba62: jmp 0x14581b1ce
