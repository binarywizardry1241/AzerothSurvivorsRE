1401c2c5a: f3410f10455c movss xmm0, dword ptr [r13 + 0x5c]
1401c2c60: 4c8b8d60030000 mov r9, qword ptr [rbp + 0x360]
1401c2c67: 4180793400 cmp byte ptr [r9 + 0x34], 0
1401c2c6c: 743e je 0x1401c2cac
1401c2c6e: 41397138 cmp dword ptr [r9 + 0x38], esi
1401c2c72: 7538 jne 0x1401c2cac
1401c2c74: 4139513c cmp dword ptr [r9 + 0x3c], edx
1401c2c78: 7532 jne 0x1401c2cac
1401c2c7a: 410f2e4120 ucomiss xmm0, dword ptr [r9 + 0x20]
1401c2c7f: 0f82cb020000 jb 0x1401c2f50
1401c2c85: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401c2c8c: 448b8570030000 mov r8d, dword ptr [rbp + 0x370]
1401c2c93: 448900 mov dword ptr [rax], r8d
1401c2c96: f30f5805366cc005 addss xmm0, dword ptr [rip + 0x5c06c36]
1401c2c9e: 488b8560030000 mov rax, qword ptr [rbp + 0x360]
1401c2ca5: f30f114020 movss dword ptr [rax + 0x20], xmm0
1401c2caa: eb2f jmp 0x1401c2cdb
1401c2cac: 41c7413401000000 mov dword ptr [r9 + 0x34], 1
1401c2cb4: 41897138 mov dword ptr [r9 + 0x38], esi
1401c2cb8: 4189513c mov dword ptr [r9 + 0x3c], edx
1401c2cbc: 488b8558030000 mov rax, qword ptr [rbp + 0x358]
1401c2cc3: 448b8570030000 mov r8d, dword ptr [rbp + 0x370]
1401c2cca: 448900 mov dword ptr [rax], r8d
1401c2ccd: f30f580583edc205 addss xmm0, dword ptr [rip + 0x5c2ed83]
1401c2cd5: f3410f114120 movss dword ptr [r9 + 0x20], xmm0
