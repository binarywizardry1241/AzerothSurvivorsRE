145997a50: 55 push rbp
145997a51: 4157 push r15
145997a53: 4156 push r14
145997a55: 4155 push r13
145997a57: 4154 push r12
145997a59: 56 push rsi
145997a5a: 57 push rdi
145997a5b: 53 push rbx
145997a5c: 4881ec28010000 sub rsp, 0x128
145997a63: 488dac2480000000 lea rbp, [rsp + 0x80]
145997a6b: 48c785a0000000feffffff mov qword ptr [rbp + 0xa0], 0xfffffffffffffffe
145997a76: 4889d7 mov rdi, rdx
145997a79: 48894d70 mov qword ptr [rbp + 0x70], rcx
145997a7d: 488d424c lea rax, [rdx + 0x4c]
145997a81: 48c7457800000000 mov qword ptr [rbp + 0x78], 0
145997a89: 48c7858000000004000000 mov qword ptr [rbp + 0x80], 4
145997a94: 48c7858800000000000000 mov qword ptr [rbp + 0x88], 0
145997a9f: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
145997aa7: 48c7453800000000 mov qword ptr [rbp + 0x38], 0
145997aaf: 48895558 mov qword ptr [rbp + 0x58], rdx
145997ab3: 48894560 mov qword ptr [rbp + 0x60], rax
145997ab7: 31db xor ebx, ebx
145997ab9: 4c8d75a8 lea r14, [rbp - 0x58]
145997abd: 4531ff xor r15d, r15d
145997ac0: 4885db test rbx, rbx
145997ac3: 0f94c0 sete al
145997ac6: 4989dd mov r13, rbx
145997ac9: 488b4d68 mov rcx, qword ptr [rbp + 0x68]
145997acd: a801 test al, 1
145997acf: 756f jne 0x145997b40
145997ad1: 4939cc cmp r12, rcx
145997ad4: 48894d68 mov qword ptr [rbp + 0x68], rcx
145997ad8: 0f8412010000 je 0x145997bf0
145997ade: 498d442408 lea rax, [r12 + 8]
145997ae3: 48898598000000 mov qword ptr [rbp + 0x98], rax
145997aea: 48894520 mov qword ptr [rbp + 0x20], rax
145997aee: 498b3424 mov rsi, qword ptr [r12]
145997af2: 83feff cmp esi, -1
145997af5: 0f8516010000 jne 0x145997c11
145997afb: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
145997b02: 4885c0 test rax, rax
145997b05: 7416 je 0x145997b1d
145997b07: 488d14c500000000 lea rdx, [rax*8]
145997b0f: 41b804000000 mov r8d, 4
145997b15: 4c89e9 mov rcx, r13
145997b18: e8b3a666fa call 0x1400021d0
145997b1d: 48c7451800000000 mov qword ptr [rbp + 0x18], 0
145997b25: 41bd00000000 mov r13d, 0
145997b2b: bb00000000 mov ebx, 0
145997b30: 83feff cmp esi, -1
145997b33: 0f85db000000 jne 0x145997c14
145997b39: 0f1f8000000000 nop dword ptr [rax]
145997b40: 4983ff4c cmp r15, 0x4c
145997b44: 0f84d2020000 je 0x145997e1c
145997b4a: 4a8d043f lea rax, [rdi + r15]
145997b4e: 4883c004 add rax, 4
145997b52: 48894558 mov qword ptr [rbp + 0x58], rax
145997b56: 428b143f mov edx, dword ptr [rdi + r15]
145997b5a: 4c89f1 mov rcx, r14
145997b5d: e85ee8ffff call 0x1459963c0
145997b62: 90 nop
145997b63: 4983c704 add r15, 4
145997b67: 488b55a8 mov rdx, qword ptr [rbp - 0x58]
145997b6b: 4883faff cmp rdx, -1
145997b6f: 74cf je 0x145997b40
145997b71: 4885d2 test rdx, rdx
145997b74: 740f je 0x145997b85
145997b76: 488b4db0 mov rcx, qword ptr [rbp - 0x50]
145997b7a: 41b801000000 mov r8d, 1
145997b80: e84ba666fa call 0x1400021d0
145997b85: 488b75c0 mov rsi, qword ptr [rbp - 0x40]
145997b89: 4883feff cmp rsi, -1
145997b8d: 0f8489020000 je 0x145997e1c
145997b93: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
145997b97: 488b5dd0 mov rbx, qword ptr [rbp - 0x30]
145997b9b: 4d85ed test r13, r13
145997b9e: 7423 je 0x145997bc3
145997ba0: 4883bd9000000000 cmp qword ptr [rbp + 0x90], 0
145997ba8: 7419 je 0x145997bc3
145997baa: 488b9590000000 mov rdx, qword ptr [rbp + 0x90]
145997bb1: 48c1e203 shl rdx, 3
145997bb5: 41b804000000 mov r8d, 4
145997bbb: 4c89e9 mov rcx, r13
145997bbe: e80da666fa call 0x1400021d0
145997bc3: 498d0cdc lea rcx, [r12 + rbx*8]
145997bc7: 4c896518 mov qword ptr [rbp + 0x18], r12
145997bcb: 4c896520 mov qword ptr [rbp + 0x20], r12
145997bcf: 48897528 mov qword ptr [rbp + 0x28], rsi
145997bd3: 48894d30 mov qword ptr [rbp + 0x30], rcx
145997bd7: 31c0 xor eax, eax
145997bd9: 4889b590000000 mov qword ptr [rbp + 0x90], rsi
145997be0: 4d89e5 mov r13, r12
145997be3: a801 test al, 1
145997be5: 0f8555ffffff jne 0x145997b40
145997beb: e9e1feffff jmp 0x145997ad1
145997bf0: beffffffff mov esi, 0xffffffff
145997bf5: 4c89a598000000 mov qword ptr [rbp + 0x98], r12
145997bfc: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
145997c03: 4885c0 test rax, rax
145997c06: 0f85fbfeffff jne 0x145997b07
145997c0c: e90cffffff jmp 0x145997b1d
145997c11: 4c89eb mov rbx, r13
145997c14: 83feff cmp esi, -1
145997c17: 0f84fc010000 je 0x145997e19
145997c1d: 488b8580000000 mov rax, qword ptr [rbp + 0x80]
145997c24: 4c8ba588000000 mov r12, qword ptr [rbp + 0x88]
145997c2b: 4a8d14e500000000 lea rdx, [r12*8]
145997c33: 4531c0 xor r8d, r8d
145997c36: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
145997c40: 4c39c2 cmp rdx, r8
145997c43: 743c je 0x145997c81
145997c45: 498d4808 lea rcx, [r8 + 8]
145997c49: 42393400 cmp dword ptr [rax + r8], esi
145997c4d: 4989c8 mov r8, rcx
145997c50: 75ee jne 0x145997c40
145997c52: 4c8b4408f8 mov r8, qword ptr [rax + rcx - 8]
145997c57: 4c89c2 mov rdx, r8
145997c5a: 48c1ea20 shr rdx, 0x20
145997c5e: 4189f1 mov r9d, esi
145997c61: 4531c1 xor r9d, r8d
145997c64: 744c je 0x145997cb2
145997c66: 4589c0 mov r8d, r8d
145997c69: 4c8ba598000000 mov r12, qword ptr [rbp + 0x98]
145997c70: 48c1e220 shl rdx, 0x20
145997c74: 4c09c2 or rdx, r8
145997c77: 48895408f8 mov qword ptr [rax + rcx - 8], rdx
145997c7c: e93ffeffff jmp 0x145997ac0
145997c81: 4c3b6578 cmp r12, qword ptr [rbp + 0x78]
145997c85: 7511 jne 0x145997c98
145997c87: 488d4d78 lea rcx, [rbp + 0x78]
145997c8b: e8e0e72700 call 0x145c16470
145997c90: 90 nop
145997c91: 488b8580000000 mov rax, qword ptr [rbp + 0x80]
145997c98: 4a8934e0 mov qword ptr [rax + r12*8], rsi
145997c9c: 49ffc4 inc r12
145997c9f: 4c89a588000000 mov qword ptr [rbp + 0x88], r12
145997ca6: 4c8ba598000000 mov r12, qword ptr [rbp + 0x98]
145997cad: e90efeffff jmp 0x145997ac0
145997cb2: 48c1ee20 shr rsi, 0x20
145997cb6: 4589c0 mov r8d, r8d
145997cb9: 4c8d0d84928801 lea r9, [rip + 0x1889284]
145997cc0: 4f630481 movsxd r8, dword ptr [r9 + r8*4]
145997cc4: 4d01c8 add r8, r9
145997cc7: 4c8ba598000000 mov r12, qword ptr [rbp + 0x98]
145997cce: 41ffe0 jmp r8
145997cd1: 660f6ec2 movd xmm0, edx
145997cd5: 660f6ece movd xmm1, esi
145997cd9: f30f58c8 addss xmm1, xmm0
145997cdd: 660f7eca movd edx, xmm1
145997ce1: 4531c0 xor r8d, r8d
145997ce4: eb8a jmp 0x145997c70
145997ce6: 01f2 add edx, esi
145997ce8: 41b80b000000 mov r8d, 0xb
145997cee: eb80 jmp 0x145997c70
145997cf0: 660f6ec2 movd xmm0, edx
145997cf4: 660f6ece movd xmm1, esi
145997cf8: f30f58c8 addss xmm1, xmm0
145997cfc: 660f7eca movd edx, xmm1
145997d00: 41b804000000 mov r8d, 4
145997d06: e965ffffff jmp 0x145997c70
145997d0b: 660f6ec2 movd xmm0, edx
145997d0f: 660f6ece movd xmm1, esi
145997d13: f30f58c8 addss xmm1, xmm0
145997d17: 660f7eca movd edx, xmm1
145997d1b: 41b80c000000 mov r8d, 0xc
145997d21: e94affffff jmp 0x145997c70
145997d26: 660f6ec2 movd xmm0, edx
145997d2a: 660f6ece movd xmm1, esi
145997d2e: f30f58c8 addss xmm1, xmm0
145997d32: 660f7eca movd edx, xmm1
145997d36: 41b809000000 mov r8d, 9
145997d3c: e92fffffff jmp 0x145997c70
145997d41: 660f6ec2 movd xmm0, edx
145997d45: 660f6ece movd xmm1, esi
145997d49: f30f58c8 addss xmm1, xmm0
145997d4d: 660f7eca movd edx, xmm1
145997d51: 41b802000000 mov r8d, 2
145997d57: e914ffffff jmp 0x145997c70
145997d5c: 660f6ec2 movd xmm0, edx
145997d60: 660f6ece movd xmm1, esi
145997d64: f30f58c8 addss xmm1, xmm0
145997d68: 660f7eca movd edx, xmm1
145997d6c: 41b803000000 mov r8d, 3
145997d72: e9f9feffff jmp 0x145997c70
145997d77: 660f6ec2 movd xmm0, edx
145997d7b: 660f6ece movd xmm1, esi
145997d7f: f30f58c8 addss xmm1, xmm0
145997d83: 660f7eca movd edx, xmm1
145997d87: 41b807000000 mov r8d, 7
145997d8d: e9defeffff jmp 0x145997c70
145997d92: 660f6ec2 movd xmm0, edx
145997d96: 660f6ece movd xmm1, esi
145997d9a: f30f58c8 addss xmm1, xmm0
145997d9e: 660f7eca movd edx, xmm1
145997da2: 41b801000000 mov r8d, 1
145997da8: e9c3feffff jmp 0x145997c70
145997dad: 660f6ec2 movd xmm0, edx
145997db1: 660f6ece movd xmm1, esi
145997db5: f30f58c8 addss xmm1, xmm0
145997db9: 660f7eca movd edx, xmm1
145997dbd: 41b805000000 mov r8d, 5
145997dc3: e9a8feffff jmp 0x145997c70
145997dc8: 660f6ec2 movd xmm0, edx
145997dcc: 660f6ece movd xmm1, esi
145997dd0: f30f58c8 addss xmm1, xmm0
145997dd4: 660f7eca movd edx, xmm1
145997dd8: 41b806000000 mov r8d, 6
145997dde: e98dfeffff jmp 0x145997c70
145997de3: 660f6ec2 movd xmm0, edx
145997de7: 660f6ece movd xmm1, esi
145997deb: f30f58c8 addss xmm1, xmm0
145997def: 660f7eca movd edx, xmm1
145997df3: 41b80a000000 mov r8d, 0xa
145997df9: e972feffff jmp 0x145997c70
145997dfe: 660f6ec2 movd xmm0, edx
145997e02: 660f6ece movd xmm1, esi
145997e06: f30f58c8 addss xmm1, xmm0
145997e0a: 660f7eca movd edx, xmm1
145997e0e: 41b808000000 mov r8d, 8
145997e14: e957feffff jmp 0x145997c70
145997e19: 4989dd mov r13, rbx
145997e1c: 4d85ed test r13, r13
145997e1f: 488b9590000000 mov rdx, qword ptr [rbp + 0x90]
145997e26: 7417 je 0x145997e3f
145997e28: 4885d2 test rdx, rdx
145997e2b: 7412 je 0x145997e3f
145997e2d: 48c1e203 shl rdx, 3
145997e31: 41b804000000 mov r8d, 4
145997e37: 4c89e9 mov rcx, r13
145997e3a: e891a366fa call 0x1400021d0
145997e3f: 488b8d88000000 mov rcx, qword ptr [rbp + 0x88]
145997e46: 488b4570 mov rax, qword ptr [rbp + 0x70]
145997e4a: 48894810 mov qword ptr [rax + 0x10], rcx
145997e4e: 0f104578 movups xmm0, xmmword ptr [rbp + 0x78]
145997e52: 0f1100 movups xmmword ptr [rax], xmm0
145997e55: 4881c428010000 add rsp, 0x128
145997e5c: 5b pop rbx
145997e5d: 5f pop rdi
145997e5e: 5e pop rsi
145997e5f: 415c pop r12
145997e61: 415d pop r13
145997e63: 415e pop r14
145997e65: 415f pop r15
145997e67: 5d pop rbp
145997e68: c3 ret
