1401c18e0: 55 push rbp
1401c18e1: 56 push rsi
1401c18e2: 57 push rdi
1401c18e3: 4881ec50040000 sub rsp, 0x450
1401c18ea: 488dac2480000000 lea rbp, [rsp + 0x80]
1401c18f2: 48c785c8030000feffffff mov qword ptr [rbp + 0x3c8], 0xfffffffffffffffe
1401c18fd: 4889d6 mov rsi, rdx
1401c1900: 66c785240300000000 mov word ptr [rbp + 0x324], 0
1401c1909: c6851403000001 mov byte ptr [rbp + 0x314], 1
1401c1910: 0f57c0 xorps xmm0, xmm0
1401c1913: 0f298520020000 movaps xmmword ptr [rbp + 0x220], xmm0
1401c191a: 0f298530020000 movaps xmmword ptr [rbp + 0x230], xmm0
1401c1921: 0f298540020000 movaps xmmword ptr [rbp + 0x240], xmm0
1401c1928: 0f298550020000 movaps xmmword ptr [rbp + 0x250], xmm0
1401c192f: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
1401c1936: 48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
1401c1941: c7853803000000000000 mov dword ptr [rbp + 0x338], 0
1401c194b: 66c7853c0300000000 mov word ptr [rbp + 0x33c], 0
1401c1954: 0f1005150bc305 movups xmm0, xmmword ptr [rip + 0x5c30b15]
1401c195b: 0f118578020000 movups xmmword ptr [rbp + 0x278], xmm0
1401c1962: 0f1005170bc305 movups xmm0, xmmword ptr [rip + 0x5c30b17]
1401c1969: 0f118588020000 movups xmmword ptr [rbp + 0x288], xmm0
1401c1970: 0f1005190bc305 movups xmm0, xmmword ptr [rip + 0x5c30b19]
1401c1977: 0f118598020000 movups xmmword ptr [rbp + 0x298], xmm0
1401c197e: 0f10051b0bc305 movups xmm0, xmmword ptr [rip + 0x5c30b1b]
1401c1985: 0f1185a8020000 movups xmmword ptr [rbp + 0x2a8], xmm0
1401c198c: 0f28058d93bf05 movaps xmm0, xmmword ptr [rip + 0x5bf938d]
1401c1993: 0f1185b8020000 movups xmmword ptr [rbp + 0x2b8], xmm0
1401c199a: 0f1185c8020000 movups xmmword ptr [rbp + 0x2c8], xmm0
1401c19a1: 0f280578fabe05 movaps xmm0, xmmword ptr [rip + 0x5befa78]
1401c19a8: 0f1185d8020000 movups xmmword ptr [rbp + 0x2d8], xmm0
1401c19af: 0f1185e8020000 movups xmmword ptr [rbp + 0x2e8], xmm0
1401c19b6: 66c785360300000000 mov word ptr [rbp + 0x336], 0
1401c19bf: c7853203000000010003 mov dword ptr [rbp + 0x332], 0x3000100
1401c19c9: 48c7851803000000000000 mov qword ptr [rbp + 0x318], 0
1401c19d4: c785200300000000803f mov dword ptr [rbp + 0x320], 0x3f800000
1401c19de: 0f28055bb9be05 movaps xmm0, xmmword ptr [rip + 0x5beb95b]
1401c19e5: 0f1185f8020000 movups xmmword ptr [rbp + 0x2f8], xmm0
1401c19ec: c7850803000001000000 mov dword ptr [rbp + 0x308], 1
1401c19f6: 48c7850c03000000000000 mov qword ptr [rbp + 0x30c], 0
1401c1a01: 0f1005b009c305 movups xmm0, xmmword ptr [rip + 0x5c309b0]
1401c1a08: 0f2985c0010000 movaps xmmword ptr [rbp + 0x1c0], xmm0
1401c1a0f: 48c785d001000000000000 mov qword ptr [rbp + 0x1d0], 0
1401c1a1a: 0f1005af09c305 movups xmm0, xmmword ptr [rip + 0x5c309af]
1401c1a21: 0f1185d8010000 movups xmmword ptr [rbp + 0x1d8], xmm0
1401c1a28: 48c785e801000000000000 mov qword ptr [rbp + 0x1e8], 0
1401c1a33: 0f1005ae09c305 movups xmm0, xmmword ptr [rip + 0x5c309ae]
1401c1a3a: 0f2985f0010000 movaps xmmword ptr [rbp + 0x1f0], xmm0
1401c1a41: 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1401c1a4c: 0f1005ad09c305 movups xmm0, xmmword ptr [rip + 0x5c309ad]
1401c1a53: 0f118508020000 movups xmmword ptr [rbp + 0x208], xmm0
1401c1a5a: 48c7851802000000000000 mov qword ptr [rbp + 0x218], 0
1401c1a65: 66c7852a0300000000 mov word ptr [rbp + 0x32a], 0
1401c1a6e: c7852603000000000100 mov dword ptr [rbp + 0x326], 0x10000
1401c1a78: 66c785300300000000 mov word ptr [rbp + 0x330], 0
1401c1a81: c7852c03000000000100 mov dword ptr [rbp + 0x32c], 0x10000
1401c1a8b: 0f1005a60ac305 movups xmm0, xmmword ptr [rip + 0x5c30aa6]
1401c1a92: 0f298560030000 movaps xmmword ptr [rbp + 0x360], xmm0
1401c1a99: c785700300000000803f mov dword ptr [rbp + 0x370], 0x3f800000
1401c1aa3: 0f118574030000 movups xmmword ptr [rbp + 0x374], xmm0
1401c1aaa: c785840300000000803f mov dword ptr [rbp + 0x384], 0x3f800000
1401c1ab4: 0f118588030000 movups xmmword ptr [rbp + 0x388], xmm0
1401c1abb: c785980300000000803f mov dword ptr [rbp + 0x398], 0x3f800000
1401c1ac5: 0f11859c030000 movups xmmword ptr [rbp + 0x39c], xmm0
1401c1acc: c785ac0300000000803f mov dword ptr [rbp + 0x3ac], 0x3f800000
1401c1ad6: 0f10056f0ac305 movups xmm0, xmmword ptr [rip + 0x5c30a6f]
1401c1add: 0f298540030000 movaps xmmword ptr [rbp + 0x340], xmm0
1401c1ae4: c785500300009a99193f mov dword ptr [rbp + 0x350], 0x3f19999a
1401c1aee: 488d8db0030000 lea rcx, [rbp + 0x3b0]
1401c1af5: 488d9540030000 lea rdx, [rbp + 0x340]
1401c1afc: e8df77ac04 call 0x144c892e0
1401c1b01: 90 nop
1401c1b02: 0f2885b0030000 movaps xmm0, xmmword ptr [rbp + 0x3b0]
1401c1b09: 0f1145d4 movups xmmword ptr [rbp - 0x2c], xmm0
1401c1b0d: c745d001000000 mov dword ptr [rbp - 0x30], 1
1401c1b14: c744244800000041 mov dword ptr [rsp + 0x48], 0x41000000
1401c1b1c: c744244001000000 mov dword ptr [rsp + 0x40], 1
1401c1b24: c74424380000803f mov dword ptr [rsp + 0x38], 0x3f800000
1401c1b2c: c744243001000000 mov dword ptr [rsp + 0x30], 1
1401c1b34: c744242800000000 mov dword ptr [rsp + 0x28], 0
1401c1b3c: c744242001000000 mov dword ptr [rsp + 0x20], 1
1401c1b44: 488d8db0030000 lea rcx, [rbp + 0x3b0]
1401c1b4b: 488d55d0 lea rdx, [rbp - 0x30]
1401c1b4f: 0f57db xorps xmm3, xmm3
1401c1b52: 41b801000000 mov r8d, 1
1401c1b58: e853394902 call 0x1426554b0
1401c1b5d: 90 nop
1401c1b5e: 488d7dd0 lea rdi, [rbp - 0x30]
1401c1b62: 488d95c0010000 lea rdx, [rbp + 0x1c0]
1401c1b69: 41b880010000 mov r8d, 0x180
1401c1b6f: 4889f9 mov rcx, rdi
1401c1b72: e86488a405 call 0x145c0a3db
1401c1b77: 0f288560030000 movaps xmm0, xmmword ptr [rbp + 0x360]
1401c1b7e: 0f288d70030000 movaps xmm1, xmmword ptr [rbp + 0x370]
1401c1b85: 0f289580030000 movaps xmm2, xmmword ptr [rbp + 0x380]
1401c1b8c: 0f289d90030000 movaps xmm3, xmmword ptr [rbp + 0x390]
1401c1b93: 0f118568010000 movups xmmword ptr [rbp + 0x168], xmm0
1401c1b9a: 0f118d78010000 movups xmmword ptr [rbp + 0x178], xmm1
1401c1ba1: 0f119588010000 movups xmmword ptr [rbp + 0x188], xmm2
1401c1ba8: 0f119d98010000 movups xmmword ptr [rbp + 0x198], xmm3
1401c1baf: 0f2885a0030000 movaps xmm0, xmmword ptr [rbp + 0x3a0]
1401c1bb6: 0f1185a8010000 movups xmmword ptr [rbp + 0x1a8], xmm0
1401c1bbd: 0f1085b0030000 movups xmm0, xmmword ptr [rbp + 0x3b0]
1401c1bc4: 0f118550010000 movups xmmword ptr [rbp + 0x150], xmm0
1401c1bcb: 488b85c0030000 mov rax, qword ptr [rbp + 0x3c0]
1401c1bd2: 48898560010000 mov qword ptr [rbp + 0x160], rax
1401c1bd9: c785b8010000a0860100 mov dword ptr [rbp + 0x1b8], 0x186a0
1401c1be3: 66c785bc0100000000 mov word ptr [rbp + 0x1bc], 0
1401c1bec: 4c8d0d6d09c305 lea r9, [rip + 0x5c3096d]
1401c1bf3: 488d8dc0010000 lea rcx, [rbp + 0x1c0]
1401c1bfa: 4889f2 mov rdx, rsi
1401c1bfd: 4989f8 mov r8, rdi
1401c1c00: e8db360800 call 0x1402452e0
1401c1c05: 90 nop
1401c1c06: 4881c450040000 add rsp, 0x450
1401c1c0d: 5f pop rdi
1401c1c0e: 5e pop rsi
1401c1c0f: 5d pop rbp
1401c1c10: c3 ret
