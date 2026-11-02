;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1458e6790..0x1458e6878 SHA256 9dd70b19d30e667b0a72a6f692e944b12957bd2d1f9af27d5b117513edb06f4a
0x1458e6790: push rbp
0x1458e6791: push r15
0x1458e6793: push r14
0x1458e6795: push rsi
0x1458e6796: push rdi
0x1458e6797: push rbx
0x1458e6798: sub rsp, 0x58
0x1458e679c: lea rbp, [rsp + 0x50]
0x1458e67a1: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458e67a9: mov rsi, rcx
0x1458e67ac: mov qword ptr [rbp - 8], rdx
0x1458e67b0: mov rcx, rdx
0x1458e67b3: mov rdx, r8
0x1458e67b6: mov r8, r9
0x1458e67b9: call 0x1458eb470
0x1458e67be: nop
0x1458e67bf: movss xmm0, dword ptr [rbp + 0x60]
0x1458e67c4: cvtss2sd xmm1, xmm0
0x1458e67c8: lea rcx, [rbp - 0x28]
0x1458e67cc: call 0x1458edff0
0x1458e67d1: nop
0x1458e67d2: mov r15, qword ptr [rbp - 0x20]
0x1458e67d6: mov rdi, qword ptr [rbp - 0x18]
0x1458e67da: mov r14, qword ptr [rbp - 8]
0x1458e67de: mov rax, qword ptr [r14]
0x1458e67e1: mov rbx, qword ptr [r14 + 0x10]
0x1458e67e5: sub rax, rbx
0x1458e67e8: cmp rdi, rax
0x1458e67eb: ja 0x1458e6849
0x1458e67ed: test rdi, rdi
0x1458e67f0: je 0x1458e6804
0x1458e67f2: mov rcx, qword ptr [r14 + 8]
0x1458e67f6: add rcx, rbx
0x1458e67f9: mov rdx, r15
0x1458e67fc: mov r8, rdi
0x1458e67ff: call 0x145bfa0e7
0x1458e6804: add rbx, rdi
0x1458e6807: mov qword ptr [r14 + 0x10], rbx
0x1458e680b: mov rdx, qword ptr [rbp - 0x28]
0x1458e680f: test rdx, rdx
0x1458e6812: je 0x1458e6822
0x1458e6814: mov r8d, 1
0x1458e681a: mov rcx, r15
0x1458e681d: call 0x1400021d0
0x1458e6822: movups xmm0, xmmword ptr [r14]
0x1458e6826: mov rax, qword ptr [r14 + 0x10]
0x1458e682a: mov qword ptr [rsi + 0x10], rax
0x1458e682e: mov rax, qword ptr [r14 + 0x18]
0x1458e6832: mov qword ptr [rsi + 0x18], rax
0x1458e6836: movups xmmword ptr [rsi], xmm0
0x1458e6839: mov rax, rsi
0x1458e683c: add rsp, 0x58
0x1458e6840: pop rbx
0x1458e6841: pop rdi
0x1458e6842: pop rsi
0x1458e6843: pop r14
0x1458e6845: pop r15
0x1458e6847: pop rbp
0x1458e6848: ret
0x1458e6849: mov qword ptr [rbp - 0x10], r15
0x1458e684d: mov qword ptr [rsp + 0x20], 1
0x1458e6856: mov r9d, 1
0x1458e685c: mov rcx, r14
0x1458e685f: mov rdx, rbx
0x1458e6862: mov r8, rdi
0x1458e6865: call 0x145bfa970
0x1458e686a: nop
0x1458e686b: mov rbx, qword ptr [r14 + 0x10]
0x1458e686f: mov r15, qword ptr [rbp - 0x10]
0x1458e6873: jmp 0x1458e67f2
