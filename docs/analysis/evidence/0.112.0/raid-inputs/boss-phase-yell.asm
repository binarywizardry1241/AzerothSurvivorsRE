145897ec0: 55 push rbp
145897ec1: 4156 push r14
145897ec3: 56 push rsi
145897ec4: 57 push rdi
145897ec5: 53 push rbx
145897ec6: 4883ec70 sub rsp, 0x70
145897eca: 488d6c2470 lea rbp, [rsp + 0x70]
145897ecf: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
145897ed7: 483b5138 cmp rdx, qword ptr [rcx + 0x38]
145897edb: 7313 jae 0x145897ef0
145897edd: 488b4130 mov rax, qword ptr [rcx + 0x30]
145897ee1: 4c8d04d2 lea r8, [rdx + rdx*8]
145897ee5: 4a8b34c0 mov rsi, qword ptr [rax + r8*8]
145897ee9: 4a8b5cc008 mov rbx, qword ptr [rax + r8*8 + 8]
145897eee: eb07 jmp 0x145897ef7
145897ef0: be01000000 mov esi, 1
145897ef5: 31db xor ebx, ebx
145897ef7: 4883c140 add rcx, 0x40
145897efb: 48ffc2 inc rdx
145897efe: 488955e8 mov qword ptr [rbp - 0x18], rdx
145897f02: 48894db0 mov qword ptr [rbp - 0x50], rcx
145897f06: 488d05d36c3500 lea rax, [rip + 0x356cd3]
145897f0d: 488945b8 mov qword ptr [rbp - 0x48], rax
145897f11: 488d45e8 lea rax, [rbp - 0x18]
145897f15: 488945c0 mov qword ptr [rbp - 0x40], rax
145897f19: 488d05b07b3500 lea rax, [rip + 0x357bb0]
145897f20: 488945c8 mov qword ptr [rbp - 0x38], rax
145897f24: 488d15e1bf3401 lea rdx, [rip + 0x134bfe1]
145897f2b: 488d4dd0 lea rcx, [rbp - 0x30]
145897f2f: 4c8d45b0 lea r8, [rbp - 0x50]
145897f33: e8f8513400 call 0x145bdd130
145897f38: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
145897f3c: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
145897f40: 48894df0 mov qword ptr [rbp - 0x10], rcx
145897f44: e8875e0f00 call 0x14598ddd0
145897f49: 90 nop
145897f4a: 4889c7 mov rdi, rax
145897f4d: 488b45d0 mov rax, qword ptr [rbp - 0x30]
145897f51: 4885c0 test rax, rax
145897f54: 7418 je 0x145897f6e
145897f56: 41b801000000 mov r8d, 1
145897f5c: 488b4df0 mov rcx, qword ptr [rbp - 0x10]
145897f60: 4989d6 mov r14, rdx
145897f63: 4889c2 mov rdx, rax
145897f66: e865a276fa call 0x1400021d0
145897f6b: 4c89f2 mov rdx, r14
145897f6e: 4885ff test rdi, rdi
145897f71: 480f45f7 cmovne rsi, rdi
145897f75: 480f44d3 cmove rdx, rbx
145897f79: 4889f0 mov rax, rsi
145897f7c: 4883c470 add rsp, 0x70
145897f80: 5b pop rbx
145897f81: 5f pop rdi
145897f82: 5e pop rsi
145897f83: 415e pop r14
145897f85: 5d pop rbp
145897f86: c3 ret
