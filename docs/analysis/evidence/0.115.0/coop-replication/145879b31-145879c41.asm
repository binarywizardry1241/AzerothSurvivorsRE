0x145879b31: imul rdi, rsi, 0x478
0x145879b38: xor ebx, ebx
0x145879b3a: jmp 0x145879b5d
0x145879b3c: test al, al
0x145879b3e: jne 0x145879ce4
0x145879b44: mov byte ptr [rbp + 0xddf], 1
0x145879b4b: mov rcx, qword ptr [rbp + 0xe00]
0x145879b52: mov rdx, rsi
0x145879b55: call 0x145896390
0x145879b5a: nop
0x145879b5b: xor ebx, ebx
0x145879b5d: mov rax, qword ptr [rbp + 0xdd0]
0x145879b64: cmp dword ptr [rax], 3
0x145879b67: jne 0x145879d80
0x145879b6d: mov rax, qword ptr [rbp + 0xe00]
0x145879b74: mov rdx, qword ptr [rax + 0xc98]
0x145879b7b: cmp rsi, rdx
0x145879b7e: jae 0x145879cec
0x145879b84: cmp rbx, 0xc7
0x145879b8b: ja 0x145879ce4
0x145879b91: cmp rsi, rdx
0x145879b94: jae 0x14587dfe9
0x145879b9a: mov r15, qword ptr [rbp + 0xe00]
0x145879ba1: mov rax, qword ptr [r15 + 0xc90]
0x145879ba8: mov rdx, qword ptr [rax + rdi + 0x460]
0x145879bb0: mov r8, qword ptr [rax + rdi + 0x468]
0x145879bb8: mov rcx, r14
0x145879bbb: call 0x145858570
0x145879bc0: cmp dword ptr [r15 + 0xc58], 3
0x145879bc8: jne 0x145879c10
0x145879bca: mov rdx, qword ptr [r15 + 0xc98]
0x145879bd1: cmp rsi, rdx
0x145879bd4: jae 0x14587e01f
0x145879bda: mov rax, qword ptr [r15 + 0xc90]
0x145879be1: mov r15, qword ptr [rax + rdi + 0x10]
0x145879be6: cmp qword ptr [rbp - 0x50], -1
0x145879beb: je 0x145879c41
0x145879bed: test r15, r15
0x145879bf0: je 0x145879c1b
0x145879bf2: inc rbx
0x145879bf5: mov rcx, r14
0x145879bf8: call 0x1458712e0
0x145879bfd: jmp 0x145879b5d
0x145879c02: nop word ptr cs:[rax + rax]
0x145879c10: cmp qword ptr [rbp - 0x50], -1
0x145879c15: je 0x145879b44
0x145879c1b: mov byte ptr [rbp + 0xddf], 0
0x145879c22: mov rcx, qword ptr [rbp + 0xe00]
0x145879c29: mov rdx, rsi
0x145879c2c: mov r8, r14
0x145879c2f: movapd xmm3, xmm6
0x145879c33: call 0x1458952f0
0x145879c38: nop
0x145879c39: inc rbx
0x145879c3c: jmp 0x145879b5d
