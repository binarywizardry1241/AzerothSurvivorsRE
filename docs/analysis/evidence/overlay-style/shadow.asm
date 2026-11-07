142649b80: push rsi
142649b81: push rdi
142649b82: push rbx
142649b83: sub rsp, 0x30
142649b87: movaps xmmword ptr [rsp + 0x20], xmm6
142649b8c: movaps xmm6, xmm3
142649b8f: mov ebx, r8d
142649b92: mov rdi, rdx
142649b95: mov rsi, rcx
142649b98: call 0x140002200
142649b9d: mov ecx, 0x34
142649ba2: mov edx, 4
142649ba7: call 0x1400021c0
142649bac: test rax, rax
142649baf: je 0x142649c2c
142649bb1: movss xmm0, dword ptr [rsp + 0x98]
142649bba: mov ecx, dword ptr [rsp + 0x90]
142649bc1: movss xmm1, dword ptr [rsp + 0x88]
142649bca: mov edx, dword ptr [rsp + 0x80]
142649bd1: movss xmm2, dword ptr [rsp + 0x78]
142649bd7: mov r8d, dword ptr [rsp + 0x70]
142649bdc: mov dword ptr [rax], ebx
142649bde: movss dword ptr [rax + 4], xmm6
142649be3: mov dword ptr [rax + 8], r8d
142649be7: movss dword ptr [rax + 0xc], xmm2
142649bec: mov dword ptr [rax + 0x10], edx
142649bef: movss dword ptr [rax + 0x14], xmm1
142649bf4: mov dword ptr [rax + 0x18], ecx
142649bf7: movss dword ptr [rax + 0x1c], xmm0
142649bfc: movups xmm0, xmmword ptr [rdi]
142649bff: movups xmmword ptr [rax + 0x20], xmm0
142649c03: mov ecx, dword ptr [rdi + 0x10]
142649c06: mov dword ptr [rax + 0x30], ecx
142649c09: mov qword ptr [rsi], 1
142649c10: mov qword ptr [rsi + 8], rax
142649c14: mov qword ptr [rsi + 0x10], 1
142649c1c: mov rax, rsi
142649c1f: movaps xmm6, xmmword ptr [rsp + 0x20]
142649c24: add rsp, 0x30
142649c28: pop rbx
142649c29: pop rdi
142649c2a: pop rsi
142649c2b: ret
142649c2c: mov ecx, 4
142649c31: mov edx, 0x34
142649c36: call 0x145d992a1
142649c3b: ud2
