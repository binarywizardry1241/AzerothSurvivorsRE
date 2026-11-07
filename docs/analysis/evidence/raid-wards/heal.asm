145915be0: 55 push rbp
145915be1: 4157 push r15
145915be3: 4156 push r14
145915be5: 56 push rsi
145915be6: 57 push rdi
145915be7: 53 push rbx
145915be8: 4881ecf8000000 sub rsp, 0xf8
145915bef: 488dac2480000000 lea rbp, [rsp + 0x80]
145915bf7: 0f297d60 movaps xmmword ptr [rbp + 0x60], xmm7
145915bfb: 0f297550 movaps xmmword ptr [rbp + 0x50], xmm6
145915bff: 48c74548feffffff mov qword ptr [rbp + 0x48], 0xfffffffffffffffe
145915c07: 4889ce mov rsi, rcx
145915c0a: 488b8970050000 mov rcx, qword ptr [rcx + 0x570]
145915c11: 4885c9 test rcx, rcx
145915c14: 0f846e020000 je 0x145915e88
145915c1a: 4489cf mov edi, r9d
145915c1d: 4889d3 mov rbx, rdx
145915c20: 488b8668050000 mov rax, qword ptr [rsi + 0x568]
145915c27: 4869d1d8010000 imul rdx, rcx, 0x1d8
145915c2e: 31c9 xor ecx, ecx
145915c30: eb1e jmp 0x145915c50
145915c32: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
145915c40: 4881c1d8010000 add rcx, 0x1d8
145915c47: 4839ca cmp rdx, rcx
145915c4a: 0f8438020000 je 0x145915e88
145915c50: 48399c08f0000000 cmp qword ptr [rax + rcx + 0xf0], rbx
145915c58: 75e6 jne 0x145915c40
145915c5a: 83bc08b000000001 cmp dword ptr [rax + rcx + 0xb0], 1
145915c62: 74dc je 0x145915c40
145915c64: f30f10840858010000 movss xmm0, dword ptr [rax + rcx + 0x158]
145915c6d: f30f108c085c010000 movss xmm1, dword ptr [rax + rcx + 0x15c]
145915c76: f30f59d1 mulss xmm2, xmm1
145915c7a: f30f5cc8 subss xmm1, xmm0
145915c7e: 0f28da movaps xmm3, xmm2
145915c81: f30f5dd9 minss xmm3, xmm1
145915c85: 0f28f3 movaps xmm6, xmm3
145915c88: f30fc2f303 cmpunordss xmm6, xmm3
145915c8d: 0f28ce movaps xmm1, xmm6
145915c90: 0f55cb andnps xmm1, xmm3
145915c93: 0f54f2 andps xmm6, xmm2
145915c96: 0f56f1 orps xmm6, xmm1
145915c99: 0f57ff xorps xmm7, xmm7
145915c9c: f30f5ff7 maxss xmm6, xmm7
145915ca0: 0f2efe ucomiss xmm7, xmm6
145915ca3: 0f83df010000 jae 0x145915e88
145915ca9: f30f58c6 addss xmm0, xmm6
145915cad: f30f11840858010000 movss dword ptr [rax + rcx + 0x158], xmm0
145915cb6: e886472f00 call 0x145c0a441
145915cbb: f3480f2cc0 cvttss2si rax, xmm0
145915cc0: 31c9 xor ecx, ecx
145915cc2: 0f2ec7 ucomiss xmm0, xmm7
145915cc5: 0f43c8 cmovae ecx, eax
145915cc8: 0f2e05750e4a00 ucomiss xmm0, dword ptr [rip + 0x4a0e75]
145915ccf: 41b8ffffffff mov r8d, 0xffffffff
145915cd5: 440f46c1 cmovbe r8d, ecx
145915cd9: 48c745d800000000 mov qword ptr [rbp - 0x28], 0
145915ce1: 48c745e800000000 mov qword ptr [rbp - 0x18], 0
145915ce9: 488d45d8 lea rax, [rbp - 0x28]
145915ced: 488945f0 mov qword ptr [rbp - 0x10], rax
145915cf1: 0f57c0 xorps xmm0, xmm0
145915cf4: 0f1145f8 movups xmmword ptr [rbp - 8], xmm0
145915cf8: 48c7451016000000 mov qword ptr [rbp + 0x10], 0x16
145915d00: 488d4db8 lea rcx, [rbp - 0x48]
145915d04: 488d55f0 lea rdx, [rbp - 0x10]
145915d08: e8e384fcff call 0x1458de1f0
145915d0d: 90 nop
145915d0e: c7453800000000 mov dword ptr [rbp + 0x38], 0
145915d15: 48c7452000000000 mov qword ptr [rbp + 0x20], 0
145915d1d: 48c7452801000000 mov qword ptr [rbp + 0x28], 1
145915d25: 48c7453000000000 mov qword ptr [rbp + 0x30], 0
145915d2d: 48837de800 cmp qword ptr [rbp - 0x18], 0
145915d32: 7443 je 0x145915d77
145915d34: c6454701 mov byte ptr [rbp + 0x47], 1
145915d38: 488d4d20 lea rcx, [rbp + 0x20]
145915d3c: e89f364900 call 0x145da93e0
145915d41: 90 nop
145915d42: 488b4528 mov rax, qword ptr [rbp + 0x28]
145915d46: c60000 mov byte ptr [rax], 0
145915d49: 48c7453001000000 mov qword ptr [rbp + 0x30], 1
145915d51: c6454701 mov byte ptr [rbp + 0x47], 1
145915d55: 488d5520 lea rdx, [rbp + 0x20]
145915d59: 4889d9 mov rcx, rbx
145915d5c: e8dfa5fbff call 0x1458d0340
145915d61: 90 nop
145915d62: c6454701 mov byte ptr [rbp + 0x47], 1
145915d66: 488d4dd8 lea rcx, [rbp - 0x28]
145915d6a: 488d5520 lea rdx, [rbp + 0x20]
145915d6e: e8adbdfaff call 0x1458c1b20
145915d73: 90 nop
145915d74: ff4538 inc dword ptr [rbp + 0x38]
145915d77: 488b4520 mov rax, qword ptr [rbp + 0x20]
145915d7b: 488b4d28 mov rcx, qword ptr [rbp + 0x28]
145915d7f: 488b5530 mov rdx, qword ptr [rbp + 0x30]
145915d83: 48895500 mov qword ptr [rbp], rdx
145915d87: 8b5538 mov edx, dword ptr [rbp + 0x38]
145915d8a: 895508 mov dword ptr [rbp + 8], edx
145915d8d: 8b553c mov edx, dword ptr [rbp + 0x3c]
145915d90: 89550c mov dword ptr [rbp + 0xc], edx
145915d93: 488945f0 mov qword ptr [rbp - 0x10], rax
145915d97: 48894df8 mov qword ptr [rbp - 8], rcx
145915d9b: c6454700 mov byte ptr [rbp + 0x47], 0
145915d9f: 488d4db8 lea rcx, [rbp - 0x48]
145915da3: 488d55f0 lea rdx, [rbp - 0x10]
145915da7: e8d4b3faff call 0x1458c1180
145915dac: 90 nop
145915dad: 4c8db620060000 lea r14, [rsi + 0x620]
145915db4: 4c8bbe30060000 mov r15, qword ptr [rsi + 0x630]
145915dbb: 4c3bbe20060000 cmp r15, qword ptr [rsi + 0x620]
145915dc2: 7509 jne 0x145915dcd
145915dc4: 4c89f1 mov rcx, r14
145915dc7: e8047e2f00 call 0x145c0dbd0
145915dcc: 90 nop
145915dcd: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
145915dd4: 4c89f9 mov rcx, r15
145915dd7: 48c1e105 shl rcx, 5
145915ddb: 0f1045b8 movups xmm0, xmmword ptr [rbp - 0x48]
145915ddf: 0f104dc8 movups xmm1, xmmword ptr [rbp - 0x38]
145915de3: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145915de8: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145915dec: 49ffc7 inc r15
145915def: 4c89be30060000 mov qword ptr [rsi + 0x630], r15
145915df6: 85ff test edi, edi
145915df8: 0f8481000000 je 0x145915e7f
145915dfe: f3480f2cc6 cvttss2si rax, xmm6
145915e03: 31c9 xor ecx, ecx
145915e05: 0f57c0 xorps xmm0, xmm0
145915e08: 0f2ef0 ucomiss xmm6, xmm0
145915e0b: 0f43c8 cmovae ecx, eax
145915e0e: 0f2e352f0d4a00 ucomiss xmm6, dword ptr [rip + 0x4a0d2f]
145915e15: b8ffffffff mov eax, 0xffffffff
145915e1a: 0f46c1 cmovbe eax, ecx
145915e1d: c6454700 mov byte ptr [rbp + 0x47], 0
145915e21: 89442420 mov dword ptr [rsp + 0x20], eax
145915e25: c644242800 mov byte ptr [rsp + 0x28], 0
145915e2a: 488d4df0 lea rcx, [rbp - 0x10]
145915e2e: 4889da mov rdx, rbx
145915e31: 4989d8 mov r8, rbx
145915e34: 4189f9 mov r9d, edi
145915e37: e82401fbff call 0x1458c5f60
145915e3c: 90 nop
145915e3d: 488bbe30060000 mov rdi, qword ptr [rsi + 0x630]
145915e44: 483bbe20060000 cmp rdi, qword ptr [rsi + 0x620]
145915e4b: 7509 jne 0x145915e56
145915e4d: 4c89f1 mov rcx, r14
145915e50: e87b7d2f00 call 0x145c0dbd0
145915e55: 90 nop
145915e56: 488b8628060000 mov rax, qword ptr [rsi + 0x628]
145915e5d: 4889f9 mov rcx, rdi
145915e60: 48c1e105 shl rcx, 5
145915e64: 0f1045f0 movups xmm0, xmmword ptr [rbp - 0x10]
145915e68: 0f104d00 movups xmm1, xmmword ptr [rbp]
145915e6c: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145915e71: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145915e75: 48ffc7 inc rdi
145915e78: 4889be30060000 mov qword ptr [rsi + 0x630], rdi
145915e7f: 488d4dd8 lea rcx, [rbp - 0x28]
145915e83: e818dd0a00 call 0x1459c3ba0
145915e88: 0f287550 movaps xmm6, xmmword ptr [rbp + 0x50]
145915e8c: 0f287d60 movaps xmm7, xmmword ptr [rbp + 0x60]
145915e90: 4881c4f8000000 add rsp, 0xf8
145915e97: 5b pop rbx
145915e98: 5f pop rdi
145915e99: 5e pop rsi
145915e9a: 415e pop r14
145915e9c: 415f pop r15
145915e9e: 5d pop rbp
145915e9f: c3 ret
