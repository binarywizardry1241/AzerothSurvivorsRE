0x145a4c424: f30f6f07                 movdqu xmm0, xmmword ptr [rdi]
0x145a4c428: f30f6f4dcc               movdqu xmm1, xmmword ptr [rbp - 0x34]
0x145a4c42d: 660f74c8                 pcmpeqb xmm1, xmm0
0x145a4c431: 660f6e4710               movd xmm0, dword ptr [rdi + 0x10]
0x145a4c436: 660f6e55dc               movd xmm2, dword ptr [rbp - 0x24]
0x145a4c43b: 660f74d0                 pcmpeqb xmm2, xmm0
0x145a4c43f: 660fdbd1                 pand xmm2, xmm1
0x145a4c443: 660fd7c2                 pmovmskb eax, xmm2
0x145a4c447: 3dffff0000               cmp eax, 0xffff
0x145a4c44c: 745f                     je 0x145a4c4ad
0x145a4c44e: 8b4710                   mov eax, dword ptr [rdi + 0x10]
0x145a4c451: 8945f0                   mov dword ptr [rbp - 0x10], eax
0x145a4c454: 0f1007                   movups xmm0, xmmword ptr [rdi]
0x145a4c457: 0f2945e0                 movaps xmmword ptr [rbp - 0x20], xmm0
0x145a4c45b: 8b45dc                   mov eax, dword ptr [rbp - 0x24]
0x145a4c45e: 894504                   mov dword ptr [rbp + 4], eax
0x145a4c461: 0f104dcc                 movups xmm1, xmmword ptr [rbp - 0x34]
0x145a4c465: 0f114df4                 movups xmmword ptr [rbp - 0xc], xmm1
0x145a4c469: 0f114608                 movups xmmword ptr [rsi + 8], xmm0
0x145a4c46d: 8b45f0                   mov eax, dword ptr [rbp - 0x10]
0x145a4c470: 894618                   mov dword ptr [rsi + 0x18], eax
0x145a4c473: 488b45f4                 mov rax, qword ptr [rbp - 0xc]
0x145a4c477: 4889461c                 mov qword ptr [rsi + 0x1c], rax
0x145a4c47b: 8b45fc                   mov eax, dword ptr [rbp - 4]
0x145a4c47e: 894624                   mov dword ptr [rsi + 0x24], eax
0x145a4c481: 488b4500                 mov rax, qword ptr [rbp]
0x145a4c485: 48894628                 mov qword ptr [rsi + 0x28], rax
0x145a4c489: 48c706ffffffff           mov qword ptr [rsi], 0xffffffffffffffff
0x145a4c490: 488b4570                 mov rax, qword ptr [rbp + 0x70]
0x145a4c494: 488b10                   mov rdx, qword ptr [rax]
0x145a4c497: 4885d2                   test rdx, rdx
0x145a4c49a: 7468                     je 0x145a4c504
0x145a4c49c: 488b4808                 mov rcx, qword ptr [rax + 8]
0x145a4c4a0: 41b801000000             mov r8d, 1
0x145a4c4a6: e8255d5bfa               call 0x1400021d0
0x145a4c4ab: eb57                     jmp 0x145a4c504
0x145a4c4ad: 488b4d70                 mov rcx, qword ptr [rbp + 0x70]
0x145a4c4b1: 488b4110                 mov rax, qword ptr [rcx + 0x10]
0x145a4c4b5: 488945f0                 mov qword ptr [rbp - 0x10], rax
0x145a4c4b9: 0f1001                   movups xmm0, xmmword ptr [rcx]
0x145a4c4bc: 0f2945e0                 movaps xmmword ptr [rbp - 0x20], xmm0
0x145a4c4c0: 488b4320                 mov rax, qword ptr [rbx + 0x20]
0x145a4c4c4: 48894518                 mov qword ptr [rbp + 0x18], rax
0x145a4c4c8: 0f100b                   movups xmm1, xmmword ptr [rbx]
0x145a4c4cb: f30f6f5310               movdqu xmm2, xmmword ptr [rbx + 0x10]
0x145a4c4d0: f30f7f5508               movdqu xmmword ptr [rbp + 8], xmm2
0x145a4c4d5: 0f114df8                 movups xmmword ptr [rbp - 8], xmm1
0x145a4c4d9: 0f1106                   movups xmmword ptr [rsi], xmm0
0x145a4c4dc: 488b45f0                 mov rax, qword ptr [rbp - 0x10]
0x145a4c4e0: 48894610                 mov qword ptr [rsi + 0x10], rax
0x145a4c4e4: 488b45f8                 mov rax, qword ptr [rbp - 8]
0x145a4c4e8: 48894618                 mov qword ptr [rsi + 0x18], rax
0x145a4c4ec: 0f284500                 movaps xmm0, xmmword ptr [rbp]
0x145a4c4f0: 0f114620                 movups xmmword ptr [rsi + 0x20], xmm0
0x145a4c4f4: 488b4510                 mov rax, qword ptr [rbp + 0x10]
0x145a4c4f8: 48894630                 mov qword ptr [rsi + 0x30], rax
0x145a4c4fc: 488b4518                 mov rax, qword ptr [rbp + 0x18]
0x145a4c500: 48894638                 mov qword ptr [rsi + 0x38], rax
0x145a4c504: 4889f0                   mov rax, rsi
0x145a4c507: 4881c408010000           add rsp, 0x108
0x145a4c50e: 5b                       pop rbx
0x145a4c50f: 5f                       pop rdi
0x145a4c510: 5e                       pop rsi
0x145a4c511: 415c                     pop r12
0x145a4c513: 415d                     pop r13
0x145a4c515: 415e                     pop r14
0x145a4c517: 415f                     pop r15
0x145a4c519: 5d                       pop rbp
0x145a4c51a: c3                       ret
