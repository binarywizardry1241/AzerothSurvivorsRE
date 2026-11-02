1459a7b90: 56 push rsi
1459a7b91: 4883ec20 sub rsp, 0x20
1459a7b95: f30f5c5220 subss xmm2, dword ptr [rdx + 0x20]
1459a7b9a: 31c0 xor eax, eax
1459a7b9c: 0f57c0 xorps xmm0, xmm0
1459a7b9f: 0f2ec2 ucomiss xmm0, xmm2
1459a7ba2: 0f87c6000000 ja 0x1459a7c6e
1459a7ba8: f30f5c5a24 subss xmm3, dword ptr [rdx + 0x24]
1459a7bad: 0f2ec3 ucomiss xmm0, xmm3
1459a7bb0: 0f87af000000 ja 0x1459a7c65
1459a7bb6: f30f1005929d4000 movss xmm0, dword ptr [rip + 0x409d92]
1459a7bbe: 0f28ca movaps xmm1, xmm2
1459a7bc1: f30f5cc8 subss xmm1, xmm0
1459a7bc5: f3480f2cc1 cvttss2si rax, xmm1
1459a7bca: f34c0f2cc2 cvttss2si r8, xmm2
1459a7bcf: 4d89c2 mov r10, r8
1459a7bd2: 49c1fa3f sar r10, 0x3f
1459a7bd6: 4921c2 and r10, rax
1459a7bd9: 4d09c2 or r10, r8
1459a7bdc: 31c0 xor eax, eax
1459a7bde: 0f57c9 xorps xmm1, xmm1
1459a7be1: 0f2ed1 ucomiss xmm2, xmm1
1459a7be4: 4c0f42d0 cmovb r10, rax
1459a7be8: f30f1025649d4000 movss xmm4, dword ptr [rip + 0x409d64]
1459a7bf0: 0f2ed4 ucomiss xmm2, xmm4
1459a7bf3: 49c7c0ffffffff mov r8, 0xffffffffffffffff
1459a7bfa: 4d0f47d0 cmova r10, r8
1459a7bfe: 0f28d3 movaps xmm2, xmm3
1459a7c01: f30f5cd0 subss xmm2, xmm0
1459a7c05: f34c0f2cca cvttss2si r9, xmm2
1459a7c0a: f3480f2cf3 cvttss2si rsi, xmm3
1459a7c0f: 4989f3 mov r11, rsi
1459a7c12: 49c1fb3f sar r11, 0x3f
1459a7c16: 4d21cb and r11, r9
1459a7c19: 4909f3 or r11, rsi
1459a7c1c: 0f2ed9 ucomiss xmm3, xmm1
1459a7c1f: 4c0f42d8 cmovb r11, rax
1459a7c23: 0f2edc ucomiss xmm3, xmm4
1459a7c26: 4d0f47d8 cmova r11, r8
1459a7c2a: 4c8b4a18 mov r9, qword ptr [rdx + 0x18]
1459a7c2e: 4d39ca cmp r10, r9
1459a7c31: 0f93c2 setae dl
1459a7c34: 4d39cb cmp r11, r9
1459a7c37: 410f93c0 setae r8b
1459a7c3b: 4108d0 or r8b, dl
1459a7c3e: 7525 jne 0x1459a7c65
1459a7c40: 4d0fafcb imul r9, r11
1459a7c44: 4d01d1 add r9, r10
1459a7c47: 488b5110 mov rdx, qword ptr [rcx + 0x10]
1459a7c4b: 4939d1 cmp r9, rdx
1459a7c4e: 7327 jae 0x1459a7c77
1459a7c50: 488b4108 mov rax, qword ptr [rcx + 8]
1459a7c54: 460fb70448 movzx r8d, word ptr [rax + r9*2]
1459a7c59: 31c0 xor eax, eax
1459a7c5b: 4181f8ffff0000 cmp r8d, 0xffff
1459a7c62: 0f95c0 setne al
1459a7c65: 4489c2 mov edx, r8d
1459a7c68: 4883c420 add rsp, 0x20
1459a7c6c: 5e pop rsi
1459a7c6d: c3 ret
1459a7c6e: 4489c2 mov edx, r8d
1459a7c71: 4883c420 add rsp, 0x20
1459a7c75: 5e pop rsi
1459a7c76: c3 ret
1459a7c77: 4c8d05b2c88901 lea r8, [rip + 0x189c8b2]
1459a7c7e: 4c89c9 mov rcx, r9
1459a7c81: e8bdc93f00 call 0x145da4643
1459a7c86: 0f0b ud2
