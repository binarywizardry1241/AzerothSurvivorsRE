0x1459d17e0: 55 push rbp
0x1459d17e1: 4157 push r15
0x1459d17e3: 4156 push r14
0x1459d17e5: 4155 push r13
0x1459d17e7: 4154 push r12
0x1459d17e9: 56 push rsi
0x1459d17ea: 57 push rdi
0x1459d17eb: 53 push rbx
0x1459d17ec: 4881ece8000000 sub rsp, 0xe8
0x1459d17f3: 488dac2480000000 lea rbp, [rsp + 0x80]
0x1459d17fb: 48c74560feffffff mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
0x1459d1803: 4889ce mov rsi, rcx
0x1459d1806: 4c8b3a mov r15, qword ptr [rdx]
0x1459d1809: 4c8b7208 mov r14, qword ptr [rdx + 8]
0x1459d180d: 4d39f7 cmp r15, r14
0x1459d1810: 0f8445020000 je 0x1459d1a5b
0x1459d1816: 4c8b6210 mov r12, qword ptr [rdx + 0x10]
0x1459d181a: 498b4c2408 mov rcx, qword ptr [r12 + 8]
0x1459d181f: 4d69442410d8010000 imul r8, qword ptr [r12 + 0x10], 0x1d8
0x1459d1828: eb0f jmp 0x1459d1839
0x1459d182a: 660f1f440000 nop word ptr [rax + rax]
0x1459d1830: 4d39f7 cmp r15, r14
0x1459d1833: 0f8422020000 je 0x1459d1a5b
0x1459d1839: 4c89f8 mov rax, r15
0x1459d183c: 4983c740 add r15, 0x40
0x1459d1840: 4c8b08 mov r9, qword ptr [rax]
0x1459d1843: 4d89c2 mov r10, r8
0x1459d1846: 4989cb mov r11, rcx
0x1459d1849: 0f1f8000000000 nop dword ptr [rax]
0x1459d1850: 4d85d2 test r10, r10
0x1459d1853: 74db je 0x1459d1830
0x1459d1855: 4c89df mov rdi, r11
0x1459d1858: 4981c3d8010000 add r11, 0x1d8
0x1459d185f: 4981c228feffff add r10, -0x1d8
0x1459d1866: 4c398ff0000000 cmp qword ptr [rdi + 0xf0], r9
0x1459d186d: 75e1 jne 0x1459d1850
0x1459d186f: f687b000000001 test byte ptr [rdi + 0xb0], 1
0x1459d1876: 75d8 jne 0x1459d1850
0x1459d1878: 0fb65839 movzx ebx, byte ptr [rax + 0x39]
0x1459d187c: 80fb02 cmp bl, 2
0x1459d187f: 74af je 0x1459d1830
0x1459d1881: 4c893a mov qword ptr [rdx], r15
0x1459d1884: 0f1000 movups xmm0, xmmword ptr [rax]
0x1459d1887: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
0x1459d188b: 0f105020 movups xmm2, xmmword ptr [rax + 0x20]
0x1459d188f: 0f105829 movups xmm3, xmmword ptr [rax + 0x29]
0x1459d1893: 0f115dd9 movups xmmword ptr [rbp - 0x27], xmm3
0x1459d1897: 0f2955d0 movaps xmmword ptr [rbp - 0x30], xmm2
0x1459d189b: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
0x1459d189f: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
0x1459d18a3: 8b483a mov ecx, dword ptr [rax + 0x3a]
0x1459d18a6: 894d58 mov dword ptr [rbp + 0x58], ecx
0x1459d18a9: 0fb7403e movzx eax, word ptr [rax + 0x3e]
0x1459d18ad: 6689455c mov word ptr [rbp + 0x5c], ax
0x1459d18b1: e84a0963fa call 0x140002200
0x1459d18b6: b900010000 mov ecx, 0x100
0x1459d18bb: ba08000000 mov edx, 8
0x1459d18c0: e8fb0863fa call 0x1400021c0
0x1459d18c5: 4885c0 test rax, rax
0x1459d18c8: 0f84bb010000 je 0x1459d1a89
0x1459d18ce: 0f1045d9 movups xmm0, xmmword ptr [rbp - 0x27]
0x1459d18d2: 0f114029 movups xmmword ptr [rax + 0x29], xmm0
0x1459d18d6: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
0x1459d18da: 0f284dc0 movaps xmm1, xmmword ptr [rbp - 0x40]
0x1459d18de: 0f2855d0 movaps xmm2, xmmword ptr [rbp - 0x30]
0x1459d18e2: 0f115020 movups xmmword ptr [rax + 0x20], xmm2
0x1459d18e6: 0f114810 movups xmmword ptr [rax + 0x10], xmm1
0x1459d18ea: 0f1100 movups xmmword ptr [rax], xmm0
0x1459d18ed: 885839 mov byte ptr [rax + 0x39], bl
0x1459d18f0: 8b4d58 mov ecx, dword ptr [rbp + 0x58]
0x1459d18f3: 89483a mov dword ptr [rax + 0x3a], ecx
0x1459d18f6: 0fb74d5c movzx ecx, word ptr [rbp + 0x5c]
0x1459d18fa: 6689483e mov word ptr [rax + 0x3e], cx
0x1459d18fe: 48c7453804000000 mov qword ptr [rbp + 0x38], 4
0x1459d1906: 48894540 mov qword ptr [rbp + 0x40], rax
0x1459d190a: 48c7454801000000 mov qword ptr [rbp + 0x48], 1
0x1459d1912: 4d39f7 cmp r15, r14
0x1459d1915: 0f8427010000 je 0x1459d1a42
0x1459d191b: bf01000000 mov edi, 1
0x1459d1920: 488d5d38 lea rbx, [rbp + 0x38]
0x1459d1924: 498b542408 mov rdx, qword ptr [r12 + 8]
0x1459d1929: 4d69442410d8010000 imul r8, qword ptr [r12 + 0x10], 0x1d8
0x1459d1932: eb15 jmp 0x1459d1949
0x1459d1934: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x1459d1940: 4d39f7 cmp r15, r14
0x1459d1943: 0f84f9000000 je 0x1459d1a42
0x1459d1949: 4c89f9 mov rcx, r15
0x1459d194c: 4983c740 add r15, 0x40
0x1459d1950: 4c8b09 mov r9, qword ptr [rcx]
0x1459d1953: 4d89c2 mov r10, r8
0x1459d1956: 4989d3 mov r11, rdx
0x1459d1959: 0f1f8000000000 nop dword ptr [rax]
0x1459d1960: 4d85d2 test r10, r10
0x1459d1963: 74db je 0x1459d1940
0x1459d1965: 4d89dd mov r13, r11
0x1459d1968: 4981c3d8010000 add r11, 0x1d8
0x1459d196f: 4981c228feffff add r10, -0x1d8
0x1459d1976: 4d398df0000000 cmp qword ptr [r13 + 0xf0], r9
0x1459d197d: 75e1 jne 0x1459d1960
0x1459d197f: 41f685b000000001 test byte ptr [r13 + 0xb0], 1
0x1459d1987: 75d7 jne 0x1459d1960
0x1459d1989: 440fb66939 movzx r13d, byte ptr [rcx + 0x39]
0x1459d198e: 4180fd02 cmp r13b, 2
0x1459d1992: 74ac je 0x1459d1940
0x1459d1994: 0fb7513e movzx edx, word ptr [rcx + 0x3e]
0x1459d1998: 66895554 mov word ptr [rbp + 0x54], dx
0x1459d199c: 8b513a mov edx, dword ptr [rcx + 0x3a]
0x1459d199f: 895550 mov dword ptr [rbp + 0x50], edx
0x1459d19a2: 0f1001 movups xmm0, xmmword ptr [rcx]
0x1459d19a5: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
0x1459d19a9: 0f105120 movups xmm2, xmmword ptr [rcx + 0x20]
0x1459d19ad: 488b5130 mov rdx, qword ptr [rcx + 0x30]
0x1459d19b1: 0fb64938 movzx ecx, byte ptr [rcx + 0x38]
0x1459d19b5: 884d28 mov byte ptr [rbp + 0x28], cl
0x1459d19b8: 48895520 mov qword ptr [rbp + 0x20], rdx
0x1459d19bc: 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
0x1459d19c0: 0f294d00 movaps xmmword ptr [rbp], xmm1
0x1459d19c4: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
0x1459d19c8: 483b7d38 cmp rdi, qword ptr [rbp + 0x38]
0x1459d19cc: 7525 jne 0x1459d19f3
0x1459d19ce: 48c744242040000000 mov qword ptr [rsp + 0x20], 0x40
0x1459d19d7: 41b801000000 mov r8d, 1
0x1459d19dd: 41b908000000 mov r9d, 8
0x1459d19e3: 4889d9 mov rcx, rbx
0x1459d19e6: 4889fa mov rdx, rdi
0x1459d19e9: e882ba2300 call 0x145c0d470
0x1459d19ee: 90 nop
0x1459d19ef: 488b4540 mov rax, qword ptr [rbp + 0x40]
0x1459d19f3: 4889f9 mov rcx, rdi
0x1459d19f6: 48c1e106 shl rcx, 6
0x1459d19fa: 0f104519 movups xmm0, xmmword ptr [rbp + 0x19]
0x1459d19fe: 0f11440829 movups xmmword ptr [rax + rcx + 0x29], xmm0
0x1459d1a03: 0f2845f0 movaps xmm0, xmmword ptr [rbp - 0x10]
0x1459d1a07: 0f284d00 movaps xmm1, xmmword ptr [rbp]
0x1459d1a0b: 0f285510 movaps xmm2, xmmword ptr [rbp + 0x10]
0x1459d1a0f: 0f11540820 movups xmmword ptr [rax + rcx + 0x20], xmm2
0x1459d1a14: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
0x1459d1a19: 0f110408 movups xmmword ptr [rax + rcx], xmm0
0x1459d1a1d: 44886c0839 mov byte ptr [rax + rcx + 0x39], r13b
0x1459d1a22: 8b5550 mov edx, dword ptr [rbp + 0x50]
0x1459d1a25: 8954083a mov dword ptr [rax + rcx + 0x3a], edx
0x1459d1a29: 0fb75554 movzx edx, word ptr [rbp + 0x54]
0x1459d1a2d: 668954083e mov word ptr [rax + rcx + 0x3e], dx
0x1459d1a32: 48ffc7 inc rdi
0x1459d1a35: 48897d48 mov qword ptr [rbp + 0x48], rdi
0x1459d1a39: 4d39f7 cmp r15, r14
0x1459d1a3c: 0f85e2feffff jne 0x1459d1924
0x1459d1a42: 488b4548 mov rax, qword ptr [rbp + 0x48]
0x1459d1a46: 48894610 mov qword ptr [rsi + 0x10], rax
0x1459d1a4a: 488b4538 mov rax, qword ptr [rbp + 0x38]
0x1459d1a4e: 488906 mov qword ptr [rsi], rax
0x1459d1a51: 488b4540 mov rax, qword ptr [rbp + 0x40]
0x1459d1a55: 48894608 mov qword ptr [rsi + 8], rax
0x1459d1a59: eb17 jmp 0x1459d1a72
0x1459d1a5b: 48c70600000000 mov qword ptr [rsi], 0
0x1459d1a62: 48c7460808000000 mov qword ptr [rsi + 8], 8
0x1459d1a6a: 48c7461000000000 mov qword ptr [rsi + 0x10], 0
0x1459d1a72: 4889f0 mov rax, rsi
0x1459d1a75: 4881c4e8000000 add rsp, 0xe8
0x1459d1a7c: 5b pop rbx
0x1459d1a7d: 5f pop rdi
0x1459d1a7e: 5e pop rsi
0x1459d1a7f: 415c pop r12
0x1459d1a81: 415d pop r13
0x1459d1a83: 415e pop r14
0x1459d1a85: 415f pop r15
0x1459d1a87: 5d pop rbp
0x1459d1a88: c3 ret
0x1459d1a89: b908000000 mov ecx, 8
0x1459d1a8e: ba00010000 mov edx, 0x100
0x1459d1a93: e8537a3d00 call 0x145da94eb
0x1459d1a98: 0f0b ud2
