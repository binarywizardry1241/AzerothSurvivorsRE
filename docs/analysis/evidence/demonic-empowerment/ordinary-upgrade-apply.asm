1459673e9 4c8d3de8532a01 lea r15, [rip + 0x12a53e8]
1459673f0 f30f1035685e4400 movss xmm6, dword ptr [rip + 0x445e68]
1459673f8 f30f103dc8606000 movss xmm7, dword ptr [rip + 0x6060c8]
145967400 f3440f100577374500 movss xmm8, dword ptr [rip + 0x453777]
145967409 450f57c9 xorps xmm9, xmm9
14596740d f3440f10152ef74400 movss xmm10, dword ptr [rip + 0x44f72e]
145967416 4531ed xor r13d, r13d
145967419 eb51 jmp 0x14596746c
14596741b f30f104f20 movss xmm1, dword ptr [rdi + 0x20]
145967420 f30f58c8 addss xmm1, xmm0
145967424 f30f114f20 movss dword ptr [rdi + 0x20], xmm1
145967429 ff448724 inc dword ptr [rdi + rax*4 + 0x24]
14596742d 4183ee02 sub r14d, 2
145967431 b800000000 mov eax, 0
145967436 440f42f0 cmovb r14d, eax
14596743a 0f57c0 xorps xmm0, xmm0
14596743d f3490f2ac6 cvtsi2ss xmm0, r14
145967442 f30f59c7 mulss xmm0, xmm7
145967446 f30f58c6 addss xmm0, xmm6
14596744a 410f28c8 movaps xmm1, xmm8
14596744e f30f5ec8 divss xmm1, xmm0
145967452 f30f58ce addss xmm1, xmm6
145967456 f30f594f10 mulss xmm1, dword ptr [rdi + 0x10]
14596745b f30f114f10 movss dword ptr [rdi + 0x10], xmm1
145967460 49ffc5 inc r13
145967463 4c39ee cmp rsi, r13
145967466 0f84f9010000 je 0x145967665
14596746c 488b85b8020000 mov rax, qword ptr [rbp + 0x2b8]
145967473 428a1c28 mov bl, byte ptr [rax + r13]
145967477 448b7708 mov r14d, dword ptr [rdi + 8]
14596747b 41ffc6 inc r14d
14596747e 44897708 mov dword ptr [rdi + 8], r14d
145967482 4889f9 mov rcx, rdi
145967485 89da mov edx, ebx
145967487 4d89e0 mov r8, r12
14596748a e891bf0200 call 0x145993420
14596748f 90 nop
145967490 0fb6c3 movzx eax, bl
145967493 49630c87 movsxd rcx, dword ptr [r15 + rax*4]
145967497 4c01f9 add rcx, r15
14596749a ffe1 jmp rcx
14596749c f30f58c6 addss xmm0, xmm6
1459674a0 f30f594710 mulss xmm0, dword ptr [rdi + 0x10]
1459674a5 f30f114710 movss dword ptr [rdi + 0x10], xmm0
1459674aa e97affffff jmp 0x145967429
1459674af f3480f2cc8 cvttss2si rcx, xmm0
1459674b4 410f2ec1 ucomiss xmm0, xmm9
1459674b8 ba00000000 mov edx, 0
1459674bd 0f42ca cmovb ecx, edx
1459674c0 410f2ec2 ucomiss xmm0, xmm10
1459674c4 baffffffff mov edx, 0xffffffff
1459674c9 0f47ca cmova ecx, edx
1459674cc 014f18 add dword ptr [rdi + 0x18], ecx
1459674cf e955ffffff jmp 0x145967429
1459674d4 f30f104f1c movss xmm1, dword ptr [rdi + 0x1c]
1459674d9 f30f58c8 addss xmm1, xmm0
1459674dd f30f114f1c movss dword ptr [rdi + 0x1c], xmm1
1459674e2 e942ffffff jmp 0x145967429
1459674e7 f30f104f14 movss xmm1, dword ptr [rdi + 0x14]
1459674ec f30f5cc8 subss xmm1, xmm0
1459674f0 f30f114f14 movss dword ptr [rdi + 0x14], xmm1
1459674f5 e92fffffff jmp 0x145967429
