; 0.108.0 SHA256 dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b
; original PE range 0x1458e9450..0x1458e95a5 (341 bytes), SHA256 b0ecb14ec8fbe1087972c6a42f5088daf282b132b87e4dc9916e8958c3877386
0x1458e9450: push rbp
0x1458e9451: push rsi
0x1458e9452: push rdi
0x1458e9453: sub rsp, 0xd0
0x1458e945a: lea rbp, [rsp + 0x80]
0x1458e9462: mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
0x1458e946a: mov rsi, rcx
0x1458e946d: mov qword ptr [rbp - 0x30], rdx
0x1458e9471: mov qword ptr [rbp - 0x28], r8
0x1458e9475: lea rcx, [rbp + 0x10]
0x1458e9479: call 0x1458e8400
0x1458e947e: mov rax, qword ptr [rbp + 0x10]
0x1458e9482: cmp rax, -1
0x1458e9486: je 0x1458e9544
0x1458e948c: mov qword ptr [rbp + 0x38], rax
0x1458e9490: mov rax, qword ptr [rbp + 0x18]
0x1458e9494: mov qword ptr [rbp + 0x30], rax
0x1458e9498: mov rdi, qword ptr [rbp + 0x20]
0x1458e949c: lea rax, [rbp - 0x30]
0x1458e94a0: mov qword ptr [rbp + 0x10], rax
0x1458e94a4: lea rax, [rip - 0x58e73eb]
0x1458e94ab: mov qword ptr [rbp + 0x18], rax
0x1458e94af: lea rdx, [rip + 0x15af1af]
0x1458e94b6: lea rcx, [rbp - 0x20]
0x1458e94ba: lea r8, [rbp + 0x10]
0x1458e94be: call 0x145bc5690
0x1458e94c3: nop
0x1458e94c4: mov r9, qword ptr [rbp - 0x18]
0x1458e94c8: mov rax, qword ptr [rbp - 0x10]
0x1458e94cc: mov qword ptr [rsp + 0x20], rax
0x1458e94d1: lea rcx, [rbp - 0x50]
0x1458e94d5: mov rdx, qword ptr [rbp + 0x30]
0x1458e94d9: mov r8, rdi
0x1458e94dc: mov qword ptr [rbp + 0x40], r9
0x1458e94e0: call 0x145b9f5a0
0x1458e94e5: nop
0x1458e94e6: mov rdx, qword ptr [rbp - 0x20]
0x1458e94ea: test rdx, rdx
0x1458e94ed: je 0x1458e94fe
0x1458e94ef: mov r8d, 1
0x1458e94f5: mov rcx, qword ptr [rbp + 0x40]
0x1458e94f9: call 0x1400021d0
0x1458e94fe: mov rdx, qword ptr [rbp - 0x48]
0x1458e9502: mov r8, qword ptr [rbp - 0x40]
0x1458e9506: lea rcx, [rbp - 8]
0x1458e950a: mov qword ptr [rbp + 0x40], rdx
0x1458e950e: call 0x145bb5af0
0x1458e9513: nop
0x1458e9514: mov rdx, qword ptr [rbp - 0x50]
0x1458e9518: test rdx, rdx
0x1458e951b: je 0x1458e952c
0x1458e951d: mov r8d, 1
0x1458e9523: mov rcx, qword ptr [rbp + 0x40]
0x1458e9527: call 0x1400021d0
0x1458e952c: cmp qword ptr [rbp - 8], -1
0x1458e9531: je 0x1458e954d
0x1458e9533: mov rax, qword ptr [rbp + 8]
0x1458e9537: mov qword ptr [rsi + 0x10], rax
0x1458e953b: movups xmm0, xmmword ptr [rbp - 8]
0x1458e953f: movups xmmword ptr [rsi], xmm0
0x1458e9542: jmp 0x1458e957f
0x1458e9544: mov qword ptr [rsi], 0xffffffffffffffff
0x1458e954b: jmp 0x1458e9597
0x1458e954d: mov qword ptr [rsi], 0xffffffffffffffff
0x1458e9554: mov rax, qword ptr [rbp]
0x1458e9558: mov ecx, eax
0x1458e955a: and ecx, 3
0x1458e955d: lea edx, [rcx - 2]
0x1458e9560: cmp edx, 2
0x1458e9563: jb 0x1458e957f
0x1458e9565: test rcx, rcx
0x1458e9568: je 0x1458e957f
0x1458e956a: dec rax
0x1458e956d: lea rcx, [rbp + 0x18]
0x1458e9571: mov qword ptr [rbp + 0x18], rax
0x1458e9575: mov byte ptr [rbp + 0x10], 3
0x1458e9579: call 0x145bd8020
0x1458e957e: nop
0x1458e957f: mov rdx, qword ptr [rbp + 0x38]
0x1458e9583: test rdx, rdx
0x1458e9586: je 0x1458e9597
0x1458e9588: mov r8d, 1
0x1458e958e: mov rcx, qword ptr [rbp + 0x30]
0x1458e9592: call 0x1400021d0
0x1458e9597: mov rax, rsi
0x1458e959a: add rsp, 0xd0
0x1458e95a1: pop rdi
0x1458e95a2: pop rsi
0x1458e95a3: pop rbp
0x1458e95a4: ret
