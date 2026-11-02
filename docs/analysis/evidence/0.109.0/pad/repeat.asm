1401c49aa: f3410f10475c movss xmm0, dword ptr [r15 + 0x5c]
1401c49b0: 4c8b8d50030000 mov r9, qword ptr [rbp + 0x350]
1401c49b7: 4180793400 cmp byte ptr [r9 + 0x34], 0
1401c49bc: 743e je 0x1401c49fc
1401c49be: 41397138 cmp dword ptr [r9 + 0x38], esi
1401c49c2: 7538 jne 0x1401c49fc
1401c49c4: 4139513c cmp dword ptr [r9 + 0x3c], edx
1401c49c8: 7532 jne 0x1401c49fc
1401c49ca: 410f2e4120 ucomiss xmm0, dword ptr [r9 + 0x20]
1401c49cf: 0f82cb020000 jb 0x1401c4ca0
1401c49d5: 488b8548030000 mov rax, qword ptr [rbp + 0x348]
1401c49dc: 448b8560030000 mov r8d, dword ptr [rbp + 0x360]
1401c49e3: 448900 mov dword ptr [rax], r8d
1401c49e6: f30f5805d600c105 addss xmm0, dword ptr [rip + 0x5c100d6]
1401c49ee: 488b8550030000 mov rax, qword ptr [rbp + 0x350]
1401c49f5: f30f114020 movss dword ptr [rax + 0x20], xmm0
1401c49fa: eb2f jmp 0x1401c4a2b
1401c49fc: 41c7413401000000 mov dword ptr [r9 + 0x34], 1
1401c4a04: 41897138 mov dword ptr [r9 + 0x38], esi
1401c4a08: 4189513c mov dword ptr [r9 + 0x3c], edx
1401c4a0c: 488b8548030000 mov rax, qword ptr [rbp + 0x348]
1401c4a13: 448b8560030000 mov r8d, dword ptr [rbp + 0x360]
1401c4a1a: 448900 mov dword ptr [rax], r8d
1401c4a1d: f30f5805d32fc205 addss xmm0, dword ptr [rip + 0x5c22fd3]
1401c4a25: f3410f114120 movss dword ptr [r9 + 0x20], xmm0
