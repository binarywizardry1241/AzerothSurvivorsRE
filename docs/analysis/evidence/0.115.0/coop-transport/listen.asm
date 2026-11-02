0x1458ad650: push rbp
0x1458ad651: push rsi
0x1458ad652: push rdi
0x1458ad653: sub rsp, 0x50
0x1458ad657: lea rbp, [rsp + 0x50]
0x1458ad65c: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1458ad664: mov rax, qword ptr [rip + 0x29673d5]
0x1458ad66b: movzx eax, byte ptr [rax]
0x1458ad66e: test al, al
0x1458ad670: je 0x1458ad6d7
0x1458ad672: lea rax, [rip + 0x1782edb]
0x1458ad679: mov qword ptr [rbp - 0x28], rax
0x1458ad67d: mov qword ptr [rbp - 0x20], 7
0x1458ad685: mov word ptr [rbp - 0x18], cx
0x1458ad689: lea rcx, [rbp - 0x28]
0x1458ad68d: call 0x14589b780
0x1458ad692: mov esi, 1
0x1458ad697: test al, 1
0x1458ad699: jne 0x1458ad6cc
0x1458ad69b: mov qword ptr [rbp - 0x10], rdx
0x1458ad69f: mov qword ptr [rbp - 0x28], rdx
0x1458ad6a3: lea rcx, [rbp - 0x28]
0x1458ad6a7: mov dl, 1
0x1458ad6a9: call 0x145cbe6f0
0x1458ad6ae: nop
0x1458ad6af: mov rdi, rax
0x1458ad6b2: test rax, rax
0x1458ad6b5: je 0x1458ad6c6
0x1458ad6b7: mov rcx, qword ptr [rbp - 0x10]
0x1458ad6bb: call qword ptr [rip + 0x60b71f]
0x1458ad6c1: mov rdx, rdi
0x1458ad6c4: jmp 0x1458ad6cc
0x1458ad6c6: xor esi, esi
0x1458ad6c8: mov rdx, qword ptr [rbp - 0x10]
0x1458ad6cc: mov rax, rsi
0x1458ad6cf: add rsp, 0x50
0x1458ad6d3: pop rdi
0x1458ad6d4: pop rsi
0x1458ad6d5: pop rbp
0x1458ad6d6: ret
0x1458ad6d7: mov esi, ecx
0x1458ad6d9: call 0x145eb65d0
0x1458ad6de: mov ecx, esi
0x1458ad6e0: jmp 0x1458ad672
