0x14525ef60: push rbp
0x14525ef61: push r14
0x14525ef63: push rsi
0x14525ef64: push rdi
0x14525ef65: push rbx
0x14525ef66: sub rsp, 0x80
0x14525ef6d: lea rbp, [rsp + 0x80]
0x14525ef75: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14525ef7d: mov rdi, rdx
0x14525ef80: mov rsi, rcx
0x14525ef83: call 0x140002200
0x14525ef88: mov ecx, 0x10
0x14525ef8d: mov edx, 8
0x14525ef92: call 0x1400021c0
0x14525ef97: test rax, rax
0x14525ef9a: je 0x14525f056
0x14525efa0: mov qword ptr [rax], 1
0x14525efa7: mov qword ptr [rax + 8], 1
0x14525efaf: mov qword ptr [rbp - 0x18], rax
0x14525efb3: mov qword ptr [rbp - 0x28], rax
0x14525efb7: lea rbx, [rip + 0x1a31af2]
0x14525efbe: mov qword ptr [rbp - 0x20], rbx
0x14525efc2: mov r14, qword ptr [rdi]
0x14525efc5: mov byte ptr [rbp - 9], 1
0x14525efc9: call 0x14579ed00
0x14525efce: nop
0x14525efcf: mov rcx, qword ptr [rax]
0x14525efd2: cmp rcx, qword ptr [r14 + 0x48]
0x14525efd6: jne 0x14525efe1
0x14525efd8: add rax, 8
0x14525efdc: mov r14, rax
0x14525efdf: jmp 0x14525eff3
0x14525efe1: cmp byte ptr [r14 + 0x54], 0
0x14525efe6: je 0x14525efef
0x14525efe8: cmp dword ptr [r14 + 0x50], 0
0x14525efed: je 0x14525f067
0x14525efef: add r14, 0x18
0x14525eff3: mov rcx, qword ptr [r14]
0x14525eff6: mov byte ptr [rbp - 9], 0
0x14525effa: mov qword ptr [rsp + 0x20], rbx
0x14525efff: lea rdx, [rip + 0x1a2e4d2]
0x14525f006: mov r8d, 1
0x14525f00c: mov r9, qword ptr [rbp - 0x18]
0x14525f010: call 0x1457bb280
0x14525f015: nop
0x14525f016: mov byte ptr [rbp - 9], 0
0x14525f01a: lea rcx, [rbp - 0x58]
0x14525f01e: mov rdx, rdi
0x14525f021: mov r8, rax
0x14525f024: call 0x14579afa0
0x14525f029: nop
0x14525f02a: movups xmm0, xmmword ptr [rbp - 0x58]
0x14525f02e: movups xmm1, xmmword ptr [rbp - 0x48]
0x14525f032: movups xmm2, xmmword ptr [rbp - 0x38]
0x14525f036: movups xmmword ptr [rsi + 0x28], xmm2
0x14525f03a: movups xmmword ptr [rsi + 0x18], xmm1
0x14525f03e: movups xmmword ptr [rsi + 8], xmm0
0x14525f042: mov byte ptr [rsi], 0xff
0x14525f045: mov rax, rsi
0x14525f048: add rsp, 0x80
0x14525f04f: pop rbx
0x14525f050: pop rdi
0x14525f051: pop rsi
0x14525f052: pop r14
0x14525f054: pop rbp
0x14525f055: ret
0x14525f056: mov ecx, 8
0x14525f05b: mov edx, 0x10
0x14525f060: call 0x145eb6fb1
0x14525f065: ud2
0x14525f067: lea rax, [rip + 0x1a4aa02]
0x14525f06e: mov qword ptr [rbp - 0x58], rax
0x14525f072: lea rax, [rip - 0x525cfb9]
0x14525f079: mov qword ptr [rbp - 0x50], rax
0x14525f07d: mov byte ptr [rbp - 9], 1
0x14525f081: lea rcx, [rip + 0x1a4a9f8]
0x14525f088: lea r8, [rip + 0x1a4a9f9]
0x14525f08f: lea rdx, [rbp - 0x58]
0x14525f093: call 0x145eb7540
0x14525f098: nop
0x14525f099: ud2
