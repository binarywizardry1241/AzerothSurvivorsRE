;0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
;0x1409a73f0..0x1409a76b8 SHA256 8a8ca6846a9d0055d3217d0a90d1743f4220d051a694b794eab65ce05b390ba0
0x1409a73f0: push r15
0x1409a73f2: push r14
0x1409a73f4: push rsi
0x1409a73f5: push rdi
0x1409a73f6: push rbp
0x1409a73f7: push rbx
0x1409a73f8: sub rsp, 0x58
0x1409a73fc: mov ebp, 1
0x1409a7401: lock xadd dword ptr [r8 + 0x5b0], ebp
0x1409a740a: cmp byte ptr [rdx + 0x24], 0xff
0x1409a740e: je 0x1409a75de
0x1409a7414: mov r14, r8
0x1409a7417: mov rsi, rdx
0x1409a741a: mov rax, qword ptr [r8 + 0x5a0]
0x1409a7421: mov qword ptr [rsp + 0x38], rax
0x1409a7426: cmp qword ptr [rdx + 8], rax
0x1409a742a: jne 0x1409a75f8
0x1409a7430: mov rax, qword ptr [rsi + 0x10]
0x1409a7434: cmp rax, qword ptr [r14 + 0x260]
0x1409a743b: jae 0x1409a7629
0x1409a7441: mov rdi, rcx
0x1409a7444: mov rcx, qword ptr [r14 + 0x258]
0x1409a744b: mov rax, qword ptr [rcx + rax*8]
0x1409a744f: test rax, rax
0x1409a7452: je 0x1409a7629
0x1409a7458: mov rbx, qword ptr [r14 + 0x228]
0x1409a745f: not rax
0x1409a7462: imul rax, rax, 0x38
0x1409a7466: cmp byte ptr [rbx + rax + 0x30], 0
0x1409a746b: je 0x1409a7629
0x1409a7471: add rbx, rax
0x1409a7474: mov rcx, rbx
0x1409a7477: call 0x14093b720
0x1409a747c: mov rax, qword ptr [rsi + 0x18]
0x1409a7480: cmp rax, qword ptr [r14 + 0x218]
0x1409a7487: jae 0x1409a7667
0x1409a748d: mov rcx, qword ptr [r14 + 0x210]
0x1409a7494: mov rcx, qword ptr [rcx + rax*8]
0x1409a7498: test rcx, rcx
0x1409a749b: je 0x1409a7667
0x1409a74a1: mov rax, qword ptr [r14 + 0x1e0]
0x1409a74a8: not rcx
0x1409a74ab: imul rcx, rcx, 0x38
0x1409a74af: cmp byte ptr [rax + rcx + 0x30], 0
0x1409a74b4: je 0x1409a7667
0x1409a74ba: add rax, rcx
0x1409a74bd: mov rcx, qword ptr [rax + 0x10]
0x1409a74c1: cmp byte ptr [rcx + 0x10], 1
0x1409a74c5: jne 0x1409a74cf
0x1409a74c7: movzx eax, byte ptr [rcx + 0x11]
0x1409a74cb: xor al, 1
0x1409a74cd: jmp 0x1409a74d1
0x1409a74cf: xor eax, eax
0x1409a74d1: mov r14, qword ptr [rbx + 0x10]
0x1409a74d5: movss xmm0, dword ptr [rcx]
0x1409a74d9: movzx r15d, byte ptr [rcx + 0x19]
0x1409a74de: movzx ecx, byte ptr [rsi + 0x24]
0x1409a74e2: cmp cl, 2
0x1409a74e5: jne 0x1409a7523
0x1409a74e7: movss dword ptr [rsi + 0x20], xmm0
0x1409a74ec: mov byte ptr [rsi + 0x24], al
0x1409a74ef: mov byte ptr [rsi + 0x25], r15b
0x1409a74f3: mov dword ptr [rbx + 0x2c], ebp
0x1409a74f6: cmp dword ptr [r14], 2
0x1409a74fa: je 0x1409a75c5
0x1409a7500: test al, al
0x1409a7502: jne 0x1409a7507
0x1409a7504: xorps xmm0, xmm0
0x1409a7507: movss xmm1, dword ptr [rip + 0x543d845]
0x1409a750f: ucomiss xmm1, xmm0
0x1409a7512: jae 0x1409a753f
0x1409a7514: call 0x145bfa16b
0x1409a7519: mulss xmm0, dword ptr [rip + 0x53f5cff]
0x1409a7521: jmp 0x1409a7547
0x1409a7523: cmp cl, al
0x1409a7525: jne 0x1409a74e7
0x1409a7527: movss xmm1, dword ptr [rsi + 0x20]
0x1409a752c: ucomiss xmm1, xmm0
0x1409a752f: jne 0x1409a74e7
0x1409a7531: jp 0x1409a74e7
0x1409a7533: cmp byte ptr [rsi + 0x25], r15b
0x1409a7537: je 0x1409a75c5
0x1409a753d: jmp 0x1409a74e7
0x1409a753f: movss xmm0, dword ptr [rip + 0x5529409]
0x1409a7547: movzx ecx, byte ptr [r14 + 0x408]
0x1409a754f: cmp rcx, 3
0x1409a7553: jae 0x1409a76a5
0x1409a7559: mov rax, qword ptr [r14 + 0x400]
0x1409a7560: mov edx, ecx
0x1409a7562: shl edx, 7
0x1409a7565: mov qword ptr [rax + rdx + 0x80], 0
0x1409a7571: mov dword ptr [rax + rdx + 0xa8], 0
0x1409a757c: mov qword ptr [rax + rdx + 0xb8], 0
0x1409a7588: mov dword ptr [rax + rdx + 0xc0], 0xe4e1c0
0x1409a7593: mov dword ptr [rax + rdx + 0xc8], 7
0x1409a759e: movss dword ptr [rax + rdx + 0xcc], xmm0
0x1409a75a7: or cl, 4
0x1409a75aa: xchg byte ptr [rax + 0x200], cl
0x1409a75b0: and cl, 3
0x1409a75b3: mov byte ptr [r14 + 0x408], cl
0x1409a75ba: mov rax, qword ptr [r14 + 0x3f8]
0x1409a75c1: mov byte ptr [rax + 0x10], r15b
0x1409a75c5: mov dword ptr [rsi], ebp
0x1409a75c7: mov qword ptr [rdi], 0xfffffffffffffffd
0x1409a75ce: mov rax, rdi
0x1409a75d1: add rsp, 0x58
0x1409a75d5: pop rbx
0x1409a75d6: pop rbp
0x1409a75d7: pop rdi
0x1409a75d8: pop rsi
0x1409a75d9: pop r14
0x1409a75db: pop r15
0x1409a75dd: ret
0x1409a75de: lea rcx, [rip + 0x553b64b]
0x1409a75e5: lea r8, [rip + 0x553b6a4]
0x1409a75ec: mov edx, 0x59
0x1409a75f1: call 0x145d99570
0x1409a75f6: ud2
0x1409a75f8: add rsi, 8
0x1409a75fc: lea rax, [rip + 0x553b715]
0x1409a7603: mov qword ptr [rsp + 0x28], rax
0x1409a7608: mov qword ptr [rsp + 0x20], 0xdf
0x1409a7611: lea r9, [rip + 0x553b690]
0x1409a7618: lea r8, [rsp + 0x38]
0x1409a761d: xor ecx, ecx
0x1409a761f: mov rdx, rsi
0x1409a7622: call 0x145d4891d
0x1409a7627: ud2
0x1409a7629: add rsi, 4
0x1409a762d: mov qword ptr [rsp + 0x38], rsi
0x1409a7632: lea rax, [rip + 0x4655cc7]
0x1409a7639: mov qword ptr [rsp + 0x40], rax
0x1409a763e: lea rcx, [rsp + 0x37]
0x1409a7643: mov qword ptr [rsp + 0x48], rcx
0x1409a7648: mov qword ptr [rsp + 0x50], rax
0x1409a764d: lea rcx, [rip + 0x553b793]
0x1409a7654: lea r8, [rip + 0x553b7dd]
0x1409a765b: lea rdx, [rsp + 0x38]
0x1409a7660: call 0x145d99830
0x1409a7665: ud2
0x1409a7667: add rsi, 4
0x1409a766b: mov qword ptr [rsp + 0x38], rsi
0x1409a7670: lea rax, [rip + 0x4655c89]
0x1409a7677: mov qword ptr [rsp + 0x40], rax
0x1409a767c: lea rcx, [rsp + 0x37]
0x1409a7681: mov qword ptr [rsp + 0x48], rcx
0x1409a7686: mov qword ptr [rsp + 0x50], rax
0x1409a768b: lea rcx, [rip + 0x553b033]
0x1409a7692: lea r8, [rip + 0x553b0cf]
0x1409a7699: lea rdx, [rsp + 0x38]
0x1409a769e: call 0x145d99830
0x1409a76a3: ud2
0x1409a76a5: lea r8, [rip + 0x552ef64]
0x1409a76ac: mov edx, 3
0x1409a76b1: call 0x145d99653
0x1409a76b6: ud2
