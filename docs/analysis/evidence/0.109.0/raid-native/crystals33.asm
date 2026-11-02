14595a795: 448b01 mov r8d, dword ptr [rcx]
14595a798: 448b7104 mov r14d, dword ptr [rcx + 4]
14595a79c: f30f104108 movss xmm0, dword ptr [rcx + 8]
14595a7a1: f30f1185e0000000 movss dword ptr [rbp + 0xe0], xmm0
14595a7a9: f30f10410c movss xmm0, dword ptr [rcx + 0xc]
14595a7ae: f30f118550010000 movss dword ptr [rbp + 0x150], xmm0
14595a7b6: f30f105910 movss xmm3, dword ptr [rcx + 0x10]
14595a7bb: f30f104114 movss xmm0, dword ptr [rcx + 0x14]
14595a7c0: f30f11850c010000 movss dword ptr [rbp + 0x10c], xmm0
14595a7c8: 4889f1 mov rcx, rsi
14595a7cb: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595a7d2: 44898578010000 mov dword ptr [rbp + 0x178], r8d
14595a7d9: f30f119db8000000 movss dword ptr [rbp + 0xb8], xmm3
14595a7e1: e80ad0ffff call 0x1459577f0
14595a7e6: 488d8ea0090000 lea rcx, [rsi + 0x9a0]
14595a7ed: f30f10154b294700 movss xmm2, dword ptr [rip + 0x47294b]
14595a7f5: 0f57c9 xorps xmm1, xmm1
14595a7f8: e88368f9ff call 0x1458f1080
14595a7fd: 4183fe01 cmp r14d, 1
14595a801: 4183d600 adc r14d, 0
14595a805: 440f28c8 movaps xmm9, xmm0
14595a809: f34d0f2afe cvtsi2ss xmm15, r14
14595a80e: 4531ed xor r13d, r13d
14595a811: f3440f1005aa284700 movss xmm8, dword ptr [rip + 0x4728aa]
14595a81a: f30f1035ce794800 movss xmm6, dword ptr [rip + 0x4879ce]
14595a822: f3440f102d05d24800 movss xmm13, dword ptr [rip + 0x48d205]
14595a82b: f3440f10356c2a4400 movss xmm14, dword ptr [rip + 0x442a6c]
14595a834: 4c8d25553b2801 lea r12, [rip + 0x1283b55]
14595a83b: e9db000000 jmp 0x14595a91b
14595a840: 488d8e88050000 lea rcx, [rsi + 0x588]
14595a847: e8e4042a00 call 0x145bfad30
14595a84c: 41ffc5 inc r13d
14595a84f: f30f1085b8000000 movss xmm0, dword ptr [rbp + 0xb8]
14595a857: f30f58c7 addss xmm0, xmm7
14595a85b: 488b8690050000 mov rax, qword ptr [rsi + 0x590]
14595a862: 4c89f9 mov rcx, r15
14595a865: 48c1e107 shl rcx, 7
14595a869: 48c7040800000000 mov qword ptr [rax + rcx], 0
14595a871: c744081005000000 mov dword ptr [rax + rcx + 0x10], 5
14595a879: f30f108d0c010000 movss xmm1, dword ptr [rbp + 0x10c]
14595a881: f30f114c0814 movss dword ptr [rax + rcx + 0x14], xmm1
14595a887: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14595a88e: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14595a893: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
14595a89c: c744083000000000 mov dword ptr [rax + rcx + 0x30], 0
14595a8a4: f30f108de0000000 movss xmm1, dword ptr [rbp + 0xe0]
14595a8ac: f30f114c0834 movss dword ptr [rax + rcx + 0x34], xmm1
14595a8b2: 897c083c mov dword ptr [rax + rcx + 0x3c], edi
14595a8b6: 440f13540840 movlps qword ptr [rax + rcx + 0x40], xmm10
14595a8bc: f3440f115c0848 movss dword ptr [rax + rcx + 0x48], xmm11
14595a8c3: c744084c00000000 mov dword ptr [rax + rcx + 0x4c], 0
14595a8cb: f30f117c0850 movss dword ptr [rax + rcx + 0x50], xmm7
14595a8d1: f30f11440854 movss dword ptr [rax + rcx + 0x54], xmm0
14595a8d7: c744085800000000 mov dword ptr [rax + rcx + 0x58], 0
14595a8df: 8b9578010000 mov edx, dword ptr [rbp + 0x178]
14595a8e5: 8954085c mov dword ptr [rax + rcx + 0x5c], edx
14595a8e9: f20f1005ff138900 movsd xmm0, qword ptr [rip + 0x8913ff]
14595a8f1: f20f11440860 movsd qword ptr [rax + rcx + 0x60], xmm0
14595a8f7: 49ffc7 inc r15
14595a8fa: 0f57c0 xorps xmm0, xmm0
14595a8fd: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
14595a902: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
14595a90b: 4c89be98050000 mov qword ptr [rsi + 0x598], r15
14595a912: 4539f5 cmp r13d, r14d
14595a915: 0f8411020000 je 0x14595ab2c
14595a91b: 488b96a0090000 mov rdx, qword ptr [rsi + 0x9a0]
14595a922: 488b86a8090000 mov rax, qword ptr [rsi + 0x9a8]
14595a929: 4c8b86b8090000 mov r8, qword ptr [rsi + 0x9b8]
14595a930: 488b8eb0090000 mov rcx, qword ptr [rsi + 0x9b0]
14595a937: 660f1f840000000000 nop word ptr [rax + rax]
14595a940: 4e8d0c02 lea r9, [rdx + r8]
14595a944: 49c1c117 rol r9, 0x17
14595a948: 4901d1 add r9, rdx
14595a94b: 4989c2 mov r10, rax
14595a94e: 49c1e211 shl r10, 0x11
14595a952: 4831d1 xor rcx, rdx
14595a955: 4931c0 xor r8, rax
14595a958: 4831c8 xor rax, rcx
14595a95b: 4c31c2 xor rdx, r8
14595a95e: 4c31d1 xor rcx, r10
14595a961: 49c1c02d rol r8, 0x2d
14595a965: 49c1e929 shr r9, 0x29
14595a969: 4181c90000803f or r9d, 0x3f800000
14595a970: 66410f6ef9 movd xmm7, r9d
14595a975: f3410f58f8 addss xmm7, xmm8
14595a97a: f30f59fe mulss xmm7, xmm6
14595a97e: f3410f58fd addss xmm7, xmm13
14595a983: 440f2ef7 ucomiss xmm14, xmm7
14595a987: 76b7 jbe 0x14595a940
14595a989: 4589e9 mov r9d, r13d
14595a98c: f34d0f2ad1 cvtsi2ss xmm10, r9
14595a991: f3450f5ed7 divss xmm10, xmm15
14595a996: f3440f5915a1274700 mulss xmm10, dword ptr [rip + 0x4727a1]
14595a99f: f3450f58d1 addss xmm10, xmm9
14595a9a4: 488996a0090000 mov qword ptr [rsi + 0x9a0], rdx
14595a9ab: 4c8986b8090000 mov qword ptr [rsi + 0x9b8], r8
14595a9b2: 488986a8090000 mov qword ptr [rsi + 0x9a8], rax
14595a9b9: 48898eb0090000 mov qword ptr [rsi + 0x9b0], rcx
14595a9c0: f30f59bd50010000 mulss xmm7, dword ptr [rbp + 0x150]
14595a9c8: 410f28c2 movaps xmm0, xmm10
14595a9cc: e84cf72900 call 0x145bfa11d
14595a9d1: 440f28d8 movaps xmm11, xmm0
14595a9d5: 410f28c2 movaps xmm0, xmm10
14595a9d9: e839f72900 call 0x145bfa117
14595a9de: 440f28d0 movaps xmm10, xmm0
14595a9e2: 488b8e90020000 mov rcx, qword ptr [rsi + 0x290]
14595a9e9: 488b9698020000 mov rdx, qword ptr [rsi + 0x298]
14595a9f0: e8db26f3ff call 0x14588d0d0
14595a9f5: 4869f8f0000000 imul rdi, rax, 0xf0
14595a9fc: 450f14da unpcklps xmm11, xmm10
14595aa00: f3440f12d7 movsldup xmm10, xmm7
14595aa05: 450f59d3 mulps xmm10, xmm11
14595aa09: 440f5895d0000000 addps xmm10, xmmword ptr [rbp + 0xd0]
14595aa11: f2420f10bc27c8000000 movsd xmm7, qword ptr [rdi + r12 + 0xc8]
14595aa1b: 450f28da movaps xmm11, xmm10
14595aa1f: 440f5cdf subps xmm11, xmm7
14595aa23: f3410f16cb movshdup xmm1, xmm11
14595aa28: 410f28c3 movaps xmm0, xmm11
14595aa2c: e8fef62900 call 0x145bfa12f
14595aa31: f3420f108c27d8000000 movss xmm1, dword ptr [rdi + r12 + 0xd8]
14595aa3b: f30f580dfd518a00 addss xmm1, dword ptr [rip + 0x8a51fd]
14595aa43: f30f1015d17a4800 movss xmm2, dword ptr [rip + 0x487ad1]
14595aa4b: 0f2ed0 ucomiss xmm2, xmm0
14595aa4e: 771c ja 0x14595aa6c
14595aa50: 0f2ec8 ucomiss xmm1, xmm0
14595aa53: 7317 jae 0x14595aa6c
14595aa55: f30f12c0 movsldup xmm0, xmm0
14595aa59: 440f5ed8 divps xmm11, xmm0
14595aa5d: f30f12c1 movsldup xmm0, xmm1
14595aa61: 410f59c3 mulps xmm0, xmm11
14595aa65: 0f58f8 addps xmm7, xmm0
14595aa68: 440f28d7 movaps xmm10, xmm7
14595aa6c: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
14595aa72: ffc7 inc edi
14595aa74: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
14595aa7a: f30f10be340a0000 movss xmm7, dword ptr [rsi + 0xa34]
14595aa82: 4c8bbe98090000 mov r15, qword ptr [rsi + 0x998]
14595aa89: 498d4f10 lea rcx, [r15 + 0x10]
14595aa8d: f3450f16e2 movshdup xmm12, xmm10
14595aa92: 410f28ca movaps xmm1, xmm10
14595aa96: 410f28d4 movaps xmm2, xmm12
14595aa9a: e8f1c4f7ff call 0x1458d6f90
14595aa9f: a801 test al, 1
14595aaa1: 741d je 0x14595aac0
14595aaa3: 440f28d8 movaps xmm11, xmm0
14595aaa7: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
14595aaae: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595aab5: 0f8591fdffff jne 0x14595a84c
14595aabb: e980fdffff jmp 0x14595a840
14595aac0: 49837f68ff cmp qword ptr [r15 + 0x68], -1
14595aac5: 7443 je 0x14595ab0a
14595aac7: 498d5768 lea rdx, [r15 + 0x68]
14595aacb: 488d8d10010000 lea rcx, [rbp + 0x110]
14595aad2: 410f28d2 movaps xmm2, xmm10
14595aad6: 410f28dc movaps xmm3, xmm12
14595aada: e8a116f8ff call 0x1458dc180
14595aadf: 83bd1001000001 cmp dword ptr [rbp + 0x110], 1
14595aae6: 7522 jne 0x14595ab0a
14595aae8: f3440f109d1c010000 movss xmm11, dword ptr [rbp + 0x11c]
14595aaf1: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
14595aaf8: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595aaff: 0f8547fdffff jne 0x14595a84c
14595ab05: e936fdffff jmp 0x14595a840
14595ab0a: f3450f109fb8000000 movss xmm11, dword ptr [r15 + 0xb8]
14595ab13: 4c8bbe98050000 mov r15, qword ptr [rsi + 0x598]
14595ab1a: 4c3bbe88050000 cmp r15, qword ptr [rsi + 0x588]
14595ab21: 0f8525fdffff jne 0x14595a84c
14595ab27: e914fdffff jmp 0x14595a840
14595ab2c: 488b9668050000 mov rdx, qword ptr [rsi + 0x568]
14595ab33: 488b8df0000000 mov rcx, qword ptr [rbp + 0xf0]
14595ab3a: 4839d1 cmp rcx, rdx
14595ab3d: 0f83f9200000 jae 0x14595cc3c
14595ab43: 48039e60050000 add rbx, qword ptr [rsi + 0x560]
14595ab4a: 4889d9 mov rcx, rbx
14595ab4d: e84e2efbff call 0x14590d9a0
14595ab52: 4889c7 mov rdi, rax
14595ab55: 4889d3 mov rbx, rdx
14595ab58: 4881c618060000 add rsi, 0x618
14595ab5f: 4c8d3532048d01 lea r14, [rip + 0x18d0432]
14595ab66: 41bf20000000 mov r15d, 0x20
14595ab6c: ba20000000 mov edx, 0x20
14595ab71: e927060000 jmp 0x14595b19d
