1459ca8d0: 4157 push r15
1459ca8d2: 4156 push r14
1459ca8d4: 56 push rsi
1459ca8d5: 57 push rdi
1459ca8d6: 53 push rbx
1459ca8d7: 4883ec20 sub rsp, 0x20
1459ca8db: 4d89c6 mov r14, r8
1459ca8de: 4889d3 mov rbx, rdx
1459ca8e1: 4889ce mov rsi, rcx
1459ca8e4: 4c89c0 mov rax, r8
1459ca8e7: 4829d0 sub rax, rdx
1459ca8ea: 48c1e803 shr rax, 3
1459ca8ee: 48b99324499224499224 movabs rcx, 0x2492492492492493
1459ca8f8: 48f7e1 mul rcx
1459ca8fb: 4929de sub r14, rbx
1459ca8fe: 7436 je 0x1459ca936
1459ca900: 4889d7 mov rdi, rdx
1459ca903: 4c8d3c9500000000 lea r15, [rdx*4]
1459ca90b: e8f07863fa call 0x140002200
1459ca910: ba04000000 mov edx, 4
1459ca915: 4c89f9 mov rcx, r15
1459ca918: e8a37863fa call 0x1400021c0
1459ca91d: 4885c0 test rax, rax
1459ca920: 0f8411010000 je 0x1459caa37
1459ca926: 4981fec0010000 cmp r14, 0x1c0
1459ca92d: 7313 jae 0x1459ca942
1459ca92f: 31c9 xor ecx, ecx
1459ca931: e9ae000000 jmp 0x1459ca9e4
1459ca936: 31ff xor edi, edi
1459ca938: b804000000 mov eax, 4
1459ca93d: e9db000000 jmp 0x1459caa1d
1459ca942: 4889f9 mov rcx, rdi
1459ca945: 4883e1f8 and rcx, 0xfffffffffffffff8
1459ca949: 488d93b8010000 lea rdx, [rbx + 0x1b8]
1459ca950: 4531c0 xor r8d, r8d
1459ca953: 0f280576e33d00 movaps xmm0, xmmword ptr [rip + 0x3de376]
1459ca95a: 0f280d2f293d00 movaps xmm1, xmmword ptr [rip + 0x3d292f]
1459ca961: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459ca970: f30f109278feffff movss xmm2, dword ptr [rdx - 0x188]
1459ca978: f30f109ab0feffff movss xmm3, dword ptr [rdx - 0x150]
1459ca980: 0f14d3 unpcklps xmm2, xmm3
1459ca983: f30f109ae8feffff movss xmm3, dword ptr [rdx - 0x118]
1459ca98b: f30f10a220ffffff movss xmm4, dword ptr [rdx - 0xe0]
1459ca993: 0f14dc unpcklps xmm3, xmm4
1459ca996: 0f16d3 movlhps xmm2, xmm3
1459ca999: f30f101a movss xmm3, dword ptr [rdx]
1459ca99d: f30f1062c8 movss xmm4, dword ptr [rdx - 0x38]
1459ca9a2: 0f14e3 unpcklps xmm4, xmm3
1459ca9a5: f30f105a90 movss xmm3, dword ptr [rdx - 0x70]
1459ca9aa: f30f10aa58ffffff movss xmm5, dword ptr [rdx - 0xa8]
1459ca9b2: 0f14eb unpcklps xmm5, xmm3
1459ca9b5: 0f16ec movlhps xmm5, xmm4
1459ca9b8: 0f59d0 mulps xmm2, xmm0
1459ca9bb: 0f59e8 mulps xmm5, xmm0
1459ca9be: 0f58d1 addps xmm2, xmm1
1459ca9c1: 0f58e9 addps xmm5, xmm1
1459ca9c4: 420f111480 movups xmmword ptr [rax + r8*4], xmm2
1459ca9c9: 420f116c8010 movups xmmword ptr [rax + r8*4 + 0x10], xmm5
1459ca9cf: 4983c008 add r8, 8
1459ca9d3: 4881c2c0010000 add rdx, 0x1c0
1459ca9da: 4c39c1 cmp rcx, r8
1459ca9dd: 7591 jne 0x1459ca970
1459ca9df: 4839cf cmp rdi, rcx
1459ca9e2: 7439 je 0x1459caa1d
1459ca9e4: 486bd138 imul rdx, rcx, 0x38
1459ca9e8: 4801da add rdx, rbx
1459ca9eb: 4883c230 add rdx, 0x30
1459ca9ef: f30f1005ad283d00 movss xmm0, dword ptr [rip + 0x3d28ad]
1459ca9f7: f30f100da1283d00 movss xmm1, dword ptr [rip + 0x3d28a1]
1459ca9ff: 90 nop
1459caa00: f30f1012 movss xmm2, dword ptr [rdx]
1459caa04: f30f59d0 mulss xmm2, xmm0
1459caa08: f30f58d1 addss xmm2, xmm1
1459caa0c: f30f111488 movss dword ptr [rax + rcx*4], xmm2
1459caa11: 48ffc1 inc rcx
1459caa14: 4883c238 add rdx, 0x38
1459caa18: 4839cf cmp rdi, rcx
1459caa1b: 75e3 jne 0x1459caa00
1459caa1d: 48893e mov qword ptr [rsi], rdi
1459caa20: 48894608 mov qword ptr [rsi + 8], rax
1459caa24: 48897e10 mov qword ptr [rsi + 0x10], rdi
1459caa28: 4889f0 mov rax, rsi
1459caa2b: 4883c420 add rsp, 0x20
1459caa2f: 5b pop rbx
1459caa30: 5f pop rdi
1459caa31: 5e pop rsi
1459caa32: 415e pop r14
1459caa34: 415f pop r15
1459caa36: c3 ret
1459caa37: b904000000 mov ecx, 4
1459caa3c: 4c89fa mov rdx, r15
1459caa3f: e877e83c00 call 0x145d992bb
