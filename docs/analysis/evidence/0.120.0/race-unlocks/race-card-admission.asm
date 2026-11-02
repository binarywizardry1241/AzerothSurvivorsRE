00000001401a1646  4c89ce                 mov rsi, r9
00000001401a1649  4c89c3                 mov rbx, r8
00000001401a164c  4889d7                 mov rdi, rdx
00000001401a164f  4989cf                 mov r15, rcx
00000001401a1652  4c8ba5a8040000         mov r12, qword ptr [rbp + 0x4a8]
00000001401a1659  488b8590040000         mov rax, qword ptr [rbp + 0x490]
00000001401a1660  488b9040010000         mov rdx, qword ptr [rax + 0x140]
00000001401a1667  4c8b8048010000         mov r8, qword ptr [rax + 0x148]
00000001401a166e  450fb6742450           movzx r14d, byte ptr [r12 + 0x50]
00000001401a1674  4983f80f               cmp r8, 0xf
00000001401a1678  7726                   ja 0x1401a16a0
00000001401a167a  4d85c0                 test r8, r8
00000001401a167d  745b                   je 0x1401a16da
00000001401a167f  31c0                   xor eax, eax
00000001401a1681  6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
00000001401a1690  44383402               cmp byte ptr [rdx + rax], r14b
00000001401a1694  7418                   je 0x1401a16ae
00000001401a1696  48ffc0                 inc rax
00000001401a1699  4939c0                 cmp r8, rax
00000001401a169c  75f2                   jne 0x1401a1690
00000001401a169e  eb3a                   jmp 0x1401a16da
00000001401a16a0  4489f1                 mov ecx, r14d
00000001401a16a3  e888dbdd05             call 0x145f7f230
00000001401a16a8  4883f801               cmp rax, 1
00000001401a16ac  752c                   jne 0x1401a16da
00000001401a16ae  488d0d4bfeff05         lea rcx, [rip + 0x5fffe4b]
00000001401a16b5  ba0b000000             mov edx, 0xb
00000001401a16ba  e8213a9b05             call 0x145b550e0
00000001401a16bf  4989d4                 mov r12, rdx
00000001401a16c2  4885d2                 test rdx, rdx
00000001401a16c5  0f8926010000           jns 0x1401a17f1
00000001401a16cb  31ff                   xor edi, edi
00000001401a16cd  4889f9                 mov rcx, rdi
00000001401a16d0  4c89e2                 mov rdx, r12
00000001401a16d3  e89396fa05             call 0x14614ad6b
00000001401a16d8  0f0b                   ud2
00000001401a16da  488b8598040000         mov rax, qword ptr [rbp + 0x498]
00000001401a16e1  488b5038               mov rdx, qword ptr [rax + 0x38]
00000001401a16e5  4c8b4040               mov r8, qword ptr [rax + 0x40]
00000001401a16e9  4983f80f               cmp r8, 0xf
00000001401a16ed  4889b5f8030000         mov qword ptr [rbp + 0x3f8], rsi
00000001401a16f4  4889bd00040000         mov qword ptr [rbp + 0x400], rdi
00000001401a16fb  48899d08040000         mov qword ptr [rbp + 0x408], rbx
00000001401a1702  771c                   ja 0x1401a1720
00000001401a1704  4d85c0                 test r8, r8
00000001401a1707  0f847d000000           je 0x1401a178a
00000001401a170d  31c0                   xor eax, eax
00000001401a170f  90                     nop
00000001401a1710  44383402               cmp byte ptr [rdx + rax], r14b
00000001401a1714  7418                   je 0x1401a172e
00000001401a1716  48ffc0                 inc rax
00000001401a1719  4939c0                 cmp r8, rax
00000001401a171c  75f2                   jne 0x1401a1710
00000001401a171e  eb6a                   jmp 0x1401a178a
00000001401a1720  4489f1                 mov ecx, r14d
00000001401a1723  e808dbdd05             call 0x145f7f230
00000001401a1728  4883f801               cmp rax, 1
00000001401a172c  755c                   jne 0x1401a178a
00000001401a172e  488d0d5dfaff05         lea rcx, [rip + 0x5fffa5d]
00000001401a1735  ba10000000             mov edx, 0x10
00000001401a173a  e8a1399b05             call 0x145b550e0
00000001401a173f  4989d0                 mov r8, rdx
00000001401a1742  48c744242001000000     mov qword ptr [rsp + 0x20], 1
00000001401a174b  4c8d0d66fcff05         lea r9, [rip + 0x5fffc66]
00000001401a1752  488d8dd8030000         lea rcx, [rbp + 0x3d8]
00000001401a1759  4889c2                 mov rdx, rax
00000001401a175c  e80f3e9b05             call 0x145b55570
00000001401a1761  0f10053cfaff05         movups xmm0, xmmword ptr [rip + 0x5fffa3c]
00000001401a1768  0f2985c0030000         movaps xmmword ptr [rbp + 0x3c0], xmm0
00000001401a176f  41b501                 mov r13b, 1
00000001401a1772  c6851f04000002         mov byte ptr [rbp + 0x41f], 2
00000001401a1779  660f6e051f21fd05       movd xmm0, dword ptr [rip + 0x5fd211f]
00000001401a1781  31f6                   xor esi, esi
00000001401a1783  b301                   mov bl, 1
00000001401a1785  e958010000             jmp 0x1401a18e2
00000001401a178a  83bda004000063         cmp dword ptr [rbp + 0x4a0], 0x63
00000001401a1791  0f86ab000000           jbe 0x1401a1842
00000001401a1797  488d0deaf9ff05         lea rcx, [rip + 0x5fff9ea]
00000001401a179e  ba0a000000             mov edx, 0xa
00000001401a17a3  e838399b05             call 0x145b550e0
00000001401a17a8  4989d0                 mov r8, rdx
00000001401a17ab  48c744242001000000     mov qword ptr [rsp + 0x20], 1
00000001401a17b4  4c8d0dfdfbff05         lea r9, [rip + 0x5fffbfd]
00000001401a17bb  488d8dd8030000         lea rcx, [rbp + 0x3d8]
00000001401a17c2  4889c2                 mov rdx, rax
00000001401a17c5  e8a63d9b05             call 0x145b55570
00000001401a17ca  0f100553f8ff05         movups xmm0, xmmword ptr [rip + 0x5fff853]
00000001401a17d1  0f2985c0030000         movaps xmmword ptr [rbp + 0x3c0], xmm0
00000001401a17d8  c6851f04000002         mov byte ptr [rbp + 0x41f], 2
00000001401a17df  41b501                 mov r13b, 1
00000001401a17e2  660f6e05b620fd05       movd xmm0, dword ptr [rip + 0x5fd20b6]
00000001401a17ea  31f6                   xor esi, esi
00000001401a17ec  e9a6000000             jmp 0x1401a1897
00000001401a17f1  48899d08040000         mov qword ptr [rbp + 0x408], rbx
00000001401a17f8  4889bd00040000         mov qword ptr [rbp + 0x400], rdi
00000001401a17ff  4889b5f8030000         mov qword ptr [rbp + 0x3f8], rsi
00000001401a1806  0f848f000000           je 0x1401a189b
00000001401a180c  4889c6                 mov rsi, rax
00000001401a180f  e8ec09e6ff             call 0x140002200
00000001401a1814  bf01000000             mov edi, 1
00000001401a1819  ba01000000             mov edx, 1
00000001401a181e  4c89e1                 mov rcx, r12
00000001401a1821  e89a09e6ff             call 0x1400021c0
00000001401a1826  4885c0                 test rax, rax
00000001401a1829  0f849efeffff           je 0x1401a16cd
00000001401a182f  4989c5                 mov r13, rax
00000001401a1832  4889c1                 mov rcx, rax
00000001401a1835  4889f2                 mov rdx, rsi
00000001401a1838  4d89e0                 mov r8, r12
00000001401a183b  e86b22e005             call 0x145fa3aab
00000001401a1840  eb5f                   jmp 0x1401a18a1
00000001401a1842  488d0df4f8ff05         lea rcx, [rip + 0x5fff8f4]
00000001401a1849  ba0d000000             mov edx, 0xd
00000001401a184e  e88d389b05             call 0x145b550e0
00000001401a1853  4989d0                 mov r8, rdx
00000001401a1856  48c744242001000000     mov qword ptr [rsp + 0x20], 1
00000001401a185f  4c8d0d52fbff05         lea r9, [rip + 0x5fffb52]
00000001401a1866  488d8dd8030000         lea rcx, [rbp + 0x3d8]
00000001401a186d  4889c2                 mov rdx, rax
00000001401a1870  e8fb3c9b05             call 0x145b55570
00000001401a1875  0f1005f8f8ff05         movups xmm0, xmmword ptr [rip + 0x5fff8f8]
00000001401a187c  0f2985c0030000         movaps xmmword ptr [rbp + 0x3c0], xmm0
00000001401a1883  c6851f040000ff         mov byte ptr [rbp + 0x41f], 0xff
00000001401a188a  660f6e059a7cfe05       movd xmm0, dword ptr [rip + 0x5fe7c9a]
00000001401a1892  31f6                   xor esi, esi
00000001401a1894  4531ed                 xor r13d, r13d
00000001401a1897  31db                   xor ebx, ebx
00000001401a1899  eb47                   jmp 0x1401a18e2
00000001401a189b  41bd01000000           mov r13d, 1
00000001401a18a1  4c89a5d8030000         mov qword ptr [rbp + 0x3d8], r12
00000001401a18a8  4c89ade0030000         mov qword ptr [rbp + 0x3e0], r13
00000001401a18af  4c89a5e8030000         mov qword ptr [rbp + 0x3e8], r12
00000001401a18b6  0f1005e7f8ff05         movups xmm0, xmmword ptr [rip + 0x5fff8e7]
00000001401a18bd  0f2985c0030000         movaps xmmword ptr [rbp + 0x3c0], xmm0
00000001401a18c4  c6851f040000ff         mov byte ptr [rbp + 0x41f], 0xff
00000001401a18cb  40b601                 mov sil, 1
00000001401a18ce  660f6e05ca1ffd05       movd xmm0, dword ptr [rip + 0x5fd1fca]
00000001401a18d6  4531ed                 xor r13d, r13d
00000001401a18d9  31db                   xor ebx, ebx
00000001401a18db  4c8ba5a8040000         mov r12, qword ptr [rbp + 0x4a8]
