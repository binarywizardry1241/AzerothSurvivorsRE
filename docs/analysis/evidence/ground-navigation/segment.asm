1459a3a00: 4157 push r15
1459a3a02: 4156 push r14
1459a3a04: 4154 push r12
1459a3a06: 56 push rsi
1459a3a07: 57 push rdi
1459a3a08: 53 push rbx
1459a3a09: 4881ecc8000000 sub rsp, 0xc8
1459a3a10: 440f29bc24b0000000 movaps xmmword ptr [rsp + 0xb0], xmm15
1459a3a19: 440f29b424a0000000 movaps xmmword ptr [rsp + 0xa0], xmm14
1459a3a22: 440f29ac2490000000 movaps xmmword ptr [rsp + 0x90], xmm13
1459a3a2b: 440f29a42480000000 movaps xmmword ptr [rsp + 0x80], xmm12
1459a3a34: 440f295c2470 movaps xmmword ptr [rsp + 0x70], xmm11
1459a3a3a: 440f29542460 movaps xmmword ptr [rsp + 0x60], xmm10
1459a3a40: 440f294c2450 movaps xmmword ptr [rsp + 0x50], xmm9
1459a3a46: 440f29442440 movaps xmmword ptr [rsp + 0x40], xmm8
1459a3a4c: 0f297c2430 movaps xmmword ptr [rsp + 0x30], xmm7
1459a3a51: 0f29742420 movaps xmmword ptr [rsp + 0x20], xmm6
1459a3a56: 660f6ef2 movd xmm6, edx
1459a3a5a: 48c1ea20 shr rdx, 0x20
1459a3a5e: 660f6efa movd xmm7, edx
1459a3a62: 66450f6ec0 movd xmm8, r8d
1459a3a67: 49c1e820 shr r8, 0x20
1459a3a6b: 66450f6ec8 movd xmm9, r8d
1459a3a70: f3440f5cc6 subss xmm8, xmm6
1459a3a75: f3440f5ccf subss xmm9, xmm7
1459a3a7a: 410f28c0 movaps xmm0, xmm8
1459a3a7e: f3410f59c0 mulss xmm0, xmm8
1459a3a83: 410f28c9 movaps xmm1, xmm9
1459a3a87: f3410f59c9 mulss xmm1, xmm9
1459a3a8c: f30f58c8 addss xmm1, xmm0
1459a3a90: 0f57c0 xorps xmm0, xmm0
1459a3a93: f30f51c1 sqrtss xmm0, xmm1
1459a3a97: f3440f1015d0474000 movss xmm10, dword ptr [rip + 0x4047d0]
1459a3aa0: f30f100d8c4a4000 movss xmm1, dword ptr [rip + 0x404a8c]
1459a3aa8: 0f2ec8 ucomiss xmm1, xmm0
1459a3aab: 0f87b1020000 ja 0x1459a3d62
1459a3ab1: 4889ce mov rsi, rcx
1459a3ab4: f30f5e0514fe4000 divss xmm0, dword ptr [rip + 0x40fe14]
1459a3abc: e83a172600 call 0x145c051fb
1459a3ac1: f3480f2cc0 cvttss2si rax, xmm0
1459a3ac6: 4889c1 mov rcx, rax
1459a3ac9: 48c1f93f sar rcx, 0x3f
1459a3acd: 0f28c8 movaps xmm1, xmm0
1459a3ad0: f30f5c0d78de4000 subss xmm1, dword ptr [rip + 0x40de78]
1459a3ad8: f3480f2cd1 cvttss2si rdx, xmm1
1459a3add: 4821ca and rdx, rcx
1459a3ae0: 4809c2 or rdx, rax
1459a3ae3: 4531c0 xor r8d, r8d
1459a3ae6: 0f57e4 xorps xmm4, xmm4
1459a3ae9: 0f2ec4 ucomiss xmm0, xmm4
1459a3aec: b900000000 mov ecx, 0
1459a3af1: 480f43ca cmovae rcx, rdx
1459a3af5: 0f2e0558de4000 ucomiss xmm0, dword ptr [rip + 0x40de58]
1459a3afc: 48c7c0ffffffff mov rax, 0xffffffffffffffff
1459a3b03: 480f46c1 cmovbe rax, rcx
1459a3b07: f30f104e20 movss xmm1, dword ptr [rsi + 0x20]
1459a3b0c: f30f105624 movss xmm2, dword ptr [rsi + 0x24]
1459a3b11: 0f28de movaps xmm3, xmm6
1459a3b14: f30f5cd9 subss xmm3, xmm1
1459a3b18: 0f2ee3 ucomiss xmm4, xmm3
1459a3b1b: 0f87b3000000 ja 0x1459a3bd4
1459a3b21: 0f28c7 movaps xmm0, xmm7
1459a3b24: f30f5cc2 subss xmm0, xmm2
1459a3b28: 0f2ee0 ucomiss xmm4, xmm0
1459a3b2b: 0f87a3000000 ja 0x1459a3bd4
1459a3b31: f30f102517de4000 movss xmm4, dword ptr [rip + 0x40de17]
1459a3b39: 0f28eb movaps xmm5, xmm3
1459a3b3c: f30f5cec subss xmm5, xmm4
1459a3b40: f3480f2ccd cvttss2si rcx, xmm5
1459a3b45: f34c0f2cc3 cvttss2si r8, xmm3
1459a3b4a: 4c89c2 mov rdx, r8
1459a3b4d: 48c1fa3f sar rdx, 0x3f
1459a3b51: 4821ca and rdx, rcx
1459a3b54: 4c09c2 or rdx, r8
1459a3b57: 4531c0 xor r8d, r8d
1459a3b5a: 0f57ed xorps xmm5, xmm5
1459a3b5d: 0f2edd ucomiss xmm3, xmm5
1459a3b60: 490f42d0 cmovb rdx, r8
1459a3b64: f3440f101de7dd4000 movss xmm11, dword ptr [rip + 0x40dde7]
1459a3b6d: 410f2edb ucomiss xmm3, xmm11
1459a3b71: 48c7c1ffffffff mov rcx, 0xffffffffffffffff
1459a3b78: 480f47d1 cmova rdx, rcx
1459a3b7c: 0f28d8 movaps xmm3, xmm0
1459a3b7f: f30f5cdc subss xmm3, xmm4
1459a3b83: f34c0f2cd3 cvttss2si r10, xmm3
1459a3b88: f34c0f2cd8 cvttss2si r11, xmm0
1459a3b8d: 4d89d9 mov r9, r11
1459a3b90: 49c1f93f sar r9, 0x3f
1459a3b94: 4d21d1 and r9, r10
1459a3b97: 4d09d9 or r9, r11
1459a3b9a: 0f2ec5 ucomiss xmm0, xmm5
1459a3b9d: 4d0f42c8 cmovb r9, r8
1459a3ba1: 410f2ec3 ucomiss xmm0, xmm11
1459a3ba5: 4c0f47c9 cmova r9, rcx
1459a3ba9: 488b4e18 mov rcx, qword ptr [rsi + 0x18]
1459a3bad: 4839ca cmp rdx, rcx
1459a3bb0: 7322 jae 0x1459a3bd4
1459a3bb2: 4939c9 cmp r9, rcx
1459a3bb5: 731d jae 0x1459a3bd4
1459a3bb7: 490fafc9 imul rcx, r9
1459a3bbb: 4801d1 add rcx, rdx
1459a3bbe: 488b5610 mov rdx, qword ptr [rsi + 0x10]
1459a3bc2: 4839d1 cmp rcx, rdx
1459a3bc5: 0f83f2010000 jae 0x1459a3dbd
1459a3bcb: 488b5608 mov rdx, qword ptr [rsi + 8]
1459a3bcf: 440fb6040a movzx r8d, byte ptr [rdx + rcx]
1459a3bd4: 4885c0 test rax, rax
1459a3bd7: 0f8485010000 je 0x1459a3d62
1459a3bdd: 780a js 0x1459a3be9
1459a3bdf: 0f57db xorps xmm3, xmm3
1459a3be2: f3480f2ad8 cvtsi2ss xmm3, rax
1459a3be7: eb1a jmp 0x1459a3c03
1459a3be9: 4889c1 mov rcx, rax
1459a3bec: 48d1e9 shr rcx, 1
1459a3bef: 89c2 mov edx, eax
1459a3bf1: 83e201 and edx, 1
1459a3bf4: 4809ca or rdx, rcx
1459a3bf7: 0f57db xorps xmm3, xmm3
1459a3bfa: f3480f2ada cvtsi2ss xmm3, rdx
1459a3bff: f30f58db addss xmm3, xmm3
1459a3c03: 4c8b4e18 mov r9, qword ptr [rsi + 0x18]
1459a3c07: 4c8b5608 mov r10, qword ptr [rsi + 8]
1459a3c0b: 488b5610 mov rdx, qword ptr [rsi + 0x10]
1459a3c0f: be01000000 mov esi, 1
1459a3c14: 0f57e4 xorps xmm4, xmm4
1459a3c17: f30f102d31dd4000 movss xmm5, dword ptr [rip + 0x40dd31]
1459a3c1f: f3440f101d2cdd4000 movss xmm11, dword ptr [rip + 0x40dd2c]
1459a3c28: 49c7c3ffffffff mov r11, 0xffffffffffffffff
1459a3c2f: 0f57c0 xorps xmm0, xmm0
1459a3c32: bf01000000 mov edi, 1
1459a3c37: 660f1f840000000000 nop word ptr [rax + rax]
1459a3c40: 4839c6 cmp rsi, rax
1459a3c43: 4883d700 adc rdi, 0
1459a3c47: 4885f6 test rsi, rsi
1459a3c4a: 7814 js 0x1459a3c60
1459a3c4c: 450f57e4 xorps xmm12, xmm12
1459a3c50: f34c0f2ae6 cvtsi2ss xmm12, rsi
1459a3c55: eb25 jmp 0x1459a3c7c
1459a3c57: 660f1f840000000000 nop word ptr [rax + rax]
1459a3c60: 4889f1 mov rcx, rsi
1459a3c63: 48d1e9 shr rcx, 1
1459a3c66: 89f3 mov ebx, esi
1459a3c68: 83e301 and ebx, 1
1459a3c6b: 4809cb or rbx, rcx
1459a3c6e: 450f57e4 xorps xmm12, xmm12
1459a3c72: f34c0f2ae3 cvtsi2ss xmm12, rbx
1459a3c77: f3450f58e4 addss xmm12, xmm12
1459a3c7c: f3440f5ee3 divss xmm12, xmm3
1459a3c81: 450f28f0 movaps xmm14, xmm8
1459a3c85: f3450f59f4 mulss xmm14, xmm12
1459a3c8a: f3440f58f6 addss xmm14, xmm6
1459a3c8f: f3440f5cf1 subss xmm14, xmm1
1459a3c94: 31db xor ebx, ebx
1459a3c96: 410f2ee6 ucomiss xmm4, xmm14
1459a3c9a: 0f87aa000000 ja 0x1459a3d4a
1459a3ca0: 450f28e9 movaps xmm13, xmm9
1459a3ca4: f3450f59ec mulss xmm13, xmm12
1459a3ca9: f3440f58ef addss xmm13, xmm7
1459a3cae: f3440f5cea subss xmm13, xmm2
1459a3cb3: 410f2ee5 ucomiss xmm4, xmm13
1459a3cb7: 0f878d000000 ja 0x1459a3d4a
1459a3cbd: 450f28fe movaps xmm15, xmm14
1459a3cc1: f3440f5cfd subss xmm15, xmm5
1459a3cc6: f3490f2ccf cvttss2si rcx, xmm15
1459a3ccb: f3490f2cde cvttss2si rbx, xmm14
1459a3cd0: 4989de mov r14, rbx
1459a3cd3: 49c1fe3f sar r14, 0x3f
1459a3cd7: 4921ce and r14, rcx
1459a3cda: 4909de or r14, rbx
1459a3cdd: 31db xor ebx, ebx
1459a3cdf: 440f2ef4 ucomiss xmm14, xmm4
1459a3ce3: 4c0f42f3 cmovb r14, rbx
1459a3ce7: 450f2ef3 ucomiss xmm14, xmm11
1459a3ceb: 4d0f47f3 cmova r14, r11
1459a3cef: 450f28f5 movaps xmm14, xmm13
1459a3cf3: f3440f5cf5 subss xmm14, xmm5
1459a3cf8: f34d0f2cfe cvttss2si r15, xmm14
1459a3cfd: f34d0f2ce5 cvttss2si r12, xmm13
1459a3d02: 4c89e1 mov rcx, r12
1459a3d05: 48c1f93f sar rcx, 0x3f
1459a3d09: 4c21f9 and rcx, r15
1459a3d0c: 4c09e1 or rcx, r12
1459a3d0f: 440f2eec ucomiss xmm13, xmm4
1459a3d13: 480f42cb cmovb rcx, rbx
1459a3d17: 450f2eeb ucomiss xmm13, xmm11
1459a3d1b: 490f47cb cmova rcx, r11
1459a3d1f: 4d39ce cmp r14, r9
1459a3d22: 7326 jae 0x1459a3d4a
1459a3d24: 4c39c9 cmp rcx, r9
1459a3d27: 7321 jae 0x1459a3d4a
1459a3d29: 490fafc9 imul rcx, r9
1459a3d2d: 4c01f1 add rcx, r14
1459a3d30: 4839d1 cmp rcx, rdx
1459a3d33: 0f8384000000 jae 0x1459a3dbd
1459a3d39: 410fb61c0a movzx ebx, byte ptr [r10 + rcx]
1459a3d3e: 89d9 mov ecx, ebx
1459a3d40: f6d1 not cl
1459a3d42: 4408c1 or cl, r8b
1459a3d45: f6c101 test cl, 1
1459a3d48: 741c je 0x1459a3d66
1459a3d4a: 4839c6 cmp rsi, rax
1459a3d4d: 7313 jae 0x1459a3d62
1459a3d4f: 4120d8 and r8b, bl
1459a3d52: 410f28c4 movaps xmm0, xmm12
1459a3d56: 4889fe mov rsi, rdi
1459a3d59: 4839c7 cmp rdi, rax
1459a3d5c: 0f86defeffff jbe 0x1459a3c40
1459a3d62: 410f28c2 movaps xmm0, xmm10
1459a3d66: 0f28742420 movaps xmm6, xmmword ptr [rsp + 0x20]
1459a3d6b: 0f287c2430 movaps xmm7, xmmword ptr [rsp + 0x30]
1459a3d70: 440f28442440 movaps xmm8, xmmword ptr [rsp + 0x40]
1459a3d76: 440f284c2450 movaps xmm9, xmmword ptr [rsp + 0x50]
1459a3d7c: 440f28542460 movaps xmm10, xmmword ptr [rsp + 0x60]
1459a3d82: 440f285c2470 movaps xmm11, xmmword ptr [rsp + 0x70]
1459a3d88: 440f28a42480000000 movaps xmm12, xmmword ptr [rsp + 0x80]
1459a3d91: 440f28ac2490000000 movaps xmm13, xmmword ptr [rsp + 0x90]
1459a3d9a: 440f28b424a0000000 movaps xmm14, xmmword ptr [rsp + 0xa0]
1459a3da3: 440f28bc24b0000000 movaps xmm15, xmmword ptr [rsp + 0xb0]
1459a3dac: 4881c4c8000000 add rsp, 0xc8
1459a3db3: 5b pop rbx
1459a3db4: 5f pop rdi
1459a3db5: 5e pop rsi
1459a3db6: 415c pop r12
1459a3db8: 415e pop r14
1459a3dba: 415f pop r15
1459a3dbc: c3 ret
1459a3dbd: 4c8d05e4f48901 lea r8, [rip + 0x189f4e4]
1459a3dc4: e87a084000 call 0x145da4643
1459a3dc9: 0f0b ud2
