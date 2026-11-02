000000014594069d  488bb248090000           mov rsi, qword ptr [rdx + 0x948]
00000001459406a4  483bb238090000           cmp rsi, qword ptr [rdx + 0x938]
00000001459406ab  7514                     jne 0x1459406c1
00000001459406ad  c6858f01000000           mov byte ptr [rbp + 0x18f], 0
00000001459406b4  488b8db8000000           mov rcx, qword ptr [rbp + 0xb8]
00000001459406bb  e8f07b2b00               call 0x145bf82b0
00000001459406c0  90                       nop
00000001459406c1  488b9538010000           mov rdx, qword ptr [rbp + 0x138]
00000001459406c8  488b8240090000           mov rax, qword ptr [rdx + 0x940]
00000001459406cf  486bce70                 imul rcx, rsi, 0x70
00000001459406d3  48c7040800000000         mov qword ptr [rax + rcx], 0
00000001459406db  48c744080804000000       mov qword ptr [rax + rcx + 8], 4
00000001459406e4  48c744081000000000       mov qword ptr [rax + rcx + 0x10], 0
00000001459406ed  c744081800000000         mov dword ptr [rax + rcx + 0x18], 0
00000001459406f5  f3440f1144081c           movss dword ptr [rax + rcx + 0x1c], xmm8
00000001459406fc  4c8b8590010000           mov r8, qword ptr [rbp + 0x190]
0000000145940703  4c89440828               mov qword ptr [rax + rcx + 0x28], r8
0000000145940708  440fb68580010000         movzx r8d, byte ptr [rbp + 0x180]
0000000145940710  4488440830               mov byte ptr [rax + rcx + 0x30], r8b
0000000145940715  48897c0838               mov qword ptr [rax + rcx + 0x38], rdi
000000014594071a  0f13740840               movlps qword ptr [rax + rcx + 0x40], xmm6
000000014594071f  f30f117c0848             movss dword ptr [rax + rcx + 0x48], xmm7
0000000145940725  0f1374084c               movlps qword ptr [rax + rcx + 0x4c], xmm6
000000014594072a  f30f117c0854             movss dword ptr [rax + rcx + 0x54], xmm7
0000000145940730  0f57c0                   xorps xmm0, xmm0
0000000145940733  f3410f10c1               movss xmm0, xmm9
0000000145940738  0f13440858               movlps qword ptr [rax + rcx + 0x58], xmm0
000000014594073d  f3440f114c0860           movss dword ptr [rax + rcx + 0x60], xmm9
0000000145940744  f3440f117c0864           movss dword ptr [rax + rcx + 0x64], xmm15
000000014594074b  f3440f114c0868           movss dword ptr [rax + rcx + 0x68], xmm9
0000000145940752  48ffc6                   inc rsi
0000000145940755  4889b248090000           mov qword ptr [rdx + 0x948], rsi
