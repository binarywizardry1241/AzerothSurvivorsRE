0x1458b3141: 4885c0                   test rax, rax
0x1458b3144: 7479                     je 0x1458b31bf
0x1458b3146: 48898db8250000           mov qword ptr [rbp + 0x25b8], rcx
0x1458b314d: 0fb685c8250000           movzx eax, byte ptr [rbp + 0x25c8]
0x1458b3154: 0fb68db0250000           movzx ecx, byte ptr [rbp + 0x25b0]
0x1458b315b: 440bade8250000           or r13d, dword ptr [rbp + 0x25e8]
0x1458b3162: 4109cd                   or r13d, ecx
0x1458b3165: 4409ff                   or edi, r15d
0x1458b3168: 09c7                     or edi, eax
0x1458b316a: 48c1e720                 shl rdi, 0x20
0x1458b316e: 4c09ef                   or rdi, r13
0x1458b3171: 4531ff                   xor r15d, r15d
0x1458b3174: eb1d                     jmp 0x1458b3193
0x1458b3176: 662e0f1f840000000000     nop word ptr cs:[rax + rax]
0x1458b3180: 4883faff                 cmp rdx, -1
0x1458b3184: 0f85c1060000             jne 0x1458b384b
0x1458b318a: 4983c738                 add r15, 0x38
0x1458b318e: 4d39fe                   cmp r14, r15
0x1458b3191: 7425                     je 0x1458b31b8
0x1458b3193: 4a8b143b                 mov rdx, qword ptr [rbx + r15]
0x1458b3197: 4e8b6c3b08               mov r13, qword ptr [rbx + r15 + 8]
0x1458b319c: 4a397c3b18               cmp qword ptr [rbx + r15 + 0x18], rdi
0x1458b31a1: 74dd                     je 0x1458b3180
0x1458b31a3: 4885d2                   test rdx, rdx
0x1458b31a6: 74e2                     je 0x1458b318a
0x1458b31a8: 41b801000000             mov r8d, 1
0x1458b31ae: 4c89e9                   mov rcx, r13
0x1458b31b1: e81af074fa               call 0x1400021d0
0x1458b31b6: ebd2                     jmp 0x1458b318a
0x1458b31b8: 4c89a5680c0000           mov qword ptr [rbp + 0xc68], r12
0x1458b31bf: 488d8d600c0000           lea rcx, [rbp + 0xc60]
0x1458b31c6: e885ba1300               call 0x1459eec50
0x1458b31cb: e971320000               jmp 0x1458b6441
