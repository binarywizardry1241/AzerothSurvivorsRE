0x14583bab0: push rbp
0x14583bab1: push rsi
0x14583bab2: push rdi
0x14583bab3: sub rsp, 0xc0
0x14583baba: lea rbp, [rsp + 0x80]
0x14583bac2: mov qword ptr [rbp + 0x38], 0xfffffffffffffffe
0x14583baca: mov rsi, rcx
0x14583bacd: mov rdi, qword ptr [rcx + 8]
0x14583bad1: mov r8, qword ptr [rcx + 0x10]
0x14583bad5: lea rax, [rip + 0x1490e83]
0x14583badc: mov qword ptr [rsp + 0x28], rax
0x14583bae1: mov qword ptr [rsp + 0x30], 3
0x14583baea: mov qword ptr [rsp + 0x20], 2
0x14583baf3: lea r9, [rip + 0x1490e63]
0x14583bafa: lea rcx, [rbp - 0x28]
0x14583bafe: mov rdx, rdi
0x14583bb01: call 0x14583a8d0
0x14583bb06: mov rdx, qword ptr [rbp - 0x20]
0x14583bb0a: mov r8, qword ptr [rbp - 0x18]
0x14583bb0e: lea rax, [rip + 0x1490e4f]
0x14583bb15: mov qword ptr [rsp + 0x28], rax
0x14583bb1a: mov qword ptr [rsp + 0x30], 3
0x14583bb23: mov qword ptr [rsp + 0x20], 2
0x14583bb2c: lea r9, [rip + 0x1490e2f]
0x14583bb33: lea rcx, [rbp - 0x10]
0x14583bb37: mov qword ptr [rbp + 0x20], rdx
0x14583bb3b: call 0x14583a8d0
0x14583bb40: nop
0x14583bb41: mov rdx, qword ptr [rbp - 8]
0x14583bb45: mov r8, qword ptr [rbp]
0x14583bb49: lea rax, [rip + 0x1490e19]
0x14583bb50: mov qword ptr [rsp + 0x28], rax
0x14583bb55: mov qword ptr [rsp + 0x30], 3
0x14583bb5e: mov qword ptr [rsp + 0x20], 2
0x14583bb67: lea r9, [rip + 0x1490df9]
0x14583bb6e: lea rcx, [rbp + 8]
0x14583bb72: mov qword ptr [rbp + 0x28], rdx
0x14583bb76: call 0x14583a8d0
0x14583bb7b: nop
0x14583bb7c: mov rdx, qword ptr [rbp + 0x10]
0x14583bb80: mov r8, qword ptr [rbp + 0x18]
0x14583bb84: lea rax, [rip + 0x1490de3]
0x14583bb8b: mov qword ptr [rsp + 0x28], rax
0x14583bb90: mov qword ptr [rsp + 0x30], 3
0x14583bb99: mov qword ptr [rsp + 0x20], 2
0x14583bba2: lea r9, [rip + 0x1490dc3]
0x14583bba9: lea rcx, [rbp - 0x40]
0x14583bbad: mov qword ptr [rbp + 0x30], rdx
0x14583bbb1: call 0x14583a8d0
0x14583bbb6: nop
0x14583bbb7: mov rdx, qword ptr [rsi]
0x14583bbba: test rdx, rdx
0x14583bbbd: je 0x14583bbcd
0x14583bbbf: mov r8d, 1
0x14583bbc5: mov rcx, rdi
0x14583bbc8: call 0x1400021d0
0x14583bbcd: mov rax, qword ptr [rbp - 0x30]
0x14583bbd1: mov qword ptr [rsi + 0x10], rax
0x14583bbd5: movups xmm0, xmmword ptr [rbp - 0x40]
0x14583bbd9: movups xmmword ptr [rsi], xmm0
0x14583bbdc: mov rdx, qword ptr [rbp + 8]
0x14583bbe0: test rdx, rdx
0x14583bbe3: je 0x14583bbf4
0x14583bbe5: mov r8d, 1
0x14583bbeb: mov rcx, qword ptr [rbp + 0x30]
0x14583bbef: call 0x1400021d0
0x14583bbf4: mov rdx, qword ptr [rbp - 0x10]
0x14583bbf8: test rdx, rdx
0x14583bbfb: je 0x14583bc0c
0x14583bbfd: mov r8d, 1
0x14583bc03: mov rcx, qword ptr [rbp + 0x28]
0x14583bc07: call 0x1400021d0
0x14583bc0c: mov rdx, qword ptr [rbp - 0x28]
0x14583bc10: test rdx, rdx
0x14583bc13: je 0x14583bc24
0x14583bc15: mov r8d, 1
0x14583bc1b: mov rcx, qword ptr [rbp + 0x20]
0x14583bc1f: call 0x1400021d0
0x14583bc24: mov rcx, qword ptr [rsi + 0x10]
0x14583bc28: cmp rcx, 0x1001
0x14583bc2f: jb 0x14583bc7c
0x14583bc31: mov rdx, qword ptr [rsi + 8]
0x14583bc35: mov eax, 0x1000
0x14583bc3a: nop word ptr [rax + rax]
0x14583bc40: cmp byte ptr [rdx + rax], 0xbf
0x14583bc44: jg 0x14583bc73
0x14583bc46: cmp byte ptr [rdx + rax - 1], 0xbf
0x14583bc4b: jg 0x14583bc65
0x14583bc4d: cmp byte ptr [rdx + rax - 2], 0xbf
0x14583bc52: jg 0x14583bc6f
0x14583bc54: cmp byte ptr [rdx + rax - 3], 0xbf
0x14583bc59: jg 0x14583bc87
0x14583bc5b: add rax, -4
0x14583bc5f: jne 0x14583bc40
0x14583bc61: xor eax, eax
0x14583bc63: jmp 0x14583bc78
0x14583bc65: dec rax
0x14583bc68: cmp rax, rcx
0x14583bc6b: jbe 0x14583bc78
0x14583bc6d: jmp 0x14583bc7c
0x14583bc6f: add rax, -2
0x14583bc73: cmp rax, rcx
0x14583bc76: ja 0x14583bc7c
0x14583bc78: mov qword ptr [rsi + 0x10], rax
0x14583bc7c: add rsp, 0xc0
0x14583bc83: pop rdi
0x14583bc84: pop rsi
0x14583bc85: pop rbp
0x14583bc86: ret
0x14583bc87: add rax, -3
0x14583bc8b: cmp rax, rcx
0x14583bc8e: jbe 0x14583bc78
0x14583bc90: jmp 0x14583bc7c
