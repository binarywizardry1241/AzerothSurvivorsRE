0x1402ec110: push r15
0x1402ec112: push r14
0x1402ec114: push r13
0x1402ec116: push r12
0x1402ec118: push rsi
0x1402ec119: push rdi
0x1402ec11a: push rbp
0x1402ec11b: push rbx
0x1402ec11c: sub rsp, 0x78
0x1402ec120: mov ebp, 1
0x1402ec125: lock xadd dword ptr [r8 + 0x5b0], ebp
0x1402ec12e: cmp qword ptr [rdx + 0x108], -1
0x1402ec136: je 0x1402ec213
0x1402ec13c: mov rbx, r8
0x1402ec13f: mov rsi, rdx
0x1402ec142: mov rax, qword ptr [r8 + 0x5a0]
0x1402ec149: mov qword ptr [rsp + 0x38], rax
0x1402ec14e: cmp qword ptr [rdx + 8], rax
0x1402ec152: jne 0x1402ec22d
0x1402ec158: mov qword ptr [rsp + 0x70], rcx
0x1402ec15d: mov rax, qword ptr [rsi + 0x10]
0x1402ec161: cmp rax, qword ptr [rbx + 0x218]
0x1402ec168: jae 0x1402ec25e
0x1402ec16e: mov rcx, qword ptr [rbx + 0x210]
0x1402ec175: mov rax, qword ptr [rcx + rax*8]
0x1402ec179: test rax, rax
0x1402ec17c: je 0x1402ec25e
0x1402ec182: mov r15, qword ptr [rbx + 0x1e0]
0x1402ec189: not rax
0x1402ec18c: imul rax, rax, 0x38
0x1402ec190: cmp byte ptr [r15 + rax + 0x30], 0
0x1402ec196: je 0x1402ec25e
0x1402ec19c: add r15, rax
0x1402ec19f: lea r14, [rsi + 0x18]
0x1402ec1a3: mov r12, qword ptr [r15 + 0x10]
0x1402ec1a7: lea r13, [r15 + 0x28]
0x1402ec1ab: add r15, 0x2c
0x1402ec1af: mov edi, dword ptr [rsi]
0x1402ec1b1: mov rcx, r14
0x1402ec1b4: mov rdx, rbx
0x1402ec1b7: call 0x1404790a0
0x1402ec1bc: mov qword ptr [rsp + 0x38], r12
0x1402ec1c1: mov qword ptr [rsp + 0x40], r13
0x1402ec1c6: mov qword ptr [rsp + 0x48], r15
0x1402ec1cb: mov dword ptr [rsp + 0x50], edi
0x1402ec1cf: mov dword ptr [rsp + 0x54], ebp
0x1402ec1d3: lea r8, [rsp + 0x58]
0x1402ec1d8: mov qword ptr [rsp + 0x58], r14
0x1402ec1dd: mov qword ptr [rsp + 0x60], rbx
0x1402ec1e2: mov dword ptr [rsp + 0x68], edi
0x1402ec1e6: mov dword ptr [rsp + 0x6c], ebp
0x1402ec1ea: lea rdx, [rsp + 0x38]
0x1402ec1ef: call 0x1402de390
0x1402ec1f4: mov dword ptr [rsi], ebp
0x1402ec1f6: mov rax, qword ptr [rsp + 0x70]
0x1402ec1fb: mov qword ptr [rax], 0xfffffffffffffffd
0x1402ec202: add rsp, 0x78
0x1402ec206: pop rbx
0x1402ec207: pop rbp
0x1402ec208: pop rdi
0x1402ec209: pop rsi
0x1402ec20a: pop r12
0x1402ec20c: pop r13
0x1402ec20e: pop r14
0x1402ec210: pop r15
0x1402ec212: ret 
0x1402ec213: lea rcx, [rip + 0x5f8e1a6]
0x1402ec21a: lea r8, [rip + 0x5f8e1ff]
0x1402ec221: mov edx, 0x59
0x1402ec226: call 0x146208c20
0x1402ec22b: ud2 
0x1402ec22d: add rsi, 8
0x1402ec231: lea rax, [rip + 0x5f8e270]
0x1402ec238: mov qword ptr [rsp + 0x28], rax
0x1402ec23d: mov qword ptr [rsp + 0x20], 0xdf
0x1402ec246: lea r9, [rip + 0x5f8e1eb]
0x1402ec24d: lea r8, [rsp + 0x38]
0x1402ec252: xor ecx, ecx
0x1402ec254: mov rdx, rsi
0x1402ec257: call 0x1461b2ddd
0x1402ec25c: ud2 
0x1402ec25e: add rsi, 4
0x1402ec262: mov qword ptr [rsp + 0x38], rsi
0x1402ec267: lea rax, [rip + 0x4f350a2]
0x1402ec26e: mov qword ptr [rsp + 0x40], rax
0x1402ec273: lea rcx, [rsp + 0x37]
0x1402ec278: mov qword ptr [rsp + 0x48], rcx
0x1402ec27d: mov qword ptr [rsp + 0x50], rax
0x1402ec282: lea rcx, [rip + 0x5f8de7f]
0x1402ec289: lea r8, [rip + 0x5f8df18]
0x1402ec290: lea rdx, [rsp + 0x38]
0x1402ec295: call 0x146208ee0
0x1402ec29a: ud2 
