1458c2c32: 8b4550 mov eax, dword ptr [rbp + 0x50]
1458c2c35: 488b4dd8 mov rcx, qword ptr [rbp - 0x28]
1458c2c39: 890411 mov dword ptr [rcx + rdx], eax
1458c2c3c: 4883c204 add rdx, 4
1458c2c40: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c2c44: 0f1045d0 movups xmm0, xmmword ptr [rbp - 0x30]
1458c2c48: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c2c4c: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2c50: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c2c54: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2c58: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c2c5c: 488b5dc0 mov rbx, qword ptr [rbp - 0x40]
1458c2c60: 483b5db0 cmp rbx, qword ptr [rbp - 0x50]
1458c2c64: 750a jne 0x1458c2c70
1458c2c66: 488d4db0 lea rcx, [rbp - 0x50]
1458c2c6a: e841654d00 call 0x145d991b0
1458c2c6f: 90 nop
1458c2c70: 488b45b8 mov rax, qword ptr [rbp - 0x48]
1458c2c74: c6041800 mov byte ptr [rax + rbx], 0
1458c2c78: 48ffc3 inc rbx
1458c2c7b: 48895dc0 mov qword ptr [rbp - 0x40], rbx
1458c2c7f: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c2c83: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c2c87: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c2c8b: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c2c8f: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c2c93: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c2c97: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c2c9b: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c2c9f: 4829d0 sub rax, rdx
1458c2ca2: 4883f803 cmp rax, 3
1458c2ca6: 0f86f8000000 jbe 0x1458c2da4
1458c2cac: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c2cb0: c7041000010000 mov dword ptr [rax + rdx], 0x100
1458c2cb7: 4883c204 add rdx, 4
1458c2cbb: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c2cbf: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c2cc3: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c2cc7: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2ccb: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c2ccf: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2cd3: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c2cd7: 488b55c0 mov rdx, qword ptr [rbp - 0x40]
1458c2cdb: 488b45b0 mov rax, qword ptr [rbp - 0x50]
1458c2cdf: 4829d0 sub rax, rdx
1458c2ce2: 4883f803 cmp rax, 3
1458c2ce6: 0f86e0000000 jbe 0x1458c2dcc
1458c2cec: 8b4558 mov eax, dword ptr [rbp + 0x58]
1458c2cef: 83f801 cmp eax, 1
1458c2cf2: 83d000 adc eax, 0
1458c2cf5: 488b4db8 mov rcx, qword ptr [rbp - 0x48]
1458c2cf9: 890411 mov dword ptr [rcx + rdx], eax
1458c2cfc: 4883c204 add rdx, 4
1458c2d00: 488955c0 mov qword ptr [rbp - 0x40], rdx
1458c2d04: 0f2845b0 movaps xmm0, xmmword ptr [rbp - 0x50]
1458c2d08: 0f2945d0 movaps xmmword ptr [rbp - 0x30], xmm0
1458c2d0c: 488b45c0 mov rax, qword ptr [rbp - 0x40]
1458c2d10: 488945e0 mov qword ptr [rbp - 0x20], rax
1458c2d14: 488b45c8 mov rax, qword ptr [rbp - 0x38]
1458c2d18: 488945e8 mov qword ptr [rbp - 0x18], rax
1458c2d1c: 488b55e0 mov rdx, qword ptr [rbp - 0x20]
1458c2d20: 488b45d0 mov rax, qword ptr [rbp - 0x30]
1458c2d24: 4829d0 sub rax, rdx
1458c2d27: 4883f803 cmp rax, 3
1458c2d2b: 0f86c3000000 jbe 0x1458c2df4
1458c2d31: 488b45d8 mov rax, qword ptr [rbp - 0x28]
1458c2d35: c7041001000000 mov dword ptr [rax + rdx], 1
1458c2d3c: 4883c204 add rdx, 4
1458c2d40: 488955e0 mov qword ptr [rbp - 0x20], rdx
1458c2d44: 0f2845d0 movaps xmm0, xmmword ptr [rbp - 0x30]
1458c2d48: 0f2945b0 movaps xmmword ptr [rbp - 0x50], xmm0
1458c2d4c: 488b45e0 mov rax, qword ptr [rbp - 0x20]
1458c2d50: 488945c0 mov qword ptr [rbp - 0x40], rax
1458c2d54: 488b45e8 mov rax, qword ptr [rbp - 0x18]
1458c2d58: 488945c8 mov qword ptr [rbp - 0x38], rax
1458c2d5c: 488d55b0 lea rdx, [rbp - 0x50]
1458c2d60: 4889f1 mov rcx, rsi
1458c2d63: 4989f8 mov r8, rdi
1458c2d66: e835a0feff call 0x1458acda0
