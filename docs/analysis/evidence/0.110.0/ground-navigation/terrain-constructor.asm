14589abe0: 55 push rbp
14589abe1: 4157 push r15
14589abe3: 4156 push r14
14589abe5: 4155 push r13
14589abe7: 4154 push r12
14589abe9: 56 push rsi
14589abea: 57 push rdi
14589abeb: 53 push rbx
14589abec: 4881ec18030000 sub rsp, 0x318
14589abf3: 488dac2480000000 lea rbp, [rsp + 0x80]
14589abfb: 440f299d80020000 movaps xmmword ptr [rbp + 0x280], xmm11
14589ac03: 440f299570020000 movaps xmmword ptr [rbp + 0x270], xmm10
14589ac0b: 440f298d60020000 movaps xmmword ptr [rbp + 0x260], xmm9
14589ac13: 440f298550020000 movaps xmmword ptr [rbp + 0x250], xmm8
14589ac1b: 0f29bd40020000 movaps xmmword ptr [rbp + 0x240], xmm7
14589ac22: 0f29b530020000 movaps xmmword ptr [rbp + 0x230], xmm6
14589ac29: 48c78528020000feffffff mov qword ptr [rbp + 0x228], 0xfffffffffffffffe
14589ac34: 4c89cf mov rdi, r9
14589ac37: 4d89c6 mov r14, r8
14589ac3a: 4989d7 mov r15, rdx
14589ac3d: 4989cc mov r12, rcx
14589ac40: 488d8db0000000 lea rcx, [rbp + 0xb0]
14589ac47: e8d46c1d00 call 0x145a71920
14589ac4c: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
14589ac53: 4531c0 xor r8d, r8d
14589ac56: 4883f8ff cmp rax, -1
14589ac5a: ba01000000 mov edx, 1
14589ac5f: 480f4595b8000000 cmovne rdx, qword ptr [rbp + 0xb8]
14589ac67: 490f44c0 cmove rax, r8
14589ac6b: 48898518020000 mov qword ptr [rbp + 0x218], rax
14589ac72: 4c0f4585c0000000 cmovne r8, qword ptr [rbp + 0xc0]
14589ac7a: 488d9db0000000 lea rbx, [rbp + 0xb0]
14589ac81: 4889d9 mov rcx, rbx
14589ac84: 48899510020000 mov qword ptr [rbp + 0x210], rdx
14589ac8b: e8f0522000 call 0x145a9ff80
14589ac90: 90 nop
14589ac91: 4883bdb0000000ff cmp qword ptr [rbp + 0xb0], -1
14589ac99: 741e je 0x14589acb9
14589ac9b: 0f1085b0000000 movups xmm0, xmmword ptr [rbp + 0xb0]
14589aca2: 0f108dc0000000 movups xmm1, xmmword ptr [rbp + 0xc0]
14589aca9: 0f298df0010000 movaps xmmword ptr [rbp + 0x1f0], xmm1
14589acb0: 0f2985e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm0
14589acb7: eb18 jmp 0x14589acd1
14589acb9: 48c785e0010000ffffffff mov qword ptr [rbp + 0x1e0], 0xffffffffffffffff
14589acc4: 488d8db8000000 lea rcx, [rbp + 0xb8]
14589accb: e860d43000 call 0x145ba8130
14589acd0: 90 nop
14589acd1: 488b9518020000 mov rdx, qword ptr [rbp + 0x218]
14589acd8: 4885d2 test rdx, rdx
14589acdb: 7412 je 0x14589acef
14589acdd: 41b801000000 mov r8d, 1
14589ace3: 488b8d10020000 mov rcx, qword ptr [rbp + 0x210]
14589acea: e8e17476fa call 0x1400021d0
14589acef: 4883bde0010000ff cmp qword ptr [rbp + 0x1e0], -1
14589acf7: 0f84bf000000 je 0x14589adbc
14589acfd: f30f1007 movss xmm0, dword ptr [rdi]
14589ad01: f30f104f04 movss xmm1, dword ptr [rdi + 4]
14589ad06: f30f114c2428 movss dword ptr [rsp + 0x28], xmm1
14589ad0c: f30f11442420 movss dword ptr [rsp + 0x20], xmm0
14589ad12: c744243001000000 mov dword ptr [rsp + 0x30], 1
14589ad1a: 488d8db0000000 lea rcx, [rbp + 0xb0]
14589ad21: 488d95e0010000 lea rdx, [rbp + 0x1e0]
14589ad28: 4d89f8 mov r8, r15
14589ad2b: 4d89f1 mov r9, r14
14589ad2e: e8fd592a00 call 0x145b40730
14589ad33: 90 nop
14589ad34: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
14589ad3b: 4883f8ff cmp rax, -1
14589ad3f: 746e je 0x14589adaf
14589ad41: 488b8db8000000 mov rcx, qword ptr [rbp + 0xb8]
14589ad48: 488b95c0000000 mov rdx, qword ptr [rbp + 0xc0]
14589ad4f: 488d1492 lea rdx, [rdx + rdx*4]
14589ad53: 48c1e204 shl rdx, 4
14589ad57: 4801ca add rdx, rcx
14589ad5a: 48898db0000000 mov qword ptr [rbp + 0xb0], rcx
14589ad61: 48898db8000000 mov qword ptr [rbp + 0xb8], rcx
14589ad68: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14589ad6f: 488995c8000000 mov qword ptr [rbp + 0xc8], rdx
14589ad76: 488d8db0010000 lea rcx, [rbp + 0x1b0]
14589ad7d: 488d95b0000000 lea rdx, [rbp + 0xb0]
14589ad84: e897ae1400 call 0x1459e5c20
14589ad89: 90 nop
14589ad8a: 0f1085b0010000 movups xmm0, xmmword ptr [rbp + 0x1b0]
14589ad91: 0f298590010000 movaps xmmword ptr [rbp + 0x190], xmm0
14589ad98: 488b85c0010000 mov rax, qword ptr [rbp + 0x1c0]
14589ad9f: 488985a0010000 mov qword ptr [rbp + 0x1a0], rax
14589ada6: 488b9598010000 mov rdx, qword ptr [rbp + 0x198]
14589adad: eb35 jmp 0x14589ade4
14589adaf: 488d8db8000000 lea rcx, [rbp + 0xb8]
14589adb6: e875d33000 call 0x145ba8130
14589adbb: 90 nop
14589adbc: 48c7859001000000000000 mov qword ptr [rbp + 0x190], 0
14589adc7: 48c7859801000008000000 mov qword ptr [rbp + 0x198], 8
14589add2: 48c785a001000000000000 mov qword ptr [rbp + 0x1a0], 0
14589addd: ba08000000 mov edx, 8
14589ade2: 31c0 xor eax, eax
14589ade4: 488d04c0 lea rax, [rax + rax*8]
14589ade8: 4c8d04c2 lea r8, [rdx + rax*8]
14589adec: c6852502000001 mov byte ptr [rbp + 0x225], 1
14589adf3: 488d4dc8 lea rcx, [rbp - 0x38]
14589adf7: e824541400 call 0x1459e0220
14589adfc: 90 nop
14589adfd: 4c8bb5a0010000 mov r14, qword ptr [rbp + 0x1a0]
14589ae04: 4c89b5c0000000 mov qword ptr [rbp + 0xc0], r14
14589ae0b: 0f288590010000 movaps xmm0, xmmword ptr [rbp + 0x190]
14589ae12: 0f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm0
14589ae19: f30f104708 movss xmm0, dword ptr [rdi + 8]
14589ae1e: 0f104dc8 movups xmm1, xmmword ptr [rbp - 0x38]
14589ae22: 0f118dc8000000 movups xmmword ptr [rbp + 0xc8], xmm1
14589ae29: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14589ae2d: 488985d8000000 mov qword ptr [rbp + 0xd8], rax
14589ae34: 48c785e0000000ffffffff mov qword ptr [rbp + 0xe0], 0xffffffffffffffff
14589ae3f: f30f118558010000 movss dword ptr [rbp + 0x158], xmm0
14589ae47: c6855c01000000 mov byte ptr [rbp + 0x15c], 0
14589ae4e: 48c78508010000ffffffff mov qword ptr [rbp + 0x108], 0xffffffffffffffff
14589ae59: 48c78530010000ffffffff mov qword ptr [rbp + 0x130], 0xffffffffffffffff
14589ae64: 4883bde0010000ff cmp qword ptr [rbp + 0x1e0], -1
14589ae6c: 0f848c000000 je 0x14589aefe
14589ae72: 4d85f6 test r14, r14
14589ae75: 0f849e070000 je 0x14589b619
14589ae7b: 488bb508030000 mov rsi, qword ptr [rbp + 0x308]
14589ae82: f30f10bd00030000 movss xmm7, dword ptr [rbp + 0x300]
14589ae8a: 4885f6 test rsi, rsi
14589ae8d: 0f8485000000 je 0x14589af18
14589ae93: 4c8bbdb8000000 mov r15, qword ptr [rbp + 0xb8]
14589ae9a: f30f117c2428 movss dword ptr [rsp + 0x28], xmm7
14589aea0: 48897c2420 mov qword ptr [rsp + 0x20], rdi
14589aea5: 488d8db0010000 lea rcx, [rbp + 0x1b0]
14589aeac: 488d95e0010000 lea rdx, [rbp + 0x1e0]
14589aeb3: 4d89f8 mov r8, r15
14589aeb6: 4d89f1 mov r9, r14
14589aeb9: e8f2390000 call 0x14589e8b0
14589aebe: 90 nop
14589aebf: 488b8510030000 mov rax, qword ptr [rbp + 0x310]
14589aec6: 488d8d08010000 lea rcx, [rbp + 0x108]
14589aecd: 488b95d0010000 mov rdx, qword ptr [rbp + 0x1d0]
14589aed4: 48895120 mov qword ptr [rcx + 0x20], rdx
14589aed8: 0f1085b0010000 movups xmm0, xmmword ptr [rbp + 0x1b0]
14589aedf: 0f108dc0010000 movups xmm1, xmmword ptr [rbp + 0x1c0]
14589aee6: 0f114910 movups xmmword ptr [rcx + 0x10], xmm1
14589aeea: 0f1101 movups xmmword ptr [rcx], xmm0
14589aeed: 488b0f mov rcx, qword ptr [rdi]
14589aef0: 48894d18 mov qword ptr [rbp + 0x18], rcx
14589aef4: 48897520 mov qword ptr [rbp + 0x20], rsi
14589aef8: 48894528 mov qword ptr [rbp + 0x28], rax
14589aefc: eb29 jmp 0x14589af27
14589aefe: 488d95b0000000 lea rdx, [rbp + 0xb0]
14589af05: 41b8b0000000 mov r8d, 0xb0
14589af0b: 4c89e1 mov rcx, r12
14589af0e: e888a23600 call 0x145c0519b
14589af13: e9b3070000 jmp 0x14589b6cb
14589af18: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14589af20: 4c8bbdb8000000 mov r15, qword ptr [rbp + 0xb8]
14589af27: 48895c2438 mov qword ptr [rsp + 0x38], rbx
14589af2c: 488d4518 lea rax, [rbp + 0x18]
14589af30: 4889442430 mov qword ptr [rsp + 0x30], rax
14589af35: f30f117c2428 movss dword ptr [rsp + 0x28], xmm7
14589af3b: 48897c2420 mov qword ptr [rsp + 0x20], rdi
14589af40: 488d8db0010000 lea rcx, [rbp + 0x1b0]
14589af47: 488d95e0010000 lea rdx, [rbp + 0x1e0]
14589af4e: 4d89f8 mov r8, r15
14589af51: 4d89f1 mov r9, r14
14589af54: e8d74f1000 call 0x14599ff30
14589af59: 90 nop
14589af5a: 488d85e0000000 lea rax, [rbp + 0xe0]
14589af61: 488b8dd0010000 mov rcx, qword ptr [rbp + 0x1d0]
14589af68: 48894820 mov qword ptr [rax + 0x20], rcx
14589af6c: 0f1085b0010000 movups xmm0, xmmword ptr [rbp + 0x1b0]
14589af73: 0f108dc0010000 movups xmm1, xmmword ptr [rbp + 0x1c0]
14589af7a: 0f114810 movups xmmword ptr [rax + 0x10], xmm1
14589af7e: 0f1100 movups xmmword ptr [rax], xmm0
14589af81: 4885f6 test rsi, rsi
14589af84: 0f858f060000 jne 0x14589b619
14589af8a: 488bb5b8000000 mov rsi, qword ptr [rbp + 0xb8]
14589af91: f20f1037 movsd xmm6, qword ptr [rdi]
14589af95: 0f28c7 movaps xmm0, xmm7
14589af98: f30f58c7 addss xmm0, xmm7
14589af9c: f30f58c0 addss xmm0, xmm0
14589afa0: e856a23600 call 0x145c051fb
14589afa5: f3480f2cc0 cvttss2si rax, xmm0
14589afaa: 4889c1 mov rcx, rax
14589afad: 48c1f93f sar rcx, 0x3f
14589afb1: 0f28c8 movaps xmm1, xmm0
14589afb4: f30f5c0d94695100 subss xmm1, dword ptr [rip + 0x516994]
14589afbc: f3480f2cd1 cvttss2si rdx, xmm1
14589afc1: 4821ca and rdx, rcx
14589afc4: 4809c2 or rdx, rax
14589afc7: 31c0 xor eax, eax
14589afc9: 0f57c9 xorps xmm1, xmm1
14589afcc: 0f2ec1 ucomiss xmm0, xmm1
14589afcf: 480f43c2 cmovae rax, rdx
14589afd3: 0f2e057a695100 ucomiss xmm0, dword ptr [rip + 0x51697a]
14589afda: 48c7c7ffffffff mov rdi, 0xffffffffffffffff
14589afe1: 480f46f8 cmovbe rdi, rax
14589afe5: 48c7857001000000000000 mov qword ptr [rbp + 0x170], 0
14589aff0: 48c7857801000004000000 mov qword ptr [rbp + 0x178], 4
14589affb: 48c7858001000000000000 mov qword ptr [rbp + 0x180], 0
14589b006: c6852602000001 mov byte ptr [rbp + 0x226], 1
14589b00d: e81e383100 call 0x145bae830
14589b012: 90 nop
14589b013: 80781001 cmp byte ptr [rax + 0x10], 1
14589b017: 4c89a5a8000000 mov qword ptr [rbp + 0xa8], r12
14589b01e: 0f85ec060000 jne 0x14589b710
14589b024: 488b08 mov rcx, qword ptr [rax]
14589b027: 488b5008 mov rdx, qword ptr [rax + 8]
14589b02b: f30f12c7 movsldup xmm0, xmm7
14589b02f: 0f5cf0 subps xmm6, xmm0
14589b032: 4c8d4101 lea r8, [rcx + 1]
14589b036: 4c8900 mov qword ptr [rax], r8
14589b039: 0f1005f0ee3501 movups xmm0, xmmword ptr [rip + 0x135eef0]
14589b040: 0f2945f0 movaps xmmword ptr [rbp - 0x10], xmm0
14589b044: 0f1005d5ee3501 movups xmm0, xmmword ptr [rip + 0x135eed5]
14589b04b: 0f2945e0 movaps xmmword ptr [rbp - 0x20], xmm0
14589b04f: 48894d00 mov qword ptr [rbp], rcx
14589b053: 48895508 mov qword ptr [rbp + 8], rdx
14589b057: 4b8d04f6 lea rax, [r14 + r14*8]
14589b05b: 4c8d2cc6 lea r13, [rsi + rax*8]
14589b05f: 31c9 xor ecx, ecx
14589b061: 4c8d7de0 lea r15, [rbp - 0x20]
14589b065: 4c8da5b0010000 lea r12, [rbp + 0x1b0]
14589b06c: 488d9d60010000 lea rbx, [rbp + 0x160]
14589b073: 4885c9 test rcx, rcx
14589b076: 7418 je 0x14589b090
14589b078: 483b8d10020000 cmp rcx, qword ptr [rbp + 0x210]
14589b07f: 740f je 0x14589b090
14589b081: 4989ce mov r14, rcx
14589b084: eb32 jmp 0x14589b0b8
14589b086: 662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589b090: 4c39ee cmp rsi, r13
14589b093: 0f846a020000 je 0x14589b303
14589b099: 488b4640 mov rax, qword ptr [rsi + 0x40]
14589b09d: 4883c648 add rsi, 0x48
14589b0a1: 4885c0 test rax, rax
14589b0a4: 74ea je 0x14589b090
14589b0a6: 4c8b76f0 mov r14, qword ptr [rsi - 0x10]
14589b0aa: 486bc038 imul rax, rax, 0x38
14589b0ae: 4c01f0 add rax, r14
14589b0b1: 48898510020000 mov qword ptr [rbp + 0x210], rax
14589b0b8: 418b5630 mov edx, dword ptr [r14 + 0x30]
14589b0bc: c6852702000001 mov byte ptr [rbp + 0x227], 1
14589b0c3: 4c89f9 mov rcx, r15
14589b0c6: e8c5400f00 call 0x14598f190
14589b0cb: 90 nop
14589b0cc: 498d4e38 lea rcx, [r14 + 0x38]
14589b0d0: 84c0 test al, al
14589b0d2: 759f jne 0x14589b073
14589b0d4: 48898d08020000 mov qword ptr [rbp + 0x208], rcx
14589b0db: 4d8b4608 mov r8, qword ptr [r14 + 8]
14589b0df: 4d8b4e10 mov r9, qword ptr [r14 + 0x10]
14589b0e3: c6852702000001 mov byte ptr [rbp + 0x227], 1
14589b0ea: 4c89e1 mov rcx, r12
14589b0ed: 488d95e0010000 lea rdx, [rbp + 0x1e0]
14589b0f4: e8f72d2700 call 0x145b0def0
14589b0f9: 90 nop
14589b0fa: 4883bdb0010000ff cmp qword ptr [rbp + 0x1b0], -1
14589b102: 0f84db010000 je 0x14589b2e3
14589b108: 0f1085b0010000 movups xmm0, xmmword ptr [rbp + 0x1b0]
14589b10f: 0f108dc0010000 movups xmm1, xmmword ptr [rbp + 0x1c0]
14589b116: 0f1095d0010000 movups xmm2, xmmword ptr [rbp + 0x1d0]
14589b11d: 0f295550 movaps xmmword ptr [rbp + 0x50], xmm2
14589b121: 0f294d40 movaps xmmword ptr [rbp + 0x40], xmm1
14589b125: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
14589b129: 418b4620 mov eax, dword ptr [r14 + 0x20]
14589b12d: 8985a0000000 mov dword ptr [rbp + 0xa0], eax
14589b133: 498b4618 mov rax, qword ptr [r14 + 0x18]
14589b137: 48898598000000 mov qword ptr [rbp + 0x98], rax
14589b13e: 418b462c mov eax, dword ptr [r14 + 0x2c]
14589b142: 898568010000 mov dword ptr [rbp + 0x168], eax
14589b148: 498b4624 mov rax, qword ptr [r14 + 0x24]
14589b14c: 48898560010000 mov qword ptr [rbp + 0x160], rax
14589b153: c74424200000803f mov dword ptr [rsp + 0x20], 0x3f800000
14589b15b: 4c89e1 mov rcx, r12
14589b15e: 488d5530 lea rdx, [rbp + 0x30]
14589b162: 4c8d8598000000 lea r8, [rbp + 0x98]
14589b169: 4989d9 mov r9, rbx
14589b16c: e84f691100 call 0x1459b1ac0
14589b171: 90 nop
14589b172: 4c8b6550 mov r12, qword ptr [rbp + 0x50]
14589b176: 48b8abaaaaaaaaaaaaaa movabs rax, 0xaaaaaaaaaaaaaaab
14589b180: 48f76558 mul qword ptr [rbp + 0x58]
14589b184: 48d1ea shr rdx, 1
14589b187: 4c8d3c52 lea r15, [rdx + rdx*2]
14589b18b: 488b8db8010000 mov rcx, qword ptr [rbp + 0x1b8]
14589b192: 4c8bb5c0010000 mov r14, qword ptr [rbp + 0x1c0]
14589b199: 48898d18020000 mov qword ptr [rbp + 0x218], rcx
14589b1a0: 4983ef03 sub r15, 3
14589b1a4: 0f82c7000000 jb 0x14589b271
14589b1aa: 660f1f440000 nop word ptr [rax + rax]
14589b1b0: 418b0c24 mov ecx, dword ptr [r12]
14589b1b4: 4939ce cmp r14, rcx
14589b1b7: 0f869d050000 jbe 0x14589b75a
14589b1bd: 488d0449 lea rax, [rcx + rcx*2]
14589b1c1: 488b9518020000 mov rdx, qword ptr [rbp + 0x218]
14589b1c8: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
14589b1cc: 898d90000000 mov dword ptr [rbp + 0x90], ecx
14589b1d2: 488b0482 mov rax, qword ptr [rdx + rax*4]
14589b1d6: 48898588000000 mov qword ptr [rbp + 0x88], rax
14589b1dd: 418b4c2404 mov ecx, dword ptr [r12 + 4]
14589b1e2: 4939ce cmp r14, rcx
14589b1e5: 0f865d050000 jbe 0x14589b748
14589b1eb: 488d0449 lea rax, [rcx + rcx*2]
14589b1ef: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
14589b1f3: 898d80000000 mov dword ptr [rbp + 0x80], ecx
14589b1f9: 488b0482 mov rax, qword ptr [rdx + rax*4]
14589b1fd: 48894578 mov qword ptr [rbp + 0x78], rax
14589b201: 418b4c2408 mov ecx, dword ptr [r12 + 8]
14589b206: 4939ce cmp r14, rcx
14589b209: 0f8627050000 jbe 0x14589b736
14589b20f: 488d0449 lea rax, [rcx + rcx*2]
14589b213: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
14589b217: 894d70 mov dword ptr [rbp + 0x70], ecx
14589b21a: 488b0482 mov rax, qword ptr [rdx + rax*4]
14589b21e: 48894568 mov qword ptr [rbp + 0x68], rax
14589b222: 0f13b560010000 movlps qword ptr [rbp + 0x160], xmm6
14589b229: 4889bd68010000 mov qword ptr [rbp + 0x168], rdi
14589b230: 488d4568 lea rax, [rbp + 0x68]
14589b234: 4889442420 mov qword ptr [rsp + 0x20], rax
14589b239: c7442428ffff7f7f mov dword ptr [rsp + 0x28], 0x7f7fffff
14589b241: 488d8d70010000 lea rcx, [rbp + 0x170]
14589b248: 4889da mov rdx, rbx
14589b24b: 4c8d8588000000 lea r8, [rbp + 0x88]
14589b252: 4c8d4d78 lea r9, [rbp + 0x78]
14589b256: e855a80000 call 0x1458a5ab0
14589b25b: 90 nop
14589b25c: 4983c40c add r12, 0xc
14589b260: 488b8d18020000 mov rcx, qword ptr [rbp + 0x218]
14589b267: 4983ef03 sub r15, 3
14589b26b: 0f833fffffff jae 0x14589b1b0
14589b271: 488b85b0010000 mov rax, qword ptr [rbp + 0x1b0]
14589b278: 4885c0 test rax, rax
14589b27b: 7413 je 0x14589b290
14589b27d: 48c1e002 shl rax, 2
14589b281: 488d1440 lea rdx, [rax + rax*2]
14589b285: 41b804000000 mov r8d, 4
14589b28b: e8406f76fa call 0x1400021d0
14589b290: 488b4530 mov rax, qword ptr [rbp + 0x30]
14589b294: 4885c0 test rax, rax
14589b297: 4c8d7de0 lea r15, [rbp - 0x20]
14589b29b: 4c8da5b0010000 lea r12, [rbp + 0x1b0]
14589b2a2: 7417 je 0x14589b2bb
14589b2a4: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
14589b2a8: 48c1e002 shl rax, 2
14589b2ac: 488d1440 lea rdx, [rax + rax*2]
14589b2b0: 41b804000000 mov r8d, 4
14589b2b6: e8156f76fa call 0x1400021d0
14589b2bb: 488b5548 mov rdx, qword ptr [rbp + 0x48]
14589b2bf: 4885d2 test rdx, rdx
14589b2c2: 7413 je 0x14589b2d7
14589b2c4: 488b4d50 mov rcx, qword ptr [rbp + 0x50]
14589b2c8: 48c1e202 shl rdx, 2
14589b2cc: 41b804000000 mov r8d, 4
14589b2d2: e8f96e76fa call 0x1400021d0
14589b2d7: 488b8d08020000 mov rcx, qword ptr [rbp + 0x208]
14589b2de: e990fdffff jmp 0x14589b073
14589b2e3: c6852702000001 mov byte ptr [rbp + 0x227], 1
14589b2ea: 488d8db8010000 lea rcx, [rbp + 0x1b8]
14589b2f1: e83ace3000 call 0x145ba8130
14589b2f6: 90 nop
14589b2f7: 488b8d08020000 mov rcx, qword ptr [rbp + 0x208]
14589b2fe: e970fdffff jmp 0x14589b073
14589b303: 4989ff mov r15, rdi
14589b306: 4c0fafff imul r15, rdi
14589b30a: 4a8d1cbd00000000 lea rbx, [r15*4]
14589b312: 4c89f8 mov rax, r15
14589b315: 48c1e83e shr rax, 0x3e
14589b319: 0f95c0 setne al
14589b31c: 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
14589b326: 4839cb cmp rbx, rcx
14589b329: 0f97c1 seta cl
14589b32c: 08c1 or cl, al
14589b32e: 741b je 0x14589b34b
14589b330: 4531f6 xor r14d, r14d
14589b333: c6852702000001 mov byte ptr [rbp + 0x227], 1
14589b33a: 4c89f1 mov rcx, r14
14589b33d: 4889da mov rdx, rbx
14589b340: e8668f5000 call 0x145da42ab
14589b345: 90 nop
14589b346: e943040000 jmp 0x14589b78e
14589b34b: 4885db test rbx, rbx
14589b34e: 7444 je 0x14589b394
14589b350: e8ab6e76fa call 0x140002200
14589b355: 41be04000000 mov r14d, 4
14589b35b: ba04000000 mov edx, 4
14589b360: 4889d9 mov rcx, rbx
14589b363: e8586e76fa call 0x1400021c0
14589b368: 4885c0 test rax, rax
14589b36b: 74c6 je 0x14589b333
14589b36d: 4d89fb mov r11, r15
14589b370: 4983ff02 cmp r15, 2
14589b374: 48898518020000 mov qword ptr [rbp + 0x218], rax
14589b37b: 4c899d10020000 mov qword ptr [rbp + 0x210], r11
14589b382: 722c jb 0x14589b3b0
14589b384: 4983ff09 cmp r15, 9
14589b388: 7330 jae 0x14589b3ba
14589b38a: b901000000 mov ecx, 1
14589b38f: 4989c2 mov r10, rax
14589b392: eb65 jmp 0x14589b3f9
14589b394: b804000000 mov eax, 4
14589b399: 4531db xor r11d, r11d
14589b39c: 4983ff02 cmp r15, 2
14589b3a0: 48898518020000 mov qword ptr [rbp + 0x218], rax
14589b3a7: 4c899d10020000 mov qword ptr [rbp + 0x210], r11
14589b3ae: 73d4 jae 0x14589b384
14589b3b0: 4989c2 mov r10, rax
14589b3b3: 4d85ff test r15, r15
14589b3b6: 7558 jne 0x14589b410
14589b3b8: eb5d jmp 0x14589b417
14589b3ba: 498d57ff lea rdx, [r15 - 1]
14589b3be: 4989d0 mov r8, rdx
14589b3c1: 4983e0f8 and r8, 0xfffffffffffffff8
14589b3c5: 4e8d1480 lea r10, [rax + r8*4]
14589b3c9: 498d4801 lea rcx, [r8 + 1]
14589b3cd: 4531c9 xor r9d, r9d
14589b3d0: 0f280529e67e00 movaps xmm0, xmmword ptr [rip + 0x7ee629]
14589b3d7: 660f1f840000000000 nop word ptr [rax + rax]
14589b3e0: 420f110488 movups xmmword ptr [rax + r9*4], xmm0
14589b3e5: 420f11448810 movups xmmword ptr [rax + r9*4 + 0x10], xmm0
14589b3eb: 4983c108 add r9, 8
14589b3ef: 4d39c8 cmp r8, r9
14589b3f2: 75ec jne 0x14589b3e0
14589b3f4: 4c39c2 cmp rdx, r8
14589b3f7: 7417 je 0x14589b410
14589b3f9: 4c89fa mov rdx, r15
14589b3fc: 4829ca sub rdx, rcx
14589b3ff: 90 nop
14589b400: 41c7020000c07f mov dword ptr [r10], 0x7fc00000
14589b407: 4983c204 add r10, 4
14589b40b: 48ffca dec rdx
14589b40e: 75f0 jne 0x14589b400
14589b410: 41c7020000c07f mov dword ptr [r10], 0x7fc00000
14589b417: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14589b41e: 48898508020000 mov qword ptr [rbp + 0x208], rax
14589b425: 4c8bad78010000 mov r13, qword ptr [rbp + 0x178]
14589b42c: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14589b433: 4c8d24c500000000 lea r12, [rax*8]
14589b43b: 4d01ec add r12, r13
14589b43e: f30f16fe movshdup xmm7, xmm6
14589b442: 31f6 xor esi, esi
14589b444: f3440f100527ce5000 movss xmm8, dword ptr [rip + 0x50ce27]
14589b44d: 488d9db0000000 lea rbx, [rbp + 0xb0]
14589b454: f3440f100d2bd05000 movss xmm9, dword ptr [rip + 0x50d02b]
14589b45d: f3440f10152ad05000 movss xmm10, dword ptr [rip + 0x50d02a]
14589b466: 4c89ad88010000 mov qword ptr [rbp + 0x188], r13
14589b46d: 0f1f00 nop dword ptr [rax]
14589b470: 4d39e5 cmp r13, r12
14589b473: 0f84c5000000 je 0x14589b53e
14589b479: 4885ff test rdi, rdi
14589b47c: 0f84ea020000 je 0x14589b76c
14589b482: 458b7500 mov r14d, dword ptr [r13]
14589b486: f3450f105d04 movss xmm11, dword ptr [r13 + 4]
14589b48c: 4939fe cmp r14, rdi
14589b48f: 720f jb 0x14589b4a0
14589b491: 4489f0 mov eax, r14d
14589b494: 31d2 xor edx, edx
14589b496: f7f7 div edi
14589b498: eb0b jmp 0x14589b4a5
14589b49a: 660f1f440000 nop word ptr [rax + rax]
14589b4a0: 31c0 xor eax, eax
14589b4a2: 4c89f2 mov rdx, r14
14589b4a5: 0f57c9 xorps xmm1, xmm1
14589b4a8: f3480f2aca cvtsi2ss xmm1, rdx
14589b4ad: f3410f58c8 addss xmm1, xmm8
14589b4b2: f3410f59c8 mulss xmm1, xmm8
14589b4b7: 0f57d2 xorps xmm2, xmm2
14589b4ba: f3480f2ad0 cvtsi2ss xmm2, rax
14589b4bf: f30f58ce addss xmm1, xmm6
14589b4c3: f3410f58d0 addss xmm2, xmm8
14589b4c8: f3410f59d0 mulss xmm2, xmm8
14589b4cd: f30f58d7 addss xmm2, xmm7
14589b4d1: 4889d9 mov rcx, rbx
14589b4d4: e857ecffff call 0x14589a130
14589b4d9: 90 nop
14589b4da: 4983c508 add r13, 8
14589b4de: 83f801 cmp eax, 1
14589b4e1: 758d jne 0x14589b470
14589b4e3: 0f28c8 movaps xmm1, xmm0
14589b4e6: f3410f58c9 addss xmm1, xmm9
14589b4eb: 440f2ed9 ucomiss xmm11, xmm1
14589b4ef: f3410f58c2 addss xmm0, xmm10
14589b4f4: 0f8676ffffff jbe 0x14589b470
14589b4fa: 410f2ec3 ucomiss xmm0, xmm11
14589b4fe: 0f826cffffff jb 0x14589b470
14589b504: 4d39f7 cmp r15, r14
14589b507: 0f866e020000 jbe 0x14589b77b
14589b50d: 488b8518020000 mov rax, qword ptr [rbp + 0x218]
14589b514: f3420f1004b0 movss xmm0, dword ptr [rax + r14*4]
14589b51a: 0f2ec0 ucomiss xmm0, xmm0
14589b51d: 7a0a jp 0x14589b529
14589b51f: 440f2ed8 ucomiss xmm11, xmm0
14589b523: 0f8647ffffff jbe 0x14589b470
14589b529: 488b8518020000 mov rax, qword ptr [rbp + 0x218]
14589b530: f3460f111cb0 movss dword ptr [rax + r14*4], xmm11
14589b536: 40b601 mov sil, 1
14589b539: e932ffffff jmp 0x14589b470
14589b53e: 488b9508020000 mov rdx, qword ptr [rbp + 0x208]
14589b545: 4885d2 test rdx, rdx
14589b548: 7416 je 0x14589b560
14589b54a: 48c1e203 shl rdx, 3
14589b54e: 41b804000000 mov r8d, 4
14589b554: 488b8d88010000 mov rcx, qword ptr [rbp + 0x188]
14589b55b: e8706c76fa call 0x1400021d0
14589b560: 40f6c601 test sil, 1
14589b564: 4c8ba5a8000000 mov r12, qword ptr [rbp + 0xa8]
14589b56b: 488b9d18020000 mov rbx, qword ptr [rbp + 0x218]
14589b572: 488b9510020000 mov rdx, qword ptr [rbp + 0x210]
14589b579: 7405 je 0x14589b580
14589b57b: 4889d6 mov rsi, rdx
14589b57e: eb1e jmp 0x14589b59e
14589b580: 48c7c6ffffffff mov rsi, 0xffffffffffffffff
14589b587: 4885d2 test rdx, rdx
14589b58a: 7412 je 0x14589b59e
14589b58c: 48c1e202 shl rdx, 2
14589b590: 41b804000000 mov r8d, 4
14589b596: 4889d9 mov rcx, rbx
14589b599: e8326c76fa call 0x1400021d0
14589b59e: 488b55e8 mov rdx, qword ptr [rbp - 0x18]
14589b5a2: 4885d2 test rdx, rdx
14589b5a5: 7427 je 0x14589b5ce
14589b5a7: 488d049513000000 lea rax, [rdx*4 + 0x13]
14589b5af: 4883e0f0 and rax, 0xfffffffffffffff0
14589b5b3: 4801c2 add rdx, rax
14589b5b6: 4883c211 add rdx, 0x11
14589b5ba: 7412 je 0x14589b5ce
14589b5bc: 488b4de0 mov rcx, qword ptr [rbp - 0x20]
14589b5c0: 4829c1 sub rcx, rax
14589b5c3: 41b810000000 mov r8d, 0x10
14589b5c9: e8026c76fa call 0x1400021d0
14589b5ce: 488b9530010000 mov rdx, qword ptr [rbp + 0x130]
14589b5d5: 4883faff cmp rdx, -1
14589b5d9: 741b je 0x14589b5f6
14589b5db: 4885d2 test rdx, rdx
14589b5de: 7416 je 0x14589b5f6
14589b5e0: 488b8d38010000 mov rcx, qword ptr [rbp + 0x138]
14589b5e7: 48c1e202 shl rdx, 2
14589b5eb: 41b804000000 mov r8d, 4
14589b5f1: e8da6b76fa call 0x1400021d0
14589b5f6: 4889b530010000 mov qword ptr [rbp + 0x130], rsi
14589b5fd: 48899d38010000 mov qword ptr [rbp + 0x138], rbx
14589b604: 4c89bd40010000 mov qword ptr [rbp + 0x140], r15
14589b60b: 4889bd48010000 mov qword ptr [rbp + 0x148], rdi
14589b612: 0f13b550010000 movlps qword ptr [rbp + 0x150], xmm6
14589b619: 488bbde0010000 mov rdi, qword ptr [rbp + 0x1e0]
14589b620: 488d95b0000000 lea rdx, [rbp + 0xb0]
14589b627: 41b8b0000000 mov r8d, 0xb0
14589b62d: 4c89e1 mov rcx, r12
14589b630: e8669b3600 call 0x145c0519b
14589b635: 4883ffff cmp rdi, -1
14589b639: 0f848c000000 je 0x14589b6cb
14589b63f: 488bb5f0010000 mov rsi, qword ptr [rbp + 0x1f0]
14589b646: 4885f6 test rsi, rsi
14589b649: 7462 je 0x14589b6ad
14589b64b: 488bbde8010000 mov rdi, qword ptr [rbp + 0x1e8]
14589b652: 4889b510020000 mov qword ptr [rbp + 0x210], rsi
14589b659: 48f7de neg rsi
14589b65c: b901000000 mov ecx, 1
14589b661: 4889bd08020000 mov qword ptr [rbp + 0x208], rdi
14589b668: eb21 jmp 0x14589b68b
14589b66a: 660f1f440000 nop word ptr [rax + rax]
14589b670: 488b8d18020000 mov rcx, qword ptr [rbp + 0x218]
14589b677: 488d040e lea rax, [rsi + rcx]
14589b67b: 48ffc0 inc rax
14589b67e: 48ffc1 inc rcx
14589b681: 4883c708 add rdi, 8
14589b685: 4883f801 cmp rax, 1
14589b689: 741b je 0x14589b6a6
14589b68b: 48898d18020000 mov qword ptr [rbp + 0x218], rcx
14589b692: 488b07 mov rax, qword ptr [rdi]
14589b695: f048ff08 lock dec qword ptr [rax]
14589b699: 75d5 jne 0x14589b670
14589b69b: 4889f9 mov rcx, rdi
14589b69e: e85dff1d00 call 0x145a7b600
14589b6a3: 90 nop
14589b6a4: ebca jmp 0x14589b670
14589b6a6: 488bbde0010000 mov rdi, qword ptr [rbp + 0x1e0]
14589b6ad: 4885ff test rdi, rdi
14589b6b0: 7419 je 0x14589b6cb
14589b6b2: 488b8de8010000 mov rcx, qword ptr [rbp + 0x1e8]
14589b6b9: 48c1e703 shl rdi, 3
14589b6bd: 41b808000000 mov r8d, 8
14589b6c3: 4889fa mov rdx, rdi
14589b6c6: e8056b76fa call 0x1400021d0
14589b6cb: 4c89e0 mov rax, r12
14589b6ce: 0f28b530020000 movaps xmm6, xmmword ptr [rbp + 0x230]
14589b6d5: 0f28bd40020000 movaps xmm7, xmmword ptr [rbp + 0x240]
14589b6dc: 440f288550020000 movaps xmm8, xmmword ptr [rbp + 0x250]
14589b6e4: 440f288d60020000 movaps xmm9, xmmword ptr [rbp + 0x260]
14589b6ec: 440f289570020000 movaps xmm10, xmmword ptr [rbp + 0x270]
14589b6f4: 440f289d80020000 movaps xmm11, xmmword ptr [rbp + 0x280]
14589b6fc: 4881c418030000 add rsp, 0x318
14589b703: 5b pop rbx
14589b704: 5f pop rdi
14589b705: 5e pop rsi
14589b706: 415c pop r12
14589b708: 415d pop r13
14589b70a: 415e pop r14
14589b70c: 415f pop r15
14589b70e: 5d pop rbp
14589b70f: c3 ret
14589b710: c6852602000001 mov byte ptr [rbp + 0x226], 1
14589b717: 4889c3 mov rbx, rax
14589b71a: e8316d3200 call 0x145bc2450
14589b71f: 90 nop
14589b720: 4889c1 mov rcx, rax
14589b723: 4889d8 mov rax, rbx
14589b726: 48890b mov qword ptr [rbx], rcx
14589b729: 48895308 mov qword ptr [rbx + 8], rdx
14589b72d: c6431001 mov byte ptr [rbx + 0x10], 1
14589b731: e9f5f8ffff jmp 0x14589b02b
14589b736: 4c8d058be83501 lea r8, [rip + 0x135e88b]
14589b73d: 4c89f2 mov rdx, r14
14589b740: e8fe8e5000 call 0x145da4643
14589b745: 90 nop
14589b746: eb46 jmp 0x14589b78e
14589b748: 4c8d0561e83501 lea r8, [rip + 0x135e861]
14589b74f: 4c89f2 mov rdx, r14
14589b752: e8ec8e5000 call 0x145da4643
14589b757: 90 nop
14589b758: eb34 jmp 0x14589b78e
14589b75a: 4c8d0537e83501 lea r8, [rip + 0x135e837]
14589b761: 4c89f2 mov rdx, r14
14589b764: e8da8e5000 call 0x145da4643
14589b769: 90 nop
14589b76a: eb22 jmp 0x14589b78e
14589b76c: 488d0df5e73501 lea rcx, [rip + 0x135e7f5]
14589b773: e8c8915000 call 0x145da4940
14589b778: 90 nop
14589b779: eb13 jmp 0x14589b78e
14589b77b: 4c8d05fee73501 lea r8, [rip + 0x135e7fe]
14589b782: 4c89f1 mov rcx, r14
14589b785: 4c89fa mov rdx, r15
14589b788: e8b68e5000 call 0x145da4643
14589b78d: 90 nop
14589b78e: 0f0b ud2
