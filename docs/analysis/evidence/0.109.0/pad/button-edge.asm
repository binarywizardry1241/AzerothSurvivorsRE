1401ba960: 4157 push r15
1401ba962: 4156 push r14
1401ba964: 4155 push r13
1401ba966: 4154 push r12
1401ba968: 56 push rsi
1401ba969: 57 push rdi
1401ba96a: 55 push rbp
1401ba96b: 53 push rbx
1401ba96c: 4883ec28 sub rsp, 0x28
1401ba970: 4189d5 mov r13d, edx
1401ba973: 488b31 mov rsi, qword ptr [rcx]
1401ba976: 488b7908 mov rdi, qword ptr [rcx + 8]
1401ba97a: 4c8bb6f8000000 mov r14, qword ptr [rsi + 0xf8]
1401ba981: 488b8600010000 mov rax, qword ptr [rsi + 0x100]
1401ba988: 4d8d3c86 lea r15, [r14 + rax*4]
1401ba98c: 80be0801000000 cmp byte ptr [rsi + 0x108], 0
1401ba993: 7409 je 0x1401ba99e
1401ba995: 4531e4 xor r12d, r12d
1401ba998: 31db xor ebx, ebx
1401ba99a: 31ed xor ebp, ebp
1401ba99c: eb3d jmp 0x1401ba9db
1401ba99e: 44886c2427 mov byte ptr [rsp + 0x27], r13b
1401ba9a3: 4531e4 xor r12d, r12d
1401ba9a6: bd08000000 mov ebp, 8
1401ba9ab: 4531ed xor r13d, r13d
1401ba9ae: 31db xor ebx, ebx
1401ba9b0: e9be000000 jmp 0x1401baa73
1401ba9b5: 31db xor ebx, ebx
1401ba9b7: 31ed xor ebp, ebp
1401ba9b9: 89e8 mov eax, ebp
1401ba9bb: ffc5 inc ebp
1401ba9bd: 4889c1 mov rcx, rax
1401ba9c0: 48c1e107 shl rcx, 7
1401ba9c4: 488d0cc1 lea rcx, [rcx + rax*8]
1401ba9c8: 4801d9 add rcx, rbx
1401ba9cb: 4489ea mov edx, r13d
1401ba9ce: e85dc23c04 call 0x144586c30
1401ba9d3: 84c0 test al, al
1401ba9d5: 0f8531010000 jne 0x1401bab0c
1401ba9db: 4439e5 cmp ebp, r12d
1401ba9de: 75d9 jne 0x1401ba9b9
1401ba9e0: 4d39fe cmp r14, r15
1401ba9e3: 0f8410010000 je 0x1401baaf9
1401ba9e9: 418b0e mov ecx, dword ptr [r14]
1401ba9ec: 4983c604 add r14, 4
1401ba9f0: 488b87a8010000 mov rax, qword ptr [rdi + 0x1a8]
1401ba9f7: 488d0cc9 lea rcx, [rcx + rcx*8]
1401ba9fb: 4c8b64c810 mov r12, qword ptr [rax + rcx*8 + 0x10]
1401baa00: 4d85e4 test r12, r12
1401baa03: 74db je 0x1401ba9e0
1401baa05: 488d04c8 lea rax, [rax + rcx*8]
1401baa09: 488b8e10010000 mov rcx, qword ptr [rsi + 0x110]
1401baa10: 483b4840 cmp rcx, qword ptr [rax + 0x40]
1401baa14: 739f jae 0x1401ba9b5
1401baa16: 488b5038 mov rdx, qword ptr [rax + 0x38]
1401baa1a: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
1401baa1e: 4885c9 test rcx, rcx
1401baa21: 7492 je 0x1401ba9b5
1401baa23: 488b4018 mov rax, qword ptr [rax + 0x18]
1401baa27: 48f7d1 not rcx
1401baa2a: 488d0c49 lea rcx, [rcx + rcx*2]
1401baa2e: 48c1e104 shl rcx, 4
1401baa32: 488b5c0810 mov rbx, qword ptr [rax + rcx + 0x10]
1401baa37: e97bffffff jmp 0x1401ba9b7
1401baa3c: 4531ed xor r13d, r13d
1401baa3f: 488b6850 mov rbp, qword ptr [rax + 0x50]
1401baa43: 31db xor ebx, ebx
1401baa45: 89d8 mov eax, ebx
1401baa47: 48c1e004 shl rax, 4
1401baa4b: ffc3 inc ebx
1401baa4d: 8b440508 mov eax, dword ptr [rbp + rax + 8]
1401baa51: f7d0 not eax
1401baa53: 4889c1 mov rcx, rax
1401baa56: 48c1e107 shl rcx, 7
1401baa5a: 488d0cc1 lea rcx, [rcx + rax*8]
1401baa5e: 4c01e9 add rcx, r13
1401baa61: 0fb6542427 movzx edx, byte ptr [rsp + 0x27]
1401baa66: e8c5c13c04 call 0x144586c30
1401baa6b: 84c0 test al, al
1401baa6d: 0f8599000000 jne 0x1401bab0c
1401baa73: 4439e3 cmp ebx, r12d
1401baa76: 75cd jne 0x1401baa45
1401baa78: 0f1f840000000000 nop dword ptr [rax + rax]
1401baa80: 4d39fe cmp r14, r15
1401baa83: 7474 je 0x1401baaf9
1401baa85: 418b0e mov ecx, dword ptr [r14]
1401baa88: 4983c604 add r14, 4
1401baa8c: 488b8708010000 mov rax, qword ptr [rdi + 0x108]
1401baa93: 488d0c89 lea rcx, [rcx + rcx*4]
1401baa97: 48c1e105 shl rcx, 5
1401baa9b: 4c8b640858 mov r12, qword ptr [rax + rcx + 0x58]
1401baaa0: 4d85e4 test r12, r12
1401baaa3: 74db je 0x1401baa80
1401baaa5: 4801c8 add rax, rcx
1401baaa8: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1401baaae: 488b97a8010000 mov rdx, qword ptr [rdi + 0x1a8]
1401baab5: 4c8d04c9 lea r8, [rcx + rcx*8]
1401baab9: 488b8e10010000 mov rcx, qword ptr [rsi + 0x110]
1401baac0: 4a3b4cc240 cmp rcx, qword ptr [rdx + r8*8 + 0x40]
1401baac5: 0f8371ffffff jae 0x1401baa3c
1401baacb: 4a8d14c2 lea rdx, [rdx + r8*8]
1401baacf: 4c8b4238 mov r8, qword ptr [rdx + 0x38]
1401baad3: 498b0cc8 mov rcx, qword ptr [r8 + rcx*8]
1401baad7: 4885c9 test rcx, rcx
1401baada: 0f845cffffff je 0x1401baa3c
1401baae0: 488b5218 mov rdx, qword ptr [rdx + 0x18]
1401baae4: 48f7d1 not rcx
1401baae7: 488d0c49 lea rcx, [rcx + rcx*2]
1401baaeb: 48c1e104 shl rcx, 4
1401baaef: 4c8b6c0a10 mov r13, qword ptr [rdx + rcx + 0x10]
1401baaf4: e946ffffff jmp 0x1401baa3f
1401baaf9: 31c0 xor eax, eax
1401baafb: 4883c428 add rsp, 0x28
1401baaff: 5b pop rbx
1401bab00: 5d pop rbp
1401bab01: 5f pop rdi
1401bab02: 5e pop rsi
1401bab03: 415c pop r12
1401bab05: 415d pop r13
1401bab07: 415e pop r14
1401bab09: 415f pop r15
1401bab0b: c3 ret
1401bab0c: b001 mov al, 1
1401bab0e: ebeb jmp 0x1401baafb
