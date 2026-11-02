0x14595c078: 498b8618080000 mov rax, qword ptr [r14 + 0x818]
0x14595c07f: f30f1005d9114500 movss xmm0, dword ptr [rip + 0x4511d9]
0x14595c087: 0f28f0 movaps xmm6, xmm0
0x14595c08a: 4885c0 test rax, rax
0x14595c08d: 743a je 0x14595c0c9
0x14595c08f: 498b8e10080000 mov rcx, qword ptr [r14 + 0x810]
0x14595c096: f30f103542144500 movss xmm6, dword ptr [rip + 0x451442]
0x14595c09e: eb09 jmp 0x14595c0a9
0x14595c0a0: 4883c120 add rcx, 0x20
0x14595c0a4: 48ffc8 dec rax
0x14595c0a7: 7418 je 0x14595c0c1
0x14595c0a9: 803903 cmp byte ptr [rcx], 3
0x14595c0ac: 75f2 jne 0x14595c0a0
0x14595c0ae: 80790102 cmp byte ptr [rcx + 1], 2
0x14595c0b2: 75ec jne 0x14595c0a0
0x14595c0b4: 80791800 cmp byte ptr [rcx + 0x18], 0
0x14595c0b8: 75e6 jne 0x14595c0a0
0x14595c0ba: f30f58711c addss xmm6, dword ptr [rcx + 0x1c]
0x14595c0bf: ebdf jmp 0x14595c0a0
0x14595c0c1: f30f583597114500 addss xmm6, dword ptr [rip + 0x451197]
0x14595c0c9: 418b86e0040000 mov eax, dword ptr [r14 + 0x4e0]
0x14595c0d0: f3480f2ac8 cvtsi2ss xmm1, rax
0x14595c0d5: f30f580d8b524500 addss xmm1, dword ptr [rip + 0x45528b]
0x14595c0dd: f30f590d63aa4500 mulss xmm1, dword ptr [rip + 0x45aa63]
0x14595c0e5: f30f58c8 addss xmm1, xmm0
0x14595c0e9: f3410f594f2c mulss xmm1, dword ptr [r15 + 0x2c]
0x14595c0ef: f3410f598e84040000 mulss xmm1, dword ptr [r14 + 0x484]
0x14595c0f8: 498b9600080000 mov rdx, qword ptr [r14 + 0x800]
0x14595c0ff: 4885d2 test rdx, rdx
0x14595c102: 747a je 0x14595c17e
0x14595c104: 498b86f8070000 mov rax, qword ptr [r14 + 0x7f8]
0x14595c10b: 4883fa01 cmp rdx, 1
0x14595c10f: 750c jne 0x14595c11d
0x14595c111: f30f1005c7134500 movss xmm0, dword ptr [rip + 0x4513c7]
0x14595c119: 31c9 xor ecx, ecx
0x14595c11b: eb4d jmp 0x14595c16a
0x14595c11d: 4989d0 mov r8, rdx
0x14595c120: 4983e0fe and r8, 0xfffffffffffffffe
0x14595c124: f30f1005b4134500 movss xmm0, dword ptr [rip + 0x4513b4]
0x14595c12c: 31c9 xor ecx, ecx
0x14595c12e: eb09 jmp 0x14595c139
0x14595c130: 4883c102 add rcx, 2
0x14595c134: 4939c8 cmp r8, rcx
0x14595c137: 742c je 0x14595c165
0x14595c139: 803cc81e cmp byte ptr [rax + rcx*8], 0x1e
0x14595c13d: 7411 je 0x14595c150
0x14595c13f: 807cc8081e cmp byte ptr [rax + rcx*8 + 8], 0x1e
0x14595c144: 75ea jne 0x14595c130
0x14595c146: eb15 jmp 0x14595c15d
0x14595c148: 0f1f840000000000 nop dword ptr [rax + rax]
0x14595c150: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x14595c156: 807cc8081e cmp byte ptr [rax + rcx*8 + 8], 0x1e
0x14595c15b: 75d3 jne 0x14595c130
0x14595c15d: f30f5844c80c addss xmm0, dword ptr [rax + rcx*8 + 0xc]
0x14595c163: ebcb jmp 0x14595c130
0x14595c165: f6c201 test dl, 1
0x14595c168: 740c je 0x14595c176
0x14595c16a: 803cc81e cmp byte ptr [rax + rcx*8], 0x1e
0x14595c16e: 7506 jne 0x14595c176
0x14595c170: f30f5844c804 addss xmm0, dword ptr [rax + rcx*8 + 4]
0x14595c176: f30f5805e2104500 addss xmm0, dword ptr [rip + 0x4510e2]
0x14595c17e: f30f59c8 mulss xmm1, xmm0
0x14595c182: f30f59f1 mulss xmm6, xmm1
