1411a4a93: mov r10d, dword ptr [rbp + 0x57c]
1411a4a9a: mov r11, qword ptr [rbp + 0x500]
1411a4aa1: mov rdx, qword ptr [rbp + 0x5c0]
1411a4aa8: movss xmm2, dword ptr [rbp + 0x5d0]
1411a4ab0: movss xmm0, dword ptr [rdx + 0x14]
1411a4ab5: ucomiss xmm15, xmm0
1411a4ab9: jne 0x1411a4abd
1411a4abb: jnp 0x1411a4add
1411a4abd: inc dword ptr [rbp + 0x4dc]
1411a4ac3: mov ecx, dword ptr [rbp + 0x314]
1411a4ac9: mov r8, qword ptr [rbp + 0x2f0]
1411a4ad0: mov dword ptr [r8], ecx
1411a4ad3: movss dword ptr [rdx + 0x14], xmm15
1411a4ad9: movaps xmm0, xmm15
1411a4add: mov rcx, qword ptr [rbp + 0x2e0]
1411a4ae4: mov rcx, qword ptr [rcx]
1411a4ae7: mov r8, qword ptr [rbp + 0x568]
1411a4aee: test r8, r8
1411a4af1: mov dword ptr [rbp + 0x57c], r10d
1411a4af8: mov qword ptr [rbp + 0x500], r11
1411a4aff: je 0x1411a4b58
1411a4b01: mov edx, dword ptr [rbp + 0x310]
1411a4b07: mov r9, qword ptr [rbp + 0x2f8]
1411a4b0e: mov dword ptr [r9], edx
1411a4b11: mov dword ptr [r8], r10d
1411a4b14: mov qword ptr [r8 + 8], r11
1411a4b18: mov edx, dword ptr [rbp + 0x5cc]
1411a4b1e: mov dword ptr [r8 + 0x10], edx
1411a4b22: movss dword ptr [r8 + 0x18], xmm6
1411a4b28: movaps xmm1, xmmword ptr [rbp + 0x4b0]
1411a4b2f: movss dword ptr [r8 + 0x1c], xmm1
1411a4b35: mov qword ptr [r8 + 0x20], rcx
1411a4b39: movss dword ptr [r8 + 0x28], xmm2
1411a4b3f: movss dword ptr [r8 + 0x2c], xmm0
1411a4b45: mov ecx, dword ptr [rbp + 0x5a4]
1411a4b4b: mov dword ptr [r8 + 0x30], ecx
1411a4b4f: mov byte ptr [r8 + 0x34], al
1411a4b53: jmp 0x1411a4bf8
