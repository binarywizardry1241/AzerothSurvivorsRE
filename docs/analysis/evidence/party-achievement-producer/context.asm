145b84e60: 55 push rbp
145b84e61: 4157 push r15
145b84e63: 4156 push r14
145b84e65: 4155 push r13
145b84e67: 4154 push r12
145b84e69: 56 push rsi
145b84e6a: 57 push rdi
145b84e6b: 53 push rbx
145b84e6c: 4883ec58 sub rsp, 0x58
145b84e70: 488d6c2450 lea rbp, [rsp + 0x50]
145b84e75: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
145b84e7d: 80ba850c000001 cmp byte ptr [rdx + 0xc85], 1
145b84e84: 7548 jne 0x145b84ece
145b84e86: 4883ba9809000000 cmp qword ptr [rdx + 0x998], 0
145b84e8e: 743e je 0x145b84ece
145b84e90: 4c8bb2a00a0000 mov r14, qword ptr [rdx + 0xaa0]
145b84e97: 4a8d34f500000000 lea rsi, [r14*8]
145b84e9f: 4c89f0 mov rax, r14
145b84ea2: 48c1e83d shr rax, 0x3d
145b84ea6: 0f95c0 setne al
145b84ea9: 49b8fcffffffffffff7f movabs r8, 0x7ffffffffffffffc
145b84eb3: 4c39c6 cmp rsi, r8
145b84eb6: 410f97c0 seta r8b
145b84eba: 4108c0 or r8b, al
145b84ebd: 742a je 0x145b84ee9
145b84ebf: 31db xor ebx, ebx
145b84ec1: 4889d9 mov rcx, rbx
145b84ec4: 4889f2 mov rdx, rsi
145b84ec7: e8ef5d5b00 call 0x14613acbb
145b84ecc: 0f0b ud2
145b84ece: 48c701ffffffff mov qword ptr [rcx], 0xffffffffffffffff
145b84ed5: 4889c8 mov rax, rcx
145b84ed8: 4883c458 add rsp, 0x58
145b84edc: 5b pop rbx
145b84edd: 5f pop rdi
145b84ede: 5e pop rsi
145b84edf: 415c pop r12
145b84ee1: 415d pop r13
145b84ee3: 415e pop r14
145b84ee5: 415f pop r15
145b84ee7: 5d pop rbp
145b84ee8: c3 ret
145b84ee9: 4989cf mov r15, rcx
145b84eec: 488bba980a0000 mov rdi, qword ptr [rdx + 0xa98]
145b84ef3: 4885f6 test rsi, rsi
145b84ef6: 4989d4 mov r12, rdx
145b84ef9: 0f84a0000000 je 0x145b84f9f
145b84eff: e8fcd247fa call 0x140002200
145b84f04: bb04000000 mov ebx, 4
145b84f09: ba04000000 mov edx, 4
145b84f0e: 4889f1 mov rcx, rsi
145b84f11: e8aad247fa call 0x1400021c0
145b84f16: 4885c0 test rax, rax
145b84f19: 74a6 je 0x145b84ec1
145b84f1b: 4989c5 mov r13, rax
145b84f1e: 4c8975f8 mov qword ptr [rbp - 8], r14
145b84f22: 4c89e2 mov rdx, r12
145b84f25: 4d85f6 test r14, r14
145b84f28: 7411 je 0x145b84f3b
145b84f2a: 4c89e9 mov rcx, r13
145b84f2d: 4889fa mov rdx, rdi
145b84f30: 4989f0 mov r8, rsi
145b84f33: e8a3ed4000 call 0x145f93cdb
145b84f38: 4c89e2 mov rdx, r12
145b84f3b: 4c896df0 mov qword ptr [rbp - 0x10], r13
145b84f3f: 8bb26c0c0000 mov esi, dword ptr [rdx + 0xc6c]
145b84f45: 4881c2a80a0000 add rdx, 0xaa8
145b84f4c: 488d4dd8 lea rcx, [rbp - 0x28]
145b84f50: e84ba00b00 call 0x145c3efa0
145b84f55: 90 nop
145b84f56: 410fb78424d8020000 movzx eax, word ptr [r12 + 0x2d8]
145b84f5f: 663b0578077201 cmp ax, word ptr [rip + 0x1720778]
145b84f66: 4c89f9 mov rcx, r15
145b84f69: 7308 jae 0x145b84f73
145b84f6b: 31c0 xor eax, eax
145b84f6d: 4c8b45f0 mov r8, qword ptr [rbp - 0x10]
145b84f71: eb58 jmp 0x145b84fcb
145b84f73: 410fb78424da020000 movzx eax, word ptr [r12 + 0x2da]
145b84f7c: 663b058b077201 cmp ax, word ptr [rip + 0x172078b]
145b84f83: 4c8b45f0 mov r8, qword ptr [rbp - 0x10]
145b84f87: 7212 jb 0x145b84f9b
145b84f89: 410fb78424dc020000 movzx eax, word ptr [r12 + 0x2dc]
145b84f92: 663b05a5077201 cmp ax, word ptr [rip + 0x17207a5]
145b84f99: 731d jae 0x145b84fb8
145b84f9b: 31c0 xor eax, eax
145b84f9d: eb2c jmp 0x145b84fcb
145b84f9f: 41bd04000000 mov r13d, 4
145b84fa5: 48c745f800000000 mov qword ptr [rbp - 8], 0
145b84fad: 4d85f6 test r14, r14
145b84fb0: 0f8574ffffff jne 0x145b84f2a
145b84fb6: eb83 jmp 0x145b84f3b
145b84fb8: 410fb78424de020000 movzx eax, word ptr [r12 + 0x2de]
145b84fc1: 663b05a6077201 cmp ax, word ptr [rip + 0x17207a6]
145b84fc8: 0f93c0 setae al
145b84fcb: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
145b84fcf: 48895128 mov qword ptr [rcx + 0x28], rdx
145b84fd3: 0f1045d8 movups xmm0, xmmword ptr [rbp - 0x28]
145b84fd7: 0f114118 movups xmmword ptr [rcx + 0x18], xmm0
145b84fdb: 488b55f8 mov rdx, qword ptr [rbp - 8]
145b84fdf: 488911 mov qword ptr [rcx], rdx
145b84fe2: 4c894108 mov qword ptr [rcx + 8], r8
145b84fe6: 4c897110 mov qword ptr [rcx + 0x10], r14
145b84fea: 897130 mov dword ptr [rcx + 0x30], esi
145b84fed: 884134 mov byte ptr [rcx + 0x34], al
145b84ff0: e9e0feffff jmp 0x145b84ed5
