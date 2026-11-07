0000000145960403  4c8bbed8000000           mov r15, qword ptr [rsi + 0xd8]
000000014596040a  4c3bbec8000000           cmp r15, qword ptr [rsi + 0xc8]
0000000145960411  7511                     jne 0x145960424
0000000145960413  488d8ec8000000           lea rcx, [rsi + 0xc8]
000000014596041a  c6456700                 mov byte ptr [rbp + 0x67], 0
000000014596041e  e86d472c00               call 0x145c24b90
0000000145960423  90                       nop
0000000145960424  488b86d0000000           mov rax, qword ptr [rsi + 0xd0]
000000014596042b  496bcf78                 imul rcx, r15, 0x78
000000014596042f  488b5310                 mov rdx, qword ptr [rbx + 0x10]
0000000145960433  4889540810               mov qword ptr [rax + rcx + 0x10], rdx
0000000145960438  0f1003                   movups xmm0, xmmword ptr [rbx]
000000014596043b  0f110408                 movups xmmword ptr [rax + rcx], xmm0
000000014596043f  48897c0818               mov qword ptr [rax + rcx + 0x18], rdi
0000000145960444  4c89740820               mov qword ptr [rax + rcx + 0x20], r14
0000000145960449  0f57c0                   xorps xmm0, xmm0
000000014596044c  0f11440828               movups xmmword ptr [rax + rcx + 0x28], xmm0
0000000145960451  c744083800000000         mov dword ptr [rax + rcx + 0x38], 0
0000000145960459  660fd67c0840             movq qword ptr [rax + rcx + 0x40], xmm7
000000014596045f  66440f7e440848           movd dword ptr [rax + rcx + 0x48], xmm8
0000000145960466  660fd67c084c             movq qword ptr [rax + rcx + 0x4c], xmm7
000000014596046c  66440f7e440854           movd dword ptr [rax + rcx + 0x54], xmm8
0000000145960473  0f280516937000           movaps xmm0, xmmword ptr [rip + 0x709316]
000000014596047a  f3410f10c1               movss xmm0, xmm9
000000014596047f  0fc6c004                 shufps xmm0, xmm0, 4
0000000145960483  0f580526f28801           addps xmm0, xmmword ptr [rip + 0x188f226]
000000014596048a  0f11440858               movups xmmword ptr [rax + rcx + 0x58], xmm0
000000014596048f  f30f11740868             movss dword ptr [rax + rcx + 0x68], xmm6
0000000145960495  48c744086c0000803f       mov qword ptr [rax + rcx + 0x6c], 0x3f800000
000000014596049e  c744087400000000         mov dword ptr [rax + rcx + 0x74], 0
00000001459604a6  49ffc7                   inc r15
00000001459604a9  4c89bed8000000           mov qword ptr [rsi + 0xd8], r15
