1459efe20 4157 push r15
1459efe22 4156 push r14
1459efe24 4154 push r12
1459efe26 56 push rsi
1459efe27 57 push rdi
1459efe28 53 push rbx
1459efe29 4889c8 mov rax, rcx
1459efe2c 488b0a mov rcx, qword ptr [rdx]
1459efe2f 4c8b4a08 mov r9, qword ptr [rdx + 8]
1459efe33 4c39c9 cmp rcx, r9
1459efe36 0f84bb010000 je 0x1459efff7
1459efe3c 4c8b5210 mov r10, qword ptr [rdx + 0x10]
1459efe40 4c8b5a18 mov r11, qword ptr [rdx + 0x18]
1459efe44 48bef8ffffffffffff0f movabs rsi, 0xffffffffffffff8
1459efe4e 4c21de and rsi, r11
1459efe51 41c1e303 shl r11d, 3
1459efe55 4183e338 and r11d, 0x38
1459efe59 488b7a20 mov rdi, qword ptr [rdx + 0x20]
1459efe5d 488b5a28 mov rbx, qword ptr [rdx + 0x28]
1459efe61 4d8b00 mov r8, qword ptr [r8]
1459efe64 0f57c0 xorps xmm0, xmm0
1459efe67 f30f100df1d33b00 movss xmm1, dword ptr [rip + 0x3bd3f1]
1459efe6f eb38 jmp 0x1459efea9
1459efe71 f2410f109780010000 movsd xmm2, qword ptr [r15 + 0x180]
1459efe7a f20f101b movsd xmm3, qword ptr [rbx]
1459efe7e 0f5cd3 subps xmm2, xmm3
1459efe81 0f59d2 mulps xmm2, xmm2
1459efe84 f30f16da movshdup xmm3, xmm2
1459efe88 f30f58da addss xmm3, xmm2
1459efe8c f3410f1010 movss xmm2, dword ptr [r8]
1459efe91 0f2ed3 ucomiss xmm2, xmm3
1459efe94 0f836c010000 jae 0x1459f0006
1459efe9a 660f1f440000 nop word ptr [rax + rax]
1459efea0 4c39c9 cmp rcx, r9
1459efea3 0f844b010000 je 0x1459efff4
1459efea9 4989cf mov r15, rcx
1459efeac 4881c1d8010000 add rcx, 0x1d8
1459efeb3 4180bfb000000000 cmp byte ptr [r15 + 0xb0], 0
1459efebb 75e3 jne 0x1459efea0
1459efebd 4d8bb7f0000000 mov r14, qword ptr [r15 + 0xf0]
1459efec4 4531e4 xor r12d, r12d
1459efec7 660f1f840000000000 nop word ptr [rax + rax]
1459efed0 4c39e6 cmp rsi, r12
1459efed3 743e je 0x1459eff13
1459efed5 4f3934e2 cmp qword ptr [r10 + r12*8], r14
1459efed9 74c5 je 0x1459efea0
1459efedb 4f3974e208 cmp qword ptr [r10 + r12*8 + 8], r14
1459efee0 74be je 0x1459efea0
1459efee2 4f3974e210 cmp qword ptr [r10 + r12*8 + 0x10], r14
1459efee7 74b7 je 0x1459efea0
1459efee9 4f3974e218 cmp qword ptr [r10 + r12*8 + 0x18], r14
1459efeee 74b0 je 0x1459efea0
1459efef0 4f3974e220 cmp qword ptr [r10 + r12*8 + 0x20], r14
1459efef5 74a9 je 0x1459efea0
1459efef7 4f3974e228 cmp qword ptr [r10 + r12*8 + 0x28], r14
1459efefc 74a2 je 0x1459efea0
1459efefe 4f3974e230 cmp qword ptr [r10 + r12*8 + 0x30], r14
1459eff03 749b je 0x1459efea0
1459eff05 4f3974e238 cmp qword ptr [r10 + r12*8 + 0x38], r14
1459eff0a 4d8d642408 lea r12, [r12 + 8]
1459eff0f 75bf jne 0x1459efed0
1459eff11 eb8d jmp 0x1459efea0
1459eff13 4d85db test r11, r11
1459eff16 740c je 0x1459eff24
1459eff18 4d3934f2 cmp qword ptr [r10 + rsi*8], r14
1459eff1c 7482 je 0x1459efea0
1459eff1e 4183fb08 cmp r11d, 8
1459eff22 7555 jne 0x1459eff79
1459eff24 f3410f109790010000 movss xmm2, dword ptr [r15 + 0x190]
1459eff2d 0f2ec2 ucomiss xmm0, xmm2
1459eff30 0f833bffffff jae 0x1459efe71
1459eff36 f30f101f movss xmm3, dword ptr [rdi]
1459eff3a f3410f5c9f8c010000 subss xmm3, dword ptr [r15 + 0x18c]
1459eff43 f30f5eda divss xmm3, xmm2
1459eff47 0f57d2 xorps xmm2, xmm2
1459eff4a f30f5fd3 maxss xmm2, xmm3
1459eff4e 0f28d9 movaps xmm3, xmm1
1459eff51 f30f5dda minss xmm3, xmm2
1459eff55 f2410f10a774010000 movsd xmm4, qword ptr [r15 + 0x174]
1459eff5e f2410f10af80010000 movsd xmm5, qword ptr [r15 + 0x180]
1459eff67 0f5cec subps xmm5, xmm4
1459eff6a f30f12d3 movsldup xmm2, xmm3
1459eff6e 0f59d5 mulps xmm2, xmm5
1459eff71 0f58d4 addps xmm2, xmm4
1459eff74 e901ffffff jmp 0x1459efe7a
1459eff79 4d3974f208 cmp qword ptr [r10 + rsi*8 + 8], r14
1459eff7e 0f841cffffff je 0x1459efea0
1459eff84 4183fb10 cmp r11d, 0x10
1459eff88 749a je 0x1459eff24
1459eff8a 4d3974f210 cmp qword ptr [r10 + rsi*8 + 0x10], r14
1459eff8f 0f840bffffff je 0x1459efea0
1459eff95 4183fb18 cmp r11d, 0x18
1459eff99 7489 je 0x1459eff24
1459eff9b 4d3974f218 cmp qword ptr [r10 + rsi*8 + 0x18], r14
1459effa0 0f84fafeffff je 0x1459efea0
1459effa6 4183fb20 cmp r11d, 0x20
1459effaa 0f8474ffffff je 0x1459eff24
1459effb0 4d3974f220 cmp qword ptr [r10 + rsi*8 + 0x20], r14
1459effb5 0f84e5feffff je 0x1459efea0
1459effbb 4183fb28 cmp r11d, 0x28
1459effbf 0f845fffffff je 0x1459eff24
1459effc5 4d3974f228 cmp qword ptr [r10 + rsi*8 + 0x28], r14
1459effca 0f84d0feffff je 0x1459efea0
1459effd0 4183fb30 cmp r11d, 0x30
1459effd4 0f844affffff je 0x1459eff24
1459effda 4d3974f230 cmp qword ptr [r10 + rsi*8 + 0x30], r14
1459effdf 0f84bbfeffff je 0x1459efea0
1459effe5 4183fb38 cmp r11d, 0x38
1459effe9 0f8435ffffff je 0x1459eff24
1459effef e9acfeffff jmp 0x1459efea0
1459efff4 48890a mov qword ptr [rdx], rcx
1459efff7 31c9 xor ecx, ecx
1459efff9 488908 mov qword ptr [rax], rcx
1459efffc 5b pop rbx
1459efffd 5f pop rdi
1459efffe 5e pop rsi
1459effff 415c pop r12
1459f0001 415e pop r14
1459f0003 415f pop r15
1459f0005 c3 ret
1459f0006 48890a mov qword ptr [rdx], rcx
1459f0009 f30f115808 movss dword ptr [rax + 8], xmm3
1459f000e 4c897010 mov qword ptr [rax + 0x10], r14
1459f0012 b901000000 mov ecx, 1
1459f0017 ebe0 jmp 0x1459efff9
