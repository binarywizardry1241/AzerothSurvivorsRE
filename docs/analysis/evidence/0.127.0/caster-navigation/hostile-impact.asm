145c69b43: 4c8b0f mov r9, qword ptr [rdi]
145c69b46: 4983f902 cmp r9, 2
145c69b4a: 0f84330e0000 je 0x145c6a983
145c69b50: 488d8790000000 lea rax, [rdi + 0x90]
145c69b57: 48898598000000 mov qword ptr [rbp + 0x98], rax
145c69b5e: 488b5724 mov rdx, qword ptr [rdi + 0x24]
145c69b62: 4c8b7f68 mov r15, qword ptr [rdi + 0x68]
145c69b66: f30f10b784000000 movss xmm6, dword ptr [rdi + 0x84]
145c69b6e: 0fb68f89000000 movzx ecx, byte ptr [rdi + 0x89]
145c69b75: 0fb68788000000 movzx eax, byte ptr [rdi + 0x88]
145c69b7c: 8b9f80000000 mov ebx, dword ptr [rdi + 0x80]
145c69b82: 4c8b6f60 mov r13, qword ptr [rdi + 0x60]
145c69b86: 440fb64759 movzx r8d, byte ptr [rdi + 0x59]
145c69b8b: 440fb65758 movzx r10d, byte ptr [rdi + 0x58]
145c69b90: 448b5f2c mov r11d, dword ptr [rdi + 0x2c]
145c69b94: 4c8b6708 mov r12, qword ptr [rdi + 8]
145c69b98: f6472001 test byte ptr [rdi + 0x20], 1
145c69b9c: 0f104710 movups xmm0, xmmword ptr [rdi + 0x10]
145c69ba0: 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
145c69ba4: 488b7750 mov rsi, qword ptr [rdi + 0x50]
145c69ba8: 48897520 mov qword ptr [rbp + 0x20], rsi
145c69bac: 0f104730 movups xmm0, xmmword ptr [rdi + 0x30]
145c69bb0: 0f104f40 movups xmm1, xmmword ptr [rdi + 0x40]
145c69bb4: 0f294d10 movaps xmmword ptr [rbp + 0x10], xmm1
145c69bb8: 0f294500 movaps xmmword ptr [rbp], xmm0
145c69bbc: 0fb7775e movzx esi, word ptr [rdi + 0x5e]
145c69bc0: 6689b584010000 mov word ptr [rbp + 0x184], si
145c69bc7: 8b775a mov esi, dword ptr [rdi + 0x5a]
145c69bca: 89b580010000 mov dword ptr [rbp + 0x180], esi
145c69bd0: 0f104770 movups xmm0, xmmword ptr [rdi + 0x70]
145c69bd4: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
145c69bd8: 8bb78a000000 mov esi, dword ptr [rdi + 0x8a]
145c69bde: 89b560010000 mov dword ptr [rbp + 0x160], esi
145c69be4: 0fb7b78e000000 movzx esi, word ptr [rdi + 0x8e]
145c69beb: 6689b564010000 mov word ptr [rbp + 0x164], si
145c69bf2: 7430 je 0x145c69c24
145c69bf4: 498b8e180c0000 mov rcx, qword ptr [r14 + 0xc18]
145c69bfb: 48837940ff cmp qword ptr [rcx + 0x40], -1
145c69c00: 0f841affffff je 0x145c69b20
145c69c06: 4883c140 add rcx, 0x40
145c69c0a: 4d8b8620050000 mov r8, qword ptr [r14 + 0x520]
145c69c11: e87af0f2ff call 0x145b98c90
145c69c16: 90 nop
145c69c17: 84c0 test al, al
145c69c19: 0f8501ffffff jne 0x145c69b20
145c69c1f: e90effffff jmp 0x145c69b32
