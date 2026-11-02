0x14586cf60: push rbp
0x14586cf61: push r15
0x14586cf63: push r14
0x14586cf65: push rsi
0x14586cf66: push rdi
0x14586cf67: push rbx
0x14586cf68: sub rsp, 0x48
0x14586cf6c: lea rbp, [rsp + 0x40]
0x14586cf71: mov qword ptr [rbp], 0xfffffffffffffffe
0x14586cf79: mov rsi, rcx
0x14586cf7c: lea rax, [r8*4]
0x14586cf84: lea r14, [rax + rax*2]
0x14586cf88: test r8, r8
0x14586cf8b: mov qword ptr [rbp - 0x10], r8
0x14586cf8f: mov qword ptr [rbp - 0x18], r14
0x14586cf93: je 0x14586cfe3
0x14586cf95: mov rdi, rdx
0x14586cf98: call 0x140002200
0x14586cf9d: mov edx, 4
0x14586cfa2: mov rcx, r14
0x14586cfa5: call 0x1400021c0
0x14586cfaa: test rax, rax
0x14586cfad: je 0x14586d0cf
0x14586cfb3: xor r8d, r8d
0x14586cfb6: mov qword ptr [rbp - 8], rax
0x14586cfba: nop word ptr [rax + rax]
0x14586cfc0: cmp r14, r8
0x14586cfc3: je 0x14586cfec
0x14586cfc5: lea rcx, [rdi + r8]
0x14586cfc9: mov edx, dword ptr [rcx + 8]
0x14586cfcc: mov dword ptr [rax + r8 + 8], edx
0x14586cfd1: mov rcx, qword ptr [rcx]
0x14586cfd4: mov qword ptr [rax + r8], rcx
0x14586cfd8: add r8, 0xc
0x14586cfdc: cmp r14, r8
0x14586cfdf: jne 0x14586cfc0
0x14586cfe1: jmp 0x14586cfec
0x14586cfe3: mov eax, 4
0x14586cfe8: mov qword ptr [rbp - 8], rax
0x14586cfec: mov rbx, qword ptr [rsi + 0x10]
0x14586cff0: lea rsi, [rbx + 0x10]
0x14586cff4: mov cl, 1
0x14586cff6: xor eax, eax
0x14586cff8: lock cmpxchg byte ptr [rbx + 0x10], cl
0x14586cffd: jne 0x14586d08d
0x14586d003: mov r14, qword ptr [rip + 0x29a7a2e]
0x14586d00a: mov rax, qword ptr [r14]
0x14586d00d: shl rax, 1
0x14586d010: test rax, rax
0x14586d013: jne 0x14586d09b
0x14586d019: xor edi, edi
0x14586d01b: movzx eax, byte ptr [rbx + 0x11]
0x14586d01f: mov rax, qword ptr [rbx + 0x80]
0x14586d026: cmp rax, -1
0x14586d02a: mov r15, qword ptr [rbp - 8]
0x14586d02e: je 0x14586d04f
0x14586d030: test rax, rax
0x14586d033: je 0x14586d04f
0x14586d035: mov rcx, qword ptr [rbx + 0x88]
0x14586d03c: shl rax, 2
0x14586d040: lea rdx, [rax + rax*2]
0x14586d044: mov r8d, 4
0x14586d04a: call 0x1400021d0
0x14586d04f: mov rax, qword ptr [rbp - 0x10]
0x14586d053: mov qword ptr [rbx + 0x80], rax
0x14586d05a: mov qword ptr [rbx + 0x88], r15
0x14586d061: mov qword ptr [rbx + 0x90], rax
0x14586d068: test dil, dil
0x14586d06b: jne 0x14586d078
0x14586d06d: mov rax, qword ptr [r14]
0x14586d070: shl rax, 1
0x14586d073: test rax, rax
0x14586d076: jne 0x14586d0c0
0x14586d078: xor eax, eax
0x14586d07a: xchg byte ptr [rsi], al
0x14586d07c: cmp al, 2
0x14586d07e: je 0x14586d0ac
0x14586d080: add rsp, 0x48
0x14586d084: pop rbx
0x14586d085: pop rdi
0x14586d086: pop rsi
0x14586d087: pop r14
0x14586d089: pop r15
0x14586d08b: pop rbp
0x14586d08c: ret
0x14586d08d: mov rcx, rsi
0x14586d090: call 0x145eb5670
0x14586d095: nop
0x14586d096: jmp 0x14586d003
0x14586d09b: call 0x145eb6400
0x14586d0a0: nop
0x14586d0a1: mov edi, eax
0x14586d0a3: xor dil, 1
0x14586d0a7: jmp 0x14586d01b
0x14586d0ac: mov rcx, rsi
0x14586d0af: add rsp, 0x48
0x14586d0b3: pop rbx
0x14586d0b4: pop rdi
0x14586d0b5: pop rsi
0x14586d0b6: pop r14
0x14586d0b8: pop r15
0x14586d0ba: pop rbp
0x14586d0bb: jmp 0x145eb5730
0x14586d0c0: call 0x145eb6400
0x14586d0c5: test al, al
0x14586d0c7: jne 0x14586d078
0x14586d0c9: mov byte ptr [rbx + 0x11], 1
0x14586d0cd: jmp 0x14586d078
0x14586d0cf: mov ecx, 4
0x14586d0d4: mov rdx, r14
0x14586d0d7: call 0x145eb6fcb
0x14586d0dc: ud2
