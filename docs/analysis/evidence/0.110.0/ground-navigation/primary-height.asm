14589bf40: 56 push rsi
14589bf41: 4883ec40 sub rsp, 0x40
14589bf45: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
14589bf4a: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
14589bf4f: 80b9ac00000000 cmp byte ptr [rcx + 0xac], 0
14589bf56: 7412 je 0x14589bf6a
14589bf58: f30f1081a8000000 movss xmm0, dword ptr [rcx + 0xa8]
14589bf60: b801000000 mov eax, 1
14589bf65: e991010000 jmp 0x14589c0fb
14589bf6a: 48837958ff cmp qword ptr [rcx + 0x58], -1
14589bf6f: 7449 je 0x14589bfba
14589bf71: f20f104178 movsd xmm0, qword ptr [rcx + 0x78]
14589bf76: 0f14ca unpcklps xmm1, xmm2
14589bf79: 0f5cc8 subps xmm1, xmm0
14589bf7c: 0f58c9 addps xmm1, xmm1
14589bf7f: 0f57c0 xorps xmm0, xmm0
14589bf82: 0f28d1 movaps xmm2, xmm1
14589bf85: 0fc2d001 cmpltps xmm2, xmm0
14589bf89: 0f14d2 unpcklps xmm2, xmm2
14589bf8c: 660f50d2 movmskpd edx, xmm2
14589bf90: 31c0 xor eax, eax
14589bf92: 85d2 test edx, edx
14589bf94: 0f8594000000 jne 0x14589c02e
14589bf9a: 488b5170 mov rdx, qword ptr [rcx + 0x70]
14589bf9e: 4885d2 test rdx, rdx
14589bfa1: 0f888c000000 js 0x14589c033
14589bfa7: 0f57c0 xorps xmm0, xmm0
14589bfaa: f3480f2ac2 cvtsi2ss xmm0, rdx
14589bfaf: 0f2ec8 ucomiss xmm1, xmm0
14589bfb2: 0f829c000000 jb 0x14589c054
14589bfb8: eb74 jmp 0x14589c02e
14589bfba: 4889ce mov rsi, rcx
14589bfbd: 0f28f1 movaps xmm6, xmm1
14589bfc0: 0f28fa movaps xmm7, xmm2
14589bfc3: e868e1ffff call 0x14589a130
14589bfc8: a801 test al, 1
14589bfca: 7460 je 0x14589c02c
14589bfcc: b801000000 mov eax, 1
14589bfd1: 4883be80000000ff cmp qword ptr [rsi + 0x80], -1
14589bfd9: 0f841c010000 je 0x14589c0fb
14589bfdf: 4989f0 mov r8, rsi
14589bfe2: f20f1096a0000000 movsd xmm2, qword ptr [rsi + 0xa0]
14589bfea: 0f28ce movaps xmm1, xmm6
14589bfed: 0f14cf unpcklps xmm1, xmm7
14589bff0: 0f5cca subps xmm1, xmm2
14589bff3: 0f58c9 addps xmm1, xmm1
14589bff6: 0f57d2 xorps xmm2, xmm2
14589bff9: 0f28d9 movaps xmm3, xmm1
14589bffc: 0fc2da01 cmpltps xmm3, xmm2
14589c000: 0f14db unpcklps xmm3, xmm3
14589c003: 660f50cb movmskpd ecx, xmm3
14589c007: 85c9 test ecx, ecx
14589c009: 0f85ec000000 jne 0x14589c0fb
14589c00f: 498b9098000000 mov rdx, qword ptr [r8 + 0x98]
14589c016: 4885d2 test rdx, rdx
14589c019: 0f88ec000000 js 0x14589c10b
14589c01f: 0f57db xorps xmm3, xmm3
14589c022: f3480f2ada cvtsi2ss xmm3, rdx
14589c027: e9fb000000 jmp 0x14589c127
14589c02c: 31c0 xor eax, eax
14589c02e: e9c8000000 jmp 0x14589c0fb
14589c033: 4989d0 mov r8, rdx
14589c036: 49d1e8 shr r8, 1
14589c039: 4189d1 mov r9d, edx
14589c03c: 4183e101 and r9d, 1
14589c040: 4d09c1 or r9, r8
14589c043: 0f57c0 xorps xmm0, xmm0
14589c046: f3490f2ac1 cvtsi2ss xmm0, r9
14589c04b: f30f58c0 addss xmm0, xmm0
14589c04f: 0f2ec8 ucomiss xmm1, xmm0
14589c052: 73da jae 0x14589c02e
14589c054: f30f16d1 movshdup xmm2, xmm1
14589c058: 0f2ed0 ucomiss xmm2, xmm0
14589c05b: 0f839a000000 jae 0x14589c0fb
14589c061: f30f1005e7585100 movss xmm0, dword ptr [rip + 0x5158e7]
14589c069: 0f28da movaps xmm3, xmm2
14589c06c: f30f5cd8 subss xmm3, xmm0
14589c070: f3480f2cc3 cvttss2si rax, xmm3
14589c075: f34c0f2cc2 cvttss2si r8, xmm2
14589c07a: 4d89c1 mov r9, r8
14589c07d: 49c1f93f sar r9, 0x3f
14589c081: 4921c1 and r9, rax
14589c084: 4d09c1 or r9, r8
14589c087: 4531c0 xor r8d, r8d
14589c08a: 0f57db xorps xmm3, xmm3
14589c08d: 0f2ed3 ucomiss xmm2, xmm3
14589c090: 4d0f42c8 cmovb r9, r8
14589c094: f30f1025b8585100 movss xmm4, dword ptr [rip + 0x5158b8]
14589c09c: 0f2ed4 ucomiss xmm2, xmm4
14589c09f: 49c7c2ffffffff mov r10, 0xffffffffffffffff
14589c0a6: 4d0f47ca cmova r9, r10
14589c0aa: 490fafd1 imul rdx, r9
14589c0ae: 0f28d1 movaps xmm2, xmm1
14589c0b1: f30f5cd0 subss xmm2, xmm0
14589c0b5: f34c0f2cca cvttss2si r9, xmm2
14589c0ba: f34c0f2cd9 cvttss2si r11, xmm1
14589c0bf: 4c89d8 mov rax, r11
14589c0c2: 48c1f83f sar rax, 0x3f
14589c0c6: 4c21c8 and rax, r9
14589c0c9: 4c09d8 or rax, r11
14589c0cc: 0f2ecb ucomiss xmm1, xmm3
14589c0cf: 490f42c0 cmovb rax, r8
14589c0d3: 0f2ecc ucomiss xmm1, xmm4
14589c0d6: 490f47c2 cmova rax, r10
14589c0da: 4801d0 add rax, rdx
14589c0dd: 488b5168 mov rdx, qword ptr [rcx + 0x68]
14589c0e1: 4839d0 cmp rax, rdx
14589c0e4: 0f83fc000000 jae 0x14589c1e6
14589c0ea: 488b4960 mov rcx, qword ptr [rcx + 0x60]
14589c0ee: f30f100481 movss xmm0, dword ptr [rcx + rax*4]
14589c0f3: 31c0 xor eax, eax
14589c0f5: 0f2ec0 ucomiss xmm0, xmm0
14589c0f8: 0f9bc0 setnp al
14589c0fb: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
14589c100: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
14589c105: 4883c440 add rsp, 0x40
14589c109: 5e pop rsi
14589c10a: c3 ret
14589c10b: 4889d1 mov rcx, rdx
14589c10e: 48d1e9 shr rcx, 1
14589c111: 4189d1 mov r9d, edx
14589c114: 4183e101 and r9d, 1
14589c118: 4909c9 or r9, rcx
14589c11b: 0f57db xorps xmm3, xmm3
14589c11e: f3490f2ad9 cvtsi2ss xmm3, r9
14589c123: f30f58db addss xmm3, xmm3
14589c127: 0f2ecb ucomiss xmm1, xmm3
14589c12a: 73cf jae 0x14589c0fb
14589c12c: f30f16d1 movshdup xmm2, xmm1
14589c130: 0f2ed3 ucomiss xmm2, xmm3
14589c133: 73c6 jae 0x14589c0fb
14589c135: f30f101d13585100 movss xmm3, dword ptr [rip + 0x515813]
14589c13d: 0f28e2 movaps xmm4, xmm2
14589c140: f30f5ce3 subss xmm4, xmm3
14589c144: f3480f2ccc cvttss2si rcx, xmm4
14589c149: f34c0f2cca cvttss2si r9, xmm2
14589c14e: 4d89ca mov r10, r9
14589c151: 49c1fa3f sar r10, 0x3f
14589c155: 4921ca and r10, rcx
14589c158: 4d09ca or r10, r9
14589c15b: 4531c9 xor r9d, r9d
14589c15e: 0f57e4 xorps xmm4, xmm4
14589c161: 0f2ed4 ucomiss xmm2, xmm4
14589c164: 4d0f42d1 cmovb r10, r9
14589c168: f30f102de4575100 movss xmm5, dword ptr [rip + 0x5157e4]
14589c170: 0f2ed5 ucomiss xmm2, xmm5
14589c173: 49c7c3ffffffff mov r11, 0xffffffffffffffff
14589c17a: 4d0f47d3 cmova r10, r11
14589c17e: 490fafd2 imul rdx, r10
14589c182: 0f28d1 movaps xmm2, xmm1
14589c185: f30f5cd3 subss xmm2, xmm3
14589c189: f34c0f2cd2 cvttss2si r10, xmm2
14589c18e: f3480f2cf1 cvttss2si rsi, xmm1
14589c193: 4889f1 mov rcx, rsi
14589c196: 48c1f93f sar rcx, 0x3f
14589c19a: 4c21d1 and rcx, r10
14589c19d: 4809f1 or rcx, rsi
14589c1a0: 0f2ecc ucomiss xmm1, xmm4
14589c1a3: 490f42c9 cmovb rcx, r9
14589c1a7: 0f2ecd ucomiss xmm1, xmm5
14589c1aa: 490f47cb cmova rcx, r11
14589c1ae: 4801d1 add rcx, rdx
14589c1b1: 498b9090000000 mov rdx, qword ptr [r8 + 0x90]
14589c1b8: 4839d1 cmp rcx, rdx
14589c1bb: 733a jae 0x14589c1f7
14589c1bd: 498b9088000000 mov rdx, qword ptr [r8 + 0x88]
14589c1c4: f30f10148a movss xmm2, dword ptr [rdx + rcx*4]
14589c1c9: 0f2ed2 ucomiss xmm2, xmm2
14589c1cc: 0f8a29ffffff jp 0x14589c0fb
14589c1d2: 0f28ca movaps xmm1, xmm2
14589c1d5: 0f2ed0 ucomiss xmm2, xmm0
14589c1d8: 0f861dffffff jbe 0x14589c0fb
14589c1de: 0f28c1 movaps xmm0, xmm1
14589c1e1: e915ffffff jmp 0x14589c0fb
14589c1e6: 4c8d059be23501 lea r8, [rip + 0x135e29b]
14589c1ed: 4889c1 mov rcx, rax
14589c1f0: e84e845000 call 0x145da4643
14589c1f5: 0f0b ud2
14589c1f7: 4c8d05a2df3501 lea r8, [rip + 0x135dfa2]
14589c1fe: e840845000 call 0x145da4643
14589c203: 0f0b ud2
