0x14581df40: push rbp
0x14581df41: push rsi
0x14581df42: push rdi
0x14581df43: sub rsp, 0x40
0x14581df47: lea rbp, [rsp + 0x40]
0x14581df4c: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14581df54: mov rdi, qword ptr [rcx]
0x14581df57: mov cl, 1
0x14581df59: xor eax, eax
0x14581df5b: lock cmpxchg byte ptr [rdi + 0x10], cl
0x14581df60: jne 0x14581dfae
0x14581df62: mov rsi, qword ptr [rip + 0x29f6acf]
0x14581df69: mov rax, qword ptr [rsi]
0x14581df6c: shl rax, 1
0x14581df6f: test rax, rax
0x14581df72: jne 0x14581dfb9
0x14581df74: xor ecx, ecx
0x14581df76: movzx eax, byte ptr [rdi + 0x11]
0x14581df7a: cmp dword ptr [rdi + 0xa0], -1
0x14581df81: je 0x14581dfd0
0x14581df83: mov dword ptr [rbp - 0xc], ecx
0x14581df86: mov rcx, qword ptr [rdi + 0x88]
0x14581df8d: mov qword ptr [rbp - 0x18], rdi
0x14581df91: mov rax, qword ptr [rdi + 0x90]
0x14581df98: call qword ptr [rax + 0x28]
0x14581df9b: nop
0x14581df9c: cmp al, 2
0x14581df9e: sete al
0x14581dfa1: mov rdi, qword ptr [rbp - 0x18]
0x14581dfa5: mov ecx, dword ptr [rbp - 0xc]
0x14581dfa8: test cl, cl
0x14581dfaa: je 0x14581dfd6
0x14581dfac: jmp 0x14581dfe1
0x14581dfae: lea rcx, [rdi + 0x10]
0x14581dfb2: call 0x145eb5670
0x14581dfb7: jmp 0x14581df62
0x14581dfb9: call 0x145eb6400
0x14581dfbe: mov ecx, eax
0x14581dfc0: xor cl, 1
0x14581dfc3: movzx eax, byte ptr [rdi + 0x11]
0x14581dfc7: cmp dword ptr [rdi + 0xa0], -1
0x14581dfce: jne 0x14581df83
0x14581dfd0: xor eax, eax
0x14581dfd2: test cl, cl
0x14581dfd4: jne 0x14581dfe1
0x14581dfd6: mov rcx, qword ptr [rsi]
0x14581dfd9: shl rcx, 1
0x14581dfdc: test rcx, rcx
0x14581dfdf: jne 0x14581e005
0x14581dfe1: xor ecx, ecx
0x14581dfe3: xchg byte ptr [rdi + 0x10], cl
0x14581dfe6: cmp cl, 2
0x14581dfe9: je 0x14581dff3
0x14581dfeb: add rsp, 0x40
0x14581dfef: pop rdi
0x14581dff0: pop rsi
0x14581dff1: pop rbp
0x14581dff2: ret
0x14581dff3: add rdi, 0x10
0x14581dff7: mov rcx, rdi
0x14581dffa: mov esi, eax
0x14581dffc: call 0x145eb5730
0x14581e001: mov eax, esi
0x14581e003: jmp 0x14581dfeb
0x14581e005: mov esi, eax
0x14581e007: call 0x145eb6400
0x14581e00c: mov ecx, eax
0x14581e00e: mov eax, esi
0x14581e010: test cl, cl
0x14581e012: jne 0x14581dfe1
0x14581e014: mov byte ptr [rdi + 0x11], 1
0x14581e018: jmp 0x14581dfe1
