1401c3670: 55 push rbp
1401c3671: 56 push rsi
1401c3672: 57 push rdi
1401c3673: 4881ec50040000 sub rsp, 0x450
1401c367a: 488dac2480000000 lea rbp, [rsp + 0x80]
1401c3682: 48c785c8030000feffffff mov qword ptr [rbp + 0x3c8], 0xfffffffffffffffe
1401c368d: 4889d6 mov rsi, rdx
1401c3690: 66c785240300000000 mov word ptr [rbp + 0x324], 0
1401c3699: c6851403000001 mov byte ptr [rbp + 0x314], 1
1401c36a0: 0f57c0 xorps xmm0, xmm0
1401c36a3: 0f298520020000 movaps xmmword ptr [rbp + 0x220], xmm0
1401c36aa: 0f298530020000 movaps xmmword ptr [rbp + 0x230], xmm0
1401c36b1: 0f298540020000 movaps xmmword ptr [rbp + 0x240], xmm0
1401c36b8: 0f298550020000 movaps xmmword ptr [rbp + 0x250], xmm0
1401c36bf: 0f298560020000 movaps xmmword ptr [rbp + 0x260], xmm0
1401c36c6: 48c7857002000000000000 mov qword ptr [rbp + 0x270], 0
1401c36d1: c7853803000000000000 mov dword ptr [rbp + 0x338], 0
1401c36db: 66c7853c0300000000 mov word ptr [rbp + 0x33c], 0
1401c36e4: 0f10056557c205 movups xmm0, xmmword ptr [rip + 0x5c25765]
1401c36eb: 0f118578020000 movups xmmword ptr [rbp + 0x278], xmm0
1401c36f2: 0f10056757c205 movups xmm0, xmmword ptr [rip + 0x5c25767]
1401c36f9: 0f118588020000 movups xmmword ptr [rbp + 0x288], xmm0
1401c3700: 0f10056957c205 movups xmm0, xmmword ptr [rip + 0x5c25769]
1401c3707: 0f118598020000 movups xmmword ptr [rbp + 0x298], xmm0
1401c370e: 0f10056b57c205 movups xmm0, xmmword ptr [rip + 0x5c2576b]
1401c3715: 0f1185a8020000 movups xmmword ptr [rbp + 0x2a8], xmm0
1401c371c: 0f28052d9bbd05 movaps xmm0, xmmword ptr [rip + 0x5bd9b2d]
1401c3723: 0f1185b8020000 movups xmmword ptr [rbp + 0x2b8], xmm0
1401c372a: 0f1185c8020000 movups xmmword ptr [rbp + 0x2c8], xmm0
1401c3731: 0f2805289bbd05 movaps xmm0, xmmword ptr [rip + 0x5bd9b28]
1401c3738: 0f1185d8020000 movups xmmword ptr [rbp + 0x2d8], xmm0
1401c373f: 0f1185e8020000 movups xmmword ptr [rbp + 0x2e8], xmm0
1401c3746: 66c785360300000000 mov word ptr [rbp + 0x336], 0
1401c374f: c7853203000000010003 mov dword ptr [rbp + 0x332], 0x3000100
1401c3759: 48c7851803000000000000 mov qword ptr [rbp + 0x318], 0
1401c3764: c785200300000000803f mov dword ptr [rbp + 0x320], 0x3f800000
1401c376e: 0f2805fb9abd05 movaps xmm0, xmmword ptr [rip + 0x5bd9afb]
1401c3775: 0f1185f8020000 movups xmmword ptr [rbp + 0x2f8], xmm0
1401c377c: c7850803000001000000 mov dword ptr [rbp + 0x308], 1
1401c3786: 48c7850c03000000000000 mov qword ptr [rbp + 0x30c], 0
1401c3791: 0f10050056c205 movups xmm0, xmmword ptr [rip + 0x5c25600]
1401c3798: 0f2985c0010000 movaps xmmword ptr [rbp + 0x1c0], xmm0
1401c379f: 48c785d001000000000000 mov qword ptr [rbp + 0x1d0], 0
1401c37aa: 0f1005ff55c205 movups xmm0, xmmword ptr [rip + 0x5c255ff]
1401c37b1: 0f1185d8010000 movups xmmword ptr [rbp + 0x1d8], xmm0
1401c37b8: 48c785e801000000000000 mov qword ptr [rbp + 0x1e8], 0
1401c37c3: 0f1005fe55c205 movups xmm0, xmmword ptr [rip + 0x5c255fe]
1401c37ca: 0f2985f0010000 movaps xmmword ptr [rbp + 0x1f0], xmm0
1401c37d1: 48c7850002000000000000 mov qword ptr [rbp + 0x200], 0
1401c37dc: 0f1005fd55c205 movups xmm0, xmmword ptr [rip + 0x5c255fd]
1401c37e3: 0f118508020000 movups xmmword ptr [rbp + 0x208], xmm0
1401c37ea: 48c7851802000000000000 mov qword ptr [rbp + 0x218], 0
1401c37f5: 66c7852a0300000000 mov word ptr [rbp + 0x32a], 0
1401c37fe: c7852603000000000100 mov dword ptr [rbp + 0x326], 0x10000
1401c3808: 66c785300300000000 mov word ptr [rbp + 0x330], 0
1401c3811: c7852c03000000000100 mov dword ptr [rbp + 0x32c], 0x10000
1401c381b: 0f1005f656c205 movups xmm0, xmmword ptr [rip + 0x5c256f6]
1401c3822: 0f298560030000 movaps xmmword ptr [rbp + 0x360], xmm0
1401c3829: c785700300000000803f mov dword ptr [rbp + 0x370], 0x3f800000
1401c3833: 0f118574030000 movups xmmword ptr [rbp + 0x374], xmm0
1401c383a: c785840300000000803f mov dword ptr [rbp + 0x384], 0x3f800000
1401c3844: 0f118588030000 movups xmmword ptr [rbp + 0x388], xmm0
1401c384b: c785980300000000803f mov dword ptr [rbp + 0x398], 0x3f800000
1401c3855: 0f11859c030000 movups xmmword ptr [rbp + 0x39c], xmm0
1401c385c: c785ac0300000000803f mov dword ptr [rbp + 0x3ac], 0x3f800000
1401c3866: 0f1005bf56c205 movups xmm0, xmmword ptr [rip + 0x5c256bf]
1401c386d: 0f298540030000 movaps xmmword ptr [rbp + 0x340], xmm0
1401c3874: c785500300009a99193f mov dword ptr [rbp + 0x350], 0x3f19999a
1401c387e: 488d8db0030000 lea rcx, [rbp + 0x3b0]
1401c3885: 488d9540030000 lea rdx, [rbp + 0x340]
1401c388c: e85fa4ab04 call 0x144c7dcf0
1401c3891: 90 nop
1401c3892: 0f2885b0030000 movaps xmm0, xmmword ptr [rbp + 0x3b0]
1401c3899: 0f1145d4 movups xmmword ptr [rbp - 0x2c], xmm0
1401c389d: c745d001000000 mov dword ptr [rbp - 0x30], 1
1401c38a4: c744244800000041 mov dword ptr [rsp + 0x48], 0x41000000
1401c38ac: c744244001000000 mov dword ptr [rsp + 0x40], 1
1401c38b4: c74424380000803f mov dword ptr [rsp + 0x38], 0x3f800000
1401c38bc: c744243001000000 mov dword ptr [rsp + 0x30], 1
1401c38c4: c744242800000000 mov dword ptr [rsp + 0x28], 0
1401c38cc: c744242001000000 mov dword ptr [rsp + 0x20], 1
1401c38d4: 488d8db0030000 lea rcx, [rbp + 0x3b0]
1401c38db: 488d55d0 lea rdx, [rbp - 0x30]
1401c38df: 0f57db xorps xmm3, xmm3
1401c38e2: 41b801000000 mov r8d, 1
1401c38e8: e893624802 call 0x142649b80
1401c38ed: 90 nop
1401c38ee: 488d7dd0 lea rdi, [rbp - 0x30]
1401c38f2: 488d95c0010000 lea rdx, [rbp + 0x1c0]
1401c38f9: 41b880010000 mov r8d, 0x180
1401c38ff: 4889f9 mov rcx, rdi
1401c3902: e8e067a305 call 0x145bfa0e7
1401c3907: 0f288560030000 movaps xmm0, xmmword ptr [rbp + 0x360]
1401c390e: 0f288d70030000 movaps xmm1, xmmword ptr [rbp + 0x370]
1401c3915: 0f289580030000 movaps xmm2, xmmword ptr [rbp + 0x380]
1401c391c: 0f289d90030000 movaps xmm3, xmmword ptr [rbp + 0x390]
1401c3923: 0f118568010000 movups xmmword ptr [rbp + 0x168], xmm0
1401c392a: 0f118d78010000 movups xmmword ptr [rbp + 0x178], xmm1
1401c3931: 0f119588010000 movups xmmword ptr [rbp + 0x188], xmm2
1401c3938: 0f119d98010000 movups xmmword ptr [rbp + 0x198], xmm3
1401c393f: 0f2885a0030000 movaps xmm0, xmmword ptr [rbp + 0x3a0]
1401c3946: 0f1185a8010000 movups xmmword ptr [rbp + 0x1a8], xmm0
1401c394d: 0f1085b0030000 movups xmm0, xmmword ptr [rbp + 0x3b0]
1401c3954: 0f118550010000 movups xmmword ptr [rbp + 0x150], xmm0
1401c395b: 488b85c0030000 mov rax, qword ptr [rbp + 0x3c0]
1401c3962: 48898560010000 mov qword ptr [rbp + 0x160], rax
1401c3969: c785b8010000a0860100 mov dword ptr [rbp + 0x1b8], 0x186a0
1401c3973: 66c785bc0100000000 mov word ptr [rbp + 0x1bc], 0
1401c397c: 4c8d0dbd55c205 lea r9, [rip + 0x5c255bd]
1401c3983: 488d8dc0010000 lea rcx, [rbp + 0x1c0]
1401c398a: 4889f2 mov rdx, rsi
1401c398d: 4989f8 mov r8, rdi
1401c3990: e87b120300 call 0x1401f4c10
1401c3995: 90 nop
1401c3996: 4881c450040000 add rsp, 0x450
1401c399d: 5f pop rdi
1401c399e: 5e pop rsi
1401c399f: 5d pop rbp
1401c39a0: c3 ret
