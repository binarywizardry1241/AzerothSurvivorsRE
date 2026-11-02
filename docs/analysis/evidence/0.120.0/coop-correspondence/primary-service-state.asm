0x145af3480: push rbp
0x145af3481: push rsi
0x145af3482: push rdi
0x145af3483: push rbx
0x145af3484: sub rsp, 0x38
0x145af3488: lea rbp, [rsp + 0x30]
0x145af348d: mov qword ptr [rbp], 0xfffffffffffffffe
0x145af3495: mov rdi, qword ptr [rcx]
0x145af3498: mov cl, 1
0x145af349a: xor eax, eax
0x145af349c: lock cmpxchg byte ptr [rdi + 0x10], cl
0x145af34a1: jne 0x145af34fe
0x145af34a3: mov rsi, qword ptr [rip + 0x2a386ce]
0x145af34aa: mov rax, qword ptr [rsi]
0x145af34ad: shl rax, 1
0x145af34b0: test rax, rax
0x145af34b3: jne 0x145af3509
0x145af34b5: mov dword ptr [rbp - 4], 0
0x145af34bc: movzx eax, byte ptr [rdi + 0x11]
0x145af34c0: mov rcx, qword ptr [rdi + 0xa8]
0x145af34c7: mov qword ptr [rbp - 0x10], rdi
0x145af34cb: mov rax, qword ptr [rdi + 0xb0]
0x145af34d2: call qword ptr [rax + 0x28]
0x145af34d5: nop
0x145af34d6: cmp byte ptr [rbp - 4], 0
0x145af34da: mov rdi, qword ptr [rbp - 0x10]
0x145af34de: jne 0x145af34eb
0x145af34e0: mov rcx, qword ptr [rsi]
0x145af34e3: shl rcx, 1
0x145af34e6: test rcx, rcx
0x145af34e9: jne 0x145af3527
0x145af34eb: xor ecx, ecx
0x145af34ed: xchg byte ptr [rdi + 0x10], cl
0x145af34f0: cmp cl, 2
0x145af34f3: je 0x145af3515
0x145af34f5: add rsp, 0x38
0x145af34f9: pop rbx
0x145af34fa: pop rdi
0x145af34fb: pop rsi
0x145af34fc: pop rbp
0x145af34fd: ret
0x145af34fe: lea rcx, [rdi + 0x10]
0x145af3502: call 0x146149410
0x145af3507: jmp 0x145af34a3
0x145af3509: call 0x14614a1a0
0x145af350e: xor al, 1
0x145af3510: mov dword ptr [rbp - 4], eax
0x145af3513: jmp 0x145af34bc
0x145af3515: add rdi, 0x10
0x145af3519: mov rcx, rdi
0x145af351c: mov ebx, eax
0x145af351e: call 0x1461494d0
0x145af3523: mov eax, ebx
0x145af3525: jmp 0x145af34f5
0x145af3527: mov ebx, eax
0x145af3529: call 0x14614a1a0
0x145af352e: mov ecx, eax
0x145af3530: mov eax, ebx
0x145af3532: test cl, cl
0x145af3534: jne 0x145af34eb
0x145af3536: mov byte ptr [rdi + 0x11], 1
0x145af353a: jmp 0x145af34eb
