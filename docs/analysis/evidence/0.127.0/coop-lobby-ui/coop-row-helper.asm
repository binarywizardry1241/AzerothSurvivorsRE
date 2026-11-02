0x1402af200: push rbp
0x1402af201: push r15
0x1402af203: push r14
0x1402af205: push r12
0x1402af207: push rsi
0x1402af208: push rdi
0x1402af209: push rbx
0x1402af20a: sub rsp, 0x30
0x1402af20e: lea rbp, [rsp + 0x30]
0x1402af213: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1402af21b: mov rsi, rcx
0x1402af21e: cmp byte ptr [rdx + 0x38], 0
0x1402af222: jne 0x1402af23a
0x1402af224: cmp byte ptr [rdx + 0x39], 0
0x1402af228: jne 0x1402af23a
0x1402af22a: cmp byte ptr [rsi + 0x1b4], 0
0x1402af231: jne 0x1402af23a
0x1402af233: inc qword ptr [rsi + 0x1a0]
0x1402af23a: mov qword ptr [rbp - 0x10], rdx
0x1402af23e: mov rdi, qword ptr [rsi + 0x158]
0x1402af245: cmp rdi, qword ptr [rsi + 0x148]
0x1402af24c: jne 0x1402af25b
0x1402af24e: lea rcx, [rsi + 0x148]
0x1402af255: call 0x146061d20
0x1402af25a: nop 
0x1402af25b: mov rax, qword ptr [rsi + 0x150]
0x1402af262: mov r8, rdi
0x1402af265: shl r8, 6
0x1402af269: mov rcx, qword ptr [rbp - 0x10]
0x1402af26d: movups xmm0, xmmword ptr [rcx]
0x1402af270: movups xmm1, xmmword ptr [rcx + 0x10]
0x1402af274: movups xmm2, xmmword ptr [rcx + 0x20]
0x1402af278: movups xmm3, xmmword ptr [rcx + 0x30]
0x1402af27c: movups xmmword ptr [rax + r8 + 0x30], xmm3
0x1402af282: movups xmmword ptr [rax + r8 + 0x20], xmm2
0x1402af288: movups xmmword ptr [rax + r8 + 0x10], xmm1
0x1402af28e: movups xmmword ptr [rax + r8], xmm0
0x1402af293: lea rax, [rdi + 1]
0x1402af297: mov qword ptr [rsi + 0x158], rax
0x1402af29e: cmp rdi, 0x4f
0x1402af2a2: jle 0x1402af2fc
0x1402af2a4: mov rcx, qword ptr [rsi + 0x150]
0x1402af2ab: mov r15, qword ptr [rcx]
0x1402af2ae: mov r12, qword ptr [rcx + 8]
0x1402af2b2: mov rbx, qword ptr [rcx + 0x18]
0x1402af2b6: mov r14, qword ptr [rcx + 0x20]
0x1402af2ba: lea rdx, [rcx + 0x40]
0x1402af2be: call 0x146061727
0x1402af2c3: mov qword ptr [rsi + 0x158], rdi
0x1402af2ca: test r15, r15
0x1402af2cd: je 0x1402af2e6
0x1402af2cf: cmp r15, -1
0x1402af2d3: je 0x1402af312
0x1402af2d5: mov r8d, 1
0x1402af2db: mov rcx, r12
0x1402af2de: mov rdx, r15
0x1402af2e1: call 0x1400021d0
0x1402af2e6: test rbx, rbx
0x1402af2e9: je 0x1402af2fc
0x1402af2eb: mov r8d, 1
0x1402af2f1: mov rcx, r14
0x1402af2f4: mov rdx, rbx
0x1402af2f7: call 0x1400021d0
0x1402af2fc: inc qword ptr [rsi + 0x190]
0x1402af303: add rsp, 0x30
0x1402af307: pop rbx
0x1402af308: pop rdi
0x1402af309: pop rsi
0x1402af30a: pop r12
0x1402af30c: pop r14
0x1402af30e: pop r15
0x1402af310: pop rbp
0x1402af311: ret 
0x1402af312: lea r8, [rip + 0x5fc8f87]
0x1402af319: xor ecx, ecx
0x1402af31b: mov rdx, rdi
0x1402af31e: call 0x146208a3b
0x1402af323: ud2 
