1459a4b70: 4156 push r14
1459a4b72: 56 push rsi
1459a4b73: 57 push rdi
1459a4b74: 53 push rbx
1459a4b75: 4883ec58 sub rsp, 0x58
1459a4b79: 440f29442440 movaps xmmword ptr [rsp + 0x40], xmm8
1459a4b7f: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
1459a4b84: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1459a4b89: 4889c8 mov rax, rcx
1459a4b8c: f30f104120 movss xmm0, dword ptr [rcx + 0x20]
1459a4b91: f30f1025df774000 movss xmm4, dword ptr [rip + 0x4077df]
1459a4b99: f30f58e1 addss xmm4, xmm1
1459a4b9d: f30f5ce0 subss xmm4, xmm0
1459a4ba1: f3480f2cd4 cvttss2si rdx, xmm4
1459a4ba6: 4989d0 mov r8, rdx
1459a4ba9: 49c1f83f sar r8, 0x3f
1459a4bad: f30f10359bcd4000 movss xmm6, dword ptr [rip + 0x40cd9b]
1459a4bb5: 0f28dc movaps xmm3, xmm4
1459a4bb8: f30f5cde subss xmm3, xmm6
1459a4bbc: f3480f2ccb cvttss2si rcx, xmm3
1459a4bc1: 4c21c1 and rcx, r8
1459a4bc4: 4809d1 or rcx, rdx
1459a4bc7: 31d2 xor edx, edx
1459a4bc9: 0f57ed xorps xmm5, xmm5
1459a4bcc: 0f2ee5 ucomiss xmm4, xmm5
1459a4bcf: 480f42ca cmovb rcx, rdx
1459a4bd3: f30f103d79cd4000 movss xmm7, dword ptr [rip + 0x40cd79]
1459a4bdb: 0f2ee7 ucomiss xmm4, xmm7
1459a4bde: 49c7c1ffffffff mov r9, 0xffffffffffffffff
1459a4be5: 490f47c9 cmova rcx, r9
1459a4be9: 0f28d9 movaps xmm3, xmm1
1459a4bec: f30f58dd addss xmm3, xmm5
1459a4bf0: f30f5cd8 subss xmm3, xmm0
1459a4bf4: f34c0f2cd3 cvttss2si r10, xmm3
1459a4bf9: 4d89d3 mov r11, r10
1459a4bfc: 49c1fb3f sar r11, 0x3f
1459a4c00: 440f28c3 movaps xmm8, xmm3
1459a4c04: f3440f5cc6 subss xmm8, xmm6
1459a4c09: f34d0f2cc0 cvttss2si r8, xmm8
1459a4c0e: 4d21d8 and r8, r11
1459a4c11: 4d09d0 or r8, r10
1459a4c14: 0f2edd ucomiss xmm3, xmm5
1459a4c17: 4c0f42c2 cmovb r8, rdx
1459a4c1b: 0f2edf ucomiss xmm3, xmm7
1459a4c1e: 4d0f47c1 cmova r8, r9
1459a4c22: f30f580d46364000 addss xmm1, dword ptr [rip + 0x403646]
1459a4c2a: f30f5cc8 subss xmm1, xmm0
1459a4c2e: f34c0f2cd1 cvttss2si r10, xmm1
1459a4c33: 4c89d6 mov rsi, r10
1459a4c36: 48c1fe3f sar rsi, 0x3f
1459a4c3a: 0f28c1 movaps xmm0, xmm1
1459a4c3d: f30f5cc6 subss xmm0, xmm6
1459a4c41: f34c0f2cd8 cvttss2si r11, xmm0
1459a4c46: 4921f3 and r11, rsi
1459a4c49: 4d09d3 or r11, r10
1459a4c4c: 0f2ecd ucomiss xmm1, xmm5
1459a4c4f: 4c0f42da cmovb r11, rdx
1459a4c53: 0f2ecf ucomiss xmm1, xmm7
1459a4c56: 4d0f47d9 cmova r11, r9
1459a4c5a: f30f104024 movss xmm0, dword ptr [rax + 0x24]
1459a4c5f: 0f2eec ucomiss xmm5, xmm4
1459a4c62: 760d jbe 0x1459a4c71
1459a4c64: f30f58150c774000 addss xmm2, dword ptr [rip + 0x40770c]
1459a4c6c: 0f2ec2 ucomiss xmm0, xmm2
1459a4c6f: eb6c jmp 0x1459a4cdd
1459a4c71: 4c8b4818 mov r9, qword ptr [rax + 0x18]
1459a4c75: f30f1025fb764000 movss xmm4, dword ptr [rip + 0x4076fb]
1459a4c7d: f30f58e2 addss xmm4, xmm2
1459a4c81: 4c39c9 cmp rcx, r9
1459a4c84: 7354 jae 0x1459a4cda
1459a4c86: f30f5ce0 subss xmm4, xmm0
1459a4c8a: f3480f2cd4 cvttss2si rdx, xmm4
1459a4c8f: 4989d2 mov r10, rdx
1459a4c92: 49c1fa3f sar r10, 0x3f
1459a4c96: 0f28ec movaps xmm5, xmm4
1459a4c99: f30f5c2dafcc4000 subss xmm5, dword ptr [rip + 0x40ccaf]
1459a4ca1: f3480f2cf5 cvttss2si rsi, xmm5
1459a4ca6: 4c21d6 and rsi, r10
1459a4ca9: 4809d6 or rsi, rdx
1459a4cac: 31d2 xor edx, edx
1459a4cae: 0f57ed xorps xmm5, xmm5
1459a4cb1: 0f2ee5 ucomiss xmm4, xmm5
1459a4cb4: 480f43d6 cmovae rdx, rsi
1459a4cb8: 0f2e2595cc4000 ucomiss xmm4, dword ptr [rip + 0x40cc95]
1459a4cbf: 49c7c2ffffffff mov r10, 0xffffffffffffffff
1459a4cc6: 4c0f46d2 cmovbe r10, rdx
1459a4cca: 488b5010 mov rdx, qword ptr [rax + 0x10]
1459a4cce: 0f2eeb ucomiss xmm5, xmm3
1459a4cd1: 7626 jbe 0x1459a4cf9
1459a4cd3: 0f2eec ucomiss xmm5, xmm4
1459a4cd6: 7705 ja 0x1459a4cdd
1459a4cd8: eb42 jmp 0x1459a4d1c
1459a4cda: 0f2ec4 ucomiss xmm0, xmm4
1459a4cdd: 31c0 xor eax, eax
1459a4cdf: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1459a4ce4: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1459a4ce9: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
1459a4cef: 4883c458 add rsp, 0x58
1459a4cf3: 5b pop rbx
1459a4cf4: 5f pop rdi
1459a4cf5: 5e pop rsi
1459a4cf6: 415e pop r14
1459a4cf8: c3 ret
1459a4cf9: 4d39c8 cmp r8, r9
1459a4cfc: 7316 jae 0x1459a4d14
1459a4cfe: 488b7008 mov rsi, qword ptr [rax + 8]
1459a4d02: 0f57db xorps xmm3, xmm3
1459a4d05: 0f2ed9 ucomiss xmm3, xmm1
1459a4d08: 7628 jbe 0x1459a4d32
1459a4d0a: 0f2edc ucomiss xmm3, xmm4
1459a4d0d: 77ce ja 0x1459a4cdd
1459a4d0f: e9d7010000 jmp 0x1459a4eeb
1459a4d14: 0f57c0 xorps xmm0, xmm0
1459a4d17: 0f2ec4 ucomiss xmm0, xmm4
1459a4d1a: 77c1 ja 0x1459a4cdd
1459a4d1c: 4d39ca cmp r10, r9
1459a4d1f: 73bc jae 0x1459a4cdd
1459a4d21: 4d0fafca imul r9, r10
1459a4d25: 4c01c9 add rcx, r9
1459a4d28: 4839d1 cmp rcx, rdx
1459a4d2b: 72b0 jb 0x1459a4cdd
1459a4d2d: e9e9010000 jmp 0x1459a4f1b
1459a4d32: 4d39cb cmp r11, r9
1459a4d35: 0f83a4010000 jae 0x1459a4edf
1459a4d3b: 0f57c9 xorps xmm1, xmm1
1459a4d3e: 0f2ecc ucomiss xmm1, xmm4
1459a4d41: 779a ja 0x1459a4cdd
1459a4d43: 4d39ca cmp r10, r9
1459a4d46: 7395 jae 0x1459a4cdd
1459a4d48: 4d0fafd1 imul r10, r9
1459a4d4c: 498d040a lea rax, [r10 + rcx]
1459a4d50: 4839d0 cmp rax, rdx
1459a4d53: 0f83d0010000 jae 0x1459a4f29
1459a4d59: 803c0601 cmp byte ptr [rsi + rax], 1
1459a4d5d: 0f857affffff jne 0x1459a4cdd
1459a4d63: 4b8d0402 lea rax, [r10 + r8]
1459a4d67: 4839d0 cmp rax, rdx
1459a4d6a: 0f83ca010000 jae 0x1459a4f3a
1459a4d70: 803c0601 cmp byte ptr [rsi + rax], 1
1459a4d74: 0f8563ffffff jne 0x1459a4cdd
1459a4d7a: 4d01da add r10, r11
1459a4d7d: 4939d2 cmp r10, rdx
1459a4d80: 0f83c5010000 jae 0x1459a4f4b
1459a4d86: 42803c1601 cmp byte ptr [rsi + r10], 1
1459a4d8b: 0f854cffffff jne 0x1459a4cdd
1459a4d91: 0f28da movaps xmm3, xmm2
1459a4d94: f30f58d9 addss xmm3, xmm1
1459a4d98: f30f5cd8 subss xmm3, xmm0
1459a4d9c: f3480f2cc3 cvttss2si rax, xmm3
1459a4da1: 4989c2 mov r10, rax
1459a4da4: 0f28e3 movaps xmm4, xmm3
1459a4da7: f30f5c25a1cb4000 subss xmm4, dword ptr [rip + 0x40cba1]
1459a4daf: f3480f2cfc cvttss2si rdi, xmm4
1459a4db4: 49c1fa3f sar r10, 0x3f
1459a4db8: 4c21d7 and rdi, r10
1459a4dbb: 4809c7 or rdi, rax
1459a4dbe: 31c0 xor eax, eax
1459a4dc0: 0f2ed9 ucomiss xmm3, xmm1
1459a4dc3: 480f43c7 cmovae rax, rdi
1459a4dc7: 0f2e1d86cb4000 ucomiss xmm3, dword ptr [rip + 0x40cb86]
1459a4dce: 49c7c2ffffffff mov r10, 0xffffffffffffffff
1459a4dd5: 4c0f46d0 cmovbe r10, rax
1459a4dd9: 0f2ecb ucomiss xmm1, xmm3
1459a4ddc: 0f87fbfeffff ja 0x1459a4cdd
1459a4de2: 4d39ca cmp r10, r9
1459a4de5: 0f83f2feffff jae 0x1459a4cdd
1459a4deb: 4d0fafd1 imul r10, r9
1459a4def: 498d040a lea rax, [r10 + rcx]
1459a4df3: 4839d0 cmp rax, rdx
1459a4df6: 0f832d010000 jae 0x1459a4f29
1459a4dfc: 803c0601 cmp byte ptr [rsi + rax], 1
1459a4e00: 0f85d7feffff jne 0x1459a4cdd
1459a4e06: 4b8d0402 lea rax, [r10 + r8]
1459a4e0a: 4839d0 cmp rax, rdx
1459a4e0d: 0f8316010000 jae 0x1459a4f29
1459a4e13: 803c0601 cmp byte ptr [rsi + rax], 1
1459a4e17: 0f85c0feffff jne 0x1459a4cdd
1459a4e1d: 4d01da add r10, r11
1459a4e20: 4939d2 cmp r10, rdx
1459a4e23: 0f8322010000 jae 0x1459a4f4b
1459a4e29: 42803c1600 cmp byte ptr [rsi + r10], 0
1459a4e2e: 0f84a9feffff je 0x1459a4cdd
1459a4e34: f30f581534344000 addss xmm2, dword ptr [rip + 0x403434]
1459a4e3c: f30f5cd0 subss xmm2, xmm0
1459a4e40: 0f57c0 xorps xmm0, xmm0
1459a4e43: 0f2ec2 ucomiss xmm0, xmm2
1459a4e46: 0f97c3 seta bl
1459a4e49: f3480f2cc2 cvttss2si rax, xmm2
1459a4e4e: 4989c2 mov r10, rax
1459a4e51: 0f28ca movaps xmm1, xmm2
1459a4e54: f30f5c0df4ca4000 subss xmm1, dword ptr [rip + 0x40caf4]
1459a4e5c: 49c1fa3f sar r10, 0x3f
1459a4e60: f3480f2cf9 cvttss2si rdi, xmm1
1459a4e65: 4c21d7 and rdi, r10
1459a4e68: 4809c7 or rdi, rax
1459a4e6b: 31c0 xor eax, eax
1459a4e6d: 0f2ed0 ucomiss xmm2, xmm0
1459a4e70: 41be00000000 mov r14d, 0
1459a4e76: 4c0f43f7 cmovae r14, rdi
1459a4e7a: 0f2e15d3ca4000 ucomiss xmm2, dword ptr [rip + 0x40cad3]
1459a4e81: 49c7c2ffffffff mov r10, 0xffffffffffffffff
1459a4e88: 4d0f46d6 cmovbe r10, r14
1459a4e8c: 4d39ca cmp r10, r9
1459a4e8f: 400f93c7 setae dil
1459a4e93: 4008df or dil, bl
1459a4e96: 0f8543feffff jne 0x1459a4cdf
1459a4e9c: 4d0fafca imul r9, r10
1459a4ea0: 4c01c9 add rcx, r9
1459a4ea3: 4839d1 cmp rcx, rdx
1459a4ea6: 7373 jae 0x1459a4f1b
1459a4ea8: 803c0e01 cmp byte ptr [rsi + rcx], 1
1459a4eac: 0f852bfeffff jne 0x1459a4cdd
1459a4eb2: 4d01c8 add r8, r9
1459a4eb5: 4939d0 cmp r8, rdx
1459a4eb8: 0f839e000000 jae 0x1459a4f5c
1459a4ebe: 42803c0601 cmp byte ptr [rsi + r8], 1
1459a4ec3: 0f8514feffff jne 0x1459a4cdd
1459a4ec9: 4d01d9 add r9, r11
1459a4ecc: 4939d1 cmp r9, rdx
1459a4ecf: 0f8398000000 jae 0x1459a4f6d
1459a4ed5: 420fb6040e movzx eax, byte ptr [rsi + r9]
1459a4eda: e900feffff jmp 0x1459a4cdf
1459a4edf: 0f57c0 xorps xmm0, xmm0
1459a4ee2: 0f2ec4 ucomiss xmm0, xmm4
1459a4ee5: 0f87f2fdffff ja 0x1459a4cdd
1459a4eeb: 4d39ca cmp r10, r9
1459a4eee: 0f83e9fdffff jae 0x1459a4cdd
1459a4ef4: 4d0fafca imul r9, r10
1459a4ef8: 4c01c9 add rcx, r9
1459a4efb: 4839d1 cmp rcx, rdx
1459a4efe: 731b jae 0x1459a4f1b
1459a4f00: 31c0 xor eax, eax
1459a4f02: 803c0e01 cmp byte ptr [rsi + rcx], 1
1459a4f06: 0f85d3fdffff jne 0x1459a4cdf
1459a4f0c: 4d01c1 add r9, r8
1459a4f0f: 4c89c9 mov rcx, r9
1459a4f12: 4939d1 cmp r9, rdx
1459a4f15: 0f82c4fdffff jb 0x1459a4cdf
1459a4f1b: 4c8d0586e38901 lea r8, [rip + 0x189e386]
1459a4f22: e81cf73f00 call 0x145da4643
1459a4f27: 0f0b ud2
1459a4f29: 4889c1 mov rcx, rax
1459a4f2c: 4c8d0575e38901 lea r8, [rip + 0x189e375]
1459a4f33: e80bf73f00 call 0x145da4643
1459a4f38: 0f0b ud2
1459a4f3a: 4889c1 mov rcx, rax
1459a4f3d: 4c8d0564e38901 lea r8, [rip + 0x189e364]
1459a4f44: e8faf63f00 call 0x145da4643
1459a4f49: 0f0b ud2
1459a4f4b: 4c8d0556e38901 lea r8, [rip + 0x189e356]
1459a4f52: 4c89d1 mov rcx, r10
1459a4f55: e8e9f63f00 call 0x145da4643
1459a4f5a: 0f0b ud2
1459a4f5c: 4c89c1 mov rcx, r8
1459a4f5f: 4c8d0542e38901 lea r8, [rip + 0x189e342]
1459a4f66: e8d8f63f00 call 0x145da4643
1459a4f6b: 0f0b ud2
1459a4f6d: 4c8d0534e38901 lea r8, [rip + 0x189e334]
1459a4f74: 4c89c9 mov rcx, r9
1459a4f77: e8c7f63f00 call 0x145da4643
1459a4f7c: 0f0b ud2
