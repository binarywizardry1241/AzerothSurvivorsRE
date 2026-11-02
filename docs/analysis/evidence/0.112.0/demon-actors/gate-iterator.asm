0x1459f2d70: 55 push rbp
0x1459f2d71: 4157 push r15
0x1459f2d73: 4156 push r14
0x1459f2d75: 4155 push r13
0x1459f2d77: 4154 push r12
0x1459f2d79: 56 push rsi
0x1459f2d7a: 57 push rdi
0x1459f2d7b: 53 push rbx
0x1459f2d7c: 4883ec48 sub rsp, 0x48
0x1459f2d80: 488d6c2440 lea rbp, [rsp + 0x40]
0x1459f2d85: 48c74500feffffff mov qword ptr [rbp], 0xfffffffffffffffe
0x1459f2d8d: 448b4110 mov r8d, dword ptr [rcx + 0x10]
0x1459f2d91: 448b5114 mov r10d, dword ptr [rcx + 0x14]
0x1459f2d95: 488b02 mov rax, qword ptr [rdx]
0x1459f2d98: 488945f8 mov qword ptr [rbp - 8], rax
0x1459f2d9c: 4c8b4a08 mov r9, qword ptr [rdx + 8]
0x1459f2da0: 4539d0 cmp r8d, r10d
0x1459f2da3: 0f83b7000000 jae 0x1459f2e60
0x1459f2da9: 4c8b19 mov r11, qword ptr [rcx]
0x1459f2dac: 488b4210 mov rax, qword ptr [rdx + 0x10]
0x1459f2db0: 488945e8 mov qword ptr [rbp - 0x18], rax
0x1459f2db4: 488b7908 mov rdi, qword ptr [rcx + 8]
0x1459f2db8: 0f1f840000000000 nop dword ptr [rax + rax]
0x1459f2dc0: 4c894df0 mov qword ptr [rbp - 0x10], r9
0x1459f2dc4: 4c8b4f10 mov r9, qword ptr [rdi + 0x10]
0x1459f2dc8: 4d85c9 test r9, r9
0x1459f2dcb: 0f84a7000000 je 0x1459f2e78
0x1459f2dd1: 488b5f08 mov rbx, qword ptr [rdi + 8]
0x1459f2dd5: 490fbdc9 bsr rcx, r9
0x1459f2dd9: f7d1 not ecx
0x1459f2ddb: 4d89ce mov r14, r9
0x1459f2dde: 49d3e6 shl r14, cl
0x1459f2de1: 49ffce dec r14
0x1459f2de4: 4d8b23 mov r12, qword ptr [r11]
0x1459f2de7: 498b4b08 mov rcx, qword ptr [r11 + 8]
0x1459f2deb: 4d8b6b18 mov r13, qword ptr [r11 + 0x18]
0x1459f2def: 4d8b7b10 mov r15, qword ptr [r11 + 0x10]
0x1459f2df3: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459f2e00: 4b8d042c lea rax, [r12 + r13]
0x1459f2e04: 48c1c017 rol rax, 0x17
0x1459f2e08: 4c01e0 add rax, r12
0x1459f2e0b: 4889ce mov rsi, rcx
0x1459f2e0e: 48c1e611 shl rsi, 0x11
0x1459f2e12: 4d31e7 xor r15, r12
0x1459f2e15: 4931cd xor r13, rcx
0x1459f2e18: 4d31ec xor r12, r13
0x1459f2e1b: 49c1c52d rol r13, 0x2d
0x1459f2e1f: 4c31f9 xor rcx, r15
0x1459f2e22: 49f7e1 mul r9
0x1459f2e25: 4931f7 xor r15, rsi
0x1459f2e28: 4939c6 cmp r14, rax
0x1459f2e2b: 72d3 jb 0x1459f2e00
0x1459f2e2d: 4d8923 mov qword ptr [r11], r12
0x1459f2e30: 4d896b18 mov qword ptr [r11 + 0x18], r13
0x1459f2e34: 49894b08 mov qword ptr [r11 + 8], rcx
0x1459f2e38: 4d897b10 mov qword ptr [r11 + 0x10], r15
0x1459f2e3c: 4939d1 cmp r9, rdx
0x1459f2e3f: 7652 jbe 0x1459f2e93
0x1459f2e41: 488b04d3 mov rax, qword ptr [rbx + rdx*8]
0x1459f2e45: 41ffc0 inc r8d
0x1459f2e48: 4c8b4df0 mov r9, qword ptr [rbp - 0x10]
0x1459f2e4c: 488b4de8 mov rcx, qword ptr [rbp - 0x18]
0x1459f2e50: 4a8904c9 mov qword ptr [rcx + r9*8], rax
0x1459f2e54: 49ffc1 inc r9
0x1459f2e57: 4539d0 cmp r8d, r10d
0x1459f2e5a: 0f8560ffffff jne 0x1459f2dc0
0x1459f2e60: 488b45f8 mov rax, qword ptr [rbp - 8]
0x1459f2e64: 4c8908 mov qword ptr [rax], r9
0x1459f2e67: 4883c448 add rsp, 0x48
0x1459f2e6b: 5b pop rbx
0x1459f2e6c: 5f pop rdi
0x1459f2e6d: 5e pop rsi
0x1459f2e6e: 415c pop r12
0x1459f2e70: 415d pop r13
0x1459f2e72: 415e pop r14
0x1459f2e74: 415f pop r15
0x1459f2e76: 5d pop rbp
0x1459f2e77: c3 ret
0x1459f2e78: 488d0d46088501 lea rcx, [rip + 0x1850846]
0x1459f2e7f: 4c8d05ba088501 lea r8, [rip + 0x18508ba]
0x1459f2e86: ba19000000 mov edx, 0x19
0x1459f2e8b: e8b06b3b00 call 0x145da9a40
0x1459f2e90: 90 nop
0x1459f2e91: eb13 jmp 0x1459f2ea6
0x1459f2e93: 4c8d05cec88401 lea r8, [rip + 0x184c8ce]
0x1459f2e9a: 4889d1 mov rcx, rdx
0x1459f2e9d: 4c89ca mov rdx, r9
0x1459f2ea0: e8de693b00 call 0x145da9883
0x1459f2ea5: 90 nop
0x1459f2ea6: 0f0b ud2
