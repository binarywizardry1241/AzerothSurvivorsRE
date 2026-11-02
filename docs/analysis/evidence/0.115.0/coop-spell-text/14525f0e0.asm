0x14525f0e0: push rbp
0x14525f0e1: push r14
0x14525f0e3: push rsi
0x14525f0e4: push rdi
0x14525f0e5: push rbx
0x14525f0e6: sub rsp, 0x80
0x14525f0ed: lea rbp, [rsp + 0x80]
0x14525f0f5: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14525f0fd: mov ebx, r8d
0x14525f100: mov rdi, rdx
0x14525f103: mov rsi, rcx
0x14525f106: call 0x140002200
0x14525f10b: mov ecx, 0x18
0x14525f110: mov edx, 8
0x14525f115: call 0x1400021c0
0x14525f11a: test rax, rax
0x14525f11d: je 0x14525f1dc
0x14525f123: mov qword ptr [rax], 1
0x14525f12a: mov qword ptr [rax + 8], 1
0x14525f132: mov byte ptr [rax + 0x10], bl
0x14525f135: mov qword ptr [rbp - 0x18], rax
0x14525f139: mov qword ptr [rbp - 0x28], rax
0x14525f13d: lea rbx, [rip + 0x1a3199c]
0x14525f144: mov qword ptr [rbp - 0x20], rbx
0x14525f148: mov r14, qword ptr [rdi]
0x14525f14b: mov byte ptr [rbp - 9], 1
0x14525f14f: call 0x14579ed00
0x14525f154: nop
0x14525f155: mov rcx, qword ptr [rax]
0x14525f158: cmp rcx, qword ptr [r14 + 0x48]
0x14525f15c: jne 0x14525f167
0x14525f15e: add rax, 8
0x14525f162: mov r14, rax
0x14525f165: jmp 0x14525f179
0x14525f167: cmp byte ptr [r14 + 0x54], 0
0x14525f16c: je 0x14525f175
0x14525f16e: cmp dword ptr [r14 + 0x50], 0
0x14525f173: je 0x14525f1ed
0x14525f175: add r14, 0x18
0x14525f179: mov rcx, qword ptr [r14]
0x14525f17c: mov byte ptr [rbp - 9], 0
0x14525f180: mov qword ptr [rsp + 0x20], rbx
0x14525f185: lea rdx, [rip + 0x1a2e34c]
0x14525f18c: mov r8d, 1
0x14525f192: mov r9, qword ptr [rbp - 0x18]
0x14525f196: call 0x1457bb280
0x14525f19b: nop
0x14525f19c: mov byte ptr [rbp - 9], 0
0x14525f1a0: lea rcx, [rbp - 0x58]
0x14525f1a4: mov rdx, rdi
0x14525f1a7: mov r8, rax
0x14525f1aa: call 0x14579afa0
0x14525f1af: nop
0x14525f1b0: movups xmm0, xmmword ptr [rbp - 0x58]
0x14525f1b4: movups xmm1, xmmword ptr [rbp - 0x48]
0x14525f1b8: movups xmm2, xmmword ptr [rbp - 0x38]
0x14525f1bc: movups xmmword ptr [rsi + 0x28], xmm2
0x14525f1c0: movups xmmword ptr [rsi + 0x18], xmm1
0x14525f1c4: movups xmmword ptr [rsi + 8], xmm0
0x14525f1c8: mov byte ptr [rsi], 0xff
0x14525f1cb: mov rax, rsi
0x14525f1ce: add rsp, 0x80
0x14525f1d5: pop rbx
0x14525f1d6: pop rdi
0x14525f1d7: pop rsi
0x14525f1d8: pop r14
0x14525f1da: pop rbp
0x14525f1db: ret
0x14525f1dc: mov ecx, 8
0x14525f1e1: mov edx, 0x18
0x14525f1e6: call 0x145eb6fb1
0x14525f1eb: ud2
0x14525f1ed: lea rax, [rip + 0x1a4a87c]
0x14525f1f4: mov qword ptr [rbp - 0x58], rax
0x14525f1f8: lea rax, [rip - 0x525d13f]
0x14525f1ff: mov qword ptr [rbp - 0x50], rax
0x14525f203: mov byte ptr [rbp - 9], 1
0x14525f207: lea rcx, [rip + 0x1a4a872]
0x14525f20e: lea r8, [rip + 0x1a4a873]
0x14525f215: lea rdx, [rbp - 0x58]
0x14525f219: call 0x145eb7540
0x14525f21e: nop
0x14525f21f: ud2
