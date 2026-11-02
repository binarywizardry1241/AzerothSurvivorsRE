0x14584a9b0: push rbp
0x14584a9b1: push r15
0x14584a9b3: push r14
0x14584a9b5: push r12
0x14584a9b7: push rsi
0x14584a9b8: push rdi
0x14584a9b9: push rbx
0x14584a9ba: sub rsp, 0x130
0x14584a9c1: lea rbp, [rsp + 0x80]
0x14584a9c9: movapd xmmword ptr [rbp + 0xa0], xmm9
0x14584a9d2: movaps xmmword ptr [rbp + 0x90], xmm8
0x14584a9da: movapd xmmword ptr [rbp + 0x80], xmm7
0x14584a9e2: movaps xmmword ptr [rbp + 0x70], xmm6
0x14584a9e6: mov qword ptr [rbp + 0x68], 0xfffffffffffffffe
0x14584a9ee: mov ebx, r8d
0x14584a9f1: mov r15, rdx
0x14584a9f4: mov rsi, rcx
0x14584a9f7: mov rdx, qword ptr [rbp + 0x110]
0x14584a9fe: mov rcx, r9
0x14584aa01: call 0x1458095e0
0x14584aa06: cmp byte ptr [r15 + 0x88], bl
0x14584aa0d: jne 0x14584aa71
0x14584aa0f: imul rdi, rax, 0xf0
0x14584aa16: lea r14, [rip + 0x14762eb]
0x14584aa1d: add rdi, r14
0x14584aa20: mov r12, qword ptr [r15 + 8]
0x14584aa24: mov rdx, qword ptr [r15 + 0x10]
0x14584aa28: mov rcx, r12
0x14584aa2b: call 0x1458095e0
0x14584aa30: imul rax, rax, 0xf0
0x14584aa37: mov r8, qword ptr [rax + r14 + 0x10]
0x14584aa3c: cmp r8, qword ptr [rdi + 0x10]
0x14584aa40: jne 0x14584aa71
0x14584aa42: add r14, rax
0x14584aa45: mov rdx, qword ptr [rdi + 8]
0x14584aa49: mov rcx, qword ptr [r14 + 8]
0x14584aa4d: call 0x145d14601
0x14584aa52: test eax, eax
0x14584aa54: jne 0x14584aa71
0x14584aa56: movd xmm8, dword ptr [r15 + 0x60]
0x14584aa5c: movd eax, xmm8
0x14584aa61: and eax, 0x7fffffff
0x14584aa66: cmp eax, 0x7f7fffff
0x14584aa6b: jle 0x14584ab17
0x14584aa71: mov qword ptr [rsi], 0xffffffffffffffff
0x14584aa78: mov rdx, qword ptr [r15]
0x14584aa7b: test rdx, rdx
0x14584aa7e: je 0x14584aa8f
0x14584aa80: mov rcx, qword ptr [r15 + 8]
0x14584aa84: mov r8d, 1
0x14584aa8a: call 0x1400021d0
0x14584aa8f: mov rdx, qword ptr [r15 + 0x18]
0x14584aa93: test rdx, rdx
0x14584aa96: je 0x14584aaab
0x14584aa98: mov rcx, qword ptr [r15 + 0x20]
0x14584aa9c: shl rdx, 3
0x14584aaa0: mov r8d, 4
0x14584aaa6: call 0x1400021d0
0x14584aaab: mov rax, qword ptr [r15 + 0x30]
0x14584aaaf: test rax, rax
0x14584aab2: je 0x14584aacb
0x14584aab4: mov rcx, qword ptr [r15 + 0x38]
0x14584aab8: shl rax, 2
0x14584aabc: lea rdx, [rax + rax*2]
0x14584aac0: mov r8d, 4
0x14584aac6: call 0x1400021d0
0x14584aacb: mov rdx, qword ptr [r15 + 0x48]
0x14584aacf: test rdx, rdx
0x14584aad2: je 0x14584aae7
0x14584aad4: mov rcx, qword ptr [r15 + 0x50]
0x14584aad8: shl rdx, 2
0x14584aadc: mov r8d, 4
0x14584aae2: call 0x1400021d0
0x14584aae7: mov rax, rsi
0x14584aaea: movaps xmm6, xmmword ptr [rbp + 0x70]
0x14584aaee: movaps xmm7, xmmword ptr [rbp + 0x80]
0x14584aaf5: movaps xmm8, xmmword ptr [rbp + 0x90]
0x14584aafd: movaps xmm9, xmmword ptr [rbp + 0xa0]
0x14584ab05: add rsp, 0x130
0x14584ab0c: pop rbx
0x14584ab0d: pop rdi
0x14584ab0e: pop rsi
0x14584ab0f: pop r12
0x14584ab11: pop r14
0x14584ab13: pop r15
0x14584ab15: pop rbp
0x14584ab16: ret
0x14584ab17: movsd xmm6, qword ptr [rbp + 0x118]
0x14584ab1f: addsd xmm6, qword ptr [rip + 0x1419bd9]
0x14584ab27: xorpd xmm9, xmm9
0x14584ab2c: ucomisd xmm6, xmm9
0x14584ab31: mov qword ptr [rbp + 0x58], r15
0x14584ab35: mov qword ptr [rbp + 0x30], r12
0x14584ab39: jb 0x14584aec2
0x14584ab3f: mov r14, qword ptr [rdi + 0x88]
0x14584ab46: cmp r14, -0x1a0
0x14584ab4d: je 0x14584ab66
0x14584ab4f: movss xmm0, dword ptr [r14 + 0x1f0]
0x14584ab58: cvtss2sd xmm7, xmm0
0x14584ab5c: mulsd xmm7, qword ptr [rip + 0x7739cc]
0x14584ab64: jmp 0x14584ab6e
0x14584ab66: movsd xmm7, qword ptr [rip + 0x1481af2]
0x14584ab6e: call 0x140002200
0x14584ab73: mov ecx, 0x14
0x14584ab78: mov edx, 4
0x14584ab7d: call 0x1400021c0
0x14584ab82: test rax, rax
0x14584ab85: je 0x14584af0c
0x14584ab8b: xorps xmm0, xmm0
0x14584ab8e: cvtss2sd xmm0, xmm8
0x14584ab93: maxsd xmm9, xmm0
0x14584ab98: minsd xmm6, xmm9
0x14584ab9d: movsd xmm2, qword ptr [rip + 0x1481ac3]
0x14584aba5: mulsd xmm2, xmm6
0x14584aba9: addsd xmm2, qword ptr [rip + 0x6705bf]
0x14584abb1: movsd xmm0, qword ptr [rip + 0x69909f]
0x14584abb9: minsd xmm2, xmm0
0x14584abbd: xorpd xmm1, xmm1
0x14584abc1: xorpd xmm3, xmm3
0x14584abc5: maxsd xmm3, xmm2
0x14584abc9: movapd xmm2, xmm0
0x14584abcd: minsd xmm2, xmm3
0x14584abd1: cvttsd2si rdi, xmm2
0x14584abd6: add edi, 5
0x14584abd9: mov ecx, dword ptr [r14 + 0x40]
0x14584abdd: mov dword ptr [rax], ecx
0x14584abdf: mov ecx, dword ptr [r14 + 0xa8]
0x14584abe6: mov dword ptr [rax + 4], ecx
0x14584abe9: mov ecx, dword ptr [r14 + 0x110]
0x14584abf0: mov dword ptr [rax + 8], ecx
0x14584abf3: mov ecx, dword ptr [r14 + 0x178]
0x14584abfa: mov dword ptr [rax + 0xc], ecx
0x14584abfd: mov ecx, dword ptr [r14 + 0x1e0]
0x14584ac04: mov dword ptr [rax + 0x10], ecx
0x14584ac07: mov qword ptr [rbp + 0x38], 5
0x14584ac0f: mov qword ptr [rbp + 0x40], rax
0x14584ac13: mov qword ptr [rbp + 0x48], 5
0x14584ac1b: lea rax, [rbp + 0x38]
0x14584ac1f: mov qword ptr [rbp + 0x50], rax
0x14584ac23: mov ecx, dword ptr [r15 + 0x64]
0x14584ac27: cmp ecx, 0x63
0x14584ac2a: mov eax, 0x63
0x14584ac2f: cmovb eax, ecx
0x14584ac32: movsd xmm2, qword ptr [rip + 0x1419ac6]
0x14584ac3a: addsd xmm2, xmm6
0x14584ac3e: ucomisd xmm2, xmm7
0x14584ac42: movsd xmm2, qword ptr [rip + 0x8fe79e]
0x14584ac4a: mulsd xmm2, xmm6
0x14584ac4e: addsd xmm2, qword ptr [rip + 0x1434aa2]
0x14584ac56: setae cl
0x14584ac59: minsd xmm2, xmm0
0x14584ac5d: xorpd xmm3, xmm3
0x14584ac61: maxsd xmm3, xmm2
0x14584ac65: movapd xmm2, xmm0
0x14584ac69: minsd xmm2, xmm3
0x14584ac6d: cvttsd2si rdx, xmm2
0x14584ac72: movsd xmm2, qword ptr [rip + 0x89d7f6]
0x14584ac7a: mulsd xmm2, xmm6
0x14584ac7e: addsd xmm2, qword ptr [rip + 0x698ffa]
0x14584ac86: minsd xmm2, xmm0
0x14584ac8a: xorpd xmm3, xmm3
0x14584ac8e: maxsd xmm3, xmm2
0x14584ac92: movapd xmm2, xmm0
0x14584ac96: minsd xmm2, xmm3
0x14584ac9a: cvttsd2si r8, xmm2
0x14584ac9f: movsd xmm2, qword ptr [rip + 0x748e59]
0x14584aca7: mulsd xmm2, xmm6
0x14584acab: addsd xmm2, qword ptr [rip + 0x6704bd]
0x14584acb3: minsd xmm2, xmm0
0x14584acb7: xorpd xmm3, xmm3
0x14584acbb: maxsd xmm3, xmm2
0x14584acbf: movapd xmm2, xmm0
0x14584acc3: minsd xmm2, xmm3
0x14584acc7: cvttsd2si r9, xmm2
0x14584accc: movdqu xmm4, xmmword ptr [r15 + 0x68]
0x14584acd2: movd xmm3, r8d
0x14584acd7: movd xmm2, edx
0x14584acdb: punpckldq xmm2, xmm3
0x14584acdf: movd xmm3, r9d
0x14584ace4: movd xmm5, edi
0x14584ace8: punpckldq xmm3, xmm5
0x14584acec: punpcklqdq xmm2, xmm3
0x14584acf0: movdqa xmm3, xmmword ptr [rip + 0x695728]
0x14584acf8: movdqa xmm5, xmm2
0x14584acfc: pxor xmm5, xmm3
0x14584ad00: pxor xmm3, xmm4
0x14584ad04: pcmpgtd xmm3, xmm5
0x14584ad08: pand xmm2, xmm3
0x14584ad0c: pandn xmm3, xmm4
0x14584ad10: mov edx, dword ptr [r15 + 0x78]
0x14584ad14: movsd xmm4, qword ptr [rip + 0x773424]
0x14584ad1c: mulsd xmm4, xmm6
0x14584ad20: addsd xmm4, qword ptr [rip + 0x785bf0]
0x14584ad28: minsd xmm4, xmm0
0x14584ad2c: maxsd xmm1, xmm4
0x14584ad30: minsd xmm0, xmm1
0x14584ad34: cvttsd2si r8, xmm0
0x14584ad39: cmp r8d, edx
0x14584ad3c: cmovb edx, r8d
0x14584ad40: movd xmm4, dword ptr [r15 + 0x7c]
0x14584ad46: movd r8d, xmm4
0x14584ad4b: and r8d, 0x7fffffff
0x14584ad52: movss xmm0, dword ptr [rip + 0x695156]
0x14584ad5a: movaps xmm1, xmm0
0x14584ad5d: cmp r8d, 0x7f7fffff
0x14584ad64: jg 0x14584ad7e
0x14584ad66: movss xmm5, dword ptr [rip + 0x695142]
0x14584ad6e: maxss xmm5, xmm4
0x14584ad72: movss xmm1, dword ptr [rip + 0x695486]
0x14584ad7a: minss xmm1, xmm5
0x14584ad7e: xorps xmm4, xmm4
0x14584ad81: cvtsd2ss xmm4, xmm6
0x14584ad85: and cl, byte ptr [r15 + 0x85]
0x14584ad8c: por xmm2, xmm3
0x14584ad90: movd xmm3, dword ptr [r15 + 0x80]
0x14584ad99: movd r8d, xmm3
0x14584ad9e: and r8d, 0x7fffffff
0x14584ada5: cmp r8d, 0x7f7fffff
0x14584adac: jg 0x14584adc6
0x14584adae: movss xmm5, dword ptr [rip + 0x6950fa]
0x14584adb6: maxss xmm5, xmm3
0x14584adba: movss xmm0, dword ptr [rip + 0x6954ee]
0x14584adc2: minss xmm0, xmm5
0x14584adc6: movss dword ptr [rbp], xmm4
0x14584adcb: movzx r8d, byte ptr [r15 + 0x87]
0x14584add3: mov byte ptr [rbp + 0x27], r8b
0x14584add7: movzx r8d, byte ptr [r15 + 0x84]
0x14584addf: mov byte ptr [rbp + 0x24], r8b
0x14584ade3: mov dword ptr [rbp + 4], eax
0x14584ade6: mov byte ptr [rbp + 0x25], cl
0x14584ade9: movdqu xmmword ptr [rbp + 8], xmm2
0x14584adee: mov dword ptr [rbp + 0x18], edx
0x14584adf1: movss dword ptr [rbp + 0x1c], xmm1
0x14584adf6: movss dword ptr [rbp + 0x20], xmm0
0x14584adfb: movzx eax, byte ptr [r15 + 0x86]
0x14584ae03: mov byte ptr [rbp + 0x26], al
0x14584ae06: mov byte ptr [rbp + 0x28], bl
0x14584ae09: mov rax, qword ptr [r15 + 0x10]
0x14584ae0d: mov qword ptr [rbp - 0x50], rax
0x14584ae11: movups xmm0, xmmword ptr [r15]
0x14584ae15: movaps xmmword ptr [rbp - 0x60], xmm0
0x14584ae19: lea rcx, [rbp - 0x48]
0x14584ae1d: mov rax, qword ptr [r15 + 0x28]
0x14584ae21: mov qword ptr [rbp - 0x38], rax
0x14584ae25: movups xmm0, xmmword ptr [r15 + 0x18]
0x14584ae2a: movups xmmword ptr [rbp - 0x48], xmm0
0x14584ae2e: movups xmm0, xmmword ptr [r15 + 0x30]
0x14584ae33: movaps xmmword ptr [rbp - 0x30], xmm0
0x14584ae37: mov rax, qword ptr [r15 + 0x40]
0x14584ae3b: mov qword ptr [rbp - 0x20], rax
0x14584ae3f: movups xmm0, xmmword ptr [r15 + 0x48]
0x14584ae44: movups xmmword ptr [rbp - 0x18], xmm0
0x14584ae48: mov rax, qword ptr [r15 + 0x58]
0x14584ae4c: mov qword ptr [rbp - 8], rax
0x14584ae50: lea rdx, [rbp + 0x50]
0x14584ae54: call 0x1459bb9f0
0x14584ae59: nop
0x14584ae5a: lea rcx, [rbp - 0x30]
0x14584ae5e: mov edi, edi
0x14584ae60: cmp qword ptr [rbp - 0x38], rdi
0x14584ae64: jb 0x14584ae6a
0x14584ae66: mov qword ptr [rbp - 0x38], rdi
0x14584ae6a: lea rdx, [rbp + 0x50]
0x14584ae6e: call 0x1459ba540
0x14584ae73: nop
0x14584ae74: lea rcx, [rbp - 0x18]
0x14584ae78: cmp qword ptr [rbp - 0x20], rdi
0x14584ae7c: jb 0x14584ae82
0x14584ae7e: mov qword ptr [rbp - 0x20], rdi
0x14584ae82: lea rdx, [rbp + 0x38]
0x14584ae86: call 0x1459bbd80
0x14584ae8b: nop
0x14584ae8c: mov rax, qword ptr [rbp + 0x48]
0x14584ae90: cmp rax, qword ptr [rbp - 8]
0x14584ae94: ja 0x14584ae9a
0x14584ae96: mov qword ptr [rbp - 8], rax
0x14584ae9a: lea rdx, [rbp - 0x60]
0x14584ae9e: mov r8d, 0x90
0x14584aea4: mov rcx, rsi
0x14584aea7: call 0x145d145fb
0x14584aeac: mov rdx, qword ptr [rbp + 0x38]
0x14584aeb0: test rdx, rdx
0x14584aeb3: je 0x14584aae7
0x14584aeb9: mov rcx, qword ptr [rbp + 0x40]
0x14584aebd: jmp 0x14584aad8
0x14584aec2: mov qword ptr [rbp + 0x50], 0
0x14584aeca: movsd qword ptr [rbp + 0x38], xmm6
0x14584aecf: lea rax, [rbp + 0x50]
0x14584aed3: mov qword ptr [rbp - 0x60], rax
0x14584aed7: lea rax, [rip + 0x4ad642]
0x14584aede: mov qword ptr [rbp - 0x58], rax
0x14584aee2: lea rcx, [rbp + 0x38]
0x14584aee6: mov qword ptr [rbp - 0x50], rcx
0x14584aeea: mov qword ptr [rbp - 0x48], rax
0x14584aeee: mov byte ptr [rbp + 0x67], 0
0x14584aef2: lea rcx, [rip + 0x1481a78]
0x14584aef9: lea r8, [rip + 0x1481af0]
0x14584af00: lea rdx, [rbp - 0x60]
0x14584af04: call 0x145eb7540
0x14584af09: nop
0x14584af0a: jmp 0x14584af20
0x14584af0c: mov byte ptr [rbp + 0x67], 0
0x14584af10: mov ecx, 4
0x14584af15: mov edx, 0x14
0x14584af1a: call 0x145eb6fcb
0x14584af1f: nop
0x14584af20: ud2
