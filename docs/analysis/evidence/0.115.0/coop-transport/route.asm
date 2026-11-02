0x14584a210: push rbp
0x14584a211: push r15
0x14584a213: push r14
0x14584a215: push r13
0x14584a217: push r12
0x14584a219: push rsi
0x14584a21a: push rdi
0x14584a21b: push rbx
0x14584a21c: sub rsp, 0xc8
0x14584a223: lea rbp, [rsp + 0x80]
0x14584a22b: mov qword ptr [rbp + 0x40], 0xfffffffffffffffe
0x14584a233: cmp r8, 9
0x14584a237: jb 0x14584a254
0x14584a239: movabs rax, 0x3a2265707974227b
0x14584a243: xor rax, qword ptr [rdx]
0x14584a246: movzx r9d, byte ptr [rdx + 8]
0x14584a24b: xor r9, 0x22
0x14584a24f: or r9, rax
0x14584a252: je 0x14584a272
0x14584a254: mov qword ptr [rcx], 0xffffffffffffffff
0x14584a25b: mov rax, rcx
0x14584a25e: add rsp, 0xc8
0x14584a265: pop rbx
0x14584a266: pop rdi
0x14584a267: pop rsi
0x14584a268: pop r12
0x14584a26a: pop r13
0x14584a26c: pop r14
0x14584a26e: pop r15
0x14584a270: pop rbp
0x14584a271: ret
0x14584a272: mov rsi, rcx
0x14584a275: mov rdi, r8
0x14584a278: lea rax, [r8 - 9]
0x14584a27c: mov rbx, rdx
0x14584a27f: lea r14, [rdx + 9]
0x14584a283: mov qword ptr [rbp - 0x50], 0
0x14584a28b: mov qword ptr [rbp - 0x48], rax
0x14584a28f: lea rdx, [rbp - 0x40]
0x14584a293: mov qword ptr [rbp - 0x40], r14
0x14584a297: mov qword ptr [rbp - 0x38], rax
0x14584a29b: mov qword ptr [rbp - 0x30], 0
0x14584a2a3: mov qword ptr [rbp - 0x28], rax
0x14584a2a7: movabs rax, 0x2200000022
0x14584a2b1: mov qword ptr [rbp - 0x20], rax
0x14584a2b5: mov byte ptr [rbp - 0x18], 1
0x14584a2b9: mov word ptr [rbp - 0x10], 1
0x14584a2bf: lea rcx, [rbp + 0x20]
0x14584a2c3: call 0x14584d560
0x14584a2c8: cmp dword ptr [rbp + 0x20], 1
0x14584a2cc: jne 0x14584a311
0x14584a2ce: mov rax, qword ptr [rbp + 0x28]
0x14584a2d2: mov rcx, qword ptr [rbp - 0x50]
0x14584a2d6: sub rax, rcx
0x14584a2d9: add r14, rcx
0x14584a2dc: mov rcx, rsi
0x14584a2df: add rax, -2
0x14584a2e3: cmp rax, 4
0x14584a2e7: ja 0x14584a254
0x14584a2ed: mov r9, rdi
0x14584a2f0: mov r15, rbx
0x14584a2f3: lea rdx, [rip + 0x17c1e2a]
0x14584a2fa: movsxd rax, dword ptr [rdx + rax*4]
0x14584a2fe: add rax, rdx
0x14584a301: jmp rax
0x14584a303: cmp word ptr [r14], 0x7a68
0x14584a309: jne 0x14584a254
0x14584a30f: jmp 0x14584a363
0x14584a311: cmp byte ptr [rbp - 0xf], 0
0x14584a315: jne 0x14584a41b
0x14584a31b: mov r14, qword ptr [rbp - 0x50]
0x14584a31f: mov rax, qword ptr [rbp - 0x48]
0x14584a323: sub rax, r14
0x14584a326: setne cl
0x14584a329: or cl, byte ptr [rbp - 0x10]
0x14584a32c: cmp cl, 1
0x14584a32f: jne 0x14584a41b
0x14584a335: add r14, qword ptr [rbp - 0x40]
0x14584a339: mov rcx, rsi
0x14584a33c: add rax, -2
0x14584a340: cmp rax, 4
0x14584a344: jbe 0x14584a2ed
0x14584a346: jmp 0x14584a254
0x14584a34b: mov eax, 0x6e657a68
0x14584a350: xor eax, dword ptr [r14]
0x14584a353: movzx edx, byte ptr [r14 + 4]
0x14584a358: xor edx, 0x64
0x14584a35b: or edx, eax
0x14584a35d: jne 0x14584a254
0x14584a363: mov r14, r9
0x14584a366: call 0x140002200
0x14584a36b: mov edx, 1
0x14584a370: mov rcx, r14
0x14584a373: call 0x1400021c0
0x14584a378: test rax, rax
0x14584a37b: je 0x14584a67e
0x14584a381: mov r14, rax
0x14584a384: mov rcx, rax
0x14584a387: mov rdx, rbx
0x14584a38a: mov r8, rdi
0x14584a38d: call 0x145d145fb
0x14584a392: mov rcx, rsi
0x14584a395: mov qword ptr [rsi], rdi
0x14584a398: mov qword ptr [rsi + 8], r14
0x14584a39c: mov qword ptr [rsi + 0x10], rdi
0x14584a3a0: jmp 0x14584a25b
0x14584a3a5: movzx eax, word ptr [r14]
0x14584a3a9: xor eax, 0x7a68
0x14584a3ae: movzx edx, byte ptr [r14 + 2]
0x14584a3b3: xor edx, 0x74
0x14584a3b6: or dx, ax
0x14584a3b9: jne 0x14584a254
0x14584a3bf: lea rcx, [rip + 0x17c170a]
0x14584a3c6: mov edx, 4
0x14584a3cb: mov r8, r15
0x14584a3ce: call 0x14584d7b0
0x14584a3d3: test al, al
0x14584a3d5: je 0x14584a41b
0x14584a3d7: mov qword ptr [rsp + 0x20], 6
0x14584a3e0: lea r9, [rip + 0x17c16ed]
0x14584a3e7: lea r15, [rbp - 0x50]
0x14584a3eb: mov rcx, r15
0x14584a3ee: mov rdx, rbx
0x14584a3f1: mov r8, rdi
0x14584a3f4: call 0x145cee4f0
0x14584a3f9: lea r14, [rbp + 0x20]
0x14584a3fd: mov rcx, r14
0x14584a400: mov rdx, r15
0x14584a403: call 0x14584dc40
0x14584a408: cmp byte ptr [rbp + 0x20], 0
0x14584a40c: je 0x14584a619
0x14584a412: mov r9, qword ptr [rbp + 0x28]
0x14584a416: jmp 0x14584a61d
0x14584a41b: mov rcx, rsi
0x14584a41e: mov qword ptr [rsi], 0xffffffffffffffff
0x14584a425: jmp 0x14584a25b
0x14584a42a: mov eax, 0x6e6e6162
0x14584a42f: xor eax, dword ptr [r14]
0x14584a432: movzx edx, word ptr [r14 + 4]
0x14584a437: xor edx, 0x7265
0x14584a43d: or edx, eax
0x14584a43f: jne 0x14584a254
0x14584a445: lea rax, [rip + 0x17c1644]
0x14584a44c: mov qword ptr [rbp + 0x38], rax
0x14584a450: lea rax, [rbp + 0x38]
0x14584a454: mov qword ptr [rbp + 0x20], rax
0x14584a458: lea r13, [rip - 0x4bb92bf]
0x14584a45f: mov qword ptr [rbp + 0x28], r13
0x14584a463: lea rdx, [rip + 0x14824e6]
0x14584a46a: lea rcx, [rbp - 0x50]
0x14584a46e: lea r8, [rbp + 0x20]
0x14584a472: mov r12, r9
0x14584a475: call 0x145ce7350
0x14584a47a: mov r14, qword ptr [rbp - 0x48]
0x14584a47e: mov rdx, qword ptr [rbp - 0x40]
0x14584a482: mov qword ptr [rbp + 0x18], r14
0x14584a486: mov rcx, r14
0x14584a489: mov r8, r15
0x14584a48c: mov r9, r12
0x14584a48f: call 0x14584d7b0
0x14584a494: nop
0x14584a495: mov r15d, eax
0x14584a498: mov rdx, qword ptr [rbp - 0x50]
0x14584a49c: test rdx, rdx
0x14584a49f: je 0x14584a4af
0x14584a4a1: mov r8d, 1
0x14584a4a7: mov rcx, r14
0x14584a4aa: call 0x1400021d0
0x14584a4af: test r15b, r15b
0x14584a4b2: mov r14, rdi
0x14584a4b5: jne 0x14584a366
0x14584a4bb: mov r15, rbx
0x14584a4be: lea rax, [rip + 0x17c15db]
0x14584a4c5: mov qword ptr [rbp + 0x38], rax
0x14584a4c9: lea rax, [rbp + 0x38]
0x14584a4cd: mov qword ptr [rbp + 0x20], rax
0x14584a4d1: mov qword ptr [rbp + 0x28], r13
0x14584a4d5: lea rdx, [rip + 0x1482474]
0x14584a4dc: lea rcx, [rbp - 0x50]
0x14584a4e0: lea r8, [rbp + 0x20]
0x14584a4e4: mov r12, r14
0x14584a4e7: call 0x145ce7350
0x14584a4ec: mov r14, qword ptr [rbp - 0x48]
0x14584a4f0: mov rdx, qword ptr [rbp - 0x40]
0x14584a4f4: mov qword ptr [rbp + 0x18], r14
0x14584a4f8: mov rcx, r14
0x14584a4fb: mov r8, rbx
0x14584a4fe: mov r9, r12
0x14584a501: call 0x14584d7b0
0x14584a506: nop
0x14584a507: mov r15d, eax
0x14584a50a: mov rdx, qword ptr [rbp - 0x50]
0x14584a50e: test rdx, rdx
0x14584a511: je 0x14584a521
0x14584a513: mov r8d, 1
0x14584a519: mov rcx, r14
0x14584a51c: call 0x1400021d0
0x14584a521: test r15b, r15b
0x14584a524: mov r14, rdi
0x14584a527: jne 0x14584a366
0x14584a52d: mov r15, rbx
0x14584a530: lea rax, [rip + 0x17c1579]
0x14584a537: mov qword ptr [rbp + 0x38], rax
0x14584a53b: lea rax, [rbp + 0x38]
0x14584a53f: mov qword ptr [rbp + 0x20], rax
0x14584a543: mov qword ptr [rbp + 0x28], r13
0x14584a547: lea rdx, [rip + 0x1482402]
0x14584a54e: lea rcx, [rbp - 0x50]
0x14584a552: lea r8, [rbp + 0x20]
0x14584a556: mov r12, r14
0x14584a559: call 0x145ce7350
0x14584a55e: mov r14, qword ptr [rbp - 0x48]
0x14584a562: mov rdx, qword ptr [rbp - 0x40]
0x14584a566: mov qword ptr [rbp + 0x18], r14
0x14584a56a: mov rcx, r14
0x14584a56d: mov r8, rbx
0x14584a570: mov r9, r12
0x14584a573: call 0x14584d7b0
0x14584a578: nop
0x14584a579: mov r15d, eax
0x14584a57c: mov rdx, qword ptr [rbp - 0x50]
0x14584a580: test rdx, rdx
0x14584a583: je 0x14584a593
0x14584a585: mov r8d, 1
0x14584a58b: mov rcx, r14
0x14584a58e: call 0x1400021d0
0x14584a593: test r15b, r15b
0x14584a596: mov r14, rdi
0x14584a599: jne 0x14584a366
0x14584a59f: mov r15, rbx
0x14584a5a2: lea rax, [rip + 0x17c1517]
0x14584a5a9: mov qword ptr [rbp + 0x38], rax
0x14584a5ad: lea rax, [rbp + 0x38]
0x14584a5b1: mov qword ptr [rbp + 0x20], rax
0x14584a5b5: mov qword ptr [rbp + 0x28], r13
0x14584a5b9: lea rdx, [rip + 0x1482390]
0x14584a5c0: lea rcx, [rbp - 0x50]
0x14584a5c4: lea r8, [rbp + 0x20]
0x14584a5c8: mov r12, r14
0x14584a5cb: call 0x145ce7350
0x14584a5d0: mov r14, qword ptr [rbp - 0x48]
0x14584a5d4: mov rdx, qword ptr [rbp - 0x40]
0x14584a5d8: mov qword ptr [rbp + 0x18], r14
0x14584a5dc: mov rcx, r14
0x14584a5df: mov r8, rbx
0x14584a5e2: mov r9, r12
0x14584a5e5: call 0x14584d7b0
0x14584a5ea: nop
0x14584a5eb: mov r15d, eax
0x14584a5ee: mov rdx, qword ptr [rbp - 0x50]
0x14584a5f2: test rdx, rdx
0x14584a5f5: je 0x14584a605
0x14584a5f7: mov r8d, 1
0x14584a5fd: mov rcx, r14
0x14584a600: call 0x1400021d0
0x14584a605: test r15b, r15b
0x14584a608: mov rcx, rsi
0x14584a60b: mov r14, rdi
0x14584a60e: je 0x14584a254
0x14584a614: jmp 0x14584a366
0x14584a619: lea r9, [rdi - 1]
0x14584a61d: test r9, r9
0x14584a620: je 0x14584a64c
0x14584a622: cmp r9, rdi
0x14584a625: jae 0x14584a64a
0x14584a627: cmp byte ptr [rbx + r9], 0xbf
0x14584a62c: jg 0x14584a64c
0x14584a62e: lea rax, [rip + 0x17c14d3]
0x14584a635: mov qword ptr [rsp + 0x20], rax
0x14584a63a: mov rcx, rbx
0x14584a63d: mov rdx, rdi
0x14584a640: xor r8d, r8d
0x14584a643: call 0x145eb71e0
0x14584a648: ud2
0x14584a64a: jne 0x14584a62e
0x14584a64c: mov qword ptr [rbp + 0x20], rbx
0x14584a650: mov qword ptr [rbp + 0x28], r9
0x14584a654: mov qword ptr [rbp - 0x50], r14
0x14584a658: lea rax, [rip - 0x584859f]
0x14584a65f: mov qword ptr [rbp - 0x48], rax
0x14584a663: lea rdx, [rip + 0x17c14b6]
0x14584a66a: lea r8, [rbp - 0x50]
0x14584a66e: mov rcx, rsi
0x14584a671: call 0x145ce7350
0x14584a676: mov rcx, rsi
0x14584a679: jmp 0x14584a25b
0x14584a67e: mov ecx, 1
0x14584a683: mov rdx, rdi
0x14584a686: call 0x145eb6fcb
0x14584a68b: ud2
