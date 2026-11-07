1459348e0: 55 push rbp
1459348e1: 4157 push r15
1459348e3: 4156 push r14
1459348e5: 4154 push r12
1459348e7: 56 push rsi
1459348e8: 57 push rdi
1459348e9: 53 push rbx
1459348ea: 4881ec00010000 sub rsp, 0x100
1459348f1: 488dac2480000000 lea rbp, [rsp + 0x80]
1459348f9: 440f296d70 movaps xmmword ptr [rbp + 0x70], xmm13
1459348fe: 440f296560 movaps xmmword ptr [rbp + 0x60], xmm12
145934903: 440f295d50 movaps xmmword ptr [rbp + 0x50], xmm11
145934908: 440f295540 movaps xmmword ptr [rbp + 0x40], xmm10
14593490d: 440f294d30 movaps xmmword ptr [rbp + 0x30], xmm9
145934912: 440f294520 movaps xmmword ptr [rbp + 0x20], xmm8
145934917: 0f297d10 movaps xmmword ptr [rbp + 0x10], xmm7
14593491b: 0f297500 movaps xmmword ptr [rbp], xmm6
14593491f: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
145934927: 4889d6 mov rsi, rdx
14593492a: 488b91d8000000 mov rdx, qword ptr [rcx + 0xd8]
145934931: 4839d6 cmp rsi, rdx
145934934: 0f8381020000 jae 0x145934bbb
14593493a: 0f28f3 movaps xmm6, xmm3
14593493d: 0f28fa movaps xmm7, xmm2
145934940: 4889cf mov rdi, rcx
145934943: f3440f1099540a0000 movss xmm11, dword ptr [rcx + 0xa54]
14593494c: 4c8bb9d0000000 mov r15, qword ptr [rcx + 0xd0]
145934953: 4989f6 mov r14, rsi
145934956: 49c1e607 shl r14, 7
14593495a: 4c8ba1b8090000 mov r12, qword ptr [rcx + 0x9b8]
145934961: 498d5c2410 lea rbx, [r12 + 0x10]
145934966: f3430f104c375c movss xmm1, dword ptr [r15 + r14 + 0x5c]
14593496d: 4d01f7 add r15, r14
145934970: 0f57c0 xorps xmm0, xmm0
145934973: 0f2ec1 ucomiss xmm0, xmm1
145934976: 7357 jae 0x1459349cf
145934978: 410f28d3 movaps xmm2, xmm11
14593497c: f3410f5c5758 subss xmm2, dword ptr [r15 + 0x58]
145934982: f30f5ed1 divss xmm2, xmm1
145934986: f30f5fc2 maxss xmm0, xmm2
14593498a: f30f100dde384700 movss xmm1, dword ptr [rip + 0x4738de]
145934992: f30f5dc8 minss xmm1, xmm0
145934996: f2410f104740 movsd xmm0, qword ptr [r15 + 0x40]
14593499c: f2410f10574c movsd xmm2, qword ptr [r15 + 0x4c]
1459349a2: 0f5cd0 subps xmm2, xmm0
1459349a5: f3440f12c1 movsldup xmm8, xmm1
1459349aa: 440f59c2 mulps xmm8, xmm2
1459349ae: 440f58c0 addps xmm8, xmm0
1459349b2: f3410f104748 movss xmm0, dword ptr [r15 + 0x48]
1459349b8: f3450f105754 movss xmm10, dword ptr [r15 + 0x54]
1459349be: f3440f5cd0 subss xmm10, xmm0
1459349c3: f3440f59d1 mulss xmm10, xmm1
1459349c8: f3440f58d0 addss xmm10, xmm0
1459349cd: eb0c jmp 0x1459349db
1459349cf: f2450f10474c movsd xmm8, qword ptr [r15 + 0x4c]
1459349d5: f3450f105754 movss xmm10, dword ptr [r15 + 0x54]
1459349db: f3410f16d0 movshdup xmm2, xmm8
1459349e0: 4889d9 mov rcx, rbx
1459349e3: 410f28c8 movaps xmm1, xmm8
1459349e7: e85475f6ff call 0x14589bf40
1459349ec: 440f28c8 movaps xmm9, xmm0
1459349f0: a801 test al, 1
1459349f2: 7504 jne 0x1459349f8
1459349f4: 450f28ca movaps xmm9, xmm10
1459349f8: 0f28c7 movaps xmm0, xmm7
1459349fb: 0f14c6 unpcklps xmm0, xmm6
1459349fe: 410f28c8 movaps xmm1, xmm8
145934a02: 0f5cc8 subps xmm1, xmm0
145934a05: 0f59c9 mulps xmm1, xmm1
145934a08: f30f16c1 movshdup xmm0, xmm1
145934a0c: f30f58c1 addss xmm0, xmm1
145934a10: f3440f51e0 sqrtss xmm12, xmm0
145934a15: f30f1005b3ee4700 movss xmm0, dword ptr [rip + 0x47eeb3]
145934a1d: 410f2ec4 ucomiss xmm0, xmm12
145934a21: 0f875c010000 ja 0x145934b83
145934a27: f3440f10ade0000000 movss xmm13, dword ptr [rbp + 0xe0]
145934a30: 4889d9 mov rcx, rbx
145934a33: 0f28cf movaps xmm1, xmm7
145934a36: 0f28d6 movaps xmm2, xmm6
145934a39: e80275f6ff call 0x14589bf40
145934a3e: a801 test al, 1
145934a40: 7406 je 0x145934a48
145934a42: 440f28d0 movaps xmm10, xmm0
145934a46: eb34 jmp 0x145934a7c
145934a48: 49837c2468ff cmp qword ptr [r12 + 0x68], -1
145934a4e: 7422 je 0x145934a72
145934a50: 498d542468 lea rdx, [r12 + 0x68]
145934a55: 488d4dc8 lea rcx, [rbp - 0x38]
145934a59: 0f28d7 movaps xmm2, xmm7
145934a5c: 0f28de movaps xmm3, xmm6
145934a5f: e8ecb9f6ff call 0x1458a0450
145934a64: 837dc801 cmp dword ptr [rbp - 0x38], 1
145934a68: 7508 jne 0x145934a72
145934a6a: f3440f1055d4 movss xmm10, dword ptr [rbp - 0x2c]
145934a70: eb0a jmp 0x145934a7c
145934a72: f3450f109424b8000000 movss xmm10, dword ptr [r12 + 0xb8]
145934a7c: f3450f5ee5 divss xmm12, xmm13
145934a81: 498b5720 mov rdx, qword ptr [r15 + 0x20]
145934a85: 8b87840a0000 mov eax, dword ptr [rdi + 0xa84]
145934a8b: ffc0 inc eax
145934a8d: 8987840a0000 mov dword ptr [rdi + 0xa84], eax
145934a93: f30f10057dee4700 movss xmm0, dword ptr [rip + 0x47ee7d]
145934a9b: f3410f59c4 mulss xmm0, xmm12
145934aa0: f3480f2cc8 cvttss2si rcx, xmm0
145934aa5: 4531c0 xor r8d, r8d
145934aa8: 0f57c9 xorps xmm1, xmm1
145934aab: 0f2ec1 ucomiss xmm0, xmm1
145934aae: 440f43c1 cmovae r8d, ecx
145934ab2: 0f2e05abd04700 ucomiss xmm0, dword ptr [rip + 0x47d0ab]
145934ab9: b9ffffffff mov ecx, 0xffffffff
145934abe: 410f46c8 cmovbe ecx, r8d
145934ac2: 440f1345b8 movlps qword ptr [rbp - 0x48], xmm8
145934ac7: f3440f114dc0 movss dword ptr [rbp - 0x40], xmm9
145934acd: f30f117dec movss dword ptr [rbp - 0x14], xmm7
145934ad2: f30f1175f0 movss dword ptr [rbp - 0x10], xmm6
145934ad7: f3440f1155f4 movss dword ptr [rbp - 0xc], xmm10
145934add: 894c2428 mov dword ptr [rsp + 0x28], ecx
145934ae1: 89442420 mov dword ptr [rsp + 0x20], eax
145934ae5: 488d4dc8 lea rcx, [rbp - 0x38]
145934ae9: 4c8d45b8 lea r8, [rbp - 0x48]
145934aed: 4c8d4dec lea r9, [rbp - 0x14]
145934af1: e88aa3f8ff call 0x1458bee80
145934af6: 488b9f38060000 mov rbx, qword ptr [rdi + 0x638]
145934afd: 483b9f28060000 cmp rbx, qword ptr [rdi + 0x628]
145934b04: 750d jne 0x145934b13
145934b06: 488d8f28060000 lea rcx, [rdi + 0x628]
145934b0d: e8be3b2d00 call 0x145c086d0
145934b12: 90 nop
145934b13: 488b8730060000 mov rax, qword ptr [rdi + 0x630]
145934b1a: 4889d9 mov rcx, rbx
145934b1d: 48c1e105 shl rcx, 5
145934b21: 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
145934b25: 0f104dd8 movups xmm1, xmmword ptr [rbp - 0x28]
145934b29: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145934b2e: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145934b32: 48ffc3 inc rbx
145934b35: 48899f38060000 mov qword ptr [rdi + 0x638], rbx
145934b3c: 488b97d8000000 mov rdx, qword ptr [rdi + 0xd8]
145934b43: 4839d6 cmp rsi, rdx
145934b46: 0f8380000000 jae 0x145934bcc
145934b4c: 488b87d0000000 mov rax, qword ptr [rdi + 0xd0]
145934b53: 460f13443040 movlps qword ptr [rax + r14 + 0x40], xmm8
145934b59: f3460f114c3048 movss dword ptr [rax + r14 + 0x48], xmm9
145934b60: f3420f117c304c movss dword ptr [rax + r14 + 0x4c], xmm7
145934b67: f3420f11743050 movss dword ptr [rax + r14 + 0x50], xmm6
145934b6e: f3460f11543054 movss dword ptr [rax + r14 + 0x54], xmm10
145934b75: f3460f115c3058 movss dword ptr [rax + r14 + 0x58], xmm11
145934b7c: f3460f1164305c movss dword ptr [rax + r14 + 0x5c], xmm12
145934b83: 0f287500 movaps xmm6, xmmword ptr [rbp]
145934b87: 0f287d10 movaps xmm7, xmmword ptr [rbp + 0x10]
145934b8b: 440f284520 movaps xmm8, xmmword ptr [rbp + 0x20]
145934b90: 440f284d30 movaps xmm9, xmmword ptr [rbp + 0x30]
145934b95: 440f285540 movaps xmm10, xmmword ptr [rbp + 0x40]
145934b9a: 440f285d50 movaps xmm11, xmmword ptr [rbp + 0x50]
145934b9f: 440f286560 movaps xmm12, xmmword ptr [rbp + 0x60]
145934ba4: 440f286d70 movaps xmm13, xmmword ptr [rbp + 0x70]
145934ba9: 4881c400010000 add rsp, 0x100
145934bb0: 5b pop rbx
145934bb1: 5f pop rdi
145934bb2: 5e pop rsi
145934bb3: 415c pop r12
145934bb5: 415e pop r14
145934bb7: 415f pop r15
145934bb9: 5d pop rbp
145934bba: c3 ret
145934bbb: 4c8d05a60b2d01 lea r8, [rip + 0x12d0ba6]
145934bc2: 4889f1 mov rcx, rsi
145934bc5: e879fa4600 call 0x145da4643
145934bca: 0f0b ud2
145934bcc: 4c8d05ad0b2d01 lea r8, [rip + 0x12d0bad]
145934bd3: 4889f1 mov rcx, rsi
145934bd6: e868fa4600 call 0x145da4643
145934bdb: 0f0b ud2
