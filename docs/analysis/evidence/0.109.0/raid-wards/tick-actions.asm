14597c56c: 488b85f8000000 mov rax, qword ptr [rbp + 0xf8]
14597c573: 48898520030000 mov qword ptr [rbp + 0x320], rax
14597c57a: 4c8bb500010000 mov r14, qword ptr [rbp + 0x100]
14597c581: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
14597c588: 488d0480 lea rax, [rax + rax*4]
14597c58c: 498d1cc6 lea rbx, [r14 + rax*8]
14597c590: f3440f1015a70b4500 movss xmm10, dword ptr [rip + 0x450ba7]
14597c599: 440f281dffd38a01 movaps xmm11, xmmword ptr [rip + 0x18ad3ff]
14597c5a1: 4c8dbd60020000 lea r15, [rbp + 0x260]
14597c5a8: 4c89b5c8020000 mov qword ptr [rbp + 0x2c8], r14
14597c5af: 4939de cmp r14, rbx
14597c5b2: 7529 jne 0x14597c5dd
14597c5b4: e943020000 jmp 0x14597c7fc
14597c5b9: 660f6ed7 movd xmm2, edi
14597c5bd: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14597c5c4: 41b906080000 mov r9d, 0x806
14597c5ca: e86117fdff call 0x14594dd30
14597c5cf: 90 nop
14597c5d0: 4983c628 add r14, 0x28
14597c5d4: 4939de cmp r14, rbx
14597c5d7: 0f841f020000 je 0x14597c7fc
14597c5dd: 418b06 mov eax, dword ptr [r14]
14597c5e0: 83f8ff cmp eax, -1
14597c5e3: 0f8413020000 je 0x14597c7fc
14597c5e9: 418b7e04 mov edi, dword ptr [r14 + 4]
14597c5ed: 4d8b6608 mov r12, qword ptr [r14 + 8]
14597c5f1: 4d8b6e10 mov r13, qword ptr [r14 + 0x10]
14597c5f5: f2450f106618 movsd xmm12, qword ptr [r14 + 0x18]
14597c5fb: f3450f106e20 movss xmm13, dword ptr [r14 + 0x20]
14597c601: 410fb64e24 movzx ecx, byte ptr [r14 + 0x24]
14597c606: 4c89ad00020000 mov qword ptr [rbp + 0x200], r13
14597c60d: 488b9518030000 mov rdx, qword ptr [rbp + 0x318]
14597c614: 488b9268050000 mov rdx, qword ptr [rdx + 0x568]
14597c61b: 4885d2 test rdx, rdx
14597c61e: 74b0 je 0x14597c5d0
14597c620: 4c8b8518030000 mov r8, qword ptr [rbp + 0x318]
14597c627: 4d8b8860050000 mov r9, qword ptr [r8 + 0x560]
14597c62e: 4c69c2d8010000 imul r8, rdx, 0x1d8
14597c635: 31d2 xor edx, edx
14597c637: eb13 jmp 0x14597c64c
14597c639: 0f1f8000000000 nop dword ptr [rax]
14597c640: 4881c2d8010000 add rdx, 0x1d8
14597c647: 4939d0 cmp r8, rdx
14597c64a: 7484 je 0x14597c5d0
14597c64c: 4d39ac11f0000000 cmp qword ptr [r9 + rdx + 0xf0], r13
14597c654: 75ea jne 0x14597c640
14597c656: 4183bc11b000000001 cmp dword ptr [r9 + rdx + 0xb0], 1
14597c65f: 74df je 0x14597c640
14597c661: 4183bc11d0000000ff cmp dword ptr [r9 + rdx + 0xd0], -1
14597c66a: 0f8460ffffff je 0x14597c5d0
14597c670: 498b9411e0000000 mov rdx, qword ptr [r9 + rdx + 0xe0]
14597c678: 0f1f840000000000 nop dword ptr [rax + rax]
14597c680: 4d85c0 test r8, r8
14597c683: 0f84c7000000 je 0x14597c750
14597c689: 4d89ca mov r10, r9
14597c68c: 4981c1d8010000 add r9, 0x1d8
14597c693: 4981c028feffff add r8, -0x1d8
14597c69a: 493992f0000000 cmp qword ptr [r10 + 0xf0], rdx
14597c6a1: 75dd jne 0x14597c680
14597c6a3: 41f682b000000001 test byte ptr [r10 + 0xb0], 1
14597c6ab: 75d3 jne 0x14597c680
14597c6ad: 85c0 test eax, eax
14597c6af: 7417 je 0x14597c6c8
14597c6b1: 83f801 cmp eax, 1
14597c6b4: 0f858d000000 jne 0x14597c747
14597c6ba: f6c101 test cl, 1
14597c6bd: 0f84f6feffff je 0x14597c5b9
14597c6c3: e988000000 jmp 0x14597c750
14597c6c8: f6c101 test cl, 1
14597c6cb: 0f84fffeffff je 0x14597c5d0
14597c6d1: 85ff test edi, edi
14597c6d3: 747b je 0x14597c750
14597c6d5: 89f8 mov eax, edi
14597c6d7: f34c0f2af0 cvtsi2ss xmm14, rax
14597c6dc: 31f6 xor esi, esi
14597c6de: 6690 nop
14597c6e0: 89f0 mov eax, esi
14597c6e2: 0f57f6 xorps xmm6, xmm6
14597c6e5: f3480f2af0 cvtsi2ss xmm6, rax
14597c6ea: f3410f5ef6 divss xmm6, xmm14
14597c6ef: f3410f59f2 mulss xmm6, xmm10
14597c6f4: 0f28c6 movaps xmm0, xmm6
14597c6f7: e821da2700 call 0x145bfa11d
14597c6fc: 0f28f8 movaps xmm7, xmm0
14597c6ff: 0f28c6 movaps xmm0, xmm6
14597c702: e810da2700 call 0x145bfa117
14597c707: 0f14f8 unpcklps xmm7, xmm0
14597c70a: 410f59fb mulps xmm7, xmm11
14597c70e: 410f58fc addps xmm7, xmm12
14597c712: 0f13bd64020000 movlps qword ptr [rbp + 0x264], xmm7
14597c719: f3440f11ad6c020000 movss dword ptr [rbp + 0x26c], xmm13
14597c722: c7856002000001000000 mov dword ptr [rbp + 0x260], 1
14597c72c: 488b8d18030000 mov rcx, qword ptr [rbp + 0x318]
14597c733: 4c89e2 mov rdx, r12
14597c736: 4d89f8 mov r8, r15
14597c739: e8223effff call 0x145970560
14597c73e: 90 nop
14597c73f: ffc6 inc esi
14597c741: 39fe cmp esi, edi
14597c743: 759b jne 0x14597c6e0
14597c745: eb09 jmp 0x14597c750
14597c747: f6c101 test cl, 1
14597c74a: 0f8480feffff je 0x14597c5d0
14597c750: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
14597c754: 488d9500020000 lea rdx, [rbp + 0x200]
14597c75b: e8a08b0300 call 0x1459b5300
14597c760: 90 nop
14597c761: e89a5a68fa call 0x140002200
14597c766: b920000000 mov ecx, 0x20
14597c76b: ba01000000 mov edx, 1
14597c770: e84b5a68fa call 0x1400021c0
14597c775: 4885c0 test rax, rax
14597c778: 0f84be0a0000 je 0x14597d23c
14597c77e: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
14597c785: 4c8928 mov qword ptr [rax], r13
14597c788: 488b8518030000 mov rax, qword ptr [rbp + 0x318]
14597c78f: 488bb028060000 mov rsi, qword ptr [rax + 0x628]
14597c796: 483bb018060000 cmp rsi, qword ptr [rax + 0x618]
14597c79d: 750d jne 0x14597c7ac
14597c79f: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14597c7a6: e865e62700 call 0x145bfae10
14597c7ab: 90 nop
14597c7ac: 488b9518030000 mov rdx, qword ptr [rbp + 0x318]
14597c7b3: 488b8220060000 mov rax, qword ptr [rdx + 0x620]
14597c7ba: 4889f1 mov rcx, rsi
14597c7bd: 48c1e105 shl rcx, 5
14597c7c1: 48c7040820000000 mov qword ptr [rax + rcx], 0x20
14597c7c9: 4c8b85f0020000 mov r8, qword ptr [rbp + 0x2f0]
14597c7d0: 4c89440808 mov qword ptr [rax + rcx + 8], r8
14597c7d5: 48c744081008000000 mov qword ptr [rax + rcx + 0x10], 8
14597c7de: 66c7440818aa00 mov word ptr [rax + rcx + 0x18], 0xaa
14597c7e5: 48ffc6 inc rsi
14597c7e8: 4889b228060000 mov qword ptr [rdx + 0x628], rsi
14597c7ef: 4983c628 add r14, 0x28
14597c7f3: 4939de cmp r14, rbx
14597c7f6: 0f85e1fdffff jne 0x14597c5dd
