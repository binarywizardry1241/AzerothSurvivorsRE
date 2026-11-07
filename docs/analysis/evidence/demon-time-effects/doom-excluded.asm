0x1459db760: 4156 push r14
0x1459db762: 56 push rsi
0x1459db763: 57 push rdi
0x1459db764: 53 push rbx
0x1459db765: 4883ec28 sub rsp, 0x28
0x1459db769: 4c89c7 mov rdi, r8
0x1459db76c: 4889ce mov rsi, rcx
0x1459db76f: 4829d7 sub rdi, rdx
0x1459db772: 743c je 0x1459db7b0
0x1459db774: 4889d3 mov rbx, rdx
0x1459db777: 4989fe mov r14, rdi
0x1459db77a: 49c1ee03 shr r14, 3
0x1459db77e: e87d6a62fa call 0x140002200
0x1459db783: ba08000000 mov edx, 8
0x1459db788: 4c89f1 mov rcx, r14
0x1459db78b: e8306a62fa call 0x1400021c0
0x1459db790: 4885c0 test rax, rax
0x1459db793: 0f84b0000000 je 0x1459db849
0x1459db799: 48c1ef06 shr rdi, 6
0x1459db79d: 488d57ff lea rdx, [rdi - 1]
0x1459db7a1: 89f9 mov ecx, edi
0x1459db7a3: 83e103 and ecx, 3
0x1459db7a6: 4883fa03 cmp rdx, 3
0x1459db7aa: 730d jae 0x1459db7b9
0x1459db7ac: 31d2 xor edx, edx
0x1459db7ae: eb5a jmp 0x1459db80a
0x1459db7b0: 31ff xor edi, edi
0x1459db7b2: b808000000 mov eax, 8
0x1459db7b7: eb78 jmp 0x1459db831
0x1459db7b9: 4989f8 mov r8, rdi
0x1459db7bc: 4983e0fc and r8, 0xfffffffffffffffc
0x1459db7c0: 4c8d8bc0000000 lea r9, [rbx + 0xc0]
0x1459db7c7: 31d2 xor edx, edx
0x1459db7c9: 0f1f8000000000 nop dword ptr [rax]
0x1459db7d0: 4d8b9140ffffff mov r10, qword ptr [r9 - 0xc0]
0x1459db7d7: 4c8914d0 mov qword ptr [rax + rdx*8], r10
0x1459db7db: 4d8b5180 mov r10, qword ptr [r9 - 0x80]
0x1459db7df: 4c8954d008 mov qword ptr [rax + rdx*8 + 8], r10
0x1459db7e4: 4d8b51c0 mov r10, qword ptr [r9 - 0x40]
0x1459db7e8: 4c8954d010 mov qword ptr [rax + rdx*8 + 0x10], r10
0x1459db7ed: 4d8b11 mov r10, qword ptr [r9]
0x1459db7f0: 4c8954d018 mov qword ptr [rax + rdx*8 + 0x18], r10
0x1459db7f5: 4883c204 add rdx, 4
0x1459db7f9: 4981c100010000 add r9, 0x100
0x1459db800: 4939d0 cmp r8, rdx
0x1459db803: 75cb jne 0x1459db7d0
0x1459db805: 4885c9 test rcx, rcx
0x1459db808: 7427 je 0x1459db831
0x1459db80a: 4c8d04d0 lea r8, [rax + rdx*8]
0x1459db80e: 48c1e206 shl rdx, 6
0x1459db812: 4801d3 add rbx, rdx
0x1459db815: c1e103 shl ecx, 3
0x1459db818: 31d2 xor edx, edx
0x1459db81a: 660f1f440000 nop word ptr [rax + rax]
0x1459db820: 4c8b0cd3 mov r9, qword ptr [rbx + rdx*8]
0x1459db824: 4d890c10 mov qword ptr [r8 + rdx], r9
0x1459db828: 4883c208 add rdx, 8
0x1459db82c: 4839d1 cmp rcx, rdx
0x1459db82f: 75ef jne 0x1459db820
0x1459db831: 48893e mov qword ptr [rsi], rdi
0x1459db834: 48894608 mov qword ptr [rsi + 8], rax
0x1459db838: 48897e10 mov qword ptr [rsi + 0x10], rdi
0x1459db83c: 4889f0 mov rax, rsi
0x1459db83f: 4883c428 add rsp, 0x28
0x1459db843: 5b pop rbx
0x1459db844: 5f pop rdi
0x1459db845: 5e pop rsi
0x1459db846: 415e pop r14
0x1459db848: c3 ret
0x1459db849: b908000000 mov ecx, 8
0x1459db84e: 4c89f2 mov rdx, r14
0x1459db851: e895dc3c00 call 0x145da94eb
0x1459db856: 0f0b ud2
