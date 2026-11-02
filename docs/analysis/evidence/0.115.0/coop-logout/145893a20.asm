0x145893a20: push rbp
0x145893a21: push r15
0x145893a23: push r14
0x145893a25: push rsi
0x145893a26: push rdi
0x145893a27: push rbx
0x145893a28: sub rsp, 0x648
0x145893a2f: lea rbp, [rsp + 0x80]
0x145893a37: movaps xmmword ptr [rbp + 0x5b0], xmm6
0x145893a3e: mov qword ptr [rbp + 0x5a8], 0xfffffffffffffffe
0x145893a49: xor esi, esi
0x145893a4b: cmp dword ptr [rcx + 0xc58], 1
0x145893a52: ja 0x145893dc9
0x145893a58: mov rdi, rcx
0x145893a5b: cmp byte ptr [rcx + 0xf49], 0
0x145893a62: je 0x145893dc9
0x145893a68: mov ecx, dword ptr [rdx]
0x145893a6a: sub ecx, 2
0x145893a6d: mov eax, 0xb
0x145893a72: cmovae eax, ecx
0x145893a75: cmp eax, 0x1a
0x145893a78: ja 0x145893c75
0x145893a7e: lea rbx, [rdi + 0xc58]
0x145893a85: mov sil, 1
0x145893a88: lea rcx, [rip + 0x179c22d]
0x145893a8f: movsxd rax, dword ptr [rcx + rax*4]
0x145893a93: add rax, rcx
0x145893a96: jmp rax
0x145893a98: mov rcx, qword ptr [rdi + 0xf10]
0x145893a9f: mov rdx, qword ptr [rdi + 0xf18]
0x145893aa6: lea r8, [rdi + 0xc80]
0x145893aad: call 0x145824200
0x145893ab2: mov r14, qword ptr [rdi + 0xf10]
0x145893ab9: mov r15, qword ptr [rdi + 0xf18]
0x145893ac0: lea rdx, [rip + 0x1799629]
0x145893ac7: lea rcx, [rbp + 0x2a0]
0x145893ace: call 0x14581c690
0x145893ad3: mov rdx, qword ptr [rbp + 0x2a8]
0x145893ada: mov r8, qword ptr [rbp + 0x2b0]
0x145893ae1: lock add qword ptr [rip + 0x298365f], r8
0x145893ae9: lock inc qword ptr [rip + 0x2983667]
0x145893af1: mov rcx, r14
0x145893af4: mov qword ptr [rbp + 0x5a0], rdx
0x145893afb: call qword ptr [r15 + 0x18]
0x145893aff: nop
0x145893b00: mov rdx, qword ptr [rbp + 0x2a0]
0x145893b07: test rdx, rdx
0x145893b0a: je 0x145893b1e
0x145893b0c: mov r8d, 1
0x145893b12: mov rcx, qword ptr [rbp + 0x5a0]
0x145893b19: call 0x1400021d0
0x145893b1e: mov rax, qword ptr [rdi + 0x1590]
0x145893b25: mov qword ptr [rdi + 0x1590], 0xffffffffffffffff
0x145893b30: cmp rax, -1
0x145893b34: je 0x145893b6f
0x145893b36: lea rdx, [rdi + 0x1598]
0x145893b3d: mov qword ptr [rbp + 0x2a0], rax
0x145893b44: lea rcx, [rbp + 0x2a8]
0x145893b4b: mov r8d, 0x140
0x145893b51: call 0x145d145fb
0x145893b56: lea rcx, [rbp + 0x3c8]
0x145893b5d: call 0x14581e820
0x145893b62: nop
0x145893b63: lea rcx, [rbp + 0x2a0]
0x145893b6a: call 0x145871650
0x145893b6f: lea rcx, [rbp + 0x2a0]
0x145893b76: mov r8d, 0x2f8
0x145893b7c: mov rdx, rbx
0x145893b7f: call 0x145d145fb
0x145893b84: mov qword ptr [rbx], 2
0x145893b8b: mov rax, qword ptr [rbp + 0x2a0]
0x145893b92: cmp rax, 1
0x145893b96: ja 0x145893de2
0x145893b9c: lea rcx, [rbp - 0x58]
0x145893ba0: lea rdx, [rbp + 0x2a0]
0x145893ba7: mov r8d, 0x2f8
0x145893bad: call 0x145d145fb
0x145893bb2: mov rcx, qword ptr [rbp + 0x260]
0x145893bb9: mov rax, qword ptr [rbp + 0x268]
0x145893bc0: call qword ptr [rax + 0x30]
0x145893bc3: nop
0x145893bc4: cmp byte ptr [rbp + 0x299], 0
0x145893bcb: je 0x145893bd6
0x145893bcd: mov rcx, rdi
0x145893bd0: call 0x1458948f0
0x145893bd5: nop
0x145893bd6: mov qword ptr [rsp + 0x20], 0x10
0x145893bdf: lea rdx, [rip + 0x1799302]
0x145893be6: lea r9, [rip + 0x17998fb]
0x145893bed: mov r8d, 5
0x145893bf3: mov rcx, rdi
0x145893bf6: call 0x145893140
0x145893bfb: nop
0x145893bfc: lea rcx, [rbp - 0x58]
0x145893c00: call 0x145871d50
0x145893c05: jmp 0x145893dc9
0x145893c0a: movzx eax, byte ptr [rdx + 4]
0x145893c0e: mov byte ptr [rdi + 0x180c], al
0x145893c14: mov r14b, 8
0x145893c17: cmp byte ptr [rdi], 0
0x145893c1a: je 0x145893cc0
0x145893c20: jmp 0x145893ccd
0x145893c25: mov r14b, 3
0x145893c28: cmp byte ptr [rdi], 0
0x145893c2b: je 0x145893cc0
0x145893c31: jmp 0x145893ccd
0x145893c36: movzx eax, byte ptr [rdx + 4]
0x145893c3a: mov byte ptr [rdi + 0x180d], al
0x145893c40: mov r14b, 9
0x145893c43: cmp byte ptr [rdi], 0
0x145893c46: je 0x145893cc0
0x145893c48: jmp 0x145893ccd
0x145893c4d: mov r14b, 6
0x145893c50: cmp byte ptr [rdi], 0
0x145893c53: je 0x145893cc0
0x145893c55: jmp 0x145893ccd
0x145893c57: mov rcx, qword ptr [rdx + 8]
0x145893c5b: cmp rcx, 0xff
0x145893c62: mov eax, 0xff
0x145893c67: cmovb rax, rcx
0x145893c6b: mov r14b, 2
0x145893c6e: cmp byte ptr [rdi], 0
0x145893c71: je 0x145893cc0
0x145893c73: jmp 0x145893ccd
0x145893c75: xor esi, esi
0x145893c77: jmp 0x145893dc9
0x145893c7c: mov r14b, 1
0x145893c7f: cmp byte ptr [rdi], 0
0x145893c82: je 0x145893cc0
0x145893c84: jmp 0x145893ccd
0x145893c86: mov rcx, qword ptr [rdx + 8]
0x145893c8a: cmp rcx, 0xff
0x145893c91: mov eax, 0xff
0x145893c96: cmovb rax, rcx
0x145893c9a: xor r14d, r14d
0x145893c9d: cmp byte ptr [rdi], 0
0x145893ca0: je 0x145893cc0
0x145893ca2: jmp 0x145893ccd
0x145893ca4: mov r14b, 4
0x145893ca7: cmp byte ptr [rdi], 0
0x145893caa: je 0x145893cc0
0x145893cac: jmp 0x145893ccd
0x145893cae: movzx eax, byte ptr [rdx + 4]
0x145893cb2: mov byte ptr [rdi + 0x180b], al
0x145893cb8: mov r14b, 7
0x145893cbb: cmp byte ptr [rdi], 0
0x145893cbe: jne 0x145893ccd
0x145893cc0: xorps xmm6, xmm6
0x145893cc3: jmp 0x145893cd2
0x145893cc5: mov r14b, 5
0x145893cc8: cmp byte ptr [rdi], 0
0x145893ccb: je 0x145893cc0
0x145893ccd: movsd xmm6, qword ptr [rdi + 8]
0x145893cd2: mov byte ptr [rbp + 0x2a8], r14b
0x145893cd9: mov byte ptr [rbp + 0x2a9], al
0x145893cdf: movabs rax, 0x8000000000000007
0x145893ce9: mov qword ptr [rbp + 0x2a0], rax
0x145893cf0: lea rcx, [rbp - 0x58]
0x145893cf4: lea rdx, [rbp + 0x2a0]
0x145893cfb: call 0x14581c690
0x145893d00: nop
0x145893d01: mov r15, qword ptr [rdi + 0xc90]
0x145893d08: cmp r15, qword ptr [rdi + 0xc80]
0x145893d0f: jne 0x145893d1e
0x145893d11: lea rcx, [rdi + 0xc80]
0x145893d18: call 0x145d14e50
0x145893d1d: nop
0x145893d1e: mov rax, qword ptr [rdi + 0xc88]
0x145893d25: lea rcx, [r15 + r15*2]
0x145893d29: mov rdx, qword ptr [rbp - 0x48]
0x145893d2d: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145893d32: movups xmm0, xmmword ptr [rbp - 0x58]
0x145893d36: movups xmmword ptr [rax + rcx*8], xmm0
0x145893d3a: inc r15
0x145893d3d: mov qword ptr [rdi + 0xc90], r15
0x145893d44: lea rcx, [rbp + 0x2a0]
0x145893d4b: call 0x1458712e0
0x145893d50: cmp r14b, 3
0x145893d54: je 0x145893d5e
0x145893d56: movzx eax, r14b
0x145893d5a: test eax, eax
0x145893d5c: jne 0x145893dc9
0x145893d5e: lea rcx, [rbp + 0x2a0]
0x145893d65: mov rdx, rbx
0x145893d68: movaps xmm2, xmm6
0x145893d6b: call 0x145816c60
0x145893d70: mov rax, qword ptr [rbp + 0x2a0]
0x145893d77: cmp rax, -1
0x145893d7b: je 0x145893dc9
0x145893d7d: mov qword ptr [rbp + 0x5a0], rax
0x145893d84: mov rdx, qword ptr [rbp + 0x2a8]
0x145893d8b: mov r8, qword ptr [rbp + 0x2b0]
0x145893d92: mov rcx, qword ptr [rdi + 0x16f0]
0x145893d99: mov rax, qword ptr [rdi + 0x16f8]
0x145893da0: mov qword ptr [rbp + 0x598], rdx
0x145893da7: call qword ptr [rax + 0x18]
0x145893daa: nop
0x145893dab: mov rdx, qword ptr [rbp + 0x5a0]
0x145893db2: test rdx, rdx
0x145893db5: je 0x145893dc9
0x145893db7: mov r8d, 1
0x145893dbd: mov rcx, qword ptr [rbp + 0x598]
0x145893dc4: call 0x1400021d0
0x145893dc9: mov eax, esi
0x145893dcb: movaps xmm6, xmmword ptr [rbp + 0x5b0]
0x145893dd2: add rsp, 0x648
0x145893dd9: pop rbx
0x145893dda: pop rdi
0x145893ddb: pop rsi
0x145893ddc: pop r14
0x145893dde: pop r15
0x145893de0: pop rbp
0x145893de1: ret
0x145893de2: cmp eax, 2
0x145893de5: je 0x145893dc9
0x145893de7: lea rcx, [rbp + 0x2a8]
0x145893dee: call 0x1458718c0
0x145893df3: jmp 0x145893dc9
