; 0.108.0 SHA256 dc0040043fff7995a9137d96509c08debd1dbf8b0125a935273d718c66cb698b
; original PE range 0x1458e6130..0x1458e68e8 (1976 bytes), SHA256 dde61a9778f56a9fdc72c5379e31e4748cf773facdf844d2bf67fdb54db8a10f
0x1458e6130: push rbp
0x1458e6131: push r15
0x1458e6133: push r14
0x1458e6135: push r13
0x1458e6137: push r12
0x1458e6139: push rsi
0x1458e613a: push rdi
0x1458e613b: push rbx
0x1458e613c: sub rsp, 0x88
0x1458e6143: lea rbp, [rsp + 0x80]
0x1458e614b: movdqa xmmword ptr [rbp - 0x10], xmm7
0x1458e6150: movdqa xmmword ptr [rbp - 0x20], xmm6
0x1458e6155: mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
0x1458e615d: lea rdx, [rip + 0x130514c]
0x1458e6164: lea rcx, [rbp - 0x58]
0x1458e6168: mov r8d, 8
0x1458e616e: call 0x1458e9450
0x1458e6173: mov rax, qword ptr [rbp - 0x58]
0x1458e6177: cmp rax, -1
0x1458e617b: je 0x1458e62c3
0x1458e6181: mov qword ptr [rbp - 0x38], rax
0x1458e6185: mov rcx, qword ptr [rbp - 0x50]
0x1458e6189: mov rdx, qword ptr [rbp - 0x48]
0x1458e618d: mov qword ptr [rbp - 0x30], rcx
0x1458e6191: call 0x14019e230
0x1458e6196: nop
0x1458e6197: mov rsi, rdx
0x1458e619a: test rdx, rdx
0x1458e619d: jns 0x1458e61b3
0x1458e619f: xor r14d, r14d
0x1458e61a2: mov rcx, r14
0x1458e61a5: mov rdx, rsi
0x1458e61a8: call 0x145d934fb
0x1458e61ad: nop
0x1458e61ae: jmp 0x1458e6693
0x1458e61b3: test rsi, rsi
0x1458e61b6: je 0x1458e64fe
0x1458e61bc: mov rbx, rax
0x1458e61bf: call 0x140002200
0x1458e61c4: mov r14d, 1
0x1458e61ca: mov edx, 1
0x1458e61cf: mov rcx, rsi
0x1458e61d2: call 0x1400021c0
0x1458e61d7: test rax, rax
0x1458e61da: je 0x1458e61a2
0x1458e61dc: mov rdi, rax
0x1458e61df: mov rcx, rax
0x1458e61e2: mov rdx, rbx
0x1458e61e5: mov r8, rsi
0x1458e61e8: call 0x145bf293b
0x1458e61ed: mov rdx, qword ptr [rbp - 0x38]
0x1458e61f1: test rdx, rdx
0x1458e61f4: je 0x1458e6205
0x1458e61f6: mov r8d, 1
0x1458e61fc: mov rcx, qword ptr [rbp - 0x30]
0x1458e6200: call 0x1400021d0
0x1458e6205: test rsi, rsi
0x1458e6208: je 0x1458e62c3
0x1458e620e: cmp rsi, 2
0x1458e6212: jne 0x1458e62b2
0x1458e6218: cmp word ptr [rdi], 0x6e65
0x1458e621d: je 0x1458e6899
0x1458e6223: cmp word ptr [rdi], 0x6c70
0x1458e6228: je 0x1458e6899
0x1458e622e: cmp word ptr [rdi], 0x7363
0x1458e6233: je 0x1458e6899
0x1458e6239: cmp word ptr [rdi], 0x6564
0x1458e623e: je 0x1458e6899
0x1458e6244: cmp word ptr [rdi], 0x7470
0x1458e6249: je 0x1458e6899
0x1458e624f: cmp word ptr [rdi], 0x7365
0x1458e6254: je 0x1458e6899
0x1458e625a: cmp word ptr [rdi], 0x7266
0x1458e625f: je 0x1458e6899
0x1458e6265: cmp word ptr [rdi], 0x6f72
0x1458e626a: je 0x1458e6899
0x1458e6270: cmp word ptr [rdi], 0x7274
0x1458e6275: je 0x1458e6899
0x1458e627b: cmp word ptr [rdi], 0x7572
0x1458e6280: je 0x1458e6899
0x1458e6286: cmp word ptr [rdi], 0x6b75
0x1458e628b: je 0x1458e6899
0x1458e6291: cmp word ptr [rdi], 0x687a
0x1458e6296: je 0x1458e6899
0x1458e629c: cmp word ptr [rdi], 0x616a
0x1458e62a1: je 0x1458e6899
0x1458e62a7: cmp word ptr [rdi], 0x6f6b
0x1458e62ac: je 0x1458e6899
0x1458e62b2: mov r8d, 1
0x1458e62b8: mov rcx, rdi
0x1458e62bb: mov rdx, rsi
0x1458e62be: call 0x1400021d0
0x1458e62c3: lea rdx, [rip + 0x1304f09]
0x1458e62ca: lea rcx, [rbp - 0x58]
0x1458e62ce: mov r8d, 6
0x1458e62d4: call 0x145bb61d0
0x1458e62d9: mov rdx, qword ptr [rbp - 0x58]
0x1458e62dd: cmp rdx, -1
0x1458e62e1: je 0x1458e632b
0x1458e62e3: cmp rdx, -2
0x1458e62e7: jne 0x1458e6317
0x1458e62e9: mov r12, qword ptr [rbp - 0x50]
0x1458e62ed: cmp r12, -1
0x1458e62f1: je 0x1458e632b
0x1458e62f3: mov r13, qword ptr [rbp - 0x48]
0x1458e62f7: mov rax, qword ptr [rbp - 0x40]
0x1458e62fb: test rax, rax
0x1458e62fe: jne 0x1458e63de
0x1458e6304: test r12, r12
0x1458e6307: je 0x1458e632b
0x1458e6309: mov r8d, 1
0x1458e630f: mov rcx, r13
0x1458e6312: mov rdx, r12
0x1458e6315: jmp 0x1458e6326
0x1458e6317: test rdx, rdx
0x1458e631a: je 0x1458e632b
0x1458e631c: mov rcx, qword ptr [rbp - 0x50]
0x1458e6320: mov r8d, 1
0x1458e6326: call 0x1400021d0
0x1458e632b: lea rdx, [rip + 0x1304ea7]
0x1458e6332: lea rcx, [rbp - 0x58]
0x1458e6336: mov r8d, 0xb
0x1458e633c: call 0x145bb61d0
0x1458e6341: mov rdx, qword ptr [rbp - 0x58]
0x1458e6345: cmp rdx, -2
0x1458e6349: je 0x1458e6367
0x1458e634b: cmp rdx, -1
0x1458e634f: je 0x1458e6391
0x1458e6351: test rdx, rdx
0x1458e6354: je 0x1458e6391
0x1458e6356: mov rcx, qword ptr [rbp - 0x50]
0x1458e635a: mov r8d, 1
0x1458e6360: call 0x1400021d0
0x1458e6365: jmp 0x1458e6391
0x1458e6367: mov r12, qword ptr [rbp - 0x50]
0x1458e636b: cmp r12, -1
0x1458e636f: je 0x1458e6391
0x1458e6371: mov r13, qword ptr [rbp - 0x48]
0x1458e6375: mov rax, qword ptr [rbp - 0x40]
0x1458e6379: test rax, rax
0x1458e637c: jne 0x1458e63de
0x1458e637e: test r12, r12
0x1458e6381: je 0x1458e6391
0x1458e6383: mov r8d, 1
0x1458e6389: mov rcx, r13
0x1458e638c: mov rdx, r12
0x1458e638f: jmp 0x1458e6360
0x1458e6391: lea rdx, [rip + 0x1304e4c]
0x1458e6398: lea rcx, [rbp - 0x58]
0x1458e639c: mov r8d, 4
0x1458e63a2: call 0x145bb61d0
0x1458e63a7: mov rdx, qword ptr [rbp - 0x58]
0x1458e63ab: cmp rdx, -1
0x1458e63af: je 0x1458e6878
0x1458e63b5: cmp rdx, -2
0x1458e63b9: jne 0x1458e64e1
0x1458e63bf: mov r12, qword ptr [rbp - 0x50]
0x1458e63c3: cmp r12, -1
0x1458e63c7: je 0x1458e6878
0x1458e63cd: mov r13, qword ptr [rbp - 0x48]
0x1458e63d1: mov rax, qword ptr [rbp - 0x40]
0x1458e63d5: test rax, rax
0x1458e63d8: je 0x1458e6565
0x1458e63de: lea rcx, [rax + r13]
0x1458e63e2: xor r11d, r11d
0x1458e63e5: movabs rdx, 0x4000000000003
0x1458e63ef: mov r10, r13
0x1458e63f2: nop word ptr cs:[rax + rax]
0x1458e6400: cmp r10, rcx
0x1458e6403: je 0x1458e6515
0x1458e6409: mov r8, r10
0x1458e640c: mov rsi, r11
0x1458e640f: movzx r10d, byte ptr [r10]
0x1458e6413: movzx r9d, r10b
0x1458e6417: test r9b, r9b
0x1458e641a: js 0x1458e6430
0x1458e641c: lea r10, [r8 + 1]
0x1458e6420: jmp 0x1458e64a0
0x1458e6422: nop word ptr cs:[rax + rax]
0x1458e6430: mov r11d, r9d
0x1458e6433: and r11d, 0x1f
0x1458e6437: movzx edi, byte ptr [r8 + 1]
0x1458e643c: and edi, 0x3f
0x1458e643f: cmp r9b, 0xdf
0x1458e6443: jbe 0x1458e647d
0x1458e6445: movzx r9d, byte ptr [r8 + 2]
0x1458e644a: shl edi, 6
0x1458e644d: and r9d, 0x3f
0x1458e6451: or r9d, edi
0x1458e6454: cmp r10b, 0xf0
0x1458e6458: jb 0x1458e648d
0x1458e645a: lea r10, [r8 + 4]
0x1458e645e: movzx edi, byte ptr [r8 + 3]
0x1458e6463: and r11d, 7
0x1458e6467: shl r11d, 0x12
0x1458e646b: shl r9d, 6
0x1458e646f: and edi, 0x3f
0x1458e6472: or edi, r9d
0x1458e6475: or edi, r11d
0x1458e6478: mov r9d, edi
0x1458e647b: jmp 0x1458e64a0
0x1458e647d: lea r10, [r8 + 2]
0x1458e6481: shl r11d, 6
0x1458e6485: or r11d, edi
0x1458e6488: mov r9d, r11d
0x1458e648b: jmp 0x1458e64a0
0x1458e648d: lea r10, [r8 + 3]
0x1458e6491: shl r11d, 0xc
0x1458e6495: or r9d, r11d
0x1458e6498: nop dword ptr [rax + rax]
0x1458e64a0: mov r11, rsi
0x1458e64a3: sub r11, r8
0x1458e64a6: add r11, r10
0x1458e64a9: add r9d, -0x2d
0x1458e64ad: cmp r9d, 0x32
0x1458e64b1: ja 0x1458e6400
0x1458e64b7: bt rdx, r9
0x1458e64bb: jae 0x1458e6400
0x1458e64c1: test rsi, rsi
0x1458e64c4: jns 0x1458e651d
0x1458e64c6: xor edi, edi
0x1458e64c8: mov qword ptr [rbp - 0x30], r13
0x1458e64cc: mov qword ptr [rbp - 0x38], r12
0x1458e64d0: mov rcx, rdi
0x1458e64d3: mov rdx, rsi
0x1458e64d6: call 0x145d934fb
0x1458e64db: nop
0x1458e64dc: jmp 0x1458e6693
0x1458e64e1: test rdx, rdx
0x1458e64e4: je 0x1458e6878
0x1458e64ea: mov rcx, qword ptr [rbp - 0x50]
0x1458e64ee: mov r8d, 1
0x1458e64f4: call 0x1400021d0
0x1458e64f9: jmp 0x1458e6878
0x1458e64fe: mov edi, 1
0x1458e6503: mov rdx, qword ptr [rbp - 0x38]
0x1458e6507: test rdx, rdx
0x1458e650a: jne 0x1458e61f6
0x1458e6510: jmp 0x1458e6205
0x1458e6515: mov rsi, rax
0x1458e6518: test rsi, rsi
0x1458e651b: js 0x1458e64c6
0x1458e651d: je 0x1458e6559
0x1458e651f: call 0x140002200
0x1458e6524: mov edi, 1
0x1458e6529: mov edx, 1
0x1458e652e: mov rcx, rsi
0x1458e6531: call 0x1400021c0
0x1458e6536: test rax, rax
0x1458e6539: je 0x1458e64c8
0x1458e653b: mov r14, rax
0x1458e653e: mov rcx, rax
0x1458e6541: mov rdx, r13
0x1458e6544: mov r8, rsi
0x1458e6547: call 0x145bf293b
0x1458e654c: cmp rsi, 8
0x1458e6550: jae 0x1458e657f
0x1458e6552: xor eax, eax
0x1458e6554: jmp 0x1458e6695
0x1458e6559: mov rbx, 0xffffffffffffffff
0x1458e6560: jmp 0x1458e6830
0x1458e6565: test r12, r12
0x1458e6568: je 0x1458e6878
0x1458e656e: mov r8d, 1
0x1458e6574: mov rcx, r13
0x1458e6577: mov rdx, r12
0x1458e657a: jmp 0x1458e64f4
0x1458e657f: cmp rsi, 0x20
0x1458e6583: jae 0x1458e658c
0x1458e6585: xor eax, eax
0x1458e6587: jmp 0x1458e662a
0x1458e658c: movabs rax, 0x7fffffffffffffe0
0x1458e6596: and rax, rsi
0x1458e6599: xor ecx, ecx
0x1458e659b: movdqa xmm0, xmmword ptr [rip + 0x4b0f8d]
0x1458e65a3: movdqa xmm1, xmmword ptr [rip + 0x4b0f95]
0x1458e65ab: movdqa xmm2, xmmword ptr [rip + 0x4b0f9d]
0x1458e65b3: nop word ptr cs:[rax + rax]
0x1458e65c0: movdqu xmm3, xmmword ptr [r14 + rcx]
0x1458e65c6: movdqu xmm4, xmmword ptr [r14 + rcx + 0x10]
0x1458e65cd: movdqa xmm5, xmm3
0x1458e65d1: paddb xmm5, xmm0
0x1458e65d5: movdqa xmm6, xmm4
0x1458e65d9: paddb xmm6, xmm0
0x1458e65dd: movdqa xmm7, xmm5
0x1458e65e1: pminub xmm7, xmm1
0x1458e65e5: pcmpeqb xmm7, xmm5
0x1458e65e9: pand xmm7, xmm2
0x1458e65ed: movdqa xmm5, xmm6
0x1458e65f1: pminub xmm5, xmm1
0x1458e65f5: pcmpeqb xmm5, xmm6
0x1458e65f9: pand xmm5, xmm2
0x1458e65fd: por xmm7, xmm3
0x1458e6601: por xmm5, xmm4
0x1458e6605: movdqu xmmword ptr [r14 + rcx], xmm7
0x1458e660b: movdqu xmmword ptr [r14 + rcx + 0x10], xmm5
0x1458e6612: add rcx, 0x20
0x1458e6616: cmp rax, rcx
0x1458e6619: jne 0x1458e65c0
0x1458e661b: cmp rsi, rax
0x1458e661e: je 0x1458e66b4
0x1458e6624: test sil, 0x18
0x1458e6628: je 0x1458e6695
0x1458e662a: mov rcx, rax
0x1458e662d: movabs rax, 0x7ffffffffffffff8
0x1458e6637: and rax, rsi
0x1458e663a: movdqa xmm0, xmmword ptr [rip + 0x4b0f1e]
0x1458e6642: movdqa xmm1, xmmword ptr [rip + 0x4b0f26]
0x1458e664a: movdqa xmm2, xmmword ptr [rip + 0x4b0f2e]
0x1458e6652: nop word ptr cs:[rax + rax]
0x1458e6660: movq xmm3, qword ptr [r14 + rcx]
0x1458e6666: movdqa xmm4, xmm3
0x1458e666a: paddb xmm4, xmm0
0x1458e666e: movdqa xmm5, xmm4
0x1458e6672: pmaxub xmm5, xmm1
0x1458e6676: pcmpeqb xmm5, xmm4
0x1458e667a: pandn xmm5, xmm2
0x1458e667e: por xmm5, xmm3
0x1458e6682: movq qword ptr [r14 + rcx], xmm5
0x1458e6688: add rcx, 8
0x1458e668c: cmp rax, rcx
0x1458e668f: jne 0x1458e6660
0x1458e6691: jmp 0x1458e66af
0x1458e6693: ud2
0x1458e6695: movzx ecx, byte ptr [r14 + rax]
0x1458e669a: lea edx, [rcx - 0x41]
0x1458e669d: cmp dl, 0x1a
0x1458e66a0: setb dl
0x1458e66a3: shl dl, 5
0x1458e66a6: or dl, cl
0x1458e66a8: mov byte ptr [r14 + rax], dl
0x1458e66ac: inc rax
0x1458e66af: cmp rsi, rax
0x1458e66b2: jne 0x1458e6695
0x1458e66b4: mov rbx, 0xffffffffffffffff
0x1458e66bb: cmp rsi, 2
0x1458e66bf: jne 0x1458e6731
0x1458e66c1: cmp word ptr [r14], 0x6e65
0x1458e66c7: je 0x1458e6736
0x1458e66c9: cmp word ptr [r14], 0x6c70
0x1458e66cf: je 0x1458e673f
0x1458e66d1: cmp word ptr [r14], 0x7363
0x1458e66d7: je 0x1458e6748
0x1458e66d9: cmp word ptr [r14], 0x6564
0x1458e66df: je 0x1458e6751
0x1458e66e1: cmp word ptr [r14], 0x7470
0x1458e66e7: je 0x1458e675a
0x1458e66e9: cmp word ptr [r14], 0x7365
0x1458e66ef: je 0x1458e6763
0x1458e66f1: cmp word ptr [r14], 0x7266
0x1458e66f7: je 0x1458e676c
0x1458e66f9: cmp word ptr [r14], 0x6f72
0x1458e66ff: je 0x1458e6775
0x1458e6701: cmp word ptr [r14], 0x7274
0x1458e6707: je 0x1458e677e
0x1458e6709: cmp word ptr [r14], 0x7572
0x1458e670f: je 0x1458e6787
0x1458e6711: cmp word ptr [r14], 0x6b75
0x1458e6717: je 0x1458e6790
0x1458e6719: cmp word ptr [r14], 0x687a
0x1458e671f: je 0x1458e6799
0x1458e6721: cmp word ptr [r14], 0x616a
0x1458e6727: je 0x1458e67a2
0x1458e6729: cmp word ptr [r14], 0x6f6b
0x1458e672f: je 0x1458e67ab
0x1458e6731: jmp 0x1458e681f
0x1458e6736: lea rax, [rip + 0x15aed13]
0x1458e673d: jmp 0x1458e67b2
0x1458e673f: lea rax, [rip + 0x15aed42]
0x1458e6746: jmp 0x1458e67b2
0x1458e6748: lea rax, [rip + 0x15aed71]
0x1458e674f: jmp 0x1458e67b2
0x1458e6751: lea rax, [rip + 0x15aeda0]
0x1458e6758: jmp 0x1458e67b2
0x1458e675a: lea rax, [rip + 0x15aedcf]
0x1458e6761: jmp 0x1458e67b2
0x1458e6763: lea rax, [rip + 0x15aedfe]
0x1458e676a: jmp 0x1458e67b2
0x1458e676c: lea rax, [rip + 0x15aee2d]
0x1458e6773: jmp 0x1458e67b2
0x1458e6775: lea rax, [rip + 0x15aee5c]
0x1458e677c: jmp 0x1458e67b2
0x1458e677e: lea rax, [rip + 0x15aee8b]
0x1458e6785: jmp 0x1458e67b2
0x1458e6787: lea rax, [rip + 0x15aeeba]
0x1458e678e: jmp 0x1458e67b2
0x1458e6790: lea rax, [rip + 0x15aeee9]
0x1458e6797: jmp 0x1458e67b2
0x1458e6799: lea rax, [rip + 0x15aef18]
0x1458e67a0: jmp 0x1458e67b2
0x1458e67a2: lea rax, [rip + 0x15aef47]
0x1458e67a9: jmp 0x1458e67b2
0x1458e67ab: lea rax, [rip + 0x15aef76]
0x1458e67b2: mov rbx, qword ptr [rax + 8]
0x1458e67b6: test rbx, rbx
0x1458e67b9: jns 0x1458e67db
0x1458e67bb: mov qword ptr [rbp - 0x60], r14
0x1458e67bf: xor r15d, r15d
0x1458e67c2: mov qword ptr [rbp - 0x30], r13
0x1458e67c6: mov qword ptr [rbp - 0x38], r12
0x1458e67ca: mov rcx, r15
0x1458e67cd: mov rdx, rbx
0x1458e67d0: call 0x145d934fb
0x1458e67d5: nop
0x1458e67d6: jmp 0x1458e6693
0x1458e67db: je 0x1458e6818
0x1458e67dd: mov qword ptr [rbp - 0x60], r14
0x1458e67e1: mov r14, qword ptr [rax]
0x1458e67e4: call 0x140002200
0x1458e67e9: mov r15d, 1
0x1458e67ef: mov edx, 1
0x1458e67f4: mov rcx, rbx
0x1458e67f7: call 0x1400021c0
0x1458e67fc: test rax, rax
0x1458e67ff: je 0x1458e67c2
0x1458e6801: mov rdi, rax
0x1458e6804: mov rcx, rax
0x1458e6807: mov rdx, r14
0x1458e680a: mov r8, rbx
0x1458e680d: call 0x145bf293b
0x1458e6812: mov r14, qword ptr [rbp - 0x60]
0x1458e6816: jmp 0x1458e681f
0x1458e6818: mov edi, 1
0x1458e681d: xor ebx, ebx
0x1458e681f: mov r8d, 1
0x1458e6825: mov rcx, r14
0x1458e6828: mov rdx, rsi
0x1458e682b: call 0x1400021d0
0x1458e6830: test r12, r12
0x1458e6833: je 0x1458e6846
0x1458e6835: mov r8d, 1
0x1458e683b: mov rcx, r13
0x1458e683e: mov rdx, r12
0x1458e6841: call 0x1400021d0
0x1458e6846: cmp rbx, -1
0x1458e684a: je 0x1458e6878
0x1458e684c: mov rcx, rdi
0x1458e684f: mov rdx, rbx
0x1458e6852: call 0x1458e59e0
0x1458e6857: test rbx, rbx
0x1458e685a: jne 0x1458e68ab
0x1458e685c: movaps xmm6, xmmword ptr [rbp - 0x20]
0x1458e6860: movaps xmm7, xmmword ptr [rbp - 0x10]
0x1458e6864: add rsp, 0x88
0x1458e686b: pop rbx
0x1458e686c: pop rdi
0x1458e686d: pop rsi
0x1458e686e: pop r12
0x1458e6870: pop r13
0x1458e6872: pop r14
0x1458e6874: pop r15
0x1458e6876: pop rbp
0x1458e6877: ret
0x1458e6878: call 0x140002200
0x1458e687d: mov ecx, 2
0x1458e6882: mov edx, 1
0x1458e6887: call 0x1400021c0
0x1458e688c: test rax, rax
0x1458e688f: je 0x1458e68d7
0x1458e6891: mov rdi, rax
0x1458e6894: mov word ptr [rax], 0x6e65
0x1458e6899: mov ebx, 2
0x1458e689e: mov edx, 2
0x1458e68a3: mov rcx, rdi
0x1458e68a6: call 0x1458e59e0
0x1458e68ab: mov r8d, 1
0x1458e68b1: mov rcx, rdi
0x1458e68b4: mov rdx, rbx
0x1458e68b7: movaps xmm6, xmmword ptr [rbp - 0x20]
0x1458e68bb: movaps xmm7, xmmword ptr [rbp - 0x10]
0x1458e68bf: add rsp, 0x88
0x1458e68c6: pop rbx
0x1458e68c7: pop rdi
0x1458e68c8: pop rsi
0x1458e68c9: pop r12
0x1458e68cb: pop r13
0x1458e68cd: pop r14
0x1458e68cf: pop r15
0x1458e68d1: pop rbp
0x1458e68d2: jmp 0x1400021d0
0x1458e68d7: mov ecx, 1
0x1458e68dc: mov edx, 2
0x1458e68e1: call 0x145d934fb
0x1458e68e6: ud2
