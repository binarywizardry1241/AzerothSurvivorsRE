0x1458948f0: push rbp
0x1458948f1: push r15
0x1458948f3: push r14
0x1458948f5: push rsi
0x1458948f6: push rdi
0x1458948f7: push rbx
0x1458948f8: sub rsp, 0x88
0x1458948ff: lea rbp, [rsp + 0x80]
0x145894907: mov qword ptr [rbp], 0xfffffffffffffffe
0x14589490f: cmp dword ptr [rcx + 0xc58], 1
0x145894916: ja 0x14589491f
0x145894918: mov byte ptr [rcx + 0xf49], 0
0x14589491f: mov rsi, qword ptr [rcx + 0xf90]
0x145894926: test rsi, rsi
0x145894929: je 0x145894aa0
0x14589492f: mov rdi, qword ptr [rcx + 0xf88]
0x145894936: imul rax, rsi, 0xb0
0x14589493d: xor ebx, ebx
0x14589493f: xor edx, edx
0x145894941: nop word ptr cs:[rax + rax]
0x145894950: cmp byte ptr [rdi + rdx + 0xa8], 0
0x145894958: jne 0x14589496e
0x14589495a: inc rbx
0x14589495d: add rdx, 0xb0
0x145894964: cmp rax, rdx
0x145894967: jne 0x145894950
0x145894969: jmp 0x145894aa0
0x14589496e: mov r15, rcx
0x145894971: mov byte ptr [rdi + rdx + 0xa8], 0
0x145894979: lea r14, [rbp - 0x30]
0x14589497d: mov edx, 8
0x145894982: mov rcx, r14
0x145894985: xor r8d, r8d
0x145894988: xor r9d, r9d
0x14589498b: call 0x1459a9e30
0x145894990: mov rcx, rdi
0x145894993: mov rdx, rsi
0x145894996: mov r8, rbx
0x145894999: mov r9, r14
0x14589499c: call 0x145877580
0x1458949a1: call 0x140002200
0x1458949a6: mov ecx, 0x20
0x1458949ab: mov edx, 1
0x1458949b0: call 0x1400021c0
0x1458949b5: test rax, rax
0x1458949b8: je 0x145894ade
0x1458949be: mov word ptr [rbp - 0x18], 0x4d
0x1458949c4: mov qword ptr [rbp - 0x30], 0x20
0x1458949cc: mov qword ptr [rbp - 0x28], rax
0x1458949d0: mov qword ptr [rbp - 0x20], 0
0x1458949d8: lea r9, [rbp - 0x30]
0x1458949dc: mov rcx, rdi
0x1458949df: mov rdx, rsi
0x1458949e2: mov r8, rbx
0x1458949e5: call 0x145877580
0x1458949ea: mov rsi, qword ptr [r15 + 0x16f0]
0x1458949f1: mov rdi, qword ptr [r15 + 0x16f8]
0x1458949f8: call 0x140002200
0x1458949fd: mov ecx, 1
0x145894a02: mov edx, 1
0x145894a07: call 0x1400021c0
0x145894a0c: test rax, rax
0x145894a0f: je 0x145894aef
0x145894a15: mov byte ptr [rax], 0x7b
0x145894a18: mov qword ptr [rbp - 0x30], 1
0x145894a20: mov qword ptr [rbp - 0x28], rax
0x145894a24: mov qword ptr [rbp - 0x20], 1
0x145894a2c: mov byte ptr [rbp - 0x18], 1
0x145894a30: lea rax, [rip + 0x1797fd1]
0x145894a37: mov qword ptr [rsp + 0x20], rax
0x145894a3c: mov qword ptr [rsp + 0x28], 6
0x145894a45: lea r8, [rip + 0x1797c87]
0x145894a4c: lea rcx, [rbp - 0x50]
0x145894a50: lea rdx, [rbp - 0x30]
0x145894a54: mov r9d, 4
0x145894a5a: call 0x145858350
0x145894a5f: mov rax, qword ptr [rbp - 0x50]
0x145894a63: mov r8, qword ptr [rbp - 0x40]
0x145894a67: cmp rax, r8
0x145894a6a: je 0x145894ab0
0x145894a6c: mov qword ptr [rbp - 8], rax
0x145894a70: mov rdx, qword ptr [rbp - 0x48]
0x145894a74: mov byte ptr [rdx + r8], 0x7d
0x145894a79: inc r8
0x145894a7c: mov rcx, rsi
0x145894a7f: mov qword ptr [rbp - 0x10], rdx
0x145894a83: call qword ptr [rdi + 0x18]
0x145894a86: nop
0x145894a87: mov rdx, qword ptr [rbp - 8]
0x145894a8b: test rdx, rdx
0x145894a8e: je 0x145894aa0
0x145894a90: mov r8d, 1
0x145894a96: mov rcx, qword ptr [rbp - 0x10]
0x145894a9a: call 0x1400021d0
0x145894a9f: nop
0x145894aa0: add rsp, 0x88
0x145894aa7: pop rbx
0x145894aa8: pop rdi
0x145894aa9: pop rsi
0x145894aaa: pop r14
0x145894aac: pop r15
0x145894aae: pop rbp
0x145894aaf: ret
0x145894ab0: mov qword ptr [rsp + 0x20], 1
0x145894ab9: lea rcx, [rbp - 0x50]
0x145894abd: mov rdx, r8
0x145894ac0: mov r8d, 1
0x145894ac6: mov r9d, 1
0x145894acc: mov rbx, rdx
0x145894acf: call 0x145d14a10
0x145894ad4: nop
0x145894ad5: mov rax, qword ptr [rbp - 0x50]
0x145894ad9: mov r8, rbx
0x145894adc: jmp 0x145894a6c
0x145894ade: mov ecx, 1
0x145894ae3: mov edx, 0x20
0x145894ae8: call 0x145eb6fcb
0x145894aed: ud2
0x145894aef: mov ecx, 1
0x145894af4: mov edx, 1
0x145894af9: call 0x145eb6fcb
0x145894afe: ud2
