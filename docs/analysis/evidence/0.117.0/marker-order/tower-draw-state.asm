14014b857: 488b8598010000 mov rax, qword ptr [rbp + 0x198]
14014b85e: 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
14014b865: 8b4010 mov eax, dword ptr [rax + 0x10]
14014b868: 488b9528020000 mov rdx, qword ptr [rbp + 0x228]
14014b86f: 448b85b4010000 mov r8d, dword ptr [rbp + 0x1b4]
14014b876: 448901 mov dword ptr [rcx], r8d
14014b879: 488b8d98010000 mov rcx, qword ptr [rbp + 0x198]
14014b880: 448b85a4020000 mov r8d, dword ptr [rbp + 0x2a4]
14014b887: 4c8d8dc9000000 lea r9, [rbp + 0xc9]
14014b88e: 4589411b mov dword ptr [r9 + 0x1b], r8d
14014b892: 4c8b859c020000 mov r8, qword ptr [rbp + 0x29c]
14014b899: 4d894113 mov qword ptr [r9 + 0x13], r8
14014b89d: 0f57c0 xorps xmm0, xmm0
14014b8a0: 0f294570 movaps xmmword ptr [rbp + 0x70], xmm0
14014b8a4: 48899590000000 mov qword ptr [rbp + 0x90], rdx
14014b8ab: 48c7859800000001000000 mov qword ptr [rbp + 0x98], 1
14014b8b6: 48c785a000000000000000 mov qword ptr [rbp + 0xa0], 0
14014b8c1: 8b955c020000 mov edx, dword ptr [rbp + 0x25c]
14014b8c7: 8895c8000000 mov byte ptr [rbp + 0xc8], dl
14014b8cd: 0fb695ae020000 movzx edx, byte ptr [rbp + 0x2ae]
14014b8d4: 41885102 mov byte ptr [r9 + 2], dl
14014b8d8: 0fb795ac020000 movzx edx, word ptr [rbp + 0x2ac]
14014b8df: 66418911 mov word ptr [r9], dx
14014b8e3: 8b9548020000 mov edx, dword ptr [rbp + 0x248]
14014b8e9: 8995cc000000 mov dword ptr [rbp + 0xcc], edx
14014b8ef: 8b9544020000 mov edx, dword ptr [rbp + 0x244]
14014b8f5: 8995d0000000 mov dword ptr [rbp + 0xd0], edx
14014b8fb: 488b9508020000 mov rdx, qword ptr [rbp + 0x208]
14014b902: 488995d4000000 mov qword ptr [rbp + 0xd4], rdx
14014b909: c785e800000000000046 mov dword ptr [rbp + 0xe8], 0x46000000
14014b913: 410f114123 movups xmmword ptr [r9 + 0x23], xmm0
14014b918: 41c7413300000000 mov dword ptr [r9 + 0x33], 0
14014b920: 48898d00010000 mov qword ptr [rbp + 0x100], rcx
14014b927: 898508010000 mov dword ptr [rbp + 0x108], eax
