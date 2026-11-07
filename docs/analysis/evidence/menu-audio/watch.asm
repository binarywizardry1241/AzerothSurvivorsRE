;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x14097b520..0x14097b98e SHA256 bc76b48d9d285f20171e4c25523961da657fbdfa925b981d02e2c86d3cabc4fb
0x14097b520: push rbp
0x14097b521: push r15
0x14097b523: push r14
0x14097b525: push r12
0x14097b527: push rsi
0x14097b528: push rdi
0x14097b529: push rbx
0x14097b52a: sub rsp, 0x90
0x14097b531: lea rbp, [rsp + 0x80]
0x14097b539: mov qword ptr [rbp + 8], 0xfffffffffffffffe
0x14097b541: mov rax, qword ptr [rbp + 0x78]
0x14097b545: mov rcx, qword ptr [rbp + 0x70]
0x14097b549: mov r12, qword ptr [rdx]
0x14097b54c: mov r10, qword ptr [rdx + 0x10]
0x14097b550: mov edx, dword ptr [rdx + 0x1c]
0x14097b553: mov r14, qword ptr [r8]
0x14097b556: mov rsi, qword ptr [r9]
0x14097b559: mov rdi, qword ptr [rcx]
0x14097b55c: mov r8, qword ptr [rcx + 0x10]
0x14097b560: mov ecx, dword ptr [rcx + 0x1c]
0x14097b563: mov rbx, qword ptr [rax]
0x14097b566: mov dword ptr [r10], edx
0x14097b569: mov dword ptr [r8], ecx
0x14097b56c: mov r15, qword ptr [r12 + 0x130]
0x14097b574: test r15, r15
0x14097b577: je 0x14097b65b
0x14097b57d: lea rcx, [r15 + 0x10]
0x14097b581: call 0x14152b5a0
0x14097b586: cmp al, 6
0x14097b588: jne 0x14097b66f
0x14097b58e: mov qword ptr [rbp], r12
0x14097b592: lea rax, [r12 + 0x130]
0x14097b59a: mov qword ptr [rbp - 8], rax
0x14097b59e: lock dec qword ptr [r15]
0x14097b5a2: jne 0x14097b5ae
0x14097b5a4: mov rcx, qword ptr [rbp - 8]
0x14097b5a8: call 0x140db7f40
0x14097b5ad: nop
0x14097b5ae: mov rax, qword ptr [rbp]
0x14097b5b2: lea rcx, [rax + 0x138]
0x14097b5b9: call 0x140925710
0x14097b5be: nop
0x14097b5bf: mov r12, qword ptr [rbp]
0x14097b5c3: mov rax, qword ptr [r12 + 0x1e0]
0x14097b5cb: lock dec qword ptr [rax]
0x14097b5cf: jne 0x14097b5df
0x14097b5d1: lea rcx, [r12 + 0x1e0]
0x14097b5d9: call 0x140db5c90
0x14097b5de: nop
0x14097b5df: mov qword ptr [r12 + 0x130], 0
0x14097b5eb: cmp dword ptr [r12], 1
0x14097b5f0: jne 0x14097b65b
0x14097b5f2: mov r8, qword ptr [r12 + 8]
0x14097b5f7: lea rcx, [r8 + 1]
0x14097b5fb: movabs rdx, 0x2492492492492493
0x14097b605: mov rax, rcx
0x14097b608: mul rdx
0x14097b60b: sub rcx, rdx
0x14097b60e: shr rcx, 1
0x14097b611: add rcx, rdx
0x14097b614: shr rcx, 2
0x14097b618: lea rax, [rcx*8]
0x14097b620: sub rcx, rax
0x14097b623: lea rax, [r8 + rcx]
0x14097b627: inc rax
0x14097b62a: mov qword ptr [r12], 1
0x14097b632: mov qword ptr [r12 + 8], rax
0x14097b637: shl eax, 4
0x14097b63a: lea rcx, [rip + 0x555c8d7]
0x14097b641: movups xmm0, xmmword ptr [rax + rcx]
0x14097b645: movups xmmword ptr [rsp + 0x20], xmm0
0x14097b64a: mov rcx, r12
0x14097b64d: mov rdx, rdi
0x14097b650: mov r8, rbx
0x14097b653: mov r9, rsi
0x14097b656: call 0x140941700
0x14097b65b: cmp byte ptr [r12 + 0x1f8], 0
0x14097b664: je 0x14097b736
0x14097b66a: jmp 0x14097b7ed
0x14097b66f: movzx eax, byte ptr [rsi + 0x12]
0x14097b673: test byte ptr [rsi + 0x10], al
0x14097b676: jne 0x14097b692
0x14097b678: xorps xmm0, xmm0
0x14097b67b: movss xmm1, dword ptr [rip + 0x54696d1]
0x14097b683: ucomiss xmm1, xmm0
0x14097b686: jb 0x14097b6a4
0x14097b688: movss xmm0, dword ptr [rip + 0x55552c0]
0x14097b690: jmp 0x14097b6b1
0x14097b692: movss xmm0, dword ptr [rsi + 8]
0x14097b697: movss xmm1, dword ptr [rip + 0x54696b5]
0x14097b69f: ucomiss xmm1, xmm0
0x14097b6a2: jae 0x14097b688
0x14097b6a4: call 0x145bfa16b
0x14097b6a9: mulss xmm0, dword ptr [rip + 0x5421b6f]
0x14097b6b1: movzx ecx, byte ptr [r12 + 0x140]
0x14097b6ba: cmp rcx, 3
0x14097b6be: jae 0x14097b97b
0x14097b6c4: mov rax, qword ptr [r12 + 0x138]
0x14097b6cc: mov edx, ecx
0x14097b6ce: shl edx, 7
0x14097b6d1: mov qword ptr [rax + rdx + 0x80], 0
0x14097b6dd: mov dword ptr [rax + rdx + 0xa8], 0
0x14097b6e8: mov qword ptr [rax + rdx + 0xb8], 0
0x14097b6f4: mov dword ptr [rax + rdx + 0xc0], 0xe4e1c0
0x14097b6ff: mov dword ptr [rax + rdx + 0xc8], 7
0x14097b70a: movss dword ptr [rax + rdx + 0xcc], xmm0
0x14097b713: or cl, 4
0x14097b716: xchg byte ptr [rax + 0x200], cl
0x14097b71c: and cl, 3
0x14097b71f: mov byte ptr [r12 + 0x140], cl
0x14097b727: cmp byte ptr [r12 + 0x1f8], 0
0x14097b730: jne 0x14097b7ed
0x14097b736: cmp qword ptr [r12 + 0x68], 0
0x14097b73c: je 0x14097b7ed
0x14097b742: movss xmm0, dword ptr [rip + 0x5555206]
0x14097b74a: cmp byte ptr [rsi + 0x10], 1
0x14097b74e: jne 0x14097b780
0x14097b750: cmp byte ptr [rsi + 0x12], 1
0x14097b754: jne 0x14097b780
0x14097b756: movss xmm1, dword ptr [rsi + 8]
0x14097b75b: mulss xmm1, dword ptr [rip + 0x54695cd]
0x14097b763: movss xmm2, dword ptr [rip + 0x54695e9]
0x14097b76b: ucomiss xmm2, xmm1
0x14097b76e: jae 0x14097b780
0x14097b770: movaps xmm0, xmm1
0x14097b773: call 0x145bfa16b
0x14097b778: mulss xmm0, dword ptr [rip + 0x5421aa0]
0x14097b780: movzx ecx, byte ptr [r12 + 0x78]
0x14097b786: cmp rcx, 3
0x14097b78a: jae 0x14097b97b
0x14097b790: mov rax, qword ptr [r12 + 0x70]
0x14097b795: mov edx, ecx
0x14097b797: shl edx, 7
0x14097b79a: mov qword ptr [rax + rdx + 0x80], 0
0x14097b7a6: mov dword ptr [rax + rdx + 0xa8], 0
0x14097b7b1: mov qword ptr [rax + rdx + 0xb8], 0
0x14097b7bd: mov dword ptr [rax + rdx + 0xc0], 0xe4e1c0
0x14097b7c8: mov dword ptr [rax + rdx + 0xc8], 7
0x14097b7d3: movss dword ptr [rax + rdx + 0xcc], xmm0
0x14097b7dc: or cl, 4
0x14097b7df: xchg byte ptr [rax + 0x200], cl
0x14097b7e5: and cl, 3
0x14097b7e8: mov byte ptr [r12 + 0x78], cl
0x14097b7ed: mov rcx, qword ptr [r12 + 0x68]
0x14097b7f2: test rcx, rcx
0x14097b7f5: je 0x14097b94e
0x14097b7fb: lea rsi, [r12 + 0x68]
0x14097b800: add rcx, 0x10
0x14097b804: call 0x14152b5a0
0x14097b809: cmp al, 6
0x14097b80b: jne 0x14097b8a7
0x14097b811: mov rax, qword ptr [rip + 0x7701790]
0x14097b818: mov rax, qword ptr [rax]
0x14097b81b: cmp rax, 2
0x14097b81f: ja 0x14097b8df
0x14097b825: movzx edx, byte ptr [rip + 0x76c99ec]
0x14097b82c: movzx eax, dl
0x14097b82f: lea ecx, [rax - 1]
0x14097b832: cmp ecx, 2
0x14097b835: jae 0x14097b8d7
0x14097b83b: mov rcx, qword ptr [rip + 0x76c99c6]
0x14097b842: call 0x144c5d8d0
0x14097b847: test al, al
0x14097b849: je 0x14097b8df
0x14097b84f: mov rcx, qword ptr [rip + 0x76c99b2]
0x14097b856: lea rax, [rcx + 0x30]
0x14097b85a: lea rdx, [rip + 0x555c727]
0x14097b861: mov qword ptr [rbp - 0x28], rdx
0x14097b865: mov qword ptr [rbp - 0x20], 0x31
0x14097b86d: lea rdx, [rbp - 0x28]
0x14097b871: mov qword ptr [rbp - 0x18], rdx
0x14097b875: lea rdx, [rip + 0x5558124]
0x14097b87c: mov qword ptr [rbp - 0x10], rdx
0x14097b880: mov qword ptr [rbp - 0x48], 1
0x14097b888: lea rdx, [rbp - 0x18]
0x14097b88c: mov qword ptr [rbp - 0x40], rdx
0x14097b890: mov qword ptr [rbp - 0x38], 1
0x14097b898: mov qword ptr [rbp - 0x30], rax
0x14097b89c: lea rdx, [rbp - 0x48]
0x14097b8a0: call 0x144c5f0f0
0x14097b8a5: jmp 0x14097b8df
0x14097b8a7: movss xmm0, dword ptr [r14 + 0x88]
0x14097b8b0: xorps xmm2, xmm2
0x14097b8b3: cvtss2sd xmm2, xmm0
0x14097b8b7: add r12, 0x28
0x14097b8bb: mov rcx, r12
0x14097b8be: mov rdx, rsi
0x14097b8c1: add rsp, 0x90
0x14097b8c8: pop rbx
0x14097b8c9: pop rdi
0x14097b8ca: pop rsi
0x14097b8cb: pop r12
0x14097b8cd: pop r14
0x14097b8cf: pop r15
0x14097b8d1: pop rbp
0x14097b8d2: jmp 0x1409399f0
0x14097b8d7: test eax, eax
0x14097b8d9: jne 0x14097b960
0x14097b8df: mov qword ptr [rbp - 8], rsi
0x14097b8e3: mov rax, qword ptr [rsi]
0x14097b8e6: test rax, rax
0x14097b8e9: je 0x14097b92d
0x14097b8eb: mov qword ptr [rbp], r12
0x14097b8ef: lock dec qword ptr [rax]
0x14097b8f3: jne 0x14097b8ff
0x14097b8f5: mov rcx, qword ptr [rbp - 8]
0x14097b8f9: call 0x140db7f40
0x14097b8fe: nop
0x14097b8ff: mov rax, qword ptr [rbp]
0x14097b903: lea rcx, [rax + 0x70]
0x14097b907: call 0x140925710
0x14097b90c: nop
0x14097b90d: mov r12, qword ptr [rbp]
0x14097b911: mov rax, qword ptr [r12 + 0x118]
0x14097b919: lock dec qword ptr [rax]
0x14097b91d: jne 0x14097b92d
0x14097b91f: lea rcx, [r12 + 0x118]
0x14097b927: call 0x140db5c90
0x14097b92c: nop
0x14097b92d: mov byte ptr [r12 + 0x1f8], 0
0x14097b936: mov byte ptr [r12 + 0x28], 0
0x14097b93c: xorps xmm0, xmm0
0x14097b93f: movups xmmword ptr [r12 + 0x58], xmm0
0x14097b945: mov qword ptr [r12 + 0x68], 0
0x14097b94e: add rsp, 0x90
0x14097b955: pop rbx
0x14097b956: pop rdi
0x14097b957: pop rsi
0x14097b958: pop r12
0x14097b95a: pop r14
0x14097b95c: pop r15
0x14097b95e: pop rbp
0x14097b95f: ret
0x14097b960: lea rcx, [rip + 0x76c98a1]
0x14097b967: call 0x145d45220
0x14097b96c: mov edx, eax
0x14097b96e: test al, al
0x14097b970: jne 0x14097b83b
0x14097b976: jmp 0x14097b8df
0x14097b97b: lea r8, [rip + 0x555ac8e]
0x14097b982: mov edx, 3
0x14097b987: call 0x145d99653
0x14097b98c: ud2
