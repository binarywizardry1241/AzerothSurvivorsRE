000000014265608e: lea rdx, [rdi + 0xb8]
0000000142656095: lea rcx, [rbp + 8]
0000000142656099: call 0x1425c8de0
000000014265609e: nop
000000014265609f: call 0x140002200
00000001426560a4: mov ecx, 0x58
00000001426560a9: mov edx, 8
00000001426560ae: call 0x1400021c0
00000001426560b3: test rax, rax
00000001426560b6: je 0x14265692f
00000001426560bc: mov rcx, qword ptr [rbp + 0x58]
00000001426560c0: mov qword ptr [rax + 0x50], rcx
00000001426560c4: movups xmm0, xmmword ptr [rbp + 0x48]
00000001426560c8: movups xmmword ptr [rax + 0x40], xmm0
00000001426560cc: movups xmm0, xmmword ptr [rbp + 8]
00000001426560d0: movups xmm1, xmmword ptr [rbp + 0x18]
00000001426560d4: movups xmm2, xmmword ptr [rbp + 0x28]
00000001426560d8: movups xmm3, xmmword ptr [rbp + 0x38]
00000001426560dc: movups xmmword ptr [rax + 0x30], xmm3
00000001426560e0: movups xmmword ptr [rax + 0x20], xmm2
00000001426560e4: movups xmmword ptr [rax + 0x10], xmm1
00000001426560e8: movups xmmword ptr [rax], xmm0
00000001426560eb: lea r13, [rip + 0x3c1a3de]
00000001426560f2: mov qword ptr [rsp + 0x20], r13
00000001426560f7: lea rdx, [rip + 0x3c28cd0]
00000001426560fe: lea rcx, [rbp - 0x50]
0000000142656102: mov r8d, 6
0000000142656108: mov r9, rax
000000014265610b: call 0x14261c4d0
0000000142656110: nop
