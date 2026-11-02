0x145b794b0: push rbp
0x145b794b1: push r14
0x145b794b3: push rsi
0x145b794b4: push rdi
0x145b794b5: push rbx
0x145b794b6: sub rsp, 0x40
0x145b794ba: lea rbp, [rsp + 0x40]
0x145b794bf: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145b794c7: mov rsi, rcx
0x145b794ca: mov r14, qword ptr [rdx]
0x145b794cd: mov rbx, qword ptr [rdx + 8]
0x145b794d1: mov rdi, qword ptr [rdx + 0x10]
0x145b794d5: cmp rdi, r14
0x145b794d8: jne 0x145b794fd
0x145b794da: test rdi, rdi
0x145b794dd: je 0x145b7953a
0x145b794df: test bl, 1
0x145b794e2: jne 0x145b79552
0x145b794e4: mov qword ptr [rsi + 8], rbx
0x145b794e8: or rbx, 1
0x145b794ec: mov qword ptr [rsi + 0x10], rdi
0x145b794f0: mov qword ptr [rsi + 0x18], rbx
0x145b794f4: lea rax, [rip + 0x1833d45]
0x145b794fb: jmp 0x145b79565
0x145b794fd: call 0x140002200
0x145b79502: mov ecx, 0x18
0x145b79507: mov edx, 8
0x145b7950c: call 0x1400021c0
0x145b79511: test rax, rax
0x145b79514: je 0x145b79576
0x145b79516: mov qword ptr [rax], rbx
0x145b79519: mov qword ptr [rax + 8], r14
0x145b7951d: mov qword ptr [rax + 0x10], 1
0x145b79525: mov qword ptr [rsi + 8], rbx
0x145b79529: mov qword ptr [rsi + 0x10], rdi
0x145b7952d: mov qword ptr [rsi + 0x18], rax
0x145b79531: lea rax, [rip + 0x1833ca0]
0x145b79538: jmp 0x145b79565
0x145b7953a: mov qword ptr [rsi + 8], 1
0x145b79542: xorps xmm0, xmm0
0x145b79545: movups xmmword ptr [rsi + 0x10], xmm0
0x145b79549: lea rax, [rip + 0x1833ae0]
0x145b79550: jmp 0x145b79565
0x145b79552: mov qword ptr [rsi + 8], rbx
0x145b79556: mov qword ptr [rsi + 0x10], rdi
0x145b7955a: mov qword ptr [rsi + 0x18], rbx
0x145b7955e: lea rax, [rip + 0x1833cb3]
0x145b79565: mov qword ptr [rsi], rax
0x145b79568: mov rax, rsi
0x145b7956b: add rsp, 0x40
0x145b7956f: pop rbx
0x145b79570: pop rdi
0x145b79571: pop rsi
0x145b79572: pop r14
0x145b79574: pop rbp
0x145b79575: ret
0x145b79576: mov qword ptr [rbp - 0x10], r14
0x145b7957a: mov qword ptr [rbp - 0x18], rbx
0x145b7957e: mov ecx, 8
0x145b79583: mov edx, 0x18
0x145b79588: call 0x145eb6fb1
0x145b7958d: nop
0x145b7958e: ud2
