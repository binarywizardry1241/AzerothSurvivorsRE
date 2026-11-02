1459670f3: 4c8bbed8000000           mov r15, qword ptr [rsi + 0xd8]
1459670fa: 4c3bbec8000000           cmp r15, qword ptr [rsi + 0xc8]
145967101: 7511                     jne 0x145967114
145967103: 488d8ec8000000           lea rcx, [rsi + 0xc8]
14596710a: c6456700                 mov byte ptr [rbp + 0x67], 0
14596710e: e8edf42b00               call 0x145c26600
145967113: 90                       nop
145967114: 488b86d0000000           mov rax, qword ptr [rsi + 0xd0]
14596711b: 496bcf78                 imul rcx, r15, 0x78
14596711f: 488b5310                 mov rdx, qword ptr [rbx + 0x10]
145967123: 4889540810               mov qword ptr [rax + rcx + 0x10], rdx
145967128: 0f1003                   movups xmm0, xmmword ptr [rbx]
14596712b: 0f110408                 movups xmmword ptr [rax + rcx], xmm0
14596712f: 48897c0818               mov qword ptr [rax + rcx + 0x18], rdi
145967134: 4c89740820               mov qword ptr [rax + rcx + 0x20], r14
145967139: 0f57c0                   xorps xmm0, xmm0
14596713c: 0f11440828               movups xmmword ptr [rax + rcx + 0x28], xmm0
145967141: c744083800000000         mov dword ptr [rax + rcx + 0x38], 0
145967149: 660fd67c0840             movq qword ptr [rax + rcx + 0x40], xmm7
14596714f: 66440f7e440848           movd dword ptr [rax + rcx + 0x48], xmm8
145967156: 660fd67c084c             movq qword ptr [rax + rcx + 0x4c], xmm7
14596715c: 66440f7e440854           movd dword ptr [rax + rcx + 0x54], xmm8
145967163: 0f2805968d7000           movaps xmm0, xmmword ptr [rip + 0x708d96]
14596716a: f3410f10c1               movss xmm0, xmm9
14596716f: 0fc6c004                 shufps xmm0, xmm0, 4
145967173: 0f580546288c01           addps xmm0, xmmword ptr [rip + 0x18c2846]
14596717a: 0f11440858               movups xmmword ptr [rax + rcx + 0x58], xmm0
14596717f: f30f11740868             movss dword ptr [rax + rcx + 0x68], xmm6
145967185: 48c744086c0000803f       mov qword ptr [rax + rcx + 0x6c], 0x3f800000
14596718e: c744087400000000         mov dword ptr [rax + rcx + 0x74], 0
145967196: 49ffc7                   inc r15
145967199: 4c89bed8000000           mov qword ptr [rsi + 0xd8], r15
