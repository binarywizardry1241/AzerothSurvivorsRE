14595b75c: 448b4110 mov r8d, dword ptr [rcx + 0x10]
14595b760: 440fb7792e movzx r15d, word ptr [rcx + 0x2e]
14595b765: 4c8b21 mov r12, qword ptr [rcx]
14595b768: 4c8b6908 mov r13, qword ptr [rcx + 8]
14595b76c: f30f10352c1b4400 movss xmm6, dword ptr [rip + 0x441b2c]
14595b774: 4889f1 mov rcx, rsi
14595b777: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595b77e: 44898578010000 mov dword ptr [rbp + 0x178], r8d
14595b785: 0f28de movaps xmm3, xmm6
14595b788: e863c0ffff call 0x1459577f0
14595b78d: 4889f1 mov rcx, rsi
14595b790: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14595b797: 0f28d6 movaps xmm2, xmm6
14595b79a: 4531c9 xor r9d, r9d
14595b79d: e87ebbffff call 0x145957320
14595b7a2: 4080ff02 cmp dil, 2
14595b7a6: 743d je 0x14595b7e5
14595b7a8: 410f104614 movups xmm0, xmmword ptr [r14 + 0x14]
14595b7ad: 410f104e1d movups xmm1, xmmword ptr [r14 + 0x1d]
14595b7b2: 0f118d19010000 movups xmmword ptr [rbp + 0x119], xmm1
14595b7b9: 0f298510010000 movaps xmmword ptr [rbp + 0x110], xmm0
14595b7c0: 4088bd29010000 mov byte ptr [rbp + 0x129], dil
14595b7c7: 664489bd2a010000 mov word ptr [rbp + 0x12a], r15w
14595b7cf: 4c8d8510010000 lea r8, [rbp + 0x110]
14595b7d6: 4889f1 mov rcx, rsi
14595b7d9: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595b7e0: e8ab1cffff call 0x14594d490
14595b7e5: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
14595b7ec: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14595b7f3: 4839d1 cmp rcx, rdx
14595b7f6: 0f83bf140000 jae 0x14595ccbb
14595b7fc: 4c8bb660050000 mov r14, qword ptr [rsi + 0x560]
14595b803: 498d3c1e lea rdi, [r14 + rbx]
14595b807: 4d6bc538 imul r8, r13, 0x38
14595b80b: 4d01e0 add r8, r12
14595b80e: 488d4d18 lea rcx, [rbp + 0x18]
14595b812: 4c89e2 mov rdx, r12
14595b815: e8b6f00600 call 0x1459ca8d0
14595b81a: 49837c1e18ff cmp qword ptr [r14 + rbx + 0x18], -1
14595b820: 7457 je 0x14595b879
14595b822: 4c896738 mov qword ptr [rdi + 0x38], r12
14595b826: 4c896f40 mov qword ptr [rdi + 0x40], r13
14595b82a: c6857701000001 mov byte ptr [rbp + 0x177], 1
14595b831: 488d8d10010000 lea rcx, [rbp + 0x110]
14595b838: 488d5518 lea rdx, [rbp + 0x18]
14595b83c: e8ef9cfefe call 0x144945530
14595b841: 90 nop
14595b842: 4c01f3 add rbx, r14
14595b845: 4883c318 add rbx, 0x18
14595b849: 488b13 mov rdx, qword ptr [rbx]
14595b84c: 4885d2 test rdx, rdx
14595b84f: 7413 je 0x14595b864
14595b851: 488b4f20 mov rcx, qword ptr [rdi + 0x20]
14595b855: 48c1e202 shl rdx, 2
14595b859: 41b804000000 mov r8d, 4
14595b85f: e86c696afa call 0x1400021d0
14595b864: 488b8520010000 mov rax, qword ptr [rbp + 0x120]
14595b86b: 48894310 mov qword ptr [rbx + 0x10], rax
14595b86f: 0f108510010000 movups xmm0, xmmword ptr [rbp + 0x110]
14595b876: 0f1103 movups xmmword ptr [rbx], xmm0
14595b879: 488b5758 mov rdx, qword ptr [rdi + 0x58]
14595b87d: 4883faff cmp rdx, -1
14595b881: 0f84370a0000 je 0x14595c2be
14595b887: 488d5f58 lea rbx, [rdi + 0x58]
14595b88b: 4c89a780000000 mov qword ptr [rdi + 0x80], r12
14595b892: 4c89af88000000 mov qword ptr [rdi + 0x88], r13
14595b899: 4885d2 test rdx, rdx
14595b89c: 7413 je 0x14595b8b1
14595b89e: 488b4f60 mov rcx, qword ptr [rdi + 0x60]
14595b8a2: 48c1e202 shl rdx, 2
14595b8a6: 41b804000000 mov r8d, 4
14595b8ac: e81f696afa call 0x1400021d0
14595b8b1: 488b4528 mov rax, qword ptr [rbp + 0x28]
14595b8b5: 48894310 mov qword ptr [rbx + 0x10], rax
14595b8b9: 0f104518 movups xmm0, xmmword ptr [rbp + 0x18]
14595b8bd: 0f1103 movups xmmword ptr [rbx], xmm0
14595b8c0: c6857701000000 mov byte ptr [rbp + 0x177], 0
14595b8c7: 488d85a8000000 lea rax, [rbp + 0xa8]
14595b8ce: 4889442420 mov qword ptr [rsp + 0x20], rax
14595b8d3: f30f100dc5194400 movss xmm1, dword ptr [rip + 0x4419c5]
14595b8db: 4889f1 mov rcx, rsi
14595b8de: 4c8b8580010000 mov r8, qword ptr [rbp + 0x180]
14595b8e5: 448b8d78010000 mov r9d, dword ptr [rbp + 0x178]
14595b8ec: e83f29ffff call 0x14594e230
14595b8f1: 90 nop
14595b8f2: e981c0ffff jmp 0x145957978
