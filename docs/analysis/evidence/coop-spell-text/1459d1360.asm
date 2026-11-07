0x1459d1360: push rbp
0x1459d1361: push r15
0x1459d1363: push r14
0x1459d1365: push r13
0x1459d1367: push r12
0x1459d1369: push rsi
0x1459d136a: push rdi
0x1459d136b: push rbx
0x1459d136c: sub rsp, 0xe8
0x1459d1373: lea rbp, [rsp + 0x80]
0x1459d137b: mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
0x1459d1383: mov qword ptr [rbp + 0x58], rcx
0x1459d1387: mov r12, qword ptr [rdx]
0x1459d138a: mov r13, qword ptr [rdx + 8]
0x1459d138e: cmp r12, r13
0x1459d1391: jne 0x1459d13b2
0x1459d1393: mov rax, qword ptr [rbp + 0x58]
0x1459d1397: mov qword ptr [rax], 0xffffffffffffffff
0x1459d139e: add rsp, 0xe8
0x1459d13a5: pop rbx
0x1459d13a6: pop rdi
0x1459d13a7: pop rsi
0x1459d13a8: pop r12
0x1459d13aa: pop r13
0x1459d13ac: pop r14
0x1459d13ae: pop r15
0x1459d13b0: pop rbp
0x1459d13b1: ret
0x1459d13b2: mov r14, rdx
0x1459d13b5: imul rax, r12, 0x38
0x1459d13b9: lea rsi, [rax + rdx]
0x1459d13bd: add rsi, 0x40
0x1459d13c1: jmp 0x1459d13df
0x1459d13c3: nop word ptr cs:[rax + rax]
0x1459d13d0: cmp r15, -1
0x1459d13d4: jne 0x1459d1412
0x1459d13d6: add rsi, 0x38
0x1459d13da: cmp r13, r12
0x1459d13dd: je 0x1459d1393
0x1459d13df: inc r12
0x1459d13e2: mov qword ptr [r14], r12
0x1459d13e5: mov r15, qword ptr [rsi - 0x10]
0x1459d13e9: mov rdi, qword ptr [rsi - 8]
0x1459d13ed: mov rbx, qword ptr [rsi]
0x1459d13f0: test rbx, rbx
0x1459d13f3: jne 0x1459d13d0
0x1459d13f5: test r15, r15
0x1459d13f8: je 0x1459d13d6
0x1459d13fa: shl r15, 3
0x1459d13fe: lea rdx, [r15 + r15*2]
0x1459d1402: mov r8d, 8
0x1459d1408: mov rcx, rdi
0x1459d140b: call 0x1400021d0
0x1459d1410: jmp 0x1459d13d6
0x1459d1412: mov rax, qword ptr [rsi - 0x30]
0x1459d1416: mov rcx, qword ptr [rsi - 0x28]
0x1459d141a: mov rdx, qword ptr [rsi - 0x20]
0x1459d141e: mov r8, qword ptr [rsi - 0x18]
0x1459d1422: mov qword ptr [rbp - 0x30], rdi
0x1459d1426: mov qword ptr [rbp - 0x28], rbx
0x1459d142a: mov qword ptr [rbp + 0x30], rax
0x1459d142e: mov qword ptr [rbp + 0x38], rcx
0x1459d1432: mov qword ptr [rbp + 0x20], rdx
0x1459d1436: mov qword ptr [rbp + 0x28], r8
0x1459d143a: mov qword ptr [rbp - 0x38], r15
0x1459d143e: mov qword ptr [rsp + 0x20], 2
0x1459d1447: lea r9, [rip + 0x1968b05]
0x1459d144e: lea rcx, [rbp - 0x20]
0x1459d1452: mov rdx, rdi
0x1459d1455: mov r8, rbx
0x1459d1458: call 0x1458c01f0
0x1459d145d: nop
0x1459d145e: mov rax, qword ptr [rbp - 0x10]
0x1459d1462: mov qword ptr [rbp + 0x50], rax
0x1459d1466: movups xmm0, xmmword ptr [rbp - 0x20]
0x1459d146a: movaps xmmword ptr [rbp + 0x40], xmm0
0x1459d146e: lea rax, [rbp + 0x30]
0x1459d1472: mov qword ptr [rbp - 0x20], rax
0x1459d1476: lea rax, [rip - 0x59cf3bd]
0x1459d147d: mov qword ptr [rbp - 0x18], rax
0x1459d1481: lea rcx, [rbp + 0x20]
0x1459d1485: mov qword ptr [rbp - 0x10], rcx
0x1459d1489: mov qword ptr [rbp - 8], rax
0x1459d148d: lea rcx, [rbp + 0x40]
0x1459d1491: mov qword ptr [rbp], rcx
0x1459d1495: lea rcx, [rip - 0x59cf3bc]
0x1459d149c: mov qword ptr [rbp + 8], rcx
0x1459d14a0: lea rcx, [rip + 0x1968ab1]
0x1459d14a7: mov qword ptr [rbp + 0x10], rcx
0x1459d14ab: mov qword ptr [rbp + 0x18], rax
0x1459d14af: lea rdx, [rip + 0x1968ab2]
0x1459d14b6: lea rcx, [rbp - 0x50]
0x1459d14ba: lea r8, [rbp - 0x20]
0x1459d14be: call 0x145ce7350
0x1459d14c3: nop
0x1459d14c4: mov rdx, qword ptr [rbp + 0x40]
0x1459d14c8: test rdx, rdx
0x1459d14cb: je 0x1459d14dc
0x1459d14cd: mov rcx, qword ptr [rbp + 0x48]
0x1459d14d1: mov r8d, 1
0x1459d14d7: call 0x1400021d0
0x1459d14dc: lea rsi, [rdi + 8]
0x1459d14e0: jmp 0x1459d14f9
0x1459d14e2: nop word ptr cs:[rax + rax]
0x1459d14f0: add rsi, 0x18
0x1459d14f4: dec rbx
0x1459d14f7: je 0x1459d1512
0x1459d14f9: mov rdx, qword ptr [rsi - 8]
0x1459d14fd: test rdx, rdx
0x1459d1500: je 0x1459d14f0
0x1459d1502: mov rcx, qword ptr [rsi]
0x1459d1505: mov r8d, 1
0x1459d150b: call 0x1400021d0
0x1459d1510: jmp 0x1459d14f0
0x1459d1512: test r15, r15
0x1459d1515: je 0x1459d152d
0x1459d1517: shl r15, 3
0x1459d151b: lea rdx, [r15 + r15*2]
0x1459d151f: mov r8d, 8
0x1459d1525: mov rcx, rdi
0x1459d1528: call 0x1400021d0
0x1459d152d: mov rax, qword ptr [rbp - 0x40]
0x1459d1531: mov rcx, qword ptr [rbp + 0x58]
0x1459d1535: mov qword ptr [rcx + 0x10], rax
0x1459d1539: movups xmm0, xmmword ptr [rbp - 0x50]
0x1459d153d: movups xmmword ptr [rcx], xmm0
0x1459d1540: jmp 0x1459d139e
