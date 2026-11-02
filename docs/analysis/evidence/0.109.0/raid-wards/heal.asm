14594dd30: 55 push rbp
14594dd31: 4157 push r15
14594dd33: 4156 push r14
14594dd35: 56 push rsi
14594dd36: 57 push rdi
14594dd37: 53 push rbx
14594dd38: 4881ecf8000000 sub rsp, 0xf8
14594dd3f: 488dac2480000000 lea rbp, [rsp + 0x80]
14594dd47: 0f297d60 movaps xmmword ptr [rbp + 0x60], xmm7
14594dd4b: 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
14594dd4f: 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
14594dd57: 4889ce mov rsi, rcx
14594dd5a: 488b8968050000 mov rcx, qword ptr [rcx + 0x568]
14594dd61: 4885c9 test rcx, rcx
14594dd64: 0f846e020000 je 0x14594dfd8
14594dd6a: 4489cf mov edi, r9d
14594dd6d: 4889d3 mov rbx, rdx
14594dd70: 488b8660050000 mov rax, qword ptr [rsi + 0x560]
14594dd77: 4869d1d8010000 imul rdx, rcx, 0x1d8
14594dd7e: 31c9 xor ecx, ecx
14594dd80: eb1e jmp 0x14594dda0
14594dd82: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14594dd90: 4881c1d8010000 add rcx, 0x1d8
14594dd97: 4839ca cmp rdx, rcx
14594dd9a: 0f8438020000 je 0x14594dfd8
14594dda0: 48399c08f0000000 cmp qword ptr [rax + rcx + 0xf0], rbx
14594dda8: 75e6 jne 0x14594dd90
14594ddaa: 83bc08b000000001 cmp dword ptr [rax + rcx + 0xb0], 1
14594ddb2: 74dc je 0x14594dd90
14594ddb4: f30f10840858010000 movss xmm0, dword ptr [rax + rcx + 0x158]
14594ddbd: f30f108c085c010000 movss xmm1, dword ptr [rax + rcx + 0x15c]
14594ddc6: f30f59d1 mulss xmm2, xmm1
14594ddca: f30f5cc8 subss xmm1, xmm0
14594ddce: 0f28da movaps xmm3, xmm2
14594ddd1: f30f5dd9 minss xmm3, xmm1
14594ddd5: 0f28f3 movaps xmm6, xmm3
14594ddd8: f30fc2f303 cmpunordss xmm6, xmm3
14594dddd: 0f28ce movaps xmm1, xmm6
14594dde0: 0f55cb andnps xmm1, xmm3
14594dde3: 0f54f2 andps xmm6, xmm2
14594dde6: 0f56f1 orps xmm6, xmm1
14594dde9: 0f57ff xorps xmm7, xmm7
14594ddec: f30f5ff7 maxss xmm6, xmm7
14594ddf0: 0f2efe ucomiss xmm7, xmm6
14594ddf3: 0f83df010000 jae 0x14594dfd8
14594ddf9: f30f58c6 addss xmm0, xmm6
14594ddfd: f30f11840858010000 movss dword ptr [rax + rcx + 0x158], xmm0
14594de06: e836c32a00 call 0x145bfa141
14594de0b: f3480f2cc0 cvttss2si rax, xmm0
14594de10: 31c9 xor ecx, ecx
14594de12: 0f2ec7 ucomiss xmm0, xmm7
14594de15: 0f43c8 cmovae ecx, eax
14594de18: 0f2e0521504800 ucomiss xmm0, dword ptr [rip + 0x485021]
14594de1f: 41b8ffffffff mov r8d, 0xffffffff
14594de25: 440f46c1 cmovbe r8d, ecx
14594de29: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
14594de31: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
14594de39: 488d45d8 lea rax, [rbp - 0x28]
14594de3d: 488945f0 mov qword ptr [rbp - 0x10], rax
14594de41: 0f57c0 xorps xmm0, xmm0
14594de44: 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
14594de48: 48c7451016000000 mov qword ptr [rbp + 0x10], 0x16
14594de50: 488d4db8 lea rcx, [rbp - 0x48]
14594de54: 488d55f0 lea rdx, [rbp - 0x10]
14594de58: e8c3b7f8ff call 0x1458d9620
14594de5d: 90 nop
14594de5e: c7453800000000 mov dword ptr [rbp + 0x38], 0
14594de65: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
14594de6d: 48c7452801000000 mov qword ptr [rbp + 0x28], 1
14594de75: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
14594de7d: 48837de800 cmp qword ptr [rbp - 0x18], 0
14594de82: 7443 je 0x14594dec7
14594de84: c6454701 mov byte ptr [rbp + 0x47], 1
14594de88: 488d4d20 lea rcx, [rbp + 0x20]
14594de8c: e81fb34400 call 0x145d991b0
14594de91: 90 nop
14594de92: 488b4528 mov rax, qword ptr [rbp + 0x28]
14594de96: c60000 mov byte ptr [rax], 0
14594de99: 48c7453001000000 mov qword ptr [rbp + 0x30], 1
14594dea1: c6454701 mov byte ptr [rbp + 0x47], 1
14594dea5: 488d5520 lea rdx, [rbp + 0x20]
14594dea9: 4889d9 mov rcx, rbx
14594deac: e82f14f8ff call 0x1458cf2e0
14594deb1: 90 nop
14594deb2: c6454701 mov byte ptr [rbp + 0x47], 1
14594deb6: 488d4dd8 lea rcx, [rbp - 0x28]
14594deba: 488d5520 lea rdx, [rbp + 0x20]
14594debe: e8ad22f7ff call 0x1458c0170
14594dec3: 90 nop
14594dec4: ff4538 inc dword ptr [rbp + 0x38]
14594dec7: 488b4520 mov rax, qword ptr [rbp + 0x20]
14594decb: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
14594decf: 488b5530 mov rdx, qword ptr [rbp + 0x30]
14594ded3: 48895500 mov qword ptr [rbp], rdx
14594ded7: 8b5538 mov edx, dword ptr [rbp + 0x38]
14594deda: 895508 mov dword ptr [rbp + 8], edx
14594dedd: 8b553c mov edx, dword ptr [rbp + 0x3c]
14594dee0: 89550c mov dword ptr [rbp + 0xc], edx
14594dee3: 488945f0 mov qword ptr [rbp - 0x10], rax
14594dee7: 48894df8 mov qword ptr [rbp - 8], rcx
14594deeb: c6454700 mov byte ptr [rbp + 0x47], 0
14594deef: 488d4db8 lea rcx, [rbp - 0x48]
14594def3: 488d55f0 lea rdx, [rbp - 0x10]
14594def7: e86418f7ff call 0x1458bf760
14594defc: 90 nop
14594defd: 4c8db618060000 lea r14, [rsi + 0x618]
14594df04: 4c8bbe28060000 mov r15, qword ptr [rsi + 0x628]
14594df0b: 4c3bbe18060000 cmp r15, qword ptr [rsi + 0x618]
14594df12: 7509 jne 0x14594df1d
14594df14: 4c89f1 mov rcx, r14
14594df17: e8f4ce2a00 call 0x145bfae10
14594df1c: 90 nop
14594df1d: 488b8620060000 mov rax, qword ptr [rsi + 0x620]
14594df24: 4c89f9 mov rcx, r15
14594df27: 48c1e105 shl rcx, 5
14594df2b: 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
14594df2f: 0f104dc8 movups xmm1, xmmword ptr [rbp - 0x38]
14594df33: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594df38: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594df3c: 49ffc7 inc r15
14594df3f: 4c89be28060000 mov qword ptr [rsi + 0x628], r15
14594df46: 85ff test edi, edi
14594df48: 0f8481000000 je 0x14594dfcf
14594df4e: f3480f2cc6 cvttss2si rax, xmm6
14594df53: 31c9 xor ecx, ecx
14594df55: 0f57c0 xorps xmm0, xmm0
14594df58: 0f2ef0 ucomiss xmm6, xmm0
14594df5b: 0f43c8 cmovae ecx, eax
14594df5e: 0f2e35db4e4800 ucomiss xmm6, dword ptr [rip + 0x484edb]
14594df65: b8ffffffff mov eax, 0xffffffff
14594df6a: 0f46c1 cmovbe eax, ecx
14594df6d: c6454700 mov byte ptr [rbp + 0x47], 0
14594df71: 89442420 mov dword ptr [rsp + 0x20], eax
14594df75: c644242800 mov byte ptr [rsp + 0x28], 0
14594df7a: 488d4df0 lea rcx, [rbp - 0x10]
14594df7e: 4889da mov rdx, rbx
14594df81: 4989d8 mov r8, rbx
14594df84: 4189f9 mov r9d, edi
14594df87: e8746ff7ff call 0x1458c4f00
14594df8c: 90 nop
14594df8d: 488bbe28060000 mov rdi, qword ptr [rsi + 0x628]
14594df94: 483bbe18060000 cmp rdi, qword ptr [rsi + 0x618]
14594df9b: 7509 jne 0x14594dfa6
14594df9d: 4c89f1 mov rcx, r14
14594dfa0: e86bce2a00 call 0x145bfae10
14594dfa5: 90 nop
14594dfa6: 488b8620060000 mov rax, qword ptr [rsi + 0x620]
14594dfad: 4889f9 mov rcx, rdi
14594dfb0: 48c1e105 shl rcx, 5
14594dfb4: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
14594dfb8: 0f104d00 movups xmm1, xmmword ptr [rbp]
14594dfbc: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594dfc1: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594dfc5: 48ffc7 inc rdi
14594dfc8: 4889be28060000 mov qword ptr [rsi + 0x628], rdi
14594dfcf: 488d4dd8 lea rcx, [rbp - 0x28]
14594dfd3: e8c8670600 call 0x1459b47a0
14594dfd8: 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
14594dfdc: 0f287d60 movaps xmm7, xmmword ptr [rbp + 0x60]
14594dfe0: 4881c4f8000000 add rsp, 0xf8
14594dfe7: 5b pop rbx
14594dfe8: 5f pop rdi
14594dfe9: 5e pop rsi
14594dfea: 415e pop r14
14594dfec: 415f pop r15
14594dfee: 5d pop rbp
14594dfef: c3 ret
