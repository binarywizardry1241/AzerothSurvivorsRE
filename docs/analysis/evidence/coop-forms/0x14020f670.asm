0x14020f670: push rbp
0x14020f671: push r15
0x14020f673: push r14
0x14020f675: push r13
0x14020f677: push r12
0x14020f679: push rsi
0x14020f67a: push rdi
0x14020f67b: push rbx
0x14020f67c: sub rsp, 0x178
0x14020f683: lea rbp, [rsp + 0x80]
0x14020f68b: mov qword ptr [rbp + 0xf0], 0xfffffffffffffffe
0x14020f696: test r9b, r9b
0x14020f699: je 0x14020f8fa
0x14020f69f: mov bl, r9b
0x14020f6a2: mov r14, r8
0x14020f6a5: mov rsi, rdx
0x14020f6a8: mov rdi, rcx
0x14020f6ab: mov r15b, byte ptr [r8 + 0x38]
0x14020f6af: mov r12b, byte ptr [r8 + 0x39]
0x14020f6b3: mov r13b, byte ptr [r8 + 0x3a]
0x14020f6b7: lea rcx, [rbp + 0xc0]
0x14020f6be: mov rdx, r8
0x14020f6c1: call 0x145ce7810
0x14020f6c6: lea rdx, [r14 + 0x18]
0x14020f6ca: lea rcx, [rbp + 0xd8]
0x14020f6d1: call 0x145ce7810
0x14020f6d6: nop
0x14020f6d7: movzx eax, byte ptr [r14 + 0x3f]
0x14020f6dc: mov byte ptr [rbp - 0x11], al
0x14020f6df: mov eax, dword ptr [r14 + 0x3b]
0x14020f6e3: mov dword ptr [rbp - 0x15], eax
0x14020f6e6: mov rax, qword ptr [r14 + 0x30]
0x14020f6ea: mov rcx, qword ptr [rbp + 0xd0]
0x14020f6f1: mov qword ptr [rbp + 0xa0], rcx
0x14020f6f8: movups xmm0, xmmword ptr [rbp + 0xc0]
0x14020f6ff: movaps xmmword ptr [rbp + 0x90], xmm0
0x14020f706: mov rcx, qword ptr [rbp + 0xe8]
0x14020f70d: mov qword ptr [rbp + 0xb8], rcx
0x14020f714: movups xmm1, xmmword ptr [rbp + 0xd8]
0x14020f71b: movups xmmword ptr [rbp + 0xa8], xmm1
0x14020f722: movups xmmword ptr [rbp - 0x50], xmm0
0x14020f726: mov rcx, qword ptr [rbp + 0xb0]
0x14020f72d: mov qword ptr [rbp - 0x30], rcx
0x14020f731: mov rcx, qword ptr [rbp + 0xb8]
0x14020f738: mov qword ptr [rbp - 0x28], rcx
0x14020f73c: mov rcx, qword ptr [rbp + 0xa0]
0x14020f743: mov qword ptr [rbp - 0x40], rcx
0x14020f747: mov rcx, qword ptr [rbp + 0xa8]
0x14020f74e: mov qword ptr [rbp - 0x38], rcx
0x14020f752: mov qword ptr [rbp - 0x20], rax
0x14020f756: mov byte ptr [rbp - 0x18], r15b
0x14020f75a: mov byte ptr [rbp - 0x17], r12b
0x14020f75e: mov byte ptr [rbp - 0x16], r13b
0x14020f762: mov dword ptr [rbp - 0x58], 0xc
0x14020f769: lea rdx, [rbp - 0x58]
0x14020f76d: mov rcx, rsi
0x14020f770: call 0x14012c6a0
0x14020f775: cmp bl, 2
0x14020f778: jne 0x14020f83e
0x14020f77e: call 0x140002200
0x14020f783: mov ecx, 7
0x14020f788: mov edx, 1
0x14020f78d: call 0x1400021c0
0x14020f792: test rax, rax
0x14020f795: je 0x14020f90e
0x14020f79b: mov rbx, rax
0x14020f79e: mov dword ptr [rax + 3], 0x676e696e
0x14020f7a5: mov dword ptr [rax], 0x6e696f6a
0x14020f7ab: mov rdx, qword ptr [rdi]
0x14020f7ae: test rdx, rdx
0x14020f7b1: je 0x14020f7c2
0x14020f7b3: mov rcx, qword ptr [rdi + 8]
0x14020f7b7: mov r8d, 1
0x14020f7bd: call 0x1400021d0
0x14020f7c2: mov qword ptr [rdi], 7
0x14020f7c9: mov qword ptr [rdi + 8], rbx
0x14020f7cd: mov qword ptr [rdi + 0x10], 7
0x14020f7d5: mov rdx, qword ptr [rdi + 0xe0]
0x14020f7dc: mov r8, qword ptr [rdi + 0xe8]
0x14020f7e3: lea rcx, [rbp + 0xd8]
0x14020f7ea: call 0x145b79680
0x14020f7ef: add rdi, 0xf0
0x14020f7f6: lea rcx, [rbp + 0x90]
0x14020f7fd: mov rdx, rdi
0x14020f800: call 0x145ce7810
0x14020f805: nop
0x14020f806: mov rax, qword ptr [rbp + 0xe8]
0x14020f80d: mov qword ptr [rbp - 0x40], rax
0x14020f811: movups xmm0, xmmword ptr [rbp + 0xd8]
0x14020f818: movups xmmword ptr [rbp - 0x50], xmm0
0x14020f81c: movups xmm0, xmmword ptr [rbp + 0x90]
0x14020f823: movups xmmword ptr [rbp - 0x38], xmm0
0x14020f827: mov rax, qword ptr [rbp + 0xa0]
0x14020f82e: mov qword ptr [rbp - 0x28], rax
0x14020f832: mov dword ptr [rbp - 0x58], 0x16
0x14020f839: jmp 0x14020f8ed
0x14020f83e: lea rdx, [rdi + 0x90]
0x14020f845: lea rcx, [rbp + 0xc0]
0x14020f84c: call 0x145ce7810
0x14020f851: mov bl, byte ptr [rdi + 0x130]
0x14020f857: lea rdx, [rdi + 0xa8]
0x14020f85e: lea rcx, [rbp + 0xd8]
0x14020f865: call 0x145ce7810
0x14020f86a: nop
0x14020f86b: lea rdx, [rdi + 0xc0]
0x14020f872: lea rcx, [rbp + 0x90]
0x14020f879: call 0x145ce7810
0x14020f87e: nop
0x14020f87f: xor bl, 1
0x14020f882: movzx eax, byte ptr [rdi + 0x133]
0x14020f889: test al, al
0x14020f88b: je 0x14020f89c
0x14020f88d: movzx ecx, al
0x14020f890: cmp al, 5
0x14020f892: mov eax, 5
0x14020f897: cmovb eax, ecx
0x14020f89a: jmp 0x14020f89e
0x14020f89c: mov al, 5
0x14020f89e: mov rcx, qword ptr [rbp + 0xd0]
0x14020f8a5: mov qword ptr [rbp - 0x40], rcx
0x14020f8a9: movups xmm0, xmmword ptr [rbp + 0xc0]
0x14020f8b0: movups xmmword ptr [rbp - 0x50], xmm0
0x14020f8b4: mov byte ptr [rbp - 8], bl
0x14020f8b7: movups xmm0, xmmword ptr [rbp + 0xd8]
0x14020f8be: movups xmmword ptr [rbp - 0x38], xmm0
0x14020f8c2: mov rcx, qword ptr [rbp + 0xe8]
0x14020f8c9: mov qword ptr [rbp - 0x28], rcx
0x14020f8cd: movups xmm0, xmmword ptr [rbp + 0x90]
0x14020f8d4: movups xmmword ptr [rbp - 0x20], xmm0
0x14020f8d8: mov rcx, qword ptr [rbp + 0xa0]
0x14020f8df: mov qword ptr [rbp - 0x10], rcx
0x14020f8e3: mov byte ptr [rbp - 7], al
0x14020f8e6: mov dword ptr [rbp - 0x58], 0x15
0x14020f8ed: lea rdx, [rbp - 0x58]
0x14020f8f1: mov rcx, rsi
0x14020f8f4: call 0x14012c6a0
0x14020f8f9: nop
0x14020f8fa: add rsp, 0x178
0x14020f901: pop rbx
0x14020f902: pop rdi
0x14020f903: pop rsi
0x14020f904: pop r12
0x14020f906: pop r13
0x14020f908: pop r14
0x14020f90a: pop r15
0x14020f90c: pop rbp
0x14020f90d: ret
0x14020f90e: mov ecx, 1
0x14020f913: mov edx, 7
0x14020f918: call 0x145eb6fcb
0x14020f91d: ud2
