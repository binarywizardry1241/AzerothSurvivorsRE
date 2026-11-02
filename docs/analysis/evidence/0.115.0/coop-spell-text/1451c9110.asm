0x1451c9110: push rbp
0x1451c9111: push r15
0x1451c9113: push r14
0x1451c9115: push r13
0x1451c9117: push r12
0x1451c9119: push rsi
0x1451c911a: push rdi
0x1451c911b: push rbx
0x1451c911c: sub rsp, 0xa8
0x1451c9123: lea rbp, [rsp + 0x80]
0x1451c912b: mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
0x1451c9133: mov r14d, r9d
0x1451c9136: mov rdi, r8
0x1451c9139: mov rbx, rdx
0x1451c913c: mov rsi, rcx
0x1451c913f: mov byte ptr [rbp + 0x1f], 1
0x1451c9143: lea r15, [rbp - 0x30]
0x1451c9147: mov rcx, r15
0x1451c914a: call 0x145157930
0x1451c914f: nop
0x1451c9150: movzx eax, byte ptr [rbp - 0x30]
0x1451c9154: cmp al, 0xff
0x1451c9156: je 0x1451c91e3
0x1451c915c: movzx ecx, byte ptr [rbp - 0x2d]
0x1451c9160: mov byte ptr [rsi + 3], cl
0x1451c9163: movzx ecx, word ptr [rbp - 0x2f]
0x1451c9167: mov word ptr [rsi + 1], cx
0x1451c916b: movups xmm0, xmmword ptr [rbp - 0x24]
0x1451c916f: movups xmm1, xmmword ptr [rbp - 0x14]
0x1451c9173: movups xmm2, xmmword ptr [rbp - 4]
0x1451c9177: movups xmm3, xmmword ptr [rbp + 8]
0x1451c917b: movups xmmword ptr [rsi + 0xc], xmm0
0x1451c917f: movups xmmword ptr [rsi + 0x1c], xmm1
0x1451c9183: movups xmmword ptr [rsi + 0x2c], xmm2
0x1451c9187: movups xmmword ptr [rsi + 0x38], xmm3
0x1451c918b: mov rcx, qword ptr [rbp - 0x2c]
0x1451c918f: mov byte ptr [rsi], al
0x1451c9191: mov qword ptr [rsi + 4], rcx
0x1451c9195: mov rax, qword ptr [rbp + 0xa0]
0x1451c919c: mov rdx, qword ptr [rax]
0x1451c919f: cmp rdx, -1
0x1451c91a3: je 0x1451c91b9
0x1451c91a5: test rdx, rdx
0x1451c91a8: je 0x1451c91b9
0x1451c91aa: mov rcx, qword ptr [rax + 8]
0x1451c91ae: mov r8d, 1
0x1451c91b4: call 0x1400021d0
0x1451c91b9: mov rax, qword ptr [rbp + 0x90]
0x1451c91c0: mov rdx, qword ptr [rax]
0x1451c91c3: cmp rdx, -1
0x1451c91c7: je 0x1451c9251
0x1451c91cd: test rdx, rdx
0x1451c91d0: je 0x1451c9251
0x1451c91d2: mov rcx, qword ptr [rax + 8]
0x1451c91d6: mov r8d, 1
0x1451c91dc: call 0x1400021d0
0x1451c91e1: jmp 0x1451c9251
0x1451c91e3: mov r12d, dword ptr [rbp - 0x2c]
0x1451c91e7: mov r13d, dword ptr [rbp - 0x28]
0x1451c91eb: mov byte ptr [rbp + 0x1f], 1
0x1451c91ef: mov rcx, rbx
0x1451c91f2: mov edx, r12d
0x1451c91f5: mov r8d, r13d
0x1451c91f8: call 0x1451a26d0
0x1451c91fd: nop
0x1451c91fe: mov rax, qword ptr [rbp + 0x98]
0x1451c9205: mov rdx, qword ptr [rbp + 0x90]
0x1451c920c: mov rcx, qword ptr [rdx + 0x10]
0x1451c9210: mov qword ptr [rbp - 0x20], rcx
0x1451c9214: movups xmm0, xmmword ptr [rdx]
0x1451c9217: movaps xmmword ptr [rbp - 0x30], xmm0
0x1451c921b: mov byte ptr [rbp + 0x1f], 0
0x1451c921f: mov rcx, qword ptr [rbp + 0xa0]
0x1451c9226: mov qword ptr [rsp + 0x40], rcx
0x1451c922b: mov qword ptr [rsp + 0x38], rax
0x1451c9230: mov qword ptr [rsp + 0x30], r15
0x1451c9235: mov dword ptr [rsp + 0x28], r14d
0x1451c923a: mov dword ptr [rsp + 0x20], r13d
0x1451c923f: mov rcx, rsi
0x1451c9242: mov rdx, rbx
0x1451c9245: mov r8, rdi
0x1451c9248: mov r9d, r12d
0x1451c924b: call 0x1451c5130
0x1451c9250: nop
0x1451c9251: mov rax, rsi
0x1451c9254: add rsp, 0xa8
0x1451c925b: pop rbx
0x1451c925c: pop rdi
0x1451c925d: pop rsi
0x1451c925e: pop r12
0x1451c9260: pop r13
0x1451c9262: pop r14
0x1451c9264: pop r15
0x1451c9266: pop rbp
0x1451c9267: ret
