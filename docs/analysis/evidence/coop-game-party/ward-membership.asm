; Selected0.115.0 SHA256 0258b8a43d9ba3170b15e5fc07a646a606eb2972a5dd6aa0e6349a07ec390e2c
; Exact native health/actor-membership branches; original function bounds in manifest.
; Native range 0x145922c50..0x145922f36
0x145922c50: 55 push rbp
0x145922c51: 4157 push r15
0x145922c53: 4156 push r14
0x145922c55: 56 push rsi
0x145922c56: 57 push rdi
0x145922c57: 53 push rbx
0x145922c58: 4881ec58020000 sub rsp, 0x258
0x145922c5f: 488dac2480000000 lea rbp, [rsp + 0x80]
0x145922c67: 0f29bdc0010000 movaps xmmword ptr [rbp + 0x1c0], xmm7
0x145922c6e: 0f29b5b0010000 movaps xmmword ptr [rbp + 0x1b0], xmm6
0x145922c75: 48c785a8010000feffffff mov qword ptr [rbp + 0x1a8], 0xfffffffffffffffe
0x145922c80: 4c89cb mov rbx, r9
0x145922c83: 4889d7 mov rdi, rdx
0x145922c86: 4889ce mov rsi, rcx
0x145922c89: 4c8bbd30020000 mov r15, qword ptr [rbp + 0x230]
0x145922c90: f30f10b538020000 movss xmm6, dword ptr [rbp + 0x238]
0x145922c98: 4983f80b cmp r8, 0xb
0x145922c9c: b80b000000 mov eax, 0xb
0x145922ca1: 490f42c0 cmovb rax, r8
0x145922ca5: c1e005 shl eax, 5
0x145922ca8: 488d0d39093a01 lea rcx, [rip + 0x13a0939]
0x145922caf: 448b440810 mov r8d, dword ptr [rax + rcx + 0x10]
0x145922cb4: 448b4c0814 mov r9d, dword ptr [rax + rcx + 0x14]
0x145922cb9: 8b96c80b0000 mov edx, dword ptr [rsi + 0xbc8]
0x145922cbf: ffc2 inc edx
0x145922cc1: 8996c80b0000 mov dword ptr [rsi + 0xbc8], edx
0x145922cc7: 4589c2 mov r10d, r8d
0x145922cca: 4181e2ffffff00 and r10d, 0xffffff
0x145922cd1: 49c1e218 shl r10, 0x18
0x145922cd5: 81e2ffffff00 and edx, 0xffffff
0x145922cdb: 4c09d2 or rdx, r10
0x145922cde: 49be00000000000030f1 movabs r14, 0xf130000000000000
0x145922ce8: 4909d6 or r14, rdx
0x145922ceb: f30f5f35bdd15b00 maxss xmm6, dword ptr [rip + 0x5bd1bd]
0x145922cf3: f30f107c0818 movss xmm7, dword ptr [rax + rcx + 0x18]
0x145922cf9: 4c897c2438 mov qword ptr [rsp + 0x38], r15
0x145922cfe: f30f11742428 movss dword ptr [rsp + 0x28], xmm6
0x145922d04: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
0x145922d0a: c644243000 mov byte ptr [rsp + 0x30], 0
0x145922d0f: 4889f1 mov rcx, rsi
0x145922d12: 4c89f2 mov rdx, r14
0x145922d15: e8e6a30200 call 0x14594d100
0x145922d1a: 488b8ea8020000 mov rcx, qword ptr [rsi + 0x2a8]
0x145922d21: 488b96b0020000 mov rdx, qword ptr [rsi + 0x2b0]
0x145922d28: e8b368eeff call 0x1458095e0
0x145922d2d: 4869c0f0000000 imul rax, rax, 0xf0
0x145922d34: 488d0dcddf3901 lea rcx, [rip + 0x139dfcd]
0x145922d3b: 488b440878 mov rax, qword ptr [rax + rcx + 0x78]
0x145922d40: f30f10869c0b0000 movss xmm0, dword ptr [rsi + 0xb9c]
0x145922d48: f30f105028 movss xmm2, dword ptr [rax + 0x28]
0x145922d4d: f30f59154bd85b00 mulss xmm2, dword ptr [rip + 0x5bd84b]
0x145922d55: f30f581567c5a001 addss xmm2, dword ptr [rip + 0x1a0c567]
0x145922d5d: f30f105838 movss xmm3, dword ptr [rax + 0x38]
0x145922d62: f30f102512d65b00 movss xmm4, dword ptr [rip + 0x5bd612]
0x145922d6a: f30f59e3 mulss xmm4, xmm3
0x145922d6e: 0f57c9 xorps xmm1, xmm1
0x145922d71: 0f118d18010000 movups xmmword ptr [rbp + 0x118], xmm1
0x145922d78: 0f118d08010000 movups xmmword ptr [rbp + 0x108], xmm1
0x145922d7f: 0f118df8000000 movups xmmword ptr [rbp + 0xf8], xmm1
0x145922d86: 0f118de8000000 movups xmmword ptr [rbp + 0xe8], xmm1
0x145922d8d: 4c89b5b8000000 mov qword ptr [rbp + 0xb8], r14
0x145922d94: 48c785c000000000000000 mov qword ptr [rbp + 0xc0], 0
0x145922d9f: 48c745e0ffffffff mov qword ptr [rbp - 0x20], 0xffffffffffffffff
0x145922da7: f30f119d38010000 movss dword ptr [rbp + 0x138], xmm3
0x145922daf: f30f11953c010000 movss dword ptr [rbp + 0x13c], xmm2
0x145922db7: 418b4708 mov eax, dword ptr [r15 + 8]
0x145922dbb: 89854c010000 mov dword ptr [rbp + 0x14c], eax
0x145922dc1: 498b07 mov rax, qword ptr [r15]
0x145922dc4: 48898544010000 mov qword ptr [rbp + 0x144], rax
0x145922dcb: 498b07 mov rax, qword ptr [r15]
0x145922dce: 48898550010000 mov qword ptr [rbp + 0x150], rax
0x145922dd5: 418b4708 mov eax, dword ptr [r15 + 8]
0x145922dd9: 898558010000 mov dword ptr [rbp + 0x158], eax
0x145922ddf: f30f11855c010000 movss dword ptr [rbp + 0x15c], xmm0
0x145922de7: c7856001000000000000 mov dword ptr [rbp + 0x160], 0
0x145922df1: f30f118564010000 movss dword ptr [rbp + 0x164], xmm0
0x145922df9: f30f11a568010000 movss dword ptr [rbp + 0x168], xmm4
0x145922e01: 48c745c800000000 mov qword ptr [rbp - 0x38], 0
0x145922e09: 0f118dd0000000 movups xmmword ptr [rbp + 0xd0], xmm1
0x145922e10: 48c785e000000000000000 mov qword ptr [rbp + 0xe0], 0
0x145922e1b: 0f118d6c010000 movups xmmword ptr [rbp + 0x16c], xmm1
0x145922e22: 0f118d7c010000 movups xmmword ptr [rbp + 0x17c], xmm1
0x145922e29: 48c745d008000000 mov qword ptr [rbp - 0x30], 8
0x145922e31: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
0x145922e39: c7858c01000000000000 mov dword ptr [rbp + 0x18c], 0
0x145922e43: c7457800000000 mov dword ptr [rbp + 0x78], 0
0x145922e4a: c7858000000000000000 mov dword ptr [rbp + 0x80], 0
0x145922e54: 48c74520ffffffff mov qword ptr [rbp + 0x20], 0xffffffffffffffff
0x145922e5c: c7858800000000000000 mov dword ptr [rbp + 0x88], 0
0x145922e66: 48c785c800000000000000 mov qword ptr [rbp + 0xc8], 0
0x145922e71: 0f118d90010000 movups xmmword ptr [rbp + 0x190], xmm1
0x145922e78: c685a001000000 mov byte ptr [rbp + 0x1a0], 0
0x145922e7f: f30f11b528010000 movss dword ptr [rbp + 0x128], xmm6
0x145922e87: f30f11b52c010000 movss dword ptr [rbp + 0x12c], xmm6
0x145922e8f: 48c7853001000000000000 mov qword ptr [rbp + 0x130], 0
0x145922e9a: f30f11bd40010000 movss dword ptr [rbp + 0x140], xmm7
0x145922ea2: 0f100b movups xmm1, xmmword ptr [rbx]
0x145922ea5: 0f118d98000000 movups xmmword ptr [rbp + 0x98], xmm1
0x145922eac: 4889bda8000000 mov qword ptr [rbp + 0xa8], rdi
0x145922eb3: f30f108d40020000 movss xmm1, dword ptr [rbp + 0x240]
0x145922ebb: 0f28156ed25b00 movaps xmm2, xmmword ptr [rip + 0x5bd26e]
0x145922ec2: f30f10d1 movss xmm2, xmm1
0x145922ec6: f30f12c0 movsldup xmm0, xmm0
0x145922eca: 0f58c2 addps xmm0, xmm2
0x145922ecd: 0f1385b0000000 movlps qword ptr [rbp + 0xb0], xmm0
0x145922ed4: 488bbe80050000 mov rdi, qword ptr [rsi + 0x580]
0x145922edb: 483bbe70050000 cmp rdi, qword ptr [rsi + 0x570]
0x145922ee2: 750d jne 0x145922ef1
0x145922ee4: 488d8e70050000 lea rcx, [rsi + 0x570]
0x145922eeb: e880555700 call 0x145e98470
0x145922ef0: 90 nop
0x145922ef1: 4869cfe0010000 imul rcx, rdi, 0x1e0
0x145922ef8: 48038e78050000 add rcx, qword ptr [rsi + 0x578]
0x145922eff: 488d55c8 lea rdx, [rbp - 0x38]
0x145922f03: 41b8e0010000 mov r8d, 0x1e0
0x145922f09: e8ed163f00 call 0x145d145fb
0x145922f0e: 48ffc7 inc rdi
0x145922f11: 4889be80050000 mov qword ptr [rsi + 0x580], rdi
0x145922f18: 0f28b5b0010000 movaps xmm6, xmmword ptr [rbp + 0x1b0]
0x145922f1f: 0f28bdc0010000 movaps xmm7, xmmword ptr [rbp + 0x1c0]
0x145922f26: 4881c458020000 add rsp, 0x258
0x145922f2d: 5b pop rbx
0x145922f2e: 5f pop rdi
0x145922f2f: 5e pop rsi
0x145922f30: 415e pop r14
0x145922f32: 415f pop r15
0x145922f34: 5d pop rbp
0x145922f35: c3 ret
; Native range 0x14592f599..0x14592f633
0x14592f599: 48899d90000000 mov qword ptr [rbp + 0x90], rbx
0x14592f5a0: 488b9680050000 mov rdx, qword ptr [rsi + 0x580]
0x14592f5a7: 483995f0000000 cmp qword ptr [rbp + 0xf0], rdx
0x14592f5ae: 0f83911f0000 jae 0x145931545
0x14592f5b4: 488b4110 mov rax, qword ptr [rcx + 0x10]
0x14592f5b8: 488985d0000000 mov qword ptr [rbp + 0xd0], rax
0x14592f5bf: 448b29 mov r13d, dword ptr [rcx]
0x14592f5c2: 4c8d6104 lea r12, [rcx + 4]
0x14592f5c6: f30f10411c movss xmm0, dword ptr [rcx + 0x1c]
0x14592f5cb: f30f1185e0000000 movss dword ptr [rbp + 0xe0], xmm0
0x14592f5d3: 8b4118 mov eax, dword ptr [rcx + 0x18]
0x14592f5d6: 83f801 cmp eax, 1
0x14592f5d9: 83d000 adc eax, 0
0x14592f5dc: f30f104124 movss xmm0, dword ptr [rcx + 0x24]
0x14592f5e1: f30f11850c010000 movss dword ptr [rbp + 0x10c], xmm0
0x14592f5e9: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
0x14592f5f0: 0f57c0 xorps xmm0, xmm0
0x14592f5f3: f3480f2ac0 cvtsi2ss xmm0, rax
0x14592f5f8: f30f104920 movss xmm1, dword ptr [rcx + 0x20]
0x14592f5fd: 488b8678050000 mov rax, qword ptr [rsi + 0x578]
0x14592f604: f30f1015700d5b00 movss xmm2, dword ptr [rip + 0x5b0d70]
0x14592f60c: f30f59d0 mulss xmm2, xmm0
0x14592f610: f30f115540 movss dword ptr [rbp + 0x40], xmm2
0x14592f615: f3440f103dfa0f5c00 movss xmm15, dword ptr [rip + 0x5c0ffa]
0x14592f61e: f3440f5ef8 divss xmm15, xmm0
0x14592f623: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
0x14592f62a: f30f598c0864010000 mulss xmm1, dword ptr [rax + rcx + 0x164]
; Native range 0x14592f6c8..0x14592f70d
0x14592f6c8: f30f10850c010000 movss xmm0, dword ptr [rbp + 0x10c]
0x14592f6d0: f30f11442430 movss dword ptr [rsp + 0x30], xmm0
0x14592f6d6: f30f1085cc000000 movss xmm0, dword ptr [rbp + 0xcc]
0x14592f6de: f30f11442428 movss dword ptr [rsp + 0x28], xmm0
0x14592f6e4: 488d8560010000 lea rax, [rbp + 0x160]
0x14592f6eb: 4889442420 mov qword ptr [rsp + 0x20], rax
0x14592f6f0: 4889f1 mov rcx, rsi
0x14592f6f3: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
0x14592f6fa: 4c8b85d0000000 mov r8, qword ptr [rbp + 0xd0]
0x14592f701: 4c8d8d10010000 lea r9, [rbp + 0x110]
0x14592f708: e84335ffff call 0x145922c50
