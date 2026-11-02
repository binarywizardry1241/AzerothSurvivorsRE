141188f24: call 0x145ca3680
141188f29: nop
141188f2a: mov rcx, qword ptr [rbp + 0x5f0]
141188f31: mov qword ptr [rbp + 0x560], rcx
141188f38: mov rcx, qword ptr [rbp + 0x5d8]
141188f3f: mov qword ptr [rbp + 0x568], rcx
141188f46: mov rcx, qword ptr [rbp + 0x548]
141188f4d: mov qword ptr [rbp + 0x570], rcx
141188f54: mov r9d, dword ptr [rbp + 0x5fc]
141188f5b: mov ecx, r9d
141188f5e: imul rcx, rcx, 0x10624dd3
141188f65: shr rcx, 0x26
141188f69: imul r8d, ecx, 0x3e8
141188f70: sub r9d, r8d
141188f73: mov r8, qword ptr [rbp + 0x600]
141188f7a: mov qword ptr [rbp + 0x510], r8
141188f81: movups xmmword ptr [rbp + 0x518], xmm6
141188f88: mov qword ptr [rbp + 0x528], rsi
141188f8f: mov qword ptr [rbp + 0x530], r12
141188f96: mov qword ptr [rbp + 0x538], r15
141188f9d: mov r8, qword ptr [rbp + 0x540]
141188fa4: mov qword ptr [rbp + 0x550], r8
141188fab: mov r8, qword ptr [rbp + 0x5d0]
141188fb2: mov qword ptr [rbp + 0x558], r8
141188fb9: mov qword ptr [rbp + 0x578], rax
141188fc0: mov dword ptr [rbp + 0x580], edx
141188fc6: mov qword ptr [rbp + 0x588], rcx
141188fcd: imul eax, r9d, 0xf4240
141188fd4: mov dword ptr [rbp + 0x590], eax
141188fda: mov eax, dword ptr [rbp + 0x5cc]
141188fe0: mov dword ptr [rbp + 0x598], eax
141188fe6: movzx eax, byte ptr [rbp + 0x614]
141188fed: xor al, 1
141188fef: mov byte ptr [rbp + 0x59c], al
141188ff5: movzx eax, byte ptr [rbp + 0x615]
141188ffc: mov byte ptr [rbp + 0x59d], al
141189002: mov byte ptr [rbp + 0x5a0], 0
141189009: mov byte ptr [rbp + 0x617], 1
141189010: lea rcx, [rbp + 0x510]
141189017: lea rdx, [rbp + 0x550]
14118901e: call 0x140868850
