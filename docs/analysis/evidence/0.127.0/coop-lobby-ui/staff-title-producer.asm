0x145b903b0: push rbp
0x145b903b1: push r15
0x145b903b3: push r14
0x145b903b5: push r13
0x145b903b7: push r12
0x145b903b9: push rsi
0x145b903ba: push rdi
0x145b903bb: push rbx
0x145b903bc: sub rsp, 0x198
0x145b903c3: lea rbp, [rsp + 0x80]
0x145b903cb: movaps xmmword ptr [rbp + 0x100], xmm6
0x145b903d2: mov qword ptr [rbp + 0xf8], 0xfffffffffffffffe
0x145b903dd: mov qword ptr [rbp + 0x10], r9
0x145b903e1: mov qword ptr [rbp + 0x40], r8
0x145b903e5: mov rdi, rdx
0x145b903e8: mov qword ptr [rbp + 0x28], rcx
0x145b903ec: call 0x140002200
0x145b903f1: mov ebx, 1
0x145b903f6: mov ecx, 1
0x145b903fb: mov edx, 1
0x145b90400: call 0x1400021c0
0x145b90405: test rax, rax
0x145b90408: je 0x145b9106a
0x145b9040e: mov rsi, rax
0x145b90411: mov byte ptr [rax], 0x5b
0x145b90414: mov r12, qword ptr [rdi + 8]
0x145b90418: mov qword ptr [rbp + 0x50], rdi
0x145b9041c: mov rdi, qword ptr [rdi + 0x10]
0x145b90420: imul rax, rdi, 0xb8
0x145b90427: add rax, r12
0x145b9042a: mov qword ptr [rbp - 0x10], rax
0x145b9042e: lea rax, [rdi - 1]
0x145b90432: mov qword ptr [rbp], rax
0x145b90436: mov eax, edi
0x145b90438: and eax, 3
0x145b9043b: mov qword ptr [rbp - 8], rdi
0x145b9043f: and rdi, 0xfffffffffffffffc
0x145b90443: lea rcx, [r12 + 0x2c8]
0x145b9044b: mov qword ptr [rbp + 0x20], rcx
0x145b9044f: lea rcx, [r12 + 0xa0]
0x145b90457: mov qword ptr [rbp + 8], rcx
0x145b9045b: mov qword ptr [rbp + 0x18], rax
0x145b9045f: imul r15, rax, 0xb8
0x145b90466: mov r14b, 1
0x145b90469: movsd xmm6, qword ptr [rip + 0x6c870f]
0x145b90471: mov r13d, 1
0x145b90477: mov qword ptr [rbp + 0xa0], 0
0x145b90482: cmp r12, qword ptr [rbp - 0x10]
0x145b90486: mov qword ptr [rbp + 0x60], rsi
0x145b9048a: mov qword ptr [rbp + 0x90], r13
0x145b90491: je 0x145b90d02
0x145b90497: mov qword ptr [rbp + 0x70], r13
0x145b9049b: mov qword ptr [rbp + 0x78], rsi
0x145b9049f: mov qword ptr [rbp + 0x80], rbx
0x145b904a6: mov byte ptr [rbp + 0x88], r14b
0x145b904ad: mov eax, dword ptr [rbp + 0x98]
0x145b904b3: mov ecx, dword ptr [rbp + 0x9b]
0x145b904b9: lea rdx, [rbp + 0x89]
0x145b904c0: mov dword ptr [rdx + 3], ecx
0x145b904c3: mov dword ptr [rdx], eax
0x145b904c5: call 0x140002200
0x145b904ca: mov ecx, 1
0x145b904cf: mov edx, 1
0x145b904d4: call 0x1400021c0
0x145b904d9: test rax, rax
0x145b904dc: je 0x145b91058
0x145b904e2: mov byte ptr [rax], 0x7b
0x145b904e5: mov qword ptr [rbp + 0xd0], 1
0x145b904f0: mov qword ptr [rbp + 0xd8], rax
0x145b904f7: mov qword ptr [rbp + 0xe0], 1
0x145b90502: mov byte ptr [rbp + 0xe8], 1
0x145b90509: movupd xmm0, xmmword ptr [r12 + 8]
0x145b90510: movupd xmmword ptr [rsp + 0x20], xmm0
0x145b90516: mov r9d, 4
0x145b9051c: lea r13, [rbp + 0xb0]
0x145b90523: mov rcx, r13
0x145b90526: lea rsi, [rbp + 0xd0]
0x145b9052d: mov rdx, rsi
0x145b90530: lea r8, [rip + 0x14ecb64]
0x145b90537: call 0x145b7eac0
0x145b9053c: nop 
0x145b9053d: mov rcx, qword ptr [r12 + 0xa0]
0x145b90545: mov r8d, 0x14
0x145b9054b: mov rdx, rsi
0x145b9054e: call 0x14603b5e0
0x145b90553: nop 
0x145b90554: mov r14, rdx
0x145b90557: test rdx, rdx
0x145b9055a: js 0x145b90cf1
0x145b90560: test r14, r14
0x145b90563: je 0x145b90599
0x145b90565: mov rbx, rax
0x145b90568: call 0x140002200
0x145b9056d: mov edx, 1
0x145b90572: mov rcx, r14
0x145b90575: call 0x1400021c0
0x145b9057a: test rax, rax
0x145b9057d: je 0x145b9107b
0x145b90583: mov rcx, rax
0x145b90586: mov rdx, rbx
0x145b90589: mov r8, r14
0x145b9058c: mov rsi, rax
0x145b9058f: call 0x14606171b
0x145b90594: mov rax, rsi
0x145b90597: jmp 0x145b9059e
0x145b90599: mov eax, 1
0x145b9059e: mov qword ptr [rbp + 0x58], r14
0x145b905a2: mov qword ptr [rsp + 0x28], r14
0x145b905a7: mov qword ptr [rbp + 0x68], rax
0x145b905ab: mov qword ptr [rsp + 0x20], rax
0x145b905b0: mov r9d, 2
0x145b905b6: lea rcx, [rbp + 0xd0]
0x145b905bd: mov rdx, r13
0x145b905c0: lea r8, [rip + 0x14ecad2]
0x145b905c7: call 0x145b7eac0
0x145b905cc: nop 
0x145b905cd: movzx eax, byte ptr [r12 + 0xb1]
0x145b905d6: add al, 0xfe
0x145b905d8: lea rsi, [rip + 0x14ac329]
0x145b905df: cmp al, 9
0x145b905e1: ja 0x145b905f1
0x145b905e3: movzx eax, al
0x145b905e6: lea rcx, [rip + 0x14edbeb]
0x145b905ed: mov rsi, qword ptr [rcx + rax*8]
0x145b905f1: lea rax, [rsi + 0x10]
0x145b905f5: mov qword ptr [rbp + 0x30], rax
0x145b905f9: lea rax, [rip - 0x5b8e540]
0x145b90600: mov qword ptr [rbp + 0x38], rax
0x145b90604: mov byte ptr [rbp + 0xf5], 1
0x145b9060b: mov rcx, r13
0x145b9060e: lea rdx, [rip + 0x149e04b]
0x145b90615: lea r8, [rbp + 0x30]
0x145b90619: call 0x146034470
0x145b9061e: nop 
0x145b9061f: mov rcx, qword ptr [rbp + 0xb8]
0x145b90626: mov rdx, qword ptr [rbp + 0xc0]
0x145b9062d: mov r13, qword ptr [rsi + 0x20]
0x145b90631: mov rsi, qword ptr [rsi + 0x28]
0x145b90635: mov qword ptr [rbp + 0xa8], rcx
0x145b9063c: call 0x145be82d0
0x145b90641: nop 
0x145b90642: mov r14, rax
0x145b90645: mov rbx, rdx
0x145b90648: mov rdx, qword ptr [rbp + 0xb0]
0x145b9064f: test rdx, rdx
0x145b90652: je 0x145b90666
0x145b90654: mov r8d, 1
0x145b9065a: mov rcx, qword ptr [rbp + 0xa8]
0x145b90661: call 0x1400021d0
0x145b90666: test r14, r14
0x145b90669: cmovne r13, r14
0x145b9066d: cmove rbx, rsi
0x145b90671: mov byte ptr [rbp + 0xf5], 0
0x145b90678: mov qword ptr [rsp + 0x28], rbx
0x145b9067d: mov qword ptr [rsp + 0x20], r13
0x145b90682: mov r9d, 5
0x145b90688: lea rsi, [rbp + 0xb0]
0x145b9068f: mov rcx, rsi
0x145b90692: lea rdx, [rbp + 0xd0]
0x145b90699: lea r8, [rip + 0x14eca2c]
0x145b906a0: call 0x145b7eac0
0x145b906a5: nop 
0x145b906a6: movzx eax, byte ptr [r12 + 0xb2]
0x145b906af: add al, 0xfe
0x145b906b1: lea rcx, [rip + 0x14ab0b8]
0x145b906b8: cmp al, 6
0x145b906ba: lea rbx, [rbp + 0xd0]
0x145b906c1: ja 0x145b906d1
0x145b906c3: movzx eax, al
0x145b906c6: lea rcx, [rip + 0x14edb5b]
0x145b906cd: mov rcx, qword ptr [rcx + rax*8]
0x145b906d1: mov byte ptr [rbp + 0xf2], 1
0x145b906d8: call 0x145af24d0
0x145b906dd: nop 
0x145b906de: mov byte ptr [rbp + 0xf2], 0
0x145b906e5: mov qword ptr [rsp + 0x28], rdx
0x145b906ea: mov qword ptr [rsp + 0x20], rax
0x145b906ef: mov r9d, 4
0x145b906f5: mov rcx, rbx
0x145b906f8: mov rdx, rsi
0x145b906fb: lea r8, [rip + 0x14ec9cf]
0x145b90702: call 0x145b7eac0
0x145b90707: nop 
0x145b90708: movzx eax, byte ptr [r12 + 0xb1]
0x145b90711: mov byte ptr [rsp + 0x20], al
0x145b90715: mov r9d, 7
0x145b9071b: mov rcx, rsi
0x145b9071e: mov rdx, rbx
0x145b90721: lea r8, [rip + 0x14ec977]
0x145b90728: call 0x145b77380
0x145b9072d: nop 
0x145b9072e: mov eax, dword ptr [r12 + 0xac]
0x145b90736: mov dword ptr [rsp + 0x20], eax
0x145b9073a: mov r9d, 6
0x145b90740: mov rcx, rbx
0x145b90743: mov rdx, rsi
0x145b90746: lea r8, [rip + 0x14ec988]
0x145b9074d: call 0x145b77500
0x145b90752: nop 
0x145b90753: mov r13b, byte ptr [r12 + 0xb0]
0x145b9075b: mov r8d, 6
0x145b90761: mov rcx, rbx
0x145b90764: lea rdx, [rip + 0x14ec970]
0x145b9076b: call 0x145b7e810
0x145b90770: nop 
0x145b90771: movzx ebx, r13b
0x145b90775: xor rbx, 5
0x145b90779: mov rax, qword ptr [rbp + 0xd0]
0x145b90780: mov r14, qword ptr [rbp + 0xe0]
0x145b90787: sub rax, r14
0x145b9078a: cmp rbx, rax
0x145b9078d: ja 0x145b90c45
0x145b90793: test r13b, r13b
0x145b90796: lea rdx, [rip + 0x14e1d0f]
0x145b9079d: lea rax, [rip + 0x14e1d0d]
0x145b907a4: cmovne rdx, rax
0x145b907a8: mov rcx, qword ptr [rbp + 0xd8]
0x145b907af: add rcx, r14
0x145b907b2: mov r8, rbx
0x145b907b5: call 0x14606171b
0x145b907ba: add r14, rbx
0x145b907bd: mov qword ptr [rbp + 0xe0], r14
0x145b907c4: movups xmm0, xmmword ptr [rbp + 0xd0]
0x145b907cb: movaps xmmword ptr [rbp + 0xb0], xmm0
0x145b907d2: mov rax, qword ptr [rbp + 0xe0]
0x145b907d9: mov qword ptr [rbp + 0xc0], rax
0x145b907e0: mov rax, qword ptr [rbp + 0xe8]
0x145b907e7: mov qword ptr [rbp + 0xc8], rax
0x145b907ee: cmp byte ptr [r12 + 0xa8], 0
0x145b907f7: jne 0x145b90800
0x145b907f9: movapd xmm0, xmm6
0x145b907fd: jmp 0x145b90810
0x145b907ff: nop 
0x145b90800: movzx eax, word ptr [r12 + 0xaa]
0x145b90809: xorps xmm0, xmm0
0x145b9080c: cvtsi2sd xmm0, eax
0x145b90810: lea rbx, [rbp + 0xd0]
0x145b90817: movsd qword ptr [rsp + 0x20], xmm0
0x145b9081d: mov r9d, 4
0x145b90823: mov rcx, rbx
0x145b90826: mov rdx, rsi
0x145b90829: lea r8, [rip + 0x14ec8b1]
0x145b90830: call 0x145b77080
0x145b90835: nop 
0x145b90836: movupd xmm0, xmmword ptr [r12 + 0x20]
0x145b9083d: movupd xmmword ptr [rsp + 0x20], xmm0
0x145b90843: mov r9d, 7
0x145b90849: mov rcx, rsi
0x145b9084c: mov rdx, rbx
0x145b9084f: lea r8, [rip + 0x14ec88f]
0x145b90856: call 0x145b7eac0
0x145b9085b: nop 
0x145b9085c: mov r8d, 4
0x145b90862: mov rcx, rsi
0x145b90865: lea rdx, [rip + 0x14ec880]
0x145b9086c: call 0x145b7e810
0x145b90871: nop 
0x145b90872: cmp qword ptr [rbp + 0xa0], 1
0x145b9087a: mov ebx, 5
0x145b9087f: sbb rbx, 0
0x145b90883: mov rax, qword ptr [rbp + 0xb0]
0x145b9088a: mov r14, qword ptr [rbp + 0xc0]
0x145b90891: sub rax, r14
0x145b90894: cmp rbx, rax
0x145b90897: ja 0x145b90c73
0x145b9089d: cmp qword ptr [rbp + 0xa0], 0
0x145b908a5: lea rdx, [rip + 0x14e1c00]
0x145b908ac: lea rax, [rip + 0x14e1bfe]
0x145b908b3: cmove rdx, rax
0x145b908b7: mov rcx, qword ptr [rbp + 0xb8]
0x145b908be: add rcx, r14
0x145b908c1: mov r8, rbx
0x145b908c4: call 0x14606171b
0x145b908c9: add r14, rbx
0x145b908cc: mov qword ptr [rbp + 0xc0], r14
0x145b908d3: movupd xmm0, xmmword ptr [rbp + 0xb0]
0x145b908db: movapd xmmword ptr [rbp + 0xd0], xmm0
0x145b908e3: mov rax, qword ptr [rbp + 0xc0]
0x145b908ea: mov qword ptr [rbp + 0xe0], rax
0x145b908f1: mov rax, qword ptr [rbp + 0xc8]
0x145b908f8: mov qword ptr [rbp + 0xe8], rax
0x145b908ff: mov r13, qword ptr [r12 + 0xa0]
0x145b90907: mov r8d, 2
0x145b9090d: lea rcx, [rbp + 0xd0]
0x145b90914: lea rdx, [rip + 0x14ec78f]
0x145b9091b: call 0x145b7e810
0x145b90920: nop 
0x145b90921: xor ebx, ebx
0x145b90923: cmp r13, qword ptr [rbp + 0x40]
0x145b90927: sete bl
0x145b9092a: xor rbx, 5
0x145b9092e: mov rax, qword ptr [rbp + 0xd0]
0x145b90935: mov r14, qword ptr [rbp + 0xe0]
0x145b9093c: sub rax, r14
0x145b9093f: cmp rbx, rax
0x145b90942: ja 0x145b90c9d
0x145b90948: cmp r13, qword ptr [rbp + 0x40]
0x145b9094c: lea rdx, [rip + 0x14e1b59]
0x145b90953: lea rax, [rip + 0x14e1b57]
0x145b9095a: cmove rdx, rax
0x145b9095e: mov rcx, qword ptr [rbp + 0xd8]
0x145b90965: add rcx, r14
0x145b90968: mov r8, rbx
0x145b9096b: call 0x14606171b
0x145b90970: add r14, rbx
0x145b90973: mov qword ptr [rbp + 0xe0], r14
0x145b9097a: movapd xmm0, xmmword ptr [rbp + 0xd0]
0x145b90982: movapd xmmword ptr [rbp + 0xb0], xmm0
0x145b9098a: mov rax, qword ptr [rbp + 0xe0]
0x145b90991: mov qword ptr [rbp + 0xc0], rax
0x145b90998: mov rax, qword ptr [rbp + 0xe8]
0x145b9099f: mov qword ptr [rbp + 0xc8], rax
0x145b909a6: mov r10d, 1
0x145b909ac: cmp qword ptr [rbp - 8], 0
0x145b909b1: je 0x145b90b42
0x145b909b7: cmp qword ptr [r12 + 0x30], -1
0x145b909bd: lea r14, [rbp + 0xd0]
0x145b909c4: je 0x145b90ac0
0x145b909ca: mov rbx, qword ptr [r12 + 0xa0]
0x145b909d2: cmp qword ptr [rbp], 3
0x145b909d7: jae 0x145b909df
0x145b909d9: xor ecx, ecx
0x145b909db: xor eax, eax
0x145b909dd: jmp 0x145b90a43
0x145b909df: mov rdx, qword ptr [rbp + 0x20]
0x145b909e3: xor ecx, ecx
0x145b909e5: xor eax, eax
0x145b909e7: nop word ptr [rax + rax]
0x145b909f0: xor r8d, r8d
0x145b909f3: cmp qword ptr [rdx - 0x228], rbx
0x145b909fa: sete r8b
0x145b909fe: add r8, rax
0x145b90a01: xor eax, eax
0x145b90a03: cmp qword ptr [rdx - 0x170], rbx
0x145b90a0a: sete al
0x145b90a0d: xor r9d, r9d
0x145b90a10: cmp qword ptr [rdx - 0xb8], rbx
0x145b90a17: sete r9b
0x145b90a1b: add r9, rax
0x145b90a1e: add r9, r8
0x145b90a21: xor eax, eax
0x145b90a23: cmp qword ptr [rdx], rbx
0x145b90a26: sete al
0x145b90a29: add rax, r9
0x145b90a2c: add rcx, 4
0x145b90a30: add rdx, 0x2e0
0x145b90a37: cmp rdi, rcx
0x145b90a3a: jne 0x145b909f0
0x145b90a3c: cmp qword ptr [rbp + 0x18], 0
0x145b90a41: je 0x145b90a6a
0x145b90a43: imul rcx, rcx, 0xb8
0x145b90a4a: add rcx, qword ptr [rbp + 8]
0x145b90a4e: xor edx, edx
0x145b90a50: xor r8d, r8d
0x145b90a53: cmp qword ptr [rcx + rdx], rbx
0x145b90a57: sete r8b
0x145b90a5b: add rax, r8
0x145b90a5e: add rdx, 0xb8
0x145b90a65: cmp r15, rdx
0x145b90a68: jne 0x145b90a50
0x145b90a6a: cmp rax, 1
0x145b90a6e: jne 0x145b90ac0
0x145b90a70: mov r14, qword ptr [r12 + 8]
0x145b90a75: mov r13, qword ptr [r12 + 0x10]
0x145b90a7a: call 0x14600efe0
0x145b90a7f: nop 
0x145b90a80: mov dword ptr [rbp + 0x30], eax
0x145b90a83: mov dword ptr [rbp + 0x34], edx
0x145b90a86: lea rcx, [rbp + 0xd0]
0x145b90a8d: lea rdx, [rbp + 0x30]
0x145b90a91: mov r8d, 0xd53e8000
0x145b90a97: mov r9d, 0x19db1de
0x145b90a9d: call 0x14600ef90
0x145b90aa2: nop 
0x145b90aa3: cmp byte ptr [rbp + 0xd0], 0
0x145b90aaa: jne 0x145b90ad2
0x145b90aac: mov rax, qword ptr [rbp + 0xd8]
0x145b90ab3: jmp 0x145b90ad4
0x145b90ab5: nop word ptr cs:[rax + rax]
0x145b90ac0: mov qword ptr [rbp + 0xa8], 0
0x145b90acb: xor eax, eax
0x145b90acd: jmp 0x145b90b56
0x145b90ad2: xor eax, eax
0x145b90ad4: lea r8, [r12 + 0x30]
0x145b90ad9: mov qword ptr [rsp + 0x40], rax
0x145b90ade: mov qword ptr [rsp + 0x38], r13
0x145b90ae3: mov qword ptr [rsp + 0x30], r14
0x145b90ae8: mov qword ptr [rsp + 0x28], rbx
0x145b90aed: mov rax, qword ptr [rbp + 0x180]
0x145b90af4: mov qword ptr [rsp + 0x20], rax
0x145b90af9: lea rcx, [rbp + 0xd0]
0x145b90b00: lea rdx, [rip + 0x14b3161]
0x145b90b07: mov r9, qword ptr [rbp + 0x10]
0x145b90b0b: call 0x145b05cc0
0x145b90b10: nop 
0x145b90b11: mov rax, qword ptr [rbp + 0xd0]
0x145b90b18: cmp rax, -1
0x145b90b1c: lea rsi, [rbp + 0xb0]
0x145b90b23: mov r10d, 1
0x145b90b29: je 0x145b90b42
0x145b90b2b: mov qword ptr [rbp + 0xa8], rax
0x145b90b32: mov r10, qword ptr [rbp + 0xd8]
0x145b90b39: mov rax, qword ptr [rbp + 0xe0]
0x145b90b40: jmp 0x145b90b4f
0x145b90b42: mov qword ptr [rbp + 0xa8], 0
0x145b90b4d: xor eax, eax
0x145b90b4f: lea r14, [rbp + 0xd0]
0x145b90b56: mov byte ptr [rbp + 0xf4], 1
0x145b90b5d: mov qword ptr [rsp + 0x28], rax
0x145b90b62: mov qword ptr [rbp + 0x48], r10
0x145b90b66: mov qword ptr [rsp + 0x20], r10
0x145b90b6b: mov r9d, 5
0x145b90b71: mov rcx, r14
0x145b90b74: mov rdx, rsi
0x145b90b77: lea r8, [rip + 0x14ec572]
0x145b90b7e: call 0x145b7eac0
0x145b90b83: nop 
0x145b90b84: mov rbx, qword ptr [rbp + 0xe0]
0x145b90b8b: cmp qword ptr [rbp + 0xd0], rbx
0x145b90b92: je 0x145b90ccb
0x145b90b98: mov rax, qword ptr [rbp + 0xd8]
0x145b90b9f: mov byte ptr [rax + rbx], 0x7d
0x145b90ba3: inc rbx
0x145b90ba6: mov qword ptr [rbp + 0xc0], rbx
0x145b90bad: movupd xmm0, xmmword ptr [rbp + 0xd0]
0x145b90bb5: movapd xmmword ptr [rbp + 0xb0], xmm0
0x145b90bbd: mov byte ptr [rbp + 0xf4], 0
0x145b90bc4: lea rcx, [rbp - 0x30]
0x145b90bc8: lea rdx, [rbp + 0x70]
0x145b90bcc: mov r8, rsi
0x145b90bcf: call 0x145b7e380
0x145b90bd4: nop 
0x145b90bd5: mov r13, qword ptr [rbp - 0x30]
0x145b90bd9: mov rsi, qword ptr [rbp - 0x28]
0x145b90bdd: mov rbx, qword ptr [rbp - 0x20]
0x145b90be1: movzx r14d, byte ptr [rbp - 0x18]
0x145b90be6: lea rcx, [rbp - 0x17]
0x145b90bea: mov eax, dword ptr [rcx]
0x145b90bec: mov ecx, dword ptr [rcx + 3]
0x145b90bef: mov dword ptr [rbp + 0x98], eax
0x145b90bf5: mov dword ptr [rbp + 0x9b], ecx
0x145b90bfb: mov rdx, qword ptr [rbp + 0xa8]
0x145b90c02: test rdx, rdx
0x145b90c05: je 0x145b90c16
0x145b90c07: mov r8d, 1
0x145b90c0d: mov rcx, qword ptr [rbp + 0x48]
0x145b90c11: call 0x1400021d0
0x145b90c16: add r12, 0xb8
0x145b90c1d: inc qword ptr [rbp + 0xa0]
0x145b90c24: mov rdx, qword ptr [rbp + 0x58]
0x145b90c28: test rdx, rdx
0x145b90c2b: je 0x145b90482
0x145b90c31: mov r8d, 1
0x145b90c37: mov rcx, qword ptr [rbp + 0x68]
0x145b90c3b: call 0x1400021d0
0x145b90c40: jmp 0x145b90482
0x145b90c45: mov qword ptr [rsp + 0x20], 1
0x145b90c4e: mov r9d, 1
0x145b90c54: lea rcx, [rbp + 0xd0]
0x145b90c5b: mov rdx, r14
0x145b90c5e: mov r8, rbx
0x145b90c61: call 0x146061b30
0x145b90c66: nop 
0x145b90c67: mov r14, qword ptr [rbp + 0xe0]
0x145b90c6e: jmp 0x145b90793
0x145b90c73: mov qword ptr [rsp + 0x20], 1
0x145b90c7c: mov r9d, 1
0x145b90c82: mov rcx, rsi
0x145b90c85: mov rdx, r14
0x145b90c88: mov r8, rbx
0x145b90c8b: call 0x146061b30
0x145b90c90: nop 
0x145b90c91: mov r14, qword ptr [rbp + 0xc0]
0x145b90c98: jmp 0x145b9089d
0x145b90c9d: mov qword ptr [rsp + 0x20], 1
0x145b90ca6: mov r9d, 1
0x145b90cac: lea rcx, [rbp + 0xd0]
0x145b90cb3: mov rdx, r14
0x145b90cb6: mov r8, rbx
0x145b90cb9: call 0x146061b30
0x145b90cbe: nop 
0x145b90cbf: mov r14, qword ptr [rbp + 0xe0]
0x145b90cc6: jmp 0x145b90948
0x145b90ccb: mov qword ptr [rsp + 0x20], 1
0x145b90cd4: mov r8d, 1
0x145b90cda: mov r9d, 1
0x145b90ce0: mov rcx, r14
0x145b90ce3: mov rdx, rbx
0x145b90ce6: call 0x146061b30
0x145b90ceb: nop 
0x145b90cec: jmp 0x145b90b98
0x145b90cf1: xor ecx, ecx
0x145b90cf3: mov rdx, qword ptr [rbp + 0x68]
0x145b90cf7: call 0x14620896b
0x145b90cfc: nop 
0x145b90cfd: jmp 0x145b910a0
0x145b90d02: mov rdi, qword ptr [rbp + 0x50]
0x145b90d06: mov eax, dword ptr [rdi + 0x30]
0x145b90d09: cmp al, 5
0x145b90d0b: mov esi, 5
0x145b90d10: cmovb esi, eax
0x145b90d13: call 0x140002200
0x145b90d18: mov ecx, 1
0x145b90d1d: mov edx, 1
0x145b90d22: call 0x1400021c0
0x145b90d27: test rax, rax
0x145b90d2a: je 0x145b91089
0x145b90d30: mov byte ptr [rax], 0x7b
0x145b90d33: mov qword ptr [rbp + 0xd0], 1
0x145b90d3e: mov qword ptr [rbp + 0xd8], rax
0x145b90d45: mov qword ptr [rbp + 0xe0], 1
0x145b90d50: mov byte ptr [rbp + 0xe8], 1
0x145b90d57: mov byte ptr [rbp + 0xf7], 1
0x145b90d5e: lea rax, [rip + 0x14ec347]
0x145b90d65: mov qword ptr [rsp + 0x20], rax
0x145b90d6a: mov qword ptr [rsp + 0x28], 5
0x145b90d73: lea r8, [rip + 0x14ec313]
0x145b90d7a: lea rcx, [rbp + 0xb0]
0x145b90d81: lea rdx, [rbp + 0xd0]
0x145b90d88: mov r9d, 4
0x145b90d8e: call 0x145b7eac0
0x145b90d93: nop 
0x145b90d94: mov r8, qword ptr [rbp + 0x90]
0x145b90d9b: mov qword ptr [rbp + 0xd0], r8
0x145b90da2: mov rdx, qword ptr [rbp + 0x60]
0x145b90da6: mov qword ptr [rbp + 0xd8], rdx
0x145b90dad: mov qword ptr [rbp + 0xe0], rbx
0x145b90db4: mov byte ptr [rbp + 0xe8], r14b
0x145b90dbb: mov eax, dword ptr [rbp + 0x98]
0x145b90dc1: mov ecx, dword ptr [rbp + 0x9b]
0x145b90dc7: mov dword ptr [rbp + 0xe9], eax
0x145b90dcd: mov dword ptr [rbp + 0xec], ecx
0x145b90dd3: mov rax, rdx
0x145b90dd6: cmp r8, rbx
0x145b90dd9: je 0x145b90ff9
0x145b90ddf: mov byte ptr [rax + rbx], 0x5d
0x145b90de3: inc rbx
0x145b90de6: mov qword ptr [rbp + 0x80], rbx
0x145b90ded: mov rax, qword ptr [rbp + 0xd0]
0x145b90df4: mov qword ptr [rbp + 0x70], rax
0x145b90df8: mov rax, qword ptr [rbp + 0xd8]
0x145b90dff: mov qword ptr [rbp + 0x78], rax
0x145b90e03: mov byte ptr [rbp + 0xf3], 0
0x145b90e0a: lea rax, [rbp + 0x70]
0x145b90e0e: mov qword ptr [rsp + 0x20], rax
0x145b90e13: lea r8, [rip + 0x14ec297]
0x145b90e1a: lea rcx, [rbp + 0xd0]
0x145b90e21: lea rdx, [rbp + 0xb0]
0x145b90e28: mov r9d, 7
0x145b90e2e: call 0x145b7e980
0x145b90e33: nop 
0x145b90e34: mov rcx, qword ptr [rdi + 0x20]
0x145b90e38: mov rdx, qword ptr [rdi + 0x28]
0x145b90e3c: call 0x145b05300
0x145b90e41: imul rbx, rax, 0xf0
0x145b90e48: lea rdi, [rip + 0x14a9761]
0x145b90e4f: lea rax, [rbx + rdi]
0x145b90e53: add rax, 8
0x145b90e57: mov qword ptr [rbp + 0x70], rax
0x145b90e5b: lea rax, [rip - 0x5b8eda2]
0x145b90e62: mov qword ptr [rbp + 0x78], rax
0x145b90e66: mov byte ptr [rbp + 0xf6], 1
0x145b90e6d: lea rdx, [rip + 0x149d8e2]
0x145b90e74: lea rcx, [rbp + 0xb0]
0x145b90e7b: lea r8, [rbp + 0x70]
0x145b90e7f: call 0x146034470
0x145b90e84: nop 
0x145b90e85: add rdi, rbx
0x145b90e88: mov rcx, qword ptr [rbp + 0xb8]
0x145b90e8f: mov rdx, qword ptr [rbp + 0xc0]
0x145b90e96: mov r14, qword ptr [rdi + 0x18]
0x145b90e9a: mov r15, qword ptr [rdi + 0x20]
0x145b90e9e: mov qword ptr [rbp + 0xa0], rcx
0x145b90ea5: call 0x145be82d0
0x145b90eaa: nop 
0x145b90eab: mov rbx, rax
0x145b90eae: mov rdi, rdx
0x145b90eb1: mov rdx, qword ptr [rbp + 0xb0]
0x145b90eb8: test rdx, rdx
0x145b90ebb: je 0x145b90ecf
0x145b90ebd: mov r8d, 1
0x145b90ec3: mov rcx, qword ptr [rbp + 0xa0]
0x145b90eca: call 0x1400021d0
0x145b90ecf: test rbx, rbx
0x145b90ed2: cmovne r14, rbx
0x145b90ed6: cmove rdi, r15
0x145b90eda: mov byte ptr [rbp + 0xf6], 0
0x145b90ee1: mov qword ptr [rsp + 0x28], rdi
0x145b90ee6: mov qword ptr [rsp + 0x20], r14
0x145b90eeb: lea r8, [rip + 0x14ec1c6]
0x145b90ef2: lea rcx, [rbp + 0xb0]
0x145b90ef9: lea rdx, [rbp + 0xd0]
0x145b90f00: mov r9d, 4
0x145b90f06: call 0x145b7eac0
0x145b90f0b: nop 
0x145b90f0c: mov byte ptr [rbp + 0xf7], 0
0x145b90f13: mov byte ptr [rsp + 0x20], sil
0x145b90f18: lea r8, [rip + 0x14ec19d]
0x145b90f1f: lea rcx, [rbp + 0xd0]
0x145b90f26: lea rdx, [rbp + 0xb0]
0x145b90f2d: mov r9d, 6
0x145b90f33: call 0x145b77380
0x145b90f38: nop 
0x145b90f39: lea rcx, [rbp + 0x70]
0x145b90f3d: mov edx, esi
0x145b90f3f: call 0x145b2cdb0
0x145b90f44: nop 
0x145b90f45: mov rcx, qword ptr [rbp + 0x78]
0x145b90f49: mov rax, qword ptr [rbp + 0x80]
0x145b90f50: mov qword ptr [rsp + 0x28], rax
0x145b90f55: mov qword ptr [rbp + 0xa0], rcx
0x145b90f5c: mov qword ptr [rsp + 0x20], rcx
0x145b90f61: lea r8, [rip + 0x14ec15a]
0x145b90f68: lea rcx, [rbp + 0xb0]
0x145b90f6f: lea rdx, [rbp + 0xd0]
0x145b90f76: mov r9d, 0xa
0x145b90f7c: call 0x145b7eac0
0x145b90f81: nop 
0x145b90f82: mov rsi, qword ptr [rbp + 0xc0]
0x145b90f89: cmp qword ptr [rbp + 0xb0], rsi
0x145b90f90: je 0x145b9102e
0x145b90f96: mov rax, qword ptr [rbp + 0xb8]
0x145b90f9d: mov byte ptr [rax + rsi], 0x7d
0x145b90fa1: inc rsi
0x145b90fa4: mov qword ptr [rbp + 0xc0], rsi
0x145b90fab: mov rax, qword ptr [rbp + 0x28]
0x145b90faf: mov qword ptr [rax + 0x10], rsi
0x145b90fb3: mov rsi, rax
0x145b90fb6: movups xmm0, xmmword ptr [rbp + 0xb0]
0x145b90fbd: movups xmmword ptr [rax], xmm0
0x145b90fc0: mov rdx, qword ptr [rbp + 0x70]
0x145b90fc4: test rdx, rdx
0x145b90fc7: je 0x145b90fdb
0x145b90fc9: mov r8d, 1
0x145b90fcf: mov rcx, qword ptr [rbp + 0xa0]
0x145b90fd6: call 0x1400021d0
0x145b90fdb: mov rax, rsi
0x145b90fde: movaps xmm6, xmmword ptr [rbp + 0x100]
0x145b90fe5: add rsp, 0x198
0x145b90fec: pop rbx
0x145b90fed: pop rdi
0x145b90fee: pop rsi
0x145b90fef: pop r12
0x145b90ff1: pop r13
0x145b90ff3: pop r14
0x145b90ff5: pop r15
0x145b90ff7: pop rbp
0x145b90ff8: ret 
0x145b90ff9: mov qword ptr [rsp + 0x20], 1
0x145b91002: lea rcx, [rbp + 0xd0]
0x145b91009: mov r8d, 1
0x145b9100f: mov r9d, 1
0x145b91015: mov rdx, rbx
0x145b91018: call 0x146061b30
0x145b9101d: nop 
0x145b9101e: mov rax, qword ptr [rbp + 0xd8]
0x145b91025: mov rdi, qword ptr [rbp + 0x50]
0x145b91029: jmp 0x145b90ddf
0x145b9102e: mov qword ptr [rsp + 0x20], 1
0x145b91037: lea rcx, [rbp + 0xb0]
0x145b9103e: mov r8d, 1
0x145b91044: mov r9d, 1
0x145b9104a: mov rdx, rsi
0x145b9104d: call 0x146061b30
0x145b91052: nop 
0x145b91053: jmp 0x145b90f96
0x145b91058: mov ecx, 1
0x145b9105d: mov edx, 1
0x145b91062: call 0x14620896b
0x145b91067: nop 
0x145b91068: jmp 0x145b910a0
0x145b9106a: mov ecx, 1
0x145b9106f: mov edx, 1
0x145b91074: call 0x14620896b
0x145b91079: ud2 
0x145b9107b: mov qword ptr [rbp + 0x68], r14
0x145b9107f: mov ecx, 1
0x145b91084: jmp 0x145b90cf3
0x145b91089: mov byte ptr [rbp + 0xf7], 1
0x145b91090: mov ecx, 1
0x145b91095: mov edx, 1
0x145b9109a: call 0x14620896b
0x145b9109f: nop 
0x145b910a0: ud2 
