; Current0.115.0 SHA256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Selected 0x145903b9b..0x145903c46
0x145903b9b: cmp byte ptr [rcx + 0xc46], 5
0x145903ba2: jne 0x145903ce9
0x145903ba8: mov rsi, rcx
0x145903bab: movzx ebx, byte ptr [rcx + 0xc34]
0x145903bb2: mov byte ptr [rcx + 0xc34], 1
0x145903bb9: mov byte ptr [rcx + 0xc46], 1
0x145903bc0: movss xmm0, dword ptr [rcx + 0xb9c]
0x145903bc8: addss xmm0, dword ptr [rip + 0x17289f0]
0x145903bd0: movss dword ptr [rcx + 0xbf8], xmm0
0x145903bd8: lea rdi, [rcx + 0x630]
0x145903bdf: mov rdx, qword ptr [rcx + 0x478]
0x145903be6: mov r8d, dword ptr [rcx + 0x560]
0x145903bed: lea rcx, [rbp - 0x28]
0x145903bf1: call 0x1459ab7f0
0x145903bf6: mov r14, qword ptr [rsi + 0x640]
0x145903bfd: cmp r14, qword ptr [rsi + 0x630]
0x145903c04: jne 0x145903c0f
0x145903c06: mov rcx, rdi
0x145903c09: call 0x145d150f0
0x145903c0e: nop
0x145903c0f: mov rax, qword ptr [rsi + 0x638]
0x145903c16: mov rcx, r14
0x145903c19: shl rcx, 5
0x145903c1d: movups xmm0, xmmword ptr [rbp - 0x28]
0x145903c21: movups xmm1, xmmword ptr [rbp - 0x18]
0x145903c25: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145903c2a: movups xmmword ptr [rax + rcx], xmm0
0x145903c2e: inc r14
0x145903c31: mov qword ptr [rsi + 0x640], r14
0x145903c38: inc dword ptr [rsi + 0x560]
0x145903c3e: test bl, bl
0x145903c40: jne 0x145903ce9
