0x1459d5480: push rbp
0x1459d5481: push r15
0x1459d5483: push r14
0x1459d5485: push rsi
0x1459d5486: push rdi
0x1459d5487: push rbx
0x1459d5488: sub rsp, 0x58
0x1459d548c: lea rbp, [rsp + 0x50]
0x1459d5491: mov qword ptr [rbp], 0xfffffffffffffffe
0x1459d5499: mov r14, qword ptr [rdx + 8]
0x1459d549d: sub r14, qword ptr [rdx]
0x1459d54a0: movabs rax, 0xba2e8ba2e8ba2e0
0x1459d54aa: cmp r14, rax
0x1459d54ad: jbe 0x1459d54be
0x1459d54af: xor ebx, ebx
0x1459d54b1: mov rcx, rbx
0x1459d54b4: mov rdx, rdi
0x1459d54b7: call 0x145eb6fcb
0x1459d54bc: ud2
0x1459d54be: mov rsi, rcx
0x1459d54c1: shr r14, 4
0x1459d54c5: imul rdi, r14, 0xb0
0x1459d54cc: test rdi, rdi
0x1459d54cf: je 0x1459d54f5
0x1459d54d1: mov r15, rdx
0x1459d54d4: call 0x140002200
0x1459d54d9: mov ebx, 8
0x1459d54de: mov edx, 8
0x1459d54e3: mov rcx, rdi
0x1459d54e6: call 0x1400021c0
0x1459d54eb: test rax, rax
0x1459d54ee: je 0x1459d54b1
0x1459d54f0: mov rdx, r15
0x1459d54f3: jmp 0x1459d54fd
0x1459d54f5: mov eax, 8
0x1459d54fa: xor r14d, r14d
0x1459d54fd: mov qword ptr [rbp - 0x18], r14
0x1459d5501: mov qword ptr [rbp - 0x10], rax
0x1459d5505: lea rcx, [rbp - 8]
0x1459d5509: mov qword ptr [rbp - 8], 0
0x1459d5511: mov qword ptr [rbp - 0x20], rax
0x1459d5515: mov qword ptr [rbp - 0x30], rcx
0x1459d5519: mov qword ptr [rbp - 0x28], 0
0x1459d5521: lea rax, [rbp - 0x30]
0x1459d5525: mov rcx, rdx
0x1459d5528: mov rdx, rax
0x1459d552b: call 0x1459e5c10
0x1459d5530: nop
0x1459d5531: mov rax, qword ptr [rbp - 8]
0x1459d5535: mov qword ptr [rsi + 0x10], rax
0x1459d5539: movups xmm0, xmmword ptr [rbp - 0x18]
0x1459d553d: movups xmmword ptr [rsi], xmm0
0x1459d5540: mov rax, rsi
0x1459d5543: add rsp, 0x58
0x1459d5547: pop rbx
0x1459d5548: pop rdi
0x1459d5549: pop rsi
0x1459d554a: pop r14
0x1459d554c: pop r15
0x1459d554e: pop rbp
0x1459d554f: ret
