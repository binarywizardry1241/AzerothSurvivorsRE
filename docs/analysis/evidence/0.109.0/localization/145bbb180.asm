; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x145bbb180..0x145bbb428 SHA256 05a587b5840465d01cbaccae65135192c9334da19c8f71e61f5b4a119657280e
0x145bbb180: push rbp
0x145bbb181: push r15
0x145bbb183: push r14
0x145bbb185: push r13
0x145bbb187: push r12
0x145bbb189: push rsi
0x145bbb18a: push rdi
0x145bbb18b: push rbx
0x145bbb18c: sub rsp, 0x488
0x145bbb193: lea rbp, [rsp + 0x80]
0x145bbb19b: mov qword ptr [rbp + 0x400], 0xfffffffffffffffe
0x145bbb1a6: mov qword ptr [rbp + 0x3e0], rcx
0x145bbb1ad: mov qword ptr [rbp + 0x3e8], 0
0x145bbb1b8: mov qword ptr [rbp + 0x3f0], 2
0x145bbb1c3: mov qword ptr [rbp + 0x3f8], 0
0x145bbb1ce: mov r8d, 0x200
0x145bbb1d4: mov eax, 2
0x145bbb1d9: mov qword ptr [rbp + 0x3d0], rax
0x145bbb1e0: mov qword ptr [rbp + 0x3d8], 0
0x145bbb1eb: mov r13, qword ptr [rip + 0x1df63e]
0x145bbb1f2: mov rdi, qword ptr [rip + 0x1df6cf]
0x145bbb1f9: mov r14d, 0xffffffff
0x145bbb1ff: xor esi, esi
0x145bbb201: xor ebx, ebx
0x145bbb203: cmp r8, 0x201
0x145bbb20a: jae 0x145bbb240
0x145bbb20c: jmp 0x145bbb21f
0x145bbb20e: nop
0x145bbb210: jae 0x145bbb32f
0x145bbb216: cmp r8, 0x201
0x145bbb21d: jae 0x145bbb240
0x145bbb21f: mov eax, 0x200
0x145bbb224: mov qword ptr [rbp + 0x3c8], rax
0x145bbb22b: lea r15, [rbp - 0x58]
0x145bbb22f: mov r12, r8
0x145bbb232: jmp 0x145bbb27a
0x145bbb234: nop word ptr cs:[rax + rax]
0x145bbb240: sub r8, rbx
0x145bbb243: sub rsi, rbx
0x145bbb246: cmp r8, rsi
0x145bbb249: ja 0x145bbb2ef
0x145bbb24f: mov rsi, qword ptr [rbp + 0x3d8]
0x145bbb256: cmp rsi, r14
0x145bbb259: mov ebx, 0xffffffff
0x145bbb25e: cmovb rbx, rsi
0x145bbb262: mov qword ptr [rbp + 0x3f8], rbx
0x145bbb269: mov qword ptr [rbp + 0x3c8], rbx
0x145bbb270: mov r15, qword ptr [rbp + 0x3d0]
0x145bbb277: mov r12, rbx
0x145bbb27a: xor ecx, ecx
0x145bbb27c: call r13
0x145bbb27f: xor ecx, ecx
0x145bbb281: mov rdx, r15
0x145bbb284: mov r8d, r12d
0x145bbb287: call rdi
0x145bbb289: test eax, eax
0x145bbb28b: jne 0x145bbb2b5
0x145bbb28d: mov r14, rdi
0x145bbb290: mov rdi, r13
0x145bbb293: mov r13d, eax
0x145bbb296: call qword ptr [rip + 0x1df654]
0x145bbb29c: mov ecx, eax
0x145bbb29e: mov eax, r13d
0x145bbb2a1: mov r13, rdi
0x145bbb2a4: mov rdi, r14
0x145bbb2a7: mov r14d, 0xffffffff
0x145bbb2ad: test ecx, ecx
0x145bbb2af: jne 0x145bbb3a1
0x145bbb2b5: mov r8d, eax
0x145bbb2b8: cmp r12, r8
0x145bbb2bb: jne 0x145bbb210
0x145bbb2c1: call qword ptr [rip + 0x1df629]
0x145bbb2c7: cmp eax, 0x7a
0x145bbb2ca: jne 0x145bbb40d
0x145bbb2d0: add r12, r12
0x145bbb2d3: cmp r12, r14
0x145bbb2d6: cmovae r12, r14
0x145bbb2da: mov r8, r12
0x145bbb2dd: cmp r8, 0x201
0x145bbb2e4: jb 0x145bbb21f
0x145bbb2ea: jmp 0x145bbb240
0x145bbb2ef: mov qword ptr [rsp + 0x20], 2
0x145bbb2f8: mov r9d, 2
0x145bbb2fe: lea rcx, [rbp + 0x3e8]
0x145bbb305: mov rdx, rbx
0x145bbb308: call 0x145d973f0
0x145bbb30d: nop
0x145bbb30e: mov rax, qword ptr [rbp + 0x3e8]
0x145bbb315: mov qword ptr [rbp + 0x3d8], rax
0x145bbb31c: mov rax, qword ptr [rbp + 0x3f0]
0x145bbb323: mov qword ptr [rbp + 0x3d0], rax
0x145bbb32a: jmp 0x145bbb24f
0x145bbb32f: mov rax, qword ptr [rbp + 0x3c8]
0x145bbb336: cmp rax, r8
0x145bbb339: jb 0x145bbb3e7
0x145bbb33f: lea rcx, [rbp + 0x3a8]
0x145bbb346: mov rdx, r15
0x145bbb349: call 0x145bcacd0
0x145bbb34e: nop
0x145bbb34f: movups xmm0, xmmword ptr [rbp + 0x3a8]
0x145bbb356: movups xmm1, xmmword ptr [rbp + 0x3b8]
0x145bbb35d: mov rax, qword ptr [rbp + 0x3e0]
0x145bbb364: movups xmmword ptr [rax + 0x10], xmm1
0x145bbb368: movups xmmword ptr [rax], xmm0
0x145bbb36b: mov rdx, qword ptr [rbp + 0x3e8]
0x145bbb372: test rdx, rdx
0x145bbb375: je 0x145bbb38d
0x145bbb377: mov rcx, qword ptr [rbp + 0x3f0]
0x145bbb37e: add rdx, rdx
0x145bbb381: mov r8d, 2
0x145bbb387: call 0x1400021d0
0x145bbb38c: nop
0x145bbb38d: add rsp, 0x488
0x145bbb394: pop rbx
0x145bbb395: pop rdi
0x145bbb396: pop rsi
0x145bbb397: pop r12
0x145bbb399: pop r13
0x145bbb39b: pop r14
0x145bbb39d: pop r15
0x145bbb39f: pop rbp
0x145bbb3a0: ret
0x145bbb3a1: call qword ptr [rip + 0x1df549]
0x145bbb3a7: mov edi, eax
0x145bbb3a9: mov rax, qword ptr [rip + 0x24cf6d8]
0x145bbb3b0: mov rax, qword ptr [rax]
0x145bbb3b3: lea rcx, [rip + 0x16ab0f6]
0x145bbb3ba: cmp rax, rcx
0x145bbb3bd: jne 0x145bbb3fe
0x145bbb3bf: shl rdi, 0x20
0x145bbb3c3: or rdi, 2
0x145bbb3c7: mov rax, qword ptr [rbp + 0x3e0]
0x145bbb3ce: mov qword ptr [rax + 8], rdi
0x145bbb3d2: mov qword ptr [rax], 0xffffffffffffffff
0x145bbb3d9: mov rdx, qword ptr [rbp + 0x3e8]
0x145bbb3e0: test rdx, rdx
0x145bbb3e3: jne 0x145bbb377
0x145bbb3e5: jmp 0x145bbb38d
0x145bbb3e7: lea r9, [rip + 0x16ab8da]
0x145bbb3ee: xor ecx, ecx
0x145bbb3f0: mov rdx, r8
0x145bbb3f3: mov r8, rax
0x145bbb3f6: call 0x145d99860
0x145bbb3fb: nop
0x145bbb3fc: jmp 0x145bbb426
0x145bbb3fe: lea rcx, [rip + 0x16ab0ab]
0x145bbb405: call 0x145d99a70
0x145bbb40a: nop
0x145bbb40b: jmp 0x145bbb3bf
0x145bbb40d: lea rcx, [rip + 0x16ab7fc]
0x145bbb414: lea r8, [rip + 0x16ab8c5]
0x145bbb41b: mov edx, 0x28
0x145bbb420: call 0x145d99810
0x145bbb425: nop
0x145bbb426: ud2
