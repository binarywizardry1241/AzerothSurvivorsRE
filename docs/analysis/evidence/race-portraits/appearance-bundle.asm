00000001402cc279 call 0x145cf998b
00000001402cc27e movaps xmm0, xmmword ptr [rbp + 0x3b0]
00000001402cc285 movaps xmm1, xmmword ptr [rbp + 0x3c0]
00000001402cc28c movaps xmm2, xmmword ptr [rbp + 0x3d0]
00000001402cc293 movaps xmm3, xmmword ptr [rbp + 0x3e0]
00000001402cc29a movups xmmword ptr [rsi + 0x220], xmm0
00000001402cc2a1 movups xmmword ptr [rsi + 0x230], xmm1
00000001402cc2a8 movups xmmword ptr [rsi + 0x240], xmm2
00000001402cc2af movups xmmword ptr [rsi + 0x250], xmm3
00000001402cc2b6 movaps xmm0, xmmword ptr [rbp + 0x3f0]
00000001402cc2bd movups xmmword ptr [rsi + 0x260], xmm0
00000001402cc2c4 movups xmm0, xmmword ptr [rip + 0x5c319fd]
00000001402cc2cb movups xmmword ptr [rsi + 0x270], xmm0
00000001402cc2d2 mov dword ptr [rsi + 0x280], 0x3f800000
00000001402cc2dc mov r8d, 0x88
00000001402cc2e2 lea rcx, [rbp + 0x168]
00000001402cc2e9 mov rdx, r12
00000001402cc2ec call 0x145cf998b
00000001402cc2f1 movups xmm0, xmmword ptr [rbp + 0x460]
00000001402cc2f8 movups xmmword ptr [rsi + 0x180], xmm0
00000001402cc2ff mov rax, qword ptr [rbp + 0x470]
00000001402cc306 mov qword ptr [rsi + 0x190], rax
00000001402cc30d mov r8d, 0x284
00000001402cc313 lea rcx, [rbp + 0x568]
00000001402cc31a mov rdx, rsi
00000001402cc31d call 0x145cf998b
00000001402cc322 cmp r14b, dil
00000001402cc325 sete byte ptr [rbp + 0x7ec]
00000001402cc32c mov byte ptr [rbp + 0x7ed], dil
00000001402cc333 mov byte ptr [rbp + 0x7ee], 2
