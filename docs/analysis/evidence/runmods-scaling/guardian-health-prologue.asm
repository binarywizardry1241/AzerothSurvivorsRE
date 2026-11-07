0x14599c1f0: 55 push rbp
0x14599c1f1: 4157 push r15
0x14599c1f3: 4156 push r14
0x14599c1f5: 56 push rsi
0x14599c1f6: 57 push rdi
0x14599c1f7: 53 push rbx
0x14599c1f8: 4881ecc8000000 sub rsp, 0xc8
0x14599c1ff: 488dac2480000000 lea rbp, [rsp + 0x80]
0x14599c207: 440f296530 movaps xmmword ptr [rbp + 0x30], xmm12
0x14599c20c: 440f295d20 movaps xmmword ptr [rbp + 0x20], xmm11
0x14599c211: 440f295510 movaps xmmword ptr [rbp + 0x10], xmm10
0x14599c216: 440f294d00 movaps xmmword ptr [rbp], xmm9
0x14599c21b: 440f2945f0 movaps xmmword ptr [rbp - 0x10], xmm8
0x14599c220: 0f297de0 movaps xmmword ptr [rbp - 0x20], xmm7
0x14599c224: 0f2975d0 movaps xmmword ptr [rbp - 0x30], xmm6
0x14599c228: 48c745c8feffffff mov qword ptr [rbp - 0x38], 0xfffffffffffffffe
