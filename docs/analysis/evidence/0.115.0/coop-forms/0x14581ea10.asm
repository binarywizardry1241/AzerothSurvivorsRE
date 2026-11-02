0x14581ea10: push rbp
0x14581ea11: push rsi
0x14581ea12: push rdi
0x14581ea13: push rbx
0x14581ea14: sub rsp, 0x38
0x14581ea18: lea rbp, [rsp + 0x30]
0x14581ea1d: mov qword ptr [rbp], 0xfffffffffffffffe
0x14581ea25: mov rdi, qword ptr [rcx]
0x14581ea28: mov cl, 1
0x14581ea2a: xor eax, eax
0x14581ea2c: lock cmpxchg byte ptr [rdi + 0x10], cl
0x14581ea31: jne 0x14581ea8e
0x14581ea33: mov rsi, qword ptr [rip + 0x29f5ffe]
0x14581ea3a: mov rax, qword ptr [rsi]
0x14581ea3d: shl rax, 1
0x14581ea40: test rax, rax
0x14581ea43: jne 0x14581ea99
0x14581ea45: mov dword ptr [rbp - 4], 0
0x14581ea4c: movzx eax, byte ptr [rdi + 0x11]
0x14581ea50: mov rcx, qword ptr [rdi + 0xa8]
0x14581ea57: mov qword ptr [rbp - 0x10], rdi
0x14581ea5b: mov rax, qword ptr [rdi + 0xb0]
0x14581ea62: call qword ptr [rax + 0x28]
0x14581ea65: nop
0x14581ea66: cmp byte ptr [rbp - 4], 0
0x14581ea6a: mov rdi, qword ptr [rbp - 0x10]
0x14581ea6e: jne 0x14581ea7b
0x14581ea70: mov rcx, qword ptr [rsi]
0x14581ea73: shl rcx, 1
0x14581ea76: test rcx, rcx
0x14581ea79: jne 0x14581eab7
0x14581ea7b: xor ecx, ecx
0x14581ea7d: xchg byte ptr [rdi + 0x10], cl
0x14581ea80: cmp cl, 2
0x14581ea83: je 0x14581eaa5
0x14581ea85: add rsp, 0x38
0x14581ea89: pop rbx
0x14581ea8a: pop rdi
0x14581ea8b: pop rsi
0x14581ea8c: pop rbp
0x14581ea8d: ret
0x14581ea8e: lea rcx, [rdi + 0x10]
0x14581ea92: call 0x145eb5670
0x14581ea97: jmp 0x14581ea33
0x14581ea99: call 0x145eb6400
0x14581ea9e: xor al, 1
0x14581eaa0: mov dword ptr [rbp - 4], eax
0x14581eaa3: jmp 0x14581ea4c
0x14581eaa5: add rdi, 0x10
0x14581eaa9: mov rcx, rdi
0x14581eaac: mov ebx, eax
0x14581eaae: call 0x145eb5730
0x14581eab3: mov eax, ebx
0x14581eab5: jmp 0x14581ea85
0x14581eab7: mov ebx, eax
0x14581eab9: call 0x145eb6400
0x14581eabe: mov ecx, eax
0x14581eac0: mov eax, ebx
0x14581eac2: test cl, cl
0x14581eac4: jne 0x14581ea7b
0x14581eac6: mov byte ptr [rdi + 0x11], 1
0x14581eaca: jmp 0x14581ea7b
