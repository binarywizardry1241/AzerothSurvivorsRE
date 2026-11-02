1411a3f6b: jne 0x1411a3fea
1411a3f6d: jp 0x1411a3fea
1411a3f6f: mov rcx, qword ptr [rax + 0x20]
1411a3f73: mov rdx, qword ptr [rbp + 0x2e0]
1411a3f7a: cmp rcx, qword ptr [rdx]
1411a3f7d: jne 0x1411a3fea
1411a3f7f: mov ecx, dword ptr [rbp + 0x5a4]
1411a3f85: cmp dword ptr [rax + 0x30], ecx
1411a3f88: sete cl
1411a3f8b: cmp byte ptr [rax + 0x34], 1
1411a3f8f: jne 0x1411a3fea
1411a3f91: movss xmm0, dword ptr [rax + 0x18]
1411a3f96: ucomiss xmm0, xmm6
1411a3f99: jne 0x1411a3fea
1411a3f9b: jp 0x1411a3fea
1411a3f9d: ucomiss xmm1, dword ptr [rax + 0x1c]
1411a3fa1: setp dl
1411a3fa4: setne r10b
1411a3fa8: or r10b, dl
1411a3fab: xor cl, 1
1411a3fae: or cl, r10b
1411a3fb1: mov eax, dword ptr [rbp + 0x580]
1411a3fb7: jne 0x1411a3fea
1411a3fb9: inc eax
1411a3fbb: mov dword ptr [rbp + 0x548], eax
1411a3fc1: movzx ecx, byte ptr [rbp + 0x5d7]
1411a3fc8: mov r10, qword ptr [rbp + 0x320]
1411a3fcf: mov rdx, qword ptr [rbp + 0x570]
1411a3fd6: mov dword ptr [rbp + 0x580], eax
1411a3fdc: test cl, 1
1411a3fdf: jne 0x1411a3b43
1411a3fe5: jmp 0x1411a3757
