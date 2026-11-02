1401b6c60: 4157 push r15
1401b6c62: 4156 push r14
1401b6c64: 4155 push r13
1401b6c66: 4154 push r12
1401b6c68: 56 push rsi
1401b6c69: 57 push rdi
1401b6c6a: 55 push rbp
1401b6c6b: 53 push rbx
1401b6c6c: 4883ec28 sub rsp, 0x28
1401b6c70: 4189d5 mov r13d, edx
1401b6c73: 488b31 mov rsi, qword ptr [rcx]
1401b6c76: 488b7908 mov rdi, qword ptr [rcx + 8]
1401b6c7a: 4c8bb6f8000000 mov r14, qword ptr [rsi + 0xf8]
1401b6c81: 488b8600010000 mov rax, qword ptr [rsi + 0x100]
1401b6c88: 4d8d3c86 lea r15, [r14 + rax*4]
1401b6c8c: 80be0801000000 cmp byte ptr [rsi + 0x108], 0
1401b6c93: 7409 je 0x1401b6c9e
1401b6c95: 4531e4 xor r12d, r12d
1401b6c98: 31db xor ebx, ebx
1401b6c9a: 31ed xor ebp, ebp
1401b6c9c: eb3d jmp 0x1401b6cdb
1401b6c9e: 44886c2427 mov byte ptr [rsp + 0x27], r13b
1401b6ca3: 4531e4 xor r12d, r12d
1401b6ca6: bd08000000 mov ebp, 8
1401b6cab: 4531ed xor r13d, r13d
1401b6cae: 31db xor ebx, ebx
1401b6cb0: e9be000000 jmp 0x1401b6d73
1401b6cb5: 31db xor ebx, ebx
1401b6cb7: 31ed xor ebp, ebp
1401b6cb9: 89e8 mov eax, ebp
1401b6cbb: ffc5 inc ebp
1401b6cbd: 4889c1 mov rcx, rax
1401b6cc0: 48c1e107 shl rcx, 7
1401b6cc4: 488d0cc1 lea rcx, [rcx + rax*8]
1401b6cc8: 4801d9 add rcx, rbx
1401b6ccb: 4489ea mov edx, r13d
1401b6cce: e80db73d04 call 0x1445923e0
1401b6cd3: 84c0 test al, al
1401b6cd5: 0f8531010000 jne 0x1401b6e0c
1401b6cdb: 4439e5 cmp ebp, r12d
1401b6cde: 75d9 jne 0x1401b6cb9
1401b6ce0: 4d39fe cmp r14, r15
1401b6ce3: 0f8410010000 je 0x1401b6df9
1401b6ce9: 418b0e mov ecx, dword ptr [r14]
1401b6cec: 4983c604 add r14, 4
1401b6cf0: 488b87a8010000 mov rax, qword ptr [rdi + 0x1a8]
1401b6cf7: 488d0cc9 lea rcx, [rcx + rcx*8]
1401b6cfb: 4c8b64c810 mov r12, qword ptr [rax + rcx*8 + 0x10]
1401b6d00: 4d85e4 test r12, r12
1401b6d03: 74db je 0x1401b6ce0
1401b6d05: 488d04c8 lea rax, [rax + rcx*8]
1401b6d09: 488b8e10010000 mov rcx, qword ptr [rsi + 0x110]
1401b6d10: 483b4840 cmp rcx, qword ptr [rax + 0x40]
1401b6d14: 739f jae 0x1401b6cb5
1401b6d16: 488b5038 mov rdx, qword ptr [rax + 0x38]
1401b6d1a: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
1401b6d1e: 4885c9 test rcx, rcx
1401b6d21: 7492 je 0x1401b6cb5
1401b6d23: 488b4018 mov rax, qword ptr [rax + 0x18]
1401b6d27: 48f7d1 not rcx
1401b6d2a: 488d0c49 lea rcx, [rcx + rcx*2]
1401b6d2e: 48c1e104 shl rcx, 4
1401b6d32: 488b5c0810 mov rbx, qword ptr [rax + rcx + 0x10]
1401b6d37: e97bffffff jmp 0x1401b6cb7
1401b6d3c: 4531ed xor r13d, r13d
1401b6d3f: 488b6850 mov rbp, qword ptr [rax + 0x50]
1401b6d43: 31db xor ebx, ebx
1401b6d45: 89d8 mov eax, ebx
1401b6d47: 48c1e004 shl rax, 4
1401b6d4b: ffc3 inc ebx
1401b6d4d: 8b440508 mov eax, dword ptr [rbp + rax + 8]
1401b6d51: f7d0 not eax
1401b6d53: 4889c1 mov rcx, rax
1401b6d56: 48c1e107 shl rcx, 7
1401b6d5a: 488d0cc1 lea rcx, [rcx + rax*8]
1401b6d5e: 4c01e9 add rcx, r13
1401b6d61: 0fb6542427 movzx edx, byte ptr [rsp + 0x27]
1401b6d66: e875b63d04 call 0x1445923e0
1401b6d6b: 84c0 test al, al
1401b6d6d: 0f8599000000 jne 0x1401b6e0c
1401b6d73: 4439e3 cmp ebx, r12d
1401b6d76: 75cd jne 0x1401b6d45
1401b6d78: 0f1f840000000000 nop dword ptr [rax + rax]
1401b6d80: 4d39fe cmp r14, r15
1401b6d83: 7474 je 0x1401b6df9
1401b6d85: 418b0e mov ecx, dword ptr [r14]
1401b6d88: 4983c604 add r14, 4
1401b6d8c: 488b8708010000 mov rax, qword ptr [rdi + 0x108]
1401b6d93: 488d0c89 lea rcx, [rcx + rcx*4]
1401b6d97: 48c1e105 shl rcx, 5
1401b6d9b: 4c8b640858 mov r12, qword ptr [rax + rcx + 0x58]
1401b6da0: 4d85e4 test r12, r12
1401b6da3: 74db je 0x1401b6d80
1401b6da5: 4801c8 add rax, rcx
1401b6da8: 8b8894000000 mov ecx, dword ptr [rax + 0x94]
1401b6dae: 488b97a8010000 mov rdx, qword ptr [rdi + 0x1a8]
1401b6db5: 4c8d04c9 lea r8, [rcx + rcx*8]
1401b6db9: 488b8e10010000 mov rcx, qword ptr [rsi + 0x110]
1401b6dc0: 4a3b4cc240 cmp rcx, qword ptr [rdx + r8*8 + 0x40]
1401b6dc5: 0f8371ffffff jae 0x1401b6d3c
1401b6dcb: 4a8d14c2 lea rdx, [rdx + r8*8]
1401b6dcf: 4c8b4238 mov r8, qword ptr [rdx + 0x38]
1401b6dd3: 498b0cc8 mov rcx, qword ptr [r8 + rcx*8]
1401b6dd7: 4885c9 test rcx, rcx
1401b6dda: 0f845cffffff je 0x1401b6d3c
1401b6de0: 488b5218 mov rdx, qword ptr [rdx + 0x18]
1401b6de4: 48f7d1 not rcx
1401b6de7: 488d0c49 lea rcx, [rcx + rcx*2]
1401b6deb: 48c1e104 shl rcx, 4
1401b6def: 4c8b6c0a10 mov r13, qword ptr [rdx + rcx + 0x10]
1401b6df4: e946ffffff jmp 0x1401b6d3f
1401b6df9: 31c0 xor eax, eax
1401b6dfb: 4883c428 add rsp, 0x28
1401b6dff: 5b pop rbx
1401b6e00: 5d pop rbp
1401b6e01: 5f pop rdi
1401b6e02: 5e pop rsi
1401b6e03: 415c pop r12
1401b6e05: 415d pop r13
1401b6e07: 415e pop r14
1401b6e09: 415f pop r15
1401b6e0b: c3 ret
1401b6e0c: b001 mov al, 1
1401b6e0e: ebeb jmp 0x1401b6dfb
