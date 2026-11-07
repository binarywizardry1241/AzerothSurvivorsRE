144c85c10: push rsi
144c85c11: sub rsp, 0x90
144c85c18: movaps xmmword ptr [rsp + 0x80], xmm11
144c85c21: movaps xmmword ptr [rsp + 0x70], xmm10
144c85c27: movaps xmmword ptr [rsp + 0x60], xmm9
144c85c2d: movaps xmmword ptr [rsp + 0x50], xmm8
144c85c33: movaps xmmword ptr [rsp + 0x40], xmm7
144c85c38: movaps xmmword ptr [rsp + 0x30], xmm6
144c85c3d: mov rsi, rcx
144c85c40: mov ecx, dword ptr [rdx]
144c85c42: lea rax, [rdx + 4]
144c85c46: lea r8, [rip + 0x1e6aa8b]
144c85c4d: movsxd rcx, dword ptr [r8 + rcx*4]
144c85c51: add rcx, r8
144c85c54: jmp rcx
144c85c56: movups xmm0, xmmword ptr [rax]
144c85c59: movups xmmword ptr [rsi], xmm0
144c85c5c: jmp 0x144c8633b
