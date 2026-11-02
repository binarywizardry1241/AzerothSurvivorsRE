0000000145be8d10 55                             push rbp
0000000145be8d11 4157                           push r15
0000000145be8d13 4156                           push r14
0000000145be8d15 56                             push rsi
0000000145be8d16 57                             push rdi
0000000145be8d17 53                             push rbx
0000000145be8d18 4881ec58020000                 sub rsp, 0x258
0000000145be8d1f 488dac2480000000               lea rbp, [rsp + 0x80]
0000000145be8d27 0f29bdc0010000                 movaps xmmword ptr [rbp + 0x1c0], xmm7
0000000145be8d2e 0f29b5b0010000                 movaps xmmword ptr [rbp + 0x1b0], xmm6
0000000145be8d35 48c785a8010000feffffff         mov qword ptr [rbp + 0x1a8], 0xfffffffffffffffe
0000000145be8d40 4c89cb                         mov rbx, r9
0000000145be8d43 4889d7                         mov rdi, rdx
0000000145be8d46 4889ce                         mov rsi, rcx
0000000145be8d49 4c8bbd30020000                 mov r15, qword ptr [rbp + 0x230]
0000000145be8d50 f30f10b538020000               movss xmm6, dword ptr [rbp + 0x238]
0000000145be8d58 4983f80c                       cmp r8, 0xc
0000000145be8d5c b80c000000                     mov eax, 0xc
0000000145be8d61 490f42c0                       cmovb rax, r8
0000000145be8d65 c1e005                         shl eax, 5
0000000145be8d68 488d0dd17d3d01                 lea rcx, [rip + 0x13d7dd1]
0000000145be8d6f 448b440810                     mov r8d, dword ptr [rax + rcx + 0x10]
0000000145be8d74 448b4c0814                     mov r9d, dword ptr [rax + rcx + 0x14]
0000000145be8d79 8b96a40c0000                   mov edx, dword ptr [rsi + 0xca4]
0000000145be8d7f ffc2                           inc edx
0000000145be8d81 8996a40c0000                   mov dword ptr [rsi + 0xca4], edx
0000000145be8d87 4589c2                         mov r10d, r8d
0000000145be8d8a 4181e2ffffff00                 and r10d, 0xffffff
0000000145be8d91 49c1e218                       shl r10, 0x18
0000000145be8d95 81e2ffffff00                   and edx, 0xffffff
0000000145be8d9b 4c09d2                         or rdx, r10
0000000145be8d9e 49be00000000000030f1           movabs r14, 0xf130000000000000
0000000145be8da8 4909d6                         or r14, rdx
0000000145be8dab f30f5f35edf35a00               maxss xmm6, dword ptr [rip + 0x5af3ed]
0000000145be8db3 f30f107c0818                   movss xmm7, dword ptr [rax + rcx + 0x18]
0000000145be8db9 4c897c2438                     mov qword ptr [rsp + 0x38], r15
0000000145be8dbe f30f11742428                   movss dword ptr [rsp + 0x28], xmm6
0000000145be8dc4 f30f117c2420                   movss dword ptr [rsp + 0x20], xmm7
0000000145be8dca c644243000                     mov byte ptr [rsp + 0x30], 0
0000000145be8dcf 4889f1                         mov rcx, rsi
0000000145be8dd2 4c89f2                         mov rdx, r14
0000000145be8dd5 e806af0200                     call 0x145c13ce0
0000000145be8dda 488b8ed0020000                 mov rcx, qword ptr [rsi + 0x2d0]
0000000145be8de1 488b96d8020000                 mov rdx, qword ptr [rsi + 0x2d8]
0000000145be8de8 e8a333ebff                     call 0x145a9c190
0000000145be8ded 4869c0f0000000                 imul rax, rax, 0xf0
0000000145be8df4 488d0d55543d01                 lea rcx, [rip + 0x13d5455]
0000000145be8dfb 488b440878                     mov rax, qword ptr [rax + rcx + 0x78]
0000000145be8e00 f30f1086740c0000               movss xmm0, dword ptr [rsi + 0xc74]
0000000145be8e08 f30f105028                     movss xmm2, dword ptr [rax + 0x28]
0000000145be8e0d f30f5915f3f95a00               mulss xmm2, dword ptr [rip + 0x5af9f3]
0000000145be8e15 f30f58151366aa01               addss xmm2, dword ptr [rip + 0x1aa6613]
0000000145be8e1d f30f105838                     movss xmm3, dword ptr [rax + 0x38]
0000000145be8e22 f30f1025daf35a00               movss xmm4, dword ptr [rip + 0x5af3da]
0000000145be8e2a f30f59e3                       mulss xmm4, xmm3
0000000145be8e2e 0f57c9                         xorps xmm1, xmm1
0000000145be8e31 0f118d18010000                 movups xmmword ptr [rbp + 0x118], xmm1
0000000145be8e38 0f118d08010000                 movups xmmword ptr [rbp + 0x108], xmm1
0000000145be8e3f 0f118df8000000                 movups xmmword ptr [rbp + 0xf8], xmm1
0000000145be8e46 0f118de8000000                 movups xmmword ptr [rbp + 0xe8], xmm1
0000000145be8e4d 4c89b5b8000000                 mov qword ptr [rbp + 0xb8], r14
0000000145be8e54 48c785c000000000000000         mov qword ptr [rbp + 0xc0], 0
0000000145be8e5f 48c745e0ffffffff               mov qword ptr [rbp - 0x20], 0xffffffffffffffff
0000000145be8e67 f30f119d38010000               movss dword ptr [rbp + 0x138], xmm3
0000000145be8e6f f30f11953c010000               movss dword ptr [rbp + 0x13c], xmm2
0000000145be8e77 418b4708                       mov eax, dword ptr [r15 + 8]
0000000145be8e7b 89854c010000                   mov dword ptr [rbp + 0x14c], eax
0000000145be8e81 498b07                         mov rax, qword ptr [r15]
0000000145be8e84 48898544010000                 mov qword ptr [rbp + 0x144], rax
0000000145be8e8b 498b07                         mov rax, qword ptr [r15]
0000000145be8e8e 48898550010000                 mov qword ptr [rbp + 0x150], rax
0000000145be8e95 418b4708                       mov eax, dword ptr [r15 + 8]
0000000145be8e99 898558010000                   mov dword ptr [rbp + 0x158], eax
0000000145be8e9f f30f11855c010000               movss dword ptr [rbp + 0x15c], xmm0
0000000145be8ea7 c7856001000000000000           mov dword ptr [rbp + 0x160], 0
0000000145be8eb1 f30f118564010000               movss dword ptr [rbp + 0x164], xmm0
0000000145be8eb9 f30f11a568010000               movss dword ptr [rbp + 0x168], xmm4
0000000145be8ec1 48c745c800000000               mov qword ptr [rbp - 0x38], 0
0000000145be8ec9 0f118dd0000000                 movups xmmword ptr [rbp + 0xd0], xmm1
0000000145be8ed0 48c785e000000000000000         mov qword ptr [rbp + 0xe0], 0
0000000145be8edb 0f118d6c010000                 movups xmmword ptr [rbp + 0x16c], xmm1
0000000145be8ee2 0f118d7c010000                 movups xmmword ptr [rbp + 0x17c], xmm1
0000000145be8ee9 48c745d008000000               mov qword ptr [rbp - 0x30], 8
0000000145be8ef1 48c745d800000000               mov qword ptr [rbp - 0x28], 0
0000000145be8ef9 c7858c01000000000000           mov dword ptr [rbp + 0x18c], 0
0000000145be8f03 c7457800000000                 mov dword ptr [rbp + 0x78], 0
0000000145be8f0a c7858000000000000000           mov dword ptr [rbp + 0x80], 0
0000000145be8f14 48c74520ffffffff               mov qword ptr [rbp + 0x20], 0xffffffffffffffff
0000000145be8f1c c7858800000000000000           mov dword ptr [rbp + 0x88], 0
0000000145be8f26 48c785c800000000000000         mov qword ptr [rbp + 0xc8], 0
0000000145be8f31 0f118d90010000                 movups xmmword ptr [rbp + 0x190], xmm1
0000000145be8f38 66c785a00100000000             mov word ptr [rbp + 0x1a0], 0
0000000145be8f41 f30f11b528010000               movss dword ptr [rbp + 0x128], xmm6
0000000145be8f49 f30f11b52c010000               movss dword ptr [rbp + 0x12c], xmm6
0000000145be8f51 48c7853001000000000000         mov qword ptr [rbp + 0x130], 0
0000000145be8f5c f30f11bd40010000               movss dword ptr [rbp + 0x140], xmm7
0000000145be8f64 0f100b                         movups xmm1, xmmword ptr [rbx]
0000000145be8f67 0f118d98000000                 movups xmmword ptr [rbp + 0x98], xmm1
0000000145be8f6e 4889bda8000000                 mov qword ptr [rbp + 0xa8], rdi
0000000145be8f75 f30f108d40020000               movss xmm1, dword ptr [rbp + 0x240]
0000000145be8f7d 0f28156cf55a00                 movaps xmm2, xmmword ptr [rip + 0x5af56c]
0000000145be8f84 f30f10d1                       movss xmm2, xmm1
0000000145be8f88 f30f12c0                       movsldup xmm0, xmm0
0000000145be8f8c 0f58c2                         addps xmm0, xmm2
0000000145be8f8f 0f1385b0000000                 movlps qword ptr [rbp + 0xb0], xmm0
0000000145be8f96 488bbec0050000                 mov rdi, qword ptr [rsi + 0x5c0]
0000000145be8f9d 483bbeb0050000                 cmp rdi, qword ptr [rsi + 0x5b0]
0000000145be8fa4 750d                           jne 0x145be8fb3
0000000145be8fa6 488d8eb0050000                 lea rcx, [rsi + 0x5b0]
0000000145be8fad e86e9a5800                     call 0x146172a20
0000000145be8fb2 90                             nop
0000000145be8fb3 4869cfe0010000                 imul rcx, rdi, 0x1e0
0000000145be8fba 48038eb8050000                 add rcx, qword ptr [rsi + 0x5b8]
0000000145be8fc1 488d55c8                       lea rdx, [rbp - 0x38]
0000000145be8fc5 41b8e0010000                   mov r8d, 0x1e0
0000000145be8fcb e84b2c4000                     call 0x145febc1b
0000000145be8fd0 48ffc7                         inc rdi
0000000145be8fd3 4889bec0050000                 mov qword ptr [rsi + 0x5c0], rdi
0000000145be8fda 0f28b5b0010000                 movaps xmm6, xmmword ptr [rbp + 0x1b0]
0000000145be8fe1 0f28bdc0010000                 movaps xmm7, xmmword ptr [rbp + 0x1c0]
0000000145be8fe8 4881c458020000                 add rsp, 0x258
0000000145be8fef 5b                             pop rbx
0000000145be8ff0 5f                             pop rdi
0000000145be8ff1 5e                             pop rsi
0000000145be8ff2 415e                           pop r14
0000000145be8ff4 415f                           pop r15
0000000145be8ff6 5d                             pop rbp
0000000145be8ff7 c3                             ret
