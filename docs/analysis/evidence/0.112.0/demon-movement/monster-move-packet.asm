0x1458c3bf0: 55 push rbp
0x1458c3bf1: 4156 push r14
0x1458c3bf3: 56 push rsi
0x1458c3bf4: 57 push rdi
0x1458c3bf5: 53 push rbx
0x1458c3bf6: 4881ec80000000 sub rsp, 0x80
0x1458c3bfd: 488dac2480000000 lea rbp, [rsp + 0x80]
0x1458c3c05: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x1458c3c0d: 4c89cf mov rdi, r9
0x1458c3c10: 4c89c3 mov rbx, r8
0x1458c3c13: 4989d6 mov r14, rdx
0x1458c3c16: 4889ce mov rsi, rcx
0x1458c3c19: e8e2e573fa call 0x140002200
0x1458c3c1e: b920000000 mov ecx, 0x20
0x1458c3c23: ba01000000 mov edx, 1
0x1458c3c28: e893e573fa call 0x1400021c0
0x1458c3c2d: 4885c0 test rax, rax
0x1458c3c30: 0f8446020000 je 0x1458c3e7c
0x1458c3c36: 66c745e8dd00 mov word ptr [rbp - 0x18], 0xdd
0x1458c3c3c: 48c745d020000000 mov qword ptr [rbp - 0x30], 0x20
0x1458c3c44: 488945d8 mov qword ptr [rbp - 0x28], rax
0x1458c3c48: 48c745e000000000 mov qword ptr [rbp - 0x20], 0
0x1458c3c50: 488d55d0 lea rdx, [rbp - 0x30]
0x1458c3c54: 4c89f1 mov rcx, r14
0x1458c3c57: e8e4c60000 call 0x1458d0340
0x1458c3c5c: 90 nop
0x1458c3c5d: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
0x1458c3c61: 0f104de0 movups xmm1, xmmword ptr [rbp - 0x20]
0x1458c3c65: 0f294dc0 movaps xmmword ptr [rbp - 0x40], xmm1
0x1458c3c69: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
0x1458c3c6d: 488d4dd0 lea rcx, [rbp - 0x30]
0x1458c3c71: 488d55b0 lea rdx, [rbp - 0x50]
0x1458c3c75: 4989d8 mov r8, rbx
0x1458c3c78: e833a8feff call 0x1458ae4b0
0x1458c3c7d: 488b45d0 mov rax, qword ptr [rbp - 0x30]
0x1458c3c81: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
0x1458c3c85: 4829d0 sub rax, rdx
0x1458c3c88: 4883f803 cmp rax, 3
0x1458c3c8c: 0f864a010000 jbe 0x1458c3ddc
0x1458c3c92: 8b4550 mov eax, dword ptr [rbp + 0x50]
0x1458c3c95: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
0x1458c3c99: 890411 mov dword ptr [rcx + rdx], eax
0x1458c3c9c: 4883c204 add rdx, 4
0x1458c3ca0: 488955e0 mov qword ptr [rbp - 0x20], rdx
0x1458c3ca4: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
0x1458c3ca8: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
0x1458c3cac: 488b45e0 mov rax, qword ptr [rbp - 0x20]
0x1458c3cb0: 488945c0 mov qword ptr [rbp - 0x40], rax
0x1458c3cb4: 488b45e8 mov rax, qword ptr [rbp - 0x18]
0x1458c3cb8: 488945c8 mov qword ptr [rbp - 0x38], rax
0x1458c3cbc: 488b5dc0 mov rbx, qword ptr [rbp - 0x40]
0x1458c3cc0: 483b5db0 cmp rbx, qword ptr [rbp - 0x50]
0x1458c3cc4: 750a jne 0x1458c3cd0
0x1458c3cc6: 488d4db0 lea rcx, [rbp - 0x50]
0x1458c3cca: e811574e00 call 0x145da93e0
0x1458c3ccf: 90 nop
0x1458c3cd0: 488b45b8 mov rax, qword ptr [rbp - 0x48]
0x1458c3cd4: c6041800 mov byte ptr [rax + rbx], 0
0x1458c3cd8: 48ffc3 inc rbx
0x1458c3cdb: 48895dc0 mov qword ptr [rbp - 0x40], rbx
0x1458c3cdf: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
0x1458c3ce3: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
0x1458c3ce7: 488b45c0 mov rax, qword ptr [rbp - 0x40]
0x1458c3ceb: 488945e0 mov qword ptr [rbp - 0x20], rax
0x1458c3cef: 488b45c8 mov rax, qword ptr [rbp - 0x38]
0x1458c3cf3: 488945e8 mov qword ptr [rbp - 0x18], rax
0x1458c3cf7: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
0x1458c3cfb: 488b45d0 mov rax, qword ptr [rbp - 0x30]
0x1458c3cff: 4829d0 sub rax, rdx
0x1458c3d02: 4883f803 cmp rax, 3
0x1458c3d06: 0f86f8000000 jbe 0x1458c3e04
0x1458c3d0c: 488b45d8 mov rax, qword ptr [rbp - 0x28]
0x1458c3d10: c7041000010000 mov dword ptr [rax + rdx], 0x100
0x1458c3d17: 4883c204 add rdx, 4
0x1458c3d1b: 488955e0 mov qword ptr [rbp - 0x20], rdx
0x1458c3d1f: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
0x1458c3d23: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
0x1458c3d27: 488b45e0 mov rax, qword ptr [rbp - 0x20]
0x1458c3d2b: 488945c0 mov qword ptr [rbp - 0x40], rax
0x1458c3d2f: 488b45e8 mov rax, qword ptr [rbp - 0x18]
0x1458c3d33: 488945c8 mov qword ptr [rbp - 0x38], rax
0x1458c3d37: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
0x1458c3d3b: 488b45b0 mov rax, qword ptr [rbp - 0x50]
0x1458c3d3f: 4829d0 sub rax, rdx
0x1458c3d42: 4883f803 cmp rax, 3
0x1458c3d46: 0f86e0000000 jbe 0x1458c3e2c
0x1458c3d4c: 8b4558 mov eax, dword ptr [rbp + 0x58]
0x1458c3d4f: 83f801 cmp eax, 1
0x1458c3d52: 83d000 adc eax, 0
0x1458c3d55: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
0x1458c3d59: 890411 mov dword ptr [rcx + rdx], eax
0x1458c3d5c: 4883c204 add rdx, 4
0x1458c3d60: 488955c0 mov qword ptr [rbp - 0x40], rdx
0x1458c3d64: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
0x1458c3d68: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
0x1458c3d6c: 488b45c0 mov rax, qword ptr [rbp - 0x40]
0x1458c3d70: 488945e0 mov qword ptr [rbp - 0x20], rax
0x1458c3d74: 488b45c8 mov rax, qword ptr [rbp - 0x38]
0x1458c3d78: 488945e8 mov qword ptr [rbp - 0x18], rax
0x1458c3d7c: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
0x1458c3d80: 488b45d0 mov rax, qword ptr [rbp - 0x30]
0x1458c3d84: 4829d0 sub rax, rdx
0x1458c3d87: 4883f803 cmp rax, 3
0x1458c3d8b: 0f86c3000000 jbe 0x1458c3e54
0x1458c3d91: 488b45d8 mov rax, qword ptr [rbp - 0x28]
0x1458c3d95: c7041001000000 mov dword ptr [rax + rdx], 1
0x1458c3d9c: 4883c204 add rdx, 4
0x1458c3da0: 488955e0 mov qword ptr [rbp - 0x20], rdx
0x1458c3da4: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
0x1458c3da8: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
0x1458c3dac: 488b45e0 mov rax, qword ptr [rbp - 0x20]
0x1458c3db0: 488945c0 mov qword ptr [rbp - 0x40], rax
0x1458c3db4: 488b45e8 mov rax, qword ptr [rbp - 0x18]
0x1458c3db8: 488945c8 mov qword ptr [rbp - 0x38], rax
0x1458c3dbc: 488d55b0 lea rdx, [rbp - 0x50]
0x1458c3dc0: 4889f1 mov rcx, rsi
0x1458c3dc3: 4989f8 mov r8, rdi
0x1458c3dc6: e8e5a6feff call 0x1458ae4b0
0x1458c3dcb: 4889f0 mov rax, rsi
0x1458c3dce: 4881c480000000 add rsp, 0x80
0x1458c3dd5: 5b pop rbx
0x1458c3dd6: 5f pop rdi
0x1458c3dd7: 5e pop rsi
0x1458c3dd8: 415e pop r14
0x1458c3dda: 5d pop rbp
0x1458c3ddb: c3 ret
0x1458c3ddc: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
0x1458c3de5: 488d4dd0 lea rcx, [rbp - 0x30]
0x1458c3de9: 41b804000000 mov r8d, 4
0x1458c3def: 41b901000000 mov r9d, 1
0x1458c3df5: e876963400 call 0x145c0d470
0x1458c3dfa: 90 nop
0x1458c3dfb: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
0x1458c3dff: e98efeffff jmp 0x1458c3c92
0x1458c3e04: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
0x1458c3e0d: 488d4dd0 lea rcx, [rbp - 0x30]
0x1458c3e11: 41b804000000 mov r8d, 4
0x1458c3e17: 41b901000000 mov r9d, 1
0x1458c3e1d: e84e963400 call 0x145c0d470
0x1458c3e22: 90 nop
0x1458c3e23: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
0x1458c3e27: e9e0feffff jmp 0x1458c3d0c
0x1458c3e2c: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
0x1458c3e35: 488d4db0 lea rcx, [rbp - 0x50]
0x1458c3e39: 41b804000000 mov r8d, 4
0x1458c3e3f: 41b901000000 mov r9d, 1
0x1458c3e45: e826963400 call 0x145c0d470
0x1458c3e4a: 90 nop
0x1458c3e4b: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
0x1458c3e4f: e9f8feffff jmp 0x1458c3d4c
0x1458c3e54: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
0x1458c3e5d: 488d4dd0 lea rcx, [rbp - 0x30]
0x1458c3e61: 41b804000000 mov r8d, 4
0x1458c3e67: 41b901000000 mov r9d, 1
0x1458c3e6d: e8fe953400 call 0x145c0d470
0x1458c3e72: 90 nop
0x1458c3e73: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
0x1458c3e77: e915ffffff jmp 0x1458c3d91
0x1458c3e7c: b901000000 mov ecx, 1
0x1458c3e81: ba20000000 mov edx, 0x20
0x1458c3e86: e860564e00 call 0x145da94eb
0x1458c3e8b: 0f0b ud2
