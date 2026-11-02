0x14581e820: push rbp
0x14581e821: push rsi
0x14581e822: push rdi
0x14581e823: push rbx
0x14581e824: sub rsp, 0x68
0x14581e828: lea rbp, [rsp + 0x60]
0x14581e82d: mov qword ptr [rbp], 0xfffffffffffffffe
0x14581e835: mov rbx, qword ptr [rcx]
0x14581e838: mov cl, 1
0x14581e83a: xor eax, eax
0x14581e83c: lock cmpxchg byte ptr [rbx + 0x10], cl
0x14581e841: jne 0x14581e933
0x14581e847: mov rdi, qword ptr [rip + 0x29f61ea]
0x14581e84e: mov rax, qword ptr [rdi]
0x14581e851: shl rax, 1
0x14581e854: test rax, rax
0x14581e857: jne 0x14581e941
0x14581e85d: mov dword ptr [rbp - 4], 0
0x14581e864: movzx eax, byte ptr [rbx + 0x11]
0x14581e868: mov rsi, qword ptr [rbx + 0xa8]
0x14581e86f: mov qword ptr [rbp - 0x20], rbx
0x14581e873: mov rbx, qword ptr [rbx + 0xb0]
0x14581e87a: lea rdx, [rip + 0x14ac2d7]
0x14581e881: lea rcx, [rbp - 0x38]
0x14581e885: call 0x145b7a740
0x14581e88a: nop
0x14581e88b: lea rdx, [rbp - 0x38]
0x14581e88f: mov rcx, rsi
0x14581e892: call qword ptr [rbx + 0x18]
0x14581e895: nop
0x14581e896: mov rax, qword ptr [rbp - 0x20]
0x14581e89a: mov rcx, qword ptr [rax + 0xa8]
0x14581e8a1: mov rax, qword ptr [rax + 0xb0]
0x14581e8a8: call qword ptr [rax + 0x30]
0x14581e8ab: nop
0x14581e8ac: mov rsi, qword ptr [rbp - 0x20]
0x14581e8b0: mov rcx, qword ptr [rsi + 0x88]
0x14581e8b7: mov rdx, qword ptr [rsi + 0x90]
0x14581e8be: mov eax, dword ptr [rsi + 0xa0]
0x14581e8c4: mov dword ptr [rsi + 0xa0], 0xffffffff
0x14581e8ce: cmp eax, -1
0x14581e8d1: je 0x14581e910
0x14581e8d3: mov qword ptr [rbp - 0x18], rcx
0x14581e8d7: mov qword ptr [rbp - 0x10], rdx
0x14581e8db: call qword ptr [rdx + 0x30]
0x14581e8de: nop
0x14581e8df: mov rax, qword ptr [rbp - 0x10]
0x14581e8e3: mov rax, qword ptr [rax]
0x14581e8e6: test rax, rax
0x14581e8e9: je 0x14581e8f2
0x14581e8eb: mov rcx, qword ptr [rbp - 0x18]
0x14581e8ef: call rax
0x14581e8f1: nop
0x14581e8f2: mov rax, qword ptr [rbp - 0x10]
0x14581e8f6: mov rdx, qword ptr [rax + 8]
0x14581e8fa: test rdx, rdx
0x14581e8fd: mov rsi, qword ptr [rbp - 0x20]
0x14581e901: mov rcx, qword ptr [rbp - 0x18]
0x14581e905: je 0x14581e910
0x14581e907: mov r8, qword ptr [rax + 0x10]
0x14581e90b: call 0x1400021d0
0x14581e910: cmp byte ptr [rbp - 4], 0
0x14581e914: jne 0x14581e921
0x14581e916: mov rax, qword ptr [rdi]
0x14581e919: shl rax, 1
0x14581e91c: test rax, rax
0x14581e91f: jne 0x14581e95e
0x14581e921: xor eax, eax
0x14581e923: xchg byte ptr [rsi + 0x10], al
0x14581e926: cmp al, 2
0x14581e928: je 0x14581e950
0x14581e92a: add rsp, 0x68
0x14581e92e: pop rbx
0x14581e92f: pop rdi
0x14581e930: pop rsi
0x14581e931: pop rbp
0x14581e932: ret
0x14581e933: lea rcx, [rbx + 0x10]
0x14581e937: call 0x145eb5670
0x14581e93c: jmp 0x14581e847
0x14581e941: call 0x145eb6400
0x14581e946: xor al, 1
0x14581e948: mov dword ptr [rbp - 4], eax
0x14581e94b: jmp 0x14581e864
0x14581e950: add rsi, 0x10
0x14581e954: mov rcx, rsi
0x14581e957: call 0x145eb5730
0x14581e95c: jmp 0x14581e92a
0x14581e95e: call 0x145eb6400
0x14581e963: test al, al
0x14581e965: jne 0x14581e921
0x14581e967: mov byte ptr [rsi + 0x11], 1
0x14581e96b: jmp 0x14581e921
