1459588ca: 48899d90000000 mov qword ptr [rbp + 0x90], rbx
1459588d1: 448b01 mov r8d, dword ptr [rcx]
1459588d4: 448b7104 mov r14d, dword ptr [rcx + 4]
1459588d8: f30f104108 movss xmm0, dword ptr [rcx + 8]
1459588dd: f30f118550010000 movss dword ptr [rbp + 0x150], xmm0
1459588e5: f30f10710c movss xmm6, dword ptr [rcx + 0xc]
1459588ea: f30f107910 movss xmm7, dword ptr [rcx + 0x10]
1459588ef: f3440f597114 mulss xmm14, dword ptr [rcx + 0x14]
1459588f5: f3440f11b578010000 movss dword ptr [rbp + 0x178], xmm14
1459588fe: 4889f1 mov rcx, rsi
145958901: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
145958908: 448985e0000000 mov dword ptr [rbp + 0xe0], r8d
14595890f: 0f28df movaps xmm3, xmm7
145958912: e8d9eeffff call 0x1459577f0
145958917: 448bae3c0a0000 mov r13d, dword ptr [rsi + 0xa3c]
14595891e: 41ffc5 inc r13d
145958921: 4489ae3c0a0000 mov dword ptr [rsi + 0xa3c], r13d
145958928: 488d8ea0090000 lea rcx, [rsi + 0x9a0]
14595892f: f30f101509484700 movss xmm2, dword ptr [rip + 0x474809]
145958937: 0f57c9 xorps xmm1, xmm1
14595893a: e84187f9ff call 0x1458f1080
14595893f: 4183fe01 cmp r14d, 1
145958943: 4183d600 adc r14d, 0
145958947: 0f57c9 xorps xmm1, xmm1
14595894a: f3490f2ace cvtsi2ss xmm1, r14
14595894f: f30f118db8000000 movss dword ptr [rbp + 0xb8], xmm1
145958957: f30f11850c010000 movss dword ptr [rbp + 0x10c], xmm0
14595895f: 4531e4 xor r12d, r12d
145958962: f3440f100559474700 movss xmm8, dword ptr [rip + 0x474759]
14595896b: f3440f10357c984800 movss xmm14, dword ptr [rip + 0x48987c]
145958974: f3440f103db3f04800 movss xmm15, dword ptr [rip + 0x48f0b3]
14595897d: f3440f100d1a494400 movss xmm9, dword ptr [rip + 0x44491a]
145958986: 488d1d035a2801 lea rbx, [rip + 0x1285a03]
14595898d: e9d2000000 jmp 0x145958a64
145958992: 488d8e88050000 lea rcx, [rsi + 0x588]
145958999: e892232a00 call 0x145bfad30
14595899e: 41ffc4 inc r12d
1459589a1: 0f28c7 movaps xmm0, xmm7
1459589a4: f3410f58c5 addss xmm0, xmm13
1459589a9: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
1459589b0: 4c89f9 mov rcx, r15
1459589b3: 48c1e107 shl rcx, 7
1459589b7: 48c7040800000000 mov qword ptr [rax + rcx], 0
1459589bf: c744081001000000 mov dword ptr [rax + rcx + 0x10], 1
1459589c7: 44896c0814 mov dword ptr [rax + rcx + 0x14], r13d
1459589cc: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
1459589d3: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
1459589d8: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
1459589e1: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
1459589e9: f30f108d50010000 movss xmm1, dword ptr [rbp + 0x150]
1459589f1: f30f114c0834 movss dword ptr [rax + rcx + 0x34], xmm1
1459589f7: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
1459589fb: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
145958a01: f3440f115c0848 movss dword ptr [rax + rcx + 0x48], xmm11
145958a08: 0f57c9 xorps xmm1, xmm1
145958a0b: f3410f10cd movss xmm1, xmm13
145958a10: 0f57d2 xorps xmm2, xmm2
145958a13: f30f10d0 movss xmm2, xmm0
145958a17: 0fc6ca41 shufps xmm1, xmm2, 0x41
145958a1b: 0f114c084c movups xmmword ptr [rax + rcx + 0x4c], xmm1
145958a20: 8b95e0000000 mov edx, dword ptr [rbp + 0xe0]
145958a26: 8954085c mov dword ptr [rax + rcx + 0x5c], edx
145958a2a: f30f108578010000 movss xmm0, dword ptr [rbp + 0x178]
145958a32: f30f11440860 movss dword ptr [rax + rcx + 0x60], xmm0
145958a38: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
145958a40: 49ffc7 inc r15
145958a43: 0f57c0 xorps xmm0, xmm0
145958a46: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
145958a4b: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
145958a54: 4c89be98050000 mov qword ptr [rsi + 0x598], r15
145958a5b: 4539f4 cmp r12d, r14d
145958a5e: 0f8433020000 je 0x145958c97
145958a64: 0f57c0 xorps xmm0, xmm0
145958a67: 0f2ec6 ucomiss xmm0, xmm6
145958a6a: 440f2895d0000000 movaps xmm10, xmmword ptr [rbp + 0xd0]
145958a72: 0f835e010000 jae 0x145958bd6
145958a78: 488b96a0090000 mov rdx, qword ptr [rsi + 0x9a0]
145958a7f: 488b86a8090000 mov rax, qword ptr [rsi + 0x9a8]
145958a86: 4c8b86b8090000 mov r8, qword ptr [rsi + 0x9b8]
145958a8d: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
145958a94: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145958aa0: 4e8d0c02 lea r9, [rdx + r8]
145958aa4: 49c1c117 rol r9, 0x17
145958aa8: 4901d1 add r9, rdx
145958aab: 4989c2 mov r10, rax
145958aae: 49c1e211 shl r10, 0x11
145958ab2: 4831d1 xor rcx, rdx
145958ab5: 4931c0 xor r8, rax
145958ab8: 4831c8 xor rax, rcx
145958abb: 4c31c2 xor rdx, r8
145958abe: 4c31d1 xor rcx, r10
145958ac1: 49c1c02d rol r8, 0x2d
145958ac5: 49c1e929 shr r9, 0x29
145958ac9: 4181c90000803f or r9d, 0x3f800000
145958ad0: 66450f6ee1 movd xmm12, r9d
145958ad5: f3450f58e0 addss xmm12, xmm8
145958ada: f3450f59e6 mulss xmm12, xmm14
145958adf: f3450f58e7 addss xmm12, xmm15
145958ae4: 450f2ecc ucomiss xmm9, xmm12
145958ae8: 76b6 jbe 0x145958aa0
145958aea: 4589e1 mov r9d, r12d
145958aed: 450f57d2 xorps xmm10, xmm10
145958af1: f34d0f2ad1 cvtsi2ss xmm10, r9
145958af6: f3440f5e95b8000000 divss xmm10, dword ptr [rbp + 0xb8]
145958aff: f3440f591538464700 mulss xmm10, dword ptr [rip + 0x474638]
145958b08: f3440f58950c010000 addss xmm10, dword ptr [rbp + 0x10c]
145958b11: 488996a0090000 mov qword ptr [rsi + 0x9a0], rdx
145958b18: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
145958b1f: 488986a8090000 mov qword ptr [rsi + 0x9a8], rax
145958b26: 48898eb0090000 mov qword ptr [rsi + 0x9b0], rcx
145958b2d: f3440f59e6 mulss xmm12, xmm6
145958b32: 410f28c2 movaps xmm0, xmm10
145958b36: e8e2152a00 call 0x145bfa11d
145958b3b: 440f28d8 movaps xmm11, xmm0
145958b3f: 410f28c2 movaps xmm0, xmm10
145958b43: e8cf152a00 call 0x145bfa117
145958b48: 440f28d0 movaps xmm10, xmm0
145958b4c: 488b8e90020000 mov rcx, qword ptr [rsi + 0x290]
145958b53: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
145958b5a: e87145f3ff call 0x14588d0d0
145958b5f: 4869f8f0000000 imul rdi, rax, 0xf0
145958b66: 450f14da unpcklps xmm11, xmm10
145958b6a: f3450f12d4 movsldup xmm10, xmm12
145958b6f: 450f59d3 mulps xmm10, xmm11
145958b73: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
145958b7b: f2440f10a41fc8000000 movsd xmm12, qword ptr [rdi + rbx + 0xc8]
145958b85: 450f28da movaps xmm11, xmm10
145958b89: 450f5cdc subps xmm11, xmm12
145958b8d: f3410f16cb movshdup xmm1, xmm11
145958b92: 410f28c3 movaps xmm0, xmm11
145958b96: e894152a00 call 0x145bfa12f
145958b9b: f30f108c1fd8000000 movss xmm1, dword ptr [rdi + rbx + 0xd8]
145958ba4: f30f580d94708a00 addss xmm1, dword ptr [rip + 0x8a7094]
145958bac: f30f101568994800 movss xmm2, dword ptr [rip + 0x489968]
145958bb4: 0f2ed0 ucomiss xmm2, xmm0
145958bb7: 771d ja 0x145958bd6
145958bb9: 0f2ec8 ucomiss xmm1, xmm0
145958bbc: 7318 jae 0x145958bd6
145958bbe: f30f12c0 movsldup xmm0, xmm0
145958bc2: 440f5ed8 divps xmm11, xmm0
145958bc6: f30f12c1 movsldup xmm0, xmm1
145958bca: 410f59c3 mulps xmm0, xmm11
145958bce: 440f58e0 addps xmm12, xmm0
145958bd2: 450f28d4 movaps xmm10, xmm12
145958bd6: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
145958bdc: ffc7 inc edi
145958bde: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
145958be4: f3440f10ae340a0000 movss xmm13, dword ptr [rsi + 0xa34]
145958bed: 4c8bbe98090000 mov r15, qword ptr [rsi + 0x998]
145958bf4: 498d4f10 lea rcx, [r15 + 0x10]
145958bf8: f3450f16e2 movshdup xmm12, xmm10
145958bfd: 410f28ca movaps xmm1, xmm10
145958c01: 410f28d4 movaps xmm2, xmm12
145958c05: e886e3f7ff call 0x1458d6f90
145958c0a: a801 test al, 1
145958c0c: 741d je 0x145958c2b
145958c0e: 440f28d8 movaps xmm11, xmm0
145958c12: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
145958c19: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
145958c20: 0f8578fdffff jne 0x14595899e
145958c26: e967fdffff jmp 0x145958992
145958c2b: 49837f68ff cmp qword ptr [r15 + 0x68], -1
145958c30: 7443 je 0x145958c75
145958c32: 498d5768 lea rdx, [r15 + 0x68]
145958c36: 488d8d10010000 lea rcx, [rbp + 0x110]
145958c3d: 410f28d2 movaps xmm2, xmm10
145958c41: 410f28dc movaps xmm3, xmm12
145958c45: e83635f8ff call 0x1458dc180
145958c4a: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
145958c51: 7522 jne 0x145958c75
145958c53: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
145958c5c: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
145958c63: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
145958c6a: 0f852efdffff jne 0x14595899e
145958c70: e91dfdffff jmp 0x145958992
145958c75: f3450f109fb8000000 movss xmm11, dword ptr [r15 + 0xb8]
145958c7e: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
145958c85: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
145958c8c: 0f850cfdffff jne 0x14595899e
145958c92: e9fbfcffff jmp 0x145958992
145958c97: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
145958c9e: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
145958ca5: 4839d1 cmp rcx, rdx
145958ca8: 0f833f3f0000 jae 0x14595cbed
145958cae: 0f57c0 xorps xmm0, xmm0
145958cb1: 31c0 xor eax, eax
145958cb3: 0f2ec6 ucomiss xmm0, xmm6
145958cb6: 0f92c0 setb al
145958cb9: 488d0db01e8d01 lea rcx, [rip + 0x18d1eb0]
145958cc0: 488d3db81e8d01 lea rdi, [rip + 0x18d1eb8]
145958cc7: 480f42f9 cmovb rdi, rcx
145958ccb: 4c8d3440 lea r14, [rax + rax*2]
145958ccf: 4983c60c add r14, 0xc
145958cd3: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
145958cda: 48038e60050000 add rcx, qword ptr [rsi + 0x560]
145958ce1: 4881c618060000 add rsi, 0x618
145958ce8: e8b34cfbff call 0x14590d9a0
145958ced: 4889c3 mov rbx, rax
145958cf0: 4989d7 mov r15, rdx
145958cf3: 4889f9 mov rcx, rdi
145958cf6: 4c89f2 mov rdx, r14
145958cf9: e80238f9ff call 0x1458ec500
145958cfe: 4885c0 test rax, rax
145958d01: 480f45f8 cmovne rdi, rax
145958d05: 490f44d6 cmove rdx, r14
145958d09: 4889542420 mov qword ptr [rsp + 0x20], rdx
145958d0e: 4c8db510010000 lea r14, [rbp + 0x110]
145958d15: 4c89f1 mov rcx, r14
145958d18: 4889da mov rdx, rbx
145958d1b: 4d89f8 mov r8, r15
145958d1e: 4989f9 mov r9, rdi
145958d21: e947360000 jmp 0x14595c36d
