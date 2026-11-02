0x1458eb290: push rbp
0x1458eb291: push r15
0x1458eb293: push r14
0x1458eb295: push r13
0x1458eb297: push r12
0x1458eb299: push rsi
0x1458eb29a: push rdi
0x1458eb29b: push rbx
0x1458eb29c: mov eax, 0x13d8
0x1458eb2a1: call 0x145d13ac0
0x1458eb2a6: sub rsp, rax
0x1458eb2a9: lea rbp, [rsp + 0x80]
0x1458eb2b1: mov qword ptr [rbp + 0x1350], 0xfffffffffffffffe
0x1458eb2bc: mov rdi, rdx
0x1458eb2bf: mov rsi, rcx
0x1458eb2c2: test r8, r8
0x1458eb2c5: je 0x1458eb2d6
0x1458eb2c7: mov r14, qword ptr [rdi + 0x988]
0x1458eb2ce: mov r15, r14
0x1458eb2d1: sub r15, r8
0x1458eb2d4: jae 0x1458eb301
0x1458eb2d6: lea rcx, [rbp + 0x920]
0x1458eb2dd: mov rdx, rdi
0x1458eb2e0: call 0x14581d7b0
0x1458eb2e5: nop
0x1458eb2e6: mov rcx, rdi
0x1458eb2e9: call 0x145901040
0x1458eb2ee: nop
0x1458eb2ef: lea rdx, [rbp + 0x920]
0x1458eb2f6: mov r8d, 0x90
0x1458eb2fc: jmp 0x1458eb59d
0x1458eb301: mov qword ptr [rbp + 0x1338], rsi
0x1458eb308: mov qword ptr [rbp + 0x1330], r8
0x1458eb30f: lea rax, [r8 - 1]
0x1458eb313: cmp rax, r14
0x1458eb316: mov qword ptr [rbp + 0x1340], rax
0x1458eb31d: jae 0x1458eb5d1
0x1458eb323: mov rsi, qword ptr [rdi + 0x980]
0x1458eb32a: imul rbx, rax, 0x980
0x1458eb331: lea r12, [rsi + rbx]
0x1458eb335: mov r13, qword ptr [rsi + rbx]
0x1458eb339: lea rdx, [rsi + rbx]
0x1458eb33d: add rdx, 8
0x1458eb341: lea rcx, [rbp + 0x920]
0x1458eb348: mov r8d, 0x978
0x1458eb34e: call 0x145d145fb
0x1458eb353: lea rdx, [rsi + rbx]
0x1458eb357: add rdx, 0x980
0x1458eb35e: imul r8, r15, 0x980
0x1458eb365: mov rcx, r12
0x1458eb368: call 0x145d14607
0x1458eb36d: dec r14
0x1458eb370: mov qword ptr [rdi + 0x988], r14
0x1458eb377: cmp r13, 2
0x1458eb37b: je 0x1458eb5d1
0x1458eb381: mov qword ptr [rbp - 0x60], r13
0x1458eb385: lea rcx, [rbp - 0x58]
0x1458eb389: lea rdx, [rbp + 0x920]
0x1458eb390: mov r8d, 0x978
0x1458eb396: call 0x145d145fb
0x1458eb39b: cmp byte ptr [rdi + 0xc41], 1
0x1458eb3a2: mov rsi, qword ptr [rbp + 0x1340]
0x1458eb3a9: jne 0x1458eb4a5
0x1458eb3af: mov rax, qword ptr [rdi + 0xb40]
0x1458eb3b6: mov qword ptr [rbp + 0x12a0], rax
0x1458eb3bd: lea rax, [rdi + 0x630]
0x1458eb3c4: mov rcx, qword ptr [rdi + 0x638]
0x1458eb3cb: mov rdx, qword ptr [rdi + 0x640]
0x1458eb3d2: mov qword ptr [rdi + 0x640], 0
0x1458eb3dd: mov qword ptr [rbp + 0x938], rdx
0x1458eb3e4: shl rdx, 5
0x1458eb3e8: add rdx, rcx
0x1458eb3eb: mov qword ptr [rbp + 0x940], 0
0x1458eb3f6: mov qword ptr [rbp + 0x920], rcx
0x1458eb3fd: mov qword ptr [rbp + 0x928], rdx
0x1458eb404: mov qword ptr [rbp + 0x930], rax
0x1458eb40b: lea rcx, [rdi + 0xa38]
0x1458eb412: lea r15, [rbp + 0x12a0]
0x1458eb419: mov qword ptr [rbp + 0x948], r15
0x1458eb420: mov byte ptr [rbp + 0x134f], 1
0x1458eb427: lea rdx, [rbp + 0x920]
0x1458eb42e: call 0x1459bc540
0x1458eb433: nop
0x1458eb434: lea rax, [rdi + 0x648]
0x1458eb43b: mov rcx, qword ptr [rdi + 0x650]
0x1458eb442: mov rdx, qword ptr [rdi + 0x658]
0x1458eb449: mov qword ptr [rdi + 0x658], 0
0x1458eb454: lea r8, [rdx + rdx*2]
0x1458eb458: lea r8, [rcx + r8*8]
0x1458eb45c: mov qword ptr [rbp + 0x938], rdx
0x1458eb463: mov qword ptr [rbp + 0x940], 0
0x1458eb46e: mov qword ptr [rbp + 0x920], rcx
0x1458eb475: mov qword ptr [rbp + 0x928], r8
0x1458eb47c: mov qword ptr [rbp + 0x930], rax
0x1458eb483: lea rcx, [rdi + 0xa50]
0x1458eb48a: mov qword ptr [rbp + 0x948], r15
0x1458eb491: mov byte ptr [rbp + 0x134f], 1
0x1458eb498: lea rdx, [rbp + 0x920]
0x1458eb49f: call 0x1459bc470
0x1458eb4a4: nop
0x1458eb4a5: lea rdx, [rbp - 0x60]
0x1458eb4a9: mov rcx, rdi
0x1458eb4ac: call 0x145920ed0
0x1458eb4b1: mov rax, qword ptr [rbp + 0x1330]
0x1458eb4b8: mov qword ptr [rdi + 0xb40], rax
0x1458eb4bf: mov rdx, qword ptr [rdi + 0x2d0]
0x1458eb4c6: mov r8, qword ptr [rdi + 0x2d8]
0x1458eb4cd: mov byte ptr [rbp + 0x134f], 1
0x1458eb4d4: lea rcx, [rbp + 0x12a0]
0x1458eb4db: mov r9, rdi
0x1458eb4de: call 0x1458d7430
0x1458eb4e3: nop
0x1458eb4e4: mov byte ptr [rbp + 0x134e], 1
0x1458eb4eb: mov rcx, rdi
0x1458eb4ee: call 0x145901040
0x1458eb4f3: nop
0x1458eb4f4: mov qword ptr [rdi + 0xb40], 0
0x1458eb4ff: lea r15, [rbp - 0x60]
0x1458eb503: mov rcx, rdi
0x1458eb506: mov rdx, r15
0x1458eb509: call 0x145920ed0
0x1458eb50e: lea rcx, [rbp + 0x920]
0x1458eb515: mov r8d, 0x980
0x1458eb51b: mov rdx, r15
0x1458eb51e: call 0x145d145fb
0x1458eb523: mov r15, qword ptr [rdi + 0x988]
0x1458eb52a: cmp r15, rsi
0x1458eb52d: jb 0x1458eb5bc
0x1458eb533: lea rcx, [rdi + 0x978]
0x1458eb53a: cmp r15, qword ptr [rcx]
0x1458eb53d: jne 0x1458eb545
0x1458eb53f: call 0x145e984e0
0x1458eb544: nop
0x1458eb545: add rbx, qword ptr [rdi + 0x980]
0x1458eb54c: mov rax, r15
0x1458eb54f: sub rax, rsi
0x1458eb552: jbe 0x1458eb56a
0x1458eb554: lea rcx, [rbx + 0x980]
0x1458eb55b: imul r8, rax, 0x980
0x1458eb562: mov rdx, rbx
0x1458eb565: call 0x145d14607
0x1458eb56a: lea rdx, [rbp + 0x920]
0x1458eb571: mov r8d, 0x980
0x1458eb577: mov rcx, rbx
0x1458eb57a: call 0x145d145fb
0x1458eb57f: inc r15
0x1458eb582: mov qword ptr [rdi + 0x988], r15
0x1458eb589: lea rdx, [rbp + 0x12a0]
0x1458eb590: mov r8d, 0x90
0x1458eb596: mov rsi, qword ptr [rbp + 0x1338]
0x1458eb59d: mov rcx, rsi
0x1458eb5a0: call 0x145d145fb
0x1458eb5a5: mov rax, rsi
0x1458eb5a8: add rsp, 0x13d8
0x1458eb5af: pop rbx
0x1458eb5b0: pop rdi
0x1458eb5b1: pop rsi
0x1458eb5b2: pop r12
0x1458eb5b4: pop r13
0x1458eb5b6: pop r14
0x1458eb5b8: pop r15
0x1458eb5ba: pop rbp
0x1458eb5bb: ret
0x1458eb5bc: lea r8, [rip + 0x1a440ed]
0x1458eb5c3: mov rcx, rsi
0x1458eb5c6: mov rdx, r15
0x1458eb5c9: call 0x145eb7014
0x1458eb5ce: nop
0x1458eb5cf: ud2
0x1458eb5d1: lea r8, [rip + 0x1a440c0]
0x1458eb5d8: mov rcx, qword ptr [rbp + 0x1340]
0x1458eb5df: mov rdx, r14
0x1458eb5e2: call 0x145eb709b
0x1458eb5e7: ud2
