0x14581d7b0: push rbp
0x14581d7b1: push r15
0x14581d7b3: push r14
0x14581d7b5: push r13
0x14581d7b7: push r12
0x14581d7b9: push rsi
0x14581d7ba: push rdi
0x14581d7bb: push rbx
0x14581d7bc: sub rsp, 0x108
0x14581d7c3: lea rbp, [rsp + 0x80]
0x14581d7cb: movdqa xmmword ptr [rbp + 0x70], xmm10
0x14581d7d1: movdqa xmmword ptr [rbp + 0x60], xmm9
0x14581d7d7: movdqa xmmword ptr [rbp + 0x50], xmm8
0x14581d7dd: movdqa xmmword ptr [rbp + 0x40], xmm7
0x14581d7e2: movaps xmmword ptr [rbp + 0x30], xmm6
0x14581d7e6: mov qword ptr [rbp + 0x28], 0xfffffffffffffffe
0x14581d7ee: mov r15, qword ptr [rdx + 0x2b0]
0x14581d7f5: test r15, r15
0x14581d7f8: jns 0x14581d80a
0x14581d7fa: xor r14d, r14d
0x14581d7fd: mov rcx, r14
0x14581d800: mov rdx, r15
0x14581d803: call 0x145eb6fcb
0x14581d808: ud2
0x14581d80a: mov rdi, rdx
0x14581d80d: mov rsi, rcx
0x14581d810: movss xmm6, dword ptr [rdx + 0xb9c]
0x14581d818: movzx eax, byte ptr [rdx + 0xc46]
0x14581d81f: mov byte ptr [rbp + 0x25], al
0x14581d822: movzx eax, byte ptr [rdx + 0xc41]
0x14581d829: mov byte ptr [rbp + 0x26], al
0x14581d82c: movzx eax, byte ptr [rdx + 0xc47]
0x14581d833: mov byte ptr [rbp + 0x27], al
0x14581d836: mov eax, dword ptr [rdx + 0x4f0]
0x14581d83c: mov dword ptr [rbp - 0x34], eax
0x14581d83f: mov eax, dword ptr [rdx + 0xab8]
0x14581d845: mov dword ptr [rbp - 0x3c], eax
0x14581d848: mov eax, dword ptr [rdx + 0x7ac]
0x14581d84e: mov dword ptr [rbp - 0x44], eax
0x14581d851: mov eax, dword ptr [rdx + 0x7a8]
0x14581d857: mov dword ptr [rbp - 0x38], eax
0x14581d85a: mov eax, dword ptr [rdx + 0x7a4]
0x14581d860: mov dword ptr [rbp - 0x30], eax
0x14581d863: mov eax, dword ptr [rdx + 0x79c]
0x14581d869: mov dword ptr [rbp - 0x40], eax
0x14581d86c: mov r13d, dword ptr [rdx + 0x7b0]
0x14581d873: movzx eax, word ptr [rdx + 0x2c8]
0x14581d87a: mov word ptr [rbp + 0x22], ax
0x14581d87e: movzx eax, word ptr [rdx + 0x2ca]
0x14581d885: mov word ptr [rbp + 0x20], ax
0x14581d889: movzx eax, word ptr [rdx + 0x2cc]
0x14581d890: mov word ptr [rbp + 0x1e], ax
0x14581d894: movzx eax, word ptr [rdx + 0x2ce]
0x14581d89b: mov word ptr [rbp - 0x18], ax
0x14581d89f: movdqu xmm9, xmmword ptr [rdx + 0x31c]
0x14581d8a8: movdqu xmm8, xmmword ptr [rdx + 0x30c]
0x14581d8b1: movdqu xmm10, xmmword ptr [rdx + 0x2fc]
0x14581d8ba: movdqu xmm7, xmmword ptr [rdx + 0x2ec]
0x14581d8c2: movzx r12d, byte ptr [rdx + 0x32c]
0x14581d8ca: mov eax, dword ptr [rdx + 0x2e0]
0x14581d8d0: mov dword ptr [rbp - 0x2c], eax
0x14581d8d3: mov eax, dword ptr [rdx + 0x2e4]
0x14581d8d9: mov dword ptr [rbp - 0x24], eax
0x14581d8dc: mov eax, dword ptr [rdx + 0x2e8]
0x14581d8e2: mov dword ptr [rbp - 0x28], eax
0x14581d8e5: mov qword ptr [rbp - 0x58], r15
0x14581d8e9: mov byte ptr [rbp + 0x24], r12b
0x14581d8ed: mov dword ptr [rbp - 0x48], r13d
0x14581d8f1: je 0x14581d92f
0x14581d8f3: mov rbx, qword ptr [rdi + 0x2a8]
0x14581d8fa: call 0x140002200
0x14581d8ff: mov r14d, 1
0x14581d905: mov edx, 1
0x14581d90a: mov rcx, r15
0x14581d90d: call 0x1400021c0
0x14581d912: test rax, rax
0x14581d915: je 0x14581d7fd
0x14581d91b: mov qword ptr [rbp - 0x20], rax
0x14581d91f: mov rcx, rax
0x14581d922: mov rdx, rbx
0x14581d925: mov r8, r15
0x14581d928: call 0x145d145fb
0x14581d92d: jmp 0x14581d938
0x14581d92f: mov eax, 1
0x14581d934: mov qword ptr [rbp - 0x20], rax
0x14581d938: mov r13, qword ptr [rdi + 0x718]
0x14581d93f: lea rbx, [r13*8]
0x14581d947: mov rax, r13
0x14581d94a: shr rax, 0x3d
0x14581d94e: setne al
0x14581d951: movabs r12, 0x7ffffffffffffffc
0x14581d95b: cmp rbx, r12
0x14581d95e: seta cl
0x14581d961: or cl, al
0x14581d963: je 0x14581d979
0x14581d965: xor r15d, r15d
0x14581d968: mov rcx, r15
0x14581d96b: mov rdx, rbx
0x14581d96e: call 0x145eb6fcb
0x14581d973: nop
0x14581d974: jmp 0x14581da7e
0x14581d979: mov r14, qword ptr [rdi + 0x710]
0x14581d980: test rbx, rbx
0x14581d983: je 0x14581da80
0x14581d989: call 0x140002200
0x14581d98e: mov r15d, 4
0x14581d994: mov edx, 4
0x14581d999: mov rcx, rbx
0x14581d99c: call 0x1400021c0
0x14581d9a1: mov qword ptr [rbp + 8], rax
0x14581d9a5: test rax, rax
0x14581d9a8: je 0x14581d968
0x14581d9aa: mov qword ptr [rbp - 0x10], r13
0x14581d9ae: test r13, r13
0x14581d9b1: je 0x14581d9c2
0x14581d9b3: mov rcx, qword ptr [rbp + 8]
0x14581d9b7: mov rdx, r14
0x14581d9ba: mov r8, rbx
0x14581d9bd: call 0x145d145fb
0x14581d9c2: mov r15, qword ptr [rdi + 0x730]
0x14581d9c9: lea rax, [r15*4]
0x14581d9d1: lea rbx, [rax + rax*2]
0x14581d9d5: movabs rax, 0xaaaaaaaaaaaaaaa
0x14581d9df: cmp r15, rax
0x14581d9e2: jbe 0x14581d9f8
0x14581d9e4: xor r15d, r15d
0x14581d9e7: mov rcx, r15
0x14581d9ea: mov rdx, rbx
0x14581d9ed: call 0x145eb6fcb
0x14581d9f2: nop
0x14581d9f3: jmp 0x14581da7e
0x14581d9f8: mov rdx, qword ptr [rdi + 0x728]
0x14581d9ff: test rbx, rbx
0x14581da02: je 0x14581dd45
0x14581da08: mov qword ptr [rbp], rdx
0x14581da0c: mov r14, r15
0x14581da0f: call 0x140002200
0x14581da14: mov r15d, 4
0x14581da1a: mov edx, 4
0x14581da1f: mov rcx, rbx
0x14581da22: call 0x1400021c0
0x14581da27: mov qword ptr [rbp + 0x10], rax
0x14581da2b: test rax, rax
0x14581da2e: je 0x14581d9e7
0x14581da30: mov r15, r14
0x14581da33: mov qword ptr [rbp - 8], r14
0x14581da37: mov rdx, qword ptr [rbp]
0x14581da3b: test r15, r15
0x14581da3e: je 0x14581da4c
0x14581da40: mov rcx, qword ptr [rbp + 0x10]
0x14581da44: mov r8, rbx
0x14581da47: call 0x145d145fb
0x14581da4c: mov r14, qword ptr [rdi + 0x748]
0x14581da53: lea rbx, [r14*4]
0x14581da5b: mov rax, r14
0x14581da5e: shr rax, 0x3e
0x14581da62: setne al
0x14581da65: cmp rbx, r12
0x14581da68: seta cl
0x14581da6b: or cl, al
0x14581da6d: je 0x14581da9f
0x14581da6f: xor r15d, r15d
0x14581da72: mov rcx, r15
0x14581da75: mov rdx, rbx
0x14581da78: call 0x145eb6fcb
0x14581da7d: nop
0x14581da7e: ud2
0x14581da80: mov eax, 4
0x14581da85: mov qword ptr [rbp + 8], rax
0x14581da89: mov qword ptr [rbp - 0x10], 0
0x14581da91: test r13, r13
0x14581da94: jne 0x14581d9b3
0x14581da9a: jmp 0x14581d9c2
0x14581da9f: mov qword ptr [rbp], r15
0x14581daa3: mov rdi, qword ptr [rdi + 0x740]
0x14581daaa: test rbx, rbx
0x14581daad: je 0x14581dd64
0x14581dab3: call 0x140002200
0x14581dab8: mov r15d, 4
0x14581dabe: mov edx, 4
0x14581dac3: mov rcx, rbx
0x14581dac6: call 0x1400021c0
0x14581dacb: test rax, rax
0x14581dace: je 0x14581da72
0x14581dad0: mov r12, rax
0x14581dad3: mov qword ptr [rbp - 0x50], r14
0x14581dad7: mov qword ptr [rbp - 0x60], r14
0x14581dadb: test r14, r14
0x14581dade: je 0x14581daee
0x14581dae0: mov rcx, r12
0x14581dae3: mov rdx, rdi
0x14581dae6: mov r8, rbx
0x14581dae9: call 0x145d145fb
0x14581daee: mov eax, dword ptr [rbp - 0x2c]
0x14581daf1: or eax, dword ptr [rbp - 0x24]
0x14581daf4: or eax, dword ptr [rbp - 0x28]
0x14581daf7: movzx eax, word ptr [rbp + 0x22]
0x14581dafb: cvtsi2ss xmm0, eax
0x14581daff: movzx eax, word ptr [rbp + 0x20]
0x14581db03: cvtsi2ss xmm3, eax
0x14581db07: movzx eax, word ptr [rbp + 0x1e]
0x14581db0b: cvtsi2ss xmm2, eax
0x14581db0f: movzx eax, word ptr [rbp - 0x18]
0x14581db13: cvtsi2ss xmm1, eax
0x14581db17: pxor xmm4, xmm4
0x14581db1b: pcmpeqd xmm7, xmm4
0x14581db1f: pcmpeqd xmm10, xmm4
0x14581db24: packssdw xmm7, xmm10
0x14581db29: pcmpeqd xmm8, xmm4
0x14581db2e: pcmpeqd xmm9, xmm4
0x14581db33: packssdw xmm8, xmm9
0x14581db38: packsswb xmm7, xmm8
0x14581db3d: sete r10b
0x14581db41: pmovmskb r8d, xmm7
0x14581db46: mov ecx, r8d
0x14581db49: shr ecx, 0xf
0x14581db4c: mov edx, r8d
0x14581db4f: shr edx, 0xe
0x14581db52: mov r9d, r8d
0x14581db55: shr r9d, 0xd
0x14581db59: mov r11d, r8d
0x14581db5c: shr r11d, 0xc
0x14581db60: mov edi, r8d
0x14581db63: shr edi, 0xb
0x14581db66: mov eax, r8d
0x14581db69: shr eax, 0xa
0x14581db6c: mov qword ptr [rbp - 0x18], r12
0x14581db70: mov r12d, r8d
0x14581db73: shr r12d, 9
0x14581db77: mov r15d, r8d
0x14581db7a: shr r15d, 8
0x14581db7e: test r8b, r8b
0x14581db81: sets bl
0x14581db84: and bl, r15b
0x14581db87: and bl, r12b
0x14581db8a: mov r15d, r8d
0x14581db8d: shr r15b, 5
0x14581db91: mov r12d, r8d
0x14581db94: shr r12b, 4
0x14581db98: and r12b, r15b
0x14581db9b: mov r15d, r8d
0x14581db9e: shr r15b, 6
0x14581dba2: and r12b, r15b
0x14581dba5: mov r15d, r8d
0x14581dba8: shr r15b, 3
0x14581dbac: mov r14d, r8d
0x14581dbaf: shr r14b, 2
0x14581dbb3: and r14b, r15b
0x14581dbb6: and r10b, r8b
0x14581dbb9: shr r8b, 1
0x14581dbbc: and r8b, r10b
0x14581dbbf: and r8b, r14b
0x14581dbc2: and r8b, r12b
0x14581dbc5: and bl, r8b
0x14581dbc8: and al, dil
0x14581dbcb: and al, r11b
0x14581dbce: and al, r9b
0x14581dbd1: and al, dl
0x14581dbd3: and al, bl
0x14581dbd5: and al, cl
0x14581dbd7: cmp byte ptr [rbp + 0x26], 0
0x14581dbdb: movzx ecx, byte ptr [rbp + 0x27]
0x14581dbdf: movzx edx, byte ptr [rbp + 0x25]
0x14581dbe3: cmove ecx, edx
0x14581dbe6: and cl, 6
0x14581dbe9: cmp cl, 4
0x14581dbec: movss dword ptr [rsi + 0x60], xmm6
0x14581dbf1: mov byte ptr [rsi + 0x87], dl
0x14581dbf7: sete byte ptr [rsi + 0x84]
0x14581dbfe: mov ecx, dword ptr [rbp - 0x34]
0x14581dc01: mov dword ptr [rsi + 0x64], ecx
0x14581dc04: mov ecx, dword ptr [rbp - 0x3c]
0x14581dc07: mov byte ptr [rsi + 0x85], cl
0x14581dc0d: movss xmm4, dword ptr [rbp - 0x30]
0x14581dc12: movss xmm5, dword ptr [rbp - 0x38]
0x14581dc17: movss xmm6, dword ptr [rbp - 0x40]
0x14581dc1c: movss xmm7, dword ptr [rbp - 0x44]
0x14581dc21: unpcklps xmm4, xmm5
0x14581dc24: unpcklps xmm6, xmm7
0x14581dc27: movlhps xmm6, xmm4
0x14581dc2a: movups xmmword ptr [rsi + 0x68], xmm6
0x14581dc2e: mov ecx, dword ptr [rbp - 0x48]
0x14581dc31: mov dword ptr [rsi + 0x78], ecx
0x14581dc34: movss xmm4, dword ptr [rip + 0xddb6b4]
0x14581dc3c: movaps xmm5, xmm0
0x14581dc3f: addss xmm5, xmm4
0x14581dc43: movss xmm6, dword ptr [rip + 0x6c2775]
0x14581dc4b: divss xmm5, xmm6
0x14581dc4f: mulss xmm5, dword ptr [rip + 0x6d2919]
0x14581dc57: addss xmm3, xmm4
0x14581dc5b: divss xmm3, xmm6
0x14581dc5f: mulss xmm3, dword ptr [rip + 0x6d2811]
0x14581dc67: addss xmm2, xmm4
0x14581dc6b: divss xmm2, xmm6
0x14581dc6f: mulss xmm2, dword ptr [rip + 0x6c2701]
0x14581dc77: addss xmm3, xmm5
0x14581dc7b: addss xmm2, xmm3
0x14581dc7f: addss xmm1, xmm4
0x14581dc83: divss xmm1, xmm6
0x14581dc87: addss xmm1, xmm1
0x14581dc8b: addss xmm1, xmm2
0x14581dc8f: addss xmm1, dword ptr [rip + 0x6c2219]
0x14581dc97: minss xmm1, dword ptr [rip + 0x6c2611]
0x14581dc9f: divss xmm0, xmm6
0x14581dca3: movss dword ptr [rsi + 0x7c], xmm0
0x14581dca8: movss dword ptr [rsi + 0x80], xmm1
0x14581dcb0: mov byte ptr [rsi + 0x86], al
0x14581dcb6: movzx eax, byte ptr [rbp + 0x24]
0x14581dcba: mov byte ptr [rsi + 0x88], al
0x14581dcc0: mov rax, qword ptr [rbp - 0x58]
0x14581dcc4: mov qword ptr [rsi], rax
0x14581dcc7: mov rcx, qword ptr [rbp - 0x20]
0x14581dccb: mov qword ptr [rsi + 8], rcx
0x14581dccf: mov qword ptr [rsi + 0x10], rax
0x14581dcd3: mov rax, qword ptr [rbp - 0x10]
0x14581dcd7: mov qword ptr [rsi + 0x18], rax
0x14581dcdb: mov rax, qword ptr [rbp + 8]
0x14581dcdf: mov qword ptr [rsi + 0x20], rax
0x14581dce3: mov qword ptr [rsi + 0x28], r13
0x14581dce7: mov rax, qword ptr [rbp - 8]
0x14581dceb: mov qword ptr [rsi + 0x30], rax
0x14581dcef: mov rax, qword ptr [rbp + 0x10]
0x14581dcf3: mov qword ptr [rsi + 0x38], rax
0x14581dcf7: mov rax, qword ptr [rbp]
0x14581dcfb: mov qword ptr [rsi + 0x40], rax
0x14581dcff: mov rax, qword ptr [rbp - 0x50]
0x14581dd03: mov qword ptr [rsi + 0x48], rax
0x14581dd07: mov rax, qword ptr [rbp - 0x18]
0x14581dd0b: mov qword ptr [rsi + 0x50], rax
0x14581dd0f: mov rax, qword ptr [rbp - 0x60]
0x14581dd13: mov qword ptr [rsi + 0x58], rax
0x14581dd17: mov rax, rsi
0x14581dd1a: movaps xmm6, xmmword ptr [rbp + 0x30]
0x14581dd1e: movaps xmm7, xmmword ptr [rbp + 0x40]
0x14581dd22: movaps xmm8, xmmword ptr [rbp + 0x50]
0x14581dd27: movaps xmm9, xmmword ptr [rbp + 0x60]
0x14581dd2c: movaps xmm10, xmmword ptr [rbp + 0x70]
0x14581dd31: add rsp, 0x108
0x14581dd38: pop rbx
0x14581dd39: pop rdi
0x14581dd3a: pop rsi
0x14581dd3b: pop r12
0x14581dd3d: pop r13
0x14581dd3f: pop r14
0x14581dd41: pop r15
0x14581dd43: pop rbp
0x14581dd44: ret
0x14581dd45: mov eax, 4
0x14581dd4a: mov qword ptr [rbp + 0x10], rax
0x14581dd4e: mov qword ptr [rbp - 8], 0
0x14581dd56: test r15, r15
0x14581dd59: jne 0x14581da40
0x14581dd5f: jmp 0x14581da4c
0x14581dd64: mov r12d, 4
0x14581dd6a: mov qword ptr [rbp - 0x50], 0
0x14581dd72: mov qword ptr [rbp - 0x60], r14
0x14581dd76: test r14, r14
0x14581dd79: jne 0x14581dae0
0x14581dd7f: jmp 0x14581daee
