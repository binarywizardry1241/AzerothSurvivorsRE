1401c50f4: f30f108d3c030000 movss xmm1, dword ptr [rbp + 0x33c]
1401c50fc: f20f104030 movsd xmm0, qword ptr [rax + 0x30]
1401c5101: 0f590558d1c105 mulps xmm0, xmmword ptr [rip + 0x5c1d158]
1401c5108: f30f105034 movss xmm2, dword ptr [rax + 0x34]
1401c510d: 0f14c0 unpcklps xmm0, xmm0
1401c5110: 0f28d9 movaps xmm3, xmm1
1401c5113: f30f5fde maxss xmm3, xmm6
1401c5117: f30f5efb divss xmm7, xmm3
1401c511b: 0f28257e7fc005 movaps xmm4, xmmword ptr [rip + 0x5c07f7e]
1401c5122: 0f57e0 xorps xmm4, xmm0
1401c5125: 0f2819 movaps xmm3, xmmword ptr [rcx]
1401c5128: 0f59e3 mulps xmm4, xmm3
1401c512b: 0f59c3 mulps xmm0, xmm3
1401c512e: f30f106914 movss xmm5, dword ptr [rcx + 0x14]
1401c5133: f30f12ed movsldup xmm5, xmm5
1401c5137: 440f28c0 movaps xmm8, xmm0
1401c513b: 440fc6c411 shufps xmm8, xmm4, 0x11
1401c5140: 440fc6c4e2 shufps xmm8, xmm4, 0xe2
1401c5145: 0fc6c4f7 shufps xmm0, xmm4, 0xf7
1401c5149: 0fc6c4e2 shufps xmm0, xmm4, 0xe2
1401c514d: 410f58c0 addps xmm0, xmm8
1401c5151: 0f58c5 addps xmm0, xmm5
1401c5154: f30f12ef movsldup xmm5, xmm7
1401c5158: 0f59e8 mulps xmm5, xmm0
1401c515b: f3440f16c5 movshdup xmm8, xmm5
1401c5160: 0f28fd movaps xmm7, xmm5
1401c5163: f3410f5df8 minss xmm7, xmm8
1401c5168: f30f106064 movss xmm4, dword ptr [rax + 0x64]
1401c516d: f3410f16c2 movshdup xmm0, xmm10
1401c5172: 0f2ef8 ucomiss xmm7, xmm0
1401c5175: 7639 jbe 0x1401c51b0
1401c5177: f30f5cc7 subss xmm0, xmm7
1401c517b: f30f58057928c205 addss xmm0, dword ptr [rip + 0x5c22879]
1401c5183: eb4a jmp 0x1401c51cf
1401c5185: f7d0 not eax
1401c5187: 8b8dac000000 mov ecx, dword ptr [rbp + 0xac]
1401c518d: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
1401c5194: 890a mov dword ptr [rdx], ecx
1401c5196: 488b8d90000000 mov rcx, qword ptr [rbp + 0x90]
1401c519d: 498b14c0 mov rdx, qword ptr [r8 + rax*8]
1401c51a1: f30f2ad6 cvtsi2ss xmm2, esi
1401c51a5: e8469ce4ff call 0x14000edf0
1401c51aa: 90 nop
1401c51ab: e9f0faffff jmp 0x1401c4ca0
1401c51b0: f3410f5fe8 maxss xmm5, xmm8
1401c51b5: f3410f16c1 movshdup xmm0, xmm9
1401c51ba: 0f2ec5 ucomiss xmm0, xmm5
1401c51bd: 0f868d000000 jbe 0x1401c5250
1401c51c3: f30f5cc5 subss xmm0, xmm5
1401c51c7: f30f5805b182bd05 addss xmm0, dword ptr [rip + 0x5bd82b1]
1401c51cf: 0f57ed xorps xmm5, xmm5
1401c51d2: 0f2ec5 ucomiss xmm0, xmm5
1401c51d5: 7502 jne 0x1401c51d9
1401c51d7: 7b77 jnp 0x1401c5250
1401c51d9: 0f59db mulps xmm3, xmm3
1401c51dc: 0f28fb movaps xmm7, xmm3
1401c51df: 0fc6fbff shufps xmm7, xmm3, 0xff
1401c51e3: 0f12db movhlps xmm3, xmm3
1401c51e6: f30f58df addss xmm3, xmm7
1401c51ea: f30f51db sqrtss xmm3, xmm3
1401c51ee: f30f5fde maxss xmm3, xmm6
1401c51f2: f30f59cc mulss xmm1, xmm4
1401c51f6: f30f5fce maxss xmm1, xmm6
1401c51fa: f30f5ed9 divss xmm3, xmm1
1401c51fe: f30f10483c movss xmm1, dword ptr [rax + 0x3c]
1401c5203: f30f5cca subss xmm1, xmm2
1401c5207: f30f59cc mulss xmm1, xmm4
1401c520b: f30f5fcd maxss xmm1, xmm5
1401c520f: f30f5ec3 divss xmm0, xmm3
1401c5213: f30f5844fb04 addss xmm0, dword ptr [rbx + rdi*8 + 4]
1401c5219: e8420cffff call 0x1401b5e60
1401c521e: 90 nop
1401c521f: 418934be mov dword ptr [r14 + rdi*4], esi
1401c5223: f30f1144fb04 movss dword ptr [rbx + rdi*8 + 4], xmm0
1401c5229: 488b8590000000 mov rax, qword ptr [rbp + 0x90]
1401c5230: 80b8c001000001 cmp byte ptr [rax + 0x1c0], 1
1401c5237: 7517 jne 0x1401c5250
1401c5239: 8b8dac000000 mov ecx, dword ptr [rbp + 0xac]
1401c523f: 488b95a0000000 mov rdx, qword ptr [rbp + 0xa0]
1401c5246: 890a mov dword ptr [rdx], ecx
1401c5248: f30f1180bc010000 movss dword ptr [rax + 0x1bc], xmm0
