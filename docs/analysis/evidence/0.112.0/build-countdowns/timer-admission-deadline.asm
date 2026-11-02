1458f5400 41803f22 cmp byte ptr [r15], 0x22
1458f5404 75ea jne 0x1458f53f0
1458f5406 4d39d4 cmp r12, r10
1458f5409 7375 jae 0x1458f5480
1458f540b 4c89e1 mov rcx, r12
1458f540e 48c1e106 shl rcx, 6
1458f5412 803c0b22 cmp byte ptr [rbx + rcx], 0x22
1458f5416 7568 jne 0x1458f5480
1458f5418 b001 mov al, 1
1458f541a 4c3b65b8 cmp r12, qword ptr [rbp - 0x48]
1458f541e 0f83cc010000 jae 0x1458f55f0
1458f5424 4c8b4d00 mov r9, qword ptr [rbp]
1458f5428 43833ca100 cmp dword ptr [r9 + r12*4], 0
1458f542d 0f84bd010000 je 0x1458f55f0
1458f5433 0f57c0 xorps xmm0, xmm0
1458f5436 4c3b6508 cmp r12, qword ptr [rbp + 8]
1458f543a 730a jae 0x1458f5446
1458f543c 4c8b4d10 mov r9, qword ptr [rbp + 0x10]
1458f5440 f3430f1004a1 movss xmm0, dword ptr [r9 + r12*4]
1458f5446 4801d9 add rcx, rbx
1458f5449 f30f104908 movss xmm1, dword ptr [rcx + 8]
1458f544e f30f59cf mulss xmm1, xmm7
1458f5452 0f28d1 movaps xmm2, xmm1
1458f5455 f30f5f510c maxss xmm2, dword ptr [rcx + 0xc]
1458f545a 440f28d2 movaps xmm10, xmm2
1458f545e f3440fc2d203 cmpunordss xmm10, xmm2
1458f5464 410f54ca andps xmm1, xmm10
1458f5468 440f55d2 andnps xmm10, xmm2
1458f546c 440f56d1 orps xmm10, xmm1
1458f5470 f3440f58d0 addss xmm10, xmm0
1458f5475 4d39dc cmp r12, r11
1458f5478 0f8372ffffff jae 0x1458f53f0
1458f547e eb0b jmp 0x1458f548b
1458f5480 31c0 xor eax, eax
1458f5482 4d39dc cmp r12, r11
1458f5485 0f8365ffffff jae 0x1458f53f0
1458f548b 84c0 test al, al
1458f548d 0f845dffffff je 0x1458f53f0
