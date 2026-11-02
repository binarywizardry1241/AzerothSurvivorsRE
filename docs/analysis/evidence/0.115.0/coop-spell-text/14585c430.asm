0x14585c430: push rsi
0x14585c431: dec cl
0x14585c433: cmp cl, 0xa
0x14585c436: ja 0x14585c566
0x14585c43c: movzx eax, cl
0x14585c43f: mov ecx, 0x5df
0x14585c444: bt ecx, eax
0x14585c447: jae 0x14585c566
0x14585c44d: lea rcx, [rip + 0x17cf9dc]
0x14585c454: mov rcx, qword ptr [rcx + rax*8]
0x14585c458: mov rax, qword ptr [rcx + 0x38]
0x14585c45c: test rax, rax
0x14585c45f: je 0x14585c4b4
0x14585c461: mov r9, qword ptr [rcx + 0x30]
0x14585c465: lea r8, [rax + rax*4]
0x14585c469: shl r8, 5
0x14585c46d: add r8, r9
0x14585c470: mov rax, r9
0x14585c473: add r9, 0xa0
0x14585c47a: mov r11, qword ptr [rax + 0x60]
0x14585c47e: mov r10, qword ptr [rax + 0x68]
0x14585c482: shl r10, 6
0x14585c486: nop word ptr cs:[rax + rax]
0x14585c490: test r10, r10
0x14585c493: je 0x14585c4af
0x14585c495: mov rsi, r11
0x14585c498: add r11, 0x40
0x14585c49c: add r10, -0x40
0x14585c4a0: cmp byte ptr [rsi], 0x19
0x14585c4a3: jne 0x14585c490
0x14585c4a5: cmp dword ptr [rsi + 4], edx
0x14585c4a8: jne 0x14585c490
0x14585c4aa: jmp 0x14585c564
0x14585c4af: cmp r9, r8
0x14585c4b2: jne 0x14585c470
0x14585c4b4: mov r8, qword ptr [rcx + 0x78]
0x14585c4b8: test r8, r8
0x14585c4bb: je 0x14585c504
0x14585c4bd: mov rax, qword ptr [rcx + 0x70]
0x14585c4c1: lea r8, [r8 + r8*4]
0x14585c4c5: shl r8, 5
0x14585c4c9: add r8, rax
0x14585c4cc: lea r9, [rax + 0xa0]
0x14585c4d3: mov r11, qword ptr [rax + 0x60]
0x14585c4d7: mov r10, qword ptr [rax + 0x68]
0x14585c4db: shl r10, 6
0x14585c4df: nop
0x14585c4e0: test r10, r10
0x14585c4e3: je 0x14585c4fc
0x14585c4e5: mov rsi, r11
0x14585c4e8: add r11, 0x40
0x14585c4ec: add r10, -0x40
0x14585c4f0: cmp byte ptr [rsi], 0x19
0x14585c4f3: jne 0x14585c4e0
0x14585c4f5: cmp dword ptr [rsi + 4], edx
0x14585c4f8: jne 0x14585c4e0
0x14585c4fa: jmp 0x14585c564
0x14585c4fc: mov rax, r9
0x14585c4ff: cmp r9, r8
0x14585c502: jne 0x14585c4cc
0x14585c504: mov rax, qword ptr [rcx + 0xb8]
0x14585c50b: test rax, rax
0x14585c50e: je 0x14585c566
0x14585c510: mov r8, qword ptr [rcx + 0xb0]
0x14585c517: lea rcx, [rax + rax*4]
0x14585c51b: shl rcx, 5
0x14585c51f: add rcx, r8
0x14585c522: xor eax, eax
0x14585c524: lea r9, [r8 + 0xa0]
0x14585c52b: mov r11, qword ptr [r8 + 0x60]
0x14585c52f: mov r10, qword ptr [r8 + 0x68]
0x14585c533: shl r10, 6
0x14585c537: nop word ptr [rax + rax]
0x14585c540: test r10, r10
0x14585c543: je 0x14585c55c
0x14585c545: mov rsi, r11
0x14585c548: add r11, 0x40
0x14585c54c: add r10, -0x40
0x14585c550: cmp byte ptr [rsi], 0x19
0x14585c553: jne 0x14585c540
0x14585c555: cmp dword ptr [rsi + 4], edx
0x14585c558: jne 0x14585c540
0x14585c55a: jmp 0x14585c56a
0x14585c55c: mov r8, r9
0x14585c55f: cmp r9, rcx
0x14585c562: jne 0x14585c524
0x14585c564: pop rsi
0x14585c565: ret
0x14585c566: xor eax, eax
0x14585c568: pop rsi
0x14585c569: ret
0x14585c56a: mov rax, r8
0x14585c56d: pop rsi
0x14585c56e: ret
