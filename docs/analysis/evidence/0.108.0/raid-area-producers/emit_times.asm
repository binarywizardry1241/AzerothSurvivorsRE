14594b83c: 0f108540010000 movups xmm0, xmmword ptr [rbp + 0x140]
14594b843: 0f108d50010000 movups xmm1, xmmword ptr [rbp + 0x150]
14594b84a: 0f298d00010000 movaps xmmword ptr [rbp + 0x100], xmm1
14594b851: 0f2985f0000000 movaps xmmword ptr [rbp + 0xf0], xmm0
14594b858: f3410f10442454 movss xmm0, dword ptr [r12 + 0x54]
14594b85f: 83fb03 cmp ebx, 3
14594b862: 488d95e0010000 lea rdx, [rbp + 0x1e0]
14594b869: 0f842d010000 je 0x14594b99c
14594b86f: 0f28f8 movaps xmm7, xmm0
14594b872: 83fb02 cmp ebx, 2
14594b875: 7512 jne 0x14594b889
14594b877: 41807c247d00 cmp byte ptr [r12 + 0x7d], 0
14594b87d: 0f28f8 movaps xmm7, xmm0
14594b880: 7407 je 0x14594b889
14594b882: f3410f107c2414 movss xmm7, dword ptr [r12 + 0x14]
14594b889: f3410f5c442464 subss xmm0, dword ptr [r12 + 0x64]
14594b890: f3410f104c2450 movss xmm1, dword ptr [r12 + 0x50]
14594b897: 0f28d1 movaps xmm2, xmm1
14594b89a: f30f5fd0 maxss xmm2, xmm0
14594b89e: 0f28c2 movaps xmm0, xmm2
14594b8a1: f30fc2c203 cmpunordss xmm0, xmm2
14594b8a6: 0f28d8 movaps xmm3, xmm0
14594b8a9: 0f55da andnps xmm3, xmm2
14594b8ac: 0f54c1 andps xmm0, xmm1
14594b8af: 0f56c3 orps xmm0, xmm3
14594b8b2: 0f28c8 movaps xmm1, xmm0
14594b8b5: f30f5dce minss xmm1, xmm6
14594b8b9: 0f28d1 movaps xmm2, xmm1
14594b8bc: f30fc2d103 cmpunordss xmm2, xmm1
14594b8c1: 0f54c2 andps xmm0, xmm2
14594b8c4: 0f55d1 andnps xmm2, xmm1
14594b8c7: 0f56d0 orps xmm2, xmm0
14594b8ca: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
14594b8d1: 0f288d00010000 movaps xmm1, xmmword ptr [rbp + 0x100]
14594b8d8: 0f298df0010000 movaps xmmword ptr [rbp + 0x1f0], xmm1
14594b8df: 0f2985e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm0
14594b8e6: f30f11542420 movss dword ptr [rsp + 0x20], xmm2
14594b8ec: 41b902000000 mov r9d, 2
14594b8f2: 4889f1 mov rcx, rsi
14594b8f5: 4c8d05c94d8a01 lea r8, [rip + 0x18a4dc9]
14594b8fc: 4889d7 mov rdi, rdx
14594b8ff: e81c41f9ff call 0x1458dfa20
14594b904: 90 nop
14594b905: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
14594b90b: 41b902000000 mov r9d, 2
14594b911: 4889f9 mov rcx, rdi
14594b914: 4889f2 mov rdx, rsi
14594b917: 4c8d05a94d8a01 lea r8, [rip + 0x18a4da9]
14594b91e: e8fd40f9ff call 0x1458dfa20
14594b923: 90 nop
14594b924: f30f11742420 movss dword ptr [rsp + 0x20], xmm6
14594b92a: 41b901000000 mov r9d, 1
14594b930: 4889f1 mov rcx, rsi
14594b933: 4889fa mov rdx, rdi
14594b936: 4c8d058c4d8a01 lea r8, [rip + 0x18a4d8c]
14594b93d: e8de40f9ff call 0x1458dfa20
14594b942: 90 nop
14594b943: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14594b94a: 488b9d90010000 mov rbx, qword ptr [rbp + 0x190]
14594b951: 4839d8 cmp rax, rbx
14594b954: 488bbd48020000 mov rdi, qword ptr [rbp + 0x248]
14594b95b: 7470 je 0x14594b9cd
14594b95d: 48898528020000 mov qword ptr [rbp + 0x228], rax
14594b964: 488b8588010000 mov rax, qword ptr [rbp + 0x188]
14594b96b: 488985d8010000 mov qword ptr [rbp + 0x1d8], rax
14594b972: c604187d mov byte ptr [rax + rbx], 0x7d
14594b976: 488bb740060000 mov rsi, qword ptr [rdi + 0x640]
14594b97d: 483bb730060000 cmp rsi, qword ptr [rdi + 0x630]
14594b984: 0f8516f9ffff jne 0x14594b2a0
14594b98a: 488b8d20010000 mov rcx, qword ptr [rbp + 0x120]
14594b991: e81a932a00 call 0x145bf4cb0
14594b996: 90 nop
14594b997: e904f9ffff jmp 0x14594b2a0
