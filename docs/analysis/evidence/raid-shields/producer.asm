145959aa1: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
145959aa8: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
145959aaf: 4839d0 cmp rax, rdx
145959ab2: 0f8362310000 jae 0x14595cc1a
145959ab8: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
145959abf: f30f107104 movss xmm6, dword ptr [rcx + 4]
145959ac4: 448b39 mov r15d, dword ptr [rcx]
145959ac7: 488d0c18 lea rcx, [rax + rbx]
145959acb: f3440f58fe addss xmm15, xmm6
145959ad0: f3440f11bc18cc010000 movss dword ptr [rax + rbx + 0x1cc], xmm15
145959ada: e8c13efbff call 0x14590d9a0
145959adf: 4889c3 mov rbx, rax
145959ae2: 4989d6 mov r14, rdx
145959ae5: 4889f1 mov rcx, rsi
145959ae8: 488bbd80010000 mov rdi, qword ptr [rbp + 0x180]
145959aef: 4889fa mov rdx, rdi
145959af2: 4589f8 mov r8d, r15d
145959af5: 41b101 mov r9b, 1
145959af8: e8436a0200 call 0x145980540
145959afd: 4489bd10010000 mov dword ptr [rbp + 0x110], r15d
145959b04: c6853d01000025 mov byte ptr [rbp + 0x13d], 0x25
145959b0b: 4c8d8d10010000 lea r9, [rbp + 0x110]
145959b12: 4889f1 mov rcx, rsi
145959b15: 0f28ce movaps xmm1, xmm6
145959b18: 4989f8 mov r8, rdi
145959b1b: e840d7ffff call 0x145957260
145959b20: 4881c618060000 add rsi, 0x618
145959b27: c7856001000002000000 mov dword ptr [rbp + 0x160], 2
145959b31: c785c000000000000000 mov dword ptr [rbp + 0xc0], 0
145959b3b: 488d85c0000000 lea rax, [rbp + 0xc0]
145959b42: 4889442430 mov qword ptr [rsp + 0x30], rax
145959b47: 488d8560010000 lea rax, [rbp + 0x160]
145959b4e: 4889442428 mov qword ptr [rsp + 0x28], rax
145959b53: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145959b5c: 4c8da510010000 lea r12, [rbp + 0x110]
145959b63: 41b908000000 mov r9d, 8
145959b69: 4589f8 mov r8d, r15d
145959b6c: 4c89e1 mov rcx, r12
145959b6f: 4889fa mov rdx, rdi
145959b72: e8f93bf7ff call 0x1458cd770
145959b77: 4889f1 mov rcx, rsi
145959b7a: 4c89e2 mov rdx, r12
145959b7d: e8eece83fb call 0x141196a70
145959b82: 488d3dbf118d01 lea rdi, [rip + 0x18d11bf]
145959b89: 41bf0f000000 mov r15d, 0xf
145959b8f: ba0f000000 mov edx, 0xf
145959b94: 4889f9 mov rcx, rdi
145959b97: e86429f9ff call 0x1458ec500
145959b9c: 4885c0 test rax, rax
145959b9f: 480f45f8 cmovne rdi, rax
145959ba3: 490f44d7 cmove rdx, r15
145959ba7: 4889542420 mov qword ptr [rsp + 0x20], rdx
145959bac: 4c8dbd10010000 lea r15, [rbp + 0x110]
145959bb3: 4c89f9 mov rcx, r15
145959bb6: 4889da mov rdx, rbx
145959bb9: 4d89f0 mov r8, r14
145959bbc: 4989f9 mov r9, rdi
145959bbf: e904160000 jmp 0x14595b1c8
