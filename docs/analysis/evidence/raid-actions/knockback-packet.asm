1458c1c70: 55 push rbp
1458c1c71: 56 push rsi
1458c1c72: 57 push rdi
1458c1c73: 53 push rbx
1458c1c74: 4881ec98000000 sub rsp, 0x98
1458c1c7b: 488dac2480000000 lea rbp, [rsp + 0x80]
1458c1c83: 0f297500 movaps xmmword ptr [rbp], xmm6
1458c1c87: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458c1c8f: 0f28f3 movaps xmm6, xmm3
1458c1c92: 4489c7 mov edi, r8d
1458c1c95: 4889d3 mov rbx, rdx
1458c1c98: 4889ce mov rsi, rcx
1458c1c9b: e8600574fa call 0x140002200
1458c1ca0: b920000000 mov ecx, 0x20
1458c1ca5: ba01000000 mov edx, 1
1458c1caa: e8110574fa call 0x1400021c0
1458c1caf: 4885c0 test rax, rax
1458c1cb2: 0f846c020000 je 0x1458c1f24
1458c1cb8: 66c745c8ef00 mov word ptr [rbp - 0x38], 0xef
1458c1cbe: 48c745b020000000 mov qword ptr [rbp - 0x50], 0x20
1458c1cc6: 488945b8 mov qword ptr [rbp - 0x48], rax
1458c1cca: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1458c1cd2: 488d55b0 lea rdx, [rbp - 0x50]
1458c1cd6: 4889d9 mov rcx, rbx
1458c1cd9: e802d60000 call 0x1458cf2e0
1458c1cde: 90 nop
1458c1cdf: 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
1458c1ce3: 0f104dc0 movups xmm1, xmmword ptr [rbp - 0x40]
1458c1ce7: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
1458c1ceb: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c1cef: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c1cf3: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c1cf7: 4829d0 sub rax, rdx
1458c1cfa: 4883f803 cmp rax, 3
1458c1cfe: 0f8652010000 jbe 0x1458c1e56
1458c1d04: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c1d08: 893c10 mov dword ptr [rax + rdx], edi
1458c1d0b: 4883c204 add rdx, 4
1458c1d0f: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c1d13: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c1d17: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c1d1b: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c1d1f: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c1d23: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c1d27: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c1d2b: 488b7dc0 mov rdi, qword ptr [rbp - 0x40]
1458c1d2f: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c1d33: 4829f8 sub rax, rdi
1458c1d36: 4883f803 cmp rax, 3
1458c1d3a: 0f863e010000 jbe 0x1458c1e7e
1458c1d40: 0f28c6 movaps xmm0, xmm6
1458c1d43: e8d5833300 call 0x145bfa11d
1458c1d48: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c1d4c: f30f110438 movss dword ptr [rax + rdi], xmm0
1458c1d51: 4883c704 add rdi, 4
1458c1d55: 48897dc0 mov qword ptr [rbp - 0x40], rdi
1458c1d59: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c1d5d: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c1d61: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c1d65: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c1d69: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c1d6d: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c1d71: 488b7de0 mov rdi, qword ptr [rbp - 0x20]
1458c1d75: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c1d79: 4829f8 sub rax, rdi
1458c1d7c: 4883f803 cmp rax, 3
1458c1d80: 0f8623010000 jbe 0x1458c1ea9
1458c1d86: 0f28c6 movaps xmm0, xmm6
1458c1d89: e889833300 call 0x145bfa117
1458c1d8e: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c1d92: f30f110438 movss dword ptr [rax + rdi], xmm0
1458c1d97: 4883c704 add rdi, 4
1458c1d9b: 48897de0 mov qword ptr [rbp - 0x20], rdi
1458c1d9f: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c1da3: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c1da7: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c1dab: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c1daf: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c1db3: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c1db7: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c1dbb: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c1dbf: 4829d0 sub rax, rdx
1458c1dc2: 4883f803 cmp rax, 3
1458c1dc6: 0f8608010000 jbe 0x1458c1ed4
1458c1dcc: f30f104560 movss xmm0, dword ptr [rbp + 0x60]
1458c1dd1: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c1dd5: f30f110410 movss dword ptr [rax + rdx], xmm0
1458c1dda: 4883c204 add rdx, 4
1458c1dde: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c1de2: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c1de6: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c1dea: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c1dee: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c1df2: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c1df6: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c1dfa: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c1dfe: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c1e02: 4829d0 sub rax, rdx
1458c1e05: 4883f803 cmp rax, 3
1458c1e09: 0f86ed000000 jbe 0x1458c1efc
1458c1e0f: f30f104568 movss xmm0, dword ptr [rbp + 0x68]
1458c1e14: 0f570585b25000 xorps xmm0, xmmword ptr [rip + 0x50b285]
1458c1e1b: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c1e1f: f30f110410 movss dword ptr [rax + rdx], xmm0
1458c1e24: 4883c204 add rdx, 4
1458c1e28: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c1e2c: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c1e30: 0f1106 movups xmmword ptr [rsi], xmm0
1458c1e33: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c1e37: 48894610 mov qword ptr [rsi + 0x10], rax
1458c1e3b: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c1e3f: 48894618 mov qword ptr [rsi + 0x18], rax
1458c1e43: 4889f0 mov rax, rsi
1458c1e46: 0f287500 movaps xmm6, xmmword ptr [rbp]
1458c1e4a: 4881c498000000 add rsp, 0x98
1458c1e51: 5b pop rbx
1458c1e52: 5f pop rdi
1458c1e53: 5e pop rsi
1458c1e54: 5d pop rbp
1458c1e55: c3 ret
1458c1e56: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c1e5f: 488d4dd0 lea rcx, [rbp - 0x30]
1458c1e63: 41b804000000 mov r8d, 4
1458c1e69: 41b901000000 mov r9d, 1
1458c1e6f: e8fc8a3300 call 0x145bfa970
1458c1e74: 90 nop
1458c1e75: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c1e79: e986feffff jmp 0x1458c1d04
1458c1e7e: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c1e87: 488d4db0 lea rcx, [rbp - 0x50]
1458c1e8b: 41b804000000 mov r8d, 4
1458c1e91: 41b901000000 mov r9d, 1
1458c1e97: 4889fa mov rdx, rdi
1458c1e9a: e8d18a3300 call 0x145bfa970
1458c1e9f: 90 nop
1458c1ea0: 488b7dc0 mov rdi, qword ptr [rbp - 0x40]
1458c1ea4: e997feffff jmp 0x1458c1d40
1458c1ea9: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c1eb2: 488d4dd0 lea rcx, [rbp - 0x30]
1458c1eb6: 41b804000000 mov r8d, 4
1458c1ebc: 41b901000000 mov r9d, 1
1458c1ec2: 4889fa mov rdx, rdi
1458c1ec5: e8a68a3300 call 0x145bfa970
1458c1eca: 90 nop
1458c1ecb: 488b7de0 mov rdi, qword ptr [rbp - 0x20]
1458c1ecf: e9b2feffff jmp 0x1458c1d86
1458c1ed4: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c1edd: 488d4db0 lea rcx, [rbp - 0x50]
1458c1ee1: 41b804000000 mov r8d, 4
1458c1ee7: 41b901000000 mov r9d, 1
1458c1eed: e87e8a3300 call 0x145bfa970
1458c1ef2: 90 nop
1458c1ef3: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c1ef7: e9d0feffff jmp 0x1458c1dcc
1458c1efc: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
1458c1f05: 488d4dd0 lea rcx, [rbp - 0x30]
1458c1f09: 41b804000000 mov r8d, 4
1458c1f0f: 41b901000000 mov r9d, 1
1458c1f15: e8568a3300 call 0x145bfa970
1458c1f1a: 90 nop
1458c1f1b: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c1f1f: e9ebfeffff jmp 0x1458c1e0f
1458c1f24: b901000000 mov ecx, 1
1458c1f29: ba20000000 mov edx, 0x20
1458c1f2e: e888734d00 call 0x145d992bb
1458c1f33: 0f0b ud2
