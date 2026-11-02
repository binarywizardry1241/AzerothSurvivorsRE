0x145b7a4f0: push r15
0x145b7a4f2: push r14
0x145b7a4f4: push r12
0x145b7a4f6: push rsi
0x145b7a4f7: push rdi
0x145b7a4f8: push rbp
0x145b7a4f9: push rbx
0x145b7a4fa: sub rsp, 0x20
0x145b7a4fe: mov rsi, rdx
0x145b7a501: mov rdi, rcx
0x145b7a504: mov rdx, qword ptr [rcx + 8]
0x145b7a508: mov r14, qword ptr [rcx + 0x10]
0x145b7a50c: mov r15, qword ptr [rsi]
0x145b7a50f: mov rbx, qword ptr [rsi + 0x10]
0x145b7a513: mov rax, r15
0x145b7a516: sub rax, rbx
0x145b7a519: cmp rax, 3
0x145b7a51d: jbe 0x145b7a665
0x145b7a523: mov r12, qword ptr [rsi + 8]
0x145b7a527: mov dword ptr [r12 + rbx], r14d
0x145b7a52b: add rbx, 4
0x145b7a52f: mov qword ptr [rsi + 0x10], rbx
0x145b7a533: mov rax, r15
0x145b7a536: sub rax, rbx
0x145b7a539: cmp r14, rax
0x145b7a53c: ja 0x145b7a688
0x145b7a542: test r14, r14
0x145b7a545: je 0x145b7a553
0x145b7a547: lea rcx, [r12 + rbx]
0x145b7a54b: mov r8, r14
0x145b7a54e: call 0x145d145fb
0x145b7a553: add rbx, r14
0x145b7a556: mov qword ptr [rsi + 0x10], rbx
0x145b7a55a: movzx ebp, byte ptr [rdi + 0x49]
0x145b7a55e: cmp rbx, r15
0x145b7a561: jne 0x145b7a56f
0x145b7a563: mov rcx, rsi
0x145b7a566: call 0x145eb6ec0
0x145b7a56b: mov r12, qword ptr [rsi + 8]
0x145b7a56f: mov byte ptr [r12 + rbx], bpl
0x145b7a573: inc rbx
0x145b7a576: mov qword ptr [rsi + 0x10], rbx
0x145b7a57a: mov rdx, qword ptr [rdi + 0x20]
0x145b7a57e: mov r14, qword ptr [rdi + 0x28]
0x145b7a582: mov rax, qword ptr [rsi]
0x145b7a585: mov rcx, rax
0x145b7a588: sub rcx, rbx
0x145b7a58b: cmp rcx, 3
0x145b7a58f: jbe 0x145b7a6ac
0x145b7a595: mov rcx, qword ptr [rsi + 8]
0x145b7a599: mov dword ptr [rcx + rbx], r14d
0x145b7a59d: add rbx, 4
0x145b7a5a1: mov qword ptr [rsi + 0x10], rbx
0x145b7a5a5: sub rax, rbx
0x145b7a5a8: cmp r14, rax
0x145b7a5ab: ja 0x145b7a6cf
0x145b7a5b1: test r14, r14
0x145b7a5b4: je 0x145b7a5c1
0x145b7a5b6: add rcx, rbx
0x145b7a5b9: mov r8, r14
0x145b7a5bc: call 0x145d145fb
0x145b7a5c1: add rbx, r14
0x145b7a5c4: mov qword ptr [rsi + 0x10], rbx
0x145b7a5c8: movzx ebp, byte ptr [rdi + 0x48]
0x145b7a5cc: cmp rbx, qword ptr [rsi]
0x145b7a5cf: jne 0x145b7a5d9
0x145b7a5d1: mov rcx, rsi
0x145b7a5d4: call 0x145eb6ec0
0x145b7a5d9: mov rax, qword ptr [rsi + 8]
0x145b7a5dd: mov byte ptr [rax + rbx], bpl
0x145b7a5e1: inc rbx
0x145b7a5e4: mov qword ptr [rsi + 0x10], rbx
0x145b7a5e8: mov rdx, qword ptr [rdi + 0x38]
0x145b7a5ec: mov r14, qword ptr [rdi + 0x40]
0x145b7a5f0: mov rax, qword ptr [rsi]
0x145b7a5f3: mov rcx, rax
0x145b7a5f6: sub rcx, rbx
0x145b7a5f9: cmp rcx, 3
0x145b7a5fd: jbe 0x145b7a6f0
0x145b7a603: mov rcx, qword ptr [rsi + 8]
0x145b7a607: mov dword ptr [rcx + rbx], r14d
0x145b7a60b: add rbx, 4
0x145b7a60f: mov qword ptr [rsi + 0x10], rbx
0x145b7a613: sub rax, rbx
0x145b7a616: cmp r14, rax
0x145b7a619: ja 0x145b7a713
0x145b7a61f: test r14, r14
0x145b7a622: je 0x145b7a62f
0x145b7a624: add rcx, rbx
0x145b7a627: mov r8, r14
0x145b7a62a: call 0x145d145fb
0x145b7a62f: add rbx, r14
0x145b7a632: mov qword ptr [rsi + 0x10], rbx
0x145b7a636: movzx edi, byte ptr [rdi + 0x4a]
0x145b7a63a: cmp rbx, qword ptr [rsi]
0x145b7a63d: jne 0x145b7a647
0x145b7a63f: mov rcx, rsi
0x145b7a642: call 0x145eb6ec0
0x145b7a647: mov rax, qword ptr [rsi + 8]
0x145b7a64b: mov byte ptr [rax + rbx], dil
0x145b7a64f: inc rbx
0x145b7a652: mov qword ptr [rsi + 0x10], rbx
0x145b7a656: add rsp, 0x20
0x145b7a65a: pop rbx
0x145b7a65b: pop rbp
0x145b7a65c: pop rdi
0x145b7a65d: pop rsi
0x145b7a65e: pop r12
0x145b7a660: pop r14
0x145b7a662: pop r15
0x145b7a664: ret
0x145b7a665: mov r8d, 4
0x145b7a66b: mov rcx, rsi
0x145b7a66e: mov r15, rdx
0x145b7a671: mov rdx, rbx
0x145b7a674: call 0x145e9e020
0x145b7a679: mov rdx, r15
0x145b7a67c: mov r15, qword ptr [rsi]
0x145b7a67f: mov rbx, qword ptr [rsi + 0x10]
0x145b7a683: jmp 0x145b7a523
0x145b7a688: mov rcx, rsi
0x145b7a68b: mov r15, rdx
0x145b7a68e: mov rdx, rbx
0x145b7a691: mov r8, r14
0x145b7a694: call 0x145e9e020
0x145b7a699: mov rdx, r15
0x145b7a69c: mov rbx, qword ptr [rsi + 0x10]
0x145b7a6a0: mov r15, qword ptr [rsi]
0x145b7a6a3: mov r12, qword ptr [rsi + 8]
0x145b7a6a7: jmp 0x145b7a547
0x145b7a6ac: mov r8d, 4
0x145b7a6b2: mov rcx, rsi
0x145b7a6b5: mov r15, rdx
0x145b7a6b8: mov rdx, rbx
0x145b7a6bb: call 0x145e9e020
0x145b7a6c0: mov rdx, r15
0x145b7a6c3: mov rax, qword ptr [rsi]
0x145b7a6c6: mov rbx, qword ptr [rsi + 0x10]
0x145b7a6ca: jmp 0x145b7a595
0x145b7a6cf: mov rcx, rsi
0x145b7a6d2: mov r15, rdx
0x145b7a6d5: mov rdx, rbx
0x145b7a6d8: mov r8, r14
0x145b7a6db: call 0x145e9e020
0x145b7a6e0: mov rdx, r15
0x145b7a6e3: mov rcx, qword ptr [rsi + 8]
0x145b7a6e7: mov rbx, qword ptr [rsi + 0x10]
0x145b7a6eb: jmp 0x145b7a5b6
0x145b7a6f0: mov r8d, 4
0x145b7a6f6: mov rcx, rsi
0x145b7a6f9: mov r15, rdx
0x145b7a6fc: mov rdx, rbx
0x145b7a6ff: call 0x145e9e020
0x145b7a704: mov rdx, r15
0x145b7a707: mov rax, qword ptr [rsi]
0x145b7a70a: mov rbx, qword ptr [rsi + 0x10]
0x145b7a70e: jmp 0x145b7a603
0x145b7a713: mov rcx, rsi
0x145b7a716: mov r15, rdx
0x145b7a719: mov rdx, rbx
0x145b7a71c: mov r8, r14
0x145b7a71f: call 0x145e9e020
0x145b7a724: mov rdx, r15
0x145b7a727: mov rcx, qword ptr [rsi + 8]
0x145b7a72b: mov rbx, qword ptr [rsi + 0x10]
0x145b7a72f: jmp 0x145b7a624
