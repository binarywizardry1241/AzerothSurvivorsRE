0x145cbe620: push rbp
0x145cbe621: push r14
0x145cbe623: push rsi
0x145cbe624: push rdi
0x145cbe625: push rbx
0x145cbe626: sub rsp, 0x40
0x145cbe62a: lea rbp, [rsp + 0x40]
0x145cbe62f: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145cbe637: mov edi, r8d
0x145cbe63a: mov rbx, rdx
0x145cbe63d: mov r14, rcx
0x145cbe640: movzx eax, byte ptr [rip + 0x2558c2e]
0x145cbe647: test al, al
0x145cbe649: je 0x145cbe6b5
0x145cbe64b: cmp byte ptr [r14], 0
0x145cbe64f: mov eax, 0x17
0x145cbe654: mov ecx, 2
0x145cbe659: cmovne ecx, eax
0x145cbe65c: mov edx, 1
0x145cbe661: call 0x145cbf460
0x145cbe666: mov esi, 1
0x145cbe66b: test al, 1
0x145cbe66d: jne 0x145cbe6a7
0x145cbe66f: mov qword ptr [rbp - 0x10], rdx
0x145cbe673: mov qword ptr [rbp - 0x18], rdx
0x145cbe677: lea rcx, [rbp - 0x18]
0x145cbe67b: mov rdx, r14
0x145cbe67e: mov r8, rbx
0x145cbe681: mov r9d, edi
0x145cbe684: call 0x145cbf030
0x145cbe689: nop
0x145cbe68a: mov rdi, rax
0x145cbe68d: test rax, rax
0x145cbe690: je 0x145cbe6a1
0x145cbe692: mov rcx, qword ptr [rbp - 0x10]
0x145cbe696: call qword ptr [rip + 0x1fa744]
0x145cbe69c: mov rdx, rdi
0x145cbe69f: jmp 0x145cbe6a7
0x145cbe6a1: xor esi, esi
0x145cbe6a3: mov rdx, qword ptr [rbp - 0x10]
0x145cbe6a7: mov rax, rsi
0x145cbe6aa: add rsp, 0x40
0x145cbe6ae: pop rbx
0x145cbe6af: pop rdi
0x145cbe6b0: pop rsi
0x145cbe6b1: pop r14
0x145cbe6b3: pop rbp
0x145cbe6b4: ret
0x145cbe6b5: call 0x145eb65d0
0x145cbe6ba: jmp 0x145cbe64b
