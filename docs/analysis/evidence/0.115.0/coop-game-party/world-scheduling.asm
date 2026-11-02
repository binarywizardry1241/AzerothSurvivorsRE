0x1458f90b2: 498b8df8090000           mov rcx, qword ptr [r13 + 0x9f8]
0x1458f90b9: 4d8b85000a0000           mov r8, qword ptr [r13 + 0xa00]
0x1458f90c0: 4c89c0                   mov rax, r8
0x1458f90c3: 48c1e004                 shl rax, 4
0x1458f90c7: 4889ca                   mov rdx, rcx
0x1458f90ca: 660f1f440000             nop word ptr [rax + rax]
0x1458f90d0: 4885c0                   test rax, rax
0x1458f90d3: 0f8498050000             je 0x1458f9671
0x1458f90d9: 4883c0f0                 add rax, -0x10
0x1458f90dd: 807a0c00                 cmp byte ptr [rdx + 0xc], 0
0x1458f90e1: 488d5210                 lea rdx, [rdx + 0x10]
0x1458f90e5: 74e9                     je 0x1458f90d0
0x1458f90e7: 4983f801                 cmp r8, 1
0x1458f90eb: 4d89c1                   mov r9, r8
0x1458f90ee: 4983d100                 adc r9, 0
0x1458f90f2: 4d8b95480b0000           mov r10, qword ptr [r13 + 0xb48]
0x1458f90f9: be01000000               mov esi, 1
0x1458f90fe: 41bb01000000             mov r11d, 1
0x1458f9104: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458f9110: 4c39c6                   cmp rsi, r8
0x1458f9113: 4983d300                 adc r11, 0
0x1458f9117: 4a8d0416                 lea rax, [rsi + r10]
0x1458f911b: 4889c2                   mov rdx, rax
0x1458f911e: 4c09ca                   or rdx, r9
0x1458f9121: 48c1ea20                 shr rdx, 0x20
0x1458f9125: 7419                     je 0x1458f9140
0x1458f9127: 31d2                     xor edx, edx
0x1458f9129: 49f7f1                   div r9
0x1458f912c: 4c39c2                   cmp rdx, r8
0x1458f912f: 7219                     jb 0x1458f914a
0x1458f9131: eb29                     jmp 0x1458f915c
0x1458f9133: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1458f9140: 31d2                     xor edx, edx
0x1458f9142: 41f7f1                   div r9d
0x1458f9145: 4c39c2                   cmp rdx, r8
0x1458f9148: 7312                     jae 0x1458f915c
0x1458f914a: 4889d0                   mov rax, rdx
0x1458f914d: 48c1e004                 shl rax, 4
0x1458f9151: 807c010c00               cmp byte ptr [rcx + rax + 0xc], 0
0x1458f9156: 0f85b0000000             jne 0x1458f920c
0x1458f915c: 4939f0                   cmp r8, rsi
0x1458f915f: 7608                     jbe 0x1458f9169
0x1458f9161: 4c89de                   mov rsi, r11
0x1458f9164: 4d39cb                   cmp r11, r9
0x1458f9167: 76a7                     jbe 0x1458f9110
0x1458f9169: 49c785480b000000000000   mov qword ptr [r13 + 0xb48], 0
0x1458f9174: 48c7850013000000000000   mov qword ptr [rbp + 0x1300], 0
