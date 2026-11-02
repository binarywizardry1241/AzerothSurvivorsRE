0x145926c90: 55 push rbp
0x145926c91: 4157 push r15
0x145926c93: 4156 push r14
0x145926c95: 4155 push r13
0x145926c97: 4154 push r12
0x145926c99: 56 push rsi
0x145926c9a: 57 push rdi
0x145926c9b: 53 push rbx
0x145926c9c: 4881ecd8010000 sub rsp, 0x1d8
0x145926ca3: 488dac2480000000 lea rbp, [rsp + 0x80]
0x145926cab: 440f29bd40010000 movaps xmmword ptr [rbp + 0x140], xmm15
0x145926cb3: 440f29b530010000 movaps xmmword ptr [rbp + 0x130], xmm14
0x145926cbb: 440f29ad20010000 movaps xmmword ptr [rbp + 0x120], xmm13
0x145926cc3: 440f29a510010000 movaps xmmword ptr [rbp + 0x110], xmm12
0x145926ccb: 440f299d00010000 movaps xmmword ptr [rbp + 0x100], xmm11
0x145926cd3: 440f2995f0000000 movaps xmmword ptr [rbp + 0xf0], xmm10
0x145926cdb: 440f298de0000000 movaps xmmword ptr [rbp + 0xe0], xmm9
0x145926ce3: 440f2985d0000000 movaps xmmword ptr [rbp + 0xd0], xmm8
0x145926ceb: 0f29bdc0000000 movaps xmmword ptr [rbp + 0xc0], xmm7
0x145926cf2: 0f29b5b0000000 movaps xmmword ptr [rbp + 0xb0], xmm6
0x145926cf9: 48c785a8000000feffffff mov qword ptr [rbp + 0xa8], 0xfffffffffffffffe
0x145926d04: 4989cc mov r12, rcx
0x145926d07: 0fb68104030000 movzx eax, byte ptr [rcx + 0x304]
0x145926d0e: 04fe add al, 0xfe
0x145926d10: 3c09 cmp al, 9
0x145926d12: 7726 ja 0x145926d3a
0x145926d14: 0fb6c0 movzx eax, al
0x145926d17: 488d0dfa5d9001 lea rcx, [rip + 0x1905dfa]
0x145926d1e: 488b34c1 mov rsi, qword ptr [rcx + rax*8]
0x145926d22: 410fb6842405030000 movzx eax, byte ptr [r12 + 0x305]
0x145926d2b: 04fe add al, 0xfe
0x145926d2d: 3c06 cmp al, 6
0x145926d2f: 761f jbe 0x145926d50
0x145926d31: 488d1518882b01 lea rdx, [rip + 0x12b8818]
0x145926d38: eb24 jmp 0x145926d5e
0x145926d3a: 488d35a7992b01 lea rsi, [rip + 0x12b99a7]
0x145926d41: 410fb6842405030000 movzx eax, byte ptr [r12 + 0x305]
0x145926d4a: 04fe add al, 0xfe
0x145926d4c: 3c06 cmp al, 6
0x145926d4e: 77e1 ja 0x145926d31
0x145926d50: 0fb6c0 movzx eax, al
0x145926d53: 488d0d4e5d9001 lea rcx, [rip + 0x1905d4e]
0x145926d5a: 488b14c1 mov rdx, qword ptr [rcx + rax*8]
0x145926d5e: 4d8bbc24c8070000 mov r15, qword ptr [r12 + 0x7c8]
0x145926d66: 4a8d3cfd00000000 lea rdi, [r15*8]
0x145926d6e: 4c89f8 mov rax, r15
0x145926d71: 48c1e83d shr rax, 0x3d
0x145926d75: 0f95c0 setne al
0x145926d78: 48b9fcffffffffffff7f movabs rcx, 0x7ffffffffffffffc
0x145926d82: 4839cf cmp rdi, rcx
0x145926d85: 0f97c1 seta cl
0x145926d88: 08c1 or cl, al
0x145926d8a: 7410 je 0x145926d9c
0x145926d8c: 4531f6 xor r14d, r14d
0x145926d8f: 4c89f1 mov rcx, r14
0x145926d92: 4889fa mov rdx, rdi
0x145926d95: e821254700 call 0x145d992bb
0x145926d9a: 0f0b ud2
0x145926d9c: 48899590000000 mov qword ptr [rbp + 0x90], rdx
0x145926da3: 498b9c24c0070000 mov rbx, qword ptr [r12 + 0x7c0]
0x145926dab: 4885ff test rdi, rdi
0x145926dae: 7425 je 0x145926dd5
0x145926db0: e84bb46dfa call 0x140002200
0x145926db5: 41be04000000 mov r14d, 4
0x145926dbb: ba04000000 mov edx, 4
0x145926dc0: 4889f9 mov rcx, rdi
0x145926dc3: e8f8b36dfa call 0x1400021c0
0x145926dc8: 4885c0 test rax, rax
0x145926dcb: 74c2 je 0x145926d8f
0x145926dcd: 4989c5 mov r13, rax
0x145926dd0: 4c89f8 mov rax, r15
0x145926dd3: eb08 jmp 0x145926ddd
0x145926dd5: 41bd04000000 mov r13d, 4
0x145926ddb: 31c0 xor eax, eax
0x145926ddd: 48897530 mov qword ptr [rbp + 0x30], rsi
0x145926de1: 48894560 mov qword ptr [rbp + 0x60], rax
0x145926de5: 4c896d68 mov qword ptr [rbp + 0x68], r13
0x145926de9: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
0x145926df1: 4d85ff test r15, r15
0x145926df4: 7418 je 0x145926e0e
0x145926df6: 4c89e9 mov rcx, r13
0x145926df9: 4889c6 mov rsi, rax
0x145926dfc: 4889da mov rdx, rbx
0x145926dff: 4989f8 mov r8, rdi
0x145926e02: e8e0322d00 call 0x145bfa0e7
0x145926e07: 4889f0 mov rax, rsi
0x145926e0a: 4c897d70 mov qword ptr [rbp + 0x70], r15
0x145926e0e: 498b5c2460 mov rbx, qword ptr [r12 + 0x60]
0x145926e13: 4885db test rbx, rbx
0x145926e16: 0f84a9000000 je 0x145926ec5
0x145926e1c: f3410f10b424340a0000 movss xmm6, dword ptr [r12 + 0xa34]
0x145926e26: 4d8b742458 mov r14, qword ptr [r12 + 0x58]
0x145926e2b: 48c1e304 shl rbx, 4
0x145926e2f: 4c01f3 add rbx, r14
0x145926e32: 4c89e0 mov rax, r12
0x145926e35: 4d8ba424f0070000 mov r12, qword ptr [r12 + 0x7f0]
0x145926e3d: 48894550 mov qword ptr [rbp + 0x50], rax
0x145926e41: 488bb0f8070000 mov rsi, qword ptr [rax + 0x7f8]
0x145926e48: 488d7d60 lea rdi, [rbp + 0x60]
0x145926e4c: eb21 jmp 0x145926e6f
0x145926e4e: 6690 nop
0x145926e50: 488b4568 mov rax, qword ptr [rbp + 0x68]
0x145926e54: 46882cf8 mov byte ptr [rax + r15*8], r13b
0x145926e58: f3420f117cf804 movss dword ptr [rax + r15*8 + 4], xmm7
0x145926e5f: 49ffc7 inc r15
0x145926e62: 4c897d70 mov qword ptr [rbp + 0x70], r15
0x145926e66: 4983c610 add r14, 0x10
0x145926e6a: 4939de cmp r14, rbx
0x145926e6d: 7444 je 0x145926eb3
0x145926e6f: 410f2e760c ucomiss xmm6, dword ptr [r14 + 0xc]
0x145926e74: 73f0 jae 0x145926e66
0x145926e76: 498b06 mov rax, qword ptr [r14]
0x145926e79: 4839f0 cmp rax, rsi
0x145926e7c: 73e8 jae 0x145926e66
0x145926e7e: 48c1e006 shl rax, 6
0x145926e82: 41803c040f cmp byte ptr [r12 + rax], 0xf
0x145926e87: 75dd jne 0x145926e66
0x145926e89: 4c01e0 add rax, r12
0x145926e8c: 440fb66801 movzx r13d, byte ptr [rax + 1]
0x145926e91: 418b4e08 mov ecx, dword ptr [r14 + 8]
0x145926e95: 0f57ff xorps xmm7, xmm7
0x145926e98: f3480f2af9 cvtsi2ss xmm7, rcx
0x145926e9d: f30f597804 mulss xmm7, dword ptr [rax + 4]
0x145926ea2: 4c3b7d60 cmp r15, qword ptr [rbp + 0x60]
0x145926ea6: 75a8 jne 0x145926e50
0x145926ea8: 4889f9 mov rcx, rdi
0x145926eab: e870f62f00 call 0x145c26520
0x145926eb0: 90 nop
0x145926eb1: eb9d jmp 0x145926e50
0x145926eb3: 488b4560 mov rax, qword ptr [rbp + 0x60]
0x145926eb7: 48894548 mov qword ptr [rbp + 0x48], rax
0x145926ebb: 4c8b6d68 mov r13, qword ptr [rbp + 0x68]
0x145926ebf: 4c8b6550 mov r12, qword ptr [rbp + 0x50]
0x145926ec3: eb04 jmp 0x145926ec9
0x145926ec5: 48894548 mov qword ptr [rbp + 0x48], rax
0x145926ec9: 418b8424d8040000 mov eax, dword ptr [r12 + 0x4d8]
0x145926ed1: f3480f2ae8 cvtsi2ss xmm5, rax
0x145926ed6: f30f582de6614a00 addss xmm5, dword ptr [rip + 0x4a61e6]
0x145926ede: f3440f102d090b4c00 movss xmm13, dword ptr [rip + 0x4c0b09]
0x145926ee7: f3440f102570964c00 movss xmm12, dword ptr [rip + 0x4c9670]
0x145926ef0: f3440f59e5 mulss xmm12, xmm5
0x145926ef5: f30f1005a3634700 movss xmm0, dword ptr [rip + 0x4763a3]
0x145926efd: 0f294510 movaps xmmword ptr [rbp + 0x10], xmm0
0x145926f01: f3440f58e0 addss xmm12, xmm0
0x145926f06: 488b7530 mov rsi, qword ptr [rbp + 0x30]
0x145926f0a: f30f10a684000000 movss xmm4, dword ptr [rsi + 0x84]
0x145926f12: f30f1005aedb4a00 movss xmm0, dword ptr [rip + 0x4adbae]
0x145926f1a: f3480f2ccd cvttss2si rcx, xmm5
0x145926f1f: 31c0 xor eax, eax
0x145926f21: 0f57db xorps xmm3, xmm3
0x145926f24: 0f57d2 xorps xmm2, xmm2
0x145926f27: 0f295500 movaps xmmword ptr [rbp], xmm2
0x145926f2b: 0f2eeb ucomiss xmm5, xmm3
0x145926f2e: 0f28dd movaps xmm3, xmm5
0x145926f31: 0f42c8 cmovb ecx, eax
0x145926f34: f30f59c5 mulss xmm0, xmm5
0x145926f38: 0f2e2d01bf4a00 ucomiss xmm5, dword ptr [rip + 0x4abf01]
0x145926f3f: baffffffff mov edx, 0xffffffff
0x145926f44: 0f46d1 cmovbe edx, ecx
0x145926f47: f30f5805e1dd4b00 addss xmm0, dword ptr [rip + 0x4bdde1]
0x145926f4f: ffc2 inc edx
0x145926f51: 41b889888888 mov r8d, 0x88888889
0x145926f57: 4c0fafc2 imul r8, rdx
0x145926f5b: 49c1e823 shr r8, 0x23
0x145926f5f: 4183f803 cmp r8d, 3
0x145926f63: b903000000 mov ecx, 3
0x145926f68: 410f42c8 cmovb ecx, r8d
0x145926f6c: 488b9590000000 mov rdx, qword ptr [rbp + 0x90]
0x145926f73: 4c8b4228 mov r8, qword ptr [rdx + 0x28]
0x145926f77: 4d85c0 test r8, r8
0x145926f7a: 0f84e4000000 je 0x145927064
0x145926f80: 450f28f5 movaps xmm14, xmm13
0x145926f84: 488b5220 mov rdx, qword ptr [rdx + 0x20]
0x145926f88: 4e8d04c2 lea r8, [rdx + r8*8]
0x145926f8c: f3440f102d5b0a4c00 movss xmm13, dword ptr [rip + 0x4c0a5b]
0x145926f95: f30f100deb5e4a00 movss xmm1, dword ptr [rip + 0x4a5eeb]
0x145926f9d: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
0x145926fa4: 0f57f6 xorps xmm6, xmm6
0x145926fa7: f30f103df1624700 movss xmm7, dword ptr [rip + 0x4762f1]
0x145926faf: 4c8d0d365c9001 lea r9, [rip + 0x1905c36]
0x145926fb6: 440f28c7 movaps xmm8, xmm7
0x145926fba: 440f28df movaps xmm11, xmm7
0x145926fbe: 440f28cf movaps xmm9, xmm7
0x145926fc2: 450f57d2 xorps xmm10, xmm10
0x145926fc6: 0f297d50 movaps xmmword ptr [rbp + 0x50], xmm7
0x145926fca: 0f295520 movaps xmmword ptr [rbp + 0x20], xmm2
0x145926fce: eb1d jmp 0x145926fed
0x145926fd0: 0f286d20 movaps xmm5, xmmword ptr [rbp + 0x20]
0x145926fd4: f30f58ea addss xmm5, xmm2
0x145926fd8: 0f296d20 movaps xmmword ptr [rbp + 0x20], xmm5
0x145926fdc: 0f1f4000 nop dword ptr [rax]
0x145926fe0: 4883c208 add rdx, 8
0x145926fe4: 4c39c2 cmp rdx, r8
0x145926fe7: 0f84ab000000 je 0x145927098
0x145926fed: 448b12 mov r10d, dword ptr [rdx]
0x145926ff0: f30f105204 movss xmm2, dword ptr [rdx + 4]
0x145926ff5: 4f631491 movsxd r10, dword ptr [r9 + r10*4]
0x145926ff9: 4d01ca add r10, r9
0x145926ffc: 41ffe2 jmp r10
0x145926fff: f3440f58c2 addss xmm8, xmm2
0x145927004: ebda jmp 0x145926fe0
0x145927006: 0f288d90000000 movaps xmm1, xmmword ptr [rbp + 0x90]
0x14592700d: f30f58ca addss xmm1, xmm2
0x145927011: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
0x145927018: ebc6 jmp 0x145926fe0
0x14592701a: 0f284d50 movaps xmm1, xmmword ptr [rbp + 0x50]
0x14592701e: f30f58ca addss xmm1, xmm2
0x145927022: 0f294d50 movaps xmmword ptr [rbp + 0x50], xmm1
0x145927026: ebb8 jmp 0x145926fe0
0x145927028: f30f58f2 addss xmm6, xmm2
0x14592702c: ebb2 jmp 0x145926fe0
0x14592702e: f3440f58da addss xmm11, xmm2
0x145927033: ebab jmp 0x145926fe0
0x145927035: f30f58d7 addss xmm2, xmm7
0x145927039: f3440f59ea mulss xmm13, xmm2
0x14592703e: eba0 jmp 0x145926fe0
0x145927040: f3440f58e2 addss xmm12, xmm2
0x145927045: eb99 jmp 0x145926fe0
0x145927047: f30f58e2 addss xmm4, xmm2
0x14592704b: eb93 jmp 0x145926fe0
0x14592704d: f30f58c2 addss xmm0, xmm2
0x145927051: eb8d jmp 0x145926fe0
0x145927053: f3440f58d2 addss xmm10, xmm2
0x145927058: eb86 jmp 0x145926fe0
0x14592705a: f3440f58ca addss xmm9, xmm2
0x14592705f: e97cffffff jmp 0x145926fe0
0x145927064: f30f100d1c5e4a00 movss xmm1, dword ptr [rip + 0x4a5e1c]
0x14592706c: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
0x145927073: 0f295520 movaps xmmword ptr [rbp + 0x20], xmm2
0x145927077: f3440f100520624700 movss xmm8, dword ptr [rip + 0x476220]
0x145927080: 440f294550 movaps xmmword ptr [rbp + 0x50], xmm8
0x145927085: 450f57d2 xorps xmm10, xmm10
0x145927089: 450f28c8 movaps xmm9, xmm8
0x14592708d: 450f28f5 movaps xmm14, xmm13
0x145927091: 450f28d8 movaps xmm11, xmm8
0x145927095: 0f57f6 xorps xmm6, xmm6
0x145927098: f3410f59de mulss xmm3, xmm14
0x14592709d: 498b942468030000 mov rdx, qword ptr [r12 + 0x368]
0x1459270a5: 4885d2 test rdx, rdx
0x1459270a8: 7449 je 0x1459270f3
0x1459270aa: 4d8b842460030000 mov r8, qword ptr [r12 + 0x360]
0x1459270b2: 48c1e203 shl rdx, 3
0x1459270b6: 31c0 xor eax, eax
0x1459270b8: f30f1015e0614700 movss xmm2, dword ptr [rip + 0x4761e0]
0x1459270c0: 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
0x1459270c4: f30f103d3cdc4a00 movss xmm7, dword ptr [rip + 0x4adc3c]
0x1459270cc: 0f57d2 xorps xmm2, xmm2
0x1459270cf: 0f295500 movaps xmmword ptr [rbp], xmm2
0x1459270d3: 458b1400 mov r10d, dword ptr [r8 + rax]
0x1459270d7: 4c8d0d3e5b9001 lea r9, [rip + 0x1905b3e]
0x1459270de: 4f631c91 movsxd r11, dword ptr [r9 + r10*4]
0x1459270e2: 4d01cb add r11, r9
0x1459270e5: f30f1195a0000000 movss dword ptr [rbp + 0xa0], xmm2
0x1459270ed: 4531d2 xor r10d, r10d
0x1459270f0: 41ffe3 jmp r11
0x1459270f3: f30f103d0ddc4a00 movss xmm7, dword ptr [rip + 0x4adc0d]
0x1459270fb: 0f57d2 xorps xmm2, xmm2
0x1459270fe: f30f1195a0000000 movss dword ptr [rbp + 0xa0], xmm2
0x145927106: eb00 jmp 0x145927108
0x145927108: f30f589e80000000 addss xmm3, dword ptr [rsi + 0x80]
0x145927110: f30f115dfc movss dword ptr [rbp - 4], xmm3
0x145927115: 4d8b842438030000 mov r8, qword ptr [r12 + 0x338]
0x14592711d: 4d85c0 test r8, r8
0x145927120: 743f je 0x145927161
0x145927122: 440f294d30 movaps xmmword ptr [rbp + 0x30], xmm9
0x145927127: 498b942430030000 mov rdx, qword ptr [r12 + 0x330]
0x14592712f: 49c1e003 shl r8, 3
0x145927133: 4f8d0440 lea r8, [r8 + r8*2]
0x145927137: 450f57ff xorps xmm15, xmm15
0x14592713b: 4531c9 xor r9d, r9d
0x14592713e: f3460f104c0a10 movss xmm9, dword ptr [rdx + r9 + 0x10]
0x145927145: 4e8b1c0a mov r11, qword ptr [rdx + r9]
0x145927149: 410fb67344 movzx esi, byte ptr [r11 + 0x44]
0x14592714e: 4c8d15fb5a9001 lea r10, [rip + 0x1905afb]
0x145927155: 496334b2 movsxd rsi, dword ptr [r10 + rsi*4]
0x145927159: 4c01d6 add rsi, r10
0x14592715c: 0f57db xorps xmm3, xmm3
0x14592715f: ffe6 jmp rsi
0x145927161: 450f57ff xorps xmm15, xmm15
0x145927165: 0f57db xorps xmm3, xmm3
0x145927168: e98e010000 jmp 0x1459272fb
0x14592716d: f3470f58641004 addss xmm12, dword ptr [r8 + r10 + 4]
0x145927174: 4983c208 add r10, 8
0x145927178: 4c39d2 cmp rdx, r10
0x14592717b: 0f855f010000 jne 0x1459272e0
0x145927181: eb85 jmp 0x145927108
0x145927183: f3430f58741004 addss xmm6, dword ptr [r8 + r10 + 4]
0x14592718a: 4983c208 add r10, 8
0x14592718e: 4c39d2 cmp rdx, r10
0x145927191: 0f8549010000 jne 0x1459272e0
0x145927197: e96cffffff jmp 0x145927108
0x14592719c: f30f1095a0000000 movss xmm2, dword ptr [rbp + 0xa0]
0x1459271a4: f3430f58541004 addss xmm2, dword ptr [r8 + r10 + 4]
0x1459271ab: f30f1195a0000000 movss dword ptr [rbp + 0xa0], xmm2
0x1459271b3: 4983c208 add r10, 8
0x1459271b7: 4c39d2 cmp rdx, r10
0x1459271ba: 0f8520010000 jne 0x1459272e0
0x1459271c0: e943ffffff jmp 0x145927108
0x1459271c5: 0f288d90000000 movaps xmm1, xmmword ptr [rbp + 0x90]
0x1459271cc: f3430f584c1004 addss xmm1, dword ptr [r8 + r10 + 4]
0x1459271d3: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
0x1459271da: 4983c208 add r10, 8
0x1459271de: 4c39d2 cmp rdx, r10
0x1459271e1: 0f85f9000000 jne 0x1459272e0
0x1459271e7: e91cffffff jmp 0x145927108
0x1459271ec: f3430f587c1004 addss xmm7, dword ptr [r8 + r10 + 4]
0x1459271f3: 4983c208 add r10, 8
0x1459271f7: 4c39d2 cmp rdx, r10
0x1459271fa: 0f85e0000000 jne 0x1459272e0
0x145927200: e903ffffff jmp 0x145927108
0x145927205: f3470f585c1004 addss xmm11, dword ptr [r8 + r10 + 4]
0x14592720c: 4983c208 add r10, 8
0x145927210: 4c39d2 cmp rdx, r10
0x145927213: 0f85c7000000 jne 0x1459272e0
0x145927219: e9eafeffff jmp 0x145927108
0x14592721e: f3430f58641004 addss xmm4, dword ptr [r8 + r10 + 4]
0x145927225: 4983c208 add r10, 8
0x145927229: 4c39d2 cmp rdx, r10
0x14592722c: 0f85ae000000 jne 0x1459272e0
0x145927232: e9d1feffff jmp 0x145927108
0x145927237: f3430f58441004 addss xmm0, dword ptr [r8 + r10 + 4]
0x14592723e: 4983c208 add r10, 8
0x145927242: 4c39d2 cmp rdx, r10
0x145927245: 0f8595000000 jne 0x1459272e0
0x14592724b: e9b8feffff jmp 0x145927108
0x145927250: 410f28d5 movaps xmm2, xmm13
0x145927254: f3470f106c1004 movss xmm13, dword ptr [r8 + r10 + 4]
0x14592725b: f3440f582d3c604700 addss xmm13, dword ptr [rip + 0x47603c]
0x145927264: f3440f59ea mulss xmm13, xmm2
0x145927269: 4983c208 add r10, 8
0x14592726d: 4c39d2 cmp rdx, r10
0x145927270: 756e jne 0x1459272e0
0x145927272: e991feffff jmp 0x145927108
0x145927277: 0f284d50 movaps xmm1, xmmword ptr [rbp + 0x50]
0x14592727b: f3430f584c1004 addss xmm1, dword ptr [r8 + r10 + 4]
0x145927282: 0f294d50 movaps xmmword ptr [rbp + 0x50], xmm1
0x145927286: 4983c208 add r10, 8
0x14592728a: 4c39d2 cmp rdx, r10
0x14592728d: 7551 jne 0x1459272e0
0x14592728f: e974feffff jmp 0x145927108
0x145927294: 0f285510 movaps xmm2, xmmword ptr [rbp + 0x10]
0x145927298: f3430f58541004 addss xmm2, dword ptr [r8 + r10 + 4]
0x14592729f: 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
0x1459272a3: 4983c208 add r10, 8
0x1459272a7: 4c39d2 cmp rdx, r10
0x1459272aa: 7534 jne 0x1459272e0
0x1459272ac: e957feffff jmp 0x145927108
0x1459272b1: 4303441004 add eax, dword ptr [r8 + r10 + 4]
0x1459272b6: 4983c208 add r10, 8
0x1459272ba: 4c39d2 cmp rdx, r10
0x1459272bd: 7521 jne 0x1459272e0
0x1459272bf: e944feffff jmp 0x145927108
0x1459272c4: 0f285500 movaps xmm2, xmmword ptr [rbp]
0x1459272c8: f3430f58541004 addss xmm2, dword ptr [r8 + r10 + 4]
0x1459272cf: 0f295500 movaps xmmword ptr [rbp], xmm2
0x1459272d3: 4983c208 add r10, 8
0x1459272d7: 4c39d2 cmp rdx, r10
0x1459272da: 0f8428feffff je 0x145927108
0x1459272e0: 478b1c10 mov r11d, dword ptr [r8 + r10]
0x1459272e4: 4f631c99 movsxd r11, dword ptr [r9 + r11*4]
0x1459272e8: 4d01cb add r11, r9
0x1459272eb: 41ffe3 jmp r11
0x1459272ee: f30f5d1dfeae4b00 minss xmm3, dword ptr [rip + 0x4baefe]
0x1459272f6: 440f284d30 movaps xmm9, xmmword ptr [rbp + 0x30]
0x1459272fb: 440f2955e0 movaps xmmword ptr [rbp - 0x20], xmm10
0x145927300: f3440f1015f35d4a00 movss xmm10, dword ptr [rip + 0x4a5df3]
0x145927309: 4d85ff test r15, r15
0x14592730c: 0f295dc0 movaps xmmword ptr [rbp - 0x40], xmm3
0x145927310: 743c je 0x14592734e
0x145927312: 49c1e703 shl r15, 3
0x145927316: f30f102dde5d4a00 movss xmm5, dword ptr [rip + 0x4a5dde]
0x14592731e: 450f57f6 xorps xmm14, xmm14
0x145927322: 31d2 xor edx, edx
0x145927324: 450fb64c1500 movzx r9d, byte ptr [r13 + rdx]
0x14592732a: 4c8d056b599001 lea r8, [rip + 0x190596b]
0x145927331: 4f630c88 movsxd r9, dword ptr [r8 + r9*4]
0x145927335: 4d01c1 add r9, r8
0x145927338: 0f57c9 xorps xmm1, xmm1
0x14592733b: f30f118da4000000 movss dword ptr [rbp + 0xa4], xmm1
0x145927343: f30f118d8c000000 movss dword ptr [rbp + 0x8c], xmm1
0x14592734b: 41ffe1 jmp r9
0x14592734e: 0f28df movaps xmm3, xmm7
0x145927351: 440f296dd0 movaps xmmword ptr [rbp - 0x30], xmm13
0x145927356: 0f28ad90000000 movaps xmm5, xmmword ptr [rbp + 0x90]
0x14592735d: 440f294d30 movaps xmmword ptr [rbp + 0x30], xmm9
0x145927362: 0f57c9 xorps xmm1, xmm1
0x145927365: f30f118da4000000 movss dword ptr [rbp + 0xa4], xmm1
0x14592736d: 450f57ed xorps xmm13, xmm13
0x145927371: 450f57f6 xorps xmm14, xmm14
0x145927375: f3410f109424340a0000 movss xmm2, dword ptr [r12 + 0xa34]
0x14592737f: 4d8b842478030000 mov r8, qword ptr [r12 + 0x378]
0x145927387: 498b942480030000 mov rdx, qword ptr [r12 + 0x380]
0x14592738f: 488d1452 lea rdx, [rdx + rdx*2]
0x145927393: 498d14d0 lea rdx, [r8 + rdx*8]
0x145927397: f3440f100d005f4700 movss xmm9, dword ptr [rip + 0x475f00]
0x1459273a0: f3450f58cf addss xmm9, xmm15
0x1459273a5: f30f103df75e4700 movss xmm7, dword ptr [rip + 0x475ef7]
0x1459273ad: 4d89c1 mov r9, r8
0x1459273b0: 4939d1 cmp r9, rdx
0x1459273b3: 0f8486000000 je 0x14592743f
0x1459273b9: 4d8d4118 lea r8, [r9 + 0x18]
0x1459273bd: 410f2e5110 ucomiss xmm2, dword ptr [r9 + 0x10]
0x1459273c2: 4d89c1 mov r9, r8
0x1459273c5: 73e9 jae 0x1459273b0
0x1459273c7: 458b48e8 mov r9d, dword ptr [r8 - 0x18]
0x1459273cb: 4183f908 cmp r9d, 8
0x1459273cf: 743f je 0x145927410
0x1459273d1: 4183f909 cmp r9d, 9
0x1459273d5: 7518 jne 0x1459273ef
0x1459273d7: 410f28cf movaps xmm1, xmm15
0x1459273db: f3450f1078ec movss xmm15, dword ptr [r8 - 0x14]
0x1459273e1: f3450f59f9 mulss xmm15, xmm9
0x1459273e6: f3410f58f7 addss xmm6, xmm15
0x1459273eb: 440f28f9 movaps xmm15, xmm1
0x1459273ef: 458b48f4 mov r9d, dword ptr [r8 - 0xc]
0x1459273f3: 4181f9d15b0000 cmp r9d, 0x5bd1
0x1459273fa: 7439 je 0x145927435
0x1459273fc: 4181f99b5b0000 cmp r9d, 0x5b9b
0x145927403: 75a8 jne 0x1459273ad
0x145927405: f3440f581dee5c4a00 addss xmm11, dword ptr [rip + 0x4a5cee]
0x14592740e: eb9d jmp 0x1459273ad
0x145927410: 410f28cf movaps xmm1, xmm15
0x145927414: f3450f1078ec movss xmm15, dword ptr [r8 - 0x14]
0x14592741a: f3450f59f9 mulss xmm15, xmm9
0x14592741f: f3450f58e7 addss xmm12, xmm15
0x145927424: 440f28f9 movaps xmm15, xmm1
0x145927428: 458b48f4 mov r9d, dword ptr [r8 - 0xc]
0x14592742c: 4181f9d15b0000 cmp r9d, 0x5bd1
0x145927433: 75c7 jne 0x1459273fc
0x145927435: f3440f58e7 addss xmm12, xmm7
0x14592743a: e96effffff jmp 0x1459273ad
0x14592743f: f30f10bda0000000 movss xmm7, dword ptr [rbp + 0xa0]
0x145927447: f3440f104dfc movss xmm9, dword ptr [rbp - 4]
0x14592744d: f3410f58f9 addss xmm7, xmm9
0x145927452: f3410f59f8 mulss xmm7, xmm8
0x145927457: f30f1015415e4700 movss xmm2, dword ptr [rip + 0x475e41]
0x14592745f: f3440f5fca maxss xmm9, xmm2
0x145927464: 450f28c7 movaps xmm8, xmm15
0x145927468: 440f28ff movaps xmm15, xmm7
0x14592746c: f3450f5ef9 divss xmm15, xmm9
0x145927471: f3440f59ef mulss xmm13, xmm7
0x145927476: f3410f58c5 addss xmm0, xmm13
0x14592747b: f30f58f2 addss xmm6, xmm2
0x14592747f: 31d2 xor edx, edx
0x145927481: 0f2eea ucomiss xmm5, xmm2
0x145927484: 440f28ca movaps xmm9, xmm2
0x145927488: f3440f5ece divss xmm9, xmm6
0x14592748d: 0f28f7 movaps xmm6, xmm7
0x145927490: 0f28fc movaps xmm7, xmm4
0x145927493: f3410f5cfa subss xmm7, xmm10
0x145927498: 0f57d2 xorps xmm2, xmm2
0x14592749b: f30f5ffa maxss xmm7, xmm2
0x14592749f: f3440f59f7 mulss xmm14, xmm7
0x1459274a4: 0f28fc movaps xmm7, xmm4
0x1459274a7: f3410f5dfa minss xmm7, xmm10
0x1459274ac: 440f28d7 movaps xmm10, xmm7
0x1459274b0: f3440fc2d703 cmpunordss xmm10, xmm7
0x1459274b6: 450f28ea movaps xmm13, xmm10
0x1459274ba: 440f55ef andnps xmm13, xmm7
0x1459274be: 440f54d4 andps xmm10, xmm4
0x1459274c2: 450f56d5 orps xmm10, xmm13
0x1459274c6: 410f28fa movaps xmm7, xmm10
0x1459274ca: f3440f5995a4000000 mulss xmm10, dword ptr [rbp + 0xa4]
0x1459274d3: f3440f5e15345e4700 divss xmm10, dword ptr [rip + 0x475e34]
0x1459274dc: f3450f58d6 addss xmm10, xmm14
0x1459274e1: f3450f58d4 addss xmm10, xmm12
0x1459274e6: 0f28e6 movaps xmm4, xmm6
0x1459274e9: f3410f5ca42478040000 subss xmm4, dword ptr [r12 + 0x478]
0x1459274f3: f3410f11b42478040000 movss dword ptr [r12 + 0x478], xmm6
0x1459274fd: f3450f1194247c040000 movss dword ptr [r12 + 0x47c], xmm10
0x145927507: f3450f118c2480040000 movss dword ptr [r12 + 0x480], xmm9
0x145927511: f3440f100daa5b4a00 movss xmm9, dword ptr [rip + 0x4a5baa]
0x14592751a: f3450f58f9 addss xmm15, xmm9
0x14592751f: f3440f58cd addss xmm9, xmm5
0x145927524: f3440f58cb addss xmm9, xmm3
0x145927529: 440f2815ef666100 movaps xmm10, xmmword ptr [rip + 0x6166ef]
0x145927531: 450f14d1 unpcklps xmm10, xmm9
0x145927535: 0f14eb unpcklps xmm5, xmm3
0x145927538: 0f97c2 seta dl
0x14592753b: 66440f6eca movd xmm9, edx
0x145927540: 66450f70c900 pshufd xmm9, xmm9, 0
0x145927546: 66410f72f11f pslld xmm9, 0x1f
0x14592754c: 66410f72e11f psrad xmm9, 0x1f
0x145927552: 450f54d1 andps xmm10, xmm9
0x145927556: 440f55cd andnps xmm9, xmm5
0x14592755a: 450f56ca orps xmm9, xmm10
0x14592755e: 450f138c2484040000 movlps qword ptr [r12 + 0x484], xmm9
0x145927567: f3440f5d1df8219001 minss xmm11, dword ptr [rip + 0x19021f8]
0x145927570: 410f28eb movaps xmm5, xmm11
0x145927574: f3450f119c248c040000 movss dword ptr [r12 + 0x48c], xmm11
0x14592757e: 0f285dd0 movaps xmm3, xmmword ptr [rbp - 0x30]
0x145927582: f3410f119c2490040000 movss dword ptr [r12 + 0x490], xmm3
0x14592758c: 0f285d30 movaps xmm3, xmmword ptr [rbp + 0x30]
0x145927590: f3410f119c2494040000 movss dword ptr [r12 + 0x494], xmm3
0x14592759a: f3410f11bc2498040000 movss dword ptr [r12 + 0x498], xmm7
0x1459275a4: f3410f1184249c040000 movss dword ptr [r12 + 0x49c], xmm0
0x1459275ae: 0f284510 movaps xmm0, xmmword ptr [rbp + 0x10]
0x1459275b2: f3410f118424a0040000 movss dword ptr [r12 + 0x4a0], xmm0
0x1459275bc: 0f2845e0 movaps xmm0, xmmword ptr [rbp - 0x20]
0x1459275c0: f3410f118424a4040000 movss dword ptr [r12 + 0x4a4], xmm0
0x1459275ca: 0f284550 movaps xmm0, xmmword ptr [rbp + 0x50]
0x1459275ce: f3410f118424a8040000 movss dword ptr [r12 + 0x4a8], xmm0
0x1459275d8: 41898424ac040000 mov dword ptr [r12 + 0x4ac], eax
0x1459275e0: 0f284500 movaps xmm0, xmmword ptr [rbp]
0x1459275e4: f3410f118424b0040000 movss dword ptr [r12 + 0x4b0], xmm0
0x1459275ee: 0f284520 movaps xmm0, xmmword ptr [rbp + 0x20]
0x1459275f2: f3410f118424b4040000 movss dword ptr [r12 + 0x4b4], xmm0
0x1459275fc: f3450f118424b8040000 movss dword ptr [r12 + 0x4b8], xmm8
0x145927606: 41898c24bc040000 mov dword ptr [r12 + 0x4bc], ecx
0x14592760e: 0f2845c0 movaps xmm0, xmmword ptr [rbp - 0x40]
0x145927612: f3410f118424c0040000 movss dword ptr [r12 + 0x4c0], xmm0
0x14592761c: f3450f11bc24c4040000 movss dword ptr [r12 + 0x4c4], xmm15
0x145927626: 0f2ee2 ucomiss xmm4, xmm2
0x145927629: f3410f108c24e0040000 movss xmm1, dword ptr [r12 + 0x4e0]
0x145927633: 760e jbe 0x145927643
0x145927635: f30f58cc addss xmm1, xmm4
0x145927639: f3410f118c24e0040000 movss dword ptr [r12 + 0x4e0], xmm1
0x145927643: 4c89ad90000000 mov qword ptr [rbp + 0x90], r13
0x14592764a: 0f28d1 movaps xmm2, xmm1
0x14592764d: f30f5dd6 minss xmm2, xmm6
0x145927651: 0f28c2 movaps xmm0, xmm2
0x145927654: f30fc2c203 cmpunordss xmm0, xmm2
0x145927659: 0f28e0 movaps xmm4, xmm0
0x14592765c: 0f55e2 andnps xmm4, xmm2
0x14592765f: 0f54c1 andps xmm0, xmm1
0x145927662: 0f56c4 orps xmm0, xmm4
0x145927665: f3410f118424e0040000 movss dword ptr [r12 + 0x4e0], xmm0
0x14592766f: 0f28dd movaps xmm3, xmm5
0x145927672: f30f591d66984a00 mulss xmm3, dword ptr [rip + 0x4a9866]
0x14592767a: 0f28cb movaps xmm1, xmm3
0x14592767d: f3410f5c8c244c050000 subss xmm1, dword ptr [r12 + 0x54c]
0x145927687: 0f540da2604700 andps xmm1, xmmword ptr [rip + 0x4760a2]
0x14592768e: 0f2e0d87ae4b00 ucomiss xmm1, dword ptr [rip + 0x4bae87]
0x145927695: 0f868f000000 jbe 0x14592772a
0x14592769b: f3410f119c244c050000 movss dword ptr [r12 + 0x54c], xmm3
0x1459276a5: 458b842448050000 mov r8d, dword ptr [r12 + 0x548]
0x1459276ad: 418d4001 lea eax, [r8 + 1]
0x1459276b1: 4189842448050000 mov dword ptr [r12 + 0x548], eax
0x1459276b9: 498b942460040000 mov rdx, qword ptr [r12 + 0x460]
0x1459276c1: 488d4d60 lea rcx, [rbp + 0x60]
0x1459276c5: e8f6ddf9ff call 0x1458c54c0
0x1459276ca: 90 nop
0x1459276cb: 498bb42428060000 mov rsi, qword ptr [r12 + 0x628]
0x1459276d3: 493bb42418060000 cmp rsi, qword ptr [r12 + 0x618]
0x1459276db: 750e jne 0x1459276eb
0x1459276dd: 498d8c2418060000 lea rcx, [r12 + 0x618]
0x1459276e5: e826372d00 call 0x145bfae10
0x1459276ea: 90 nop
0x1459276eb: 498b842420060000 mov rax, qword ptr [r12 + 0x620]
0x1459276f3: 4889f1 mov rcx, rsi
0x1459276f6: 48c1e105 shl rcx, 5
0x1459276fa: 0f104560 movups xmm0, xmmword ptr [rbp + 0x60]
0x1459276fe: 0f104d70 movups xmm1, xmmword ptr [rbp + 0x70]
0x145927702: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145927707: 0f110408 movups xmmword ptr [rax + rcx], xmm0
0x14592770b: 48ffc6 inc rsi
0x14592770e: 4989b42428060000 mov qword ptr [r12 + 0x628], rsi
0x145927716: f3410f10b42478040000 movss xmm6, dword ptr [r12 + 0x478]
0x145927720: f3410f108424e0040000 movss xmm0, dword ptr [r12 + 0x4e0]
0x14592772a: 0f57ff xorps xmm7, xmm7
0x14592772d: f30f5fc7 maxss xmm0, xmm7
0x145927731: e80b2a2d00 call 0x145bfa141
0x145927736: f3480f2cc0 cvttss2si rax, xmm0
0x14592773b: 31c9 xor ecx, ecx
0x14592773d: 0f2ec7 ucomiss xmm0, xmm7
0x145927740: 0f42c1 cmovb eax, ecx
0x145927743: 0f2e05f6b64a00 ucomiss xmm0, dword ptr [rip + 0x4ab6f6]
0x14592774a: 41b8ffffffff mov r8d, 0xffffffff
0x145927750: 440f46c0 cmovbe r8d, eax
0x145927754: 498dbc24d8090000 lea rdi, [r12 + 0x9d8]
0x14592775c: 498b8424d8090000 mov rax, qword ptr [r12 + 0x9d8]
0x145927764: 4885c0 test rax, rax
0x145927767: 746e je 0x1459277d7
0x145927769: 498b8c24e0090000 mov rcx, qword ptr [r12 + 0x9e0]
0x145927771: 66ba1600 mov dx, 0x16
0x145927775: 440fb75036 movzx r10d, word ptr [rax + 0x36]
0x14592777a: 4589d3 mov r11d, r10d
0x14592777d: 4501db add r11d, r11d
0x145927780: 49c7c1ffffffff mov r9, 0xffffffffffffffff
0x145927787: 660f1f840000000000 nop word ptr [rax + rax]
0x145927790: 4d85db test r11, r11
0x145927793: 742b je 0x1459277c0
0x145927795: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
0x14592779b: 0f97c3 seta bl
0x14592779e: 80db00 sbb bl, 0
0x1459277a1: 49ffc1 inc r9
0x1459277a4: 4983c3fe add r11, -2
0x1459277a8: 80fb01 cmp bl, 1
0x1459277ab: 74e3 je 0x145927790
0x1459277ad: 440fb6d3 movzx r10d, bl
0x1459277b1: 4585d2 test r10d, r10d
0x1459277b4: 741a je 0x1459277d0
0x1459277b6: eb0b jmp 0x1459277c3
0x1459277b8: 0f1f840000000000 nop dword ptr [rax + rax]
0x1459277c0: 4d89d1 mov r9, r10
0x1459277c3: 4883e901 sub rcx, 1
0x1459277c7: 7210 jb 0x1459277d9
0x1459277c9: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
0x1459277ce: eba5 jmp 0x145927775
0x1459277d0: 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
0x1459277d5: eb2f jmp 0x145927806
0x1459277d7: 31c0 xor eax, eax
0x1459277d9: 48897d60 mov qword ptr [rbp + 0x60], rdi
0x1459277dd: 48894568 mov qword ptr [rbp + 0x68], rax
0x1459277e1: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
0x1459277e9: 4c894d78 mov qword ptr [rbp + 0x78], r9
0x1459277ed: 48c7858000000016000000 mov qword ptr [rbp + 0x80], 0x16
0x1459277f8: 488d4da0 lea rcx, [rbp - 0x60]
0x1459277fc: 488d5560 lea rdx, [rbp + 0x60]
0x145927800: e81b1efbff call 0x1458d9620
0x145927805: 90 nop
0x145927806: 0f28c6 movaps xmm0, xmm6
0x145927809: e833292d00 call 0x145bfa141
0x14592780e: f3480f2cc0 cvttss2si rax, xmm0
0x145927813: 31c9 xor ecx, ecx
0x145927815: 0f57c9 xorps xmm1, xmm1
0x145927818: 0f2ec1 ucomiss xmm0, xmm1
0x14592781b: 0f42c1 cmovb eax, ecx
0x14592781e: 0f2e051bb64a00 ucomiss xmm0, dword ptr [rip + 0x4ab61b]
0x145927825: 41b8ffffffff mov r8d, 0xffffffff
0x14592782b: 440f46c0 cmovbe r8d, eax
0x14592782f: 488b07 mov rax, qword ptr [rdi]
0x145927832: 4885c0 test rax, rax
0x145927835: 7470 je 0x1459278a7
0x145927837: 498b8c24e0090000 mov rcx, qword ptr [r12 + 0x9e0]
0x14592783f: 66ba1c00 mov dx, 0x1c
0x145927843: 440fb75036 movzx r10d, word ptr [rax + 0x36]
0x145927848: 4589d3 mov r11d, r10d
0x14592784b: 4501db add r11d, r11d
0x14592784e: 49c7c1ffffffff mov r9, 0xffffffffffffffff
0x145927855: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145927860: 4d85db test r11, r11
0x145927863: 742b je 0x145927890
0x145927865: 66423b54483a cmp dx, word ptr [rax + r9*2 + 0x3a]
0x14592786b: 0f97c3 seta bl
0x14592786e: 80db00 sbb bl, 0
0x145927871: 49ffc1 inc r9
0x145927874: 4983c3fe add r11, -2
0x145927878: 80fb01 cmp bl, 1
0x14592787b: 74e3 je 0x145927860
0x14592787d: 440fb6d3 movzx r10d, bl
0x145927881: 4585d2 test r10d, r10d
0x145927884: 741a je 0x1459278a0
0x145927886: eb0b jmp 0x145927893
0x145927888: 0f1f840000000000 nop dword ptr [rax + rax]
0x145927890: 4d89d1 mov r9, r10
0x145927893: 4883e901 sub rcx, 1
0x145927897: 7210 jb 0x1459278a9
0x145927899: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
0x14592789e: eba3 jmp 0x145927843
0x1459278a0: 4689448808 mov dword ptr [rax + r9*4 + 8], r8d
0x1459278a5: eb2f jmp 0x1459278d6
0x1459278a7: 31c0 xor eax, eax
0x1459278a9: 48897d60 mov qword ptr [rbp + 0x60], rdi
0x1459278ad: 48894568 mov qword ptr [rbp + 0x68], rax
0x1459278b1: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
0x1459278b9: 4c894d78 mov qword ptr [rbp + 0x78], r9
0x1459278bd: 48c785800000001c000000 mov qword ptr [rbp + 0x80], 0x1c
0x1459278c8: 488d4da0 lea rcx, [rbp - 0x60]
0x1459278cc: 488d5560 lea rdx, [rbp + 0x60]
0x1459278d0: e84b1dfbff call 0x1458d9620
0x1459278d5: 90 nop
0x1459278d6: f3410f10842484040000 movss xmm0, dword ptr [r12 + 0x484]
0x1459278e0: f30f5905e8594700 mulss xmm0, dword ptr [rip + 0x4759e8]
0x1459278e8: 498b8424d8090000 mov rax, qword ptr [r12 + 0x9d8]
0x1459278f0: 4885c0 test rax, rax
0x1459278f3: 0f84ec000000 je 0x1459279e5
0x1459278f9: 498bb424e0090000 mov rsi, qword ptr [r12 + 0x9e0]
0x145927901: ba55040000 mov edx, 0x455
0x145927906: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
0x14592790d: 440fb74036 movzx r8d, word ptr [rax + 0x36]
0x145927912: 4589c2 mov r10d, r8d
0x145927915: 4501d2 add r10d, r10d
0x145927918: 49c7c1ffffffff mov r9, 0xffffffffffffffff
0x14592791f: 90 nop
0x145927920: 4d85d2 test r10, r10
0x145927923: 742b je 0x145927950
0x145927925: 460fb75c483a movzx r11d, word ptr [rax + r9*2 + 0x3a]
0x14592792b: 4439da cmp edx, r11d
0x14592792e: 410f97c3 seta r11b
0x145927932: 4180db00 sbb r11b, 0
0x145927936: 49ffc1 inc r9
0x145927939: 4983c2fe add r10, -2
0x14592793d: 4180fb01 cmp r11b, 1
0x145927941: 74dd je 0x145927920
0x145927943: 450fb6c3 movzx r8d, r11b
0x145927947: 4585c0 test r8d, r8d
0x14592794a: 7418 je 0x145927964
0x14592794c: eb05 jmp 0x145927953
0x14592794e: 6690 nop
0x145927950: 4d89c1 mov r9, r8
0x145927953: 4883ee01 sub rsi, 1
0x145927957: 0f828a000000 jb 0x1459279e7
0x14592795d: 4a8b44c850 mov rax, qword ptr [rax + r9*8 + 0x50]
0x145927962: eba9 jmp 0x14592790d
0x145927964: f3420f11448808 movss dword ptr [rax + r9*4 + 8], xmm0
0x14592796b: 488b5548 mov rdx, qword ptr [rbp + 0x48]
0x14592796f: 4885d2 test rdx, rdx
0x145927972: 740f je 0x145927983
0x145927974: 48c1e203 shl rdx, 3
0x145927978: 41b804000000 mov r8d, 4
0x14592797e: e84da86dfa call 0x1400021d0
0x145927983: 0f28b5b0000000 movaps xmm6, xmmword ptr [rbp + 0xb0]
0x14592798a: 0f28bdc0000000 movaps xmm7, xmmword ptr [rbp + 0xc0]
0x145927991: 440f2885d0000000 movaps xmm8, xmmword ptr [rbp + 0xd0]
0x145927999: 440f288de0000000 movaps xmm9, xmmword ptr [rbp + 0xe0]
0x1459279a1: 440f2895f0000000 movaps xmm10, xmmword ptr [rbp + 0xf0]
0x1459279a9: 440f289d00010000 movaps xmm11, xmmword ptr [rbp + 0x100]
0x1459279b1: 440f28a510010000 movaps xmm12, xmmword ptr [rbp + 0x110]
0x1459279b9: 440f28ad20010000 movaps xmm13, xmmword ptr [rbp + 0x120]
0x1459279c1: 440f28b530010000 movaps xmm14, xmmword ptr [rbp + 0x130]
0x1459279c9: 440f28bd40010000 movaps xmm15, xmmword ptr [rbp + 0x140]
0x1459279d1: 4881c4d8010000 add rsp, 0x1d8
0x1459279d8: 5b pop rbx
0x1459279d9: 5f pop rdi
0x1459279da: 5e pop rsi
0x1459279db: 415c pop r12
0x1459279dd: 415d pop r13
0x1459279df: 415e pop r14
0x1459279e1: 415f pop r15
0x1459279e3: 5d pop rbp
0x1459279e4: c3 ret
0x1459279e5: 31c0 xor eax, eax
0x1459279e7: 66410f7ec0 movd r8d, xmm0
0x1459279ec: 48897d60 mov qword ptr [rbp + 0x60], rdi
0x1459279f0: 48894568 mov qword ptr [rbp + 0x68], rax
0x1459279f4: 48c7457000000000 mov qword ptr [rbp + 0x70], 0
0x1459279fc: 4c894d78 mov qword ptr [rbp + 0x78], r9
0x145927a00: 48c7858000000055040000 mov qword ptr [rbp + 0x80], 0x455
0x145927a0b: 488d4da0 lea rcx, [rbp - 0x60]
0x145927a0f: 488d5560 lea rdx, [rbp + 0x60]
0x145927a13: e8081cfbff call 0x1458d9620
0x145927a18: 90 nop
0x145927a19: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
0x145927a20: 488b5548 mov rdx, qword ptr [rbp + 0x48]
0x145927a24: 4885d2 test rdx, rdx
0x145927a27: 0f8547ffffff jne 0x145927974
0x145927a2d: e951ffffff jmp 0x145927983
0x145927a32: f3450f58e1 addss xmm12, xmm9
0x145927a37: e924010000 jmp 0x145927b60
0x145927a3c: f3410f58f1 addss xmm6, xmm9
0x145927a41: e91a010000 jmp 0x145927b60
0x145927a46: f3450f58c1 addss xmm8, xmm9
0x145927a4b: e910010000 jmp 0x145927b60
0x145927a50: 0f288d90000000 movaps xmm1, xmmword ptr [rbp + 0x90]
0x145927a57: f3410f58c9 addss xmm1, xmm9
0x145927a5c: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
0x145927a63: e9f8000000 jmp 0x145927b60
0x145927a68: f3410f58f9 addss xmm7, xmm9
0x145927a6d: e9ee000000 jmp 0x145927b60
0x145927a72: 0f28d4 movaps xmm2, xmm4
0x145927a75: 0f28cb movaps xmm1, xmm3
0x145927a78: 410f28dc movaps xmm3, xmm12
0x145927a7c: 440f28e7 movaps xmm12, xmm7
0x145927a80: f3410f107b40 movss xmm7, dword ptr [r11 + 0x40]
0x145927a86: f30f593d42544a00 mulss xmm7, dword ptr [rip + 0x4a5442]
0x145927a8e: 410f28ef movaps xmm5, xmm15
0x145927a92: 450f28f8 movaps xmm15, xmm8
0x145927a96: 440f28c6 movaps xmm8, xmm6
0x145927a9a: 410f28f2 movaps xmm6, xmm10
0x145927a9e: 450f28d1 movaps xmm10, xmm9
0x145927aa2: f3440f5dd7 minss xmm10, xmm7
0x145927aa7: 410f28e2 movaps xmm4, xmm10
0x145927aab: f3410fc2e203 cmpunordss xmm4, xmm10
0x145927ab1: 0f28fc movaps xmm7, xmm4
0x145927ab4: 410f55fa andnps xmm7, xmm10
0x145927ab8: 440f28d6 movaps xmm10, xmm6
0x145927abc: 410f28f0 movaps xmm6, xmm8
0x145927ac0: 450f28c7 movaps xmm8, xmm15
0x145927ac4: 440f28fd movaps xmm15, xmm5
0x145927ac8: 410f54e1 andps xmm4, xmm9
0x145927acc: 0f56e7 orps xmm4, xmm7
0x145927acf: 410f28fc movaps xmm7, xmm12
0x145927ad3: 440f28e3 movaps xmm12, xmm3
0x145927ad7: 0f28d9 movaps xmm3, xmm1
0x145927ada: f30f58e2 addss xmm4, xmm2
0x145927ade: f3440f590de1594700 mulss xmm9, dword ptr [rip + 0x4759e1]
0x145927ae7: f3450f58c1 addss xmm8, xmm9
0x145927aec: eb72 jmp 0x145927b60
0x145927aee: f3410f58c1 addss xmm0, xmm9
0x145927af3: eb6b jmp 0x145927b60
0x145927af5: 0f285510 movaps xmm2, xmmword ptr [rbp + 0x10]
0x145927af9: f3410f58d1 addss xmm2, xmm9
0x145927afe: 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
0x145927b02: eb5c jmp 0x145927b60
0x145927b04: 0f285500 movaps xmm2, xmmword ptr [rbp]
0x145927b08: f3410f58d1 addss xmm2, xmm9
0x145927b0d: 0f295500 movaps xmmword ptr [rbp], xmm2
0x145927b11: eb4d jmp 0x145927b60
0x145927b13: f3450f58d9 addss xmm11, xmm9
0x145927b18: eb46 jmp 0x145927b60
0x145927b1a: f3440f580d7d574700 addss xmm9, dword ptr [rip + 0x47577d]
0x145927b23: f3450f59e9 mulss xmm13, xmm9
0x145927b28: eb36 jmp 0x145927b60
0x145927b2a: 0f285530 movaps xmm2, xmmword ptr [rbp + 0x30]
0x145927b2e: f3410f58d1 addss xmm2, xmm9
0x145927b33: 0f295530 movaps xmmword ptr [rbp + 0x30], xmm2
0x145927b37: eb27 jmp 0x145927b60
0x145927b39: 0f284d50 movaps xmm1, xmmword ptr [rbp + 0x50]
0x145927b3d: f3410f58c9 addss xmm1, xmm9
0x145927b42: 0f294d50 movaps xmmword ptr [rbp + 0x50], xmm1
0x145927b46: eb18 jmp 0x145927b60
0x145927b48: f3450f58d1 addss xmm10, xmm9
0x145927b4d: eb11 jmp 0x145927b60
0x145927b4f: 0f285520 movaps xmm2, xmmword ptr [rbp + 0x20]
0x145927b53: f3410f58d1 addss xmm2, xmm9
0x145927b58: 0f295520 movaps xmmword ptr [rbp + 0x20], xmm2
0x145927b5c: 0f1f4000 nop dword ptr [rax]
0x145927b60: 4983c118 add r9, 0x18
0x145927b64: 4d39c8 cmp r8, r9
0x145927b67: 0f8481f7ffff je 0x1459272ee
0x145927b6d: f3460f104c0a10 movss xmm9, dword ptr [rdx + r9 + 0x10]
0x145927b74: 4e8b1c0a mov r11, qword ptr [rdx + r9]
0x145927b78: 410fb67344 movzx esi, byte ptr [r11 + 0x44]
0x145927b7d: 496334b2 movsxd rsi, dword ptr [r10 + rsi*4]
0x145927b81: 4c01d6 add rsi, r10
0x145927b84: ffe6 jmp rsi
0x145927b86: f3450f58f9 addss xmm15, xmm9
0x145927b8b: ebd3 jmp 0x145927b60
0x145927b8d: f3410f58d9 addss xmm3, xmm9
0x145927b92: ebcc jmp 0x145927b60
0x145927b94: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
0x145927ba0: 4883c208 add rdx, 8
0x145927ba4: 4939d7 cmp r15, rdx
0x145927ba7: 7419 je 0x145927bc2
0x145927ba9: 450fb64c1500 movzx r9d, byte ptr [r13 + rdx]
0x145927baf: 4f630c88 movsxd r9, dword ptr [r8 + r9*4]
0x145927bb3: 4d01c1 add r9, r8
0x145927bb6: 41ffe1 jmp r9
0x145927bb9: f3450f58641504 addss xmm12, dword ptr [r13 + rdx + 4]
0x145927bc0: ebde jmp 0x145927ba0
0x145927bc2: 440f28d5 movaps xmm10, xmm5
0x145927bc6: 0f28df movaps xmm3, xmm7
0x145927bc9: 440f296dd0 movaps xmmword ptr [rbp - 0x30], xmm13
0x145927bce: 0f28ad90000000 movaps xmm5, xmmword ptr [rbp + 0x90]
0x145927bd5: 440f294d30 movaps xmmword ptr [rbp + 0x30], xmm9
0x145927bda: f3440f10ad8c000000 movss xmm13, dword ptr [rbp + 0x8c]
0x145927be3: e98df7ffff jmp 0x145927375
0x145927be8: f30f108da4000000 movss xmm1, dword ptr [rbp + 0xa4]
0x145927bf0: f3410f584c1504 addss xmm1, dword ptr [r13 + rdx + 4]
0x145927bf7: f30f118da4000000 movss dword ptr [rbp + 0xa4], xmm1
0x145927bff: eb9f jmp 0x145927ba0
0x145927c01: f3450f587c1504 addss xmm15, dword ptr [r13 + rdx + 4]
0x145927c08: eb96 jmp 0x145927ba0
0x145927c0a: 0f2855e0 movaps xmm2, xmmword ptr [rbp - 0x20]
0x145927c0e: f3410f58541504 addss xmm2, dword ptr [r13 + rdx + 4]
0x145927c15: 0f2955e0 movaps xmmword ptr [rbp - 0x20], xmm2
0x145927c19: eb85 jmp 0x145927ba0
0x145927c1b: f3410f58641504 addss xmm4, dword ptr [r13 + rdx + 4]
0x145927c22: e979ffffff jmp 0x145927ba0
0x145927c27: 0f285500 movaps xmm2, xmmword ptr [rbp]
0x145927c2b: f3410f58541504 addss xmm2, dword ptr [r13 + rdx + 4]
0x145927c32: 0f295500 movaps xmmword ptr [rbp], xmm2
0x145927c36: e965ffffff jmp 0x145927ba0
0x145927c3b: f3450f584c1504 addss xmm9, dword ptr [r13 + rdx + 4]
0x145927c42: e959ffffff jmp 0x145927ba0
0x145927c47: 0f288d90000000 movaps xmm1, xmmword ptr [rbp + 0x90]
0x145927c4e: f3410f584c1504 addss xmm1, dword ptr [r13 + rdx + 4]
0x145927c55: 0f298d90000000 movaps xmmword ptr [rbp + 0x90], xmm1
0x145927c5c: e93fffffff jmp 0x145927ba0
0x145927c61: f30f108d8c000000 movss xmm1, dword ptr [rbp + 0x8c]
0x145927c69: f3410f584c1504 addss xmm1, dword ptr [r13 + rdx + 4]
0x145927c70: f30f118d8c000000 movss dword ptr [rbp + 0x8c], xmm1
0x145927c78: e923ffffff jmp 0x145927ba0
0x145927c7d: f3410f587c1504 addss xmm7, dword ptr [r13 + rdx + 4]
0x145927c84: e917ffffff jmp 0x145927ba0
0x145927c89: 0f285510 movaps xmm2, xmmword ptr [rbp + 0x10]
0x145927c8d: f3410f58541504 addss xmm2, dword ptr [r13 + rdx + 4]
0x145927c94: 0f295510 movaps xmmword ptr [rbp + 0x10], xmm2
0x145927c98: e903ffffff jmp 0x145927ba0
0x145927c9d: f3410f58741504 addss xmm6, dword ptr [r13 + rdx + 4]
0x145927ca4: e9f7feffff jmp 0x145927ba0
0x145927ca9: f3450f58441504 addss xmm8, dword ptr [r13 + rdx + 4]
0x145927cb0: e9ebfeffff jmp 0x145927ba0
0x145927cb5: f3450f58741504 addss xmm14, dword ptr [r13 + rdx + 4]
0x145927cbc: e9dffeffff jmp 0x145927ba0
0x145927cc1: f3410f58441504 addss xmm0, dword ptr [r13 + rdx + 4]
0x145927cc8: e9d3feffff jmp 0x145927ba0
0x145927ccd: 0f285520 movaps xmm2, xmmword ptr [rbp + 0x20]
0x145927cd1: f3410f58541504 addss xmm2, dword ptr [r13 + rdx + 4]
0x145927cd8: 0f295520 movaps xmmword ptr [rbp + 0x20], xmm2
0x145927cdc: e9bffeffff jmp 0x145927ba0
0x145927ce1: f3450f585c1504 addss xmm11, dword ptr [r13 + rdx + 4]
0x145927ce8: e9b3feffff jmp 0x145927ba0
0x145927ced: f3410f586c1504 addss xmm5, dword ptr [r13 + rdx + 4]
0x145927cf4: e9a7feffff jmp 0x145927ba0
0x145927cf9: 0f284d50 movaps xmm1, xmmword ptr [rbp + 0x50]
0x145927cfd: f3410f584c1504 addss xmm1, dword ptr [r13 + rdx + 4]
0x145927d04: 0f294d50 movaps xmmword ptr [rbp + 0x50], xmm1
0x145927d08: e993feffff jmp 0x145927ba0
0x145927d0d: 410f28d5 movaps xmm2, xmm13
0x145927d11: f3450f106c1504 movss xmm13, dword ptr [r13 + rdx + 4]
0x145927d18: f3440f582d7f554700 addss xmm13, dword ptr [rip + 0x47557f]
0x145927d21: f3440f59ea mulss xmm13, xmm2
0x145927d26: e975feffff jmp 0x145927ba0
