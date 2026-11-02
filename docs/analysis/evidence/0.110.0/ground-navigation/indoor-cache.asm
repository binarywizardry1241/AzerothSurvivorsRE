14589e8b0: 55 push rbp
14589e8b1: 4157 push r15
14589e8b3: 4156 push r14
14589e8b5: 4155 push r13
14589e8b7: 4154 push r12
14589e8b9: 56 push rsi
14589e8ba: 57 push rdi
14589e8bb: 53 push rbx
14589e8bc: 4881ecc8020000 sub rsp, 0x2c8
14589e8c3: 488dac2480000000 lea rbp, [rsp + 0x80]
14589e8cb: 440f29bd30020000 movaps xmmword ptr [rbp + 0x230], xmm15
14589e8d3: 440f29b520020000 movaps xmmword ptr [rbp + 0x220], xmm14
14589e8db: 440f29ad10020000 movaps xmmword ptr [rbp + 0x210], xmm13
14589e8e3: 440f29a500020000 movaps xmmword ptr [rbp + 0x200], xmm12
14589e8eb: 440f299df0010000 movaps xmmword ptr [rbp + 0x1f0], xmm11
14589e8f3: 440f2995e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm10
14589e8fb: 440f298dd0010000 movaps xmmword ptr [rbp + 0x1d0], xmm9
14589e903: 440f2985c0010000 movaps xmmword ptr [rbp + 0x1c0], xmm8
14589e90b: 0f29bdb0010000 movaps xmmword ptr [rbp + 0x1b0], xmm7
14589e912: 0f29b5a0010000 movaps xmmword ptr [rbp + 0x1a0], xmm6
14589e919: 48c78598010000feffffff mov qword ptr [rbp + 0x198], 0xfffffffffffffffe
14589e924: 4d89ce mov r14, r9
14589e927: 4c898588010000 mov qword ptr [rbp + 0x188], r8
14589e92e: 4889d6 mov rsi, rdx
14589e931: 48898dd8000000 mov qword ptr [rbp + 0xd8], rcx
14589e938: 488bbdb0020000 mov rdi, qword ptr [rbp + 0x2b0]
14589e93f: f30f10b5b8020000 movss xmm6, dword ptr [rbp + 0x2b8]
14589e947: 0f28c6 movaps xmm0, xmm6
14589e94a: f30f58c6 addss xmm0, xmm6
14589e94e: f30f58c0 addss xmm0, xmm0
14589e952: e8a4683600 call 0x145c051fb
14589e957: f3480f2cc0 cvttss2si rax, xmm0
14589e95c: 4889c1 mov rcx, rax
14589e95f: 48c1f93f sar rcx, 0x3f
14589e963: 0f28c8 movaps xmm1, xmm0
14589e966: f30f5c0de22f5100 subss xmm1, dword ptr [rip + 0x512fe2]
14589e96e: f3480f2cd1 cvttss2si rdx, xmm1
14589e973: 4821ca and rdx, rcx
14589e976: 4809c2 or rdx, rax
14589e979: 31c0 xor eax, eax
14589e97b: 0f57c9 xorps xmm1, xmm1
14589e97e: 0f2ec1 ucomiss xmm0, xmm1
14589e981: 480f43c2 cmovae rax, rdx
14589e985: 0f2e05c82f5100 ucomiss xmm0, dword ptr [rip + 0x512fc8]
14589e98c: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
14589e993: 480f46c8 cmovbe rcx, rax
14589e997: 48898d80010000 mov qword ptr [rbp + 0x180], rcx
14589e99e: f20f103f movsd xmm7, qword ptr [rdi]
14589e9a2: f30f104708 movss xmm0, dword ptr [rdi + 8]
14589e9a7: f30f118574010000 movss dword ptr [rbp + 0x174], xmm0
14589e9af: 48c7854801000000000000 mov qword ptr [rbp + 0x148], 0
14589e9ba: 48c7855001000004000000 mov qword ptr [rbp + 0x150], 4
14589e9c5: 48c7855801000000000000 mov qword ptr [rbp + 0x158], 0
14589e9d0: e85bfe3000 call 0x145bae830
14589e9d5: 90 nop
14589e9d6: 4889c3 mov rbx, rax
14589e9d9: 80781001 cmp byte ptr [rax + 0x10], 1
14589e9dd: 0f85a0120000 jne 0x14589fc83
14589e9e3: 488b03 mov rax, qword ptr [rbx]
14589e9e6: 488b5308 mov rdx, qword ptr [rbx + 8]
14589e9ea: f30f12c6 movsldup xmm0, xmm6
14589e9ee: 0f29bdb0000000 movaps xmmword ptr [rbp + 0xb0], xmm7
14589e9f5: 0f5cf8 subps xmm7, xmm0
14589e9f8: f3440f1015cfda5000 movss xmm10, dword ptr [rip + 0x50dacf]
14589ea01: f3440f589574010000 addss xmm10, dword ptr [rbp + 0x174]
14589ea0a: 488d4801 lea rcx, [rax + 1]
14589ea0e: 48890b mov qword ptr [rbx], rcx
14589ea11: 0f100518b53501 movups xmm0, xmmword ptr [rip + 0x135b518]
14589ea18: 0f294540 movaps xmmword ptr [rbp + 0x40], xmm0
14589ea1c: 0f1005fdb43501 movups xmm0, xmmword ptr [rip + 0x135b4fd]
14589ea23: 0f294530 movaps xmmword ptr [rbp + 0x30], xmm0
14589ea27: 48894550 mov qword ptr [rbp + 0x50], rax
14589ea2b: 48895558 mov qword ptr [rbp + 0x58], rdx
14589ea2f: 4b8d04f6 lea rax, [r14 + r14*8]
14589ea33: 488bbd88010000 mov rdi, qword ptr [rbp + 0x188]
14589ea3a: 488d04c7 lea rax, [rdi + rax*8]
14589ea3e: 48898528010000 mov qword ptr [rbp + 0x128], rax
14589ea45: 31c9 xor ecx, ecx
14589ea47: 4c8d7d30 lea r15, [rbp + 0x30]
14589ea4b: 4c8d6db8 lea r13, [rbp - 0x48]
14589ea4f: 4c8db5c0000000 lea r14, [rbp + 0xc0]
14589ea56: 4c8d6578 lea r12, [rbp + 0x78]
14589ea5a: 4885c9 test rcx, rcx
14589ea5d: 7411 je 0x14589ea70
14589ea5f: 483b8d78010000 cmp rcx, qword ptr [rbp + 0x178]
14589ea66: 7408 je 0x14589ea70
14589ea68: 4889cb mov rbx, rcx
14589ea6b: eb2f jmp 0x14589ea9c
14589ea6d: 0f1f00 nop dword ptr [rax]
14589ea70: 483bbd28010000 cmp rdi, qword ptr [rbp + 0x128]
14589ea77: 0f846b020000 je 0x14589ece8
14589ea7d: 488b4740 mov rax, qword ptr [rdi + 0x40]
14589ea81: 4883c748 add rdi, 0x48
14589ea85: 4885c0 test rax, rax
14589ea88: 74e6 je 0x14589ea70
14589ea8a: 488b5ff0 mov rbx, qword ptr [rdi - 0x10]
14589ea8e: 486bc038 imul rax, rax, 0x38
14589ea92: 4801d8 add rax, rbx
14589ea95: 48898578010000 mov qword ptr [rbp + 0x178], rax
14589ea9c: 8b5330 mov edx, dword ptr [rbx + 0x30]
14589ea9f: 4c89f9 mov rcx, r15
14589eaa2: e8e9060f00 call 0x14598f190
14589eaa7: 90 nop
14589eaa8: 488d4b38 lea rcx, [rbx + 0x38]
14589eaac: 84c0 test al, al
14589eaae: 75aa jne 0x14589ea5a
14589eab0: 48898d30010000 mov qword ptr [rbp + 0x130], rcx
14589eab7: 4c8b4308 mov r8, qword ptr [rbx + 8]
14589eabb: 4c8b4b10 mov r9, qword ptr [rbx + 0x10]
14589eabf: 4c89e9 mov rcx, r13
14589eac2: 4889f2 mov rdx, rsi
14589eac5: e826f42600 call 0x145b0def0
14589eaca: 90 nop
14589eacb: 48837db8ff cmp qword ptr [rbp - 0x48], -1
14589ead0: 0f84fc010000 je 0x14589ecd2
14589ead6: 4889b538010000 mov qword ptr [rbp + 0x138], rsi
14589eadd: 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
14589eae1: 0f104dc8 movups xmm1, xmmword ptr [rbp - 0x38]
14589eae5: 0f1055d8 movups xmm2, xmmword ptr [rbp - 0x28]
14589eae9: 0f299510010000 movaps xmmword ptr [rbp + 0x110], xmm2
14589eaf0: 0f298d00010000 movaps xmmword ptr [rbp + 0x100], xmm1
14589eaf7: 0f2985f0000000 movaps xmmword ptr [rbp + 0xf0], xmm0
14589eafe: 8b4320 mov eax, dword ptr [rbx + 0x20]
14589eb01: 8985a0000000 mov dword ptr [rbp + 0xa0], eax
14589eb07: 488b4318 mov rax, qword ptr [rbx + 0x18]
14589eb0b: 48898598000000 mov qword ptr [rbp + 0x98], rax
14589eb12: 8b432c mov eax, dword ptr [rbx + 0x2c]
14589eb15: 8985c8000000 mov dword ptr [rbp + 0xc8], eax
14589eb1b: 488b4324 mov rax, qword ptr [rbx + 0x24]
14589eb1f: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14589eb26: c74424200000803f mov dword ptr [rsp + 0x20], 0x3f800000
14589eb2e: 4c89ee mov rsi, r13
14589eb31: 4c89e9 mov rcx, r13
14589eb34: 488d95f0000000 lea rdx, [rbp + 0xf0]
14589eb3b: 4c8d8598000000 lea r8, [rbp + 0x98]
14589eb42: 4d89f1 mov r9, r14
14589eb45: e8762f1100 call 0x1459b1ac0
14589eb4a: 90 nop
14589eb4b: 4c8bad10010000 mov r13, qword ptr [rbp + 0x110]
14589eb52: 48b8abaaaaaaaaaaaaaa movabs rax, 0xaaaaaaaaaaaaaaab
14589eb5c: 48f7a518010000 mul qword ptr [rbp + 0x118]
14589eb63: 48d1ea shr rdx, 1
14589eb66: 4c8d3c52 lea r15, [rdx + rdx*2]
14589eb6a: 488b4dc0 mov rcx, qword ptr [rbp - 0x40]
14589eb6e: 488b5dc8 mov rbx, qword ptr [rbp - 0x38]
14589eb72: 48898d60010000 mov qword ptr [rbp + 0x160], rcx
14589eb79: 4983ef03 sub r15, 3
14589eb7d: 0f82d1000000 jb 0x14589ec54
14589eb83: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589eb90: 418b4d00 mov ecx, dword ptr [r13]
14589eb94: 4839cb cmp rbx, rcx
14589eb97: 0f8644110000 jbe 0x14589fce1
14589eb9d: 488d0449 lea rax, [rcx + rcx*2]
14589eba1: 488b9560010000 mov rdx, qword ptr [rbp + 0x160]
14589eba8: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
14589ebac: 898d90000000 mov dword ptr [rbp + 0x90], ecx
14589ebb2: 488b0482 mov rax, qword ptr [rdx + rax*4]
14589ebb6: 48898588000000 mov qword ptr [rbp + 0x88], rax
14589ebbd: 418b4d04 mov ecx, dword ptr [r13 + 4]
14589ebc1: 4839cb cmp rbx, rcx
14589ebc4: 0f8602110000 jbe 0x14589fccc
14589ebca: 488d0449 lea rax, [rcx + rcx*2]
14589ebce: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
14589ebd2: 898d80000000 mov dword ptr [rbp + 0x80], ecx
14589ebd8: 488b0482 mov rax, qword ptr [rdx + rax*4]
14589ebdc: 48894578 mov qword ptr [rbp + 0x78], rax
14589ebe0: 418b4d08 mov ecx, dword ptr [r13 + 8]
14589ebe4: 4839cb cmp rbx, rcx
14589ebe7: 0f86ca100000 jbe 0x14589fcb7
14589ebed: 488d0449 lea rax, [rcx + rcx*2]
14589ebf1: 8b4c8208 mov ecx, dword ptr [rdx + rax*4 + 8]
14589ebf5: 894d70 mov dword ptr [rbp + 0x70], ecx
14589ebf8: 488b0482 mov rax, qword ptr [rdx + rax*4]
14589ebfc: 48894568 mov qword ptr [rbp + 0x68], rax
14589ec00: 0f13bdc0000000 movlps qword ptr [rbp + 0xc0], xmm7
14589ec07: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14589ec0e: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
14589ec15: f3440f11542428 movss dword ptr [rsp + 0x28], xmm10
14589ec1c: 488d4568 lea rax, [rbp + 0x68]
14589ec20: 4889442420 mov qword ptr [rsp + 0x20], rax
14589ec25: 488d8d48010000 lea rcx, [rbp + 0x148]
14589ec2c: 4c89f2 mov rdx, r14
14589ec2f: 4c8d8588000000 lea r8, [rbp + 0x88]
14589ec36: 4d89e1 mov r9, r12
14589ec39: e8726e0000 call 0x1458a5ab0
14589ec3e: 90 nop
14589ec3f: 4983c50c add r13, 0xc
14589ec43: 488b8d60010000 mov rcx, qword ptr [rbp + 0x160]
14589ec4a: 4983ef03 sub r15, 3
14589ec4e: 0f833cffffff jae 0x14589eb90
14589ec54: 488b45b8 mov rax, qword ptr [rbp - 0x48]
14589ec58: 4885c0 test rax, rax
14589ec5b: 7413 je 0x14589ec70
14589ec5d: 48c1e002 shl rax, 2
14589ec61: 488d1440 lea rdx, [rax + rax*2]
14589ec65: 41b804000000 mov r8d, 4
14589ec6b: e8603576fa call 0x1400021d0
14589ec70: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
14589ec77: 4885c0 test rax, rax
14589ec7a: 4c8d7d30 lea r15, [rbp + 0x30]
14589ec7e: 4989f5 mov r13, rsi
14589ec81: 741a je 0x14589ec9d
14589ec83: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
14589ec8a: 48c1e002 shl rax, 2
14589ec8e: 488d1440 lea rdx, [rax + rax*2]
14589ec92: 41b804000000 mov r8d, 4
14589ec98: e8333576fa call 0x1400021d0
14589ec9d: 488b9508010000 mov rdx, qword ptr [rbp + 0x108]
14589eca4: 4885d2 test rdx, rdx
14589eca7: 488bb538010000 mov rsi, qword ptr [rbp + 0x138]
14589ecae: 7416 je 0x14589ecc6
14589ecb0: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14589ecb7: 48c1e202 shl rdx, 2
14589ecbb: 41b804000000 mov r8d, 4
14589ecc1: e80a3576fa call 0x1400021d0
14589ecc6: 488b8d30010000 mov rcx, qword ptr [rbp + 0x130]
14589eccd: e988fdffff jmp 0x14589ea5a
14589ecd2: 488d4dc0 lea rcx, [rbp - 0x40]
14589ecd6: e855943000 call 0x145ba8130
14589ecdb: 90 nop
14589ecdc: 488b8d30010000 mov rcx, qword ptr [rbp + 0x130]
14589ece3: e972fdffff jmp 0x14589ea5a
14589ece8: f3440f16df movshdup xmm11, xmm7
14589eced: f3440f10357e955000 movss xmm14, dword ptr [rip + 0x50957e]
14589ecf6: be08000000 mov esi, 8
14589ecfb: f3440f119594010000 movss dword ptr [rbp + 0x194], xmm10
14589ed04: 440f299d60010000 movaps xmmword ptr [rbp + 0x160], xmm11
14589ed0c: eb07 jmp 0x14589ed15
14589ed0e: 6690 nop
14589ed10: be08000000 mov esi, 8
14589ed15: 4c8b9d88010000 mov r11, qword ptr [rbp + 0x188]
14589ed1c: 4c3b9d28010000 cmp r11, qword ptr [rbp + 0x128]
14589ed23: 0f844e060000 je 0x14589f377
14589ed29: 4d8b7b08 mov r15, qword ptr [r11 + 8]
14589ed2d: 4d8b6310 mov r12, qword ptr [r11 + 0x10]
14589ed31: f3440f102d12ec6100 movss xmm13, dword ptr [rip + 0x61ec12]
14589ed3a: 450f28cd movaps xmm9, xmm13
14589ed3e: 440f2825ba0a7100 movaps xmm12, xmmword ptr [rip + 0x710aba]
14589ed46: 4d85e4 test r12, r12
14589ed49: 0f84c6040000 je 0x14589f215
14589ed4f: 31c0 xor eax, eax
14589ed51: 440f2825a70a7100 movaps xmm12, xmmword ptr [rip + 0x710aa7]
14589ed59: 440f282daf0a7100 movaps xmm13, xmmword ptr [rip + 0x710aaf]
14589ed61: eb19 jmp 0x14589ed7c
14589ed63: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589ed70: 48ffc0 inc rax
14589ed73: 4c39e0 cmp rax, r12
14589ed76: 0f8494040000 je 0x14589f210
14589ed7c: 488d1440 lea rdx, [rax + rax*2]
14589ed80: 48c1e207 shl rdx, 7
14589ed84: 498b4c1710 mov rcx, qword ptr [r15 + rdx + 0x10]
14589ed89: 4885c9 test rcx, rcx
14589ed8c: 74e2 je 0x14589ed70
14589ed8e: 498b541708 mov rdx, qword ptr [r15 + rdx + 8]
14589ed93: 4883f909 cmp rcx, 9
14589ed97: 7317 jae 0x14589edb0
14589ed99: 4531c0 xor r8d, r8d
14589ed9c: e90b040000 jmp 0x14589f1ac
14589eda1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589edb0: 4189c9 mov r9d, ecx
14589edb3: 4183e107 and r9d, 7
14589edb7: 4c0f44ce cmove r9, rsi
14589edbb: 4989c8 mov r8, rcx
14589edbe: 4d29c8 sub r8, r9
14589edc1: 410f28e4 movaps xmm4, xmm12
14589edc5: 410fc6e455 shufps xmm4, xmm12, 0x55
14589edca: 450fc6e400 shufps xmm12, xmm12, 0
14589edcf: 410f28cd movaps xmm1, xmm13
14589edd3: 410fc6cd55 shufps xmm1, xmm13, 0x55
14589edd8: 450fc6ed00 shufps xmm13, xmm13, 0
14589eddd: 4c8d4a58 lea r9, [rdx + 0x58]
14589ede1: 4d89c2 mov r10, r8
14589ede4: 0f28ec movaps xmm5, xmm4
14589ede7: 410f28dc movaps xmm3, xmm12
14589edeb: 0f28d1 movaps xmm2, xmm1
14589edee: 410f28c5 movaps xmm0, xmm13
14589edf2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589ee00: f3410f1071cc movss xmm6, dword ptr [r9 - 0x34]
14589ee06: f3450f1041c0 movss xmm8, dword ptr [r9 - 0x40]
14589ee0c: 440f14c6 unpcklps xmm8, xmm6
14589ee10: f3450f1049a8 movss xmm9, dword ptr [r9 - 0x58]
14589ee16: f3410f1071ac movss xmm6, dword ptr [r9 - 0x54]
14589ee1c: f3450f1079b4 movss xmm15, dword ptr [r9 - 0x4c]
14589ee22: 450f14cf unpcklps xmm9, xmm15
14589ee26: 450f16c8 movlhps xmm9, xmm8
14589ee2a: f3450f1041b8 movss xmm8, dword ptr [r9 - 0x48]
14589ee30: 410f14f0 unpcklps xmm6, xmm8
14589ee34: f3450f1041fc movss xmm8, dword ptr [r9 - 4]
14589ee3a: f3450f1059f0 movss xmm11, dword ptr [r9 - 0x10]
14589ee40: 450f14d8 unpcklps xmm11, xmm8
14589ee44: f3450f1041e4 movss xmm8, dword ptr [r9 - 0x1c]
14589ee4a: f3450f1079d8 movss xmm15, dword ptr [r9 - 0x28]
14589ee50: 450f14f8 unpcklps xmm15, xmm8
14589ee54: 450f16fb movlhps xmm15, xmm11
14589ee58: f3450f1041d0 movss xmm8, dword ptr [r9 - 0x30]
14589ee5e: f3450f1059c4 movss xmm11, dword ptr [r9 - 0x3c]
14589ee64: 450f14d8 unpcklps xmm11, xmm8
14589ee68: 410f16f3 movlhps xmm6, xmm11
14589ee6c: f3450f1001 movss xmm8, dword ptr [r9]
14589ee71: f3450f1059f4 movss xmm11, dword ptr [r9 - 0xc]
14589ee77: 450f14d8 unpcklps xmm11, xmm8
14589ee7b: f3450f1051e8 movss xmm10, dword ptr [r9 - 0x18]
14589ee81: f3450f1041dc movss xmm8, dword ptr [r9 - 0x24]
14589ee87: 450f14c2 unpcklps xmm8, xmm10
14589ee8b: 450f16c3 movlhps xmm8, xmm11
14589ee8f: 450f28d5 movaps xmm10, xmm13
14589ee93: 450f5de9 minps xmm13, xmm9
14589ee97: 450f28dd movaps xmm11, xmm13
14589ee9b: 450fc2dd03 cmpunordps xmm11, xmm13
14589eea0: 450f54d3 andps xmm10, xmm11
14589eea4: 450f55dd andnps xmm11, xmm13
14589eea8: 450f28eb movaps xmm13, xmm11
14589eeac: 450f56ea orps xmm13, xmm10
14589eeb0: 440f28d0 movaps xmm10, xmm0
14589eeb4: 410f5dc7 minps xmm0, xmm15
14589eeb8: 440f28d8 movaps xmm11, xmm0
14589eebc: 440fc2d803 cmpunordps xmm11, xmm0
14589eec1: 450f54d3 andps xmm10, xmm11
14589eec5: 440f55d8 andnps xmm11, xmm0
14589eec9: 410f28c3 movaps xmm0, xmm11
14589eecd: 410f56c2 orps xmm0, xmm10
14589eed1: 440f28d1 movaps xmm10, xmm1
14589eed5: 0f5dce minps xmm1, xmm6
14589eed8: 440f28d9 movaps xmm11, xmm1
14589eedc: 440fc2d903 cmpunordps xmm11, xmm1
14589eee1: 450f54d3 andps xmm10, xmm11
14589eee5: 440f55d9 andnps xmm11, xmm1
14589eee9: 410f28cb movaps xmm1, xmm11
14589eeed: 410f56ca orps xmm1, xmm10
14589eef1: 440f28d2 movaps xmm10, xmm2
14589eef5: 410f5dd0 minps xmm2, xmm8
14589eef9: 440f28da movaps xmm11, xmm2
14589eefd: 440fc2da03 cmpunordps xmm11, xmm2
14589ef02: 450f54d3 andps xmm10, xmm11
14589ef06: 440f55da andnps xmm11, xmm2
14589ef0a: 410f28d3 movaps xmm2, xmm11
14589ef0e: 410f56d2 orps xmm2, xmm10
14589ef12: 450f28d4 movaps xmm10, xmm12
14589ef16: 450f5fe1 maxps xmm12, xmm9
14589ef1a: 450f28cc movaps xmm9, xmm12
14589ef1e: 450fc2cc03 cmpunordps xmm9, xmm12
14589ef23: 450f54d1 andps xmm10, xmm9
14589ef27: 450f55cc andnps xmm9, xmm12
14589ef2b: 450f28e1 movaps xmm12, xmm9
14589ef2f: 450f56e2 orps xmm12, xmm10
14589ef33: 440f28cb movaps xmm9, xmm3
14589ef37: 410f5fdf maxps xmm3, xmm15
14589ef3b: 440f28d3 movaps xmm10, xmm3
14589ef3f: 440fc2d303 cmpunordps xmm10, xmm3
14589ef44: 450f54ca andps xmm9, xmm10
14589ef48: 440f55d3 andnps xmm10, xmm3
14589ef4c: 410f28da movaps xmm3, xmm10
14589ef50: 410f56d9 orps xmm3, xmm9
14589ef54: 440f28cc movaps xmm9, xmm4
14589ef58: 0f5fe6 maxps xmm4, xmm6
14589ef5b: 0f28f4 movaps xmm6, xmm4
14589ef5e: 0fc2f403 cmpunordps xmm6, xmm4
14589ef62: 440f54ce andps xmm9, xmm6
14589ef66: 0f55f4 andnps xmm6, xmm4
14589ef69: 0f28e6 movaps xmm4, xmm6
14589ef6c: 410f56e1 orps xmm4, xmm9
14589ef70: 0f28f5 movaps xmm6, xmm5
14589ef73: 410f5fe8 maxps xmm5, xmm8
14589ef77: 440f28c5 movaps xmm8, xmm5
14589ef7b: 440fc2c503 cmpunordps xmm8, xmm5
14589ef80: 410f54f0 andps xmm6, xmm8
14589ef84: 440f55c5 andnps xmm8, xmm5
14589ef88: 410f28e8 movaps xmm5, xmm8
14589ef8c: 0f56ee orps xmm5, xmm6
14589ef8f: 4983c160 add r9, 0x60
14589ef93: 4983c2f8 add r10, -8
14589ef97: 0f8563feffff jne 0x14589ee00
14589ef9d: 0f28f4 movaps xmm6, xmm4
14589efa0: 0f5ff5 maxps xmm6, xmm5
14589efa3: 0f28ee movaps xmm5, xmm6
14589efa6: 0fc2ee03 cmpunordps xmm5, xmm6
14589efaa: 0f54e5 andps xmm4, xmm5
14589efad: 0f55ee andnps xmm5, xmm6
14589efb0: 0f56ec orps xmm5, xmm4
14589efb3: 660f70f5ff pshufd xmm6, xmm5, 0xff
14589efb8: 66440f70c5ee pshufd xmm8, xmm5, 0xee
14589efbe: 66440f70cdf5 pshufd xmm9, xmm5, 0xf5
14589efc4: 0f28e5 movaps xmm4, xmm5
14589efc7: f30fc2e503 cmpunordss xmm4, xmm5
14589efcc: 440f28d4 movaps xmm10, xmm4
14589efd0: 450f54d1 andps xmm10, xmm9
14589efd4: f3440f5fcd maxss xmm9, xmm5
14589efd9: 410f55e1 andnps xmm4, xmm9
14589efdd: 410f56e2 orps xmm4, xmm10
14589efe1: 66410f6fe8 movdqa xmm5, xmm8
14589efe6: f30f5fec maxss xmm5, xmm4
14589efea: f30fc2e403 cmpunordss xmm4, xmm4
14589efef: 440f28cc movaps xmm9, xmm4
14589eff3: 440f55cd andnps xmm9, xmm5
14589eff7: 410f54e0 andps xmm4, xmm8
14589effb: 410f56e1 orps xmm4, xmm9
14589efff: 660f6fee movdqa xmm5, xmm6
14589f003: f30f5fec maxss xmm5, xmm4
14589f007: f30fc2e403 cmpunordss xmm4, xmm4
14589f00c: 440f28c4 movaps xmm8, xmm4
14589f010: 440f55c5 andnps xmm8, xmm5
14589f014: 0f54e6 andps xmm4, xmm6
14589f017: 410f56e0 orps xmm4, xmm8
14589f01b: 410f28ec movaps xmm5, xmm12
14589f01f: 0f5feb maxps xmm5, xmm3
14589f022: 0f28dd movaps xmm3, xmm5
14589f025: 0fc2dd03 cmpunordps xmm3, xmm5
14589f029: 440f54e3 andps xmm12, xmm3
14589f02d: 0f55dd andnps xmm3, xmm5
14589f030: 410f56dc orps xmm3, xmm12
14589f034: 660f70ebff pshufd xmm5, xmm3, 0xff
14589f039: 660f70f3ee pshufd xmm6, xmm3, 0xee
14589f03e: 66440f70c3f5 pshufd xmm8, xmm3, 0xf5
14589f044: 440f28e3 movaps xmm12, xmm3
14589f048: f3440fc2e303 cmpunordss xmm12, xmm3
14589f04e: 450f28cc movaps xmm9, xmm12
14589f052: 450f54c8 andps xmm9, xmm8
14589f056: f3440f5fc3 maxss xmm8, xmm3
14589f05b: 450f55e0 andnps xmm12, xmm8
14589f05f: 450f56e1 orps xmm12, xmm9
14589f063: 660f6fde movdqa xmm3, xmm6
14589f067: f3410f5fdc maxss xmm3, xmm12
14589f06c: f3450fc2e403 cmpunordss xmm12, xmm12
14589f072: 450f28c4 movaps xmm8, xmm12
14589f076: 440f55c3 andnps xmm8, xmm3
14589f07a: 440f54e6 andps xmm12, xmm6
14589f07e: 450f56e0 orps xmm12, xmm8
14589f082: 660f6fdd movdqa xmm3, xmm5
14589f086: f3410f5fdc maxss xmm3, xmm12
14589f08b: f3450fc2e403 cmpunordss xmm12, xmm12
14589f091: 410f28f4 movaps xmm6, xmm12
14589f095: 0f55f3 andnps xmm6, xmm3
14589f098: 440f54e5 andps xmm12, xmm5
14589f09c: 440f56e6 orps xmm12, xmm6
14589f0a0: 0f28d9 movaps xmm3, xmm1
14589f0a3: 0f5dda minps xmm3, xmm2
14589f0a6: 0f28d3 movaps xmm2, xmm3
14589f0a9: 0fc2d303 cmpunordps xmm2, xmm3
14589f0ad: 0f54ca andps xmm1, xmm2
14589f0b0: 0f55d3 andnps xmm2, xmm3
14589f0b3: 0f56d1 orps xmm2, xmm1
14589f0b6: 660f70daff pshufd xmm3, xmm2, 0xff
14589f0bb: 660f70eaee pshufd xmm5, xmm2, 0xee
14589f0c0: 660f70f2f5 pshufd xmm6, xmm2, 0xf5
14589f0c5: 0f28ca movaps xmm1, xmm2
14589f0c8: f30fc2ca03 cmpunordss xmm1, xmm2
14589f0cd: 440f28c1 movaps xmm8, xmm1
14589f0d1: 440f54c6 andps xmm8, xmm6
14589f0d5: f30f5df2 minss xmm6, xmm2
14589f0d9: 0f55ce andnps xmm1, xmm6
14589f0dc: 410f56c8 orps xmm1, xmm8
14589f0e0: 660f6fd5 movdqa xmm2, xmm5
14589f0e4: f30f5dd1 minss xmm2, xmm1
14589f0e8: f30fc2c903 cmpunordss xmm1, xmm1
14589f0ed: 0f28f1 movaps xmm6, xmm1
14589f0f0: 0f55f2 andnps xmm6, xmm2
14589f0f3: 0f54cd andps xmm1, xmm5
14589f0f6: 0f56ce orps xmm1, xmm6
14589f0f9: 660f6fd3 movdqa xmm2, xmm3
14589f0fd: f30f5dd1 minss xmm2, xmm1
14589f101: f30fc2c903 cmpunordss xmm1, xmm1
14589f106: 0f28e9 movaps xmm5, xmm1
14589f109: 0f55ea andnps xmm5, xmm2
14589f10c: 0f54cb andps xmm1, xmm3
14589f10f: 0f56cd orps xmm1, xmm5
14589f112: 410f28d5 movaps xmm2, xmm13
14589f116: 0f5dd0 minps xmm2, xmm0
14589f119: 0f28c2 movaps xmm0, xmm2
14589f11c: 0fc2c203 cmpunordps xmm0, xmm2
14589f120: 440f54e8 andps xmm13, xmm0
14589f124: 0f55c2 andnps xmm0, xmm2
14589f127: 410f56c5 orps xmm0, xmm13
14589f12b: 660f70d0ff pshufd xmm2, xmm0, 0xff
14589f130: 660f70d8ee pshufd xmm3, xmm0, 0xee
14589f135: 660f70e8f5 pshufd xmm5, xmm0, 0xf5
14589f13a: 440f28e8 movaps xmm13, xmm0
14589f13e: f3440fc2e803 cmpunordss xmm13, xmm0
14589f144: 410f28f5 movaps xmm6, xmm13
14589f148: 0f54f5 andps xmm6, xmm5
14589f14b: f30f5de8 minss xmm5, xmm0
14589f14f: 440f55ed andnps xmm13, xmm5
14589f153: 440f56ee orps xmm13, xmm6
14589f157: 660f6fc3 movdqa xmm0, xmm3
14589f15b: f3410f5dc5 minss xmm0, xmm13
14589f160: f3450fc2ed03 cmpunordss xmm13, xmm13
14589f166: 410f28ed movaps xmm5, xmm13
14589f16a: 0f55e8 andnps xmm5, xmm0
14589f16d: 440f54eb andps xmm13, xmm3
14589f171: 440f56ed orps xmm13, xmm5
14589f175: 660f6fc2 movdqa xmm0, xmm2
14589f179: f3410f5dc5 minss xmm0, xmm13
14589f17e: f3450fc2ed03 cmpunordss xmm13, xmm13
14589f184: 410f28dd movaps xmm3, xmm13
14589f188: 0f55d8 andnps xmm3, xmm0
14589f18b: 440f54ea andps xmm13, xmm2
14589f18f: 440f56eb orps xmm13, xmm3
14589f193: 440f14e4 unpcklps xmm12, xmm4
14589f197: 440f14e9 unpcklps xmm13, xmm1
14589f19b: f3440f109594010000 movss xmm10, dword ptr [rbp + 0x194]
14589f1a4: 440f289d60010000 movaps xmm11, xmmword ptr [rbp + 0x160]
14589f1ac: 4c29c1 sub rcx, r8
14589f1af: 4f8d0440 lea r8, [r8 + r8*2]
14589f1b3: 4a8d1482 lea rdx, [rdx + r8*4]
14589f1b7: 410f28c4 movaps xmm0, xmm12
14589f1bb: 410f28cd movaps xmm1, xmm13
14589f1bf: 90 nop
14589f1c0: f20f1012 movsd xmm2, qword ptr [rdx]
14589f1c4: 0f28d9 movaps xmm3, xmm1
14589f1c7: 0f5dda minps xmm3, xmm2
14589f1ca: 440f28eb movaps xmm13, xmm3
14589f1ce: 440fc2eb03 cmpunordps xmm13, xmm3
14589f1d3: 410f54cd andps xmm1, xmm13
14589f1d7: 440f55eb andnps xmm13, xmm3
14589f1db: 440f56e9 orps xmm13, xmm1
14589f1df: 0f28c8 movaps xmm1, xmm0
14589f1e2: 0f5fca maxps xmm1, xmm2
14589f1e5: 440f28e1 movaps xmm12, xmm1
14589f1e9: 440fc2e103 cmpunordps xmm12, xmm1
14589f1ee: 410f54c4 andps xmm0, xmm12
14589f1f2: 440f55e1 andnps xmm12, xmm1
14589f1f6: 440f56e0 orps xmm12, xmm0
14589f1fa: 4883c20c add rdx, 0xc
14589f1fe: 410f28c4 movaps xmm0, xmm12
14589f202: 410f28cd movaps xmm1, xmm13
14589f206: 48ffc9 dec rcx
14589f209: 75b5 jne 0x14589f1c0
14589f20b: e960fbffff jmp 0x14589ed70
14589f210: f3450f16cd movshdup xmm9, xmm13
14589f215: 4983c348 add r11, 0x48
14589f219: 4c899d88010000 mov qword ptr [rbp + 0x188], r11
14589f220: f3450f16fc movshdup xmm15, xmm12
14589f225: 4531ed xor r13d, r13d
14589f228: 0f1f840000000000 nop dword ptr [rax + rax]
14589f230: 4c3bad80010000 cmp r13, qword ptr [rbp + 0x180]
14589f237: 0f83d3faffff jae 0x14589ed10
14589f23d: 4c89ef mov rdi, r13
14589f240: 4d85ed test r13, r13
14589f243: 780b js 0x14589f250
14589f245: 450f57c0 xorps xmm8, xmm8
14589f249: f34c0f2ac7 cvtsi2ss xmm8, rdi
14589f24e: eb1c jmp 0x14589f26c
14589f250: 4889f8 mov rax, rdi
14589f253: 48d1e8 shr rax, 1
14589f256: 89f9 mov ecx, edi
14589f258: 83e101 and ecx, 1
14589f25b: 4809c1 or rcx, rax
14589f25e: 450f57c0 xorps xmm8, xmm8
14589f262: f34c0f2ac1 cvtsi2ss xmm8, rcx
14589f267: f3450f58c0 addss xmm8, xmm8
14589f26c: 4c8d6f01 lea r13, [rdi + 1]
14589f270: f3450f58c6 addss xmm8, xmm14
14589f275: f3450f59c6 mulss xmm8, xmm14
14589f27a: f3450f58c3 addss xmm8, xmm11
14589f27f: 450f2ec8 ucomiss xmm9, xmm8
14589f283: 77ab ja 0x14589f230
14589f285: 450f2ec7 ucomiss xmm8, xmm15
14589f289: 77a5 ja 0x14589f230
14589f28b: 480fafbd80010000 imul rdi, qword ptr [rbp + 0x180]
14589f293: 31db xor ebx, ebx
14589f295: eb27 jmp 0x14589f2be
14589f297: 660f1f840000000000 nop word ptr [rax + rax]
14589f2a0: 4101fe add r14d, edi
14589f2a3: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14589f2aa: 448934f0 mov dword ptr [rax + rsi*8], r14d
14589f2ae: f30f1174f004 movss dword ptr [rax + rsi*8 + 4], xmm6
14589f2b4: 48ffc6 inc rsi
14589f2b7: 4889b558010000 mov qword ptr [rbp + 0x158], rsi
14589f2be: 483b9d80010000 cmp rbx, qword ptr [rbp + 0x180]
14589f2c5: 0f8365ffffff jae 0x14589f230
14589f2cb: 4989de mov r14, rbx
14589f2ce: 4885db test rbx, rbx
14589f2d1: 780d js 0x14589f2e0
14589f2d3: 0f57c0 xorps xmm0, xmm0
14589f2d6: f3490f2ac6 cvtsi2ss xmm0, r14
14589f2db: eb1e jmp 0x14589f2fb
14589f2dd: 0f1f00 nop dword ptr [rax]
14589f2e0: 4c89f0 mov rax, r14
14589f2e3: 48d1e8 shr rax, 1
14589f2e6: 4489f1 mov ecx, r14d
14589f2e9: 83e101 and ecx, 1
14589f2ec: 4809c1 or rcx, rax
14589f2ef: 0f57c0 xorps xmm0, xmm0
14589f2f2: f3480f2ac1 cvtsi2ss xmm0, rcx
14589f2f7: f30f58c0 addss xmm0, xmm0
14589f2fb: 498d5e01 lea rbx, [r14 + 1]
14589f2ff: f3410f58c6 addss xmm0, xmm14
14589f304: f3410f59c6 mulss xmm0, xmm14
14589f309: f30f58c7 addss xmm0, xmm7
14589f30d: 440f2ee8 ucomiss xmm13, xmm0
14589f311: 77ab ja 0x14589f2be
14589f313: 410f2ec4 ucomiss xmm0, xmm12
14589f317: 77a5 ja 0x14589f2be
14589f319: f30f1145b8 movss dword ptr [rbp - 0x48], xmm0
14589f31e: f3440f1145bc movss dword ptr [rbp - 0x44], xmm8
14589f324: c745c000000000 mov dword ptr [rbp - 0x40], 0
14589f32b: 4c89f9 mov rcx, r15
14589f32e: 4c89e2 mov rdx, r12
14589f331: 4c8d45b8 lea r8, [rbp - 0x48]
14589f335: e8d6192a00 call 0x145b40d10
14589f33a: 90 nop
14589f33b: 83f801 cmp eax, 1
14589f33e: 0f857affffff jne 0x14589f2be
14589f344: 0f28f0 movaps xmm6, xmm0
14589f347: 440f2ed0 ucomiss xmm10, xmm0
14589f34b: 0f826dffffff jb 0x14589f2be
14589f351: 488bb558010000 mov rsi, qword ptr [rbp + 0x158]
14589f358: 483bb548010000 cmp rsi, qword ptr [rbp + 0x148]
14589f35f: 0f853bffffff jne 0x14589f2a0
14589f365: 488d8d48010000 lea rcx, [rbp + 0x148]
14589f36c: e8bf1e3700 call 0x145c11230
14589f371: 90 nop
14589f372: e929ffffff jmp 0x14589f2a0
14589f377: 488b8d50010000 mov rcx, qword ptr [rbp + 0x150]
14589f37e: 488b9558010000 mov rdx, qword ptr [rbp + 0x158]
14589f385: 488d8573010000 lea rax, [rbp + 0x173]
14589f38c: 488945b8 mov qword ptr [rbp - 0x48], rax
14589f390: 4883fa02 cmp rdx, 2
14589f394: 0f83ff080000 jae 0x14589fc99
14589f39a: 4c8bbd80010000 mov r15, qword ptr [rbp + 0x180]
14589f3a1: 4d0fafff imul r15, r15
14589f3a5: 4e8d34bd04000000 lea r14, [r15*4 + 4]
14589f3ad: 48b8feffffffffffff3f movabs rax, 0x3ffffffffffffffe
14589f3b7: 4939c7 cmp r15, rax
14589f3ba: 0f97c0 seta al
14589f3bd: 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
14589f3c7: 4939ce cmp r14, rcx
14589f3ca: 0f97c1 seta cl
14589f3cd: 08c1 or cl, al
14589f3cf: 7413 je 0x14589f3e4
14589f3d1: 31db xor ebx, ebx
14589f3d3: 4889d9 mov rcx, rbx
14589f3d6: 4c89f2 mov rdx, r14
14589f3d9: e8cd4e5000 call 0x145da42ab
14589f3de: 90 nop
14589f3df: e9ce090000 jmp 0x14589fdb2
14589f3e4: 498d7701 lea rsi, [r15 + 1]
14589f3e8: 4d85f6 test r14, r14
14589f3eb: 7421 je 0x14589f40e
14589f3ed: e80e2e76fa call 0x140002200
14589f3f2: bb04000000 mov ebx, 4
14589f3f7: ba04000000 mov edx, 4
14589f3fc: 4c89f1 mov rcx, r14
14589f3ff: e8ec2d76fa call 0x1400021f0
14589f404: 4885c0 test rax, rax
14589f407: 74ca je 0x14589f3d3
14589f409: 4989f2 mov r10, rsi
14589f40c: eb08 jmp 0x14589f416
14589f40e: b804000000 mov eax, 4
14589f413: 4531d2 xor r10d, r10d
14589f416: 4c8b8d58010000 mov r9, qword ptr [rbp + 0x158]
14589f41d: 4d85c9 test r9, r9
14589f420: 48898578010000 mov qword ptr [rbp + 0x178], rax
14589f427: 4c8995e8000000 mov qword ptr [rbp + 0xe8], r10
14589f42e: 742c je 0x14589f45c
14589f430: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
14589f437: 49c1e103 shl r9, 3
14589f43b: 4531c0 xor r8d, r8d
14589f43e: 6690 nop
14589f440: 428b0c02 mov ecx, dword ptr [rdx + r8]
14589f444: 4939cf cmp r15, rcx
14589f447: 0f86a9080000 jbe 0x14589fcf6
14589f44d: ff448804 inc dword ptr [rax + rcx*4 + 4]
14589f451: 4983c008 add r8, 8
14589f455: 4d39c1 cmp r9, r8
14589f458: 75e6 jne 0x14589f440
14589f45a: eb09 jmp 0x14589f465
14589f45c: 4d85ff test r15, r15
14589f45f: 0f8450010000 je 0x14589f5b5
14589f465: 448b08 mov r9d, dword ptr [rax]
14589f468: 498d7fff lea rdi, [r15 - 1]
14589f46c: 4489f9 mov ecx, r15d
14589f46f: 83e103 and ecx, 3
14589f472: 4883ff03 cmp rdi, 3
14589f476: 7305 jae 0x14589f47d
14589f478: 4531c0 xor r8d, r8d
14589f47b: eb49 jmp 0x14589f4c6
14589f47d: 48bafcffffffffffff3f movabs rdx, 0x3ffffffffffffffc
14589f487: 4c21fa and rdx, r15
14589f48a: 4531c0 xor r8d, r8d
14589f48d: 0f1f00 nop dword ptr [rax]
14589f490: 46034c8004 add r9d, dword ptr [rax + r8*4 + 4]
14589f495: 46894c8004 mov dword ptr [rax + r8*4 + 4], r9d
14589f49a: 46034c8008 add r9d, dword ptr [rax + r8*4 + 8]
14589f49f: 46894c8008 mov dword ptr [rax + r8*4 + 8], r9d
14589f4a4: 46034c800c add r9d, dword ptr [rax + r8*4 + 0xc]
14589f4a9: 46894c800c mov dword ptr [rax + r8*4 + 0xc], r9d
14589f4ae: 46034c8010 add r9d, dword ptr [rax + r8*4 + 0x10]
14589f4b3: 46894c8010 mov dword ptr [rax + r8*4 + 0x10], r9d
14589f4b8: 4983c004 add r8, 4
14589f4bc: 4c39c2 cmp rdx, r8
14589f4bf: 75cf jne 0x14589f490
14589f4c1: 4885c9 test rcx, rcx
14589f4c4: 742a je 0x14589f4f0
14589f4c6: 4a8d1480 lea rdx, [rax + r8*4]
14589f4ca: 4883c204 add rdx, 4
14589f4ce: 4531c0 xor r8d, r8d
14589f4d1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589f4e0: 46030c82 add r9d, dword ptr [rdx + r8*4]
14589f4e4: 46890c82 mov dword ptr [rdx + r8*4], r9d
14589f4e8: 49ffc0 inc r8
14589f4eb: 4c39c1 cmp rcx, r8
14589f4ee: 75f0 jne 0x14589f4e0
14589f4f0: 4e8d34bd00000000 lea r14, [r15*4]
14589f4f8: 4c89f8 mov rax, r15
14589f4fb: 48c1e83d shr rax, 0x3d
14589f4ff: 7413 je 0x14589f514
14589f501: 31db xor ebx, ebx
14589f503: 4889d9 mov rcx, rbx
14589f506: 4c89f2 mov rdx, r14
14589f509: e89d4d5000 call 0x145da42ab
14589f50e: 90 nop
14589f50f: e99e080000 jmp 0x14589fdb2
14589f514: e8e72c76fa call 0x140002200
14589f519: bb04000000 mov ebx, 4
14589f51e: ba04000000 mov edx, 4
14589f523: 4c89f1 mov rcx, r14
14589f526: e8952c76fa call 0x1400021c0
14589f52b: 4885c0 test rax, rax
14589f52e: 74d3 je 0x14589f503
14589f530: 4989c1 mov r9, rax
14589f533: 4983ff02 cmp r15, 2
14589f537: 7257 jb 0x14589f590
14589f539: b901000000 mov ecx, 1
14589f53e: 4989c1 mov r9, rax
14589f541: 4983ff09 cmp r15, 9
14589f545: 7232 jb 0x14589f579
14589f547: 4889fa mov rdx, rdi
14589f54a: 4883e2f8 and rdx, 0xfffffffffffffff8
14589f54e: 4c8d0c90 lea r9, [rax + rdx*4]
14589f552: 488d4a01 lea rcx, [rdx + 1]
14589f556: 4531c0 xor r8d, r8d
14589f559: 0f2805a0a47e00 movaps xmm0, xmmword ptr [rip + 0x7ea4a0]
14589f560: 420f110480 movups xmmword ptr [rax + r8*4], xmm0
14589f565: 420f11448010 movups xmmword ptr [rax + r8*4 + 0x10], xmm0
14589f56b: 4983c008 add r8, 8
14589f56f: 4c39c2 cmp rdx, r8
14589f572: 75ec jne 0x14589f560
14589f574: 4839d7 cmp rdi, rdx
14589f577: 7417 je 0x14589f590
14589f579: 4c89fa mov rdx, r15
14589f57c: 4829ca sub rdx, rcx
14589f57f: 90 nop
14589f580: 41c7010000c07f mov dword ptr [r9], 0x7fc00000
14589f587: 4983c104 add r9, 4
14589f58b: 48ffca dec rdx
14589f58e: 75f0 jne 0x14589f580
14589f590: 48898560010000 mov qword ptr [rbp + 0x160], rax
14589f597: 4889b540010000 mov qword ptr [rbp + 0x140], rsi
14589f59e: 41c7010000c07f mov dword ptr [r9], 0x7fc00000
14589f5a5: 4c89bdd0000000 mov qword ptr [rbp + 0xd0], r15
14589f5ac: 4c89bd88010000 mov qword ptr [rbp + 0x188], r15
14589f5b3: eb25 jmp 0x14589f5da
14589f5b5: 4c89bdd0000000 mov qword ptr [rbp + 0xd0], r15
14589f5bc: 4889b540010000 mov qword ptr [rbp + 0x140], rsi
14589f5c3: b804000000 mov eax, 4
14589f5c8: 48898560010000 mov qword ptr [rbp + 0x160], rax
14589f5cf: 48c7858801000000000000 mov qword ptr [rbp + 0x188], 0
14589f5da: 0f2895b0000000 movaps xmm2, xmmword ptr [rbp + 0xb0]
14589f5e1: 0f5cd7 subps xmm2, xmm7
14589f5e4: f30f16c2 movshdup xmm0, xmm2
14589f5e8: f30f58d2 addss xmm2, xmm2
14589f5ec: f3440f2cca cvttss2si r9d, xmm2
14589f5f1: f30f100da7a15e00 movss xmm1, dword ptr [rip + 0x5ea1a7]
14589f5f9: 0f2ed1 ucomiss xmm2, xmm1
14589f5fc: b8ffffff7f mov eax, 0x7fffffff
14589f601: 440f47c8 cmova r9d, eax
14589f605: 4531c0 xor r8d, r8d
14589f608: 0f2ed2 ucomiss xmm2, xmm2
14589f60b: 450f4ac8 cmovp r9d, r8d
14589f60f: f30f58c0 addss xmm0, xmm0
14589f613: f30f2cc8 cvttss2si ecx, xmm0
14589f617: 0f2ec1 ucomiss xmm0, xmm1
14589f61a: 0f47c8 cmova ecx, eax
14589f61d: 0f2ec0 ucomiss xmm0, xmm0
14589f620: 410f4ac8 cmovp ecx, r8d
14589f624: 48898d28010000 mov qword ptr [rbp + 0x128], rcx
14589f62b: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14589f632: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
14589f639: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
14589f640: 48898538010000 mov qword ptr [rbp + 0x138], rax
14589f647: 41bcf0ffffff mov r12d, 0xfffffff0
14589f64d: 0f28055c415100 movaps xmm0, xmmword ptr [rip + 0x51415c]
14589f654: f30f100df46e5100 movss xmm1, dword ptr [rip + 0x516ef4]
14589f65c: 0f1f4000 nop dword ptr [rax]
14589f660: 418d4c2401 lea ecx, [r12 + 1]
14589f665: 4183fc10 cmp r12d, 0x10
14589f669: 410f44cc cmove ecx, r12d
14589f66d: 488b8528010000 mov rax, qword ptr [rbp + 0x128]
14589f674: 418d3c04 lea edi, [r12 + rax]
14589f678: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14589f67f: 39c7 cmp edi, eax
14589f681: 0f8d15020000 jge 0x14589f89c
14589f687: 4589e6 mov r14d, r12d
14589f68a: 450faff4 imul r14d, r12d
14589f68e: 480fafc7 imul rax, rdi
14589f692: 48898530010000 mov qword ptr [rbp + 0x130], rax
14589f699: 41bbf0ffffff mov r11d, 0xfffffff0
14589f69f: 898d94010000 mov dword ptr [rbp + 0x194], ecx
14589f6a5: 4589df mov r15d, r11d
14589f6a8: 4489d9 mov ecx, r11d
14589f6ab: 41f6c001 test r8b, 1
14589f6af: 745f je 0x14589f710
14589f6b1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589f6c0: 448d5901 lea r11d, [rcx + 1]
14589f6c4: 83f910 cmp ecx, 0x10
14589f6c7: 410f94c2 sete r10b
14589f6cb: 440f44d9 cmove r11d, ecx
14589f6cf: 428d0409 lea eax, [rcx + r9]
14589f6d3: 3b8580010000 cmp eax, dword ptr [rbp + 0x180]
14589f6d9: 7d15 jge 0x14589f6f0
14589f6db: 89c2 mov edx, eax
14589f6dd: 09fa or edx, edi
14589f6df: 780f js 0x14589f6f0
14589f6e1: 4189cf mov r15d, ecx
14589f6e4: 450fafff imul r15d, r15d
14589f6e8: 4501f7 add r15d, r14d
14589f6eb: 4139df cmp r15d, ebx
14589f6ee: 7c67 jl 0x14589f757
14589f6f0: 83f910 cmp ecx, 0x10
14589f6f3: 0f8497010000 je 0x14589f890
14589f6f9: 4489d9 mov ecx, r11d
14589f6fc: 4183fb10 cmp r11d, 0x10
14589f700: 7ebe jle 0x14589f6c0
14589f702: e989010000 jmp 0x14589f890
14589f707: 660f1f840000000000 nop word ptr [rax + rax]
14589f710: 458d5f01 lea r11d, [r15 + 1]
14589f714: 4183ff10 cmp r15d, 0x10
14589f718: 410f94c2 sete r10b
14589f71c: 450f44df cmove r11d, r15d
14589f720: 438d040f lea eax, [r15 + r9]
14589f724: 3b8580010000 cmp eax, dword ptr [rbp + 0x180]
14589f72a: 7d06 jge 0x14589f732
14589f72c: 89c1 mov ecx, eax
14589f72e: 09f9 or ecx, edi
14589f730: 791e jns 0x14589f750
14589f732: 4183ff10 cmp r15d, 0x10
14589f736: 0f8474010000 je 0x14589f8b0
14589f73c: 4589df mov r15d, r11d
14589f73f: 4183fb10 cmp r11d, 0x10
14589f743: 7ecb jle 0x14589f710
14589f745: e966010000 jmp 0x14589f8b0
14589f74a: 660f1f440000 nop word ptr [rax + rax]
14589f750: 450fafff imul r15d, r15d
14589f754: 4501f7 add r15d, r14d
14589f757: 89c1 mov ecx, eax
14589f759: 48038d30010000 add rcx, qword ptr [rbp + 0x130]
14589f760: 483b8dd0000000 cmp rcx, qword ptr [rbp + 0xd0]
14589f767: 0f87e2050000 ja 0x14589fd4f
14589f76d: 0f83f2050000 jae 0x14589fd65
14589f773: 488b9578010000 mov rdx, qword ptr [rbp + 0x178]
14589f77a: 8b048a mov eax, dword ptr [rdx + rcx*4]
14589f77d: 8b548a04 mov edx, dword ptr [rdx + rcx*4 + 4]
14589f781: 39c2 cmp edx, eax
14589f783: 0f82de040000 jb 0x14589fc67
14589f789: 48399538010000 cmp qword ptr [rbp + 0x138], rdx
14589f790: 0f82d1040000 jb 0x14589fc67
14589f796: 39d0 cmp eax, edx
14589f798: 0f84cf000000 je 0x14589f86d
14589f79e: 4c8985b0000000 mov qword ptr [rbp + 0xb0], r8
14589f7a5: 4c8b85a8000000 mov r8, qword ptr [rbp + 0xa8]
14589f7ac: 4d8d2cd0 lea r13, [r8 + rdx*8]
14589f7b0: 4d8d04c0 lea r8, [r8 + rax*8]
14589f7b4: 488d34c500000000 lea rsi, [rax*8]
14589f7bc: 488d04d500000000 lea rax, [rdx*8]
14589f7c4: 4829f0 sub rax, rsi
14589f7c7: 4883c0f8 add rax, -8
14589f7cb: 0f1f440000 nop dword ptr [rax + rax]
14589f7d0: 498d5008 lea rdx, [r8 + 8]
14589f7d4: f3410f105804 movss xmm3, dword ptr [r8 + 4]
14589f7da: 0f28e3 movaps xmm4, xmm3
14589f7dd: f30f5ca574010000 subss xmm4, dword ptr [rbp + 0x174]
14589f7e5: 0f54e0 andps xmm4, xmm0
14589f7e8: 0f2ecc ucomiss xmm1, xmm4
14589f7eb: 7315 jae 0x14589f802
14589f7ed: 4883c0f8 add rax, -8
14589f7f1: 4989d0 mov r8, rdx
14589f7f4: 4c39ea cmp rdx, r13
14589f7f7: 75d7 jne 0x14589f7d0
14589f7f9: 4c8b85b0000000 mov r8, qword ptr [rbp + 0xb0]
14589f800: eb6b jmp 0x14589f86d
14589f802: 4c39ea cmp rdx, r13
14589f805: 7453 je 0x14589f85a
14589f807: 48c1e803 shr rax, 3
14589f80b: 31d2 xor edx, edx
14589f80d: eb0f jmp 0x14589f81e
14589f80f: 90 nop
14589f810: 0f28dd movaps xmm3, xmm5
14589f813: 0f28e2 movaps xmm4, xmm2
14589f816: 48ffc2 inc rdx
14589f819: 4839d0 cmp rax, rdx
14589f81c: 743c je 0x14589f85a
14589f81e: f3410f106cd00c movss xmm5, dword ptr [r8 + rdx*8 + 0xc]
14589f825: 0f28d5 movaps xmm2, xmm5
14589f828: f30f5c9574010000 subss xmm2, dword ptr [rbp + 0x174]
14589f830: 0f54d0 andps xmm2, xmm0
14589f833: 0f2eca ucomiss xmm1, xmm2
14589f836: 72de jb 0x14589f816
14589f838: 660f7ee6 movd esi, xmm4
14589f83c: 660f7ed3 movd ebx, xmm2
14589f840: 4189f5 mov r13d, esi
14589f843: 41c1fd1f sar r13d, 0x1f
14589f847: 41d1ed shr r13d, 1
14589f84a: 4131f5 xor r13d, esi
14589f84d: 4139dd cmp r13d, ebx
14589f850: 7fbe jg 0x14589f810
14589f852: 0f28d4 movaps xmm2, xmm4
14589f855: 0f28eb movaps xmm5, xmm3
14589f858: ebb6 jmp 0x14589f810
14589f85a: 48898de0000000 mov qword ptr [rbp + 0xe0], rcx
14589f861: 0f28d3 movaps xmm2, xmm3
14589f864: 4489fb mov ebx, r15d
14589f867: 41b801000000 mov r8d, 1
14589f86d: 4183fb11 cmp r11d, 0x11
14589f871: 0f9dc0 setge al
14589f874: 4108c2 or r10b, al
14589f877: 8b8d94010000 mov ecx, dword ptr [rbp + 0x194]
14589f87d: 0f8422feffff je 0x14589f6a5
14589f883: eb17 jmp 0x14589f89c
14589f885: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589f890: 41b801000000 mov r8d, 1
14589f896: 8b8d94010000 mov ecx, dword ptr [rbp + 0x194]
14589f89c: 4183fc10 cmp r12d, 0x10
14589f8a0: 741d je 0x14589f8bf
14589f8a2: 4189cc mov r12d, ecx
14589f8a5: 83f910 cmp ecx, 0x10
14589f8a8: 0f8eb2fdffff jle 0x14589f660
14589f8ae: eb0f jmp 0x14589f8bf
14589f8b0: 4531c0 xor r8d, r8d
14589f8b3: 8b8d94010000 mov ecx, dword ptr [rbp + 0x194]
14589f8b9: 4183fc10 cmp r12d, 0x10
14589f8bd: 75e3 jne 0x14589f8a2
14589f8bf: 4983f801 cmp r8, 1
14589f8c3: 488b9d78010000 mov rbx, qword ptr [rbp + 0x178]
14589f8ca: 0f8547020000 jne 0x14589fb17
14589f8d0: 4c8ba588010000 mov r12, qword ptr [rbp + 0x188]
14589f8d7: 488bb5e0000000 mov rsi, qword ptr [rbp + 0xe0]
14589f8de: 4c39e6 cmp rsi, r12
14589f8e1: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
14589f8e8: 0f839f040000 jae 0x14589fd8d
14589f8ee: f30f1114b0 movss dword ptr [rax + rsi*4], xmm2
14589f8f3: e8082976fa call 0x140002200
14589f8f8: b908000000 mov ecx, 8
14589f8fd: ba08000000 mov edx, 8
14589f902: e8b92876fa call 0x1400021c0
14589f907: 4885c0 test rax, rax
14589f90a: 0f8492040000 je 0x14589fda2
14589f910: 48c785f000000001000000 mov qword ptr [rbp + 0xf0], 1
14589f91b: 488985f8000000 mov qword ptr [rbp + 0xf8], rax
14589f922: 488930 mov qword ptr [rax], rsi
14589f925: 48c7850001000000000000 mov qword ptr [rbp + 0x100], 0
14589f930: 48c7850801000001000000 mov qword ptr [rbp + 0x108], 1
14589f93b: b801000000 mov eax, 1
14589f940: 488d7dd8 lea rdi, [rbp - 0x28]
14589f944: 4531ff xor r15d, r15d
14589f947: 4c8db5f0000000 lea r14, [rbp + 0xf0]
14589f94e: eb15 jmp 0x14589f965
14589f950: 488b8508010000 mov rax, qword ptr [rbp + 0x108]
14589f957: 488b9d78010000 mov rbx, qword ptr [rbp + 0x178]
14589f95e: 4c8ba588010000 mov r12, qword ptr [rbp + 0x188]
14589f965: 4885c0 test rax, rax
14589f968: 0f84da010000 je 0x14589fb48
14589f96e: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
14589f975: 4c8d4101 lea r8, [rcx + 1]
14589f979: 4c8b8df0000000 mov r9, qword ptr [rbp + 0xf0]
14589f980: 488b95f8000000 mov rdx, qword ptr [rbp + 0xf8]
14589f987: 4d39c8 cmp r8, r9
14589f98a: 4d0f42cf cmovb r9, r15
14589f98e: 49f7d9 neg r9
14589f991: 48ffc8 dec rax
14589f994: 4e8d0409 lea r8, [rcx + r9]
14589f998: 49ffc0 inc r8
14589f99b: 4c898500010000 mov qword ptr [rbp + 0x100], r8
14589f9a2: 48898508010000 mov qword ptr [rbp + 0x108], rax
14589f9a9: 4883bd8001000000 cmp qword ptr [rbp + 0x180], 0
14589f9b1: 0f8457030000 je 0x14589fd0e
14589f9b7: 488b0cca mov rcx, qword ptr [rdx + rcx*8]
14589f9bb: 4c39e1 cmp rcx, r12
14589f9be: 0f835c030000 jae 0x14589fd20
14589f9c4: 4889c8 mov rax, rcx
14589f9c7: 4c8ba580010000 mov r12, qword ptr [rbp + 0x180]
14589f9ce: 4c09e0 or rax, r12
14589f9d1: 48c1e820 shr rax, 0x20
14589f9d5: 7419 je 0x14589f9f0
14589f9d7: 4889c8 mov rax, rcx
14589f9da: 31d2 xor edx, edx
14589f9dc: 49f7f4 div r12
14589f9df: eb16 jmp 0x14589f9f7
14589f9e1: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589f9f0: 89c8 mov eax, ecx
14589f9f2: 31d2 xor edx, edx
14589f9f4: 41f7f4 div r12d
14589f9f7: 4c8b8560010000 mov r8, qword ptr [rbp + 0x160]
14589f9fe: f3410f103488 movss xmm6, dword ptr [r8 + rcx*4]
14589fa04: 4531c0 xor r8d, r8d
14589fa07: 4885d2 test rdx, rdx
14589fa0a: 410f95c0 setne r8b
14589fa0e: 4c8d49ff lea r9, [rcx - 1]
14589fa12: 48ffc2 inc rdx
14589fa15: 4531d2 xor r10d, r10d
14589fa18: 4c39e2 cmp rdx, r12
14589fa1b: 410f92c2 setb r10b
14589fa1f: 488d5101 lea rdx, [rcx + 1]
14589fa23: 4531db xor r11d, r11d
14589fa26: 4889ce mov rsi, rcx
14589fa29: 4c29e6 sub rsi, r12
14589fa2c: 410f93c3 setae r11b
14589fa30: 48ffc0 inc rax
14589fa33: 31db xor ebx, ebx
14589fa35: 4c39e0 cmp rax, r12
14589fa38: 0f92c3 setb bl
14589fa3b: 4c01e1 add rcx, r12
14589fa3e: 4c8945d0 mov qword ptr [rbp - 0x30], r8
14589fa42: 4c894dd8 mov qword ptr [rbp - 0x28], r9
14589fa46: 4c8955e0 mov qword ptr [rbp - 0x20], r10
14589fa4a: 488955e8 mov qword ptr [rbp - 0x18], rdx
14589fa4e: 4c895df0 mov qword ptr [rbp - 0x10], r11
14589fa52: 488975f8 mov qword ptr [rbp - 8], rsi
14589fa56: 48895d00 mov qword ptr [rbp], rbx
14589fa5a: 48894d08 mov qword ptr [rbp + 8], rcx
14589fa5e: 4531e4 xor r12d, r12d
14589fa61: 4983fc04 cmp r12, 4
14589fa65: 0f84e5feffff je 0x14589f950
14589fa6b: 4c89e0 mov rax, r12
14589fa6e: 48c1e004 shl rax, 4
14589fa72: 4801f8 add rax, rdi
14589fa75: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14589fa80: 8378f801 cmp dword ptr [rax - 8], 1
14589fa84: 741a je 0x14589faa0
14589fa86: 49ffc4 inc r12
14589fa89: 4883c010 add rax, 0x10
14589fa8d: 4983fc04 cmp r12, 4
14589fa91: 75ed jne 0x14589fa80
14589fa93: e9b8feffff jmp 0x14589f950
14589fa98: 0f1f840000000000 nop dword ptr [rax + rax]
14589faa0: 488b18 mov rbx, qword ptr [rax]
14589faa3: 483b9d88010000 cmp rbx, qword ptr [rbp + 0x188]
14589faaa: 0f8386020000 jae 0x14589fd36
14589fab0: 49ffc4 inc r12
14589fab3: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
14589faba: f30f100498 movss xmm0, dword ptr [rax + rbx*4]
14589fabf: 0f2ec0 ucomiss xmm0, xmm0
14589fac2: 7b9d jnp 0x14589fa61
14589fac4: 488b8d50010000 mov rcx, qword ptr [rbp + 0x150]
14589facb: 488b9558010000 mov rdx, qword ptr [rbp + 0x158]
14589fad2: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
14589fad8: 48895c2420 mov qword ptr [rsp + 0x20], rbx
14589fadd: 4c8b8578010000 mov r8, qword ptr [rbp + 0x178]
14589fae4: 4c8b8d40010000 mov r9, qword ptr [rbp + 0x140]
14589faeb: e80084ffff call 0x145897ef0
14589faf0: 90 nop
14589faf1: 83f801 cmp eax, 1
14589faf4: 0f8567ffffff jne 0x14589fa61
14589fafa: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
14589fb01: f30f110498 movss dword ptr [rax + rbx*4], xmm0
14589fb06: 4c89f1 mov rcx, r14
14589fb09: 4889da mov rdx, rbx
14589fb0c: e8dff80e00 call 0x14598f3f0
14589fb11: 90 nop
14589fb12: e94affffff jmp 0x14589fa61
14589fb17: 488bb5d8000000 mov rsi, qword ptr [rbp + 0xd8]
14589fb1e: 488b8d88010000 mov rcx, qword ptr [rbp + 0x188]
14589fb25: 48890e mov qword ptr [rsi], rcx
14589fb28: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
14589fb2f: 48894608 mov qword ptr [rsi + 8], rax
14589fb33: 48894e10 mov qword ptr [rsi + 0x10], rcx
14589fb37: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14589fb3e: 48894618 mov qword ptr [rsi + 0x18], rax
14589fb42: 0f137e20 movlps qword ptr [rsi + 0x20], xmm7
14589fb46: eb4a jmp 0x14589fb92
14589fb48: 488bb5d8000000 mov rsi, qword ptr [rbp + 0xd8]
14589fb4f: 4c8926 mov qword ptr [rsi], r12
14589fb52: 488b8560010000 mov rax, qword ptr [rbp + 0x160]
14589fb59: 48894608 mov qword ptr [rsi + 8], rax
14589fb5d: 4c896610 mov qword ptr [rsi + 0x10], r12
14589fb61: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14589fb68: 48894618 mov qword ptr [rsi + 0x18], rax
14589fb6c: 0f137e20 movlps qword ptr [rsi + 0x20], xmm7
14589fb70: 488b95f0000000 mov rdx, qword ptr [rbp + 0xf0]
14589fb77: 4885d2 test rdx, rdx
14589fb7a: 7416 je 0x14589fb92
14589fb7c: 488b8df8000000 mov rcx, qword ptr [rbp + 0xf8]
14589fb83: 48c1e203 shl rdx, 3
14589fb87: 41b808000000 mov r8d, 8
14589fb8d: e83e2676fa call 0x1400021d0
14589fb92: 488b95e8000000 mov rdx, qword ptr [rbp + 0xe8]
14589fb99: 4885d2 test rdx, rdx
14589fb9c: 7412 je 0x14589fbb0
14589fb9e: 48c1e202 shl rdx, 2
14589fba2: 41b804000000 mov r8d, 4
14589fba8: 4889d9 mov rcx, rbx
14589fbab: e8202676fa call 0x1400021d0
14589fbb0: 488b5538 mov rdx, qword ptr [rbp + 0x38]
14589fbb4: 4885d2 test rdx, rdx
14589fbb7: 7427 je 0x14589fbe0
14589fbb9: 488d049513000000 lea rax, [rdx*4 + 0x13]
14589fbc1: 4883e0f0 and rax, 0xfffffffffffffff0
14589fbc5: 4801c2 add rdx, rax
14589fbc8: 4883c211 add rdx, 0x11
14589fbcc: 7412 je 0x14589fbe0
14589fbce: 488b4d30 mov rcx, qword ptr [rbp + 0x30]
14589fbd2: 4829c1 sub rcx, rax
14589fbd5: 41b810000000 mov r8d, 0x10
14589fbdb: e8f02576fa call 0x1400021d0
14589fbe0: 488b9548010000 mov rdx, qword ptr [rbp + 0x148]
14589fbe7: 4885d2 test rdx, rdx
14589fbea: 7416 je 0x14589fc02
14589fbec: 488b8d50010000 mov rcx, qword ptr [rbp + 0x150]
14589fbf3: 48c1e203 shl rdx, 3
14589fbf7: 41b804000000 mov r8d, 4
14589fbfd: e8ce2576fa call 0x1400021d0
14589fc02: 4889f0 mov rax, rsi
14589fc05: 0f28b5a0010000 movaps xmm6, xmmword ptr [rbp + 0x1a0]
14589fc0c: 0f28bdb0010000 movaps xmm7, xmmword ptr [rbp + 0x1b0]
14589fc13: 440f2885c0010000 movaps xmm8, xmmword ptr [rbp + 0x1c0]
14589fc1b: 440f288dd0010000 movaps xmm9, xmmword ptr [rbp + 0x1d0]
14589fc23: 440f2895e0010000 movaps xmm10, xmmword ptr [rbp + 0x1e0]
14589fc2b: 440f289df0010000 movaps xmm11, xmmword ptr [rbp + 0x1f0]
14589fc33: 440f28a500020000 movaps xmm12, xmmword ptr [rbp + 0x200]
14589fc3b: 440f28ad10020000 movaps xmm13, xmmword ptr [rbp + 0x210]
14589fc43: 440f28b520020000 movaps xmm14, xmmword ptr [rbp + 0x220]
14589fc4b: 440f28bd30020000 movaps xmm15, xmmword ptr [rbp + 0x230]
14589fc53: 4881c4c8020000 add rsp, 0x2c8
14589fc5a: 5b pop rbx
14589fc5b: 5f pop rdi
14589fc5c: 5e pop rsi
14589fc5d: 415c pop r12
14589fc5f: 415d pop r13
14589fc61: 415e pop r14
14589fc63: 415f pop r15
14589fc65: 5d pop rbp
14589fc66: c3 ret
14589fc67: 4c8d0d7aa43501 lea r9, [rip + 0x135a47a]
14589fc6e: 4889c1 mov rcx, rax
14589fc71: 4c8b8538010000 mov r8, qword ptr [rbp + 0x138]
14589fc78: e8d34b5000 call 0x145da4850
14589fc7d: 90 nop
14589fc7e: e92f010000 jmp 0x14589fdb2
14589fc83: e8c8273200 call 0x145bc2450
14589fc88: 90 nop
14589fc89: 488903 mov qword ptr [rbx], rax
14589fc8c: 48895308 mov qword ptr [rbx + 8], rdx
14589fc90: c6431001 mov byte ptr [rbx + 0x10], 1
14589fc94: e951edffff jmp 0x14589e9ea
14589fc99: 4883fa15 cmp rdx, 0x15
14589fc9d: 0f83db000000 jae 0x14589fd7e
14589fca3: 4c8d4db8 lea r9, [rbp - 0x48]
14589fca7: 41b801000000 mov r8d, 1
14589fcad: e84e981100 call 0x1459b9500
14589fcb2: e9e3f6ffff jmp 0x14589f39a
14589fcb7: 4c8d058aa83501 lea r8, [rip + 0x135a88a]
14589fcbe: 4889da mov rdx, rbx
14589fcc1: e87d495000 call 0x145da4643
14589fcc6: 90 nop
14589fcc7: e9e6000000 jmp 0x14589fdb2
14589fccc: 4c8d055da83501 lea r8, [rip + 0x135a85d]
14589fcd3: 4889da mov rdx, rbx
14589fcd6: e868495000 call 0x145da4643
14589fcdb: 90 nop
14589fcdc: e9d1000000 jmp 0x14589fdb2
14589fce1: 4c8d0530a83501 lea r8, [rip + 0x135a830]
14589fce8: 4889da mov rdx, rbx
14589fceb: e853495000 call 0x145da4643
14589fcf0: 90 nop
14589fcf1: e9bc000000 jmp 0x14589fdb2
14589fcf6: 48ffc1 inc rcx
14589fcf9: 4c8d05a0a73501 lea r8, [rip + 0x135a7a0]
14589fd00: 4889f2 mov rdx, rsi
14589fd03: e83b495000 call 0x145da4643
14589fd08: 90 nop
14589fd09: e9a4000000 jmp 0x14589fdb2
14589fd0e: 488d0dbba73501 lea rcx, [rip + 0x135a7bb]
14589fd15: e8264c5000 call 0x145da4940
14589fd1a: 90 nop
14589fd1b: e992000000 jmp 0x14589fdb2
14589fd20: 4c8d05c1a73501 lea r8, [rip + 0x135a7c1]
14589fd27: 488b9588010000 mov rdx, qword ptr [rbp + 0x188]
14589fd2e: e810495000 call 0x145da4643
14589fd33: 90 nop
14589fd34: eb7c jmp 0x14589fdb2
14589fd36: 4c8d05c3a73501 lea r8, [rip + 0x135a7c3]
14589fd3d: 4889d9 mov rcx, rbx
14589fd40: 488b9588010000 mov rdx, qword ptr [rbp + 0x188]
14589fd47: e8f7485000 call 0x145da4643
14589fd4c: 90 nop
14589fd4d: eb63 jmp 0x14589fdb2
14589fd4f: 4c8d0562a33501 lea r8, [rip + 0x135a362]
14589fd56: 488b9540010000 mov rdx, qword ptr [rbp + 0x140]
14589fd5d: e8e1485000 call 0x145da4643
14589fd62: 90 nop
14589fd63: eb4d jmp 0x14589fdb2
14589fd65: 48ffc1 inc rcx
14589fd68: 4c8d0561a33501 lea r8, [rip + 0x135a361]
14589fd6f: 488b9540010000 mov rdx, qword ptr [rbp + 0x140]
14589fd76: e8c8485000 call 0x145da4643
14589fd7b: 90 nop
14589fd7c: eb34 jmp 0x14589fdb2
14589fd7e: 4c8d45b8 lea r8, [rbp - 0x48]
14589fd82: e889311000 call 0x1459a2f10
14589fd87: 90 nop
14589fd88: e90df6ffff jmp 0x14589f39a
14589fd8d: 4c8d0524a73501 lea r8, [rip + 0x135a724]
14589fd94: 4889f1 mov rcx, rsi
14589fd97: 4c89e2 mov rdx, r12
14589fd9a: e8a4485000 call 0x145da4643
14589fd9f: 90 nop
14589fda0: eb10 jmp 0x14589fdb2
14589fda2: b908000000 mov ecx, 8
14589fda7: ba08000000 mov edx, 8
14589fdac: e8fa445000 call 0x145da42ab
14589fdb1: 90 nop
14589fdb2: 0f0b ud2
