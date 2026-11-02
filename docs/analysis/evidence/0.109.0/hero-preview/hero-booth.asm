140c17470: 55 push rbp
140c17471: 4157 push r15
140c17473: 4156 push r14
140c17475: 4155 push r13
140c17477: 4154 push r12
140c17479: 56 push rsi
140c1747a: 57 push rdi
140c1747b: 53 push rbx
140c1747c: 4881ece8070000 sub rsp, 0x7e8
140c17483: 488dac2480000000 lea rbp, [rsp + 0x80]
140c1748b: 440f299550070000 movaps xmmword ptr [rbp + 0x750], xmm10
140c17493: 440f298d40070000 movaps xmmword ptr [rbp + 0x740], xmm9
140c1749b: 440f298530070000 movaps xmmword ptr [rbp + 0x730], xmm8
140c174a3: 0f29bd20070000 movaps xmmword ptr [rbp + 0x720], xmm7
140c174aa: 0f29b510070000 movaps xmmword ptr [rbp + 0x710], xmm6
140c174b1: 48c78508070000feffffff mov qword ptr [rbp + 0x708], 0xfffffffffffffffe
140c174bc: 488bb518080000 mov rsi, qword ptr [rbp + 0x818]
140c174c3: 488b4220 mov rax, qword ptr [rdx + 0x20]
140c174c7: 48894540 mov qword ptr [rbp + 0x40], rax
140c174cb: 488bbd10080000 mov rdi, qword ptr [rbp + 0x810]
140c174d2: 0f1002 movups xmm0, xmmword ptr [rdx]
140c174d5: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
140c174d9: 488b9d08080000 mov rbx, qword ptr [rbp + 0x808]
140c174e0: 0f294d30 movaps xmmword ptr [rbp + 0x30], xmm1
140c174e4: 0f294520 movaps xmmword ptr [rbp + 0x20], xmm0
140c174e8: 410f1000 movups xmm0, xmmword ptr [r8]
140c174ec: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
140c174f1: 488b9500080000 mov rdx, qword ptr [rbp + 0x800]
140c174f8: 0f114d58 movups xmmword ptr [rbp + 0x58], xmm1
140c174fc: 0f114548 movups xmmword ptr [rbp + 0x48], xmm0
140c17500: 410f1001 movups xmm0, xmmword ptr [r9]
140c17504: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
140c17509: 488b85d0070000 mov rax, qword ptr [rbp + 0x7d0]
140c17510: 0f114d78 movups xmmword ptr [rbp + 0x78], xmm1
140c17514: 0f114568 movups xmmword ptr [rbp + 0x68], xmm0
140c17518: 0f1000 movups xmm0, xmmword ptr [rax]
140c1751b: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140c1751f: 488b85d8070000 mov rax, qword ptr [rbp + 0x7d8]
140c17526: 0f118d98000000 movups xmmword ptr [rbp + 0x98], xmm1
140c1752d: 0f118588000000 movups xmmword ptr [rbp + 0x88], xmm0
140c17534: 0f1000 movups xmm0, xmmword ptr [rax]
140c17537: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140c1753b: 488b85e0070000 mov rax, qword ptr [rbp + 0x7e0]
140c17542: 0f118db8000000 movups xmmword ptr [rbp + 0xb8], xmm1
140c17549: 0f1185a8000000 movups xmmword ptr [rbp + 0xa8], xmm0
140c17550: 0f1000 movups xmm0, xmmword ptr [rax]
140c17553: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140c17557: 488b85e8070000 mov rax, qword ptr [rbp + 0x7e8]
140c1755e: 0f118548010000 movups xmmword ptr [rbp + 0x148], xmm0
140c17565: 0f118d58010000 movups xmmword ptr [rbp + 0x158], xmm1
140c1756c: 0f1000 movups xmm0, xmmword ptr [rax]
140c1756f: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140c17573: 488b85f0070000 mov rax, qword ptr [rbp + 0x7f0]
140c1757a: 0f1185c8000000 movups xmmword ptr [rbp + 0xc8], xmm0
140c17581: 0f118dd8000000 movups xmmword ptr [rbp + 0xd8], xmm1
140c17588: 0f1000 movups xmm0, xmmword ptr [rax]
140c1758b: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140c1758f: 488b85f8070000 mov rax, qword ptr [rbp + 0x7f8]
140c17596: 0f118df8000000 movups xmmword ptr [rbp + 0xf8], xmm1
140c1759d: 0f1185e8000000 movups xmmword ptr [rbp + 0xe8], xmm0
140c175a4: 0f1000 movups xmm0, xmmword ptr [rax]
140c175a7: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140c175ab: 0f118508010000 movups xmmword ptr [rbp + 0x108], xmm0
140c175b2: 0f118d18010000 movups xmmword ptr [rbp + 0x118], xmm1
140c175b9: 488d8d68010000 lea rcx, [rbp + 0x168]
140c175c0: 41b8a0000000 mov r8d, 0xa0
140c175c6: e81c2bfe04 call 0x145bfa0e7
140c175cb: 0f1003 movups xmm0, xmmword ptr [rbx]
140c175ce: 0f104b10 movups xmm1, xmmword ptr [rbx + 0x10]
140c175d2: 0f118508020000 movups xmmword ptr [rbp + 0x208], xmm0
140c175d9: 0f118d18020000 movups xmmword ptr [rbp + 0x218], xmm1
140c175e0: 0f1007 movups xmm0, xmmword ptr [rdi]
140c175e3: f30f6f4f10 movdqu xmm1, xmmword ptr [rdi + 0x10]
140c175e8: 0f118528010000 movups xmmword ptr [rbp + 0x128], xmm0
140c175ef: f30f7f8d38010000 movdqu xmmword ptr [rbp + 0x138], xmm1
140c175f7: f30f6f06 movdqu xmm0, xmmword ptr [rsi]
140c175fb: f30f7f8528020000 movdqu xmmword ptr [rbp + 0x228], xmm0
140c17603: 488b4610 mov rax, qword ptr [rsi + 0x10]
140c17607: 48898538020000 mov qword ptr [rbp + 0x238], rax
140c1760e: 488dbda0030000 lea rdi, [rbp + 0x3a0]
140c17615: 4889f9 mov rcx, rdi
140c17618: e8335e97ff call 0x14058d450
140c1761d: 83bda003000001 cmp dword ptr [rbp + 0x3a0], 1
140c17624: 7565 jne 0x140c1768b
140c17626: f3440f108dac030000 movss xmm9, dword ptr [rbp + 0x3ac]
140c1762f: 8bb5a4030000 mov esi, dword ptr [rbp + 0x3a4]
140c17635: 448bada8030000 mov r13d, dword ptr [rbp + 0x3a8]
140c1763c: 83fe01 cmp esi, 1
140c1763f: 89f2 mov edx, esi
140c17641: 83d200 adc edx, 0
140c17644: 4183fd01 cmp r13d, 1
140c17648: 4589e8 mov r8d, r13d
140c1764b: 4183d000 adc r8d, 0
140c1764f: f30f10b5b0030000 movss xmm6, dword ptr [rbp + 0x3b0]
140c17657: 4c8b7548 mov r14, qword ptr [rbp + 0x48]
140c1765b: 418b8690000000 mov eax, dword ptr [r14 + 0x90]
140c17662: 85c0 test eax, eax
140c17664: 448985b0060000 mov dword ptr [rbp + 0x6b0], r8d
140c1766b: 8995c4060000 mov dword ptr [rbp + 0x6c4], edx
140c17671: 0f843b020000 je 0x140c178b2
140c17677: 448bbd84000000 mov r15d, dword ptr [rbp + 0x84]
140c1767e: 488b5d68 mov rbx, qword ptr [rbp + 0x68]
140c17682: 4c8b6578 mov r12, qword ptr [rbp + 0x78]
140c17686: e9e3090000 jmp 0x140c1806e
140c1768b: 448b7564 mov r14d, dword ptr [rbp + 0x64]
140c1768f: 4c8b7d58 mov r15, qword ptr [rbp + 0x58]
140c17693: 458937 mov dword ptr [r15], r14d
140c17696: 488b5d48 mov rbx, qword ptr [rbp + 0x48]
140c1769a: f20f10b390000000 movsd xmm6, qword ptr [rbx + 0x90]
140c176a2: 83bb9000000000 cmp dword ptr [rbx + 0x90], 0
140c176a9: c7839000000000000000 mov dword ptr [rbx + 0x90], 0
140c176b3: 0f8414190000 je 0x140c18fcd
140c176b9: 8b8584000000 mov eax, dword ptr [rbp + 0x84]
140c176bf: 488b4d78 mov rcx, qword ptr [rbp + 0x78]
140c176c3: 8901 mov dword ptr [rcx], eax
140c176c5: 488b7568 mov rsi, qword ptr [rbp + 0x68]
140c176c9: 488d4e20 lea rcx, [rsi + 0x20]
140c176cd: 488d3dc5213305 lea rdi, [rip + 0x53321c5]
140c176d4: 41b804000000 mov r8d, 4
140c176da: 4889fa mov rdx, rdi
140c176dd: e86e603fff call 0x14000d750
140c176e2: 48c744242004000000 mov qword ptr [rsp + 0x20], 4
140c176eb: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c176f2: 4889f2 mov rdx, rsi
140c176f5: 4989c0 mov r8, rax
140c176f8: 4989f9 mov r9, rdi
140c176fb: e810ec93ff call 0x140556310
140c17700: 488bb5b8030000 mov rsi, qword ptr [rbp + 0x3b8]
140c17707: 4883fe02 cmp rsi, 2
140c1770b: 0f84aa000000 je 0x140c177bb
140c17711: 488d95c0030000 lea rdx, [rbp + 0x3c0]
140c17718: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c1771f: 41b8b0000000 mov r8d, 0xb0
140c17725: e8bd29fe04 call 0x145bfa0e7
140c1772a: 488b95a0030000 mov rdx, qword ptr [rbp + 0x3a0]
140c17731: 4885d2 test rdx, rdx
140c17734: 7412 je 0x140c17748
140c17736: 488b8da8030000 mov rcx, qword ptr [rbp + 0x3a8]
140c1773d: 41b801000000 mov r8d, 1
140c17743: e888aa3eff call 0x1400021d0
140c17748: 4889b5a0030000 mov qword ptr [rbp + 0x3a0], rsi
140c1774f: 488d8da8030000 lea rcx, [rbp + 0x3a8]
140c17756: 488d95c0020000 lea rdx, [rbp + 0x2c0]
140c1775d: 41b8b0000000 mov r8d, 0xb0
140c17763: e87f29fe04 call 0x145bfa0e7
140c17768: 488b8530040000 mov rax, qword ptr [rbp + 0x430]
140c1776f: 488b4d40 mov rcx, qword ptr [rbp + 0x40]
140c17773: 48898510060000 mov qword ptr [rbp + 0x610], rax
140c1777a: 660f6f4520 movdqa xmm0, xmmword ptr [rbp + 0x20]
140c1777f: 660f6f4d30 movdqa xmm1, xmmword ptr [rbp + 0x30]
140c17784: f30f7f8518060000 movdqu xmmword ptr [rbp + 0x618], xmm0
140c1778c: f30f7f8d28060000 movdqu xmmword ptr [rbp + 0x628], xmm1
140c17794: 48898d38060000 mov qword ptr [rbp + 0x638], rcx
140c1779b: 488d153e213305 lea rdx, [rip + 0x533213e]
140c177a2: 488d8d10060000 lea rcx, [rbp + 0x610]
140c177a9: e822812604 call 0x144e7f8d0
140c177ae: 90 nop
140c177af: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c177b6: e8a58ef5ff call 0x140b70660
140c177bb: 488b4540 mov rax, qword ptr [rbp + 0x40]
140c177bf: 0f13b5a0030000 movlps qword ptr [rbp + 0x3a0], xmm6
140c177c6: 660f6f4520 movdqa xmm0, xmmword ptr [rbp + 0x20]
140c177cb: 660f6f4d30 movdqa xmm1, xmmword ptr [rbp + 0x30]
140c177d0: f30f7f85a8030000 movdqu xmmword ptr [rbp + 0x3a8], xmm0
140c177d8: f30f7f8db8030000 movdqu xmmword ptr [rbp + 0x3b8], xmm1
140c177e0: 488985c8030000 mov qword ptr [rbp + 0x3c8], rax
140c177e7: 488d150a213305 lea rdx, [rip + 0x533210a]
140c177ee: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c177f5: e8d6802604 call 0x144e7f8d0
140c177fa: 8b85a4000000 mov eax, dword ptr [rbp + 0xa4]
140c17800: 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
140c17807: 8901 mov dword ptr [rcx], eax
140c17809: 488bb588000000 mov rsi, qword ptr [rbp + 0x88]
140c17810: 488d4e20 lea rcx, [rsi + 0x20]
140c17814: 488d3d7e203305 lea rdi, [rip + 0x533207e]
140c1781b: 41b804000000 mov r8d, 4
140c17821: 4889fa mov rdx, rdi
140c17824: e8275f3fff call 0x14000d750
140c17829: 48c744242004000000 mov qword ptr [rsp + 0x20], 4
140c17832: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c17839: 4889f2 mov rdx, rsi
140c1783c: 4989c0 mov r8, rax
140c1783f: 4989f9 mov r9, rdi
140c17842: e839ee93ff call 0x140556680
140c17847: 488b95a0030000 mov rdx, qword ptr [rbp + 0x3a0]
140c1784e: 4883faff cmp rdx, -1
140c17852: 7417 je 0x140c1786b
140c17854: 4885d2 test rdx, rdx
140c17857: 7412 je 0x140c1786b
140c17859: 488b8da8030000 mov rcx, qword ptr [rbp + 0x3a8]
140c17860: 41b801000000 mov r8d, 1
140c17866: e865a93eff call 0x1400021d0
140c1786b: 458937 mov dword ptr [r15], r14d
140c1786e: c70300000000 mov dword ptr [rbx], 0
140c17874: c7431002000000 mov dword ptr [rbx + 0x10], 2
140c1787b: c7839000000000000000 mov dword ptr [rbx + 0x90], 0
140c17885: 48c7839800000000000000 mov qword ptr [rbx + 0x98], 0
140c17890: c783a000000000000000 mov dword ptr [rbx + 0xa0], 0
140c1789a: c685a003000002 mov byte ptr [rbp + 0x3a0], 2
140c178a1: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c178a8: e8135e97ff call 0x14058d6c0
140c178ad: e91b170000 jmp 0x140c18fcd
140c178b2: 4c89b5f8060000 mov qword ptr [rbp + 0x6f8], r14
140c178b9: 8b85e4000000 mov eax, dword ptr [rbp + 0xe4]
140c178bf: 488b8dd8000000 mov rcx, qword ptr [rbp + 0xd8]
140c178c6: 8901 mov dword ptr [rcx], eax
140c178c8: 488b9dc8000000 mov rbx, qword ptr [rbp + 0xc8]
140c178cf: 899510060000 mov dword ptr [rbp + 0x610], edx
140c178d5: 44898514060000 mov dword ptr [rbp + 0x614], r8d
140c178dc: c7851806000001000000 mov dword ptr [rbp + 0x618], 1
140c178e6: c785a003000028000000 mov dword ptr [rbp + 0x3a0], 0x28
140c178f0: 48897c2428 mov qword ptr [rsp + 0x28], rdi
140c178f5: c644243003 mov byte ptr [rsp + 0x30], 3
140c178fa: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
140c17903: 4c8d0dd60b3305 lea r9, [rip + 0x5330bd6]
140c1790a: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c17911: 488d9510060000 lea rdx, [rbp + 0x610]
140c17918: 41b801000000 mov r8d, 1
140c1791e: e85deeca03 call 0x1448c6780
140c17923: c7858403000016000000 mov dword ptr [rbp + 0x384], 0x16
140c1792d: 488b4b50 mov rcx, qword ptr [rbx + 0x50]
140c17931: 4883c110 add rcx, 0x10
140c17935: c685ef06000001 mov byte ptr [rbp + 0x6ef], 1
140c1793c: e87fb3d403 call 0x144962cc0
140c17941: 90 nop
140c17942: 4189c6 mov r14d, eax
140c17945: 4189d7 mov r15d, edx
140c17948: 488d95c0020000 lea rdx, [rbp + 0x2c0]
140c1794f: 41b8e0000000 mov r8d, 0xe0
140c17955: 4889f9 mov rcx, rdi
140c17958: e88a27fe04 call 0x145bfa0e7
140c1795d: c685ef06000000 mov byte ptr [rbp + 0x6ef], 0
140c17964: 48897c2420 mov qword ptr [rsp + 0x20], rdi
140c17969: 488d8d10060000 lea rcx, [rbp + 0x610]
140c17970: 4889da mov rdx, rbx
140c17973: 4589f0 mov r8d, r14d
140c17976: 4589f9 mov r9d, r15d
140c17979: e872d1e0ff call 0x140a24af0
140c1797e: 90 nop
140c1797f: 83bd1006000002 cmp dword ptr [rbp + 0x610], 2
140c17986: 0f85bd1e0000 jne 0x140c19849
140c1798c: 48c785a0030000ffffffff mov qword ptr [rbp + 0x3a0], 0xffffffffffffffff
140c17997: c685ef06000000 mov byte ptr [rbp + 0x6ef], 0
140c1799e: 48897c2420 mov qword ptr [rsp + 0x20], rdi
140c179a3: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
140c179ac: 4889d9 mov rcx, rbx
140c179af: 4489f2 mov edx, r14d
140c179b2: 4589f8 mov r8d, r15d
140c179b5: 4531c9 xor r9d, r9d
140c179b8: e883ded503 call 0x144975840
140c179bd: 90 nop
140c179be: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c179c5: 488985a0050000 mov qword ptr [rbp + 0x5a0], rax
140c179cc: c6859805000000 mov byte ptr [rbp + 0x598], 0
140c179d3: c685ed06000001 mov byte ptr [rbp + 0x6ed], 1
140c179da: 488d9d60020000 lea rbx, [rbp + 0x260]
140c179e1: ba3f000000 mov edx, 0x3f
140c179e6: 4889d9 mov rcx, rbx
140c179e9: e822d76f03 call 0x144315110
140c179ee: 90 nop
140c179ef: 48c785b803000000000000 mov qword ptr [rbp + 0x3b8], 0
140c179fa: 48c785a0030000ffffffff mov qword ptr [rbp + 0x3a0], 0xffffffffffffffff
140c17a05: 488d05241e3305 lea rax, [rip + 0x5331e24]
140c17a0c: 488985a8030000 mov qword ptr [rbp + 0x3a8], rax
140c17a13: 48c785b00300000f000000 mov qword ptr [rbp + 0x3b0], 0xf
140c17a1e: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c17a25: e8b6be1f04 call 0x144e138e0
140c17a2a: 90 nop
140c17a2b: 4c8db5b0030000 lea r14, [rbp + 0x3b0]
140c17a32: 488b85a0030000 mov rax, qword ptr [rbp + 0x3a0]
140c17a39: 488985e0060000 mov qword ptr [rbp + 0x6e0], rax
140c17a40: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140c17a47: 488985b8060000 mov qword ptr [rbp + 0x6b8], rax
140c17a4e: f3410f6f06 movdqu xmm0, xmmword ptr [r14]
140c17a53: 660f7f8510060000 movdqa xmmword ptr [rbp + 0x610], xmm0
140c17a5b: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140c17a62: 4883f802 cmp rax, 2
140c17a66: 720e jb 0x140c17a76
140c17a68: 488b9d60020000 mov rbx, qword ptr [rbp + 0x260]
140c17a6f: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140c17a76: 4c8d04c3 lea r8, [rbx + rax*8]
140c17a7a: 48c785d002000000000000 mov qword ptr [rbp + 0x2d0], 0
140c17a85: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c17a8c: 4889da mov rdx, rbx
140c17a8f: e83c2f3b00 call 0x140fca9d0
140c17a94: 90 nop
140c17a95: 488b85d0020000 mov rax, qword ptr [rbp + 0x2d0]
140c17a9c: 48898508040000 mov qword ptr [rbp + 0x408], rax
140c17aa3: 0f1085c0020000 movups xmm0, xmmword ptr [rbp + 0x2c0]
140c17aaa: 0f1185f8030000 movups xmmword ptr [rbp + 0x3f8], xmm0
140c17ab1: 488b85e0060000 mov rax, qword ptr [rbp + 0x6e0]
140c17ab8: 488985a0030000 mov qword ptr [rbp + 0x3a0], rax
140c17abf: 488b85b8060000 mov rax, qword ptr [rbp + 0x6b8]
140c17ac6: 488985a8030000 mov qword ptr [rbp + 0x3a8], rax
140c17acd: 0f288510060000 movaps xmm0, xmmword ptr [rbp + 0x610]
140c17ad4: 0f2985b0030000 movaps xmmword ptr [rbp + 0x3b0], xmm0
140c17adb: 0f28053e7a3205 movaps xmm0, xmmword ptr [rip + 0x5327a3e]
140c17ae2: 0f2985c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm0
140c17ae9: 0f2805407a3205 movaps xmm0, xmmword ptr [rip + 0x5327a40]
140c17af0: 0f2985d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm0
140c17af7: 660f6f05417a3205 movdqa xmm0, xmmword ptr [rip + 0x5327a41]
140c17aff: 660f7f85e0030000 movdqa xmmword ptr [rbp + 0x3e0], xmm0
140c17b07: c685f003000002 mov byte ptr [rbp + 0x3f0], 2
140c17b0e: c6850707000001 mov byte ptr [rbp + 0x707], 1
140c17b15: c6850607000001 mov byte ptr [rbp + 0x706], 1
140c17b1c: 4c8d0d4d1d3305 lea r9, [rip + 0x5331d4d]
140c17b23: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c17b2a: 488d5520 lea rdx, [rbp + 0x20]
140c17b2e: 4c8d85a0030000 lea r8, [rbp + 0x3a0]
140c17b35: e8a632cdff call 0x1408eade0
140c17b3a: 90 nop
140c17b3b: 488bbdc0020000 mov rdi, qword ptr [rbp + 0x2c0]
140c17b42: 48c785b803000000000000 mov qword ptr [rbp + 0x3b8], 0
140c17b4d: 48c785a0030000ffffffff mov qword ptr [rbp + 0x3a0], 0xffffffffffffffff
140c17b58: 488d05291d3305 lea rax, [rip + 0x5331d29]
140c17b5f: 488985a8030000 mov qword ptr [rbp + 0x3a8], rax
140c17b66: 48c785b003000011000000 mov qword ptr [rbp + 0x3b0], 0x11
140c17b71: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c17b78: e863bd1f04 call 0x144e138e0
140c17b7d: 90 nop
140c17b7e: 488b85a0030000 mov rax, qword ptr [rbp + 0x3a0]
140c17b85: 488985e0060000 mov qword ptr [rbp + 0x6e0], rax
140c17b8c: 488b95a8030000 mov rdx, qword ptr [rbp + 0x3a8]
140c17b93: f3410f6f06 movdqu xmm0, xmmword ptr [r14]
140c17b98: 660f7f8590060000 movdqa xmmword ptr [rbp + 0x690], xmm0
140c17ba0: b001 mov al, 1
140c17ba2: 80bd9805000000 cmp byte ptr [rbp + 0x598], 0
140c17ba9: 488b8df0060000 mov rcx, qword ptr [rbp + 0x6f0]
140c17bb0: 750c jne 0x140c17bbe
140c17bb2: f048ff01 lock inc qword ptr [rcx]
140c17bb6: 0f8e711c0000 jle 0x140c1982d
140c17bbc: 31c0 xor eax, eax
140c17bbe: 888510060000 mov byte ptr [rbp + 0x610], al
140c17bc4: 48898d18060000 mov qword ptr [rbp + 0x618], rcx
140c17bcb: 48c7852006000000000000 mov qword ptr [rbp + 0x620], 0
140c17bd6: c785280600000000803f mov dword ptr [rbp + 0x628], 0x3f800000
140c17be0: 0f2805595f3205 movaps xmm0, xmmword ptr [rip + 0x5325f59]
140c17be7: 0f2985d0020000 movaps xmmword ptr [rbp + 0x2d0], xmm0
140c17bee: 660f6f055a5f3205 movdqa xmm0, xmmword ptr [rip + 0x5325f5a]
140c17bf6: 660f7f85e0020000 movdqa xmmword ptr [rbp + 0x2e0], xmm0
140c17bfe: c785c002000006000000 mov dword ptr [rbp + 0x2c0], 6
140c17c08: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140c17c0f: 4883f802 cmp rax, 2
140c17c13: 488995b8060000 mov qword ptr [rbp + 0x6b8], rdx
140c17c1a: 7210 jb 0x140c17c2c
140c17c1c: 488b9560020000 mov rdx, qword ptr [rbp + 0x260]
140c17c23: 488b8568020000 mov rax, qword ptr [rbp + 0x268]
140c17c2a: eb07 jmp 0x140c17c33
140c17c2c: 488d9560020000 lea rdx, [rbp + 0x260]
140c17c33: 4c8d04c2 lea r8, [rdx + rax*8]
140c17c37: 48c785b003000000000000 mov qword ptr [rbp + 0x3b0], 0
140c17c42: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c17c49: e8822d3b00 call 0x140fca9d0
140c17c4e: 90 nop
140c17c4f: 488b9da0030000 mov rbx, qword ptr [rbp + 0x3a0]
140c17c56: 4c8bb5b0030000 mov r14, qword ptr [rbp + 0x3b0]
140c17c5d: 0f10bda8030000 movups xmm7, xmmword ptr [rbp + 0x3a8]
140c17c64: e897a53eff call 0x140002200
140c17c69: b904000000 mov ecx, 4
140c17c6e: ba01000000 mov edx, 1
140c17c73: e848a53eff call 0x1400021c0
140c17c78: 4885c0 test rax, rax
140c17c7b: 0f84a01c0000 je 0x140c19921
140c17c81: c7006865726f mov dword ptr [rax], 0x6f726568
140c17c87: 488b8de0060000 mov rcx, qword ptr [rbp + 0x6e0]
140c17c8e: 48898da0030000 mov qword ptr [rbp + 0x3a0], rcx
140c17c95: 488b8db8060000 mov rcx, qword ptr [rbp + 0x6b8]
140c17c9c: 48898da8030000 mov qword ptr [rbp + 0x3a8], rcx
140c17ca3: 0f288590060000 movaps xmm0, xmmword ptr [rbp + 0x690]
140c17caa: 0f2985b0030000 movaps xmmword ptr [rbp + 0x3b0], xmm0
140c17cb1: 48c7852005000000000000 mov qword ptr [rbp + 0x520], 0
140c17cbc: 48c7852805000001000000 mov qword ptr [rbp + 0x528], 1
140c17cc7: c7853005000010000000 mov dword ptr [rbp + 0x530], 0x10
140c17cd1: c6853405000001 mov byte ptr [rbp + 0x534], 1
140c17cd8: 66c785380500000001 mov word ptr [rbp + 0x538], 0x100
140c17ce1: c7853c05000002000000 mov dword ptr [rbp + 0x53c], 2
140c17ceb: c785c003000000000000 mov dword ptr [rbp + 0x3c0], 0
140c17cf5: 0f2805d4fd3205 movaps xmm0, xmmword ptr [rip + 0x532fdd4]
140c17cfc: 0f2985d0030000 movaps xmmword ptr [rbp + 0x3d0], xmm0
140c17d03: 0f2805d6fd3205 movaps xmm0, xmmword ptr [rip + 0x532fdd6]
140c17d0a: 0f2985e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm0
140c17d11: 0f2805d8fd3205 movaps xmm0, xmmword ptr [rip + 0x532fdd8]
140c17d18: 0f2985f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm0
140c17d1f: 0f2805dafd3205 movaps xmm0, xmmword ptr [rip + 0x532fdda]
140c17d26: 0f298500040000 movaps xmmword ptr [rbp + 0x400], xmm0
140c17d2d: c7851004000000000000 mov dword ptr [rbp + 0x410], 0
140c17d37: c7851c04000000000000 mov dword ptr [rbp + 0x41c], 0
140c17d41: 48c78540040000ceffffff mov qword ptr [rbp + 0x440], 0xffffffffffffffce
140c17d4c: c7854804000000000000 mov dword ptr [rbp + 0x448], 0
140c17d56: c7856404000000000000 mov dword ptr [rbp + 0x464], 0
140c17d60: c785800400000a000000 mov dword ptr [rbp + 0x480], 0xa
140c17d6a: c785a8040000ffffffff mov dword ptr [rbp + 0x4a8], 0xffffffff
140c17d74: 0f10053dfd3205 movups xmm0, xmmword ptr [rip + 0x532fd3d]
140c17d7b: 0f1185ac040000 movups xmmword ptr [rbp + 0x4ac], xmm0
140c17d82: c785bc04000000000000 mov dword ptr [rbp + 0x4bc], 0
140c17d8c: 66c785c00400000100 mov word ptr [rbp + 0x4c0], 1
140c17d95: c685c204000001 mov byte ptr [rbp + 0x4c2], 1
140c17d9c: 0f108510060000 movups xmm0, xmmword ptr [rbp + 0x610]
140c17da3: 0f108d20060000 movups xmm1, xmmword ptr [rbp + 0x620]
140c17daa: 0f298500050000 movaps xmmword ptr [rbp + 0x500], xmm0
140c17db1: 0f298d10050000 movaps xmmword ptr [rbp + 0x510], xmm1
140c17db8: c7855805000000000000 mov dword ptr [rbp + 0x558], 0
140c17dc2: c6855c05000002 mov byte ptr [rbp + 0x55c], 2
140c17dc9: 660f6f85c0020000 movdqa xmm0, xmmword ptr [rbp + 0x2c0]
140c17dd1: 660f6f8dd0020000 movdqa xmm1, xmmword ptr [rbp + 0x2d0]
140c17dd9: 660f6f95e0020000 movdqa xmm2, xmmword ptr [rbp + 0x2e0]
140c17de1: 660f7f95f0040000 movdqa xmmword ptr [rbp + 0x4f0], xmm2
140c17de9: 660f7f8de0040000 movdqa xmmword ptr [rbp + 0x4e0], xmm1
140c17df1: 660f7f85d0040000 movdqa xmmword ptr [rbp + 0x4d0], xmm0
140c17df9: 48899d60050000 mov qword ptr [rbp + 0x560], rbx
140c17e00: 0f11bd68050000 movups xmmword ptr [rbp + 0x568], xmm7
140c17e07: 48c7857805000004000000 mov qword ptr [rbp + 0x578], 4
140c17e12: 48898580050000 mov qword ptr [rbp + 0x580], rax
140c17e19: 48c7858805000004000000 mov qword ptr [rbp + 0x588], 4
140c17e24: c6850707000001 mov byte ptr [rbp + 0x707], 1
140c17e2b: c6850607000001 mov byte ptr [rbp + 0x706], 1
140c17e32: 4c8d0d671a3305 lea r9, [rip + 0x5331a67]
140c17e39: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c17e40: 488d5520 lea rdx, [rbp + 0x20]
140c17e44: 4c8d85a0030000 lea r8, [rbp + 0x3a0]
140c17e4b: e88035cdff call 0x1408eb3d0
140c17e50: 90 nop
140c17e51: 4c8bb5c0020000 mov r14, qword ptr [rbp + 0x2c0]
140c17e58: 448bbd84000000 mov r15d, dword ptr [rbp + 0x84]
140c17e5f: 4c8b6578 mov r12, qword ptr [rbp + 0x78]
140c17e63: 45893c24 mov dword ptr [r12], r15d
140c17e67: 488b5d68 mov rbx, qword ptr [rbp + 0x68]
140c17e6b: e890a33eff call 0x140002200
140c17e70: b904000000 mov ecx, 4
140c17e75: ba01000000 mov edx, 1
140c17e7a: e841a33eff call 0x1400021c0
140c17e7f: 4885c0 test rax, rax
140c17e82: 0f84bc1a0000 je 0x140c19944
140c17e88: c7006865726f mov dword ptr [rax], 0x6f726568
140c17e8e: 48c7851006000004000000 mov qword ptr [rbp + 0x610], 4
140c17e99: 48898518060000 mov qword ptr [rbp + 0x618], rax
140c17ea0: 48c7852006000004000000 mov qword ptr [rbp + 0x620], 4
140c17eab: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140c17eb2: 488985d0020000 mov qword ptr [rbp + 0x2d0], rax
140c17eb9: f30f6f8560020000 movdqu xmm0, xmmword ptr [rbp + 0x260]
140c17ec1: 660f7f85c0020000 movdqa xmmword ptr [rbp + 0x2c0], xmm0
140c17ec9: 80bd9805000001 cmp byte ptr [rbp + 0x598], 1
140c17ed0: 488b95f0060000 mov rdx, qword ptr [rbp + 0x6f0]
140c17ed7: 751c jne 0x140c17ef5
140c17ed9: 8b8599050000 mov eax, dword ptr [rbp + 0x599]
140c17edf: 8b8d9c050000 mov ecx, dword ptr [rbp + 0x59c]
140c17ee5: 898d93060000 mov dword ptr [rbp + 0x693], ecx
140c17eeb: 898590060000 mov dword ptr [rbp + 0x690], eax
140c17ef1: b001 mov al, 1
140c17ef3: eb0c jmp 0x140c17f01
140c17ef5: f048ff02 lock inc qword ptr [rdx]
140c17ef9: 0f8e2e190000 jle 0x140c1982d
140c17eff: 31c0 xor eax, eax
140c17f01: 488b8dd0020000 mov rcx, qword ptr [rbp + 0x2d0]
140c17f08: 48898d48040000 mov qword ptr [rbp + 0x448], rcx
140c17f0f: 660f6f85c0020000 movdqa xmm0, xmmword ptr [rbp + 0x2c0]
140c17f17: f30f7f8538040000 movdqu xmmword ptr [rbp + 0x438], xmm0
140c17f1f: 4889bd30040000 mov qword ptr [rbp + 0x430], rdi
140c17f26: 888518040000 mov byte ptr [rbp + 0x418], al
140c17f2c: 8b8590060000 mov eax, dword ptr [rbp + 0x690]
140c17f32: 8b8d93060000 mov ecx, dword ptr [rbp + 0x693]
140c17f38: 898519040000 mov dword ptr [rbp + 0x419], eax
140c17f3e: 898d1c040000 mov dword ptr [rbp + 0x41c], ecx
140c17f44: 48899520040000 mov qword ptr [rbp + 0x420], rdx
140c17f4b: 48c7852804000000000000 mov qword ptr [rbp + 0x428], 0
140c17f56: 48c785e8030000ffffffff mov qword ptr [rbp + 0x3e8], 0xffffffffffffffff
140c17f61: 48c785a003000000000000 mov qword ptr [rbp + 0x3a0], 0
140c17f6c: c7855004000000000000 mov dword ptr [rbp + 0x450], 0
140c17f76: 48c785d003000000000000 mov qword ptr [rbp + 0x3d0], 0
140c17f81: 48c785d803000008000000 mov qword ptr [rbp + 0x3d8], 8
140c17f8c: 48c785e003000000000000 mov qword ptr [rbp + 0x3e0], 0
140c17f97: 48c785b003000000000000 mov qword ptr [rbp + 0x3b0], 0
140c17fa2: 48c785c003000000000000 mov qword ptr [rbp + 0x3c0], 0
140c17fad: c7855404000000000000 mov dword ptr [rbp + 0x454], 0
140c17fb7: c6850707000000 mov byte ptr [rbp + 0x707], 0
140c17fbe: c6850607000001 mov byte ptr [rbp + 0x706], 1
140c17fc5: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c17fcc: 4c8d8510060000 lea r8, [rbp + 0x610]
140c17fd3: 4c8d8da0030000 lea r9, [rbp + 0x3a0]
140c17fda: 4889da mov rdx, rbx
140c17fdd: e8fe74beff call 0x1407ff4e0
140c17fe2: 90 nop
140c17fe3: 83bdc002000002 cmp dword ptr [rbp + 0x2c0], 2
140c17fea: 741b je 0x140c18007
140c17fec: c6850707000000 mov byte ptr [rbp + 0x707], 0
140c17ff3: c6850607000001 mov byte ptr [rbp + 0x706], 1
140c17ffa: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c18001: e85a86f5ff call 0x140b70660
140c18006: 90 nop
140c18007: 8b4564 mov eax, dword ptr [rbp + 0x64]
140c1800a: 488b4d58 mov rcx, qword ptr [rbp + 0x58]
140c1800e: 488b95f8060000 mov rdx, qword ptr [rbp + 0x6f8]
140c18015: 4c89b290000000 mov qword ptr [rdx + 0x90], r14
140c1801c: 8901 mov dword ptr [rcx], eax
140c1801e: 8b85c4060000 mov eax, dword ptr [rbp + 0x6c4]
140c18024: 898298000000 mov dword ptr [rdx + 0x98], eax
140c1802a: 8b85b0060000 mov eax, dword ptr [rbp + 0x6b0]
140c18030: 89829c000000 mov dword ptr [rdx + 0x9c], eax
140c18036: c6850707000000 mov byte ptr [rbp + 0x707], 0
140c1803d: c6850607000000 mov byte ptr [rbp + 0x706], 0
140c18044: 488d8d98050000 lea rcx, [rbp + 0x598]
140c1804b: e8705697ff call 0x14058d6c0
140c18050: 90 nop
140c18051: 4c8bb5f8060000 mov r14, qword ptr [rbp + 0x6f8]
140c18058: 418b8690000000 mov eax, dword ptr [r14 + 0x90]
140c1805f: 85c0 test eax, eax
140c18061: 488dbda0030000 lea rdi, [rbp + 0x3a0]
140c18068: 0f84c1170000 je 0x140c1982f
140c1806e: 418b8e94000000 mov ecx, dword ptr [r14 + 0x94]
140c18075: 45893c24 mov dword ptr [r12], r15d
140c18079: 48837b1800 cmp qword ptr [rbx + 0x18], 0
140c1807e: 0f84490f0000 je 0x140c18fcd
140c18084: 4189cf mov r15d, ecx
140c18087: 48c1e120 shl rcx, 0x20
140c1808b: 4189c4 mov r12d, eax
140c1808e: 4c09e1 or rcx, r12
140c18091: 48898db8060000 mov qword ptr [rbp + 0x6b8], rcx
140c18098: 488d4b20 lea rcx, [rbx + 0x20]
140c1809c: 488d15f6173305 lea rdx, [rip + 0x53317f6]
140c180a3: 41b804000000 mov r8d, 4
140c180a9: e8a2563fff call 0x14000d750
140c180ae: 4989c0 mov r8, rax
140c180b1: 49c1e839 shr r8, 0x39
140c180b5: 488b0b mov rcx, qword ptr [rbx]
140c180b8: 488b5308 mov rdx, qword ptr [rbx + 8]
140c180bc: 66410f6ec0 movd xmm0, r8d
140c180c1: 660f60c0 punpcklbw xmm0, xmm0
140c180c5: f20f70c000 pshuflw xmm0, xmm0, 0
140c180ca: 660f70c044 pshufd xmm0, xmm0, 0x44
140c180cf: 4531c0 xor r8d, r8d
140c180d2: 660f76c9 pcmpeqd xmm1, xmm1
140c180d6: 4821d0 and rax, rdx
140c180d9: f30f6f1401 movdqu xmm2, xmmword ptr [rcx + rax]
140c180de: 660f6fda movdqa xmm3, xmm2
140c180e2: 660f74d8 pcmpeqb xmm3, xmm0
140c180e6: 66440fd7cb pmovmskb r9d, xmm3
140c180eb: 4585c9 test r9d, r9d
140c180ee: 7440 je 0x140c18130
140c180f0: f3450fbcd1 tzcnt r10d, r9d
140c180f5: 4901c2 add r10, rax
140c180f8: 4921d2 and r10, rdx
140c180fb: 49f7da neg r10
140c180fe: 4969dad0000000 imul rbx, r10, 0xd0
140c18105: 4883bc1940ffffff04 cmp qword ptr [rcx + rbx - 0xc0], 4
140c1810e: 7513 jne 0x140c18123
140c18110: 4801cb add rbx, rcx
140c18113: 4c8b9338ffffff mov r10, qword ptr [rbx - 0xc8]
140c1811a: 41813a6865726f cmp dword ptr [r10], 0x6f726568
140c18121: 742c je 0x140c1814f
140c18123: 458d51ff lea r10d, [r9 - 1]
140c18127: 664521ca and r10w, r9w
140c1812b: 4589d1 mov r9d, r10d
140c1812e: 75c0 jne 0x140c180f0
140c18130: 660f74d1 pcmpeqb xmm2, xmm1
140c18134: 66440fd7ca pmovmskb r9d, xmm2
140c18139: 4585c9 test r9d, r9d
140c1813c: 0f858b0e0000 jne 0x140c18fcd
140c18142: 4c01c0 add rax, r8
140c18145: 4883c010 add rax, 0x10
140c18149: 4983c010 add r8, 0x10
140c1814d: eb87 jmp 0x140c180d6
140c1814f: 4109f5 or r13d, esi
140c18152: 448badc4060000 mov r13d, dword ptr [rbp + 0x6c4]
140c18159: 48899de0060000 mov qword ptr [rbp + 0x6e0], rbx
140c18160: 0f8481030000 je 0x140c184e7
140c18166: 4539ae98000000 cmp dword ptr [r14 + 0x98], r13d
140c1816d: 7513 jne 0x140c18182
140c1816f: 8b85b0060000 mov eax, dword ptr [rbp + 0x6b0]
140c18175: 4139869c000000 cmp dword ptr [r14 + 0x9c], eax
140c1817c: 0f8465030000 je 0x140c184e7
140c18182: 4589e8 mov r8d, r13d
140c18185: 4589fd mov r13d, r15d
140c18188: 8b4564 mov eax, dword ptr [rbp + 0x64]
140c1818b: 488b4d58 mov rcx, qword ptr [rbp + 0x58]
140c1818f: 8901 mov dword ptr [rcx], eax
140c18191: 45898698000000 mov dword ptr [r14 + 0x98], r8d
140c18198: 4c89f6 mov rsi, r14
140c1819b: 8b95b0060000 mov edx, dword ptr [rbp + 0x6b0]
140c181a1: 4189969c000000 mov dword ptr [r14 + 0x9c], edx
140c181a8: 8b85e4000000 mov eax, dword ptr [rbp + 0xe4]
140c181ae: 488b8dd8000000 mov rcx, qword ptr [rbp + 0xd8]
140c181b5: 8901 mov dword ptr [rcx], eax
140c181b7: 488b9dc8000000 mov rbx, qword ptr [rbp + 0xc8]
140c181be: 44898510060000 mov dword ptr [rbp + 0x610], r8d
140c181c5: 899514060000 mov dword ptr [rbp + 0x614], edx
140c181cb: c7851806000001000000 mov dword ptr [rbp + 0x618], 1
140c181d5: c785a003000028000000 mov dword ptr [rbp + 0x3a0], 0x28
140c181df: 48897c2428 mov qword ptr [rsp + 0x28], rdi
140c181e4: c644243003 mov byte ptr [rsp + 0x30], 3
140c181e9: 48c744242008000000 mov qword ptr [rsp + 0x20], 8
140c181f2: 4c8d0de7023305 lea r9, [rip + 0x53302e7]
140c181f9: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c18200: 488d9510060000 lea rdx, [rbp + 0x610]
140c18207: 41b801000000 mov r8d, 1
140c1820d: e86ee5ca03 call 0x1448c6780
140c18212: c7858403000016000000 mov dword ptr [rbp + 0x384], 0x16
140c1821c: 488b4b50 mov rcx, qword ptr [rbx + 0x50]
140c18220: 4883c110 add rcx, 0x10
140c18224: c685ee06000001 mov byte ptr [rbp + 0x6ee], 1
140c1822b: e890aad403 call 0x144962cc0
140c18230: 90 nop
140c18231: 4189c6 mov r14d, eax
140c18234: 4189d7 mov r15d, edx
140c18237: 488d95c0020000 lea rdx, [rbp + 0x2c0]
140c1823e: 41b8e0000000 mov r8d, 0xe0
140c18244: 4889f9 mov rcx, rdi
140c18247: e89b1efe04 call 0x145bfa0e7
140c1824c: c685ee06000000 mov byte ptr [rbp + 0x6ee], 0
140c18253: 48897c2420 mov qword ptr [rsp + 0x20], rdi
140c18258: 488d8d10060000 lea rcx, [rbp + 0x610]
140c1825f: 4889da mov rdx, rbx
140c18262: 4589f0 mov r8d, r14d
140c18265: 4589f9 mov r9d, r15d
140c18268: e883c8e0ff call 0x140a24af0
140c1826d: 90 nop
140c1826e: 83bd1006000002 cmp dword ptr [rbp + 0x610], 2
140c18275: 0f8513160000 jne 0x140c1988e
140c1827b: 48c785a0030000ffffffff mov qword ptr [rbp + 0x3a0], 0xffffffffffffffff
140c18286: c685ee06000000 mov byte ptr [rbp + 0x6ee], 0
140c1828d: 48897c2420 mov qword ptr [rsp + 0x20], rdi
140c18292: 48c744242800000000 mov qword ptr [rsp + 0x28], 0
140c1829b: 4889d9 mov rcx, rbx
140c1829e: 4489f2 mov edx, r14d
140c182a1: 4589f8 mov r8d, r15d
140c182a4: 4531c9 xor r9d, r9d
140c182a7: e894d5d503 call 0x144975840
140c182ac: 90 nop
140c182ad: 488985a8030000 mov qword ptr [rbp + 0x3a8], rax
140c182b4: c685a003000000 mov byte ptr [rbp + 0x3a0], 0
140c182bb: 488b8d30020000 mov rcx, qword ptr [rbp + 0x230]
140c182c2: baffffffff mov edx, 0xffffffff
140c182c7: 4931d4 xor r12, rdx
140c182ca: 4f8d0464 lea r8, [r12 + r12*2]
140c182ce: 49c1e003 shl r8, 3
140c182d2: 4c034108 add r8, qword ptr [rcx + 8]
140c182d6: 4c3b6110 cmp r12, qword ptr [rcx + 0x10]
140c182da: 488d15378a3205 lea rdx, [rip + 0x5328a37]
140c182e1: 490f42d0 cmovb rdx, r8
140c182e5: 44396a10 cmp dword ptr [rdx + 0x10], r13d
140c182e9: 0f8547010000 jne 0x140c18436
140c182ef: 833a00 cmp dword ptr [rdx], 0
140c182f2: 0f843e010000 je 0x140c18436
140c182f8: 488b7a04 mov rdi, qword ptr [rdx + 4]
140c182fc: 4989f9 mov r9, rdi
140c182ff: 49c1e920 shr r9, 0x20
140c18303: 4c8b8528020000 mov r8, qword ptr [rbp + 0x228]
140c1830a: 4d394838 cmp qword ptr [r8 + 0x38], r9
140c1830e: 0f8622010000 jbe 0x140c18436
140c18314: 4989fa mov r10, rdi
140c18317: 49c1ea26 shr r10, 0x26
140c1831b: 4d8b5828 mov r11, qword ptr [r8 + 0x28]
140c1831f: 4f8b14d3 mov r10, qword ptr [r11 + r10*8]
140c18323: 4d0fa3ca bt r10, r9
140c18327: 0f8309010000 jae 0x140c18436
140c1832d: 448b4a0c mov r9d, dword ptr [rdx + 0xc]
140c18331: 8b953c020000 mov edx, dword ptr [rbp + 0x23c]
140c18337: 488b89a8010000 mov rcx, qword ptr [rcx + 0x1a8]
140c1833e: 4f8d0cc9 lea r9, [r9 + r9*8]
140c18342: 4d8b8010010000 mov r8, qword ptr [r8 + 0x110]
140c18349: 4e8b54c918 mov r10, qword ptr [rcx + r9*8 + 0x18]
140c1834e: 4a8b4cc938 mov rcx, qword ptr [rcx + r9*8 + 0x38]
140c18353: 4a8b0cc1 mov rcx, qword ptr [rcx + r8*8]
140c18357: 48f7d1 not rcx
140c1835a: 4c8d0449 lea r8, [rcx + rcx*2]
140c1835e: 49c1e004 shl r8, 4
140c18362: 4b8b4c0228 mov rcx, qword ptr [r10 + r8 + 0x28]
140c18367: f7d7 not edi
140c18369: 4989f9 mov r9, rdi
140c1836c: 49c1e105 shl r9, 5
140c18370: 4f034c0210 add r9, qword ptr [r10 + r8 + 0x10]
140c18375: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c1837c: f048ff00 lock inc qword ptr [rax]
140c18380: 4989f6 mov r14, rsi
140c18383: 488bb5e0060000 mov rsi, qword ptr [rbp + 0x6e0]
140c1838a: 448badc4060000 mov r13d, dword ptr [rbp + 0x6c4]
140c18391: 0f8e96140000 jle 0x140c1982d
140c18397: 8914b9 mov dword ptr [rcx + rdi*4], edx
140c1839a: 410fb601 movzx eax, byte ptr [r9]
140c1839e: 3c01 cmp al, 1
140c183a0: 4c898df0060000 mov qword ptr [rbp + 0x6f0], r9
140c183a7: 7726 ja 0x140c183cf
140c183a9: 84c0 test al, al
140c183ab: 7522 jne 0x140c183cf
140c183ad: 488b85f0060000 mov rax, qword ptr [rbp + 0x6f0]
140c183b4: 488b4008 mov rax, qword ptr [rax + 8]
140c183b8: f048ff08 lock dec qword ptr [rax]
140c183bc: 7511 jne 0x140c183cf
140c183be: 488b85f0060000 mov rax, qword ptr [rbp + 0x6f0]
140c183c5: 488d4808 lea rcx, [rax + 8]
140c183c9: e8a2cdd603 call 0x144985170
140c183ce: 90 nop
140c183cf: 488b8df0060000 mov rcx, qword ptr [rbp + 0x6f0]
140c183d6: c60100 mov byte ptr [rcx], 0
140c183d9: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c183e0: 48894108 mov qword ptr [rcx + 8], rax
140c183e4: c741180000803f mov dword ptr [rcx + 0x18], 0x3f800000
140c183eb: 80bda003000000 cmp byte ptr [rbp + 0x3a0], 0
140c183f2: 0f8424140000 je 0x140c1981c
140c183f8: 8b85a1030000 mov eax, dword ptr [rbp + 0x3a1]
140c183fe: 8b8da4030000 mov ecx, dword ptr [rbp + 0x3a4]
140c18404: 898dc3020000 mov dword ptr [rbp + 0x2c3], ecx
140c1840a: 8985c0020000 mov dword ptr [rbp + 0x2c0], eax
140c18410: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140c18417: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c1841e: 0fb685b0030000 movzx eax, byte ptr [rbp + 0x3b0]
140c18425: 488985d0060000 mov qword ptr [rbp + 0x6d0], rax
140c1842c: b001 mov al, 1
140c1842e: 8985f0060000 mov dword ptr [rbp + 0x6f0], eax
140c18434: eb2c jmp 0x140c18462
140c18436: 4989f6 mov r14, rsi
140c18439: 488bb5e0060000 mov rsi, qword ptr [rbp + 0x6e0]
140c18440: 448badc4060000 mov r13d, dword ptr [rbp + 0x6c4]
140c18447: f048ff00 lock inc qword ptr [rax]
140c1844b: 0f8edc130000 jle 0x140c1982d
140c18451: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c18458: c785f006000000000000 mov dword ptr [rbp + 0x6f0], 0
140c18462: 807ec000 cmp byte ptr [rsi - 0x40], 0
140c18466: 7522 jne 0x140c1848a
140c18468: 488b85e0060000 mov rax, qword ptr [rbp + 0x6e0]
140c1846f: 488b40c8 mov rax, qword ptr [rax - 0x38]
140c18473: f048ff08 lock dec qword ptr [rax]
140c18477: 7511 jne 0x140c1848a
140c18479: 488b85e0060000 mov rax, qword ptr [rbp + 0x6e0]
140c18480: 488d48c8 lea rcx, [rax - 0x38]
140c18484: e8e7ccd603 call 0x144985170
140c18489: 90 nop
140c1848a: 488b9de0060000 mov rbx, qword ptr [rbp + 0x6e0]
140c18491: 8b85f0060000 mov eax, dword ptr [rbp + 0x6f0]
140c18497: 8843c0 mov byte ptr [rbx - 0x40], al
140c1849a: 8b85c0020000 mov eax, dword ptr [rbp + 0x2c0]
140c184a0: 8b8dc3020000 mov ecx, dword ptr [rbp + 0x2c3]
140c184a6: 8943c1 mov dword ptr [rbx - 0x3f], eax
140c184a9: 894bc4 mov dword ptr [rbx - 0x3c], ecx
140c184ac: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c184b3: 488943c8 mov qword ptr [rbx - 0x38], rax
140c184b7: 488b85d0060000 mov rax, qword ptr [rbp + 0x6d0]
140c184be: 488943d0 mov qword ptr [rbx - 0x30], rax
140c184c2: 8b43f8 mov eax, dword ptr [rbx - 8]
140c184c5: 83f805 cmp eax, 5
140c184c8: b904000000 mov ecx, 4
140c184cd: 0f43c8 cmovae ecx, eax
140c184d0: 894bf8 mov dword ptr [rbx - 8], ecx
140c184d3: c685ec06000000 mov byte ptr [rbp + 0x6ec], 0
140c184da: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c184e1: e8da5197ff call 0x14058d6c0
140c184e6: 90 nop
140c184e7: 4c8bbda8000000 mov r15, qword ptr [rbp + 0xa8]
140c184ee: 49837f1000 cmp qword ptr [r15 + 0x10], 0
140c184f3: 448ba5b0060000 mov r12d, dword ptr [rbp + 0x6b0]
140c184fa: 0f84b5060000 je 0x140c18bb5
140c18500: 41837e1002 cmp dword ptr [r14 + 0x10], 2
140c18505: 740e je 0x140c18515
140c18507: 498b4608 mov rax, qword ptr [r14 + 8]
140c1850b: 493b4760 cmp rax, qword ptr [r15 + 0x60]
140c1850f: 0f84a0060000 je 0x140c18bb5
140c18515: 488bbd68010000 mov rdi, qword ptr [rbp + 0x168]
140c1851c: 4885ff test rdi, rdi
140c1851f: 740f je 0x140c18530
140c18521: 8b8584010000 mov eax, dword ptr [rbp + 0x184]
140c18527: 488b8d78010000 mov rcx, qword ptr [rbp + 0x178]
140c1852e: 8901 mov dword ptr [rcx], eax
140c18530: 4c8b8d88010000 mov r9, qword ptr [rbp + 0x188]
140c18537: 488b95a8010000 mov rdx, qword ptr [rbp + 0x1a8]
140c1853e: 4c8b85c8010000 mov r8, qword ptr [rbp + 0x1c8]
140c18545: 4d85c0 test r8, r8
140c18548: 488db568010000 lea rsi, [rbp + 0x168]
140c1854f: 740f je 0x140c18560
140c18551: 8b85e4010000 mov eax, dword ptr [rbp + 0x1e4]
140c18557: 488b8dd8010000 mov rcx, qword ptr [rbp + 0x1d8]
140c1855e: 8901 mov dword ptr [rcx], eax
140c18560: 4c8b95e8010000 mov r10, qword ptr [rbp + 0x1e8]
140c18567: b1ff mov cl, 0xff
140c18569: 4d85d2 test r10, r10
140c1856c: 0f84f6000000 je 0x140c18668
140c18572: 8b8504020000 mov eax, dword ptr [rbp + 0x204]
140c18578: 4c8b9df8010000 mov r11, qword ptr [rbp + 0x1f8]
140c1857f: 418903 mov dword ptr [r11], eax
140c18582: 4d85c0 test r8, r8
140c18585: 0f84dd000000 je 0x140c18668
140c1858b: 4885ff test rdi, rdi
140c1858e: 0f84d4000000 je 0x140c18668
140c18594: 4d85c9 test r9, r9
140c18597: 0f84cb000000 je 0x140c18668
140c1859d: 4885d2 test rdx, rdx
140c185a0: 0f84c2000000 je 0x140c18668
140c185a6: c785d803000000000000 mov dword ptr [rbp + 0x3d8], 0
140c185b0: 0f280559593205 movaps xmm0, xmmword ptr [rip + 0x5325959]
140c185b7: 0f1185f0030000 movups xmmword ptr [rbp + 0x3f0], xmm0
140c185be: 660f6f055a593205 movdqa xmm0, xmmword ptr [rip + 0x532595a]
140c185c6: f30f7f8500040000 movdqu xmmword ptr [rbp + 0x400], xmm0
140c185ce: c785100400000ad7233f mov dword ptr [rbp + 0x410], 0x3f23d70a
140c185d8: 66c785140400000100 mov word ptr [rbp + 0x414], 1
140c185e1: c785e003000000000000 mov dword ptr [rbp + 0x3e0], 0
140c185eb: 48c785a003000000000000 mov qword ptr [rbp + 0x3a0], 0
140c185f6: 48c785a803000004000000 mov qword ptr [rbp + 0x3a8], 4
140c18601: 660fefc0 pxor xmm0, xmm0
140c18605: f30f7f85b0030000 movdqu xmmword ptr [rbp + 0x3b0], xmm0
140c1860d: 48c785c003000004000000 mov qword ptr [rbp + 0x3c0], 4
140c18618: f30f7f85c8030000 movdqu xmmword ptr [rbp + 0x3c8], xmm0
140c18620: 4c89542430 mov qword ptr [rsp + 0x30], r10
140c18625: 4c89442428 mov qword ptr [rsp + 0x28], r8
140c1862a: 4889542420 mov qword ptr [rsp + 0x20], rdx
140c1862f: 488d95a0030000 lea rdx, [rbp + 0x3a0]
140c18636: 41b801000000 mov r8d, 1
140c1863c: 4889f9 mov rcx, rdi
140c1863f: e8ec53f7ff call 0x140b8da30
140c18644: 488b5710 mov rdx, qword ptr [rdi + 0x10]
140c18648: 4839d0 cmp rax, rdx
140c1864b: 0f8327130000 jae 0x140c19978
140c18651: 488b4f08 mov rcx, qword ptr [rdi + 8]
140c18655: 4869d0d8000000 imul rdx, rax, 0xd8
140c1865c: 837c114001 cmp dword ptr [rcx + rdx + 0x40], 1
140c18661: b102 mov cl, 2
140c18663: 80d900 sbb cl, 0
140c18666: eb00 jmp 0x140c18668
140c18668: 4c89f7 mov rdi, r14
140c1866b: 488b9d48010000 mov rbx, qword ptr [rbp + 0x148]
140c18672: 8b9504010000 mov edx, dword ptr [rbp + 0x104]
140c18678: 4c8b85f8000000 mov r8, qword ptr [rbp + 0xf8]
140c1867f: 418910 mov dword ptr [r8], edx
140c18682: 4c8bade8000000 mov r13, qword ptr [rbp + 0xe8]
140c18689: 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
140c18690: 448b8524010000 mov r8d, dword ptr [rbp + 0x124]
140c18697: 448902 mov dword ptr [rdx], r8d
140c1869a: 4c8ba508010000 mov r12, qword ptr [rbp + 0x108]
140c186a1: 488b9508020000 mov rdx, qword ptr [rbp + 0x208]
140c186a8: 488995f8060000 mov qword ptr [rbp + 0x6f8], rdx
140c186af: 48898550020000 mov qword ptr [rbp + 0x250], rax
140c186b6: 888d58020000 mov byte ptr [rbp + 0x258], cl
140c186bc: c685df06000001 mov byte ptr [rbp + 0x6df], 1
140c186c3: 48897508 mov qword ptr [rbp + 8], rsi
140c186c7: 488d8550020000 lea rax, [rbp + 0x250]
140c186ce: 48894510 mov qword ptr [rbp + 0x10], rax
140c186d2: 4c896d18 mov qword ptr [rbp + 0x18], r13
140c186d6: 498b4708 mov rax, qword ptr [r15 + 8]
140c186da: 498b4f10 mov rcx, qword ptr [r15 + 0x10]
140c186de: 48c1e107 shl rcx, 7
140c186e2: 4801c1 add rcx, rax
140c186e5: 488985a0030000 mov qword ptr [rbp + 0x3a0], rax
140c186ec: 48898da8030000 mov qword ptr [rbp + 0x3a8], rcx
140c186f3: 488d7508 lea rsi, [rbp + 8]
140c186f7: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140c186fe: 4c8db5df060000 lea r14, [rbp + 0x6df]
140c18705: 4c89b5b8030000 mov qword ptr [rbp + 0x3b8], r14
140c1870c: 488d8df8050000 lea rcx, [rbp + 0x5f8]
140c18713: 488d95a0030000 lea rdx, [rbp + 0x3a0]
140c1871a: e8d139f2ff call 0x140b3c0f0
140c1871f: 498b4720 mov rax, qword ptr [r15 + 0x20]
140c18723: 496b4f2870 imul rcx, qword ptr [r15 + 0x28], 0x70
140c18728: 4801c1 add rcx, rax
140c1872b: 488985a0030000 mov qword ptr [rbp + 0x3a0], rax
140c18732: 48898da8030000 mov qword ptr [rbp + 0x3a8], rcx
140c18739: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140c18740: 4c89b5b8030000 mov qword ptr [rbp + 0x3b8], r14
140c18747: 488d8de0050000 lea rcx, [rbp + 0x5e0]
140c1874e: 488d95a0030000 lea rdx, [rbp + 0x3a0]
140c18755: e8162bf2ff call 0x140b3b270
140c1875a: 90 nop
140c1875b: 4c89a5f0060000 mov qword ptr [rbp + 0x6f0], r12
140c18762: 498b4750 mov rax, qword ptr [r15 + 0x50]
140c18766: 496b4f5870 imul rcx, qword ptr [r15 + 0x58], 0x70
140c1876b: 4801c1 add rcx, rax
140c1876e: 488985a0030000 mov qword ptr [rbp + 0x3a0], rax
140c18775: 48898da8030000 mov qword ptr [rbp + 0x3a8], rcx
140c1877c: 4889b5b0030000 mov qword ptr [rbp + 0x3b0], rsi
140c18783: 4c89b5b8030000 mov qword ptr [rbp + 0x3b8], r14
140c1878a: 488d8dc8050000 lea rcx, [rbp + 0x5c8]
140c18791: 488d95a0030000 lea rdx, [rbp + 0x3a0]
140c18798: e83333f2ff call 0x140b3bad0
140c1879d: 90 nop
140c1879e: 4d8b7738 mov r14, qword ptr [r15 + 0x38]
140c187a2: 4d8b6740 mov r12, qword ptr [r15 + 0x40]
140c187a6: 4969f4e8000000 imul rsi, r12, 0xe8
140c187ad: 4d85e4 test r12, r12
140c187b0: 742a je 0x140c187dc
140c187b2: e8499a3eff call 0x140002200
140c187b7: ba08000000 mov edx, 8
140c187bc: 4889f1 mov rcx, rsi
140c187bf: e8fc993eff call 0x1400021c0
140c187c4: 4885c0 test rax, rax
140c187c7: 7518 jne 0x140c187e1
140c187c9: b908000000 mov ecx, 8
140c187ce: 4889f2 mov rdx, rsi
140c187d1: e8e50a1805 call 0x145d992bb
140c187d6: 90 nop
140c187d7: e951100000 jmp 0x140c1982d
140c187dc: b808000000 mov eax, 8
140c187e1: 4c01f6 add rsi, r14
140c187e4: 4c89a5c0020000 mov qword ptr [rbp + 0x2c0], r12
140c187eb: 488985c8020000 mov qword ptr [rbp + 0x2c8], rax
140c187f2: 488d8dd0020000 lea rcx, [rbp + 0x2d0]
140c187f9: 48c785d002000000000000 mov qword ptr [rbp + 0x2d0], 0
140c18804: 488985b0030000 mov qword ptr [rbp + 0x3b0], rax
140c1880b: 48898da0030000 mov qword ptr [rbp + 0x3a0], rcx
140c18812: 48c785a803000000000000 mov qword ptr [rbp + 0x3a8], 0
140c1881d: 4c8d85a0030000 lea r8, [rbp + 0x3a0]
140c18824: 4c89f1 mov rcx, r14
140c18827: 4889f2 mov rdx, rsi
140c1882a: e8013e3a00 call 0x140fbc630
140c1882f: 90 nop
140c18830: f30f6f85c0020000 movdqu xmm0, xmmword ptr [rbp + 0x2c0]
140c18838: 660f7f8590060000 movdqa xmmword ptr [rbp + 0x690], xmm0
140c18840: 488b85d0020000 mov rax, qword ptr [rbp + 0x2d0]
140c18847: 488985a0060000 mov qword ptr [rbp + 0x6a0], rax
140c1884e: 418bb724010000 mov esi, dword ptr [r15 + 0x124]
140c18855: 85f6 test esi, esi
140c18857: 4989fe mov r14, rdi
140c1885a: 448ba5b0060000 mov r12d, dword ptr [rbp + 0x6b0]
140c18861: 742e je 0x140c18891
140c18863: 4885db test rbx, rbx
140c18866: 741d je 0x140c18885
140c18868: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c1886f: 4889da mov rdx, rbx
140c18872: 4189f0 mov r8d, esi
140c18875: e86624f7ff call 0x140b8ace0
140c1887a: 8b8da0030000 mov ecx, dword ptr [rbp + 0x3a0]
140c18880: 83f902 cmp ecx, 2
140c18883: 7542 jne 0x140c188c7
140c18885: 488b9de0060000 mov rbx, qword ptr [rbp + 0x6e0]
140c1888c: e915010000 jmp 0x140c189a6
140c18891: c785a003000000000000 mov dword ptr [rbp + 0x3a0], 0
140c1889b: c785cc03000000000000 mov dword ptr [rbp + 0x3cc], 0
140c188a5: c785f803000000000000 mov dword ptr [rbp + 0x3f8], 0
140c188af: 660fefc0 pxor xmm0, xmm0
140c188b3: f30f7f8508040000 movdqu xmmword ptr [rbp + 0x408], xmm0
140c188bb: c7851804000000000000 mov dword ptr [rbp + 0x418], 0
140c188c5: 31c9 xor ecx, ecx
140c188c7: 488b8514040000 mov rax, qword ptr [rbp + 0x414]
140c188ce: 48898580060000 mov qword ptr [rbp + 0x680], rax
140c188d5: 0f108504040000 movups xmm0, xmmword ptr [rbp + 0x404]
140c188dc: 0f298570060000 movaps xmmword ptr [rbp + 0x670], xmm0
140c188e3: 8b85f4030000 mov eax, dword ptr [rbp + 0x3f4]
140c188e9: 898560060000 mov dword ptr [rbp + 0x660], eax
140c188ef: 8b85f8030000 mov eax, dword ptr [rbp + 0x3f8]
140c188f5: 898564060000 mov dword ptr [rbp + 0x664], eax
140c188fb: 488b85fc030000 mov rax, qword ptr [rbp + 0x3fc]
140c18902: 48898568060000 mov qword ptr [rbp + 0x668], rax
140c18909: 0f1085e4030000 movups xmm0, xmmword ptr [rbp + 0x3e4]
140c18910: 0f298550060000 movaps xmmword ptr [rbp + 0x650], xmm0
140c18917: f30f6f85a4030000 movdqu xmm0, xmmword ptr [rbp + 0x3a4]
140c1891f: f30f6f8db4030000 movdqu xmm1, xmmword ptr [rbp + 0x3b4]
140c18927: f30f6f95c4030000 movdqu xmm2, xmmword ptr [rbp + 0x3c4]
140c1892f: f30f6f9dd4030000 movdqu xmm3, xmmword ptr [rbp + 0x3d4]
140c18937: 660f7f9d40060000 movdqa xmmword ptr [rbp + 0x640], xmm3
140c1893f: 660f7f9530060000 movdqa xmmword ptr [rbp + 0x630], xmm2
140c18947: 660f7f8d20060000 movdqa xmmword ptr [rbp + 0x620], xmm1
140c1894f: 660f7f8510060000 movdqa xmmword ptr [rbp + 0x610], xmm0
140c18957: 80bddf06000000 cmp byte ptr [rbp + 0x6df], 0
140c1895e: 742e je 0x140c1898e
140c18960: 4885db test rbx, rbx
140c18963: 898dd0060000 mov dword ptr [rbp + 0x6d0], ecx
140c18969: 0f8498060000 je 0x140c19007
140c1896f: 85f6 test esi, esi
140c18971: 0f8490060000 je 0x140c19007
140c18977: 488d8d98050000 lea rcx, [rbp + 0x598]
140c1897e: 4889da mov rdx, rbx
140c18981: 4189f0 mov r8d, esi
140c18984: e8d721f7ff call 0x140b8ab60
140c18989: e980060000 jmp 0x140c1900e
140c1898e: 488b9de0060000 mov rbx, qword ptr [rbp + 0x6e0]
140c18995: 8b43f8 mov eax, dword ptr [rbx - 8]
140c18998: 83f805 cmp eax, 5
140c1899b: b904000000 mov ecx, 4
140c189a0: 0f43c8 cmovae ecx, eax
140c189a3: 894bf8 mov dword ptr [rbx - 8], ecx
140c189a6: 488b8d98060000 mov rcx, qword ptr [rbp + 0x698]
140c189ad: 488b85a0060000 mov rax, qword ptr [rbp + 0x6a0]
140c189b4: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c189bb: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c189c6: 48898dd0060000 mov qword ptr [rbp + 0x6d0], rcx
140c189cd: 448badc4060000 mov r13d, dword ptr [rbp + 0x6c4]
140c189d4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140c189e0: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c189e7: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c189ee: 741c je 0x140c18a0c
140c189f0: 48ffc0 inc rax
140c189f3: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c189fa: 488db1e8000000 lea rsi, [rcx + 0xe8]
140c18a01: e80acfebff call 0x140ad5910
140c18a06: 90 nop
140c18a07: 4889f1 mov rcx, rsi
140c18a0a: ebd4 jmp 0x140c189e0
140c18a0c: 488b8590060000 mov rax, qword ptr [rbp + 0x690]
140c18a13: 4885c0 test rax, rax
140c18a16: 7419 je 0x140c18a31
140c18a18: 4869d0e8000000 imul rdx, rax, 0xe8
140c18a1f: 41b808000000 mov r8d, 8
140c18a25: 488b8dd0060000 mov rcx, qword ptr [rbp + 0x6d0]
140c18a2c: e89f973eff call 0x1400021d0
140c18a31: 488b8dd0050000 mov rcx, qword ptr [rbp + 0x5d0]
140c18a38: 488b85d8050000 mov rax, qword ptr [rbp + 0x5d8]
140c18a3f: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c18a46: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c18a51: 48898dd0060000 mov qword ptr [rbp + 0x6d0], rcx
140c18a58: 0f1f840000000000 nop dword ptr [rax + rax]
140c18a60: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c18a67: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c18a6e: 7419 je 0x140c18a89
140c18a70: 48ffc0 inc rax
140c18a73: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c18a7a: 488d7170 lea rsi, [rcx + 0x70]
140c18a7e: e80de095ff call 0x140576a90
140c18a83: 90 nop
140c18a84: 4889f1 mov rcx, rsi
140c18a87: ebd7 jmp 0x140c18a60
140c18a89: 488b85c8050000 mov rax, qword ptr [rbp + 0x5c8]
140c18a90: 4885c0 test rax, rax
140c18a93: 7416 je 0x140c18aab
140c18a95: 486bd070 imul rdx, rax, 0x70
140c18a99: 41b808000000 mov r8d, 8
140c18a9f: 488b8dd0060000 mov rcx, qword ptr [rbp + 0x6d0]
140c18aa6: e825973eff call 0x1400021d0
140c18aab: 488b8de8050000 mov rcx, qword ptr [rbp + 0x5e8]
140c18ab2: 488b85f0050000 mov rax, qword ptr [rbp + 0x5f0]
140c18ab9: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c18ac0: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c18acb: 48898dd0060000 mov qword ptr [rbp + 0x6d0], rcx
140c18ad2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140c18ae0: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c18ae7: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c18aee: 7419 je 0x140c18b09
140c18af0: 48ffc0 inc rax
140c18af3: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c18afa: 488d7170 lea rsi, [rcx + 0x70]
140c18afe: e88ddf95ff call 0x140576a90
140c18b03: 90 nop
140c18b04: 4889f1 mov rcx, rsi
140c18b07: ebd7 jmp 0x140c18ae0
140c18b09: 488b85e0050000 mov rax, qword ptr [rbp + 0x5e0]
140c18b10: 4885c0 test rax, rax
140c18b13: 7416 je 0x140c18b2b
140c18b15: 486bd070 imul rdx, rax, 0x70
140c18b19: 41b808000000 mov r8d, 8
140c18b1f: 488b8dd0060000 mov rcx, qword ptr [rbp + 0x6d0]
140c18b26: e8a5963eff call 0x1400021d0
140c18b2b: 488b8d00060000 mov rcx, qword ptr [rbp + 0x600]
140c18b32: 488b8508060000 mov rax, qword ptr [rbp + 0x608]
140c18b39: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c18b40: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c18b4b: 48898dd0060000 mov qword ptr [rbp + 0x6d0], rcx
140c18b52: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140c18b60: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c18b67: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c18b6e: 741c je 0x140c18b8c
140c18b70: 48ffc0 inc rax
140c18b73: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c18b7a: 488db188000000 lea rsi, [rcx + 0x88]
140c18b81: e80acfebff call 0x140ad5a90
140c18b86: 90 nop
140c18b87: 4889f1 mov rcx, rsi
140c18b8a: ebd4 jmp 0x140c18b60
140c18b8c: 488b85f8050000 mov rax, qword ptr [rbp + 0x5f8]
140c18b93: 4885c0 test rax, rax
140c18b96: 741d je 0x140c18bb5
140c18b98: 4889c1 mov rcx, rax
140c18b9b: 48c1e107 shl rcx, 7
140c18b9f: 488d14c1 lea rdx, [rcx + rax*8]
140c18ba3: 41b808000000 mov r8d, 8
140c18ba9: 488b8dd0060000 mov rcx, qword ptr [rbp + 0x6d0]
140c18bb0: e81b963eff call 0x1400021d0
140c18bb5: 41837e1002 cmp dword ptr [r14 + 0x10], 2
140c18bba: 0f840d040000 je 0x140c18fcd
140c18bc0: 498d4610 lea rax, [r14 + 0x10]
140c18bc4: 410f10463c movups xmm0, xmmword ptr [r14 + 0x3c]
140c18bc9: 410f104e4c movups xmm1, xmmword ptr [r14 + 0x4c]
140c18bce: 410f105658 movups xmm2, xmmword ptr [r14 + 0x58]
140c18bd3: 0f119558060000 movups xmmword ptr [rbp + 0x658], xmm2
140c18bda: 0f118d4c060000 movups xmmword ptr [rbp + 0x64c], xmm1
140c18be1: 0f11853c060000 movups xmmword ptr [rbp + 0x63c], xmm0
140c18be8: 418b8e80000000 mov ecx, dword ptr [r14 + 0x80]
140c18bef: 898d80060000 mov dword ptr [rbp + 0x680], ecx
140c18bf5: 498b4e78 mov rcx, qword ptr [r14 + 0x78]
140c18bf9: 48898d78060000 mov qword ptr [rbp + 0x678], rcx
140c18c00: 410f104668 movups xmm0, xmmword ptr [r14 + 0x68]
140c18c05: 0f118568060000 movups xmmword ptr [rbp + 0x668], xmm0
140c18c0c: 0f1000 movups xmm0, xmmword ptr [rax]
140c18c0f: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
140c18c13: 0f10501c movups xmm2, xmmword ptr [rax + 0x1c]
140c18c17: 0f11952c060000 movups xmmword ptr [rbp + 0x62c], xmm2
140c18c1e: 0f298d20060000 movaps xmmword ptr [rbp + 0x620], xmm1
140c18c25: 0f298510060000 movaps xmmword ptr [rbp + 0x610], xmm0
140c18c2c: 8b8580060000 mov eax, dword ptr [rbp + 0x680]
140c18c32: 898510040000 mov dword ptr [rbp + 0x410], eax
140c18c38: 488b8570060000 mov rax, qword ptr [rbp + 0x670]
140c18c3f: 48898500040000 mov qword ptr [rbp + 0x400], rax
140c18c46: 488b8578060000 mov rax, qword ptr [rbp + 0x678]
140c18c4d: 48898508040000 mov qword ptr [rbp + 0x408], rax
140c18c54: 0f288560060000 movaps xmm0, xmmword ptr [rbp + 0x660]
140c18c5b: 0f2985f0030000 movaps xmmword ptr [rbp + 0x3f0], xmm0
140c18c62: 0f288550060000 movaps xmm0, xmmword ptr [rbp + 0x650]
140c18c69: 0f2985e0030000 movaps xmmword ptr [rbp + 0x3e0], xmm0
140c18c70: 0f288510060000 movaps xmm0, xmmword ptr [rbp + 0x610]
140c18c77: 0f288d20060000 movaps xmm1, xmmword ptr [rbp + 0x620]
140c18c7e: 0f289530060000 movaps xmm2, xmmword ptr [rbp + 0x630]
140c18c85: 0f289d40060000 movaps xmm3, xmmword ptr [rbp + 0x640]
140c18c8c: 0f299dd0030000 movaps xmmword ptr [rbp + 0x3d0], xmm3
140c18c93: 0f2995c0030000 movaps xmmword ptr [rbp + 0x3c0], xmm2
140c18c9a: 0f298db0030000 movaps xmmword ptr [rbp + 0x3b0], xmm1
140c18ca1: 0f2985a0030000 movaps xmmword ptr [rbp + 0x3a0], xmm0
140c18ca8: f2410f108684000000 movsd xmm0, qword ptr [r14 + 0x84]
140c18cb1: f20f118514040000 movsd qword ptr [rbp + 0x414], xmm0
140c18cb9: 0f57c0 xorps xmm0, xmm0
140c18cbc: 0f2ef0 ucomiss xmm6, xmm0
140c18cbf: 7717 ja 0x140c18cd8
140c18cc1: 4489e8 mov eax, r13d
140c18cc4: f3480f2af0 cvtsi2ss xmm6, rax
140c18cc9: 4489e0 mov eax, r12d
140c18ccc: 0f57c0 xorps xmm0, xmm0
140c18ccf: f3480f2ac0 cvtsi2ss xmm0, rax
140c18cd4: f30f5ef0 divss xmm6, xmm0
140c18cd8: 41803e00 cmp byte ptr [r14], 0
140c18cdc: 7411 je 0x140c18cef
140c18cde: f3410f104604 movss xmm0, dword ptr [r14 + 4]
140c18ce4: 0f2ec6 ucomiss xmm0, xmm6
140c18ce7: 7506 jne 0x140c18cef
140c18ce9: 0f8b1d010000 jnp 0x140c18e0c
140c18cef: 488d8d10060000 lea rcx, [rbp + 0x610]
140c18cf6: 488d95a0030000 lea rdx, [rbp + 0x3a0]
140c18cfd: 0f28d6 movaps xmm2, xmm6
140c18d00: e82b24fbff call 0x140bcb130
140c18d05: 0f288510060000 movaps xmm0, xmmword ptr [rbp + 0x610]
140c18d0c: 0f288d20060000 movaps xmm1, xmmword ptr [rbp + 0x620]
140c18d13: 0f289530060000 movaps xmm2, xmmword ptr [rbp + 0x630]
140c18d1a: 0f289d40060000 movaps xmm3, xmmword ptr [rbp + 0x640]
140c18d21: 0f299580020000 movaps xmmword ptr [rbp + 0x280], xmm2
140c18d28: 0f298d70020000 movaps xmmword ptr [rbp + 0x270], xmm1
140c18d2f: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
140c18d36: 0f299d90020000 movaps xmmword ptr [rbp + 0x290], xmm3
140c18d3d: 0f288550060000 movaps xmm0, xmmword ptr [rbp + 0x650]
140c18d44: 0f2985a0020000 movaps xmmword ptr [rbp + 0x2a0], xmm0
140c18d4b: 0f288560060000 movaps xmm0, xmmword ptr [rbp + 0x660]
140c18d52: 0f2985b0020000 movaps xmmword ptr [rbp + 0x2b0], xmm0
140c18d59: 488b4540 mov rax, qword ptr [rbp + 0x40]
140c18d5d: 488b8db8060000 mov rcx, qword ptr [rbp + 0x6b8]
140c18d64: 48898d98050000 mov qword ptr [rbp + 0x598], rcx
140c18d6b: 0f284520 movaps xmm0, xmmword ptr [rbp + 0x20]
140c18d6f: 0f1185a0050000 movups xmmword ptr [rbp + 0x5a0], xmm0
140c18d76: 0f284530 movaps xmm0, xmmword ptr [rbp + 0x30]
140c18d7a: 0f1185b0050000 movups xmmword ptr [rbp + 0x5b0], xmm0
140c18d81: 488985c0050000 mov qword ptr [rbp + 0x5c0], rax
140c18d88: 0f2885b0020000 movaps xmm0, xmmword ptr [rbp + 0x2b0]
140c18d8f: 0f298560060000 movaps xmmword ptr [rbp + 0x660], xmm0
140c18d96: 0f2885a0020000 movaps xmm0, xmmword ptr [rbp + 0x2a0]
140c18d9d: 0f298550060000 movaps xmmword ptr [rbp + 0x650], xmm0
140c18da4: 0f288560020000 movaps xmm0, xmmword ptr [rbp + 0x260]
140c18dab: 0f288d70020000 movaps xmm1, xmmword ptr [rbp + 0x270]
140c18db2: 0f289580020000 movaps xmm2, xmmword ptr [rbp + 0x280]
140c18db9: 0f289d90020000 movaps xmm3, xmmword ptr [rbp + 0x290]
140c18dc0: 0f299d40060000 movaps xmmword ptr [rbp + 0x640], xmm3
140c18dc7: 0f299530060000 movaps xmmword ptr [rbp + 0x630], xmm2
140c18dce: 0f298d20060000 movaps xmmword ptr [rbp + 0x620], xmm1
140c18dd5: 0f298510060000 movaps xmmword ptr [rbp + 0x610], xmm0
140c18ddc: c6857006000000 mov byte ptr [rbp + 0x670], 0
140c18de3: 488d8d98050000 lea rcx, [rbp + 0x598]
140c18dea: 488d9510060000 lea rdx, [rbp + 0x610]
140c18df1: e87ab1cdff call 0x1408f3f70
140c18df6: 8b4564 mov eax, dword ptr [rbp + 0x64]
140c18df9: 488b4d58 mov rcx, qword ptr [rbp + 0x58]
140c18dfd: 8901 mov dword ptr [rcx], eax
140c18dff: 41c70601000000 mov dword ptr [r14], 1
140c18e06: f3410f117604 movss dword ptr [r14 + 4], xmm6
140c18e0c: 80bdcc03000000 cmp byte ptr [rbp + 0x3cc], 0
140c18e13: 7415 je 0x140c18e2a
140c18e15: f3440f101582441805 movss xmm10, dword ptr [rip + 0x5184482]
140c18e1e: 4183bea000000001 cmp dword ptr [r14 + 0xa0], 1
140c18e26: 7434 je 0x140c18e5c
140c18e28: eb58 jmp 0x140c18e82
140c18e2a: 488b8528010000 mov rax, qword ptr [rbp + 0x128]
140c18e31: f30f1000 movss xmm0, dword ptr [rax]
140c18e35: f30f59c0 mulss xmm0, xmm0
140c18e39: f30f58055f441805 addss xmm0, dword ptr [rip + 0x518445f]
140c18e41: f30f100d174d3205 movss xmm1, dword ptr [rip + 0x5324d17]
140c18e49: f30f5ec8 divss xmm1, xmm0
140c18e4d: f3440f51d1 sqrtss xmm10, xmm1
140c18e52: 4183bea000000001 cmp dword ptr [r14 + 0xa0], 1
140c18e5a: 7526 jne 0x140c18e82
140c18e5c: f3410f1086a4000000 movss xmm0, dword ptr [r14 + 0xa4]
140c18e65: 410f2ec1 ucomiss xmm0, xmm9
140c18e69: 7517 jne 0x140c18e82
140c18e6b: 7a15 jp 0x140c18e82
140c18e6d: f3410f1086a8000000 movss xmm0, dword ptr [r14 + 0xa8]
140c18e76: 410f2ec2 ucomiss xmm0, xmm10
140c18e7a: 7506 jne 0x140c18e82
140c18e7c: 0f8be3000000 jnp 0x140c18f65
140c18e82: 488b5bd8 mov rbx, qword ptr [rbx - 0x28]
140c18e86: 488b7530 mov rsi, qword ptr [rbp + 0x30]
140c18e8a: f30f103d12441805 movss xmm7, dword ptr [rip + 0x5184412]
140c18e92: f3410f59f9 mulss xmm7, xmm9
140c18e97: 0f28c7 movaps xmm0, xmm7
140c18e9a: e87812fe04 call 0x145bfa117
140c18e9f: 440f28c0 movaps xmm8, xmm0
140c18ea3: 0f28c7 movaps xmm0, xmm7
140c18ea6: e87212fe04 call 0x145bfa11d
140c18eab: 0f57ff xorps xmm7, xmm7
140c18eae: 0f57c9 xorps xmm1, xmm1
140c18eb1: f30f10c8 movss xmm1, xmm0
140c18eb5: f3410f10f8 movss xmm7, xmm8
140c18eba: 4885f6 test rsi, rsi
140c18ebd: 7504 jne 0x140c18ec3
140c18ebf: 488b7538 mov rsi, qword ptr [rbp + 0x38]
140c18ec3: 0fc6f911 shufps xmm7, xmm1, 0x11
140c18ec7: 488b06 mov rax, qword ptr [rsi]
140c18eca: 488b7e10 mov rdi, qword ptr [rsi + 0x10]
140c18ece: 4829f8 sub rax, rdi
140c18ed1: 4883f857 cmp rax, 0x57
140c18ed5: 0f86fb090000 jbe 0x140c198d6
140c18edb: 488b4608 mov rax, qword ptr [rsi + 8]
140c18edf: 488d0d4a50ddff lea rcx, [rip - 0x22afb6]
140c18ee6: 48890c38 mov qword ptr [rax + rdi], rcx
140c18eea: 0f117c3808 movups xmmword ptr [rax + rdi + 8], xmm7
140c18eef: 48c744381800000000 mov qword ptr [rax + rdi + 0x18], 0
140c18ef8: c744382000000000 mov dword ptr [rax + rdi + 0x20], 0
140c18f00: f3440f11543824 movss dword ptr [rax + rdi + 0x24], xmm10
140c18f07: f3440f11543828 movss dword ptr [rax + rdi + 0x28], xmm10
140c18f0e: f3440f1154382c movss dword ptr [rax + rdi + 0x2c], xmm10
140c18f15: c644383800 mov byte ptr [rax + rdi + 0x38], 0
140c18f1a: 48895c3848 mov qword ptr [rax + rdi + 0x48], rbx
140c18f1f: 4883c758 add rdi, 0x58
140c18f23: 48897e10 mov qword ptr [rsi + 0x10], rdi
140c18f27: 8b4564 mov eax, dword ptr [rbp + 0x64]
140c18f2a: 488b4d58 mov rcx, qword ptr [rbp + 0x58]
140c18f2e: 8901 mov dword ptr [rcx], eax
140c18f30: 41c786a000000001000000 mov dword ptr [r14 + 0xa0], 1
140c18f3b: f3450f118ea4000000 movss dword ptr [r14 + 0xa4], xmm9
140c18f44: f3450f1196a8000000 movss dword ptr [r14 + 0xa8], xmm10
140c18f4d: 488b95e0060000 mov rdx, qword ptr [rbp + 0x6e0]
140c18f54: 8b42f8 mov eax, dword ptr [rdx - 8]
140c18f57: 83f805 cmp eax, 5
140c18f5a: b904000000 mov ecx, 4
140c18f5f: 0f43c8 cmovae ecx, eax
140c18f62: 894af8 mov dword ptr [rdx - 8], ecx
140c18f65: 8b85a4000000 mov eax, dword ptr [rbp + 0xa4]
140c18f6b: 488b8d98000000 mov rcx, qword ptr [rbp + 0x98]
140c18f72: 8901 mov dword ptr [rcx], eax
140c18f74: 488bb588000000 mov rsi, qword ptr [rbp + 0x88]
140c18f7b: e880923eff call 0x140002200
140c18f80: b904000000 mov ecx, 4
140c18f85: ba01000000 mov edx, 1
140c18f8a: e831923eff call 0x1400021c0
140c18f8f: 4885c0 test rax, rax
140c18f92: 0f84cf090000 je 0x140c19967
140c18f98: c7006865726f mov dword ptr [rax], 0x6f726568
140c18f9e: 48c7851006000004000000 mov qword ptr [rbp + 0x610], 4
140c18fa9: 48898518060000 mov qword ptr [rbp + 0x618], rax
140c18fb0: 48c7852006000004000000 mov qword ptr [rbp + 0x620], 4
140c18fbb: 488d9510060000 lea rdx, [rbp + 0x610]
140c18fc2: 4889f1 mov rcx, rsi
140c18fc5: 0f28d6 movaps xmm2, xmm6
140c18fc8: e8937dbeff call 0x140800d60
140c18fcd: 0f28b510070000 movaps xmm6, xmmword ptr [rbp + 0x710]
140c18fd4: 0f28bd20070000 movaps xmm7, xmmword ptr [rbp + 0x720]
140c18fdb: 440f288530070000 movaps xmm8, xmmword ptr [rbp + 0x730]
140c18fe3: 440f288d40070000 movaps xmm9, xmmword ptr [rbp + 0x740]
140c18feb: 440f289550070000 movaps xmm10, xmmword ptr [rbp + 0x750]
140c18ff3: 4881c4e8070000 add rsp, 0x7e8
140c18ffa: 5b pop rbx
140c18ffb: 5f pop rdi
140c18ffc: 5e pop rsi
140c18ffd: 415c pop r12
140c18fff: 415d pop r13
140c19001: 415e pop r14
140c19003: 415f pop r15
140c19005: 5d pop rbp
140c19006: c3 ret
140c19007: c68598050000ff mov byte ptr [rbp + 0x598], 0xff
140c1900e: 488b7530 mov rsi, qword ptr [rbp + 0x30]
140c19012: 4885f6 test rsi, rsi
140c19015: 488b85e0060000 mov rax, qword ptr [rbp + 0x6e0]
140c1901c: 7504 jne 0x140c19022
140c1901e: 488b7538 mov rsi, qword ptr [rbp + 0x38]
140c19022: 4c8b70d8 mov r14, qword ptr [rax - 0x28]
140c19026: 488b06 mov rax, qword ptr [rsi]
140c19029: 488b5e10 mov rbx, qword ptr [rsi + 0x10]
140c1902d: 4829d8 sub rax, rbx
140c19030: 4883f80f cmp rax, 0xf
140c19034: 0f86c1080000 jbe 0x140c198fb
140c1903a: 488b4608 mov rax, qword ptr [rsi + 8]
140c1903e: 488d0d3b7ddcff lea rcx, [rip - 0x2382c5]
140c19045: 48890c18 mov qword ptr [rax + rbx], rcx
140c19049: 4c89741808 mov qword ptr [rax + rbx + 8], r14
140c1904e: 4883c310 add rbx, 0x10
140c19052: 48895e10 mov qword ptr [rsi + 0x10], rbx
140c19056: 488b8de0060000 mov rcx, qword ptr [rbp + 0x6e0]
140c1905d: 488d71e0 lea rsi, [rcx - 0x20]
140c19061: 488b41f0 mov rax, qword ptr [rcx - 0x10]
140c19065: 4889f2 mov rdx, rsi
140c19068: 4883f802 cmp rax, 2
140c1906c: 7208 jb 0x140c19076
140c1906e: 488b51e0 mov rdx, qword ptr [rcx - 0x20]
140c19072: 488b41e8 mov rax, qword ptr [rcx - 0x18]
140c19076: 4c8b71d8 mov r14, qword ptr [rcx - 0x28]
140c1907a: 4c8d04c2 lea r8, [rdx + rax*8]
140c1907e: 48c785b003000000000000 mov qword ptr [rbp + 0x3b0], 0
140c19089: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c19090: e83b193b00 call 0x140fca9d0
140c19095: 90 nop
140c19096: 488b85b0030000 mov rax, qword ptr [rbp + 0x3b0]
140c1909d: 48898570020000 mov qword ptr [rbp + 0x270], rax
140c190a4: 0f1085a0030000 movups xmm0, xmmword ptr [rbp + 0x3a0]
140c190ab: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
140c190b2: 488b8500060000 mov rax, qword ptr [rbp + 0x600]
140c190b9: 488b8d08060000 mov rcx, qword ptr [rbp + 0x608]
140c190c0: 488b95e8050000 mov rdx, qword ptr [rbp + 0x5e8]
140c190c7: 4c8b85f0050000 mov r8, qword ptr [rbp + 0x5f0]
140c190ce: 440fb68d98050000 movzx r9d, byte ptr [rbp + 0x598]
140c190d6: 4180f9ff cmp r9b, 0xff
140c190da: 7406 je 0x140c190e2
140c190dc: 4180f902 cmp r9b, 2
140c190e0: 7505 jne 0x140c190e7
140c190e2: 4531c9 xor r9d, r9d
140c190e5: eb23 jmp 0x140c1910a
140c190e7: 4c8b8db0050000 mov r9, qword ptr [rbp + 0x5b0]
140c190ee: 4c8b95b8050000 mov r10, qword ptr [rbp + 0x5b8]
140c190f5: 4c8d9d98050000 lea r11, [rbp + 0x598]
140c190fc: 4c899dc8020000 mov qword ptr [rbp + 0x2c8], r11
140c19103: 4c8995d0020000 mov qword ptr [rbp + 0x2d0], r10
140c1910a: 4c898dc0020000 mov qword ptr [rbp + 0x2c0], r9
140c19111: 450fb78f28010000 movzx r9d, word ptr [r15 + 0x128]
140c19119: f30f6f85d0050000 movdqu xmm0, xmmword ptr [rbp + 0x5d0]
140c19121: f30f7f442468 movdqu xmmword ptr [rsp + 0x68], xmm0
140c19127: 6644894c2460 mov word ptr [rsp + 0x60], r9w
140c1912d: 4c8b8df8060000 mov r9, qword ptr [rbp + 0x6f8]
140c19134: 4c894c2450 mov qword ptr [rsp + 0x50], r9
140c19139: 488d9dc0020000 lea rbx, [rbp + 0x2c0]
140c19140: 48895c2448 mov qword ptr [rsp + 0x48], rbx
140c19145: 4c89442440 mov qword ptr [rsp + 0x40], r8
140c1914a: 4889542438 mov qword ptr [rsp + 0x38], rdx
140c1914f: 48894c2430 mov qword ptr [rsp + 0x30], rcx
140c19154: 4889442428 mov qword ptr [rsp + 0x28], rax
140c19159: 488d8560020000 lea rax, [rbp + 0x260]
140c19160: 4889442420 mov qword ptr [rsp + 0x20], rax
140c19165: c74424780000803f mov dword ptr [rsp + 0x78], 0x3f800000
140c1916d: c644245801 mov byte ptr [rsp + 0x58], 1
140c19172: 488d8da0030000 lea rcx, [rbp + 0x3a0]
140c19179: 488d5520 lea rdx, [rbp + 0x20]
140c1917d: 4c8b85f0060000 mov r8, qword ptr [rbp + 0x6f0]
140c19184: 4d89f1 mov r9, r14
140c19187: e8b4b23d00 call 0x140ff4440
140c1918c: 90 nop
140c1918d: 488b8568010000 mov rax, qword ptr [rbp + 0x168]
140c19194: 4885c0 test rax, rax
140c19197: 0f848e000000 je 0x140c1922b
140c1919d: 80bd58020000ff cmp byte ptr [rbp + 0x258], 0xff
140c191a4: 4989fe mov r14, rdi
140c191a7: 7473 je 0x140c1921c
140c191a9: 488b9550020000 mov rdx, qword ptr [rbp + 0x250]
140c191b0: 483b5010 cmp rdx, qword ptr [rax + 0x10]
140c191b4: 7366 jae 0x140c1921c
140c191b6: 488b4808 mov rcx, qword ptr [rax + 8]
140c191ba: 4c69c2d8000000 imul r8, rdx, 0xd8
140c191c1: 428b840198000000 mov eax, dword ptr [rcx + r8 + 0x98]
140c191c9: 4a8b540178 mov rdx, qword ptr [rcx + r8 + 0x78]
140c191ce: f048ff02 lock inc qword ptr [rdx]
140c191d2: 0f8e55060000 jle 0x140c1982d
140c191d8: 4c01c1 add rcx, r8
140c191db: 4c8b8180000000 mov r8, qword ptr [rcx + 0x80]
140c191e2: f049ff00 lock inc qword ptr [r8]
140c191e6: 0f8e41060000 jle 0x140c1982d
140c191ec: 4c8b8988000000 mov r9, qword ptr [rcx + 0x88]
140c191f3: 8b8990000000 mov ecx, dword ptr [rcx + 0x90]
140c191f9: 488995c0020000 mov qword ptr [rbp + 0x2c0], rdx
140c19200: 4c8985c8020000 mov qword ptr [rbp + 0x2c8], r8
140c19207: 4c898dd0020000 mov qword ptr [rbp + 0x2d0], r9
140c1920e: 898dd8020000 mov dword ptr [rbp + 0x2d8], ecx
140c19214: 8985e0020000 mov dword ptr [rbp + 0x2e0], eax
140c1921a: eb1f jmp 0x140c1923b
140c1921c: 48c785c002000000000000 mov qword ptr [rbp + 0x2c0], 0
140c19227: 31db xor ebx, ebx
140c19229: eb10 jmp 0x140c1923b
140c1922b: 48c785c002000000000000 mov qword ptr [rbp + 0x2c0], 0
140c19236: 31db xor ebx, ebx
140c19238: 4989fe mov r14, rdi
140c1923b: f30f6f8598060000 movdqu xmm0, xmmword ptr [rbp + 0x698]
140c19243: f30f7f442420 movdqu xmmword ptr [rsp + 0x20], xmm0
140c19249: c74424300000803f mov dword ptr [rsp + 0x30], 0x3f800000
140c19251: 488d4d20 lea rcx, [rbp + 0x20]
140c19255: 488d95a0030000 lea rdx, [rbp + 0x3a0]
140c1925c: 4989f0 mov r8, rsi
140c1925f: 4989d9 mov r9, rbx
140c19262: e8e9bb3d00 call 0x140ff4e50
140c19267: 90 nop
140c19268: 488b85c0020000 mov rax, qword ptr [rbp + 0x2c0]
140c1926f: 4885c0 test rax, rax
140c19272: 488bb5e0060000 mov rsi, qword ptr [rbp + 0x6e0]
140c19279: 7434 je 0x140c192af
140c1927b: f048ff08 lock dec qword ptr [rax]
140c1927f: 750d jne 0x140c1928e
140c19281: 488d8dc0020000 lea rcx, [rbp + 0x2c0]
140c19288: e893a81d03 call 0x143df3b20
140c1928d: 90 nop
140c1928e: 488b85c8020000 mov rax, qword ptr [rbp + 0x2c8]
140c19295: f048ff08 lock dec qword ptr [rax]
140c19299: 7514 jne 0x140c192af
140c1929b: 488d8dc8020000 lea rcx, [rbp + 0x2c8]
140c192a2: c6850507000001 mov byte ptr [rbp + 0x705], 1
140c192a9: e8d2a21d03 call 0x143df3580
140c192ae: 90 nop
140c192af: c646fc01 mov byte ptr [rsi - 4], 1
140c192b3: 488b85a0030000 mov rax, qword ptr [rbp + 0x3a0]
140c192ba: 4883f8ff cmp rax, -1
140c192be: 0f9546fe setne byte ptr [rsi - 2]
140c192c2: 7475 je 0x140c19339
140c192c4: 488b8d58040000 mov rcx, qword ptr [rbp + 0x458]
140c192cb: 488d95a8030000 lea rdx, [rbp + 0x3a8]
140c192d2: 4c8b4540 mov r8, qword ptr [rbp + 0x40]
140c192d6: 48898d60020000 mov qword ptr [rbp + 0x260], rcx
140c192dd: 660f6f4520 movdqa xmm0, xmmword ptr [rbp + 0x20]
140c192e2: 660f6f4d30 movdqa xmm1, xmmword ptr [rbp + 0x30]
140c192e7: f30f7f8568020000 movdqu xmmword ptr [rbp + 0x268], xmm0
140c192ef: f30f7f8d78020000 movdqu xmmword ptr [rbp + 0x278], xmm1
140c192f7: 4c898588020000 mov qword ptr [rbp + 0x288], r8
140c192fe: 488985c0020000 mov qword ptr [rbp + 0x2c0], rax
140c19305: 488d8dc8020000 lea rcx, [rbp + 0x2c8]
140c1930c: 41b8b0000000 mov r8d, 0xb0
140c19312: e8d00dfe04 call 0x145bfa0e7
140c19317: c6857803000000 mov byte ptr [rbp + 0x378], 0
140c1931e: c6850507000000 mov byte ptr [rbp + 0x705], 0
140c19325: 488d8d60020000 lea rcx, [rbp + 0x260]
140c1932c: 488d95c0020000 lea rdx, [rbp + 0x2c0]
140c19333: e8a8f2cdff call 0x1408f85e0
140c19338: 90 nop
140c19339: c646ff00 mov byte ptr [rsi - 1], 0
140c1933d: 488b8500060000 mov rax, qword ptr [rbp + 0x600]
140c19344: 488b8d08060000 mov rcx, qword ptr [rbp + 0x608]
140c1934b: 4889ca mov rdx, rcx
140c1934e: 48c1e207 shl rdx, 7
140c19352: 488d0cca lea rcx, [rdx + rcx*8]
140c19356: 4801c1 add rcx, rax
140c19359: 486b95f005000070 imul rdx, qword ptr [rbp + 0x5f0], 0x70
140c19361: 4c8b85e8050000 mov r8, qword ptr [rbp + 0x5e8]
140c19368: 4c01c2 add rdx, r8
140c1936b: 4c6b8dd805000070 imul r9, qword ptr [rbp + 0x5d8], 0x70
140c19373: 4c8b95d0050000 mov r10, qword ptr [rbp + 0x5d0]
140c1937a: 4d01d1 add r9, r10
140c1937d: c746f804000000 mov dword ptr [rsi - 8], 4
140c19384: 48c785c002000001000000 mov qword ptr [rbp + 0x2c0], 1
140c1938f: 488985c8020000 mov qword ptr [rbp + 0x2c8], rax
140c19396: 48898dd0020000 mov qword ptr [rbp + 0x2d0], rcx
140c1939d: 4c8985d8020000 mov qword ptr [rbp + 0x2d8], r8
140c193a4: 488995e0020000 mov qword ptr [rbp + 0x2e0], rdx
140c193ab: 4c8995e8020000 mov qword ptr [rbp + 0x2e8], r10
140c193b2: 4c898df0020000 mov qword ptr [rbp + 0x2f0], r9
140c193b9: 4c89adf8020000 mov qword ptr [rbp + 0x2f8], r13
140c193c0: c6850507000000 mov byte ptr [rbp + 0x705], 0
140c193c7: 488d8d60020000 lea rcx, [rbp + 0x260]
140c193ce: 488d95c0020000 lea rdx, [rbp + 0x2c0]
140c193d5: e85645eeff call 0x140afd930
140c193da: 90 nop
140c193db: 488d8678ffffff lea rax, [rsi - 0x88]
140c193e2: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c193e9: 488b4688 mov rax, qword ptr [rsi - 0x78]
140c193ed: 488985c8060000 mov qword ptr [rbp + 0x6c8], rax
140c193f4: 4885c0 test rax, rax
140c193f7: 448badc4060000 mov r13d, dword ptr [rbp + 0x6c4]
140c193fe: 746c je 0x140c1946c
140c19400: 488b85e0060000 mov rax, qword ptr [rbp + 0x6e0]
140c19407: 488b4080 mov rax, qword ptr [rax - 0x80]
140c1940b: 488bbdc8060000 mov rdi, qword ptr [rbp + 0x6c8]
140c19412: 48f7df neg rdi
140c19415: 48898548020000 mov qword ptr [rbp + 0x248], rax
140c1941c: 488d7008 lea rsi, [rax + 8]
140c19420: b901000000 mov ecx, 1
140c19425: eb24 jmp 0x140c1944b
140c19427: 660f1f840000000000 nop word ptr [rax + rax]
140c19430: 488b8df8060000 mov rcx, qword ptr [rbp + 0x6f8]
140c19437: 488d040f lea rax, [rdi + rcx]
140c1943b: 48ffc0 inc rax
140c1943e: 48ffc1 inc rcx
140c19441: 4883c618 add rsi, 0x18
140c19445: 4883f801 cmp rax, 1
140c19449: 7421 je 0x140c1946c
140c1944b: 48898df8060000 mov qword ptr [rbp + 0x6f8], rcx
140c19452: 807ef800 cmp byte ptr [rsi - 8], 0
140c19456: 75d8 jne 0x140c19430
140c19458: 488b06 mov rax, qword ptr [rsi]
140c1945b: f048ff08 lock dec qword ptr [rax]
140c1945f: 75cf jne 0x140c19430
140c19461: 4889f1 mov rcx, rsi
140c19464: e807bdd603 call 0x144985170
140c19469: 90 nop
140c1946a: ebc4 jmp 0x140c19430
140c1946c: 488bb5f0060000 mov rsi, qword ptr [rbp + 0x6f0]
140c19473: 488b06 mov rax, qword ptr [rsi]
140c19476: 4885c0 test rax, rax
140c19479: 488b9de0060000 mov rbx, qword ptr [rbp + 0x6e0]
140c19480: 7417 je 0x140c19499
140c19482: 488b4b80 mov rcx, qword ptr [rbx - 0x80]
140c19486: 48c1e003 shl rax, 3
140c1948a: 488d1440 lea rdx, [rax + rax*2]
140c1948e: 41b808000000 mov r8d, 8
140c19494: e8378d3eff call 0x1400021d0
140c19499: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
140c194a0: 48894610 mov qword ptr [rsi + 0x10], rax
140c194a4: 0f108560020000 movups xmm0, xmmword ptr [rbp + 0x260]
140c194ab: 0f1106 movups xmmword ptr [rsi], xmm0
140c194ae: 48c78358ffffff00000000 mov qword ptr [rbx - 0xa8], 0
140c194b9: c643fd01 mov byte ptr [rbx - 3], 1
140c194bd: 48c78368ffffff00000000 mov qword ptr [rbx - 0x98], 0
140c194c8: 488b8580060000 mov rax, qword ptr [rbp + 0x680]
140c194cf: 48898530030000 mov qword ptr [rbp + 0x330], rax
140c194d6: 0f288570060000 movaps xmm0, xmmword ptr [rbp + 0x670]
140c194dd: 0f298520030000 movaps xmmword ptr [rbp + 0x320], xmm0
140c194e4: 0f288560060000 movaps xmm0, xmmword ptr [rbp + 0x660]
140c194eb: 0f298510030000 movaps xmmword ptr [rbp + 0x310], xmm0
140c194f2: 0f288550060000 movaps xmm0, xmmword ptr [rbp + 0x650]
140c194f9: 0f298500030000 movaps xmmword ptr [rbp + 0x300], xmm0
140c19500: 660f6f8510060000 movdqa xmm0, xmmword ptr [rbp + 0x610]
140c19508: 660f6f8d20060000 movdqa xmm1, xmmword ptr [rbp + 0x620]
140c19510: 660f6f9530060000 movdqa xmm2, xmmword ptr [rbp + 0x630]
140c19518: 660f6f9d40060000 movdqa xmm3, xmmword ptr [rbp + 0x640]
140c19520: 660f7f9df0020000 movdqa xmmword ptr [rbp + 0x2f0], xmm3
140c19528: 660f7f95e0020000 movdqa xmmword ptr [rbp + 0x2e0], xmm2
140c19530: 660f7f8dd0020000 movdqa xmmword ptr [rbp + 0x2d0], xmm1
140c19538: 660f7f85c0020000 movdqa xmmword ptr [rbp + 0x2c0], xmm0
140c19540: 0fb68598050000 movzx eax, byte ptr [rbp + 0x598]
140c19547: 3cff cmp al, 0xff
140c19549: 7422 je 0x140c1956d
140c1954b: 3c02 cmp al, 2
140c1954d: 741e je 0x140c1956d
140c1954f: 84c0 test al, al
140c19551: 751a jne 0x140c1956d
140c19553: 488b85a0050000 mov rax, qword ptr [rbp + 0x5a0]
140c1955a: f048ff08 lock dec qword ptr [rax]
140c1955e: 750d jne 0x140c1956d
140c19560: 488d8da0050000 lea rcx, [rbp + 0x5a0]
140c19567: e804bcd603 call 0x144985170
140c1956c: 90 nop
140c1956d: 488b8d98060000 mov rcx, qword ptr [rbp + 0x698]
140c19574: 488b85a0060000 mov rax, qword ptr [rbp + 0x6a0]
140c1957b: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c19582: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c1958d: 48898dc8060000 mov qword ptr [rbp + 0x6c8], rcx
140c19594: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140c195a0: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c195a7: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c195ae: 741c je 0x140c195cc
140c195b0: 48ffc0 inc rax
140c195b3: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c195ba: 488db1e8000000 lea rsi, [rcx + 0xe8]
140c195c1: e84ac3ebff call 0x140ad5910
140c195c6: 90 nop
140c195c7: 4889f1 mov rcx, rsi
140c195ca: ebd4 jmp 0x140c195a0
140c195cc: 488b8590060000 mov rax, qword ptr [rbp + 0x690]
140c195d3: 4885c0 test rax, rax
140c195d6: 7419 je 0x140c195f1
140c195d8: 4869d0e8000000 imul rdx, rax, 0xe8
140c195df: 41b808000000 mov r8d, 8
140c195e5: 488b8dc8060000 mov rcx, qword ptr [rbp + 0x6c8]
140c195ec: e8df8b3eff call 0x1400021d0
140c195f1: 488b8dd0050000 mov rcx, qword ptr [rbp + 0x5d0]
140c195f8: 488b85d8050000 mov rax, qword ptr [rbp + 0x5d8]
140c195ff: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c19606: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c19611: 48898dc8060000 mov qword ptr [rbp + 0x6c8], rcx
140c19618: 0f1f840000000000 nop dword ptr [rax + rax]
140c19620: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c19627: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c1962e: 7419 je 0x140c19649
140c19630: 48ffc0 inc rax
140c19633: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c1963a: 488d7170 lea rsi, [rcx + 0x70]
140c1963e: e84dd495ff call 0x140576a90
140c19643: 90 nop
140c19644: 4889f1 mov rcx, rsi
140c19647: ebd7 jmp 0x140c19620
140c19649: 488b85c8050000 mov rax, qword ptr [rbp + 0x5c8]
140c19650: 4885c0 test rax, rax
140c19653: 7416 je 0x140c1966b
140c19655: 486bd070 imul rdx, rax, 0x70
140c19659: 41b808000000 mov r8d, 8
140c1965f: 488b8dc8060000 mov rcx, qword ptr [rbp + 0x6c8]
140c19666: e8658b3eff call 0x1400021d0
140c1966b: 488b8de8050000 mov rcx, qword ptr [rbp + 0x5e8]
140c19672: 488b85f0050000 mov rax, qword ptr [rbp + 0x5f0]
140c19679: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c19680: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c1968b: 48898dc8060000 mov qword ptr [rbp + 0x6c8], rcx
140c19692: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140c196a0: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c196a7: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c196ae: 7419 je 0x140c196c9
140c196b0: 48ffc0 inc rax
140c196b3: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c196ba: 488d7170 lea rsi, [rcx + 0x70]
140c196be: e8cdd395ff call 0x140576a90
140c196c3: 90 nop
140c196c4: 4889f1 mov rcx, rsi
140c196c7: ebd7 jmp 0x140c196a0
140c196c9: 488b85e0050000 mov rax, qword ptr [rbp + 0x5e0]
140c196d0: 4885c0 test rax, rax
140c196d3: 7416 je 0x140c196eb
140c196d5: 486bd070 imul rdx, rax, 0x70
140c196d9: 41b808000000 mov r8d, 8
140c196df: 488b8dc8060000 mov rcx, qword ptr [rbp + 0x6c8]
140c196e6: e8e58a3eff call 0x1400021d0
140c196eb: 488b8d00060000 mov rcx, qword ptr [rbp + 0x600]
140c196f2: 488b8508060000 mov rax, qword ptr [rbp + 0x608]
140c196f9: 488985f0060000 mov qword ptr [rbp + 0x6f0], rax
140c19700: 48c785f806000000000000 mov qword ptr [rbp + 0x6f8], 0
140c1970b: 48898dc8060000 mov qword ptr [rbp + 0x6c8], rcx
140c19712: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
140c19720: 488b85f8060000 mov rax, qword ptr [rbp + 0x6f8]
140c19727: 483985f0060000 cmp qword ptr [rbp + 0x6f0], rax
140c1972e: 741c je 0x140c1974c
140c19730: 48ffc0 inc rax
140c19733: 488985f8060000 mov qword ptr [rbp + 0x6f8], rax
140c1973a: 488db188000000 lea rsi, [rcx + 0x88]
140c19741: e84ac3ebff call 0x140ad5a90
140c19746: 90 nop
140c19747: 4889f1 mov rcx, rsi
140c1974a: ebd4 jmp 0x140c19720
140c1974c: 488b85f8050000 mov rax, qword ptr [rbp + 0x5f8]
140c19753: 4885c0 test rax, rax
140c19756: 741d je 0x140c19775
140c19758: 4889c1 mov rcx, rax
140c1975b: 48c1e107 shl rcx, 7
140c1975f: 488d14c1 lea rdx, [rcx + rax*8]
140c19763: 41b808000000 mov r8d, 8
140c19769: 488b8dc8060000 mov rcx, qword ptr [rbp + 0x6c8]
140c19770: e85b8a3eff call 0x1400021d0
140c19775: 498b4760 mov rax, qword ptr [r15 + 0x60]
140c19779: 8b4d64 mov ecx, dword ptr [rbp + 0x64]
140c1977c: 488b5558 mov rdx, qword ptr [rbp + 0x58]
140c19780: 49894608 mov qword ptr [r14 + 8], rax
140c19784: 8b85d0060000 mov eax, dword ptr [rbp + 0x6d0]
140c1978a: 41894610 mov dword ptr [r14 + 0x10], eax
140c1978e: 0f2885c0020000 movaps xmm0, xmmword ptr [rbp + 0x2c0]
140c19795: 660f6f8dd0020000 movdqa xmm1, xmmword ptr [rbp + 0x2d0]
140c1979d: 660f6f95e0020000 movdqa xmm2, xmmword ptr [rbp + 0x2e0]
140c197a5: 660f6f9df0020000 movdqa xmm3, xmmword ptr [rbp + 0x2f0]
140c197ad: 410f114614 movups xmmword ptr [r14 + 0x14], xmm0
140c197b2: f3410f7f4e24 movdqu xmmword ptr [r14 + 0x24], xmm1
140c197b8: f3410f7f5634 movdqu xmmword ptr [r14 + 0x34], xmm2
140c197be: f3410f7f5e44 movdqu xmmword ptr [r14 + 0x44], xmm3
140c197c4: 0f288500030000 movaps xmm0, xmmword ptr [rbp + 0x300]
140c197cb: 410f114654 movups xmmword ptr [r14 + 0x54], xmm0
140c197d0: 0f288510030000 movaps xmm0, xmmword ptr [rbp + 0x310]
140c197d7: 410f114664 movups xmmword ptr [r14 + 0x64], xmm0
140c197dc: 660f6f8520030000 movdqa xmm0, xmmword ptr [rbp + 0x320]
140c197e4: f3410f7f4674 movdqu xmmword ptr [r14 + 0x74], xmm0
140c197ea: 488b8530030000 mov rax, qword ptr [rbp + 0x330]
140c197f1: 49898684000000 mov qword ptr [r14 + 0x84], rax
140c197f8: 41c70600000000 mov dword ptr [r14], 0
140c197ff: 890a mov dword ptr [rdx], ecx
140c19801: 41c786a000000000000000 mov dword ptr [r14 + 0xa0], 0
140c1980c: 41837e1002 cmp dword ptr [r14 + 0x10], 2
140c19811: 0f85a9f3ffff jne 0x140c18bc0
140c19817: e9b1f7ffff jmp 0x140c18fcd
140c1981c: 488b85a8030000 mov rax, qword ptr [rbp + 0x3a8]
140c19823: f048ff00 lock inc qword ptr [rax]
140c19827: 0f8f24ecffff jg 0x140c18451
140c1982d: 0f0b ud2
140c1982f: 488d0d82003305 lea rcx, [rip + 0x5330082]
140c19836: 4c8d058b003305 lea r8, [rip + 0x533008b]
140c1983d: ba0b000000 mov edx, 0xb
140c19842: e829fd1705 call 0x145d99570
140c19847: 0f0b ud2
140c19849: f30f6f8510060000 movdqu xmm0, xmmword ptr [rbp + 0x610]
140c19851: 660f7f85a0030000 movdqa xmmword ptr [rbp + 0x3a0], xmm0
140c19859: c685ef06000000 mov byte ptr [rbp + 0x6ef], 0
140c19860: 488d0571533205 lea rax, [rip + 0x5325371]
140c19867: 4889442420 mov qword ptr [rsp + 0x20], rax
140c1986c: 488d0d2e693205 lea rcx, [rip + 0x532692e]
140c19873: 4c8d0db6693205 lea r9, [rip + 0x53269b6]
140c1987a: 4c8d85a0030000 lea r8, [rbp + 0x3a0]
140c19881: ba2b000000 mov edx, 0x2b
140c19886: e845fd1705 call 0x145d995d0
140c1988b: 90 nop
140c1988c: eb9f jmp 0x140c1982d
140c1988e: f30f6f8510060000 movdqu xmm0, xmmword ptr [rbp + 0x610]
140c19896: 660f7f85a0030000 movdqa xmmword ptr [rbp + 0x3a0], xmm0
140c1989e: c685ee06000000 mov byte ptr [rbp + 0x6ee], 0
140c198a5: 488d052c533205 lea rax, [rip + 0x532532c]
140c198ac: 4889442420 mov qword ptr [rsp + 0x20], rax
140c198b1: 488d0de9683205 lea rcx, [rip + 0x53268e9]
140c198b8: 4c8d0d71693205 lea r9, [rip + 0x5326971]
140c198bf: 4c8d85a0030000 lea r8, [rbp + 0x3a0]
140c198c6: ba2b000000 mov edx, 0x2b
140c198cb: e800fd1705 call 0x145d995d0
140c198d0: 90 nop
140c198d1: e957ffffff jmp 0x140c1982d
140c198d6: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140c198df: 41b858000000 mov r8d, 0x58
140c198e5: 41b901000000 mov r9d, 1
140c198eb: 4889f1 mov rcx, rsi
140c198ee: 4889fa mov rdx, rdi
140c198f1: e87a10fe04 call 0x145bfa970
140c198f6: e9e0f5ffff jmp 0x140c18edb
140c198fb: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
140c19904: 41b810000000 mov r8d, 0x10
140c1990a: 41b901000000 mov r9d, 1
140c19910: 4889f1 mov rcx, rsi
140c19913: 4889da mov rdx, rbx
140c19916: e85510fe04 call 0x145bfa970
140c1991b: 90 nop
140c1991c: e919f7ffff jmp 0x140c1903a
140c19921: 4c89b5f8060000 mov qword ptr [rbp + 0x6f8], r14
140c19928: 48899db0060000 mov qword ptr [rbp + 0x6b0], rbx
140c1992f: b901000000 mov ecx, 1
140c19934: ba04000000 mov edx, 4
140c19939: e87df91705 call 0x145d992bb
140c1993e: 90 nop
140c1993f: e9e9feffff jmp 0x140c1982d
140c19944: c6850707000001 mov byte ptr [rbp + 0x707], 1
140c1994b: c6850607000001 mov byte ptr [rbp + 0x706], 1
140c19952: b901000000 mov ecx, 1
140c19957: ba04000000 mov edx, 4
140c1995c: e85af91705 call 0x145d992bb
140c19961: 90 nop
140c19962: e9c6feffff jmp 0x140c1982d
140c19967: b901000000 mov ecx, 1
140c1996c: ba04000000 mov edx, 4
140c19971: e845f91705 call 0x145d992bb
140c19976: 0f0b ud2
140c19978: 4c8d05c1d13b05 lea r8, [rip + 0x53bd1c1]
140c1997f: 4889c1 mov rcx, rax
140c19982: e8ccfc1705 call 0x145d99653
140c19987: 0f0b ud2
