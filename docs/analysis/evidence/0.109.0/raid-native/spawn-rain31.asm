14595b1dd: 8b5908 mov ebx, dword ptr [rcx + 8]
14595b1e0: 448b710c mov r14d, dword ptr [rcx + 0xc]
14595b1e4: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
14595b1e9: f30f107114 movss xmm6, dword ptr [rcx + 0x14]
14595b1ee: f30f105918 movss xmm3, dword ptr [rcx + 0x18]
14595b1f3: f3440f10691c movss xmm13, dword ptr [rcx + 0x1c]
14595b1f9: 488b01 mov rax, qword ptr [rcx]
14595b1fc: 48898550010000 mov qword ptr [rbp + 0x150], rax
14595b203: 4889f1 mov rcx, rsi
14595b206: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595b20d: 4189d8 mov r8d, ebx
14595b210: f30f119de0000000 movss dword ptr [rbp + 0xe0], xmm3
14595b218: e8d3c5ffff call 0x1459577f0
14595b21d: 4585f6 test r14d, r14d
14595b220: 0f8452c7ffff je 0x145957978
14595b226: 488d8ea0090000 lea rcx, [rsi + 0x9a0]
14595b22d: 450f57e4 xorps xmm12, xmm12
14595b231: f3440f100d061f4700 movss xmm9, dword ptr [rip + 0x471f06]
14595b23a: 0f57c9 xorps xmm1, xmm1
14595b23d: 410f28d1 movaps xmm2, xmm9
14595b241: e83a5ef9ff call 0x1458f1080
14595b246: 440f28d0 movaps xmm10, xmm0
14595b24a: 4c8bbe90020000 mov r15, qword ptr [rsi + 0x290]
14595b251: 4c8ba698020000 mov r12, qword ptr [rsi + 0x298]
14595b258: e8c0ee2900 call 0x145bfa11d
14595b25d: 440f28d8 movaps xmm11, xmm0
14595b261: 410f28c2 movaps xmm0, xmm10
14595b265: e8adee2900 call 0x145bfa117
14595b26a: 440f28d0 movaps xmm10, xmm0
14595b26e: 4c89f9 mov rcx, r15
14595b271: 4c89e2 mov rdx, r12
14595b274: e8571ef3ff call 0x14588d0d0
14595b279: 4869f8f0000000 imul rdi, rax, 0xf0
14595b280: 4c8d2509312801 lea r12, [rip + 0x1283109]
14595b287: 450f14da unpcklps xmm11, xmm10
14595b28b: 450f57d2 xorps xmm10, xmm10
14595b28f: 450f59d3 mulps xmm10, xmm11
14595b293: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
14595b29b: f2460f108427c8000000 movsd xmm8, qword ptr [rdi + r12 + 0xc8]
14595b2a5: 450f28da movaps xmm11, xmm10
14595b2a9: 450f5cd8 subps xmm11, xmm8
14595b2ad: f3410f16cb movshdup xmm1, xmm11
14595b2b2: 410f28c3 movaps xmm0, xmm11
14595b2b6: e874ee2900 call 0x145bfa12f
14595b2bb: f30f100d59724800 movss xmm1, dword ptr [rip + 0x487259]
14595b2c3: 0f2ec8 ucomiss xmm1, xmm0
14595b2c6: 772f ja 0x14595b2f7
14595b2c8: f3420f108c27d8000000 movss xmm1, dword ptr [rdi + r12 + 0xd8]
14595b2d2: f30f580d66498a00 addss xmm1, dword ptr [rip + 0x8a4966]
14595b2da: 0f2ec8 ucomiss xmm1, xmm0
14595b2dd: 7318 jae 0x14595b2f7
14595b2df: f30f12c0 movsldup xmm0, xmm0
14595b2e3: 440f5ed8 divps xmm11, xmm0
14595b2e7: f30f12c1 movsldup xmm0, xmm1
14595b2eb: 410f59c3 mulps xmm0, xmm11
14595b2ef: 440f58c0 addps xmm8, xmm0
14595b2f3: 450f28d0 movaps xmm10, xmm8
14595b2f7: f3450f59f5 mulss xmm14, xmm13
14595b2fc: f3440f58a5e0000000 addss xmm12, dword ptr [rbp + 0xe0]
14595b305: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
14595b30b: ffc7 inc edi
14595b30d: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
14595b313: f3440f1086340a0000 movss xmm8, dword ptr [rsi + 0xa34]
14595b31c: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
14595b323: 4883c110 add rcx, 0x10
14595b327: f3410f16d2 movshdup xmm2, xmm10
14595b32c: 410f28ca movaps xmm1, xmm10
14595b330: e84b8af7ff call 0x1458d3d80
14595b335: 440f28d8 movaps xmm11, xmm0
14595b339: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
14595b340: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595b347: 750c jne 0x14595b355
14595b349: 488d8e88050000 lea rcx, [rsi + 0x588]
14595b350: e8dbf92900 call 0x145bfad30
14595b355: f3450f58e0 addss xmm12, xmm8
14595b35a: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595b361: 4c89f8 mov rax, r15
14595b364: 48c1e007 shl rax, 7
14595b368: 48c7040100000000 mov qword ptr [rcx + rax], 0
14595b370: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
14595b378: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595b37f: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
14595b384: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
14595b38d: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
14595b395: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
14595b39b: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
14595b39f: 440f13540140 movlps qword ptr [rcx + rax + 0x40], xmm10
14595b3a5: f3440f115c0148 movss dword ptr [rcx + rax + 0x48], xmm11
14595b3ac: 0f57c0 xorps xmm0, xmm0
14595b3af: 0f57c9 xorps xmm1, xmm1
14595b3b2: f3410f10c8 movss xmm1, xmm8
14595b3b7: 0f57d2 xorps xmm2, xmm2
14595b3ba: f3410f10d4 movss xmm2, xmm12
14595b3bf: 0fc6ca41 shufps xmm1, xmm2, 0x41
14595b3c3: 0f114c014c movups xmmword ptr [rcx + rax + 0x4c], xmm1
14595b3c8: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
14595b3cc: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
14595b3d5: f3440f11740160 movss dword ptr [rcx + rax + 0x60], xmm14
14595b3dc: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
14595b3e4: 49ffc7 inc r15
14595b3e7: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
14595b3ec: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
14595b3f5: 4c89be98050000 mov qword ptr [rsi + 0x598], r15
14595b3fc: 0f8459170000 je 0x14595cb5b
14595b402: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595b409: 48c7040101000000 mov qword ptr [rcx + rax], 1
14595b411: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
14595b418: 4889540108 mov qword ptr [rcx + rax + 8], rdx
14595b41d: 4183fe01 cmp r14d, 1
14595b421: 0f8451c5ffff je 0x145957978
14595b427: f30f1005711e4400 movss xmm0, dword ptr [rip + 0x441e71]
14595b42f: f30f58c7 addss xmm0, xmm7
14595b433: 0f28ce movaps xmm1, xmm6
14595b436: f30f5fc8 maxss xmm1, xmm0
14595b43a: 440f28d1 movaps xmm10, xmm1
14595b43e: f3440fc2d103 cmpunordss xmm10, xmm1
14595b444: 410f28c2 movaps xmm0, xmm10
14595b448: 0f55c1 andnps xmm0, xmm1
14595b44b: 440f54d6 andps xmm10, xmm6
14595b44f: f30f10b5e0000000 movss xmm6, dword ptr [rbp + 0xe0]
14595b457: f30f5f35211a4700 maxss xmm6, dword ptr [rip + 0x471a21]
14595b45f: 440f56d0 orps xmm10, xmm0
14595b463: 41bf01000000 mov r15d, 1
14595b469: f3440f1035521c4700 movss xmm14, dword ptr [rip + 0x471c52]
14595b472: 488b96a0090000 mov rdx, qword ptr [rsi + 0x9a0]
14595b479: 488b86a8090000 mov rax, qword ptr [rsi + 0x9a8]
14595b480: 4c8b86b8090000 mov r8, qword ptr [rsi + 0x9b8]
14595b487: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
14595b48e: 6690 nop
14595b490: 4e8d0c02 lea r9, [rdx + r8]
14595b494: 49c1c117 rol r9, 0x17
14595b498: 4901d1 add r9, rdx
14595b49b: 4989c2 mov r10, rax
14595b49e: 49c1e211 shl r10, 0x11
14595b4a2: 4831d1 xor rcx, rdx
14595b4a5: 4931c0 xor r8, rax
14595b4a8: 4831c8 xor rax, rcx
14595b4ab: 4c31c2 xor rdx, r8
14595b4ae: 49c1c02d rol r8, 0x2d
14595b4b2: 4c31d1 xor rcx, r10
14595b4b5: 49c1e929 shr r9, 0x29
14595b4b9: 4181c90000803f or r9d, 0x3f800000
14595b4c0: 66450f6ed9 movd xmm11, r9d
14595b4c5: f3450f58de addss xmm11, xmm14
14595b4ca: f3450f59d9 mulss xmm11, xmm9
14595b4cf: 450f2ecb ucomiss xmm9, xmm11
14595b4d3: 76bb jbe 0x14595b490
14595b4d5: 0f57c0 xorps xmm0, xmm0
14595b4d8: f3440f58d8 addss xmm11, xmm0
14595b4dd: 488996a0090000 mov qword ptr [rsi + 0x9a0], rdx
14595b4e4: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
14595b4eb: 488986a8090000 mov qword ptr [rsi + 0x9a8], rax
14595b4f2: 48898eb0090000 mov qword ptr [rsi + 0x9b0], rcx
14595b4f9: 488d8ea0090000 lea rcx, [rsi + 0x9a0]
14595b500: 0f28cf movaps xmm1, xmm7
14595b503: 410f28d2 movaps xmm2, xmm10
14595b507: e8745bf9ff call 0x1458f1080
14595b50c: 440f28e0 movaps xmm12, xmm0
14595b510: 410f28c3 movaps xmm0, xmm11
14595b514: e804ec2900 call 0x145bfa11d
14595b519: 440f28e8 movaps xmm13, xmm0
14595b51d: 410f28c3 movaps xmm0, xmm11
14595b521: e8f1eb2900 call 0x145bfa117
14595b526: 440f28d8 movaps xmm11, xmm0
14595b52a: 488b8e90020000 mov rcx, qword ptr [rsi + 0x290]
14595b531: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
14595b538: e8931bf3ff call 0x14588d0d0
14595b53d: 4869f8f0000000 imul rdi, rax, 0xf0
14595b544: 450f14eb unpcklps xmm13, xmm11
14595b548: f3450f12dc movsldup xmm11, xmm12
14595b54d: 450f59dd mulps xmm11, xmm13
14595b551: 440f589dd0000000 addps xmm11, xmmword ptr [rbp + 0xd0]
14595b559: f2460f108427c8000000 movsd xmm8, qword ptr [rdi + r12 + 0xc8]
14595b563: 450f28e3 movaps xmm12, xmm11
14595b567: 450f5ce0 subps xmm12, xmm8
14595b56b: f3410f16cc movshdup xmm1, xmm12
14595b570: 410f28c4 movaps xmm0, xmm12
14595b574: e8b6eb2900 call 0x145bfa12f
14595b579: f3420f108c27d8000000 movss xmm1, dword ptr [rdi + r12 + 0xd8]
14595b583: f30f580db5468a00 addss xmm1, dword ptr [rip + 0x8a46b5]
14595b58b: f30f1015896f4800 movss xmm2, dword ptr [rip + 0x486f89]
14595b593: 0f2ed0 ucomiss xmm2, xmm0
14595b596: 771d ja 0x14595b5b5
14595b598: 0f2ec8 ucomiss xmm1, xmm0
14595b59b: 7318 jae 0x14595b5b5
14595b59d: f30f12c0 movsldup xmm0, xmm0
14595b5a1: 440f5ee0 divps xmm12, xmm0
14595b5a5: f30f12c1 movsldup xmm0, xmm1
14595b5a9: 410f59c4 mulps xmm0, xmm12
14595b5ad: 440f58c0 addps xmm8, xmm0
14595b5b1: 450f28d8 movaps xmm11, xmm8
14595b5b5: 4489f8 mov eax, r15d
14595b5b8: f34c0f2af8 cvtsi2ss xmm15, rax
14595b5bd: f3440f593df21a4700 mulss xmm15, dword ptr [rip + 0x471af2]
14595b5c6: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
14595b5cc: ffc7 inc edi
14595b5ce: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
14595b5d4: f3440f1086340a0000 movss xmm8, dword ptr [rsi + 0xa34]
14595b5dd: 4c8bae98090000 mov r13, qword ptr [rsi + 0x998]
14595b5e4: 498d4d10 lea rcx, [r13 + 0x10]
14595b5e8: f3450f16eb movshdup xmm13, xmm11
14595b5ed: 410f28cb movaps xmm1, xmm11
14595b5f1: 410f28d5 movaps xmm2, xmm13
14595b5f5: e896b9f7ff call 0x1458d6f90
14595b5fa: a801 test al, 1
14595b5fc: 7406 je 0x14595b604
14595b5fe: 440f28e0 movaps xmm12, xmm0
14595b602: eb3c jmp 0x14595b640
14595b604: 49837d68ff cmp qword ptr [r13 + 0x68], -1
14595b609: 742c je 0x14595b637
14595b60b: 498d5568 lea rdx, [r13 + 0x68]
14595b60f: 488d8d10010000 lea rcx, [rbp + 0x110]
14595b616: 410f28d3 movaps xmm2, xmm11
14595b61a: 410f28dd movaps xmm3, xmm13
14595b61e: e85d0bf8ff call 0x1458dc180
14595b623: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
14595b62a: 750b jne 0x14595b637
14595b62c: f3440f10a51c010000 movss xmm12, dword ptr [rbp + 0x11c]
14595b635: eb09 jmp 0x14595b640
14595b637: f3450f10a5b8000000 movss xmm12, dword ptr [r13 + 0xb8]
14595b640: 4c8bae98050000 mov r13, qword ptr [rsi + 0x598]
14595b647: 4c3bae88050000 cmp r13, qword ptr [rsi + 0x588]
14595b64e: 750c jne 0x14595b65c
14595b650: 488d8e88050000 lea rcx, [rsi + 0x588]
14595b657: e8d4f62900 call 0x145bfad30
14595b65c: f3440f58bde0000000 addss xmm15, dword ptr [rbp + 0xe0]
14595b665: f3450f58f8 addss xmm15, xmm8
14595b66a: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595b671: 4c89e8 mov rax, r13
14595b674: 48c1e007 shl rax, 7
14595b678: 48c7040100000000 mov qword ptr [rcx + rax], 0
14595b680: c744011000000000 mov dword ptr [rcx + rax + 0x10], 0
14595b688: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595b68f: 4889540120 mov qword ptr [rcx + rax + 0x20], rdx
14595b694: 48c744012800000000 mov qword ptr [rcx + rax + 0x28], 0
14595b69d: c744013000000000 mov dword ptr [rcx + rax + 0x30], 0
14595b6a5: f30f117c0134 movss dword ptr [rcx + rax + 0x34], xmm7
14595b6ab: 897c013c mov dword ptr [rcx + rax + 0x3c], edi
14595b6af: 440f135c0140 movlps qword ptr [rcx + rax + 0x40], xmm11
14595b6b5: f3440f11640148 movss dword ptr [rcx + rax + 0x48], xmm12
14595b6bc: 0f57c0 xorps xmm0, xmm0
14595b6bf: f3410f10c0 movss xmm0, xmm8
14595b6c4: 0f57c9 xorps xmm1, xmm1
14595b6c7: f3410f10cf movss xmm1, xmm15
14595b6cc: 0fc6c141 shufps xmm0, xmm1, 0x41
14595b6d0: 0f1144014c movups xmmword ptr [rcx + rax + 0x4c], xmm0
14595b6d5: 895c015c mov dword ptr [rcx + rax + 0x5c], ebx
14595b6d9: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
14595b6e1: f30f11440160 movss dword ptr [rcx + rax + 0x60], xmm0
14595b6e7: c74401640000807f mov dword ptr [rcx + rax + 0x64], 0x7f800000
14595b6ef: 4c89ea mov rdx, r13
14595b6f2: 48ffc2 inc rdx
14595b6f5: 0f57c0 xorps xmm0, xmm0
14595b6f8: 0f11440168 movups xmmword ptr [rcx + rax + 0x68], xmm0
14595b6fd: 48c744017700000000 mov qword ptr [rcx + rax + 0x77], 0
14595b706: 48899698050000 mov qword ptr [rsi + 0x598], rdx
14595b70d: 0f8448140000 je 0x14595cb5b
14595b713: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595b71a: 48c7040101000000 mov qword ptr [rcx + rax], 1
14595b722: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
14595b729: 4889540108 mov qword ptr [rcx + rax + 8], rdx
14595b72e: 488b9698050000 mov rdx, qword ptr [rsi + 0x598]
14595b735: 4939d5 cmp r13, rdx
14595b738: 0f834c140000 jae 0x14595cb8a
14595b73e: 41ffc7 inc r15d
14595b741: 488b8e90050000 mov rcx, qword ptr [rsi + 0x590]
14595b748: f30f11740164 movss dword ptr [rcx + rax + 0x64], xmm6
14595b74e: 4539f7 cmp r15d, r14d
14595b751: 0f851bfdffff jne 0x14595b472
14595b757: e91cc2ffff jmp 0x145957978
