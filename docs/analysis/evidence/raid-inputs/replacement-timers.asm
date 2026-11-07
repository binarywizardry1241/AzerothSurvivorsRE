1459da880: 4157 push r15
1459da882: 4156 push r14
1459da884: 56 push rsi
1459da885: 57 push rdi
1459da886: 53 push rbx
1459da887: 4883ec20 sub rsp, 0x20
1459da88b: 4d89c6 mov r14, r8
1459da88e: 4889d3 mov rbx, rdx
1459da891: 4889ce mov rsi, rcx
1459da894: 4c89c0 mov rax, r8
1459da897: 4829d0 sub rax, rdx
1459da89a: 48c1e803 shr rax, 3
1459da89e: 48b99324499224499224 movabs rcx, 0x2492492492492493
1459da8a8: 48f7e1 mul rcx
1459da8ab: 4929de sub r14, rbx
1459da8ae: 7436 je 0x1459da8e6
1459da8b0: 4889d7 mov rdi, rdx
1459da8b3: 4c8d3c9500000000 lea r15, [rdx*4]
1459da8bb: e8407962fa call 0x140002200
1459da8c0: ba04000000 mov edx, 4
1459da8c5: 4c89f9 mov rcx, r15
1459da8c8: e8f37862fa call 0x1400021c0
1459da8cd: 4885c0 test rax, rax
1459da8d0: 0f8411010000 je 0x1459da9e7
1459da8d6: 4981fec0010000 cmp r14, 0x1c0
1459da8dd: 7313 jae 0x1459da8f2
1459da8df: 31c9 xor ecx, ecx
1459da8e1: e9ae000000 jmp 0x1459da994
1459da8e6: 31ff xor edi, edi
1459da8e8: b804000000 mov eax, 4
1459da8ed: e9db000000 jmp 0x1459da9cd
1459da8f2: 4889f9 mov rcx, rdi
1459da8f5: 4883e1f8 and rcx, 0xfffffffffffffff8
1459da8f9: 488d93b8010000 lea rdx, [rbx + 0x1b8]
1459da900: 4531c0 xor r8d, r8d
1459da903: 0f2805e62b3d00 movaps xmm0, xmmword ptr [rip + 0x3d2be6]
1459da90a: 0f280dbf023e00 movaps xmm1, xmmword ptr [rip + 0x3e02bf]
1459da911: 6666666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
1459da920: f30f109278feffff movss xmm2, dword ptr [rdx - 0x188]
1459da928: f30f109ab0feffff movss xmm3, dword ptr [rdx - 0x150]
1459da930: 0f14d3 unpcklps xmm2, xmm3
1459da933: f30f109ae8feffff movss xmm3, dword ptr [rdx - 0x118]
1459da93b: f30f10a220ffffff movss xmm4, dword ptr [rdx - 0xe0]
1459da943: 0f14dc unpcklps xmm3, xmm4
1459da946: 0f16d3 movlhps xmm2, xmm3
1459da949: f30f101a movss xmm3, dword ptr [rdx]
1459da94d: f30f1062c8 movss xmm4, dword ptr [rdx - 0x38]
1459da952: 0f14e3 unpcklps xmm4, xmm3
1459da955: f30f105a90 movss xmm3, dword ptr [rdx - 0x70]
1459da95a: f30f10aa58ffffff movss xmm5, dword ptr [rdx - 0xa8]
1459da962: 0f14eb unpcklps xmm5, xmm3
1459da965: 0f16ec movlhps xmm5, xmm4
1459da968: 0f59d0 mulps xmm2, xmm0
1459da96b: 0f59e8 mulps xmm5, xmm0
1459da96e: 0f58d1 addps xmm2, xmm1
1459da971: 0f58e9 addps xmm5, xmm1
1459da974: 420f111480 movups xmmword ptr [rax + r8*4], xmm2
1459da979: 420f116c8010 movups xmmword ptr [rax + r8*4 + 0x10], xmm5
1459da97f: 4983c008 add r8, 8
1459da983: 4881c2c0010000 add rdx, 0x1c0
1459da98a: 4c39c1 cmp rcx, r8
1459da98d: 7591 jne 0x1459da920
1459da98f: 4839cf cmp rdi, rcx
1459da992: 7439 je 0x1459da9cd
1459da994: 486bd138 imul rdx, rcx, 0x38
1459da998: 4801da add rdx, rbx
1459da99b: 4883c230 add rdx, 0x30
1459da99f: f30f1005bd283d00 movss xmm0, dword ptr [rip + 0x3d28bd]
1459da9a7: f30f100db1283d00 movss xmm1, dword ptr [rip + 0x3d28b1]
1459da9af: 90 nop
1459da9b0: f30f1012 movss xmm2, dword ptr [rdx]
1459da9b4: f30f59d0 mulss xmm2, xmm0
1459da9b8: f30f58d1 addss xmm2, xmm1
1459da9bc: f30f111488 movss dword ptr [rax + rcx*4], xmm2
1459da9c1: 48ffc1 inc rcx
1459da9c4: 4883c238 add rdx, 0x38
1459da9c8: 4839cf cmp rdi, rcx
1459da9cb: 75e3 jne 0x1459da9b0
1459da9cd: 48893e mov qword ptr [rsi], rdi
1459da9d0: 48894608 mov qword ptr [rsi + 8], rax
1459da9d4: 48897e10 mov qword ptr [rsi + 0x10], rdi
1459da9d8: 4889f0 mov rax, rsi
1459da9db: 4883c420 add rsp, 0x20
1459da9df: 5b pop rbx
1459da9e0: 5f pop rdi
1459da9e1: 5e pop rsi
1459da9e2: 415e pop r14
1459da9e4: 415f pop r15
1459da9e6: c3 ret
