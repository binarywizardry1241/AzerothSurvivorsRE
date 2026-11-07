0x145939bf0: 55 push rbp
0x145939bf1: 4157 push r15
0x145939bf3: 4156 push r14
0x145939bf5: 4154 push r12
0x145939bf7: 56 push rsi
0x145939bf8: 57 push rdi
0x145939bf9: 53 push rbx
0x145939bfa: 4881ec00010000 sub rsp, 0x100
0x145939c01: 488dac2480000000 lea rbp, [rsp + 0x80]
0x145939c09: 440f296d70 movaps xmmword ptr [rbp + 0x70], xmm13
0x145939c0e: 440f296560 movaps xmmword ptr [rbp + 0x60], xmm12
0x145939c13: 440f295d50 movaps xmmword ptr [rbp + 0x50], xmm11
0x145939c18: 440f295540 movaps xmmword ptr [rbp + 0x40], xmm10
0x145939c1d: 440f294d30 movaps xmmword ptr [rbp + 0x30], xmm9
0x145939c22: 440f294520 movaps xmmword ptr [rbp + 0x20], xmm8
0x145939c27: 0f297d10 movaps xmmword ptr [rbp + 0x10], xmm7
0x145939c2b: 0f297500 movaps xmmword ptr [rbp], xmm6
0x145939c2f: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145939c37: 4889d6 mov rsi, rdx
0x145939c3a: 488b91d8000000 mov rdx, qword ptr [rcx + 0xd8]
0x145939c41: 4839d6 cmp rsi, rdx
0x145939c44: 0f8381020000 jae 0x145939ecb
0x145939c4a: 0f28f3 movaps xmm6, xmm3
0x145939c4d: 0f28fa movaps xmm7, xmm2
0x145939c50: 4889cf mov rdi, rcx
0x145939c53: f3440f10994c0a0000 movss xmm11, dword ptr [rcx + 0xa4c]
0x145939c5c: 4c8bb9d0000000 mov r15, qword ptr [rcx + 0xd0]
0x145939c63: 4989f6 mov r14, rsi
0x145939c66: 49c1e607 shl r14, 7
0x145939c6a: 4c8ba1b0090000 mov r12, qword ptr [rcx + 0x9b0]
0x145939c71: 498d5c2410 lea rbx, [r12 + 0x10]
0x145939c76: f3430f104c375c movss xmm1, dword ptr [r15 + r14 + 0x5c]
0x145939c7d: 4d01f7 add r15, r14
0x145939c80: 0f57c0 xorps xmm0, xmm0
0x145939c83: 0f2ec1 ucomiss xmm0, xmm1
0x145939c86: 7357 jae 0x145939cdf
0x145939c88: 410f28d3 movaps xmm2, xmm11
0x145939c8c: f3410f5c5758 subss xmm2, dword ptr [r15 + 0x58]
0x145939c92: f30f5ed1 divss xmm2, xmm1
0x145939c96: f30f5fc2 maxss xmm0, xmm2
0x145939c9a: f30f100dbe354700 movss xmm1, dword ptr [rip + 0x4735be]
0x145939ca2: f30f5dc8 minss xmm1, xmm0
0x145939ca6: f2410f104740 movsd xmm0, qword ptr [r15 + 0x40]
0x145939cac: f2410f10574c movsd xmm2, qword ptr [r15 + 0x4c]
0x145939cb2: 0f5cd0 subps xmm2, xmm0
0x145939cb5: f3440f12c1 movsldup xmm8, xmm1
0x145939cba: 440f59c2 mulps xmm8, xmm2
0x145939cbe: 440f58c0 addps xmm8, xmm0
0x145939cc2: f3410f104748 movss xmm0, dword ptr [r15 + 0x48]
0x145939cc8: f3450f105754 movss xmm10, dword ptr [r15 + 0x54]
0x145939cce: f3440f5cd0 subss xmm10, xmm0
0x145939cd3: f3440f59d1 mulss xmm10, xmm1
0x145939cd8: f3440f58d0 addss xmm10, xmm0
0x145939cdd: eb0c jmp 0x145939ceb
0x145939cdf: f2450f10474c movsd xmm8, qword ptr [r15 + 0x4c]
0x145939ce5: f3450f105754 movss xmm10, dword ptr [r15 + 0x54]
0x145939ceb: f3410f16d0 movshdup xmm2, xmm8
0x145939cf0: 4889d9 mov rcx, rbx
0x145939cf3: 410f28c8 movaps xmm1, xmm8
0x145939cf7: e8446ef6ff call 0x1458a0b40
0x145939cfc: 440f28c8 movaps xmm9, xmm0
0x145939d00: a801 test al, 1
0x145939d02: 7504 jne 0x145939d08
0x145939d04: 450f28ca movaps xmm9, xmm10
0x145939d08: 0f28c7 movaps xmm0, xmm7
0x145939d0b: 0f14c6 unpcklps xmm0, xmm6
0x145939d0e: 410f28c8 movaps xmm1, xmm8
0x145939d12: 0f5cc8 subps xmm1, xmm0
0x145939d15: 0f59c9 mulps xmm1, xmm1
0x145939d18: f30f16c1 movshdup xmm0, xmm1
0x145939d1c: f30f58c1 addss xmm0, xmm1
0x145939d20: f3440f51e0 sqrtss xmm12, xmm0
0x145939d25: f30f1005e3ea4700 movss xmm0, dword ptr [rip + 0x47eae3]
0x145939d2d: 410f2ec4 ucomiss xmm0, xmm12
0x145939d31: 0f875c010000 ja 0x145939e93
0x145939d37: f3440f10ade0000000 movss xmm13, dword ptr [rbp + 0xe0]
0x145939d40: 4889d9 mov rcx, rbx
0x145939d43: 0f28cf movaps xmm1, xmm7
0x145939d46: 0f28d6 movaps xmm2, xmm6
0x145939d49: e8f26df6ff call 0x1458a0b40
0x145939d4e: a801 test al, 1
0x145939d50: 7406 je 0x145939d58
0x145939d52: 440f28d0 movaps xmm10, xmm0
0x145939d56: eb34 jmp 0x145939d8c
0x145939d58: 49837c2468ff cmp qword ptr [r12 + 0x68], -1
0x145939d5e: 7422 je 0x145939d82
0x145939d60: 498d542468 lea rdx, [r12 + 0x68]
0x145939d65: 488d4dc8 lea rcx, [rbp - 0x38]
0x145939d69: 0f28d7 movaps xmm2, xmm7
0x145939d6c: 0f28de movaps xmm3, xmm6
0x145939d6f: e8ecaff6ff call 0x1458a4d60
0x145939d74: 837dc801 cmp dword ptr [rbp - 0x38], 1
0x145939d78: 7508 jne 0x145939d82
0x145939d7a: f3440f1055d4 movss xmm10, dword ptr [rbp - 0x2c]
0x145939d80: eb0a jmp 0x145939d8c
0x145939d82: f3450f109424b8000000 movss xmm10, dword ptr [r12 + 0xb8]
0x145939d8c: f3450f5ee5 divss xmm12, xmm13
0x145939d91: 498b5720 mov rdx, qword ptr [r15 + 0x20]
0x145939d95: 8b877c0a0000 mov eax, dword ptr [rdi + 0xa7c]
0x145939d9b: ffc0 inc eax
0x145939d9d: 89877c0a0000 mov dword ptr [rdi + 0xa7c], eax
0x145939da3: f30f1005d5ea4700 movss xmm0, dword ptr [rip + 0x47ead5]
0x145939dab: f3410f59c4 mulss xmm0, xmm12
0x145939db0: f3480f2cc8 cvttss2si rcx, xmm0
0x145939db5: 4531c0 xor r8d, r8d
0x145939db8: 0f57c9 xorps xmm1, xmm1
0x145939dbb: 0f2ec1 ucomiss xmm0, xmm1
0x145939dbe: 440f43c1 cmovae r8d, ecx
0x145939dc2: 0f2e057bcd4700 ucomiss xmm0, dword ptr [rip + 0x47cd7b]
0x145939dc9: b9ffffffff mov ecx, 0xffffffff
0x145939dce: 410f46c8 cmovbe ecx, r8d
0x145939dd2: 440f1345b8 movlps qword ptr [rbp - 0x48], xmm8
0x145939dd7: f3440f114dc0 movss dword ptr [rbp - 0x40], xmm9
0x145939ddd: f30f117dec movss dword ptr [rbp - 0x14], xmm7
0x145939de2: f30f1175f0 movss dword ptr [rbp - 0x10], xmm6
0x145939de7: f3440f1155f4 movss dword ptr [rbp - 0xc], xmm10
0x145939ded: 894c2428 mov dword ptr [rsp + 0x28], ecx
0x145939df1: 89442420 mov dword ptr [rsp + 0x20], eax
0x145939df5: 488d4dc8 lea rcx, [rbp - 0x38]
0x145939df9: 4c8d45b8 lea r8, [rbp - 0x48]
0x145939dfd: 4c8d4dec lea r9, [rbp - 0x14]
0x145939e01: e8ea9df8ff call 0x1458c3bf0
0x145939e06: 488b9f30060000 mov rbx, qword ptr [rdi + 0x630]
0x145939e0d: 483b9f20060000 cmp rbx, qword ptr [rdi + 0x620]
0x145939e14: 750d jne 0x145939e23
0x145939e16: 488d8f20060000 lea rcx, [rdi + 0x620]
0x145939e1d: e8ae3d2d00 call 0x145c0dbd0
0x145939e22: 90 nop
0x145939e23: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
0x145939e2a: 4889d9 mov rcx, rbx
0x145939e2d: 48c1e105 shl rcx, 5
0x145939e31: 0f1045c8 movups xmm0, xmmword ptr [rbp - 0x38]
0x145939e35: 0f104dd8 movups xmm1, xmmword ptr [rbp - 0x28]
0x145939e39: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145939e3e: 0f110408 movups xmmword ptr [rax + rcx], xmm0
0x145939e42: 48ffc3 inc rbx
0x145939e45: 48899f30060000 mov qword ptr [rdi + 0x630], rbx
0x145939e4c: 488b97d8000000 mov rdx, qword ptr [rdi + 0xd8]
0x145939e53: 4839d6 cmp rsi, rdx
0x145939e56: 0f8380000000 jae 0x145939edc
0x145939e5c: 488b87d0000000 mov rax, qword ptr [rdi + 0xd0]
0x145939e63: 460f13443040 movlps qword ptr [rax + r14 + 0x40], xmm8
0x145939e69: f3460f114c3048 movss dword ptr [rax + r14 + 0x48], xmm9
0x145939e70: f3420f117c304c movss dword ptr [rax + r14 + 0x4c], xmm7
0x145939e77: f3420f11743050 movss dword ptr [rax + r14 + 0x50], xmm6
0x145939e7e: f3460f11543054 movss dword ptr [rax + r14 + 0x54], xmm10
0x145939e85: f3460f115c3058 movss dword ptr [rax + r14 + 0x58], xmm11
0x145939e8c: f3460f1164305c movss dword ptr [rax + r14 + 0x5c], xmm12
0x145939e93: 0f287500 movaps xmm6, xmmword ptr [rbp]
0x145939e97: 0f287d10 movaps xmm7, xmmword ptr [rbp + 0x10]
0x145939e9b: 440f284520 movaps xmm8, xmmword ptr [rbp + 0x20]
0x145939ea0: 440f284d30 movaps xmm9, xmmword ptr [rbp + 0x30]
0x145939ea5: 440f285540 movaps xmm10, xmmword ptr [rbp + 0x40]
0x145939eaa: 440f285d50 movaps xmm11, xmmword ptr [rbp + 0x50]
0x145939eaf: 440f286560 movaps xmm12, xmmword ptr [rbp + 0x60]
0x145939eb4: 440f286d70 movaps xmm13, xmmword ptr [rbp + 0x70]
0x145939eb9: 4881c400010000 add rsp, 0x100
0x145939ec0: 5b pop rbx
0x145939ec1: 5f pop rdi
0x145939ec2: 5e pop rsi
0x145939ec3: 415c pop r12
0x145939ec5: 415e pop r14
0x145939ec7: 415f pop r15
0x145939ec9: 5d pop rbp
0x145939eca: c3 ret
0x145939ecb: 4c8d050e072d01 lea r8, [rip + 0x12d070e]
0x145939ed2: 4889f1 mov rcx, rsi
0x145939ed5: e8a9f94600 call 0x145da9883
0x145939eda: 0f0b ud2
0x145939edc: 4c8d0515072d01 lea r8, [rip + 0x12d0715]
0x145939ee3: 4889f1 mov rcx, rsi
0x145939ee6: e898f94600 call 0x145da9883
0x145939eeb: 0f0b ud2
