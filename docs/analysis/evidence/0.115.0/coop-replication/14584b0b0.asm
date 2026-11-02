0x14584b0b0: push rbp
0x14584b0b1: push r14
0x14584b0b3: push rsi
0x14584b0b4: push rdi
0x14584b0b5: push rbx
0x14584b0b6: sub rsp, 0xa0
0x14584b0bd: lea rbp, [rsp + 0x80]
0x14584b0c5: mov qword ptr [rbp + 0x18], 0xfffffffffffffffe
0x14584b0cd: mov rsi, rcx
0x14584b0d0: mov rax, qword ptr [rdx + 0x10]
0x14584b0d4: cmp rax, 0x7f
0x14584b0d8: mov qword ptr [rbp + 8], rdx
0x14584b0dc: ja 0x14584b0e4
0x14584b0de: mov rdi, qword ptr [rdx + 8]
0x14584b0e2: jmp 0x14584b13c
0x14584b0e4: add rax, -0x80
0x14584b0e8: mov qword ptr [rbp], rax
0x14584b0ec: mov rdi, qword ptr [rdx + 8]
0x14584b0f0: lea rcx, [rdi + 0x5800]
0x14584b0f7: mov qword ptr [rdx + 0x10], 0x80
0x14584b0ff: mov qword ptr [rbp + 0x10], 0
0x14584b107: mov qword ptr [rbp - 8], rcx
0x14584b10b: nop dword ptr [rax + rax]
0x14584b110: mov rax, qword ptr [rbp + 0x10]
0x14584b114: cmp qword ptr [rbp], rax
0x14584b118: je 0x14584b133
0x14584b11a: inc rax
0x14584b11d: mov qword ptr [rbp + 0x10], rax
0x14584b121: lea rbx, [rcx + 0xb0]
0x14584b128: call 0x14006bb30
0x14584b12d: nop
0x14584b12e: mov rcx, rbx
0x14584b131: jmp 0x14584b110
0x14584b133: mov eax, 0x80
0x14584b138: mov rdx, qword ptr [rbp + 8]
0x14584b13c: imul rbx, rax, 0xb0
0x14584b143: add rbx, rdi
0x14584b146: jmp 0x14584b157
0x14584b148: nop dword ptr [rax + rax]
0x14584b150: mov rdi, r14
0x14584b153: mov rdx, qword ptr [rbp + 8]
0x14584b157: cmp rdi, rbx
0x14584b15a: je 0x14584b1d1
0x14584b15c: mov rcx, rdi
0x14584b15f: call 0x14583bab0
0x14584b164: nop
0x14584b165: lea rcx, [rdi + 0x18]
0x14584b169: call 0x14583bab0
0x14584b16e: nop
0x14584b16f: lea rcx, [rdi + 0x30]
0x14584b173: call 0x14583bab0
0x14584b178: nop
0x14584b179: lea r14, [rdi + 0xb0]
0x14584b180: lea rax, [rdi + 0x48]
0x14584b184: lea rcx, [rdi + 0x60]
0x14584b188: lea rdx, [rdi + 0x78]
0x14584b18c: add rdi, 0x90
0x14584b193: mov qword ptr [rbp - 0x60], 1
0x14584b19b: mov qword ptr [rbp - 0x48], rax
0x14584b19f: mov qword ptr [rbp - 0x40], rcx
0x14584b1a3: mov qword ptr [rbp - 0x38], rdx
0x14584b1a7: mov qword ptr [rbp - 0x30], rdi
0x14584b1ab: xor edi, edi
0x14584b1ad: nop dword ptr [rax]
0x14584b1b0: cmp rdi, 4
0x14584b1b4: je 0x14584b150
0x14584b1b6: mov rcx, qword ptr [rbp + rdi*8 - 0x48]
0x14584b1bb: cmp qword ptr [rcx], -1
0x14584b1bf: jne 0x14584b1c6
0x14584b1c1: inc rdi
0x14584b1c4: jmp 0x14584b1b0
0x14584b1c6: inc rdi
0x14584b1c9: call 0x14583bab0
0x14584b1ce: nop
0x14584b1cf: jmp 0x14584b1b0
0x14584b1d1: mov rax, qword ptr [rdx + 0x10]
0x14584b1d5: mov qword ptr [rsi + 0x10], rax
0x14584b1d9: movups xmm0, xmmword ptr [rdx]
0x14584b1dc: movups xmmword ptr [rsi], xmm0
0x14584b1df: mov rax, rsi
0x14584b1e2: add rsp, 0xa0
0x14584b1e9: pop rbx
0x14584b1ea: pop rdi
0x14584b1eb: pop rsi
0x14584b1ec: pop r14
0x14584b1ee: pop rbp
0x14584b1ef: ret
