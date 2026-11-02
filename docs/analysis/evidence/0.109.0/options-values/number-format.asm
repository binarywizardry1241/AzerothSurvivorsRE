0x14001c700: push rbp
0x14001c701: push r15
0x14001c703: push r14
0x14001c705: push r12
0x14001c707: push rsi
0x14001c708: push rdi
0x14001c709: push rbx
0x14001c70a: sub rsp, 0x60
0x14001c70e: lea rbp, [rsp + 0x60]
0x14001c713: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x14001c71b: mov rsi, rcx
0x14001c71e: movss dword ptr [rbp - 0xc], xmm1
0x14001c723: lea rax, [rbp - 0xc]
0x14001c727: mov qword ptr [rbp - 0x40], rax
0x14001c72b: lea rax, [rip + 0x5bc14ae]
0x14001c732: mov qword ptr [rbp - 0x38], rax
0x14001c736: lea rdx, [rip + 0x5d88f38]
0x14001c73d: lea rcx, [rbp - 0x30]
0x14001c741: lea r8, [rbp - 0x40]
0x14001c745: call 0x145bcce30
0x14001c74a: mov r12, qword ptr [rbp - 0x28]
0x14001c74e: mov rcx, qword ptr [rbp - 0x20]
0x14001c752: jmp 0x14001c76f
0x14001c754: nop word ptr cs:[rax + rax]
0x14001c760: dec rcx
0x14001c763: sub rcx, r12
0x14001c766: cmp edx, 0x30
0x14001c769: jne 0x14001c7fb
0x14001c76f: mov rax, rcx
0x14001c772: test rcx, rcx
0x14001c775: je 0x14001c7fb
0x14001c77b: lea rcx, [r12 + rax]
0x14001c77f: movsx edx, byte ptr [rcx - 1]
0x14001c783: test edx, edx
0x14001c785: jns 0x14001c760
0x14001c787: movzx r8d, byte ptr [rcx - 2]
0x14001c78c: cmp r8b, 0xc0
0x14001c790: jge 0x14001c7b7
0x14001c792: movzx r9d, byte ptr [rcx - 3]
0x14001c797: cmp r9b, 0xc0
0x14001c79b: jge 0x14001c7c1
0x14001c79d: movzx r10d, byte ptr [rcx - 4]
0x14001c7a2: add rcx, -4
0x14001c7a6: and r10d, 7
0x14001c7aa: shl r10d, 6
0x14001c7ae: and r9d, 0x3f
0x14001c7b2: or r9d, r10d
0x14001c7b5: jmp 0x14001c7c9
0x14001c7b7: add rcx, -2
0x14001c7bb: and r8d, 0x1f
0x14001c7bf: jmp 0x14001c7d4
0x14001c7c1: add rcx, -3
0x14001c7c5: and r9d, 0xf
0x14001c7c9: shl r9d, 6
0x14001c7cd: and r8d, 0x3f
0x14001c7d1: or r8d, r9d
0x14001c7d4: shl r8d, 6
0x14001c7d8: and dl, 0x3f
0x14001c7db: movzx edx, dl
0x14001c7de: or edx, r8d
0x14001c7e1: sub rcx, r12
0x14001c7e4: cmp edx, 0x30
0x14001c7e7: je 0x14001c76f
0x14001c7e9: jmp 0x14001c7fb
0x14001c7eb: nop dword ptr [rax + rax]
0x14001c7f0: dec rax
0x14001c7f3: sub rax, r12
0x14001c7f6: cmp ecx, 0x2e
0x14001c7f9: jne 0x14001c86e
0x14001c7fb: test rax, rax
0x14001c7fe: je 0x14001c8ca
0x14001c804: mov rdi, rax
0x14001c807: add rax, r12
0x14001c80a: movsx ecx, byte ptr [rax - 1]
0x14001c80e: test ecx, ecx
0x14001c810: jns 0x14001c7f0
0x14001c812: movzx edx, byte ptr [rax - 2]
0x14001c816: cmp dl, 0xc0
0x14001c819: jge 0x14001c840
0x14001c81b: movzx r8d, byte ptr [rax - 3]
0x14001c820: cmp r8b, 0xc0
0x14001c824: jge 0x14001c849
0x14001c826: movzx r9d, byte ptr [rax - 4]
0x14001c82b: add rax, -4
0x14001c82f: and r9d, 7
0x14001c833: shl r9d, 6
0x14001c837: and r8d, 0x3f
0x14001c83b: or r8d, r9d
0x14001c83e: jmp 0x14001c851
0x14001c840: add rax, -2
0x14001c844: and edx, 0x1f
0x14001c847: jmp 0x14001c85b
0x14001c849: add rax, -3
0x14001c84d: and r8d, 0xf
0x14001c851: shl r8d, 6
0x14001c855: and edx, 0x3f
0x14001c858: or edx, r8d
0x14001c85b: shl edx, 6
0x14001c85e: and cl, 0x3f
0x14001c861: movzx ecx, cl
0x14001c864: or ecx, edx
0x14001c866: sub rax, r12
0x14001c869: cmp ecx, 0x2e
0x14001c86c: je 0x14001c7fb
0x14001c86e: cmp rdi, 2
0x14001c872: jne 0x14001c904
0x14001c878: movzx eax, word ptr [r12]
0x14001c87d: xor edi, edi
0x14001c87f: cmp eax, 0x302d
0x14001c884: setne dil
0x14001c888: inc rdi
0x14001c88b: cmp ax, 0x302d
0x14001c88f: lea rbx, [rip + 0x5d82096]
0x14001c896: cmovne rbx, r12
0x14001c89a: call 0x140002200
0x14001c89f: mov r14d, 1
0x14001c8a5: mov edx, 1
0x14001c8aa: mov rcx, rdi
0x14001c8ad: call 0x1400021c0
0x14001c8b2: test rax, rax
0x14001c8b5: je 0x14001c921
0x14001c8b7: mov r15, rax
0x14001c8ba: mov rcx, rax
0x14001c8bd: mov rdx, rbx
0x14001c8c0: mov r8, rdi
0x14001c8c3: call 0x145bfa0e7
0x14001c8c8: jmp 0x14001c8d2
0x14001c8ca: mov r15d, 1
0x14001c8d0: xor edi, edi
0x14001c8d2: mov qword ptr [rsi], rdi
0x14001c8d5: mov qword ptr [rsi + 8], r15
0x14001c8d9: mov qword ptr [rsi + 0x10], rdi
0x14001c8dd: mov rdx, qword ptr [rbp - 0x30]
0x14001c8e1: test rdx, rdx
0x14001c8e4: je 0x14001c8f5
0x14001c8e6: mov r8d, 1
0x14001c8ec: mov rcx, r12
0x14001c8ef: call 0x1400021d0
0x14001c8f4: nop
0x14001c8f5: add rsp, 0x60
0x14001c8f9: pop rbx
0x14001c8fa: pop rdi
0x14001c8fb: pop rsi
0x14001c8fc: pop r12
0x14001c8fe: pop r14
0x14001c900: pop r15
0x14001c902: pop rbp
0x14001c903: ret
0x14001c904: mov rbx, r12
0x14001c907: test rdi, rdi
0x14001c90a: jns 0x14001c89a
0x14001c90c: mov qword ptr [rbp - 0x18], r12
0x14001c910: xor r14d, r14d
0x14001c913: mov rcx, r14
0x14001c916: mov rdx, rdi
0x14001c919: call 0x145d992bb
0x14001c91e: nop
0x14001c91f: ud2
0x14001c921: mov qword ptr [rbp - 0x18], r12
0x14001c925: jmp 0x14001c913
