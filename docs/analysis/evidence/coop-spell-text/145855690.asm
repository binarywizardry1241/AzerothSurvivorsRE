0x145855690: push rbp
0x145855691: push r15
0x145855693: push r14
0x145855695: push r12
0x145855697: push rsi
0x145855698: push rdi
0x145855699: push rbx
0x14585569a: sub rsp, 0xf0
0x1458556a1: lea rbp, [rsp + 0x80]
0x1458556a9: movaps xmmword ptr [rbp + 0x60], xmm6
0x1458556ad: mov qword ptr [rbp + 0x58], 0xfffffffffffffffe
0x1458556b5: mov rsi, rcx
0x1458556b8: movzx ecx, byte ptr [rdx + 0x9a]
0x1458556bf: test cl, cl
0x1458556c1: je 0x145855a40
0x1458556c7: mov rdi, rdx
0x1458556ca: test r8b, r8b
0x1458556cd: je 0x145855704
0x1458556cf: movzx edx, r8b
0x1458556d3: movzx eax, cl
0x1458556d6: cmp r8b, cl
0x1458556d9: cmovb eax, edx
0x1458556dc: mov byte ptr [rbp + 0x57], al
0x1458556df: mov r8, qword ptr [rdi + 0x20]
0x1458556e3: test r8, r8
0x1458556e6: je 0x145855712
0x1458556e8: mov rdx, qword ptr [rdi + 0x28]
0x1458556ec: cmp al, 1
0x1458556ee: adc al, 0xff
0x1458556f0: movzx ecx, al
0x1458556f3: cmp rdx, rcx
0x1458556f6: jbe 0x145855a80
0x1458556fc: movss xmm0, dword ptr [r8 + rcx*4]
0x145855702: jmp 0x145855719
0x145855704: mov al, 1
0x145855706: mov byte ptr [rbp + 0x57], al
0x145855709: mov r8, qword ptr [rdi + 0x20]
0x14585570d: test r8, r8
0x145855710: jne 0x1458556e8
0x145855712: movzx eax, al
0x145855715: cvtsi2ss xmm0, eax
0x145855719: movss dword ptr [rbp + 0xc], xmm0
0x14585571e: mov rax, qword ptr [rdi + 0x60]
0x145855722: mov rcx, qword ptr [rdi + 0x68]
0x145855726: shl rcx, 6
0x14585572a: add rcx, rax
0x14585572d: mov qword ptr [rbp - 0x30], rax
0x145855731: mov qword ptr [rbp - 0x28], rcx
0x145855735: lea rax, [rbp + 0xc]
0x145855739: mov qword ptr [rbp - 0x20], rax
0x14585573d: lea rax, [rbp + 0x57]
0x145855741: mov qword ptr [rbp - 0x18], rax
0x145855745: mov rbx, qword ptr [rdi + 0x70]
0x145855749: mov r14, qword ptr [rdi + 0x78]
0x14585574d: mov rcx, rbx
0x145855750: mov rdx, r14
0x145855753: call 0x1458dff90
0x145855758: test rax, rax
0x14585575b: cmove rax, rbx
0x14585575f: mov rbx, rdx
0x145855762: cmove rbx, r14
0x145855766: test rbx, rbx
0x145855769: jns 0x14585577b
0x14585576b: xor r12d, r12d
0x14585576e: mov rcx, r12
0x145855771: mov rdx, rbx
0x145855774: call 0x145eb6fcb
0x145855779: ud2
0x14585577b: je 0x1458557b0
0x14585577d: mov r15, rax
0x145855780: call 0x140002200
0x145855785: mov r12d, 1
0x14585578b: mov edx, 1
0x145855790: mov rcx, rbx
0x145855793: call 0x1400021c0
0x145855798: test rax, rax
0x14585579b: je 0x14585576e
0x14585579d: mov r14, rax
0x1458557a0: mov rcx, rax
0x1458557a3: mov rdx, r15
0x1458557a6: mov r8, rbx
0x1458557a9: call 0x145d145fb
0x1458557ae: jmp 0x1458557b6
0x1458557b0: mov r14d, 1
0x1458557b6: mov qword ptr [rbp + 0x30], rbx
0x1458557ba: mov qword ptr [rbp + 0x38], r14
0x1458557be: mov qword ptr [rbp + 0x40], rbx
0x1458557c2: lea rcx, [rbp - 0x30]
0x1458557c6: lea rdx, [rbp + 0xc]
0x1458557ca: lea r8, [rbp + 0x57]
0x1458557ce: call 0x145851a00
0x1458557d3: test al, 1
0x1458557d5: je 0x14585585c
0x1458557db: lea rcx, [rbp + 0x10]
0x1458557df: movaps xmm1, xmm0
0x1458557e2: call 0x14585bbf0
0x1458557e7: nop
0x1458557e8: mov rcx, qword ptr [rbp + 0x18]
0x1458557ec: mov rax, qword ptr [rbp + 0x20]
0x1458557f0: mov qword ptr [rsp + 0x30], rax
0x1458557f5: mov qword ptr [rbp + 0x48], rcx
0x1458557f9: mov qword ptr [rsp + 0x28], rcx
0x1458557fe: mov qword ptr [rsp + 0x20], 3
0x145855807: lea r9, [rip + 0x17b784a]
0x14585580e: lea rcx, [rbp - 0x10]
0x145855812: mov rdx, r14
0x145855815: mov r8, rbx
0x145855818: call 0x14584e6b0
0x14585581d: nop
0x14585581e: test rbx, rbx
0x145855821: je 0x145855834
0x145855823: mov r8d, 1
0x145855829: mov rcx, r14
0x14585582c: mov rdx, rbx
0x14585582f: call 0x1400021d0
0x145855834: mov rax, qword ptr [rbp]
0x145855838: mov qword ptr [rbp + 0x40], rax
0x14585583c: movups xmm0, xmmword ptr [rbp - 0x10]
0x145855840: movaps xmmword ptr [rbp + 0x30], xmm0
0x145855844: mov rdx, qword ptr [rbp + 0x10]
0x145855848: test rdx, rdx
0x14585584b: je 0x14585585c
0x14585584d: mov r8d, 1
0x145855853: mov rcx, qword ptr [rbp + 0x48]
0x145855857: call 0x1400021d0
0x14585585c: mov rdx, qword ptr [rbp - 0x20]
0x145855860: mov r8, qword ptr [rbp - 0x18]
0x145855864: lea rcx, [rbp - 0x30]
0x145855868: call 0x145851a00
0x14585586d: test al, 1
0x14585586f: je 0x1458558ff
0x145855875: mov rbx, qword ptr [rbp + 0x38]
0x145855879: mov r14, qword ptr [rbp + 0x40]
0x14585587d: lea rcx, [rbp + 0x10]
0x145855881: movaps xmm1, xmm0
0x145855884: call 0x14585bbf0
0x145855889: nop
0x14585588a: mov rcx, qword ptr [rbp + 0x18]
0x14585588e: mov rax, qword ptr [rbp + 0x20]
0x145855892: mov qword ptr [rsp + 0x30], rax
0x145855897: mov qword ptr [rbp + 0x48], rcx
0x14585589b: mov qword ptr [rsp + 0x28], rcx
0x1458558a0: mov qword ptr [rsp + 0x20], 4
0x1458558a9: lea r9, [rip + 0x17b77ab]
0x1458558b0: lea rcx, [rbp - 0x10]
0x1458558b4: mov rdx, rbx
0x1458558b7: mov r8, r14
0x1458558ba: call 0x14584e6b0
0x1458558bf: nop
0x1458558c0: mov rdx, qword ptr [rbp + 0x30]
0x1458558c4: test rdx, rdx
0x1458558c7: je 0x1458558d7
0x1458558c9: mov r8d, 1
0x1458558cf: mov rcx, rbx
0x1458558d2: call 0x1400021d0
0x1458558d7: mov rax, qword ptr [rbp]
0x1458558db: mov qword ptr [rbp + 0x40], rax
0x1458558df: movups xmm0, xmmword ptr [rbp - 0x10]
0x1458558e3: movaps xmmword ptr [rbp + 0x30], xmm0
0x1458558e7: mov rdx, qword ptr [rbp + 0x10]
0x1458558eb: test rdx, rdx
0x1458558ee: je 0x1458558ff
0x1458558f0: mov r8d, 1
0x1458558f6: mov rcx, qword ptr [rbp + 0x48]
0x1458558fa: call 0x1400021d0
0x1458558ff: mov rbx, qword ptr [rdi + 0x80]
0x145855906: test rbx, rbx
0x145855909: je 0x145855a18
0x14585590f: mov r14, qword ptr [rdi + 0x88]
0x145855916: movss xmm6, dword ptr [rdi + 0x90]
0x14585591e: mov rcx, rbx
0x145855921: mov rdx, r14
0x145855924: call 0x1458dff90
0x145855929: nop
0x14585592a: mov r15, rax
0x14585592d: mov rdi, rdx
0x145855930: movzx eax, byte ptr [rbp + 0x57]
0x145855934: xorps xmm0, xmm0
0x145855937: cvtsi2ss xmm0, eax
0x14585593b: mulss xmm6, xmm0
0x14585593f: lea rcx, [rbp + 0x10]
0x145855943: movaps xmm1, xmm6
0x145855946: call 0x14585bbf0
0x14585594b: nop
0x14585594c: test r15, r15
0x14585594f: cmove rdi, r14
0x145855953: cmovne rbx, r15
0x145855957: mov rcx, qword ptr [rbp + 0x18]
0x14585595b: mov rax, qword ptr [rbp + 0x20]
0x14585595f: mov qword ptr [rsp + 0x30], rax
0x145855964: mov qword ptr [rbp + 0x48], rcx
0x145855968: mov qword ptr [rsp + 0x28], rcx
0x14585596d: mov qword ptr [rsp + 0x20], 3
0x145855976: lea r9, [rip + 0x17b76db]
0x14585597d: lea r14, [rbp - 0x10]
0x145855981: mov rcx, r14
0x145855984: mov rdx, rbx
0x145855987: mov r8, rdi
0x14585598a: call 0x14584e6b0
0x14585598f: nop
0x145855990: mov rdx, qword ptr [rbp + 0x10]
0x145855994: test rdx, rdx
0x145855997: je 0x1458559a8
0x145855999: mov r8d, 1
0x14585599f: mov rcx, qword ptr [rbp + 0x48]
0x1458559a3: call 0x1400021d0
0x1458559a8: lea rax, [rbp + 0x30]
0x1458559ac: mov qword ptr [rbp + 0x10], rax
0x1458559b0: lea rax, [rip - 0x58538d7]
0x1458559b7: mov qword ptr [rbp + 0x18], rax
0x1458559bb: mov qword ptr [rbp + 0x20], r14
0x1458559bf: mov qword ptr [rbp + 0x28], rax
0x1458559c3: lea rdx, [rip + 0x17b7695]
0x1458559ca: lea rcx, [rbp - 0x48]
0x1458559ce: lea r8, [rbp + 0x10]
0x1458559d2: call 0x145ce7350
0x1458559d7: nop
0x1458559d8: mov rdx, qword ptr [rbp + 0x30]
0x1458559dc: test rdx, rdx
0x1458559df: je 0x1458559f0
0x1458559e1: mov rcx, qword ptr [rbp + 0x38]
0x1458559e5: mov r8d, 1
0x1458559eb: call 0x1400021d0
0x1458559f0: mov rax, qword ptr [rbp - 0x38]
0x1458559f4: mov qword ptr [rbp + 0x40], rax
0x1458559f8: movups xmm0, xmmword ptr [rbp - 0x48]
0x1458559fc: movaps xmmword ptr [rbp + 0x30], xmm0
0x145855a00: mov rdx, qword ptr [rbp - 0x10]
0x145855a04: test rdx, rdx
0x145855a07: je 0x145855a18
0x145855a09: mov rcx, qword ptr [rbp - 8]
0x145855a0d: mov r8d, 1
0x145855a13: call 0x1400021d0
0x145855a18: mov rax, qword ptr [rbp + 0x40]
0x145855a1c: mov qword ptr [rsi + 0x10], rax
0x145855a20: movaps xmm0, xmmword ptr [rbp + 0x30]
0x145855a24: movups xmmword ptr [rsi], xmm0
0x145855a27: mov rax, rsi
0x145855a2a: movaps xmm6, xmmword ptr [rbp + 0x60]
0x145855a2e: add rsp, 0xf0
0x145855a35: pop rbx
0x145855a36: pop rdi
0x145855a37: pop rsi
0x145855a38: pop r12
0x145855a3a: pop r14
0x145855a3c: pop r15
0x145855a3e: pop rbp
0x145855a3f: ret
0x145855a40: mov byte ptr [rbp - 0x10], 1
0x145855a44: mov byte ptr [rbp - 0x30], 0
0x145855a48: lea rax, [rbp - 0x10]
0x145855a4c: mov qword ptr [rbp + 0x10], rax
0x145855a50: lea rax, [rip - 0x5412777]
0x145855a57: mov qword ptr [rbp + 0x18], rax
0x145855a5b: lea rcx, [rbp - 0x30]
0x145855a5f: mov qword ptr [rbp + 0x20], rcx
0x145855a63: mov qword ptr [rbp + 0x28], rax
0x145855a67: lea rcx, [rip + 0x17d628a]
0x145855a6e: lea r8, [rip + 0x17b75cb]
0x145855a75: lea rdx, [rbp + 0x10]
0x145855a79: call 0x145eb7540
0x145855a7e: ud2
0x145855a80: lea r8, [rip + 0x17b75a1]
0x145855a87: call 0x145eb7363
0x145855a8c: ud2
