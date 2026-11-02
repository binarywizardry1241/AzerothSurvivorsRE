0x145c59ec0: push rbp
0x145c59ec1: push rsi
0x145c59ec2: push rdi
0x145c59ec3: sub rsp, 0x60
0x145c59ec7: lea rbp, [rsp + 0x60]
0x145c59ecc: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145c59ed4: test r8d, r8d
0x145c59ed7: je 0x145c59f68
0x145c59edd: mov rsi, rcx
0x145c59ee0: mulss xmm3, dword ptr [rip + 0x5fed74]
0x145c59ee8: cvttss2si rax, xmm3
0x145c59eed: xor ecx, ecx
0x145c59eef: xorps xmm0, xmm0
0x145c59ef2: ucomiss xmm3, xmm0
0x145c59ef5: cmovae ecx, eax
0x145c59ef8: ucomiss xmm3, dword ptr [rip + 0x5f2cf5]
0x145c59eff: mov r9d, 0xffffffff
0x145c59f05: cmovbe r9d, ecx
0x145c59f09: mov dword ptr [rbp - 0x38], 2
0x145c59f10: lea rax, [rbp - 0x38]
0x145c59f14: mov qword ptr [rsp + 0x20], rax
0x145c59f19: lea rcx, [rbp - 0x28]
0x145c59f1d: call 0x145af5d50
0x145c59f22: mov rdi, qword ptr [rsi + 0x680]
0x145c59f29: cmp rdi, qword ptr [rsi + 0x670]
0x145c59f30: jne 0x145c59f3f
0x145c59f32: lea rcx, [rsi + 0x670]
0x145c59f39: call 0x146061ee0
0x145c59f3e: nop 
0x145c59f3f: mov rax, qword ptr [rsi + 0x678]
0x145c59f46: mov rcx, rdi
0x145c59f49: shl rcx, 5
0x145c59f4d: movups xmm0, xmmword ptr [rbp - 0x28]
0x145c59f51: movups xmm1, xmmword ptr [rbp - 0x18]
0x145c59f55: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145c59f5a: movups xmmword ptr [rax + rcx], xmm0
0x145c59f5e: inc rdi
0x145c59f61: mov qword ptr [rsi + 0x680], rdi
0x145c59f68: add rsp, 0x60
0x145c59f6c: pop rdi
0x145c59f6d: pop rsi
0x145c59f6e: pop rbp
0x145c59f6f: ret 
