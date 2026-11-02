145953b7d: 488b8db8010000 mov rcx, qword ptr [rbp + 0x1b8]
145953b84: 488b95c0010000 mov rdx, qword ptr [rbp + 0x1c0]
145953b8b: 4883fa02 cmp rdx, 2
145953b8f: 721a jb 0x145953bab
145953b91: 488d42ff lea rax, [rdx - 1]
145953b95: 4531c0 xor r8d, r8d
145953b98: 4e8b4cc108 mov r9, qword ptr [rcx + r8*8 + 8]
145953b9d: 4e3b0cc1 cmp r9, qword ptr [rcx + r8*8]
145953ba1: 7414 je 0x145953bb7
145953ba3: 49ffc0 inc r8
145953ba6: 4c39c0 cmp rax, r8
145953ba9: 75ed jne 0x145953b98
145953bab: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
145953bb2: e9beecffff jmp 0x145952875
145953bb7: 4989cb mov r11, rcx
145953bba: 498d4802 lea rcx, [r8 + 2]
145953bbe: 498d4001 lea rax, [r8 + 1]
145953bc2: 4839d1 cmp rcx, rdx
145953bc5: 7334 jae 0x145953bfb
145953bc7: 4189d2 mov r10d, edx
145953bca: 4529c2 sub r10d, r8d
145953bcd: 4c8d4afd lea r9, [rdx - 3]
145953bd1: 41f6c201 test r10b, 1
145953bd5: 7418 je 0x145953bef
145953bd7: 4b8b4cc310 mov rcx, qword ptr [r11 + r8*8 + 0x10]
145953bdc: 4b3b0cc3 cmp rcx, qword ptr [r11 + r8*8]
145953be0: 7409 je 0x145953beb
145953be2: 4b894cc308 mov qword ptr [r11 + r8*8 + 8], rcx
145953be7: 498d4002 lea rax, [r8 + 2]
145953beb: 498d4803 lea rcx, [r8 + 3]
145953bef: 4d39c1 cmp r9, r8
145953bf2: 7529 jne 0x145953c1d
145953bf4: 4c8b9db8010000 mov r11, qword ptr [rbp + 0x1b8]
145953bfb: 488985c0010000 mov qword ptr [rbp + 0x1c0], rax
145953c02: 4889c2 mov rdx, rax
145953c05: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
145953c0c: 4c89d9 mov rcx, r11
145953c0f: e961ecffff jmp 0x145952875
145953c14: 4883c102 add rcx, 2
145953c18: 4839ca cmp rdx, rcx
145953c1b: 74d7 je 0x145953bf4
145953c1d: 4d8b04cb mov r8, qword ptr [r11 + rcx*8]
145953c21: 4d3b44c3f8 cmp r8, qword ptr [r11 + rax*8 - 8]
145953c26: 750e jne 0x145953c36
145953c28: 4d8b44cb08 mov r8, qword ptr [r11 + rcx*8 + 8]
145953c2d: 4d3b44c3f8 cmp r8, qword ptr [r11 + rax*8 - 8]
145953c32: 74e0 je 0x145953c14
145953c34: eb13 jmp 0x145953c49
145953c36: 4d8904c3 mov qword ptr [r11 + rax*8], r8
145953c3a: 48ffc0 inc rax
145953c3d: 4d8b44cb08 mov r8, qword ptr [r11 + rcx*8 + 8]
145953c42: 4d3b44c3f8 cmp r8, qword ptr [r11 + rax*8 - 8]
145953c47: 74cb je 0x145953c14
145953c49: 4d8904c3 mov qword ptr [r11 + rax*8], r8
145953c4d: 48ffc0 inc rax
145953c50: ebc2 jmp 0x145953c14
