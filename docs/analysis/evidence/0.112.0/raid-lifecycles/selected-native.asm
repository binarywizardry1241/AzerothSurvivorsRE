1400021c0: e93b1ebb05 jmp 0x145bb4000
140002200: c3 ret
140cc1030: 55 push rbp
145898dc0: 4883c2fe add rdx, -2
14589f770: 56 push rsi
1458a0b40: 56 push rsi
1458a4d60: 4157 push r15
1458ae4b0: 55 push rbp
1458c22c0: 55 push rbp
1458c2cd0: 55 push rbp
1458c2cd1: 56 push rsi
1458c2cd2: 57 push rdi
1458c2cd3: 53 push rbx
1458c2cd4: 4881ec98000000 sub rsp, 0x98
1458c2cdb: 488dac2480000000 lea rbp, [rsp + 0x80]
1458c2ce3: 0f297500 movaps xmmword ptr [rbp], xmm6
1458c2ce7: 48c745f8feffffff mov qword ptr [rbp - 8], 0xfffffffffffffffe
1458c2cef: 0f28f3 movaps xmm6, xmm3
1458c2cf2: 4489c7 mov edi, r8d
1458c2cf5: 4889d3 mov rbx, rdx
1458c2cf8: 4889ce mov rsi, rcx
1458c2cfb: e800f573fa call 0x140002200
1458c2d00: b920000000 mov ecx, 0x20
1458c2d05: ba01000000 mov edx, 1
1458c2d0a: e8b1f473fa call 0x1400021c0
1458c2d0f: 4885c0 test rax, rax
1458c2d12: 0f846c020000 je 0x1458c2f84
1458c2d18: 66c745c8ef00 mov word ptr [rbp - 0x38], 0xef
1458c2d1e: 48c745b020000000 mov qword ptr [rbp - 0x50], 0x20
1458c2d26: 488945b8 mov qword ptr [rbp - 0x48], rax
1458c2d2a: 48c745c000000000 mov qword ptr [rbp - 0x40], 0
1458c2d32: 488d55b0 lea rdx, [rbp - 0x50]
1458c2d36: 4889d9 mov rcx, rbx
1458c2d39: e802d60000 call 0x1458d0340
1458c2d3e: 90 nop
1458c2d3f: 0f1045b0 movups xmm0, xmmword ptr [rbp - 0x50]
1458c2d43: 0f104dc0 movups xmm1, xmmword ptr [rbp - 0x40]
1458c2d47: 0f294de0 movaps xmmword ptr [rbp - 0x20], xmm1
1458c2d4b: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c2d4f: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c2d53: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c2d57: 4829d0 sub rax, rdx
1458c2d5a: 4883f803 cmp rax, 3
1458c2d5e: 0f8652010000 jbe 0x1458c2eb6
1458c2d64: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c2d68: 893c10 mov dword ptr [rax + rdx], edi
1458c2d6b: 4883c204 add rdx, 4
1458c2d6f: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c2d73: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c2d77: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c2d7b: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2d7f: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c2d83: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2d87: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c2d8b: 488b7dc0 mov rdi, qword ptr [rbp - 0x40]
1458c2d8f: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c2d93: 4829f8 sub rax, rdi
1458c2d96: 4883f803 cmp rax, 3
1458c2d9a: 0f863e010000 jbe 0x1458c2ede
1458c2da0: 0f28c6 movaps xmm0, xmm6
1458c2da3: e86f763400 call 0x145c0a417
1458c2da8: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c2dac: f30f110438 movss dword ptr [rax + rdi], xmm0
1458c2db1: 4883c704 add rdi, 4
1458c2db5: 48897dc0 mov qword ptr [rbp - 0x40], rdi
1458c2db9: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c2dbd: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c2dc1: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c2dc5: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c2dc9: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c2dcd: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c2dd1: 488b7de0 mov rdi, qword ptr [rbp - 0x20]
1458c2dd5: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c2dd9: 4829f8 sub rax, rdi
1458c2ddc: 4883f803 cmp rax, 3
1458c2de0: 0f8623010000 jbe 0x1458c2f09
1458c2de6: 0f28c6 movaps xmm0, xmm6
1458c2de9: e823763400 call 0x145c0a411
1458c2dee: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c2df2: f30f110438 movss dword ptr [rax + rdi], xmm0
1458c2df7: 4883c704 add rdi, 4
1458c2dfb: 48897de0 mov qword ptr [rbp - 0x20], rdi
1458c2dff: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c2e03: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c2e07: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2e0b: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c2e0f: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2e13: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c2e17: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c2e1b: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c2e1f: 4829d0 sub rax, rdx
1458c2e22: 4883f803 cmp rax, 3
1458c2e26: 0f8608010000 jbe 0x1458c2f34
1458c2e2c: f30f104560 movss xmm0, dword ptr [rbp + 0x60]
1458c2e31: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c2e35: f30f110410 movss dword ptr [rax + rdx], xmm0
1458c2e3a: 4883c204 add rdx, 4
1458c2e3e: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c2e42: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c2e46: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c2e4a: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c2e4e: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c2e52: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c2e56: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c2e5a: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c2e5e: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c2e62: 4829d0 sub rax, rdx
1458c2e65: 4883f803 cmp rax, 3
1458c2e69: 0f86ed000000 jbe 0x1458c2f5c
1458c2e6f: f30f104568 movss xmm0, dword ptr [rbp + 0x68]
1458c2e74: 0f5705d5a64e00 xorps xmm0, xmmword ptr [rip + 0x4ea6d5]
1458c2e7b: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c2e7f: f30f110410 movss dword ptr [rax + rdx], xmm0
1458c2e84: 4883c204 add rdx, 4
1458c2e88: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c2e8c: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c2e90: 0f1106 movups xmmword ptr [rsi], xmm0
1458c2e93: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2e97: 48894610 mov qword ptr [rsi + 0x10], rax
1458c2e9b: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2e9f: 48894618 mov qword ptr [rsi + 0x18], rax
1458c2ea3: 4889f0 mov rax, rsi
1458c2ea6: 0f287500 movaps xmm6, xmmword ptr [rbp]
1458c2eaa: 4881c498000000 add rsp, 0x98
1458c2eb1: 5b pop rbx
1458c2eb2: 5f pop rdi
1458c2eb3: 5e pop rsi
1458c2eb4: 5d pop rbp
1458c2eb5: c3 ret
1458c332f: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c3333: 891c10 mov dword ptr [rax + rdx], ebx
1458c3336: 4883c204 add rdx, 4
1458c333a: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c333e: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c3342: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c3346: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c334a: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c334e: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c3352: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c3356: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c335a: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c335e: 4829d0 sub rax, rdx
1458c3361: 4883f801 cmp rax, 1
1458c3365: 0f86af000000 jbe 0x1458c341a
1458c336b: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c336f: 66c704100200 mov word ptr [rax + rdx], 2
1458c3375: 4883c202 add rdx, 2
1458c3379: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c33aa: 4c8b4550 mov r8, qword ptr [rbp + 0x50]
1458c33ae: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c33b2: 893c10 mov dword ptr [rax + rdx], edi
1458c33b5: 4883c204 add rdx, 4
1458c33b9: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c33bd: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c33c1: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c33c5: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c33c9: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c33cd: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c33d1: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c33d5: 488d55b0 lea rdx, [rbp - 0x50]
1458c33d9: 4889f1 mov rcx, rsi
1458c33dc: e87faf0000 call 0x1458ce360
1458c3bf0: 55 push rbp
1458c3c92: 8b4550 mov eax, dword ptr [rbp + 0x50]
1458c3c95: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458c3c99: 890411 mov dword ptr [rcx + rdx], eax
1458c3c9c: 4883c204 add rdx, 4
1458c3ca0: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c3ca4: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458c3ca8: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c3cac: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c3cb0: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c3cb4: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c3cb8: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c3cbc: 488b5dc0 mov rbx, qword ptr [rbp - 0x40]
1458c3cc0: 483b5db0 cmp rbx, qword ptr [rbp - 0x50]
1458c3cc4: 750a jne 0x1458c3cd0
1458c3cd0: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c3cd4: c6041800 mov byte ptr [rax + rbx], 0
1458c3cd8: 48ffc3 inc rbx
1458c3cdb: 48895dc0 mov qword ptr [rbp - 0x40], rbx
1458c3cdf: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c3ce3: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c3ce7: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c3ceb: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c3cef: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c3cf3: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c3cf7: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c3cfb: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c3cff: 4829d0 sub rax, rdx
1458c3d02: 4883f803 cmp rax, 3
1458c3d06: 0f86f8000000 jbe 0x1458c3e04
1458c3d0c: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c3d10: c7041000010000 mov dword ptr [rax + rdx], 0x100
1458c3d17: 4883c204 add rdx, 4
1458c3d1b: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c3d1f: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c3d23: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c3d27: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c3d2b: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c3d2f: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c3d33: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c3d37: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c3d3b: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c3d3f: 4829d0 sub rax, rdx
1458c3d42: 4883f803 cmp rax, 3
1458c3d46: 0f86e0000000 jbe 0x1458c3e2c
1458c3d4c: 8b4558 mov eax, dword ptr [rbp + 0x58]
1458c3d4f: 83f801 cmp eax, 1
1458c3d52: 83d000 adc eax, 0
1458c3d55: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1458c3d59: 890411 mov dword ptr [rcx + rdx], eax
1458c3d5c: 4883c204 add rdx, 4
1458c3d60: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c3d64: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c3d68: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c3d6c: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c3d70: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c3d74: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c3d78: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c3d7c: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c3d80: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c3d84: 4829d0 sub rax, rdx
1458c3d87: 4883f803 cmp rax, 3
1458c3d8b: 0f86c3000000 jbe 0x1458c3e54
1458c3d91: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c3d95: c7041001000000 mov dword ptr [rax + rdx], 1
1458c3d9c: 4883c204 add rdx, 4
1458c3da0: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c3da4: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c3da8: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c3dac: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c3db0: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c3db4: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c3db8: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c3dbc: 488d55b0 lea rdx, [rbp - 0x50]
1458c3dc0: 4889f1 mov rcx, rsi
1458c3dc3: 4989f8 mov r8, rdi
1458c3dc6: e8e5a6feff call 0x1458ae4b0
1458c3dcb: 4889f0 mov rax, rsi
1458c4052: c6000c mov byte ptr [rax], 0xc
1458c4055: c7400100000000 mov dword ptr [rax + 1], 0
1458c405c: 4c897005 mov qword ptr [rax + 5], r14
1458c8012: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c8016: 891c10 mov dword ptr [rax + rdx], ebx
1458c8019: 4883c204 add rdx, 4
1458c801d: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c8021: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458c8025: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c8029: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c802d: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c8031: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c8035: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c8039: 488b5dc0 mov rbx, qword ptr [rbp - 0x40]
1458c803d: 483b5db0 cmp rbx, qword ptr [rbp - 0x50]
1458c8041: 750a jne 0x1458c804d
1458c804d: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c8051: c6041804 mov byte ptr [rax + rbx], 4
1458c8055: 48ffc3 inc rbx
1458c8058: 48895dc0 mov qword ptr [rbp - 0x40], rbx
1458c805c: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c8060: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c8064: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c8068: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c806c: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c8070: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c8074: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c8078: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c807c: 4829d0 sub rax, rdx
1458c807f: 4883f803 cmp rax, 3
1458c8083: 0f8636010000 jbe 0x1458c81bf
1458c8089: f30f104550 movss xmm0, dword ptr [rbp + 0x50]
1458c808e: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c8092: f30f110410 movss dword ptr [rax + rdx], xmm0
1458c8097: 4883c204 add rdx, 4
1458c809b: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c809f: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c80a3: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c80a7: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c80ab: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c80af: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c80b3: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c80b7: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c80bb: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c80bf: 4829d0 sub rax, rdx
1458c80c2: 4883f803 cmp rax, 3
1458c80c6: 0f861b010000 jbe 0x1458c81e7
1458c80cc: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c80d0: c7041000010000 mov dword ptr [rax + rdx], 0x100
1458c80d7: 4883c204 add rdx, 4
1458c80db: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c80df: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c80e3: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c80e7: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c80eb: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c80ef: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c80f3: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c80f7: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c80fb: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c80ff: 4829d0 sub rax, rdx
1458c8102: 4883f803 cmp rax, 3
1458c8106: 0f8603010000 jbe 0x1458c820f
1458c810c: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c8110: c7041001000000 mov dword ptr [rax + rdx], 1
1458c8117: 4883c204 add rdx, 4
1458c811b: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c811f: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c8123: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c8127: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c812b: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c812f: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c8133: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c8137: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c813b: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c813f: 4829d0 sub rax, rdx
1458c8142: 4883f803 cmp rax, 3
1458c8146: 0f86eb000000 jbe 0x1458c8237
1458c814c: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c8150: c7041001000000 mov dword ptr [rax + rdx], 1
1458c8157: 4883c204 add rdx, 4
1458c815b: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c815f: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c8163: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c8167: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c816b: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c816f: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c8173: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c8177: 488d55d0 lea rdx, [rbp - 0x30]
1458c817b: 4889f1 mov rcx, rsi
1458c817e: 4989f8 mov r8, rdi
1458c8181: e82a63feff call 0x1458ae4b0
1458c8186: 4889f0 mov rax, rsi
1458ce7d0: 55 push rbp
1458ceea0: 55 push rbp
1458d0340: 4157 push r15
1458e2120: 56 push rsi
145915a8a: 0f287560 movaps xmm6, xmmword ptr [rbp + 0x60]
145916020: 4156 push r14
145916022: 56 push rsi
145916023: 57 push rdi
145916024: 53 push rbx
145916025: 4883ec48 sub rsp, 0x48
145916029: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
14591602e: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
145916033: 4c89cf mov rdi, r9
145916036: 4889ce mov rsi, rcx
145916039: 4889d1 mov rcx, rdx
14591603c: 4c89c2 mov rdx, r8
14591603f: e87c2df8ff call 0x145898dc0
145916044: 4869d8f0000000 imul rbx, rax, 0xf0
14591604b: 4c8d35dec52d01 lea r14, [rip + 0x12dc5de]
145916052: f20f1037 movsd xmm6, qword ptr [rdi]
145916056: f2420f10bc33c8000000 movsd xmm7, qword ptr [rbx + r14 + 0xc8]
145916060: 0f5cf7 subps xmm6, xmm7
145916063: f30f16ce movshdup xmm1, xmm6
145916067: 0f28c6 movaps xmm0, xmm6
14591606a: e8c0432f00 call 0x145c0a42f
14591606f: f30f100d25504a00 movss xmm1, dword ptr [rip + 0x4a5025]
145916077: 0f2ec8 ucomiss xmm1, xmm0
14591607a: 7737 ja 0x1459160b3
14591607c: f3420f108c33d8000000 movss xmm1, dword ptr [rbx + r14 + 0xd8]
145916086: f30f580de2b58f00 addss xmm1, dword ptr [rip + 0x8fb5e2]
14591608e: 0f2ec8 ucomiss xmm1, xmm0
145916091: 7320 jae 0x1459160b3
145916093: f30f12c0 movsldup xmm0, xmm0
145916097: 0f5ef0 divps xmm6, xmm0
14591609a: f30f104708 movss xmm0, dword ptr [rdi + 8]
14591609f: f30f12c9 movsldup xmm1, xmm1
1459160a3: 0f59ce mulps xmm1, xmm6
1459160a6: 0f58f9 addps xmm7, xmm1
1459160a9: 0f133e movlps qword ptr [rsi], xmm7
1459160ac: f30f114608 movss dword ptr [rsi + 8], xmm0
1459160b1: eb0c jmp 0x1459160bf
1459160bf: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1459160c4: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1459160c9: 4883c448 add rsp, 0x48
1459160cd: 5b pop rbx
1459160ce: 5f pop rdi
1459160cf: 5e pop rsi
1459160d0: 415e pop r14
1459160d2: c3 ret
1459160e0: 4156 push r14
145916609: 450f57ff xorps xmm15, xmm15
14591660d: f3440f1035ce6e4900 movss xmm14, dword ptr [rip + 0x496ece]
145916616: f3440f102d2d054a00 movss xmm13, dword ptr [rip + 0x4a052d]
14591661f: f3440f101d58224a00 movss xmm11, dword ptr [rip + 0x4a2258]
145916628: f3440f101513054a00 movss xmm10, dword ptr [rip + 0x4a0513]
145916631: f3440f100506054a00 movss xmm8, dword ptr [rip + 0x4a0506]
145916640: 48ffc1 inc rcx
145916653: 498b85b0050000 mov rax, qword ptr [r13 + 0x5b0]
14591665a: 4989cc mov r12, rcx
14591665d: 49c1e406 shl r12, 6
145916661: f3420f10442008 movss xmm0, dword ptr [rax + r12 + 8]
145916668: 0f2e8534020000 ucomiss xmm0, dword ptr [rbp + 0x234]
14591666f: 77cf ja 0x145916640
145916671: 4989c8 mov r8, rcx
145916843: 4c8bad48020000 mov r13, qword ptr [rbp + 0x248]
14591684a: 4180bddf0a000001 cmp byte ptr [r13 + 0xadf], 1
145916852: 0f850c040000 jne 0x145916c64
145916858: 450f28c2 movaps xmm8, xmm10
14591685c: 450f28d3 movaps xmm10, xmm11
145916860: f30f10841890010000 movss xmm0, dword ptr [rax + rbx + 0x190]
145916869: 450f28dd movaps xmm11, xmm13
14591686d: 440f2ef8 ucomiss xmm15, xmm0
145916871: 0f832b040000 jae 0x145916ca2
145916877: 450f28fe movaps xmm15, xmm14
14591687b: 488bb548020000 mov rsi, qword ptr [rbp + 0x248]
145916882: f30f108e4c0a0000 movss xmm1, dword ptr [rsi + 0xa4c]
14591688a: f30f5c8c188c010000 subss xmm1, dword ptr [rax + rbx + 0x18c]
145916893: f30f5ec8 divss xmm1, xmm0
145916897: 0f57c0 xorps xmm0, xmm0
14591689a: f30f5fc1 maxss xmm0, xmm1
14591689e: f30f100dba694900 movss xmm1, dword ptr [rip + 0x4969ba]
1459168a6: f30f5dc8 minss xmm1, xmm0
1459168aa: f20f10841874010000 movsd xmm0, qword ptr [rax + rbx + 0x174]
1459168b3: f20f10941880010000 movsd xmm2, qword ptr [rax + rbx + 0x180]
1459168bc: 0f5cd0 subps xmm2, xmm0
1459168bf: f3440f12c9 movsldup xmm9, xmm1
1459168c4: 440f59ca mulps xmm9, xmm2
1459168c8: 440f58c8 addps xmm9, xmm0
1459168cc: f30f1084187c010000 movss xmm0, dword ptr [rax + rbx + 0x17c]
1459168d5: f3440f10a41888010000 movss xmm12, dword ptr [rax + rbx + 0x188]
1459168df: f3440f5ce0 subss xmm12, xmm0
1459168e4: f3440f59e1 mulss xmm12, xmm1
1459168e9: f3440f58e0 addss xmm12, xmm0
1459168ee: e9ce030000 jmp 0x145916cc1
14591692b: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
145916932: f3440f10894c0a0000 movss xmm9, dword ptr [rcx + 0xa4c]
14591693b: f30f10841890010000 movss xmm0, dword ptr [rax + rbx + 0x190]
145916944: 440f2ef8 ucomiss xmm15, xmm0
145916948: 7367 jae 0x1459169b1
1459169b1: f20f10b41880010000 movsd xmm6, qword ptr [rax + rbx + 0x180]
1459169ba: f3440f10a41888010000 movss xmm12, dword ptr [rax + rbx + 0x188]
1459169c4: 4c8bb418f0000000 mov r14, qword ptr [rax + rbx + 0xf0]
1459169cc: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
1459169d3: 488b88b0090000 mov rcx, qword ptr [rax + 0x9b0]
1459169da: 4883c110 add rcx, 0x10
1459169de: f30f16d6 movshdup xmm2, xmm6
1459169e2: 0f28ce movaps xmm1, xmm6
1459169e5: e856a1f8ff call 0x1458a0b40
1459169ea: 0f28f8 movaps xmm7, xmm0
1459169ed: a801 test al, 1
1459169ef: 7504 jne 0x1459169f5
1459169f1: 410f28fc movaps xmm7, xmm12
1459169f5: 4c8b8da8010000 mov r9, qword ptr [rbp + 0x1a8]
1459169fc: 66410f6ec1 movd xmm0, r9d
145916a01: 448b8570020000 mov r8d, dword ptr [rbp + 0x270]
145916a08: 66410f6ec8 movd xmm1, r8d
145916a0d: 660f62c8 punpckldq xmm1, xmm0
145916a11: 0f28c6 movaps xmm0, xmm6
145916a14: 0f5cc1 subps xmm0, xmm1
145916a17: 0f59c0 mulps xmm0, xmm0
145916a1a: f30f16c8 movshdup xmm1, xmm0
145916a1e: f30f58c8 addss xmm1, xmm0
145916a22: 450f57e4 xorps xmm12, xmm12
145916a26: f3440f51e1 sqrtss xmm12, xmm1
145916a2b: f3450f5ee6 divss xmm12, xmm14
145916a30: f3450f5fe5 maxss xmm12, xmm13
145916a35: 4c8bbd48020000 mov r15, qword ptr [rbp + 0x248]
145916a3c: 418b877c0a0000 mov eax, dword ptr [r15 + 0xa7c]
145916a43: ffc0 inc eax
145916a45: 410f28c4 movaps xmm0, xmm12
145916a49: f3410f59c3 mulss xmm0, xmm11
145916a4e: f3480f2cc8 cvttss2si rcx, xmm0
145916a53: 410f2ec7 ucomiss xmm0, xmm15
145916a57: ba00000000 mov edx, 0
145916a5c: 0f42ca cmovb ecx, edx
145916a5f: 410f2ec2 ucomiss xmm0, xmm10
145916a63: 4189877c0a0000 mov dword ptr [r15 + 0xa7c], eax
145916a6a: baffffffff mov edx, 0xffffffff
145916a6f: 0f47ca cmova ecx, edx
145916a72: 0f13b5f0000000 movlps qword ptr [rbp + 0xf0], xmm6
145916a79: f30f11bdf8000000 movss dword ptr [rbp + 0xf8], xmm7
145916a81: 44898540010000 mov dword ptr [rbp + 0x140], r8d
145916a88: 4c898d44010000 mov qword ptr [rbp + 0x144], r9
145916a8f: 89442420 mov dword ptr [rsp + 0x20], eax
145916a93: 894c2428 mov dword ptr [rsp + 0x28], ecx
145916a97: 488d8de0010000 lea rcx, [rbp + 0x1e0]
145916a9e: 4c89f2 mov rdx, r14
145916aa1: 4c8d85f0000000 lea r8, [rbp + 0xf0]
145916aa8: 4c8d8d40010000 lea r9, [rbp + 0x140]
145916aaf: e83cd1faff call 0x1458c3bf0
145916ab4: 498bb730060000 mov rsi, qword ptr [r15 + 0x630]
145916abb: 493bb720060000 cmp rsi, qword ptr [r15 + 0x620]
145916ac2: 750d jne 0x145916ad1
145916ad1: 4c8bbd48020000 mov r15, qword ptr [rbp + 0x248]
145916ad8: 498b8728060000 mov rax, qword ptr [r15 + 0x628]
145916adf: 4889f1 mov rcx, rsi
145916ae2: 48c1e105 shl rcx, 5
145916ae6: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
145916aed: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
145916af4: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145916af9: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145916afd: 48ffc6 inc rsi
145916b00: 4989b730060000 mov qword ptr [r15 + 0x630], rsi
145916b07: 8b8570020000 mov eax, dword ptr [rbp + 0x270]
145916b0d: 898544010000 mov dword ptr [rbp + 0x144], eax
145916b13: 488b85a8010000 mov rax, qword ptr [rbp + 0x1a8]
145916b1a: 48898548010000 mov qword ptr [rbp + 0x148], rax
145916b21: c7854001000001000000 mov dword ptr [rbp + 0x140], 1
145916b2b: c785f000000000000000 mov dword ptr [rbp + 0xf0], 0
145916b35: 488d85f0000000 lea rax, [rbp + 0xf0]
145916b3c: 4889442430 mov qword ptr [rsp + 0x30], rax
145916b41: 488d8540010000 lea rax, [rbp + 0x140]
145916b48: 4889442428 mov qword ptr [rsp + 0x28], rax
145916b4d: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145916b56: 41b908000000 mov r9d, 8
145916b5c: 488d8de0010000 lea rcx, [rbp + 0x1e0]
145916b63: 4c89f2 mov rdx, r14
145916b66: 41b864000000 mov r8d, 0x64
145916b6c: e85f7cfbff call 0x1458ce7d0
145916b71: 498bb730060000 mov rsi, qword ptr [r15 + 0x630]
145916b78: 493bb720060000 cmp rsi, qword ptr [r15 + 0x620]
145916b7f: 750d jne 0x145916b8e
145916b8e: 4c8bad48020000 mov r13, qword ptr [rbp + 0x248]
145916b95: 498b8528060000 mov rax, qword ptr [r13 + 0x628]
145916b9c: 4889f1 mov rcx, rsi
145916b9f: 48c1e105 shl rcx, 5
145916ba3: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
145916baa: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
145916bb1: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145916bb6: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145916bba: 48ffc6 inc rsi
145916bbd: 4989b530060000 mov qword ptr [r13 + 0x630], rsi
145916bc4: 498b9570050000 mov rdx, qword ptr [r13 + 0x570]
145916bcb: 4839d7 cmp rdi, rdx
145916bce: 0f83c64c0000 jae 0x14591b89a
145916bd4: 498b8568050000 mov rax, qword ptr [r13 + 0x568]
145916bdb: 0f13b41874010000 movlps qword ptr [rax + rbx + 0x174], xmm6
145916be3: f30f11bc187c010000 movss dword ptr [rax + rbx + 0x17c], xmm7
145916bec: 8b8d70020000 mov ecx, dword ptr [rbp + 0x270]
145916bf2: 898c1880010000 mov dword ptr [rax + rbx + 0x180], ecx
145916bf9: 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
145916c00: 48898c1884010000 mov qword ptr [rax + rbx + 0x184], rcx
145916c08: f3440f118c188c010000 movss dword ptr [rax + rbx + 0x18c], xmm9
145916c12: f3440f11a41890010000 movss dword ptr [rax + rbx + 0x190], xmm12
145916c1c: f3450f58cc addss xmm9, xmm12
145916c21: f3450f58c8 addss xmm9, xmm8
145916c26: f3440f118c1894010000 movss dword ptr [rax + rbx + 0x194], xmm9
145916c30: f30f10841898010000 movss xmm0, dword ptr [rax + rbx + 0x198]
145916c39: f3440f5825be3e4a00 addss xmm12, dword ptr [rip + 0x4a3ebe]
145916c42: 0f28c8 movaps xmm1, xmm0
145916c45: f3410f5fcc maxss xmm1, xmm12
145916c4a: 0f28d1 movaps xmm2, xmm1
145916c4d: f30fc2d103 cmpunordss xmm2, xmm1
145916c52: 0f54c2 andps xmm0, xmm2
145916c55: 0f55d1 andnps xmm2, xmm1
145916c58: 0f56d0 orps xmm2, xmm0
145916c5b: f30f11941898010000 movss dword ptr [rax + rbx + 0x198], xmm2
145916c64: 4d8bb5b8050000 mov r14, qword ptr [r13 + 0x5b8]
145916ca2: 450f28fe movaps xmm15, xmm14
145916ca6: f2440f108c1880010000 movsd xmm9, qword ptr [rax + rbx + 0x180]
145916cb0: f3440f10a41888010000 movss xmm12, dword ptr [rax + rbx + 0x188]
145916cba: 488bb548020000 mov rsi, qword ptr [rbp + 0x248]
145916cc1: 4c8bac18f0000000 mov r13, qword ptr [rax + rbx + 0xf0]
145916cc9: f3440f10b4186c010000 movss xmm14, dword ptr [rax + rbx + 0x16c]
145916cd3: f30f108ed0040000 movss xmm1, dword ptr [rsi + 0x4d0]
145916cdb: f30f1086d4040000 movss xmm0, dword ptr [rsi + 0x4d4]
145916ce3: f3450f16e9 movshdup xmm13, xmm9
145916ce8: f3410f5cc5 subss xmm0, xmm13
145916ced: f3410f5cc9 subss xmm1, xmm9
145916cf2: e850372f00 call 0x145c0a447
145916cf7: 0f28f8 movaps xmm7, xmm0
145916cfa: f3440f583595434a00 addss xmm14, dword ptr [rip + 0x4a4395]
145916d03: e80f372f00 call 0x145c0a417
145916d08: 0f28f0 movaps xmm6, xmm0
145916d0b: 0f28c7 movaps xmm0, xmm7
145916d0e: e8fe362f00 call 0x145c0a411
145916d13: f3410f12ce movsldup xmm1, xmm14
145916d18: 0f14f0 unpcklps xmm6, xmm0
145916d1b: 0f59f1 mulps xmm6, xmm1
145916d1e: 410f58f1 addps xmm6, xmm9
145916d22: 488bbeb0090000 mov rdi, qword ptr [rsi + 0x9b0]
145916d29: 48837f40ff cmp qword ptr [rdi + 0x40], -1
145916d2e: 0f848f000000 je 0x145916dc3
145916d34: 488d4f40 lea rcx, [rdi + 0x40]
145916d38: 66440f7eca movd edx, xmm9
145916d3d: 66440f7ee8 movd eax, xmm13
145916d42: 48c1e020 shl rax, 0x20
145916d46: 4809c2 or rdx, rax
145916d49: 66410f7ef0 movd r8d, xmm6
145916d4e: f30f16c6 movshdup xmm0, xmm6
145916d52: 660f7ec0 movd eax, xmm0
145916d56: 48c1e020 shl rax, 0x20
145916d5a: 4909c0 or r8, rax
145916d5d: e82e1c0900 call 0x1459a8990
145916d62: 0f2e05f7644900 ucomiss xmm0, dword ptr [rip + 0x4964f7]
145916d69: 7358 jae 0x145916dc3
145916d6b: 410f28c9 movaps xmm1, xmm9
145916d6f: 0f5cce subps xmm1, xmm6
145916d72: 0f59c9 mulps xmm1, xmm1
145916d75: f30f16d1 movshdup xmm2, xmm1
145916d79: f30f58d1 addss xmm2, xmm1
145916d7d: 0f57c9 xorps xmm1, xmm1
145916d80: f30f51ca sqrtss xmm1, xmm2
145916d84: f30f1015d8644900 movss xmm2, dword ptr [rip + 0x4964d8]
145916d8c: f30f5fca maxss xmm1, xmm2
145916d90: f30f5ed1 divss xmm2, xmm1
145916d94: f30f5cc2 subss xmm0, xmm2
145916d98: 0f57c9 xorps xmm1, xmm1
145916d9b: f30f5fc1 maxss xmm0, xmm1
145916d9f: 410f5cf1 subps xmm6, xmm9
145916da3: f30f12c8 movsldup xmm1, xmm0
145916da7: 0f59ce mulps xmm1, xmm6
145916daa: 410f58c9 addps xmm1, xmm9
145916dae: 410f28d4 movaps xmm2, xmm12
145916db2: f3410f5cd4 subss xmm2, xmm12
145916db7: f30f59d0 mulss xmm2, xmm0
145916dbb: f3440f58e2 addss xmm12, xmm2
145916dc0: 0f28f1 movaps xmm6, xmm1
145916dc3: 450f28f7 movaps xmm14, xmm15
145916dc7: 488b8548020000 mov rax, qword ptr [rbp + 0x248]
145916dce: 488b88a8020000 mov rcx, qword ptr [rax + 0x2a8]
145916dd5: 488b90b0020000 mov rdx, qword ptr [rax + 0x2b0]
145916ddc: e8df1ff8ff call 0x145898dc0
145916de1: 4869f0f0000000 imul rsi, rax, 0xf0
145916de8: 488d1d41b82d01 lea rbx, [rip + 0x12db841]
145916def: f2440f10ac1ec8000000 movsd xmm13, qword ptr [rsi + rbx + 0xc8]
145916df9: 440f28ce movaps xmm9, xmm6
145916dfd: 450f5ccd subps xmm9, xmm13
145916e01: f3410f16c9 movshdup xmm1, xmm9
145916e06: 410f28c1 movaps xmm0, xmm9
145916e0a: e820362f00 call 0x145c0a42f
145916e0f: f30f108c1ed8000000 movss xmm1, dword ptr [rsi + rbx + 0xd8]
145916e18: f30f580d50a88f00 addss xmm1, dword ptr [rip + 0x8fa850]
145916e20: f30f101574424a00 movss xmm2, dword ptr [rip + 0x4a4274]
145916e28: 0f2ed0 ucomiss xmm2, xmm0
145916e2b: 7723 ja 0x145916e50
145916e2d: 0f2ec8 ucomiss xmm1, xmm0
145916e30: 450f57ff xorps xmm15, xmm15
145916e34: 731e jae 0x145916e54
145916e36: f30f12c0 movsldup xmm0, xmm0
145916e3a: 440f5ec8 divps xmm9, xmm0
145916e3e: f30f12c1 movsldup xmm0, xmm1
145916e42: 410f59c1 mulps xmm0, xmm9
145916e46: 440f58e8 addps xmm13, xmm0
145916e4a: 410f28f5 movaps xmm6, xmm13
145916e4e: eb04 jmp 0x145916e54
145916e54: 4883c710 add rdi, 0x10
145916e58: f30f16d6 movshdup xmm2, xmm6
145916e5c: 4889f9 mov rcx, rdi
145916e5f: 0f28ce movaps xmm1, xmm6
145916e62: e8d99cf8ff call 0x1458a0b40
145916e67: 440f28c8 movaps xmm9, xmm0
145916e6b: a801 test al, 1
145916e6d: 7504 jne 0x145916e73
145916e6f: 450f28cc movaps xmm9, xmm12
145916e73: f3440f580de8634900 addss xmm9, dword ptr [rip + 0x4963e8]
145916e7c: f30f583d1c404a00 addss xmm7, dword ptr [rip + 0x4a401c]
145916e84: 488bbd48020000 mov rdi, qword ptr [rbp + 0x248]
145916e8b: 448b8750050000 mov r8d, dword ptr [rdi + 0x550]
145916e92: 418d4001 lea eax, [r8 + 1]
145916e96: 898750050000 mov dword ptr [rdi + 0x550], eax
145916e9c: 488b9768040000 mov rdx, qword ptr [rdi + 0x468]
145916ea3: 0f13b540010000 movlps qword ptr [rbp + 0x140], xmm6
145916eaa: f3440f118d48010000 movss dword ptr [rbp + 0x148], xmm9
145916eb3: f30f117c2420 movss dword ptr [rsp + 0x20], xmm7
145916eb9: 488d8de0010000 lea rcx, [rbp + 0x1e0]
145916ec0: 4c8d8d40010000 lea r9, [rbp + 0x140]
145916ec7: e8d47ffbff call 0x1458ceea0
145916ecc: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
145916ed3: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
145916eda: 450f28eb movaps xmm13, xmm11
145916ede: 750d jne 0x145916eed
145916eed: 488bbd48020000 mov rdi, qword ptr [rbp + 0x248]
145916ef4: 488b8728060000 mov rax, qword ptr [rdi + 0x628]
145916efb: 4889f1 mov rcx, rsi
145916efe: 48c1e105 shl rcx, 5
145916f02: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
145916f09: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
145916f10: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145916f15: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145916f19: 48ffc6 inc rsi
145916f1c: 4889b730060000 mov qword ptr [rdi + 0x630], rsi
145916f23: c787100a000001000000 mov dword ptr [rdi + 0xa10], 1
145916f2d: 0f13b7140a0000 movlps qword ptr [rdi + 0xa14], xmm6
145916f34: f3440f118f1c0a0000 movss dword ptr [rdi + 0xa1c], xmm9
145916f3d: c687200a00000c mov byte ptr [rdi + 0xa20], 0xc
145916f44: 0f13b7d0040000 movlps qword ptr [rdi + 0x4d0], xmm6
145916f4b: f3440f118fd8040000 movss dword ptr [rdi + 0x4d8], xmm9
145916f54: 0f13b544010000 movlps qword ptr [rbp + 0x144], xmm6
145916f5b: f3440f118d4c010000 movss dword ptr [rbp + 0x14c], xmm9
145916f64: c7854001000001000000 mov dword ptr [rbp + 0x140], 1
145916f6e: c785f000000000000000 mov dword ptr [rbp + 0xf0], 0
145916f78: 488d85f0000000 lea rax, [rbp + 0xf0]
145916f7f: 4889442430 mov qword ptr [rsp + 0x30], rax
145916f84: 488d8540010000 lea rax, [rbp + 0x140]
145916f8b: 4889442428 mov qword ptr [rsp + 0x28], rax
145916f90: 48c744242000000000 mov qword ptr [rsp + 0x20], 0
145916f99: 41b908000000 mov r9d, 8
145916f9f: 488d8de0010000 lea rcx, [rbp + 0x1e0]
145916fa6: 4c89ea mov rdx, r13
145916fa9: 41b89b520000 mov r8d, 0x529b
145916faf: e81c78fbff call 0x1458ce7d0
145916fb4: 488bb730060000 mov rsi, qword ptr [rdi + 0x630]
145916fbb: 483bb720060000 cmp rsi, qword ptr [rdi + 0x620]
145916fc2: 450f28da movaps xmm11, xmm10
145916fc6: 750d jne 0x145916fd5
145916fd5: 4c8bad48020000 mov r13, qword ptr [rbp + 0x248]
145916fdc: 498b8528060000 mov rax, qword ptr [r13 + 0x628]
145916fe3: 4889f1 mov rcx, rsi
145916fe6: 48c1e105 shl rcx, 5
145916fea: 0f1085e0010000 movups xmm0, xmmword ptr [rbp + 0x1e0]
145916ff1: 0f108df0010000 movups xmm1, xmmword ptr [rbp + 0x1f0]
145916ff8: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145916ffd: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145917001: 48ffc6 inc rsi
145917004: 4989b530060000 mov qword ptr [r13 + 0x630], rsi
14591700b: 450f28d0 movaps xmm10, xmm8
14591700f: f3440f100528fb4900 movss xmm8, dword ptr [rip + 0x49fb28]
145917018: 4d8bb5b8050000 mov r14, qword ptr [r13 + 0x5b8]
145917065: 498b8db0090000 mov rcx, qword ptr [r13 + 0x9b0]
14591706c: 4883c110 add rcx, 0x10
145917070: f2450f108dd0040000 movsd xmm9, qword ptr [r13 + 0x4d0]
145917079: f3450f16d1 movshdup xmm10, xmm9
14591707e: f3410f10b5d8040000 movss xmm6, dword ptr [r13 + 0x4d8]
145917087: 410f28c9 movaps xmm1, xmm9
14591708b: 410f28d2 movaps xmm2, xmm10
14591708f: e8ac9af8ff call 0x1458a0b40
145917094: f30f118528020000 movss dword ptr [rbp + 0x228], xmm0
14591709c: a801 test al, 1
14591709e: 7508 jne 0x1459170a8
1459170a0: f30f11b528020000 movss dword ptr [rbp + 0x228], xmm6
1459170a8: e853b16efa call 0x140002200
14591721d: 0f10053c604900 movups xmm0, xmmword ptr [rip + 0x49603c]
145917224: f30f1185c8000000 movss dword ptr [rbp + 0xc8], xmm0
14591722c: 440f281d3c164a00 movaps xmm11, xmmword ptr [rip + 0x4a163c]
145917234: 4c8d2521502f01 lea r12, [rip + 0x12f5021]
14591723b: f30f103d21604900 movss xmm7, dword ptr [rip + 0x496021]
145917243: f3440f102554a54900 movss xmm12, dword ptr [rip + 0x49a554]
1459172b5: 4939df cmp r15, rbx
145918022: 418b4510 mov eax, dword ptr [r13 + 0x10]
145918287: 498d7540 lea rsi, [r13 + 0x40]
14591828b: f3410f10754c movss xmm6, dword ptr [r13 + 0x4c]
145918291: f2410f104540 movsd xmm0, qword ptr [r13 + 0x40]
145918297: 450f28f1 movaps xmm14, xmm9
14591829b: 440f5cf0 subps xmm14, xmm0
14591829f: f3450f16fe movshdup xmm15, xmm14
1459182a4: 410f28c6 movaps xmm0, xmm14
1459182a8: 410f28cf movaps xmm1, xmm15
1459182ac: e87e212f00 call 0x145c0a42f
1459182b1: 418b4530 mov eax, dword ptr [r13 + 0x30]
1459182b5: f3450f104534 movss xmm8, dword ptr [r13 + 0x34]
1459182bb: 488d0dba3f2f01 lea rcx, [rip + 0x12f3fba]
1459182c2: 48630481 movsxd rax, dword ptr [rcx + rax*4]
1459182c6: 4801c8 add rax, rcx
1459182c9: ffe0 jmp rax
1459182cb: 440f2ec0 ucomiss xmm8, xmm0
1459182cf: 0f93c0 setae al
1459182d2: 418b4d10 mov ecx, dword ptr [r13 + 0x10]
1459182e6: 0f28c6 movaps xmm0, xmm6
1459182e9: e829212f00 call 0x145c0a417
1459182ee: 440f28f8 movaps xmm15, xmm0
1459182f2: 0f28c6 movaps xmm0, xmm6
1459182f5: e817212f00 call 0x145c0a411
1459182fa: 410f28d7 movaps xmm2, xmm15
1459182fe: 0f14d0 unpcklps xmm2, xmm0
145918301: 410f59d6 mulps xmm2, xmm14
145918305: f30f16ca movshdup xmm1, xmm2
145918309: f30f58ca addss xmm1, xmm2
14591830d: 31c0 xor eax, eax
14591830f: 0f57d2 xorps xmm2, xmm2
145918312: 0f2eca ucomiss xmm1, xmm2
145918315: 0f82bb000000 jb 0x1459183d6
14591831b: 440f2ec1 ucomiss xmm8, xmm1
14591831f: 0f82b1000000 jb 0x1459183d6
145918325: 410f14c7 unpcklps xmm0, xmm15
145918329: 440f59f0 mulps xmm14, xmm0
14591832d: f3410f16c6 movshdup xmm0, xmm14
145918332: f3410f5cc6 subss xmm0, xmm14
145918337: 410f54c3 andps xmm0, xmm11
14591833b: f3410f104d38 movss xmm1, dword ptr [r13 + 0x38]
145918341: f30f59cf mulss xmm1, xmm7
145918345: 0f2ec8 ucomiss xmm1, xmm0
145918348: 0f93c0 setae al
14591834b: 418b4d10 mov ecx, dword ptr [r13 + 0x10]
14591835f: 410f2ec0 ucomiss xmm0, xmm8
145918363: 776f ja 0x1459183d4
145918365: b001 mov al, 1
145918367: 0f2ef8 ucomiss xmm7, xmm0
14591836a: 776a ja 0x1459183d6
14591836c: f3450f104538 movss xmm8, dword ptr [r13 + 0x38]
145918372: 410f28c7 movaps xmm0, xmm15
145918376: 410f28ce movaps xmm1, xmm14
14591837a: e8c8202f00 call 0x145c0a447
14591837f: f30f5cc6 subss xmm0, xmm6
145918383: f30f5805152b4a00 addss xmm0, dword ptr [rip + 0x4a2b15]
14591838b: 410f28cc movaps xmm1, xmm12
14591838f: e8b9202f00 call 0x145c0a44d
145918394: 0f28c8 movaps xmm1, xmm0
145918397: f3410f58cc addss xmm1, xmm12
14591839c: 0f28d0 movaps xmm2, xmm0
14591839f: 0f57db xorps xmm3, xmm3
1459183a2: f30fc2d301 cmpltss xmm2, xmm3
1459183a7: 0f54ca andps xmm1, xmm2
1459183aa: 0f55d0 andnps xmm2, xmm0
1459183ad: 0f56d1 orps xmm2, xmm1
1459183b0: f30f581548f86000 addss xmm2, dword ptr [rip + 0x60f848]
1459183b8: 410f54d3 andps xmm2, xmm11
1459183bc: f3440f59c7 mulss xmm8, xmm7
1459183c1: 440f2ec2 ucomiss xmm8, xmm2
1459183c5: 0f93c0 setae al
1459183c8: eb0c jmp 0x1459183d6
1459183ca: 410f2ec0 ucomiss xmm0, xmm8
1459183ce: 0f8395000000 jae 0x145918469
1459183d4: 31c0 xor eax, eax
1459183d6: 418b4d10 mov ecx, dword ptr [r13 + 0x10]
1459183fa: f30f108538020000 movss xmm0, dword ptr [rbp + 0x238]
145918402: f3410f584560 addss xmm0, dword ptr [r13 + 0x60]
145918408: f30f118538020000 movss dword ptr [rbp + 0x238], xmm0
145918410: 498b4520 mov rax, qword ptr [r13 + 0x20]
145918414: 488985a8010000 mov qword ptr [rbp + 0x1a8], rax
14591841b: f3410f10456c movss xmm0, dword ptr [r13 + 0x6c]
145918435: 410f28f1 movaps xmm6, xmm9
145918439: f3410f5c7540 subss xmm6, dword ptr [r13 + 0x40]
14591843f: 450f28f2 movaps xmm14, xmm10
145918443: f3450f5c7544 subss xmm14, dword ptr [r13 + 0x44]
145918449: 0f28c6 movaps xmm0, xmm6
14591844c: 410f28ce movaps xmm1, xmm14
145918450: e8da1f2f00 call 0x145c0a42f
145918455: 0f2ef8 ucomiss xmm7, xmm0
145918458: 0f86b00a0000 jbe 0x145918f0e
14591845e: f3410f10454c movss xmm0, dword ptr [r13 + 0x4c]
145918464: e9b10a0000 jmp 0x145918f1a
145918469: f3410f104d38 movss xmm1, dword ptr [r13 + 0x38]
14591846f: 0f2ec8 ucomiss xmm1, xmm0
145918472: 0f93c0 setae al
1459185de: 41c6457d01 mov byte ptr [r13 + 0x7d], 1
1459185e3: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
1459185eb: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
1459185f1: f3410f104570 movss xmm0, dword ptr [r13 + 0x70]
1459185f7: 0f57c9 xorps xmm1, xmm1
1459185fa: 0f2ec1 ucomiss xmm0, xmm1
1459185fd: 7605 jbe 0x145918604
145918604: 498b7d20 mov rdi, qword ptr [r13 + 0x20]
145918f0e: 410f28c6 movaps xmm0, xmm14
145918f12: 0f28ce movaps xmm1, xmm6
145918f15: e82d152f00 call 0x145c0a447
145918f1a: f3410f104d6c movss xmm1, dword ptr [r13 + 0x6c]
145918f20: b001 mov al, 1
145918f22: 488945f8 mov qword ptr [rbp - 8], rax
145918f26: f30f118dcc000000 movss dword ptr [rbp + 0xcc], xmm1
145918f2e: f30f11851c010000 movss dword ptr [rbp + 0x11c], xmm0
145918f36: 41807d0000 cmp byte ptr [r13], 0
145918f41: f3410f107574 movss xmm6, dword ptr [r13 + 0x74]
145918f47: 0f57c0 xorps xmm0, xmm0
145918f4a: 0f2ef0 ucomiss xmm6, xmm0
145918f4d: 0f97c1 seta cl
145918f50: 418b4530 mov eax, dword ptr [r13 + 0x30]
145918f54: 85c0 test eax, eax
145918f56: 0f94c2 sete dl
145918f59: 84d1 test cl, dl
145918f5b: 0f84f4000000 je 0x145919055
145918f61: f3450f107534 movss xmm14, dword ptr [r13 + 0x34]
145918f67: 8b4608 mov eax, dword ptr [rsi + 8]
145918f6a: 8985e8010000 mov dword ptr [rbp + 0x1e8], eax
145918f70: 488b06 mov rax, qword ptr [rsi]
145918f73: 488985e0010000 mov qword ptr [rbp + 0x1e0], rax
145918f7a: 418b7d5c mov edi, dword ptr [r13 + 0x5c]
145918f7e: 488bb590000000 mov rsi, qword ptr [rbp + 0x90]
145918f85: 483bb580000000 cmp rsi, qword ptr [rbp + 0x80]
145918f8c: 0f8584000000 jne 0x145919016
145919016: 488b8588000000 mov rax, qword ptr [rbp + 0x88]
14591901d: 488d0c76 lea rcx, [rsi + rsi*2]
145919021: 8b95e8010000 mov edx, dword ptr [rbp + 0x1e8]
145919027: 8954c808 mov dword ptr [rax + rcx*8 + 8], edx
14591902b: 488b95e0010000 mov rdx, qword ptr [rbp + 0x1e0]
145919032: 488914c8 mov qword ptr [rax + rcx*8], rdx
145919036: f3440f1174c80c movss dword ptr [rax + rcx*8 + 0xc], xmm14
14591903d: f30f1174c810 movss dword ptr [rax + rcx*8 + 0x10], xmm6
145919043: 897cc814 mov dword ptr [rax + rcx*8 + 0x14], edi
145919047: 48ffc6 inc rsi
14591904a: 4889b590000000 mov qword ptr [rbp + 0x90], rsi
145919051: 418b4530 mov eax, dword ptr [r13 + 0x30]
145919055: 498b4d20 mov rcx, qword ptr [r13 + 0x20]
1459194a9: 488bb5c0010000 mov rsi, qword ptr [rbp + 0x1c0]
14591a048: 4889442428 mov qword ptr [rsp + 0x28], rax
14591a429: f3410f5c442464 subss xmm0, dword ptr [r12 + 0x64]
14591a430: f3410f104c2450 movss xmm1, dword ptr [r12 + 0x50]
14591a437: 0f28d1 movaps xmm2, xmm1
14591a43a: f30f5fd0 maxss xmm2, xmm0
14591a43e: 0f28c2 movaps xmm0, xmm2
14591a441: f30fc2c203 cmpunordss xmm0, xmm2
14591a446: 0f28d8 movaps xmm3, xmm0
14591a449: 0f55da andnps xmm3, xmm2
14591a44c: 0f54c1 andps xmm0, xmm1
14591a44f: 0f56c3 orps xmm0, xmm3
14591a452: 0f28c8 movaps xmm1, xmm0
14591a455: f30f5dce minss xmm1, xmm6
14591a459: 0f28d1 movaps xmm2, xmm1
14591a45c: f30fc2d103 cmpunordss xmm2, xmm1
14591a461: 0f54c2 andps xmm0, xmm2
14591a464: 0f55d1 andnps xmm2, xmm1
14591a467: 0f56d0 orps xmm2, xmm0
14591a550: b804000000 mov eax, 4
14591a555: 41807c247d00 cmp byte ptr [r12 + 0x7d], 0
14591a55b: 488d0d6ff82e01 lea rcx, [rip + 0x12ef86f]
14591a562: 0f84d4faffff je 0x14591a03c
14591a568: e9dbfaffff jmp 0x14591a048
14591a725: 488b85b0010000 mov rax, qword ptr [rbp + 0x1b0]
14591a786: 4c89f6 mov rsi, r14
14591a789: 498b5ef8 mov rbx, qword ptr [r14 - 8]
14591a78d: 4d8bb424a0050000 mov r14, qword ptr [r12 + 0x5a0]
14591a795: 4c39f3 cmp rbx, r14
14591adc8: 0f57c0 xorps xmm0, xmm0
14591adcb: f30f108d38020000 movss xmm1, dword ptr [rbp + 0x238]
14591add3: 0f2ec8 ucomiss xmm1, xmm0
14591add6: 0f86c1000000 jbe 0x14591ae9d
14591addc: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
14591ade3: 80b9d00a000000 cmp byte ptr [rcx + 0xad0], 0
14591adea: 7510 jne 0x14591adfc
14591adec: f30f100574244900 movss xmm0, dword ptr [rip + 0x492474]
14591adf4: f30f1185c8000000 movss dword ptr [rbp + 0xc8], xmm0
14591adfc: f30f108d38020000 movss xmm1, dword ptr [rbp + 0x238]
14591ae04: f30f598dc8000000 mulss xmm1, dword ptr [rbp + 0xc8]
14591ae0c: 488b8578020000 mov rax, qword ptr [rbp + 0x278]
14591ae9d: 4c8bbd48020000 mov r15, qword ptr [rbp + 0x248]
14591b180: 4d39f5 cmp r13, r14
14591b183: 743b je 0x14591b1c0
14591b185: 488b8570020000 mov rax, qword ptr [rbp + 0x270]
14591b18c: 4a8b1430 mov rdx, qword ptr [rax + r14]
14591b190: 4983c608 add r14, 8
14591b194: c644243000 mov byte ptr [rsp + 0x30], 0
14591b199: c644242800 mov byte ptr [rsp + 0x28], 0
14591b19e: c644242002 mov byte ptr [rsp + 0x20], 2
14591b1a3: 488b8d48020000 mov rcx, qword ptr [rbp + 0x248]
14591b1aa: 0f28d6 movaps xmm2, xmm6
14591b1ad: 4589f9 mov r9d, r15d
14591b1b0: e8db3a0200 call 0x14593ec90
14591b1b5: 90 nop
14591b4bf: 4883fa15 cmp rdx, 0x15
14591b4c3: 0f83e0040000 jae 0x14591b9a9
14591b4c9: 488d04d1 lea rax, [rcx + rdx*8]
14591b4cd: 4989cb mov r11, rcx
14591b4d0: 4883c108 add rcx, 8
14591b4d4: ba08000000 mov edx, 8
14591b4d9: eb17 jmp 0x14591b4f2
14591b4db: 4989f1 mov r9, rsi
14591b4de: 4d8901 mov qword ptr [r9], r8
14591b4e1: 4883c108 add rcx, 8
14591b4e5: 4883c208 add rdx, 8
14591b4e9: 4839c1 cmp rcx, rax
14591b4ec: 0f843b050000 je 0x14591ba2d
14591b4f2: 4c8b51f8 mov r10, qword ptr [rcx - 8]
14591b4f6: 4c8b01 mov r8, qword ptr [rcx]
14591b4f9: 4d39d0 cmp r8, r10
14591b4fc: 73e3 jae 0x14591b4e1
14591b4fe: 4989d1 mov r9, rdx
14591b501: 4c89de mov rsi, r11
14591b504: 4e89140e mov qword ptr [rsi + r9], r10
14591b508: 4983f908 cmp r9, 8
14591b50c: 74cd je 0x14591b4db
14591b50e: 4e8b540ef0 mov r10, qword ptr [rsi + r9 - 0x10]
14591b513: 4983c1f8 add r9, -8
14591b517: 4d39d0 cmp r8, r10
14591b51a: 72e8 jb 0x14591b504
14591b51c: 4901f1 add r9, rsi
14591b51f: ebbd jmp 0x14591b4de
14591ba2d: 488b8db8010000 mov rcx, qword ptr [rbp + 0x1b8]
14591ba34: 488b95c0010000 mov rdx, qword ptr [rbp + 0x1c0]
14591ba3b: 4883fa02 cmp rdx, 2
14591ba3f: 721a jb 0x14591ba5b
14591ba41: 488d42ff lea rax, [rdx - 1]
14591ba45: 4531c0 xor r8d, r8d
14591ba48: 4e8b4cc108 mov r9, qword ptr [rcx + r8*8 + 8]
14591ba4d: 4e3b0cc1 cmp r9, qword ptr [rcx + r8*8]
14591ba51: 7414 je 0x14591ba67
14591ba53: 49ffc0 inc r8
14591ba56: 4c39c0 cmp rax, r8
14591ba59: 75ed jne 0x14591ba48
14591ba5b: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
14591ba62: e9beecffff jmp 0x14591a725
14591ba67: 4989cb mov r11, rcx
14591ba6a: 498d4802 lea rcx, [r8 + 2]
14591ba6e: 498d4001 lea rax, [r8 + 1]
14591ba72: 4839d1 cmp rcx, rdx
14591ba75: 7334 jae 0x14591baab
14591ba77: 4189d2 mov r10d, edx
14591ba7a: 4529c2 sub r10d, r8d
14591ba7d: 4c8d4afd lea r9, [rdx - 3]
14591ba81: 41f6c201 test r10b, 1
14591ba85: 7418 je 0x14591ba9f
14591ba87: 4b8b4cc310 mov rcx, qword ptr [r11 + r8*8 + 0x10]
14591ba8c: 4b3b0cc3 cmp rcx, qword ptr [r11 + r8*8]
14591ba90: 7409 je 0x14591ba9b
14591ba92: 4b894cc308 mov qword ptr [r11 + r8*8 + 8], rcx
14591ba97: 498d4002 lea rax, [r8 + 2]
14591ba9b: 498d4803 lea rcx, [r8 + 3]
14591ba9f: 4d39c1 cmp r9, r8
14591baa2: 7529 jne 0x14591bacd
14591baa4: 4c8b9db8010000 mov r11, qword ptr [rbp + 0x1b8]
14591baab: 488985c0010000 mov qword ptr [rbp + 0x1c0], rax
14591bab2: 4889c2 mov rdx, rax
14591bab5: 4c8ba548020000 mov r12, qword ptr [rbp + 0x248]
14591babc: 4c89d9 mov rcx, r11
14591babf: e961ecffff jmp 0x14591a725
14591bac4: 4883c102 add rcx, 2
14591bac8: 4839ca cmp rdx, rcx
14591bacb: 74d7 je 0x14591baa4
14591bacd: 4d8b04cb mov r8, qword ptr [r11 + rcx*8]
14591bad1: 4d3b44c3f8 cmp r8, qword ptr [r11 + rax*8 - 8]
14591bad6: 750e jne 0x14591bae6
14591bae6: 4d8904c3 mov qword ptr [r11 + rax*8], r8
14591baea: 48ffc0 inc rax
14591baed: 4d8b44cb08 mov r8, qword ptr [r11 + rcx*8 + 8]
14591baf2: 4d3b44c3f8 cmp r8, qword ptr [r11 + rax*8 - 8]
14591baf7: 74cb je 0x14591bac4
14591f110: 56 push rsi
14591f111: 57 push rdi
14591f112: 53 push rbx
14591f113: 4881ec80000000 sub rsp, 0x80
14591f11a: 0f297c2470 movaps xmmword ptr [rsp + 0x70], xmm7
14591f11f: 0f29742460 movaps xmmword ptr [rsp + 0x60], xmm6
14591f124: 4c89c7 mov rdi, r8
14591f127: 0f28f1 movaps xmm6, xmm1
14591f12a: 4889ce mov rsi, rcx
14591f12d: f30f10b94c0a0000 movss xmm7, dword ptr [rcx + 0xa4c]
14591f135: 410f1001 movups xmm0, xmmword ptr [r9]
14591f139: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
14591f13e: 410f105120 movups xmm2, xmmword ptr [r9 + 0x20]
14591f143: 0f11542450 movups xmmword ptr [rsp + 0x50], xmm2
14591f148: 0f114c2440 movups xmmword ptr [rsp + 0x40], xmm1
14591f14d: 0f11442430 movups xmmword ptr [rsp + 0x30], xmm0
14591f152: 488b99b8050000 mov rbx, qword ptr [rcx + 0x5b8]
14591f159: 483b99a8050000 cmp rbx, qword ptr [rcx + 0x5a8]
14591f160: 750c jne 0x14591f16e
14591f16e: f30f58f7 addss xmm6, xmm7
14591f172: 488b86b0050000 mov rax, qword ptr [rsi + 0x5b0]
14591f179: 4889d9 mov rcx, rbx
14591f17c: 48c1e106 shl rcx, 6
14591f180: 48893c08 mov qword ptr [rax + rcx], rdi
14591f184: f30f11740808 movss dword ptr [rax + rcx + 8], xmm6
14591f18a: 0f1044242c movups xmm0, xmmword ptr [rsp + 0x2c]
14591f18f: 0f104c243c movups xmm1, xmmword ptr [rsp + 0x3c]
14591f194: 0f1054244c movups xmm2, xmmword ptr [rsp + 0x4c]
14591f199: 0f1144080c movups xmmword ptr [rax + rcx + 0xc], xmm0
14591f19e: 0f114c081c movups xmmword ptr [rax + rcx + 0x1c], xmm1
14591f1a3: 0f1154082c movups xmmword ptr [rax + rcx + 0x2c], xmm2
14591f1a8: 8b54245c mov edx, dword ptr [rsp + 0x5c]
14591f1ac: 8954083c mov dword ptr [rax + rcx + 0x3c], edx
14591f1b0: 48ffc3 inc rbx
14591f1b3: 48899eb8050000 mov qword ptr [rsi + 0x5b8], rbx
14591f1ba: 0f28742460 movaps xmm6, xmmword ptr [rsp + 0x60]
14591f1bf: 0f287c2470 movaps xmm7, xmmword ptr [rsp + 0x70]
14591f1c4: 4881c480000000 add rsp, 0x80
14591f1cb: 5b pop rbx
14591f1cc: 5f pop rdi
14591f1cd: 5e pop rsi
14591f1ce: c3 ret
14591f1d0: 55 push rbp
14591f490: 4157 push r15
14591f492: 4156 push r14
14591f494: 56 push rsi
14591f495: 57 push rdi
14591f496: 55 push rbp
14591f497: 53 push rbx
14591f498: 4881ecb8000000 sub rsp, 0xb8
14591f49f: 440f29a424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm12
14591f4a8: 440f299c2490000000 movaps xmmword ptr [rsp + 0x90], xmm11
14591f4b1: 440f29942480000000 movaps xmmword ptr [rsp + 0x80], xmm10
14591f4ba: 440f294c2470 movaps xmmword ptr [rsp + 0x70], xmm9
14591f4c0: 440f29442460 movaps xmmword ptr [rsp + 0x60], xmm8
14591f4c6: 0f297c2450 movaps xmmword ptr [rsp + 0x50], xmm7
14591f4cb: 0f29742440 movaps xmmword ptr [rsp + 0x40], xmm6
14591f4d0: 0f28f3 movaps xmm6, xmm3
14591f4d3: 4c89c7 mov rdi, r8
14591f4d6: 4889d3 mov rbx, rdx
14591f4d9: 4889ce mov rsi, rcx
14591f4dc: 4c8bb42438010000 mov r14, qword ptr [rsp + 0x138]
14591f4e4: f30f10bc2410010000 movss xmm7, dword ptr [rsp + 0x110]
14591f4ed: 8ba9500a0000 mov ebp, dword ptr [rcx + 0xa50]
14591f4f3: ffc5 inc ebp
14591f4f5: 89a9500a0000 mov dword ptr [rcx + 0xa50], ebp
14591f4fb: f3440f10894c0a0000 movss xmm9, dword ptr [rcx + 0xa4c]
14591f504: 4c8bb9b0090000 mov r15, qword ptr [rcx + 0x9b0]
14591f50b: 498d4f10 lea rcx, [r15 + 0x10]
14591f50f: 0f28cb movaps xmm1, xmm3
14591f512: 0f28d7 movaps xmm2, xmm7
14591f515: e82616f8ff call 0x1458a0b40
14591f51a: a801 test al, 1
14591f51c: 7406 je 0x14591f524
14591f51e: 440f28c0 movaps xmm8, xmm0
14591f522: eb34 jmp 0x14591f558
14591f524: 49837f68ff cmp qword ptr [r15 + 0x68], -1
14591f529: 7424 je 0x14591f54f
14591f54f: f3450f1087b8000000 movss xmm8, dword ptr [r15 + 0xb8]
14591f558: f3440f10942430010000 movss xmm10, dword ptr [rsp + 0x130]
14591f562: 448bbc2428010000 mov r15d, dword ptr [rsp + 0x128]
14591f56a: f3440f109c2420010000 movss xmm11, dword ptr [rsp + 0x120]
14591f574: f3440f10a42418010000 movss xmm12, dword ptr [rsp + 0x118]
14591f57e: 410f1006 movups xmm0, xmmword ptr [r14]
14591f582: 0f11442430 movups xmmword ptr [rsp + 0x30], xmm0
14591f587: 4c8bb6a0050000 mov r14, qword ptr [rsi + 0x5a0]
14591f58e: 4c3bb690050000 cmp r14, qword ptr [rsi + 0x590]
14591f595: 750c jne 0x14591f5a3
14591f5a3: f3450f58d9 addss xmm11, xmm9
14591f5a8: 488b8698050000 mov rax, qword ptr [rsi + 0x598]
14591f5af: 4c89f1 mov rcx, r14
14591f5b2: 48c1e107 shl rcx, 7
14591f5b6: 48c7040800000000 mov qword ptr [rax + rcx], 0
14591f5be: 0f10442428 movups xmm0, xmmword ptr [rsp + 0x28]
14591f5c3: 0f11440808 movups xmmword ptr [rax + rcx + 8], xmm0
14591f5c8: 488b542438 mov rdx, qword ptr [rsp + 0x38]
14591f5cd: 4889540818 mov qword ptr [rax + rcx + 0x18], rdx
14591f5d2: 48895c0820 mov qword ptr [rax + rcx + 0x20], rbx
14591f5d7: 48c744082800000000 mov qword ptr [rax + rcx + 0x28], 0
14591f5e0: 488b17 mov rdx, qword ptr [rdi]
14591f5e3: 4889540830 mov qword ptr [rax + rcx + 0x30], rdx
14591f5e8: 8b5708 mov edx, dword ptr [rdi + 8]
14591f5eb: 89540838 mov dword ptr [rax + rcx + 0x38], edx
14591f5ef: 896c083c mov dword ptr [rax + rcx + 0x3c], ebp
14591f5f3: f30f11740840 movss dword ptr [rax + rcx + 0x40], xmm6
14591f5f9: f30f117c0844 movss dword ptr [rax + rcx + 0x44], xmm7
14591f5ff: f3440f11440848 movss dword ptr [rax + rcx + 0x48], xmm8
14591f606: f3440f1164084c movss dword ptr [rax + rcx + 0x4c], xmm12
14591f60d: f3440f114c0850 movss dword ptr [rax + rcx + 0x50], xmm9
14591f614: f3440f115c0854 movss dword ptr [rax + rcx + 0x54], xmm11
14591f61b: c744085800000000 mov dword ptr [rax + rcx + 0x58], 0
14591f623: 44897c085c mov dword ptr [rax + rcx + 0x5c], r15d
14591f628: f3440f11540860 movss dword ptr [rax + rcx + 0x60], xmm10
14591f62f: c74408640000807f mov dword ptr [rax + rcx + 0x64], 0x7f800000
14591f637: 498d5601 lea rdx, [r14 + 1]
14591f63b: 0f57c0 xorps xmm0, xmm0
14591f63e: 0f11440868 movups xmmword ptr [rax + rcx + 0x68], xmm0
14591f643: 48c744087700000000 mov qword ptr [rax + rcx + 0x77], 0
14591f64c: 488996a0050000 mov qword ptr [rsi + 0x5a0], rdx
14591f653: 4c89f0 mov rax, r14
14591f656: 0f28742440 movaps xmm6, xmmword ptr [rsp + 0x40]
14591f65b: 0f287c2450 movaps xmm7, xmmword ptr [rsp + 0x50]
14591f660: 440f28442460 movaps xmm8, xmmword ptr [rsp + 0x60]
14591f666: 440f284c2470 movaps xmm9, xmmword ptr [rsp + 0x70]
14591f66c: 440f28942480000000 movaps xmm10, xmmword ptr [rsp + 0x80]
14591f675: 440f289c2490000000 movaps xmm11, xmmword ptr [rsp + 0x90]
14591f67e: 440f28a424a0000000 movaps xmm12, xmmword ptr [rsp + 0xa0]
14591f687: 4881c4b8000000 add rsp, 0xb8
14591f68e: 5b pop rbx
14591f68f: 5d pop rbp
14591f690: 5f pop rdi
14591f691: 5e pop rsi
14591f692: 415e pop r14
14591f694: 415f pop r15
14591f696: c3 ret
14591f6a0: 55 push rbp
14593ec90: 55 push rbp
14593ed18: 0f28f2 movaps xmm6, xmm2
14593ed1b: 4889d6 mov rsi, rdx
14593ed1e: 4889cf mov rdi, rcx
14593ed21: f30f10894c0a0000 movss xmm1, dword ptr [rcx + 0xa4c]
14593ed29: 4c8bb168050000 mov r14, qword ptr [rcx + 0x568]
14593ed30: 488b8970050000 mov rcx, qword ptr [rcx + 0x570]
14593ed37: 4869c1d8010000 imul rax, rcx, 0x1d8
14593ed3e: 31d2 xor edx, edx
14593ed40: f30f100518e54600 movss xmm0, dword ptr [rip + 0x46e518]
14593f1ac: 4983bc1640feffffff cmp qword ptr [r14 + rdx - 0x1c0], -1
14593f1b5: 750b jne 0x14593f1c2
14593f1b7: 4983bc1680feffffff cmp qword ptr [r14 + rdx - 0x180], -1
14593f1c0: 7431 je 0x14593f1f3
14593f1c2: f3410f105416f4 movss xmm2, dword ptr [r14 + rdx - 0xc]
14593f1c9: 0f2ed1 ucomiss xmm2, xmm1
14593f1cc: 760a jbe 0x14593f1d8
14593f1ce: f30f1005c2be4700 movss xmm0, dword ptr [rip + 0x47bec2]
14593f1d6: eb1b jmp 0x14593f1f3
14593f1d8: f3410f105c16f0 movss xmm3, dword ptr [r14 + rdx - 0x10]
14593f1df: f30f1015a9214700 movss xmm2, dword ptr [rip + 0x4721a9]
14593f1e7: 0f2ed9 ucomiss xmm3, xmm1
14593f1ea: 0f86fd000000 jbe 0x14593f2ed
14593f1f0: 0f28c2 movaps xmm0, xmm2
14593f1f3: 4885c9 test rcx, rcx
14593f1f6: 0f84fd300000 je 0x1459422f9
14593f1fc: 4531e4 xor r12d, r12d
14593f1ff: eb1f jmp 0x14593f220
14593f210: 4981c4d8010000 add r12, 0x1d8
14593f217: 4c39e0 cmp rax, r12
14593f21a: 0f84d9300000 je 0x1459422f9
14593f220: 4b39b426f0000000 cmp qword ptr [r14 + r12 + 0xf0], rsi
14593f228: 75e6 jne 0x14593f210
14593f22a: 4383bc26b000000001 cmp dword ptr [r14 + r12 + 0xb0], 1
14593f233: 74db je 0x14593f210
14593f235: f3440f59c6 mulss xmm8, xmm6
14593f23a: f3440f59c0 mulss xmm8, xmm0
14593f23f: f3440f5f0518e04600 maxss xmm8, dword ptr [rip + 0x46e018]
14593f248: f3430f109c2658010000 movss xmm3, dword ptr [r14 + r12 + 0x158]
14593f252: f3430f10942690010000 movss xmm2, dword ptr [r14 + r12 + 0x190]
14593f25c: 0f57c9 xorps xmm1, xmm1
14593f25f: 0f28c3 movaps xmm0, xmm3
14593f262: f30f5fc1 maxss xmm0, xmm1
14593f266: f3410f5cd8 subss xmm3, xmm8
14593f26b: f3430f119c2658010000 movss dword ptr [r14 + r12 + 0x158], xmm3
14593f275: 0f2eca ucomiss xmm1, xmm2
14593fdc7: 450f2ee3 ucomiss xmm12, xmm11
14593fdcb: 0f82cd000000 jb 0x14593fe9e
14593fdd1: 488b8768050000 mov rax, qword ptr [rdi + 0x568]
14593fdd8: 488b8f70050000 mov rcx, qword ptr [rdi + 0x570]
14593fddf: 4c8d8828feffff lea r9, [rax - 0x1d8]
14593fde6: 4c69c1d8010000 imul r8, rcx, 0x1d8
14593fded: 488bb550010000 mov rsi, qword ptr [rbp + 0x150]
14593fdf4: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14593fe00: 4d85c0 test r8, r8
14593fe03: 0f84ac000000 je 0x14593feb5
14593fe09: 498d91d8010000 lea rdx, [r9 + 0x1d8]
14593fe10: 4981c028feffff add r8, -0x1d8
14593fe17: 4939b1c8020000 cmp qword ptr [r9 + 0x2c8], rsi
14593fe1e: 4989d1 mov r9, rdx
14593fe21: 75dd jne 0x14593fe00
14593fe23: f30f10ba5c010000 movss xmm7, dword ptr [rdx + 0x15c]
14593fe2b: c6856501000000 mov byte ptr [rbp + 0x165], 0
14593fe32: 488d8de0000000 lea rcx, [rbp + 0xe0]
14593fe39: e8a2c20900 call 0x1459dc0e0
14593fe3e: 90 nop
14593fe3f: f30f11bdf8000000 movss dword ptr [rbp + 0xf8], xmm7
14593fe47: 440f138dfc000000 movlps qword ptr [rbp + 0xfc], xmm9
14593fe4f: f3440f119504010000 movss dword ptr [rbp + 0x104], xmm10
14593fe58: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
14593fe5f: 48898558010000 mov qword ptr [rbp + 0x158], rax
14593fe66: 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
14593fe6d: 48894570 mov qword ptr [rbp + 0x70], rax
14593fe71: 0f1085f0000000 movups xmm0, xmmword ptr [rbp + 0xf0]
14593fe78: 0f294500 movaps xmmword ptr [rbp], xmm0
14593fe7c: 488b8500010000 mov rax, qword ptr [rbp + 0x100]
14593fe83: 48894510 mov qword ptr [rbp + 0x10], rax
14593fe87: 488b8768050000 mov rax, qword ptr [rdi + 0x568]
14593fe8e: 488b8f70050000 mov rcx, qword ptr [rdi + 0x570]
14593fe95: 488bb550010000 mov rsi, qword ptr [rbp + 0x150]
14593fe9c: eb22 jmp 0x14593fec0
14593fe9e: 48c78558010000ffffffff mov qword ptr [rbp + 0x158], 0xffffffffffffffff
14593fea9: 488bb550010000 mov rsi, qword ptr [rbp + 0x150]
14593feb0: e9460f0000 jmp 0x145940dfb
14593feb5: 48c78558010000ffffffff mov qword ptr [rbp + 0x158], 0xffffffffffffffff
14593fec0: f3440f10874c0a0000 movss xmm8, dword ptr [rdi + 0xa4c]
14593ffb2: 8b8548010000 mov eax, dword ptr [rbp + 0x148]
14593ffb8: 89817c010000 mov dword ptr [rcx + 0x17c], eax
14593ffbe: 488b8540010000 mov rax, qword ptr [rbp + 0x140]
14593ffc5: 48898174010000 mov qword ptr [rcx + 0x174], rax
14593ffcc: 488b8540010000 mov rax, qword ptr [rbp + 0x140]
14593ffd3: 48898180010000 mov qword ptr [rcx + 0x180], rax
14593ffda: 8b8548010000 mov eax, dword ptr [rbp + 0x148]
14593ffe0: 898188010000 mov dword ptr [rcx + 0x188], eax
14593ffe6: 0f57c0 xorps xmm0, xmm0
14593ffe9: f3410f10c0 movss xmm0, xmm8
14593ffee: 0f13818c010000 movlps qword ptr [rcx + 0x18c], xmm0
14593fff5: c781b000000001000000 mov dword ptr [rcx + 0xb0], 1
14593ffff: f3440f1181b4000000 movss dword ptr [rcx + 0xb4], xmm8
145940008: 48c7411000000000 mov qword ptr [rcx + 0x10], 0
145940010: 48837918ff cmp qword ptr [rcx + 0x18], -1
145940015: 7406 je 0x14594001d
145940017: 4c8b6130 mov r12, qword ptr [rcx + 0x30]
14594001b: eb03 jmp 0x145940020
14594001d: 4531e4 xor r12d, r12d
145940020: 4c8b7158 mov r14, qword ptr [rcx + 0x58]
145940024: 4983feff cmp r14, -1
145940028: 740d je 0x145940037
14594002a: 488b8190000000 mov rax, qword ptr [rcx + 0x90]
145940031: 48894578 mov qword ptr [rbp + 0x78], rax
145940035: eb00 jmp 0x145940037
145940037: 488b81f8000000 mov rax, qword ptr [rcx + 0xf8]
14594003e: 488985d8000000 mov qword ptr [rbp + 0xd8], rax
145940045: 448ab9d0010000 mov r15b, byte ptr [rcx + 0x1d0]
14594004c: e8cfcc0500 call 0x14599cd20
1459402a7: ff878c070000 inc dword ptr [rdi + 0x78c]
1459402ad: 4584ff test r15b, r15b
1459402b0: 7406 je 0x1459402b8
1459402b2: ff8790070000 inc dword ptr [rdi + 0x790]
1459402b8: f30f10bfbc040000 movss xmm7, dword ptr [rdi + 0x4bc]
1459402c0: 0f57c0 xorps xmm0, xmm0
1459402c3: 0f2ef8 ucomiss xmm7, xmm0
1459402c6: 0f8642010000 jbe 0x14594040e
1459402cc: c6856701000000 mov byte ptr [rbp + 0x167], 0
14594040e: 4d85e4 test r12, r12
145940900: 488b8dd8000000 mov rcx, qword ptr [rbp + 0xd8]
145940907: 4885c9 test rcx, rcx
14594090a: 0f84d1040000 je 0x145940de1
145940910: 80794c01 cmp byte ptr [rcx + 0x4c], 1
145940914: 7542 jne 0x145940958
145940916: 0fb787c8020000 movzx eax, word ptr [rdi + 0x2c8]
14594091d: 0f57c0 xorps xmm0, xmm0
145940920: f30f2ac0 cvtsi2ss xmm0, eax
145940924: f30f5e055ccb4600 divss xmm0, dword ptr [rip + 0x46cb5c]
14594092c: f3440f10051b852c01 movss xmm8, dword ptr [rip + 0x12c851b]
145940935: f3440f5ec0 divss xmm8, xmm0
14594093a: 448b4140 mov r8d, dword ptr [rcx + 0x40]
14594093e: e9f8020000 jmp 0x145940c3b
145940958: f30f104144 movss xmm0, dword ptr [rcx + 0x44]
145940c3b: 4585c0 test r8d, r8d
145940de1: 488d4d40 lea rcx, [rbp + 0x40]
14594218c: 888d9d000000 mov byte ptr [rbp + 0x9d], cl
145942192: 8b8d60010000 mov ecx, dword ptr [rbp + 0x160]
145942198: 898d88000000 mov dword ptr [rbp + 0x88], ecx
14594219e: 0fb68d80020000 movzx ecx, byte ptr [rbp + 0x280]
1459421a5: 888d9c000000 mov byte ptr [rbp + 0x9c], cl
1459421ab: 0fb68d88020000 movzx ecx, byte ptr [rbp + 0x288]
1459421b2: 888d9f000000 mov byte ptr [rbp + 0x9f], cl
1459421b8: 4889b580000000 mov qword ptr [rbp + 0x80], rsi
1459421bf: 440f138d8c000000 movlps qword ptr [rbp + 0x8c], xmm9
1459421c7: f3440f119594000000 movss dword ptr [rbp + 0x94], xmm10
1459421d0: f30f11b598000000 movss dword ptr [rbp + 0x98], xmm6
1459421d8: 4488b59e000000 mov byte ptr [rbp + 0x9e], r14b
1459421df: 4488bda0000000 mov byte ptr [rbp + 0xa0], r15b
1459421e6: 4488a5a1000000 mov byte ptr [rbp + 0xa1], r12b
1459421ed: 8885a2000000 mov byte ptr [rbp + 0xa2], al
1459421f3: c6854d01000000 mov byte ptr [rbp + 0x14d], 0
1459421fa: 488d9580000000 lea rdx, [rbp + 0x80]
145942201: 4889f9 mov rcx, rdi
145942204: 4531c0 xor r8d, r8d
145942207: e8442affff call 0x145934c50
14594220c: 90 nop
14594220d: 488b8d58010000 mov rcx, qword ptr [rbp + 0x158]
145942214: 4883f9ff cmp rcx, -1
145942218: 0f84d2000000 je 0x1459422f0
14594221e: 48898da8000000 mov qword ptr [rbp + 0xa8], rcx
145942225: 488b4570 mov rax, qword ptr [rbp + 0x70]
145942229: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
145942230: 0f2845c0 movaps xmm0, xmmword ptr [rbp - 0x40]
145942234: 0f1185b8000000 movups xmmword ptr [rbp + 0xb8], xmm0
14594223b: 488b45d0 mov rax, qword ptr [rbp - 0x30]
14594223f: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
145942246: c685fd00000002 mov byte ptr [rbp + 0xfd], 2
14594224d: 8b8560010000 mov eax, dword ptr [rbp + 0x160]
145942253: 8985e8000000 mov dword ptr [rbp + 0xe8], eax
145942259: 0fb68580020000 movzx eax, byte ptr [rbp + 0x280]
145942260: 8885fc000000 mov byte ptr [rbp + 0xfc], al
145942266: 0fb68588020000 movzx eax, byte ptr [rbp + 0x288]
14594226d: 8885ff000000 mov byte ptr [rbp + 0xff], al
145942273: 4889b5e0000000 mov qword ptr [rbp + 0xe0], rsi
14594227a: 440f138dec000000 movlps qword ptr [rbp + 0xec], xmm9
145942282: f3440f1195f4000000 movss dword ptr [rbp + 0xf4], xmm10
14594228b: f30f11b5f8000000 movss dword ptr [rbp + 0xf8], xmm6
145942293: 4488b5fe000000 mov byte ptr [rbp + 0xfe], r14b
14594229a: 4488bd00010000 mov byte ptr [rbp + 0x100], r15b
1459422a1: 4488a501010000 mov byte ptr [rbp + 0x101], r12b
1459422a8: c6850201000000 mov byte ptr [rbp + 0x102], 0
1459422af: 488d95e0000000 lea rdx, [rbp + 0xe0]
1459422b6: 4c8d85a8000000 lea r8, [rbp + 0xa8]
1459422bd: 48898d58010000 mov qword ptr [rbp + 0x158], rcx
1459422c4: 4889f9 mov rcx, rdi
1459422c7: e88429ffff call 0x145934c50
1459422cc: 90 nop
1459422cd: 488b8558010000 mov rax, qword ptr [rbp + 0x158]
1459422d4: 4885c0 test rax, rax
1459422d7: 7417 je 0x1459422f0
1459422d9: 48c1e004 shl rax, 4
1459422dd: 488d1440 lea rdx, [rax + rax*2]
1459422e1: 41b808000000 mov r8d, 8
1459422e7: 488b4d70 mov rcx, qword ptr [rbp + 0x70]
1459422eb: e8e0fe6bfa call 0x1400021d0
1459422f9: 0f28b570010000 movaps xmm6, xmmword ptr [rbp + 0x170]
145945784: 0f28f9 movaps xmm7, xmm1
145945787: 4989cf mov r15, rcx
14594578a: f30f10b14c0a0000 movss xmm6, dword ptr [rcx + 0xa4c]
145945792: f20f1081d0040000 movsd xmm0, qword ptr [rcx + 0x4d0]
14594579a: 0f294570 movaps xmmword ptr [rbp + 0x70], xmm0
14594579e: f30f1081d8040000 movss xmm0, dword ptr [rcx + 0x4d8]
145945c0a: 49698770050000d8010000 imul rax, qword ptr [r15 + 0x570], 0x1d8
145945c15: 498b8f68050000 mov rcx, qword ptr [r15 + 0x568]
145945c1c: 48898d20020000 mov qword ptr [rbp + 0x220], rcx
145945c23: 4801c8 add rax, rcx
145945c26: 48894550 mov qword ptr [rbp + 0x50], rax
145945c2a: f3440f10252d764600 movss xmm12, dword ptr [rip + 0x46762d]
145945c33: f3440f58e6 addss xmm12, xmm6
145945c38: f30f100528764600 movss xmm0, dword ptr [rip + 0x467628]
145945c40: f30f58c6 addss xmm0, xmm6
145945c44: f30f118590000000 movss dword ptr [rbp + 0x90], xmm0
145945c4c: 48895568 mov qword ptr [rbp + 0x68], rdx
145945c50: 488d82c8000000 lea rax, [rdx + 0xc8]
145945c57: 48894558 mov qword ptr [rbp + 0x58], rax
145945c5b: f30f100519784600 movss xmm0, dword ptr [rip + 0x467819]
145945c63: f30f58c6 addss xmm0, xmm6
145945c67: f30f100dc1ba4600 movss xmm1, dword ptr [rip + 0x46bac1]
145945c6f: f30f118594000000 movss dword ptr [rbp + 0x94], xmm0
145945c77: f30f58c8 addss xmm1, xmm0
145945c7b: f30f118d8c000000 movss dword ptr [rbp + 0x8c], xmm1
145945c83: 440f281df5312c01 movaps xmm11, xmmword ptr [rip + 0x12c31f5]
145945c8b: f3440f10de movss xmm11, xmm6
145945c90: 0f57c0 xorps xmm0, xmm0
145945c93: f30f10c6 movss xmm0, xmm6
145945c97: 0f2945c0 movaps xmmword ptr [rbp - 0x40], xmm0
145945c9b: 48c785a801000000000000 mov qword ptr [rbp + 0x1a8], 0
145945ca6: f3440f100551544700 movss xmm8, dword ptr [rip + 0x475451]
145945caf: 450f57ed xorps xmm13, xmm13
145945cdc: 4c8b8520020000 mov r8, qword ptr [rbp + 0x220]
145945ce3: 488b8da8010000 mov rcx, qword ptr [rbp + 0x1a8]
145945cea: 4c3b4550 cmp r8, qword ptr [rbp + 0x50]
145945cee: 0f95c0 setne al
145945cf1: 0f845b300000 je 0x145948d52
145945cf7: 4889ca mov rdx, rcx
145945cfa: 498d88d8010000 lea rcx, [r8 + 0x1d8]
145945d01: 48898d20020000 mov qword ptr [rbp + 0x220], rcx
145945d08: 488995d8010000 mov qword ptr [rbp + 0x1d8], rdx
145945d0f: 488d4a01 lea rcx, [rdx + 1]
145945d13: 48898da8010000 mov qword ptr [rbp + 0x1a8], rcx
145945d1a: 4180b8b000000000 cmp byte ptr [r8 + 0xb0], 0
145945d22: 0f84a8000000 je 0x145945dd0
145945d28: 0f28c6 movaps xmm0, xmm6
145945d2b: f3410f5c80b4000000 subss xmm0, dword ptr [r8 + 0xb4]
145945d34: 410f2ec0 ucomiss xmm0, xmm8
145945d38: 76a2 jbe 0x145945cdc
145945d3a: 8885ef020000 mov byte ptr [rbp + 0x2ef], al
145945dd0: 8885ef020000 mov byte ptr [rbp + 0x2ef], al
145946b34: 0f28c1 movaps xmm0, xmm1
145946b37: f30f590505202c01 mulss xmm0, dword ptr [rip + 0x12c2005]
145946b3f: 0f28d6 movaps xmm2, xmm6
145946b42: f3410fc296c401000001 cmpltss xmm2, dword ptr [r14 + 0x1c4]
145946b4c: 0f28da movaps xmm3, xmm2
145946b4f: 0f55d9 andnps xmm3, xmm1
145946b52: 0f54d0 andps xmm2, xmm0
145946b55: 0f56d3 orps xmm2, xmm3
145947404: 488b85e8000000 mov rax, qword ptr [rbp + 0xe8]
14594740b: 48893cf0 mov qword ptr [rax + rsi*8], rdi
14594740f: 48ffc6 inc rsi
145947412: 4889b5f0000000 mov qword ptr [rbp + 0xf0], rsi
145947419: 4c8bb510030000 mov r14, qword ptr [rbp + 0x310]
145947afe: 488b8518010000 mov rax, qword ptr [rbp + 0x118]
145947b05: 4889f1 mov rcx, rsi
145947b08: 48c1e105 shl rcx, 5
145947b0c: 4c893408 mov qword ptr [rax + rcx], r14
145947b10: 4c897c0808 mov qword ptr [rax + rcx + 8], r15
145947b15: 48897c0810 mov qword ptr [rax + rcx + 0x10], rdi
145947b1a: 48895c0818 mov qword ptr [rax + rcx + 0x18], rbx
145947b1f: 48ffc6 inc rsi
145947b22: 4889b520010000 mov qword ptr [rbp + 0x120], rsi
145948be1: 488b85b8020000 mov rax, qword ptr [rbp + 0x2b8]
145948be8: 488d0cb6 lea rcx, [rsi + rsi*4]
145948bec: 48893cc8 mov qword ptr [rax + rcx*8], rdi
145948bf0: 488b95e0020000 mov rdx, qword ptr [rbp + 0x2e0]
145948bf7: 488954c808 mov qword ptr [rax + rcx*8 + 8], rdx
145948bfc: 8b95e8020000 mov edx, dword ptr [rbp + 0x2e8]
145948c02: 8954c810 mov dword ptr [rax + rcx*8 + 0x10], edx
145948c06: 66440f134cc814 movlpd qword ptr [rax + rcx*8 + 0x14], xmm9
145948c0d: f3440f1154c81c movss dword ptr [rax + rcx*8 + 0x1c], xmm10
145948c14: f3440f1174c820 movss dword ptr [rax + rcx*8 + 0x20], xmm14
145948c1b: 48ffc6 inc rsi
145948c1e: 4889b5c0020000 mov qword ptr [rbp + 0x2c0], rsi
145948d23: 488b8598010000 mov rax, qword ptr [rbp + 0x198]
145948d2a: 4889f1 mov rcx, rsi
145948d2d: 48c1e104 shl rcx, 4
145948d31: f3440f110c08 movss dword ptr [rax + rcx], xmm9
145948d37: 48897c0808 mov qword ptr [rax + rcx + 8], rdi
145948d3c: 48ffc6 inc rsi
145948d3f: 4889b5a0010000 mov qword ptr [rbp + 0x1a0], rsi
145948d46: 4c8bbd20030000 mov r15, qword ptr [rbp + 0x320]
145948d52: 8885ef020000 mov byte ptr [rbp + 0x2ef], al
145948de5: 498b36 mov rsi, qword ptr [r14]
145948de8: 4889b560020000 mov qword ptr [rbp + 0x260], rsi
145948def: 488b4d60 mov rcx, qword ptr [rbp + 0x60]
145948df3: 4889fa mov rdx, rdi
145948df6: e805bb0700 call 0x1459c4900
145948dfb: 90 nop
145948e9c: f3440f100d9fdc4600 movss xmm9, dword ptr [rip + 0x46dc9f]
145948f02: 4c8d7028 lea r14, [rax + 0x28]
145948f06: 4c8b28 mov r13, qword ptr [rax]
145948f09: 8b4810 mov ecx, dword ptr [rax + 0x10]
145948f0c: 898d08020000 mov dword ptr [rbp + 0x208], ecx
145948f12: 488b4808 mov rcx, qword ptr [rax + 8]
145948f16: 48898d00020000 mov qword ptr [rbp + 0x200], rcx
145948f1d: f20f107814 movsd xmm7, qword ptr [rax + 0x14]
145948f22: f3440f10681c movss xmm13, dword ptr [rax + 0x1c]
145948f28: f3440f106020 movss xmm12, dword ptr [rax + 0x20]
145948f2e: 488b8520030000 mov rax, qword ptr [rbp + 0x320]
145948f35: 8b987c0a0000 mov ebx, dword ptr [rax + 0xa7c]
145948f3b: ffc3 inc ebx
145948f3d: 89987c0a0000 mov dword ptr [rax + 0xa7c], ebx
145948f43: 450f2ed4 ucomiss xmm10, xmm12
145948fd9: 894c2428 mov dword ptr [rsp + 0x28], ecx
145948fdd: 895c2420 mov dword ptr [rsp + 0x20], ebx
145948fe1: 4889f9 mov rcx, rdi
145948fe4: 4c89ea mov rdx, r13
145948fe7: 4c8d4540 lea r8, [rbp + 0x40]
145948feb: 4d89e1 mov r9, r12
145948fee: e8fdabf7ff call 0x1458c3bf0
145949030: 488b8068040000 mov rax, qword ptr [rax + 0x468]
145949037: 4889442420 mov qword ptr [rsp + 0x20], rax
14594903c: 4889f9 mov rcx, rdi
14594903f: 4c89ea mov rdx, r13
145949042: 4c8d8500020000 lea r8, [rbp + 0x200]
145949049: 4189d9 mov r9d, ebx
14594904c: e8dfa6f7ff call 0x1458c3730
1459490c8: f3440f10058f414600 movss xmm8, dword ptr [rip + 0x46418f]
1459490d1: 4531ff xor r15d, r15d
1459490d4: 450f57d2 xorps xmm10, xmm10
1459490ed: eb4a jmp 0x145949139
1459490ef: 90 nop
1459490f0: 4983c410 add r12, 0x10
1459490f4: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
1459490fb: 488b8128060000 mov rax, qword ptr [rcx + 0x628]
145949102: 4889f2 mov rdx, rsi
145949105: 48c1e205 shl rdx, 5
145949109: 0f108560020000 movups xmm0, xmmword ptr [rbp + 0x260]
145949110: 0f108d70020000 movups xmm1, xmmword ptr [rbp + 0x270]
145949117: 0f114c1010 movups xmmword ptr [rax + rdx + 0x10], xmm1
14594911c: 0f110410 movups xmmword ptr [rax + rdx], xmm0
145949120: 48ffc6 inc rsi
145949123: 4889b130060000 mov qword ptr [rcx + 0x630], rsi
14594912a: 0f28cf movaps xmm1, xmm7
14594912d: 4989d8 mov r8, rbx
145949130: 41b101 mov r9b, 1
145949133: e8b832faff call 0x1458ec3f0
145949138: 90 nop
145949139: 4d39f4 cmp r12, r14
14594913c: 0f8481000000 je 0x1459491c3
145949142: f3410f103c24 movss xmm7, dword ptr [r12]
145949148: 410f28c0 movaps xmm0, xmm8
14594914c: 488b8520030000 mov rax, qword ptr [rbp + 0x320]
145949153: f30f5c80a0040000 subss xmm0, dword ptr [rax + 0x4a0]
14594915b: f30f59c7 mulss xmm0, xmm7
14594915f: f3410f5fc0 maxss xmm0, xmm8
145949164: f3480f2cc0 cvttss2si rax, xmm0
145949169: 410f2ec2 ucomiss xmm0, xmm10
14594916d: 410f42c7 cmovb eax, r15d
145949171: 410f2ec1 ucomiss xmm0, xmm9
145949175: 41b9ffffffff mov r9d, 0xffffffff
14594917b: 7703 ja 0x145949180
14594917d: 4189c1 mov r9d, eax
145949180: 498b5c2408 mov rbx, qword ptr [r12 + 8]
145949185: 4d8b8568040000 mov r8, qword ptr [r13 + 0x468]
14594918c: c644242000 mov byte ptr [rsp + 0x20], 0
145949191: 4889f9 mov rcx, rdi
145949194: 4889da mov rdx, rbx
145949197: e854baf7ff call 0x1458c4bf0
14594919c: 90 nop
14594919d: 498bb530060000 mov rsi, qword ptr [r13 + 0x630]
1459491a4: 493bb520060000 cmp rsi, qword ptr [r13 + 0x620]
1459491ab: 0f853fffffff jne 0x1459490f0
1459491b1: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
1459491b8: e8134a2c00 call 0x145c0dbd0
1459491bd: 90 nop
1459491be: e92dffffff jmp 0x1459490f0
14594921d: 0f57ff xorps xmm7, xmm7
145949220: f3440f10154b255600 movss xmm10, dword ptr [rip + 0x56254b]
14594927b: 4c8d7010 lea r14, [rax + 0x10]
14594927f: 488b38 mov rdi, qword ptr [rax]
145949282: 448b6808 mov r13d, dword ptr [rax + 8]
145949286: f3440f10580c movss xmm11, dword ptr [rax + 0xc]
14594928c: 410f2efb ucomiss xmm7, xmm11
145949290: 0f868a000000 jbe 0x145949320
145949296: f3450f59da mulss xmm11, xmm10
14594929b: f34d0f2ccb cvttss2si r9, xmm11
1459492a0: 440f2edf ucomiss xmm11, xmm7
1459492a4: b800000000 mov eax, 0
1459492a9: 440f42c8 cmovb r9d, eax
1459492ad: 450f2ed9 ucomiss xmm11, xmm9
1459492b1: b8ffffffff mov eax, 0xffffffff
1459492b6: 440f47c8 cmova r9d, eax
1459492ba: 498b8768040000 mov rax, qword ptr [r15 + 0x468]
1459492c1: 48898508020000 mov qword ptr [rbp + 0x208], rax
1459492c8: c7850002000000000000 mov dword ptr [rbp + 0x200], 0
1459492d2: 488d8500020000 lea rax, [rbp + 0x200]
1459492d9: 4889442420 mov qword ptr [rsp + 0x20], rax
1459492de: 488d8d60020000 lea rcx, [rbp + 0x260]
1459492e5: 4889fa mov rdx, rdi
1459492e8: 4589e8 mov r8d, r13d
1459492eb: e8909ff7ff call 0x1458c3280
1459492f0: 90 nop
1459492f1: 498bb730060000 mov rsi, qword ptr [r15 + 0x630]
1459492f8: 493bb720060000 cmp rsi, qword ptr [r15 + 0x620]
1459492ff: 0f853bffffff jne 0x145949240
145949305: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14594930c: e8bf482c00 call 0x145c0dbd0
145949311: 90 nop
145949312: e929ffffff jmp 0x145949240
145949317: 660f1f840000000000 nop word ptr [rax + rax]
145949320: 498b8768050000 mov rax, qword ptr [r15 + 0x568]
145949327: 49699770050000d8010000 imul rdx, qword ptr [r15 + 0x570], 0x1d8
145949332: 31c9 xor ecx, ecx
145949334: 4989c0 mov r8, rax
145949337: 660f1f840000000000 nop word ptr [rax + rax]
145949340: 4839ca cmp rdx, rcx
145949343: 746b je 0x1459493b0
145949345: 4881c1d8010000 add rcx, 0x1d8
14594934c: 4939b8f0000000 cmp qword ptr [r8 + 0xf0], rdi
145949353: 4d8d80d8010000 lea r8, [r8 + 0x1d8]
14594935a: 75e4 jne 0x145949340
1459493bf: 498b8768040000 mov rax, qword ptr [r15 + 0x468]
1459493c6: 488985b0010000 mov qword ptr [rbp + 0x1b0], rax
1459493cd: 48898508020000 mov qword ptr [rbp + 0x208], rax
1459493d4: c7850002000000000000 mov dword ptr [rbp + 0x200], 0
1459493de: c7854002000000000000 mov dword ptr [rbp + 0x240], 0
1459493e8: 488d8540020000 lea rax, [rbp + 0x240]
1459493ef: 4889442430 mov qword ptr [rsp + 0x30], rax
1459493f4: 488d8500020000 lea rax, [rbp + 0x200]
1459493fb: 4889442428 mov qword ptr [rsp + 0x28], rax
145949400: 48c744242001000000 mov qword ptr [rsp + 0x20], 1
145949409: 488d8d60020000 lea rcx, [rbp + 0x260]
145949410: 4889fa mov rdx, rdi
145949413: 4589e8 mov r8d, r13d
145949416: 4c8d8db0010000 lea r9, [rbp + 0x1b0]
14594941d: e8ae53f8ff call 0x1458ce7d0
145949422: 90 nop
145949423: 498bb730060000 mov rsi, qword ptr [r15 + 0x630]
14594942a: 493bb720060000 cmp rsi, qword ptr [r15 + 0x620]
145949431: 750d jne 0x145949440
145949433: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
14594943a: e891472c00 call 0x145c0dbd0
14594943f: 90 nop
145949440: 498b8728060000 mov rax, qword ptr [r15 + 0x628]
145949447: 4889f1 mov rcx, rsi
14594944a: 48c1e105 shl rcx, 5
14594944e: 0f108560020000 movups xmm0, xmmword ptr [rbp + 0x260]
145949455: 0f108d70020000 movups xmm1, xmmword ptr [rbp + 0x270]
14594945c: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
145949461: 0f110408 movups xmmword ptr [rax + rcx], xmm0
145949465: 48ffc6 inc rsi
145949468: 4989b730060000 mov qword ptr [r15 + 0x630], rsi
14594946f: 4489e9 mov ecx, r13d
145949472: e8e9370200 call 0x14596cc60
145949477: 450f57ed xorps xmm13, xmm13
14594947b: 410f2ec5 ucomiss xmm0, xmm13
14594947f: 7629 jbe 0x1459494aa
145949481: f2410f108fd0040000 movsd xmm1, qword ptr [r15 + 0x4d0]
14594948a: 440f5ce1 subps xmm12, xmm1
14594948e: 450f59e4 mulps xmm12, xmm12
145949492: f3410f16cc movshdup xmm1, xmm12
145949497: f3410f58cc addss xmm1, xmm12
14594949c: 450f57ed xorps xmm13, xmm13
1459494a0: f3440f51e9 sqrtss xmm13, xmm1
1459494a5: f3440f5ee8 divss xmm13, xmm0
1459494aa: 4d8ba768040000 mov r12, qword ptr [r15 + 0x468]
1459494b1: 498bb7e8050000 mov rsi, qword ptr [r15 + 0x5e8]
1459494b8: 493bb7d8050000 cmp rsi, qword ptr [r15 + 0x5d8]
1459494bf: 750d jne 0x1459494ce
1459494c1: 488b8df0020000 mov rcx, qword ptr [rbp + 0x2f0]
1459494c8: e823462c00 call 0x145c0daf0
1459494cd: 90 nop
1459494ce: f3440f58ee addss xmm13, xmm6
1459494d3: 498b87e0050000 mov rax, qword ptr [r15 + 0x5e0]
1459494da: 4889f1 mov rcx, rsi
1459494dd: 48c1e107 shl rcx, 7
1459494e1: 48c7040800000000 mov qword ptr [rax + rcx], 0
1459494e9: c744081000000000 mov dword ptr [rax + rcx + 0x10], 0
1459494f1: c644084902 mov byte ptr [rax + rcx + 0x49], 2
1459494f6: 4c89640850 mov qword ptr [rax + rcx + 0x50], r12
1459494fb: 48897c0858 mov qword ptr [rax + rcx + 0x58], rdi
145949500: c744086000000000 mov dword ptr [rax + rcx + 0x60], 0
145949508: f3440f116c086c movss dword ptr [rax + rcx + 0x6c], xmm13
14594950f: 44896c0870 mov dword ptr [rax + rcx + 0x70], r13d
145949514: f3440f115c0874 movss dword ptr [rax + rcx + 0x74], xmm11
14594951b: c744087800010005 mov dword ptr [rax + rcx + 0x78], 0x5000100
145949523: 48ffc6 inc rsi
145949526: 4989b7e8050000 mov qword ptr [r15 + 0x5e8], rsi
14594952d: 4c89f0 mov rax, r14
145949530: e93dfdffff jmp 0x145949272
145949a20: 4885f6 test rsi, rsi
145949a23: 7420 je 0x145949a45
145949a25: 488d7810 lea rdi, [rax + 0x10]
145949a29: 488b10 mov rdx, qword ptr [rax]
145949a2c: 448b4008 mov r8d, dword ptr [rax + 8]
145949a30: 4883c6f0 add rsi, -0x10
145949a34: 4c89f9 mov rcx, r15
145949a37: 4531c9 xor r9d, r9d
145949a3a: e8e1420000 call 0x14594dd20
145949a3f: 90 nop
145949a40: 4889f8 mov rax, rdi
145949a43: ebdb jmp 0x145949a20
145949a90: 4885f6 test rsi, rsi
145949a93: 741d je 0x145949ab2
145949a95: 488d7810 lea rdi, [rax + 0x10]
145949a99: 488b10 mov rdx, qword ptr [rax]
145949a9c: 448b4008 mov r8d, dword ptr [rax + 8]
145949aa0: 4883c6f0 add rsi, -0x10
145949aa4: 4c89f9 mov rcx, r15
145949aa7: e8544d0000 call 0x14594e800
145949aac: 90 nop
145949aad: 4889f8 mov rax, rdi
145949ab0: ebde jmp 0x145949a90
145949b43: 4939de cmp r14, rbx
145949b46: 7442 je 0x145949b8a
145949b48: 4d8b06 mov r8, qword ptr [r14]
145949b4b: 4d85c0 test r8, r8
145949b4e: 743a je 0x145949b8a
145949b50: 410f104618 movups xmm0, xmmword ptr [r14 + 0x18]
145949b55: 4d8b4e08 mov r9, qword ptr [r14 + 8]
145949b59: 498b5610 mov rdx, qword ptr [r14 + 0x10]
145949b5d: 0f11442420 movups xmmword ptr [rsp + 0x20], xmm0
145949b62: 4889f9 mov rcx, rdi
145949b65: e8a6a4f7ff call 0x1458c4010
145949b6a: 90 nop
145949b6b: 498bb730060000 mov rsi, qword ptr [r15 + 0x630]
145949b72: 493bb720060000 cmp rsi, qword ptr [r15 + 0x620]
145949b79: 7595 jne 0x145949b10
145949b7b: 488b8d10030000 mov rcx, qword ptr [rbp + 0x310]
145949b82: e849402c00 call 0x145c0dbd0
145949b87: 90 nop
145949b88: eb86 jmp 0x145949b10
145949c23: 4939de cmp r14, rbx
145949c26: 7441 je 0x145949c69
145949c28: 498b16 mov rdx, qword ptr [r14]
145949c2b: 4885d2 test rdx, rdx
145949c2e: 7439 je 0x145949c69
145949c30: 498b4618 mov rax, qword ptr [r14 + 0x18]
145949c34: 4d8b4608 mov r8, qword ptr [r14 + 8]
145949c38: 4d8b4e10 mov r9, qword ptr [r14 + 0x10]
145949c3c: 4889442420 mov qword ptr [rsp + 0x20], rax
145949c41: 4889f9 mov rcx, rdi
145949c44: e87786f7ff call 0x1458c22c0
145949c49: 90 nop
14594a002: 488b85e0000000 mov rax, qword ptr [rbp + 0xe0]
14594a009: 488985f0020000 mov qword ptr [rbp + 0x2f0], rax
14594a010: 4c8ba5e8000000 mov r12, qword ptr [rbp + 0xe8]
14594a017: 488b85f0000000 mov rax, qword ptr [rbp + 0xf0]
14594a01e: 4d8d3cc4 lea r15, [r12 + rax*8]
14594a022: 31f6 xor esi, esi
14594a024: 0f57ff xorps xmm7, xmm7
14594a027: 450f57d2 xorps xmm10, xmm10
14594a02b: 4c89a518030000 mov qword ptr [rbp + 0x318], r12
14594a032: eb4c jmp 0x14594a080
14594a034: 488b9520030000 mov rdx, qword ptr [rbp + 0x320]
14594a03b: 488b8228060000 mov rax, qword ptr [rdx + 0x628]
14594a042: 4889f1 mov rcx, rsi
14594a045: 48c1e105 shl rcx, 5
14594a049: 0f108560020000 movups xmm0, xmmword ptr [rbp + 0x260]
14594a050: 0f108d70020000 movups xmm1, xmmword ptr [rbp + 0x270]
14594a057: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
14594a05c: 0f110408 movups xmmword ptr [rax + rcx], xmm0
14594a060: 48ffc6 inc rsi
14594a063: 4889b230060000 mov qword ptr [rdx + 0x630], rsi
14594a06a: 488d8db0010000 lea rcx, [rbp + 0x1b0]
14594a071: e82a9b0700 call 0x1459c3ba0
14594a076: 90 nop
14594a077: 31f6 xor esi, esi
14594a079: 0f1f8000000000 nop dword ptr [rax]
14594a080: 4d39fc cmp r12, r15
14594a083: 0f8467040000 je 0x14594a4f0
14594a089: 4d8b2c24 mov r13, qword ptr [r12]
14594a08d: 4983c408 add r12, 8
14594a091: 488b8520030000 mov rax, qword ptr [rbp + 0x320]
14594a098: 488b9868050000 mov rbx, qword ptr [rax + 0x568]
14594a09f: 4c69b070050000d8010000 imul r14, qword ptr [rax + 0x570], 0x1d8
14594a0aa: 31c0 xor eax, eax
14594a0ac: 4889d9 mov rcx, rbx
14594a0af: 90 nop
14594a0b0: 4939c6 cmp r14, rax
14594a0b3: 74cb je 0x14594a080
14594a0b5: 4805d8010000 add rax, 0x1d8
14594a0bb: 4c39a9f0000000 cmp qword ptr [rcx + 0xf0], r13
14594a0c2: 488d89d8010000 lea rcx, [rcx + 0x1d8]
14594a0c9: 75e5 jne 0x14594a0b0
14594a0cb: 4883bc0380feffffff cmp qword ptr [rbx + rax - 0x180], -1
14594a0d4: 74aa je 0x14594a080
14594a0d6: 488b8403b8feffff mov rax, qword ptr [rbx + rax - 0x148]
14594a0de: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
14594a0e5: 483b8178060000 cmp rax, qword ptr [rcx + 0x678]
14594a0ec: 7392 jae 0x14594a080
14594a0ee: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
14594a0f5: 488b9170060000 mov rdx, qword ptr [rcx + 0x670]
14594a0fc: 488d0480 lea rax, [rax + rax*4]
14594a100: 488b7cc210 mov rdi, qword ptr [rdx + rax*8 + 0x10]
14594a105: 4889fa mov rdx, rdi
14594a108: e8d3020200 call 0x14596a3e0
14594a10d: 90 nop
14594a10e: 0f28f0 movaps xmm6, xmm0
14594a111: 488b8d20030000 mov rcx, qword ptr [rbp + 0x320]
14594a118: 4889fa mov rdx, rdi
14594a11b: e8c0060200 call 0x14596a7e0
14594a120: 90 nop
14594a121: 4881c328feffff add rbx, -0x1d8
14594a128: 0f1f840000000000 nop dword ptr [rax + rax]
14594a130: 4d85f6 test r14, r14
14594a133: 0f8447ffffff je 0x14594a080
14594a139: 488dbbd8010000 lea rdi, [rbx + 0x1d8]
14594a140: 4981c628feffff add r14, -0x1d8
14594a147: 4c39abc8020000 cmp qword ptr [rbx + 0x2c8], r13
14594a14e: 4889fb mov rbx, rdi
14594a151: 75dd jne 0x14594a130
14594a153: f30f108f5c010000 movss xmm1, dword ptr [rdi + 0x15c]
14594a15b: 0f2ef1 ucomiss xmm6, xmm1
14594a15e: 762f jbe 0x14594a18f
14594a160: f30f109758010000 movss xmm2, dword ptr [rdi + 0x158]
14594a168: f30f5ed1 divss xmm2, xmm1
14594a16c: 0f57c9 xorps xmm1, xmm1
14594a16f: f30f5fca maxss xmm1, xmm2
14594a173: 410f28d0 movaps xmm2, xmm8
14594a177: f30f5dd1 minss xmm2, xmm1
14594a17b: f30f11b75c010000 movss dword ptr [rdi + 0x15c], xmm6
14594a183: f30f59f2 mulss xmm6, xmm2
14594a187: f30f11b758010000 movss dword ptr [rdi + 0x158], xmm6
14594a18f: f30f108f60010000 movss xmm1, dword ptr [rdi + 0x160]
14594a197: 0f28d1 movaps xmm2, xmm1
14594a19a: f30f5fd0 maxss xmm2, xmm0
14594a19e: 0f28c2 movaps xmm0, xmm2
14594a1a1: f30fc2c203 cmpunordss xmm0, xmm2
14594a1a6: 0f28d8 movaps xmm3, xmm0
14594a1a9: 0f55da andnps xmm3, xmm2
14594a1ac: 0f54c1 andps xmm0, xmm1
14594a1af: 0f56c3 orps xmm0, xmm3
14594a1b2: f30f118760010000 movss dword ptr [rdi + 0x160], xmm0
14594a1ba: 4889f9 mov rcx, rdi
14594dd20: 55 push rbp
14594dd21: 4157 push r15
14594dd23: 4156 push r14
14594dd25: 4155 push r13
14594dd27: 4154 push r12
14594dd29: 56 push rsi
14594dd2a: 57 push rdi
14594dd2b: 53 push rbx
14594dd2c: 4881ecc8000000 sub rsp, 0xc8
14594dd33: 488dac2480000000 lea rbp, [rsp + 0x80]
14594dd3b: 48c74540feffffff mov qword ptr [rbp + 0x40], 0xfffffffffffffffe
14594dd43: 488b8170050000 mov rax, qword ptr [rcx + 0x570]
14594dd4a: 4885c0 test rax, rax
14594dd4d: 0f84d7060000 je 0x14594e42a
14594dd53: 488bb168050000 mov rsi, qword ptr [rcx + 0x568]
14594dd5a: 4869c0d8010000 imul rax, rax, 0x1d8
14594dd61: 4531f6 xor r14d, r14d
14594dd64: eb1a jmp 0x14594dd80
14594dd80: 4a399436f0000000 cmp qword ptr [rsi + r14 + 0xf0], rdx
14594dd88: 75e6 jne 0x14594dd70
14594dd8a: 4283bc36b000000001 cmp dword ptr [rsi + r14 + 0xb0], 1
14594dd93: 74db je 0x14594dd70
14594dd95: 468ba43618010000 mov r12d, dword ptr [rsi + r14 + 0x118]
14594dd9d: 4584c9 test r9b, r9b
14594dda0: 0f8497010000 je 0x14594df3d
14594dda6: f3420f6f8c361c010000 movdqu xmm1, xmmword ptr [rsi + r14 + 0x11c]
14594ddb0: f3420f6f84362c010000 movdqu xmm0, xmmword ptr [rsi + r14 + 0x12c]
14594ddba: 66410f6ed0 movd xmm2, r8d
14594ddbf: 660f70d200 pshufd xmm2, xmm2, 0
14594ddc4: 660f6fd8 movdqa xmm3, xmm0
14594ddc8: 660f76da pcmpeqd xmm3, xmm2
14594ddcc: 660f76d1 pcmpeqd xmm2, xmm1
14594ddd0: 660f6bd3 packssdw xmm2, xmm3
14594ddd4: 660fd7c2 pmovmskb eax, xmm2
14594ddd8: 85c0 test eax, eax
14594ddda: 0f854a060000 jne 0x14594e42a
14594dde0: 428b84363c010000 mov eax, dword ptr [rsi + r14 + 0x13c]
14594dde8: 4439c0 cmp eax, r8d
14594ddeb: 0f8439060000 je 0x14594e42a
14594ddf1: 468b8c3640010000 mov r9d, dword ptr [rsi + r14 + 0x140]
14594ddf9: 4539c1 cmp r9d, r8d
14594ddfc: 0f8428060000 je 0x14594e42a
14594de02: 468b943644010000 mov r10d, dword ptr [rsi + r14 + 0x144]
14594de0a: 4539c2 cmp r10d, r8d
14594de0d: 0f8417060000 je 0x14594e42a
14594de13: 468b9c3648010000 mov r11d, dword ptr [rsi + r14 + 0x148]
14594de1b: 4539c3 cmp r11d, r8d
14594de1e: 0f8406060000 je 0x14594e42a
14594de24: 428bbc364c010000 mov edi, dword ptr [rsi + r14 + 0x14c]
14594de2c: 4439c7 cmp edi, r8d
14594de2f: 0f84f5050000 je 0x14594e42a
14594de35: 428b9c3650010000 mov ebx, dword ptr [rsi + r14 + 0x150]
14594de3d: 4439c3 cmp ebx, r8d
14594de40: 0f84e4050000 je 0x14594e42a
14594de46: 468bbc3654010000 mov r15d, dword ptr [rsi + r14 + 0x154]
14594de4e: 4539c7 cmp r15d, r8d
14594de51: 0f84d3050000 je 0x14594e42a
14594de57: 4539c4 cmp r12d, r8d
14594de5a: 0f84ca050000 je 0x14594e42a
14594de60: 4585e4 test r12d, r12d
14594de63: 0f84fc010000 je 0x14594e065
14594de69: 66410f7ecc movd r12d, xmm1
14594de6e: 4585e4 test r12d, r12d
14594de71: 0f84f2010000 je 0x14594e069
14594de77: 660f70d155 pshufd xmm2, xmm1, 0x55
14594de7c: 66410f7ed4 movd r12d, xmm2
14594de81: 4585e4 test r12d, r12d
14594de84: 0f84e6010000 je 0x14594e070
14594de8a: 660f70d1ee pshufd xmm2, xmm1, 0xee
14594de8f: 66410f7ed4 movd r12d, xmm2
14594de94: 4585e4 test r12d, r12d
14594de97: 0f84da010000 je 0x14594e077
14594de9d: 660f70c9ff pshufd xmm1, xmm1, 0xff
14594dea2: 66410f7ecc movd r12d, xmm1
14594dea7: 4585e4 test r12d, r12d
14594deaa: 0f84ce010000 je 0x14594e07e
14594deb0: 66410f7ec4 movd r12d, xmm0
14594deb5: 4585e4 test r12d, r12d
14594deb8: 0f84c7010000 je 0x14594e085
14594debe: 660f70c855 pshufd xmm1, xmm0, 0x55
14594dec3: 66410f7ecc movd r12d, xmm1
14594dec8: 4585e4 test r12d, r12d
14594decb: 0f84bb010000 je 0x14594e08c
14594ded1: 660f70c8ee pshufd xmm1, xmm0, 0xee
14594ded6: 66410f7ecc movd r12d, xmm1
14594dedb: 4585e4 test r12d, r12d
14594dede: 0f84af010000 je 0x14594e093
14594dee4: 660f70c0ff pshufd xmm0, xmm0, 0xff
14594dee9: 66410f7ec4 movd r12d, xmm0
14594deee: 4585e4 test r12d, r12d
14594def1: 0f84a3010000 je 0x14594e09a
14594def7: 85c0 test eax, eax
14594def9: 0f84a2010000 je 0x14594e0a1
14594deff: 4585c9 test r9d, r9d
14594df02: 0f84a0010000 je 0x14594e0a8
14594df08: 4585d2 test r10d, r10d
14594df0b: 0f849e010000 je 0x14594e0af
14594df11: 4585db test r11d, r11d
14594df14: 0f849c010000 je 0x14594e0b6
14594df1a: 85ff test edi, edi
14594df1c: 0f849b010000 je 0x14594e0bd
14594df22: 85db test ebx, ebx
14594df24: 0f849a010000 je 0x14594e0c4
14594df2a: 4585ff test r15d, r15d
14594df2d: 0f85f7040000 jne 0x14594e42a
14594df33: bf0f000000 mov edi, 0xf
14594df38: e98c010000 jmp 0x14594e0c9
14594df3d: 31c0 xor eax, eax
14594df3f: 4539c4 cmp r12d, r8d
14594df42: 7507 jne 0x14594df4b
14594df44: 31ff xor edi, edi
14594df46: e981010000 jmp 0x14594e0cc
14594df4b: bf01000000 mov edi, 1
14594df50: 463984361c010000 cmp dword ptr [rsi + r14 + 0x11c], r8d
14594df58: 0f846e010000 je 0x14594e0cc
14594df5e: bf02000000 mov edi, 2
14594df63: 4639843620010000 cmp dword ptr [rsi + r14 + 0x120], r8d
14594df6b: 0f845b010000 je 0x14594e0cc
14594df71: bf03000000 mov edi, 3
14594df76: 4639843624010000 cmp dword ptr [rsi + r14 + 0x124], r8d
14594df7e: 0f8448010000 je 0x14594e0cc
14594df84: bf04000000 mov edi, 4
14594df89: 4639843628010000 cmp dword ptr [rsi + r14 + 0x128], r8d
14594df91: 0f8435010000 je 0x14594e0cc
14594df97: bf05000000 mov edi, 5
14594df9c: 463984362c010000 cmp dword ptr [rsi + r14 + 0x12c], r8d
14594dfa4: 0f8422010000 je 0x14594e0cc
14594dfaa: bf06000000 mov edi, 6
14594dfaf: 4639843630010000 cmp dword ptr [rsi + r14 + 0x130], r8d
14594dfb7: 0f840f010000 je 0x14594e0cc
14594dfbd: bf07000000 mov edi, 7
14594dfc2: 4639843634010000 cmp dword ptr [rsi + r14 + 0x134], r8d
14594dfca: 0f84fc000000 je 0x14594e0cc
14594dfd0: bf08000000 mov edi, 8
14594dfd5: 4639843638010000 cmp dword ptr [rsi + r14 + 0x138], r8d
14594dfdd: 0f84e9000000 je 0x14594e0cc
14594dfe3: bf09000000 mov edi, 9
14594dfe8: 463984363c010000 cmp dword ptr [rsi + r14 + 0x13c], r8d
14594dff0: 0f84d6000000 je 0x14594e0cc
14594dff6: bf0a000000 mov edi, 0xa
14594dffb: 4639843640010000 cmp dword ptr [rsi + r14 + 0x140], r8d
14594e003: 0f84c3000000 je 0x14594e0cc
14594e009: bf0b000000 mov edi, 0xb
14594e00e: 4639843644010000 cmp dword ptr [rsi + r14 + 0x144], r8d
14594e016: 0f84b0000000 je 0x14594e0cc
14594e01c: bf0c000000 mov edi, 0xc
14594e021: 4639843648010000 cmp dword ptr [rsi + r14 + 0x148], r8d
14594e029: 0f849d000000 je 0x14594e0cc
14594e02f: bf0d000000 mov edi, 0xd
14594e034: 463984364c010000 cmp dword ptr [rsi + r14 + 0x14c], r8d
14594e03c: 0f848a000000 je 0x14594e0cc
14594e042: bf0e000000 mov edi, 0xe
14594e047: 4639843650010000 cmp dword ptr [rsi + r14 + 0x150], r8d
14594e04f: 747b je 0x14594e0cc
14594e051: bf0f000000 mov edi, 0xf
14594e056: 4639843654010000 cmp dword ptr [rsi + r14 + 0x154], r8d
14594e05e: 746c je 0x14594e0cc
14594e065: 31ff xor edi, edi
14594e067: eb60 jmp 0x14594e0c9
14594e069: bf01000000 mov edi, 1
14594e06e: eb59 jmp 0x14594e0c9
14594e070: bf02000000 mov edi, 2
14594e075: eb52 jmp 0x14594e0c9
14594e077: bf03000000 mov edi, 3
14594e07c: eb4b jmp 0x14594e0c9
14594e07e: bf04000000 mov edi, 4
14594e083: eb44 jmp 0x14594e0c9
14594e085: bf05000000 mov edi, 5
14594e08a: eb3d jmp 0x14594e0c9
14594e08c: bf06000000 mov edi, 6
14594e091: eb36 jmp 0x14594e0c9
14594e093: bf07000000 mov edi, 7
14594e098: eb2f jmp 0x14594e0c9
14594e09a: bf08000000 mov edi, 8
14594e09f: eb28 jmp 0x14594e0c9
14594e0a1: bf09000000 mov edi, 9
14594e0a6: eb21 jmp 0x14594e0c9
14594e0a8: bf0a000000 mov edi, 0xa
14594e0ad: eb1a jmp 0x14594e0c9
14594e0af: bf0b000000 mov edi, 0xb
14594e0b4: eb13 jmp 0x14594e0c9
14594e0b6: bf0c000000 mov edi, 0xc
14594e0bb: eb0c jmp 0x14594e0c9
14594e0bd: bf0d000000 mov edi, 0xd
14594e0c2: eb05 jmp 0x14594e0c9
14594e0c4: bf0e000000 mov edi, 0xe
14594e0c9: 4489c0 mov eax, r8d
14594e0cc: 48894dd0 mov qword ptr [rbp - 0x30], rcx
14594e0d0: 488955c8 mov qword ptr [rbp - 0x38], rdx
14594e0d4: 488d0cbe lea rcx, [rsi + rdi*4]
14594e0d8: 4189840e18010000 mov dword ptr [r14 + rcx + 0x118], eax
14594e0e0: 48c745f800000000 mov qword ptr [rbp - 8], 0
14594e0e8: 48c7450800000000 mov qword ptr [rbp + 8], 0
14594e0f0: 488d4f4f lea rcx, [rdi + 0x4f]
14594e0f4: 488d55f8 lea rdx, [rbp - 8]
14594e0f8: 48895510 mov qword ptr [rbp + 0x10], rdx
14594e0fc: 660fefc0 pxor xmm0, xmm0
14594e100: f30f7f4518 movdqu xmmword ptr [rbp + 0x18], xmm0
14594e105: 48894d30 mov qword ptr [rbp + 0x30], rcx
14594e109: 488d4da8 lea rcx, [rbp - 0x58]
14594e10d: 488d5510 lea rdx, [rbp + 0x10]
14594e111: 4189c0 mov r8d, eax
14594e114: e8d700f9ff call 0x1458de1f0
14594e11a: 89f8 mov eax, edi
14594e11c: c1e803 shr eax, 3
14594e11f: 4189c0 mov r8d, eax
14594e122: 41c1e005 shl r8d, 5
14594e126: 4901f0 add r8, rsi
14594e129: 31d2 xor edx, edx
14594e12b: 4383bc063001000000 cmp dword ptr [r14 + r8 + 0x130], 0
14594e134: 0f95c2 setne dl
14594e137: c1e219 shl edx, 0x19
14594e13a: 31c9 xor ecx, ecx
14594e13c: 4383bc062c01000000 cmp dword ptr [r14 + r8 + 0x12c], 0
14594e145: 0f95c1 setne cl
14594e148: c1e115 shl ecx, 0x15
14594e14b: 4531c9 xor r9d, r9d
14594e14e: 4383bc062801000000 cmp dword ptr [r14 + r8 + 0x128], 0
14594e157: 410f95c1 setne r9b
14594e15b: 41c1e111 shl r9d, 0x11
14594e15f: 4531d2 xor r10d, r10d
14594e162: 4383bc062401000000 cmp dword ptr [r14 + r8 + 0x124], 0
14594e16b: 410f95c2 setne r10b
14594e16f: 41c1e20d shl r10d, 0xd
14594e173: 4531db xor r11d, r11d
14594e176: 4383bc062001000000 cmp dword ptr [r14 + r8 + 0x120], 0
14594e17f: 410f95c3 setne r11b
14594e183: 41c1e309 shl r11d, 9
14594e187: 4531ed xor r13d, r13d
14594e18a: 4383bc061c01000000 cmp dword ptr [r14 + r8 + 0x11c], 0
14594e193: 448d24bd00000000 lea r12d, [rdi*4]
14594e19b: 410f95c5 setne r13b
14594e19f: 41c1e505 shl r13d, 5
14594e1a3: 31db xor ebx, ebx
14594e1a5: 4383bc061801000000 cmp dword ptr [r14 + r8 + 0x118], 0
14594e1ae: 0f95c3 setne bl
14594e1b1: 4183cc1c or r12d, 0x1c
14594e1b5: 4901f4 add r12, rsi
14594e1b8: 4531ff xor r15d, r15d
14594e1bb: 4383bc261801000000 cmp dword ptr [r14 + r12 + 0x118], 0
14594e1c4: 410f95c7 setne r15b
14594e1c8: 41c1e71d shl r15d, 0x1d
14594e1cc: 09d1 or ecx, edx
14594e1ce: 4409c9 or ecx, r9d
14594e1d1: 4409d1 or ecx, r10d
14594e1d4: 4409d9 or ecx, r11d
14594e1d7: 4409e9 or ecx, r13d
14594e1da: 448d0459 lea r8d, [rcx + rbx*2]
14594e1de: 4509f8 or r8d, r15d
14594e1e1: 83c063 add eax, 0x63
14598ddd0: 4157 push r15
14599c8e0: 4157 push r15
14599c8e2: 4156 push r14
14599c8e4: 4155 push r13
14599c8e6: 4154 push r12
14599c8e8: 56 push rsi
14599c8e9: 57 push rdi
14599c8ea: 55 push rbp
14599c8eb: 53 push rbx
14599c8ec: 4883ec28 sub rsp, 0x28
14599c8f0: 4989c8 mov r8, rcx
14599c8f3: 48c1e202 shl rdx, 2
14599c8f7: 4c8b4910 mov r9, qword ptr [rcx + 0x10]
14599c8fb: 4d85c9 test r9, r9
14599c8fe: 0f84c6020000 je 0x14599cbca
14599c904: 4d8b5008 mov r10, qword ptr [r8 + 8]
14599c908: 4d8d59ff lea r11, [r9 - 1]
14599c90c: 4c89ce mov rsi, r9
14599c90f: 4883e6fe and rsi, 0xfffffffffffffffe
14599c913: 4531ff xor r15d, r15d
14599c916: 31c0 xor eax, eax
14599c918: eb38 jmp 0x14599c952
14599c920: 4d85ff test r15, r15
14599c923: 0f84b6010000 je 0x14599cadf
14599c929: 4981ffff000000 cmp r15, 0xff
14599c930: bfff000000 mov edi, 0xff
14599c935: 490f42ff cmovb rdi, r15
14599c939: ffcf dec edi
14599c93b: 4d85ff test r15, r15
14599c93e: bb00000000 mov ebx, 0
14599c943: 0f44fb cmove edi, ebx
14599c946: c1e103 shl ecx, 3
14599c949: d3e7 shl edi, cl
14599c94b: 09c7 or edi, eax
14599c94d: 4d89f7 mov r15, r14
14599c950: 89f8 mov eax, edi
14599c952: 4983ff04 cmp r15, 4
14599c956: 0f83f2020000 jae 0x14599cc4e
14599c95c: 4c89ff mov rdi, r15
14599c95f: 4809d7 or rdi, rdx
14599c962: 4883ff0f cmp rdi, 0xf
14599c966: 0f87f3020000 ja 0x14599cc5f
14599c96c: 498d4f01 lea rcx, [r15 + 1]
14599c970: 418bacb818010000 mov ebp, dword ptr [r8 + rdi*4 + 0x118]
14599c978: 85ed test ebp, ebp
14599c97a: 7414 je 0x14599c990
14599c97c: 4989ce mov r14, rcx
14599c97f: 4c89f9 mov rcx, r15
14599c982: e999000000 jmp 0x14599ca20
14599c990: 4983ff03 cmp r15, 3
14599c994: 0f84b4020000 je 0x14599cc4e
14599c99a: 4889cb mov rbx, rcx
14599c99d: 4809d3 or rbx, rdx
14599c9a0: 4883fb0f cmp rbx, 0xf
14599c9a4: 0f87b5020000 ja 0x14599cc5f
14599c9aa: 498d7f02 lea rdi, [r15 + 2]
14599c9ae: 418bac9818010000 mov ebp, dword ptr [r8 + rbx*4 + 0x118]
14599c9b6: 85ed test ebp, ebp
14599c9b8: 7405 je 0x14599c9bf
14599c9ba: 4989fe mov r14, rdi
14599c9bd: eb61 jmp 0x14599ca20
14599ca20: 4d85db test r11, r11
14599ca23: 0f8487000000 je 0x14599cab0
14599ca29: 4d8d6a50 lea r13, [r10 + 0x50]
14599ca2d: 4531e4 xor r12d, r12d
14599ca30: 4531ff xor r15d, r15d
14599ca33: eb20 jmp 0x14599ca55
14599ca40: 31db xor ebx, ebx
14599ca42: 4901ff add r15, rdi
14599ca45: 4901df add r15, rbx
14599ca48: 4983c402 add r12, 2
14599ca4c: 4983c560 add r13, 0x60
14599ca50: 4c39e6 cmp rsi, r12
14599ca53: 743b je 0x14599ca90
14599ca55: 41396dc0 cmp dword ptr [r13 - 0x40], ebp
14599ca59: 7507 jne 0x14599ca62
14599ca5b: 41807db000 cmp byte ptr [r13 - 0x50], 0
14599ca60: 741b je 0x14599ca7d
14599ca62: 31ff xor edi, edi
14599ca64: 41396df0 cmp dword ptr [r13 - 0x10], ebp
14599ca68: 75d6 jne 0x14599ca40
14599ca6a: 41807de000 cmp byte ptr [r13 - 0x20], 0
14599ca6f: 75cf jne 0x14599ca40
14599ca71: 31db xor ebx, ebx
14599ca73: 41837d0000 cmp dword ptr [r13], 0
14599ca78: 0f95c3 setne bl
14599ca7b: ebc5 jmp 0x14599ca42
14599ca7d: 31ff xor edi, edi
14599ca7f: 41837dd000 cmp dword ptr [r13 - 0x30], 0
14599ca84: 400f95c7 setne dil
14599ca88: 41396df0 cmp dword ptr [r13 - 0x10], ebp
14599ca8c: 75b2 jne 0x14599ca40
14599ca8e: ebda jmp 0x14599ca6a
14599ca90: 41f6c101 test r9b, 1
14599ca94: 0f8486feffff je 0x14599c920
14599ca9a: 4b8d1c64 lea rbx, [r12 + r12*2]
14599ca9e: 48c1e304 shl rbx, 4
14599caa2: 41396c1a10 cmp dword ptr [r10 + rbx + 0x10], ebp
14599caa7: 7528 jne 0x14599cad1
14599caa9: eb1a jmp 0x14599cac5
14599cab0: 4531e4 xor r12d, r12d
14599cab3: 4531ff xor r15d, r15d
14599cab6: 4b8d1c64 lea rbx, [r12 + r12*2]
14599caba: 48c1e304 shl rbx, 4
14599cabe: 41396c1a10 cmp dword ptr [r10 + rbx + 0x10], ebp
14599cac3: 750c jne 0x14599cad1
14599cac5: 4c01d3 add rbx, r10
14599cac8: 803b00 cmp byte ptr [rbx], 0
14599cacb: 0f84de000000 je 0x14599cbaf
14599cad1: 31ff xor edi, edi
14599cad3: 4901ff add r15, rdi
14599cad6: 4d85ff test r15, r15
14599cad9: 0f854afeffff jne 0x14599c929
14599cadf: 4d85db test r11, r11
14599cae2: 0f8493000000 je 0x14599cb7b
14599cae8: 4d8d6a50 lea r13, [r10 + 0x50]
14599caec: 4531e4 xor r12d, r12d
14599caef: 4531ff xor r15d, r15d
14599caf2: eb21 jmp 0x14599cb15
14599cb00: 31db xor ebx, ebx
14599cb02: 4901ff add r15, rdi
14599cb05: 4901df add r15, rbx
14599cb08: 4983c402 add r12, 2
14599cb0c: 4983c560 add r13, 0x60
14599cb10: 4c39e6 cmp rsi, r12
14599cb13: 744b je 0x14599cb60
14599cb15: 41396dc0 cmp dword ptr [r13 - 0x40], ebp
14599cb19: 7525 jne 0x14599cb40
14599cb1b: 49837db000 cmp qword ptr [r13 - 0x50], 0
14599cb20: 741e je 0x14599cb40
14599cb22: 31ff xor edi, edi
14599cb24: 41837dd000 cmp dword ptr [r13 - 0x30], 0
14599cb29: 400f95c7 setne dil
14599cb2d: 41396df0 cmp dword ptr [r13 - 0x10], ebp
14599cb31: 75cd jne 0x14599cb00
14599cb33: eb13 jmp 0x14599cb48
14599cb40: 31ff xor edi, edi
14599cb42: 41396df0 cmp dword ptr [r13 - 0x10], ebp
14599cb46: 75b8 jne 0x14599cb00
14599cb48: 49837de000 cmp qword ptr [r13 - 0x20], 0
14599cb4d: 74b1 je 0x14599cb00
14599cb4f: 31db xor ebx, ebx
14599cb51: 41837d0000 cmp dword ptr [r13], 0
14599cb56: 0f95c3 setne bl
14599cb59: eba7 jmp 0x14599cb02
14599cb60: 41f6c101 test r9b, 1
14599cb64: 0f84bffdffff je 0x14599c929
14599cb6a: 4b8d1c64 lea rbx, [r12 + r12*2]
14599cb6e: 48c1e304 shl rbx, 4
14599cb72: 41396c1a10 cmp dword ptr [r10 + rbx + 0x10], ebp
14599cb77: 752c jne 0x14599cba5
14599cb79: eb15 jmp 0x14599cb90
14599cb7b: 4531e4 xor r12d, r12d
14599cb7e: 4531ff xor r15d, r15d
14599cb81: 4b8d1c64 lea rbx, [r12 + r12*2]
14599cb85: 48c1e304 shl rbx, 4
14599cb89: 41396c1a10 cmp dword ptr [r10 + rbx + 0x10], ebp
14599cb8e: 7515 jne 0x14599cba5
14599cb90: 4c01d3 add rbx, r10
14599cb93: 48833b00 cmp qword ptr [rbx], 0
14599cb97: 740c je 0x14599cba5
14599cb99: 31ff xor edi, edi
14599cb9b: 837b2000 cmp dword ptr [rbx + 0x20], 0
14599cb9f: 400f95c7 setne dil
14599cba3: eb02 jmp 0x14599cba7
14599cba5: 31ff xor edi, edi
14599cba7: 4901ff add r15, rdi
14599cbaa: e97afdffff jmp 0x14599c929
14599cbaf: 31ff xor edi, edi
14599cbb1: 837b2000 cmp dword ptr [rbx + 0x20], 0
14599cbb5: 400f95c7 setne dil
14599cbb9: 4901ff add r15, rdi
14599cbbc: 4d85ff test r15, r15
14599cbbf: 0f8564fdffff jne 0x14599c929
14599cbca: 31c0 xor eax, eax
14599cbcc: 31c9 xor ecx, ecx
14599cbce: 6690 nop
14599cbd0: 4883f903 cmp rcx, 3
14599cbd4: 7778 ja 0x14599cc4e
14599cbd6: 4989cf mov r15, rcx
14599cbd9: 4989c9 mov r9, rcx
14599cbdc: 4909d1 or r9, rdx
14599cbdf: 4983f90f cmp r9, 0xf
14599cbe3: 777a ja 0x14599cc5f
14599cbe5: 498d4f01 lea rcx, [r15 + 1]
14599cbe9: 4383bc881801000000 cmp dword ptr [r8 + r9*4 + 0x118], 0
14599cbf2: 75dc jne 0x14599cbd0
14599cbf4: 4983ff03 cmp r15, 3
14599cbf8: 7454 je 0x14599cc4e
14599cbfa: 4809d1 or rcx, rdx
14599cbfd: 4883f90f cmp rcx, 0xf
14599cc01: 775c ja 0x14599cc5f
14599cc03: 4d8d4f02 lea r9, [r15 + 2]
14599cc07: 4183bc881801000000 cmp dword ptr [r8 + rcx*4 + 0x118], 0
14599cc10: 4c89c9 mov rcx, r9
14599cc13: 75bb jne 0x14599cbd0
14599cc4e: 4883c428 add rsp, 0x28
14599cc52: 5b pop rbx
14599cc53: 5d pop rbp
14599cc54: 5f pop rdi
14599cc55: 5e pop rsi
14599cc56: 415c pop r12
14599cc58: 415d pop r13
14599cc5a: 415e pop r14
14599cc5c: 415f pop r15
14599cc5e: c3 ret
14599cd20: 55 push rbp
1459a8990: 4157 push r15
1459a9240: 56 push rsi
1459a9241: 57 push rdi
1459a9242: 53 push rbx
1459a9243: 4883ec40 sub rsp, 0x40
1459a9247: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
1459a924c: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1459a9251: 4c89cf mov rdi, r9
1459a9254: 4c89c3 mov rbx, r8
1459a9257: 4889d0 mov rax, rdx
1459a925a: 4889ce mov rsi, rcx
1459a925d: f3410f7e30 movq xmm6, qword ptr [r8]
1459a9262: f3410f7e39 movq xmm7, qword ptr [r9]
1459a9267: 660f7ef2 movd edx, xmm6
1459a926b: f30f16c6 movshdup xmm0, xmm6
1459a926f: 660f7ec1 movd ecx, xmm0
1459a9273: 48c1e120 shl rcx, 0x20
1459a9277: 4809ca or rdx, rcx
1459a927a: 66410f7ef8 movd r8d, xmm7
1459a927f: f30f16c7 movshdup xmm0, xmm7
1459a9283: 660f7ec1 movd ecx, xmm0
1459a9287: 48c1e120 shl rcx, 0x20
1459a928b: 4909c8 or r8, rcx
1459a928e: 4889c1 mov rcx, rax
1459a9291: e8faf6ffff call 0x1459a8990
1459a9296: 0f2e05c33f4000 ucomiss xmm0, dword ptr [rip + 0x403fc3]
1459a929d: 7360 jae 0x1459a92ff
1459a929f: 0f28ce movaps xmm1, xmm6
1459a92a2: 0f5ccf subps xmm1, xmm7
1459a92a5: 0f59c9 mulps xmm1, xmm1
1459a92a8: f30f16d1 movshdup xmm2, xmm1
1459a92ac: f30f58d1 addss xmm2, xmm1
1459a92b0: 0f57c9 xorps xmm1, xmm1
1459a92b3: f30f51ca sqrtss xmm1, xmm2
1459a92b7: f30f1015a53f4000 movss xmm2, dword ptr [rip + 0x403fa5]
1459a92bf: f30f5fca maxss xmm1, xmm2
1459a92c3: f30f5ed1 divss xmm2, xmm1
1459a92c7: f30f5cc2 subss xmm0, xmm2
1459a92cb: 0f57c9 xorps xmm1, xmm1
1459a92ce: f30f5fc1 maxss xmm0, xmm1
1459a92d2: 0f5cfe subps xmm7, xmm6
1459a92d5: f30f104b08 movss xmm1, dword ptr [rbx + 8]
1459a92da: f30f105708 movss xmm2, dword ptr [rdi + 8]
1459a92df: f30f5cd1 subss xmm2, xmm1
1459a92e3: f30f59d0 mulss xmm2, xmm0
1459a92e7: f30f58d1 addss xmm2, xmm1
1459a92eb: f30f12c0 movsldup xmm0, xmm0
1459a92ef: 0f59c7 mulps xmm0, xmm7
1459a92f2: 0f58c6 addps xmm0, xmm6
1459a92f5: 0f1306 movlps qword ptr [rsi], xmm0
1459a92f8: f30f115608 movss dword ptr [rsi + 8], xmm2
1459a92fd: eb0c jmp 0x1459a930b
1459a92ff: 8b4708 mov eax, dword ptr [rdi + 8]
1459a9302: 894608 mov dword ptr [rsi + 8], eax
1459a9305: 488b07 mov rax, qword ptr [rdi]
1459a9308: 488906 mov qword ptr [rsi], rax
1459a930b: 4889f0 mov rax, rsi
1459a930e: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1459a9313: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1459a9318: 4883c440 add rsp, 0x40
1459a931c: 5b pop rbx
1459a931d: 5f pop rdi
1459a931e: 5e pop rsi
1459a931f: c3 ret
1459c4900: 4157 push r15
1459c4902: 4156 push r14
1459c4904: 4155 push r13
1459c4906: 4154 push r12
1459c4908: 56 push rsi
1459c4909: 57 push rdi
1459c490a: 53 push rbx
1459c490b: 4883ec20 sub rsp, 0x20
1459c490f: 4c8b6910 mov r13, qword ptr [rcx + 0x10]
1459c4913: 4d85ed test r13, r13
1459c4916: 7430 je 0x1459c4948
1459c4918: 488b5908 mov rbx, qword ptr [rcx + 8]
1459c491c: 4c8b32 mov r14, qword ptr [rdx]
1459c491f: 31ff xor edi, edi
1459c4921: 4889de mov rsi, rbx
1459c4924: 6666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459c4930: 4c39b6f0000000 cmp qword ptr [rsi + 0xf0], r14
1459c4937: 741f je 0x1459c4958
1459c4939: 48ffc7 inc rdi
1459c493c: 4881c6d8010000 add rsi, 0x1d8
1459c4943: 4939fd cmp r13, rdi
1459c4946: 75e8 jne 0x1459c4930
1459c4948: 4883c420 add rsp, 0x20
1459c494c: 5b pop rbx
1459c494d: 5f pop rdi
1459c494e: 5e pop rsi
1459c494f: 415c pop r12
1459c4951: 415d pop r13
1459c4953: 415e pop r14
1459c4955: 415f pop r15
1459c4957: c3 ret
1459c4958: 4989cf mov r15, rcx
1459c495b: 4889f1 mov rcx, rsi
1459c495e: e8bdd7f1ff call 0x1458e2120
1459c4963: 488d4701 lea rax, [rdi + 1]
1459c4967: 4c39e8 cmp rax, r13
1459c496a: 0f83b9000000 jae 0x1459c4a29
1459c4970: 4881c6d8010000 add rsi, 0x1d8
1459c4977: 4989fc mov r12, rdi
1459c497a: 49f7d4 not r12
1459c497d: 4d01ec add r12, r13
1459c4980: 4c89f8 mov rax, r15
1459c4983: eb2a jmp 0x1459c49af
1459c4985: 4869cfd8010000 imul rcx, rdi, 0x1d8
1459c498c: 4801d9 add rcx, rbx
1459c498f: 41b8d8010000 mov r8d, 0x1d8
1459c4995: 4889f2 mov rdx, rsi
1459c4998: e83e5a2400 call 0x145c0a3db
1459c499d: 4c89f8 mov rax, r15
1459c49a0: 48ffc7 inc rdi
1459c49a3: 4881c6d8010000 add rsi, 0x1d8
1459c49aa: 49ffcc dec r12
1459c49ad: 747d je 0x1459c4a2c
1459c49af: 4c39b6f0000000 cmp qword ptr [rsi + 0xf0], r14
1459c49b6: 75cd jne 0x1459c4985
1459c4a29: 4c89f8 mov rax, r15
1459c4a2c: 48897810 mov qword ptr [rax + 0x10], rdi
1459c4a30: e913ffffff jmp 0x1459c4948
1459d4654: 0f57ff xorps xmm7, xmm7
1459d4657: f30f1035018c3d00 movss xmm6, dword ptr [rip + 0x3d8c01]
1459d4670: f2410f104c24a8 movsd xmm1, qword ptr [r12 - 0x58]
1459d4677: f30f1013 movss xmm2, dword ptr [rbx]
1459d467b: 0f28c1 movaps xmm0, xmm1
1459d467e: f30f5cc2 subss xmm0, xmm2
1459d4682: f30f16c9 movshdup xmm1, xmm1
1459d4686: f30f5c4b04 subss xmm1, dword ptr [rbx + 4]
1459d468b: e89f5d2300 call 0x145c0a42f
1459d4690: f3410f100e movss xmm1, dword ptr [r14]
1459d4695: 0f2ec8 ucomiss xmm1, xmm0
1459d4698: 0f8398000000 jae 0x1459d4736
1459d469e: 4d39fc cmp r12, r15
1459d46ab: 4c8927 mov qword ptr [rdi], r12
1459d46ae: 4180bc24d8feffff00 cmp byte ptr [r12 - 0x128], 0
1459d46b7: 75e5 jne 0x1459d469e
1459d46b9: 4983bc2440feffffff cmp qword ptr [r12 - 0x1c0], -1
1459d46c2: 75da jne 0x1459d469e
1459d46c4: 4983bc2480feffffff cmp qword ptr [r12 - 0x180], -1
1459d46cd: 75cf jne 0x1459d469e
1459d46cf: f3410f104424b8 movss xmm0, dword ptr [r12 - 0x48]
1459d46d6: 0f2ef8 ucomiss xmm7, xmm0
1459d46d9: 7395 jae 0x1459d4670
1459d4736: 498bbc2418ffffff mov rdi, qword ptr [r12 - 0xe8]
1459dc0e0: 4157 push r15
1459dc0e2: 4156 push r14
1459dc0e4: 56 push rsi
1459dc0e5: 57 push rdi
1459dc0e6: 53 push rbx
1459dc0e7: 4883ec20 sub rsp, 0x20
1459dc0eb: 488b5a10 mov rbx, qword ptr [rdx + 0x10]
1459dc0ef: 4889d8 mov rax, rbx
1459dc0f2: 48c1e004 shl rax, 4
1459dc0f6: 488d3440 lea rsi, [rax + rax*2]
1459dc0fa: 48b8aaaaaaaaaaaaaa02 movabs rax, 0x2aaaaaaaaaaaaaa
1459dc104: 4839c3 cmp rbx, rax
1459dc107: 760f jbe 0x1459dc118
1459dc109: 31ff xor edi, edi
1459dc10b: 4889f9 mov rcx, rdi
1459dc10e: 4889f2 mov rdx, rsi
1459dc111: e8d5d33c00 call 0x145da94eb
1459dc116: 0f0b ud2
1459dc118: 4885f6 test rsi, rsi
1459dc11b: 0f849b000000 je 0x1459dc1bc
1459dc121: 4989cf mov r15, rcx
1459dc124: 4c8b7208 mov r14, qword ptr [rdx + 8]
1459dc128: e8d36062fa call 0x140002200
1459dc12d: bf08000000 mov edi, 8
1459dc132: ba08000000 mov edx, 8
1459dc137: 4889f1 mov rcx, rsi
1459dc13a: e8816062fa call 0x1400021c0
1459dc13f: 4885c0 test rax, rax
1459dc142: 74c7 je 0x1459dc10b
1459dc144: 4885db test rbx, rbx
1459dc147: 4c89f9 mov rcx, r15
1459dc14a: 7475 je 0x1459dc1c1
1459dc14c: 31d2 xor edx, edx
1459dc14e: 4989d8 mov r8, rbx
1459dc151: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459dc160: 4839d6 cmp rsi, rdx
1459dc163: 745c je 0x1459dc1c1
1459dc165: 458b4e10 mov r9d, dword ptr [r14 + 0x10]
1459dc169: 450fb6562c movzx r10d, byte ptr [r14 + 0x2c]
1459dc16e: f3410f10461c movss xmm0, dword ptr [r14 + 0x1c]
1459dc174: f3410f104e28 movss xmm1, dword ptr [r14 + 0x28]
1459dc17a: 410f1016 movups xmm2, xmmword ptr [r14]
1459dc17e: 0f111410 movups xmmword ptr [rax + rdx], xmm2
1459dc182: 44894c1010 mov dword ptr [rax + rdx + 0x10], r9d
1459dc187: f2410f105614 movsd xmm2, qword ptr [r14 + 0x14]
1459dc18d: f20f11541014 movsd qword ptr [rax + rdx + 0x14], xmm2
1459dc193: f30f1144101c movss dword ptr [rax + rdx + 0x1c], xmm0
1459dc199: 4d8b4e20 mov r9, qword ptr [r14 + 0x20]
1459dc19d: 4983c630 add r14, 0x30
1459dc1a1: 4c894c1020 mov qword ptr [rax + rdx + 0x20], r9
1459dc1a6: f30f114c1028 movss dword ptr [rax + rdx + 0x28], xmm1
1459dc1ac: 448854102c mov byte ptr [rax + rdx + 0x2c], r10b
1459dc1b1: 4883c230 add rdx, 0x30
1459dc1b5: 49ffc8 dec r8
1459dc1b8: 75a6 jne 0x1459dc160
1459dc1ba: eb05 jmp 0x1459dc1c1
1459dc1bc: b808000000 mov eax, 8
1459dc1c1: 488919 mov qword ptr [rcx], rbx
1459dc1c4: 48894108 mov qword ptr [rcx + 8], rax
1459dc1c8: 48895910 mov qword ptr [rcx + 0x10], rbx
1459dc1cc: 4889c8 mov rax, rcx
1459dc1cf: 4883c420 add rsp, 0x20
1459dc1d3: 5b pop rbx
1459dc1d4: 5f pop rdi
1459dc1d5: 5e pop rsi
1459dc1d6: 415e pop r14
1459dc1d8: 415f pop r15
1459dc1da: c3 ret
145c0a3db: ff254ffe1900 jmp qword ptr [rip + 0x19fe4f]
145c0a411: ff2589ff1900 jmp qword ptr [rip + 0x19ff89]
145c0a417: ff257bff1900 jmp qword ptr [rip + 0x19ff7b]
145c0a42f: ff2543ff1900 jmp qword ptr [rip + 0x19ff43]
145c0a447: ff250bff1900 jmp qword ptr [rip + 0x19ff0b]
145c0a44d: ff25fdfe1900 jmp qword ptr [rip + 0x19fefd]
